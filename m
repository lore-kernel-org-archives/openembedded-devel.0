Received: from FR4P281CU032.outbound.protection.outlook.com (FR4P281CU032.outbound.protection.outlook.com [40.107.149.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14805.1795781134730337590
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 04:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gossenmetrawatt.onmicrosoft.com header.s=selector1-gossenmetrawatt-onmicrosoft-com header.b=klB6aFOS;
 spf=pass (domain: gossenmetrawatt.com, ip: 40.107.149.83, mailfrom: wolfgang.meyer@gossenmetrawatt.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vt6WfmPvIynwNW3VP+hAviiHuQjwlY/fuTgv2MK6jRzAuDBkWUnXF/1HEqpm3ZhvunUzPm9ozKZNYEbDMVNE0a4YcPaKn7rR6HmIdq/jxJtL+FPwbf3AtqiuMzU/YW3nrsjkwvROdfvN1tQyZqVUm6ZhLrd6G7EgG1PHzInnMoti2PPgcXJjOm0RW5akYQ3/QHKkT6AtaJc8kPeSBnvaTxPMrMnfjCXhAfZRvl0WpF6pYitmR3Xjl9wM3ARJUDdUleJjGm2HrQ/+tU9GiR6uH1KBh39GJgYMkFV8RLTjd2Rft/anscj6pBfljCmdxezbX7CarywB9pz76L7p2Ph2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dkxCsAtrFH1klxFOg9/gGWyQKC5auOToc+0fgjGjas=;
 b=lgnoGJ6bOvPzCydPy9uGyRsPvQQSd8KSmD9OJcCZdFE3Z40VaYloyo0fAsOnBVQsPsuhDqLVXQlTReTFny0whTtxOQQBuwEeaMeAARCkFc/264eDMa9yNrCDee7asM5HJbaCKlmis81/+aSCKERiH9Uo8dM+67BhN8Ws5YKUrwM+KiC04wTx04QSSW4VU8hIGdye4vRViEOrrkm8pY03qkNornX/ZToHlKN3hhQCjmCcMuxgD/aE6BeWLbYVz23A/F0d2Z5Xldtf/XhRUK4M9KgwGHVsV9X4T9IwAx8hFZ4hImwMfzzFoPVjKYXUbf+3icGnR0NVfG0MBF3JVGozsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gossenmetrawatt.com; dmarc=pass action=none
 header.from=gossenmetrawatt.com; dkim=pass header.d=gossenmetrawatt.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gossenmetrawatt.onmicrosoft.com;
 s=selector1-gossenmetrawatt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dkxCsAtrFH1klxFOg9/gGWyQKC5auOToc+0fgjGjas=;
 b=klB6aFOSvskZG4FGrDuqKUkD5sctKHaVvtfs4XSgnfkRhS2MooRWk9zbZ7GQPgrEuYFaMemt4AaNQSEwy5yr/dVKiEbH+6ACIieLgXu3HNRx6+tqe/8wcor1ycwLzICGWl5+VyQ/6vHNas3dfwMBzPBf1F4jkSj2BKDd8q1sOYM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gossenmetrawatt.com;
Received: from BE3P281MB5293.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:d3::11)
 by BEUP281MB3498.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:99::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 12:05:29 +0000
Received: from BE3P281MB5293.DEUP281.PROD.OUTLOOK.COM
 ([fe80::bf97:924e:d4e9:fe4c]) by BE3P281MB5293.DEUP281.PROD.OUTLOOK.COM
 ([fe80::bf97:924e:d4e9:fe4c%3]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 12:05:29 +0000
From: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
Subject: [meta-oe][PATCH] fbida: opengl is not required in DISTRO_FEATURES
Date: Fri, 27 Nov 2026 13:04:48 +0100
Message-ID: <20261127120448.82579-1-Wolfgang.Meyer@gossenmetrawatt.com>
X-Mailer: git-send-email 2.56.1
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::18) To BE3P281MB5293.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:d3::11)
Return-Path: Wolfgang.Meyer@gossenmetrawatt.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE3P281MB5293:EE_|BEUP281MB3498:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a830285-f1ed-4f36-daeb-08df4c7ebac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|52116014|11063799006|261009223027099003|18002099003|3023799007|10067099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|38350700014;
X-Microsoft-Antispam-Message-Info: RIHFK6dodltc8yKcnbGPcjrgC6cB2nOAqh6zh9UxBS07XkMppnRl5VDiBOemd2o7HANCpG/aWr0XfQN3tUuID75JZSF6h4dGwTRfZLSe3EkEv+A0NbhaPlzxtN4xyOYSV47urBWDNr6a54pkjfv7SbskAGNvGGQvHhKfy1G8T+QqVVqmWmrk6xzV2k00UHosl/Zmz9qiLGSSE8p6u+XMn5VLleGdCesaxRwCpWvpFdoXXSJ8tGr2QTX5zztT1shA6ZdamUR4QNBMQblEvsJT3WnVqm0tGLWgTh2nbnELtDQf+Nn3RIKqArmfOQYFp5tZzFTFwf/c/bduagaN8cqD25kfOzRfh0HbgIZwh6A4OAJ7VbmhhGNB95ti91UtcWbMlAah8ICwATSOK5O4o00DJZ0sI0PF2w2X9HOIqpvROSahdQMoHep3c4p8H2olqlHyIgAQxXXeegTcuBmLc/6f31tHW01S/3zCvXNz3qxAqDXxUnTzwTRY6UCLbCfLLxf8wSSFNPcPCX/krHtTt1Aw8e2zkk5OuJTObncVApPj/E2VOEeL6lZ4XHVfdnxTS2HysmuxI/TgQdMNVGjy14SRR3tfVubq/LNhkNU+MGNu6VQH7QBizpxDswmfHOOvrZU0FcbQ0zB7m6Gb1zzisPqlNa2wU14ce+VaSc7hkCbBgh53fs9bYvH2tK8g27A7hbfNJ5qKqlKqVuu+eh7OtbG/YPqxiUfxH/AVV8sD2/4+CVo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE3P281MB5293.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(52116014)(11063799006)(261009223027099003)(18002099003)(3023799007)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qPfoFon8OfSCkS9LVSrcz2NvHGbLA1IxZG+KZ6FTVFiH15kfd02nkrEl/wIX?=
 =?us-ascii?Q?3pHM3VMQ28Y70EAKmAzIULg8jU6PxcFdljyA/ioR4qVnx0RZIqEbdSxy2CP0?=
 =?us-ascii?Q?a/BeOebI6ZqiDaczSzO7mMatbYtdPXSwK7Hs3sn1CHWa2pS3+2UcC80wI90L?=
 =?us-ascii?Q?GJ9IWen5viEHGLks+gyq8uNK0adIRr974pojLxYnC3RzL2dWTk5YufEQNo2j?=
 =?us-ascii?Q?ikVGnjKrlqb/Mu6r/T/3a7yPsdjXRyuEUC5vqdg+7zK9lT+m1ViOtMsDmdZN?=
 =?us-ascii?Q?FQEnS4a1rUceet1gXZyELTJIIPFM1YfKW+09zprYhrYSqB7PDTnWl6WGA8YI?=
 =?us-ascii?Q?ZFPTOt1agGPF2WvZaj+HiMjtRudjWPyS8e2NdKQW0oQshyrboTv9L84A5Azh?=
 =?us-ascii?Q?k6fJExPLc36Yvike2nVDssfe3SWX4ggNDjzRnq5DiF20HSyIT1XuhKvc1Lrc?=
 =?us-ascii?Q?tFO1IpExdrCPrJUA+pALLdCEwEjRP6jAdMiC2YTg6YuBrWl81Rtt7s92Iqw5?=
 =?us-ascii?Q?NTv74Iv232+e1rpd2HBCigqFnRG6fMAEMk0pzmQYgafc4lQbnC8keKCJQ558?=
 =?us-ascii?Q?2nOU4Jt1SMoXsOb87eSPc9HDflMt/lZSXInclS7iYf6BET2/fnwd+og0djHq?=
 =?us-ascii?Q?yHeH8PuQ3PVHik1LtDTDv42Qjv/D3BgD/sviSIQ3sGJslOw5uv87NvqT+ddA?=
 =?us-ascii?Q?L0vyF9f0eO4HQ9PXUb/VlQLFv5Bq4HCjfdIAK8/8uQMiWAdPKqVczv36YRH/?=
 =?us-ascii?Q?fvdfB2E7+595cQeXnRuavQnwKMLKUHL4P1KGQo5t1eEcoPGfnQrAcV+ncqYq?=
 =?us-ascii?Q?Px+TWUjNt3QG1dh80I/xoc4WRiObs/+QqYskgWK9l+emky/tEHwIYz2fA83F?=
 =?us-ascii?Q?ohH6CB06Lei4YOehgyR28QpVqx1G+yUXNefcUtRpERVVLmbkPNuPMobrICjx?=
 =?us-ascii?Q?KGqKddhDm4pjo2mNzQDOFWXeH1brHyUSYB9q4Yua78X9BxnaWMEseH/6hqbC?=
 =?us-ascii?Q?QpzFUm2LvTlRDguiMI/CpR2S52unuh3qy0DMPSPyq7A+UfqiQvqbWicTu8wX?=
 =?us-ascii?Q?hb+kPtj7G4I3dp6h7ZAQdurMgGHjHXsx4ovdreoGz8pu7SdodgJ9Ryd/B9dA?=
 =?us-ascii?Q?WPki2sqkbuZcOdAC/Ohkyr6I37iMhduzU62cVJoaDjdwhB0EvRFwP+hmrlKi?=
 =?us-ascii?Q?qNQpqQWS+f6plva8eC9tTwpk8B81x2QgvHNbHHkga9HONhI8qdkSPu8lpRTj?=
 =?us-ascii?Q?zEuk5Bt3soHj9rgWr0kO4MrVZXAxI5MZ8nye0NFX8lN6rnzPUuiF488//kgA?=
 =?us-ascii?Q?+Mk7pn0jbsXNG7ifklzjXeuRZjSh/tpMnbC3DaB9trIoSqwfz/zG+rK8uAmz?=
 =?us-ascii?Q?/3X3F19nrtXSntN4aOCkVB7z6CskA1Okqn1hFrLNNdR1o7ApDDlcxM1OBKFL?=
 =?us-ascii?Q?r1bAVZg3ap2//If/uqpbk+1gV9nUgR7PUwq6ZS3uogk4rXyRkTqurzQKTA3m?=
 =?us-ascii?Q?YLGfxI7IsiJ0VGISeTuOCYuXZ3FiKEN3zUgzv3CfOOZ0hq3wXEr+ft8PGJQ1?=
 =?us-ascii?Q?eJ+6lqYl4yz0QfK96M+2JsyXdIITpyYtC7xoUzOqtS1tT1FLFq0DGYebMbRs?=
 =?us-ascii?Q?pzt9rTZUFl9fcbD4kIzhAzeY7WctCEl5cXpLqEej+NKDEBzxCa52pROkBBEE?=
 =?us-ascii?Q?cCj0FibasS4c8Plf40dlWKzsl1AbrbarqNBsb+Ay/SZL5l4QI53w13ulLPMl?=
 =?us-ascii?Q?anZK/FlI+U6XKUrz3gLpW+7Tgi3aG6vNbfoa9Gfb+pK5YWU+tfR3?=
X-Exchange-RoutingPolicyChecked: lOOnId0LdnQatxdPkjmpLX42FSym2GXoCSZAzupkJTwDxYiOFu4QyQLoPWJPPly7+F15Z/b+oTFxj3GSJeNdycSpivRRlGKp2lzp+IwusHyRKuOisZ0Psq8zJlBRHuLcf0YSPiTu2fYyPFxu+XGXcnTI7j1ioTwSdtL5knFORIroAbGlmzzy4eUdqVaIR7AgZu2+ab4qu8xKX6cd8SpqUZczC1sb1dUhqz26gkZ3fnuTMaoXBkX+8UP3GVdZ+6ghBpbyQt2TZuyr6BGXLpnTrG9PBnyr8DBEpoSPEgP4rtlQ7qGm9G2HeSrHtS+UHVuqOx1BaGE6kwgzLbXm2qZW8Q==
X-OriginatorOrg: gossenmetrawatt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a830285-f1ed-4f36-daeb-08df4c7ebac1
X-MS-Exchange-CrossTenant-AuthSource: BE3P281MB5293.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 12:05:29.4499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 927cd455-6160-4d75-86b6-a6892a3b5317
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8Wg4CBe0aAr9QzS56sVFBUM3C8javvierHxNwPO4TqHZBKWRBvawUIiNNbHCLqgTkzEwgI/QdqEYNgUkTaKC6RcYlbG2k4X1uMYIJYoTncRCWcWZ9MruxAVI+/BNGhP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEUP281MB3498
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 12:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133375
Content-Type: text/plain; charset="utf-8"

Dependency on libepoxy / egl has been dropped in upstream for 2.15.

Signed-off-by: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
---
 meta-oe/recipes-graphics/fbida/fbida_2.15.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.15.bb b/meta-oe/recipes=
-graphics/fbida/fbida_2.15.bb
index 99beccb274..cde4fa5d7d 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.15.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.15.bb
@@ -16,10 +16,7 @@ SRC_URI =3D "git://github.com/kraxel/fbida;protocol=3Dht=
tps;branch=3Dmaster;tag=3D${GITT
 "
 SRCREV =3D "a0d75fbab3ea01bf5b36f813f0ec0d1bfa2db745"

-inherit meson pkgconfig features_check
-
-# Depends on libepoxy
-REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'pdf',=
 'opengl', '', d)}"
+inherit meson pkgconfig

 PACKAGECONFIG ??=3D "gif png pdf"
 PACKAGECONFIG[gif] =3D "-Dgif=3Denabled,-Dgif=3Ddisabled,giflib"
@@ -27,8 +24,6 @@ PACKAGECONFIG[png] =3D "-Dpng=3Denabled,-Dpng=3Ddisabled,=
libpng"
 PACKAGECONFIG[tiff] =3D "-Dtiff=3Denabled,-Dtiff=3Ddisabled,tiff"
 PACKAGECONFIG[motif] =3D "-Dmotif=3Denabled,-Dmotif=3Ddisabled,libx11 libx=
ext libxpm libxt openmotif"
 PACKAGECONFIG[webp] =3D "-Dwebp=3Denabled,-Dwebp=3Ddisabled,libwebp"
-PACKAGECONFIG[pdf] =3D "-Dpdf=3Denabled,-Dpdf=3Ddisabled,poppler libepoxy"
-
-CFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_=
X11=3D1', d)}"
+PACKAGECONFIG[pdf] =3D "-Dpdf=3Denabled,-Dpdf=3Ddisabled,poppler"

 RDEPENDS:${PN} =3D "ttf-dejavu-sans-mono"
--
2.56.1

________________________________

[https://www.gmc-instruments.com/files/logos/logo_gossen_metrawatt_300.jpg]=
<https://www.gossenmetrawatt.de>

Gossen Metrawatt GmbH | S=FCdwestpark 15 | D-90449 N=FCrnberg
Amtsgericht N=FCrnberg HRB 24602/USt-IdNr. DE815002769
Gesch=E4ftsf=FChrer: Markus Belmer, Dr. Markus Diehl
www.gossenmetrawatt.de<https://www.gossenmetrawatt.de>
