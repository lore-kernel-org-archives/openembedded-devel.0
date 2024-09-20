Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F9DCF9C41
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:31 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.20597.1726844891921625278
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id D1E4C2E7E2
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfEV-3JaG0b0; Fri, 20 Sep 2024 17:07:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 21/23] evolution-data-server: update
Date: Fri, 20 Sep 2024 17:08:20 +0200
Message-ID: <20240920150822.1131707-21-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726844863-567FA467-64D608E4/0/0 CLEAN NORMAL
X-TOI-MSGID: bfd958c0-b83a-48f5-bcc7-8a65bb847092
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112422

- Add cairo dependency
- Allow to work with gtk3
- Add patch to avoid pulling in a found
  google-id. It fails and would probably also
  break reproducibility
- inherit mime-xdg

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server.bb                  | 15 ++++---
 .../evolution-data-server.inc                 |  4 +-
 ...txt-dont-create-automatic-google-log.patch | 39 +++++++++++++++++++
 3 files changed, 51 insertions(+), 7 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolut=
ion-data-server/0001-data-CMakeLists.txt-dont-create-automatic-google-log=
.patch

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
index fc1925314..ca9fe84e7 100644
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
@@ -34,15 +35,19 @@ EXTRA_OECMAKE =3D " \
     -DENABLE_INSTALLED_TESTS=3DOFF \
     -DENABLE_EXAMPLES=3DOFF \
     -DENABLE_MAINTAINER_MODE=3DOFF \
+    -D_decoded_EXITCODE=3D0 \
+    -DGOOGLE_CLIENT_ID=3D'' \
+    -DGOOGLE_CLIENT_SECRET=3D"" \
 "
=20
+
 EXTRA_OECMAKE:append:class-target =3D " -DG_IR_COMPILER=3D${STAGING_BIND=
IR}/g-ir-compiler-wrapper"
 EXTRA_OECMAKE:append:class-target =3D " -DG_IR_SCANNER=3D${STAGING_BINDI=
R}/g-ir-scanner-wrapper"
=20
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


