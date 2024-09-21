Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44031CF9C5B
	for <webhook@archiver.kernel.org>; Sat, 21 Sep 2024 16:21:45 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.12596.1726935702284795344
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 09:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout03.t-online.de (Postfix) with SMTP id 5CB0A5CC8F;
	Sat, 21 Sep 2024 18:21:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.36.251]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ss2rb-1Ddp7B0; Sat, 21 Sep 2024 18:21:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCHv2] evolution-data-server: update
Date: Sat, 21 Sep 2024 18:23:24 +0200
Message-ID: <20240921162324.32064-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726935699-797F8416-1EB86F1B/0/0 CLEAN NORMAL
X-TOI-MSGID: e12b9012-506e-4544-ac9c-44f2214a6afd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 16:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112434

- Add cairo dependency
- Allow to work with gtk3
- Add patch to avoid pulling in a found
  google-id. It fails and would probably also
  break reproducibility
- inherit mime-xdg

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../evolution-data-server.bb                  | 11 +++---
 .../evolution-data-server.inc                 |  4 +-
 ...txt-dont-create-automatic-google-log.patch | 39 +++++++++++++++++++
 3 files changed, 47 insertions(+), 7 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolut=
ion-data-server/0001-data-CMakeLists.txt-dont-create-automatic-google-log=
.patch

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
index fc1925314..384484e0d 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
@@ -1,12 +1,12 @@
 require ${BPN}.inc
=20
 DEPENDS =3D " \
-    ${BPN}-native gperf-native \
-    glib-2.0 json-glib gtk4 libxml2 icu \
-    dbus db virtual/libiconv zlib libsoup-3.0 libical nss libsecret \
+    ${BPN}-native cairo gperf-native \
+    glib-2.0 json-glib gtk+3 gtk4 libxml2 icu \
+    dbus db virtual/libiconv zlib libsoup nspr libical nss libsecret \
 "
=20
-inherit pkgconfig gsettings gobject-introspection features_check gtk-doc=
 gettext perlnative vala
+inherit pkgconfig gsettings gobject-introspection mime-xdg features_chec=
k gtk-doc gettext perlnative vala
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
@@ -17,6 +17,7 @@ SRC_URI +=3D " \
     file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
     file://0003-contact-Replace-the-Novell-sample-contact-with-somet.pat=
ch \
     file://0004-call-native-helpers.patch \
+    file://0001-data-CMakeLists.txt-dont-create-automatic-google-log.pat=
ch \
     file://iconv-detect.h \
 "
=20
@@ -42,7 +43,7 @@ EXTRA_OECMAKE:append:class-target =3D " -DG_IR_SCANNER=3D=
${STAGING_BINDIR}/g-ir-scan
 PACKAGECONFIG ?=3D "goa oauth"
=20
 PACKAGECONFIG[canberra] =3D "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3D=
OFF,libcanberra"
-PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK4=3DON -DENABLE_OA=
UTH2_WEBKITGTK=3DOFF,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF -DENABLE_OAUTH2_WEB=
KITGTK=3DOFF,webkitgtk json-glib"
+PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK4=3DON -DENABLE_OA=
UTH2_WEBKITGTK=3DON,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF -DENABLE_OAUTH2_WEBK=
ITGTK=3DOFF,webkitgtk json-glib"
 PACKAGECONFIG[goa]    =3D "-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-on=
line-accounts"
 PACKAGECONFIG[kerberos]    =3D "-DWITH_KRB5=3DON,-DWITH_KRB5=3DOFF,krb5"
 # BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs =
when
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server.inc
index 33190c461..340c63998 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
@@ -10,5 +10,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d1925=
5cf0557f3fe7d7068212 \
 GNOMEBASEBUILDCLASS =3D "cmake"
 inherit gnomebase upstream-version-is-even
=20
-SRC_URI[archive.sha256sum] =3D "91f4ffc38a1b8d2fe8939834449ac541c0bff4a3=
9b444edc2a9529344a28e98a"
-PV =3D "3.50.1"
+SRC_URI[archive.sha256sum] =3D "a54b47b977a97030f738a412f4f5d5b2efbef5e0=
ebe8929b7cce00ac54681084"
+PV =3D "3.54.0"
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server/0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch =
b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/00=
01-data-CMakeLists.txt-dont-create-automatic-google-log.patch
new file mode 100644
index 000000000..d23eb8b6e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r/0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch
@@ -0,0 +1,39 @@
+From 9b949bd47ed9e5596a9d37c60aa947def9c41db9 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sun, 15 Sep 2024 22:31:49 +0200
+Subject: [PATCH] data/CMakeLists.txt: dont create automatic google login
+
+Inappropriate for cross-compiling
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ data/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/data/CMakeLists.txt b/data/CMakeLists.txt
+index 8fa642909..bb1b0c4da 100644
+--- a/data/CMakeLists.txt
++++ b/data/CMakeLists.txt
+@@ -29,7 +29,7 @@ add_icon_cache_files("${SHARE_INSTALL_PREFIX}" alarm_n=
otify_icon)
+ # ********************************
+=20
+ set(OAUTH2_SCHEMES "x-scheme-handler/eds-oauth2;")
+-if(NOT WITH_GOOGLE_CLIENT_ID STREQUAL "")
++if(0)
+ 	set(CMAKE_REQUIRED_DEFINITIONS ${DATA_SERVER_CFLAGS})
+ 	set(CMAKE_REQUIRED_INCLUDES ${CMAKE_BINARY_DIR} ${DATA_SERVER_INCLUDE_=
DIRS})
+ 	set(CMAKE_REQUIRED_LIBRARIES ${DATA_SERVER_LDFLAGS})
+@@ -50,7 +50,7 @@ if(NOT WITH_GOOGLE_CLIENT_ID STREQUAL "")
+ 		set(OAUTH2_SCHEMES "x-scheme-handler/${_google_oauth2_scheme};${OAUTH=
2_SCHEMES}")
+ 	endif(NOT _google_oauth2_scheme STREQUAL "")
+ 	unset(_google_oauth2_scheme)
+-endif(NOT WITH_GOOGLE_CLIENT_ID STREQUAL "")
++endif(0)
+=20
+ configure_file(org.gnome.evolution-data-server.OAuth2-handler.desktop.i=
n
+ 	org.gnome.evolution-data-server.OAuth2-handler.desktop.in
+--=20
+2.46.0
+
--=20
2.46.0


