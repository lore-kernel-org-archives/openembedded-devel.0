Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web10.1178.1588743215021385394
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2020 22:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=nzW1ZXy0;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=388eec6a1=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588743215; x=1620279215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KpSpfIsGhuosL+6Rho6izUXmhDK127j9//1oz0qPnZA=;
  b=nzW1ZXy0NBwk0qm+ihw7RaQ5NAGYoZOAdw65weZT+hN68XkU7ccpf311
   kVF/s2P810rG1RSr0MztgvmYCqQqRKUaAADzIU5S7XORqMsmiz17Fn3mY
   TvPIjkwvyXjDkw1R0CzsFRZt4jc6+1EtZqu92PstkWsRduM46oExiIcCJ
   ctTn3d2HwhO0Jl6PFZCvMQiub2E/JHLfrAKgQ2kGi4WZiAxYFy1r1yF/+
   aarBrLxhck8ZWYtCCkwUkHMVvlL3y6F7mA0JegJ6iMd5nQowtCK0uNUYE
   T5gHm2LcA9TldGacrKwutQue3SBgm5YdoJ/CZBi5sS1pC707jpMjVlAoU
   g==;
IronPort-SDR: Ens4zRNvNpVps6j8GJzOejbfqhQ2IvUueNipR4CUqCj5/sQVgte8q7xxT8+datUhuL0rvZI8cH
 pyJPqZW1/bADcGCNo6HIdcwvLmE40IrtAK4Rx+Di59b4vS7gp5gYASdkTO6yGyLTgBhnjEkBB5
 acKGXZ4uLB4A0Bpj+zEy9VwyElpXBAxnARpJVQjbA6V/Mi9eBJ+++psnuFXd0yHBB/oxkJSTQq
 bHaz2MM0phPP7tc/YcAdaDm2SJJ4ynmxwlS3UKcJtZti7TqTjFvo5qzMshQTRgg4OQWXE5/Kua
 Kdw=
X-IronPort-AV: E=Sophos;i="5.73,358,1583190000"; 
   d="scan'208";a="2575413"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>, Jacob Kroon
	<jacob.kroon@gmail.com>
Subject: [meta-java][PATCH 2/2] openjdk-8: remove -Werror
Date: Wed, 6 May 2020 07:33:12 +0200
Message-ID: <20200506053312.251699-2-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200506053312.251699-1-richard.leitner@skidata.com>
References: <20200506053312.251699-1-richard.leitner@skidata.com>
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add patches to remove Werror from the build process. Therefore we also
drop the "-Wno-*" exceptions.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Tested-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc      |   3 -
 .../openjdk/openjdk-8-release-common.inc      |  12 +-
 .../0013-autoconf-remove-Werror.patch         | 211 ++++++++++++++++++
 .../1013-hotspot-make-disable-Werror.patch    |  14 ++
 4 files changed, 227 insertions(+), 13 deletions(-)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0013-autoconf-remove-Werror.patch
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/1013-hotspot-make-disable-Werror.patch

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index 6c0f949..9f68d08 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -53,9 +53,6 @@ SRC_URI_append = "\
     file://0012-autoconf-NativeCompilation-remove-sysroot.patch \
 "
 
-BUILD_CFLAGS_append = " -Wno-stringop-overflow -Wno-error"
-TARGET_CFLAGS_append = " -Wno-stringop-overflow -Wno-error"
-
 EXTRA_OECONF_append = "\
     --with-jobs=${@openjdk_build_helper_get_parallel_make(d)} \
     \
diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-core/openjdk/openjdk-8-release-common.inc
index bd3092f..02210a1 100644
--- a/recipes-core/openjdk/openjdk-8-release-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-common.inc
@@ -9,6 +9,7 @@ PATCHES_URI = "\
     file://0008-autoconf-fix-shark-build-common.patch \
     file://0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch \
     file://0010-autoconf-remove-shell-variables-from-autoheader.patch \
+    file://0013-autoconf-remove-Werror.patch \
     ${HOTSPOT_UB_PATCH} \
     file://2001-jdk-comparison-between-pointer-and-integer.patch \
     file://2002-jdk-Allow-using-a-system-installed-libjpeg.patch \
@@ -30,6 +31,7 @@ HOTSPOT_UB_PATCH = "\
     file://1007-hotspot-Missing-return-statement-in-__sync_val_compa.patch \
     file://1008-hotspot-Turn-on-the-Wreturn-type-warning.patch \
     file://1009-hotspot-handle-format-error-for-GCC-7.patch \
+    file://1013-hotspot-make-disable-Werror.patch \
 "
 HOTSPOT_UB_PATCH_append_class-target = "\
     file://1010-hotspot-fix-adlc-flags.patch \
@@ -88,16 +90,6 @@ BUILD_DIR_ECJ = "openjdk.build-ecj"
 # Force arm mode for now
 ARM_INSTRUCTION_SET_armv4t = "ARM"
 
-# readdir_r was deprecated in glibc-2.24. Ignore the error for now
-# NOTE: When updating the recipe, please check if this is still needed
-BUILD_CFLAGS_append = " -Wno-error=deprecated-declarations"
-TARGET_CFLAGS_append = " -Wno-error=deprecated-declarations"
-
-# WORKAROUND: disable the "specified bound depends on the length of the source argument"
-# compiler error until we update openjdk8 to a fixed version
-BUILD_CFLAGS_append = " -Wno-error=stringop-overflow"
-TARGET_CFLAGS_append = " -Wno-error=stringop-overflow"
-
 # Enable zero mode for arm based builds, as normal hotspot fails to build
 PACKAGECONFIG_append_armv4 = " zero"
 PACKAGECONFIG_append_armv5 = " zero"
diff --git a/recipes-core/openjdk/patches-openjdk-8/0013-autoconf-remove-Werror.patch b/recipes-core/openjdk/patches-openjdk-8/0013-autoconf-remove-Werror.patch
new file mode 100644
index 0000000..4610c73
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0013-autoconf-remove-Werror.patch
@@ -0,0 +1,211 @@
+# HG changeset patch
+# User Richard Leitner <richard.leitner@skidata.com>
+# Date 1588148111 -7200
+#      Wed Apr 29 10:15:11 2020 +0200
+# Node ID e063bb17c5fb8edfbad1bfb5237b69350645ed0b
+# Parent  041cb274be1207a991e05b041f57a800e8132cff
+autoconf: remove Werror
+
+We don't want to mess around with disabling warnings on new
+compiler versions therefore we remove Werror.
+
+diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/flags.m4
+--- a/common/autoconf/flags.m4	Fri Apr 24 04:22:43 2020 +0100
++++ b/common/autoconf/flags.m4	Wed Apr 29 10:15:11 2020 +0200
+@@ -399,7 +399,7 @@
+       LEGACY_EXTRA_LDFLAGS="$LEGACY_EXTRA_LDFLAGS -Wl,-z,relro"
+     fi
+     $2CXXSTD_CXXFLAG="-std=gnu++98"
+-    FLAGS_CXX_COMPILER_CHECK_ARGUMENTS([[$]$2CXXSTD_CXXFLAG -Werror],
++    FLAGS_CXX_COMPILER_CHECK_ARGUMENTS([[$]$2CXXSTD_CXXFLAG],
+                                        [], [$2CXXSTD_CXXFLAG=""])
+     $2CXXFLAGS_JDK="${$2CXXFLAGS_JDK} ${$2CXXSTD_CXXFLAG}"
+     $2JVM_CFLAGS="${$2JVM_CFLAGS} ${$2CXXSTD_CXXFLAG}"
+@@ -489,17 +489,17 @@
+     # Notably, -ffp-contract=off needs to be added for GCC >= 4.6,
+     #          -mno-fused-madd -fno-strict-aliasing for GCC < 4.6
+     COMPILER_FP_CONTRACT_OFF_FLAG="-ffp-contract=off"
+-    FLAGS_CXX_COMPILER_CHECK_ARGUMENTS([[$]COMPILER_FP_CONTRACT_OFF_FLAG -Werror],
++    FLAGS_CXX_COMPILER_CHECK_ARGUMENTS([[$]COMPILER_FP_CONTRACT_OFF_FLAG],
+                                        [], [COMPILER_FP_CONTRACT_OFF_FLAG=""])
+     if test "x$COMPILER_FP_CONTRACT_OFF_FLAG" = x; then
+       if test "$OPENJDK_TARGET_CPU_ARCH" = "x86" ||
+          test "$OPENJDK_TARGET_CPU_ARCH" = "x86_64" ||
+          test "$OPENJDK_TARGET_CPU_ARCH" = "ppc"; then
+         M_NO_FUSED_ADD_FLAG="-mno-fused-madd"
+-        FLAGS_CXX_COMPILER_CHECK_ARGUMENTS([[$]M_NO_FUSED_ADD_FLAG -Werror],
++        FLAGS_CXX_COMPILER_CHECK_ARGUMENTS([[$]M_NO_FUSED_ADD_FLAG],
+                                            [], [M_NO_FUSED_ADD_FLAG=""])
+         NO_STRICT_ALIASING_FLAG="-fno-strict-aliasing"
+-        FLAGS_CXX_COMPILER_CHECK_ARGUMENTS([[$]NO_STRICT_ALIASING_FLAG -Werror],
++        FLAGS_CXX_COMPILER_CHECK_ARGUMENTS([[$]NO_STRICT_ALIASING_FLAG],
+                                            [], [NO_STRICT_ALIASING_FLAG=""])
+         if test "x$M_NO_FUSED_ADD_FLAG" != "x" && test "x$NO_STRICT_ALIASING_FLAG" != "x"; then
+           FDLIBM_CFLAGS="$M_NO_FUSED_ADD_FLAG $NO_STRICT_ALIASING_FLAG"
+@@ -866,11 +866,11 @@
+   # Notably, value range propagation now assumes that the this pointer of C++
+   # member functions is non-null.
+   NO_DELETE_NULL_POINTER_CHECKS_CFLAG="-fno-delete-null-pointer-checks"
+-  FLAGS_COMPILER_CHECK_ARGUMENTS([$NO_DELETE_NULL_POINTER_CHECKS_CFLAG -Werror],
++  FLAGS_COMPILER_CHECK_ARGUMENTS([$NO_DELETE_NULL_POINTER_CHECKS_CFLAG],
+                                      [], [NO_DELETE_NULL_POINTER_CHECKS_CFLAG=""])
+   AC_SUBST([NO_DELETE_NULL_POINTER_CHECKS_CFLAG])
+   NO_LIFETIME_DSE_CFLAG="-fno-lifetime-dse"
+-  FLAGS_COMPILER_CHECK_ARGUMENTS([$NO_LIFETIME_DSE_CFLAG -Werror],
++  FLAGS_COMPILER_CHECK_ARGUMENTS([$NO_LIFETIME_DSE_CFLAG],
+                                      [], [NO_LIFETIME_DSE_CFLAG=""])
+   CFLAGS_JDK="${CFLAGS_JDK} ${NO_DELETE_NULL_POINTER_CHECKS_CFLAG} ${NO_LIFETIME_DSE_CFLAG}"
+   AC_SUBST([NO_LIFETIME_DSE_CFLAG])
+diff -r 041cb274be12 -r e063bb17c5fb common/autoconf/generated-configure.sh
+--- a/common/autoconf/generated-configure.sh	Fri Apr 24 04:22:43 2020 +0100
++++ b/common/autoconf/generated-configure.sh	Wed Apr 29 10:15:11 2020 +0200
+@@ -41490,12 +41490,12 @@
+     fi
+     CXXSTD_CXXFLAG="-std=gnu++98"
+ 
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C++ compiler supports \"$CXXSTD_CXXFLAG -Werror\"" >&5
+-$as_echo_n "checking if the C++ compiler supports \"$CXXSTD_CXXFLAG -Werror\"... " >&6; }
++  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C++ compiler supports \"$CXXSTD_CXXFLAG\"" >&5
++$as_echo_n "checking if the C++ compiler supports \"$CXXSTD_CXXFLAG\"... " >&6; }
+   supports=yes
+ 
+   saved_cxxflags="$CXXFLAGS"
+-  CXXFLAGS="$CXXFLAG $CXXSTD_CXXFLAG -Werror"
++  CXXFLAGS="$CXXFLAG $CXXSTD_CXXFLAG"
+   ac_ext=cpp
+ ac_cpp='$CXXCPP $CPPFLAGS'
+ ac_compile='$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -41646,12 +41646,12 @@
+   NO_DELETE_NULL_POINTER_CHECKS_CFLAG="-fno-delete-null-pointer-checks"
+ 
+ 
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C compiler supports \"$NO_DELETE_NULL_POINTER_CHECKS_CFLAG -Werror\"" >&5
+-$as_echo_n "checking if the C compiler supports \"$NO_DELETE_NULL_POINTER_CHECKS_CFLAG -Werror\"... " >&6; }
++  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C compiler supports \"$NO_DELETE_NULL_POINTER_CHECKS_CFLAG\"" >&5
++$as_echo_n "checking if the C compiler supports \"$NO_DELETE_NULL_POINTER_CHECKS_CFLAG\"... " >&6; }
+   supports=yes
+ 
+   saved_cflags="$CFLAGS"
+-  CFLAGS="$CFLAGS $NO_DELETE_NULL_POINTER_CHECKS_CFLAG -Werror"
++  CFLAGS="$CFLAGS $NO_DELETE_NULL_POINTER_CHECKS_CFLAG"
+   ac_ext=c
+ ac_cpp='$CPP $CPPFLAGS'
+ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -41686,12 +41686,12 @@
+   fi
+ 
+ 
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C++ compiler supports \"$NO_DELETE_NULL_POINTER_CHECKS_CFLAG -Werror\"" >&5
+-$as_echo_n "checking if the C++ compiler supports \"$NO_DELETE_NULL_POINTER_CHECKS_CFLAG -Werror\"... " >&6; }
++  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C++ compiler supports \"$NO_DELETE_NULL_POINTER_CHECKS_CFLAG\"" >&5
++$as_echo_n "checking if the C++ compiler supports \"$NO_DELETE_NULL_POINTER_CHECKS_CFLAG\"... " >&6; }
+   supports=yes
+ 
+   saved_cxxflags="$CXXFLAGS"
+-  CXXFLAGS="$CXXFLAG $NO_DELETE_NULL_POINTER_CHECKS_CFLAG -Werror"
++  CXXFLAGS="$CXXFLAG $NO_DELETE_NULL_POINTER_CHECKS_CFLAG"
+   ac_ext=cpp
+ ac_cpp='$CXXCPP $CPPFLAGS'
+ ac_compile='$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -41725,8 +41725,8 @@
+   fi
+ 
+ 
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if both compilers support \"$NO_DELETE_NULL_POINTER_CHECKS_CFLAG -Werror\"" >&5
+-$as_echo_n "checking if both compilers support \"$NO_DELETE_NULL_POINTER_CHECKS_CFLAG -Werror\"... " >&6; }
++  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if both compilers support \"$NO_DELETE_NULL_POINTER_CHECKS_CFLAG\"" >&5
++$as_echo_n "checking if both compilers support \"$NO_DELETE_NULL_POINTER_CHECKS_CFLAG\"... " >&6; }
+   supports=no
+   if test "x$C_COMP_SUPPORTS" = "xyes" -a "x$CXX_COMP_SUPPORTS" = "xyes"; then supports=yes; fi
+ 
+@@ -41742,12 +41742,12 @@
+   NO_LIFETIME_DSE_CFLAG="-fno-lifetime-dse"
+ 
+ 
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C compiler supports \"$NO_LIFETIME_DSE_CFLAG -Werror\"" >&5
+-$as_echo_n "checking if the C compiler supports \"$NO_LIFETIME_DSE_CFLAG -Werror\"... " >&6; }
++  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C compiler supports \"$NO_LIFETIME_DSE_CFLAG\"" >&5
++$as_echo_n "checking if the C compiler supports \"$NO_LIFETIME_DSE_CFLAG\"... " >&6; }
+   supports=yes
+ 
+   saved_cflags="$CFLAGS"
+-  CFLAGS="$CFLAGS $NO_LIFETIME_DSE_CFLAG -Werror"
++  CFLAGS="$CFLAGS $NO_LIFETIME_DSE_CFLAG"
+   ac_ext=c
+ ac_cpp='$CPP $CPPFLAGS'
+ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -41781,12 +41781,12 @@
+   fi
+ 
+ 
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C++ compiler supports \"$NO_LIFETIME_DSE_CFLAG -Werror\"" >&5
+-$as_echo_n "checking if the C++ compiler supports \"$NO_LIFETIME_DSE_CFLAG -Werror\"... " >&6; }
++  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C++ compiler supports \"$NO_LIFETIME_DSE_CFLAG\"" >&5
++$as_echo_n "checking if the C++ compiler supports \"$NO_LIFETIME_DSE_CFLAG\"... " >&6; }
+   supports=yes
+ 
+   saved_cxxflags="$CXXFLAGS"
+-  CXXFLAGS="$CXXFLAG $NO_LIFETIME_DSE_CFLAG -Werror"
++  CXXFLAGS="$CXXFLAG $NO_LIFETIME_DSE_CFLAG"
+   ac_ext=cpp
+ ac_cpp='$CXXCPP $CPPFLAGS'
+ ac_compile='$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -41820,8 +41820,8 @@
+   fi
+ 
+ 
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if both compilers support \"$NO_LIFETIME_DSE_CFLAG -Werror\"" >&5
+-$as_echo_n "checking if both compilers support \"$NO_LIFETIME_DSE_CFLAG -Werror\"... " >&6; }
++  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if both compilers support \"$NO_LIFETIME_DSE_CFLAG\"" >&5
++$as_echo_n "checking if both compilers support \"$NO_LIFETIME_DSE_CFLAG\"... " >&6; }
+   supports=no
+   if test "x$C_COMP_SUPPORTS" = "xyes" -a "x$CXX_COMP_SUPPORTS" = "xyes"; then supports=yes; fi
+ 
+@@ -41854,12 +41854,12 @@
+     #          -mno-fused-madd -fno-strict-aliasing for GCC < 4.6
+     COMPILER_FP_CONTRACT_OFF_FLAG="-ffp-contract=off"
+ 
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C++ compiler supports \"$COMPILER_FP_CONTRACT_OFF_FLAG -Werror\"" >&5
+-$as_echo_n "checking if the C++ compiler supports \"$COMPILER_FP_CONTRACT_OFF_FLAG -Werror\"... " >&6; }
++  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C++ compiler supports \"$COMPILER_FP_CONTRACT_OFF_FLAG\"" >&5
++$as_echo_n "checking if the C++ compiler supports \"$COMPILER_FP_CONTRACT_OFF_FLAG\"... " >&6; }
+   supports=yes
+ 
+   saved_cxxflags="$CXXFLAGS"
+-  CXXFLAGS="$CXXFLAG $COMPILER_FP_CONTRACT_OFF_FLAG -Werror"
++  CXXFLAGS="$CXXFLAG $COMPILER_FP_CONTRACT_OFF_FLAG"
+   ac_ext=cpp
+ ac_cpp='$CXXCPP $CPPFLAGS'
+ ac_compile='$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -41898,12 +41898,12 @@
+          test "$OPENJDK_TARGET_CPU_ARCH" = "ppc"; then
+         M_NO_FUSED_ADD_FLAG="-mno-fused-madd"
+ 
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C++ compiler supports \"$M_NO_FUSED_ADD_FLAG -Werror\"" >&5
+-$as_echo_n "checking if the C++ compiler supports \"$M_NO_FUSED_ADD_FLAG -Werror\"... " >&6; }
++  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C++ compiler supports \"$M_NO_FUSED_ADD_FLAG\"" >&5
++$as_echo_n "checking if the C++ compiler supports \"$M_NO_FUSED_ADD_FLAG\"... " >&6; }
+   supports=yes
+ 
+   saved_cxxflags="$CXXFLAGS"
+-  CXXFLAGS="$CXXFLAG $M_NO_FUSED_ADD_FLAG -Werror"
++  CXXFLAGS="$CXXFLAG $M_NO_FUSED_ADD_FLAG"
+   ac_ext=cpp
+ ac_cpp='$CXXCPP $CPPFLAGS'
+ ac_compile='$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -41938,12 +41938,12 @@
+ 
+         NO_STRICT_ALIASING_FLAG="-fno-strict-aliasing"
+ 
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C++ compiler supports \"$NO_STRICT_ALIASING_FLAG -Werror\"" >&5
+-$as_echo_n "checking if the C++ compiler supports \"$NO_STRICT_ALIASING_FLAG -Werror\"... " >&6; }
++  { $as_echo "$as_me:${as_lineno-$LINENO}: checking if the C++ compiler supports \"$NO_STRICT_ALIASING_FLAG\"" >&5
++$as_echo_n "checking if the C++ compiler supports \"$NO_STRICT_ALIASING_FLAG\"... " >&6; }
+   supports=yes
+ 
+   saved_cxxflags="$CXXFLAGS"
+-  CXXFLAGS="$CXXFLAG $NO_STRICT_ALIASING_FLAG -Werror"
++  CXXFLAGS="$CXXFLAG $NO_STRICT_ALIASING_FLAG"
+   ac_ext=cpp
+ ac_cpp='$CXXCPP $CPPFLAGS'
+ ac_compile='$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
diff --git a/recipes-core/openjdk/patches-openjdk-8/1013-hotspot-make-disable-Werror.patch b/recipes-core/openjdk/patches-openjdk-8/1013-hotspot-make-disable-Werror.patch
new file mode 100644
index 0000000..bc844be
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/1013-hotspot-make-disable-Werror.patch
@@ -0,0 +1,14 @@
+diff -r 12177d88b89c hotspot/make/linux/makefiles/gcc.make
+--- a/hotspot/make/linux/makefiles/gcc.make	Thu Sep 26 07:17:41 2019 +0100
++++ b/hotspot/make/linux/makefiles/gcc.make	Wed Apr 29 10:56:10 2020 +0200
+@@ -200,8 +200,8 @@
+   CFLAGS += -pipe
+ endif
+ 
+-# Compiler warnings are treated as errors
+-WARNINGS_ARE_ERRORS = -Werror
++# Compiler warnings are not treated as errors
++WARNINGS_ARE_ERRORS = -Wno-error
+ 
+ ifeq ($(USE_CLANG), true)
+   # However we need to clean the code up before we can unrestrictedly enable this option with Clang
-- 
2.26.2

