Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5112AE743CE
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 23:36:48 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.6914.1695944199880188517
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 16:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id E2C40A146
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 01:36:37 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.38]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qm0Yd-1nIxNZ0; Fri, 29 Sep 2023 01:36:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libnfs: dont install libnfs-config.cmake
Date: Fri, 29 Sep 2023 01:36:23 +0200
Message-ID: <20230928233623.767530-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695944195-ADFF8E93-9D3C945C/0/0 CLEAN NORMAL
X-TOI-MSGID: 6d910b1b-1835-4dfb-9264-2d328375f08b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 23:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105230

kodi uses its own FindNFS.cmake	to find	libnfs and succeeds with pkgconfi=
g.
If libnfs-config.cmake is found it will also be utilized (for win/mac?)
which is generally bad for cross-compiling and causes the prefix to get h=
ardcoded
to /usr thus libnfs.so.5.0.2 is taken from the host machine

Removing this file fixes:
| aarch64-poky-linux-ld.lld: error: /usr/lib/libnfs.so.5.0.2 is incompati=
ble with elf64-littleaarch64
| aarch64-poky-linux-clang++: error: linker command failed with exit code=
 1 (use -v to see invocation)
| ninja: build stopped: subcommand failed.

Add CFLAG workaround to fix compiling with clang complaining about
old coding style while gcc doesn't care.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb b/meta-o=
e/recipes-connectivity/libnfs/libnfs_5.0.2.bb
index e0df18a50..a025189b8 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
@@ -3,10 +3,18 @@ HOMEPAGE =3D "https://github.com/sahlberg/libnfs"
 LICENSE =3D "LGPL-2.1-only & BSD-2-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D825301ba17efc9d188ee0abd4b924=
ada"
=20
-SRC_URI =3D "git://github.com/sahlberg/libnfs.git;protocol=3Dhttps;branc=
h=3Dmaster \
-    file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.pat=
ch \
+SRC_URI =3D " \
+	git://github.com/sahlberg/libnfs.git;protocol=3Dhttps;branch=3Dmaster \
+	file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch =
\
 "
 SRCREV =3D "40348f45d6beb8a8f50b6b63414a98fc1a061b7d"
 S =3D "${WORKDIR}/git"
=20
 inherit cmake
+
+do_install:append() {
+	rm -f ${D}${libdir}/cmake/libnfs/libnfs-config.cmake
+}
+
+# Workaround for clang
+CFLAGS +=3D "-Wno-implicit-function-declaration"
--=20
2.42.0


