Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ol1eE-00069W-IV
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 17:30:54 +0200
Received: by mail-fx0-f47.google.com with SMTP id 6so3101151fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 08:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=8+4bEmQ6S7HLnaL/FOMD8/1x5GSAz8hDEwFPBs150xI=;
	b=xO1avH65YWW2+rDdyPGE+gbr+bApIx5f1Y/QoTT87jfyOP2CxYFRRZe1SuKcnpavOh
	5tNM5DTMR/+/tcdaYAs/6id6isLnyOvrzKJApaRHCDI8vq9uJLe/GxsvZh4CF2uELAzo
	GwWO95y/HZlyNIfpo7XpW7lvr5XnYhY3T+Hyw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kYhRz2HvSzl3XmPUoAYNVO1ZiUnrI3JQbibsge2dulWH/4P+uxUrSPrICrIOg6yOzJ
	yqyec2q7VToZMrYQcv2HZWyh6MMr6yRwhJs1s+iQ020ZJewu/QPQ9gHDjB9szMDNMn1C
	sl28yKjrbcRLDR2s+ccIhISvZ/D2+u7Ey34wM=
Received: by 10.223.122.6 with SMTP id j6mr5294737far.78.1281972635709;
	Mon, 16 Aug 2010 08:30:35 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a6sm186928faa.44.2010.08.16.08.30.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 08:30:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 17:30:19 +0200
Message-Id: <1281972620-7317-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
References: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 8/9] xorg-util: move older not pinned versions to obsolete dir
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
X-List-Received-Date: Mon, 16 Aug 2010 15:30:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-util/files/unbreak_cross_compile.patch    |   26 +++++++++++++++++++
 recipes/obsolete/xorg/xorg-util/lndir_1.0.1.bb     |    7 +++++
 .../obsolete/xorg/xorg-util/makedepend_1.0.1.bb    |    4 +++
 .../util-macros-1.1.6/unbreak_cross_compile.patch  |   19 ++++++++++++++
 .../cross-compiler-for-checking.patch              |   11 ++++++++
 .../malloc_zero_returns_null.patch                 |   27 ++++++++++++++++++++
 .../obsolete/xorg/xorg-util/util-macros_1.1.5.bb   |    5 +++
 .../obsolete/xorg/xorg-util/util-macros_1.1.6.bb   |    4 +++
 .../obsolete/xorg/xorg-util/util-macros_1.2.1.bb   |   10 +++++++
 .../obsolete/xorg/xorg-util/util-macros_1.4.1.bb   |    5 +++
 .../obsolete/xorg/xorg-util/util-macros_1.5.0.bb   |    4 +++
 .../obsolete/xorg/xorg-util/util-macros_1.6.0.bb   |    4 +++
 .../obsolete/xorg/xorg-util/util-macros_1.6.1.bb   |    4 +++
 .../obsolete/xorg/xorg-util/util-macros_1.7.0.bb   |    4 +++
 .../obsolete/xorg/xorg-util/util-macros_1.8.0.bb   |    4 +++
 .../obsolete/xorg/xorg-util/xorg-cf-files_1.0.2.bb |   10 +++++++
 .../xorg-util/files/unbreak_cross_compile.patch    |   26 -------------------
 recipes/xorg-util/lndir_1.0.1.bb                   |    7 -----
 recipes/xorg-util/makedepend_1.0.1.bb              |    4 ---
 .../util-macros-1.1.6/unbreak_cross_compile.patch  |   19 --------------
 .../cross-compiler-for-checking.patch              |   11 --------
 .../malloc_zero_returns_null.patch                 |   27 --------------------
 recipes/xorg-util/util-macros_1.1.5.bb             |    5 ---
 recipes/xorg-util/util-macros_1.1.6.bb             |    4 ---
 recipes/xorg-util/util-macros_1.2.1.bb             |   10 -------
 recipes/xorg-util/util-macros_1.4.1.bb             |    5 ---
 recipes/xorg-util/util-macros_1.5.0.bb             |    4 ---
 recipes/xorg-util/util-macros_1.6.0.bb             |    4 ---
 recipes/xorg-util/util-macros_1.6.1.bb             |    4 ---
 recipes/xorg-util/util-macros_1.7.0.bb             |    4 ---
 recipes/xorg-util/util-macros_1.8.0.bb             |    4 ---
 recipes/xorg-util/xorg-cf-files_1.0.2.bb           |   10 -------
 32 files changed, 148 insertions(+), 148 deletions(-)
 create mode 100644 recipes/obsolete/xorg/xorg-util/files/unbreak_cross_compile.patch
 create mode 100644 recipes/obsolete/xorg/xorg-util/lndir_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-util/makedepend_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-util/util-macros-1.1.6/unbreak_cross_compile.patch
 create mode 100644 recipes/obsolete/xorg/xorg-util/util-macros-1.2.1/cross-compiler-for-checking.patch
 create mode 100644 recipes/obsolete/xorg/xorg-util/util-macros-1.4.1/malloc_zero_returns_null.patch
 create mode 100644 recipes/obsolete/xorg/xorg-util/util-macros_1.1.5.bb
 create mode 100644 recipes/obsolete/xorg/xorg-util/util-macros_1.1.6.bb
 create mode 100644 recipes/obsolete/xorg/xorg-util/util-macros_1.2.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-util/util-macros_1.4.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-util/util-macros_1.5.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-util/util-macros_1.6.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-util/util-macros_1.6.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-util/util-macros_1.7.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-util/util-macros_1.8.0.bb
 create mode 100644 recipes/obsolete/xorg/xorg-util/xorg-cf-files_1.0.2.bb
 delete mode 100644 recipes/xorg-util/files/unbreak_cross_compile.patch
 delete mode 100644 recipes/xorg-util/lndir_1.0.1.bb
 delete mode 100644 recipes/xorg-util/makedepend_1.0.1.bb
 delete mode 100644 recipes/xorg-util/util-macros-1.1.6/unbreak_cross_compile.patch
 delete mode 100644 recipes/xorg-util/util-macros-1.2.1/cross-compiler-for-checking.patch
 delete mode 100644 recipes/xorg-util/util-macros-1.4.1/malloc_zero_returns_null.patch
 delete mode 100644 recipes/xorg-util/util-macros_1.1.5.bb
 delete mode 100644 recipes/xorg-util/util-macros_1.1.6.bb
 delete mode 100644 recipes/xorg-util/util-macros_1.2.1.bb
 delete mode 100644 recipes/xorg-util/util-macros_1.4.1.bb
 delete mode 100644 recipes/xorg-util/util-macros_1.5.0.bb
 delete mode 100644 recipes/xorg-util/util-macros_1.6.0.bb
 delete mode 100644 recipes/xorg-util/util-macros_1.6.1.bb
 delete mode 100644 recipes/xorg-util/util-macros_1.7.0.bb
 delete mode 100644 recipes/xorg-util/util-macros_1.8.0.bb
 delete mode 100644 recipes/xorg-util/xorg-cf-files_1.0.2.bb

diff --git a/recipes/obsolete/xorg/xorg-util/files/unbreak_cross_compile.patch b/recipes/obsolete/xorg/xorg-util/files/unbreak_cross_compile.patch
new file mode 100644
index 0000000..fd84aad
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/files/unbreak_cross_compile.patch
@@ -0,0 +1,26 @@
+---
+ xorg-macros.m4.in |    4 ----
+ 1 file changed, 4 deletions(-)
+
+Index: util-macros-1.1.5/xorg-macros.m4.in
+===================================================================
+--- util-macros-1.1.5.orig/xorg-macros.m4.in	2006-11-08 14:23:10.000000000 +0000
++++ util-macros-1.1.5/xorg-macros.m4.in	2007-01-31 15:28:55.000000000 +0000
+@@ -194,8 +194,6 @@ AC_DEFUN([XORG_CHECK_LINUXDOC],[
+ XORG_SGML_PATH=$prefix/share/sgml
+ HAVE_DEFS_ENT=
+ 
+-AC_CHECK_FILE([$XORG_SGML_PATH/X11/defs.ent], [HAVE_DEFS_ENT=yes])
+-
+ AC_PATH_PROG(LINUXDOC, linuxdoc)
+ AC_PATH_PROG(PS2PDF, ps2pdf)
+ 
+@@ -250,8 +248,6 @@ BUILDPDFDOC=no
+ BUILDPSDOC=no
+ BUILDHTMLDOC=no
+ 
+-AC_CHECK_FILE([$XORG_SGML_PATH/X11/defs.ent], [HAVE_DEFS_ENT=yes])
+-
+ AC_PATH_PROG(DOCBOOKPS, docbook2ps)
+ AC_PATH_PROG(DOCBOOKPDF, docbook2pdf)
+ AC_PATH_PROG(DOCBOOKHTML, docbook2html)
diff --git a/recipes/obsolete/xorg/xorg-util/lndir_1.0.1.bb b/recipes/obsolete/xorg/xorg-util/lndir_1.0.1.bb
new file mode 100644
index 0000000..0512517
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/lndir_1.0.1.bb
@@ -0,0 +1,7 @@
+require xorg-util-common.inc
+
+DESCRIPTION = "create a shadow directory of symbolic links to another directory tree"
+PR = "r2"
+PE = "1"
+SRC_URI[archive.md5sum] = "1a53ddd7e1804abe8f3d9799a88b6aa8"
+SRC_URI[archive.sha256sum] = "89bff89702ebf2e5cc2268d79d5a27c62190c5a85ab080935d4425d3e309bc57"
diff --git a/recipes/obsolete/xorg/xorg-util/makedepend_1.0.1.bb b/recipes/obsolete/xorg/xorg-util/makedepend_1.0.1.bb
new file mode 100644
index 0000000..05cc5e6
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/makedepend_1.0.1.bb
@@ -0,0 +1,4 @@
+require makedepend.inc
+PR = "${INC_PR}.0"
+SRC_URI[archive.md5sum] = "90f5f3b987497a481b94d49372f17dce"
+SRC_URI[archive.sha256sum] = "0a4a0d4e2613b0cd4321e55fd4741788b728736fc8a517996e2015fa49862e61"
diff --git a/recipes/obsolete/xorg/xorg-util/util-macros-1.1.6/unbreak_cross_compile.patch b/recipes/obsolete/xorg/xorg-util/util-macros-1.1.6/unbreak_cross_compile.patch
new file mode 100644
index 0000000..1f78494
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/util-macros-1.1.6/unbreak_cross_compile.patch
@@ -0,0 +1,19 @@
+---
+ xorg-macros.m4.in |    2 --
+ 1 file changed, 2 deletions(-)
+
+--- util-macros-1.1.6.orig/xorg-macros.m4.in
++++ util-macros-1.1.6/xorg-macros.m4.in
+@@ -252,12 +252,10 @@ HAVE_DEFS_ENT=
+ BUILDTXTDOC=no
+ BUILDPDFDOC=no
+ BUILDPSDOC=no
+ BUILDHTMLDOC=no
+ 
+-AC_CHECK_FILE([$XORG_SGML_PATH/X11/defs.ent], [HAVE_DEFS_ENT=yes])
+-
+ AC_PATH_PROG(DOCBOOKPS, docbook2ps)
+ AC_PATH_PROG(DOCBOOKPDF, docbook2pdf)
+ AC_PATH_PROG(DOCBOOKHTML, docbook2html)
+ AC_PATH_PROG(DOCBOOKTXT, docbook2txt)
+ 
diff --git a/recipes/obsolete/xorg/xorg-util/util-macros-1.2.1/cross-compiler-for-checking.patch b/recipes/obsolete/xorg/xorg-util/util-macros-1.2.1/cross-compiler-for-checking.patch
new file mode 100644
index 0000000..c646fff
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/util-macros-1.2.1/cross-compiler-for-checking.patch
@@ -0,0 +1,11 @@
+--- util-macros-1.2.1/xorg-macros.m4.in-orig	2009-06-08 13:49:09.000000000 +0200
++++ util-macros-1.2.1/xorg-macros.m4.in	2009-06-08 13:51:28.000000000 +0200
+@@ -445,7 +445,7 @@
+     CWARNFLAGS="-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes \
+ -Wmissing-declarations -Wnested-externs -fno-strict-aliasing \
+ -Wbad-function-cast"
+-    case `gcc -dumpversion` in
++    case `$CC -dumpversion 2>/dev/null` in
+     3.4.* | 4.*)
+ 	CWARNFLAGS+=" -Wold-style-definition -Wdeclaration-after-statement"
+ 	;;
diff --git a/recipes/obsolete/xorg/xorg-util/util-macros-1.4.1/malloc_zero_returns_null.patch b/recipes/obsolete/xorg/xorg-util/util-macros-1.4.1/malloc_zero_returns_null.patch
new file mode 100644
index 0000000..0d8a9cd
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/util-macros-1.4.1/malloc_zero_returns_null.patch
@@ -0,0 +1,27 @@
+From 48e2b3d0ee8d637d83b88bf29c6d417f61aaa0e4 Mon Sep 17 00:00:00 2001
+From: Colin Watson <cjwatson@canonical.com>
+Date: Sat, 10 Oct 2009 12:28:28 +0000
+Subject: Use conservative default for malloc(0) when cross-compiling #24460
+
+When cross-compiling, AC_RUN_IFELSE can't run test programs.
+MALLOC_ZERO_RETURNS_NULL=yes is a conservative default in this case.
+
+Signed-off-by: Colin Watson <cjwatson@canonical.com>
+Signed-off-by: Gaetan Nadon <memsize@videotron.ca>
+---
+diff --git a/xorg-macros.m4.in b/xorg-macros.m4.in
+index 6f9635f..393186f 100644
+--- a/xorg-macros.m4.in
++++ b/xorg-macros.m4.in
+@@ -339,7 +339,8 @@ main() {
+     exit(m0 == 0 || r0 == 0 || c0 == 0 ? 0 : 1);
+ }],
+ 		[MALLOC_ZERO_RETURNS_NULL=yes],
+-		[MALLOC_ZERO_RETURNS_NULL=no])
++		[MALLOC_ZERO_RETURNS_NULL=no],
++		[MALLOC_ZERO_RETURNS_NULL=yes])
+ fi
+ AC_MSG_RESULT([$MALLOC_ZERO_RETURNS_NULL])
+ 
+--
+cgit v0.8.3-6-g21f6
diff --git a/recipes/obsolete/xorg/xorg-util/util-macros_1.1.5.bb b/recipes/obsolete/xorg/xorg-util/util-macros_1.1.5.bb
new file mode 100644
index 0000000..bd580ad
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/util-macros_1.1.5.bb
@@ -0,0 +1,5 @@
+require util-macros.inc
+SRC_URI += "file://unbreak_cross_compile.patch"
+PR = "${INC_PR}.0"
+SRC_URI[archive.md5sum] = "d168aa001b946b58d9aab6088c09d256"
+SRC_URI[archive.sha256sum] = "4f2a8a19e90ad82bc2da4eb52799a299a1c94bf5143bc2711e9e5d4cc5a7cdb4"
diff --git a/recipes/obsolete/xorg/xorg-util/util-macros_1.1.6.bb b/recipes/obsolete/xorg/xorg-util/util-macros_1.1.6.bb
new file mode 100644
index 0000000..39ba8fa
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/util-macros_1.1.6.bb
@@ -0,0 +1,4 @@
+require util-macros.inc
+PR = "${INC_PR}.0"
+SRC_URI[archive.md5sum] = "ea2d9cd33ca6fd05923f007bd74d7c37"
+SRC_URI[archive.sha256sum] = "97748154c41a1cd12635a79aee0c2846fd48ecb555fc8b54e3e5baec174e6e74"
diff --git a/recipes/obsolete/xorg/xorg-util/util-macros_1.2.1.bb b/recipes/obsolete/xorg/xorg-util/util-macros_1.2.1.bb
new file mode 100644
index 0000000..9c37f50
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/util-macros_1.2.1.bb
@@ -0,0 +1,10 @@
+require util-macros.inc
+
+# Version 1.2.1 uses plain `gcc' for checking the compiler version.
+# Instead, the cross compiler must be used. Whenever upgrading to
+# a new version, please recheck for this problem, otherwise it breaks
+# builds with older gcc versions!
+SRC_URI += " file://cross-compiler-for-checking.patch"
+PR = "${INC_PR}.0"
+SRC_URI[archive.md5sum] = "81b9746d6202ccf0b4a498cfd0731e71"
+SRC_URI[archive.sha256sum] = "f3804f02f51a1be243ce7413dc67dca774f000686f8f2efedc77203a1962d401"
diff --git a/recipes/obsolete/xorg/xorg-util/util-macros_1.4.1.bb b/recipes/obsolete/xorg/xorg-util/util-macros_1.4.1.bb
new file mode 100644
index 0000000..7d9e608
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/util-macros_1.4.1.bb
@@ -0,0 +1,5 @@
+require util-macros.inc
+SRC_URI += " file://malloc_zero_returns_null.patch"
+PR = "${INC_PR}.0"
+SRC_URI[archive.md5sum] = "8ac38951e753f250aaefbd4ba0afda94"
+SRC_URI[archive.sha256sum] = "d49ab68cad724ae51f6cb69f7f5cfff7629cbb066f4c5c8bda81d62675a21986"
diff --git a/recipes/obsolete/xorg/xorg-util/util-macros_1.5.0.bb b/recipes/obsolete/xorg/xorg-util/util-macros_1.5.0.bb
new file mode 100644
index 0000000..ff3b6f4
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/util-macros_1.5.0.bb
@@ -0,0 +1,4 @@
+require util-macros.inc
+PR = "${INC_PR}.0"
+SRC_URI[archive.md5sum] = "ffef78135535c60c2b68d0a2a4ecae9b"
+SRC_URI[archive.sha256sum] = "d47116ce5df198859a6082af7a72505575d1685b8c82bb4ef6fbedfa3316617e"
diff --git a/recipes/obsolete/xorg/xorg-util/util-macros_1.6.0.bb b/recipes/obsolete/xorg/xorg-util/util-macros_1.6.0.bb
new file mode 100644
index 0000000..c5a715f
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/util-macros_1.6.0.bb
@@ -0,0 +1,4 @@
+require util-macros.inc
+SRC_URI[archive.md5sum] = "eb991c709781f811fbfcdbd43f9edd16"
+SRC_URI[archive.sha256sum] = "12c7a8819f2df62ff7fca20152438d6b4e93ac581d7de211e31149739aa37ce9"
+PR = "${INC_PR}.0"
diff --git a/recipes/obsolete/xorg/xorg-util/util-macros_1.6.1.bb b/recipes/obsolete/xorg/xorg-util/util-macros_1.6.1.bb
new file mode 100644
index 0000000..80c5971
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/util-macros_1.6.1.bb
@@ -0,0 +1,4 @@
+require util-macros.inc
+SRC_URI[archive.md5sum] = "a4bef59dd4a2e3450c07c77c6b45a79f"
+SRC_URI[archive.sha256sum] = "ba91652d78f2a63d69253fb80af2f0a76c2e1b081c64521f90fac3866ee893d7"
+PR = "${INC_PR}.0"
diff --git a/recipes/obsolete/xorg/xorg-util/util-macros_1.7.0.bb b/recipes/obsolete/xorg/xorg-util/util-macros_1.7.0.bb
new file mode 100644
index 0000000..df57ea0
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/util-macros_1.7.0.bb
@@ -0,0 +1,4 @@
+require util-macros.inc
+SRC_URI[archive.md5sum] = "8a8d208f24672e7a37d1aa4d2ffcef8e"
+SRC_URI[archive.sha256sum] = "7a5519ca22cd6bc4664be7b52cc58d5594e9f18c282ee0f6f7c59c1dffabdd13"
+PR = "${INC_PR}.0"
diff --git a/recipes/obsolete/xorg/xorg-util/util-macros_1.8.0.bb b/recipes/obsolete/xorg/xorg-util/util-macros_1.8.0.bb
new file mode 100644
index 0000000..7d7d59d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/util-macros_1.8.0.bb
@@ -0,0 +1,4 @@
+require util-macros.inc
+PR = "${INC_PR}.0"
+SRC_URI[archive.md5sum] = "fe73a69d02bd0be6cdf7c773bfd72041"
+SRC_URI[archive.sha256sum] = "2de6954271dbd43f073022c371c15d5f1102a3631eaa4f4053bfd173e148f7d7"
diff --git a/recipes/obsolete/xorg/xorg-util/xorg-cf-files_1.0.2.bb b/recipes/obsolete/xorg/xorg-util/xorg-cf-files_1.0.2.bb
new file mode 100644
index 0000000..dcf1f17
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-util/xorg-cf-files_1.0.2.bb
@@ -0,0 +1,10 @@
+require xorg-util-common.inc
+
+DESCRIPTION = "X Window System CF files"
+
+PR = "r1"
+PE = "1"
+
+FILES_${PN} += " /usr/lib/X11/config"
+SRC_URI[archive.md5sum] = "f96f44b87132afd2fff677a8c89166dd"
+SRC_URI[archive.sha256sum] = "4edcaf61ad8b4bef65169af2b98d3992be07260f90cca65128dc523d6935bdd8"
diff --git a/recipes/xorg-util/files/unbreak_cross_compile.patch b/recipes/xorg-util/files/unbreak_cross_compile.patch
deleted file mode 100644
index fd84aad..0000000
--- a/recipes/xorg-util/files/unbreak_cross_compile.patch
+++ /dev/null
@@ -1,26 +0,0 @@
----
- xorg-macros.m4.in |    4 ----
- 1 file changed, 4 deletions(-)
-
-Index: util-macros-1.1.5/xorg-macros.m4.in
-===================================================================
---- util-macros-1.1.5.orig/xorg-macros.m4.in	2006-11-08 14:23:10.000000000 +0000
-+++ util-macros-1.1.5/xorg-macros.m4.in	2007-01-31 15:28:55.000000000 +0000
-@@ -194,8 +194,6 @@ AC_DEFUN([XORG_CHECK_LINUXDOC],[
- XORG_SGML_PATH=$prefix/share/sgml
- HAVE_DEFS_ENT=
- 
--AC_CHECK_FILE([$XORG_SGML_PATH/X11/defs.ent], [HAVE_DEFS_ENT=yes])
--
- AC_PATH_PROG(LINUXDOC, linuxdoc)
- AC_PATH_PROG(PS2PDF, ps2pdf)
- 
-@@ -250,8 +248,6 @@ BUILDPDFDOC=no
- BUILDPSDOC=no
- BUILDHTMLDOC=no
- 
--AC_CHECK_FILE([$XORG_SGML_PATH/X11/defs.ent], [HAVE_DEFS_ENT=yes])
--
- AC_PATH_PROG(DOCBOOKPS, docbook2ps)
- AC_PATH_PROG(DOCBOOKPDF, docbook2pdf)
- AC_PATH_PROG(DOCBOOKHTML, docbook2html)
diff --git a/recipes/xorg-util/lndir_1.0.1.bb b/recipes/xorg-util/lndir_1.0.1.bb
deleted file mode 100644
index 0512517..0000000
--- a/recipes/xorg-util/lndir_1.0.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-util-common.inc
-
-DESCRIPTION = "create a shadow directory of symbolic links to another directory tree"
-PR = "r2"
-PE = "1"
-SRC_URI[archive.md5sum] = "1a53ddd7e1804abe8f3d9799a88b6aa8"
-SRC_URI[archive.sha256sum] = "89bff89702ebf2e5cc2268d79d5a27c62190c5a85ab080935d4425d3e309bc57"
diff --git a/recipes/xorg-util/makedepend_1.0.1.bb b/recipes/xorg-util/makedepend_1.0.1.bb
deleted file mode 100644
index 05cc5e6..0000000
--- a/recipes/xorg-util/makedepend_1.0.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require makedepend.inc
-PR = "${INC_PR}.0"
-SRC_URI[archive.md5sum] = "90f5f3b987497a481b94d49372f17dce"
-SRC_URI[archive.sha256sum] = "0a4a0d4e2613b0cd4321e55fd4741788b728736fc8a517996e2015fa49862e61"
diff --git a/recipes/xorg-util/util-macros-1.1.6/unbreak_cross_compile.patch b/recipes/xorg-util/util-macros-1.1.6/unbreak_cross_compile.patch
deleted file mode 100644
index 1f78494..0000000
--- a/recipes/xorg-util/util-macros-1.1.6/unbreak_cross_compile.patch
+++ /dev/null
@@ -1,19 +0,0 @@
----
- xorg-macros.m4.in |    2 --
- 1 file changed, 2 deletions(-)
-
---- util-macros-1.1.6.orig/xorg-macros.m4.in
-+++ util-macros-1.1.6/xorg-macros.m4.in
-@@ -252,12 +252,10 @@ HAVE_DEFS_ENT=
- BUILDTXTDOC=no
- BUILDPDFDOC=no
- BUILDPSDOC=no
- BUILDHTMLDOC=no
- 
--AC_CHECK_FILE([$XORG_SGML_PATH/X11/defs.ent], [HAVE_DEFS_ENT=yes])
--
- AC_PATH_PROG(DOCBOOKPS, docbook2ps)
- AC_PATH_PROG(DOCBOOKPDF, docbook2pdf)
- AC_PATH_PROG(DOCBOOKHTML, docbook2html)
- AC_PATH_PROG(DOCBOOKTXT, docbook2txt)
- 
diff --git a/recipes/xorg-util/util-macros-1.2.1/cross-compiler-for-checking.patch b/recipes/xorg-util/util-macros-1.2.1/cross-compiler-for-checking.patch
deleted file mode 100644
index c646fff..0000000
--- a/recipes/xorg-util/util-macros-1.2.1/cross-compiler-for-checking.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- util-macros-1.2.1/xorg-macros.m4.in-orig	2009-06-08 13:49:09.000000000 +0200
-+++ util-macros-1.2.1/xorg-macros.m4.in	2009-06-08 13:51:28.000000000 +0200
-@@ -445,7 +445,7 @@
-     CWARNFLAGS="-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes \
- -Wmissing-declarations -Wnested-externs -fno-strict-aliasing \
- -Wbad-function-cast"
--    case `gcc -dumpversion` in
-+    case `$CC -dumpversion 2>/dev/null` in
-     3.4.* | 4.*)
- 	CWARNFLAGS+=" -Wold-style-definition -Wdeclaration-after-statement"
- 	;;
diff --git a/recipes/xorg-util/util-macros-1.4.1/malloc_zero_returns_null.patch b/recipes/xorg-util/util-macros-1.4.1/malloc_zero_returns_null.patch
deleted file mode 100644
index 0d8a9cd..0000000
--- a/recipes/xorg-util/util-macros-1.4.1/malloc_zero_returns_null.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 48e2b3d0ee8d637d83b88bf29c6d417f61aaa0e4 Mon Sep 17 00:00:00 2001
-From: Colin Watson <cjwatson@canonical.com>
-Date: Sat, 10 Oct 2009 12:28:28 +0000
-Subject: Use conservative default for malloc(0) when cross-compiling #24460
-
-When cross-compiling, AC_RUN_IFELSE can't run test programs.
-MALLOC_ZERO_RETURNS_NULL=yes is a conservative default in this case.
-
-Signed-off-by: Colin Watson <cjwatson@canonical.com>
-Signed-off-by: Gaetan Nadon <memsize@videotron.ca>
----
-diff --git a/xorg-macros.m4.in b/xorg-macros.m4.in
-index 6f9635f..393186f 100644
---- a/xorg-macros.m4.in
-+++ b/xorg-macros.m4.in
-@@ -339,7 +339,8 @@ main() {
-     exit(m0 == 0 || r0 == 0 || c0 == 0 ? 0 : 1);
- }],
- 		[MALLOC_ZERO_RETURNS_NULL=yes],
--		[MALLOC_ZERO_RETURNS_NULL=no])
-+		[MALLOC_ZERO_RETURNS_NULL=no],
-+		[MALLOC_ZERO_RETURNS_NULL=yes])
- fi
- AC_MSG_RESULT([$MALLOC_ZERO_RETURNS_NULL])
- 
---
-cgit v0.8.3-6-g21f6
diff --git a/recipes/xorg-util/util-macros_1.1.5.bb b/recipes/xorg-util/util-macros_1.1.5.bb
deleted file mode 100644
index bd580ad..0000000
--- a/recipes/xorg-util/util-macros_1.1.5.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require util-macros.inc
-SRC_URI += "file://unbreak_cross_compile.patch"
-PR = "${INC_PR}.0"
-SRC_URI[archive.md5sum] = "d168aa001b946b58d9aab6088c09d256"
-SRC_URI[archive.sha256sum] = "4f2a8a19e90ad82bc2da4eb52799a299a1c94bf5143bc2711e9e5d4cc5a7cdb4"
diff --git a/recipes/xorg-util/util-macros_1.1.6.bb b/recipes/xorg-util/util-macros_1.1.6.bb
deleted file mode 100644
index 39ba8fa..0000000
--- a/recipes/xorg-util/util-macros_1.1.6.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require util-macros.inc
-PR = "${INC_PR}.0"
-SRC_URI[archive.md5sum] = "ea2d9cd33ca6fd05923f007bd74d7c37"
-SRC_URI[archive.sha256sum] = "97748154c41a1cd12635a79aee0c2846fd48ecb555fc8b54e3e5baec174e6e74"
diff --git a/recipes/xorg-util/util-macros_1.2.1.bb b/recipes/xorg-util/util-macros_1.2.1.bb
deleted file mode 100644
index 9c37f50..0000000
--- a/recipes/xorg-util/util-macros_1.2.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require util-macros.inc
-
-# Version 1.2.1 uses plain `gcc' for checking the compiler version.
-# Instead, the cross compiler must be used. Whenever upgrading to
-# a new version, please recheck for this problem, otherwise it breaks
-# builds with older gcc versions!
-SRC_URI += " file://cross-compiler-for-checking.patch"
-PR = "${INC_PR}.0"
-SRC_URI[archive.md5sum] = "81b9746d6202ccf0b4a498cfd0731e71"
-SRC_URI[archive.sha256sum] = "f3804f02f51a1be243ce7413dc67dca774f000686f8f2efedc77203a1962d401"
diff --git a/recipes/xorg-util/util-macros_1.4.1.bb b/recipes/xorg-util/util-macros_1.4.1.bb
deleted file mode 100644
index 7d9e608..0000000
--- a/recipes/xorg-util/util-macros_1.4.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require util-macros.inc
-SRC_URI += " file://malloc_zero_returns_null.patch"
-PR = "${INC_PR}.0"
-SRC_URI[archive.md5sum] = "8ac38951e753f250aaefbd4ba0afda94"
-SRC_URI[archive.sha256sum] = "d49ab68cad724ae51f6cb69f7f5cfff7629cbb066f4c5c8bda81d62675a21986"
diff --git a/recipes/xorg-util/util-macros_1.5.0.bb b/recipes/xorg-util/util-macros_1.5.0.bb
deleted file mode 100644
index ff3b6f4..0000000
--- a/recipes/xorg-util/util-macros_1.5.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require util-macros.inc
-PR = "${INC_PR}.0"
-SRC_URI[archive.md5sum] = "ffef78135535c60c2b68d0a2a4ecae9b"
-SRC_URI[archive.sha256sum] = "d47116ce5df198859a6082af7a72505575d1685b8c82bb4ef6fbedfa3316617e"
diff --git a/recipes/xorg-util/util-macros_1.6.0.bb b/recipes/xorg-util/util-macros_1.6.0.bb
deleted file mode 100644
index c5a715f..0000000
--- a/recipes/xorg-util/util-macros_1.6.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require util-macros.inc
-SRC_URI[archive.md5sum] = "eb991c709781f811fbfcdbd43f9edd16"
-SRC_URI[archive.sha256sum] = "12c7a8819f2df62ff7fca20152438d6b4e93ac581d7de211e31149739aa37ce9"
-PR = "${INC_PR}.0"
diff --git a/recipes/xorg-util/util-macros_1.6.1.bb b/recipes/xorg-util/util-macros_1.6.1.bb
deleted file mode 100644
index 80c5971..0000000
--- a/recipes/xorg-util/util-macros_1.6.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require util-macros.inc
-SRC_URI[archive.md5sum] = "a4bef59dd4a2e3450c07c77c6b45a79f"
-SRC_URI[archive.sha256sum] = "ba91652d78f2a63d69253fb80af2f0a76c2e1b081c64521f90fac3866ee893d7"
-PR = "${INC_PR}.0"
diff --git a/recipes/xorg-util/util-macros_1.7.0.bb b/recipes/xorg-util/util-macros_1.7.0.bb
deleted file mode 100644
index df57ea0..0000000
--- a/recipes/xorg-util/util-macros_1.7.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require util-macros.inc
-SRC_URI[archive.md5sum] = "8a8d208f24672e7a37d1aa4d2ffcef8e"
-SRC_URI[archive.sha256sum] = "7a5519ca22cd6bc4664be7b52cc58d5594e9f18c282ee0f6f7c59c1dffabdd13"
-PR = "${INC_PR}.0"
diff --git a/recipes/xorg-util/util-macros_1.8.0.bb b/recipes/xorg-util/util-macros_1.8.0.bb
deleted file mode 100644
index 7d7d59d..0000000
--- a/recipes/xorg-util/util-macros_1.8.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require util-macros.inc
-PR = "${INC_PR}.0"
-SRC_URI[archive.md5sum] = "fe73a69d02bd0be6cdf7c773bfd72041"
-SRC_URI[archive.sha256sum] = "2de6954271dbd43f073022c371c15d5f1102a3631eaa4f4053bfd173e148f7d7"
diff --git a/recipes/xorg-util/xorg-cf-files_1.0.2.bb b/recipes/xorg-util/xorg-cf-files_1.0.2.bb
deleted file mode 100644
index dcf1f17..0000000
--- a/recipes/xorg-util/xorg-cf-files_1.0.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-util-common.inc
-
-DESCRIPTION = "X Window System CF files"
-
-PR = "r1"
-PE = "1"
-
-FILES_${PN} += " /usr/lib/X11/config"
-SRC_URI[archive.md5sum] = "f96f44b87132afd2fff677a8c89166dd"
-SRC_URI[archive.sha256sum] = "4edcaf61ad8b4bef65169af2b98d3992be07260f90cca65128dc523d6935bdd8"
-- 
1.7.2



