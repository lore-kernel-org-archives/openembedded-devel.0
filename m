Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Ryrq2-0006GG-Jg
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 22:29:03 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A9F7022325AD;
	Sat, 18 Feb 2012 22:20:48 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 21BB422325A8;
	Sat, 18 Feb 2012 22:20:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g229046026.adsl.alicedsl.de
	[92.229.46.26]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sat, 18 Feb 2012 22:20:46 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 8D0873C4BB; Sat, 18 Feb 2012 22:20:44 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2012 22:20:12 +0100
Message-Id: <1329600022-8027-3-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 02/12][oe-classic] jamvm-inital: rework libffi detection
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
X-List-Received-Date: Sat, 18 Feb 2012 21:29:03 -0000

* this patch allows us to real enable or disable libffi and
   it does not let sneak host libs in

Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/jamvm/jamvm-initial/libffi.patch |   68 ++++++++++++++++++++++++++++++
 recipes/jamvm/jamvm-initial_1.4.5.bb     |   12 +++---
 2 files changed, 74 insertions(+), 6 deletions(-)
 create mode 100644 recipes/jamvm/jamvm-initial/libffi.patch

diff --git a/recipes/jamvm/jamvm-initial/libffi.patch b/recipes/jamvm/jamvm-initial/libffi.patch
new file mode 100644
index 0000000..52c7e10
--- /dev/null
+++ b/recipes/jamvm/jamvm-initial/libffi.patch
@@ -0,0 +1,68 @@
+Index: jamvm-1.4.5/configure.ac
+===================================================================
+--- jamvm-1.4.5.orig/configure.ac	2007-02-05 04:18:05.000000000 +0100
++++ jamvm-1.4.5/configure.ac	2012-02-16 22:38:03.687663901 +0100
+@@ -166,10 +166,25 @@
+         enable_zip=no
+     fi])
+ 
+-AC_CHECK_LIB(ffi,ffi_call,,
+-    [if test "$enable_ffi" != no; then
+-        AC_MSG_ERROR(cannot find libffi)
+-    fi])
++LIBFFI_FOUND=no
++if test "$enable_ffi" = yes
++then
++PKG_CHECK_MODULES([LIBFFI], [libffi], [LIBFFI_FOUND=yes], [LIBFFI_FOUND=no])
++if test "x${LIBFFI_FOUND}" = xno
++then
++  LIBFFI_FOUND=
++  AC_CHECK_HEADER([ffi.h],[LIBFFI_CFLAGS=],[LIBFFI_FOUND=no])
++  AC_SEARCH_LIBS([ffi_call], [ffi],[LIBFFI_LIBS=-lffi],[LIBFFI_FOUND=no])
++  if test "x${LIBFFI_FOUND}" = xno
++    then
++      AC_MSG_ERROR([Could not find libffi headers - \
++      Instal libffi-devel or libffi-dev.])
++ fi
++fi
++fi
++AC_SUBST(LIBFFI_CFLAGS)
++AC_SUBST(LIBFFI_LIBS)
++
+ 
+ dnl Checks for header files.
+ AC_HEADER_STDC
+@@ -180,11 +195,6 @@
+         enable_zip=no
+     fi])
+ 
+-AC_CHECK_HEADER(ffi.h,,
+-    [if test "$enable_ffi" != no; then
+-        AC_MSG_ERROR(cannot find ffi.h)
+-    fi])
+-
+ if test "$enable_zip" != no; then
+     AC_DEFINE([USE_ZIP],1,[use zip])
+     use_zip_yes=
+@@ -197,7 +207,7 @@
+ AC_SUBST(use_zip_yes)
+ AC_SUBST(use_zip_no)
+ 
+-if test "$enable_ffi" != no; then
++if test "x${LIBFFI_FOUND}" != xno; then
+     AC_DEFINE([USE_FFI],1,[use FFI])
+ fi
+ 
+Index: jamvm-1.4.5/src/Makefile.am
+===================================================================
+--- jamvm-1.4.5.orig/src/Makefile.am	2006-12-25 05:10:18.000000000 +0100
++++ jamvm-1.4.5/src/Makefile.am	2012-02-16 22:36:26.211385087 +0100
+@@ -19,6 +19,7 @@
+ 
+ jamvm_LDADD = libcore.la
+ libjvm_la_LIBADD = libcore.la
+-libcore_la_LIBADD = os/@os@/@arch@/libnative.la os/@os@/libos.la
++libcore_la_LIBADD = os/@os@/@arch@/libnative.la os/@os@/libos.la $(LIBFFI_LIBS)
++libcore_la_CPPFLAGS = $(LIBFFI_CFLAGS)
+ 
+ DISTCLEANFILES = arch.h
diff --git a/recipes/jamvm/jamvm-initial_1.4.5.bb b/recipes/jamvm/jamvm-initial_1.4.5.bb
index 55bd5f9..de790a4 100644
--- a/recipes/jamvm/jamvm-initial_1.4.5.bb
+++ b/recipes/jamvm/jamvm-initial_1.4.5.bb
@@ -4,13 +4,14 @@ LICENSE = "GPL"
 
 DEPENDS = "zlib-native classpath-initial jikes-initial libffi-native"
 
-PR = "r3"
+PR = "r4"
 
 PROVIDES = "virtual/java-initial"
 
 S = "${WORKDIR}/jamvm-${PV}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz \
+          file://libffi.patch \
           file://jamvm_${PV}-initial.patch \
           "
 
@@ -22,6 +23,7 @@ inherit native autotools
 # libdir must be modified so that jamvm-initial and -native
 # do not interfere
 EXTRA_OECONF = "\
+  --enable-ffi \
   --with-classpath-install-dir=${prefix} \
   --program-suffix=-initial \
   --libdir=${STAGING_LIBDIR}/jamvm-initial \
@@ -30,11 +32,9 @@ EXTRA_OECONF = "\
 # jamvm-initial has to run some binaries which need lots of memory.
 CFLAGS += "-DDEFAULT_MAX_HEAP=512*MB"
 
-do_compile() {
-  oe_runmake \
-    JAVAC=jikes-initial \
-    GLIBJ_ZIP=${STAGING_DATADIR_NATIVE}/classpath-initial/glibj.zip
-}
+EXTRA_OEMAKE = "JAVAC=${STAGING_BINDIR_NATIVE}/jikes-initial \
+                GLIBJ_ZIP=${STAGING_DATADIR_NATIVE}/classpath-inital/glibj.zip \
+               "
 
 do_install_append() {
   install -d ${D}${bindir}/
-- 
1.7.9


