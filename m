Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E28A86007A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 09:28:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18734794"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 May 2017 17:28:06 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0FFF647C6114
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 17:28:07 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 11 May 2017 17:28:07 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 May 2017 17:27:48 +0800
Message-ID: <1494494868-44138-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 0FFF647C6114.A96CE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] opencv: Make opencv-ts create share library intead of static
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
X-List-Received-Date: Thu, 11 May 2017 09:28:11 -0000
Content-Type: text/plain

Refer to other distro,make opencv-ts create share library intead of static.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...-ts-create-share-library-intead-of-static.patch | 26 +++++++++++++
 .../opencv/0001-To-fix-errors-as-following.patch   | 43 ++++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.1.bb       |  2 +
 3 files changed, 71 insertions(+)
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
index 0000000..40c4ad5
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-following.patch
@@ -0,0 +1,43 @@
+From 7eb2f7ea2fd1ede1d0ee0fafb660c8a62ac88127 Mon Sep 17 00:00:00 2001
+From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+Date: Thu, 11 May 2017 16:13:45 +0900
+Subject: [PATCH] To fix errors as following:
+
+"test_main.cpp:45: undefined reference to `parseCustomOptions(int, char**)'"
+"test_superres.cpp:270: undefined reference to `checkIppStatus()'"
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ modules/ts/include/opencv2/ts.hpp        | 2 +-
+ modules/ts/include/opencv2/ts/ts_ext.hpp | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/modules/ts/include/opencv2/ts.hpp b/modules/ts/include/opencv2/ts.hpp
+index e809f6b..d181e24 100644
+--- a/modules/ts/include/opencv2/ts.hpp
++++ b/modules/ts/include/opencv2/ts.hpp
+@@ -567,7 +567,7 @@ void dumpOpenCLDevice();
+ #define TEST_DUMP_OCL_INFO
+ #endif
+ 
+-void parseCustomOptions(int argc, char **argv);
++CV_EXPORTS void parseCustomOptions(int argc, char **argv);
+ 
+ #define CV_TEST_MAIN(resourcesubdir, ...) \
+ int main(int argc, char **argv) \
+diff --git a/modules/ts/include/opencv2/ts/ts_ext.hpp b/modules/ts/include/opencv2/ts/ts_ext.hpp
+index 08039ba..8e72372 100644
+--- a/modules/ts/include/opencv2/ts/ts_ext.hpp
++++ b/modules/ts/include/opencv2/ts/ts_ext.hpp
+@@ -8,7 +8,7 @@
+ #ifndef __OPENCV_TS_EXT_HPP__
+ #define __OPENCV_TS_EXT_HPP__
+ 
+-void checkIppStatus();
++CV_EXPORTS void checkIppStatus();
+ 
+ #undef TEST
+ #define TEST(test_case_name, test_name) \
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 1bbb965..52d44ba 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -24,6 +24,8 @@ SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
     file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
     file://fixgcc60.patch \
     file://fixpkgconfig.patch \
+    file://0001-Make-opencv-ts-create-share-library-intead-of-static.patch \
+    file://0001-To-fix-errors-as-following.patch \
 "
 
 PV = "3.1+git${SRCPV}"
-- 
2.7.4




