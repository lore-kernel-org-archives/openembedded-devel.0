Return-Path: <ismo.puustinen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6D92477E88
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jun 2017 11:08:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2017 04:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,311,1493708400"; d="scan'208";a="96579472"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2017 04:08:57 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jun 2017 14:08:54 +0300
Message-Id: <20170607110854.5275-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH] opencv: fix compilation error when OpenCL is enabled.
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
X-List-Received-Date: Wed, 07 Jun 2017 11:09:00 -0000

The patch which changes test module function visilibility was missing
some OpenCL symbols. Export also those.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 .../opencv/0001-To-fix-errors-as-following.patch   | 41 ++++++++++++++++++----
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-following.patch b/meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-following.patch
index 820ab81..9c1b9b3 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-following.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-following.patch
@@ -1,4 +1,4 @@
-From db1d9cc82b68f6593360d66ef40cb6b0fc377e6e Mon Sep 17 00:00:00 2001
+From a4abe478bf4514ec95aa10b2d6f258647ce325f5 Mon Sep 17 00:00:00 2001
 From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 Date: Fri, 19 May 2017 04:27:50 +0900
 Subject: [PATCH] To fix errors as following:
@@ -8,13 +8,19 @@ Subject: [PATCH] To fix errors as following:
 "test_superres.cpp:270: undefined reference to `checkIppStatus()'"
 
 Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+
+Also add the visibility changes for certain OpenCL-related functions in
+ts module.
+
+Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
 ---
- modules/ts/include/opencv2/ts.hpp        | 4 ++--
- modules/ts/include/opencv2/ts/ts_ext.hpp | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
+ modules/ts/include/opencv2/ts.hpp          | 6 +++---
+ modules/ts/include/opencv2/ts/ocl_test.hpp | 2 +-
+ modules/ts/include/opencv2/ts/ts_ext.hpp   | 2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/modules/ts/include/opencv2/ts.hpp b/modules/ts/include/opencv2/ts.hpp
-index c573905..7ff6cc1 100644
+index c573905..230f598 100644
 --- a/modules/ts/include/opencv2/ts.hpp
 +++ b/modules/ts/include/opencv2/ts.hpp
 @@ -539,7 +539,7 @@ protected:
@@ -26,7 +32,15 @@ index c573905..7ff6cc1 100644
  
  struct CV_EXPORTS DefaultRngAuto
  {
-@@ -602,7 +602,7 @@ void dumpOpenCLDevice();
+@@ -595,14 +595,14 @@ CV_EXPORTS std::string findDataFile(const std::string& relative_path, bool requi
+ 
+ #ifdef HAVE_OPENCL
+ namespace ocl {
+-void dumpOpenCLDevice();
++CV_EXPORTS void dumpOpenCLDevice();
+ }
+ #define TEST_DUMP_OCL_INFO cvtest::ocl::dumpOpenCLDevice();
+ #else
  #define TEST_DUMP_OCL_INFO
  #endif
  
@@ -35,6 +49,19 @@ index c573905..7ff6cc1 100644
  
  #define CV_TEST_MAIN(resourcesubdir, ...) \
  int main(int argc, char **argv) \
+diff --git a/modules/ts/include/opencv2/ts/ocl_test.hpp b/modules/ts/include/opencv2/ts/ocl_test.hpp
+index c967cd7..ff35b40 100644
+--- a/modules/ts/include/opencv2/ts/ocl_test.hpp
++++ b/modules/ts/include/opencv2/ts/ocl_test.hpp
+@@ -84,7 +84,7 @@ inline UMat ToUMat(InputArray src)
+     return dst;
+ }
+ 
+-extern int test_loop_times;
++CV_EXPORTS extern int test_loop_times;
+ 
+ #define MAX_VALUE 357
+ 
 diff --git a/modules/ts/include/opencv2/ts/ts_ext.hpp b/modules/ts/include/opencv2/ts/ts_ext.hpp
 index 05ccc63..8075065 100644
 --- a/modules/ts/include/opencv2/ts/ts_ext.hpp
@@ -49,5 +76,5 @@ index 05ccc63..8075065 100644
  
  #define CV_TEST_INIT \
 -- 
-2.7.4
+2.9.4
 
-- 
2.9.4


