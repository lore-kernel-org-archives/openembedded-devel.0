Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 81A5871B9B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Nov 2016 06:31:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA26V3MW013227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Nov 2016 23:31:03 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 1 Nov 2016 23:31:02 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Nov 2016 14:30:40 +0800
Message-ID: <20161102063040.23598-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] gnuplot: upgrade to 5.0.5
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
X-List-Received-Date: Wed, 02 Nov 2016 06:31:02 -0000
Content-Type: text/plain

Add '--disable-qt' to EXTRA_OECONF to fix do_compile failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch    | 16 ----------------
 .../recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch | 11 -----------
 meta-oe/recipes-extended/gnuplot/gnuplot.inc             |  2 +-
 .../gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch  | 16 ++++++++++++++++
 meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch   | 11 +++++++++++
 meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb        | 14 --------------
 meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb        | 14 ++++++++++++++
 7 files changed, 42 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
 delete mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch b/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch
deleted file mode 100644
index 23f2cd2..0000000
--- a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Index: gnuplot-4.6.5/configure.in
-===================================================================
---- gnuplot-4.6.5.orig/configure.in
-+++ gnuplot-4.6.5/configure.in
-@@ -690,6 +690,11 @@ if test "${with_lua}" = yes ; then
-   fi
- 
-   if test "$with_lua" != no; then
-+    dnl check for dlopen/dl to fix loadlibs link failure
-+    AC_CHECK_FUNC([dlopen], [],
-+      AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
-+    AC_SUBST(DLOPEN_LIBS)
-+    LUA_LIBS="$LUA_LIBS $DLOPEN_LIBS"
-     TERMLIBS="$TERMLIBS $LUA_LIBS"
-     CPPFLAGS="$CPPFLAGS $LUA_CFLAGS"
-   else
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch b/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
deleted file mode 100644
index 8c7d1f0..0000000
--- a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- /tmp/Makefile.am	2007-08-23 13:10:15.560659023 +0200
-+++ gnuplot-4.2.0/Makefile.am	2007-08-23 13:10:34.961764629 +0200
-@@ -1,7 +1,7 @@
- ## Process this file with automake to produce Makefile.in -*-Makefile-*-
- AUTOMAKE_OPTIONS = foreign 1.2h
- 
--SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
-+SUBDIRS = config m4 term src  $(LISPDIR) man share
- 
- EXTRA_DIST = BUGS CodeStyle Copyright FAQ GNUmakefile INSTALL INSTALL.gnu \
- Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST README.exp \
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot.inc b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
index 69bc74b..d8d9a5f 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
@@ -17,7 +17,7 @@ PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,cairo pango"
 PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua"
 
 EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR}/.. \
-                --without-lisp-files \
+                --without-qt \
                 --without-tutorial \
                 --disable-wxwidgets"
 
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch
new file mode 100644
index 0000000..23f2cd2
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch
@@ -0,0 +1,16 @@
+Index: gnuplot-4.6.5/configure.in
+===================================================================
+--- gnuplot-4.6.5.orig/configure.in
++++ gnuplot-4.6.5/configure.in
+@@ -690,6 +690,11 @@ if test "${with_lua}" = yes ; then
+   fi
+ 
+   if test "$with_lua" != no; then
++    dnl check for dlopen/dl to fix loadlibs link failure
++    AC_CHECK_FUNC([dlopen], [],
++      AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
++    AC_SUBST(DLOPEN_LIBS)
++    LUA_LIBS="$LUA_LIBS $DLOPEN_LIBS"
+     TERMLIBS="$TERMLIBS $LUA_LIBS"
+     CPPFLAGS="$CPPFLAGS $LUA_CFLAGS"
+   else
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
new file mode 100644
index 0000000..8c7d1f0
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
@@ -0,0 +1,11 @@
+--- /tmp/Makefile.am	2007-08-23 13:10:15.560659023 +0200
++++ gnuplot-4.2.0/Makefile.am	2007-08-23 13:10:34.961764629 +0200
+@@ -1,7 +1,7 @@
+ ## Process this file with automake to produce Makefile.in -*-Makefile-*-
+ AUTOMAKE_OPTIONS = foreign 1.2h
+ 
+-SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
++SUBDIRS = config m4 term src  $(LISPDIR) man share
+ 
+ EXTRA_DIST = BUGS CodeStyle Copyright FAQ GNUmakefile INSTALL INSTALL.gnu \
+ Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST README.exp \
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
deleted file mode 100644
index 3f694a0..0000000
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require gnuplot.inc
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${BP}.tar.gz;name=archive \
-    http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \
-    file://subdirs.patch \
-    file://lua-loadlibs-configure-in-fix.patch \
-    file://gnuplot.desktop \
-    file://gnuplot.png \
-"
-
-SRC_URI[archive.md5sum] = "9a476b21f74bd99c876f1509d731a0f9"
-SRC_URI[archive.sha256sum] = "e550f030c7d04570e89c3d4e3f6e82296816508419c86ab46c4dd73156519a2d"
-SRC_URI[qtplot.md5sum] = "0a481885a496092c77eb4017540b5cf6"
-SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
new file mode 100644
index 0000000..42308ba
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
@@ -0,0 +1,14 @@
+require gnuplot.inc
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${BP}.tar.gz;name=archive \
+    http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \
+    file://subdirs.patch \
+    file://lua-loadlibs-configure-in-fix.patch \
+    file://gnuplot.desktop \
+    file://gnuplot.png \
+"
+
+SRC_URI[archive.md5sum] = "c5e96fca73afbee4f57cbc1bfce6b3b8"
+SRC_URI[archive.sha256sum] = "25f3e0bf192e01115c580f278c3725d7a569eb848786e12b455a3fda70312053"
+SRC_URI[qtplot.md5sum] = "0a481885a496092c77eb4017540b5cf6"
+SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
-- 
2.8.3


