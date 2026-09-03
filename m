Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD327C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 08:19:38 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2917.1788423568093823595
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 01:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=iiqpkLUw;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout02.t-online.de (Postfix) with SMTP id C4757EC29
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 10:19:25 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.36]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x22fL-44btZK0; Thu, 3 Sep 2026 10:19:23 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/6] mutter: update 48.7 -> 50.4
Date: Thu,  3 Sep 2026 10:19:13 +0200
Message-ID: <20260903081916.156273-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903081916.156273-1-f_l_k@t-online.de>
References: <20260903081916.156273-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788423563-A8FF69C8-D9D421C3/0/0 CLEAN NORMAL
X-TOI-MSGID: 516ce09d-66e4-492d-9776-ee3d8f670a16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788423565; i=f_l_k@t-online.de;
	bh=Fm3hFy61B/ExeJB+cP0mm5X4sfg/9scAOQlkHpwWa00=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=iiqpkLUwSm+Fa80jLzE6p4gXQfk0dYfNMHAIKqfQQiaIiG6U/qW0lrHATqxBEsg3w
	 W4lRK2G6QztmcsR2tISUvwB6OgAQ9JU/3NG6bqBZkSr68I4zCIQBKlGyMEAjho0+mT
	 XBGNGN+waFCirK1qmqnp9l1Xa5Kww3U37JXcx1f+pGtr6ZFP8zq8v01c6W6GMdCqom
	 HYOnOqBcxzqVCQTRw1OHZF1ggu3fC8IhP9PNV6UE49lNkwb6twz33WGzkDhdOY9hMl
	 DrArMCmHeAfJ6zyobYCQA98MC/pCMhMsXm4b+kzDJ4U6Jmww0OjR4c4HwQQ7qc3+J4
	 S5d5/4wJrwkmQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 08:19:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129705

---
 .../mutter/{mutter_48.7.bb =3D> mutter_50.4.bb} | 77 ++++++++++++-------
 1 file changed, 48 insertions(+), 29 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_48.7.bb =3D> mutter_50.4.=
bb} (66%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_50.4.bb
similarity index 66%
rename from meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
index bc1fe52b3b..91ba3f5489 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
@@ -3,16 +3,23 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
 DEPENDS =3D " \
+    atk \
+    cairo \
     colord \
-    graphene \
-    gtk4 \
+    fribidi \
     gdk-pixbuf \
-    cairo \
-    pango \
+    glycin \
+    graphene \
     gsettings-desktop-schemas \
-    json-glib \
+    gtk4 \
+    harfbuzz \
+    lcms \
     libdisplay-info \
+    libdrm \
     libei \
+    libxkbcommon \
+    pango \
+    pixman \
     python3-argcomplete-native \
     python3-docutils-native \
     virtual/egl \
@@ -20,14 +27,12 @@ DEPENDS =3D " \
     wayland \
     wayland-native \
     wayland-protocols \
-    libxcvt-native \
     "
=20
-
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
 SRC_URI +=3D "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
-SRC_URI[archive.sha256sum] =3D "ec102aa3cbb0e39001206627aca3055314555f70=
609de5e6c2b7efcd1fa90f20"
+SRC_URI[archive.sha256sum] =3D "273d33c875abcb4b6cbea3f4ec045d18155fbc51=
0c3521fc7e47926371310988"
=20
 REQUIRED_DISTRO_FEATURES =3D "wayland polkit"
 ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
@@ -37,38 +42,53 @@ ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
 LOGIND ?=3D "systemd"
 REQUIRED_DISTRO_FEATURES +=3D "systemd"
=20
-# profiler requires sysprof 3.34 which is not willing to build atow
 PACKAGECONFIG ??=3D " \
     native-backend \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 opengl glx sm xw=
ayland startup-notification', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'logind udev', ''=
, d)} \
-    gnome-desktop \
     egl \
+    gles2 \
+    opengl \
+    fonts \
+    bash-completion \
+    gnome-desktop \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'logind udev', ''=
, d)} \
 "
=20
-EXTRA_OEMESON +=3D " \
-    -Dtests=3Ddisabled \
-"
-
-# combi-config - see meson_options.txt for more details
-PACKAGECONFIG[native-backend] =3D "-Dnative_backend=3Dtrue -Dudev=3Dtrue=
, -Dnative_backend=3Dfalse -Dudev=3Dfalse, libdrm virtual/libgbm libinput=
 ${LOGIND} virtual/egl virtual/libgles2 udev"
-PACKAGECONFIG[glx] =3D "-Dglx=3Dtrue, -Dglx=3Dfalse"
-PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse,virtual/lib=
gl"
-PACKAGECONFIG[egl] =3D "-Degl=3Dtrue,-Degl=3Dfalse,virtual/egl"
+PACKAGECONFIG[native-backend] =3D "-Dnative_backend=3Dtrue -Dudev=3Dtrue=
, -Dnative_backend=3Dfalse -Dudev=3Dfalse, libdrm virtual/libgbm libinput=
 ${LOGIND} virtual/egl virtual/libgles2 udev libxcvt-native"
+PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse, virtual/li=
bgl"
+PACKAGECONFIG[gles2] =3D "-Dgles2=3Dtrue, -Dgles2=3Dfalse, virtual/libgl=
es2"
+PACKAGECONFIG[egl] =3D "-Degl=3Dtrue, -Degl=3Dfalse, virtual/egl"
+PACKAGECONFIG[egl-device] =3D "-Degl_device=3Dtrue, -Degl_device=3Dfalse=
"
+PACKAGECONFIG[wayland-eglstream] =3D "-Dwayland_eglstream=3Dtrue, -Dwayl=
and_eglstream=3Dfalse, wayland-eglstream-protocols"
+PACKAGECONFIG[udev] =3D "-Dudev=3Dtrue, -Dudev=3Dfalse, udev"
+PACKAGECONFIG[logind] =3D "-Dlogind=3Dtrue, -Dlogind=3Dfalse, systemd"
 PACKAGECONFIG[libwacom] =3D "-Dlibwacom=3Dtrue, -Dlibwacom=3Dfalse, libw=
acom"
-# Remove depending on pipewire-0.2 when mutter is upgraded to 3.36+
 PACKAGECONFIG[remote-desktop] =3D "-Dremote_desktop=3Dtrue, -Dremote_des=
ktop=3Dfalse, pipewire"
 PACKAGECONFIG[gnome-desktop] =3D "-Dlibgnome_desktop=3Dtrue, -Dlibgnome_=
desktop=3Dfalse, gnome-desktop gnome-settings-daemon"
-PACKAGECONFIG[sm] =3D "-Dsm=3Dtrue, -Dsm=3Dfalse, libsm"
-PACKAGECONFIG[udev] =3D "-Dudev=3Dtrue, -Dudev=3Dfalse"
-PACKAGECONFIG[logind] =3D "-Dlogind=3Dtrue, -Dlogind=3Dfalse, systemd"
 PACKAGECONFIG[sound-player] =3D "-Dsound_player=3Dtrue, -Dsound_player=3D=
false, libcanberra"
-PACKAGECONFIG[profiler] =3D "-Dprofiler=3Dtrue,-Dprofiler=3Dfalse,syspro=
f"
+PACKAGECONFIG[profiler] =3D "-Dprofiler=3Dtrue, -Dprofiler=3Dfalse, sysp=
rof"
 PACKAGECONFIG[startup-notification] =3D "-Dstartup_notification=3Dtrue, =
-Dstartup_notification=3Dfalse, startup-notification, startup-notificatio=
n"
-PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue, -Dx11=3Dfalse, virtual/libx11"
 PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue, -Dxwayland=3Dfalse, libx=
cb libxi xcomposite libxcursor xdamage xext libxkbfile libxfixes xkeyboar=
d-config virtual/libx11 xinerama xau xwayland"
+# 'auto' would probe the xwayland pkg-config for -initfd support in the =
sysroot.
+PACKAGECONFIG[xwayland-initfd] =3D "-Dxwayland_initfd=3Denabled, -Dxwayl=
and_initfd=3Ddisabled"
+PACKAGECONFIG[fonts] =3D "-Dfonts=3Dtrue, -Dfonts=3Dfalse, pango harfbuz=
z fribidi"
+PACKAGECONFIG[bash-completion] =3D "-Dbash_completion=3Dtrue, -Dbash_com=
pletion=3Dfalse, bash-completion"
+PACKAGECONFIG[docs] =3D "-Ddocs=3Dtrue, -Ddocs=3Dfalse, gi-docgen-native=
"
+PACKAGECONFIG[devkit] =3D "-Ddevkit=3Denabled, -Ddevkit=3Ddisabled, gtk4=
"
+
+EXTRA_OEMESON +=3D " \
+    -Dtests=3Ddisabled \
+    -Dinstalled_tests=3Dfalse \
+    -Dcogl_tests=3Dfalse \
+    -Dclutter_tests=3Dfalse \
+    -Dmutter_tests=3Dfalse \
+    -Dkvm_tests=3Dfalse \
+    -Dtty_tests=3Dfalse \
+    -Dcatch=3Dfalse \
+    -Dverbose=3Dtrue \
+"
=20
-MUTTER_API_NAME =3D "mutter-16"
+MUTTER_API_NAME =3D "mutter-18"
=20
 do_install:prepend() {
     sed -i -e 's|${B}/||g' ${B}/cogl/cogl/cogl-enum-types.c
@@ -112,4 +132,3 @@ FILES:${PN}-dev +=3D " \
 "
=20
 RDEPENDS:${PN} +=3D "${PN}-gsettings gsettings-desktop-schemas"
-
--=20
2.55.0


