Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D06E7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 13:11:23 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.10538.1733404281366077908
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Dec 2024 05:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id 68CB4B0C
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Dec 2024 14:11:19 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.36.186]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tJBdV-4BnMnZ0; Thu, 5 Dec 2024 14:11:17 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv3] gthumb: update 3.12.4 -> 3.12.6
Date: Thu,  5 Dec 2024 14:11:15 +0100
Message-ID: <20241205131115.567116-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1733404277-637FDB9C-D9401771/0/0 CLEAN NORMAL
X-TOI-MSGID: 691d9d37-d4ac-40b2-b0bf-a2a73fa5c6a4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 13:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114206

- add support for jxl, webp, gstreamer
- add more PACKAGECONFIG options
- disable webservices to avoid pulling in deprecated libsoup2
- remove yelp-native dependency
- build colord dependent on polkit feature
- drop polkit and gobject-introspection from REQUIRED_DISTRO_FEATURES
- add backport patch to fix 32-bit

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
 ...9483afd1215378c8b9871f51cd61770e53e7.patch | 49 +++++++++++++++++++
 .../recipes-gnome/gthumb/gthumb_3.12.4.bb     | 30 ------------
 .../recipes-gnome/gthumb/gthumb_3.12.6.bb     | 34 +++++++++++++
 3 files changed, 83 insertions(+), 30 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb/283c9483afd121=
5378c8b9871f51cd61770e53e7.patch
 delete mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb
 create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb/283c9483afd1215378c8b=
9871f51cd61770e53e7.patch b/meta-gnome/recipes-gnome/gthumb/gthumb/283c94=
83afd1215378c8b9871f51cd61770e53e7.patch
new file mode 100644
index 000000000..c2dbce0c1
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb/283c9483afd1215378c8b9871f51=
cd61770e53e7.patch
@@ -0,0 +1,49 @@
+From b48e34c436eb59877b0fe75ba3bf724c0de4dc36 Mon Sep 17 00:00:00 2001
+From: Pino Toscano <toscano.pino@tiscali.it>
+Date: Sat, 7 Sep 2024 09:40:49 +0200
+Subject: [PATCH] migrate-catalogs: properly use time_t for localtime()
+
+Commit ed219c771bc0c63e1a7847e44c81f43223454eac changed the type of the
+'date' variable from 'time_t' to 'long', to ensure the right type is
+handled by sscanf(). The problem is that, in case 'time_t' is not the
+same as 'long', the wrong pointer is passed to localtime(), and more
+strict build flags (such as the defaults of GCC 14) cause the build to
+fail on such setups.
+
+The ideal fix in this case would be to switch back the 'date' variable
+to 'time_t' and use the right format specifier for it in sscanf();
+however, since this is an helper to convert very old format, this
+additional code is not much worth it. Hence, use a simpler fix: in case
+a date timestamp was read from the file, set it to a new 'time_t'
+variable which is then used for localtime(). Since 'time_t' is big at
+least as much as 'long', there is no precision/value loss.
+
+There should be no behaviour change.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gthumb/-/commi=
t/283c9483afd1215378c8b9871f51cd61770e53e7]
+---
+ gthumb/main-migrate-catalogs.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gthumb/main-migrate-catalogs.c b/gthumb/main-migrate-catalo=
gs.c
+index 75f5cb11d..e194ed19f 100644
+--- a/gthumb/main-migrate-catalogs.c
++++ b/gthumb/main-migrate-catalogs.c
+@@ -308,12 +308,13 @@ migration_for_each_file (GFile     *file,
+ 				sscanf (line, "%d", &date_scope);
+=20
+ 				if ((date > 0) && (date_scope >=3D 1) && (date_scope <=3D 3)) {
++					time_t	     date_as_time =3D date;
+ 					struct tm   *tm;
+ 					GthDateTime *dt;
+ 					char        *exif_date;
+ 					char        *op;
+=20
+-					tm =3D localtime (&date);
++					tm =3D localtime (&date_as_time);
+ 					dt =3D gth_datetime_new ();
+ 					gth_datetime_from_struct_tm (dt, tm);
+ 					exif_date =3D gth_datetime_to_exif_date (dt);
+--=20
+GitLab
+
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
index 000000000..891717858
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.6.bb
@@ -0,0 +1,34 @@
+SUMMARY =3D "Image viewer and browser"
+LICENSE=3D"GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
+
+DEPENDS =3D " \
+    glib-2.0 \
+    glib-2.0-native \
+    bison-native \
+    gtk+3 \
+    gsettings-desktop-schemas \
+    zlib \
+    jpeg \
+    json-glib \
+"
+
+PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'c=
olord', '', d)} exiv2 gstreamer lcms libjxl libraw librsvg libwebp"
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
+# webservices would require libsecret and webkitgtk3 built with deprecat=
ed libsoup2
+EXTRA_OEMESON +=3D "-Dwebservices=3Dfalse -Dlibsecret=3Dfalse"
+
+inherit gnomebase gnome-help gsettings itstool mime-xdg
+
+SRC_URI +=3D "file://283c9483afd1215378c8b9871f51cd61770e53e7.patch"
+SRC_URI[archive.sha256sum] =3D "608770c6c8e73073a1d404b65bd1b761e1ac5dc2=
5e70130ff072488fa92f5c33"
+
+FILES:${PN} +=3D "${datadir}/metainfo"
--=20
2.47.0


