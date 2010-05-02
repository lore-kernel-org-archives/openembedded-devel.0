Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O8doq-00014r-AV
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 20:23:11 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id C2E364B0134;
	Sun,  2 May 2010 20:19:21 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id C61434B00A5;
	Sun,  2 May 2010 20:19:18 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 May 2010 20:19:08 +0200
Message-Id: <1272824348-17407-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] zlib: convert to BBCLASSEXTAND and add version 1.2.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 May 2010 18:23:11 -0000

- convert to BBCLASSEXTAND
- unify versions with .inc file
- add version 1.2.5 with updated autotool patch for this version

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 recipes/zlib/files/0001-autotools.patch |   57 +++++++++++++++++++++++++++++++
 recipes/zlib/zlib-native_1.2.3.bb       |    8 ----
 recipes/zlib/zlib-sdk_1.2.3.bb          |    4 --
 recipes/zlib/zlib.inc                   |   14 +++++++
 recipes/zlib/zlib_1.2.3.bb              |   22 ++----------
 recipes/zlib/zlib_1.2.5.bb              |   10 +++++
 6 files changed, 85 insertions(+), 30 deletions(-)
 create mode 100644 recipes/zlib/files/0001-autotools.patch
 delete mode 100644 recipes/zlib/zlib-native_1.2.3.bb
 delete mode 100644 recipes/zlib/zlib-sdk_1.2.3.bb
 create mode 100644 recipes/zlib/zlib.inc
 create mode 100644 recipes/zlib/zlib_1.2.5.bb

diff --git a/recipes/zlib/files/0001-autotools.patch b/recipes/zlib/files/0001-autotools.patch
new file mode 100644
index 0000000..6642860
--- /dev/null
+++ b/recipes/zlib/files/0001-autotools.patch
@@ -0,0 +1,57 @@
+From d6b0c74edb3fc58060d1ab337bcb1f838328ebbf Mon Sep 17 00:00:00 2001
+From: Eric Benard <eric@eukrea.com>
+Date: Sun, 2 May 2010 10:49:05 +0200
+Subject: [PATCH] autotools
+
+---
+ Makefile.am  |   12 ++++++++++++
+ configure.ac |   17 +++++++++++++++++
+ 2 files changed, 29 insertions(+), 0 deletions(-)
+ create mode 100644 Makefile.am
+ create mode 100644 configure.ac
+
+diff --git a/Makefile.am b/Makefile.am
+new file mode 100644
+index 0000000..76976fb
+--- /dev/null
++++ b/Makefile.am
+@@ -0,0 +1,12 @@
++lib_LTLIBRARIES = libz.la
++
++libz_la_SOURCES = adler32.c compress.c crc32.c gzclose.c gzlib.c gzread.c gzwrite.c \
++		uncompr.c deflate.c trees.c zutil.c inflate.c infback.c inftrees.c \
++		inffast.c
++
++libz_la_LDFLAGS = -version-number 1:2:5
++
++include_HEADERS = zconf.h zlib.h
++
++pkgconfigdir = $(libdir)/pkgconfig
++pkgconfig_DATA = zlib.pc
+diff --git a/configure.ac b/configure.ac
+new file mode 100644
+index 0000000..177c89a
+--- /dev/null
++++ b/configure.ac
+@@ -0,0 +1,17 @@
++AC_INIT(zlib,1.2.5)
++AC_CONFIG_SRCDIR(adler32.c)
++AM_INIT_AUTOMAKE(zlibs,1.2.5)
++
++AC_PREREQ([2.59])
++
++AC_PROG_CC([gcc])
++AC_PROG_LIBTOOL
++
++AC_HEADER_STDC
++
++AC_CONFIG_FILES([
++Makefile
++zlib.pc
++])
++
++AC_OUTPUT
+\ No newline at end of file
+-- 
+1.6.3.3
+
diff --git a/recipes/zlib/zlib-native_1.2.3.bb b/recipes/zlib/zlib-native_1.2.3.bb
deleted file mode 100644
index 4bb5d28..0000000
--- a/recipes/zlib/zlib-native_1.2.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require zlib_${PV}.bb
-ZLIB_EXTRA = ""
-DEPENDS = "libtool-native"
-
-inherit native
-
-SRC_URI[md5sum] = "dee233bf288ee795ac96a98cc2e369b6"
-SRC_URI[sha256sum] = "e3b9950851a19904d642c4dec518623382cf4d2ac24f70a76510c944330d28ca"
diff --git a/recipes/zlib/zlib-sdk_1.2.3.bb b/recipes/zlib/zlib-sdk_1.2.3.bb
deleted file mode 100644
index 4863395..0000000
--- a/recipes/zlib/zlib-sdk_1.2.3.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require zlib_${PV}.bb
-LIB_EXTRA = ""
-
-inherit sdk
diff --git a/recipes/zlib/zlib.inc b/recipes/zlib/zlib.inc
new file mode 100644
index 0000000..e60f69c
--- /dev/null
+++ b/recipes/zlib/zlib.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "Zlib Compression Library"
+SECTION = "libs"
+PRIORITY = "required"
+HOMEPAGE = "http://www.gzip.org/zlib/"
+LICENSE = "zlib"
+INC_PR ="r6"
+
+BBCLASSEXTEND = "native sdk"
+
+SRC_URI = "http://www.zlib.net/zlib-${PV}.tar.bz2"
+
+inherit autotools autotools_stage
+
+DEPENDS = "libtool-cross"
diff --git a/recipes/zlib/zlib_1.2.3.bb b/recipes/zlib/zlib_1.2.3.bb
index 541245b..39a37c4 100644
--- a/recipes/zlib/zlib_1.2.3.bb
+++ b/recipes/zlib/zlib_1.2.3.bb
@@ -1,23 +1,9 @@
-DESCRIPTION = "Zlib Compression Library"
-SECTION = "libs"
-PRIORITY = "required"
-HOMEPAGE = "http://www.gzip.org/zlib/"
-LICENSE = "zlib"
-PR ="r5"
+include zlib.inc
 
-SRC_URI = "http://www.zlib.net/zlib-1.2.3.tar.bz2 \
-		file://visibility.patch;patch=1 \
-		file://autotools.patch;patch=1 "
-
-S = "${WORKDIR}/zlib-${PV}"
-
-DEPENDS = "libtool-cross"
+PR = "${INC_PR}.0"
 
-inherit autotools
-
-do_stage() {
-	autotools_stage_all
-}
+SRC_URI += "	file://visibility.patch;patch=1 \
+		file://autotools.patch;patch=1 "
 
 SRC_URI[md5sum] = "dee233bf288ee795ac96a98cc2e369b6"
 SRC_URI[sha256sum] = "e3b9950851a19904d642c4dec518623382cf4d2ac24f70a76510c944330d28ca"
diff --git a/recipes/zlib/zlib_1.2.5.bb b/recipes/zlib/zlib_1.2.5.bb
new file mode 100644
index 0000000..4c22f3e
--- /dev/null
+++ b/recipes/zlib/zlib_1.2.5.bb
@@ -0,0 +1,10 @@
+include zlib.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://0001-autotools.patch;patch=1 "
+
+SRC_URI[md5sum] = "be1e89810e66150f5b0327984d8625a0"
+SRC_URI[sha256sum] = "239aead2f22f16bfcfa6a6a5150dcbd6d6f2e4d1eaa8727b5769ea014120b307"
+
+DEFAULT_PREFERENCE = "-1"
\ No newline at end of file
-- 
1.6.3.3



