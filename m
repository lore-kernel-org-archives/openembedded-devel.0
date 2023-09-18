Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C32CD13D8
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:52:17 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.4194.1695073930077550403
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id 54F6B54F7
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:52:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiM9z-3qxV230; Mon, 18 Sep 2023 23:52:03 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 03/18] mutter: upgrade 44.3 -> 45.0
Date: Mon, 18 Sep 2023 23:51:38 +0200
Message-ID: <20230918215156.1920452-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918215156.1920452-1-f_l_k@t-online.de>
References: <20230918215156.1920452-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695073923-477FF5E3-3F842112/0/0 CLEAN NORMAL
X-TOI-MSGID: 9a89fe44-7e0a-4da6-83ac-5f8e708ee4b5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 21:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104928

- add packageconfig for libdisplay-info (edid parser helper)
- add required dependency on libei

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/mutter/{mutter_44.3.bb =3D> mutter_45.0.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_44.3.bb =3D> mutter_45.0.=
bb} (93%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_44.3.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_45.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/mutter/mutter_44.3.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_45.0.bb
index 6bd8a7b08..87d61c266 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_44.3.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_45.0.bb
@@ -15,6 +15,7 @@ DEPENDS =3D " \
     json-glib \
     gnome-desktop \
     gnome-settings-daemon \
+    libei \
     libxtst \
     libxkbfile \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xinerama', '', d)} \
@@ -25,7 +26,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "185cbebf2150d3e450550e371bdb13a8b4db0969=
78b14f99521e966eacc70551"
+SRC_URI[archive.sha256sum] =3D "8fbc963019eda9ba52fca2f6c4c477efbc6e36eb=
4fa93f23174f02ff6b907715"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
@@ -53,6 +54,7 @@ EXTRA_OEMESON +=3D " \
 PACKAGECONFIG[native-backend] =3D "-Dnative_backend=3Dtrue -Dudev=3Dtrue=
, -Dnative_backend=3Dfalse -Dudev=3Dfalse, libdrm virtual/libgbm libinput=
 ${LOGIND} virtual/egl virtual/libgles2 udev"
 PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dtrue, virtual/lib=
gl"
 PACKAGECONFIG[glx] =3D "-Dglx=3Dtrue, -Dglx=3Dfalse"
+PACKAGECONFIG[libdisplay-info] =3D "-Dlibdisplay_info=3Dtrue, -Dlibdispl=
ay_info=3Dfalse, libdisplay-info"
 PACKAGECONFIG[libwacom] =3D "-Dlibwacom=3Dtrue, -Dlibwacom=3Dfalse, libw=
acom"
 # Remove depending on pipewire-0.2 when mutter is upgraded to 3.36+
 PACKAGECONFIG[remote-desktop] =3D "-Dremote_desktop=3Dtrue, -Dremote_des=
ktop=3Dfalse, pipewire"
@@ -60,7 +62,7 @@ PACKAGECONFIG[sm] =3D "-Dsm=3Dtrue, -Dsm=3Dfalse, libsm=
"
 PACKAGECONFIG[profiler] =3D "-Dprofiler=3Dtrue,-Dprofiler=3Dfalse,syspro=
f"
 PACKAGECONFIG[startup-notification] =3D "-Dstartup_notification=3Dtrue, =
-Dstartup_notification=3Dfalse, startup-notification, startup-notificatio=
n"
=20
-MUTTER_API_NAME =3D "mutter-12"
+MUTTER_API_NAME =3D "mutter-13"
=20
 do_install:prepend() {
     sed -i -e 's|${B}/||g' ${B}/clutter/clutter/clutter-enum-types.c
--=20
2.41.0


