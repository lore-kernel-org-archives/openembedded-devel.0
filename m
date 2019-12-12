Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA0687F98A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2019 05:56:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBC5uIbO018654
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 21:56:18 -0800 (PST)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 11 Dec 2019 21:56:17 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 12 Dec 2019 13:56:15 +0800
Message-ID: <20191212055615.15788-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [meta-oe][PATCH] tk: upgrade 8.6.9 -> 8.6.10
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
X-List-Received-Date: Thu, 12 Dec 2019 05:56:17 -0000
Content-Type: text/plain

Drop patches that were merged upstream:
  configure.use.fontconfig.with.xft.patch
  non-linux.diff
  tklibrary.diff

Refresh patches:
  confsearch.diff
  fix-xft.diff

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../configure.use.fontconfig.with.xft.patch   | 13 ---------
 .../recipes-devtools/tcltk/tk/confsearch.diff | 14 +++++-----
 .../recipes-devtools/tcltk/tk/fix-xft.diff    |  4 +--
 .../recipes-devtools/tcltk/tk/non-linux.diff  | 27 -------------------
 .../recipes-devtools/tcltk/tk/tklibrary.diff  | 22 ---------------
 .../tcltk/{tk_8.6.9.bb => tk_8.6.10.bb}       |  7 ++---
 6 files changed, 11 insertions(+), 76 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk/configure.use.fontconfig.with.xft.patch
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk/non-linux.diff
 delete mode 100644 meta-oe/recipes-devtools/tcltk/tk/tklibrary.diff
 rename meta-oe/recipes-devtools/tcltk/{tk_8.6.9.bb => tk_8.6.10.bb} (91%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk/configure.use.fontconfig.with.xft.patch b/meta-oe/recipes-devtools/tcltk/tk/configure.use.fontconfig.with.xft.patch
deleted file mode 100644
index a0c157f5a..000000000
--- a/meta-oe/recipes-devtools/tcltk/tk/configure.use.fontconfig.with.xft.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- a/configure.in.orig	2014-05-10 14:35:39.859147385 +0000
-+++ b/configure.in	2014-05-10 14:36:20.282925184 +0000
-@@ -554,8 +554,8 @@
- 	dnl make sure package configurator (xft-config or pkg-config
- 	dnl says that xft is present.
- 	    found_xft=yes
--	    XFT_CFLAGS=`pkg-config --cflags xft 2>/dev/null` || found_xft="no"
--	    XFT_LIBS=`pkg-config --libs xft 2>/dev/null` || found_xft="no"
-+	    XFT_CFLAGS=`pkg-config --cflags xft fontconfig 2>/dev/null` || found_xft="no"
-+	    XFT_LIBS=`pkg-config --libs xft fontconfig 2>/dev/null` || found_xft="no"
- 	AC_MSG_RESULT([$found_xft])
- 	dnl make sure that compiling against Xft header file doesn't bomb
- 	if test "$found_xft" = "yes" ; then
diff --git a/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff b/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
index 8cc07bcfa..229acf3e7 100644
--- a/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
+++ b/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
@@ -16,31 +16,31 @@ Index: a/unix/configure
 ===================================================================
 --- a/unix/configure.orig
 +++ b/unix/configure
-@@ -1432,6 +1432,7 @@ echo "$as_me: error: ${with_tclconfig} d
+@@ -1431,6 +1431,7 @@ echo "$as_me: error: ${with_tclconfig} d
  			`ls -d /usr/local/lib 2>/dev/null` \
  			`ls -d /usr/contrib/lib 2>/dev/null` \
  			`ls -d /usr/pkg/lib 2>/dev/null` \
 +			`ls -d /usr/share/tcltk/tcl8.6 2>/dev/null` \
+ 			`ls -d /usr/lib/tcl8.6 2>/dev/null` \
  			`ls -d /usr/lib 2>/dev/null` \
  			`ls -d /usr/lib64 2>/dev/null` \
- 			`ls -d /usr/local/lib/tcl8.6 2>/dev/null` \
 Index: a/unix/tcl.m4
 ===================================================================
 --- a/unix/tcl.m4.orig
 +++ b/unix/tcl.m4
-@@ -94,6 +94,7 @@ AC_DEFUN([SC_PATH_TCLCONFIG], [
+@@ -93,6 +93,7 @@ AC_DEFUN([SC_PATH_TCLCONFIG], [
  			`ls -d /usr/local/lib 2>/dev/null` \
  			`ls -d /usr/contrib/lib 2>/dev/null` \
  			`ls -d /usr/pkg/lib 2>/dev/null` \
 +			`ls -d /usr/share/tcltk/tcl8.6 2>/dev/null` \
+ 			`ls -d /usr/lib/tcl8.6 2>/dev/null` \
  			`ls -d /usr/lib 2>/dev/null` \
  			`ls -d /usr/lib64 2>/dev/null` \
- 			`ls -d /usr/local/lib/tcl8.6 2>/dev/null` \
-@@ -227,6 +228,7 @@ AC_DEFUN([SC_PATH_TKCONFIG], [
+@@ -226,6 +227,7 @@ AC_DEFUN([SC_PATH_TKCONFIG], [
  			`ls -d /usr/local/lib 2>/dev/null` \
  			`ls -d /usr/contrib/lib 2>/dev/null` \
  			`ls -d /usr/pkg/lib 2>/dev/null` \
-+			`ls -d /usr/share/tcltk/tk8.6 2>/dev/null` \
++			`ls -d /usr/share/tcltk/tcl8.6 2>/dev/null` \
+ 			`ls -d /usr/lib/tk8.6 2>/dev/null` \
  			`ls -d /usr/lib 2>/dev/null` \
  			`ls -d /usr/lib64 2>/dev/null` \
- 			`ls -d /usr/local/lib/tk8.6 2>/dev/null` \
diff --git a/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff b/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff
index d1bb7105c..4aa5d6b89 100644
--- a/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff
+++ b/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff
@@ -8,8 +8,8 @@
 -	XFT_LIBS=`xft-config --libs 2>/dev/null` || found_xft="no"
 -	if test "$found_xft" = "no" ; then
  	    found_xft=yes
- 	    XFT_CFLAGS=`pkg-config --cflags xft 2>/dev/null` || found_xft="no"
- 	    XFT_LIBS=`pkg-config --libs xft 2>/dev/null` || found_xft="no"
+ 	    XFT_CFLAGS=`pkg-config --cflags xft fontconfig 2>/dev/null` || found_xft="no"
+ 	    XFT_LIBS=`pkg-config --libs xft fontconfig 2>/dev/null` || found_xft="no"
 -	fi
  	AC_MSG_RESULT([$found_xft])
  	dnl make sure that compiling against Xft header file doesn't bomb
diff --git a/meta-oe/recipes-devtools/tcltk/tk/non-linux.diff b/meta-oe/recipes-devtools/tcltk/tk/non-linux.diff
deleted file mode 100644
index 7d31f9fdc..000000000
--- a/meta-oe/recipes-devtools/tcltk/tk/non-linux.diff
+++ /dev/null
@@ -1,27 +0,0 @@
-Patch by Sergei Golovan (originally by Mike Markley and Chris Waters) fixes
-building on non-linux Debian architectures.
-
---- tk8.5-8.5.8.orig/unix/configure
-+++ tk8.5-8.5.8/unix/configure
-@@ -4447,6 +4447,9 @@
- 		if test "`uname -s`" = "AIX" ; then
- 		    tcl_cv_sys_version=AIX-`uname -v`.`uname -r`
- 		fi
-+		if test "`uname -s`" = "NetBSD" -a -f /etc/debian_version ; then
-+		    tcl_cv_sys_version=NetBSD-Debian
-+		fi
- 	    fi
- 	fi
-
---- tk8.5-8.5.8.orig/unix/tcl.m4
-+++ tk8.5-8.5.8/unix/tcl.m4
-@@ -962,6 +962,9 @@
- 		if test "`uname -s`" = "AIX" ; then
- 		    tcl_cv_sys_version=AIX-`uname -v`.`uname -r`
- 		fi
-+		if test "`uname -s`" = "NetBSD" -a -f /etc/debian_version ; then
-+		    tcl_cv_sys_version=NetBSD-Debian
-+		fi
- 	    fi
- 	fi
-     ])
diff --git a/meta-oe/recipes-devtools/tcltk/tk/tklibrary.diff b/meta-oe/recipes-devtools/tcltk/tk/tklibrary.diff
deleted file mode 100644
index ee38c2a1a..000000000
--- a/meta-oe/recipes-devtools/tcltk/tk/tklibrary.diff
+++ /dev/null
@@ -1,22 +0,0 @@
---- tk8.5-8.5.8.orig/unix/configure
-+++ tk8.5-8.5.8/unix/configure
-@@ -11070,7 +11070,7 @@
-     TCL_STUB_FLAGS="-DUSE_TCL_STUBS"
- fi
- 
--TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
-+test -z "$TK_LIBRARY" && TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
- PRIVATE_INCLUDE_DIR='$(includedir)'
- HTML_DIR='$(DISTDIR)/html'
- TK_PKG_DIR='tk$(VERSION)'
---- tk8.5-8.5.8.orig/unix/configure.in
-+++ tk8.5-8.5.8/unix/configure.in
-@@ -607,7 +607,7 @@
-     TCL_STUB_FLAGS="-DUSE_TCL_STUBS"
- fi
- 
--TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
-+test -z "$TK_LIBRARY" && TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
- PRIVATE_INCLUDE_DIR='$(includedir)'
- HTML_DIR='$(DISTDIR)/html'
- TK_PKG_DIR='tk$(VERSION)'
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
similarity index 91%
rename from meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
rename to meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
index 3d7767074..b564e1260 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
@@ -20,14 +20,11 @@ DEPENDS = "tcl virtual/libx11 libxt"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
     file://confsearch.diff;striplevel=2 \
-    file://non-linux.diff;striplevel=2 \
-    file://tklibrary.diff;striplevel=2 \
     file://tkprivate.diff;striplevel=2 \
     file://fix-xft.diff \
-    file://configure.use.fontconfig.with.xft.patch \
 "
-SRC_URI[md5sum] = "e3cf6290999ee30651d75864eccfec63"
-SRC_URI[sha256sum] = "d3f9161e8ba0f107fe8d4df1f6d3a14c30cc3512dfc12a795daa367a27660dac"
+SRC_URI[md5sum] = "602a47ad9ecac7bf655ada729d140a94"
+SRC_URI[sha256sum] = "63df418a859d0a463347f95ded5cd88a3dd3aaa1ceecaeee362194bc30f3e386"
 
 S = "${WORKDIR}/${BPN}${PV}/unix"
 
-- 
2.17.1


