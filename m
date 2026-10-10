Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39073CA9EBE
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 07:54:34 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5375.1791618857085846008
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Oct 2026 00:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=SOfF/Qhc;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout06.t-online.de (Postfix) with SMTP id 3B7C45EE
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 09:54:15 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.229.158]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xFRuG-3wF0HS0; Sat, 10 Oct 2026 09:54:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [blacksail][meta-gnome][PATCHv2 3/3] Revert "mutter: upgrade 50.4 -> 51.0"
Date: Sat, 10 Oct 2026 09:54:05 +0200
Message-ID: <20261010075405.1740272-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010075405.1740272-1-f_l_k@t-online.de>
References: <20261010075405.1740272-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1791618852-2E7FBBCA-0012FCDC/0/0 CLEAN NORMAL
X-TOI-MSGID: 3579fc29-9187-4c73-a1b6-81fa75cc71ad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791618855; i=f_l_k@t-online.de;
	bh=6VGxUEV2uMcZoSllNhmZNr21BgjJe8j67GYtbEgmgPQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=SOfF/QhcXJLeIonBYvHbY6GCXbosKD4jNudXRS9K4cSD8RWfBftfbpsPDpgdd2vp2
	 xcznB3d72VBS6kl7Xx60n7LBZqG1kItqeptOs13/Dl3Z8yAc/IiLXfGvuvD9wHLbY1
	 L0xnLzFkV9ubynrvsxCXHsGsNecgJBb3XCL2wwFaawCeXrGZDn6FfcWOIGEMw0SIuy
	 8UlR62qNbZuQKkJ6eMM3cpW+V4brZrjojm+cLLo1uf1bLsWde1CsaLVmmFNhIRm7fK
	 duLpozoU7qgZHmShLPB7+MmhPshjN6iRBib7VBegF8omYj37o/2d9hspRHOgYC++Bj
	 XviRAaMVzAgNg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 07:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130720

This reverts commit 6f735ce8ac29f1e57dc463bac8c34f3c439a7fb7.

mutter 51.0 needs gsettings-desktop-schemas >=3D 51.rc, but oe-core
blacksail has 50.1. Tested by building gnome-image against oe-core
blacksail.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mutter/{mutter_51.0.bb =3D> mutter_50.4.bb}   | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_51.0.bb =3D> mutter_50.4.=
bb} (85%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_50.4.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
index 6604865f67..f9b3e9d5e5 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
@@ -17,17 +17,12 @@ DEPENDS =3D " \
     libdisplay-info \
     libdrm \
     libei \
-    libgudev \
-    libinput \
-    libxcvt-native \
     libxkbcommon \
     pango \
     pixman \
     python3-argcomplete-native \
     python3-docutils-native \
-    udev \
     virtual/egl \
-    virtual/libgbm \
     virtual/libgles2 \
     wayland \
     wayland-native \
@@ -37,7 +32,7 @@ DEPENDS =3D " \
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
 SRC_URI +=3D "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
-SRC_URI[archive.sha256sum] =3D "5d28f3ae225692428fcafb96500d673f34328b69=
8b86960c9c1460d0b1d983b3"
+SRC_URI[archive.sha256sum] =3D "273d33c875abcb4b6cbea3f4ec045d18155fbc51=
0c3521fc7e47926371310988"
=20
 REQUIRED_DISTRO_FEATURES =3D "wayland polkit"
 ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
@@ -45,10 +40,10 @@ ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
 # systemd can be replaced by libelogind (not available atow - make syste=
md
 # mandatory distro feature)
 LOGIND ?=3D "systemd"
-DEPENDS +=3D "${LOGIND}"
 REQUIRED_DISTRO_FEATURES +=3D "systemd"
=20
 PACKAGECONFIG ??=3D " \
+    native-backend \
     egl \
     gles2 \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)} \
@@ -56,11 +51,17 @@ PACKAGECONFIG ??=3D " \
     bash-completion \
     gnome-desktop \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'logind udev', ''=
, d)} \
 "
=20
+PACKAGECONFIG[native-backend] =3D "-Dnative_backend=3Dtrue -Dudev=3Dtrue=
, -Dnative_backend=3Dfalse -Dudev=3Dfalse, libdrm virtual/libgbm libinput=
 ${LOGIND} virtual/egl virtual/libgles2 udev libxcvt-native"
 PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse, virtual/li=
bgl"
 PACKAGECONFIG[gles2] =3D "-Dgles2=3Dtrue, -Dgles2=3Dfalse, virtual/libgl=
es2"
 PACKAGECONFIG[egl] =3D "-Degl=3Dtrue, -Degl=3Dfalse, virtual/egl"
+PACKAGECONFIG[egl-device] =3D "-Degl_device=3Dtrue, -Degl_device=3Dfalse=
"
+PACKAGECONFIG[wayland-eglstream] =3D "-Dwayland_eglstream=3Dtrue, -Dwayl=
and_eglstream=3Dfalse, wayland-eglstream-protocols"
+PACKAGECONFIG[udev] =3D "-Dudev=3Dtrue, -Dudev=3Dfalse, udev"
+PACKAGECONFIG[logind] =3D "-Dlogind=3Dtrue, -Dlogind=3Dfalse, systemd"
 PACKAGECONFIG[libwacom] =3D "-Dlibwacom=3Dtrue, -Dlibwacom=3Dfalse, libw=
acom"
 PACKAGECONFIG[remote-desktop] =3D "-Dremote_desktop=3Dtrue, -Dremote_des=
ktop=3Dfalse, pipewire"
 PACKAGECONFIG[gnome-desktop] =3D "-Dlibgnome_desktop=3Dtrue, -Dlibgnome_=
desktop=3Dfalse, gnome-desktop gnome-settings-daemon"
@@ -87,7 +88,7 @@ EXTRA_OEMESON +=3D " \
     -Dverbose=3Dtrue \
 "
=20
-MUTTER_API_NAME =3D "mutter-${@oe.utils.trim_version('${PV}', 1)}"
+MUTTER_API_NAME =3D "mutter-18"
=20
 do_install:prepend() {
     sed -i -e 's|${B}/||g' ${B}/cogl/cogl/cogl-enum-types.c
--=20
2.55.0


