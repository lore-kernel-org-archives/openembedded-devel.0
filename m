Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89FACCF9EC
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:18:23 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.15])
 by mx.groups.io with SMTP id smtpd.web11.736.1761362301419700142
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=B0mM1NVq;
 spf=pass (domain: axis.com, ip: 52.101.69.15, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imijCshsb3F4p3+SyvadSTXvztYFtTOl6Mj+QZCqP6vk+JmU7r43g2laBReI9UWC1mVcGzIH1DsEmIqmlBWVSAHV97xj6CdT5Mr/X32OhHyHE2hMvW1soxuu2VAYSuCkHSEGmQoaEiPOoj8Lobwme5rvSKgK3lclnFmswOo0QjinGrDy6zhyk5lslPu6vXKOdZO3cerSHbPsktTg/ZCZyzw/Yva4Llh+2v+cgMhtrtk+JCPuepVZCDhNbhTulG/cJMAU+ywSYln2RIbHIzvim+f50ctOefRor3km0kPk94UXsEwUq5qyFLhvBH7J64iZSY7lm6mwMrvpb2o1BDLibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynxR8xihiOiHXNgfLhAhdC29U9e923a41SDbcnYyTrU=;
 b=ufVaNzhdPvkf1OEojjVtDBIXWFLoftKfVX4S7LMWzH/5mHV+YDFXmBEjuEi03/uScmy3bzNYVnVrewGXjd+i0qt+7Vc1H3XMJRn1zeaUXuhyHyCOYbTd+ovuckmilvs9Gf1X0gNh/nh3w1gMMSVk+MOCzfklbzqnQ8EyXlF5ljfaq7WafnNe7xI6aKxpvSqoWGNDZUmRI+bWX9lH1n4GWGD7ZTvBa5SW3v1fbQK0Z/D1YGB6P0HUmlm/+UwW51dZtkLADbVLwYTIwDa39NzhQrh1lehw223DpR42a9vRd9O6eb+rM6V2lEn2FCzUMUH3Mi5fh7/+HEEmZH3voeUQqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynxR8xihiOiHXNgfLhAhdC29U9e923a41SDbcnYyTrU=;
 b=B0mM1NVqYpcQwPT1M6C6aklaihaisjxycu8QvZSiIvXLQnIIUOZfMFIkU6RP78D783kyvSJjcf4ONh7Y5ZF7tbN5TlyaR8fw+TRDPv9ln6xbLfw4Tm93ajDkEth9Lp5iNvZBycVRdZAxZfmW3oAJhAwRM8eQZ40dOZYCgtUUR0A=
Received: from DU7P251CA0025.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::20)
 by VI0PR02MB11115.eurprd02.prod.outlook.com (2603:10a6:800:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 03:18:16 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::57) by DU7P251CA0025.outlook.office365.com
 (2603:10a6:10:551::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.15 via Frontend Transport; Sat,
 25 Oct 2025 03:18:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9253.7 via Frontend Transport; Sat, 25 Oct 2025 03:18:16 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Sat, 25 Oct 2025 05:18:13 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 324072E64
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 05:18:13 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id E9E811207A3; Sat, 25 Oct 2025 05:18:11 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 5/9] lvgl: Use Kconfig to configure
Date: Sat, 25 Oct 2025 05:17:44 +0200
Message-ID: <20251025031748.2728416-5-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025031748.2728416-1-pkj@axis.com>
References: <20251025031748.2728416-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|VI0PR02MB11115:EE_
X-MS-Office365-Filtering-Correlation-Id: c1f502b9-acaa-41cb-4f83-08de13752392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9chf+2M+tk9mlHP4pVh36WwXLiujdmMiJl3HhqLNtOE7EkuvW5/ek6CcXA9a?=
 =?us-ascii?Q?2n9+kqfsjxnw1T+EYxOWD24PB/EKdWHN7zbbxUjAb3HpoU1s3ByFAHSVTEFd?=
 =?us-ascii?Q?xG48Zi7GpPuNGpVU7sMSbnFwfiP12A6stP/GghWOYp9BHfm3HRHXPP8rkce4?=
 =?us-ascii?Q?xzp5TiR5fANcklicVtrsE974P0ogtGcPV2CVwcXLYNuuXtbUpRKr6csHbwJw?=
 =?us-ascii?Q?nq8KZ4EWX2V/q92SOkgTsq+HvubvLNs6cDpuKFdmgDW3dwdh+2xXTFejmyNN?=
 =?us-ascii?Q?kvWdyvEK+TaV0UraB/iAmz4RfeA5i8q3AfDF4o5Y4m9MzHE2v/sax5ZpeCXY?=
 =?us-ascii?Q?NOC3wx63iufjW1lZtMkF3BmcOrr/ceHC05a4tokhplcIWuTqe6qlMOHlfE0X?=
 =?us-ascii?Q?IjRwmBZWtqpYjk87juPVX4Yhq6frlFnWnm+dHF77QGT2r3UussnUh4He9Oi+?=
 =?us-ascii?Q?T3Pf9s6V6pefSL+K1wtH992PenQrbqi/Fe0hUa04tUB5mtwwgb1yzbtAgasw?=
 =?us-ascii?Q?3F0KUGeTuSD9Ah1Tp9+E7tjcAmtKIKJnjXuxr637nzo761oJb/vtO2/JDyCm?=
 =?us-ascii?Q?CNTPCAUswLimddJjxhe82j6LZZ7dhljonfh233H4gr3Ir/0F9gyFcGw27/++?=
 =?us-ascii?Q?v1NvUVsdxQ8AXHU2MC2W7LHrACc+/RnEUwA5KyRddm2Pf8OqjxS9zyuYMVON?=
 =?us-ascii?Q?oNUS422kioFTn0uPf/17x1laWZtp+lrudcMHocMx2/Jyh4MNdEHj4ivRxLQ0?=
 =?us-ascii?Q?8vOQCG7toOHfu940uef8ri2Ngp/mS8jXULapWSqk9gKKro/qGcONRZ35AxZn?=
 =?us-ascii?Q?Wj6IaD4swX5gZcBTl/SqNgLwjsubHKUJn+llBP9kN5DtBoVivjnMa0AaFyPe?=
 =?us-ascii?Q?XOxKyquyw7xKkt8/YC1QeU+eXiE8t7RNkBOfVbKrk3FqgkQPViBYTpDCnxXX?=
 =?us-ascii?Q?Uae17HTHOd12q5FBplcFRmfsnmiyY3LQwbkMMUI9qGgggCy21LshjeJuzrrP?=
 =?us-ascii?Q?7iS7UtIcJkevEohT0H5Lb29S/U9+4fUbIM9aN462W3B5cnJThNLYwtI9hZvd?=
 =?us-ascii?Q?TXdXSybeNb6M3H9Jk6El7SsmOPEW2aRjRjNDSMvKjsMg6SbgGiRyW7YqUi9i?=
 =?us-ascii?Q?FElU0/x6VgZC5Kuiwjd3NHH2KsCeSyLEFwvvZ7oX5PPM/kQQQ8Zx+sNPwcL+?=
 =?us-ascii?Q?pI6/R/1Sq7tMQgft+9c9/lgt/b5FzbYe3B/i6IrFdXlJwre9yycU0clW5AOB?=
 =?us-ascii?Q?028krAwjT/kBev4XONF0cRax4uZiorRAulX8nWgx+3ftI0bJPBjmI4E0ighF?=
 =?us-ascii?Q?oaTrEPqu2wNvIpx2d8TpuFAZ9STc3xyyhKm1cUH7h781fNVG2oPfPFPNMQxe?=
 =?us-ascii?Q?Qzvx4IjnSGNzuiorOp2EqEtuI1IzbgoFeMNBRZsieqH+MC77XYtwPN8XCBQd?=
 =?us-ascii?Q?UgTRhDNJdZ5pDJA7Z1TrtHUFZqUPkFF+UtsaRDmRuQWYPJpjzivQhQCiAH5/?=
 =?us-ascii?Q?eJqe8Cz1E1RXjd4SZx0yOjfcgSMuiwcNpYnNWcZOu41YSZsi7kh1YuqM/ItN?=
 =?us-ascii?Q?tqDlQwM4vTQnjKouLvU=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 03:18:16.1564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f502b9-acaa-41cb-4f83-08de13752392
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11115
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120983

This switches the recipe from manipulating the lv_conf.h file directly,
to instead using Kconfig to configure lvgl.

* Drop configuration of LV_TICK_CUSTOM* as they were removed in 9.0.0.
* Drop configuration options that match their defaults.

Co-authored-by: Adam x Nilsson <adam.x.nilsson@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-graphics/lvgl/files/debug.cfg |   3 +
 meta-oe/recipes-graphics/lvgl/files/defconfig |   1 +
 meta-oe/recipes-graphics/lvgl/files/drm.cfg   |   2 +
 meta-oe/recipes-graphics/lvgl/files/fbdev.cfg |   2 +
 .../recipes-graphics/lvgl/files/gridnav.cfg   |   1 +
 meta-oe/recipes-graphics/lvgl/files/sdl.cfg   |   3 +
 .../recipes-graphics/lvgl/files/thorvg.cfg    |   3 +
 meta-oe/recipes-graphics/lvgl/lv-conf.inc     | 106 +++++-------------
 8 files changed, 41 insertions(+), 80 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/debug.cfg
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/defconfig
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/drm.cfg
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/fbdev.cfg
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/gridnav.cfg
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/sdl.cfg
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/thorvg.cfg

diff --git a/meta-oe/recipes-graphics/lvgl/files/debug.cfg b/meta-oe/recipe=
s-graphics/lvgl/files/debug.cfg
new file mode 100644
index 0000000000..022375d4ae
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/debug.cfg
@@ -0,0 +1,3 @@
+CONFIG_LV_USE_ASSERT_STYLE=3Dy
+CONFIG_LV_USE_ASSERT_MEM_INTEGRITY=3Dy
+CONFIG_LV_USE_ASSERT_OBJ=3Dy
diff --git a/meta-oe/recipes-graphics/lvgl/files/defconfig b/meta-oe/recipe=
s-graphics/lvgl/files/defconfig
new file mode 100644
index 0000000000..1f42f11f7a
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/defconfig
@@ -0,0 +1 @@
+CONFIG_LV_COLOR_DEPTH_32=3Dy
diff --git a/meta-oe/recipes-graphics/lvgl/files/drm.cfg b/meta-oe/recipes-=
graphics/lvgl/files/drm.cfg
new file mode 100644
index 0000000000..c2387087f2
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/drm.cfg
@@ -0,0 +1,2 @@
+CONFIG_LV_USE_LINUX_DRM=3Dy
+CONFIG_LV_USE_EVDEV=3Dy
diff --git a/meta-oe/recipes-graphics/lvgl/files/fbdev.cfg b/meta-oe/recipe=
s-graphics/lvgl/files/fbdev.cfg
new file mode 100644
index 0000000000..4ba7f8f5ad
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/fbdev.cfg
@@ -0,0 +1,2 @@
+CONFIG_LV_USE_LINUX_FBDEV=3Dy
+CONFIG_LV_USE_EVDEV=3Dy
diff --git a/meta-oe/recipes-graphics/lvgl/files/gridnav.cfg b/meta-oe/reci=
pes-graphics/lvgl/files/gridnav.cfg
new file mode 100644
index 0000000000..02b80c3e57
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/gridnav.cfg
@@ -0,0 +1 @@
+CONFIG_LV_USE_GRIDNAV=3Dy
diff --git a/meta-oe/recipes-graphics/lvgl/files/sdl.cfg b/meta-oe/recipes-=
graphics/lvgl/files/sdl.cfg
new file mode 100644
index 0000000000..3ba28d7b01
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/sdl.cfg
@@ -0,0 +1,3 @@
+CONFIG_LV_USE_DRAW_SDL=3Dy
+CONFIG_LV_USE_SDL=3Dy
+CONFIG_LV_SDL_DOUBLE_BUFFER=3Dy
diff --git a/meta-oe/recipes-graphics/lvgl/files/thorvg.cfg b/meta-oe/recip=
es-graphics/lvgl/files/thorvg.cfg
new file mode 100644
index 0000000000..4dbffdfe09
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/files/thorvg.cfg
@@ -0,0 +1,3 @@
+CONFIG_LV_USE_VECTOR_GRAPHIC=3Dy
+CONFIG_LV_USE_LOTTIE=3Dy
+CONFIG_LV_USE_THORVG=3Dy
diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-gr=
aphics/lvgl/lv-conf.inc
index 7c16eb3936..ab3ad01a5a 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -1,3 +1,18 @@
+# SPDX-FileCopyrightText: Axis Communication AB <https://www.axis.com/>
+# SPDX-License-Identifier: MIT
+
+DEPENDS +=3D "python3-kconfiglib-native python3-pcpp-native"
+
+SRC_URI +=3D " \
+    file://defconfig \
+    ${@oe.utils.vartrue('DEBUG_BUILD', 'file://debug.cfg', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'drm', 'file://drm.cfg', '', d)}=
 \
+    ${@bb.utils.contains('PACKAGECONFIG', 'fbdev', 'file://fbdev.cfg', '',=
 d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gridnav', 'file://gridnav.cfg',=
 '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'sdl', 'file://sdl.cfg', '', d)}=
 \
+    ${@bb.utils.contains('PACKAGECONFIG', 'thorvg', 'file://thorvg.cfg', '=
', d)} \
+"
+
 PACKAGECONFIG ??=3D "drm"
=20
 PACKAGECONFIG[drm] =3D ",,libdrm libevdev"
@@ -6,6 +21,10 @@ PACKAGECONFIG[gridnav] =3D ",,"
 PACKAGECONFIG[thorvg] =3D ",,"
 PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2 libsdl2-image"
=20
+inherit python3native
+
+EXTRA_OECMAKE +=3D "-DLV_BUILD_USE_KCONFIG=3DON"
+
 # Add libdrm include if drm is selected in PACKAGECONFIG
 LVGL_FLAGS +=3D " \
     ${@bb.utils.contains('PACKAGECONFIG', 'drm', '-I${STAGING_INCDIR}/libd=
rm', '', d)} \
@@ -13,86 +32,13 @@ LVGL_FLAGS +=3D " \
 CFLAGS +=3D "${LVGL_FLAGS}"
 CXXFLAGS +=3D "${LVGL_FLAGS}"
=20
-LVGL_CONFIG_USE_DRM =3D "${@bb.utils.contains('PACKAGECONFIG', 'drm', '1',=
 '0', d)}"
-
-LVGL_CONFIG_USE_EVDEV =3D "${@bb.utils.contains_any('PACKAGECONFIG', 'drm =
fbdev', '1', '0', d)}"
-
-LVGL_CONFIG_USE_FBDEV =3D "${@bb.utils.contains('PACKAGECONFIG', 'fbdev', =
'1', '0', d)}"
-
-LVGL_CONFIG_USE_SDL =3D "${@bb.utils.contains('PACKAGECONFIG', 'sdl', '1',=
 '0', d)}"
-
-LVGL_CONFIG_SDL_FULLSCREEN ?=3D "0"
-
-LVGL_CONFIG_LV_MEM_CUSTOM ?=3D "0"
-LVGL_CONFIG_LV_MEM_SIZE ?=3D "(64 * 1024U)"
-LVGL_CONFIG_LV_COLOR_DEPTH ?=3D "32"
-
-LVGL_CONFIG_LV_USE_LOG    ?=3D "0"
-LVGL_CONFIG_LV_LOG_LEVEL  ?=3D "LV_LOG_LEVEL_WARN"
-LVGL_CONFIG_LV_LOG_PRINTF ?=3D "0"
-
-LVGL_CONFIG_LV_USE_FONT_COMPRESSED ?=3D "0"
-
-LVGL_CONFIG_LV_USE_GRIDNAV =3D "${@bb.utils.contains('PACKAGECONFIG', 'gri=
dnav', '1', '0', d)}"
-
-LVGL_CONFIG_LV_THEME_DEFAULT_DARK ?=3D "0"
-
-LVGL_CONFIG_USE_LOTTIE =3D "${@bb.utils.contains('PACKAGECONFIG', 'thorvg'=
, '1', '0', d)}"
-
-LVGL_CONFIG_USE_VECTOR_GRAPHICS =3D "${@bb.utils.contains('PACKAGECONFIG',=
 'thorvg', '1', '0', d)}"
-
-LVGL_CONFIG_USE_THORVG_INTERNAL =3D "${@bb.utils.contains('PACKAGECONFIG',=
 'thorvg', '1', '0', d)}"
-
-LVGL_CONFIG_USE_MATRIX =3D "${@bb.utils.contains('PACKAGECONFIG', 'thorvg'=
, '1', '0', d)}"
-
-LVGL_CONFIG_USE_FLOAT =3D "${@bb.utils.contains('PACKAGECONFIG', 'thorvg',=
 '1', '0', d)}"
-
-DEBUG_BUILD ??=3D "0"
+KCONFIG_CONFIG_ROOTDIR ?=3D "${S}"
+KCONFIG_FILE ?=3D "${KCONFIG_CONFIG_ROOTDIR}/Kconfig"
+export KCONFIG_CONFIG ?=3D "${KCONFIG_CONFIG_ROOTDIR}/.config"
=20
-do_configure:prepend() {
-    # If there is a configuration template, start from that
-    [ -r "${S}/lv_conf_template.h" ] && cp -Lv "${S}/lv_conf_template.h" "=
${S}/lv_conf.h"
+do_configure() {
+    cat ${UNPACKDIR}/defconfig ${@" ".join(find_cfgs(d))} > ${B}/defconfig
+    defconfig --kconfig ${KCONFIG_FILE} ${B}/defconfig
=20
-    sed -r -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 // Enab=
led by ${PN}|" \
-        \
-        -e "s|^([[:space:]]*#define LV_USE_LINUX_DRM[[:space:]]).*|\1${LVG=
L_CONFIG_USE_DRM}|" \
-        \
-        -e "s|^([[:space:]]*#define LV_USE_LINUX_FBDEV[[:space:]]).*|\1${L=
VGL_CONFIG_USE_FBDEV}|" \
-        \
-        -e "s|^([[:space:]]*#define LV_USE_SDL[[:space:]]).*|\1${LVGL_CONF=
IG_USE_SDL}|" \
-        -e "s|^([[:space:]]*#define LV_USE_DRAW_SDL[[:space:]]).*|\1${LVGL=
_CONFIG_USE_SDL}|" \
-        -e "s|^([[:space:]]*#define LV_SDL_BUF_COUNT[[:space:]]).*|\1 2|" =
\
-        -e "s|^([[:space:]]*#define LV_SDL_FULLSCREEN[[:space:]]).*|\1${LV=
GL_CONFIG_SDL_FULLSCREEN}|" \
-        \
-        -e "s|^([[:space:]]*#define LV_COLOR_DEPTH[[:space:]]).*|\1${LVGL_=
CONFIG_LV_COLOR_DEPTH}|" \
-        -e "s|^([[:space:]]*#define LV_MEM_CUSTOM[[:space:]]).*|\1${LVGL_C=
ONFIG_LV_MEM_CUSTOM}|" \
-        -e "s|^([[:space:]]*#define LV_MEM_SIZE[[:space:]]).*|\1${LVGL_CON=
FIG_LV_MEM_SIZE}|" \
-        \
-        -e "s|^([[:space:]]*#define LV_TICK_CUSTOM[[:space:]]).*|\1 1|" \
-        -e "s|^([[:space:]]*#define LV_TICK_CUSTOM_INCLUDE[[:space:]]).*|\=
1 <stdint.h>|" \
-        -e "s|^([[:space:]]*#define LV_TICK_CUSTOM_SYS_TIME_EXPR[[:space:]=
]).*|extern uint32_t custom_tick_get(void);\n\1 (custom_tick_get())|" \
-        \
-        -e "s|^([[:space:]]*#define LV_USE_EVDEV[[:space:]]).*|\1${LVGL_CO=
NFIG_USE_EVDEV}|" \
-        \
-        -e "s|^([[:space:]]*#define LV_USE_ASSERT_NULL[[:space:]]).*|\1${D=
EBUG_BUILD}|" \
-        -e "s|^([[:space:]]*#define LV_USE_ASSERT_MALLOC[[:space:]]).*|\1$=
{DEBUG_BUILD}|" \
-        -e "s|^([[:space:]]*#define LV_USE_ASSERT_STYLE[[:space:]]).*|\1${=
DEBUG_BUILD}|" \
-        -e "s|^([[:space:]]*#define LV_USE_ASSERT_MEM_INTEGRITY[[:space:]]=
).*|\1${DEBUG_BUILD}|" \
-        -e "s|^([[:space:]]*#define LV_USE_ASSERT_OBJ[[:space:]]).*|\1${DE=
BUG_BUILD}|" \
-        \
-        -e "s|^([[:space:]]*#define LV_USE_LOG[[:space:]]).*|\1${LVGL_CONF=
IG_LV_USE_LOG}|" \
-        -e "s|^([[:space:]]*#define LV_LOG_LEVEL[[:space:]]).*|\1${LVGL_CO=
NFIG_LV_LOG_LEVEL}|" \
-        -e "s|^([[:space:]]*#define LV_LOG_PRINTF[[:space:]]).*|\1${LVGL_C=
ONFIG_LV_LOG_PRINTF}|" \
-        \
-        -e "s|^([[:space:]]*#define LV_USE_FONT_COMPRESSED[[:space:]]).*|\=
1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|" \
-        -e "s|^([[:space:]]*#define LV_USE_GRIDNAV[[:space:]]).*|\1${LVGL_=
CONFIG_LV_USE_GRIDNAV}|" \
-        -e "s|^([[:space:]]*#define LV_THEME_DEFAULT_DARK[[:space:]]).*|\1=
${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|" \
-        \
-        -e "s|^([[:space:]]*#define LV_USE_VECTOR_GRAPHIC[[:space:]]).*|\1=
${LVGL_CONFIG_USE_VECTOR_GRAPHICS}|" \
-        -e "s|^([[:space:]]*#define LV_USE_THORVG_INTERNAL[[:space:]]).*|\=
1${LVGL_CONFIG_USE_THORVG_INTERNAL}|" \
-        -e "s|^([[:space:]]*#define LV_USE_MATRIX[[:space:]]).*|\1${LVGL_C=
ONFIG_USE_MATRIX}|" \
-        -e "s|^([[:space:]]*#define LV_USE_FLOAT[[:space:]]).*|\1${LVGL_CO=
NFIG_USE_FLOAT}|" \
-        \
-        -e "s|^([[:space:]]*#define LV_USE_LOTTIE[[:space:]]).*|\1${LVGL_C=
ONFIG_USE_LOTTIE}|" \
-        -i "${S}/lv_conf.h"
+    cmake_do_configure
 }

