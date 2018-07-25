Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7044B7893C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 01:18:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42617402"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jul 2018 09:18:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3A5BF4B66A39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 09:18:27 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Wed, 25 Jul 2018 09:18:28 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1530394717-6400-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 3A5BF4B66A39.AD930
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5][sumo][PATCH] qtbase:Added aarch64BE and arm32BE.
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
Date: Wed, 25 Jul 2018 01:18:32 -0000
X-Original-Date: Sat, 30 Jun 2018 14:38:37 -0700
X-List-Received-Date: Wed, 25 Jul 2018 01:18:32 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../qtbase/0001-Modified-to-support-armv8BE.patch  | 26 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0001-Modified-to-support-armv8BE.patch

diff --git a/recipes-qt/qt5/qtbase/0001-Modified-to-support-armv8BE.patch b/recipes-qt/qt5/qtbase/0001-Modified-to-support-armv8BE.patch
new file mode 100644
index 0000000..e10b092
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0001-Modified-to-support-armv8BE.patch
@@ -0,0 +1,26 @@
+From de9318e093cb4b5f15b17234c09afb3c03274607 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Thu, 21 Jun 2018 09:38:55 +0900
+Subject: [PATCH] Modified to support armv8BE.
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ src/3rdparty/double-conversion/include/double-conversion/utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+index 20bfd36..a140c29 100644
+--- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
++++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+@@ -65,7 +65,7 @@
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+-    defined(__AARCH64EL__)
++    defined(__AARCH64EL__) || defined(__AARCH64EB__) || defined(__ARM_PCS_VFP)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
+ #if defined(_WIN32)
+-- 
+2.7.4
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 3064b74..cf0f30d 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -31,6 +31,7 @@ SRC_URI += "\
     file://0010-linux-clang-Invert-conditional-for-defining-QT_SOCKL.patch \
     file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
     file://0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
+    file://0001-Modified-to-support-armv8BE.patch \
 "
 
 # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
-- 
2.7.4




