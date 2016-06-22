Return-Path: <danismostlikely@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id A7456731C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 16:38:48 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c74so4470713pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 09:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=hypZR7auqXwO/8QN88DFjBsz8NSUVNZVm4w5cpBez+E=;
	b=XxX5y9oAN8dwmSGFqTIaVZaeMSAIZcko7uNuRSIBFbTKPJilviDBvGnK5YADU6ncTf
	OcjxZA2ZpN/L0U5UHSU+ucqZYlMG+bbliwMB4ZE80NCEs0cvLZ2QAXb0WUPVmqKp/6bM
	/spAVyl3sTQOeHc+sJ0nTnxB2jAmFP+b5mkamfo3y3OSGbyu/EFKTaP06IKcsGJHeM/z
	ANaYiTHY00/0bprb2W/Xt5WlU6d1ToWO3jT+hfPt8YdAujO7e2q8uRyxyftIdgkoA5py
	dTn/PBtvihAce+Vip7uZbH1w/un/F6MU5PLXTWmFlFtaQzka4gJw9NgZ3DxkoopmYKgS
	+JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hypZR7auqXwO/8QN88DFjBsz8NSUVNZVm4w5cpBez+E=;
	b=gQqEjppATRbDBEJIfcVeSCOb962yL7esINwlp0wRb29Lv8twlXdZxRRfo/0CusZGlt
	abPxi5Yx26UwJMSkho4CH93ksaoCrwnSTtzq+fpHlLBlpjUvrFFLrcrz5VlfjqOSiw99
	uciWQHaPXLXPnrY0+HU16Fer0bnu3XvzE8ckvNZeDGvoZef95sP/ovOhXNIh37qgwN2P
	7zx28sqizg4zFsK3LWCqRmLKXCYU+grlfharPhGIYMCFdXbD4Dg1gck//G9Qt9aOraD1
	lyEZsRqLJJrqfc5YTcXPoumlXFVwPETRLf2LOcjt17YV2k6BfveN4aH1tsZpJ0+ljzCi
	p6ug==
X-Gm-Message-State: ALyK8tLI3sFAHGZp/KeEduYF4z45OP3bYty0xJXVnweZbURrhwWfe4NeMTaqd/IDbusqMQ==
X-Received: by 10.98.35.133 with SMTP id q5mr35016312pfj.7.1466613528908;
	Wed, 22 Jun 2016 09:38:48 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40])
	by smtp.gmail.com with ESMTPSA id 6sm913630pfx.68.2016.06.22.09.38.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 09:38:48 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jun 2016 10:38:45 -0600
Message-Id: <20160622163845.29573-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [meta-java][PATCH] openjdk-8: make GCC6 happy
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
X-List-Received-Date: Wed, 22 Jun 2016 16:38:49 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

GCC 6 sets the default C++ standard to C++14 and introduces dead store
elimination by default. OpenJDK 8 is not ready for either of these
changes, so set the C++ standard back to gnu++98 and disable dead
store elimination.

Switched to using --with-extra-cflags, cxxflags, and ldflags. The added
patch fixes building when using those flags, and are needed to get
CFLAGS into the JDK build in the native case.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 recipes-core/openjdk/openjdk-8-common.inc          |  4 ++
 recipes-core/openjdk/openjdk-8-cross.inc           | 11 ++---
 recipes-core/openjdk/openjdk-8-native.inc          | 15 +++---
 recipes-core/openjdk/openjdk-8-release-72b05.inc   |  1 +
 .../openjdk8-avoid-early-ldflags-expansion.patch   | 53 ++++++++++++++++++++++
 5 files changed, 68 insertions(+), 16 deletions(-)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/openjdk8-avoid-early-ldflags-expansion.patch

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 3206ec4..90c20d2 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -229,3 +229,7 @@ JDK_ARCH = "${@get_jdk_arch(d)}"
 export DEBUG_BINARIES = "true"
 
 ALTERNATIVE_PRIORITY = "50"
+
+CFLAGS_append = " -fno-lifetime-dse -fno-delete-null-pointer-checks"
+CXXFLAGS_append = " -fno-lifetime-dse -fno-delete-null-pointer-checks"
+CXX_append = " -std=gnu++98"
diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 3189764..11e94ce 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -39,9 +39,6 @@ SRC_URI_append = "\
     file://jvm.cfg \
 "
 
-# do not use --wth-extra-cflags, it breaks building demos for jdk
-# maybe disabling demos is more reasonable than avoiding --wth-extra-cflags
-# needs discussion
 EXTRA_OECONF_append = "\
     --with-jobs=${@get_jdk8_native_jobs(d)} \
     \
@@ -53,6 +50,10 @@ EXTRA_OECONF_append = "\
     --disable-precompiled-headers \
     --disable-zip-debug-info \
     \
+    --with-extra-cflags='${CFLAGS}' \
+    --with-extra-cxxflags='${CXXFLAGS}' \
+    --with-extra-ldflags='${LDFLAGS}' \
+    \
     ${@jdk_configure_options(d)} \
 "
 
@@ -83,10 +84,6 @@ export MFLAGS="${@jdk_make_options(d)} MAKE_VERBOSE=y QUIETLY= VERBOSE=-s LOG_LE
 BUILD_LD="${BUILD_CCLD}"
 
 EXTRA_OEMAKE_append = '\
-    OE_CFLAGS="${CFLAGS}" \
-    OE_CPPFLAGS="${CPPFLAGS}" \
-    OE_CXXFLAGS="${CXXFLAGS}" \
-    OE_LDFLAGS="${LDFLAGS}" \
     ${@jdk_make_options(d)} \
     ALT_SDT_H="${STAGING_INCDIR}" \
     ALT_CUPS_HEADERS_PATH="${STAGING_INCDIR}" \
diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index 7a37d1a..91080d2 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -15,15 +15,16 @@ PACKAGECONFIG[cups] = "--with-cups,,cups"
 PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib-native"
 PACKAGECONFIG[jce] = "--enable-unlimited-crypto,,"
 
-# do not use --wth-extra-cflags, it breaks building demos for jdk
-# maybe disabling demos is more reasonable than avoiding --wth-extra-cflags
-# needs discussion
 EXTRA_OECONF_append = "\
     --with-jobs=${@get_jdk8_native_jobs(d)} \
     \
     --with-sys-root=${STAGING_DIR_NATIVE} \
     --with-tools-dir=${STAGING_DIR_NATIVE} \
     --with-boot-jdk=${STAGING_LIBDIR_NATIVE}/jvm/icedtea7-native \
+    --with-extra-cflags='${CFLAGS}' \
+    --with-extra-cxxflags='${CXXFLAGS}' \
+    --with-extra-ldflags='${LDFLAGS}' \
+    --with-stdc++lib=dynamic \
     ${@jdk_configure_options(d)} \
 "
 # --with-boot-jdk=${WORKDIR}/fake-jdk
@@ -32,18 +33,14 @@ inherit native
 
 require openjdk-8-common.inc
 
-CFLAGS_append = "${@jdk_cpp_options(d)}"
+CFLAGS_append = " ${@jdk_cpp_options(d)}"
 CPPFLAGS_append = "${@jdk_cpp_options(d)}"
-CXXFLAGS_append = "${@jdk_cpp_options(d)}"
+CXXFLAGS_append = " ${@jdk_cpp_options(d)}"
 
 export MAKE_VERBOSE = "y"
 export MFLAGS="${@jdk_make_options(d)} MAKE_VERBOSE=y QUIETLY= VERBOSE=-s LOG_LEVEL=trace"
 
 EXTRA_OEMAKE_append = ' \
-    OE_CFLAGS="${CFLAGS}" \
-    OE_CPPFLAGS="${CPPFLAGS}" \
-    OE_CXXFLAGS="${CXXFLAGS}" \
-    OE_LDFLAGS="${LDFLAGS}" \
     ${@jdk_make_options(d)} \
     MAKE_VERBOSE=y VERBOSE=-s LOG_LEVEL=trace \
     QUIETLY= \
diff --git a/recipes-core/openjdk/openjdk-8-release-72b05.inc b/recipes-core/openjdk/openjdk-8-release-72b05.inc
index f8ba367..ce31f3d 100644
--- a/recipes-core/openjdk/openjdk-8-release-72b05.inc
+++ b/recipes-core/openjdk/openjdk-8-release-72b05.inc
@@ -4,6 +4,7 @@ PATCHES_URI="\
     file://dont-expect-fqpn-for-make.patch;striplevel=0 \
     file://openjdk8-no-genx11-in-headless.patch;apply=no \
     file://openjdk8-no-unused-deps.patch;apply=no \
+    file://openjdk8-avoid-early-ldflags-expansion.patch;apply=no \
     file://openjdk8-find-compiler-fix-env-respect.patch;apply=no \
     file://openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.patch;apply=no \
 "
diff --git a/recipes-core/openjdk/patches-openjdk-8/openjdk8-avoid-early-ldflags-expansion.patch b/recipes-core/openjdk/patches-openjdk-8/openjdk8-avoid-early-ldflags-expansion.patch
new file mode 100644
index 0000000..528560c
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/openjdk8-avoid-early-ldflags-expansion.patch
@@ -0,0 +1,53 @@
+# HG changeset patch
+# User andrew
+# Date 1452261185 0
+#      Fri Jan 08 13:53:05 2016 +0000
+# Node ID 92c6a16b6daccda4b7c7f9612e4057df006b9f22
+# Parent  b95e325137b439b33a7bb013be21475df5da3a03
+8146566: OpenJDK build can't handle commas in LDFLAGS
+Summary: Backport part of 8142907 to avoid early LDFLAGS expansion
+Reviewed-by: erikj
+
+diff --git jdk/make/CompileDemos.gmk jdk/make/CompileDemos.gmk
+--- jdk/make/CompileDemos.gmk
++++ jdk/make/CompileDemos.gmk
+@@ -224,17 +224,17 @@ define SetupJVMTIDemo
+       $$(wildcard $$(addprefix $(JDK_TOPDIR)/src/share/demo/jvmti/, $2)/README.txt) \
+       $$(wildcard $$(addprefix $(JDK_TOPDIR)/src/share/demo/jvmti/, $2)/sample.makefile.txt)
+   BUILD_DEMO_JVMTI_$1_EXTRA_INC := $$(addprefix -I, $$(BUILD_DEMO_JVMTI_$1_EXTRA_SRC))
+   BUILD_DEMO_JVMTI_$1_LANG := C
+   ifneq (, $4)
+     BUILD_DEMO_JVMTI_$1_LANG := $4
+   endif
+   ifeq (C++, $4)
+-    $1_EXTRA_CXX := $(LDFLAGS_CXX_JDK) $(LIBCXX)
++    $1_EXTRA_CXX := $$(LDFLAGS_CXX_JDK) $(LIBCXX)
+   endif
+ 
+   $1_CXXFLAGS := $(CXXFLAGS_JDKLIB) -I$(JDK_TOPDIR)/src/share/demo/jvmti/$1 \
+       $$(BUILD_DEMO_JVMTI_$1_EXTRA_INC) $3 \
+       $(CXXFLAGS_DEBUG_SYMBOLS)
+   ifeq ($1-$(OPENJDK_TARGET_CPU_ARCH), waiters-sparc)
+     $1_FILTER := -xregs=no%appl
+     $1_CXXFLAGS := $$(filter-out $$($1_FILTER), $$($1_CXXFLAGS))
+@@ -246,18 +246,18 @@ define SetupJVMTIDemo
+       -I$(JDK_TOPDIR)/src/share/demo/jvmti/$1 $$(BUILD_DEMO_JVMTI_$1_EXTRA_INC) $3
+ 
+   # Remove the -incremental:no setting to get .ilk-files like in the old build.
+   $$(eval $$(call SetupNativeCompilation,BUILD_DEMO_JVMTI_$1, \
+       SRC := $(JDK_TOPDIR)/src/share/demo/jvmti/$1 $$(BUILD_DEMO_JVMTI_$1_EXTRA_SRC), \
+       LANG := $$(BUILD_DEMO_JVMTI_$1_LANG), \
+       OPTIMIZATION := LOW, \
+       CXXFLAGS := $$($1_CXXFLAGS), \
+-      LDFLAGS := $(filter-out -incremental:no -opt:ref, $(LDFLAGS_JDKLIB)), \
+-      LDFLAGS_macosx := $(call SET_EXECUTABLE_ORIGIN), \
++      LDFLAGS := $(filter-out -incremental:no -opt:ref, $$(LDFLAGS_JDKLIB)), \
++      LDFLAGS_macosx := $$(call SET_EXECUTABLE_ORIGIN), \
+       LDFLAGS_SUFFIX := $$($1_EXTRA_CXX), \
+       LDFLAGS_SUFFIX_posix := $5, \
+       LDFLAGS_SUFFIX_windows := $6, \
+       LDFLAGS_SUFFIX_solaris := $7 -lc, \
+       LDFLAGS_SUFFIX_linux := $8, \
+       VERSIONINFO_RESOURCE := $(JDK_TOPDIR)/src/windows/resource/version.rc, \
+       RC_FLAGS := $$(RC_FLAGS) \
+           -D "JDK_FNAME=$1.dll" \
-- 
2.9.0


