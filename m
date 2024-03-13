Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8486AC54E71
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 04:51:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.9066.1710305477936086254
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Mar 2024 21:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=OcAaniTn;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id EA1E787B7C;
	Wed, 13 Mar 2024 05:51:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710305476;
	bh=J4DjuYu0hKqlh/whKz8PBRmCKDOqx3N0ciuawFRFNaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OcAaniTnIm2fjyShi2Ur6ff+YSetq+BV6ebSK1xz19z0QjVrQmQja4Y9nLIYqk/Se
	 fufs4oSWKCQvK0gPlNivfmpTji9UYLDYkrQopuRI8HQtB7GVClNxEhy8ZcVZivSSO+
	 TLQtKMaxW9imSIa5OhJiv6yUjYx8euGtZBhz2VpfNU7oxriElpO422pq8mVWhuE+J1
	 FMvZyUSV+lNwrbSd+DX//bVLoPfDlPc3CjxK6J9xicyr/X/lCiRvwWuDOCw2eNplF/
	 UDrAScIelKnIboU3XJWnFv18P+ww6WvKZX7d+Wm4cjkt8e/y4ZmwUzd3Ey8dk08BFx
	 82mzOwMf7mhUA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 1/8] lvgl: Drop dialog-lvgl
Date: Wed, 13 Mar 2024 05:40:04 +0100
Message-ID: <20240313045038.90500-2-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313045038.90500-1-marex@denx.de>
References: <20240313045038.90500-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 04:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109281

This recipe is barely compatible with LVGL 8.3, the repository
seems to be unreachable now, drop the recipe.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 ...-wayland-Switch-to-custom-timer-tick.patch | 72 -------------------
 .../0002-wayland-Fix-callback-data-type.patch | 30 --------
 .../recipes-graphics/lvgl/dialog-lvgl_git.bb  | 31 --------
 3 files changed, 133 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/lvgl/dialog-lvgl/0001-waylan=
d-Switch-to-custom-timer-tick.patch
 delete mode 100644 meta-oe/recipes-graphics/lvgl/dialog-lvgl/0002-waylan=
d-Fix-callback-data-type.patch
 delete mode 100644 meta-oe/recipes-graphics/lvgl/dialog-lvgl_git.bb

diff --git a/meta-oe/recipes-graphics/lvgl/dialog-lvgl/0001-wayland-Switc=
h-to-custom-timer-tick.patch b/meta-oe/recipes-graphics/lvgl/dialog-lvgl/=
0001-wayland-Switch-to-custom-timer-tick.patch
deleted file mode 100644
index 5149002ff..000000000
--- a/meta-oe/recipes-graphics/lvgl/dialog-lvgl/0001-wayland-Switch-to-cu=
stom-timer-tick.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 1d92e1854c19c06c553243d29170bb4d1a9e3863 Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Tue, 9 May 2023 02:57:30 +0200
-Subject: [PATCH 1/2] wayland: Switch to custom timer tick
-
-The OE LVGL is configured to obtain timer tick from system timer
-instead of using ad-hoc mechanisms to emulate timer tick using
-threads or such. Use system timer to provide the tick.
-
-The tick handling implementation comes from:
-https://github.com/lvgl/lv_port_linux_frame_buffer.git
-as of commit adf2c4490e17a1b9ec1902cc412a24b3b8235c8e
-
-Upstream-Status: Inappropriate [Upstream repo is archived]
-Signed-off-by: Marek Vasut <marex@denx.de>
----
- src/drivers/wayland.c | 24 ++++++++++++++++--------
- 1 file changed, 16 insertions(+), 8 deletions(-)
-
-diff --git a/src/drivers/wayland.c b/src/drivers/wayland.c
-index 633dc18..bcebf4d 100644
---- a/src/drivers/wayland.c
-+++ b/src/drivers/wayland.c
-@@ -6,6 +6,7 @@
- #if defined(USE_WAYLAND) && USE_WAYLAND
-=20
- #include <pthread.h>
-+#include <sys/time.h>
- #include <unistd.h>
-=20
- #include <lv_drivers/wayland/wayland.h>
-@@ -18,13 +19,22 @@
- #define WAYLAND_VER_RES      320
- #endif
-=20
--static void * tick_thread(void * data)
-+uint32_t custom_tick_get(void)
- {
--    (void) data;
--    while(true) {
--        usleep(5 * 1000);
--        lv_tick_inc(5);
--    }
-+	static uint64_t start_ms =3D 0;
-+	if(start_ms =3D=3D 0) {
-+		struct timeval tv_start;
-+		gettimeofday(&tv_start, NULL);
-+		start_ms =3D (tv_start.tv_sec * 1000000 + tv_start.tv_usec) / 1000;
-+	}
-+
-+	struct timeval tv_now;
-+	gettimeofday(&tv_now, NULL);
-+	uint64_t now_ms;
-+	now_ms =3D (tv_now.tv_sec * 1000000 + tv_now.tv_usec) / 1000;
-+
-+	uint32_t time_ms =3D now_ms - start_ms;
-+	return time_ms;
- }
-=20
-=20
-@@ -47,8 +57,6 @@ void hal_init(void)
-=20
-     lv_group_t * g =3D lv_group_create();
-     lv_group_set_default(g);
--    static pthread_t hal_thread;
--    pthread_create(&hal_thread, NULL, tick_thread, NULL);
- }
-=20
- #endif
---=20
-2.39.2
-
diff --git a/meta-oe/recipes-graphics/lvgl/dialog-lvgl/0002-wayland-Fix-c=
allback-data-type.patch b/meta-oe/recipes-graphics/lvgl/dialog-lvgl/0002-=
wayland-Fix-callback-data-type.patch
deleted file mode 100644
index 8919a1a2a..000000000
--- a/meta-oe/recipes-graphics/lvgl/dialog-lvgl/0002-wayland-Fix-callback=
-data-type.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b7af695d79820adf53e7d612120bda12ed2886e2 Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Tue, 9 May 2023 02:57:38 +0200
-Subject: [PATCH 2/2] wayland: Fix callback data type
-
-The LVGL 8.3.y changed the callback data type, update it accordingly.
-
-Upstream-Status: Inappropriate [Upstream repo is archived]
-Signed-off-by: Marek Vasut <marex@denx.de>
----
- src/drivers/wayland.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/drivers/wayland.c b/src/drivers/wayland.c
-index bcebf4d..cfefa88 100644
---- a/src/drivers/wayland.c
-+++ b/src/drivers/wayland.c
-@@ -37,8 +37,7 @@ uint32_t custom_tick_get(void)
- 	return time_ms;
- }
-=20
--
--static lv_wayland_display_close_f_t close_cb()
-+static bool close_cb(lv_disp_t * disp)
- {
- }
-=20
---=20
-2.39.2
-
diff --git a/meta-oe/recipes-graphics/lvgl/dialog-lvgl_git.bb b/meta-oe/r=
ecipes-graphics/lvgl/dialog-lvgl_git.bb
deleted file mode 100644
index 139aa479b..000000000
--- a/meta-oe/recipes-graphics/lvgl/dialog-lvgl_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-# SPDX-FileCopyrightText: Huawei Inc.
-# SPDX-License-Identifier: MIT
-
-SRC_URI =3D "git://git.ostc-eu.org/rzr/dialog-lvgl;destsuffix=3D${S};pro=
tocol=3Dhttps;nobranch=3D1 \
-           file://0001-wayland-Switch-to-custom-timer-tick.patch \
-           file://0002-wayland-Fix-callback-data-type.patch \
-           "
-SRCREV =3D "cdf8d38acca87e871c3a488fd07f1e4779590f8e"
-
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8ce0a84e5276f01364119c873b712=
c4f"
-
-DEPENDS +=3D "lvgl"
-DEPENDS +=3D "lv-drivers"
-
-SUMMARY =3D "Basic UI utility to be used in scripts"
-DESCRIPTION =3D "Inspired by ncurses' dialog, implemented using LVGL"
-HOMEPAGE =3D "https://git.ostc-eu.org/rzr/dialog-lvgl/-/wikis/"
-
-REQUIRED_DISTRO_FEATURES =3D "wayland"
-
-inherit pkgconfig
-inherit features_check
-
-EXTRA_OEMAKE +=3D "sysroot=3D${RECIPE_SYSROOT}"
-EXTRA_OEMAKE +=3D "DESTDIR=3D${D}"
-EXTRA_OEMAKE +=3D "lvgl_driver=3Dwayland"
-
-do_install() {
-    oe_runmake install
-}
--=20
2.43.0


