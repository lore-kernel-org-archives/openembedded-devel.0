Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4B1F8D774
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 19:31:36 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23787.1776367884676726548
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 12:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=HAhbZkKk;
 spf=pass (domain: navimatix.de, ip: 52.101.65.76, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaONsGF/V0Q9stM6uM//OLz0ylQl2btJ5V+0l5P3RDchWYseEzZPISu/KclGZsJCwo8DB3y2t+2HFJQRCrn3vQRx+XoOulUstWrDsbaFnc9VdPhprQI/zFfCIiEf+zKdElGcadBV4pan2PFl9Une+VwligjEF9VQBmxAMT/8NyJK52VpSBnUVGZl0KS59PV7x2AQgeZ4vOoOucD7vHpSEcbo8tH5Cule7wWrG+UgqEsS65PfLjBCYqSlp9cucO+L0joVKVRiZde4Jq9P6dNS/DobDaSp14sI+eqJddZig0/hmU73KrYNWzJzXJR6iErkgomyUyFGqhLHROFXb07IPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoLH4vOp1sM4lL9GOT50aQcz46h/NragEqncU+C5kqQ=;
 b=Y86DG+e+qvKo6leyZH7ejfLCGfVLOsMGZE0qVRFw72WxaeJZf0RoAFgMyB2kY/RKZSixE38aJxWAI5XP9gomAs5i9VvsPAVc0+vP/Vw+WExuNXLUvpWevMA+FjykxHPYreC7OqGAElJj4mDDoLk3NY+XcmibWg8l2+abrb99jsWPGgGQ2A81/di0SHwMfY6v+xynITKpPH462cR47CYX5rwpbTYLmD0hsBMQuEHJ2FnFWOOioc621l89ZeCKct46yuWXe+ztfTgthekU+PPNzcKnItz1WrTwzVrg/H5zOTFXrREauFtsDAfyTUzsbaZggTJqipBU2tCOlSz0OgJ/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoLH4vOp1sM4lL9GOT50aQcz46h/NragEqncU+C5kqQ=;
 b=HAhbZkKkrCnIAUNVre4UgraX6cRElyNGkZyNofRqt7GAW0BdpOoEjIoF7G4qdnyHDDqCOIZFvLecSBDY4hCiXbTZc9Brw7ooC0sxCl0AvTeVQlMrGZGwMxG8MTSHrQlZXn35ejOE05XukPV40Pn8KLv6wWgffDfecR4/yTov6zc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by VI1PR01MB6781.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:182::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 19:31:21 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9818.023; Thu, 16 Apr 2026 19:31:21 +0000
Date: Thu, 16 Apr 2026 21:31:20 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 2/2] libraqm: New recipe for a library for complex text layout
Message-ID: <29e7d628f1233a495a4094bc979d27a4061c9542.1776367877.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <253216bbc08c9d7eeed715faa5069f8848b2c84e.1776367877.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <253216bbc08c9d7eeed715faa5069f8848b2c84e.1776367877.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0457.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::17) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|VI1PR01MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7a4c96-b60b-469f-40b1-08de9beebd73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	rzz/JYUJb+nuVeIPM+YcJaCfYd1IthN5loFMjpoJgaqBhwgxEfumWQeKe2iYiUCsY0dxmpL5OMbqEIoeiaoOBnpW4J/cSKMHZ6HVXUgBMaJW4FO1UsgiIt4J25myj7pJOTR5d9OmVMix40lyX11+ES4UwPrEvykwS9+bhRwkClpKlZML0TJcTbnr7r4PX00RVlW++SpeyvFcwyaz5k1Nmpb+55IoS3eojgEeZwv4RGbN2kHpumvNl4T8EQi3WycuD7aIIdA5En+yvTuD9dNuGP7Ja2Vkm3ratVpsngAwCH7Yx2jXGTA+d93rk810uFLnWG7ZcJzpqcHlYkkzpxnBmm+LHHarRMDZN2sUgsDkYYWwXTpRoMKNBb+Ocq7zKTwpz23+ycFfCjv/ccAeCcvtCp9WIidSOI3fBV2XtrY1a5G8vD7Q92u6WlGavmu29i/A/qmRDu/KijGz+kt4SFyfkVxlpzC8g9SGHSGRr1CHCWWcj803eELgwm2t/DsqfmvI0S1kPmd2mNEps3Ep5CJwZ81xVW/GBsHLpXidMzs5hLpVBwQQLU/gEbXtrn0aRX4Ydyvw47IraA6BbWjcsbOCqjvEFo06MS4BlNHXjGKtXFbXKzTZZs+wbtdYFcCOqWc9UGXG7l8Jy1X2wIjI++KPFdoH1/p1WPpLyCwnuhYIiaSp5gZhIdqtK3g/M6kbTndqPIfW0N7rwsIy4RygH2GlJ4WCXcC8Up2LRCJ9+bNrmFg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fu9wFt9+Mx7GETNB6LT927r0fROG+5Jh8yl/a/ZZlxxFWYiGhxoQjMbvqkwd?=
 =?us-ascii?Q?eXpMbYRygBfph6VCO9jnPmNlGc5x64auGQ/1dsP4MrYa3dTcvEmL52zxzBTC?=
 =?us-ascii?Q?87xnpiHII0hw0vlq3opV8XmpXmOtbX7yQHxiSPwW/lqQYSC1YikMD9dcRckW?=
 =?us-ascii?Q?cdr2/AIDruGHxPu7S/VASddV1izKiYUUdsPqzSBzt7htNiZnWsmbmaP5amaO?=
 =?us-ascii?Q?8C/OD3TMBecgfpsIN7OD63jrirp3kaBBvPQffrwc3t+XlrrwgWhruBsnjt7r?=
 =?us-ascii?Q?urT6PJZ6wBxisq9WdW9qtykOQhpyGL+od6kb4WQ11FXW8cYXeD6hwrqB+h3d?=
 =?us-ascii?Q?phMp8ZAaN4l9yt2f0zuHBpvfKGEIDvHEwduyxYaVtSTWsW2UJAS40dufkkLl?=
 =?us-ascii?Q?yDJt30sRkGfsNwwErEi0V0QROiblw3FU+ZUCQ1d4Yg9yCu8jUcjO4/qfOfct?=
 =?us-ascii?Q?JErIWN0li9c+ROxo7Na19POZ8sDNK8nDkaJd3PxPrs8KYEwGvfSrQY4FoUHu?=
 =?us-ascii?Q?Ihc1OGS/UpzPSc89LeudycCRy4tGWHGjpj9xEb87psCh6IsvQ0LpB/GjXcBM?=
 =?us-ascii?Q?W8IBzxtSTSSCCou5KZ1fmhEZDF92m5+YV3BPvJukU8fMXrHV95A+XtWtjN5y?=
 =?us-ascii?Q?sa4aeVVxw0awm4d8E3x6wq8kfV+7ffW6QGnRi5W0hSbX1zSUXFz2oV26/P0z?=
 =?us-ascii?Q?wjhqo6SapV8amfSMng1eOJxszVaOPyutqzkwtpGpxWZG9EhJ2IFXBFIgMk1J?=
 =?us-ascii?Q?UaMW709PhesCPMJ9OwY2NlaJFk83WOGmlUWOdmWdgcALMfP25guhMX3VzJDZ?=
 =?us-ascii?Q?AMkKiNeUvssIkURujPjwJxBvLuwqSEH5FY5nCON5PooldZR7p+sAW0hDxxZQ?=
 =?us-ascii?Q?9AUUyfbCFW0Dar6Sz0AlYX1vGYeifv1N8dAl+6f6hrRXlJ7r4c6qOxjghrW6?=
 =?us-ascii?Q?QJuXAOpUEFlv80YTNgd6GX2KnQibQ/z2h3Gzy2afRWZBudRc4ehxsmdJaWQn?=
 =?us-ascii?Q?AAfPd9+ZTrZpIXw0kdSlBD0V1npZ2mHiQCvkvKGLYfL/vOH0wc5pg9YJvfMS?=
 =?us-ascii?Q?57UkbDuP+y2OR5KMTh+myb8DYn1Yqt5gQqmcyQGfsy3KXDEsa3el0vNg9N0E?=
 =?us-ascii?Q?C4ieCbZCnmm28ZeAaH1Sh2yKasMBogIo0b88XMSoyI+JEhOHG7V1qXYomvbs?=
 =?us-ascii?Q?aPRVyxyDcezFxDrnVcPRpGMFfB9Srl4+lrjAEQIh+wTfMlbBHCdtWWz7gOnc?=
 =?us-ascii?Q?k/NJdlljqrshqcoaly6uA8/KGM/2uuO2A4aKBK/l5oK4hlmGTzqUE+sUgtLd?=
 =?us-ascii?Q?s5zC0E6gqZ/DdQzuZilze2BIBWvCsYR25XQBlXHs87mBlzJn4rAj/vOxOwkr?=
 =?us-ascii?Q?lLKrepUci2VdoHcZIhHRBmis4yqJDfE/wxzdNpqv1oUg/9Sn5fXZ4qIa5vPv?=
 =?us-ascii?Q?k0yF6cN1YBsV+2QlaLDd9w8nrf2uwDUEkmviz7oAhMzSthdLPBfWCk6DNHKf?=
 =?us-ascii?Q?HYN5hdYwo/lWJstbWQOYvonYH/Eq7m2eUY9zKXa3Rx08+joPgC7YwHX26ml6?=
 =?us-ascii?Q?ZohnJfARGjwA4YDUMmVWDt9Y1tYpj92hlT7tyCTG3S2qsl1BhjGS77dxo3+M?=
 =?us-ascii?Q?xSPMYMzb7hvkuOKCzuuUi9QBtYkmi6Jg4/GErAHqpaxblGK0UFou/GVJtUAU?=
 =?us-ascii?Q?mskWUsPivvc06qPpQM1WoMHFCD6oeRDTZfv5/QXfC0dvJMIwBlmCqWykYY92?=
 =?us-ascii?Q?8tIdMqWZNbUWLRrwcaGldWCLBZ56y/M=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7a4c96-b60b-469f-40b1-08de9beebd73
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 19:31:21.7443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmrxGAN/4HAlzUemtzZ4kGg9vpLhKavwioFU77cGjviK2ZwiFz2jEdIKvMTtJP/o59ATDI4bcBl6OElB2OcKj34r5E9l797FzsRcFM75/Uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB6781
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 19:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126411

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../libraqm/libraqm_0.10.5.bb                 | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libraqm/libraqm_0.10.5.bb

diff --git a/meta-oe/recipes-graphics/libraqm/libraqm_0.10.5.bb b/meta-oe/r=
ecipes-graphics/libraqm/libraqm_0.10.5.bb
new file mode 100644
index 0000000000..8eaaee4492
--- /dev/null
+++ b/meta-oe/recipes-graphics/libraqm/libraqm_0.10.5.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "A library for complex text layout"
+DESCRIPTION =3D "\
+    Raqm is a small library that encapsulates the logic for complex text \
+    layout and provides a convenient API. It currently provides bidirectio=
nal \
+    text support (using FriBiDi or SheenBidi), shaping (using HarfBuzz), a=
nd \
+    proper script itemization. As a result, Raqm can support most writing =
\
+    systems covered by Unicode. \
+"
+HOMEPAGE =3D "https://github.com/HOST-Oman/libraqm"
+BUGTRACKER =3D "https://github.com/HOST-Oman/libraqm/issues"
+SECTION =3D "graphics"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7dc444a99e2824eac906383266fe4fa=
6"
+
+SRC_URI =3D "git://github.com/HOST-Oman/libraqm.git;protocol=3Dhttps;branc=
h=3Dmain;tag=3Dv${PV}"
+SRCREV =3D "3a6b891a3db0e0db1364aa38088422f68d8d81e6"
+
+DEPENDS =3D "freetype fribidi harfbuzz"
+
+inherit meson pkgconfig
+
+PACKAGECONFIG ?=3D ""
+
+PACKAGECONFIG[sheenbidi] =3D "-Dsheenbidi=3Dtrue,-Dsheenbidi=3Dfalse,sheen=
bidi"
--=20
2.53.0


