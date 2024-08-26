Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5DEC5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 14:17:42 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.40])
 by mx.groups.io with SMTP id smtpd.web10.53902.1724681860451536562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 07:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=pg3VnVWe;
 spf=pass (domain: de.bosch.com, ip: 40.107.21.40, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWxNm1IIJM6XhranrF0SjiDyL+EzdcgyTy5+pIWn0Xj3hVnrAJESgOKLFXx+ZONfIYbCjpgdDvhw91uh0uMt8duWQJcR2++rYqg1n4ioFg4tqCt/tTNFzcXmAFFKM3o93CaRIgGf6nIEqwmjdJHilWIrTF93lNuJhSqBh32Boqn9fLNjv5lbhn82vAuib8+5ZaHAtBmoXSM5HPYp35U+2FNe+PFV9ehhp4B984LjUlGgCblUPtaWv4/ChZ7qepsklUHlTpvs8Swf/ZhJ/vgW8Ie9tQPfK3N3zRHwGyUerL656A3ERUx7q3LGWhASZYqWIK0CUNduhoeDjYyXpxgRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWpD9M060MA47v1WrVmBsgIzdjlHFicnw36kBV39+xE=;
 b=wgpIiHrcNBbAWjEXSPA1gzlE5q+w+Xi957DpLr+jLfRTCr7eEtkJHKk3ytFm3PHUwF65jMiqB+IT2ot7pCAoI1GUerQeqnWPv7Rlwn4gO+RVl9dMllvklPwFhGcpoexkMNnpPii21rgjGWw0jvSBdXKkUBtqk5aVLJdCm2RmHPVWTWlubSOS7IvwkY5cEsxfceurthsjSWDG20R5a/ey/yYj2daC1FH4ZBjAtAbBNNbjfTXnJDzctng+vHuyRcr8BA84Z36LVphk4eJnoOzi8FU2OEI60vwcgjfh3gzS9KIaciTmZgJ6VIgTO1jXsFvGdBKfr4Ybv82CS45tbjEDeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=temperror action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWpD9M060MA47v1WrVmBsgIzdjlHFicnw36kBV39+xE=;
 b=pg3VnVWedFTitNGMM+qFXXq3QMAsoGpreIBzCiw2VSBArcgXfhclo4hiS3RgRvrILuEEYAkxxMhivkqFjGjeFp5jcPD6Eml/y/szDvcUb24oQvAtck0aBRaNzbz+NPkFhda8c1NIbyLlm2hYDi/R1YZ6GqpPkeeH8M694dCfh3hUkUIFR+WviZ9EO6ZCdiaBYfENpHn3XTWiz30Ea0yBbJV4dhAbqM3rq7CAlP8TAuDMo1Y6OtTcqUNRMPcSXF3VHB3rBuzY2oFIF6eqITcTaHDDJKvPGqOFEnHiRphF1c8uiMp5JGw/CnzfRPQjuGUAkqAjBZia8Gn676VJSppr+g==
Received: from AS9PR04CA0095.eurprd04.prod.outlook.com (2603:10a6:20b:50e::7)
 by PAWPR10MB6853.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:339::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 14:17:36 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:20b:50e:cafe::2f) by AS9PR04CA0095.outlook.office365.com
 (2603:10a6:20b:50e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Mon, 26 Aug 2024 14:17:36 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 139.15.153.205) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=de.bosch.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of de.bosch.com: DNS Timeout)
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 14:17:35 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 16:17:20 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 16:17:19 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <ricardo.simoes@pt.bosch.com>, Mark Jonas
	<mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH 3/4] directfb: Add zlib PACKAGECONFIG
Date: Mon, 26 Aug 2024 16:16:43 +0200
Message-ID: <20240826141644.78746-4-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826141644.78746-1-mark.jonas@de.bosch.com>
References: <20240826141644.78746-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B6:EE_|PAWPR10MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: 487d9d70-60b0-4ee0-ab04-08dcc5d9d51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Dh2s4EsyBNC/0BrLF0F7oAHQ5V3W9f7hVsUF8U4ETXkH32hqL07qTuYnNfiS?=
 =?us-ascii?Q?31o0cXpnHz/onS6atFApxD4MbcDuBt9uEeusp0sUfmVmXKU50ITfu5AhSfYw?=
 =?us-ascii?Q?RVTDAMjzyavuirbMzFPi0kdidfcMpYXz4EyTKRjPzgnBUV9Myh+x7QOY40u5?=
 =?us-ascii?Q?SLivYeEJecKYbx838Md6xKEE6UHUYyzXnZ1VWWh3TRPyTtn9fdHhbg3Ymm70?=
 =?us-ascii?Q?GV2NyPyOz9WMBrSIytHiUWvUDeX7C2jpKU/hPhyoKmw1xVcqW8IHZtJa4Beo?=
 =?us-ascii?Q?8K8KZ1pVEPE/DdxcMHP78haNRR/RnXkja2eLRMuvIIRlaErwc67pihMuYtKn?=
 =?us-ascii?Q?oMbqEOtKUnfLnB8n5bM435Dbaqj0FnljhUOYawrCxHvC+oXQRdjcky0ZeuUb?=
 =?us-ascii?Q?fumuWbqUnEIbVLxKYGA8b0dKqGNPzf9fx2C6IMuCDMDd3JRxnzagEBis+Trv?=
 =?us-ascii?Q?1Pg/BW3ZEKHb5wKBssVx4jRIaTEIN2V9ksXjfnq2+htoBHSJjerS7K9IO7ng?=
 =?us-ascii?Q?c4bnQhyMTEltSDUA2S0qQEHO/Zq8FDnAGtKJ08mNmKHXHeftUZoux/ZQPAet?=
 =?us-ascii?Q?HAvHXEX4HPkBxp607N6MZNG/BuVkcLViUMtPDayWLeeyhj8LysRDvLjhIIoV?=
 =?us-ascii?Q?oYS3hcy4aFFy5k04lNoxrUWWkt9K0hM8RFiPrwq4oHkMPFEs/i4BC4VLVFzo?=
 =?us-ascii?Q?ZxHZ3CkMvshDeN46+QEPnWeZu7U7Je/yVzNHTh0gt5+weRBHKlrEGr+vpDe2?=
 =?us-ascii?Q?9e84brD2dvmrKHlY2nQH2GNDatdQHmMiS1ERQ1m20exIjfVN9E/QdzP93O0N?=
 =?us-ascii?Q?hr4Ulcjdh9JE3yUHKqEax5udr+WL0ROwiANz9FR8qQ/IOZsuZr0l0FCU35Al?=
 =?us-ascii?Q?JAyzVC9RMrbKaevTRSa8qGRP3QAFP3A2pgKdI/YY+MreuTGTFCRbr2SZHMaW?=
 =?us-ascii?Q?A1mi6n3qtUoHxai8FJz1s7HwEp3atO8W4naU9tzC1I9750lHki9g4b+SXkC+?=
 =?us-ascii?Q?UwdIh6VuGlgwmuszp1icQ4bd+LLVndSyhigCjjppSyOq86EF0Lfz0cPZ6uE8?=
 =?us-ascii?Q?kwL0CVJKzIh9mqRVdfy4rY/FmRDBcAU41sPDEudGesLzWmdgosKxCIcn828P?=
 =?us-ascii?Q?BtZth42E6K0v/OMGZD8QbxX5A8qxzpc7Jqh9rWCMZPoXXldIKrvEfOMQ+4pU?=
 =?us-ascii?Q?RCXVlNf5OZJbW42vvCLtVXHo+yVQHl/DfXkDWnwdFRLzlGvpfl55m1Kp5JP6?=
 =?us-ascii?Q?WswsTejZ+boEEve55r1NP/ibFZQEzGAkrHlUtL9XkhRBiZwNapcm8bkZfefI?=
 =?us-ascii?Q?kz/DciIV5qlTW1bpvElP1+s5wM8HXiR+MnMbo9sb+9qDjZwBfQxgGCa2k7P9?=
 =?us-ascii?Q?pIen+snZXeyk0KVwHRPSk/ca2I8R?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 14:17:35.3209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 487d9d70-60b0-4ee0-ab04-08dcc5d9d51d
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6853
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 14:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111967

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

zlib was always enabled in DEPENDS and EXTRA_OEMAKE. Now it is
a PACKAGECONFIG which is enabled by default.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-oe/recipes-graphics/directfb/directfb.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recip=
es-graphics/directfb/directfb.inc
index 1f81d2ecc..313c9d16f 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -9,7 +9,7 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddcf3c825659e82539645da41a790858=
9"
=20
 HOMEPAGE =3D "http://directfb.org"
-DEPENDS =3D "jpeg libpng zlib sysfsutils"
+DEPENDS =3D "jpeg libpng sysfsutils"
=20
 SRC_URI =3D "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${P=
V}.tar.gz \
            file://configurefix.patch \
@@ -40,7 +40,7 @@ BINCONFIG =3D "${bindir}/directfb-config"
=20
 inherit autotools binconfig-disabled pkgconfig
=20
-PACKAGECONFIG ??=3D "freetype linuxinput"
+PACKAGECONFIG ??=3D "freetype linuxinput zlib"
 PACKAGECONFIG[drmkms] =3D "--enable-drmkms,--disable-drmkms,libdrm"
 PACKAGECONFIG[freetype] =3D "--enable-freetype,--disable-freetype,freetype=
"
 PACKAGECONFIG[jpeg2000] =3D "--enable-jpeg2000,--disable-jpeg2000,jasper"
@@ -51,10 +51,10 @@ PACKAGECONFIG[tiff] =3D "--enable-tiff,--disable-tiff,t=
iff"
 PACKAGECONFIG[tslib] =3D "--with-inputdrivers=3Dtslib,,tslib"
 PACKAGECONFIG[webp] =3D "--enable-webp,--disable-webp,libwebp"
 PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,xserver-xorg,"
+PACKAGECONFIG[zlib] =3D "--enable-zlib,--disable-zlib,zlib"
=20
 EXTRA_OECONF =3D "\
   --with-gfxdrivers=3Dnone \
-  --enable-zlib \
   --disable-imlib2 \
   --disable-sdl \
   --disable-vnc \
--=20
2.34.1


