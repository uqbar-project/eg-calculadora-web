<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css" />

<!-- jQWidgets framework -->
<link rel="stylesheet" href="jqwidgets/styles/jqx.energyblue.css"
	type="text/css" />
<link rel="stylesheet" href="jqwidgets/styles/jqx.base.css"
	type="text/css" />
<link rel="stylesheet" href="jqwidgets/styles/jqx.darkblue.css"
	type="text/css" />
<script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="scripts/gettheme.js"></script>
<script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
<script type="text/javascript" src="jqwidgets/jqxnumberinput.js"></script>
<script type="text/javascript" src="jqwidgets/jqxnumberinput.js"></script>
<script type="text/javascript" src="jqwidgets/jqxchart.js"></script>
<script type="text/javascript" src="jqwidgets/jqxgauge.js"></script>

<style type="text/css">
#gaugeValue {
	background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #fafafa),
		color-stop(100%, #f3f3f3));
	background-image: -webkit-linear-gradient(#fafafa, #f3f3f3);
	background-image: -moz-linear-gradient(#fafafa, #f3f3f3);
	background-image: -o-linear-gradient(#fafafa, #f3f3f3);
	background-image: -ms-linear-gradient(#fafafa, #f3f3f3);
	background-image: linear-gradient(#fafafa, #f3f3f3);
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-ms-border-radius: 3px;
	-o-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: 0 0 50px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0 0 50px rgba(0, 0, 0, 0.2);
	box-shadow: 0 0 50px rgba(0, 0, 0, 0.2);
	padding: 10px;
}
</style>

<title>Calculadora con chiches</title>
</head>
<body>
	<h2>Calculadora</h2>
	<div style='width: 150px;' id='jqxWidget'>
		<div style='margin-top: 3px;' id='num1'></div>
		<br>
		<div style='margin-top: 3px;' id='num2'></div>
		<br> <input type="button" value="Sumar" id='sumar' /> <br>
		<br>
		<div style="margin-left: 60px; float: left;" id="resultado"></div>
		<br>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		configurarInputNumerico('num1');
		configurarInputNumerico('num2');
		configurarBoton('sumar');
		configurarGauge('resultado');
	});

	function configurarInputNumerico(control) {
		var theme = getDemoTheme();
		$('#' + control).jqxNumberInput({
			width : '250px',
			height : '25px',
			symbol : "",
			theme : theme,
			decimal : 0,
			decimalDigits : 0,
			min : 0,
			spinButtons : true,
			symbolPosition : 'right',
			digits : 10
		});
	}

	function configurarBoton(control) {
		var theme = getDemoTheme();
		$("#" + control).jqxButton({
			width : '150',
			theme : theme
		});
		$("#" + control).on('click', function() {
			window[control]();
		});
	}

	function sumar() {
		var res = $('#num1').jqxNumberInput('getDecimal')
				+ $('#num2').jqxNumberInput('getDecimal');
		$("#resultado").jqxLinearGauge('value', res);
	}

	function configurarGauge(control) {
		$('#' + control).jqxLinearGauge({
			orientation : 'vertical',
			width : 120,
			height : 350,
			ticksMajor : {
				size : '10%',
				interval : 10
			},
			ticksMinor : {
				size : '5%',
				interval : 2.5,
				style : {
					'stroke-width' : 1,
					stroke : '#aaaaaa'
				}
			},
			max : 60,
			pointer : {
				size : '5%'
			},
			colorScheme : 'scheme05',
			labels : {
				interval : 20,
				formatValue : function(value, position) {
					return value;
				}
			},
			ranges : [ {
				startValue : -100,
				endValue : 10,
				style : {
					fill : '#FFF157',
					stroke : '#FFF157'
				}
			}, {
				startValue : 10,
				endValue : 40,
				style : {
					fill : '#FFA200',
					stroke : '#FFA200'
				}
			}, {
				startValue : 40,
				endValue : 10000,
				style : {
					fill : '#FF4800',
					stroke : '#FF4800'
				}
			} ],
			animationDuration : 1500
		});
	}
</script>
</html>
