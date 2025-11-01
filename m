Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34949CCF9F0
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 08:23:22 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1822.1761985395742578698
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Nov 2025 01:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id D8E79DE67
	for <openembedded-devel@lists.openembedded.org>; Sat,  1 Nov 2025 09:23:13 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.204]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vF6tD-0bJyYT0; Sat, 1 Nov 2025 09:23:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] libtinyxml2: use cmake buildsystem
Date: Sat,  1 Nov 2025 09:23:08 +0100
Message-ID: <20251101082308.462847-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1761985391-517F9ABA-319464B4/0/0 CLEAN NORMAL
X-TOI-MSGID: c6a67f87-cdac-4d12-8766-0a5936eef965
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Nov 2025 08:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121246

Currently tinyxml2 is built with meson, which doesn't generate files in /=
usr/lib/cmake
Use cmake instead. This will generate files in both /usr/lib/cmake and /u=
sr/lib/pkgconfig
and allow cmake projects to find libtinyxml2.

Avoids errors such as:

| CMake Error at CMakeLists.txt:11 (find_package):
|   By not providing "FindTinyXML2.cmake" in CMAKE_MODULE_PATH this proje=
ct has
|   asked CMake to find a package configuration file provided by "TinyXML=
2",
|   but CMake did not find one.
|
|   Could not find a package configuration file provided by "TinyXML2" wi=
th any
|   of the following names:
|
|     TinyXML2Config.cmake
|     tinyxml2-config.cmake
|
|   Add the installation prefix of "TinyXML2" to CMAKE_PREFIX_PATH or set
|   "TinyXML2_DIR" to a directory containing one of the above files.  If
|   "TinyXML2" provides a separate development package or SDK, be sure it=
 has
|   been installed.
|
|
| -- Configuring incomplete, errors occurred!
---
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb b/=
meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
index 89e6eca99b..09c7e2722c 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
@@ -10,11 +10,11 @@ SRC_URI =3D "git://github.com/leethomason/tinyxml2.gi=
t;branch=3Dmaster;protocol=3Dhttp
            file://run-ptest"
=20
=20
-inherit meson ptest
+inherit cmake ptest
=20
-EXTRA_OEMESON +=3D " \
-    ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dtests=3Dtrue', '', d)}=
 \
-    -Ddefault_library=3Dboth \
+EXTRA_OECMAKE +=3D " \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dtinyxml2_BUILD_TESTING=
=3DON', '', d)} \
+    -DBUILD_SHARED_LIBS=3DON \
 "
=20
 CXXFLAGS:append:libc-musl =3D " -D_LARGEFILE64_SOURCE"
--=20
2.51.0


