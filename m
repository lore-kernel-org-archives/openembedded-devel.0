Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7513CEB64DD
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 13:49:25 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.11738.1687700960223764086
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jun 2023 06:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=bdOorSHH;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A4C50861A5;
	Sun, 25 Jun 2023 15:49:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1687700957;
	bh=yrT7eMMeR/TTszX+14kwcvTqYTORWW96hyfl31EbkII=;
	h=From:To:Cc:Subject:Date:From;
	b=bdOorSHHSUXjIUsTlneCKjIfAiBqYQqSXlHml7dr99ntaBY+QCz6i3on28mpjJKXb
	 tNN5Ojpsw75E9jLGt+DMajepJ5B2VQnr2W+UnQEKULwo01iqc6eihZ0bBUAzlb63SH
	 EL2wOLbClne1anqDl+15S59gijAegAWYxmkMTLq2Rsuqo6P9/zWIh7P0JcxOyTud4K
	 tG67zhetXtGZM9My5M5Nfh3TXjhUaysZ19k0Lckuu46qGjWSjTqlsThfdUlaTcx6aO
	 NEiBHDAUHZNlWUE/RxAMVgyC5KRhTPhPGc9XfqO7ZiAcdphJEMxGvVxY/rz4RsXanM
	 poPfQVYObIisw==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] lvgl: Factor out and unify lv-drivers configuration
Date: Sun, 25 Jun 2023 15:49:01 +0200
Message-Id: <20230625134902.104109-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 13:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103562

The configuration of lv_drivers is the same in lv-drivers and lvgl-demo-f=
b,
the later just pulls in its own already preconfigured variant of lv-drive=
rs
as git submodule. Pull out the lv-drivers configuration into separate fil=
e
lv-drivers.inc, so it can be shared by lv-drivers and lvgl-demo-fb recipe=
s.

Furthermore, as the configuration support in both recipes diverged alread=
y,
merge support for both sets of configuration options. This way, lv-driver=
s
grows support for DRM and SDL backend, and lvgl-demo-fb for WL backend. T=
he
PACKAGECONFIG of each recipe is left unchanged so far to avoid breaking o=
f
existing users.

Note that LVGL_CONFIG_USE_EVDEV is new and activated for both fbdev and d=
rm,
since both of those backends need EVDEV support right now. The libinput i=
nput
support is not available yet.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-drivers.inc  | 44 +++++++++++++++++++
 .../recipes-graphics/lvgl/lv-drivers_8.3.0.bb | 26 +----------
 .../lvgl/lvgl-demo-fb_8.3.0.bb                | 17 +------
 3 files changed, 46 insertions(+), 41 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/lvgl/lv-drivers.inc

diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers.inc b/meta-oe/recip=
es-graphics/lvgl/lv-drivers.inc
new file mode 100644
index 000000000..284d8421b
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/lv-drivers.inc
@@ -0,0 +1,44 @@
+PACKAGECONFIG[drm] =3D ",,libdrm"
+PACKAGECONFIG[fbdev] =3D ",,"
+PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2"
+PACKAGECONFIG[wayland] =3D ",,libxkbcommon wayland"
+
+LVGL_CONFIG_USE_DRM =3D "${@bb.utils.contains('PACKAGECONFIG', 'drm', '1=
', '0', d)}"
+LVGL_CONFIG_DRM_CARD ?=3D "/dev/dri/card0"
+
+LVGL_CONFIG_USE_EVDEV =3D "${@bb.utils.contains_any('PACKAGECONFIG', 'dr=
m fbdev', '1', '0', d)}"
+
+LVGL_CONFIG_USE_FBDEV =3D "${@bb.utils.contains('PACKAGECONFIG', 'fbdev'=
, '1', '0', d)}"
+
+LVGL_CONFIG_USE_SDL =3D "${@bb.utils.contains('PACKAGECONFIG', 'sdl', '1=
', '0', d)}"
+
+LVGL_CONFIG_USE_WAYLAND =3D "${@bb.utils.contains('PACKAGECONFIG', 'wayl=
and', '1', '0', d)}"
+LVGL_CONFIG_WAYLAND_HOR_RES ?=3D "480"
+LVGL_CONFIG_WAYLAND_VER_RES ?=3D "320"
+
+EXTRA_OECMAKE +=3D "-Dinstall:BOOL=3DON -DLIB_INSTALL_DIR=3D${baselib}"
+
+do_configure:append() {
+    # If there is a configuration template, start from that
+    [ -r "${S}/lv_drv_conf_template.h" ] && cp -Lv "${S}/lv_drv_conf_tem=
plate.h" "${S}/lv_drv_conf.h"
+
+    # Configure the software using sed
+    sed -e "s|#if 0 .*Set it to \"1\" to enable the content.*|#if 1 // E=
nabled by ${PN}|g" \
+        \
+        -e "s|\(^#  define USE_DRM \).*|#  define USE_DRM ${LVGL_CONFIG_=
USE_DRM}|g" \
+        -e "s|\(^#  define DRM_CARD \).*|#  define DRM_CARD \"${LVGL_CON=
FIG_DRM_CARD}\"|g" \
+	\
+        -e "s|\(^#  define USE_EVDEV \).*|#  define USE_EVDEV ${LVGL_CON=
FIG_USE_EVDEV}|g" \
+        \
+        -e "s|\(^#  define USE_FBDEV \).*|#  define USE_FBDEV ${LVGL_CON=
FIG_USE_FBDEV}|g" \
+        \
+        -e "s|\(^# define USE_SDL \).*|#  define USE_SDL ${LVGL_CONFIG_U=
SE_SDL}|g" \
+        -e "s|\(^#  define USE_SDL_GPU \).*|#  define USE_SDL_GPU 1|g" \
+        -e "s|\(^#  define SDL_DOUBLE_BUFFERED \).*|#  define SDL_DOUBLE=
_BUFFERED 1|g" \
+        \
+        -e "s|\(^#  define USE_WAYLAND \).*|#  define USE_WAYLAND ${LVGL=
_CONFIG_USE_WAYLAND}|g" \
+        -e "s|\(^ *# *define *WAYLAND_HOR_RES *\).*|\1${LVGL_CONFIG_WAYL=
AND_HOR_RES}|g" \
+        -e "s|\(^ *# *define *WAYLAND_VER_RES *\).*|\1${LVGL_CONFIG_WAYL=
AND_VER_RES}|g" \
+        \
+        -i "${S}/lv_drv_conf.h"
+}
diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb b/meta-oe/=
recipes-graphics/lvgl/lv-drivers_8.3.0.bb
index a0a2ee0aa..e2c5a342a 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
@@ -14,39 +14,15 @@ SRCREV =3D "71830257710f430b6d8d1c324f89f2eab52488f1"
 DEPENDS =3D "lvgl"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland fbde=
v', d)}"
-PACKAGECONFIG[fbdev] =3D ",,"
-PACKAGECONFIG[wayland] =3D ",,libxkbcommon wayland"
-LVGL_CONFIG_USE_FBDEV =3D "${@bb.utils.contains('PACKAGECONFIG', 'fbdev'=
, '1', '0', d)}"
-LVGL_CONFIG_USE_WAYLAND =3D "${@bb.utils.contains('PACKAGECONFIG', 'wayl=
and', '1', '0', d)}"
+require lv-drivers.inc
=20
 inherit cmake
=20
 S =3D "${WORKDIR}/git"
=20
-LVGL_CONFIG_WAYLAND_HOR_RES ?=3D "480"
-LVGL_CONFIG_WAYLAND_VER_RES ?=3D "320"
-
-EXTRA_OECMAKE +=3D "-Dinstall:BOOL=3DON -DLIB_INSTALL_DIR=3D${baselib}"
-
 TARGET_CFLAGS +=3D "-DLV_CONF_INCLUDE_SIMPLE=3D1"
 TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/lvgl"
=20
-# Upstream does not support a default configuration
-# but propose a default "disabled" template, which is used as reference
-# More configuration can be done using external configuration variables
-do_configure:append() {
-    [ -r "${S}/lv_drv_conf.h" ] \
-        || sed -e "s|#if 0 .*Set it to \"1\" to enable the content.*|#if=
 1 // Enabled by ${PN}|g" \
-	       \
-               -e "s|\(^#  define USE_FBDEV \).*|#  define USE_FBDEV ${L=
VGL_CONFIG_USE_FBDEV}|g" \
-               -e "s|\(^#  define USE_EVDEV \).*|#  define USE_EVDEV ${L=
VGL_CONFIG_USE_FBDEV}|g" \
-	       \
-               -e "s|\(^#  define USE_WAYLAND \).*|#  define USE_WAYLAND=
 ${LVGL_CONFIG_USE_WAYLAND}|g" \
-	       -e "s|\(^ *# *define *WAYLAND_HOR_RES *\).*|\1${LVGL_CONFIG_WAYL=
AND_HOR_RES}|g" \
- 	       -e "s|\(^ *# *define *WAYLAND_VER_RES *\).*|\1${LVGL_CONFIG_WAY=
LAND_VER_RES}|g" \
-          < "${S}/lv_drv_conf_template.h" > "${S}/lv_drv_conf.h"
-}
-
 FILES:${PN}-dev +=3D "\
     ${includedir}/lvgl/lv_drivers/ \
     "
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
index 33e7c94e6..32f833a02 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
@@ -11,30 +11,15 @@ SRCREV =3D "adf2c4490e17a1b9ec1902cc412a24b3b8235c8e"
 EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
=20
 PACKAGECONFIG ??=3D "drm"
-PACKAGECONFIG[drm] =3D ",,libdrm"
-PACKAGECONFIG[fbdev] =3D ",,"
-PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2"
-LVGL_CONFIG_USE_DRM =3D "${@bb.utils.contains('PACKAGECONFIG', 'drm', '1=
', '0', d)}"
-LVGL_CONFIG_DRM_CARD ?=3D "/dev/dri/card0"
-LVGL_CONFIG_USE_FBDEV =3D "${@bb.utils.contains('PACKAGECONFIG', 'fbdev'=
, '1', '0', d)}"
-LVGL_CONFIG_USE_SDL =3D "${@bb.utils.contains('PACKAGECONFIG', 'sdl', '1=
', '0', d)}"
+require lv-drivers.inc
=20
 inherit cmake
=20
 S =3D "${WORKDIR}/git"
=20
-EXTRA_OECMAKE +=3D "-Dinstall:BOOL=3DON -DLIB_INSTALL_DIR=3D${baselib}"
 TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/libdrm"
=20
 do_configure:prepend() {
-	sed -i -e "s|\(^#  define USE_FBDEV \).*|#  define USE_FBDEV ${LVGL_CON=
FIG_USE_FBDEV}|g" \
-		-e "s|\(^#  define USE_DRM \).*|#  define USE_DRM ${LVGL_CONFIG_USE_DR=
M}|g" \
-		-e "s|\(^#  define DRM_CARD \).*|#  define DRM_CARD \"${LVGL_CONFIG_DR=
M_CARD}\"|g" \
-		-e "s|\(^# define USE_SDL \).*|#  define USE_SDL ${LVGL_CONFIG_USE_SDL=
}|g" \
-		-e "s|\(^#  define USE_SDL_GPU \).*|#  define USE_SDL_GPU 1|g" \
-		-e "s|\(^#  define SDL_DOUBLE_BUFFERED \).*|#  define SDL_DOUBLE_BUFFE=
RED 1|g" \
-	"${S}/lv_drv_conf.h"
-
 	if [ "${LVGL_CONFIG_USE_DRM}" -eq 1 ] ; then
 		# Add libdrm build dependency
 		sed -i '/^target_link_libraries/ s@lvgl::drivers@& drm@' "${S}/CMakeLi=
sts.txt"
--=20
2.40.1


