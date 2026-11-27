Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10304.1795752925026312103
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:15:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=btIr6gjr;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3869f03af6aso6754456eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752924; x=1796357724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oubUU/T3TM/RlwGtiObFYPWjfZ65nPa3/d4dKUeisN4=;
        b=btIr6gjrGiK38HGyjQFdqIYrmpFYvnrfxJdW/ubO2o3NNVACrfDkv07jU3uYs0mLuH
         LVGkHmlsNKqH1wbTjfHFB9OH1u5ZyRH37wb9wDuMNqvAw+/y1FbaKY9/kMV4ySORDl1t
         Ft88XKvQ/bXh1yvIS8igIlOOgWkxj7QnwViewxwgAib1J198bqz9pTWAJSEnCWonA2wc
         E0ekQqFd3W3Y+YDmrdESY0S9U0uiPXpL4R1OrPaKyNv3xXXq//WYUdZqPfd07JxnOTbN
         Wb8ZYKNQJ2+ExVyneCY5a0u7mtw0zRE9yYSZcYlE/NGRqnPXGQpvrOWC6S7gL5372E91
         Ha6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752924; x=1796357724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oubUU/T3TM/RlwGtiObFYPWjfZ65nPa3/d4dKUeisN4=;
        b=pBRpSjYbRNHrzfqFbq4EGCJAkpEe7bJgOchAjj7Hp4SU3fBuoIThzWExlM+0PQXoHS
         bbF2Rvdi3FcinfY0/nhz4/KBvOUqeGD4lq+KxkhRgCPiWi+Ksem4nETFB4+k/BKQJjWC
         fKX6u0iE+KXXlAO/tkTDG/VGw3HPK48SlGlpF7zNiKr86zCLwgr1OLF0OS8ew1vOh5XO
         5ceB1ghrGQeRfZt6U5UZu4lHPy6jBUexjBRQozRGWpmd1VQ8d4kfjcPoNaupAoCsNzc3
         rpsQ8jGH9TrzoCwloKX7oN/9RzqcqRjq7ZeqLL+OaBMGqQ3wxmyDbbsSiEIhkoMtNRbc
         eGcg==
X-Gm-Message-State: APuU4Z/vXAYFMRUzIgMfwr9qGCTV4GoGwjAenqwOJRMYyjDLR0SwibU1
	I0ovuTU0Kyy2dEzISm3vMu60AlNUuJPF1jaxi+lzj/ShvnXE9daULnG6bRRb+UGC
X-Gm-Gg: AZFdTZfB4IFT5nzmBs4McMFMaKwa8Ugq/kCapsjFw+WX6dnrtWhhCx1Yy5jqaEwGOCn
	Tk83s9Bs/m1rm5C0Ifp7wjt0nuI6U5G7KJesmU/o1F1KvirkD0UPwj1Cpt5XbnJr2j4JTzMxnhm
	m0C+PJ3hjnNS9jIwTDMw2AU0bbyxVQFKSDE1w53qnEfZikmTv95ze7yO9tlOHvbenmC7GKgh8a1
	tFUilZhZGXeR9SHPg3GVigwFr1NDPAWLM4+uNWgT1gTX3EpmvJjSFx2DKqZsv3pysWjcEkRK8Em
	lm9Wp3NF42kDnfPohXiiGracpiayOC4VWZpM+RxMcEnH6D9SclkpwtTB0d+xvj15Iy1/k+S8Jnq
	gHj9L+vf1fsZ+UODlOtTjLreY4axV6kfs82ThMI7qfaqFCxMm458pzI+1Q8kzXW0f12lRSV97F8
	EAjxQZ02WSZqZsC0cQ1XVJqyulDny8rMWTbBidGiOy4mxKAjs01RgO/8KOXIq4iYStzdQ+VEQ6X
	qu2J30uH+ZEFSXUGyxpIp8MbD0TFqI4ow4GsMCcFH+bJDOCZTHSzXvlSpGV8TCNEhFkJVvgti+O
	gvNi1FcuB7fOOeuFpwtpX2IRA4m6rRO+Ku3K0RZEFa4OnZt2ebHTt9GsN5kzwDslEs2D5rY9cy7
	7InW/nZ48uFSkC7aShmU7hkNrPOafKfKXzQ9kTgO+bZ2c6qbqLz+5M6p6W43fyLLo4/hqBBvcs2
	GwwoaqOZcYImwx2c0356Iri7gyjDK+I7hVqojqojagjqyHoBsly3busv2E59ydnhT1QCMN/pRHq
	1nMAxWsslTf6UjZNM1zmAdAwlwrRRrecJlgJJxfkPqj9eQnhtHqbJcFrkf79dEXh6M9jwVSqdtG
	WEEV
X-Received: by 2002:a05:7300:a9c:b0:386:c453:dfd8 with SMTP id 5a478bee46e88-386c453e1demr9539390eec.14.1795752923922;
        Thu, 26 Nov 2026 20:15:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm60340062eec.8.2026.11.26.20.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/8] opencv4: Add recipe
Date: Thu, 26 Nov 2026 20:15:11 -0800
Message-ID: <20261127041517.1773986-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
References: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133212
Content-Type: text/plain; charset="utf-8"

OpenCV 4.x is still maintained upstream (4.14.0 is the latest 4.x
release) and some consumers, e.g. meta-qcom gst-plugins-imsdk and
the prebuilt camx libraries, still need the OpenCV 4 API/ABI after
opencv moved to 5.x.

The recipe is based on the opencv 4.14.0 recipe and installs side by
side with opencv 5: headers, CMake files, data and opencv4.pc already
use opencv4 names, and the library sonames differ (.414 vs .501).
The runtime libraries stay in ${libdir}, while the unversioned link
symlinks move to ${libdir}/opencv4, which opencv4.pc and the CMake
files point at. Python/Java bindings, apps, samples and tests are
not built, packages are named libopencv4-*, Debian renaming is
disabled and only the PACKAGECONFIGs useful to library consumers are
kept. The upstream check is limited to 4.x tags.

Rewrite the source paths in the generated dispatch sources as opencv
does (buildpaths QA warnings in opencv4-src).

The patches are carried over from opencv with a Signed-off-by added,
except the ffmpeg RAW workaround, which 4.14 no longer needs (it guards
AVFMT_RAWPICTURE and CODEC_FLAG_GLOBAL_HEADER by ffmpeg version);
0003-To-fix-errors-as-following.patch is marked Inappropriate as it
only matters with the declined ts-external patch, and 29533.patch
points at the merged upstream commit. Set CVE_PRODUCT so CVE
checks still match opencv, and list all SRCREV names in SRCREV_FORMAT.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../opencv4/0001-Dont-use-isystem.patch       |  28 ++
 .../0001-Make-ts-module-external.patch        |  43 ++++
 .../0001-Use-Os-to-compile-tinyxml2.cpp.patch |  31 +++
 .../0003-To-fix-errors-as-following.patch     |  72 ++++++
 ...ot-embed-build-directory-in-binaries.patch | 139 ++++++++++
 .../opencv/opencv4/29533.patch                | 242 ++++++++++++++++++
 .../opencv/opencv4/download.patch             |  41 +++
 .../recipes-support/opencv/opencv4_4.14.0.bb  | 212 +++++++++++++++
 8 files changed, 808 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv4/0001-Dont-use-isystem.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv4/0001-Make-ts-module-external.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv4/0001-Use-Os-to-compile-tinyxml2.cpp.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv4/0003-To-fix-errors-as-following.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv4/0008-Do-not-embed-build-directory-in-binaries.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv4/29533.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv4/download.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv4_4.14.0.bb

diff --git a/meta-oe/recipes-support/opencv/opencv4/0001-Dont-use-isystem.patch b/meta-oe/recipes-support/opencv/opencv4/0001-Dont-use-isystem.patch
new file mode 100644
index 0000000000..948a80fafa
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv4/0001-Dont-use-isystem.patch
@@ -0,0 +1,28 @@
+From 66e50ee69fa9ee2469d349100e70d8b296c4b4dc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 Sep 2018 00:21:18 -0700
+Subject: [PATCH] Dont use isystem
+
+clang really does not like it
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ cmake/OpenCVPCHSupport.cmake | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/cmake/OpenCVPCHSupport.cmake b/cmake/OpenCVPCHSupport.cmake
+index 08cd06def4..46c9c02da3 100644
+--- a/cmake/OpenCVPCHSupport.cmake
++++ b/cmake/OpenCVPCHSupport.cmake
+@@ -18,6 +18,8 @@ IF(CV_GCC)
+         SET(PCHSupport_FOUND TRUE)
+     ENDIF()
+ 
++    SET(CMAKE_INCLUDE_SYSTEM_FLAG_C "-I")
++    SET(CMAKE_INCLUDE_SYSTEM_FLAG_CXX "-I")
+     SET(_PCH_include_prefix "-I")
+     SET(_PCH_isystem_prefix "-isystem")
+     SET(_PCH_define_prefix "-D")
diff --git a/meta-oe/recipes-support/opencv/opencv4/0001-Make-ts-module-external.patch b/meta-oe/recipes-support/opencv/opencv4/0001-Make-ts-module-external.patch
new file mode 100644
index 0000000000..1c33a7cbdf
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv4/0001-Make-ts-module-external.patch
@@ -0,0 +1,43 @@
+From 11bbf909e08594628bd757d989ae34cf1bfe200b Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 18 Jun 2020 05:51:38 +0000
+Subject: [PATCH] Make ts module external
+
+Make ts module external
+
+Reference: https://github.com/qbonnard/opencv/commit/6b229c5834cb9a0930425e762a6c7b03244d7abb
+
+Upstream-Status: Denied [https://github.com/opencv/opencv/issues/8408]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ modules/ts/CMakeLists.txt | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/modules/ts/CMakeLists.txt b/modules/ts/CMakeLists.txt
+index f95bed0793..66f315bcca 100644
+--- a/modules/ts/CMakeLists.txt
++++ b/modules/ts/CMakeLists.txt
+@@ -4,9 +4,6 @@ if(NOT BUILD_opencv_ts AND NOT BUILD_TESTS AND NOT BUILD_PERF_TESTS)
+   ocv_module_disable(ts)
+ endif()
+ 
+-set(OPENCV_MODULE_TYPE STATIC)
+-set(OPENCV_MODULE_IS_PART_OF_WORLD FALSE)
+-
+ if(WINRT)
+   # WINRT doesn't have access to environment variables
+   # so adding corresponding macros during CMake run
+@@ -16,7 +13,7 @@ endif()
+ 
+ ocv_warnings_disable(CMAKE_CXX_FLAGS -Wundef)
+ 
+-ocv_add_module(ts INTERNAL opencv_core opencv_imgproc opencv_imgcodecs opencv_videoio opencv_highgui)
++ocv_add_module(ts opencv_core opencv_imgproc opencv_imgcodecs opencv_videoio opencv_highgui)
+ 
+ ocv_glob_module_sources()
+ ocv_module_include_directories()
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-support/opencv/opencv4/0001-Use-Os-to-compile-tinyxml2.cpp.patch b/meta-oe/recipes-support/opencv/opencv4/0001-Use-Os-to-compile-tinyxml2.cpp.patch
new file mode 100644
index 0000000000..c5a64387f5
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv4/0001-Use-Os-to-compile-tinyxml2.cpp.patch
@@ -0,0 +1,31 @@
+From 59fafe6e39759e193b5764b36b4c5a93da352123 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Aug 2020 00:36:49 -0700
+Subject: [PATCH] Use -Os to compile tinyxml2.cpp
+
+This workarounds issue [1] seen on riscv with gcc
+
+[1] https://github.com/riscv/riscv-gnu-toolchain/issues/624
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/datasets/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/datasets/CMakeLists.txt b/modules/datasets/CMakeLists.txt
+index 56ca9e310..99b7a33f6 100644
+--- a/modules/datasets/CMakeLists.txt
++++ b/modules/datasets/CMakeLists.txt
+@@ -2,7 +2,7 @@ set(the_description "datasets framework")
+ 
+ set(filter_srcs "${CMAKE_CURRENT_LIST_DIR}/src/tinyxml2/tinyxml2.cpp")
+ if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
+-  ocv_append_source_files_cxx_compiler_options(filter_srcs "-Wno-suggest-override")  # GCC
++  ocv_append_source_files_cxx_compiler_options(filter_srcs "-Wno-suggest-override -Os")  # GCC
+ elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
+   ocv_append_source_files_cxx_compiler_options(filter_srcs "-Wno-inconsistent-missing-override")  # Clang
+ endif()
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-support/opencv/opencv4/0003-To-fix-errors-as-following.patch b/meta-oe/recipes-support/opencv/opencv4/0003-To-fix-errors-as-following.patch
new file mode 100644
index 0000000000..3bf5e91105
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv4/0003-To-fix-errors-as-following.patch
@@ -0,0 +1,72 @@
+From f42c9b8c7bafcadc7e95fb25a391707f970eb426 Mon Sep 17 00:00:00 2001
+From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+Date: Fri, 19 May 2017 04:27:50 +0900
+Subject: [PATCH] To fix errors as following:
+
+"test_main.cpp:45: undefined reference to `parseCustomOptions(int, char**)'"
+"perf_abs.cpp:13: undefined reference to `cvtest::param_seed'"
+"test_superres.cpp:270: undefined reference to `checkIppStatus()'"
+
+Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+
+Also add the visibility changes for certain OpenCL-related functions in
+ts module.
+
+Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
+
+Upstream-Status: Inappropriate [only needed with 0001-Make-ts-module-external.patch, which upstream declined]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ modules/ts/include/opencv2/ts.hpp          | 4 ++--
+ modules/ts/include/opencv2/ts/ocl_test.hpp | 2 +-
+ modules/ts/include/opencv2/ts/ts_ext.hpp   | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/modules/ts/include/opencv2/ts.hpp b/modules/ts/include/opencv2/ts.hpp
+index ed7491a89a..80919d13ee 100644
+--- a/modules/ts/include/opencv2/ts.hpp
++++ b/modules/ts/include/opencv2/ts.hpp
+@@ -728,7 +728,7 @@ protected:
+     }
+ };
+ 
+-extern uint64 param_seed;
++CV_EXPORTS extern uint64 param_seed;
+ 
+ struct DefaultRngAuto
+ {
+@@ -791,7 +791,7 @@ private:
+ #endif
+ #endif
+ 
+-void parseCustomOptions(int argc, char **argv);
++CV_EXPORTS void parseCustomOptions(int argc, char **argv);
+ 
+ #define CV_TEST_INIT0_NOOP (void)0
+ 
+diff --git a/modules/ts/include/opencv2/ts/ocl_test.hpp b/modules/ts/include/opencv2/ts/ocl_test.hpp
+index 11572e9f48..438112e2aa 100644
+--- a/modules/ts/include/opencv2/ts/ocl_test.hpp
++++ b/modules/ts/include/opencv2/ts/ocl_test.hpp
+@@ -82,7 +82,7 @@ inline UMat ToUMat(InputArray src)
+     return dst;
+ }
+ 
+-extern int test_loop_times;
++CV_EXPORTS extern int test_loop_times;
+ 
+ #define MAX_VALUE 357
+ 
+diff --git a/modules/ts/include/opencv2/ts/ts_ext.hpp b/modules/ts/include/opencv2/ts/ts_ext.hpp
+index b2a4cac241..b94c681c0c 100644
+--- a/modules/ts/include/opencv2/ts/ts_ext.hpp
++++ b/modules/ts/include/opencv2/ts/ts_ext.hpp
+@@ -9,7 +9,7 @@
+ #define OPENCV_TS_EXT_HPP
+ 
+ namespace cvtest {
+-void checkIppStatus();
++CV_EXPORTS void checkIppStatus();
+ extern bool skipUnstableTests;
+ extern bool runBigDataTests;
+ extern int testThreads;
diff --git a/meta-oe/recipes-support/opencv/opencv4/0008-Do-not-embed-build-directory-in-binaries.patch b/meta-oe/recipes-support/opencv/opencv4/0008-Do-not-embed-build-directory-in-binaries.patch
new file mode 100644
index 0000000000..d7890bb8f3
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv4/0008-Do-not-embed-build-directory-in-binaries.patch
@@ -0,0 +1,139 @@
+From: Victor Westerhuis <victor@westerhu.is>
+Date: Sat, 19 Nov 2022 21:45:39 +0100
+Subject: Do not embed build directory in binaries
+
+This makes the opencv core module build reproducibly.
+
+https://salsa.debian.org/science-team/opencv/-/raw/master/debian/patches/0008-Do-not-embed-build-directory-in-binaries.patch
+Upstream-Status: Inappropriate [Debian reproducibility patch, drops build-tree data lookup; not upstream]
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ modules/core/CMakeLists.txt                   | 10 ------
+ modules/core/include/opencv2/core/private.hpp |  4 +--
+ modules/core/include/opencv2/core/utility.hpp |  4 +--
+ modules/core/src/utils/datafile.cpp           | 48 +--------------------------
+ 4 files changed, 5 insertions(+), 61 deletions(-)
+
+diff --git a/modules/core/CMakeLists.txt b/modules/core/CMakeLists.txt
+index b78bb98..d96b669 100644
+--- a/modules/core/CMakeLists.txt
++++ b/modules/core/CMakeLists.txt
+@@ -188,16 +188,6 @@ if(OPENCV_OTHER_INSTALL_PATH)
+ ")
+ endif()
+ 
+-set(OPENCV_DATA_CONFIG_STR "${OPENCV_DATA_CONFIG_STR}
+-#define OPENCV_BUILD_DIR \"${CMAKE_BINARY_DIR}\"
+-")
+-
+-file(RELATIVE_PATH SOURCE_DIR_RELATIVE ${CMAKE_BINARY_DIR} ${CMAKE_SOURCE_DIR})
+-set(OPENCV_DATA_CONFIG_STR "${OPENCV_DATA_CONFIG_STR}
+-#define OPENCV_DATA_BUILD_DIR_SEARCH_PATHS \\
+-    \"${SOURCE_DIR_RELATIVE}/\"
+-")
+-
+ if(WIN32)
+   file(RELATIVE_PATH INSTALL_DATA_DIR_RELATIVE "${CMAKE_INSTALL_PREFIX}/${OPENCV_BIN_INSTALL_PATH}" "${CMAKE_INSTALL_PREFIX}/${OPENCV_OTHER_INSTALL_PATH}")
+ else()
+diff --git a/modules/core/include/opencv2/core/private.hpp b/modules/core/include/opencv2/core/private.hpp
+index 146d37f..dd675bc 100644
+--- a/modules/core/include/opencv2/core/private.hpp
++++ b/modules/core/include/opencv2/core/private.hpp
+@@ -818,10 +818,10 @@ Search directories:
+ 2. Check path specified by configuration parameter with "_HINT" suffix (name of environment variable).
+ 3. Check path specified by configuration parameter (name of environment variable).
+    If parameter value is not empty and nothing is found then stop searching.
+-4. Detects build/install path based on:
++4. Detects install path based on:
+    a. current working directory (CWD)
+    b. and/or binary module location (opencv_core/opencv_world, doesn't work with static linkage)
+-5. Scan `<source>/{,data}` directories if build directory is detected or the current directory is in source tree.
++5. Scan `<source>/{,data}` directories if the current directory is in source tree.
+ 6. Scan `<install>/share/OpenCV` directory if install directory is detected.
+ 
+ @param relative_path Relative path to data file
+diff --git a/modules/core/include/opencv2/core/utility.hpp b/modules/core/include/opencv2/core/utility.hpp
+index 108c0d9..f15d9ea 100644
+--- a/modules/core/include/opencv2/core/utility.hpp
++++ b/modules/core/include/opencv2/core/utility.hpp
+@@ -1163,10 +1163,10 @@ Search directories:
+ 2. OPENCV_SAMPLES_DATA_PATH_HINT environment variable
+ 3. OPENCV_SAMPLES_DATA_PATH environment variable
+    If parameter value is not empty and nothing is found then stop searching.
+-4. Detects build/install path based on:
++4. Detects install path based on:
+    a. current working directory (CWD)
+    b. and/or binary module location (opencv_core/opencv_world, doesn't work with static linkage)
+-5. Scan `<source>/{,data,samples/data}` directories if build directory is detected or the current directory is in source tree.
++5. Scan `<source>/{,data,samples/data}` directories if the current directory is in source tree.
+ 6. Scan `<install>/share/OpenCV` directory if install directory is detected.
+ 
+ @see cv::utils::findDataFile
+diff --git a/modules/core/src/utils/datafile.cpp b/modules/core/src/utils/datafile.cpp
+index 3af83a5..6bda857 100644
+--- a/modules/core/src/utils/datafile.cpp
++++ b/modules/core/src/utils/datafile.cpp
+@@ -280,32 +280,8 @@ cv::String findDataFile(const cv::String& relative_path,
+ 
+ 
+     // Steps: 4, 5, 6
+-    cv::String cwd = utils::fs::getcwd();
+-    cv::String build_dir(OPENCV_BUILD_DIR);
+-    bool has_tested_build_directory = false;
+-    if (isSubDirectory(build_dir, cwd) || isSubDirectory(utils::fs::canonical(build_dir), utils::fs::canonical(cwd)))
+-    {
+-        CV_LOG_DEBUG(NULL, "utils::findDataFile(): the current directory is build sub-directory: " << cwd);
+-        const char* build_subdirs[] = { OPENCV_DATA_BUILD_DIR_SEARCH_PATHS };
+-        for (size_t k = 0; k < sizeof(build_subdirs)/sizeof(build_subdirs[0]); k++)
+-        {
+-            CV_LOG_DEBUG(NULL, "utils::findDataFile(): <build>/" << build_subdirs[k]);
+-            cv::String datapath = utils::fs::join(build_dir, build_subdirs[k]);
+-            if (utils::fs::isDirectory(datapath))
+-            {
+-                for(size_t i = search_subdir.size(); i > 0; i--)
+-                {
+-                    const cv::String& subdir = search_subdir[i - 1];
+-                    cv::String prefix = utils::fs::join(datapath, subdir);
+-                    TRY_FILE_WITH_PREFIX(prefix);
+-                }
+-            }
+-        }
+-        has_tested_build_directory = true;
+-    }
+-
+     cv::String source_dir;
+-    cv::String try_source_dir = cwd;
++    cv::String try_source_dir = utils::fs::getcwd();
+     for (int levels = 0; levels < 3; ++levels)
+     {
+         if (utils::fs::exists(utils::fs::join(try_source_dir, "modules/core/include/opencv2/core/version.hpp")))
+@@ -341,28 +317,6 @@ cv::String findDataFile(const cv::String& relative_path,
+         CV_LOG_INFO(NULL, "Can't detect module binaries location");
+     }
+ 
+-    if (!has_tested_build_directory &&
+-        (isSubDirectory(build_dir, module_path) || isSubDirectory(utils::fs::canonical(build_dir), utils::fs::canonical(module_path)))
+-    )
+-    {
+-        CV_LOG_DEBUG(NULL, "utils::findDataFile(): the binary module directory is build sub-directory: " << module_path);
+-        const char* build_subdirs[] = { OPENCV_DATA_BUILD_DIR_SEARCH_PATHS };
+-        for (size_t k = 0; k < sizeof(build_subdirs)/sizeof(build_subdirs[0]); k++)
+-        {
+-            CV_LOG_DEBUG(NULL, "utils::findDataFile(): <build>/" << build_subdirs[k]);
+-            cv::String datapath = utils::fs::join(build_dir, build_subdirs[k]);
+-            if (utils::fs::isDirectory(datapath))
+-            {
+-                for(size_t i = search_subdir.size(); i > 0; i--)
+-                {
+-                    const cv::String& subdir = search_subdir[i - 1];
+-                    cv::String prefix = utils::fs::join(datapath, subdir);
+-                    TRY_FILE_WITH_PREFIX(prefix);
+-                }
+-            }
+-        }
+-    }
+-
+ #if defined OPENCV_INSTALL_DATA_DIR_RELATIVE
+     if (!module_path.empty())  // require module path
+     {
diff --git a/meta-oe/recipes-support/opencv/opencv4/29533.patch b/meta-oe/recipes-support/opencv/opencv4/29533.patch
new file mode 100644
index 0000000000..2c9800e032
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv4/29533.patch
@@ -0,0 +1,242 @@
+From 700cd32ffd59ed3c6f6aec1919867653d8b125ea Mon Sep 17 00:00:00 2001
+From: Aadhu23 <aadhavansalthivel5@gmail.com>
+Date: Thu, 16 Jul 2026 09:21:37 +0000
+Subject: [PATCH 1/3] videoio: support FFmpeg after AVCodec::pix_fmts removal
+
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/f347805418235374f54064f36fc8c248bd599e86]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/videoio/src/cap_ffmpeg_hw.hpp | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/modules/videoio/src/cap_ffmpeg_hw.hpp b/modules/videoio/src/cap_ffmpeg_hw.hpp
+index 65045a2bc79e..bb5e4c108819 100644
+--- a/modules/videoio/src/cap_ffmpeg_hw.hpp
++++ b/modules/videoio/src/cap_ffmpeg_hw.hpp
+@@ -757,6 +757,30 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
+ #endif
+             if (hw_type == AV_HWDEVICE_TYPE_CUDA) // CUDA encoders don't support avcodec_get_hw_config()
+                 hw_native_fmt = AV_PIX_FMT_CUDA;
++#if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(61, 13, 100)
++            if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE) {
++                const AVPixelFormat *pix_fmts = NULL;
++                int num_pix_fmts = 0;
++
++                int ret = avcodec_get_supported_config(
++                    NULL,
++                    c,
++                    AV_CODEC_CONFIG_PIX_FORMAT,
++                    0,
++                    (const void **)&pix_fmts,
++                    &num_pix_fmts);
++
++            if (ret >= 0 && pix_fmts && num_pix_fmts > 0) {
++                    for (int i = 0; i < num_pix_fmts; i++) {
++                        if (pix_fmts[i] == hw_native_fmt) {
++                            *hw_pix_fmt = hw_native_fmt;
++                            if (hw_check_codec(c, hw_type, disabled_codecs))
++                                return c;
++                        }
++                    }
++                }
++            }
++#else
+             if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE && c->pix_fmts) {
+                 for (int i = 0; c->pix_fmts[i] != AV_PIX_FMT_NONE; i++) {
+                     if (c->pix_fmts[i] == hw_native_fmt) {
+@@ -766,6 +790,7 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
+                     }
+                 }
+             }
++#endif
+             for (int i = 0;; i++) {
+                 const AVCodecHWConfig *hw_config = avcodec_get_hw_config(c, i);
+                 if (!hw_config)
+
+From 83ed22ca2800267050a4a9a94afab605c990c0e0 Mon Sep 17 00:00:00 2001
+From: Arnesh Banerjee <linkrinku13@gmail.com>
+Date: Tue, 4 Aug 2026 19:49:11 +0530
+Subject: [PATCH 2/3] videoio(ffmpeg): use avcodec_get_supported_config for
+ framerates on FFmpeg 9
+
+AVCodec::supported_framerates was deprecated in FFmpeg 7.1 and removed in
+FFmpeg 9, so direct field access no longer builds against FFmpeg 9.
+
+Read the supported frame rate list through avcodec_get_supported_config()
+when building against libavcodec 61.13.100 or newer. That call returns the
+same list plus its entry count, so the loop iterates by count instead of the
+old sentinel terminator. Older FFmpeg keeps the previous field access.
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/f347805418235374f54064f36fc8c248bd599e86]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/videoio/src/cap_ffmpeg_impl.hpp | 34 +++++++++++++++++++++++++
+ 1 file changed, 34 insertions(+)
+
+diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
+index a7fb1eda9a54..d5b950392c94 100644
+--- a/modules/videoio/src/cap_ffmpeg_impl.hpp
++++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
+@@ -2627,6 +2627,39 @@ static AVCodecContext * icv_configure_video_stream_FFMPEG(AVFormatContext *oc,
+     c->time_base.den = frame_rate;
+     c->time_base.num = frame_rate_base;
+     /* adjust time base for supported framerates */
++    // AVCodec::supported_framerates was deprecated in FFmpeg 7.1 and removed in
++    // FFmpeg 9. avcodec_get_supported_config() returns the same list together
++    // with its entry count, so use it when available.
++#if LIBAVCODEC_BUILD >= CALC_FFMPEG_VERSION(61, 13, 100)
++    const AVRational *supported_framerates = NULL;
++    int num_supported_framerates = 0;
++    if (codec)
++        avcodec_get_supported_config(NULL, codec, AV_CODEC_CONFIG_FRAME_RATE, 0,
++                                     (const void **)&supported_framerates, &num_supported_framerates);
++    if (supported_framerates && num_supported_framerates > 0){
++        AVRational req = {frame_rate, frame_rate_base};
++        const AVRational *best=NULL;
++        AVRational best_error= {INT_MAX, 1};
++        for(int i = 0; i < num_supported_framerates; i++){
++            const AVRational *p = &supported_framerates[i];
++            AVRational error= av_sub_q(req, *p);
++            if(error.num <0) error.num *= -1;
++            if(av_cmp_q(error, best_error) < 0){
++                best_error= error;
++                best= p;
++            }
++        }
++        if (best == NULL)
++        {
++#ifdef CV_FFMPEG_CODECPAR
++            avcodec_free_context(&c);
++#endif
++            return NULL;
++        }
++        c->time_base.den= best->num;
++        c->time_base.num= best->den;
++    }
++#else
+     if(codec && codec->supported_framerates){
+         const AVRational *p= codec->supported_framerates;
+         AVRational req = {frame_rate, frame_rate_base};
+@@ -2650,6 +2683,7 @@ static AVCodecContext * icv_configure_video_stream_FFMPEG(AVFormatContext *oc,
+         c->time_base.den= best->num;
+         c->time_base.num= best->den;
+     }
++#endif
+
+     c->gop_size = 12; /* emit one intra frame every twelve frames at most */
+     c->pix_fmt = pixel_format;
+
+From c0166c617d765ac707dde6b9acd8cfcd49751049 Mon Sep 17 00:00:00 2001
+From: Alexander Smorkalov <alexander.smorkalov@opencv.ai>
+Date: Tue, 11 Aug 2026 13:01:55 +0300
+Subject: [PATCH 3/3] Code review fixes.
+
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/f347805418235374f54064f36fc8c248bd599e86]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/videoio/src/cap_ffmpeg_hw.hpp   | 16 ++++----
+ modules/videoio/src/cap_ffmpeg_impl.hpp | 51 ++++++++++++-------------
+ 2 files changed, 33 insertions(+), 34 deletions(-)
+
+diff --git a/modules/videoio/src/cap_ffmpeg_hw.hpp b/modules/videoio/src/cap_ffmpeg_hw.hpp
+index bb5e4c108819..6c456881122a 100644
+--- a/modules/videoio/src/cap_ffmpeg_hw.hpp
++++ b/modules/videoio/src/cap_ffmpeg_hw.hpp
+@@ -757,7 +757,7 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
+ #endif
+             if (hw_type == AV_HWDEVICE_TYPE_CUDA) // CUDA encoders don't support avcodec_get_hw_config()
+                 hw_native_fmt = AV_PIX_FMT_CUDA;
+-#if LIBAVCODEC_VERSION_INT >= AV_VERSION_INT(61, 13, 100)
++#if LIBAVCODEC_BUILD >= AV_VERSION_INT(61, 13, 100)
+             if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE) {
+                 const AVPixelFormat *pix_fmts = NULL;
+                 int num_pix_fmts = 0;
+@@ -770,15 +770,15 @@ AVCodec *hw_find_codec(AVCodecID id, AVHWDeviceType hw_type, int (*check_categor
+                     (const void **)&pix_fmts,
+                     &num_pix_fmts);
+
+-            if (ret >= 0 && pix_fmts && num_pix_fmts > 0) {
+-                    for (int i = 0; i < num_pix_fmts; i++) {
+-                        if (pix_fmts[i] == hw_native_fmt) {
+-                            *hw_pix_fmt = hw_native_fmt;
+-                            if (hw_check_codec(c, hw_type, disabled_codecs))
+-                                return c;
++                if (ret >= 0 && pix_fmts && num_pix_fmts > 0) {
++                        for (int i = 0; i < num_pix_fmts; i++) {
++                            if (pix_fmts[i] == hw_native_fmt) {
++                                *hw_pix_fmt = hw_native_fmt;
++                                if (hw_check_codec(c, hw_type, disabled_codecs))
++                                    return c;
++                            }
+                         }
+                     }
+-                }
+             }
+ #else
+             if (av_codec_is_encoder(c) && hw_native_fmt != AV_PIX_FMT_NONE && c->pix_fmts) {
+diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
+index d5b950392c94..fc4479e07c5f 100644
+--- a/modules/videoio/src/cap_ffmpeg_impl.hpp
++++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
+@@ -2627,37 +2627,36 @@ static AVCodecContext * icv_configure_video_stream_FFMPEG(AVFormatContext *oc,
+     c->time_base.den = frame_rate;
+     c->time_base.num = frame_rate_base;
+     /* adjust time base for supported framerates */
+-    // AVCodec::supported_framerates was deprecated in FFmpeg 7.1 and removed in
+-    // FFmpeg 9. avcodec_get_supported_config() returns the same list together
+-    // with its entry count, so use it when available.
+ #if LIBAVCODEC_BUILD >= CALC_FFMPEG_VERSION(61, 13, 100)
+-    const AVRational *supported_framerates = NULL;
+-    int num_supported_framerates = 0;
+-    if (codec)
+-        avcodec_get_supported_config(NULL, codec, AV_CODEC_CONFIG_FRAME_RATE, 0,
+-                                     (const void **)&supported_framerates, &num_supported_framerates);
+-    if (supported_framerates && num_supported_framerates > 0){
+-        AVRational req = {frame_rate, frame_rate_base};
+-        const AVRational *best=NULL;
+-        AVRational best_error= {INT_MAX, 1};
+-        for(int i = 0; i < num_supported_framerates; i++){
+-            const AVRational *p = &supported_framerates[i];
+-            AVRational error= av_sub_q(req, *p);
+-            if(error.num <0) error.num *= -1;
+-            if(av_cmp_q(error, best_error) < 0){
+-                best_error= error;
+-                best= p;
++    if (codec){
++        const AVRational *supported_framerates = NULL;
++        int num_supported_framerates = 0;
++        int ret = avcodec_get_supported_config(NULL, codec, AV_CODEC_CONFIG_FRAME_RATE, 0,
++                                               (const void **)&supported_framerates, &num_supported_framerates);
++
++        if (ret >= 0 && supported_framerates && num_supported_framerates > 0){
++            AVRational req = {frame_rate, frame_rate_base};
++            const AVRational *best=NULL;
++            AVRational best_error= {INT_MAX, 1};
++            for(int i = 0; i < num_supported_framerates; i++){
++                const AVRational *p = &supported_framerates[i];
++                AVRational error = av_sub_q(req, *p);
++                if(error.num <0) error.num *= -1;
++                if(av_cmp_q(error, best_error) < 0){
++                    best_error = error;
++                    best = p;
++                }
+             }
+-        }
+-        if (best == NULL)
+-        {
++            if (best == NULL)
++            {
+ #ifdef CV_FFMPEG_CODECPAR
+-            avcodec_free_context(&c);
++                avcodec_free_context(&c);
+ #endif
+-            return NULL;
++                return NULL;
++            }
++            c->time_base.den = best->num;
++            c->time_base.num = best->den;
+         }
+-        c->time_base.den= best->num;
+-        c->time_base.num= best->den;
+     }
+ #else
+     if(codec && codec->supported_framerates){
diff --git a/meta-oe/recipes-support/opencv/opencv4/download.patch b/meta-oe/recipes-support/opencv/opencv4/download.patch
new file mode 100644
index 0000000000..28db3c96f7
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv4/download.patch
@@ -0,0 +1,41 @@
+From b18a280fab06a680d9f831bf8b462647f3cb6214 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 9 Jan 2020 16:24:24 +0000
+Subject: [PATCH] opencv: abort configure if we need to download
+
+This CMake module will download files during do_configure.  This is bad as it
+means we can't do offline builds.
+
+Add an option to disallow downloads by emitting a fatal error.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ cmake/OpenCVDownload.cmake | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/cmake/OpenCVDownload.cmake b/cmake/OpenCVDownload.cmake
+index 63cf6d3238..4acf477f70 100644
+--- a/cmake/OpenCVDownload.cmake
++++ b/cmake/OpenCVDownload.cmake
+@@ -14,6 +14,7 @@
+ #    RELATIVE_URL - if set, then URL is treated as a base, and FILENAME will be appended to it
+ #  Note: uses OPENCV_DOWNLOAD_PATH folder as cache, default is <opencv>/.cache
+ 
++set(OPENCV_ALLOW_DOWNLOADS ON CACHE BOOL "Allow downloads")
+ set(HELP_OPENCV_DOWNLOAD_PATH "Cache directory for downloaded files")
+ if(DEFINED ENV{OPENCV_DOWNLOAD_PATH})
+   set(OPENCV_DOWNLOAD_PATH "$ENV{OPENCV_DOWNLOAD_PATH}" CACHE PATH "${HELP_OPENCV_DOWNLOAD_PATH}")
+@@ -156,6 +157,11 @@ function(ocv_download)
+ 
+   # Download
+   if(NOT EXISTS "${CACHE_CANDIDATE}")
++    if(NOT OPENCV_ALLOW_DOWNLOADS)
++      message(FATAL_ERROR "Not going to download ${DL_FILENAME}")
++      return()
++    endif()
++
+     ocv_download_log("#cmake_download \"${CACHE_CANDIDATE}\" \"${DL_URL}\"")
+     foreach(try ${OPENCV_DOWNLOAD_TRIES_LIST})
+       ocv_download_log("#try ${try}")
diff --git a/meta-oe/recipes-support/opencv/opencv4_4.14.0.bb b/meta-oe/recipes-support/opencv/opencv4_4.14.0.bb
new file mode 100644
index 0000000000..82c5279ab4
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv4_4.14.0.bb
@@ -0,0 +1,212 @@
+SUMMARY = "OpenCV 4 compatibility library"
+DESCRIPTION = "OpenCV 4.x libraries for applications that do not support OpenCV 5 yet. \
+They install side by side with opencv: headers in ${includedir}/opencv4, link \
+libraries in ${libdir}/opencv4, CMake files in ${libdir}/cmake/opencv4 and \
+opencv4.pc. No bindings, apps or samples are built."
+HOMEPAGE = "https://opencv.org/"
+SECTION = "libs"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+CVE_PRODUCT = "opencv:opencv"
+
+ARM_INSTRUCTION_SET:armv4 = "arm"
+ARM_INSTRUCTION_SET:armv5 = "arm"
+
+DEPENDS = "bzip2 zlib glib-2.0 libwebp"
+
+SRCREV_opencv = "0654a42e19215ef25b1d367d822f3c630447e7c7"
+SRCREV_contrib = "a8e9acd62cabd30419dba83007f2ac0d07de5e2c"
+SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
+SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
+SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
+SRCREV_wechat-qrcode = "a8b69ccc738421293254aec5ddb38bd523503252"
+SRCREV_fastcv = "9e8d42b6d7e769548d70b2e5674e263b056de8b4"
+# kleidicv must match version of OpenCV
+SRCREV_kleidicv = "b1dbf474b8685b97a64d03e828b359fbdc050d1f"
+
+SRCREV_FORMAT = "opencv_contrib_boostdesc_vgg_face_wechat-qrcode_fastcv_kleidicv"
+SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=https;tag=${PV} \
+           git://github.com/opencv/opencv_contrib.git;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/contrib;name=contrib;branch=4.x;protocol=https;tag=${PV} \
+           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/boostdesc;name=boostdesc;protocol=https \
+           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/vgg;name=vgg;protocol=https \
+           git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/face;name=face;protocol=https \
+           git://github.com/WeChatCV/opencv_3rdparty.git;branch=wechat_qrcode;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/wechat_qrcode;name=wechat-qrcode;protocol=https \
+           git://github.com/opencv/opencv_3rdparty.git;branch=fastcv/4.x_20250715;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/fastcv;name=fastcv;protocol=https \
+           file://0003-To-fix-errors-as-following.patch \
+           file://0001-Dont-use-isystem.patch \
+           file://download.patch \
+           file://0001-Make-ts-module-external.patch \
+           file://0008-Do-not-embed-build-directory-in-binaries.patch \
+           file://29533.patch \
+           "
+SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
+SRC_URI:append:aarch64 = " git://gitlab.arm.com/kleidi/kleidicv;branch=main;tag=26.03;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/3rdparty/kleidicv;name=kleidicv;protocol=https"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>4(\.\d+)+)$"
+
+# OpenCV wants to download more files during configure.  We download these in
+# do_fetch and construct a source cache in the format it expects
+OPENCV_DLDIR = "${WORKDIR}/downloads"
+
+do_unpack_extra() {
+
+    md5() {
+        # Return the MD5 of $1
+        echo $(md5sum $1 | cut -d' ' -f1)
+    }
+    cache() {
+        TAG=$1
+        shift
+        mkdir --parents ${OPENCV_DLDIR}/$TAG
+        for F in $*; do
+            DEST=${OPENCV_DLDIR}/$TAG/$(md5 $F)-$(basename $F)
+            test -e $DEST || ln -s $F $DEST
+        done
+    }
+    cache xfeatures2d/boostdesc ${S}/boostdesc/*.i
+    cache xfeatures2d/vgg ${S}/vgg/*.i
+    cache data ${S}/face/*.dat
+    cache wechat_qrcode ${S}/wechat_qrcode/*.caffemodel
+    cache wechat_qrcode ${S}/wechat_qrcode/*.prototxt
+    cache fastcv ${S}/fastcv/fastcv/*.tgz
+}
+addtask unpack_extra after do_unpack before do_patch
+
+OPENCV4_RELLIBDIR = "${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')}"
+
+# Link libraries go to ${libdir}/opencv4, CMake files keep their versioned directory
+EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${S}/contrib/modules \
+    -DOPENCV_LIB_INSTALL_PATH=${OPENCV4_RELLIBDIR}/opencv4 \
+    -DOPENCV_3P_LIB_INSTALL_PATH=${OPENCV4_RELLIBDIR}/opencv4/3rdparty \
+    -DOPENCV_CONFIG_INSTALL_PATH=${OPENCV4_RELLIBDIR}/cmake/opencv4 \
+    -DWITH_1394=OFF \
+    -DENABLE_PRECOMPILED_HEADERS=OFF \
+    -DCMAKE_SKIP_RPATH=ON \
+    -DWITH_IPP=OFF \
+    -DOPENCV_GENERATE_PKGCONFIG=ON \
+    -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
+    -DOPENCV_ALLOW_DOWNLOADS=OFF \
+    -DBUILD_opencv_apps=OFF \
+    -DBUILD_EXAMPLES=OFF \
+    -DBUILD_TESTS=OFF \
+    -DBUILD_PERF_TESTS=OFF \
+    -DBUILD_JAVA=OFF \
+    -DBUILD_opencv_python2=OFF \
+    -DBUILD_opencv_python3=OFF \
+    -DBUILD_opencv_freetype=OFF \
+    -DBUILD_opencv_text=OFF \
+    -DWITH_ADE=OFF \
+    -DWITH_GTK=OFF \
+    -DWITH_GPHOTO2=OFF \
+    -DWITH_JASPER=OFF \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DCPU_DISPATCH=SSE,SSE2,SSE3,SSSE3", "", d)} \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DCPU_DISPATCH=SSE,SSE2,SSE3,SSSE3,SSE41", "", d)} \
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DCPU_DISPATCH=SSE,SSE2,SSE3,SSSE3,SSE41,SSE42", "", d)} \
+"
+
+LDFLAGS:append:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
+LDFLAGS:append:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
+
+EXTRA_OECMAKE:append:x86 = " -DX86=ON"
+EXTRA_OECMAKE:append:aarch64 = " -DKLEIDICV_SOURCE_PATH=${S}/3rdparty/kleidicv"
+
+PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l tbb"
+PACKAGECONFIG:append:class-target = " gstreamer \
+    ${@bb.utils.contains_any("LICENSE_FLAGS_ACCEPTED", "commercial_ffmpeg commercial", "libav", "", d)}"
+
+# TBB does not build for powerpc so disable that package config
+PACKAGECONFIG:remove:powerpc = "tbb"
+# tbb now needs getcontect/setcontext which is not there for all arches on musl
+PACKAGECONFIG:remove:libc-musl:riscv64 = "tbb"
+PACKAGECONFIG:remove:libc-musl:riscv32 = "tbb"
+
+PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DPROTOBUF_UPDATE_FILES=ON -DBUILD_PROTOBUF=OFF -DCMAKE_CXX_STANDARD=17,-DBUILD_opencv_dnn=OFF,protobuf protobuf-native,"
+PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen gflags glog,"
+PACKAGECONFIG[fastcv] = "-DWITH_FASTCV=ON,-DWITH_FASTCV=OFF,"
+PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
+PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
+PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,ffmpeg,"
+PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
+PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers virtual/libopencl1,"
+PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
+PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
+PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
+PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
+
+inherit pkgconfig cmake python3native
+
+TARGET_CC_ARCH += "-I${S}/include "
+
+do_compile:prepend() {
+    # remove the build host info to improve reproducibility
+    if [ -f ${WORKDIR}/build/modules/core/version_string.inc ]; then
+        sed -i "s#${WORKDIR}#/workdir#g" ${WORKDIR}/build/modules/core/version_string.inc
+    fi
+}
+
+do_install:append() {
+    # Runtime libraries go to ${libdir} for the loader; the link symlinks stay in opencv4/
+    for lib in ${D}${libdir}/opencv4/libopencv_*.so.${PV}; do
+        name=$(basename $lib)
+        base=${name%.so.${PV}}
+        mv $lib ${D}${libdir}/
+        for so in ${D}${libdir}/opencv4/$base.so.*; do
+            mv $so ${D}${libdir}/
+            ln -sf ../$(basename $so) $so
+        done
+        ln -sf ../$name $lib
+    done
+
+    install -d ${D}${libdir}/pkgconfig
+    mv ${D}${libdir}/opencv4/pkgconfig/opencv4.pc ${D}${libdir}/pkgconfig/
+    rmdir ${D}${libdir}/opencv4/pkgconfig
+
+    rm -f ${D}${bindir}/setup_vars_opencv4.sh
+    [ ! -d ${D}${bindir} ] || rmdir --ignore-fail-on-non-empty ${D}${bindir}
+
+    # Generated dispatch sources include the originals by absolute path
+    find ${B}/modules -name "*.cpp" | xargs -r grep -l "${S}" | while read -r fn; do
+        sed -i -e 's,${S},/usr/src/debug/${PN}/${PV},g' "$fn"
+    done
+}
+
+do_install:append:class-target() {
+    # remove build host path to improve reproducibility
+    if [ -f ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake ]; then
+        sed -e 's@${STAGING_DIR_HOST}@@g' \
+            -i ${D}${libdir}/cmake/opencv4/OpenCVModules.cmake
+    fi
+}
+
+python populate_packages:prepend () {
+    cv_libdir = d.expand('${libdir}')
+    do_split_packages(d, cv_libdir, r'^libopencv_(.*)\.so\..*', 'libopencv4-%s', 'OpenCV 4 %s library', extra_depends='', allow_links=True)
+
+    pn = d.getVar('PN')
+    d.setVar('ALLOW_EMPTY:' + pn, "1")
+    metapkg_rdepends = []
+    for pkg in d.getVar('PACKAGES').split():
+        if pkg.startswith('libopencv4-') or pkg == pn + '-data':
+            metapkg_rdepends.append(pkg)
+    d.setVar('RDEPENDS:' + pn, ' '.join(metapkg_rdepends))
+
+    if bb.utils.contains('PACKAGECONFIG', 'fastcv', True, False, d):
+        for pkg in ["libopencv4-core", "libopencv4-fastcv", "libopencv4-imgproc"]:
+            d.appendVar('RRECOMMENDS:' + pkg, " qcom-fastcv-binaries")
+}
+
+PACKAGES =+ "${PN}-data"
+PACKAGES_DYNAMIC += "^libopencv4-.*"
+
+FILES:${PN} = ""
+FILES:${PN}-data = "${datadir}/opencv4 ${datadir}/licenses/opencv4"
+FILES:${PN}-staticdev += "${libdir}/opencv4/3rdparty/*.a"
+FILES:${PN}-dev += " \
+    ${libdir}/opencv4 \
+    ${libdir}/cmake/opencv4 \
+"
+
+# Keep the package names apart from those of opencv
+AUTO_LIBNAME_PKGS = ""
