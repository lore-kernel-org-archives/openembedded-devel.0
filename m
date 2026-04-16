Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBB7F8D773
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 19:31:26 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23787.1776367884676726548
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 12:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=IpdjyswP;
 spf=pass (domain: navimatix.de, ip: 52.101.65.76, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9KmES+JbMEyU4cSZDSL0qJAts8qQI80TOY+sCKogRcP5AafURjL04Z8SjFnw4NOsskfmxK8v58ja3S8k8B6R68BIxczwoYXhwq1lUUYAiAKZ/CmetJplzzq5wR0tS64sW18md8rlgVPjLAyMmTwDDZtetZGSCMIV2F2qeir+aui8tl1BtD+pLzFyK65Y+EaUXxMQLymliSFfK7hYVbl5ym0BgmqGZFndHRRjbVeuj+mbT/unQna/mOQ6mq77LUW8HDnydRejO3OhBA4Tx2VYvagpIT/GuyD+22Y7q8dptezgwlb7PqJQ2czO9yy5dM6yql1nuxq+Y1SPJUfszg7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOxfrERmrYktp2M+IaTqWsLIs6WH2JDe0Q11fWgsVMM=;
 b=tWLhQ6c6QV5Wco/O5njhCrhDG9F5dtes35SD+CbGSGa/BTTrGsEFdUCoo6/GJPlzhFBhSR2AF3JEMyPQLDC8c5T4iie0iG29ntDCBwg0XIeqqqFlNOJwHhPqYgFA4sYDGAJ958DfocL9f543AkcTm5UBdp5fka6YsjaHFdMtBXqnHqrkarhLAyoGkTbgw+9l5919qs69qXm6aEYFracOPzf9ivP3m81Oc9Zl2uRO4Y0bGexsRb/1yqJkC8trv7hJzVuhFNAxdWjGPB81eK3RHmcIaSgl841o8gRd5r07E9Fiw6s/bhJ6qRQjUopBnKJgv7zV2g/A9PhEC8H9C1F1mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOxfrERmrYktp2M+IaTqWsLIs6WH2JDe0Q11fWgsVMM=;
 b=IpdjyswPeefJMFcvsNDig7ZgHNgNYvuuDsveRB9hS5ao0XBafDFj/lp21C4Ncq1hFq11K91HSX92U13mJiqo/RFZ0GxK0XZ5kFoz7wcJv+ilN+78dvvnZd/+IZRupBVcZeDYoCvjV9F/OzLqn15IkcYfb98n1fhZ1XfUiwDgoW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by VI1PR01MB6781.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:182::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 19:31:20 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9818.023; Thu, 16 Apr 2026 19:31:19 +0000
Date: Thu, 16 Apr 2026 21:31:18 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 1/2] gd: Support PACKAGECONFIG
Message-ID: <253216bbc08c9d7eeed715faa5069f8848b2c84e.1776367877.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0363.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::23) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|VI1PR01MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: e63757cb-1fe0-4501-848d-08de9beebc5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	8CoGx7/I2Wx87kp6mbCglrsC/KNU1FFxmPe5vMMMtkRLBYDUMsisCvLgxvjJMyz3ARmWu0smb96paLFEAqvehhDO7bq9Nsh+ZM0FxKrx/8xZKHZdZfgrCmdLqYQ2WlWrdVTxUJTLuOfamhWnrT3Iw4iqWQ4o0lLyCrv3HMsCXRXA4zoQamDe1dr4M++bH9pHl0o3Ud1kN4kjeBYESBdCr0kEFjA2chudOueKs/gpijjAcg7xoXsFHjxb11cUu7MuNJfx0jFmAeirWm67EHk477jTUiKdtwHBAi2myBA7lXtv2bL5Ay3GeRfMeByaTUoOQY7tDOJq2MmQ+F1UD965quXszJy/XSjqMnbPFCqvs4a/15G1vVmclbBIEL1M+gy+3m/4HJupLcBS2NLedIHlHk1V4EE2vQnljl35n6ifcakubWDk8ykxBl1batibS7FIkzDZAbLBfAxYO14CfH1sPhFwVCxv2xmkXEzlC4qyfyNZcUxI7tdeRgCz3wdIQG1okE5JvtIhScCnG+MXqgrwfbo/+XdGRua0lDu/NeS/8HvoaVk+2upqW+HLD6QEcC/w1OJHz6Kr5k8vN1eoX/DXqvxXwmxG8/yOuL0V+ENgcq4nyDqw08pJIeX0BQJ57/miMU5eaOlOHFOVs2tsoybbqWjziHYu/+zbP2qeyrOovLCWvcISZ36apNL1vorXX5pa5WpOkcrVQj3kNEKQCRPSJu9RYaGByy9/vMDXGgzfaEU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NfIALAqIM6WE6bQ+iVCJY4q056SbRtzHuNBwOrLEWfKV63fxmbQpboZ053dX?=
 =?us-ascii?Q?qubHt66voICz6rktQo+pv9n5qMQd2SZfRRrdP4HbgpdvzIk164xgTJ7OJzEo?=
 =?us-ascii?Q?akrBvXjmQ0jZemr+tRdY2zz4zo0eUsYVSxRHFq19XC0KsPxgiitCCSnuzEV1?=
 =?us-ascii?Q?5guA0YOg0hlVjf0cbUIC0sslGto8MzCQ1AsfeS4v40AF3tCc3WBw1HFtxN9T?=
 =?us-ascii?Q?4ajgqklDpex7skDQewDJDZZlY05GqnuIZqIaqO5uneWLTGk7Yx8sGO8o0DD0?=
 =?us-ascii?Q?gmF2xZ6ueF+clsoz2gEfRUocc2Cv7ZkFrT8uhtrGKFS7nwR9FZsMLMZBD7T0?=
 =?us-ascii?Q?fakt3lKZmPZQY/s/ni6AOeDtgXovAGNNKMn7ilBu2f1UGWa58N9OFt+Dbfk4?=
 =?us-ascii?Q?wLBAVaEIYyimX5GIjcvsCa8pR/YUpXayQVqRdSk0mY2W+THbAOD2nxOXOjAg?=
 =?us-ascii?Q?4CFU8fzem653f/yRwp4AvA0JaRsureqiVHvOIYaXLFYucl5bZyEg3IA/WlrP?=
 =?us-ascii?Q?sNMKLFZle8wL/lOFfAaF009nwXHF64GJfeO0GtrMvRYJUvt9KhXGtktLM+l5?=
 =?us-ascii?Q?PIbpyNs49DCiMOjrDnVGYXIG6MA26qC/g3gCszgfHXhk/9OyJpuWf2d4kYeI?=
 =?us-ascii?Q?qeLJv0Ca79mdf+kZh7DJh/U7DzcBDmpGIGMajooyh2CTzDTblZVe3eRpO1MC?=
 =?us-ascii?Q?0DGIpvsW42n6q4SWpc3EhvhQHEYSnvPvyRNG+BmY6Qv5/eBvMqNJ7LLbcVCo?=
 =?us-ascii?Q?r0X1ACit4XZVP5EgybTT8jtQBv+Jkm258JRVRY60Sfu3HwMXYf35/onaZc8y?=
 =?us-ascii?Q?eeWH2+RAMCyHdr/aaqaTXd0rFkyNMyNdJjINSb3QJ1h1Jn0SYrJx3x2FvWp5?=
 =?us-ascii?Q?NAg5U8GmStiEoTrpL/Qr2qyHPYulZELiLZfOgLK9GzTz+9vvIwUafCy3xYwk?=
 =?us-ascii?Q?AckPLqphPhT9CkFDPCsicsJYoec0v9UqqWcXn3kPH2Gd4d9dRBMKEvZ4HYRL?=
 =?us-ascii?Q?B6EhhhvvCgyYyi+5p6BfYwtCeRR9Tx0nUmrPDymDCMuiUQlcTd6ycIXmC4YM?=
 =?us-ascii?Q?rCRuMfBRxfjFiI3aB0Z1O5uZdt+PSSTH+nsTugz06pt0cOoGG1JLRvO9bDf4?=
 =?us-ascii?Q?hkHcC2JDiTftzgLBmaTg4cgzu/+rrzW8WTPILgcAiTSgGT4qbOaWWhDNv2h0?=
 =?us-ascii?Q?zQk1p5sVtY243hzcn8A1V9kJj7xhXafePG2v9X0rkFdo+uZT7Lf3L4RaRSXM?=
 =?us-ascii?Q?STjXRt3A4YCJIPzU6LrOF7y89UY+1dcTVjesGLu6KvcRe6AtHQSaftKxoSm4?=
 =?us-ascii?Q?D/CMyy0y8Fmm1wR+Wc7R49ag3xvtUw1Ec3aTV9qp7Vum704ElZNKHAZakB5I?=
 =?us-ascii?Q?0tz9OpjDuj5cae2YSQ2ucaE1mgG9dnqDo4yNhtBDaErXziulh6vh09HZVB78?=
 =?us-ascii?Q?cvMHRzdSHOjkfQQlZh6lg+e9cRjlhBlUx4/LvJ2TANoskYDPyyvoP/zqu7jJ?=
 =?us-ascii?Q?zo9MIXS1lvMvSCPdwRxgeZXht8qgsmUCdUk6oIps1qvYkFxFwUA/wcjgkdlR?=
 =?us-ascii?Q?2clVSncZWK9aJtZjOT9ECjMBtHpAvMByupMOfb3PoIZScxrYNm5N05T1s4jx?=
 =?us-ascii?Q?lwJuPUs3yP+yYM26UPDYp+CsiwO+TRFEQD0rxljGC/bfvg3T7KoyRNwqgfNG?=
 =?us-ascii?Q?HnOZgzsSMcpYY6VRQ8bl6KgX5e494Yn2xcOETHhfPoeezNabpkH0Kyb8Wo07?=
 =?us-ascii?Q?WOukGskMIa466J/ivqPBwDAC9t2rJzU=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e63757cb-1fe0-4501-848d-08de9beebc5c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 19:31:19.9205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EseizIDdomyYJukQMaHWXj52jcoiptegSuFFln1hLyPQDp1ScEcVj8W3UOMef1I9BK541Py7g6H0Y290LagzKo5twfP5DLRFXWsZXo35q/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB6781
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 19:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126410

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Some recipes (like fswebcam) need gd with support of fontconfig to really
work. Otherwise font selection is not that easy.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-support/gd/gd_2.3.3.bb | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/gd/gd_2.3.3.bb b/meta-oe/recipes-suppo=
rt/gd/gd_2.3.3.bb
index 0d7a6d34f9..062c4b4a8f 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
@@ -23,14 +23,23 @@ SRCREV =3D "b5319a41286107b53daa0e08e402aa1819764bdc"
=20
 inherit autotools binconfig gettext pkgconfig
=20
-EXTRA_OECONF +=3D " --disable-rpath \
-                  --with-jpeg=3D${STAGING_LIBDIR}/.. \
-                  --with-freetype=3Dyes \
-                  --without-fontconfig \
-                  --without-webp \
-                  --without-xpm \
-                  --without-x \
-                "
+PACKAGECONFIG ?=3D "jpeg freetype"
+
+PACKAGECONFIG[avif] =3D "--with-avif,--without-avif"
+PACKAGECONFIG[fontconfig] =3D "--with-fontconfig,--without-fontconfig"
+PACKAGECONFIG[freetype] =3D "--with-freetype,--without-freetype"
+PACKAGECONFIG[heif] =3D "--with-heif,--without-heif"
+PACKAGECONFIG[jpeg] =3D "--with-jpeg,--without-jpeg"
+PACKAGECONFIG[liq] =3D "--with-liq,--without-liq"
+PACKAGECONFIG[png] =3D "--with-png,--without-png"
+PACKAGECONFIG[raqm] =3D "--with-raqm,--without-raqm,libraqm"
+PACKAGECONFIG[tiff] =3D "--with-tiff,--without-tiff"
+PACKAGECONFIG[webp] =3D "--with-webp,--without-webp"
+PACKAGECONFIG[x] =3D "--with-x,--without-x"
+PACKAGECONFIG[xpm] =3D "--with-xpm,--without-xpm"
+PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib"
+
+EXTRA_OECONF +=3D "--disable-rpath"
=20
 EXTRA_OEMAKE =3D 'LDFLAGS=3D"${LDFLAGS}"'
=20
--=20
2.53.0


