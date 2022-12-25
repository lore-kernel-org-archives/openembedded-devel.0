Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CD7C4167B
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 15:00:23 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.118712.1671980421892963392
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 07:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id D62E3190E7
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 16:00:18 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.127]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p9SU0-2J3pYX0; Sun, 25 Dec 2022 16:00:12 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] gnome-desktop: update 42.0 -> 43
Date: Sun, 25 Dec 2022 16:00:06 +0100
Message-Id: <20221225150006.3008502-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671980412-F2FF5ECF-DF1B4911/0/0 CLEAN NORMAL
X-TOI-MSGID: bba98831-a930-4e2d-8be6-41e5ff198b85
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 15:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100229

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ome-desktop_42.0.bb =3D> gnome-desktop_43.bb} | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_42.0.bb =3D=
> gnome-desktop_43.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb=
 b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
index 6eeaed0e1..ed61c2e1f 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
@@ -16,21 +16,21 @@ REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-=
data"
=20
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI[archive.sha256sum] =3D "f3caa293a5e86f6ccad18f817273db1c67061e68=
0d79d839aa8a7528e5bb26d6"
-SRC_URI +=3D " \
-    file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-    file://0001-meson.build-Disable-libseccomp-for-all-archs.patch \
-"
+SRC_URI +=3D "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long=
.patch"
+SRC_URI[archive.sha256sum] =3D "3d6e153317486157596aa3802f87676414c57073=
8f450a94a041fe8835420a69"
=20
 DEPENDS +=3D " \
+    fontconfig \
+    gdk-pixbuf \
+    glib-2.0 \
     gsettings-desktop-schemas \
-    virtual/libx11 \
     gtk+3 \
     gtk4 \
-    startup-notification \
-    xkeyboard-config \
     iso-codes \
-    udev \
+    xext \
+    libxkbcommon \
+    xkeyboard-config \
+    xrandr \
 "
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
--=20
2.34.1


