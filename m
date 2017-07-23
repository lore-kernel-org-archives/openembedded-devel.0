Return-Path: <Alexey_Firago@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4888071AB8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jul 2017 17:43:50 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1dZKv1-0007K8-I4 from Alexey_Firago@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jul 2017 10:43:51 -0700
Received: from localhost.localdomain (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Sun, 23 Jul 2017 18:43:50 +0100
From: Alexey Firago <alexey_firago@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 23 Jul 2017 20:43:43 +0300
Message-ID: <1500831823-32660-1-git-send-email-alexey_firago@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] c-ares: update 1.12.0 -> 1.13.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Jul 2017 17:43:50 -0000
Content-Type: text/plain

Update to c-ares version 1.13.0 from June 20 2017

Recipe updates:
 * Change SRC_URI to github, because tarball at
   https://c-ares.haxx.se/download/c-ares-1.13.0.tar.gz
   does not include all required files (cmake related).
 * Change build method to cmake. Library now supports cmake
   build system and installs *.cmake config files. These files can
   be used by several libraries/packages, such as gRPC, curl.

Highlights of library changes and bug fixes:
 * cmake build system support added
 * Add virtual function set for socket IO: ares_set_socket_functions
 * CVE-2017-1000381: c-ares NAPTR parser out of bounds access

Full changelog - https://c-ares.haxx.se/changelog.html

Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
---
 ...configure.ac-don-t-override-passed-cflags.patch | 26 ----------------------
 .../recipes-support/c-ares/c-ares_1.12.0.bb        | 15 -------------
 .../recipes-support/c-ares/c-ares_1.13.0.bb        | 16 +++++++++++++
 3 files changed, 16 insertions(+), 41 deletions(-)
 delete mode 100644 meta-networking/recipes-support/c-ares/c-ares/0001-configure.ac-don-t-override-passed-cflags.patch
 delete mode 100644 meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
 create mode 100644 meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb

diff --git a/meta-networking/recipes-support/c-ares/c-ares/0001-configure.ac-don-t-override-passed-cflags.patch b/meta-networking/recipes-support/c-ares/c-ares/0001-configure.ac-don-t-override-passed-cflags.patch
deleted file mode 100644
index 10fad4e..0000000
--- a/meta-networking/recipes-support/c-ares/c-ares/0001-configure.ac-don-t-override-passed-cflags.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 2a7236d2a7bb9c3d3c3f44ebf59404bf7134fcb3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
-Date: Tue, 12 Apr 2016 11:37:28 +0100
-Subject: [PATCH] configure.ac: don't override passed cflags
-
-We are controlling debug and optimiser flags from OE
----
- configure.ac | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5c02450..3cf9fcd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -147,8 +147,6 @@ dnl **********************************************************************
- 
- CARES_CHECK_COMPILER
- CARES_SET_COMPILER_BASIC_OPTS
--CARES_SET_COMPILER_DEBUG_OPTS
--CARES_SET_COMPILER_OPTIMIZE_OPTS
- CARES_SET_COMPILER_WARNING_OPTS
- 
- if test "$compiler_id" = "INTEL_UNIX_C"; then
--- 
-2.8.0.rc3
-
diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
deleted file mode 100644
index 4e28d6a..0000000
--- a/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-# Copyright (c) 2012-2014 LG Electronics, Inc.
-
-SUMMARY = "c-ares is a C library that resolves names asynchronously."
-HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
-SECTION = "libs"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f4b026880834eb01c035c5e5cb47ccac"
-
-SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz \
-           file://0001-configure.ac-don-t-override-passed-cflags.patch \
-"
-SRC_URI[md5sum] = "2ca44be1715cd2c5666a165d35788424"
-SRC_URI[sha256sum] = "8692f9403cdcdf936130e045c84021665118ee9bfea905d1a76f04d4e6f365fb"
-
-inherit autotools pkgconfig
diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
new file mode 100644
index 0000000..46f0198
--- /dev/null
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
@@ -0,0 +1,16 @@
+# Copyright (c) 2012-2014 LG Electronics, Inc.
+SUMMARY = "c-ares is a C library that resolves names asynchronously."
+HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f4b026880834eb01c035c5e5cb47ccac"
+SRCREV = "3be1924221e1326df520f8498d704a5c4c8d0cce"
+PV = "1.13.0+gitr${SRCPV}"
+
+SRC_URI = "git://github.com/c-ares/c-ares.git"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+FILES_${PN}-dev += "${libdir}/cmake"
-- 
2.7.4


