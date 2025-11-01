Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356FBCCF9F0
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 08:15:52 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1759.1761984947066611033
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Nov 2025 01:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout06.t-online.de (Postfix) with SMTP id 29B461C1E3
	for <openembedded-devel@lists.openembedded.org>; Sat,  1 Nov 2025 09:15:44 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.204]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vF6lz-4HZfWb0; Sat, 1 Nov 2025 09:15:43 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libtinyxml2: use cmake buildsystem
Date: Sat,  1 Nov 2025 09:15:37 +0100
Message-ID: <20251101081537.437029-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1761984943-ADFF8992-52FD5A0A/0/0 CLEAN NORMAL
X-TOI-MSGID: 579b3f2d-2686-4e03-953e-042681679c11
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Nov 2025 08:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121245

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
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb b/=
meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
index 89e6eca99b..84baeca8d9 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
@@ -10,7 +10,7 @@ SRC_URI =3D "git://github.com/leethomason/tinyxml2.git;=
branch=3Dmaster;protocol=3Dhttp
            file://run-ptest"
=20
=20
-inherit meson ptest
+inherit cmake ptest
=20
 EXTRA_OEMESON +=3D " \
     ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dtests=3Dtrue', '', d)}=
 \
--=20
2.51.0


