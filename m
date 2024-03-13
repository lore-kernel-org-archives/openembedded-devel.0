Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C551C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 04:51:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.9106.1710305478037159234
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Mar 2024 21:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=d0XMZlKW;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5048E87DAF;
	Wed, 13 Mar 2024 05:51:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710305476;
	bh=TWN92u5Qt6Uw+9lr4I73Auh1HTrcVa+lGE17lbl3lBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d0XMZlKWFgxLr/SISY/nl4Ie/bHJAQrRoKMAKnkyEIs6QeNUSPHI7J44Z+hX8FGdR
	 QJ1Cze3BSh/MrUs0Rat3Zr6HfaEa49+fSx5u+LYLpHgnAMDAj99C1WkSwr8n8CQ2Pe
	 gcfhzXMVZfUvDDjVddAZq2SXYIaOxInZCG499htvC7a5Yk4DoXfEJdF5sSD8qqKiBm
	 HoOZDvCnTcDLeQE+nFd0AmD3FW9Y02fLWkspH41hGeYzW/fZu9kCD0lC/vtnEllw7P
	 NC2Sr8p7bmPvnguhIz4jZpcvQbMYR6iQEKAU+zOGHDTZYGd6iiPZ2KRz59De16b/iZ
	 B7uF6YzAG0ULQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 2/8] lvgl: Upgrade to LVGL 9 series
Date: Wed, 13 Mar 2024 05:40:05 +0100
Message-ID: <20240313045038.90500-3-marex@denx.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109282

Upgrade LVGL and matching recipes to LVGL 9 series. Use latest git HEAD
instead of 9.0.0 release to pull in fixes which landed after the 9.0.0
release and which are of interest to Linux deployments.

There are significant breaking changes, which are listed below.

The lv-drivers and lv-lib-png PNG library seem to be part of the main LVG=
L
repository, drop the now unnecessary recipes.

Configuration is now done in lv_conf.h only, there is no more lv_drv_conf=
.h,
rework lv-drivers.inc accordingly. USE_SDL_GPU support has been renamed t=
o
LV_USE_DRAW_SDL and newly depends on libsdl2-image, SDL_DOUBLE_BUFFERED t=
o
LV_SDL_BUF_COUNT=3D2 .

All configuration options from lvgl_%.bb, LV_COLOR_DEPTH, LV_MEM_CUSTOM a=
s
well as LV_TICK_CUSTOM, LV_TICK_CUSTOM_INCLUDE, LV_TICK_CUSTOM_SYS_TIME_E=
X
are all moved into lv-drivers.inc , so the configuration is done in one
place, using the same set of configuration options.

Wayland support is gone, drop it from lv-drivers.inc. Evdev input device
selection via EVDEV_NAME is also gone, the selection is now done using
API call lv_evdev_create(). DRM card selection via DRM_CARD is also gone,
the selection is now done using API call lv_linux_drm_set_file(). Move
LVGL_CONFIG_DRM_CARD into lvgl-demo-fb, which calls lv_linux_drm_set_file=
().

The lvgl-demo-fb recipe is adjusted to be compatible with LVGL 9 again,
this makes some of the sed adjustments really awful, so this part will
be replaced by upstream patches in a separate commit to avoid growing
this commit even more.

The lvgl-demo-fb recipe is also no longer using git submodules, but
instead fetches both its source and LVGL using git fetcher separately.
This is needed to build the SDL backend successfully, which requires
newer LVGL than what the repository points to via its submodule.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-drivers.inc  | 40 +++++++--------
 .../recipes-graphics/lvgl/lv-drivers_8.3.0.bb | 28 -----------
 .../recipes-graphics/lvgl/lv-lib-png_8.0.2.bb | 31 ------------
 .../lvgl/lvgl-demo-fb_8.3.0.bb                | 46 -----------------
 .../lvgl/lvgl-demo-fb_9.0.0.bb                | 49 +++++++++++++++++++
 meta-oe/recipes-graphics/lvgl/lvgl_8.3.11.bb  | 44 -----------------
 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb   | 28 +++++++++++
 7 files changed, 95 insertions(+), 171 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
 delete mode 100644 meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
 delete mode 100644 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
 create mode 100644 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
 delete mode 100644 meta-oe/recipes-graphics/lvgl/lvgl_8.3.11.bb
 create mode 100644 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb

diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers.inc b/meta-oe/recip=
es-graphics/lvgl/lv-drivers.inc
index 6cfb7fa07..97063adbc 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-drivers.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-drivers.inc
@@ -1,21 +1,17 @@
 PACKAGECONFIG[drm] =3D ",,libdrm"
 PACKAGECONFIG[fbdev] =3D ",,"
-PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2"
-PACKAGECONFIG[wayland] =3D ",,libxkbcommon wayland"
+PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2 libsdl2-image"
=20
 LVGL_CONFIG_USE_DRM =3D "${@bb.utils.contains('PACKAGECONFIG', 'drm', '1=
', '0', d)}"
-LVGL_CONFIG_DRM_CARD ?=3D "/dev/dri/card0"
=20
 LVGL_CONFIG_USE_EVDEV =3D "${@bb.utils.contains_any('PACKAGECONFIG', 'dr=
m fbdev', '1', '0', d)}"
-LVGL_CONFIG_EVDEV_INPUT ?=3D "/dev/input/touchscreen"
=20
 LVGL_CONFIG_USE_FBDEV =3D "${@bb.utils.contains('PACKAGECONFIG', 'fbdev'=
, '1', '0', d)}"
=20
 LVGL_CONFIG_USE_SDL =3D "${@bb.utils.contains('PACKAGECONFIG', 'sdl', '1=
', '0', d)}"
=20
-LVGL_CONFIG_USE_WAYLAND =3D "${@bb.utils.contains('PACKAGECONFIG', 'wayl=
and', '1', '0', d)}"
-LVGL_CONFIG_WAYLAND_HOR_RES ?=3D "480"
-LVGL_CONFIG_WAYLAND_VER_RES ?=3D "320"
+LVGL_CONFIG_LV_MEM_CUSTOM ?=3D "0"
+LVGL_CONFIG_LV_COLOR_DEPTH ?=3D "32"
=20
 ALLOW_EMPTY:${PN} =3D "1"
=20
@@ -23,26 +19,26 @@ EXTRA_OECMAKE +=3D "-Dinstall:BOOL=3DON -DLIB_INSTALL=
_DIR=3D${baselib}"
=20
 do_configure:append() {
     # If there is a configuration template, start from that
-    [ -r "${S}/lv_drv_conf_template.h" ] && cp -Lv "${S}/lv_drv_conf_tem=
plate.h" "${S}/lv_drv_conf.h"
+    [ -r "${S}/lv_conf_template.h" ] && cp -Lv "${S}/lv_conf_template.h"=
 "${S}/lv_conf.h"
=20
-    # Configure the software using sed
     sed -e "s|#if 0 .*Set it to \"1\" to enable the content.*|#if 1 // E=
nabled by ${PN}|g" \
         \
-        -e "s|\(^#  define USE_DRM \).*|#  define USE_DRM ${LVGL_CONFIG_=
USE_DRM}|g" \
-        -e "s|\(^#  define DRM_CARD \).*|#  define DRM_CARD \"${LVGL_CON=
FIG_DRM_CARD}\"|g" \
-	\
-        -e "s|\(^#  define USE_EVDEV \).*|#  define USE_EVDEV ${LVGL_CON=
FIG_USE_EVDEV}|g" \
-        -e "s|\(^#  define EVDEV_NAME \).*|#  define EVDEV_NAME \"${LVGL=
_CONFIG_EVDEV_INPUT}\"|g" \
+        -e "s|\(^#define LV_USE_LINUX_DRM \).*|#define LV_USE_LINUX_DRM =
${LVGL_CONFIG_USE_DRM}|g" \
         \
-        -e "s|\(^#  define USE_FBDEV \).*|#  define USE_FBDEV ${LVGL_CON=
FIG_USE_FBDEV}|g" \
+        -e "s|\(^#define LV_USE_LINUX_FBDEV \).*|#define LV_USE_LINUX_FB=
DEV ${LVGL_CONFIG_USE_FBDEV}|g" \
         \
-        -e "s|\(^# define USE_SDL \).*|#  define USE_SDL ${LVGL_CONFIG_U=
SE_SDL}|g" \
-        -e "s|\(^#  define USE_SDL_GPU \).*|#  define USE_SDL_GPU 1|g" \
-        -e "s|\(^#  define SDL_DOUBLE_BUFFERED \).*|#  define SDL_DOUBLE=
_BUFFERED 1|g" \
+        -e "s|\(^#define LV_USE_SDL \).*|#define LV_USE_SDL ${LVGL_CONFI=
G_USE_SDL}|g" \
+        -e "s|\(^#define LV_USE_DRAW_SDL \).*|#define LV_USE_DRAW_SDL ${=
LVGL_CONFIG_USE_SDL}|g" \
+        -e "s|\(^    #define LV_SDL_BUF_COUNT \).*|    #define LV_SDL_BU=
F_COUNT 2|g" \
         \
-        -e "s|\(^#  define USE_WAYLAND \).*|#  define USE_WAYLAND ${LVGL=
_CONFIG_USE_WAYLAND}|g" \
-        -e "s|\(^ *# *define *WAYLAND_HOR_RES *\).*|\1${LVGL_CONFIG_WAYL=
AND_HOR_RES}|g" \
-        -e "s|\(^ *# *define *WAYLAND_VER_RES *\).*|\1${LVGL_CONFIG_WAYL=
AND_VER_RES}|g" \
+        -e "s|\(^#define LV_COLOR_DEPTH \).*|#define LV_COLOR_DEPTH ${LV=
GL_CONFIG_LV_COLOR_DEPTH}|g" \
+        -e "s|\(#define LV_MEM_CUSTOM .*\)0|\1${LVGL_CONFIG_LV_MEM_CUSTO=
M}|g" \
         \
-        -i "${S}/lv_drv_conf.h"
+        -e "s|\(#define LV_TICK_CUSTOM \).*|\1 1|g" \
+        -e "s|\(#define LV_TICK_CUSTOM_INCLUDE \).*|\1 <stdint.h>|g" \
+        -e "s|\(#define LV_TICK_CUSTOM_SYS_TIME_EXPR \).*|extern uint32_=
t custom_tick_get(void);\n\1 (custom_tick_get())|g" \
+        \
+        -e "s|\(^#define LV_USE_EVDEV \).*|#define LV_USE_EVDEV ${LVGL_C=
ONFIG_USE_EVDEV}|g" \
+        \
+        -i "${S}/lv_conf.h"
 }
diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb b/meta-oe/=
recipes-graphics/lvgl/lv-drivers_8.3.0.bb
deleted file mode 100644
index e2c5a342a..000000000
--- a/meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-# SPDX-FileCopyrightText: Huawei Inc.
-#
-# SPDX-License-Identifier: MIT
-
-HOMEPAGE =3D "https://docs.lvgl.io/latest/en/html/porting/index.html"
-SUMMARY =3D "LVGL's Display and Touch pad drivers"
-DESCRIPTION =3D "Collection of drivers: SDL, framebuffer, wayland and mo=
re..."
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd6fc0df890c5270ef045981b516bb=
8f2"
-
-SRC_URI =3D "git://github.com/lvgl/lv_drivers;protocol=3Dhttps;branch=3D=
release/v8.3"
-SRCREV =3D "71830257710f430b6d8d1c324f89f2eab52488f1"
-
-DEPENDS =3D "lvgl"
-
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland fbde=
v', d)}"
-require lv-drivers.inc
-
-inherit cmake
-
-S =3D "${WORKDIR}/git"
-
-TARGET_CFLAGS +=3D "-DLV_CONF_INCLUDE_SIMPLE=3D1"
-TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/lvgl"
-
-FILES:${PN}-dev +=3D "\
-    ${includedir}/lvgl/lv_drivers/ \
-    "
diff --git a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb b/meta-oe/=
recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
deleted file mode 100644
index 0049bbe23..000000000
--- a/meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-# SPDX-FileCopyrightText: Huawei Inc.
-#
-# SPDX-License-Identifier: MIT
-
-HOMEPAGE =3D "https://docs.lvgl.io"
-SUMMARY =3D "PNG decoder for LVGL"
-DESCRIPTION =3D "Allow the use of PNG images in LVGL. This implementatio=
n uses lodepng"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd6fc0df890c5270ef045981b516bb=
8f2"
-
-SRC_URI =3D "git://github.com/lvgl/lv_lib_png;;protocol=3Dhttps;branch=3D=
master"
-SRCREV =3D "bf1531afe07c9f861107559e29ab8a2d83e4715a"
-
-S =3D "${WORKDIR}/git"
-
-# because of lvgl dependency
-REQUIRED_DISTRO_FEATURES =3D "wayland"
-
-DEPENDS +=3D "lvgl"
-
-EXTRA_OECMAKE +=3D "-DLIB_INSTALL_DIR=3D${baselib}"
-
-inherit cmake
-inherit features_check
-
-TARGET_CFLAGS +=3D "-DLV_CONF_INCLUDE_SIMPLE=3D1"
-TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/lvgl"
-
-FILES:${PN}-dev =3D "\
-    ${includedir}/lvgl/lv_lib_png/ \
-    "
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
deleted file mode 100644
index 32f833a02..000000000
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY =3D "LVGL Demo Application for Framebuffer"
-HOMEPAGE =3D "https://github.com/lvgl/lv_port_linux_frame_buffer"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D802d3d83ae80ef5f343050bf96cce=
3a4 \
-                    file://lv_drivers/LICENSE;md5=3Dd6fc0df890c5270ef045=
981b516bb8f2 \
-                    file://lvgl/LICENCE.txt;md5=3Dbf1198c89ae87f043108ce=
a62460b03a"
-
-SRC_URI =3D "gitsm://github.com/lvgl/lv_port_linux_frame_buffer.git;bran=
ch=3Dmaster;protocol=3Dhttps"
-SRCREV =3D "adf2c4490e17a1b9ec1902cc412a24b3b8235c8e"
-
-EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
-
-PACKAGECONFIG ??=3D "drm"
-require lv-drivers.inc
-
-inherit cmake
-
-S =3D "${WORKDIR}/git"
-
-TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/libdrm"
-
-do_configure:prepend() {
-	if [ "${LVGL_CONFIG_USE_DRM}" -eq 1 ] ; then
-		# Add libdrm build dependency
-		sed -i '/^target_link_libraries/ s@lvgl::drivers@& drm@' "${S}/CMakeLi=
sts.txt"
-		# Switch from fbdev to drm usage
-		sed -i 's@fbdev@drm@g' "${S}/main.c"
-		# Pull resolution from DRM instead of hardcoding it
-		sed -i '/disp_drv.hor_res/ d' "${S}/main.c"
-		sed -i '/disp_drv.ver_res/ s@disp_drv.ver_res.*@drm_get_sizes(\&disp_d=
rv.hor_res, \&disp_drv.ver_res, NULL);@' "${S}/main.c"
-	fi
-
-	if [ "${LVGL_CONFIG_USE_SDL}" -eq 1 ] ; then
-		# Add libsdl build dependency
-		sed -i '/^target_link_libraries/ s@lvgl::drivers@& SDL2@' "${S}/CMakeL=
ists.txt"
-		# Switch from fbdev to sdl usage
-		sed -i 's@fbdev_flush@sdl_display_flush@g' "${S}/main.c"
-		sed -i 's@lv_drivers/display/fbdev.h@lv_drivers/sdl/sdl.h@g' "${S}/mai=
n.c"
-		sed -i 's@fbdev@sdl@g' "${S}/main.c"
-	fi
-}
-
-do_install:append() {
-	install -d ${D}${bindir}
-	install -m 0755 ${B}/lvgl_fb ${D}${bindir}/
-}
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
new file mode 100644
index 000000000..fc675a518
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
@@ -0,0 +1,49 @@
+SUMMARY =3D "LVGL Demo Application for Framebuffer"
+HOMEPAGE =3D "https://github.com/lvgl/lv_port_linux_frame_buffer"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D802d3d83ae80ef5f343050bf96cce=
3a4 \
+                    file://lvgl/LICENCE.txt;md5=3Dbf1198c89ae87f043108ce=
a62460b03a"
+
+SRC_URI =3D "\
+	git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=3Dhttps;b=
ranch=3Dmaster;name=3Ddemo \
+	git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dmaster;name=3Dlvgl=
;subdir=3Dgit/lvgl \
+	"
+SRCREV_demo =3D "dccc6a1ca48372aa993dbea7a8e17dec6f42df6a"
+SRCREV_lvgl =3D "e29d35b43c509b6d7189f5dac87139441669ae66"
+SRCREV_FORMAT =3D "demo_lvgl"
+PV .=3D "+git${SRCPV}"
+
+EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
+
+PACKAGECONFIG ??=3D "drm"
+LVGL_CONFIG_DRM_CARD ?=3D "/dev/dri/card0"
+require lv-drivers.inc
+
+inherit cmake
+
+S =3D "${WORKDIR}/git"
+
+TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/libdrm"
+
+do_configure:prepend() {
+	if [ "${LVGL_CONFIG_USE_DRM}" -eq 1 ] ; then
+		# Add libdrm build dependency
+		sed -i '/^target_link_libraries/ s@pthread@& drm@' "${S}/CMakeLists.tx=
t"
+		# Switch from fbdev to drm usage
+		sed -i "s@lv_linux_fbdev_set_file.*@lv_linux_drm_set_file(disp, \"${LV=
GL_CONFIG_DRM_CARD}\", -1);@g" "${S}/main.c"
+		sed -i 's@fbdev@drm@g' "${S}/main.c"
+	fi
+
+	if [ "${LVGL_CONFIG_USE_SDL}" -eq 1 ] ; then
+		# Add libsdl build dependency
+		sed -i '/^target_link_libraries/ s@pthread@& SDL2 SDL2_image@' "${S}/C=
MakeLists.txt"
+		# Switch from fbdev to sdl usage
+		sed -i 's@lv_linux_fbdev_create()@lv_sdl_window_create(atoi(getenv("LV=
_VIDEO_WIDTH") ? : "800"), atoi(getenv("LV_VIDEO_HEIGHT") ? : "480"))@g' =
"${S}/main.c"
+		sed -i '/lv_linux_fbdev_set_file/ d' "${S}/main.c"
+	fi
+}
+
+do_install:append() {
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/bin/main ${D}${bindir}/lvgl
+}
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.11.bb b/meta-oe/recip=
es-graphics/lvgl/lvgl_8.3.11.bb
deleted file mode 100644
index 252368061..000000000
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.11.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-# SPDX-FileCopyrightText: Huawei Inc.
-#
-# SPDX-License-Identifier: MIT
-
-HOMEPAGE =3D "https://lvgl.io/"
-DESCRIPTION =3D "LVGL is an OSS graphics library to create embedded GUI"
-SUMMARY =3D "Light and Versatile Graphics Library"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3Dbf1198c89ae87f043108cea62=
460b03a"
-
-SRC_URI =3D "git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dreleas=
e/v8.3"
-SRCREV =3D "74d0a816a440eea53e030c4f1af842a94f7ce3d3"
-
-inherit cmake
-
-EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib}"
-S =3D "${WORKDIR}/git"
-
-ALLOW_EMPTY:${PN} =3D "1"
-
-LVGL_CONFIG_LV_MEM_CUSTOM ?=3D "0"
-LVGL_CONFIG_LV_COLOR_DEPTH ?=3D "32"
-
-# Upstream does not support a default configuration
-# but propose a default "disabled" template, which is used as reference
-# More configuration can be done using external configuration variables
-do_configure:prepend() {
-    [ -r "${S}/lv_conf.h" ] \
-        || sed -e 's|#if 0 .*Set it to "1" to enable .*|#if 1 // Enabled=
|g' \
-	    -e "s|\(#define LV_COLOR_DEPTH \).*|\1 ${LVGL_CONFIG_LV_COLOR_DEPTH=
}|g" \
-	    \
-	    -e "s|\(#define LV_MEM_CUSTOM .*\)0|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|=
g" \
-	    \
-	    -e "s|\(#define LV_TICK_CUSTOM \).*|\1 1|g" \
-	    -e "s|\(#define LV_TICK_CUSTOM_INCLUDE \).*|\1 <stdint.h>|g" \
-	    -e "s|\(#define LV_TICK_CUSTOM_SYS_TIME_EXPR \).*|extern uint32_t c=
ustom_tick_get(void);\n\1 (custom_tick_get())|g" \
-	    \
-            < "${S}/lv_conf_template.h" > "${S}/lv_conf.h"
-}
-
-FILES:${PN}-dev +=3D "\
-    ${includedir}/${PN}/ \
-    ${includedir}/${PN}/lvgl/ \
-    "
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_9.0.0.bb
new file mode 100644
index 000000000..d8ed4ec81
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
@@ -0,0 +1,28 @@
+# SPDX-FileCopyrightText: Huawei Inc.
+#
+# SPDX-License-Identifier: MIT
+
+HOMEPAGE =3D "https://lvgl.io/"
+DESCRIPTION =3D "LVGL is an OSS graphics library to create embedded GUI"
+SUMMARY =3D "Light and Versatile Graphics Library"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3Dbf1198c89ae87f043108cea62=
460b03a"
+
+SRC_URI =3D "git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dmaster=
"
+SRCREV =3D "e29d35b43c509b6d7189f5dac87139441669ae66"
+PV .=3D "+git${SRCPV}"
+
+inherit cmake
+
+EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib}"
+S =3D "${WORKDIR}/git"
+
+ALLOW_EMPTY:${PN} =3D "1"
+
+PACKAGECONFIG ??=3D "drm"
+require lv-drivers.inc
+
+FILES:${PN}-dev +=3D "\
+    ${includedir}/${PN}/ \
+    ${includedir}/${PN}/lvgl/ \
+    "
--=20
2.43.0


