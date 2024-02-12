Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF16C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 17:20:00 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.12320.1707758394150405801
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 09:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id 636AF49698
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 18:19:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.44]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rZZyB-1XGtZx0; Mon, 12 Feb 2024 18:19:51 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libnfs: update 5.0.2 -> 5.0.3
Date: Mon, 12 Feb 2024 18:19:58 +0100
Message-ID: <20240212171958.35956-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1707758391-3BFFC95D-97159FAD/0/0 CLEAN NORMAL
X-TOI-MSGID: 58e16aac-9fb5-49e8-83ff-eb46989f7d03
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 17:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108715

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...s.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch | 12 ++++++------
 .../libnfs/{libnfs_5.0.2.bb =3D> libnfs_5.0.3.bb}      |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-connectivity/libnfs/{libnfs_5.0.2.bb =3D> libnfs_=
5.0.3.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.t=
xt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch b/meta-oe/recipes-connecti=
vity/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-m=
ult.patch
index 55595104a..978f38d01 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-resp=
ect-CMAKE_INSTALL_LIBDIR-for-mult.patch
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-resp=
ect-CMAKE_INSTALL_LIBDIR-for-mult.patch
@@ -29,19 +29,19 @@ Upstream-Status: Pending
  2 files changed, 5 insertions(+), 5 deletions(-)
=20
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4fb0fe7..8e5a0e4 100644
+index 5be774d..6b4fd25 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -6,11 +6,11 @@ project(libnfs
-=20
- set(SOVERSION 11.1.0 CACHE STRING "" FORCE)
+@@ -7,11 +7,11 @@ project(libnfs
+ set(SOVERSION 11.2.0 CACHE STRING "" FORCE)
 =20
+ set(INSTALL_BIN_DIR "${CMAKE_INSTALL_PREFIX}/bin" CACHE PATH "Installat=
ion directory for binaries")
 -set(INSTALL_LIB_DIR "${CMAKE_INSTALL_PREFIX}/lib" CACHE PATH "Installat=
ion directory for libraries")
 +set(INSTALL_LIB_DIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}" C=
ACHE PATH "Installation directory for libraries")
  set(INSTALL_INC_DIR "${CMAKE_INSTALL_PREFIX}/include" CACHE PATH "Insta=
llation directory for headers")
  set(INSTALL_MAN_DIR "${CMAKE_INSTALL_PREFIX}/share/man" CACHE PATH "Ins=
tallation directory for manual pages")
--set(INSTALL_PKGCONFIG_DIR "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" CACHE=
 PATH "Installation directory for pkgconfig (.pc) files")
--set(INSTALL_CMAKE_DIR "${CMAKE_INSTALL_PREFIX}/lib/cmake/libnfs" CACHE =
PATH "Installation directory for cmake (.cmake) files")
+-set(INSTALL_PKGCONFIG_DIR "${INSTALL_LIB_DIR}/pkgconfig" CACHE PATH "In=
stallation directory for pkgconfig (.pc) files")
+-set(INSTALL_CMAKE_DIR "${INSTALL_LIB_DIR}/cmake/libnfs" CACHE PATH "Ins=
tallation directory for cmake (.cmake) files")
 +set(INSTALL_PKGCONFIG_DIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBD=
IR}/pkgconfig" CACHE PATH "Installation directory for pkgconfig (.pc) fil=
es")
 +set(INSTALL_CMAKE_DIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/=
cmake/libnfs" CACHE PATH "Installation directory for cmake (.cmake) files=
")
 =20
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb b/meta-o=
e/recipes-connectivity/libnfs/libnfs_5.0.3.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
rename to meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
index afec2753c..068c827f7 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
@@ -7,7 +7,7 @@ SRC_URI =3D " \
 	git://github.com/sahlberg/libnfs.git;protocol=3Dhttps;branch=3Dmaster \
 	file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch =
\
 "
-SRCREV =3D "40348f45d6beb8a8f50b6b63414a98fc1a061b7d"
+SRCREV =3D "4379837536d9eac537810dc7b13071136049b22a"
 S =3D "${WORKDIR}/git"
=20
 inherit cmake
--=20
2.43.0


