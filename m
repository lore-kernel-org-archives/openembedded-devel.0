Received: from metis.ext.pengutronix.de ([92.198.50.35])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jlu@pengutronix.de>) id 1TNglo-00042R-Ox
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Oct 2012 11:15:32 +0200
Received: from dude.hi.pengutronix.de ([2001:6f8:1178:2:21e:67ff:fe11:9c5c])
	by metis.ext.pengutronix.de with esmtp (Exim 4.72)
	(envelope-from <jlu@pengutronix.de>)
	id 1TNgYz-0003oI-MR; Mon, 15 Oct 2012 11:02:17 +0200
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.80)
	(envelope-from <jlu@pengutronix.de>)
	id 1TNgYz-0006CU-B1; Mon, 15 Oct 2012 11:02:17 +0200
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Oct 2012 11:02:07 +0200
Message-Id: <1350291727-23742-1-git-send-email-jlu@pengutronix.de>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 2001:6f8:1178:2:21e:67ff:fe11:9c5c
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-java][PATCH] icedtea6-native: fix build with gcc 4.6
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
X-List-Received-Date: Mon, 15 Oct 2012 09:15:32 -0000

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 ...-booleans-from-methods-returning-pointers.patch |   12 ++
 .../icedtea-remove-mimpure-option-to-gcc.patch     |  187 ++++++++++++++++++++
 recipes-core/icedtea/icedtea6-native_1.8.11.bb     |    6 +-
 3 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 meta-java/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-dont-return-booleans-from-methods-returning-pointers.patch
 create mode 100644 meta-java/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-remove-mimpure-option-to-gcc.patch

diff --git a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-dont-return-booleans-from-methods-returning-pointers.patch b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-dont-return-booleans-from-methods-returning-pointers.patch
new file mode 100644
index 0000000..315f074
--- /dev/null
+++ b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-dont-return-booleans-from-methods-returning-pointers.patch
@@ -0,0 +1,12 @@
+diff -ur openjdk.orig/hotspot/src/share/vm/opto/loopnode.cpp openjdk/hotspot/src/share/vm/opto/loopnode.cpp
+--- openjdk.orig/hotspot/src/share/vm/opto/loopnode.cpp	2011-11-14 17:07:36.000000000 -0500
++++ openjdk/hotspot/src/share/vm/opto/loopnode.cpp	2012-01-30 11:25:10.648080484 -0500
+@@ -546,7 +546,7 @@
+ Node* CountedLoopNode::match_incr_with_optional_truncation(
+                       Node* expr, Node** trunc1, Node** trunc2, const TypeInt** trunc_type) {
+   // Quick cutouts:
+-  if (expr == NULL || expr->req() != 3)  return false;
++  if (expr == NULL || expr->req() != 3)  return NULL;
+ 
+   Node *t1 = NULL;
+   Node *t2 = NULL;
diff --git a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-remove-mimpure-option-to-gcc.patch b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-remove-mimpure-option-to-gcc.patch
new file mode 100644
index 0000000..b680b31
--- /dev/null
+++ b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-remove-mimpure-option-to-gcc.patch
@@ -0,0 +1,187 @@
+diff --git a/corba/make/common/shared/Compiler-gcc.gmk b/corba/make/common/shared/Compiler-gcc.gmk
+index d1e16da..7ef5dda 100644
+--- openjdk.orig/corba/make/common/shared/Compiler-gcc.gmk
++++ openjdk/corba/make/common/shared/Compiler-gcc.gmk
+@@ -95,7 +95,7 @@ ifeq ($(PLATFORM), linux)
+   endif
+   endif
+   # Option used to create a shared library
+-  SHARED_LIBRARY_FLAG = -shared -mimpure-text
++  SHARED_LIBRARY_FLAG = -shared
+   SUN_COMP_VER := $(shell $(CC) --verbose 2>&1 )
+ 
+ endif
+diff --git a/jdk/make/common/shared/Compiler-gcc.gmk b/jdk/make/common/shared/Compiler-gcc.gmk
+index dc6f757..6c1922b 100644
+--- openjdk.orig/jdk/make/common/shared/Compiler-gcc.gmk
++++ openjdk/jdk/make/common/shared/Compiler-gcc.gmk
+@@ -132,7 +132,7 @@ ifeq ($(PLATFORM), linux)
+     REQUIRED_GCC_VER = 4.0.*
+   endif
+   # Option used to create a shared library
+-  SHARED_LIBRARY_FLAG = -shared -mimpure-text
++  SHARED_LIBRARY_FLAG = -shared
+   SUN_COMP_VER := $(shell $(CC) --verbose 2>&1 )
+ 
+ endif
+diff --git a/jdk/src/share/demo/jvmti/compiledMethodLoad/sample.makefile.txt b/jdk/src/share/demo/jvmti/compiledMethodLoad/sample.makefile.txt
+index a759dc7..d9871c2 100644
+--- openjdk.orig/jdk/src/share/demo/jvmti/compiledMethodLoad/sample.makefile.txt
++++ openjdk/jdk/src/share/demo/jvmti/compiledMethodLoad/sample.makefile.txt
+@@ -90,7 +90,7 @@ ifeq ($(OSNAME), linux)
+     OBJECTS=$(SOURCES:%.c=%.o)
+     # Library name and options needed to build it
+     LIBRARY=lib$(LIBNAME).so
+-    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc -mimpure-text
++    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc
+     # Libraries we are dependent on
+     LIBRARIES=-lc
+     # Building a shared library
+diff --git a/jdk/src/share/demo/jvmti/gctest/sample.makefile.txt b/jdk/src/share/demo/jvmti/gctest/sample.makefile.txt
+index 8a8e40a..a0edfbd 100644
+--- openjdk.orig/jdk/src/share/demo/jvmti/gctest/sample.makefile.txt
++++ openjdk/jdk/src/share/demo/jvmti/gctest/sample.makefile.txt
+@@ -90,7 +90,7 @@ ifeq ($(OSNAME), linux)
+     OBJECTS=$(SOURCES:%.c=%.o)
+     # Library name and options needed to build it
+     LIBRARY=lib$(LIBNAME).so
+-    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc -mimpure-text
++    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc
+     # Libraries we are dependent on
+     LIBRARIES=-lc
+     # Building a shared library
+diff --git a/jdk/src/share/demo/jvmti/heapTracker/sample.makefile.txt b/jdk/src/share/demo/jvmti/heapTracker/sample.makefile.txt
+index e102fba..00fb0d2 100644
+--- openjdk.orig/jdk/src/share/demo/jvmti/heapTracker/sample.makefile.txt
++++ openjdk/jdk/src/share/demo/jvmti/heapTracker/sample.makefile.txt
+@@ -94,7 +94,7 @@ ifeq ($(OSNAME), linux)
+     OBJECTS=$(SOURCES:%.c=%.o)
+     # Library name and options needed to build it
+     LIBRARY=lib$(LIBNAME).so
+-    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc -mimpure-text
++    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc
+     # Libraries we are dependent on
+     LIBRARIES=-L $(JDK)/jre/lib/$(LIBARCH) -ljava_crw_demo -lc
+     # Building a shared library
+diff --git a/jdk/src/share/demo/jvmti/heapViewer/sample.makefile.txt b/jdk/src/share/demo/jvmti/heapViewer/sample.makefile.txt
+index 07905e5..c4dc8f4 100644
+--- openjdk.orig/jdk/src/share/demo/jvmti/heapViewer/sample.makefile.txt
++++ openjdk/jdk/src/share/demo/jvmti/heapViewer/sample.makefile.txt
+@@ -90,7 +90,7 @@ ifeq ($(OSNAME), linux)
+     OBJECTS=$(SOURCES:%.c=%.o)
+     # Library name and options needed to build it
+     LIBRARY=lib$(LIBNAME).so
+-    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc -mimpure-text
++    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc
+     # Libraries we are dependent on
+     LIBRARIES=-lc
+     # Building a shared library
+diff --git a/jdk/src/share/demo/jvmti/hprof/sample.makefile.txt b/jdk/src/share/demo/jvmti/hprof/sample.makefile.txt
+index 9ef36a1..9d4506c 100644
+--- openjdk.orig/jdk/src/share/demo/jvmti/hprof/sample.makefile.txt
++++ openjdk/jdk/src/share/demo/jvmti/hprof/sample.makefile.txt
+@@ -130,7 +130,7 @@ ifeq ($(OSNAME), linux)
+     OBJECTS=$(SOURCES:%.c=%.o)
+     # Library name and options needed to build it
+     LIBRARY=lib$(LIBNAME).so
+-    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc -mimpure-text
++    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc
+     # Libraries we are dependent on
+     LIBRARIES= -lnsl -ldl -lc
+     # Building a shared library
+diff --git a/jdk/src/share/demo/jvmti/index.html b/jdk/src/share/demo/jvmti/index.html
+index b3efe37..f1e6fa2 100644
+--- openjdk.orig/jdk/src/share/demo/jvmti/index.html
++++ openjdk/jdk/src/share/demo/jvmti/index.html
+@@ -308,7 +308,7 @@ For X86:
+ <code><ul>
+ gcc -O2 -fPIC -pthread -DLINUX -c <i>*.c</i>
+ <br>
+-gcc -z defs -static-libgcc -shared -mimpure-text -o <i>libXXX.so *.o</i> -lc
++gcc -z defs -static-libgcc -shared -o <i>libXXX.so *.o</i> -lc
+ </code></ul>
+ <br>
+ For AMD64:
+@@ -316,7 +316,7 @@ For AMD64:
+ <code><ul>
+ gcc -O2 -fPIC -pthread -DLINUX -D_LP64=1 -c <i>*.c</i>
+ <br>
+-gcc -z defs -static-libgcc -shared -mimpure-text -o <i>libXXX.so *.o</i> -lc
++gcc -z defs -static-libgcc -shared -o <i>libXXX.so *.o</i> -lc
+ </code></ul>
+ <br>
+ </li>
+@@ -339,7 +339,7 @@ option.
+ </li>
+ 
+ <li>
+-Library: Use -static-libgcc -mimpure-text.
++Library: Use -static-libgcc.
+ <br>
+ When building the shared library (-shared option), this option
+ allows for maximum portability of the library between different
+diff --git a/jdk/src/share/demo/jvmti/java_crw_demo/sample.makefile.txt b/jdk/src/share/demo/jvmti/java_crw_demo/sample.makefile.txt
+index 84f0c01..b07d2c1 100644
+--- openjdk.orig/jdk/src/share/demo/jvmti/java_crw_demo/sample.makefile.txt
++++ openjdk/jdk/src/share/demo/jvmti/java_crw_demo/sample.makefile.txt
+@@ -90,7 +90,7 @@ ifeq ($(OSNAME), linux)
+     OBJECTS=$(SOURCES:%.c=%.o)
+     # Library name and options needed to build it
+     LIBRARY=lib$(LIBNAME).so
+-    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc -mimpure-text
++    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc
+     # Libraries we are dependent on
+     LIBRARIES=-lc
+     # Building a shared library
+diff --git a/jdk/src/share/demo/jvmti/minst/sample.makefile.txt b/jdk/src/share/demo/jvmti/minst/sample.makefile.txt
+index 86ddeb4..42ae05a 100644
+--- openjdk.orig/jdk/src/share/demo/jvmti/minst/sample.makefile.txt
++++ openjdk/jdk/src/share/demo/jvmti/minst/sample.makefile.txt
+@@ -94,7 +94,7 @@ ifeq ($(OSNAME), linux)
+     OBJECTS=$(SOURCES:%.c=%.o)
+     # Library name and options needed to build it
+     LIBRARY=lib$(LIBNAME).so
+-    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc -mimpure-text
++    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc
+     # Libraries we are dependent on
+     LIBRARIES=-L $(JDK)/jre/lib/$(LIBARCH) -ljava_crw_demo -lc
+     # Building a shared library
+diff --git a/jdk/src/share/demo/jvmti/mtrace/sample.makefile.txt b/jdk/src/share/demo/jvmti/mtrace/sample.makefile.txt
+index b6480e6..dd45185 100644
+--- openjdk.orig/jdk/src/share/demo/jvmti/mtrace/sample.makefile.txt
++++ openjdk/jdk/src/share/demo/jvmti/mtrace/sample.makefile.txt
+@@ -94,7 +94,7 @@ ifeq ($(OSNAME), linux)
+     OBJECTS=$(SOURCES:%.c=%.o)
+     # Library name and options needed to build it
+     LIBRARY=lib$(LIBNAME).so
+-    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc -mimpure-text
++    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc
+     # Libraries we are dependent on
+     LIBRARIES=-L $(JDK)/jre/lib/$(LIBARCH) -ljava_crw_demo -lc
+     # Building a shared library
+diff --git a/jdk/src/share/demo/jvmti/versionCheck/sample.makefile.txt b/jdk/src/share/demo/jvmti/versionCheck/sample.makefile.txt
+index f7775b5..a5b6a5c 100644
+--- openjdk.orig/jdk/src/share/demo/jvmti/versionCheck/sample.makefile.txt
++++ openjdk/jdk/src/share/demo/jvmti/versionCheck/sample.makefile.txt
+@@ -90,7 +90,7 @@ ifeq ($(OSNAME), linux)
+     OBJECTS=$(SOURCES:%.c=%.o)
+     # Library name and options needed to build it
+     LIBRARY=lib$(LIBNAME).so
+-    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc -mimpure-text
++    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc
+     # Libraries we are dependent on
+     LIBRARIES=-lc
+     # Building a shared library
+diff --git a/jdk/src/share/demo/jvmti/waiters/sample.makefile.txt b/jdk/src/share/demo/jvmti/waiters/sample.makefile.txt
+index b04bd07..46511af 100644
+--- openjdk.orig/jdk/src/share/demo/jvmti/waiters/sample.makefile.txt
++++ openjdk/jdk/src/share/demo/jvmti/waiters/sample.makefile.txt
+@@ -91,7 +91,7 @@ ifeq ($(OSNAME), linux)
+     OBJECTS=$(SOURCES:%.cpp=%.o)
+     # Library name and options needed to build it
+     LIBRARY=lib$(LIBNAME).so
+-    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc -mimpure-text
++    LDFLAGS=-Wl,-soname=$(LIBRARY) -static-libgcc
+     # Libraries we are dependent on
+     LIBRARIES=
+     # Building a shared library
diff --git a/recipes-core/icedtea/icedtea6-native_1.8.11.bb b/recipes-core/icedtea/icedtea6-native_1.8.11.bb
index 7c2e6ea..c663e97 100644
--- a/recipes-core/icedtea/icedtea6-native_1.8.11.bb
+++ b/recipes-core/icedtea/icedtea6-native_1.8.11.bb
@@ -4,7 +4,7 @@ require ${PN}.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI = "\
 	http://icedtea.classpath.org/download/source/icedtea6-${PV}.tar.gz;name=iced \
@@ -44,6 +44,8 @@ ICEDTEA_PATCHES = "\
         file://icedtea-jdk-sane-x86-arch.patch;apply=no \
         file://icedtea-unbreak-float.patch;apply=no \
         file://icedtea-jdk-avoid-cdef-collision.patch;apply=no \
+	file://icedtea-dont-return-booleans-from-methods-returning-pointers.patch;apply=no \
+	file://icedtea-remove-mimpure-option-to-gcc.patch;apply=no \
 	"
 
 export DISTRIBUTION_PATCHES = "\
@@ -54,6 +56,8 @@ export DISTRIBUTION_PATCHES = "\
         patches/icedtea-jdk-sane-x86-arch.patch \
 	patches/icedtea-unbreak-float.patch \
         patches/icedtea-jdk-avoid-cdef-collision.patch \
+	patches/icedtea-dont-return-booleans-from-methods-returning-pointers.patch \
+	patches/icedtea-remove-mimpure-option-to-gcc.patch \
 	"
 
 EXTRA_OECONF += " --with-jaxws-drop-zip=${DL_DIR}/jdk6-jaxws-2009_10_27.zip \
-- 
1.7.10.4



