Return-Path: <Aikaterini.Voulgari@softcom-int.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC24CA0FE1
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 14:43:59 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.109])
 by mx.groups.io with SMTP id smtpd.web10.7992.1693579430317942102
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Sep 2023 07:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@softcomint.onmicrosoft.com header.s=selector2-softcomint-onmicrosoft-com header.b=rFt+kRsN;
 spf=pass (domain: softcom-int.com, ip: 40.107.247.109, mailfrom: aikaterini.voulgari@softcom-int.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKs4oV5ayFY/UOLExVIB8kev88mvO4MJQwFvyBVaBszv/OOsaT2kvRMHLozkbaPoyBPj46aYTdAurYyQWy/rMTv3BPpuexdEmFAcCCAKZIjnCI1K1sNj28xpApiuP6I3U8HQq3c74qKOFqtA1H8FEFXtpCTCPgjdEH7ktFOi85ewqdnMxrHIe6Zlp9Mkd3lCju9Lszuts3I2Br8/ukr7SH4dyhiBimnvwVwni/SGo/HJbIHJH/FpZi3a6+y5W6CwXYubssmKO4gHkp3QzDLxCyeAsOV8ZnClGCoYyHpIuN3hQncu6fcvqORvt31m1nKd1/fh3p69++dIjQ1DeQ92Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2c4ikgMzKo+v4jnl8dumEHxanz6pq1wih26i7gtlxE=;
 b=nNPqvQbN/u+HXvR2CHHW/3A/IoNXfM7H5CXXyJb9QquxIqDOTW2JJhFfcWh5ZJjfOalikGpHP9GTFxaWRkjcy9VMPRs0dhuAXyxllrBvCJVFwfx65PxQS7eTkagmMF3Ey+6ccY/DnfIaMjVd1tPT6LgY/T5PSesPkFEq9IVeDye5bcP7gnUAw9r8xz5UnlJFGr7myC1DziK0BjsL9R5iZm3vbqeQjvckx0Ag8LtHhvGBFaEGX8h+QRXXL05UGh9hRhTSzevHCtToqa+p1m9L65R87y3ZR6/6cGldnhthH5f7RahpiTDewe712clrGUEl50ep+gygwcLYW34kLpLOHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=softcom-int.com; dmarc=pass action=none
 header.from=softcom-int.com; dkim=pass header.d=softcom-int.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=softcomint.onmicrosoft.com; s=selector2-softcomint-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2c4ikgMzKo+v4jnl8dumEHxanz6pq1wih26i7gtlxE=;
 b=rFt+kRsN36T8gKae18CLRvJPG/bda4fmnN+x9oTe8zePI/w1x88tjEv4mpGYVoLbBKBDdYUMLxdMkC1FhCf7Kth8zzpgamq0+eP9mpLgjUzFnowfXsgrt8fcEeuXFjnGC2SOKukq0jRMven88ic8Q6cjrkT834vMewcZdTT1J94=
Received: from DB4PR02MB9598.eurprd02.prod.outlook.com (2603:10a6:10:3f2::6)
 by AS8PR02MB8269.eurprd02.prod.outlook.com (2603:10a6:20b:50b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Fri, 1 Sep
 2023 14:43:46 +0000
Received: from DB4PR02MB9598.eurprd02.prod.outlook.com
 ([fe80::8f39:9180:ee8c:60e3]) by DB4PR02MB9598.eurprd02.prod.outlook.com
 ([fe80::8f39:9180:ee8c:60e3%3]) with mapi id 15.20.6745.022; Fri, 1 Sep 2023
 14:43:46 +0000
From: Aikaterini Voulgari <Aikaterini.Voulgari@softcom-int.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH] collectd: build with rrdcached plugin
Thread-Topic: [oe] [meta-oe][PATCH] collectd: build with rrdcached plugin
Thread-Index: Adnc4gh+OCG6kraVQRGlqAqx91sC6g==
Date: Fri, 1 Sep 2023 14:43:45 +0000
Message-ID: 
 <DB4PR02MB9598929FA2C57B34DAC69283B8E4A@DB4PR02MB9598.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=softcom-int.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB9598:EE_|AS8PR02MB8269:EE_
x-ms-office365-filtering-correlation-id: 9e366ea7-b37f-4b98-4d25-08dbaaf9d887
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZCmuvA+NFM9J0zz2RvLX8RcArmPzwkv7SXyb/ZbpcZr2dRlLkuUCzTqeBKlscCGcqjHAjBNRz+08YojieM/oC0A3czNJlDmXIglbBg+6BDW/lKa+vCCND+XZqiS5Il+OXKJ0Ja9GtE3HwYrKByqeCXbOgutPZdxtL3EcFr0QLQKEwcqHefYs+pX31kNiUIx/fqVIQDpCeuHdy+74Wbnx6rY8EpUERGapsQrg5hqPckhs1qYdJhpMRbcSgI2VmbnZ6fMwyrH7Z303RXilp9rj7YBdcseUNciicvaEofHJ/rnhQjQHISlq4GJGWG3uV6csnD2M0L+aOuvNK/anA1mo38HYTXUZdd6R9ThU08TtR1qaCVWwO1RT8u1b+YGt3qZIbeNMjORXNt/0bnpY14tzFcuutnPpzdzFr9B+pFOHJFkZz60FHna0olw8slOR3kQuwKlrUyK3rvo/zYSEk6OQE3cckY3zzMpZRJqxV8+q4UcPJNRWNmd0Kwztwg/9rmwRolKWFIks8frtzszKsyKvlPkUBYUOSfwnjFSUIDV3zTkJYfgzQALHTM1F/lq+Xd+NUtLolxB3PvhHXvbsBVDifNk6FuPECwAUbOcFFCX6/3Njn50BJNZu6+5PRPg46Neb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB9598.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(39830400003)(366004)(1800799009)(451199024)(186009)(33656002)(55016003)(8676002)(52536014)(86362001)(41300700001)(5660300002)(8936002)(6506007)(71200400001)(7696005)(9686003)(83380400001)(38070700005)(478600001)(122000001)(6916009)(38100700002)(76116006)(66446008)(66476007)(64756008)(66556008)(66946007)(316002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-7?Q?4HjKleJ/KCSK/O17SOKoCr953fO6qVWKk4yoPPQVwZ/tlVIiBIN8WHbX1T?=
 =?iso-8859-7?Q?LGz/D0ECv+4hpt3/vemwkIrGez11xc7RAmy77JYn3/TYjkm5zUo+EGXKCA?=
 =?iso-8859-7?Q?iOCGviSdNq2VqRNUob2jKbSpfj8Pu//zz0bAkVkxppqgvC0SEbx3KUCaoH?=
 =?iso-8859-7?Q?OZw6wsHiki6KsQqMxry5UTtw80mRRy2gOom1KKOTnUcWknv9kW2Mppq1KE?=
 =?iso-8859-7?Q?VzguwCoGmT/wimjmctfhKeDzIEGgDfYh4ygWNCR/uvERHLGctkIbFrbKBD?=
 =?iso-8859-7?Q?v5U2r1OurjUifO/sXykfBS93N8oLqDMxmOOOsEy6eK7MJm0BvH6tsckYWQ?=
 =?iso-8859-7?Q?1MK9EHSj5+3cSJAvpQi1/gA+Fs5CaPVad1iTIdOCpc5nifK6qPpXahGaE1?=
 =?iso-8859-7?Q?gvL/vgYJji82rJy/55YrOvIVAmoeCWGe6xSE/wWA/1Bk4SnmceGhIKML5E?=
 =?iso-8859-7?Q?FHcT3yBjYyC15cQ4/RAxtl2lDw7SWyc73tXMRf3OlQ/E0nELjyygIIDxof?=
 =?iso-8859-7?Q?PJHQy3V4lB3qn6jXW1LafS9C3ThdQZrzgI0nHjsnlWrlMDTl/zAfFMkbSw?=
 =?iso-8859-7?Q?JqQSoKCKiv3vVS+WbAcDFUW9QFR/l1ERNWOaSOvjYODcYs/UfIIcthn6Ch?=
 =?iso-8859-7?Q?BjPHnAPmlvHnwe3YQ+CbGkzFM307u/WYlkzclq3vzYMQgZhJnbeOoz5s4N?=
 =?iso-8859-7?Q?9aq6rXM77/TnWA9Z5wgMl50MCsqD0u6ZaCKxdFv35fKeQK+XUwTDkpWzxP?=
 =?iso-8859-7?Q?AUehBOsdjV6Fz75SM9Xal2MCKzuLsDiavRBYEcfniSN7VgMzVB8mmLyeRo?=
 =?iso-8859-7?Q?zvcwGRnnmniiXuClYktRPybn50NuHb0m6b72F2tF4qXkfUgu9+CJE8xxVr?=
 =?iso-8859-7?Q?SUc9lQ21X3kQH9gYkoSBLYohbQms83TD6qhaWdntQqX/K2YdZS6RLCRSgN?=
 =?iso-8859-7?Q?Ag9TzNxvYVrJbT/3pES3t/gdkl4vL/3pHiSunoVH/XEGDcSNYcjYD+y02h?=
 =?iso-8859-7?Q?8+BG2I2KZsne/2TE65axbaWHHc9JWOv6VxtrLPdJmpjy8iOPwc53rU7yls?=
 =?iso-8859-7?Q?qZAyNgWipD88A0mwOzzuje0PnAwkK2KOrWXYssS7m5XK1CnDNthjq9kJX/?=
 =?iso-8859-7?Q?aYhE1ZmFsbNuCNGlF0+R5nLC0IE4xsYArNEOnxJlsho8ANccahF/rhWSYR?=
 =?iso-8859-7?Q?FNxZ9TTG7cZ9JPUYNs6PkgiJ5SYL9atq1V2QxtPowSq54bYTFMrW5Gyna/?=
 =?iso-8859-7?Q?tlkD+2Z0uLVqK94qcPw56hvo0lYoc1kn5G1fTEFv8QqlO6iwhFvK/gg5bq?=
 =?iso-8859-7?Q?fa8n2DEw3TX6tF1J76OImBtI5hd0goeaMCb0COo8MmJtef8B2VW0UJw7Gc?=
 =?iso-8859-7?Q?Fue2lfBEU8d4Kwy34/nqBRYoeYTK/TQx3Hh6R4bNBq+lCsHOfI2OJoVbUh?=
 =?iso-8859-7?Q?oCyf6at1WuS7uCMXmYiZ4MjF4tPXwXPW7yNJIghYg0JhpiKPbx/RIraHjd?=
 =?iso-8859-7?Q?ol+vLn6ooNvXMCwF/4hteQoj/VjDtHJeL1OgL7XTOSIQ/3uUeSLg65l1gb?=
 =?iso-8859-7?Q?mGUp8WUFk001LyomoZriUgbeCBip/i65ZBdL6wlBdReNrrBApnUBsr+VST?=
 =?iso-8859-7?Q?sE8n/9bSOeEgKgwo/TDK7By2E187jTowU4QC4PhJ8MsLgOhUmCkMSEV68K?=
 =?iso-8859-7?Q?cIEEW1reuqJ1xgMxktyntyF+5tZwmHEAuC2RVVwE?=
Content-Type: multipart/alternative;
	boundary="_000_DB4PR02MB9598929FA2C57B34DAC69283B8E4ADB4PR02MB9598eurp_"
MIME-Version: 1.0
X-OriginatorOrg: softcom-int.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB9598.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e366ea7-b37f-4b98-4d25-08dbaaf9d887
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 14:43:45.8912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce1a3326-3971-48f5-8355-5f76f4cfa286
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vjkmpdpU2nvbJmEcPet1HYDWwVQaebR61CITbH/4cL2Vte+Doe7aR6UBVnOUUuJOHCoputeObYTwxO6nTPdYQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8269
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Sep 2023 14:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104691

--_000_DB4PR02MB9598929FA2C57B34DAC69283B8E4ADB4PR02MB9598eurp_
Content-Type: text/plain; charset="iso-8859-7"
Content-Transfer-Encoding: quoted-printable

From cd8b1febe5b333a1d38a839ebb904c768c194c61 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?=3DCE=3D92=3DCE=3DBF=3DCF=3D8D=3DCE=3DBB=3DCE=3DB3=3DCE=
=3DB1=3DCF=3D81=3DCE=3DB7=3D20=3DCE=3D91?=3D
=3D?UTF-8?q?=3DCE=3DB9=3DCE=3DBA=3DCE=3DB1=3DCF=3D84=3DCE=3DB5=3DCF=3D81=3D=
CE=3DAF=3DCE=3DBD=3DCE=3DB7?=3D
aikaterini.voulgari@softcom-int.com<mailto:aikaterini.voulgari@softcom-int.=
com>
Date: Fri, 1 Sep 2023 17:40:13 +0300
Subject: [PATCH] collectd: build with rrdcached plugin
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

rrdcached package is provided by rrdtool recipe. The build dependency in PA=
CKAGECONFIG is changed to rrdtool.
    The error was:
     Nothing PROVIDES 'rrdcached' but ../collectd_5.12.0.bb DEPENDS on or o=
therwise requires it). Close matches:
      rrdtool RPROVIDES rrdcached
    ERROR: Required build target 'collectd' has no buildable providers.
    Missing or unbuildable dependency chain was: ['collectd', 'rrdcached']

    With the patch, collectd builds with no errors and the final image I te=
sted includes collectd with rrdcached plugin.
    Tested on custom image with collectd_5.12.0.

Signed-off-by: =C2=EF=FD=EB=E3=E1=F1=E7 =C1=E9=EA=E1=F4=E5=F1=DF=ED=E7 aika=
terini.voulgari@softcom-int.com<mailto:aikaterini.voulgari@softcom-int.com>
---
meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe=
/recipes-extended/collectd/collectd_5.12.0.bb
index 5dc64588d..479c12d6a 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[libmnl] =3D "--with-libmnl,--without-libmnl=
,libmnl"
PACKAGECONFIG[libatasmart] =3D "--with-libatasmart,--without-libatasmart,li=
batasmart"
PACKAGECONFIG[ldap] =3D "--enable-openldap --with-libldap,--disable-openlda=
p --without-libldap, openldap"
PACKAGECONFIG[rrdtool] =3D "--enable-rrdtool,--disable-rrdtool,rrdtool"
-PACKAGECONFIG[rrdcached] =3D "--enable-rrdcached,--disable-rrdcached,rrdca=
ched"
+PACKAGECONFIG[rrdcached] =3D "--enable-rrdcached,--disable-rrdcached,rrdto=
ol"
PACKAGECONFIG[python] =3D "--enable-python,--disable-python"
 EXTRA_OECONF =3D " \
--
2.34.1


--_000_DB4PR02MB9598929FA2C57B34DAC69283B8E4ADB4PR02MB9598eurp_
Content-Type: text/html; charset="iso-8859-7"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
7">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">From cd8b1febe5b333a1d38a839ebb904c768c194c61 Mon Se=
p 17 00:00:00 2001<o:p></o:p></p>
<p class=3D"MsoNormal">From: =3D?UTF-8?q?=3DCE=3D92=3DCE=3DBF=3DCF=3D8D=3DC=
E=3DBB=3DCE=3DB3=3DCE=3DB1=3DCF=3D81=3DCE=3DB7=3D20=3DCE=3D91?=3D<o:p></o:p=
></p>
<p class=3D"MsoNormal">=3D?UTF-8?q?=3DCE=3DB9=3DCE=3DBA=3DCE=3DB1=3DCF=3D84=
=3DCE=3DB5=3DCF=3D81=3DCE=3DAF=3DCE=3DBD=3DCE=3DB7?=3D<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"mailto:aikaterini.voulgari@softcom-int.co=
m"><span lang=3D"PT">aikaterini.voulgari@softcom-int.com</span></a><span la=
ng=3D"PT"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"PT">Date: Fri, 1 Sep 2023 17:40:13 +03=
00<o:p></o:p></span></p>
<p class=3D"MsoNormal">Subject: [PATCH] collectd: build with rrdcached plug=
in<o:p></o:p></p>
<p class=3D"MsoNormal">MIME-Version: 1.0<o:p></o:p></p>
<p class=3D"MsoNormal">Content-Type: text/plain; charset=3DUTF-8<o:p></o:p>=
</p>
<p class=3D"MsoNormal">Content-Transfer-Encoding: 8bit<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">rrdcached package is provided by rrdtool recipe. The=
 build dependency in PACKAGECONFIG is changed to rrdtool.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; The error was:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; Nothing PROVIDES 'rrdcached=
' but ../collectd_5.12.0.bb DEPENDS on or otherwise requires it). Close mat=
ches:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rrdtool RPROVIDES rrd=
cached<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; ERROR: Required build target 'col=
lectd' has no buildable providers.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Missing or unbuildable dependency=
 chain was: ['collectd', 'rrdcached']<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; With the patch, collectd builds w=
ith no errors and the final image I tested includes collectd with rrdcached=
 plugin.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; Tested on custom image with colle=
ctd_5.12.0.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Signed-off-by: =C2=EF=FD=EB=E3=E1=F1=E7 =C1=E9=EA=E1=
=F4=E5=F1=DF=ED=E7 <a href=3D"mailto:aikaterini.voulgari@softcom-int.com">
aikaterini.voulgari@softcom-int.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">meta-oe/recipes-extended/collectd/collectd_5.12.0.bb=
 | 2 +-<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 1 insertion(+), 1 deletion(-)<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta-oe/recipes-extended/collectd/colle=
ctd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb<o:p></=
o:p></p>
<p class=3D"MsoNormal">index 5dc64588d..479c12d6a 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta-oe/recipes-extended/collectd/collectd_5.1=
2.0.bb<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/meta-oe/recipes-extended/collectd/collectd_5.1=
2.0.bb<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -50,7 +50,7 @@ PACKAGECONFIG[libmnl] =3D &quot;--=
with-libmnl,--without-libmnl,libmnl&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">PACKAGECONFIG[libatasmart] =3D &quot;--with-libatasm=
art,--without-libatasmart,libatasmart&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">PACKAGECONFIG[ldap] =3D &quot;--enable-openldap --wi=
th-libldap,--disable-openldap --without-libldap, openldap&quot;<o:p></o:p><=
/p>
<p class=3D"MsoNormal">PACKAGECONFIG[rrdtool] =3D &quot;--enable-rrdtool,--=
disable-rrdtool,rrdtool&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-PACKAGECONFIG[rrdcached] =3D &quot;--enable-rrdcach=
ed,--disable-rrdcached,rrdcached&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+PACKAGECONFIG[rrdcached] =3D &quot;--enable-rrdcach=
ed,--disable-rrdcached,rrdtool&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">PACKAGECONFIG[python] =3D &quot;--enable-python,--di=
sable-python&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;EXTRA_OECONF =3D &quot; \<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.34.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DB4PR02MB9598929FA2C57B34DAC69283B8E4ADB4PR02MB9598eurp_--

