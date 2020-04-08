Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.5997.1586321452042739653
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 21:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: agsfE7Y5lEnQhJvUrwaUYzZZsqGTUHkCB5GPahBbsPSx7FpRSSTLdLgInrvE96b/zDyd0nWqEE
 AUGs+ZTMLIuw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 21:50:51 -0700
IronPort-SDR: 9Hr79iXdK8RL2Tj62X5aPWuLv/G2TJzzmv32c3KxPpL9+QnUS39dp41TfLceAENaoD1e9P0+e/
 RQfDZz1R9qVA==
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; 
   d="scan'208";a="398087773"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.189.170])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 21:50:50 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] tbb: upgrade 2017 -> 2020.1
Date: Wed,  8 Apr 2020 12:50:40 +0800
Message-Id: <20200408045040.569849-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove patches that are not needed anymore and fix the recipe to point
to new source location. Also remove the compilation tweaks that don't
seem to be required anymore.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0002-linux-Fix-gcc-version-check.patch    | 57 -------------------
 .../tbb/tbb/cross-compile.patch               | 39 -------------
 meta-oe/recipes-support/tbb/tbb/tbb.pc        |  4 +-
 .../tbb/{tbb.bb => tbb_2020.2.bb}             | 22 ++-----
 4 files changed, 7 insertions(+), 115 deletions(-)
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/cross-compile.patch
 rename meta-oe/recipes-support/tbb/{tbb.bb => tbb_2020.2.bb} (77%)

diff --git a/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch b/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
deleted file mode 100644
index 9824b61e9..000000000
--- a/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From aee098f1bf0511c6b5544de3170a9e8b51673b60 Mon Sep 17 00:00:00 2001
-From: Pierre Le Magourou <plemagourou@softbankrobotics.com>
-Date: Tue, 23 Jan 2018 15:25:50 +0100
-Subject: [PATCH] linux.gcc: Fix cross compilation error.
-
-When cross compiling on linux with gcc, the host gcc was used instead of
-the cross gcc to set compilation flags according to gcc version.
-
-When the cross gcc was in version 5.X and the host gcc in version 7.X,
-tbb was compiled with the -flifetime-dse=1 flag that does not exist on
-gcc 5.X.
----
- build/linux.gcc.inc | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/build/linux.gcc.inc b/build/linux.gcc.inc
-index 5c1889c..a4d6698 100644
---- a/build/linux.gcc.inc
-+++ b/build/linux.gcc.inc
-@@ -41,29 +41,29 @@ LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
- C_FLAGS = $(CPLUS_FLAGS)
- 
- # gcc 4.2 and higher support OpenMP
--ifneq (,$(shell gcc -dumpversion | egrep  "^(4\.[2-9]|[5-9])"))
-+ifneq (,$(shell $(CC) -dumpversion | egrep  "^(4\.[2-9]|[5-9])"))
-     OPENMP_FLAG = -fopenmp
- endif
- 
- # gcc 4.8 and later support RTM intrinsics, but require command line switch to enable them
--ifneq (,$(shell gcc -dumpversion | egrep  "^(4\.[8-9]|[5-9])"))
-+ifneq (,$(shell $(CC) -dumpversion | egrep  "^(4\.[8-9]|[5-9])"))
-     RTM_KEY = -mrtm
- endif
- 
- # gcc 4.0 and later have -Wextra that is used by some our customers.
--ifneq (,$(shell gcc -dumpversion | egrep  "^([4-9])"))
-+ifneq (,$(shell $(CC) -dumpversion | egrep  "^([4-9])"))
-     TEST_WARNING_KEY += -Wextra
- endif
- 
- # gcc 5.0 and later have -Wsuggest-override option
- # enable it via a pre-included header in order to limit to C++11 and above
--ifneq (,$(shell gcc -dumpversion | egrep  "^([5-9])"))
-+ifneq (,$(shell $(CC) -dumpversion | egrep  "^([5-9])"))
-     INCLUDE_TEST_HEADERS = -include $(tbb_root)/src/test/harness_preload.h
- endif
- 
- # gcc 6.0 and later have -flifetime-dse option that controls
- # elimination of stores done outside the object lifetime
--ifneq (,$(shell gcc -dumpversion | egrep  "^([6-9])"))
-+ifneq (,$(shell $(CC) -dumpversion | egrep  "^([6-9])"))
-     # keep pre-contruction stores for zero initialization
-     DSE_KEY = -flifetime-dse=1
- endif
--- 
-2.15.1
-
diff --git a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch b/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
deleted file mode 100644
index d54b307ee..000000000
--- a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-
-Upstream-Status: unsuitable
----
- build/linux.gcc.inc |    5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-Index: tbb2017_20170118oss/build/linux.gcc.inc
-===================================================================
---- tbb2017_20170118oss.orig/build/linux.gcc.inc
-+++ tbb2017_20170118oss/build/linux.gcc.inc
-@@ -32,8 +32,9 @@ DYLIB_KEY = -shared
- EXPORT_KEY = -Wl,--version-script,
- LIBDL = -ldl
- 
--CPLUS = g++
--CONLY = gcc
-+CPLUS = $(CXX)
-+CONLY = $(CC)
-+CPLUS_FLAGS = $(CXXFLAGS)
- LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
- LIBS += -lpthread -lrt
- LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
-Index: tbb2017_20170118oss/build/linux.clang.inc
-===================================================================
---- tbb2017_20170118oss.orig/build/linux.clang.inc
-+++ tbb2017_20170118oss/build/linux.clang.inc
-@@ -31,8 +31,9 @@ DYLIB_KEY = -shared
- EXPORT_KEY = -Wl,--version-script,
- LIBDL = -ldl
- 
--CPLUS = clang++
--CONLY = clang
-+CPLUS = $(CXX)
-+CONLY = $(CC)
-+CPLUS_FLAGS = $(CXXFLAGS)
- LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
- LIBS += -lpthread -lrt
- LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
diff --git a/meta-oe/recipes-support/tbb/tbb/tbb.pc b/meta-oe/recipes-support/tbb/tbb/tbb.pc
index 644b64fbf..4f9da1140 100644
--- a/meta-oe/recipes-support/tbb/tbb/tbb.pc
+++ b/meta-oe/recipes-support/tbb/tbb/tbb.pc
@@ -5,7 +5,7 @@ includedir=${prefix}/include
 
 Name: Threading Building Blocks
 Description: Intel's parallelism library for C++
-URL: http://www.threadingbuildingblocks.org/
-Version: 3.0+r018
+URL: https://software.intel.com/en-us/tbb
+Version: 2020.2
 Libs: -L${libdir} -ltbb
 Cflags: -I${includedir} 
diff --git a/meta-oe/recipes-support/tbb/tbb.bb b/meta-oe/recipes-support/tbb/tbb_2020.2.bb
similarity index 77%
rename from meta-oe/recipes-support/tbb/tbb.bb
rename to meta-oe/recipes-support/tbb/tbb_2020.2.bb
index 911139b0d..67464ab72 100644
--- a/meta-oe/recipes-support/tbb/tbb.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2020.2.bb
@@ -3,28 +3,18 @@ DESCRIPTION = "Parallelism library for C++ - runtime files \
     performance without having to be a threading expert. It represents a \
     higher-level, task-based parallelism that abstracts platform details \
     and threading mechanism for performance and scalability."
-HOMEPAGE = "http://threadingbuildingblocks.org/"
+HOMEPAGE = "https://software.intel.com/en-us/tbb"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-PRDATE = "20170412"
-BRANCH = "tbb_2017"
-SRCREV = "a2cfdfe946933cbe38bffe1d8086ae36f06691a3"
-PV = "${PRDATE}+${SRCPV}"
-SRC_URI = "git://github.com/01org/tbb;branch=${BRANCH} \
-           file://cross-compile.patch \
+BRANCH = "tbb_2020"
+SRCREV = "60b7d0a78f8910976678ba63a19fdaee22c0ef65"
+SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
            file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
-           file://0002-linux-Fix-gcc-version-check.patch \
            file://tbb.pc \
 "
 
 S = "${WORKDIR}/git"
-
-COMPILER ?= "gcc"
-COMPILER_toolchain-clang = "clang"
-
-do_compile() {
-    oe_runmake compiler=${COMPILER} arch=${HOST_ARCH} runtime=cc4
-}
+PE = "1"
 
 do_install() {
     install -d ${D}${includedir} ${D}${libdir}
@@ -44,5 +34,3 @@ do_install() {
 # ...
 # | make[1]: *** [concurrent_queue.o] Error 1
 ARM_INSTRUCTION_SET = "arm"
-SECURITY_CFLAGS_append = " -fPIC"
-
-- 
2.25.2

