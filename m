Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC9F77DCD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 May 2017 14:09:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 May 2017 07:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,292,1491289200"; d="scan'208";a="1165061528"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2017 07:09:15 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 May 2017 17:09:08 +0300
Message-Id: <20170505140912.8205-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170505140912.8205-1-alexander.kanavin@linux.intel.com>
References: <20170505140912.8205-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/6] glcompbench: remove the recipe
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
X-List-Received-Date: Fri, 05 May 2017 14:09:15 -0000

It hasn't been updated upstream since 2012, and relies on outdated libpng 1.2
(which is being removed from oe-core).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-build-Specify-std-c-11-on-cmdline.patch   | 45 ----------------------
 ...001-waf-Disable-errors-due-to-Wdeprecated.patch | 31 ---------------
 .../glcompbench/Fix-configure-for-sqrt-check.patch | 14 -------
 .../glcompbench/Fix_auto_ptr_deprecated.patch      | 24 ------------
 .../glcompbench/glcompbench/Fix_space_issues.patch | 22 -----------
 .../glcompbench/glbench-compile-fix.patch          | 35 -----------------
 .../glcompbench/glcompbench_2012.08.bb             | 22 -----------
 7 files changed, 193 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/glcompbench/glcompbench/0001-build-Specify-std-c-11-on-cmdline.patch
 delete mode 100644 meta-oe/recipes-graphics/glcompbench/glcompbench/0001-waf-Disable-errors-due-to-Wdeprecated.patch
 delete mode 100755 meta-oe/recipes-graphics/glcompbench/glcompbench/Fix-configure-for-sqrt-check.patch
 delete mode 100755 meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_auto_ptr_deprecated.patch
 delete mode 100755 meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_space_issues.patch
 delete mode 100644 meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch
 delete mode 100755 meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb

diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/0001-build-Specify-std-c-11-on-cmdline.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/0001-build-Specify-std-c-11-on-cmdline.patch
deleted file mode 100644
index ffbc297f0..000000000
--- a/meta-oe/recipes-graphics/glcompbench/glcompbench/0001-build-Specify-std-c-11-on-cmdline.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 47bfef0dd83ed2e10ec4c615908ec926c4d5fe2e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 19 Oct 2016 00:56:54 +0000
-Subject: [PATCH] build: Specify -std=c++11 on cmdline
-
-We use c++11 features so demand it explicitly from compiler
-
-Fixes
-| ../src/libmatrix/shader-source.cc:37:10: error: no member named 'unique_ptr' in namespace 'std'
-|     std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
-|     ~~~~~^
-| ../src/libmatrix/shader-source.cc:37:33: error: expected '(' for function-style cast or type construction
-|     std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
-|                     ~~~~~~~~~~~~^
-| ../src/libmatrix/shader-source.cc:37:35: error: use of undeclared identifier 'is_ptr'
-|     std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
-|                                   ^
-| ../src/libmatrix/shader-source.cc:38:30: error: use of undeclared identifier 'is_ptr'
-|     std::istream& inputFile(*is_ptr);
-|                              ^
-| 4 errors generated.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- wscript | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wscript b/wscript
-index dcaf298..485a9fb 100644
---- a/wscript
-+++ b/wscript
-@@ -79,7 +79,7 @@ def configure(ctx):
-             ctx.check_cfg(package = pkg, uselib_store = uselib, args = '--cflags --libs',
-                           mandatory = True)
- 
--    ctx.env.append_unique('CXXFLAGS', '-Wall -Werror -Wextra'.split(' '))
-+    ctx.env.append_unique('CXXFLAGS', '-Wall -Werror -std=c++11 -Wextra'.split(' '))
- 
-     # Prepend -O# and -g flags so that they can be overriden by the CFLAGS environment variable
-     if Options.options.opt:
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/0001-waf-Disable-errors-due-to-Wdeprecated.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/0001-waf-Disable-errors-due-to-Wdeprecated.patch
deleted file mode 100644
index deb60161c..000000000
--- a/meta-oe/recipes-graphics/glcompbench/glcompbench/0001-waf-Disable-errors-due-to-Wdeprecated.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 49297e2fbe0420a255cbe67989d0ec539125412c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 23 Apr 2017 10:38:24 -0700
-Subject: [PATCH] waf: Disable errors due to -Wdeprecated
-
-throw() has been deprecated in c++11 and removed
-from c++17, gcc7 is more pedandic about this warning
-we therefore add a workaround to ignore this warning
-for now.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- wscript | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wscript b/wscript
-index 485a9fb..7f59761 100644
---- a/wscript
-+++ b/wscript
-@@ -79,7 +79,7 @@ def configure(ctx):
-             ctx.check_cfg(package = pkg, uselib_store = uselib, args = '--cflags --libs',
-                           mandatory = True)
- 
--    ctx.env.append_unique('CXXFLAGS', '-Wall -Werror -std=c++11 -Wextra'.split(' '))
-+    ctx.env.append_unique('CXXFLAGS', '-Wall -Werror -std=c++11 -Wextra -Wno-error=deprecated'.split(' '))
- 
-     # Prepend -O# and -g flags so that they can be overriden by the CFLAGS environment variable
-     if Options.options.opt:
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix-configure-for-sqrt-check.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix-configure-for-sqrt-check.patch
deleted file mode 100755
index 4831c401f..000000000
--- a/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix-configure-for-sqrt-check.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: git/wscript
-===================================================================
---- git.orig/wscript	2016-07-29 13:15:44.954249796 -0500
-+++ git/wscript	2016-07-29 15:52:06.196768865 -0500
-@@ -56,7 +56,7 @@
-         ctx.check_cxx(lib = lib, uselib_store = uselib)
- 
-     # Check required functions
--    req_funcs = [('gettimeofday', 'sys/time.h', []) ,('sqrt', 'math.h', ['m']),
-+    req_funcs = [('gettimeofday', 'sys/time.h', []),
-                  ('strtol', 'stdlib.h', []), ('strtoul', 'stdlib.h', [])]
-     for func, header, uselib in req_funcs:
-         ctx.check_cxx(function_name = func, header_name = header, uselib = uselib, mandatory = True)
-
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_auto_ptr_deprecated.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_auto_ptr_deprecated.patch
deleted file mode 100755
index 930c7cb50..000000000
--- a/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_auto_ptr_deprecated.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -aur glcompbench-2012.08/src/libmatrix/shader-source.cc Fixed/src/libmatrix/shader-source.cc
---- glcompbench-2012.08/src/libmatrix/shader-source.cc	2012-08-22 13:41:36.000000000 -0500
-+++ Fixed/src/libmatrix/shader-source.cc	2016-08-24 14:23:49.576023317 -0500
-@@ -34,7 +34,7 @@
- bool
- ShaderSource::load_file(const std::string& filename, std::string& str)
- {
--    std::auto_ptr<std::istream> is_ptr(Util::get_resource(filename));
-+    std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
-     std::istream& inputFile(*is_ptr);
- 
-     if (!inputFile)
-diff -aur glcompbench-2012.08/src/texture.cc Fixed/src/texture.cc
---- glcompbench-2012.08/src/texture.cc	2012-08-22 13:41:36.000000000 -0500
-+++ Fixed/src/texture.cc	2016-08-24 14:23:28.223917438 -0500
-@@ -52,7 +52,7 @@
- 
-         Log::debug("Reading PNG file %s\n", filename.c_str());
- 
--        const std::auto_ptr<std::istream> is_ptr(Util::get_resource(filename));
-+        const std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
-         if (!(*is_ptr)) {
-             Log::error("Cannot open file %s!\n", filename.c_str());
-             return false;
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_space_issues.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_space_issues.patch
deleted file mode 100755
index 516baadae..000000000
--- a/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_space_issues.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-diff -aur glcompbench-2012.08/src/composite-canvas.cc Fixed/src/composite-canvas.cc
---- glcompbench-2012.08/src/composite-canvas.cc	2012-08-22 13:41:36.000000000 -0500
-+++ Fixed/src/composite-canvas.cc	2016-08-24 14:05:28.970565709 -0500
-@@ -41,7 +41,7 @@
- #include "log.h"
- #include "profiler.h"
- 
--const std::string glcompbench_version_string("glcompbench "GLCOMPBENCH_VERSION);
-+const std::string glcompbench_version_string("glcompbench " GLCOMPBENCH_VERSION);
- 
- /*******************
-  * Private methods *
-@@ -495,7 +495,7 @@
-     // When we complete an iteration, reset the count and tell the caller.
- 
-     if (stats.total >= current_test_duration_) {
--        Log::info("FPS: %"PRIu64"\n", (uint64_t)(1000 * stats.nsamples / stats.total));
-+        Log::info("FPS: %" PRIu64 "\n", (uint64_t)(1000 * stats.nsamples / stats.total));
- 
-         for (Profiler::Point p = 0; p < profiler.get_num_points(); p += 2) {
-             profiler.get_stats(p, p + 1, stats);
-
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch
deleted file mode 100644
index 374a6cf66..000000000
--- a/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fix.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c4bc44c3abf69f26e4c2b7684f4da4670a51f993 Mon Sep 17 00:00:00 2001
-From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
-Date: Tue, 5 Nov 2013 11:03:04 -0600
-Subject: [PATCH] to make compilable
-
-Upstream Status: Inappropriate [workaround]
-
-Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
----
- src/composite-test-simple-blur.cc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/composite-test-simple-blur.cc b/src/composite-test-simple-blur.cc
-index 170ad64..d7f77cf 100644
---- a/src/composite-test-simple-blur.cc
-+++ b/src/composite-test-simple-blur.cc
-@@ -347,6 +347,7 @@ CompositeTestSimpleBlur::CompositeTestSimpleBlur() :
- 
- CompositeTestSimpleBlur::~CompositeTestSimpleBlur()
- {
-+#if 0
-     for (BlurWindowMapType::iterator winIt = priv_->windowMap.begin();
-          winIt != priv_->windowMap.end();
-          winIt++)
-@@ -354,6 +355,7 @@ CompositeTestSimpleBlur::~CompositeTestSimpleBlur()
-         RenderWindowBlur* ro = winIt->second;
-         delete ro;
-     }
-+#endif
-     delete priv_;
- }
- 
--- 
-1.8.1.2
-
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
deleted file mode 100755
index e8465855d..000000000
--- a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "A benchmark for GL(ES)2 based compositing operations"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
-
-DEPENDS = "virtual/libgl virtual/egl virtual/libgles1 virtual/libgles2 \
-           virtual/libx11 libxcomposite pixman libxrender libpng12"
-
-SRC_URI = "https://launchpad.net/glcompbench/trunk/${PV}/+download/${BPN}-${PV}.tar.gz \
-           file://glbench-compile-fix.patch \
-           file://Fix-configure-for-sqrt-check.patch \
-           file://Fix_space_issues.patch \
-           file://Fix_auto_ptr_deprecated.patch \
-           file://0001-build-Specify-std-c-11-on-cmdline.patch \
-           file://0001-waf-Disable-errors-due-to-Wdeprecated.patch \
-           "
-
-SRC_URI[md5sum] = "c939d9156fe940960098f38707fea827"
-SRC_URI[sha256sum] = "b04b738cec06c6786ceafa86e4735fd8b971c078265754854ef356b0379542ee"
-
-inherit pkgconfig waf distro_features_check
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.11.0


