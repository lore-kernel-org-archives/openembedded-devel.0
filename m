Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458A1E7716D
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 12:34:33 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.9775.1733402064964557842
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Dec 2024 04:34:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout02.t-online.de (Postfix) with SMTP id C5FEEBBB
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Dec 2024 13:34:22 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.36.186]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tJB3m-0dfANV0; Thu, 5 Dec 2024 13:34:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gthumb: update 3.12.4 -> 3.12.6
Date: Thu,  5 Dec 2024 13:34:14 +0100
Message-ID: <20241205123414.309181-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1733402062-8E7FB9BF-07F38D74/0/0 CLEAN NORMAL
X-TOI-MSGID: dfcf6195-bd2e-487a-bf85-47a12dbe760c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 12:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114202

- add support for jxl, webp, gstreamer
- add more PACKAGECONFIG options
- disable webservices to avoid pulling in deprecated libsoup2
- remove yelp-native dependency
- dont build colord by default to make buildable without polkit
- drop polkit and gobject-introspection from REQUIRED_DISTRO_FEATURES

Version 3.12.6
~~~~~~~~~~~~~~
Released: 2024-03-10

Features:
 * WebAlbums: allow Exif image title to be used. (Linas Vepstas)

Bugfixes:
 * Fixed 'could not perform operation' when editing a modified image.
 * Video thumbnailer: use the default thumbnail size if invalid. (Linas V=
epstas)
 * Video thumbnailer: avoid a null pointer dereference and crash. (Linas =
Vepstas)

Translations:
 * Slovenian (Martin Srebotnjak)

Version 3.12.5
~~~~~~~~~~~~~~
Released: 2024-02-18

Bugfixes:
 * Add to catalog: show the next image only when in viewer mode (!313)
 * jxl: added support for version 0.9.0 (Timo Gurr) (!306)
 * Commenting a picture deletes its Color Profile tag. This only
   happened when the 'Store metadata inside files if possible' option
   was active. (!293)

Translations:
 * Chinese/Traditional (Cheng-Chia Tseng)
 * Turkish (Sabri =C3=9Cnal)
 * =C4=8De=C5=A1tina (Daniel Rusek)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gthumb/gthumb_3.12.4.bb     | 30 -----------------
 .../recipes-gnome/gthumb/gthumb_3.12.6.bb     | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 30 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb
 create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb b/meta-gnom=
e/recipes-gnome/gthumb/gthumb_3.12.4.bb
deleted file mode 100644
index 79db8b7d7..000000000
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY =3D "Image viewer and browser"
-LICENSE=3D"GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
-
-
-REQUIRED_DISTRO_FEATURES =3D "polkit gobject-introspection-data"
-
-DEPENDS =3D " \
-    glib-2.0-native \
-    bison-native \
-    yelp-tools-native \
-    gtk+3 \
-    gsettings-desktop-schemas \
-    zlib \
-    jpeg \
-    exiv2 \
-    colord \
-    lcms \
-    libraw \
-    librsvg \
-    libsoup \
-    json-glib \
-    libsecret \
-"
-
-inherit features_check gnomebase gnome-help gsettings itstool mime-xdg
-
-SRC_URI[archive.sha256sum] =3D "add693ac0aeb9a30d829ba03a06208289d3f6868=
dc3b02573549e88190c794e8"
-
-FILES:${PN} +=3D "${datadir}/metainfo"
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb b/meta-gnom=
e/recipes-gnome/gthumb/gthumb_3.12.6.bb
new file mode 100644
index 000000000..5c69152c1
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb
@@ -0,0 +1,32 @@
+SUMMARY =3D "Image viewer and browser"
+LICENSE=3D"GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
+
+DEPENDS =3D " \
+    glib-2.0-native \
+    bison-native \
+    gtk+3 \
+    gsettings-desktop-schemas \
+    zlib \
+    jpeg \
+    json-glib \
+"
+
+PACKAGECONFIG ?=3D "exiv2 gstreamer lcms libjxl libraw librsvg libwebp"
+PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Dtrue,-Dgstreamer=3Dfalse,gst=
reamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[libwebp] =3D "-Dlibwebp=3Dtrue,-Dlibwebp=3Dfalse,libwebp"
+PACKAGECONFIG[libjxl] =3D "-Dlibjxl=3Dtrue,-Dlibjxl=3Dfalse,libjxl"
+PACKAGECONFIG[lcms] =3D "-Dlcms2=3Dtrue,-Dlcms2=3Dfalse,lcms"
+PACKAGECONFIG[colord] =3D "-Dcolord=3Dtrue,-Dcolord=3Dfalse,colord"
+PACKAGECONFIG[exiv2] =3D "-Dexiv2=3Dtrue,-Dexiv2=3Dfalse,exiv2"
+PACKAGECONFIG[librsvg] =3D "-Dlibrsvg=3Dtrue,-Dlibrsvg=3Dfalse,librsvg"
+PACKAGECONFIG[libraw] =3D "-Dlibraw=3Dtrue,-Dlibraw=3Dfalse,libraw"
+
+# webservices would require libsecret and webkitgtk3 build with deprecat=
ed libsoup2
+EXTRA_OEMESON +=3D "-Dwebservices=3Dfalse -Dlibsecret=3Dfalse"
+
+inherit gnomebase gnome-help gsettings itstool mime-xdg
+
+SRC_URI[archive.sha256sum] =3D "608770c6c8e73073a1d404b65bd1b761e1ac5dc2=
5e70130ff072488fa92f5c33"
+
+FILES:${PN} +=3D "${datadir}/metainfo"
--=20
2.47.0


