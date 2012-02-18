Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Ryrq6-0006HI-Rm
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 22:29:06 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4C33222325AA;
	Sat, 18 Feb 2012 22:20:53 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BB92522325AB;
	Sat, 18 Feb 2012 22:20:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g229046026.adsl.alicedsl.de
	[92.229.46.26]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sat, 18 Feb 2012 22:20:49 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id F205F3C4BF; Sat, 18 Feb 2012 22:20:44 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2012 22:20:16 +0100
Message-Id: <1329600022-8027-7-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 06/12][oe-classic] jamvm: add recipes which combines native and target
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
X-List-Received-Date: Sat, 18 Feb 2012 21:29:07 -0000


Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/jamvm/jamvm.inc                      |   36 +++++++++++---
 recipes/jamvm/jamvm/jamvm-jni_h-noinst.patch |   13 +++++
 recipes/jamvm/jamvm/libffi.patch             |   69 ++++++++++++++++++++++++++
 recipes/jamvm/jamvm_git.bb                   |   15 ++++++
 4 files changed, 126 insertions(+), 7 deletions(-)
 create mode 100644 recipes/jamvm/jamvm/jamvm-jni_h-noinst.patch
 create mode 100644 recipes/jamvm/jamvm/libffi.patch
 create mode 100644 recipes/jamvm/jamvm_git.bb

diff --git a/recipes/jamvm/jamvm.inc b/recipes/jamvm/jamvm.inc
index 811a811..95676f6 100644
--- a/recipes/jamvm/jamvm.inc
+++ b/recipes/jamvm/jamvm.inc
@@ -2,25 +2,47 @@ DESCRIPTION = "A compact Java Virtual Machine which conforms to the JVM specific
 HOMEPAGE = "http://jamvm.sourceforge.net/"
 LICENSE = "GPL"
 
-DEPENDS = "zlib classpath virtual/javac-native"
+DEPENDS = "zlib classpath virtual/javac-native libffi"
+DEPENDS_virtclass-native = "zlib-native classpath-native ecj-initial-native libffi-native"
+
 RDEPENDS_${PN} = "classpath"
+RDEPENDS_${PN}_virtclass-native = ""
+
+PROVIDES_virtclass-native = "virtual/java-native"
+RPROVIDES_${PN} = "java2-runtime"
+RPROVIDES_${PN}_virtclass-native = ""
+
+BBCLASSEXTEND = "native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz \
+            file://jamvm-jni_h-noinst.patch \
+            file://libffi.patch \
+          "
 
-RPROVIDES_jamvm = "java2-runtime"
+
+inherit java autotools update-alternatives
 
 # This uses 32 bit arm, so force the instruction set to arm, not thumb
 ARM_INSTRUCTION_SET = "arm"
 
-PRIVATE_LIBS = "libjvm.so"
 
-inherit java autotools update-alternatives
+EXTRA_OECONF = "--with-classpath-install-dir=${prefix} --libdir=${libdir}/jamvm --enable-ffi"
+
+# Enforce usage of ecj-initial.
+EXTRA_OEMAKE = "JAVAC=${STAGING_BINDIR_NATIVE}/ecj-initial \
+                GLIBJ_ZIP=${STAGING_DATADIR_NATIVE}/classpath/glibj.zip \
+               "
 
-EXTRA_OECONF = "--with-classpath-install-dir=${prefix} --libdir=${libdir}/jamvm"
-CFLAGS += "-DDEFAULT_MAX_HEAP=16*MB"
+do_install_append_virtclass-native() {
+	install -d ${D}${bindir}
+	ln -s ${bindir}/jamvm ${D}${bindir}/java
+}
+
+PRIVATE_LIBS = "libjvm.so"
 
 FILES_${PN} += "${libdir}/jamvm/lib*.so"
 
 ALTERNATIVE_NAME = "java"
 ALTERNATIVE_PATH = "${bindir}/jamvm"
 ALTERNATIVE_PRIORITY = "4"
+
diff --git a/recipes/jamvm/jamvm/jamvm-jni_h-noinst.patch b/recipes/jamvm/jamvm/jamvm-jni_h-noinst.patch
new file mode 100644
index 0000000..f0884fd
--- /dev/null
+++ b/recipes/jamvm/jamvm/jamvm-jni_h-noinst.patch
@@ -0,0 +1,13 @@
+Index: jamvm-1.5.3/src/Makefile.am
+===================================================================
+--- jamvm-1.5.3.orig/src/Makefile.am	2009-09-29 09:29:13.386565473 +0200
++++ jamvm-1.5.3/src/Makefile.am	2009-09-29 09:33:47.702565852 +0200
+@@ -23,7 +23,7 @@
+ DIST_SUBDIRS = os arch interp
+ 
+ bin_PROGRAMS = jamvm
+-include_HEADERS = jni.h
++noinst_HEADERS = jni.h
+ 
+ lib_LTLIBRARIES = libjvm.la
+ noinst_LTLIBRARIES = libcore.la
diff --git a/recipes/jamvm/jamvm/libffi.patch b/recipes/jamvm/jamvm/libffi.patch
new file mode 100644
index 0000000..1f68c5e
--- /dev/null
+++ b/recipes/jamvm/jamvm/libffi.patch
@@ -0,0 +1,69 @@
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac	2011-11-18 15:47:15.339088111 +0100
++++ git/configure.ac	2011-11-18 15:47:15.742392674 +0100
+@@ -273,9 +273,24 @@
+     AC_CHECK_LIB(z,inflate,,AC_MSG_ERROR(zlib is missing))
+ fi
+ 
+-if test "$enable_ffi" != no; then
+-    AC_CHECK_LIB(ffi,ffi_call,,AC_MSG_ERROR(libffi is missing))
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
+ fi
++AC_SUBST(LIBFFI_CFLAGS)
++AC_SUBST(LIBFFI_LIBS)
+ 
+ dnl Checks for header files.
+ AC_HEADER_STDC
+@@ -285,10 +300,6 @@
+     AC_CHECK_HEADER(zlib.h,,AC_MSG_ERROR(zlib.h is missing))
+ fi
+ 
+-if test "$enable_ffi" != no; then
+-    AC_CHECK_HEADER(ffi.h,,AC_MSG_ERROR(ffi.h is missing))
+-fi
+-
+ if test "$enable_zip" != no; then
+     AC_DEFINE([USE_ZIP],1,[use zip])
+     use_zip_yes=
+@@ -302,7 +313,9 @@
+ AC_SUBST(use_zip_no)
+ 
+ if test "$enable_ffi" != no; then
+-    AC_DEFINE([USE_FFI],1,[use FFI])
++    if test "$LIBFFI_FOUND" != no; then
++        AC_DEFINE([USE_FFI],1,[use FFI])
++    fi
+ fi
+ 
+ if test "$enable_md_stubs" != no; then
+Index: git/src/Makefile.am
+===================================================================
+--- git.orig/src/Makefile.am	2011-11-18 15:47:15.685730049 +0100
++++ git/src/Makefile.am	2011-11-18 15:49:43.881825251 +0100
+@@ -43,8 +43,9 @@
+ jamvm_LDADD = libcore.la
+ libjvm_la_LIBADD = libcore.la
+ libcore_la_LIBADD = interp/libinterp.la os/@os@/@arch@/libnative.la \
+-                    os/@os@/libos.la classlib/@classlib@/libclasslib.la
++                    os/@os@/libos.la classlib/@classlib@/libclasslib.la \
++                    $(LIBFFI_LIBS)
+ 
+-AM_CPPFLAGS = -I$(top_srcdir)/src/interp/engine
++AM_CPPFLAGS = -I$(top_srcdir)/src/interp/engine $(LIBFFI_CFLAGS)
+ 
+ DISTCLEANFILES = arch.h classlib.h classlib-defs.h classlib-symbol.h
diff --git a/recipes/jamvm/jamvm_git.bb b/recipes/jamvm/jamvm_git.bb
new file mode 100644
index 0000000..e6b6132
--- /dev/null
+++ b/recipes/jamvm/jamvm_git.bb
@@ -0,0 +1,15 @@
+# Note: You *must* use this together with classpath-native 0.98.
+# Otherwise it won't work!
+
+require jamvm.inc
+
+SRCREV = "4617da717ecb05654ea5bb9572338061106a414d"
+PV = "1.5.5+1.6.0-devel+git${SRCPV}"
+
+SRC_URI = "git://git.berlios.de/jamvm;protocol=git \
+           file://jamvm-jni_h-noinst.patch \
+           file://libffi.patch \
+          "
+
+S = "${WORKDIR}/git"
+
-- 
1.7.9


