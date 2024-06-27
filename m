Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E63EC30653
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 08:53:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web10.3603.1719478399464022868
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 01:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=UxS+UW03;
 spf=pass (domain: arri.de, ip: 40.107.21.41, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzPpX7js6m1r2/92zDB6osTSmVgM8Y8GNBIHzt1z7FlLwrK1GYhdpvG7EHdr1/emmwlWU/EUG8GSlA4piSLOXsNTV6KuzC8oxcPanXf0NDTC3miI1PeJcskBwvikXiX4+I8ix8Ly2OMgwqz0dq1Q9XqFlU13J5XVk5iEgltVtDBfpF0wvQvhU5AbGxADJkUQtRz3+S9m2jjsWuBZ56Aea6Zd86fMFIf390JZfxiw5ibv3iPbJqMLvWjxxBabbXY9qkUqtQiqr3by4I8O6bgpsd1rv/7G1b/7MGEygDncJlU07yRhCZj2hMEar0nDuoFhrxT1O6T6s8fgHC5HEZMhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hefB+uB5HITsRc3BVIWRlupxqtN3x315hlblKC5EEjc=;
 b=HWEhb5ZO5sB8SIz1uQE85G7B2JG7Px/qppzVTfskw+g0EAG4mZjet1iW+MNDOFBFhW8WdU8gh3Wp7d7CIsIN+motET4nCJwK7blmRHobNtmF7DYtUvSYaqUP+KZ7+SW9BvBV9Tl4oGDlKTPwatGMql4jNzRla3dJGgrFWhD10cc4dM0x3E2Ho4DPlZM4/N7cKb9WQBRrM6F+TDNT9Mu5S4J0wVAaPqFY+O1jRgg2N5HeRP1HxYr6oBzq3WeKsrZ6CVUFkC/Soswddr+3k1BkMLTueAKOfEY2OVlT3db5xmt/BjLCEgXx54czze9Bf949XPQP1jYt1Y+Eu4qZ8iqJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hefB+uB5HITsRc3BVIWRlupxqtN3x315hlblKC5EEjc=;
 b=UxS+UW03cyEkjvfgMrXLyskSkGeJmpitgiG9OfYQJZUSaVtpY1W4M92v+hhpwqbBnYyd0Zlm2IndRCpD7CuY/Ex1iaHTmHcrsth6NEc4vyuGxSr20Yie7dBFexaJp53wsadjcH7hC+hoLlfElr6pyvhLKvi14P8lRPpU+eolEKE=
Received: from AM8P190CA0029.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::34)
 by DU0PR07MB9313.eurprd07.prod.outlook.com (2603:10a6:10:44e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.20; Thu, 27 Jun
 2024 08:53:13 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:20b:219:cafe::27) by AM8P190CA0029.outlook.office365.com
 (2603:10a6:20b:219::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Thu, 27 Jun 2024 08:53:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 08:53:11 +0000
Received: from N9W6SW14.arri.de (10.30.4.242) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 27 Jun
 2024 10:53:11 +0200
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Marek Vasut <marex@denx.de>, Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH 2/2] lvgl: update upstream-status of all patches
Date: Thu, 27 Jun 2024 10:52:56 +0200
Message-ID: <20240627085256.21526-2-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627085256.21526-1-ceggers@arri.de>
References: <20240627085256.21526-1-ceggers@arri.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.4.242]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|DU0PR07MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: 686399e8-26a0-474e-aba2-08dc968692e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?r7c4at/1GnuwM26isnGbvg+Cz3aA9S8UifGI9yiOFJXdg5XOa2vFX++Y41yR?=
 =?us-ascii?Q?MOEG01gBtPnIl3JkKsEt3DcYqk4WZUxjzdD1OGS/l91VXjoLlR/Lh74Jf5Y6?=
 =?us-ascii?Q?bSc4dlafP5cBtNiTrT7FVK4ffS08+t9O26XRIIa/zTir7umis/fW5lNu6II7?=
 =?us-ascii?Q?q65dCSlBIjIWWshPAAk5WgIVjwGd8u7LP1O0N5fnQggctq0CTLh2e921AcmT?=
 =?us-ascii?Q?wKeOWbQVPaDI8ykqiUFXwVeMvqK6pedi1flStVFIqTpGxrYcVUfz38kTA4yV?=
 =?us-ascii?Q?KhAxsOF5UkQrOiP4B41MrZ3WRFUhyyoOgBeEFLx0+lpgpaQFkQlthp37h7/C?=
 =?us-ascii?Q?vCp0r+2NZ5dfWiJfLoH6ZABRzCEd7iN20h56pprfOvIAwM3rSe8IYgwxBRij?=
 =?us-ascii?Q?IScVl+cxQ8lG3ZA/P3sVyPUNofysp+HrJBg03Qc7r8moZpFBBMOUmKqd1zsr?=
 =?us-ascii?Q?12VVZqYluSQRbDlTPsAfLMyHdCk5Q/bs5mElO8UZmbgxThQIdmzRtpUZGFJv?=
 =?us-ascii?Q?WvI6cJVhFY3PW5ujM+ttVeSRhzws6vbrRJ/mEKLJoZViDUf2dujQ+LriOlHb?=
 =?us-ascii?Q?FMByR93jHFm2uyPYbllP7VxLw5NmPKCcoBYTROvgzwsKywqON6Nvyt0RfwJk?=
 =?us-ascii?Q?Ey8YdDSJJmfjgeSNpKWY1DW5vE6qY0w4rqE9MAMHaLlYxl7brBVQAG6ho3Cf?=
 =?us-ascii?Q?HwgFiIjdKQqmkROLFTgTYpU3FPLWktYeAB/EmWIDutwTxPXhPZ/nw19tWRln?=
 =?us-ascii?Q?Kdc1zEhcWQV5iMJXQfFB/L0OmSP/rhDbI+y7RZ0F+jmZtLRYx73PlyotGBEv?=
 =?us-ascii?Q?z7Q+SSBi/6239bTF0i4MIs/6ijne7gD+TOvWb1KKUhWAqpoVP/YVbmqAYda1?=
 =?us-ascii?Q?pHvT8TW1fUMEodNF/pXxLHK4kbr6cABYbMZb9nQNiMJadLFmYheVzZqPmxxX?=
 =?us-ascii?Q?keMXbMrbYmJ28TPws+VVdJYKOkYUNG0NbEaFc4jnkoRGkQW9LKzxQ60CygRN?=
 =?us-ascii?Q?3KzXIXJ8Cq9jQJaS69wSNRdiqJsfaeJkht3BdHyjGWbuBQL+LNpZ4H0yjXL0?=
 =?us-ascii?Q?kthW76NOFGaJ9kecLrQInX7bpKQ08Q/DhlW2XY2Ms1oVs0xIKhzOOSBsS3KK?=
 =?us-ascii?Q?D+piFJcEPYz/UKtwMV1ubVoNotpI+s1Yk3emqJkhtOgphUTdOF46BUPL/dfD?=
 =?us-ascii?Q?p4kdbtZlwfWkS/XCxrIqtLCve8e4y/vOIaobPFqXdKSOnyJ5dMe8mMucGQrM?=
 =?us-ascii?Q?/hk51+GAaXTd+hET0pzTleRFBf1Nvvjw9DqoIBwlUX/r8lBtFrP4J4R03nNC?=
 =?us-ascii?Q?GYtRzsFITLJ4Q3p4omtlXb/gQegXxYpe+h+8a+8dOnyavn4FjJ1jg8axEYEk?=
 =?us-ascii?Q?d9DAYodc/x7rMpWMdaKgwYta0GQ2rAMFYM6vLsf+UZiobKlr8A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 08:53:11.3699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 686399e8-26a0-474e-aba2-08dc968692e4
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB9313
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 08:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111120

All patches have been integrated meanwhile and should appear in the next
release.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 ...2-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch | 2 +-
 ...3-Make-fbdev-device-node-runtime-configurable-via-envi.patch | 2 +-
 .../lvgl/files/0004-Factor-out-fbdev-initialization-code.patch  | 2 +-
 .../lvgl/files/0005-Add-DRM-KMS-example-support.patch           | 2 +-
 .../lvgl/files/0006-Add-SDL2-example-support.patch              | 2 +-
 .../0007-fix-cmake-generate-versioned-shared-libraries.patch    | 2 +-
 .../files/0008-fix-fbdev-set-resolution-prior-to-buffer.patch   | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/files/0002-fix-sdl-handle-both-L=
V_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch b/meta-oe/recipes-graphics/lvgl/files=
/0002-fix-sdl-handle-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch
index bd619b15721d..0bfc3f3e79ec 100644
--- a/meta-oe/recipes-graphics/lvgl/files/0002-fix-sdl-handle-both-LV_IMAGE=
_SRC_FILE-and-LV_IMAGE_S.patch
+++ b/meta-oe/recipes-graphics/lvgl/files/0002-fix-sdl-handle-both-LV_IMAGE=
_SRC_FILE-and-LV_IMAGE_S.patch
@@ -10,7 +10,7 @@ the case, e.g. the lv_demo_fb uses encoded images which a=
re of type
 LV_IMAGE_SRC_VARIABLE and instead of filename, come with a buffer of
 pixels. Handle the later using SDL_CreateRGBSurfaceFrom().
=20
-Upstream-Status: Submitted [https://github.com/lvgl/lvgl/pull/5852]
+Upstream-Status: Backport [b339e67581864b2fb6bb8897735a1e110c324ddc]
 Signed-off-by: Marek Vasut <marex@denx.de>
 ---
  src/draw/sdl/lv_draw_sdl.c | 30 +++++++++++++++++++++++++++---
diff --git a/meta-oe/recipes-graphics/lvgl/files/0003-Make-fbdev-device-nod=
e-runtime-configurable-via-envi.patch b/meta-oe/recipes-graphics/lvgl/files=
/0003-Make-fbdev-device-node-runtime-configurable-via-envi.patch
index 73c01cb5906a..7e542bcfbc0b 100644
--- a/meta-oe/recipes-graphics/lvgl/files/0003-Make-fbdev-device-node-runti=
me-configurable-via-envi.patch
+++ b/meta-oe/recipes-graphics/lvgl/files/0003-Make-fbdev-device-node-runti=
me-configurable-via-envi.patch
@@ -9,7 +9,7 @@ case it is, use it as the video card file in lv_linux_fbdev=
_set_file().
 Otherwise fall back to /dev/fb0, i.e. the current behavior. This way,
 it is possible to test LVGL on systems with multiple fbdev devices.
=20
-Upstream-Status: Submitted [https://github.com/lvgl/lv_port_linux_frame_bu=
ffer/pull/47]
+Upstream-Status: Backport [a0f03515bd7417a0d100058b133c3e8d69be9451]
 Signed-off-by: Marek Vasut <marex@denx.de>
 ---
  main.c | 8 +++++++-
diff --git a/meta-oe/recipes-graphics/lvgl/files/0004-Factor-out-fbdev-init=
ialization-code.patch b/meta-oe/recipes-graphics/lvgl/files/0004-Factor-out=
-fbdev-initialization-code.patch
index d24d150c066e..6843af0aabeb 100644
--- a/meta-oe/recipes-graphics/lvgl/files/0004-Factor-out-fbdev-initializat=
ion-code.patch
+++ b/meta-oe/recipes-graphics/lvgl/files/0004-Factor-out-fbdev-initializat=
ion-code.patch
@@ -8,7 +8,7 @@ around it, so it can be conditionally compiled in. This is =
done in
 preparation for addition of other backend initialization example
 code.
=20
-Upstream-Status: Submitted [https://github.com/lvgl/lv_port_linux_frame_bu=
ffer/pull/47]
+Upstream-Status: Backport [a0f03515bd7417a0d100058b133c3e8d69be9451]
 Signed-off-by: Marek Vasut <marex@denx.de>
 ---
  main.c | 18 ++++++++++++++----
diff --git a/meta-oe/recipes-graphics/lvgl/files/0005-Add-DRM-KMS-example-s=
upport.patch b/meta-oe/recipes-graphics/lvgl/files/0005-Add-DRM-KMS-example=
-support.patch
index 9ee7a7f19dda..2d2c4c60f1ac 100644
--- a/meta-oe/recipes-graphics/lvgl/files/0005-Add-DRM-KMS-example-support.=
patch
+++ b/meta-oe/recipes-graphics/lvgl/files/0005-Add-DRM-KMS-example-support.=
patch
@@ -13,7 +13,7 @@ To use DRM/KMS support, adjust lv_conf.h as follows:
 LV_USE_LINUX_FBDEV=3D0
 LV_USE_LINUX_DRM=3D1
=20
-Upstream-Status: Submitted [https://github.com/lvgl/lv_port_linux_frame_bu=
ffer/pull/47]
+Upstream-Status: Backport [a0f03515bd7417a0d100058b133c3e8d69be9451]
 Signed-off-by: Marek Vasut <marex@denx.de>
 ---
  CMakeLists.txt | 5 ++++-
diff --git a/meta-oe/recipes-graphics/lvgl/files/0006-Add-SDL2-example-supp=
ort.patch b/meta-oe/recipes-graphics/lvgl/files/0006-Add-SDL2-example-suppo=
rt.patch
index 691ee80b59aa..cfb6c6e817c5 100644
--- a/meta-oe/recipes-graphics/lvgl/files/0006-Add-SDL2-example-support.pat=
ch
+++ b/meta-oe/recipes-graphics/lvgl/files/0006-Add-SDL2-example-support.pat=
ch
@@ -22,7 +22,7 @@ LV_USE_LINUX_FBDEV=3D0
 LV_USE_LINUX_DRM=3D0
 LV_USE_SDL=3D1
=20
-Upstream-Status: Submitted [https://github.com/lvgl/lv_port_linux_frame_bu=
ffer/pull/47]
+Upstream-Status: Backport [a0f03515bd7417a0d100058b133c3e8d69be9451]
 Signed-off-by: Marek Vasut <marex@denx.de>
 ---
  CMakeLists.txt | 6 +++++-
diff --git a/meta-oe/recipes-graphics/lvgl/files/0007-fix-cmake-generate-ve=
rsioned-shared-libraries.patch b/meta-oe/recipes-graphics/lvgl/files/0007-f=
ix-cmake-generate-versioned-shared-libraries.patch
index 64468313a312..f5d39396fc5c 100644
--- a/meta-oe/recipes-graphics/lvgl/files/0007-fix-cmake-generate-versioned=
-shared-libraries.patch
+++ b/meta-oe/recipes-graphics/lvgl/files/0007-fix-cmake-generate-versioned=
-shared-libraries.patch
@@ -10,7 +10,7 @@ to make cmake add the version suffix to generated shared =
libraries. That
 changes the filename to liblvgl.so.9.1.0 and includes symlink with major
 ABI version, i.e. liblvgl.so.9 .
=20
-Upstream-Status: Submitted [https://github.com/lvgl/lvgl/pull/5865]
+Upstream-Status: Backport [2c469279f53f9dee63d71295c6058749bc87ce73]
 Signed-off-by: Marek Vasut <marex@denx.de>
 ---
  env_support/cmake/custom.cmake | 11 +++++++++++
diff --git a/meta-oe/recipes-graphics/lvgl/files/0008-fix-fbdev-set-resolut=
ion-prior-to-buffer.patch b/meta-oe/recipes-graphics/lvgl/files/0008-fix-fb=
dev-set-resolution-prior-to-buffer.patch
index 449db53dfbf0..5cafb41d563f 100644
--- a/meta-oe/recipes-graphics/lvgl/files/0008-fix-fbdev-set-resolution-pri=
or-to-buffer.patch
+++ b/meta-oe/recipes-graphics/lvgl/files/0008-fix-fbdev-set-resolution-pri=
or-to-buffer.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] fix(fbdev): set resolution prior to buffer
 Otherwise it ends up with using the default value 800x480 and may fail
 at lv_display_set_buffers due to incorrect resolution.
=20
-Upstream-Status: Submitted [https://github.com/lvgl/lvgl/pull/6004]
+Upstream-Status: Backport [29662d1c357c15135d076a2a924b9ef056c82120]
 Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
 ---
=20
--=20
2.43.0


