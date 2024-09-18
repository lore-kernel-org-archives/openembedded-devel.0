Return-Path: <keith.mcrae@leadereurope.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2F7CCD1B7
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 14:19:28 +0000 (UTC)
Received: from CWXP265CU008.outbound.protection.outlook.com (CWXP265CU008.outbound.protection.outlook.com [52.101.195.74])
 by mx.groups.io with SMTP id smtpd.web10.16435.1726669163693124904
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 07:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leadereurope.com header.s=selector1 header.b=b8osrkxS;
 spf=pass (domain: leadereurope.com, ip: 52.101.195.74, mailfrom: keith.mcrae@leadereurope.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrU/hTS2uO8HVkULNMXbu16tAyeKDaVuoN7wcuHRCO29SF2dXtce9XIdR2rltA50ppa3Hnxd8jih7blea8uLFpFp72Bd7M1NGxPD+n8cMkyECyriZS2764xD7lairEyEYuy5PiQD6JegQe0GHREFwCC33HvgmRJ19Hm62KzJdwmx7HMNsUxWiNKyhSPmibiIxMjQZUBl5oavv3Pefgv38JT7HQUjt2upmbtLMaLU5/KnyfXKieYYyLyoCuqlqjR8QUgm1pumr65LC+tZXuZu8k+veLWTDvfiOwEOgfOaHRaCHtVbJmVNyM8S4CdG6KgyTFPrk4Z1auXnQP0Kn3ddBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmHbHYl6XTIvWOBtxk6OgOqFmhtmJWIo8nJM6z5YHlM=;
 b=yMLdJ72gpEozWCrjBj7iB4bAiTt9TT9OY+ULP+7IZoQ93ZGJEnK38yntaa1VGsRvM8nCMdS0uDgJoGtAceMCZ8KJvnHQmNzenZSTQjFDoFBNCDOC5qQrY6Pedb4t2gbJufRpmAcd7JxaFF01zb+urlBeMBD79YkLi1UEAwFTbMF+uTXmGS0jOvUD1IniTz/MndrYJA2v1TU1FP8/tQjTJazRtpAem1el3yz8LV6MjJFv8uqUJLn/pP74+Hgoizeoej6kWBBSH4oumsnV9ia6J2vFLNNXCsgE40VuuphG63Hk/rJv+XfeVRh1QLm556oRb0/KzWKZCZQ6JfX3R60j4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leadereurope.com; dmarc=pass action=none
 header.from=leadereurope.com; dkim=pass header.d=leadereurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leadereurope.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmHbHYl6XTIvWOBtxk6OgOqFmhtmJWIo8nJM6z5YHlM=;
 b=b8osrkxSL1W6kqsPOxOzPt65zZxnvL4O2sYBbhCt+v3c3QyUxJiL5fFORLyM+PPTMf8+q0qswbBzr16cxzjyqtcfJbvUakOxK/H9moqgbaKDXDx1VTS5Bopz7ZojHiYs8/GBBiVGlkqNah3LOO/P0irUTBqI+JetqSMbvAvase1INynx/005+0pt0ASINozKNwhcPGOIcVpsDKhH3oxzkCIfdicxH2HPgNOPiKUi13dDvkdD7rtDlhb0xgGlmyUa+OB34f0rKzhDbDoHZSSln5Pg2KGfJ3zmTrR9bULVI/j23Gdm0eYRLXpU8HHvnV/qWbUYzdbRlAjCAPe4OhsJLg==
Received: from LNXP265MB1545.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:84::10)
 by CW1P265MB7531.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:214::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25; Wed, 18 Sep
 2024 14:19:20 +0000
Received: from LNXP265MB1545.GBRP265.PROD.OUTLOOK.COM
 ([fe80::80c9:4bc2:da2a:b808]) by LNXP265MB1545.GBRP265.PROD.OUTLOOK.COM
 ([fe80::80c9:4bc2:da2a:b808%7]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 14:19:20 +0000
From: Keith McRae <keith.mcrae@leadereurope.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "raj.khem@gmail.com" <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] Fix incorrect ntpd status
Thread-Topic: [meta-networking][PATCH] Fix incorrect ntpd status
Thread-Index: AQHbCdVgLW+lv/dMrEiW3eOGZSRDkg==
Date: Wed, 18 Sep 2024 14:19:20 +0000
Message-ID: 
 <LNXP265MB1545E71082DB653E508B9CB29B622@LNXP265MB1545.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leadereurope.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LNXP265MB1545:EE_|CW1P265MB7531:EE_
x-ms-office365-filtering-correlation-id: 2c7fdbcd-d2a9-482f-dabc-08dcd7ece33b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?DmjOSqrnZoET5/nM2G+lUdes4IXqnqqr12v5479BoZp/FM3ElW9rQW4h63?=
 =?iso-8859-1?Q?SziIEWiF+zVda7bOhi/cCITewOKzefwPaX39G7cnPhCRFe4D9yzvWWdFCI?=
 =?iso-8859-1?Q?lKwol4+WQwmKtBY1KKUvycttqyMfr2cNcjlIijspZ6qLzGtf/l7qGQY4lp?=
 =?iso-8859-1?Q?0rn05kAlvOLko2jqdLZAwnY7Pawvm0njG/hx+dM1Y/yjpc/HyM0FFJn4i5?=
 =?iso-8859-1?Q?tdg1DZQRZVOl4Vvwcz/u1XmgLZk3gGK5rrzArU7qjY0rAMoMqbnbK7T3wW?=
 =?iso-8859-1?Q?gjTY2shQkRBZYzP6ao09GGDul9SnPRGwI0LzrlXDd/6159cBmH3GSqbiQE?=
 =?iso-8859-1?Q?OjQZrg65H+GkcKQfKXaHWCfHjjs4+SE82gtrR3dYgtk8DNq2lVlaoAztzT?=
 =?iso-8859-1?Q?wY3e8LIU4wfbgT4la042sGWWatGJSMS1m6xLQeyXwCH0fQ8ELC3BNUNczC?=
 =?iso-8859-1?Q?WanxWNIEN8fdjylCasOj4NkEqzDAXKlGqcPLPYihL5VZQe6RTYqdLCvSl2?=
 =?iso-8859-1?Q?K2Ci10mt8bpguJlfOmLlEFGacqbDJvKkuccSQtQ7tlF71O9KP4s409TFRk?=
 =?iso-8859-1?Q?ypkeoFRfzEfrTlyF6DF6r9JVMmagfZH5AtNu0xhL2is86dErKmazKQcaZ2?=
 =?iso-8859-1?Q?Vlj0ylpnEiKaFRpuOADifSazhvExbK3C9Vi1CkGMKhCx4fZejDereph8Ya?=
 =?iso-8859-1?Q?pKVHkyfj1PZnBwXejOQeaqMVocWhLFYrFNTlev0iUJ7hA9R4eidQ6kVgis?=
 =?iso-8859-1?Q?zb6Cxv9ihrdgyozbS0OK5R+xV4NkKMW3HvUOgjjs2ZxlxCPT53U6w+xkyQ?=
 =?iso-8859-1?Q?eP04PlkRz2RmUQNQy4xnmip+UGL3gFLMc9Fk0HmhcVp0MZkkG2qWNCXX9U?=
 =?iso-8859-1?Q?MZre8a7mBa8NyiWXi2UMHP5q9AvoxGbEndk73JRGZPseWB38rHNLII9Lg4?=
 =?iso-8859-1?Q?dPXXNwcRxvdroZIdMP76XJ6vvHHokwo6wSi8dNXcVqloylABnOZxt1R0oj?=
 =?iso-8859-1?Q?8C0PTErEVv2DLH9kOP6BilxKZxeRw7f6AuvF1/pnZtBAt4yyASkszGW7o9?=
 =?iso-8859-1?Q?hZbO46Ig1llRNmktKBN7ZTZc5dGYqd1f5U1deuDtxFwoeW7DNfahLA+E6q?=
 =?iso-8859-1?Q?6xSjSGZcxS9vVBUAmdsBsVMttMOGO9YpMm3AmuAqj7BnQzAUlmw2N6W80c?=
 =?iso-8859-1?Q?mXvT+bbbhcOSbqOSFflcpg7zZ9wqay4dKIQL3/SYMfANCjA9bY2A1aDRWb?=
 =?iso-8859-1?Q?ZbzDa7a0VXdHKyv6suRdlFethc/PtmWoAZffcQ3FoinR8CYhCN98dFZ3MD?=
 =?iso-8859-1?Q?PYE0CsNFzwej+tvQDOPy8BHqrR9U6EebQybxOqGi0UB0x04UjvscOVbtk1?=
 =?iso-8859-1?Q?RWAD2sHsQEtPmAwjUJIia0zav3hqdP9Q=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LNXP265MB1545.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?5dgItPpOtkojUWq6eQML6JzEnWhCAeWwh/eijCCD8EU1lqVSE4B++loPrs?=
 =?iso-8859-1?Q?5ngKzsvyr4YVRHxxSq+V7x5/O8+khe5LeqLjviuxEE5XsClQ6jq5nn3aOY?=
 =?iso-8859-1?Q?ch81qyNSKsxmnyMC+RkJFbRAOhxfEnbxO6DVA1WfJzWRSKQ3xuRSh2nzC3?=
 =?iso-8859-1?Q?gHNjwOUGSS2n3LoofS2drzVNXlBorHDpotyA1JNZk4oYnbc9cWMsmSX/gw?=
 =?iso-8859-1?Q?kCR+BzcmqRQkjPYXjlm07yfPSfGH+BdusPZ6lmJVcNKhlSgFOS7VAj86+P?=
 =?iso-8859-1?Q?e6RUGbJlPG1E3zs3NF+8VeHcLt3llFUuEtjj1oPUAxdJ7689hBHwtmtGq5?=
 =?iso-8859-1?Q?v+meAXzC9xU1Er9Oes8ehXWjSln33W+NA/uM3sGqelzK2US86KDhcU/MEf?=
 =?iso-8859-1?Q?PGpIQg6kKraeogjuEfIzRq4u0VRV+1ttXLFO7gjBw3fmWlPipUEmA6DPnN?=
 =?iso-8859-1?Q?eGdm+Sa/G61zTlsVcYy7b+46cpS+cEkQPltbLukMWAMVDHtXjHIMtTpXG8?=
 =?iso-8859-1?Q?Y9HPXSyolgEIVXX2B4Y+c8aVhL+qEIa3XMZW1oIiqnjMPeCH1EDelOwkRB?=
 =?iso-8859-1?Q?PGrrT8Ceiouf5OS19eIWyPZ4Y4GorN+VwYx6XM0LO/TKIc33KD0jZUVyPY?=
 =?iso-8859-1?Q?OKPTWBKvEnnow/q5+gtEpeA6Y9vqhfjk+MxRvfHYFItW4/eFXuthyB2C48?=
 =?iso-8859-1?Q?0fVMKx4i6I2NciKLbVWPYqyb0FHu/MsX63x6PmO0x/UZIL/5Cwl/JSxp66?=
 =?iso-8859-1?Q?NvFYIGxzNHxJTkP1HDunva1Bah0FyWe4+NHApSyHLdw/f6KpsgdARXEUfo?=
 =?iso-8859-1?Q?NEM2mWu1aEkCt+BDSpUpLOcQiSNzlsRZ338gRYSbitoyrTYRycbjnfTORn?=
 =?iso-8859-1?Q?pbGqhNAMvqET3hTV6S54VDNPOenAbKEEeNh9152qXO9J8lTsuCGREqS8BF?=
 =?iso-8859-1?Q?U92tVVKD2lxR5hwLzmQKBK/bJ0dbEJ0rY9nJU9rsg8cimA5+RbJq7P/nj/?=
 =?iso-8859-1?Q?tYpIUDIobv9uexkxtbxODKypJg5Se5HQ+Cx/XJybMOkFJJsfVUICtewD0b?=
 =?iso-8859-1?Q?AY/J1chfy1n7ObETmQOF7NoW4IRqJpfbM5lBiwuJ/MKIQB9xVmoTk0si19?=
 =?iso-8859-1?Q?dZLGTcApk85KwWpVIEu6QdMcwUaEF7TJjI/A29a0NejtiBPrDwyh0LpL/Q?=
 =?iso-8859-1?Q?YffYwebI/y1Imndkqc09ufDBGQSHbgrXv7wjsRDrkAdHSkXK3lHAKrqx5G?=
 =?iso-8859-1?Q?cPuX/xbzkryHC5rNCbX4FWfj+2atI6M248ZwtVJoeBBD65nlxSJAJ6kRI3?=
 =?iso-8859-1?Q?7+3dyRhPwJWK00ppftPq9yhLCLl6+YbGMHC+XdbCHaNN0YBuRJj5QNdSTN?=
 =?iso-8859-1?Q?pid/cPQEmqiQQdzd1X3wkmnf+Q0xRCUd5ro5DPXG0t3Hg+m3sqlKMNGZMD?=
 =?iso-8859-1?Q?0ZmAZIhyX1WdvYVhVwvVJjNLeHnufREDUEUM6sQmR8fy+y6waXkfml44qD?=
 =?iso-8859-1?Q?cS8NIjrPU5wfuWPvk4QrayLh/osWLIySrVgaLfcNE0re777zY+OjPKwfVE?=
 =?iso-8859-1?Q?vow56usv4h+S3VsCzxr4voo9zNRJCVa2z2SoOV+xwdKPPLJ6ghO0BdfoJo?=
 =?iso-8859-1?Q?oECh7BeMt8RgwO2AfFInmlo8bjrfw5h2U4?=
Content-Type: multipart/mixed;
	boundary="_004_LNXP265MB1545E71082DB653E508B9CB29B622LNXP265MB1545GBRP_"
MIME-Version: 1.0
X-OriginatorOrg: leadereurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LNXP265MB1545.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7fdbcd-d2a9-482f-dabc-08dcd7ece33b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 14:19:20.3988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 20a0d659-dc6e-4307-9c1e-97f93b0e3d90
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YXL1G9EKhGms++GSCIk/nvqEFuQqMqUYVriW9g9beQ/ZiMkl5m1086LA8fXQcAaC+1gx+/PgZ5Gsn6dCvfynbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7531
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Sep 2024 14:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112358

--_004_LNXP265MB1545E71082DB653E508B9CB29B622LNXP265MB1545GBRP_
Content-Type: multipart/alternative;
	boundary="_000_LNXP265MB1545E71082DB653E508B9CB29B622LNXP265MB1545GBRP_"

--_000_LNXP265MB1545E71082DB653E508B9CB29B622LNXP265MB1545GBRP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

Noticed "ntpd status" did not report status correctly due to supplying full=
 name of executable to "pidof". This patch fixes the issue.

Kind regards,
Keith



--_000_LNXP265MB1545E71082DB653E508B9CB29B622LNXP265MB1545GBRP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Noticed &quot;ntpd status&quot; did not report status correctly due to supp=
lying full name of executable to &quot;pidof&quot;. This patch fixes the is=
sue.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Kind regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Keith</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_LNXP265MB1545E71082DB653E508B9CB29B622LNXP265MB1545GBRP_--

--_004_LNXP265MB1545E71082DB653E508B9CB29B622LNXP265MB1545GBRP_
Content-Type: application/octet-stream;
	name="0001-ntp-Fix-status-call-reporting-incorrect-value.patch"
Content-Description: 0001-ntp-Fix-status-call-reporting-incorrect-value.patch
Content-Disposition: attachment;
	filename="0001-ntp-Fix-status-call-reporting-incorrect-value.patch";
	size=832; creation-date="Wed, 18 Sep 2024 14:19:07 GMT";
	modification-date="Wed, 18 Sep 2024 14:19:08 GMT"
Content-Transfer-Encoding: base64

RnJvbSAwMjhlZTc5MmE5NmQ4YTNjYzVjMDkzMzE3Y2Q2MTlhNWM3ODRhNzdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLZWl0aCBNY1JhZSA8a2VpdGgubWNyYWVAcGhhYnJpeC5jb20+
CkRhdGU6IFdlZCwgMTggU2VwIDIwMjQgMTQ6MzE6MTggKzAxMDAKU3ViamVjdDogW1BBVENIXSBu
dHA6IEZpeCBzdGF0dXMgY2FsbCByZXBvcnRpbmcgaW5jb3JyZWN0IHZhbHVlCgpUaGUgInN0YXR1
cyIgZnVuY3Rpb24gY2FsbGVkIGJ5IHRoaXMgc2NyaXB0IGNhbGxzICJwaWRvZiIgdG8gZ2V0IHRo
ZSBwcm9jZXNzIGlkLiAicGlkb2YiIGRvZXMgbm90IGV4cGVjdCBvciBvcGVyYXRlIHdpdGggYSBm
dWxsIHBhdGguCi0tLQogbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9udHAvbnRwL250
cGQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L250cC9udHAvbnRw
ZCBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvbnRwL250cC9udHBkCmluZGV4IGQx
YjljNDkwNy4uYTBjNDNlZDVlIDEwMDc1NQotLS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1z
dXBwb3J0L250cC9udHAvbnRwZAorKysgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0
L250cC9udHAvbnRwZApAQCAtNzIsNyArNzIsNyBAQCBjYXNlICIkMSIgaW4KIAlzdGFydGRhZW1v
bgogCTs7CiAgIHN0YXR1cykKLQlzdGF0dXMgL3Vzci9zYmluL250cGQ7CisJc3RhdHVzIG50cGQ7
CiAJZXhpdCAkPwogCTs7CiAgICopCi0tIAoyLjQ1LjIKCg==

--_004_LNXP265MB1545E71082DB653E508B9CB29B622LNXP265MB1545GBRP_--

