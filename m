Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.3872.1617936169970755958
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: +E367KpvycuMPVOjKyNWJx+mLyCaxWqVSzE05sveNbRKxe9H4/GjTF22Fj8D36lEq8D5skfWfU
 k9DQ3D2h+8qQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="214093251"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; 
   d="scan'208";a="214093251"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 19:42:48 -0700
IronPort-SDR: TqjJNCONk3ubMWNI8Ubi2/bb+p1J5SOr3HW6TcJnEAu9WtyvRDUMOwki84fhgwsWJixbz0d0Qj
 zVmSxo5D8KaQ==
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; 
   d="scan'208";a="613569156"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 19:42:48 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] tbb: upgrade 2020.3 -> 2021.2.0
Date: Fri,  9 Apr 2021 10:54:43 +0800
Message-Id: <20210409025443.32047-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1

Switched to cmake build tool.

Rebased some patches due to directory re-structuring.
Dropped patches, which are not required anymore.

riscv is not yet supported. So exclude it.

---
v2:
Exclude for riscv machines
Ref: https://github.com/oneapi-src/oneTBB/blob/onetbb_2021/src/tbb/CMakeLists.txt#L58

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 ...nfo-is-glibc-specific-API-mark-it-so.patch | 27 ++++++-------
 .../GLIBC-PREREQ-is-not-defined-on-musl.patch | 22 ++++++-----
 .../tbb/tbb/cross-compile.patch               | 35 -----------------
 .../tbb/tbb/improve-reproducibility.patch     | 30 ---------------
 meta-oe/recipes-support/tbb/tbb/tbb.pc        | 11 ------
 .../tbb/{tbb_2020.3.bb => tbb_2021.2.0.bb}    | 38 +++++++------------
 6 files changed, 41 insertions(+), 122 deletions(-)
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/cross-compile.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/tbb.pc
 rename meta-oe/recipes-support/tbb/{tbb_2020.3.bb => tbb_2021.2.0.bb} (59%)

diff --git a/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch b/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
index 7e66945fa..49325447e 100644
--- a/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
+++ b/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
@@ -1,22 +1,23 @@
-From 6b2b136caa68912d77ffe26143cd3da768b9ef80 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 3 Jun 2017 08:39:37 -0700
+From 52c1586bff0ecb418ac21d6678f8963d70959f04 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Wed, 7 Apr 2021 11:14:13 +0800
 Subject: [PATCH] mallinfo() is glibc specific API mark it so
 
 Helps compiling with musl
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
- src/tbbmalloc/proxy.cpp | 2 ++
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ src/tbbmalloc_proxy/proxy.cpp | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/src/tbbmalloc/proxy.cpp b/src/tbbmalloc/proxy.cpp
-index 5ef279d..06c4872 100644
---- a/src/tbbmalloc/proxy.cpp
-+++ b/src/tbbmalloc/proxy.cpp
-@@ -185,6 +185,7 @@ int mallopt(int /*param*/, int /*value*/) __THROW
+diff --git a/src/tbbmalloc_proxy/proxy.cpp b/src/tbbmalloc_proxy/proxy.cpp
+index f9942bf1..fe0dad89 100644
+--- a/src/tbbmalloc_proxy/proxy.cpp
++++ b/src/tbbmalloc_proxy/proxy.cpp
+@@ -253,6 +253,7 @@ int mallopt(int /*param*/, int /*value*/) __THROW
      return 1;
  }
  
@@ -24,7 +25,7 @@ index 5ef279d..06c4872 100644
  struct mallinfo mallinfo() __THROW
  {
      struct mallinfo m;
-@@ -192,6 +193,7 @@ struct mallinfo mallinfo() __THROW
+@@ -260,6 +261,7 @@ struct mallinfo mallinfo() __THROW
  
      return m;
  }
@@ -33,5 +34,5 @@ index 5ef279d..06c4872 100644
  #if __ANDROID__
  // Android doesn't have malloc_usable_size, provide it to be compatible
 -- 
-2.13.0
+2.17.1
 
diff --git a/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch b/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch
index 6f28f6f3a..fb10684cd 100644
--- a/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch
+++ b/meta-oe/recipes-support/tbb/tbb/GLIBC-PREREQ-is-not-defined-on-musl.patch
@@ -1,7 +1,7 @@
-From 27956d4c5fb615098231cebfb8eef11057639d3c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 8 Dec 2019 18:14:38 +0100
-Subject: [PATCH] src/tbbmalloc/proxy.cpp: __GLIBC_PREREQ is not defined on
+From 5cac8b5fffa4ebf5f0090456c9e0cbf43827242a Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Wed, 7 Apr 2021 11:32:52 +0800
+Subject: [PATCH] src/tbbmalloc/proxy.cpp: __GLIBC_PREREQ is not defined on 
  musl
 
 Do not call __GLIBC_PREREQ if it is not defined otherwise build will
@@ -12,14 +12,15 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream-Status: Submitted [https://github.com/oneapi-src/oneTBB/pull/203]
 
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
 ---
- src/tbbmalloc/proxy.cpp | 6 ++++--
+ src/tbbmalloc_proxy/proxy.cpp | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
-diff --git a/src/tbbmalloc/proxy.cpp b/src/tbbmalloc/proxy.cpp
-index d96ae7a0..709ae839 100644
---- a/src/tbbmalloc/proxy.cpp
-+++ b/src/tbbmalloc/proxy.cpp
+diff --git a/src/tbbmalloc_proxy/proxy.cpp b/src/tbbmalloc_proxy/proxy.cpp
+index fe0dad89..93e68049 100644
+--- a/src/tbbmalloc_proxy/proxy.cpp
++++ b/src/tbbmalloc_proxy/proxy.cpp
 @@ -24,7 +24,8 @@
  // of aligned_alloc as required by new C++ standard, this makes it hard to
  // redefine aligned_alloc here. However, running on systems with new libc
@@ -40,3 +41,6 @@ index d96ae7a0..709ae839 100644
  #endif // __linux__ && !__ANDROID__
  
  #include "proxy.h"
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch b/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
deleted file mode 100644
index 36578543f..000000000
--- a/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-  
-Upstream-Status: unsuitable
----
-
-diff --git a/build/linux.clang.inc b/build/linux.clang.inc
-index fe9b5c98..b0dcd68b 100644
---- a/build/linux.clang.inc
-+++ b/build/linux.clang.inc
-@@ -12,8 +12,8 @@
- # See the License for the specific language governing permissions and
- # limitations under the License.
- 
--CPLUS ?= clang++
--CONLY ?= clang
-+CPLUS ?= $(CXX)
-+CONLY ?= $(CC)
- COMPILE_ONLY = -c -MMD
- PREPROC_ONLY = -E -x c++
- INCLUDE_KEY = -I
-diff --git a/build/linux.gcc.inc b/build/linux.gcc.inc
-index d820c15d..62c76afd 100644
---- a/build/linux.gcc.inc
-+++ b/build/linux.gcc.inc
-@@ -12,8 +12,8 @@
- # See the License for the specific language governing permissions and
- # limitations under the License.
- 
--CPLUS ?= g++
--CONLY ?= gcc
-+CPLUS ?= $(CXX)
-+CONLY ?= $(CC)
- COMPILE_ONLY = -c -MMD
- PREPROC_ONLY = -E -x c++
- INCLUDE_KEY = -I
diff --git a/meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch b/meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch
deleted file mode 100644
index 91d10cb7a..000000000
--- a/meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f56eeb18a07df139864a99e1967d450cc5c8c0bb Mon Sep 17 00:00:00 2001
-From: Lee Chee Yang <chee.yang.lee@intel.com>
-Date: Wed, 30 Sep 2020 16:18:35 +0800
-Subject: [PATCH] improve reproducibility
-
-remove the WORKDIR info from BUILD_COMMAND to improve reproducibility.
-also use SOURCE_DATE_EPOCH as DATETIME wherever possible.
-
-Upstream-Status: Inappropriate [sed WORKDIR does not applies to upstream]
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
----
- build/version_info_linux.sh | 4 +-
- 1 file changed, 2 insertion(+), 2 deletion(-)
-
-diff --git a/build/version_info_linux.sh b/build/version_info_linux.sh
-index 793cad11..ed6f4b2a 100644
---- a/build/version_info_linux.sh
-+++ b/build/version_info_linux.sh
-@@ -25,6 +25,6 @@ echo '#N": BUILD_GCC'"\t\t"`g++ --version </dev/null 2>&1 | grep 'g++'`'" ENDL \
- echo '#N": BUILD_LIBC'"\t"`getconf GNU_LIBC_VERSION | grep glibc | sed -e 's/^glibc //'`'" ENDL \'
- echo '#N": BUILD_LD'"\t\t"`ld -v 2>&1 | grep 'version'`'" ENDL \'
- echo '#N": BUILD_TARGET'"\t$arch on $runtime"'" ENDL \'
--echo '#N": BUILD_COMMAND'"\t"$*'" ENDL \'
-+echo '#N": BUILD_COMMAND'"\t"$(echo $* | sed 's#'$WORKDIR'#/workdir#g')'" ENDL \'
- echo ""
--echo "#define __TBB_DATETIME \""`date -u`"\""
-+echo "#define __TBB_DATETIME \""`$(date -u -d "@$SOURCE_DATE_EPOCH"  2>/dev/null || date -u -r "$SOURCE_DATE_EPOCH"  2>/dev/null || date -u )`"\""
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/tbb/tbb/tbb.pc b/meta-oe/recipes-support/tbb/tbb/tbb.pc
deleted file mode 100644
index 4f9da1140..000000000
--- a/meta-oe/recipes-support/tbb/tbb/tbb.pc
+++ /dev/null
@@ -1,11 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=${exec_prefix}/lib
-includedir=${prefix}/include
-
-Name: Threading Building Blocks
-Description: Intel's parallelism library for C++
-URL: https://software.intel.com/en-us/tbb
-Version: 2020.2
-Libs: -L${libdir} -ltbb
-Cflags: -I${includedir} 
diff --git a/meta-oe/recipes-support/tbb/tbb_2020.3.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
similarity index 59%
rename from meta-oe/recipes-support/tbb/tbb_2020.3.bb
rename to meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
index 8e0094b31..bf1f604f1 100644
--- a/meta-oe/recipes-support/tbb/tbb_2020.3.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -5,37 +5,27 @@ DESCRIPTION = "Parallelism library for C++ - runtime files \
     and threading mechanism for performance and scalability."
 HOMEPAGE = "https://software.intel.com/en-us/tbb"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-BRANCH = "tbb_2020"
-SRCREV = "eca91f16d7490a8abfdee652dadf457ec820cc37"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327"
+BRANCH = "onetbb_2021"
+SRCREV = "2dba2072869a189b9fdab3ffa431d3ea49059a19"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
-           file://cross-compile.patch \
-           file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
-           file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
-           file://tbb.pc \
-           file://improve-reproducibility.patch \
+            file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
+            file://GLIBC-PREREQ-is-not-defined-on-musl.patch \
 "
 
 S = "${WORKDIR}/git"
-PE = "1"
 
-COMPILER ?= "gcc"
-COMPILER_toolchain-clang = "clang"
+inherit cmake
 
-do_compile() {
-    oe_runmake compiler=${COMPILER} arch=${HOST_ARCH}
-}
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
+
+# test build fails, error: 'mallinfo mallinfo()' is deprecated
+EXTRA_OECMAKE += " \
+                    -DTBB_TEST=OFF \
+                    -DCMAKE_BUILD_TYPE=Release \
+                "
 
-do_install() {
-    install -d ${D}${includedir} ${D}${libdir}
-    rm ${S}/include/tbb/index.html -f
-    cp -R --no-dereference --preserve=mode,links -v ${S}/include/tbb ${D}${includedir}
-    for f in ${B}/build/linux_*_release/lib*.so*
-    do
-        install -Dm 0755 $f ${D}${libdir}/
-    done
-    install -Dm 0644 ${WORKDIR}/tbb.pc ${D}${libdir}/pkgconfig/tbb.pc
-}
 
 # fails with thumb enabled:
 # | arm-oe-linux-gnueabi-g++  -march=armv7-a -mthumb -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a9 -mcpu=cortex-a9 -D__ARM__ -D__LINUX_ARM_ARCH__=7 -funwind-tables -mvectorize-with-neon-quad -rdynamic --sysroot=/OE/sysroots/m14tv -c -MMD -DTBB_USE_DEBUG  -g -O0 -DUSE_PTHREAD -fPIC -D__TBB_BUILD=1 -Wall -Wno-parentheses -Wno-non-virtual-dtor -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden   -I../../src -I../../src/rml/include -I../../include ../../src/tbb/concurrent_queue.cpp
-- 
2.17.1

