Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.362.1586477996573689856
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 17:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: wO9a81hMHJvkaumKu+LIyLiOmXO94eIzU4YemTZogW7hQXhHYWzIrSoa5MauodsIlT00FD6b0a
 HihKwchtILkA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 17:19:56 -0700
IronPort-SDR: IHhTT7JGWcD6jDa41CTifenS9cM8p7SnTsLBAOW9DV9hEmPQ0RLW3FAUb3+KqhtO46o+FLAT+k
 M1sc8JHSw/UQ==
X-IronPort-AV: E=Sophos;i="5.72,364,1580803200"; 
   d="scan'208";a="452215108"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.76.35])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 17:19:54 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v3] tbb: upgrade 2017 -> 2020.2
Date: Fri, 10 Apr 2020 08:19:49 +0800
Message-Id: <20200410001949.1207161-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* Remove patches that are not needed anymore and fix the recipe to point
to new source location.

* Remove the compilation tweaks that don't seem to be required anymore.

* Include a patch to fix builds on musl.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
v3: Include a fix for musl.

 .../0002-linux-Fix-gcc-version-check.patch    | 57 -----------------
 .../GLIBC-PREREQ-is-not-defined-on-musl.patch | 42 +++++++++++++
 .../tbb/tbb/cross-compile.patch               | 62 +++++++++----------
 meta-oe/recipes-support/tbb/tbb/tbb.pc        |  4 +-
 .../tbb/{tbb.bb => tbb_2020.2.bb}             | 17 +++--
 5 files changed, 80 insertions(+), 102 deletions(-)
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
 create mode 100644 meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch
 rename meta-oe/recipes-support/tbb/{tbb.bb => tbb_2020.2.bb} (82%)

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
diff --git a/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch b/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch
new file mode 100644
index 000000000..6f28f6f3a
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch
@@ -0,0 +1,42 @@
+From 27956d4c5fb615098231cebfb8eef11057639d3c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 8 Dec 2019 18:14:38 +0100
+Subject: [PATCH] src/tbbmalloc/proxy.cpp: __GLIBC_PREREQ is not defined on
+ musl
+
+Do not call __GLIBC_PREREQ if it is not defined otherwise build will
+fail on musl
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+Upstream-Status: Submitted [https://github.com/oneapi-src/oneTBB/pull/203]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ src/tbbmalloc/proxy.cpp | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/tbbmalloc/proxy.cpp b/src/tbbmalloc/proxy.cpp
+index d96ae7a0..709ae839 100644
+--- a/src/tbbmalloc/proxy.cpp
++++ b/src/tbbmalloc/proxy.cpp
+@@ -24,7 +24,8 @@
+ // of aligned_alloc as required by new C++ standard, this makes it hard to
+ // redefine aligned_alloc here. However, running on systems with new libc
+ // version, it still needs it to be redefined, thus tricking system headers
+-#if defined(__GLIBC_PREREQ) && !__GLIBC_PREREQ(2, 16) && _GLIBCXX_HAVE_ALIGNED_ALLOC
++#if defined(__GLIBC_PREREQ)
++#if !__GLIBC_PREREQ(2, 16) && _GLIBCXX_HAVE_ALIGNED_ALLOC
+ // tell <cstdlib> that there is no aligned_alloc
+ #undef _GLIBCXX_HAVE_ALIGNED_ALLOC
+ // trick <stdlib.h> to define another symbol instead
+@@ -32,7 +33,8 @@
+ // Fix the state and undefine the trick
+ #include <cstdlib>
+ #undef aligned_alloc
+-#endif // defined(__GLIBC_PREREQ)&&!__GLIBC_PREREQ(2, 16)&&_GLIBCXX_HAVE_ALIGNED_ALLOC
++#endif // defined(__GLIBC_PREREQ)
++#endif // !__GLIBC_PREREQ(2, 16)&&_GLIBCXX_HAVE_ALIGNED_ALLOC
+ #endif // __linux__ && !__ANDROID__
+ 
+ #include "proxy.h"
diff --git a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch b/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
index d54b307ee..36578543f 100644
--- a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
+++ b/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
@@ -1,39 +1,35 @@
 Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-
+  
 Upstream-Status: unsuitable
 ---
- build/linux.gcc.inc |    5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
 
-Index: tbb2017_20170118oss/build/linux.gcc.inc
-===================================================================
---- tbb2017_20170118oss.orig/build/linux.gcc.inc
-+++ tbb2017_20170118oss/build/linux.gcc.inc
-@@ -32,8 +32,9 @@ DYLIB_KEY = -shared
- EXPORT_KEY = -Wl,--version-script,
- LIBDL = -ldl
+diff --git a/build/linux.clang.inc b/build/linux.clang.inc
+index fe9b5c98..b0dcd68b 100644
+--- a/build/linux.clang.inc
++++ b/build/linux.clang.inc
+@@ -12,8 +12,8 @@
+ # See the License for the specific language governing permissions and
+ # limitations under the License.
  
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
+-CPLUS ?= clang++
+-CONLY ?= clang
++CPLUS ?= $(CXX)
++CONLY ?= $(CC)
+ COMPILE_ONLY = -c -MMD
+ PREPROC_ONLY = -E -x c++
+ INCLUDE_KEY = -I
+diff --git a/build/linux.gcc.inc b/build/linux.gcc.inc
+index d820c15d..62c76afd 100644
+--- a/build/linux.gcc.inc
++++ b/build/linux.gcc.inc
+@@ -12,8 +12,8 @@
+ # See the License for the specific language governing permissions and
+ # limitations under the License.
  
--CPLUS = clang++
--CONLY = clang
-+CPLUS = $(CXX)
-+CONLY = $(CC)
-+CPLUS_FLAGS = $(CXXFLAGS)
- LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
- LIBS += -lpthread -lrt
- LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
+-CPLUS ?= g++
+-CONLY ?= gcc
++CPLUS ?= $(CXX)
++CONLY ?= $(CC)
+ COMPILE_ONLY = -c -MMD
+ PREPROC_ONLY = -E -x c++
+ INCLUDE_KEY = -I
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
similarity index 82%
rename from meta-oe/recipes-support/tbb/tbb.bb
rename to meta-oe/recipes-support/tbb/tbb_2020.2.bb
index 911139b0d..2f9fd7f58 100644
--- a/meta-oe/recipes-support/tbb/tbb.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2020.2.bb
@@ -3,27 +3,26 @@ DESCRIPTION = "Parallelism library for C++ - runtime files \
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
+BRANCH = "tbb_2020"
+SRCREV = "60b7d0a78f8910976678ba63a19fdaee22c0ef65"
+SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
            file://cross-compile.patch \
            file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
-           file://0002-linux-Fix-gcc-version-check.patch \
+           file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
            file://tbb.pc \
 "
 
 S = "${WORKDIR}/git"
+PE = "1"
 
 COMPILER ?= "gcc"
 COMPILER_toolchain-clang = "clang"
 
 do_compile() {
-    oe_runmake compiler=${COMPILER} arch=${HOST_ARCH} runtime=cc4
+    oe_runmake compiler=${COMPILER} arch=${HOST_ARCH}
 }
 
 do_install() {
@@ -44,5 +43,3 @@ do_install() {
 # ...
 # | make[1]: *** [concurrent_queue.o] Error 1
 ARM_INSTRUCTION_SET = "arm"
-SECURITY_CFLAGS_append = " -fPIC"
-
-- 
2.25.2

