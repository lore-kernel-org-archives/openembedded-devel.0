Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBCEC4708C
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 12:29:12 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.90542.1669552142231546197
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 04:29:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout02.t-online.de (Postfix) with SMTP id 5BF752CE8
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 13:29:00 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.231.234]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozGmJ-0sD6nO0; Sun, 27 Nov 2022 13:28:59 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv3 06/14] mutter: update 42.0 -> 43.1
Date: Sun, 27 Nov 2022 13:28:38 +0100
Message-Id: <20221127122846.1406944-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127122846.1406944-1-f_l_k@t-online.de>
References: <20221127122846.1406944-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669552140-D9A4E9D3-ED6BEF7F/0/0 CLEAN NORMAL
X-TOI-MSGID: 0ad8c2d8-2e84-4efd-bae3-4d26fb93db97
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 12:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99773

- build with gtk4

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mutter/{mutter_42.0.bb =3D> mutter_43.1.bb}            | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_42.0.bb =3D> mutter_43.1.=
bb} (92%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_42.0.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_43.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/mutter/mutter_42.0.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_43.1.bb
index 785536280..9b764c666 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_42.0.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_43.1.bb
@@ -7,7 +7,7 @@ DEPENDS =3D " \
     wayland-native \
     virtual/libx11 \
     graphene \
-    gtk+3 \
+    gtk4 \
     gdk-pixbuf \
     cairo \
     pango \
@@ -17,7 +17,7 @@ DEPENDS =3D " \
     gnome-settings-daemon \
     libxtst \
     libxkbfile \
-    xinerama \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xinerama', '', d)} \
     xwayland \
 "
=20
@@ -25,7 +25,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "d1e240446b7f8cd8a3ff9daae336c1c9016193ba=
7e0769c79a5e6c03849022e5"
+SRC_URI[archive.sha256sum] =3D "f2f08b252783948a5ecc82f00e9e935a61ebbf85=
64844bdd92788ab44aa78264"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
@@ -60,7 +60,7 @@ PACKAGECONFIG[sm] =3D "-Dsm=3Dtrue, -Dsm=3Dfalse, libsm=
"
 PACKAGECONFIG[profiler] =3D "-Dprofiler=3Dtrue,-Dprofiler=3Dfalse,syspro=
f"
 PACKAGECONFIG[startup-notification] =3D "-Dstartup_notification=3Dtrue, =
-Dstartup_notification=3Dfalse, startup-notification, startup-notificatio=
n"
=20
-MUTTER_API_NAME =3D "mutter-10"
+MUTTER_API_NAME =3D "mutter-11"
=20
 do_install:append() {
     # Add gir links in standard paths. That makes dependents life much e=
asier
@@ -78,6 +78,7 @@ PACKAGES =3D+ "${PN}-tests ${PN}-gsettings"
=20
 FILES:${PN} +=3D " \
     ${datadir}/gnome-control-center \
+    ${datadir}/gir-1.0 \
     ${libdir}/${MUTTER_API_NAME}/lib*${SOLIBS} \
     ${libdir}/${MUTTER_API_NAME}/*.typelib \
     ${libdir}/${MUTTER_API_NAME}/plugins \
--=20
2.34.1


