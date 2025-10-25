Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C183DCCF9E0
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:18:23 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.38])
 by mx.groups.io with SMTP id smtpd.web11.734.1761362300907972705
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=H5e1QzDU;
 spf=pass (domain: axis.com, ip: 52.101.72.38, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxKx/BF38puBaX6XyEYnes35E0j3UkHQY7lQ4fkZQVc3Kbsan0t9/g0v42qySyOVk4JRNVD8ONtk29U3fboMz3EZ6Q7BQTUmOufvqLVUpjSy7rsGlbv7CG9pzmZUi+jmdlhmckHP9kSSywbANOltrMAbtmszzzDkKrOh5VvwR8cwdQqpM0GEDFApHPiQHWysGCfosFSy/wwmf0uAqY1iCfM47dQNkvghREWkkOkVSpJZCIUxb0K+3s+7kBWftafBtO06S2LQBYBZyEumJiijPOTudyvUZ8HSDO+dIu4Hrx+kTdV330nIXnmjROxkJ7UEPfHm3bpwH78tAwPlNLVUyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAzuWVRF3Emz8Ko0Qoi+xRVX/NGEh5mnPk3rReCWRsU=;
 b=Pdnl1Vbfpa8siZlbDahWbrFSGINuDrsMYBqXvdHJdp4f/Gcaxh8rB3y/Gt1CoNYETF3bfRKPMmqg8JWj72sjJJ5HHViSAmKo6wx0QXzsow7N2jDR0ZjGfDgchSDMmpH0NLSw1FQ/MD6dYF/C4KXaB+N6Y4MHdqj4WUEN0Wc+6D1CbSoUab+i/zhkesRn58IfhvI8fK7MgGgs62+L+HrT0lNfUOvHWoMRC+xjLyG2Mj+l0kne3yBfd4Mzkiq4S4v2G/wNIq5CC4isWKmqf1e9t7oNNQoeps89Wf0HO/aUrkaHPwOZpof4JGy+VitwEQXwIx9TvLgK5i5WidOHd8V15A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAzuWVRF3Emz8Ko0Qoi+xRVX/NGEh5mnPk3rReCWRsU=;
 b=H5e1QzDU/Q0KQJKtDYjvJgmFxTiFoyp9Gqj89qEtjJ0d55CxCzcBfNDdnS5z6A5VRmGZKzWWcwSgHcxcPBKP2+KRb1zt4PiHh47O7lRU1Ft0b+kPVgo0r1jDghnWktZi3vq2Kl56Dx7smNX+lM1d9c0LNuzwsok8Z9bE4AzXHGY=
Received: from DUZPR01CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::14) by DB4PR02MB9455.eurprd02.prod.outlook.com
 (2603:10a6:10:3f8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 03:18:14 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::4e) by DUZPR01CA0088.outlook.office365.com
 (2603:10a6:10:46a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.15 via Frontend Transport; Sat,
 25 Oct 2025 03:18:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9253.7 via Frontend Transport; Sat, 25 Oct 2025 03:18:13 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Sat, 25 Oct 2025 05:18:13 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 2F77C2E05
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 05:18:13 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id E4EBC122963; Sat, 25 Oct 2025 05:18:11 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 4/9] lvgl-demo-fb: Update to 9.4.0
Date: Sat, 25 Oct 2025 05:17:43 +0200
Message-ID: <20251025031748.2728416-4-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025031748.2728416-1-pkj@axis.com>
References: <20251025031748.2728416-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008860:EE_|DB4PR02MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cdfbb12-3daf-4729-8f6d-08de13752219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ewGKPRFoM7w2EmTrpt6xnpsN0hYxFiaThRpecTIVwU2716oRh3nKhJRFqJFS?=
 =?us-ascii?Q?foIeqqjh1KhgcHwWRJObvIX88CayClOzs7flxe8706JdV5RkgTrHqojOMX+F?=
 =?us-ascii?Q?s48w/S4bnwaQkb3Jo3BTP/63dtGLJQmheQ//4AtmPckEQOi7L4wpQwuDkK40?=
 =?us-ascii?Q?2xRaEFk3P/W6msb4773nM/nKtVrr+Wzrl8ilS99yDnMlhjaJRiA44WmAKvzP?=
 =?us-ascii?Q?5tVYQ1ml5EZdgGLEl44gFAl2OY+alW82dh530pG8ZUzJMppD15iTrz7zyrRw?=
 =?us-ascii?Q?LvL57oEGEH1oP5N0a5w86Vsz8TbNBDZKfyWWt14DlvqDdcqmwRnLhWF4bWkB?=
 =?us-ascii?Q?Ek0AbyeN1/CbBLxDp4anUIirTxbNrjRUgwUYEMqJmHqxHBLSrtP0bffMx24t?=
 =?us-ascii?Q?EB/c/RIRJq23Gt4FQB/HxlzfV+ePWW+33QZRVmqM9VjboW8hIwhfllf5pSc1?=
 =?us-ascii?Q?8VvBxnCCg+Oct/IU+1XwQlgZcIH5SoeuT7JDiWF/Lw+b/E22whfQwcQpTqfw?=
 =?us-ascii?Q?xm7UrNtnbaPD2GUrdyNFWJhE40V5HKFjYeJo1AAaYZX+vJVplPPW3o+GaAP3?=
 =?us-ascii?Q?MZqx4l0JqvcPZ19D6qgRmDHt2C5D6K1M8SfTjJ28pdgibEKR8CvwWTQFcFXe?=
 =?us-ascii?Q?i4wcA4xWrVw3mCiNlRy7rjRORS5CMU38ey3WF7ddUCocCucuvUeHPsdkgF1V?=
 =?us-ascii?Q?lQ6C/+6DywSHbiDMkOMfElXDoIIEW0cHGrH6RoJkUxQZMODmdOXdnAk7DsUZ?=
 =?us-ascii?Q?ZS3xXwmJIVUk4hzp4zHx6QnQ6KM3dUB3CUL8wKH0/H+eNPST/bMrKTjMO0B6?=
 =?us-ascii?Q?TacKl2BzlrAzz7TMEoyn7h7VybY3+gqumR3HRcQ3UHmPnXGT7uUjVz2BWoKN?=
 =?us-ascii?Q?ovYD2ZTSUb5JIMfpFcwl31XiqZw3AIzm9HMbsOhVB8a9ebInG8/4EFm8wi7x?=
 =?us-ascii?Q?9CGDrKceXG/ncEAY6ujJvWMeGlq7tdW42JGP/zWuCQQ0n32qy4OqKvbiWQr4?=
 =?us-ascii?Q?QGfgoJP6TPqfilA8IINQs7H5AtNJJZwAkSgHWIgb+1kGnMPYHHb7qIuWyzXP?=
 =?us-ascii?Q?5iVvBczlK8lvPyqY3kqYM5hDIEK9Pm6uQyjW55pyJ3KdAERLu0M1Nze4raIn?=
 =?us-ascii?Q?Wm9frTBnuO2AmbEzIbiWMe26O09bf79UfIAqd33X92EAfYnmOtbPM8ColEyJ?=
 =?us-ascii?Q?YmRLATCUaJLgMddgXlKINiQnx0gco2r3Ya6yLtUmmUvCcwMwUMBY/SMqRtrx?=
 =?us-ascii?Q?IlFGGj3VpPn4BkZf2WbEeRj5XY1P1n+BVFsoTChBAO+VOAdCqjTqlzNaeUhl?=
 =?us-ascii?Q?QyoB9w13wICDJaJXbimg5x6Op9RMg1umQ2pMugl7gEa1grN9W0O9rI3SCExB?=
 =?us-ascii?Q?4DY42gmT+GAqrs0v5njWyMzU/iYJRr8lLpV8a3flhMmFrKIUAfdceTg5vtdU?=
 =?us-ascii?Q?VmmB/EH3+AhOOxw+e8TjY/c4oh7yGM2XWodxjwGL8FOgc4h5xgrqZOeidaf+?=
 =?us-ascii?Q?8Bh7g2RJGgIiFFJebwIHwuG9j44BYqETJnrSnvoKfJkK1kyc/Phd3tFsbouE?=
 =?us-ascii?Q?Kq024+eYjSLIQxbWQ8Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 03:18:13.6823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdfbb12-3daf-4729-8f6d-08de13752219
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB9455
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120981

* Add +git to PV since there is no v9.4.0 tag for the
  lv_port_linux_frame_buffer repository.
* Do not run the default do_install() as it will install all of lvgl.
* Remove the hack in do_configure:prepend() for SDL2_image as cmake
  (with a little help from pkg-config) now finds SDL2_image correctly.

License-Update: Copyright year updated to 2025
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../0001-thorvg-fix-build-with-gcc-15.patch   | 32 ----------------
 meta-oe/recipes-graphics/lvgl/lv-conf.inc     |  4 +-
 .../lvgl/lvgl-demo-fb_9.2.2.bb                | 38 -------------------
 .../lvgl/lvgl-demo-fb_9.4.0.bb                | 33 ++++++++++++++++
 4 files changed, 35 insertions(+), 72 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/lvgl/files/0001-thorvg-fix-bui=
ld-with-gcc-15.patch
 delete mode 100644 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
 create mode 100644 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb

diff --git a/meta-oe/recipes-graphics/lvgl/files/0001-thorvg-fix-build-with=
-gcc-15.patch b/meta-oe/recipes-graphics/lvgl/files/0001-thorvg-fix-build-w=
ith-gcc-15.patch
deleted file mode 100644
index e61b5224aa..0000000000
--- a/meta-oe/recipes-graphics/lvgl/files/0001-thorvg-fix-build-with-gcc-15=
.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a9e41f7e9590c757e74877cace6442dd676223ff Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Fri, 21 Mar 2025 10:25:43 +0000
-Subject: [PATCH] thorvg: fix build with gcc-15
-
-* add missing include to fix:
-  src/libs/thorvg/thorvg.h:357:20: error: 'uint8_t' has not been declared
-  357 |     Result opacity(uint8_t o) noexcept;
-      |                    ^~~~~~~
-
-* not needed with latest master where it was resolved differently in
-  fc5c15638 feat(thorvg): use LVGL's malloc/realloc/zalloc/free (#7772)
-  which includes stdlib/lv_string.h which includes misc/lv_types.h which
-  includes stdint
-
-Upstream-Status: Pending [not needed with latest master where it was resol=
ved differently in fc5c15638 feat(thorvg): use LVGL's malloc/realloc/zalloc=
/free (#7772)]
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- src/libs/thorvg/thorvg.h | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/src/libs/thorvg/thorvg.h
-+++ b/src/libs/thorvg/thorvg.h
-@@ -12,6 +12,7 @@
- #define TVG_BUILD 1
-=20
-=20
-+#include <cstdint>
- #include <functional>
- #include <memory>
- #include <string>
diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-gr=
aphics/lvgl/lv-conf.inc
index d341c8a6da..7c16eb3936 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -1,7 +1,7 @@
 PACKAGECONFIG ??=3D "drm"
=20
-PACKAGECONFIG[drm] =3D ",,libdrm"
-PACKAGECONFIG[fbdev] =3D ",,"
+PACKAGECONFIG[drm] =3D ",,libdrm libevdev"
+PACKAGECONFIG[fbdev] =3D ",,libevdev"
 PACKAGECONFIG[gridnav] =3D ",,"
 PACKAGECONFIG[thorvg] =3D ",,"
 PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2 libsdl2-image"
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb b/meta-oe/=
recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
deleted file mode 100644
index ede5c16f3f..0000000000
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.2.2.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY =3D "LVGL Demo Application for Framebuffer"
-HOMEPAGE =3D "https://github.com/lvgl/lv_port_linux_frame_buffer"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D802d3d83ae80ef5f343050bf96cce3a=
4 \
-                    file://lvgl/LICENCE.txt;md5=3Dbf1198c89ae87f043108cea6=
2460b03a"
-
-SRC_URI =3D "\
-	git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=3Dhttps;bra=
nch=3Drelease/v9.2;name=3Ddemo \
-	git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Drelease/v9.2;name=3D=
lvgl;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/lvgl \
-	file://0001-thorvg-fix-build-with-gcc-15.patch;patchdir=3Dlvgl \
-	"
-SRCREV_demo =3D "c924e24c7aa55317521bcd9dd75ce9337508f5a5"
-SRCREV_lvgl =3D "7f07a129e8d77f4984fff8e623fd5be18ff42e74"
-SRCREV_FORMAT =3D "demo_lvgl"
-
-EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
-
-LVGL_CONFIG_DRM_CARD ?=3D "/dev/dri/card0"
-LVGL_CONFIG_LV_USE_LOG    =3D "1"
-LVGL_CONFIG_LV_LOG_PRINTF =3D "1"
-LVGL_CONFIG_LV_MEM_SIZE =3D "(256 * 1024U)"
-LVGL_CONFIG_LV_USE_FONT_COMPRESSED =3D "1"
-require lv-conf.inc
-
-inherit cmake
-
-
-do_configure:prepend() {
-	if [ "${LVGL_CONFIG_USE_SDL}" -eq 1 ] ; then
-		# Add libsdl build dependency, SDL2_image has no cmake file
-		sed -i '/^target_link_libraries/ s@pthread@& SDL2_image@' "${S}/CMakeLis=
ts.txt"
-	fi
-}
-
-do_install:append() {
-	install -d ${D}${bindir}
-	install -m 0755 ${S}/bin/main ${D}${bindir}/lvgl
-}
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb b/meta-oe/=
recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb
new file mode 100644
index 0000000000..3185d37c5c
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "LVGL Demo Application for Framebuffer"
+HOMEPAGE =3D "https://github.com/lvgl/lv_port_linux_frame_buffer"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D802d3d83ae80ef5f343050bf96cce3a=
4 \
+                    file://lvgl/LICENCE.txt;md5=3D4570b6241b4fced1d1d18eb6=
91a0e083"
+
+DEPENDS =3D "python3-pcpp-native"
+
+PV .=3D "+git"
+
+SRC_URI =3D "\
+    git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=3Dhttps;=
branch=3Drelease/v9.4;name=3Ddemo \
+    git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Drelease/v9.4;tag=
=3Dv9.4.0;name=3Dlvgl;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/lvgl \
+"
+
+SRCREV_demo =3D "71050624acd8a52ab7d365d0d12acf9bf5fe41db"
+SRCREV_lvgl =3D "c016f72d4c125098287be5e83c0f1abed4706ee5"
+SRCREV_FORMAT =3D "demo_lvgl"
+
+inherit cmake pkgconfig
+
+LVGL_CONFIG_DRM_CARD ?=3D "/dev/dri/card0"
+LVGL_CONFIG_LV_USE_LOG    =3D "1"
+LVGL_CONFIG_LV_LOG_PRINTF =3D "1"
+LVGL_CONFIG_LV_MEM_SIZE =3D "(256 * 1024U)"
+LVGL_CONFIG_LV_USE_FONT_COMPRESSED =3D "1"
+require lv-conf.inc
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/bin/lvglsim ${D}${bindir}
+}

