Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7875FC10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:53:05 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.152492.1672123979440707788
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id 678FDA6FE
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 07:52:57 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.104]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pA3pV-2m9AI80; Tue, 27 Dec 2022 07:52:53 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 4/4] evince: update 42.3 -> 43.1
Date: Tue, 27 Dec 2022 07:52:35 +0100
Message-Id: <20221227065235.95271-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227065235.95271-1-f_l_k@t-online.de>
References: <20221227065235.95271-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672123973-6B7FA9DD-97AF766F/0/0 CLEAN NORMAL
X-TOI-MSGID: bb8828cb-eaad-41c1-ac5b-3120629460c0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100281

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evince/{evince_42.3.bb =3D> evince_43.1.bb} | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)
 rename meta-gnome/recipes-gnome/evince/{evince_42.3.bb =3D> evince_43.1.=
bb} (74%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_42.3.bb b/meta-gnome/=
recipes-gnome/evince/evince_43.1.bb
similarity index 74%
rename from meta-gnome/recipes-gnome/evince/evince_42.3.bb
rename to meta-gnome/recipes-gnome/evince/evince_43.1.bb
index 5f35d5b33..b83c41192 100644
--- a/meta-gnome/recipes-gnome/evince/evince_42.3.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_43.1.bb
@@ -3,41 +3,40 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D96f2f8d5ee576a2163977938ea36f=
a7b"
 SECTION =3D "x11/office"
 DEPENDS =3D " \
-    gnome-common-native \
-    yelp-tools-native \
+    adwaita-icon-theme \
     appstream-glib \
-    gtk+3 \
+    cairo \
+    dbus \
+    gdk-pixbuf \
+    glib-2.0 \
+    gnome-common-native \
+    gnome-desktop \
+    gsettings-desktop-schemas \
     gspell \
-    libsecret \
-    poppler \
     gstreamer1.0-plugins-base \
-    orc \
-    adwaita-icon-theme \
+    gtk+3 \
+    libarchive \
     libhandy \
-    ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop','dbus',=
d)} \
+    libsecret \
+    libxml2 \
+    poppler \
+    yelp-tools-native \
+    zlib \
 "
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introsp=
ection gettext mime-xdg gtk-doc features_check
+inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introsp=
ection gettext mime-xdg gtk-doc features_check gtk-icon-cache
=20
 REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x=
11', 'opengl', '', d)}"
=20
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "49aecf845c946c96db17ba89d75c8002c5ae8963=
f504a9b0626d12675914645e"
+SRC_URI[archive.sha256sum] =3D "6d75ca62b73bfbb600f718a098103dc6b813f905=
0b9594be929e29b4589d2335"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
-EXTRA_OEMESON =3D " \
-    -Dsystemduserunitdir=3Dno \
-"
-
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH=3D"${B}/libdocument/.libs"
-}
-
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[nautilus] =3D "-Dnautilus=3Dtrue,-Dnautilus=3Dfalse,nautil=
us"
=20
@@ -49,5 +48,6 @@ PACKAGES =3D+ "${PN}-nautilus-extension"
 FILES:${PN} +=3D "${datadir}/dbus-1 \
                 ${datadir}/metainfo \
                 ${datadir}/thumbnailers \
+                ${systemd_user_unitdir} \
 "
 FILES:${PN}-nautilus-extension =3D "${libdir}/nautilus/*/*so"
--=20
2.34.1


