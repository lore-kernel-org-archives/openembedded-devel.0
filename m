Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655BDC7EE25
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 01:59:39 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.3778.1683597571196654009
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 18:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=Lt1C6vXY;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2534E85FD2;
	Tue,  9 May 2023 03:59:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1683597568;
	bh=wpBzZOV3usWu4zTOKDgbYjBfyKormgmAxR8ESvnRhAE=;
	h=From:To:Cc:Subject:Date:From;
	b=Lt1C6vXYqezL1vM+kOpuKLqyi9UrX8kqQxcmrFkaqqT9a8pN4NL39Ep6kcJ2qb48D
	 PPJLrShzNvX2uFxvoQ6sj98PZwsKRZEkhCIK2GvyiLWxTYeTjMmARA3IWc6YSsiZeZ
	 B3HCmo5OwGPjGCl+JE665u0ehAo0xgFJyKz7IVfltriXrrhusI5bV1XzPMU2AqCTDa
	 IvoVgiORVNKQg+jU+n7WVhP9KOsvNhMW+GlAJhifDXqaSITyT6LfK8LkDIHYxNDRjQ
	 TVTtEPUhtPtouQnRNlOcWvs7Fqx5+6Ior9dPfKvHv2PBtOfiTnuI5y4s9LcI2q5Bg5
	 Q0dW/wy8Ak98A==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Philippe Coval <philippe.coval.ext@huawei.com>,
	Philippe Coval <philippe.coval@huawei.com>
Subject: [meta-oe][PATCH 1/3] lvgl: Upgrade dialog-lvgl to next/main version
Date: Tue,  9 May 2023 03:59:13 +0200
Message-Id: <20230509015915.77182-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 01:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102447

The dialog-lvgl has been unmaintained and stuck at LVGL v8.1.0 in
its now archived repository branch main. There is subsequent effort
in next/main branch which updates the code base to LVGL v8.2.0 that
is almost compatible enough to still build against LVGL v8.3.7.

Upgrade to this next/main branch which contains three additional
commits on top of the main branch, which implement the update to
newer LVGL. Add two more fixes to build against system timer provided
tick and another fix for WL callback data type. Since there is no
upstream, track the patches here for now.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Philippe Coval <philippe.coval.ext@huawei.com>
Cc: Philippe Coval <philippe.coval@huawei.com>
---
 ...-wayland-Switch-to-custom-timer-tick.patch | 72 +++++++++++++++++++
 .../0002-wayland-Fix-callback-data-type.patch | 30 ++++++++
 .../recipes-graphics/lvgl/dialog-lvgl_git.bb  |  7 +-
 3 files changed, 107 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/lvgl/dialog-lvgl/0001-waylan=
d-Switch-to-custom-timer-tick.patch
 create mode 100644 meta-oe/recipes-graphics/lvgl/dialog-lvgl/0002-waylan=
d-Fix-callback-data-type.patch

diff --git a/meta-oe/recipes-graphics/lvgl/dialog-lvgl/0001-wayland-Switc=
h-to-custom-timer-tick.patch b/meta-oe/recipes-graphics/lvgl/dialog-lvgl/=
0001-wayland-Switch-to-custom-timer-tick.patch
new file mode 100644
index 000000000..5149002ff
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/dialog-lvgl/0001-wayland-Switch-to-cu=
stom-timer-tick.patch
@@ -0,0 +1,72 @@
+From 1d92e1854c19c06c553243d29170bb4d1a9e3863 Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Tue, 9 May 2023 02:57:30 +0200
+Subject: [PATCH 1/2] wayland: Switch to custom timer tick
+
+The OE LVGL is configured to obtain timer tick from system timer
+instead of using ad-hoc mechanisms to emulate timer tick using
+threads or such. Use system timer to provide the tick.
+
+The tick handling implementation comes from:
+https://github.com/lvgl/lv_port_linux_frame_buffer.git
+as of commit adf2c4490e17a1b9ec1902cc412a24b3b8235c8e
+
+Upstream-Status: Inappropriate [Upstream repo is archived]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ src/drivers/wayland.c | 24 ++++++++++++++++--------
+ 1 file changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/src/drivers/wayland.c b/src/drivers/wayland.c
+index 633dc18..bcebf4d 100644
+--- a/src/drivers/wayland.c
++++ b/src/drivers/wayland.c
+@@ -6,6 +6,7 @@
+ #if defined(USE_WAYLAND) && USE_WAYLAND
+=20
+ #include <pthread.h>
++#include <sys/time.h>
+ #include <unistd.h>
+=20
+ #include <lv_drivers/wayland/wayland.h>
+@@ -18,13 +19,22 @@
+ #define WAYLAND_VER_RES      320
+ #endif
+=20
+-static void * tick_thread(void * data)
++uint32_t custom_tick_get(void)
+ {
+-    (void) data;
+-    while(true) {
+-        usleep(5 * 1000);
+-        lv_tick_inc(5);
+-    }
++	static uint64_t start_ms =3D 0;
++	if(start_ms =3D=3D 0) {
++		struct timeval tv_start;
++		gettimeofday(&tv_start, NULL);
++		start_ms =3D (tv_start.tv_sec * 1000000 + tv_start.tv_usec) / 1000;
++	}
++
++	struct timeval tv_now;
++	gettimeofday(&tv_now, NULL);
++	uint64_t now_ms;
++	now_ms =3D (tv_now.tv_sec * 1000000 + tv_now.tv_usec) / 1000;
++
++	uint32_t time_ms =3D now_ms - start_ms;
++	return time_ms;
+ }
+=20
+=20
+@@ -47,8 +57,6 @@ void hal_init(void)
+=20
+     lv_group_t * g =3D lv_group_create();
+     lv_group_set_default(g);
+-    static pthread_t hal_thread;
+-    pthread_create(&hal_thread, NULL, tick_thread, NULL);
+ }
+=20
+ #endif
+--=20
+2.39.2
+
diff --git a/meta-oe/recipes-graphics/lvgl/dialog-lvgl/0002-wayland-Fix-c=
allback-data-type.patch b/meta-oe/recipes-graphics/lvgl/dialog-lvgl/0002-=
wayland-Fix-callback-data-type.patch
new file mode 100644
index 000000000..8919a1a2a
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/dialog-lvgl/0002-wayland-Fix-callback=
-data-type.patch
@@ -0,0 +1,30 @@
+From b7af695d79820adf53e7d612120bda12ed2886e2 Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Tue, 9 May 2023 02:57:38 +0200
+Subject: [PATCH 2/2] wayland: Fix callback data type
+
+The LVGL 8.3.y changed the callback data type, update it accordingly.
+
+Upstream-Status: Inappropriate [Upstream repo is archived]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ src/drivers/wayland.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/drivers/wayland.c b/src/drivers/wayland.c
+index bcebf4d..cfefa88 100644
+--- a/src/drivers/wayland.c
++++ b/src/drivers/wayland.c
+@@ -37,8 +37,7 @@ uint32_t custom_tick_get(void)
+ 	return time_ms;
+ }
+=20
+-
+-static lv_wayland_display_close_f_t close_cb()
++static bool close_cb(lv_disp_t * disp)
+ {
+ }
+=20
+--=20
+2.39.2
+
diff --git a/meta-oe/recipes-graphics/lvgl/dialog-lvgl_git.bb b/meta-oe/r=
ecipes-graphics/lvgl/dialog-lvgl_git.bb
index 7e24c51f2..3f42fb978 100644
--- a/meta-oe/recipes-graphics/lvgl/dialog-lvgl_git.bb
+++ b/meta-oe/recipes-graphics/lvgl/dialog-lvgl_git.bb
@@ -1,8 +1,11 @@
 # SPDX-FileCopyrightText: Huawei Inc.
 # SPDX-License-Identifier: MIT
=20
-SRC_URI =3D "gitsm://git.ostc-eu.org/rzr/dialog-lvgl;destsuffix=3D${S};p=
rotocol=3Dhttps;nobranch=3D1"
-SRCREV =3D "5d2121457a6988c97cacb0790594440693fc3d29"
+SRC_URI =3D "git://git.ostc-eu.org/rzr/dialog-lvgl;destsuffix=3D${S};pro=
tocol=3Dhttps;nobranch=3D1 \
+          file://0001-wayland-Switch-to-custom-timer-tick.patch \
+          file://0002-wayland-Fix-callback-data-type.patch \
+          "
+SRCREV =3D "cdf8d38acca87e871c3a488fd07f1e4779590f8e"
=20
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8ce0a84e5276f01364119c873b712=
c4f"
--=20
2.39.2


