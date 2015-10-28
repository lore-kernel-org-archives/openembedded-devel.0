Return-Path: <prvs=736b72a50=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF7573695
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 07:54:58 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AukOANt+MFasEApK/2dsb2JhbABEGoQKbwaqVYsFiwwDFwyCPoM6AoIBAQEBAQEBgQuENgEBBBoBLgIBKAUQGAU0SQ4GDgWINQg7uEYBjBoBAQEBAQEEAQEBAQEBAQEbglKEJYlDJSYHgi4MQ4ExBYdFhVaIYkCFHIJwhnFIg3eDGIoyiFCCcwIcgVdxAYR2gQYBAQE
X-IPAS-Result: AukOANt+MFasEApK/2dsb2JhbABEGoQKbwaqVYsFiwwDFwyCPoM6AoIBAQEBAQEBgQuENgEBBBoBLgIBKAUQGAU0SQ4GDgWINQg7uEYBjBoBAQEBAQEEAQEBAQEBAQEbglKEJYlDJSYHgi4MQ4ExBYdFhVaIYkCFHIJwhnFIg3eDGIoyiFCCcwIcgVdxAYR2gQYBAQE
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Oct 2015 08:53:49 +0100
Message-ID: <1446018829-28181-2-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1446018829-28181-1-git-send-email-richard.leitner@skidata.com>
References: <1446018829-28181-1-git-send-email-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Cc: otavio.salvador@ossystems.com.br
Subject: [meta-java][PATCH 2/2] openjdk-7: update to IcedTea 2.6.2 OpenJDK 7u91b01
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2015 07:55:00 -0000
Content-Type: text/plain

IcedTea 2.6.2 provides OpenJDK 7u91, which adds the October 2015 security
updates. For more details see:
http://blog.fuseyism.com/index.php/2015/10/23/security-icedtea-2-6-2-for-openjdk-7-released/

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 README                                             |   2 +-
 .../openjdk/openjdk-7-85b01/build-hacks.patch      |  56 -----
 .../openjdk-7-85b01/fix_hotspot_crosscompile.patch |  46 -----
 .../openjdk-7-85b01/icedtea-crosscompile-fix.patch | 229 ---------------------
 ...a-jdk-build-nio-gensor-genuc-gensc-static.patch |  29 ---
 .../icedtea-jdk-nio-use-host-cc.patch              |  11 -
 .../icedtea-jdk-rmi-crosscompile.patch             |  13 --
 .../icedtea-xawt-crosscompile-fix.patch            |  82 --------
 .../openjdk-7-85b01/icedtea-zero-hotspotfix.patch  |  36 ----
 recipes-core/openjdk/openjdk-7-85b01/jvm.cfg       |  43 ----
 .../openjdk/openjdk-7-91b01/build-hacks.patch      |  56 +++++
 .../openjdk-7-91b01/fix_hotspot_crosscompile.patch |  46 +++++
 .../openjdk-7-91b01/icedtea-crosscompile-fix.patch | 229 +++++++++++++++++++++
 ...a-jdk-build-nio-gensor-genuc-gensc-static.patch |  29 +++
 .../icedtea-jdk-nio-use-host-cc.patch              |  11 +
 .../icedtea-jdk-rmi-crosscompile.patch             |  13 ++
 .../icedtea-xawt-crosscompile-fix.patch            |  82 ++++++++
 .../openjdk-7-91b01/icedtea-zero-hotspotfix.patch  |  36 ++++
 recipes-core/openjdk/openjdk-7-91b01/jvm.cfg       |  43 ++++
 recipes-core/openjdk/openjdk-7-release-85b01.inc   |  65 ------
 recipes-core/openjdk/openjdk-7-release-91b01.inc   |  65 ++++++
 recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb      |  35 ----
 recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb      |  35 ++++
 23 files changed, 646 insertions(+), 646 deletions(-)
 delete mode 100644 recipes-core/openjdk/openjdk-7-85b01/build-hacks.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-85b01/fix_hotspot_crosscompile.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-85b01/icedtea-crosscompile-fix.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-nio-use-host-cc.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-rmi-crosscompile.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-85b01/icedtea-xawt-crosscompile-fix.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-85b01/icedtea-zero-hotspotfix.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-85b01/jvm.cfg
 create mode 100644 recipes-core/openjdk/openjdk-7-91b01/build-hacks.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-91b01/fix_hotspot_crosscompile.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-91b01/icedtea-crosscompile-fix.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-91b01/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-91b01/icedtea-jdk-nio-use-host-cc.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-91b01/icedtea-jdk-rmi-crosscompile.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-91b01/icedtea-xawt-crosscompile-fix.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-91b01/icedtea-zero-hotspotfix.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-91b01/jvm.cfg
 delete mode 100644 recipes-core/openjdk/openjdk-7-release-85b01.inc
 create mode 100644 recipes-core/openjdk/openjdk-7-release-91b01.inc
 delete mode 100644 recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb
 create mode 100644 recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb

diff --git a/README b/README
index 69821ed..acbe7cb 100644
--- a/README
+++ b/README
@@ -60,7 +60,7 @@ PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
 PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
 
 #For openjdk7:
-PREFERRED_VERSION_openjdk-7-jre = "85b01-2.6.1"
+PREFERRED_VERSION_openjdk-7-jre = "91b01-2.6.2"
 PREFERRED_VERSION_icedtea7-native = "2.1.3"
 
 #Sometimes the following is needed:
diff --git a/recipes-core/openjdk/openjdk-7-85b01/build-hacks.patch b/recipes-core/openjdk/openjdk-7-85b01/build-hacks.patch
deleted file mode 100644
index 012c4cb..0000000
--- a/recipes-core/openjdk/openjdk-7-85b01/build-hacks.patch
+++ /dev/null
@@ -1,56 +0,0 @@
---- icedtea-2.6.1/Makefile.am.orig	2015-07-24 08:52:12.442036786 +0200
-+++ icedtea-2.6.1/Makefile.am	2015-07-24 08:58:25.046029702 +0200
-@@ -605,6 +605,12 @@
- 	FT2_LIBS="$(FREETYPE2_LIBS)" \
- 	ALT_PARALLEL_COMPILE_JOBS="$(PARALLEL_JOBS)" \
- 	HOTSPOT_BUILD_JOBS="$(PARALLEL_JOBS)" \
-+	OE_CFLAGS="$(OE_CFLAGS)" \
-+	OE_CPPFLAGS="$(OE_CPPFLAGS)" \
-+	OE_CXXFLAGS="$(OE_CXXFLAGS)" \
-+	OE_LDFLAGS="$(OE_LDFLAGS)" \
-+	OE_LAUNCHER_LDFLAGS="$(OE_LAUNCHER_LDFLAGS)" \
-+	DISTRIBUTION_ID="$(DIST_ID)" \
- 	QUIETLY="" \
- 	ANT_RESPECT_JAVA_HOME="TRUE" \
- 	DISTRIBUTION_ID="$(DIST_ID)" \
-@@ -2077,8 +2083,8 @@
- 	rm -f stamps/add-tzdata-support.stamp
- 
- stamps/check-crypto.stamp: stamps/cryptocheck.stamp stamps/icedtea.stamp
--	if [ -e $(BUILD_SDK_DIR)/bin/java ] ; then \
--	  $(BUILD_SDK_DIR)/bin/java -cp $(CRYPTO_CHECK_BUILD_DIR) TestCryptoLevel ; \
-+	if [ -e $(BOOT_DIR)/bin/java ] ; then \
-+	  $(BOOT_DIR)/bin/java -cp $(CRYPTO_CHECK_BUILD_DIR) TestCryptoLevel ; \
- 	fi
- 	mkdir -p stamps
- 	touch $@
-@@ -2483,7 +2489,11 @@
- if BUILD_JAMVM
- 	cd jamvm/jamvm && \
- 	./autogen.sh --with-java-runtime-library=openjdk7 \
--	  --prefix=$(abs_top_builddir)/jamvm/install ; \
-+	  --prefix=$(abs_top_builddir)/jamvm/install \
-+	  --host=$(host_alias) \
-+	  --build=$(build_alias) \
-+	  --target=$(target_alias)  \
-+	  --with-libtool-sysroot=${ALT_FREETYPE_LIB_PATH} ; \
- 	$(MAKE) ; \
- 	$(MAKE) install
- 	mkdir -p $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/server
-@@ -2548,6 +2558,7 @@
- 	  --host=$(host_alias) \
- 	  --build=$(build_alias) \
- 	  --target=$(target_alias) \
-+	  --with-libtool-sysroot=${ALT_FREETYPE_LIB_PATH} \
- 	  --prefix=$(abs_top_builddir)/cacao/install \
- 	  --with-java-runtime-library=openjdk7 \
- 	  --with-java-runtime-library-prefix=$(abs_top_builddir)/openjdk \
-@@ -2616,7 +2627,7 @@
- # configure script arguments, quoted in single quotes
- CONFIGURE_ARGS = @CONFIGURE_ARGS@
- ADD_ZERO_CONFIGURE_ARGS = \
--	--with-jdk-home=$(BUILD_SDK_DIR) \
-+	--with-jdk-home=$(BOOT_DIR) \
- 	--disable-bootstrap --enable-zero
- if ADD_SHARK_BUILD
- ADD_ZERO_CONFIGURE_ARGS += \
diff --git a/recipes-core/openjdk/openjdk-7-85b01/fix_hotspot_crosscompile.patch b/recipes-core/openjdk/openjdk-7-85b01/fix_hotspot_crosscompile.patch
deleted file mode 100644
index 13c7de2..0000000
--- a/recipes-core/openjdk/openjdk-7-85b01/fix_hotspot_crosscompile.patch
+++ /dev/null
@@ -1,46 +0,0 @@
---- icedtea-2.6.1/acinclude.m4
-+++ icedtea-2.6.1/acinclude.m4
-@@ -906,6 +906,22 @@
-   AC_SUBST(VERSION_SUFFIX, $version_suffix)
- ])
- 
-+AC_DEFUN([AC_CHECK_WITH_CC_FOR_BUILD],
-+[
-+  AC_MSG_CHECKING(for compiler used for subsidiary programs)
-+  AC_ARG_WITH([cc-for-build],
-+              [AS_HELP_STRING(--with-cc-for-build,specify the compiler for subsidiary (helper) programs)],
-+  [
-+    CC_FOR_BUILD="${withval}"
-+  ],
-+  [
-+    CC_FOR_BUILD="\$(CC)"
-+  ])
-+  AC_MSG_RESULT(${CC_FOR_BUILD})
-+  AC_SUBST(CC_FOR_BUILD)
-+])
-+
-+
- AC_DEFUN_ONCE([IT_WITH_GCJ],
- [
-   AC_MSG_CHECKING([whether to compile ecj natively])
---- icedtea-2.6.1/configure.ac.orig	2015-07-24 09:08:33.866018127 +0200
-+++ icedtea-2.6.1/configure.ac	2015-07-24 09:08:40.458018002 +0200
-@@ -22,6 +22,8 @@
- AC_PROG_CC
- AC_PROG_CXX
- 
-+AC_CHECK_WITH_CC_FOR_BUILD
-+
- IT_FIND_TOOLS([MAKE], [gmake make])
- IT_FIND_TOOL([GZIP], [gzip])
- IT_FIND_TOOL([ANT], [ant])
---- icedtea-2.6.1/Makefile.am
-+++ icedtea-2.6.1/Makefile.am
-@@ -605,6 +605,7 @@
- 	FT2_LIBS="$(FREETYPE2_LIBS)" \
- 	ALT_PARALLEL_COMPILE_JOBS="$(PARALLEL_JOBS)" \
- 	HOTSPOT_BUILD_JOBS="$(PARALLEL_JOBS)" \
-+	CC_FOR_BUILD="$(CC_FOR_BUILD)" \
- 	OE_CFLAGS="$(OE_CFLAGS)" \
- 	OE_CPPFLAGS="$(OE_CPPFLAGS)" \
- 	OE_CXXFLAGS="$(OE_CXXFLAGS)" \
diff --git a/recipes-core/openjdk/openjdk-7-85b01/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-7-85b01/icedtea-crosscompile-fix.patch
deleted file mode 100644
index e957d1e..0000000
--- a/recipes-core/openjdk/openjdk-7-85b01/icedtea-crosscompile-fix.patch
+++ /dev/null
@@ -1,229 +0,0 @@
-diff --git openjdk/corba/make/common/shared/Platform.gmk openjdk/corba/make/common/shared/Platform.gmk
-index fb575fa..e0426ad 100644
---- openjdk/corba/make/common/shared/Platform.gmk
-+++ openjdk/corba/make/common/shared/Platform.gmk
-@@ -152,9 +152,13 @@
-   OS_NAME = linux
-   OS_VERSION := $(shell uname -r)
-   # Arch and OS name/version
--  mach := $(shell uname -m)
--  ifneq (,$(wildcard /usr/bin/dpkg-architecture))
--    mach := $(shell (dpkg-architecture -qDEB_HOST_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/arm64/aarch64/;s/powerpc$$/ppc/;s/hppa/parisc/;s/ppc64el/ppc64le/')
-+  ifdef CROSS_COMPILE_ARCH
-+    mach := $(CROSS_COMPILE_ARCH)
-+  else
-+    mach := $(shell uname -m)
-+    ifneq (,$(wildcard /usr/bin/dpkg-architecture))
-+      mach := $(shell (dpkg-architecture -qDEB_HOST_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/arm64/aarch64/;s/powerpc$$/ppc/;s/hppa/parisc/;s/ppc64el/ppc64le/')
-+    endif
-   endif
-   archExpr = case "$(mach)" in \
-                 i[3-9]86) \
-diff --git openjdk/hotspot/make/linux/makefiles/build_vm_def.sh openjdk/hotspot/make/linux/makefiles/build_vm_def.sh
-index ea81ff6..68b0d71 100644
---- openjdk/hotspot/make/linux/makefiles/build_vm_def.sh
-+++ openjdk/hotspot/make/linux/makefiles/build_vm_def.sh
-@@ -1,10 +1,12 @@
- #!/bin/sh
- 
- # If we're cross compiling use that path for nm
--if [ "$CROSS_COMPILE_ARCH" != "" ]; then 
--NM=$ALT_COMPILER_PATH/nm
--else
--NM=nm
-+if [ "$NM" == "" ]; then
-+  if [ "$CROSS_COMPILE_ARCH" != "" ]; then 
-+    NM=$ALT_COMPILER_PATH/nm
-+  else
-+    NM=nm
-+  fi
- fi
- 
- $NM --defined-only $* \
-diff --git openjdk/hotspot/make/linux/makefiles/gcc.make openjdk/hotspot/make/linux/makefiles/gcc.make
-index 6fe5191..765fc6d 100644
---- openjdk/hotspot/make/linux/makefiles/gcc.make
-+++ openjdk/hotspot/make/linux/makefiles/gcc.make
-@@ -164,7 +164,7 @@ CFLAGS_WARN/DEFAULT = $(WARNINGS_ARE_ERRORS) $(ACCEPTABLE_WARNINGS)
- CFLAGS_WARN/BYFILE = $(CFLAGS_WARN/$@)$(CFLAGS_WARN/DEFAULT$(CFLAGS_WARN/$@)) 
- 
- # The flags to use for an Optimized g++ build
--OPT_CFLAGS += -O3
-+OPT_CFLAGS += $(OE_CFLAGS)
- 
- # Hotspot uses very unstrict aliasing turn this optimization off
- OPT_CFLAGS += -fno-strict-aliasing
-@@ -208,15 +208,7 @@ LFLAGS += -Wl,-relax
- endif
- 
- # Enable linker optimization
--LFLAGS += -Xlinker -O1
--
--# If this is a --hash-style=gnu system, use --hash-style=both
--#   The gnu .hash section won't work on some Linux systems like SuSE 10.
--_HAS_HASH_STYLE_GNU:=$(shell $(CC) -dumpspecs | grep -- '--hash-style=gnu')
--ifneq ($(_HAS_HASH_STYLE_GNU),)
--  LDFLAGS_HASH_STYLE = -Wl,--hash-style=both
--endif
--LFLAGS += $(LDFLAGS_HASH_STYLE)
-+LFLAGS += $(OE_LDFLAGS)
- 
- # Use $(MAPFLAG:FILENAME=real_file_name) to specify a map file.
- MAPFLAG = -Xlinker --version-script=FILENAME
-diff --git openjdk/hotspot/make/linux/makefiles/launcher.make openjdk/hotspot/make/linux/makefiles/launcher.make
-index 0c102ea..f4dfbf6 100644
---- openjdk/hotspot/make/linux/makefiles/launcher.make
-+++ openjdk/hotspot/make/linux/makefiles/launcher.make
-@@ -50,8 +50,8 @@ ifeq ($(LINK_INTO),AOUT)
-   LIBS_LAUNCHER             += $(STATIC_STDCXX) $(LIBS)
- else
-   LAUNCHER.o                 = launcher.o
--  LFLAGS_LAUNCHER           += -L `pwd`
--  LIBS_LAUNCHER             += -l$(JVM) $(LIBS)
-+  LFLAGS_LAUNCHER           += -L `pwd` $(OE_LAUNCHER_LDFLAGS) $(OE_LDFLAGS)
-+  LIBS_LAUNCHER             += -l$(JVM) $(LIBS) -lstdc++
- endif
- 
- LINK_LAUNCHER = $(LINK.CC)
-diff --git openjdk/hotspot/make/linux/makefiles/vm.make openjdk/hotspot/make/linux/makefiles/vm.make
-index b0ffd9a..4e8c47c 100644
---- openjdk/hotspot/make/linux/makefiles/vm.make
-+++ openjdk/hotspot/make/linux/makefiles/vm.make
-@@ -300,6 +300,7 @@
-   LFLAGS_VM += $(LLVM_LDFLAGS)
- endif
- 
-+LFLAGS_VM += $(OE_LDFLAGS)
- LINK_VM = $(LINK_LIB.CC)
- 
- # rule for building precompiled header
-diff --git openjdk/jdk/make/common/Defs-linux.gmk openjdk/jdk/make/common/Defs-linux.gmk
-index 69e1177..dc7f8e6 100644
---- openjdk/jdk/make/common/Defs-linux.gmk
-+++ openjdk/jdk/make/common/Defs-linux.gmk
-@@ -162,28 +162,6 @@
-   endif
- endif
- 
--#
--# Default optimization
--#
--
--ifndef OPTIMIZATION_LEVEL
--  ifeq ($(PRODUCT), java)
--    OPTIMIZATION_LEVEL = HIGHER
--  else
--    OPTIMIZATION_LEVEL = LOWER
--  endif
--endif
--ifndef FASTDEBUG_OPTIMIZATION_LEVEL
--  FASTDEBUG_OPTIMIZATION_LEVEL = LOWER
--endif
--
--CC_OPT/NONE     = 
--CC_OPT/LOWER    = -O2
--CC_OPT/HIGHER   = -O3
--CC_OPT/HIGHEST  = -O3
--
--CC_OPT          = $(CC_OPT/$(OPTIMIZATION_LEVEL))
--
- # For all platforms, do not omit the frame pointer register usage. 
- #    We need this frame pointer to make it easy to walk the stacks.
- #    This should be the default on X86, but ia64 and amd64 may not have this
-@@ -191,7 +169,7 @@
- CFLAGS_REQUIRED_aarch64 += -fno-omit-frame-pointer -fsigned-char -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_alpha   += -mieee -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_amd64   += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
--CFLAGS_REQUIRED_arm     += -fsigned-char -D_LITTLE_ENDIAN
-+CFLAGS_REQUIRED_arm     += -fsigned-char -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_hppa    +=
- CFLAGS_REQUIRED_i586    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
- CFLAGS_REQUIRED_ia64    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
-@@ -359,7 +337,7 @@ LDFLAGS_COMMON  += $(LDFLAGS_DEFS_OPTION)
- #
- # -L paths for finding and -ljava
- #
--LDFLAGS_OPT     = -Xlinker -O1
-+LDFLAGS_OPT     = $(OE_LDFLAGS)
- LDFLAGS_COMMON += -L$(LIBDIR)/$(LIBARCH)
- LDFLAGS_COMMON += -Wl,-soname=$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
- 
-diff --git openjdk/jdk/make/common/shared/Platform.gmk openjdk/jdk/make/common/shared/Platform.gmk
-index c23e96e..484afca 100644
---- openjdk/jdk/make/common/shared/Platform.gmk
-+++ openjdk/jdk/make/common/shared/Platform.gmk
-@@ -169,9 +169,9 @@
-     mach := $(CROSS_COMPILE_ARCH)
-   else
-     mach := $(shell uname -m)
--  endif
--  ifneq (,$(wildcard /usr/bin/dpkg-architecture))
--    mach := $(shell (dpkg-architecture -qDEB_HOST_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/arm64/aarch64/;s/powerpc$$/ppc/;s/hppa/parisc/;s/ppc64el/ppc64le/')
-+    ifneq (,$(wildcard /usr/bin/dpkg-architecture))
-+      mach := $(shell (dpkg-architecture -qDEB_HOST_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/arm64/aarch64/;s/powerpc$$/ppc/;s/hppa/parisc/;s/ppc64el/ppc64le/')
-+    endif
-   endif
-   archExpr = case "$(mach)" in \
-                 i[3-9]86) \
-diff --git openjdk/jdk/make/sun/awt/mawt.gmk openjdk/jdk/make/sun/awt/mawt.gmk
-index b6e0d99..edc530e 100644
---- openjdk/jdk/make/sun/awt/mawt.gmk
-+++ openjdk/jdk/make/sun/awt/mawt.gmk
-@@ -151,22 +151,6 @@ else
- #endif
- 
- LIBXTST = -lXtst
--ifeq ($(PLATFORM), linux)
--   ifeq ($(ARCH_DATA_MODEL), 64)
--   # XXX what about the rest of them?
--        LIBXT = -lXt
--    else
--    # Allows for builds on Debian GNU Linux, X11 is in a different place 
--       LIBXT = $(firstword $(wildcard $(OPENWIN_LIB)/libXt.a) \
--                        $(wildcard /usr/lib/libXt.a))
--       LIBSM = $(firstword $(wildcard $(OPENWIN_LIB)/libSM.a) \
--                        $(wildcard /usr/lib/libSM.a))
--       LIBICE = $(firstword $(wildcard $(OPENWIN_LIB)/libICE.a) \
--                         $(wildcard /usr/lib/libICE.a))
--       LIBXTST = $(firstword $(wildcard $(OPENWIN_LIB)/libXtst.a) \
--                         $(wildcard /usr/lib/libXtst.a))
--   endif
--endif
- 
- # Use -lXmu for EditRes support
- LIBXMU_DBG	= -lXmu
-@@ -181,7 +165,7 @@ ifneq (,$(findstring $(PLATFORM), linux macosx))
- OTHER_CFLAGS += -DMLIB_NO_LIBSUNMATH
- # XXX what is this define below? Isn't it motif-related?
- OTHER_CFLAGS += -DXMSTRINGDEFINES=1
--OTHER_LDLIBS =  $(LIBXMU) $(LIBXTST) -lXext $(LIBXT) $(LIBSM) $(LIBICE) -lX11 -lXi
-+OTHER_LDLIBS =  $(LIBXMU) $(LIBXTST) -lXext -lXt -lSM -lICE -lXi -lX11
- endif
- 
- endif
-@@ -230,12 +214,6 @@ else
-   CPPFLAGS += -I$(PLATFORM_SRC)/native/common/deps/fontconfig2
- endif
- 
--ifndef HEADLESS
--CPPFLAGS += -I$(OPENWIN_HOME)/include 
--LDFLAGS  += -L$(OPENWIN_LIB)
--
--endif # !HEADLESS
--
- CPPFLAGS += -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
-             -I$(SHARE_SRC)/native/$(PKGDIR)/../font \
-             -I$(PLATFORM_SRC)/native/$(PKGDIR)/../font \
-@@ -248,12 +248,6 @@
- endif # !HEADLESS
- endif # PLATFORM
- 
--ifeq ($(PLATFORM), linux)
--  # Checking for the X11/extensions headers at the additional location
--  CPPFLAGS += -I$(firstword $(wildcard $(OPENWIN_HOME)/include/X11/extensions) \
--                        $(wildcard /usr/include/X11/extensions))
--endif
--
- ifeq ($(PLATFORM), macosx)
-   CPPFLAGS += -I$(OPENWIN_HOME)/include/X11/extensions \
-               -I$(OPENWIN_HOME)/include
diff --git a/recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch b/recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch
deleted file mode 100644
index 3152b38..0000000
--- a/recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch
+++ /dev/null
@@ -1,29 +0,0 @@
---- openjdk/jdk/make/java/nio/Makefile
-+++ openjdk/jdk/make/java/nio/Makefile
-@@ -966,7 +966,7 @@
- 
- $(GENSOR_EXE) : $(TEMPDIR)/$(GENSOR_SRC)
- 	$(prep-target)
--	($(CD) $(TEMPDIR); $(NIO_CC) $(CPPFLAGS) $(LDDFLAGS) \
-+	($(CD) $(TEMPDIR); $(NIO_CC) $(CPPFLAGS) -static $(LDDFLAGS) \
- 	   -o genSocketOptionRegistry$(EXE_SUFFIX) $(GENSOR_SRC))
- 
- ifdef NIO_PLATFORM_CLASSES_ROOT_DIR
-@@ -1006,7 +1006,7 @@
- 
- $(GENUC_EXE) : $(GENUC_SRC)
- 	$(prep-target)
--	$(NIO_CC) $(CPPFLAGS) -o $@ $(GENUC_SRC)
-+	$(NIO_CC) $(CPPFLAGS) -static -o $@ $(GENUC_SRC)
- 
- ifdef NIO_PLATFORM_CLASSES_ROOT_DIR
- $(SFS_GEN)/UnixConstants.java: $(NIO_PLATFORM_CLASSES_ROOT_DIR)/sun/nio/fs/UnixConstants-$(PLATFORM)-$(ARCH).java
-@@ -1032,7 +1032,7 @@
- 
- $(GENSC_EXE) : $(GENSC_SRC)
- 	$(prep-target)
--	$(NIO_CC) $(CPPFLAGS) -o $@ $(GENSC_SRC)
-+	$(NIO_CC) $(CPPFLAGS) -static -o $@ $(GENSC_SRC)
- 
- ifdef NIO_PLATFORM_CLASSES_ROOT_DIR
- $(SFS_GEN)/SolarisConstants.java: $(NIO_PLATFORM_CLASSES_ROOT_DIR)/sun/nio/fs/SolarisConstants-$(PLATFORM)-$(ARCH).java
diff --git a/recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-nio-use-host-cc.patch b/recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-nio-use-host-cc.patch
deleted file mode 100644
index 80fc808..0000000
--- a/recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-nio-use-host-cc.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- openjdk/jdk/make/java/nio/Makefile
-+++ openjdk/jdk/make/java/nio/Makefile
-@@ -961,7 +961,7 @@
- ifeq ($(PLATFORM), macosx)
-   NIO_CC=$(HOST_CC)
- else
--  NIO_CC=$(CC)
-+  NIO_CC=$(CC_FOR_BUILD)
- endif
- 
- $(GENSOR_EXE) : $(TEMPDIR)/$(GENSOR_SRC)
diff --git a/recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-rmi-crosscompile.patch b/recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-rmi-crosscompile.patch
deleted file mode 100644
index 55f1f9c..0000000
--- a/recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-rmi-crosscompile.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git openjdk/jdk/make/com/sun/jmx/Makefile openjdk/jdk/make/com/sun/jmx/Makefile
-index eaf8a6e..4938613 100644
---- openjdk/jdk/make/com/sun/jmx/Makefile
-+++ openjdk/jdk/make/com/sun/jmx/Makefile
-@@ -102,7 +102,7 @@ FILES_ties   = $(subst javax/management/remote/rmi/,javax/management/remote/rmi/
- # when available, we need to run with latest rmic version available. rmic 
- # launch tool not built at this stage but we can invoke via rmi class.
- 
--RMIC_JAVA = $(OUTPUTDIR)/bin/java
-+RMIC_JAVA = $(BOOTDIR)/bin/java
- # need to treat 64bit solaris differently
- ifeq ($(PLATFORM)-$(LIBARCH), solaris-amd64)
- RMIC_JAVA = $(OUTPUTDIR)/bin/amd64/java
diff --git a/recipes-core/openjdk/openjdk-7-85b01/icedtea-xawt-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-7-85b01/icedtea-xawt-crosscompile-fix.patch
deleted file mode 100644
index 5eb5507..0000000
--- a/recipes-core/openjdk/openjdk-7-85b01/icedtea-xawt-crosscompile-fix.patch
+++ /dev/null
@@ -1,82 +0,0 @@
---- openjdk/jdk/make/sun/xawt/Makefile
-+++ openjdk/jdk/make/sun/xawt/Makefile
-@@ -201,20 +201,6 @@
-   CPPFLAGS += -I$(PLATFORM_SRC)/native/common/deps/glib2
- endif
- 
--ifeq ($(PLATFORM), linux)
--  ifndef CROSS_COMPILE_ARCH
--    # Allows for builds on Debian GNU Linux, X11 is in a different place 
--    # This should really be handled at a higher-level so we don't have to
--    # work-around this when cross-compiling
--    CPPFLAGS += -I/usr/X11R6/include/X11/extensions \
--                -I/usr/include/X11/extensions \
--                -I$(OPENWIN_HOME)/include 
--  else
--    CPPFLAGS += -I$(OPENWIN_HOME)/include/X11/extensions \
--                -I$(OPENWIN_HOME)/include 
--  endif
--endif
--
- ifeq ($(NATIVE_SUPPORT_DEBUG), true)
-   OTHER_CFLAGS += -DNATIVE_SUPPORT_DEBUG
- endif
-@@ -299,16 +285,10 @@
- SIZERS = $(SIZER).32
- SIZERS_C = $(SIZER_32_C)
- SIZES = $(WRAPPER_GENERATOR_DIR)/sizes.32
--ifdef CROSS_COMPILE_ARCH
--CFLAGS_32 = -m32
--endif
- else # !32
- SIZERS = $(SIZER).64
- SIZERS_C = $(SIZER_64_C)
- SIZES = $(WRAPPER_GENERATOR_DIR)/sizes.64
--ifdef CROSS_COMPILE_ARCH
--CFLAGS_64 = -m64
--endif
- endif # 32
- endif # !macosx
- endif # solaris
-@@ -344,15 +324,11 @@
- WRAPPER_GENERATOR_CLASS=$(WRAPPER_GENERATOR_TEMPDIR)/WrapperGenerator.class 
- XLIBTYPES=$(PLATFORM_SRC)/classes/sun/awt/X11/generator/xlibtypes.txt
- 
--ifndef CROSS_COMPILE_ARCH
- SIZERS_CC = $(CC)
--else
--SIZERS_CC = $(HOST_CC)
--endif
- 
- $(SIZERS): $(SIZERS_C) 
- 	$(prep-target)
--	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ $(SIZER)$(suffix $@).c
-+	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -fuse-ld=bfd -o $@ $(SIZER)$(suffix $@).c
- 
- $(WRAPPER_GENERATOR_CLASS): $(WRAPPER_GENERATOR_JAVA)
- 	$(prep-target)
-@@ -365,6 +341,16 @@
- 	    $(SIZER_DIR) $(XLIBTYPES) "sizer" $(subst .,,$(suffix $(basename $@)))
- 
- $(SIZES): $(SIZERS)
-+ifdef CROSS_COMPILE_ARCH
-+	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
-+		$(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
-+		$(CP) $(PREDEFINED_SIZES_TMPL) $@; \
-+		$(CHMOD) +w $@; \
-+	else    \
-+		$(ECHO) GENERATING $@; \
-+		$(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
-+	fi
-+else 
- 	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
- 	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
- 	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
-@@ -373,6 +359,7 @@
- 	    $(ECHO) GENERATING $@; \
- 	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
- 	fi
-+endif
- 	@if [ "$(DOCOMPARE)$(suffix $@)" = "true.64" ]; then \
- 	    $(ECHO) COMPARING $@ and $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
- 	    $(DIFF) $@ $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
diff --git a/recipes-core/openjdk/openjdk-7-85b01/icedtea-zero-hotspotfix.patch b/recipes-core/openjdk/openjdk-7-85b01/icedtea-zero-hotspotfix.patch
deleted file mode 100644
index e97e4fc..0000000
--- a/recipes-core/openjdk/openjdk-7-85b01/icedtea-zero-hotspotfix.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-diff --git openjdk/hotspot/make/linux/makefiles/zeroshark.make openjdk/hotspot/make/linux/makefiles/zeroshark.make
-index c2a1484..156bdd0 100644
---- openjdk/hotspot/make/linux/makefiles/zeroshark.make
-+++ openjdk/hotspot/make/linux/makefiles/zeroshark.make
-@@ -33,26 +33,27 @@
- Obj_Files += arm32JIT.o
- 
- CFLAGS += -DHOTSPOT_ASM
-+CCFLAGS += -DHOTSPOT_ASM
- 
- cppInterpreter_arm.o:	offsets_arm.s bytecodes_arm.s
- arm32JIT.o:		offsets_arm.s
- 
- offsets_arm.s:	mkoffsets
- 	@echo Generating assembler offsets
--	./mkoffsets > $@
-+	$(QEMU) ./mkoffsets > $@
- 
- bytecodes_arm.s: bytecodes_arm.def mkbc
- 	@echo Generating ARM assembler bytecode sequences
--	$(CXX_COMPILE) -E -x c++ - < $< | ./mkbc - $@ $(COMPILE_DONE)
-+	$(CXX_COMPILE) -E -x c++ - < $< | $(QEMU) ./mkbc - $@ $(COMPILE_DONE)
- 
- mkbc:	$(GAMMADIR)/tools/mkbc.c
- 	@echo Compiling mkbc tool
--	$(CC_COMPILE) -o $@ $< $(COMPILE_DONE)
-+	$(CC_COMPILE) -static -fuse-ld=bfd -o $@ $< $(COMPILE_DONE)
- 
- mkoffsets:	asm_helper.cpp
- 	@echo Compiling offset generator
- 	$(QUIETLY) $(REMOVE_TARGET)
--	$(CXX_COMPILE) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
-+	$(CXX_COMPILE) -static -fuse-ld=bfd -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
- 
- endif
- endif
diff --git a/recipes-core/openjdk/openjdk-7-85b01/jvm.cfg b/recipes-core/openjdk/openjdk-7-85b01/jvm.cfg
deleted file mode 100644
index ea97cda..0000000
--- a/recipes-core/openjdk/openjdk-7-85b01/jvm.cfg
+++ /dev/null
@@ -1,43 +0,0 @@
-# Copyright 2003 Sun Microsystems, Inc.  All Rights Reserved.
-# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
-#
-# This code is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License version 2 only, as
-# published by the Free Software Foundation.  Sun designates this
-# particular file as subject to the "Classpath" exception as provided
-# by Sun in the LICENSE file that accompanied this code.
-#
-# This code is distributed in the hope that it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# version 2 for more details (a copy is included in the LICENSE file that
-# accompanied this code).
-#
-# You should have received a copy of the GNU General Public License version
-# 2 along with this work; if not, write to the Free Software Foundation,
-# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
-# CA 95054 USA or visit www.sun.com if you need additional information or
-# have any questions.
-#
-# 
-# List of JVMs that can be used as an option to java, javac, etc.
-# Order is important -- first in this list is the default JVM.
-# NOTE that this both this file and its format are UNSUPPORTED and
-# WILL GO AWAY in a future release.
-#
-# You may also select a JVM in an arbitrary location with the
-# "-XXaltjvm=<jvm_dir>" option, but that too is unsupported
-# and may not be available in a future release.
-#
--server ERROR
--client IGNORE
--hotspot ERROR
--classic WARN
--native ERROR
--green ERROR
--zero ALIASED_TO -server
--shark ERROR
--cacao ERROR
--jamvm ERROR
diff --git a/recipes-core/openjdk/openjdk-7-91b01/build-hacks.patch b/recipes-core/openjdk/openjdk-7-91b01/build-hacks.patch
new file mode 100644
index 0000000..012c4cb
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-91b01/build-hacks.patch
@@ -0,0 +1,56 @@
+--- icedtea-2.6.1/Makefile.am.orig	2015-07-24 08:52:12.442036786 +0200
++++ icedtea-2.6.1/Makefile.am	2015-07-24 08:58:25.046029702 +0200
+@@ -605,6 +605,12 @@
+ 	FT2_LIBS="$(FREETYPE2_LIBS)" \
+ 	ALT_PARALLEL_COMPILE_JOBS="$(PARALLEL_JOBS)" \
+ 	HOTSPOT_BUILD_JOBS="$(PARALLEL_JOBS)" \
++	OE_CFLAGS="$(OE_CFLAGS)" \
++	OE_CPPFLAGS="$(OE_CPPFLAGS)" \
++	OE_CXXFLAGS="$(OE_CXXFLAGS)" \
++	OE_LDFLAGS="$(OE_LDFLAGS)" \
++	OE_LAUNCHER_LDFLAGS="$(OE_LAUNCHER_LDFLAGS)" \
++	DISTRIBUTION_ID="$(DIST_ID)" \
+ 	QUIETLY="" \
+ 	ANT_RESPECT_JAVA_HOME="TRUE" \
+ 	DISTRIBUTION_ID="$(DIST_ID)" \
+@@ -2077,8 +2083,8 @@
+ 	rm -f stamps/add-tzdata-support.stamp
+ 
+ stamps/check-crypto.stamp: stamps/cryptocheck.stamp stamps/icedtea.stamp
+-	if [ -e $(BUILD_SDK_DIR)/bin/java ] ; then \
+-	  $(BUILD_SDK_DIR)/bin/java -cp $(CRYPTO_CHECK_BUILD_DIR) TestCryptoLevel ; \
++	if [ -e $(BOOT_DIR)/bin/java ] ; then \
++	  $(BOOT_DIR)/bin/java -cp $(CRYPTO_CHECK_BUILD_DIR) TestCryptoLevel ; \
+ 	fi
+ 	mkdir -p stamps
+ 	touch $@
+@@ -2483,7 +2489,11 @@
+ if BUILD_JAMVM
+ 	cd jamvm/jamvm && \
+ 	./autogen.sh --with-java-runtime-library=openjdk7 \
+-	  --prefix=$(abs_top_builddir)/jamvm/install ; \
++	  --prefix=$(abs_top_builddir)/jamvm/install \
++	  --host=$(host_alias) \
++	  --build=$(build_alias) \
++	  --target=$(target_alias)  \
++	  --with-libtool-sysroot=${ALT_FREETYPE_LIB_PATH} ; \
+ 	$(MAKE) ; \
+ 	$(MAKE) install
+ 	mkdir -p $(abs_top_builddir)/jamvm/install/hotspot/jre/lib/$(INSTALL_ARCH_DIR)/server
+@@ -2548,6 +2558,7 @@
+ 	  --host=$(host_alias) \
+ 	  --build=$(build_alias) \
+ 	  --target=$(target_alias) \
++	  --with-libtool-sysroot=${ALT_FREETYPE_LIB_PATH} \
+ 	  --prefix=$(abs_top_builddir)/cacao/install \
+ 	  --with-java-runtime-library=openjdk7 \
+ 	  --with-java-runtime-library-prefix=$(abs_top_builddir)/openjdk \
+@@ -2616,7 +2627,7 @@
+ # configure script arguments, quoted in single quotes
+ CONFIGURE_ARGS = @CONFIGURE_ARGS@
+ ADD_ZERO_CONFIGURE_ARGS = \
+-	--with-jdk-home=$(BUILD_SDK_DIR) \
++	--with-jdk-home=$(BOOT_DIR) \
+ 	--disable-bootstrap --enable-zero
+ if ADD_SHARK_BUILD
+ ADD_ZERO_CONFIGURE_ARGS += \
diff --git a/recipes-core/openjdk/openjdk-7-91b01/fix_hotspot_crosscompile.patch b/recipes-core/openjdk/openjdk-7-91b01/fix_hotspot_crosscompile.patch
new file mode 100644
index 0000000..13c7de2
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-91b01/fix_hotspot_crosscompile.patch
@@ -0,0 +1,46 @@
+--- icedtea-2.6.1/acinclude.m4
++++ icedtea-2.6.1/acinclude.m4
+@@ -906,6 +906,22 @@
+   AC_SUBST(VERSION_SUFFIX, $version_suffix)
+ ])
+ 
++AC_DEFUN([AC_CHECK_WITH_CC_FOR_BUILD],
++[
++  AC_MSG_CHECKING(for compiler used for subsidiary programs)
++  AC_ARG_WITH([cc-for-build],
++              [AS_HELP_STRING(--with-cc-for-build,specify the compiler for subsidiary (helper) programs)],
++  [
++    CC_FOR_BUILD="${withval}"
++  ],
++  [
++    CC_FOR_BUILD="\$(CC)"
++  ])
++  AC_MSG_RESULT(${CC_FOR_BUILD})
++  AC_SUBST(CC_FOR_BUILD)
++])
++
++
+ AC_DEFUN_ONCE([IT_WITH_GCJ],
+ [
+   AC_MSG_CHECKING([whether to compile ecj natively])
+--- icedtea-2.6.1/configure.ac.orig	2015-07-24 09:08:33.866018127 +0200
++++ icedtea-2.6.1/configure.ac	2015-07-24 09:08:40.458018002 +0200
+@@ -22,6 +22,8 @@
+ AC_PROG_CC
+ AC_PROG_CXX
+ 
++AC_CHECK_WITH_CC_FOR_BUILD
++
+ IT_FIND_TOOLS([MAKE], [gmake make])
+ IT_FIND_TOOL([GZIP], [gzip])
+ IT_FIND_TOOL([ANT], [ant])
+--- icedtea-2.6.1/Makefile.am
++++ icedtea-2.6.1/Makefile.am
+@@ -605,6 +605,7 @@
+ 	FT2_LIBS="$(FREETYPE2_LIBS)" \
+ 	ALT_PARALLEL_COMPILE_JOBS="$(PARALLEL_JOBS)" \
+ 	HOTSPOT_BUILD_JOBS="$(PARALLEL_JOBS)" \
++	CC_FOR_BUILD="$(CC_FOR_BUILD)" \
+ 	OE_CFLAGS="$(OE_CFLAGS)" \
+ 	OE_CPPFLAGS="$(OE_CPPFLAGS)" \
+ 	OE_CXXFLAGS="$(OE_CXXFLAGS)" \
diff --git a/recipes-core/openjdk/openjdk-7-91b01/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-7-91b01/icedtea-crosscompile-fix.patch
new file mode 100644
index 0000000..e957d1e
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-91b01/icedtea-crosscompile-fix.patch
@@ -0,0 +1,229 @@
+diff --git openjdk/corba/make/common/shared/Platform.gmk openjdk/corba/make/common/shared/Platform.gmk
+index fb575fa..e0426ad 100644
+--- openjdk/corba/make/common/shared/Platform.gmk
++++ openjdk/corba/make/common/shared/Platform.gmk
+@@ -152,9 +152,13 @@
+   OS_NAME = linux
+   OS_VERSION := $(shell uname -r)
+   # Arch and OS name/version
+-  mach := $(shell uname -m)
+-  ifneq (,$(wildcard /usr/bin/dpkg-architecture))
+-    mach := $(shell (dpkg-architecture -qDEB_HOST_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/arm64/aarch64/;s/powerpc$$/ppc/;s/hppa/parisc/;s/ppc64el/ppc64le/')
++  ifdef CROSS_COMPILE_ARCH
++    mach := $(CROSS_COMPILE_ARCH)
++  else
++    mach := $(shell uname -m)
++    ifneq (,$(wildcard /usr/bin/dpkg-architecture))
++      mach := $(shell (dpkg-architecture -qDEB_HOST_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/arm64/aarch64/;s/powerpc$$/ppc/;s/hppa/parisc/;s/ppc64el/ppc64le/')
++    endif
+   endif
+   archExpr = case "$(mach)" in \
+                 i[3-9]86) \
+diff --git openjdk/hotspot/make/linux/makefiles/build_vm_def.sh openjdk/hotspot/make/linux/makefiles/build_vm_def.sh
+index ea81ff6..68b0d71 100644
+--- openjdk/hotspot/make/linux/makefiles/build_vm_def.sh
++++ openjdk/hotspot/make/linux/makefiles/build_vm_def.sh
+@@ -1,10 +1,12 @@
+ #!/bin/sh
+ 
+ # If we're cross compiling use that path for nm
+-if [ "$CROSS_COMPILE_ARCH" != "" ]; then 
+-NM=$ALT_COMPILER_PATH/nm
+-else
+-NM=nm
++if [ "$NM" == "" ]; then
++  if [ "$CROSS_COMPILE_ARCH" != "" ]; then 
++    NM=$ALT_COMPILER_PATH/nm
++  else
++    NM=nm
++  fi
+ fi
+ 
+ $NM --defined-only $* \
+diff --git openjdk/hotspot/make/linux/makefiles/gcc.make openjdk/hotspot/make/linux/makefiles/gcc.make
+index 6fe5191..765fc6d 100644
+--- openjdk/hotspot/make/linux/makefiles/gcc.make
++++ openjdk/hotspot/make/linux/makefiles/gcc.make
+@@ -164,7 +164,7 @@ CFLAGS_WARN/DEFAULT = $(WARNINGS_ARE_ERRORS) $(ACCEPTABLE_WARNINGS)
+ CFLAGS_WARN/BYFILE = $(CFLAGS_WARN/$@)$(CFLAGS_WARN/DEFAULT$(CFLAGS_WARN/$@)) 
+ 
+ # The flags to use for an Optimized g++ build
+-OPT_CFLAGS += -O3
++OPT_CFLAGS += $(OE_CFLAGS)
+ 
+ # Hotspot uses very unstrict aliasing turn this optimization off
+ OPT_CFLAGS += -fno-strict-aliasing
+@@ -208,15 +208,7 @@ LFLAGS += -Wl,-relax
+ endif
+ 
+ # Enable linker optimization
+-LFLAGS += -Xlinker -O1
+-
+-# If this is a --hash-style=gnu system, use --hash-style=both
+-#   The gnu .hash section won't work on some Linux systems like SuSE 10.
+-_HAS_HASH_STYLE_GNU:=$(shell $(CC) -dumpspecs | grep -- '--hash-style=gnu')
+-ifneq ($(_HAS_HASH_STYLE_GNU),)
+-  LDFLAGS_HASH_STYLE = -Wl,--hash-style=both
+-endif
+-LFLAGS += $(LDFLAGS_HASH_STYLE)
++LFLAGS += $(OE_LDFLAGS)
+ 
+ # Use $(MAPFLAG:FILENAME=real_file_name) to specify a map file.
+ MAPFLAG = -Xlinker --version-script=FILENAME
+diff --git openjdk/hotspot/make/linux/makefiles/launcher.make openjdk/hotspot/make/linux/makefiles/launcher.make
+index 0c102ea..f4dfbf6 100644
+--- openjdk/hotspot/make/linux/makefiles/launcher.make
++++ openjdk/hotspot/make/linux/makefiles/launcher.make
+@@ -50,8 +50,8 @@ ifeq ($(LINK_INTO),AOUT)
+   LIBS_LAUNCHER             += $(STATIC_STDCXX) $(LIBS)
+ else
+   LAUNCHER.o                 = launcher.o
+-  LFLAGS_LAUNCHER           += -L `pwd`
+-  LIBS_LAUNCHER             += -l$(JVM) $(LIBS)
++  LFLAGS_LAUNCHER           += -L `pwd` $(OE_LAUNCHER_LDFLAGS) $(OE_LDFLAGS)
++  LIBS_LAUNCHER             += -l$(JVM) $(LIBS) -lstdc++
+ endif
+ 
+ LINK_LAUNCHER = $(LINK.CC)
+diff --git openjdk/hotspot/make/linux/makefiles/vm.make openjdk/hotspot/make/linux/makefiles/vm.make
+index b0ffd9a..4e8c47c 100644
+--- openjdk/hotspot/make/linux/makefiles/vm.make
++++ openjdk/hotspot/make/linux/makefiles/vm.make
+@@ -300,6 +300,7 @@
+   LFLAGS_VM += $(LLVM_LDFLAGS)
+ endif
+ 
++LFLAGS_VM += $(OE_LDFLAGS)
+ LINK_VM = $(LINK_LIB.CC)
+ 
+ # rule for building precompiled header
+diff --git openjdk/jdk/make/common/Defs-linux.gmk openjdk/jdk/make/common/Defs-linux.gmk
+index 69e1177..dc7f8e6 100644
+--- openjdk/jdk/make/common/Defs-linux.gmk
++++ openjdk/jdk/make/common/Defs-linux.gmk
+@@ -162,28 +162,6 @@
+   endif
+ endif
+ 
+-#
+-# Default optimization
+-#
+-
+-ifndef OPTIMIZATION_LEVEL
+-  ifeq ($(PRODUCT), java)
+-    OPTIMIZATION_LEVEL = HIGHER
+-  else
+-    OPTIMIZATION_LEVEL = LOWER
+-  endif
+-endif
+-ifndef FASTDEBUG_OPTIMIZATION_LEVEL
+-  FASTDEBUG_OPTIMIZATION_LEVEL = LOWER
+-endif
+-
+-CC_OPT/NONE     = 
+-CC_OPT/LOWER    = -O2
+-CC_OPT/HIGHER   = -O3
+-CC_OPT/HIGHEST  = -O3
+-
+-CC_OPT          = $(CC_OPT/$(OPTIMIZATION_LEVEL))
+-
+ # For all platforms, do not omit the frame pointer register usage. 
+ #    We need this frame pointer to make it easy to walk the stacks.
+ #    This should be the default on X86, but ia64 and amd64 may not have this
+@@ -191,7 +169,7 @@
+ CFLAGS_REQUIRED_aarch64 += -fno-omit-frame-pointer -fsigned-char -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_alpha   += -mieee -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_amd64   += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+-CFLAGS_REQUIRED_arm     += -fsigned-char -D_LITTLE_ENDIAN
++CFLAGS_REQUIRED_arm     += -fsigned-char -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_hppa    +=
+ CFLAGS_REQUIRED_i586    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+ CFLAGS_REQUIRED_ia64    += -fno-omit-frame-pointer -D_LITTLE_ENDIAN
+@@ -359,7 +337,7 @@ LDFLAGS_COMMON  += $(LDFLAGS_DEFS_OPTION)
+ #
+ # -L paths for finding and -ljava
+ #
+-LDFLAGS_OPT     = -Xlinker -O1
++LDFLAGS_OPT     = $(OE_LDFLAGS)
+ LDFLAGS_COMMON += -L$(LIBDIR)/$(LIBARCH)
+ LDFLAGS_COMMON += -Wl,-soname=$(LIB_PREFIX)$(LIBRARY).$(LIBRARY_SUFFIX)
+ 
+diff --git openjdk/jdk/make/common/shared/Platform.gmk openjdk/jdk/make/common/shared/Platform.gmk
+index c23e96e..484afca 100644
+--- openjdk/jdk/make/common/shared/Platform.gmk
++++ openjdk/jdk/make/common/shared/Platform.gmk
+@@ -169,9 +169,9 @@
+     mach := $(CROSS_COMPILE_ARCH)
+   else
+     mach := $(shell uname -m)
+-  endif
+-  ifneq (,$(wildcard /usr/bin/dpkg-architecture))
+-    mach := $(shell (dpkg-architecture -qDEB_HOST_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/arm64/aarch64/;s/powerpc$$/ppc/;s/hppa/parisc/;s/ppc64el/ppc64le/')
++    ifneq (,$(wildcard /usr/bin/dpkg-architecture))
++      mach := $(shell (dpkg-architecture -qDEB_HOST_ARCH_CPU 2>/dev/null || echo $(mach)) | sed 's/arm64/aarch64/;s/powerpc$$/ppc/;s/hppa/parisc/;s/ppc64el/ppc64le/')
++    endif
+   endif
+   archExpr = case "$(mach)" in \
+                 i[3-9]86) \
+diff --git openjdk/jdk/make/sun/awt/mawt.gmk openjdk/jdk/make/sun/awt/mawt.gmk
+index b6e0d99..edc530e 100644
+--- openjdk/jdk/make/sun/awt/mawt.gmk
++++ openjdk/jdk/make/sun/awt/mawt.gmk
+@@ -151,22 +151,6 @@ else
+ #endif
+ 
+ LIBXTST = -lXtst
+-ifeq ($(PLATFORM), linux)
+-   ifeq ($(ARCH_DATA_MODEL), 64)
+-   # XXX what about the rest of them?
+-        LIBXT = -lXt
+-    else
+-    # Allows for builds on Debian GNU Linux, X11 is in a different place 
+-       LIBXT = $(firstword $(wildcard $(OPENWIN_LIB)/libXt.a) \
+-                        $(wildcard /usr/lib/libXt.a))
+-       LIBSM = $(firstword $(wildcard $(OPENWIN_LIB)/libSM.a) \
+-                        $(wildcard /usr/lib/libSM.a))
+-       LIBICE = $(firstword $(wildcard $(OPENWIN_LIB)/libICE.a) \
+-                         $(wildcard /usr/lib/libICE.a))
+-       LIBXTST = $(firstword $(wildcard $(OPENWIN_LIB)/libXtst.a) \
+-                         $(wildcard /usr/lib/libXtst.a))
+-   endif
+-endif
+ 
+ # Use -lXmu for EditRes support
+ LIBXMU_DBG	= -lXmu
+@@ -181,7 +165,7 @@ ifneq (,$(findstring $(PLATFORM), linux macosx))
+ OTHER_CFLAGS += -DMLIB_NO_LIBSUNMATH
+ # XXX what is this define below? Isn't it motif-related?
+ OTHER_CFLAGS += -DXMSTRINGDEFINES=1
+-OTHER_LDLIBS =  $(LIBXMU) $(LIBXTST) -lXext $(LIBXT) $(LIBSM) $(LIBICE) -lX11 -lXi
++OTHER_LDLIBS =  $(LIBXMU) $(LIBXTST) -lXext -lXt -lSM -lICE -lXi -lX11
+ endif
+ 
+ endif
+@@ -230,12 +214,6 @@ else
+   CPPFLAGS += -I$(PLATFORM_SRC)/native/common/deps/fontconfig2
+ endif
+ 
+-ifndef HEADLESS
+-CPPFLAGS += -I$(OPENWIN_HOME)/include 
+-LDFLAGS  += -L$(OPENWIN_LIB)
+-
+-endif # !HEADLESS
+-
+ CPPFLAGS += -I$(SHARE_SRC)/native/$(PKGDIR)/debug \
+             -I$(SHARE_SRC)/native/$(PKGDIR)/../font \
+             -I$(PLATFORM_SRC)/native/$(PKGDIR)/../font \
+@@ -248,12 +248,6 @@
+ endif # !HEADLESS
+ endif # PLATFORM
+ 
+-ifeq ($(PLATFORM), linux)
+-  # Checking for the X11/extensions headers at the additional location
+-  CPPFLAGS += -I$(firstword $(wildcard $(OPENWIN_HOME)/include/X11/extensions) \
+-                        $(wildcard /usr/include/X11/extensions))
+-endif
+-
+ ifeq ($(PLATFORM), macosx)
+   CPPFLAGS += -I$(OPENWIN_HOME)/include/X11/extensions \
+               -I$(OPENWIN_HOME)/include
diff --git a/recipes-core/openjdk/openjdk-7-91b01/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch b/recipes-core/openjdk/openjdk-7-91b01/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch
new file mode 100644
index 0000000..3152b38
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-91b01/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch
@@ -0,0 +1,29 @@
+--- openjdk/jdk/make/java/nio/Makefile
++++ openjdk/jdk/make/java/nio/Makefile
+@@ -966,7 +966,7 @@
+ 
+ $(GENSOR_EXE) : $(TEMPDIR)/$(GENSOR_SRC)
+ 	$(prep-target)
+-	($(CD) $(TEMPDIR); $(NIO_CC) $(CPPFLAGS) $(LDDFLAGS) \
++	($(CD) $(TEMPDIR); $(NIO_CC) $(CPPFLAGS) -static $(LDDFLAGS) \
+ 	   -o genSocketOptionRegistry$(EXE_SUFFIX) $(GENSOR_SRC))
+ 
+ ifdef NIO_PLATFORM_CLASSES_ROOT_DIR
+@@ -1006,7 +1006,7 @@
+ 
+ $(GENUC_EXE) : $(GENUC_SRC)
+ 	$(prep-target)
+-	$(NIO_CC) $(CPPFLAGS) -o $@ $(GENUC_SRC)
++	$(NIO_CC) $(CPPFLAGS) -static -o $@ $(GENUC_SRC)
+ 
+ ifdef NIO_PLATFORM_CLASSES_ROOT_DIR
+ $(SFS_GEN)/UnixConstants.java: $(NIO_PLATFORM_CLASSES_ROOT_DIR)/sun/nio/fs/UnixConstants-$(PLATFORM)-$(ARCH).java
+@@ -1032,7 +1032,7 @@
+ 
+ $(GENSC_EXE) : $(GENSC_SRC)
+ 	$(prep-target)
+-	$(NIO_CC) $(CPPFLAGS) -o $@ $(GENSC_SRC)
++	$(NIO_CC) $(CPPFLAGS) -static -o $@ $(GENSC_SRC)
+ 
+ ifdef NIO_PLATFORM_CLASSES_ROOT_DIR
+ $(SFS_GEN)/SolarisConstants.java: $(NIO_PLATFORM_CLASSES_ROOT_DIR)/sun/nio/fs/SolarisConstants-$(PLATFORM)-$(ARCH).java
diff --git a/recipes-core/openjdk/openjdk-7-91b01/icedtea-jdk-nio-use-host-cc.patch b/recipes-core/openjdk/openjdk-7-91b01/icedtea-jdk-nio-use-host-cc.patch
new file mode 100644
index 0000000..80fc808
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-91b01/icedtea-jdk-nio-use-host-cc.patch
@@ -0,0 +1,11 @@
+--- openjdk/jdk/make/java/nio/Makefile
++++ openjdk/jdk/make/java/nio/Makefile
+@@ -961,7 +961,7 @@
+ ifeq ($(PLATFORM), macosx)
+   NIO_CC=$(HOST_CC)
+ else
+-  NIO_CC=$(CC)
++  NIO_CC=$(CC_FOR_BUILD)
+ endif
+ 
+ $(GENSOR_EXE) : $(TEMPDIR)/$(GENSOR_SRC)
diff --git a/recipes-core/openjdk/openjdk-7-91b01/icedtea-jdk-rmi-crosscompile.patch b/recipes-core/openjdk/openjdk-7-91b01/icedtea-jdk-rmi-crosscompile.patch
new file mode 100644
index 0000000..55f1f9c
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-91b01/icedtea-jdk-rmi-crosscompile.patch
@@ -0,0 +1,13 @@
+diff --git openjdk/jdk/make/com/sun/jmx/Makefile openjdk/jdk/make/com/sun/jmx/Makefile
+index eaf8a6e..4938613 100644
+--- openjdk/jdk/make/com/sun/jmx/Makefile
++++ openjdk/jdk/make/com/sun/jmx/Makefile
+@@ -102,7 +102,7 @@ FILES_ties   = $(subst javax/management/remote/rmi/,javax/management/remote/rmi/
+ # when available, we need to run with latest rmic version available. rmic 
+ # launch tool not built at this stage but we can invoke via rmi class.
+ 
+-RMIC_JAVA = $(OUTPUTDIR)/bin/java
++RMIC_JAVA = $(BOOTDIR)/bin/java
+ # need to treat 64bit solaris differently
+ ifeq ($(PLATFORM)-$(LIBARCH), solaris-amd64)
+ RMIC_JAVA = $(OUTPUTDIR)/bin/amd64/java
diff --git a/recipes-core/openjdk/openjdk-7-91b01/icedtea-xawt-crosscompile-fix.patch b/recipes-core/openjdk/openjdk-7-91b01/icedtea-xawt-crosscompile-fix.patch
new file mode 100644
index 0000000..5eb5507
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-91b01/icedtea-xawt-crosscompile-fix.patch
@@ -0,0 +1,82 @@
+--- openjdk/jdk/make/sun/xawt/Makefile
++++ openjdk/jdk/make/sun/xawt/Makefile
+@@ -201,20 +201,6 @@
+   CPPFLAGS += -I$(PLATFORM_SRC)/native/common/deps/glib2
+ endif
+ 
+-ifeq ($(PLATFORM), linux)
+-  ifndef CROSS_COMPILE_ARCH
+-    # Allows for builds on Debian GNU Linux, X11 is in a different place 
+-    # This should really be handled at a higher-level so we don't have to
+-    # work-around this when cross-compiling
+-    CPPFLAGS += -I/usr/X11R6/include/X11/extensions \
+-                -I/usr/include/X11/extensions \
+-                -I$(OPENWIN_HOME)/include 
+-  else
+-    CPPFLAGS += -I$(OPENWIN_HOME)/include/X11/extensions \
+-                -I$(OPENWIN_HOME)/include 
+-  endif
+-endif
+-
+ ifeq ($(NATIVE_SUPPORT_DEBUG), true)
+   OTHER_CFLAGS += -DNATIVE_SUPPORT_DEBUG
+ endif
+@@ -299,16 +285,10 @@
+ SIZERS = $(SIZER).32
+ SIZERS_C = $(SIZER_32_C)
+ SIZES = $(WRAPPER_GENERATOR_DIR)/sizes.32
+-ifdef CROSS_COMPILE_ARCH
+-CFLAGS_32 = -m32
+-endif
+ else # !32
+ SIZERS = $(SIZER).64
+ SIZERS_C = $(SIZER_64_C)
+ SIZES = $(WRAPPER_GENERATOR_DIR)/sizes.64
+-ifdef CROSS_COMPILE_ARCH
+-CFLAGS_64 = -m64
+-endif
+ endif # 32
+ endif # !macosx
+ endif # solaris
+@@ -344,15 +324,11 @@
+ WRAPPER_GENERATOR_CLASS=$(WRAPPER_GENERATOR_TEMPDIR)/WrapperGenerator.class 
+ XLIBTYPES=$(PLATFORM_SRC)/classes/sun/awt/X11/generator/xlibtypes.txt
+ 
+-ifndef CROSS_COMPILE_ARCH
+ SIZERS_CC = $(CC)
+-else
+-SIZERS_CC = $(HOST_CC)
+-endif
+ 
+ $(SIZERS): $(SIZERS_C) 
+ 	$(prep-target)
+-	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -o $@ $(SIZER)$(suffix $@).c
++	$(SIZERS_CC) $(CFLAGS_$(subst .,,$(suffix $@))) $(CPPFLAGS) -static -fuse-ld=bfd -o $@ $(SIZER)$(suffix $@).c
+ 
+ $(WRAPPER_GENERATOR_CLASS): $(WRAPPER_GENERATOR_JAVA)
+ 	$(prep-target)
+@@ -365,6 +341,16 @@
+ 	    $(SIZER_DIR) $(XLIBTYPES) "sizer" $(subst .,,$(suffix $(basename $@)))
+ 
+ $(SIZES): $(SIZERS)
++ifdef CROSS_COMPILE_ARCH
++	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
++		$(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
++		$(CP) $(PREDEFINED_SIZES_TMPL) $@; \
++		$(CHMOD) +w $@; \
++	else    \
++		$(ECHO) GENERATING $@; \
++		$(QEMU) $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
++	fi
++else 
+ 	@if [ "$(DOHACK)$@" = "true$(PREDEFINED_SIZES)" ]; then \
+ 	    $(ECHO) COPYING $(PREDEFINED_SIZES_TMPL) into $@; \
+ 	    $(CP) $(PREDEFINED_SIZES_TMPL) $@; \
+@@ -373,6 +359,7 @@
+ 	    $(ECHO) GENERATING $@; \
+ 	    $(WRAPPER_GENERATOR_DIR)/sizer$(suffix $@) > $@; \
+ 	fi
++endif
+ 	@if [ "$(DOCOMPARE)$(suffix $@)" = "true.64" ]; then \
+ 	    $(ECHO) COMPARING $@ and $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
+ 	    $(DIFF) $@ $(STORED_SIZES_TMPL_$(PLATFORM)_$(LIBARCH)); \
diff --git a/recipes-core/openjdk/openjdk-7-91b01/icedtea-zero-hotspotfix.patch b/recipes-core/openjdk/openjdk-7-91b01/icedtea-zero-hotspotfix.patch
new file mode 100644
index 0000000..e97e4fc
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-91b01/icedtea-zero-hotspotfix.patch
@@ -0,0 +1,36 @@
+diff --git openjdk/hotspot/make/linux/makefiles/zeroshark.make openjdk/hotspot/make/linux/makefiles/zeroshark.make
+index c2a1484..156bdd0 100644
+--- openjdk/hotspot/make/linux/makefiles/zeroshark.make
++++ openjdk/hotspot/make/linux/makefiles/zeroshark.make
+@@ -33,26 +33,27 @@
+ Obj_Files += arm32JIT.o
+ 
+ CFLAGS += -DHOTSPOT_ASM
++CCFLAGS += -DHOTSPOT_ASM
+ 
+ cppInterpreter_arm.o:	offsets_arm.s bytecodes_arm.s
+ arm32JIT.o:		offsets_arm.s
+ 
+ offsets_arm.s:	mkoffsets
+ 	@echo Generating assembler offsets
+-	./mkoffsets > $@
++	$(QEMU) ./mkoffsets > $@
+ 
+ bytecodes_arm.s: bytecodes_arm.def mkbc
+ 	@echo Generating ARM assembler bytecode sequences
+-	$(CXX_COMPILE) -E -x c++ - < $< | ./mkbc - $@ $(COMPILE_DONE)
++	$(CXX_COMPILE) -E -x c++ - < $< | $(QEMU) ./mkbc - $@ $(COMPILE_DONE)
+ 
+ mkbc:	$(GAMMADIR)/tools/mkbc.c
+ 	@echo Compiling mkbc tool
+-	$(CC_COMPILE) -o $@ $< $(COMPILE_DONE)
++	$(CC_COMPILE) -static -fuse-ld=bfd -o $@ $< $(COMPILE_DONE)
+ 
+ mkoffsets:	asm_helper.cpp
+ 	@echo Compiling offset generator
+ 	$(QUIETLY) $(REMOVE_TARGET)
+-	$(CXX_COMPILE) -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
++	$(CXX_COMPILE) -static -fuse-ld=bfd -DSTATIC_OFFSETS -o $@ $< $(COMPILE_DONE)
+ 
+ endif
+ endif
diff --git a/recipes-core/openjdk/openjdk-7-91b01/jvm.cfg b/recipes-core/openjdk/openjdk-7-91b01/jvm.cfg
new file mode 100644
index 0000000..ea97cda
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-91b01/jvm.cfg
@@ -0,0 +1,43 @@
+# Copyright 2003 Sun Microsystems, Inc.  All Rights Reserved.
+# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
+#
+# This code is free software; you can redistribute it and/or modify it
+# under the terms of the GNU General Public License version 2 only, as
+# published by the Free Software Foundation.  Sun designates this
+# particular file as subject to the "Classpath" exception as provided
+# by Sun in the LICENSE file that accompanied this code.
+#
+# This code is distributed in the hope that it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+# version 2 for more details (a copy is included in the LICENSE file that
+# accompanied this code).
+#
+# You should have received a copy of the GNU General Public License version
+# 2 along with this work; if not, write to the Free Software Foundation,
+# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
+# CA 95054 USA or visit www.sun.com if you need additional information or
+# have any questions.
+#
+# 
+# List of JVMs that can be used as an option to java, javac, etc.
+# Order is important -- first in this list is the default JVM.
+# NOTE that this both this file and its format are UNSUPPORTED and
+# WILL GO AWAY in a future release.
+#
+# You may also select a JVM in an arbitrary location with the
+# "-XXaltjvm=<jvm_dir>" option, but that too is unsupported
+# and may not be available in a future release.
+#
+-server ERROR
+-client IGNORE
+-hotspot ERROR
+-classic WARN
+-native ERROR
+-green ERROR
+-zero ALIASED_TO -server
+-shark ERROR
+-cacao ERROR
+-jamvm ERROR
diff --git a/recipes-core/openjdk/openjdk-7-release-85b01.inc b/recipes-core/openjdk/openjdk-7-release-85b01.inc
deleted file mode 100644
index cbb28c7..0000000
--- a/recipes-core/openjdk/openjdk-7-release-85b01.inc
+++ /dev/null
@@ -1,65 +0,0 @@
-require openjdk-7-common.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-FILESPATH =. "${FILE_DIRNAME}/openjdk-7-85b01:"
-
-# Name of the directory containing the compiled output
-BUILD_DIR = "openjdk.build"
-BUILD_DIR_ECJ = "openjdk.build-ecj"
-
-# Force arm mode for now
-ARM_INSTRUCTION_SET_armv4t = "ARM"
-
-ICEDTEA_URI = "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
-
-ICEDTEA_PREFIX = "icedtea7-forest-2.6"
-ICEDTEA_HG_URL = "http://icedtea.classpath.org/hg/release/${ICEDTEA_PREFIX}"
-
-OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
-OPENJDK_URI = "${ICEDTEA_HG_URL}/archive/${OPENJDK_FILE};name=openjdk;unpack=false"
-
-HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.bz2"
-#HOTSPOT_URI = "${ICEDTEA_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
-HOTSPOT_URI = "http://icedtea.classpath.org/hg/icedtea7-forest/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
-
-CORBA_FILE = "${CORBA_CHANGESET}.tar.bz2"
-CORBA_URI = "${ICEDTEA_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
-
-JAXP_FILE = "${JAXP_CHANGESET}.tar.bz2"
-JAXP_URI = "${ICEDTEA_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
-
-JAXWS_FILE = "${JAXWS_CHANGESET}.tar.bz2"
-JAXWS_URI = "${ICEDTEA_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
-
-JDK_FILE = "${JDK_CHANGESET}.tar.bz2"
-JDK_URI = "${ICEDTEA_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
-
-LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.bz2"
-LANGTOOLS_URI = "${ICEDTEA_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
-
-# Split up patches to allow overriding them separately
-OEPATCHES = "\
-	file://build-hacks.patch \
-	file://fix_hotspot_crosscompile.patch \
-	"
-
-ICEDTEAPATCHES = "\
-	file://icedtea-zero-hotspotfix.patch;apply=no \
-	file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
-	file://icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch;apply=no \
-	file://icedtea-jdk-rmi-crosscompile.patch;apply=no \
-	file://icedtea-crosscompile-fix.patch;apply=no \
-	file://icedtea-xawt-crosscompile-fix.patch;apply=no \
-	"
-
-DISTRIBUTION_PATCHES = "\
-	patches/icedtea-zero-hotspotfix.patch \
-	patches/icedtea-jdk-nio-use-host-cc.patch \
-	patches/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch \
-	patches/icedtea-jdk-rmi-crosscompile.patch \
-	patches/icedtea-crosscompile-fix.patch \
-	patches/icedtea-xawt-crosscompile-fix.patch \
-	"
-
-export DISTRIBUTION_PATCHES
diff --git a/recipes-core/openjdk/openjdk-7-release-91b01.inc b/recipes-core/openjdk/openjdk-7-release-91b01.inc
new file mode 100644
index 0000000..261f7a2
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7-release-91b01.inc
@@ -0,0 +1,65 @@
+require openjdk-7-common.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+FILESPATH =. "${FILE_DIRNAME}/openjdk-7-91b01:"
+
+# Name of the directory containing the compiled output
+BUILD_DIR = "openjdk.build"
+BUILD_DIR_ECJ = "openjdk.build-ecj"
+
+# Force arm mode for now
+ARM_INSTRUCTION_SET_armv4t = "ARM"
+
+ICEDTEA_URI = "http://icedtea.wildebeest.org/download/source/${ICEDTEA}.tar.gz;name=iced"
+
+ICEDTEA_PREFIX = "icedtea7-forest-2.6"
+ICEDTEA_HG_URL = "http://icedtea.classpath.org/hg/release/${ICEDTEA_PREFIX}"
+
+OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
+OPENJDK_URI = "${ICEDTEA_HG_URL}/archive/${OPENJDK_FILE};name=openjdk;unpack=false"
+
+HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.bz2"
+#HOTSPOT_URI = "${ICEDTEA_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
+HOTSPOT_URI = "http://icedtea.classpath.org/hg/icedtea7-forest/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
+
+CORBA_FILE = "${CORBA_CHANGESET}.tar.bz2"
+CORBA_URI = "${ICEDTEA_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
+
+JAXP_FILE = "${JAXP_CHANGESET}.tar.bz2"
+JAXP_URI = "${ICEDTEA_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
+
+JAXWS_FILE = "${JAXWS_CHANGESET}.tar.bz2"
+JAXWS_URI = "${ICEDTEA_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
+
+JDK_FILE = "${JDK_CHANGESET}.tar.bz2"
+JDK_URI = "${ICEDTEA_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
+
+LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.bz2"
+LANGTOOLS_URI = "${ICEDTEA_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
+
+# Split up patches to allow overriding them separately
+OEPATCHES = "\
+	file://build-hacks.patch \
+	file://fix_hotspot_crosscompile.patch \
+	"
+
+ICEDTEAPATCHES = "\
+	file://icedtea-zero-hotspotfix.patch;apply=no \
+	file://icedtea-jdk-nio-use-host-cc.patch;apply=no \
+	file://icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch;apply=no \
+	file://icedtea-jdk-rmi-crosscompile.patch;apply=no \
+	file://icedtea-crosscompile-fix.patch;apply=no \
+	file://icedtea-xawt-crosscompile-fix.patch;apply=no \
+	"
+
+DISTRIBUTION_PATCHES = "\
+	patches/icedtea-zero-hotspotfix.patch \
+	patches/icedtea-jdk-nio-use-host-cc.patch \
+	patches/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch \
+	patches/icedtea-jdk-rmi-crosscompile.patch \
+	patches/icedtea-crosscompile-fix.patch \
+	patches/icedtea-xawt-crosscompile-fix.patch \
+	"
+
+export DISTRIBUTION_PATCHES
diff --git a/recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb b/recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb
deleted file mode 100644
index 1ca3b08..0000000
--- a/recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-require openjdk-7-release-85b01.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[iced.md5sum] = "efac44117a94b9d3278988959e336e05"
-SRC_URI[iced.sha256sum] = "491866e57199b0bc99d716be3eabaab97d9f6a698d1a652d748baeddeedfe963"
-
-CORBA_CHANGESET = "2545636482d6"
-SRC_URI[corba.md5sum] = "7e821a5fb388d7ba0e29bcadbafea7ac"
-SRC_URI[corba.sha256sum] = "e91886a9e5e1bf5a481bf1bdc9f51a73cfadfc785e06a9d0af754c18b4c7d07a"
-
-JAXP_CHANGESET = "ffbe529eeac7"
-SRC_URI[jaxp.md5sum] = "d28f58c41fa71553cf110e0a2d1fdf05"
-SRC_URI[jaxp.sha256sum] = "2bd11bbd6a9ca5374353db5fa6c45cba1645e628af3c03e614fee1a79baec271"
-
-JAXWS_CHANGESET = "b9776fab65b8"
-SRC_URI[jaxws.md5sum] = "87aaa809c958e45ab882001cdf03a7dd"
-SRC_URI[jaxws.sha256sum] = "1892b1366b9ae90ceb41547067ca79c3e113ecc1eb8bcf447c81768d25b1a1a5"
-
-JDK_CHANGESET = "61d3e001dee6"
-SRC_URI[jdk.md5sum] = "01c56e39df95192cb2542f961b846e1c"
-SRC_URI[jdk.sha256sum] = "4bf866f2da37b7391fa89d205eaa8ad21c56953a922d8969ccfbd77b982dfba9"
-
-LANGTOOLS_CHANGESET = "9c6e1de67d7d"
-SRC_URI[langtools.md5sum] = "b47e31b700ba156e86599eef5994550c"
-SRC_URI[langtools.sha256sum] = "b5fbf91d0af014deb8a3ae3e8ee8d807f8c859351bc5bb767b3597cbe14b8acd"
-
-OPENJDK_CHANGESET = "39b2c4354d0a"
-SRC_URI[openjdk.md5sum] = "3732dfebef27c22ef39fd2280c8fd0ac"
-SRC_URI[openjdk.sha256sum] = "05725e6d4abccf657ed56064d03a2f0ef38363e2ff96011921c948341bcaebe6"
-
-# hotspot changeset taken from hotspot/tags
-HOTSPOT_CHANGESET = "3f1b4a1fe4a2"
-SRC_URI[hotspot.md5sum] = "106b2ec0a8798fbe07f3d838568bd0d8"
-SRC_URI[hotspot.sha256sum] = "39bc54bf343e1dce404b8c95285c0457a8d0a7c7aedfb55055aff9795dd36a85"
diff --git a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
new file mode 100644
index 0000000..2cc79d1
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
@@ -0,0 +1,35 @@
+require openjdk-7-release-91b01.inc
+
+PR = "${INC_PR}.1"
+
+SRC_URI[iced.md5sum] = "a16b3e800030db9d9b35f80dfd11883a"
+SRC_URI[iced.sha256sum] = "c19eafacd23c81179934acab123511c424cd07c094739fa33778bf7cc80e14d0"
+
+CORBA_CHANGESET = "a4d55c5cec23"
+SRC_URI[corba.md5sum] = "e673f3df063c54d0dda32963e4980605"
+SRC_URI[corba.sha256sum] = "0b3bfa11c912c44b83248f5bb9c630c292409c6137951cd249f8f24c344ec4ad"
+
+JAXP_CHANGESET = "f1202fb27695"
+SRC_URI[jaxp.md5sum] = "2088e60c6893b1ecf127be3c2bcd4dd8"
+SRC_URI[jaxp.sha256sum] = "53de0b094e2bcc173153f5d2fcd3886e8bd9feedec6510474e27ab38472088fc"
+
+JAXWS_CHANGESET = "14c411b1183c"
+SRC_URI[jaxws.md5sum] = "d2474c78e7e300b1b8ebb767209df587"
+SRC_URI[jaxws.sha256sum] = "2c176962cab52263d3b819a303fa0ac29216a3edcddf75b39595e073da13580f"
+
+JDK_CHANGESET = "db69ae53157a"
+SRC_URI[jdk.md5sum] = "5de142350438baf9e4afee021966681a"
+SRC_URI[jdk.sha256sum] = "782c8636475eef9f130718006c20be55974055a8505e241768816f6afd431666"
+
+LANGTOOLS_CHANGESET = "73356b81c5c7"
+SRC_URI[langtools.md5sum] = "f607b5d230c96afb33da25d9f9968b30"
+SRC_URI[langtools.sha256sum] = "eac950fb11b55ecae9a3fec6127cfe48595d02c10a8cad0525b64160463eedf2"
+
+OPENJDK_CHANGESET = "601ca7147b8c"
+SRC_URI[openjdk.md5sum] = "d5c5a54d79e0cf9456c370e578aadbd1"
+SRC_URI[openjdk.sha256sum] = "c1e6924bddff0ddec318364c60f4e0843c1186a0aa9911ce6cf2fd81164cd6a7"
+
+# hotspot changeset taken from hotspot/tags
+HOTSPOT_CHANGESET = "3f1b4a1fe4a2"
+SRC_URI[hotspot.md5sum] = "106b2ec0a8798fbe07f3d838568bd0d8"
+SRC_URI[hotspot.sha256sum] = "39bc54bf343e1dce404b8c95285c0457a8d0a7c7aedfb55055aff9795dd36a85"
-- 
2.1.4


