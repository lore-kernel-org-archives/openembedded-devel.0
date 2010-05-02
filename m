Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O8V8f-0003vz-7S
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 May 2010 11:07:03 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 0A6DA4B00EC;
	Sun,  2 May 2010 11:03:15 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 0343C4B008C;
	Sun,  2 May 2010 11:03:12 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 May 2010 11:03:06 +0200
Message-Id: <1272790986-26842-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] zlib: Add version 1.2.5
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
X-List-Received-Date: Sun, 02 May 2010 09:07:03 -0000

- update autotool patch for this version
- tested on x86

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 recipes/zlib/files/0001-autotools.patch |   58 +++++++++++++++++++++++++++++++
 recipes/zlib/zlib-native_1.2.5.bb       |    9 +++++
 recipes/zlib/zlib-sdk_1.2.5.bb          |    4 ++
 recipes/zlib/zlib_1.2.5.bb              |   22 ++++++++++++
 4 files changed, 93 insertions(+), 0 deletions(-)
 create mode 100644 recipes/zlib/files/0001-autotools.patch
 create mode 100644 recipes/zlib/zlib-native_1.2.5.bb
 create mode 100644 recipes/zlib/zlib-sdk_1.2.5.bb
 create mode 100644 recipes/zlib/zlib_1.2.5.bb

diff --git a/recipes/zlib/files/0001-autotools.patch b/recipes/zlib/files/0001-autotools.patch
new file mode 100644
index 0000000..38cae87
--- /dev/null
+++ b/recipes/zlib/files/0001-autotools.patch
@@ -0,0 +1,58 @@
+From ce7f7b24c6bf140feeb92da4e9b662e35a163c35 Mon Sep 17 00:00:00 2001
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
+index 0000000..0f2e882
+--- /dev/null
++++ b/Makefile.am
+@@ -0,0 +1,12 @@
++lib_LTLIBRARIES = libz.la
++
++libz_la_SOURCES = adler32.c compress.c crc32.c gzclose.c gzlib.c gzread.c gzwrite.c \
++		uncompr.c deflate.c trees.c zutil.c inflate.c infback.c inftrees.c \
++		inffast.c
++
++libz_la_LDFLAGS = -version-number 1:2:3                                                                                
++
++include_HEADERS = zconf.h zlib.h                                                                                       
++
++pkgconfigdir = $(libdir)/pkgconfig                                                                                     
++pkgconfig_DATA = zlib.pc
+\ No newline at end of file
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
diff --git a/recipes/zlib/zlib-native_1.2.5.bb b/recipes/zlib/zlib-native_1.2.5.bb
new file mode 100644
index 0000000..1ac5c96
--- /dev/null
+++ b/recipes/zlib/zlib-native_1.2.5.bb
@@ -0,0 +1,9 @@
+require zlib_${PV}.bb
+ZLIB_EXTRA = ""
+DEPENDS = "libtool-native"
+
+inherit native
+
+SRC_URI[md5sum] = "be1e89810e66150f5b0327984d8625a0"
+SRC_URI[sha256sum] = "239aead2f22f16bfcfa6a6a5150dcbd6d6f2e4d1eaa8727b5769ea014120b307"
+
diff --git a/recipes/zlib/zlib-sdk_1.2.5.bb b/recipes/zlib/zlib-sdk_1.2.5.bb
new file mode 100644
index 0000000..4863395
--- /dev/null
+++ b/recipes/zlib/zlib-sdk_1.2.5.bb
@@ -0,0 +1,4 @@
+require zlib_${PV}.bb
+LIB_EXTRA = ""
+
+inherit sdk
diff --git a/recipes/zlib/zlib_1.2.5.bb b/recipes/zlib/zlib_1.2.5.bb
new file mode 100644
index 0000000..3a8c26f
--- /dev/null
+++ b/recipes/zlib/zlib_1.2.5.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Zlib Compression Library"
+SECTION = "libs"
+PRIORITY = "required"
+HOMEPAGE = "http://www.gzip.org/zlib/"
+LICENSE = "zlib"
+PR ="r1"
+
+SRC_URI = "http://www.zlib.net/zlib-1.2.5.tar.bz2 \
+		file://0001-autotools.patch;patch=1 "
+
+S = "${WORKDIR}/zlib-${PV}"
+
+DEPENDS = "libtool-cross"
+
+inherit autotools
+
+do_stage() {
+	autotools_stage_all
+}
+
+SRC_URI[md5sum] = "be1e89810e66150f5b0327984d8625a0"
+SRC_URI[sha256sum] = "239aead2f22f16bfcfa6a6a5150dcbd6d6f2e4d1eaa8727b5769ea014120b307"
-- 
1.6.3.3



