Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1Pd9Pc-0007e9-K7
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 23:43:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 105E08DF383;
	Wed, 12 Jan 2011 17:42:58 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14628-05; Wed, 12 Jan 2011 17:42:57 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id B3F3092CC66; Wed, 12 Jan 2011 17:42:57 -0500 (EST)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 8BAC51A64EE;
	Wed, 12 Jan 2011 17:42:55 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 6CC1F14222A6; Wed, 12 Jan 2011 17:42:55 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 17:42:54 -0500
Message-Id: <1294872175-23969-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3.2
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 1/2] icedtea6-native 1.7.5: fix build on old build hosts
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
X-List-Received-Date: Wed, 12 Jan 2011 22:43:28 -0000

Set ALT_FREETYPE_HEADERS_PATH so openjdk-ecj doesn't look in
/usr/include for freetype2 headers.

Build xawt sizer.32 on x86_64. A precompiled sizer.32 is included in
the icedtea tarball, but this could be an accident, and it doesn't
run on older build systems that can't handle DT_GNU_HASH executables;
this later causes the openjdk-6 build to fail for 32-bit targets.

Signed-off-by: Michael Smith <msmith@cbnco.com>
Cc: Henning Heinold <heinold@inf.fu-berlin.de>
---
 .../icedtea-jdk-build-sizer-32-on-amd64.patch      |   36 ++++++++++++++++++++
 recipes/icedtea/icedtea6-native.inc                |    6 +++-
 recipes/icedtea/icedtea6-native_1.7.5.bb           |    2 +
 3 files changed, 43 insertions(+), 1 deletions(-)
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.5/icedtea-jdk-build-sizer-32-on-amd64.patch

diff --git a/recipes/icedtea/icedtea6-native-1.7.5/icedtea-jdk-build-sizer-32-on-amd64.patch b/recipes/icedtea/icedtea6-native-1.7.5/icedtea-jdk-build-sizer-32-on-amd64.patch
new file mode 100644
index 0000000..3baeb5d
--- /dev/null
+++ b/recipes/icedtea/icedtea6-native-1.7.5/icedtea-jdk-build-sizer-32-on-amd64.patch
@@ -0,0 +1,36 @@
+Build the xawt sizer.32 binary on Linux/x86_64 so we can use it when
+compiling openjdk for 32-bit platforms.
+
+--- openjdk/jdk/make/sun/xawt/Makefile.orig	2011-01-08 01:53:22.000000000 -0500
++++ openjdk/jdk/make/sun/xawt/Makefile	2011-01-11 15:12:17.000000000 -0500
+@@ -184,6 +184,22 @@
+ 
+ else # !solaris
+ 
++ifeq ($(PLATFORM), linux)
++
++ifeq ($(ARCH), amd64)
++# On amd64 we generate both 32 and 64-bit sizers in spite of ARCH_DATA_MODEL.
++SIZERS = $(SIZER).32 $(SIZER).64
++SIZERS_C = $(SIZER_32_C) $(SIZER_64_C)
++SIZES = $(WRAPPER_GENERATOR_DIR)/sizes.32 $(WRAPPER_GENERATOR_DIR)/sizes.64
++CFLAGS_32 = $(CFLAGS) -m32
++else # !amd64
++SIZERS = $(SIZER).32
++SIZERS_C = $(SIZER_32_C)
++SIZES = $(WRAPPER_GENERATOR_DIR)/sizes.32
++endif # amd64
++
++else # !linux
++
+ ifeq ($(ARCH_DATA_MODEL), 32)
+ SIZERS = $(SIZER).32
+ SIZERS_C = $(SIZER_32_C)
+@@ -194,6 +210,7 @@
+ SIZES = $(WRAPPER_GENERATOR_DIR)/sizes.64
+ endif # 32
+ 
++endif # linux
+ endif # solaris
+ 
+ # XXX Hack for 6185483 - use hard-coded sizes.
diff --git a/recipes/icedtea/icedtea6-native.inc b/recipes/icedtea/icedtea6-native.inc
index 5be2dc6..39ecdad 100644
--- a/recipes/icedtea/icedtea6-native.inc
+++ b/recipes/icedtea/icedtea6-native.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Harness to build the source code from OpenJDK using Free Software build tools"
 HOMEPAGE = "http://icedtea.classpath.org"
 LICENSE  = "GPL with Classpath Exception"
-INC_PR = "r2"
+INC_PR = "r3"
 
 DEPENDS = "virtual/javac-native classpath-tools-native \
 	   virtual/java-native classpath-native \
@@ -18,6 +18,10 @@ JAVA_HOME[unexport] = "1"
 # No parallel build yet.
 PARALLEL_MAKE = ""
 
+# openjdk-ecj looks in /usr/include and /usr/lib for freetype by default.
+export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
+export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
+
 # Configure options compatible with Cacao >= 0.99 only!
 EXTRA_OECONF = "\
 	--with-parallel-jobs=1 \
diff --git a/recipes/icedtea/icedtea6-native_1.7.5.bb b/recipes/icedtea/icedtea6-native_1.7.5.bb
index 308da11..373d1c4 100644
--- a/recipes/icedtea/icedtea6-native_1.7.5.bb
+++ b/recipes/icedtea/icedtea6-native_1.7.5.bb
@@ -24,6 +24,7 @@ ICEDTEA_PATCHES = "\
 	file://icedtea-hotspot-make-arch-sane-for-x86.patch;apply=no \
 	file://icedtea-jdk-sane-x86-arch.patch;apply=no \
 	file://icedtea-unbreak-float.patch;apply=no \
+	file://icedtea-jdk-build-sizer-32-on-amd64.patch;apply=no \
 	"
 
 export DISTRIBUTION_PATCHES = "\
@@ -33,4 +34,5 @@ export DISTRIBUTION_PATCHES = "\
 	patches/icedtea-hotspot-make-arch-sane-for-x86.patch \
 	patches/icedtea-jdk-sane-x86-arch.patch \
 	patches/icedtea-unbreak-float.patch \
+	patches/icedtea-jdk-build-sizer-32-on-amd64.patch \
 	"
-- 
1.6.3.2



