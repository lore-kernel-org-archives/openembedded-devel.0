Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01201C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 16:18:25 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web09.16703.1646583503162894381
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 08:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout08.t-online.de (Postfix) with SMTP id 3C1CB5724
	for <openembedded-devel@lists.openembedded.org>;
 Sun,  6 Mar 2022 17:18:21 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.165.147]) by fwd88.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nQtaM-1m1lIH0; Sun, 6 Mar 2022 17:18:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] evolution-data-server: update to v3.43.1
Date: Sun,  6 Mar 2022 17:18:05 +0100
Message-Id: <20220306161805.1992577-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1646583498-00013579-D1A44E80/0/0 CLEAN NORMAL
X-TOI-MSGID: 8affa904-fd05-4fc7-8d08-35d23b5ad733
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 16:18:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95817

fix evolution-data-server build in the same way it was done for libical

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server.bb                      |  3 ++-
 .../evolution-data-server.inc                     |  4 ++--
 ...cmake-Do-not-export-CC-into-gir-compiler.patch | 15 +++++++++++++++
 3 files changed, 19 insertions(+), 3 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolut=
ion-data-server/0001-cmake-Do-not-export-CC-into-gir-compiler.patch

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
index 59856f3ab..f6b719392 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
@@ -11,6 +11,7 @@ inherit pkgconfig gsettings gobject-introspection featu=
res_check cmake gtk-doc g
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 SRC_URI +=3D " \
+    file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
     file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
     file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
     file://0003-contact-Replace-the-Novell-sample-contact-with-somet.pat=
ch \
@@ -25,7 +26,7 @@ GI_DATA_ENABLED=3D"False"
 EXTRA_OECMAKE =3D " \
     -DSYSCONF_INSTALL_DIR=3D${sysconfdir} \
     -DWITH_KRB5=3DOFF \
-    -DENABLE_UOA=3DOFF \
+    -DENABLE_GOA=3DOFF \
     -DENABLE_GOOGLE_AUTH=3DOFF \
     -DENABLE_WEATHER=3DOFF \
     -DVAPIGEN=3D${STAGING_BINDIR_NATIVE}/vapigen \
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server.inc
index d22310f7e..bcbe20d75 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d19255c=
f0557f3fe7d7068212 \
=20
 inherit gnomebase upstream-version-is-even
=20
-SRC_URI[archive.sha256sum] =3D "6f5847a1234799073e9585db861c21381a09ed55=
0dc0a2125f00ba5f90bd361d"
-PV =3D "3.42.3"
+SRC_URI[archive.sha256sum] =3D "8c437af75edbef196034f7913f505c3f68acc185=
15a6eed20f3ef52452785898"
+PV =3D "3.43.1"
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server/0001-cmake-Do-not-export-CC-into-gir-compiler.patch b/meta-gnome=
/recipes-gnome/evolution-data-server/evolution-data-server/0001-cmake-Do-=
not-export-CC-into-gir-compiler.patch
new file mode 100644
index 000000000..d02cdf9c7
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Pending
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+--- a/cmake/modules/GObjectIntrospection.cmake	2022-01-07 10:39:38.00000=
0000 +0100
++++ b/cmake/modules/GObjectIntrospection.cmake	2022-03-06 16:58:57.54641=
8495 +0100
+@@ -122,7 +122,7 @@
+ 		file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/${_gir_name}_files "${_gir_fil=
es}")
+=20
+ 		add_custom_command(
+-			COMMAND ${CMAKE_COMMAND} -E env "CC=3D'${CMAKE_C_COMPILER}'" LDFLAGS=
=3D
++			COMMAND ${GObjectIntrospection_SCANNER}
+ 				${INTROSPECTION_SCANNER_ENV}
+ 				${G_IR_SCANNER}
+ 				${INTROSPECTION_SCANNER_ARGS}
--=20
2.25.1


