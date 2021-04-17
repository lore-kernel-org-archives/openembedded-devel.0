Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.3576.1618693572074946466
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ShZ6Y04h;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id u11so12155472pjr.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ltkOB1TarYTNtKHqs3ms8dzDsuBbZ5YfyLiqAtEy++s=;
        b=ShZ6Y04hoNY9/qEPnFPnOFtLVRvQZymUISpLdcCACiSs1lY+GdbGI2OYqgN6LGqeO9
         qjMz2AUIB1LRn+Pdn8UgdhqRfDCQbHexe7bCe0tlbg9OG0Iajj/1KDvn+ZmxQpJAHvVT
         ZdJtgF8LlRWnqTjYQTRMxCrlStCqTHMXfKKt0nUVDdEaNoqmKJpySffp+s5IhzbEdd6E
         Ep0utRCrcjNA+2BuPrL5br/CPcu3dMnH3hDV6ypfhKa1sDGM8FUaZgJbrAabgu0ohb7F
         IJiOlLEesmSaHHKyWeexxsafNLTQZrR5eZQ3Bzsr9wfK9zmAgiEtqPnKJXhEQUuFmKPa
         7TOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ltkOB1TarYTNtKHqs3ms8dzDsuBbZ5YfyLiqAtEy++s=;
        b=JVevKdLINlRBMyFbdZQZ+M3BeqWOForYzb5FZc7Lhse1pL7WNkrRzrIVdfEjt48mJi
         NWO0E5PucSLKi6Z3IxZXZdbHHtiQAv1A+42r3Ai01k8GBuLmxJ9hnc1+CuUTfAlp6xLY
         cALlatlf9a0TSfgBRFzjT6Rz6sKvrYy4+f042rBMyUKkab9ExIPG2zJaojFoDenHS41Y
         6k5/9t0uI/OMUnRiQA+6ghEK6jVaxq0z+KKskd/r2fvKwaeJd6B6yhCoVZN55K7pvK+A
         u99mmXbgon6RDZwUiQogaj6X5fCSC2TsgCDE8kgTumamTrpY2Ius7tsh2tjmMOVK3Bqd
         4SOw==
X-Gm-Message-State: AOAM530eG2navYa91Ts80YIS5VaDsm4O/ykm2qvN6nd2XIn6edpb7XNe
	eHK0nj5lA13G1xvDjPeb+lmincG58dPmxw==
X-Google-Smtp-Source: ABdhPJzyDduc7UDhmbXRpCUmdPQZL6X+8nz9wMc5qdX9tJcik9VU9ogOuenj+tYTw4HLpgTWrvajbg==
X-Received: by 2002:a17:90b:4a46:: with SMTP id lb6mr16740576pjb.45.1618693571099;
        Sat, 17 Apr 2021 14:06:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:10 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 01/50] tbb: upgrade 2020.3 -> 2021.2.0
Date: Sat, 17 Apr 2021 14:05:10 -0700
Message-Id: <98a26903f770aa8698770817bdaf6175367917e1.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Naveen Saini <naveen.kumar.saini@intel.com>

Switched to cmake build tool.

Rebased some patches due to directory re-structuring.
Dropped patches, which are not required anymore.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...akeLists.txt-exclude-riscv64-riscv32.patch | 42 +++++++++++++++++++
 ...1-Disable-use-of-_tpause-instruction.patch | 34 +++++++++++++++
 ...nfo-is-glibc-specific-API-mark-it-so.patch | 27 ++++++------
 .../GLIBC-PREREQ-is-not-defined-on-musl.patch | 22 ++++++----
 .../tbb/tbb/cross-compile.patch               | 35 ----------------
 .../tbb/tbb/improve-reproducibility.patch     | 30 -------------
 meta-oe/recipes-support/tbb/tbb/tbb.pc        | 11 -----
 .../tbb/{tbb_2020.3.bb => tbb_2021.2.0.bb}    | 37 ++++++----------
 8 files changed, 116 insertions(+), 122 deletions(-)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause-instruction.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/cross-compile.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/improve-reproducibility.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/tbb.pc
 rename meta-oe/recipes-support/tbb/{tbb_2020.3.bb => tbb_2021.2.0.bb} (59%)

diff --git a/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch b/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch
new file mode 100644
index 00000000000..ff6154808c1
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch
@@ -0,0 +1,42 @@
+From cb9e9b5b1ad05dd9de07a65ee7147cdb3433746a Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Fri, 9 Apr 2021 15:41:35 +0800
+Subject: [PATCH] CMakeLists.txt: exclude riscv64 & riscv32
+
+Upstream-Status: Pending
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ src/tbb/CMakeLists.txt       | 2 +-
+ src/tbbmalloc/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/tbb/CMakeLists.txt b/src/tbb/CMakeLists.txt
+index a6edb6ad..4f261813 100644
+--- a/src/tbb/CMakeLists.txt
++++ b/src/tbb/CMakeLists.txt
+@@ -55,7 +55,7 @@ target_compile_definitions(tbb
+                            PRIVATE
+                            __TBB_BUILD)
+ 
+-if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64)" OR
++if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64|riscv64|riscv32)" OR
+          "${CMAKE_OSX_ARCHITECTURES}" MATCHES "arm64" OR
+          WINDOWS_STORE OR
+          TBB_WINDOWS_DRIVER))
+diff --git a/src/tbbmalloc/CMakeLists.txt b/src/tbbmalloc/CMakeLists.txt
+index de7ca7ea..31e854fe 100644
+--- a/src/tbbmalloc/CMakeLists.txt
++++ b/src/tbbmalloc/CMakeLists.txt
+@@ -28,7 +28,7 @@ target_compile_definitions(tbbmalloc
+                            PRIVATE
+                            __TBBMALLOC_BUILD)
+ 
+-if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64)" OR
++if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64|riscv64|riscv32)" OR
+          "${CMAKE_OSX_ARCHITECTURES}" MATCHES "arm64" OR
+          WINDOWS_STORE OR
+          TBB_WINDOWS_DRIVER))
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause-instruction.patch b/meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause-instruction.patch
new file mode 100644
index 00000000000..7a4cc3e4e3d
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause-instruction.patch
@@ -0,0 +1,34 @@
+From 26bc87fdad9f29c00a5e37d6d9aed7f6dc7ff416 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Mon, 12 Apr 2021 14:15:53 +0800
+Subject: [PATCH] Disable use of _tpause instruction
+
+It is assuming right now that WAITPKG instructions are available when using
+gcc 11 or clang 12. It's possible that we are building for a
+CPU where it's not available - in this case anything older than Alder Lake.
+
+Disable for now until the detection isn't fixed upstream.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ src/tbb/scheduler_common.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tbb/scheduler_common.h b/src/tbb/scheduler_common.h
+index ee13dbf9..49052001 100644
+--- a/src/tbb/scheduler_common.h
++++ b/src/tbb/scheduler_common.h
+@@ -219,7 +219,7 @@ inline void prolonged_pause_impl() {
+ #endif
+ 
+ inline void prolonged_pause() {
+-#if __TBB_WAITPKG_INTRINSICS_PRESENT && (_WIN32 || _WIN64 || __linux__) && (__TBB_x86_32 || __TBB_x86_64)
++#if 0
+     if (governor::wait_package_enabled()) {
+         std::uint64_t time_stamp = machine_time_stamp();
+         // _tpause function directs the processor to enter an implementation-dependent optimized state
+-- 
+2.29.0
+
diff --git a/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch b/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
index 7e66945fa2e..49325447e87 100644
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
index 6f28f6f3a47..fb10684cde4 100644
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
index 36578543f8b..00000000000
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
index 91d10cb7ab6..00000000000
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
index 4f9da114093..00000000000
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
index 8e0094b3183..d0e23114021 100644
--- a/meta-oe/recipes-support/tbb/tbb_2020.3.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -5,37 +5,26 @@ DESCRIPTION = "Parallelism library for C++ - runtime files \
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
+            file://0001-CMakeLists.txt-exclude-riscv64-riscv32.patch \
+            file://0001-Disable-use-of-_tpause-instruction.patch \
 "
 
 S = "${WORKDIR}/git"
-PE = "1"
 
-COMPILER ?= "gcc"
-COMPILER_toolchain-clang = "clang"
+inherit cmake
 
-do_compile() {
-    oe_runmake compiler=${COMPILER} arch=${HOST_ARCH}
-}
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

