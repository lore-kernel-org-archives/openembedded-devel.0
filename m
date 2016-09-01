Return-Path: <mubin.usman.sayyed@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0088.outbound.protection.outlook.com [104.47.40.88])
	by mail.openembedded.org (Postfix) with ESMTP id D234A77041
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 17:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Rs/HgJ793NZSajscbKX4vxsrL1mXdKsqkvdXt94dde8=;
	b=4s5cL3uTtrwMu9ycgc9ychf8+kQ1rOAN1meyISdT2+yGXb9FJkapWs4P2473YiULzK+iMV5TGiRqJLgZRsrVMNrZo0upCFG+j6jUXPh7sDBuHPcMMQaYCBhsfIB11+m42aca73Soi0nDpevb1mhajmjuhb884xfzwohkKGrhQIQ=
Received: from BY2PR02CA0022.namprd02.prod.outlook.com (10.141.216.12) by
	BLUPR0201MB1490.namprd02.prod.outlook.com (10.163.119.156) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384)
	id 15.1.587.9; Thu, 1 Sep 2016 15:50:56 +0000
Received: from SN1NAM02FT013.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::205) by BY2PR02CA0022.outlook.office365.com
	(2a01:111:e400:2c40::12) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.609.9 via
	Frontend Transport; Thu, 1 Sep 2016 15:50:56 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT013.mail.protection.outlook.com (10.152.72.98) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.587.6
	via Frontend Transport; Thu, 1 Sep 2016 15:50:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>)
	id 1bfUGR-0006Ug-Gj; Thu, 01 Sep 2016 08:50:51 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>)
	id 1bfUGT-00031p-Ex; Thu, 01 Sep 2016 08:50:53 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u81Foq8l006009; Thu, 1 Sep 2016 08:50:53 -0700
Received: from [172.22.159.25] (helo=XAP-PVEXCAS01.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <MUBINUSM@xilinx.com>)
	id 1bfUGS-00031Y-Iv; Thu, 01 Sep 2016 08:50:52 -0700
Received: from XAP-PVEXMBX01.xlnx.xilinx.com ([fe80::4c50:cc5:695a:c7f8]) by
	XAP-PVEXCAS01.xlnx.xilinx.com ([::1]) with mapi id 14.03.0248.002;
	Thu, 1 Sep 2016 23:50:51 +0800
From: Mubin Usman Sayyed <mubin.usman.sayyed@xilinx.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe]  [meta-oe] [PATCH 0/3]  Added cpu benchmarks
Thread-Index: AQHSA6fba0xXEaJ4QkmOFzKsrOkTu6BkyUcg
Date: Thu, 1 Sep 2016 15:50:51 +0000
Message-ID: <366532EA46EE364DB88242E771105CB59D34A8@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1471957341-26005-1-git-send-email-mubinusm@xilinx.com>
	<20160831165038.3gjnyiiquu64qacr@jama>
In-Reply-To: <20160831165038.3gjnyiiquu64qacr@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.230.203]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22548.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(13464003)(24454002)(189002)(377454003)(199003)(7846002)(5660300001)(86362001)(356003)(5001770100001)(107886002)(47776003)(4001430100002)(55846006)(19580405001)(19580395003)(4326007)(2900100001)(15975445007)(2950100001)(2920100001)(97756001)(92566002)(46406003)(102836003)(6116002)(3846002)(23726003)(11100500001)(106116001)(8746002)(2906002)(87936001)(106466001)(586003)(8676002)(50986999)(33656002)(5250100002)(54356999)(76176999)(2501003)(8936002)(50466002)(81156014)(81166006)(305945005)(189998001)(7696003)(7736002)(626004)(5890100001)(63266004)(1720100001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR0201MB1490;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT013;
	1:eKs33/HBwKbg5lxXtelkiQwXSEow43FV3L5C6KPtV1LPsP3itrFYZ84K0jPcMycqk81yffadIHhsMfOhA5fMdwTSqkl1VIF9R9uJ4uz6zvjBDDxFNsIjUyNEQQHvJOQg9Ra5f2JKBfn4t/kccMG3FNOejBiYQBKs9oyCzmdvBaNetc0FDSXTK6qE3BQiDUBXiRQSpXUw7vk+0aTV3UVxFXDEtQ5ukWAWWpD4C2GE6ngt49yIMaDkVCA9hbdfqS4vHYroeCFCRYrEYZ2gq3wP28YLYZtcepY/2QeW4rfMsW4r8U0K/K8ic62dsCMxrRxZOBnwBQg6J0QsvNLzYhpf729ZpImuEdU2jGOE8L69T/VxVUfG2T5Ha8BSWMSqh9ER0BWOrAyTZjsaaMWy5B5hXcwzalRCfPixA9LoSVlLBKF3I2x2xpYF8eeQToCj7Jhmyt19gXepnWO+BfDzPLHrNIhOoeRt5QjG7HB+K5e4cH+1sIuOBEm3xJLlFHM8n6RKKZUpTW4UmcdsrQiYt8OlbUl5cFG6yU045jsickJAA/O9cbvezeY8YEK97qlelJqOUhBQyh21VnwYB1cz6jppv2tbXQeU6duK35P7oHnxTr8=
X-MS-Office365-Filtering-Correlation-Id: 71d738e5-2937-4daf-4cf5-08d3d27fc279
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1490;
	2:I60ukP5HwYqD17XFDWLQfMWaTvZMmQ37XhdzJ+qU157tt+Ms3zbaxrpjqeQpLjnkpESZ+GoAfp2KT9pcQneqnMSHGsEixOs1JxwEeXW7BFCZOGMmq4uPc/+pZK/vNAoF1oBzK6/1QO4OcvRmcRV2oY9wRkEW1POxyfdgV/XahJvFHNUAuNuA0bp6QjhEmYog;
	3:bdDmumsAzv2IqOeMLWRCJUiiGreeq97eas3DxmNiuQ8pKqkcaPG+CJfgeOYsUCloH3kWQhSMI7oYhFiO5ex9oIA1NRp3rjOTg32UJ2fvDHpLpJjrkqVWJNaar11sPddsWdjw1dHAh/qKL6T0lAsnL+qAIY8MSfw4zLRlOa0C0vMkPyrooRtwWsSFlGH/OZaosQP0mlIqphz29c74RdL1v/VOArLreXDHf/3flA1RoEFlVThaGtYueRzEi2johA3NZl2pspcQLdsBc5ZNj7797w==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BLUPR0201MB1490; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1490;
	25:wKpHfzdZXacCbVw2dmzBpgg3vVA2dstXbytFje/6ryytKfBRo3LvzwEKl62wz3KZmtVLVnhI3jPAuWgTW5jDKRCHPSur5rw7KJvO3g3OzyLKSTAFsQqc0vWaKPUjs1SEFq5SKXLxkKJQlaU8b+FtaBWZMCnLemGFuEonoWz9zosxz+dhc13YNPpIt0pJbymxJHfKr69ANyhRcGDK8coxpTJ36SfkGaSqznWVT8UKg7D9KXGSphkWbNx/goGBNtfgaFN4NHtiibFlFjpclZgZ1j1FB/f3E3YHHZc5oXpHvuT2S43auZAftG8oFuv+pkzP/86Gt8G9buAdDyX8UihMHflrwTwzT0V0HisdymwmJXeh4YfqLQJL6yKL5EX762irhqJctO8pqzhABu+gVGGYvGStYOfsmrP0bzzMfkYfaFDr9GIYaAtpAXFB9PWdsQwJSSFOoyLt5x3OSMry4mZnpMKUI+GOoqR+beG6RBzpMZMrh5pGPxeYXeegYfZwvW3Z1ulnnxICZzHkIbJumENVO7ecYBCka7PgE60k2r2u2H4hVRPwczyBkOgEFHlOBntTFZBVM87nPocN9jCfAGy6DVJj8gIRDihly9PpdQfzmFsRxHAoQNEk3hg8+4gR+wR9N2JPUI4I8FIlPBPIa3d9Ez0GbJTocBse2KoKpPRlUENgoEJZKy9yThhu7bpxqHo1mnkeFuZzCM4/UE4HDHA8JhV+dAoALuDLZrPpXYvHs9EXuVLLRIh4k31NNZPHcgHJvAuIethZduLsT9nON+xWobWvBsfC4zTHhbyEeuXb93oot28SDPEr/bxHv0c+ILi1OwLvspRjS6ucFK3ala1JVsVHMipH5tLUhxP3TmQep2kf8fMKghuZ3nV/Ik9ze3bk
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1490;
	31:cxM/6mt6yV5joS8DbFHFjwWe7DGf9jkvUMXtSfdK894YGGVEqQCrgLQxNYI+Xz2H9lJz6Lo1G7erN/RyjaCmb8LywxfryxC77+W4B1g3vKugOKasA+uvLiS0ALTD4OnAAJE6jRkuU/xlxVYEDFs4onGpnfOeyVLjW5SmkFg1V4J5Tw9kUPaVmokNjCx/u2pIY5N+Lggwo4rM27sLQ9++WBMYVOBHD99leyDKjvHEYc0=;
	20:6omEV+ft4ZsnlfpvBaxAzTsNeI8aIkjM8oYIQ2ujja1SEBHKgn4SSyze9EJORxlilhQkiSUg3XPe2+lgGiXEStPrKvrZ4kuz7gXrwOkZwK5UwmvhJF9zBHG3bdYeqoL0epNIgBThSIBfWwt1CAfcw2GubNGMKPEenO08BopV7J3VJQODAO6gghbtsXkXB+OSE8qL1sCm69jKc/snALy94XNaMp2F0tv6aOPoic0FKNlYVHmoLAcMWAzqYToSF2Fqb+dBWqsXHc4uadZVSE2+swPduHWDJ+sp7r7zekqjjLe9WMK6I7igi3OF8erO8VWF+EjFDdOmjkWixXN6Il6mZAGYm7dWocWqtb53lUfEHaVdRfmPaXCyi9tbVyAHO19UwUH5TYj3M4yFhHwy1yuTH03Z3h5afC7NwsB4ahpl/CNS9tH82Esf2OTjcVTB1F/RtK2JvQElD2luabk3KethNrxo3ltQ/wfRZ3cTDwAmu/eFrXSZbKhetCTbWvgke0rQ
X-Microsoft-Antispam-PRVS: <BLUPR0201MB1490B65F085C0248F2D5F688BDE20@BLUPR0201MB1490.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(13015025)(13017025)(13024025)(13023025)(13018025)(10201501046)(3002001)(6055026);
	SRVR:BLUPR0201MB1490; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0201MB1490; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1490;
	4:x2qxqF5ux/49YyGFMYqktAW0sN+LrGTUPxi6nkRHQbxm6LOzkcJx1lzMaQIKK53jQYjCigv/ZFQeJ8Rwmz0t5QsOnb5bZMP68mnIMtRy7oO/kHrLZHHVcw86OGuOyvGWBFatKODBz4IJ62cvz+ItVvnrtF4NWSD+V1KYd2vybi+8/xHbBMwQTmqQg9sICbN4QAXDnYlMnRAd+K2FJFWkspIccY+1yBNbZWP3pJhplU5vv9iyYKY/zozi0OFhLq3Dpti7PwQ99uRxmMfe2Kl9CcPSs43RWk+OSUf9BYbZOz2OKK8vlTuOazx/jXO5ErocS9sAjshqzrsI0+C4ALoee2TI9Z2H4hmwgnnUrWyAog5mkN2/cI/r2Qrcvj9A4nJmvPCpqn3gCZOEAMKzRPiGxDjyKS9MZutNmQiZ/q/9MivsIwS0e1Y0ghb3oa97X+AKXOIVn3aBnkEzSNoMJxjbgLX086WdFLNx0NtzD/f0/zsXIL80WTQGzw5aPNYMFGYGD8IO6tifM24zajE/xwJL2dhwnkt4Tcy6xAXVwC35+elDLZDu2Ce2+eGe1wyzYcVoPZa3JI3M+fNDSAIozoWYXw==
X-Forefront-PRVS: 0052308DC6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0201MB1490;
	23:5hH4kJzjA7l9IUYoejhWQQ8AhBa7VpZLX4Turyy?=
	=?us-ascii?Q?pSZopNz1LZe6WbRO+YJUecWJd6EzZiaKh+2BT83vC12NwIyeMNwa5bbpl49l?=
	=?us-ascii?Q?MwhZs/wc9lwW16aBKbSFg/1/l5R3dZ2I0c/oZ+cdoRV6tWNfXTgAJBsWKIiT?=
	=?us-ascii?Q?qWrKPtJigXwlhISU5DkgnTeMwe5XWeUB3biHhFC3KaFtI3sybFYNshyFs6Ed?=
	=?us-ascii?Q?CB7juSYuV2XbHkokc7FR72Qst1lszPO0LTfvsW/HdE0thajumofqe/QH7LaN?=
	=?us-ascii?Q?Ns/kx1Yq1yH24G0UelyEjOlC7AaOLawOfMsGLgc+unMU4nlFOW4+cvaV3H0s?=
	=?us-ascii?Q?fU3q7Xx/kNOuid6rcQKW/PP91XQv4iPgTMaoGPcxkaqUyl0PGqUiBZBGudiO?=
	=?us-ascii?Q?xTDzAoRdLaQJWbblCtNfYsLk21cFAUiA8NMe+ZVnG4Q+85+XckJFGPukX1zk?=
	=?us-ascii?Q?3t0P3bsixf1yuuJ9YnB3AIETz5iTLbmIkGMTKQ72F/cA6noHDIc11ZDMfVDa?=
	=?us-ascii?Q?fH7G6+1JEloFz0FaJ8NK5RFmc0cu8GOrEYMZKA6mI5szI855kbgj1htRCRc+?=
	=?us-ascii?Q?bC8Gw26eI/FpIhDePZd/bwQSJ0psXXbfEq0AaNmsegH6+6jeYpwPurKHkuJU?=
	=?us-ascii?Q?i2lcoewpMJd69y2f61aGZkSpYaiXWTzDY3g54dFwnYjyWzV75tsA+vAmSXiI?=
	=?us-ascii?Q?uS7nZzG93mLH124pi937QBn10/Q8wsCbA5OoB0QwbbkpKivKkYJMHy6SX31N?=
	=?us-ascii?Q?qKqORRJmPfI3I2ZDwtvUwc9H6T7/PFhEZBW8w7ae9T8o0lMeQ+Ut2Tmjm9Ne?=
	=?us-ascii?Q?3PFJJAa11BWox+aAM3KYNg/HcxMAf3Lf0Yyk0e0NOQoNhrIpFpLVkTwT255p?=
	=?us-ascii?Q?KWxdF/jnrHkQygWy+y8imbsrpUzHol/KImA4ca6KiXBc2o4J26cRo70GuLkB?=
	=?us-ascii?Q?r/ECh+sgznhAHxF9+crbRnVXvNDi71nNYnlC7KM+Ey+jd7KXxjOJ4PeZmzzB?=
	=?us-ascii?Q?ZWYGZHd9o4hzTP4JOOEQ0IDecljl0t4zfid0CyA0aeUNWeMvMHKzG0iKgYy5?=
	=?us-ascii?Q?0IYDf7jejPiZazajEa8OtDwPpuwWauGXOFfUvbMhY64zmF6i5BHN2dt27Rd1?=
	=?us-ascii?Q?h5qr8h/yDvpDlRw9UE7TShrAL437c4SKZmWai/YdYGnYCtteB+LPxY+V5zO0?=
	=?us-ascii?Q?HVCitIMLcSZadNhNCUaMFNRcewRjpTFInq/YYJ4CSb3SQ6hdkpl7db2M9zlG?=
	=?us-ascii?Q?0sq5GGTe0kOpyeDeUrDwNBRl37PfvGP1dY+PzUhkKGZtA3Il/S1L56CKKD9Y?=
	=?us-ascii?Q?jdG+cEzB77DfNwYupMprw5mGyVectnrGDlnfRvEKwWAiSXTudBlbUwmPA98r?=
	=?us-ascii?Q?uaY5e2+2+Sh65XyhPZN63vIX/nInsZ7f+Qu4ObvRMnMoz9dXFF/ojIxMhAPx?=
	=?us-ascii?Q?WSRTPZmkI6Q=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1490;
	6:1kWa0nYQeTuA8ewrtvX9pEcOeK5uT6SFDgY8RbqSTb6r1gVHMnK+KOvW6kLv9dj7qZ40lTNBvvvcF4t4QieL4X7vtHw3Z5hvILlxP1OcR09gklOpkhnjWWur1DwxWLqLSAX7xSUai5R8+AbIcPhGf0aFLGiyaNhdqubAgfY1Ispw0q8dwuBnLg5LnoVI5QpFrLZigrCcnugTa9zW/odRd7lChQlfvDq4v9IAAc/rNZAKjNy8nWONZOBzhit03Zte+bE6ZKKmP1JXeyeT4tOeH5IJ9unedv2eGzxiEz941txaa89BuHsyKpfIyXoz+k6kNZXIgIc9sR37Y3dNK7ItcQ==;
	5:AORU53atZN3YdH9bUXWB1G8X4CNn1gC9KMGRAG2XiSvRVGCzn13iYfBIVqwXi1NVhPUqS1OdUaDspanfC2YORt7gg4g4dXyscp44hAXoa8i3uvD48O4eoXMYwjMow6AeUhtgnnkojM4UrHtNXeSYZw==;
	24:PoRmh+YywgVQMzCyV0ug0gsf/eTX0J6zMfcmD2d7LhGhDMyFN0vnd7okHztPsplFG3OH+qMfeI56jWEjXKFp9aarwbshZlTHJX9IT1UTukg=;
	7:hbySNqPgaDJoZOUI1DMSuSbzwDVRgPCVDugRdpKYomfODveOu4HA1mpXYp+60FEtqSNG6BUvEmuf/rIOPAn71Agv5GWhQA6hpK4i48DaAy8cXRJFT1AYCZFryJqCRoIKGI0ljR2m2X/WfrupPGJU2vW1gH4HJoPAvFyuPrfJm8iDRJwTiGpuYfn9BeBj7i2ip5mYVbxgR6HPnaxf9eIZRgg/BoqLT0v0hwjeQtVmXo/cDdZrJyZC7SXAwNk18ID3
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2016 15:50:54.6655 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0201MB1490
Cc: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
Subject: Re: [meta-oe] [PATCH 0/3] Added cpu benchmarks
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Sep 2016 17:23:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Wednesday, August 31, 2016 10:21 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>; Mubin
> Usman Sayyed <MUBINUSM@xilinx.com>
> Subject: Re: [oe] [meta-oe] [PATCH 0/3] Added cpu benchmarks
>
> On Tue, Aug 23, 2016 at 06:32:18PM +0530, Mubin Sayyed wrote:
> > Added recipes for cpu benchmarks dhrystone,whetstone and linpack.
>
> Please use 4 spaces for indentation instead of tabs.
>

I have fixed this in v2.

Thanks,
Mubin
> >
> > Mubin Sayyed (3):
> >   benchmarks:Added recipe for whetstone benchmarks
> >   benchmarks:Added recipe for dhrystone
> >   benchmarks:Added recipe for linpack
> >
> >  .../recipes-benchmark/dhrystone/dhrystone_2.1.bb   | 22
> ++++++++++++++++++++++
> >  meta-oe/recipes-benchmark/linpack/linpack_1.0.bb   | 22
> ++++++++++++++++++++++
> >  .../recipes-benchmark/whetstone/whetstone_1.0.bb   | 22
> ++++++++++++++++++++++
> >  3 files changed, 66 insertions(+)
> >  create mode 100644 meta-oe/recipes-
> benchmark/dhrystone/dhrystone_2.1.bb
> >  create mode 100644 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
> >  create mode 100644 meta-oe/recipes-
> benchmark/whetstone/whetstone_1.0.bb
> >
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.


