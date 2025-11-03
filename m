Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862A1CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:51:28 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15665.1762156281931874753
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id EDD55E60F
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Nov 2025 08:51:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.185]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vFpLQ-1gXsqP0; Mon, 3 Nov 2025 08:51:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] libtinyxml2: use cmake buildsystem
Date: Mon,  3 Nov 2025 08:50:55 +0100
Message-ID: <20251103075055.300411-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1762156276-8A7FBA1D-821058FE/0/0 CLEAN NORMAL
X-TOI-MSGID: 42371a36-f1be-4ee5-800c-06759617adba
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 07:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121267

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
 .../recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb b/=
meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
index 89e6eca99b..d295b99f3d 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
@@ -9,14 +9,13 @@ SRCREV =3D "9148bdf719e997d1f474be6bcc7943881046dba1"
 SRC_URI =3D "git://github.com/leethomason/tinyxml2.git;branch=3Dmaster;p=
rotocol=3Dhttps \
            file://run-ptest"
=20
+inherit cmake ptest
=20
-inherit meson ptest
-
-EXTRA_OEMESON +=3D " \
-    ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dtests=3Dtrue', '', d)}=
 \
-    -Ddefault_library=3Dboth \
-"
+EXTRA_OECMAKE +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', '-Dtinyxm=
l2_BUILD_TESTING=3DON', '', d)}"
=20
+PACKAGECONFIG ?=3D "shared-libs"
+PACKAGECONFIG[shared-libs] =3D "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_=
LIBS=3DOFF"=20
+=20
 CXXFLAGS:append:libc-musl =3D " -D_LARGEFILE64_SOURCE"
=20
 do_install_ptest() {
--=20
2.51.0


