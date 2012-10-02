Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1TJ3H0-00031V-8L
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Oct 2012 16:16:34 +0200
Received: from fsc-480-012-88.intern.dresearch.de
	(fsc-480-012-88.internal.dresearch-fe.de [172.29.23.5])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 1E12AE02A9;
	Tue,  2 Oct 2012 13:57:40 +0000 (UTC)
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 1002)
	id 06A5E72026; Tue,  2 Oct 2012 15:53:58 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Henning Heinold <h.heinold@tarent.de>, Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue,  2 Oct 2012 15:53:51 +0200
Message-Id: <a828cea6b5def8abe4dbfca236d8190ae6946f4f.1349185327.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <3cc90251ccf802274a95f736784f532e21166afb.1349185327.git.sledz@dresearch-fe.de>
References: <3cc90251ccf802274a95f736784f532e21166afb.1349185327.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1349185326.git.sledz@dresearch-fe.de>
References: <cover.1349185326.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 2/2] jamvm-initial: backport 1.4.5 from meta-java
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
X-List-Received-Date: Tue, 02 Oct 2012 14:16:34 -0000

This fixes the at least the problem of endless loop in java-initial
script while running do_configure for classpath-native.

see also: http://thread.gmane.org/gmane.comp.handhelds.openembedded/54242

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/jamvm/files/java-initial                   |   17 +++++
 ...mvm_1.4.5-initial.patch => jamvm-initial.patch} |   19 ------
 recipes/jamvm/jamvm-initial_1.4.5.bb               |   22 ++++---
 recipes/jamvm/jamvm/libffi.patch                   |   66 ++++++++++++++++++++
 4 files changed, 95 insertions(+), 29 deletions(-)
 create mode 100755 recipes/jamvm/files/java-initial
 rename recipes/jamvm/jamvm-initial/{jamvm_1.4.5-initial.patch => jamvm-initial.patch} (81%)
 create mode 100644 recipes/jamvm/jamvm/libffi.patch

diff --git a/recipes/jamvm/files/java-initial b/recipes/jamvm/files/java-initial
new file mode 100755
index 0000000..1b27f81
--- /dev/null
+++ b/recipes/jamvm/files/java-initial
@@ -0,0 +1,17 @@
+#!/bin/sh
+#
+# Wrapper which (almost) silently restarts the VM in case of segfaults.
+
+error_counter=0;
+error_occured=139
+while [ ${error_counter} -le 50 -a ${error_occured} -eq 139 ]; do
+    echo "Running JamVM-initial: ${@}"
+    jamvm-initial ${1+"$@"}
+    error_occured=$?
+    if [ ${error_occured} -eq 139 ]; then
+        echo "JamVM-initial crashed - silently trying again"
+        error_counter=$(( $error_counter + 1 ))
+    fi
+done
+
+exit ${error_occured}
diff --git a/recipes/jamvm/jamvm-initial/jamvm_1.4.5-initial.patch b/recipes/jamvm/jamvm-initial/jamvm-initial.patch
similarity index 81%
rename from recipes/jamvm/jamvm-initial/jamvm_1.4.5-initial.patch
rename to recipes/jamvm/jamvm-initial/jamvm-initial.patch
index 175052d..fb069f8 100644
--- a/recipes/jamvm/jamvm-initial/jamvm_1.4.5-initial.patch
+++ b/recipes/jamvm/jamvm-initial/jamvm-initial.patch
@@ -10,25 +10,6 @@ Index: jamvm-1.4.5/configure.ac
  AC_CONFIG_HEADERS([src/config.h])
  AC_PREFIX_DEFAULT(/usr/local/jamvm)
  
-Index: jamvm-1.4.5/java-initial
-===================================================================
---- /dev/null
-+++ jamvm-1.4.5/java-initial
-@@ -0,0 +1,14 @@
-+#!/bin/sh
-+#
-+# Wrapper which (almost) silently restarts the VM in case of segfaults.
-+
-+redo_from_start=1;
-+while [ $redo_from_start -eq 1 ]; do
-+    echo "Running JamVM-initial: ${@}"
-+    redo_from_start=0;
-+    jamvm-initial ${1+"$@"}
-+    if [ $? -eq 139 ]; then
-+        echo "JamVM-initial crashed - silently trying again"
-+        redo_from_start=1;
-+    fi
-+done
 Index: jamvm-1.4.5/lib/Makefile.am
 ===================================================================
 --- jamvm-1.4.5.orig/lib/Makefile.am
diff --git a/recipes/jamvm/jamvm-initial_1.4.5.bb b/recipes/jamvm/jamvm-initial_1.4.5.bb
index 55bd5f9..a662077 100644
--- a/recipes/jamvm/jamvm-initial_1.4.5.bb
+++ b/recipes/jamvm/jamvm-initial_1.4.5.bb
@@ -1,17 +1,20 @@
 SUMMARY = "A compact Java Virtual Machine which conforms to the JVM specification version 2."
 HOMEPAGE = "http://jamvm.sourceforge.net/"
 LICENSE = "GPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS = "zlib-native classpath-initial jikes-initial libffi-native"
 
-PR = "r3"
-
 PROVIDES = "virtual/java-initial"
 
+PR = "r4"
+
 S = "${WORKDIR}/jamvm-${PV}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz \
-          file://jamvm_${PV}-initial.patch \
+           file://libffi.patch \
+           file://jamvm-initial.patch \
+           file://java-initial \
           "
 
 # This uses 32 bit arm, so force the instruction set to arm, not thumb
@@ -25,20 +28,19 @@ EXTRA_OECONF = "\
   --with-classpath-install-dir=${prefix} \
   --program-suffix=-initial \
   --libdir=${STAGING_LIBDIR}/jamvm-initial \
+  --enable-ffi \
   "
 
 # jamvm-initial has to run some binaries which need lots of memory.
 CFLAGS += "-DDEFAULT_MAX_HEAP=512*MB"
 
-do_compile() {
-  oe_runmake \
-    JAVAC=jikes-initial \
-    GLIBJ_ZIP=${STAGING_DATADIR_NATIVE}/classpath-initial/glibj.zip
-}
-
+# Enforce usage of jikes-initial.
+EXTRA_OEMAKE = "JAVAC=${STAGING_BINDIR_NATIVE}/jikes-initial \
+                GLIBJ_ZIP=${STAGING_DATADIR_NATIVE}/classpath-inital/glibj.zip \
+               "
 do_install_append() {
   install -d ${D}${bindir}/
-  install -m 0755 java-initial ${D}${bindir}/
+  install -m 0755 ${WORKDIR}/java-initial ${D}${bindir}/
 }
 
 SRC_URI[md5sum] = "3f538bab6e1c77aed331e5e71f754f5b"
diff --git a/recipes/jamvm/jamvm/libffi.patch b/recipes/jamvm/jamvm/libffi.patch
new file mode 100644
index 0000000..c705ad2
--- /dev/null
+++ b/recipes/jamvm/jamvm/libffi.patch
@@ -0,0 +1,66 @@
+diff -Nurd /home/sledz/jamvm-1.4.5.orig/configure.ac jamvm-1.4.5/configure.ac
+--- /home/sledz/jamvm-1.4.5.orig/configure.ac	2012-10-02 15:14:03.000000000 +0200
++++ jamvm-1.4.5/configure.ac	2012-10-02 15:14:49.000000000 +0200
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
++if test "x${LIBFFI_FOUND}" != no; then
+     AC_DEFINE([USE_FFI],1,[use FFI])
+ fi
+ 
+diff -Nurd /home/sledz/jamvm-1.4.5.orig/src/Makefile.am jamvm-1.4.5/src/Makefile.am
+--- /home/sledz/jamvm-1.4.5.orig/src/Makefile.am	2012-10-02 15:14:03.000000000 +0200
++++ jamvm-1.4.5/src/Makefile.am	2012-10-02 15:14:49.000000000 +0200
+@@ -19,6 +19,7 @@
+ 
+ jamvm_LDADD = libcore.la
+ libjvm_la_LIBADD = libcore.la
+-libcore_la_LIBADD = os/@os@/@arch@/libnative.la os/@os@/libos.la
++libcore_la_LIBADD = os/@os@/@arch@/libnative.la os/@os@/libos.la $(LIBFFI_LIBS)
++libcore_la_CPPFLAGS = $(LIBFFI_CFLAGS)
+ 
+ DISTCLEANFILES = arch.h
-- 
1.7.10.4



