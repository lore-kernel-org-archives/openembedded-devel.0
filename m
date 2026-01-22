Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945EED3EE92
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:44:00 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40495.1769096637286855155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id C36C73884B
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 16:43:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.253]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viwqc-1auNgY0; Thu, 22 Jan 2026 16:43:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 10/11] mutter: fix build without x11 in DISTRO_FEATURES
Date: Thu, 22 Jan 2026 16:43:33 +0100
Message-ID: <20260122154334.1872038-10-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122154334.1872038-1-f_l_k@t-online.de>
References: <20260122154334.1872038-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769096630-097F9925-9CAC5E13/0/0 CLEAN NORMAL
X-TOI-MSGID: 6dd04674-e315-40ec-9301-4387f06f19f1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 15:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123745

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/mutter/mutter_48.7.bb       | 33 +++++++++++--------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_48.7.bb
index 0dbdb4b31a..7409b6908d 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
@@ -3,8 +3,6 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
 DEPENDS =3D " \
-    wayland-native \
-    virtual/libx11 \
     colord \
     graphene \
     gtk4 \
@@ -15,14 +13,15 @@ DEPENDS =3D " \
     json-glib \
     libdisplay-info \
     libei \
-    libxcvt-native \
-    libxtst \
-    libxkbfile \
     python3-argcomplete-native \
     python3-docutils-native \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xinerama', '', d)} \
-    xwayland \
-"
+    virtual/egl \
+    virtual/libgles2 \
+    wayland \
+    wayland-native \
+    wayland-protocols \
+    libxcvt-native \
+    "
=20
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
@@ -30,8 +29,8 @@ inherit gnomebase gsettings gobject-introspection gette=
xt features_check
 SRC_URI +=3D "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
 SRC_URI[archive.sha256sum] =3D "ec102aa3cbb0e39001206627aca3055314555f70=
609de5e6c2b7efcd1fa90f20"
=20
-# x11 is still manadatory - see meson.build
-REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
+REQUIRED_DISTRO_FEATURES =3D "wayland polkit"
+ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
=20
 # systemd can be replaced by libelogind (not available atow - make syste=
md
 # mandatory distro feature)
@@ -41,27 +40,33 @@ REQUIRED_DISTRO_FEATURES +=3D "systemd"
 # profiler requires sysprof 3.34 which is not willing to build atow
 PACKAGECONFIG ??=3D " \
     native-backend \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'opengl glx', =
'', d)} \
-    startup-notification \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 opengl glx sm xw=
ayland startup-notification', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'logind udev', ''=
, d)} \
     gnome-desktop \
+    egl \
 "
=20
 EXTRA_OEMESON +=3D " \
     -Dtests=3Ddisabled \
-    -Dxwayland_path=3D${bindir}/Xwayland \
 "
=20
 # combi-config - see meson_options.txt for more details
 PACKAGECONFIG[native-backend] =3D "-Dnative_backend=3Dtrue -Dudev=3Dtrue=
, -Dnative_backend=3Dfalse -Dudev=3Dfalse, libdrm virtual/libgbm libinput=
 ${LOGIND} virtual/egl virtual/libgles2 udev"
-PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse, virtual/li=
bgl"
 PACKAGECONFIG[glx] =3D "-Dglx=3Dtrue, -Dglx=3Dfalse"
+PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse,virtual/lib=
gl"
+PACKAGECONFIG[egl] =3D "-Degl=3Dtrue,-Degl=3Dfalse,virtual/egl"
 PACKAGECONFIG[libwacom] =3D "-Dlibwacom=3Dtrue, -Dlibwacom=3Dfalse, libw=
acom"
 # Remove depending on pipewire-0.2 when mutter is upgraded to 3.36+
 PACKAGECONFIG[remote-desktop] =3D "-Dremote_desktop=3Dtrue, -Dremote_des=
ktop=3Dfalse, pipewire"
 PACKAGECONFIG[gnome-desktop] =3D "-Dlibgnome_desktop=3Dtrue, -Dlibgnome_=
desktop=3Dfalse, gnome-desktop gnome-settings-daemon"
+PACKAGECONFIG[sm] =3D "-Dsm=3Dtrue, -Dsm=3Dfalse, libsm"
+PACKAGECONFIG[udev] =3D "-Dudev=3Dtrue, -Dudev=3Dfalse"
+PACKAGECONFIG[logind] =3D "-Dlogind=3Dtrue, -Dlogind=3Dfalse, systemd"
 PACKAGECONFIG[sound-player] =3D "-Dsound_player=3Dtrue, -Dsound_player=3D=
false, libcanberra"
 PACKAGECONFIG[profiler] =3D "-Dprofiler=3Dtrue,-Dprofiler=3Dfalse,syspro=
f"
 PACKAGECONFIG[startup-notification] =3D "-Dstartup_notification=3Dtrue, =
-Dstartup_notification=3Dfalse, startup-notification, startup-notificatio=
n"
+PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue, -Dx11=3Dfalse, virtual/libx11"
+PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue, -Dxwayland=3Dfalse, libx=
cb xi xcomposite xcursor xdamage xext libxfixes xkeyboard-config virtual/=
libx11 xinerama xau"
=20
 MUTTER_API_NAME =3D "mutter-16"
=20
--=20
2.52.0


