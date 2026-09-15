Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6198C88E7D
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:39 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18084.1789458275897238941
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Bhrs+wVs;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id 632681BE62
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npr-00ds630; Tue, 15 Sep 2026 09:44:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 24/31] mutter: upgrade 50.4 -> 51.0
Date: Tue, 15 Sep 2026 09:43:40 +0200
Message-ID: <20260915074347.6003-24-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458251-FB7FD9B9-E2E96DEB/0/0 CLEAN NORMAL
X-TOI-MSGID: 52cc612a-fdb8-45e6-a8c1-4fcdffc653dd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=uh7ViTl8pD+R2spqjSYZbWCzBUe9CHEb4/gTOlbbEpY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Bhrs+wVsUx/ftv7OtdQzTclA3vdJVs2XbDSK3OZ6FbrXBSkguk28469Y/B7LJNDJC
	 X9uvT+8eny6FyELV7sU3hUuEiJISbuzPhoB8fAcQRlvAajQ4NOAURZ0QVZ37loQ4/6
	 X1Cv/VcfHZOIkLO/AyoNX+G+JSjG7YsnWbWjKaBFEixFCW11FM64Q8fP9slFPSNJL5
	 9DxYJvt97a87DeakDreSBrDAECp2NS9MoC6XUs/1gL4yMUo+/69BIYHCk4rmb8P6vL
	 FTjE2EZMWfvSHVbFPXoDdRHbvR1M8Kg3GQ2mExwcmu6pyQ9/pEpKHecdHqye+0u1Lj
	 2CEON+JebX6+w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130063

The native backend, udev and logind are no longer optional, and the
egl_device and wayland_eglstream options are gone. Drop those
PACKAGECONFIGs and move the dependencies they carried into DEPENDS.

Upstream now aligns the API version with the release, so the libraries
live in ${libdir}/mutter-51 instead of mutter-18. Derive MUTTER_API_NAME
from PV rather than hardcoding it again.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mutter/{mutter_50.4.bb =3D> mutter_51.0.bb}   | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_50.4.bb =3D> mutter_51.0.=
bb} (85%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_50.4.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_51.0.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
index f9b3e9d5e5..6604865f67 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
@@ -17,12 +17,17 @@ DEPENDS =3D " \
     libdisplay-info \
     libdrm \
     libei \
+    libgudev \
+    libinput \
+    libxcvt-native \
     libxkbcommon \
     pango \
     pixman \
     python3-argcomplete-native \
     python3-docutils-native \
+    udev \
     virtual/egl \
+    virtual/libgbm \
     virtual/libgles2 \
     wayland \
     wayland-native \
@@ -32,7 +37,7 @@ DEPENDS =3D " \
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
 SRC_URI +=3D "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
-SRC_URI[archive.sha256sum] =3D "273d33c875abcb4b6cbea3f4ec045d18155fbc51=
0c3521fc7e47926371310988"
+SRC_URI[archive.sha256sum] =3D "5d28f3ae225692428fcafb96500d673f34328b69=
8b86960c9c1460d0b1d983b3"
=20
 REQUIRED_DISTRO_FEATURES =3D "wayland polkit"
 ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
@@ -40,10 +45,10 @@ ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
 # systemd can be replaced by libelogind (not available atow - make syste=
md
 # mandatory distro feature)
 LOGIND ?=3D "systemd"
+DEPENDS +=3D "${LOGIND}"
 REQUIRED_DISTRO_FEATURES +=3D "systemd"
=20
 PACKAGECONFIG ??=3D " \
-    native-backend \
     egl \
     gles2 \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)} \
@@ -51,17 +56,11 @@ PACKAGECONFIG ??=3D " \
     bash-completion \
     gnome-desktop \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'logind udev', ''=
, d)} \
 "
=20
-PACKAGECONFIG[native-backend] =3D "-Dnative_backend=3Dtrue -Dudev=3Dtrue=
, -Dnative_backend=3Dfalse -Dudev=3Dfalse, libdrm virtual/libgbm libinput=
 ${LOGIND} virtual/egl virtual/libgles2 udev libxcvt-native"
 PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse, virtual/li=
bgl"
 PACKAGECONFIG[gles2] =3D "-Dgles2=3Dtrue, -Dgles2=3Dfalse, virtual/libgl=
es2"
 PACKAGECONFIG[egl] =3D "-Degl=3Dtrue, -Degl=3Dfalse, virtual/egl"
-PACKAGECONFIG[egl-device] =3D "-Degl_device=3Dtrue, -Degl_device=3Dfalse=
"
-PACKAGECONFIG[wayland-eglstream] =3D "-Dwayland_eglstream=3Dtrue, -Dwayl=
and_eglstream=3Dfalse, wayland-eglstream-protocols"
-PACKAGECONFIG[udev] =3D "-Dudev=3Dtrue, -Dudev=3Dfalse, udev"
-PACKAGECONFIG[logind] =3D "-Dlogind=3Dtrue, -Dlogind=3Dfalse, systemd"
 PACKAGECONFIG[libwacom] =3D "-Dlibwacom=3Dtrue, -Dlibwacom=3Dfalse, libw=
acom"
 PACKAGECONFIG[remote-desktop] =3D "-Dremote_desktop=3Dtrue, -Dremote_des=
ktop=3Dfalse, pipewire"
 PACKAGECONFIG[gnome-desktop] =3D "-Dlibgnome_desktop=3Dtrue, -Dlibgnome_=
desktop=3Dfalse, gnome-desktop gnome-settings-daemon"
@@ -88,7 +87,7 @@ EXTRA_OEMESON +=3D " \
     -Dverbose=3Dtrue \
 "
=20
-MUTTER_API_NAME =3D "mutter-18"
+MUTTER_API_NAME =3D "mutter-${@oe.utils.trim_version('${PV}', 1)}"
=20
 do_install:prepend() {
     sed -i -e 's|${B}/||g' ${B}/cogl/cogl/cogl-enum-types.c
--=20
2.55.0


