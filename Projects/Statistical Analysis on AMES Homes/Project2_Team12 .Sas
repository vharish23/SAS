libname Project2 '/folders/myfolders/Project2';

/*Part 1 - Problem 1*/
%Let categorical=House_Style Overall_Qual Overall_Cond Heating_QC Central_Air Bedroom_AbvGr Fireplaces Mo_Sold Full_Bathroom Half_Bathroom Total_Bathroom Season_Sold Garage_Type_2 Foundation_2 Masonry_Veneer Lot_Shape_2 House_Style2 Overall_Qual2 Overall_Cond2 Bonus;
%Let interval=Lot_Area Gr_Liv_Area Garage_Area SalePrice Basement_Area Deck_Porch_Area Age_Sold Log_Price;

/*Part 1 - Problem 2*/
proc univariate data=Project2.team12 plot;
var &interval;
run;

proc freq data=Project2.team12;
tables &categorical/plots=freqplot(type=BARCHART);
run;

/*Part 1 - Problem 3*/
ods graphics on;
   
proc ttest data=Project2.team12 h0=135000 plots(showh0) sides=2 alpha=0.05;
  var SalePrice;
run;
   
ods graphics off;

/*Part 1 - Problem 4*/
ods graphics on;
   
proc ttest data=Project2.team12 h0=135000 plots(showh0) sides=2 alpha=0.05;
  class Masonry_Veneer; 
  var SalePrice;
run;
   
ods graphics off;
%Let interval_pred=Lot_Area Gr_Liv_Area Garage_Area Basement_Area Deck_Porch_Area Age_Sold Log_Price;
/*Part 1 - Problem 5*/
proc corr data= Project2.team12 rank
plots(only)=scatter(nvar=all ellipse=none);
var &interval_pred;
with SalePrice;
id PID;
title "Correlations and Scatter Plots";

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=House_Style
                    connect=mean;
   title "Sale Price Differences across House_Style";
run;

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Overall_Qual
                    connect=mean;
   title "Sale Price Differences across Overall_Qual";
run;


proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Overall_Cond
                    connect=mean;
   title "Sale Price Differences across Overall_Cond";
run;

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Heating_QC
                    connect=mean;
   title "Sale Price Differences across Heating_QC";
run;

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Central_Air
                    connect=mean;
   title "Sale Price Differences across Central_Air";
run;

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Bedroom_AbvGr
                    connect=mean;
   title "Sale Price Differences across Bedroom_AbvGr";
run;


proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Fireplaces
                    connect=mean;
   title "Sale Price Differences across Fireplaces";
run;

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Mo_Sold
                    connect=mean;
   title "Sale Price Differences across Mo_Sold";
run;

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Full_Bathroom
                    connect=mean;
   title "Sale Price Differences across Full_Bathroom";
run;

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Half_Bathroom
                    connect=mean;
   title "Sale Price Differences across Half_Bathroom";
run;


proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Total_Bathroom
                    connect=mean;
   title "Sale Price Differences across Total_Bathroom";
run;

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Season_Sold
                    connect=mean;
   title "Sale Price Differences across Season_Sold";
run;

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Garage_Type_2
                    connect=mean;
   title "Sale Price Differences across Garage_Type_2";
run;

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Foundation_2
                    connect=mean;
   title "Sale Price Differences across Foundation_2";
run;


proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Masonry_Veneer
                    connect=mean;
   title "Sale Price Differences across Masonry_Veneer";
run;

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Lot_Shape_2
                    connect=mean;
   title "Sale Price Differences across Lot_Shape_2";
run;

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=House_Style2
                    connect=mean;
   title "Sale Price Differences across House_Style2";
run;

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Overall_Qual2
                    connect=mean;
   title "Sale Price Differences across Overall_Qual2";
run;


proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Overall_Cond2
                    connect=mean;
   title "Sale Price Differences across Overall_Cond2";
run;

proc sgplot data=Project2.team12;
   vbox SalePrice/ category=Bonus
                    connect=mean;
   title "Sale Price Differences across Bonus";
run;



proc boxplot data=Project2.team12;
plot SalePrice*Mo_Sold;
run;


ods graphics on;
 

proc sort data=Project2.team12 out=Project2.team12;
	by SalePrice;
run; 

proc boxplot data=Project2.team12;
      plot SalePrice * &categorical ;
run;

ods graphics off;

/*Part 1 - Problem 6*/
ods graphics on;

proc glm data=Project2.team12 plot=diagnostics;
   class Heating_QC;
   model SalePrice = Heating_QC;
   means Heating_QC / alpha=0.05 hovtest;
run;

ods graphics off;

/*Part 1 - Problem 7*/
ods graphics on;

proc glm data=Project2.team12 plot=diagnostics;
   class Heating_QC;
   model SalePrice = Heating_QC;
   lsmeans Heating_QC;
run;

ods graphics off;

/*Part 1 - Problem 8*/
ods graphics on;

title "Relationships between SalePrice and the continuous predictor variables in the data set";
proc corr data=Project2.team12 plots=scatter;
   var &interval_pred;
   with SalePrice;
 run;
title;

ods graphics off;

ods graphics on;

title "Relationships between SalePrice and the continuous predictor variables in the data set";
proc corr data=Project2.team12 plots=scatter;
   var Log_Price;
   with SalePrice;
 run;
title;

ods graphics off;

ods graphics on;

title "Relationships between SalePrice and the continuous predictor variables in the data set";
proc corr data=Project2.team12 plots=scatter;
   var Age_Sold;
   with SalePrice;
 run;
title;

ods graphics off;

/*Part 1 - Problem 9*/
ods graphics on;

PROC REG DATA=Project2.team12 plots=ResidualByPredicted;    
MODEL SalePrice=Lot_Area Year_Built Gr_Liv_Area Garage_Area Mo_Sold Yr_Sold Basement_Area Deck_Porch_Area Age_Sold Log_Price;
title "Simple linear regression analysis with SalePrice as the response variable";
RUN;
QUIT;
title;

ods graphics off;

/*Part 1 - Problem 10*/

proc glm data=Project2.team12;
class Heating_QC Season_Sold;
model SalePrice=Heating_QC|Season_Sold;
means Heating_QC|Season_Sold;
title "Two-Way analysis of variance to test for Heating_QC and Season_Sold";
run;
quit;
title;

/*Part 1 - Problem 11*/

proc glm data=Project2.team12;
   class Heating_QC Season_Sold;
   model SalePrice = Heating_QC Season_Sold Heating_QC*Season_Sold / solution;
   store Project2.BlockAnalysis / label='PLM: Getting Started';
run;

proc plm restore=Project2.BlockAnalysis plots=all;
   slice Heating_QC*Season_Sold/ sliceby=Heating_QC adjust=tukey;
   effectplot interaction(sliceby= Heating_QC) / clm;
run;


/*Part 1 - Problem 12*/

ods graphics on;

PROC REG DATA=Project2.team12 plots=ResidualByPredicted;    
MODEL SalePrice=Lot_Area Basement_Area /selection=forward slentry=0.05 ;;
title "Regression Equation to predict SalePrice";
RUN;
QUIT;
title;

ods graphics off;