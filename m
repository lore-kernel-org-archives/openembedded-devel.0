Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B5BCB6FF69
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 07:48:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19069210"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 May 2017 15:48:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 1F30347C7C68
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 15:48:24 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 19 May 2017 15:48:24 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 May 2017 15:48:07 +0800
Message-ID: <1495180087-23865-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 1F30347C7C68.A4C1A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH v2] opencv: Make opencv-ts create share library intead of static
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
X-List-Received-Date: Fri, 19 May 2017 07:48:29 -0000
Content-Type: text/plain

Refer to other distro,make opencv-ts create share library intead of static.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...-ts-create-share-library-intead-of-static.patch | 26 +++++++++++
 .../opencv/0001-To-fix-errors-as-following.patch   | 53 ++++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.2.bb       |  2 +
 3 files changed, 81 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Make-opencv-ts-create-share-library-intead-of-static.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-following.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Make-opencv-ts-create-share-library-intead-of-static.patch b/meta-oe/recipes-support/opencv/opencv/0001-Make-opencv-ts-create-share-library-intead-of-static.patch
new file mode 100644
index 0000000..05ec41f
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Make-opencv-ts-create-share-library-intead-of-static.patch
@@ -0,0 +1,26 @@
+From 49d1f7c40a5d097f23671318045ac54bc07846cf Mon Sep 17 00:00:00 2001
+From: Bian Naimeng <biannm@cn.fujitsu.com>
+Date: Wed, 19 Apr 2017 03:11:37 +0900
+Subject: [PATCH] Make opencv-ts create share library intead of static.
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ modules/ts/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/ts/CMakeLists.txt b/modules/ts/CMakeLists.txt
+index bb56da2..7bb4ce9 100644
+--- a/modules/ts/CMakeLists.txt
++++ b/modules/ts/CMakeLists.txt
+@@ -4,7 +4,7 @@ if(IOS)
+   ocv_module_disable(ts)
+ endif()
+ 
+-set(OPENCV_MODULE_TYPE STATIC)
++#set(OPENCV_MODULE_TYPE STATIC)
+ set(OPENCV_MODULE_IS_PART_OF_WORLD FALSE)
+ 
+ ocv_warnings_disable(CMAKE_CXX_FLAGS -Wundef)
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-following.patch b/meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-following.patch
new file mode 100644
index 0000000..820ab81
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-following.patch
@@ -0,0 +1,53 @@
+From db1d9cc82b68f6593360d66ef40cb6b0fc377e6e Mon Sep 17 00:00:00 2001
+From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+Date: Fri, 19 May 2017 04:27:50 +0900
+Subject: [PATCH] To fix errors as following:
+
+"test_main.cpp:45: undefined reference to `parseCustomOptions(int, char**)'"
+"perf_abs.cpp:13: undefined reference to `cvtest::param_seed'"
+"test_superres.cpp:270: undefined reference to `checkIppStatus()'"
+
+Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+---
+ modules/ts/include/opencv2/ts.hpp        | 4 ++--
+ modules/ts/include/opencv2/ts/ts_ext.hpp | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/modules/ts/include/opencv2/ts.hpp b/modules/ts/include/opencv2/ts.hpp
+index c573905..7ff6cc1 100644
+--- a/modules/ts/include/opencv2/ts.hpp
++++ b/modules/ts/include/opencv2/ts.hpp
+@@ -539,7 +539,7 @@ protected:
+     }
+ };
+ 
+-extern uint64 param_seed;
++CV_EXPORTS extern uint64 param_seed;
+ 
+ struct CV_EXPORTS DefaultRngAuto
+ {
+@@ -602,7 +602,7 @@ void dumpOpenCLDevice();
+ #define TEST_DUMP_OCL_INFO
+ #endif
+ 
+-void parseCustomOptions(int argc, char **argv);
++CV_EXPORTS void parseCustomOptions(int argc, char **argv);
+ 
+ #define CV_TEST_MAIN(resourcesubdir, ...) \
+ int main(int argc, char **argv) \
+diff --git a/modules/ts/include/opencv2/ts/ts_ext.hpp b/modules/ts/include/opencv2/ts/ts_ext.hpp
+index 05ccc63..8075065 100644
+--- a/modules/ts/include/opencv2/ts/ts_ext.hpp
++++ b/modules/ts/include/opencv2/ts/ts_ext.hpp
+@@ -9,7 +9,7 @@
+ #define OPENCV_TS_EXT_HPP
+ 
+ namespace cvtest {
+-void checkIppStatus();
++CV_EXPORTS void checkIppStatus();
+ }
+ 
+ #define CV_TEST_INIT \
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/opencv/opencv_3.2.bb b/meta-oe/recipes-support/opencv/opencv_3.2.bb
index 98b6b06..b6db37d 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
@@ -29,6 +29,8 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     file://useoeprotobuf.patch;patchdir=../contrib/ \
     file://0001-Revert-cuda-fix-fp16-compilation.patch \
     file://0002-Revert-check-FP16-build-condition-correctly.patch \
+    file://0001-Make-opencv-ts-create-share-library-intead-of-static.patch \
+    file://0001-To-fix-errors-as-following.patch \
 "
 
 PV = "3.2+git${SRCPV}"
-- 
2.7.4




