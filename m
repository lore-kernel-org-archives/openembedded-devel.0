Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D2ACCF9F1
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:18:24 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.41])
 by mx.groups.io with SMTP id smtpd.web10.692.1761362300475797859
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=HpX0yUMK;
 spf=pass (domain: axis.com, ip: 52.101.84.41, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zv6TsZUI8yvoMbtBVjNwAh0+E/aod5wAN69AM9H48KD63Bjt+GU+96mrDusKztTd99aQmD6nmshG9lQKScr3r1ARHzcmRhQybYNtkRk/RveoFt5Wt3BY0yq/RQaeCA++2q4QTr1t8e2hpe9CaypprSzJO3yFhBf5gl66wMiC5l7Etv1BmtMD/AdYajAbqdbUHJ9q8JVpzzX/HU6JOu1ur0UlUMiRykSJ9s2VQoR0rvEKciktXxd4RIQ6SVxtTYCAg+ST7KEuEfuXQ+JooMNGA40q1wdAUdmJ8wlEnpEjd+3gRknjrUg77koR1IvzpSNk9wqun1OIgy9ZQELtdpY2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdaOPraREs8Z2NGJr69zsLGe0EN1aw/GhodTYGg5qaI=;
 b=XqzBSeYkfdGDjvt2SMnT5dXAoHWapQVq1aw4mVVcsD2gDoap8d6bPR924f8cbmxVew0CWPkixu4IJ3f25tnnVHlP8T6YYKbisZvi8zRXGwxZKzfve45h/l0DN+eOECLzRssF4K0cX3Hna/HZzs/Vs+qK41wmuYuf32rvJxHvVzFzWKsR5hl2kcVdAMroqfpssoIoIU/CBrnPk8z0pfVMH3oyKzpUayv77HPJw1zsf45J4RsBqwZ27bkWzD/c49vhwfLxAyrLruEjTKEE2ZPQz3LDtqJInG3LxnNY6jBHd9T3Imv0Xt4zhjvF8qBTJ15V0WjKJsjpkHejMKjNOxx1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdaOPraREs8Z2NGJr69zsLGe0EN1aw/GhodTYGg5qaI=;
 b=HpX0yUMK9U3/ZOIp5f2DmvRCFkbxwYHx2BRHFTv44zP8HMHUV1wfsqdtxdSdqvRIGGrD/oaFZUmz6ZzCfh0+VvhqSUJ7aH8RXGWJ+EfFs7vEt8+pae5eHpKF1rEb+/3l3HfMuKofaXuUzdf8TAQfST/0orHEIk34qGPM1AzqG/g=
Received: from DUZPR01CA0086.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::13) by AS2PR02MB9438.eurprd02.prod.outlook.com
 (2603:10a6:20b:59d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Sat, 25 Oct
 2025 03:18:15 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::c2) by DUZPR01CA0086.outlook.office365.com
 (2603:10a6:10:46a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.15 via Frontend Transport; Sat,
 25 Oct 2025 03:18:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9253.7 via Frontend Transport; Sat, 25 Oct 2025 03:18:15 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Sat, 25 Oct 2025 05:18:13 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 538FE2DE5
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 05:18:13 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id F1D801200DD; Sat, 25 Oct 2025 05:18:11 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 7/9] lvgl: Add support for modifying the configuration using menuconfig
Date: Sat, 25 Oct 2025 05:17:46 +0200
Message-ID: <20251025031748.2728416-7-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025031748.2728416-1-pkj@axis.com>
References: <20251025031748.2728416-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|AS2PR02MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: b456599f-c2e4-47fa-7800-08de1375234d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dGHWGwM3Nnq4Io4YurNLNk23/MvcEyN2/lix89hGaMYf+EU2jvSvoh5fmISg?=
 =?us-ascii?Q?wPuqmazYMyLRncXVpm67r0gM6eFsvpKdXwqDRLXIDwXYQ2nqGHeKqnh5PE4g?=
 =?us-ascii?Q?utcWFP5/lovtxMzAf+apfiOizXHnb9XrQLhihB+QiCf0Emve7kNPEbd0wsfz?=
 =?us-ascii?Q?hj6VqweT9AfWKjokCBD9shF3dw9jLsMlqKq1xOgB9mkEBaETR3Q5tmpaAFex?=
 =?us-ascii?Q?9qJM9NChhnBW3m+8GOv3j31ouQ2ZEwfKlQmyQqkY2fM36Fr0Kjc1ckZ/crIZ?=
 =?us-ascii?Q?7Ogwb6bGOWGtOchpUHo9lcTfxulH+4LBWMGUtMKEWzcHz93AimhnUUUUmVoP?=
 =?us-ascii?Q?ire//nVe/8/YMphTdjh5do0aKs+bVrpoLxQorEA2klLmjsS6cLnpDfxPmTNO?=
 =?us-ascii?Q?ECp5xkKMZePzChriM1J8Luz9CdyUeLttxrgNIs0iAopD4qVPDMayT5xSLTvR?=
 =?us-ascii?Q?HOU2mg7C07ei9YWOdmVt2Kq71StS3NxZcgrfZ1K5TlgPuHjbatvOMFLoQFIB?=
 =?us-ascii?Q?c39PnXXed5wYlIO5/4GMfpiUZFdtHBuO4pq6435b6VQjdt2RKN+0uXmvn3iQ?=
 =?us-ascii?Q?tllvKo00xvRhh6aDyaq+JazNIzpuYHNNeie0F2huoWA+sZwPbRucikrX1pAF?=
 =?us-ascii?Q?CYkUyjblCIkZv7gf6tmvwC3isMOjOSBAvpEE224aSWZm32c+rfOob8cDm9NX?=
 =?us-ascii?Q?AHHa4d0+zj6CXr8C9GHdmlYi+YsR20qUbjKFHvStOVXqBG+rOFkqKkxgvG/E?=
 =?us-ascii?Q?hpaeX8WQ8zAOuBKBRTBxGOht+CLKduzWUpoEjSvxAj8IdlrsZ7kqmQr5YeG/?=
 =?us-ascii?Q?jyJTewbEeCoZkBht+MQrTETY1eLFcfTpwyIfy7vdFZYCQqaUOm5pfasUxbl7?=
 =?us-ascii?Q?u2GHsrARBdQM1WSU3yaPKgp/8Tp+9N9griD1ld3PuLEj5agmQnzgLrdgJEXg?=
 =?us-ascii?Q?/anXj3fGBSYTGSCQfSi60obrrOq1ONx0uLUzwJqylzB/zYoyl4/LNqKknYRI?=
 =?us-ascii?Q?aw4okEWldvLqnkhPzE7Fu9htcq99f00WdL3UpuS+llIM4m8L86jDs4STmYYk?=
 =?us-ascii?Q?I+mNAL7053hScZVJYZaXiyu/hxh/A41RJ6C1xNB3HOVitQ0iHSnE5gsa7sah?=
 =?us-ascii?Q?y7FedkkuWU2R4TG1y4wXN8Sy9nIOtqVMEp3jp/EmG4rtSz/PcLyjgWRDydLw?=
 =?us-ascii?Q?99EaMr9bAI+WNRrA3Df8wUBsTdkF0RZz6kjsSz6GFQnjieF0YUj/v1xIgKSt?=
 =?us-ascii?Q?UjQ+rtRVWZdHn7nI92Q1C9vw91ZdFF+5BUfRK/Iu6Z01eh9bSOgpwoYl0ar3?=
 =?us-ascii?Q?4I4Sy9JuC8vwFQSnqFGpAaNrtJ4gJCMDoaQnV+I89ynN5eqwvLyhthY4yZyc?=
 =?us-ascii?Q?etTGtzqRRY2KKEg09Ilqtx7Ep+kKAcGBWr1u8JEaqrd6Qt7mOPueQskonxto?=
 =?us-ascii?Q?DriHwTzPKqxtnxZ3gyrt1uc/hFqVg5VMOGiTiPbde/E4JaArfymeT9mTj1rT?=
 =?us-ascii?Q?vYNaOvo3BRPR5GcfYvwCQ+rSUHhl3zEDupG3FidM6sJhB5H8ChYjPVMqqWmV?=
 =?us-ascii?Q?ygcFWDExwRg/WdHlooY=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 03:18:15.7015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b456599f-c2e4-47fa-7800-08de1375234d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9438
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120979

Generating a configuration fragment for a feature can now be done using:

  bitbake lvgl -c menuconfig && bitbake lvgl -c diffconfig

While this uses the standard cml1.bbclass, it expects that "make" is
used to run menuconfig etc. This is not true for lvgl, so unfortunately
the whole do_menuconfig() function had to be copied to be able to remove
the use of "make".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

I plan on updating cml1.bbclass so that it better supports code that
does not use "make" to run menuconfig, maybe even giving it native
support for kconfiglib. However, due to the current situation, I do not
expect any such changes to be accepted until after Whinlatter is out of
the door. Thus, the copied do_menuconfig in this recipe will have to do
as an interim solution.

 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 48 ++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-gr=
aphics/lvgl/lv-conf.inc
index ab3ad01a5a..cc8a2a16d9 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -21,7 +21,7 @@ PACKAGECONFIG[gridnav] =3D ",,"
 PACKAGECONFIG[thorvg] =3D ",,"
 PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2 libsdl2-image"
=20
-inherit python3native
+inherit cml1 python3native
=20
 EXTRA_OECMAKE +=3D "-DLV_BUILD_USE_KCONFIG=3DON"
=20
@@ -35,6 +35,7 @@ CXXFLAGS +=3D "${LVGL_FLAGS}"
 KCONFIG_CONFIG_ROOTDIR ?=3D "${S}"
 KCONFIG_FILE ?=3D "${KCONFIG_CONFIG_ROOTDIR}/Kconfig"
 export KCONFIG_CONFIG ?=3D "${KCONFIG_CONFIG_ROOTDIR}/.config"
+KCONFIG_CONFIG_COMMAND ?=3D "menuconfig ${KCONFIG_FILE}"
=20
 do_configure() {
     cat ${UNPACKDIR}/defconfig ${@" ".join(find_cfgs(d))} > ${B}/defconfig
@@ -42,3 +43,48 @@ do_configure() {
=20
     cmake_do_configure
 }
+
+# Copied from cml1.bbclass. The only modification is that
+# ${KCONFIG_CONFIG_COMMAND} is not prefixed with "make" when called by
+# oe_terminal.
+python do_menuconfig() {
+    import shutil
+
+    if not bb.utils.to_boolean(d.getVar("KCONFIG_CONFIG_ENABLE_MENUCONFIG"=
)):
+        bb.fatal("do_menuconfig is disabled, please check KCONFIG_CONFIG_E=
NABLE_MENUCONFIG variable.")
+        return
+
+    config =3D os.path.join(d.getVar('KCONFIG_CONFIG_ROOTDIR'), ".config")
+    configorig =3D os.path.join(d.getVar('KCONFIG_CONFIG_ROOTDIR'), ".conf=
ig.orig")
+
+    try:
+        mtime =3D os.path.getmtime(config)
+        shutil.copy(config, configorig)
+    except OSError:
+        mtime =3D 0
+
+    # setup native pkg-config variables (kconfig scripts call pkg-config d=
irectly, cannot generically be overriden to pkg-config-native)
+    d.setVar("PKG_CONFIG_DIR", "${STAGING_DIR_NATIVE}${libdir_native}/pkgc=
onfig")
+    d.setVar("PKG_CONFIG_PATH", "${PKG_CONFIG_DIR}:${STAGING_DATADIR_NATIV=
E}/pkgconfig")
+    d.setVar("PKG_CONFIG_LIBDIR", "${PKG_CONFIG_DIR}")
+    d.setVarFlag("PKG_CONFIG_SYSROOT_DIR", "unexport", "1")
+    # ensure that environment variables are overwritten with this tasks 'd=
' values
+    d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH PK=
G_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
+
+    oe_terminal("sh -c '%s; if [ $? -ne 0 ]; then echo \"Command failed.\"=
; printf \"Press any key to continue... \"; read r; fi'" % d.getVar('KCONFI=
G_CONFIG_COMMAND'),
+                d.getVar('PN') + ' Configuration', d)
+
+    try:
+        newmtime =3D os.path.getmtime(config)
+    except OSError:
+        newmtime =3D 0
+
+    if newmtime > mtime:
+        bb.plain("Changed configuration saved at:\n %s\nRecompile will be =
forced" % config)
+        bb.build.write_taint('do_compile', d)
+}
+
+do_savedefconfig() {
+    bbplain "Saving defconfig to:\n${B}/defconfig"
+    savedefconfig --kconfig ${KCONFIG_FILE} --out ${B}/defconfig
+}

