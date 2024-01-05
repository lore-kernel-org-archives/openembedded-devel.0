Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B02C4707B
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 18:37:07 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.31136.1704479823538871071
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 10:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout11.t-online.de (Postfix) with SMTP id CADC39FE0
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Jan 2024 19:37:01 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.175.203]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rLp40-2G1C0Q0; Fri, 5 Jan 2024 19:37:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] mpv: upgrade 0.35.1 -> 0.37.0
Date: Fri,  5 Jan 2024 19:36:48 +0100
Message-ID: <20240105183648.61874-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105183648.61874-1-f_l_k@t-online.de>
References: <20240105183648.61874-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704479820-C12ED9F9-507565DC/0/0 CLEAN NORMAL
X-TOI-MSGID: 2c69381f-ba3a-414c-81a7-d809f2703bed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 18:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108051

- switch buildsystem from waf to meson
- add libplacebo dependency
- add vulkan support
- build libmpv (needed eg. for mpvpaper)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/mplayer/mpv_0.35.1.bb  | 116 ------------------
 .../recipes-multimedia/mplayer/mpv_0.37.0.bb  |  97 +++++++++++++++
 2 files changed, 97 insertions(+), 116 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv_0.37.0.bb

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.35.1.bb
deleted file mode 100644
index 0f50a6e8f..000000000
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
+++ /dev/null
@@ -1,116 +0,0 @@
-SUMMARY =3D "Open Source multimedia player"
-DESCRIPTION =3D "mpv is a fork of mplayer2 and MPlayer. It shares some f=
eatures with the former projects while introducing many more."
-SECTION =3D "multimedia"
-HOMEPAGE =3D "http://www.mpv.io/"
-
-DEPENDS =3D " \
-    zlib \
-    ffmpeg \
-    jpeg \
-    libv4l \
-    libass \
-"
-
-LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
-
-SRCREV_mpv =3D "140ec21c89d671d392877a7f3b91d67e7d7b9239"
-SRC_URI =3D "git://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease=
/0.35;protocol=3Dhttps \
-           https://waf.io/waf-2.0.25;name=3Dwaf;subdir=3Dgit \
-           "
-SRC_URI[waf.sha256sum] =3D "21199cd220ccf60434133e1fd2ab8c8e5217c3799199=
c82722543970dc8e38d5"
-
-S =3D "${WORKDIR}/git"
-
-inherit waf pkgconfig mime-xdg
-
-LDFLAGS:append:riscv64 =3D " -latomic"
-
-LUA ?=3D "lua"
-LUA:mips64  =3D ""
-LUA:powerpc64  =3D ""
-LUA:powerpc64le  =3D ""
-LUA:riscv64  =3D ""
-LUA:riscv32  =3D ""
-LUA:powerpc  =3D ""
-
-# Note: lua is required to get on-screen-display (controls)
-PACKAGECONFIG ??=3D " \
-    ${LUA} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl', ''=
, d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
-"
-
-PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,virtual/libx11 xsp li=
bxv libxscrnsaver libxinerama libxpresent libxext"
-PACKAGECONFIG[xv] =3D "--enable-xv,--disable-xv,libxv"
-PACKAGECONFIG[opengl] =3D "--enable-gl,--disable-gl,virtual/libgl"
-PACKAGECONFIG[egl] =3D "--enable-egl,--disable-egl,virtual/egl"
-PACKAGECONFIG[drm] =3D "--enable-drm,--disable-drm,libdrm"
-PACKAGECONFIG[gbm] =3D "--enable-gbm,--disable-gbm,virtual/libgbm"
-PACKAGECONFIG[lua] =3D "--enable-lua,--disable-lua,lua luajit"
-PACKAGECONFIG[libarchive] =3D "--enable-libarchive,--disable-libarchive,=
libarchive"
-PACKAGECONFIG[jack] =3D "--enable-jack, --disable-jack, jack"
-PACKAGECONFIG[vaapi] =3D "--enable-vaapi,--disable-vaapi,libva"
-PACKAGECONFIG[vdpau] =3D "--enable-vdpau,--disable-vdpau,libvdpau"
-PACKAGECONFIG[wayland] =3D "--enable-wayland,--disable-wayland,wayland w=
ayland-native libxkbcommon"
-
-python __anonymous() {
-    packageconfig =3D (d.getVar("PACKAGECONFIG") or "").split()
-    extras =3D []
-    if "x11" in packageconfig and "opengl" in packageconfig:
-        extras.append(" --enable-gl-x11")
-    if "x11" in packageconfig and "egl" in packageconfig:
-        extras.append(" --enable-egl-x11")
-    if "egl" in packageconfig and "drm" in packageconfig:
-        extras.append(" --enable-egl-drm")
-    if "vaapi" in packageconfig and "x11" in packageconfig:
-        extras.append(" --enable-vaapi-x11")
-    if "vaapi" in packageconfig and "drm" in packageconfig:
-        extras.append(" --enable-vaapi-drm")
-    if "vaapi" in packageconfig and "x11" in packageconfig and "egl" in =
packageconfig:
-        extras.append(" --enable-vaapi-x-egl")
-    if "vdpau" in packageconfig and "opengl" in packageconfig and "x11" =
in packageconfig:
-        extras.append(" --enable-vdpau-gl-x11")
-    if "wayland" in packageconfig and "opengl" in packageconfig:
-        extras.append(" --enable-gl-wayland")
-    if "wayland" in packageconfig and "vaapi" in packageconfig:
-        extras.append(" --enable-vaapi-wayland")
-    if extras:
-        d.appendVar("EXTRA_OECONF", "".join(extras))
-}
-
-SIMPLE_TARGET_SYS =3D "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', ''=
)}"
-
-EXTRA_OECONF =3D " \
-    --prefix=3D${prefix} \
-    --target=3D${SIMPLE_TARGET_SYS} \
-    --confdir=3D${sysconfdir} \
-    --datadir=3D${datadir} \
-    --disable-manpage-build \
-    --disable-libbluray \
-    --disable-dvdnav \
-    --disable-cdda \
-    --disable-uchardet \
-    --disable-rubberband \
-    --disable-lcms2 \
-    --disable-vapoursynth \
-    ${PACKAGECONFIG_CONFARGS} \
-"
-
-do_configure:append() {
-    sed -i -e 's#${WORKDIR}#<WORKDIR>#g' ${B}/config.h
-}
-
-link_waf() {
-    ln -s waf-2.0.25 ${S}/waf
-}
-do_unpack[postfuncs] +=3D "link_waf"
-
-FILES:${PN} +=3D " \
-    ${datadir}/icons \
-    ${datadir}/zsh \
-    ${datadir}/bash-completion \
-    ${datadir}/metainfo \
-    "
-EXCLUDE_FROM_WORLD =3D "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "=
commercial", "0", "1", d)}"
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.37.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.37.0.bb
new file mode 100644
index 000000000..e6e74dbd5
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.37.0.bb
@@ -0,0 +1,97 @@
+SUMMARY =3D "Open Source multimedia player"
+DESCRIPTION =3D "mpv is a fork of mplayer2 and MPlayer. It shares some f=
eatures with the former projects while introducing many more."
+SECTION =3D "multimedia"
+HOMEPAGE =3D "http://www.mpv.io/"
+
+DEPENDS =3D " \
+    alsa-lib \
+    ffmpeg \
+    libdrm \
+    libass \
+    libplacebo \
+"
+
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
+
+SRCREV =3D "140ec21c89d671d392877a7f3b91d67e7d7b9239"
+SRC_URI =3D "git://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease=
/0.35;protocol=3Dhttps"
+
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig mime-xdg
+
+LDFLAGS:append:riscv64 =3D " -latomic"
+
+LUA ?=3D "lua"
+LUA:mips64  =3D ""
+LUA:powerpc64  =3D ""
+LUA:powerpc64le  =3D ""
+LUA:riscv64  =3D ""
+LUA:riscv32  =3D ""
+LUA:powerpc  =3D ""
+
+# Note: lua is required to get on-screen-display (controls)
+PACKAGECONFIG ??=3D " \
+    ${LUA} \
+    drm \
+    vaapi \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland opengl pipewire p=
ulseaudio vulkan', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland x11', 'gbm', '', d)=
} \
+"
+
+PACKAGECONFIG[x11] =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,virtual/libx11 =
xsp libxv libxscrnsaver libxinerama libxpresent libxext"
+PACKAGECONFIG[xv] =3D "-Dxv=3Denabled,-Dxv=3Ddisabled,libxv"
+PACKAGECONFIG[opengl] =3D "-Dgl=3Denabled,-Dgl=3Ddisabled,virtual/libgl"
+PACKAGECONFIG[egl] =3D "-Degl=3Denabled,-Degl=3Ddisabled,virtual/egl"
+PACKAGECONFIG[drm] =3D "-Ddrm=3Denabled,-Ddrm=3Ddisabled,libdrm"
+PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled,virtual/libgbm"
+PACKAGECONFIG[lua] =3D "-Dlua=3Denabled,-Dlua=3Ddisabled,luajit"
+PACKAGECONFIG[libarchive] =3D "-Dlibarchive=3Denabled,-Dlibarchive=3Ddis=
abled,libarchive"
+PACKAGECONFIG[jack] =3D "-Djack=3Denabled, -Djack=3Ddisabled, jack"
+PACKAGECONFIG[vaapi] =3D "-Dvaapi=3Denabled,-Dvaapi=3Ddisabled,libva"
+PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,shader=
c "
+PACKAGECONFIG[vdpau] =3D "-Dvdpau=3Denabled,-Dvdpau=3Ddisabled,libvdpau"
+PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,way=
land wayland-native libxkbcommon"
+PACKAGECONFIG[pipewire] =3D "-Dpipewire=3Denabled,-Dpipewire=3Ddisabled,=
pipewire"
+PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddisabled,puls=
eaudio"
+
+python __anonymous() {
+    packageconfig =3D (d.getVar("PACKAGECONFIG") or "").split()
+    extras =3D []
+    if "x11" in packageconfig and "opengl" in packageconfig:
+        extras.append(" -Dgl-x11=3Denabled")
+    if "x11" in packageconfig and "egl" in packageconfig:
+        extras.append(" -Degl-x11=3Denabled")
+    if "egl" in packageconfig and "drm" in packageconfig:
+        extras.append(" -Degl-drm=3Denabled")
+    if "vaapi" in packageconfig and "x11" in packageconfig:
+        extras.append(" -Dvaapi-x11=3Denabled")
+    if "vaapi" in packageconfig and "drm" in packageconfig:
+        extras.append(" -Dvaapi-drm=3Denabled")
+    if "vdpau" in packageconfig and "opengl" in packageconfig and "x11" =
in packageconfig:
+        extras.append(" -Dvdpau-gl-x11=3Denabled")
+    if "wayland" in packageconfig and "opengl" in packageconfig:
+        extras.append(" -Dgl-wayland=3Denabled")
+    if "wayland" in packageconfig and "vaapi" in packageconfig:
+        extras.append(" -Dvaapi-wayland=3Denabled")
+}
+
+SIMPLE_TARGET_SYS =3D "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', ''=
)}"
+
+EXTRA_OEMESON =3D " \
+    -Dmanpage-build=3Ddisabled \
+    -Dlibbluray=3Ddisabled \
+    -Dlibmpv=3Dtrue \
+    -Ddvdnav=3Ddisabled \
+    -Dcdda=3Ddisabled \
+    -Duchardet=3Ddisabled \
+    -Drubberband=3Ddisabled \
+    -Dlcms2=3Ddisabled \
+    -Dvapoursynth=3Ddisabled \
+    ${PACKAGECONFIG_CONFARGS} \
+"
+
+FILES:${PN} +=3D "${datadir}"
+EXCLUDE_FROM_WORLD =3D "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "=
commercial", "0", "1", d)}"
--=20
2.43.0


