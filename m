Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7EBE47454B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 07:25:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42636516"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jul 2018 15:25:51 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C027A4B66C27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 15:25:50 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Wed, 25 Jul 2018 15:25:48 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1530416761-7561-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: C027A4B66C27.AB739
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5][PATCH] qtbase: Make it support arm32BE.
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
Date: Wed, 25 Jul 2018 07:25:58 -0000
X-Original-Date: Sat, 30 Jun 2018 20:46:01 -0700
X-List-Received-Date: Wed, 25 Jul 2018 07:25:58 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 recipes-qt/qt5/qtbase/0001-To-enable-arm32BE.patch | 26 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0001-To-enable-arm32BE.patch

diff --git a/recipes-qt/qt5/qtbase/0001-To-enable-arm32BE.patch b/recipes-qt/qt5/qtbase/0001-To-enable-arm32BE.patch
new file mode 100644
index 0000000..b4d255f
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0001-To-enable-arm32BE.patch
@@ -0,0 +1,26 @@
+From d66780e10350ec61af8eb3450471782be40213a2 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Wed, 25 Jul 2018 13:57:09 +0900
+Subject: [PATCH] To enable arm32BE.
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ src/3rdparty/double-conversion/include/double-conversion/utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+index ca7646d..6974e04 100644
+--- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
++++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+@@ -76,7 +76,7 @@ inline void abort_noreturn() { abort(); }
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+-    defined(__AARCH64EL__) || defined(__aarch64__) || \
++    defined(__AARCH64EL__) || defined(__aarch64__) || defined(__ARM_PCS_VFP) || \
+     defined(__riscv)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__)
+-- 
+2.7.4
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 627b2f2..56b9814 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -30,6 +30,7 @@ SRC_URI += "\
     file://0011-tst_qlocale-Enable-QT_USE_FENV-only-on-glibc.patch \
     file://0012-mkspecs-common-gcc-base.conf-Use-I-instead-of-isyste.patch \
     file://0013-Upgrade-double-conversion-to-v3.0.0.patch \
+    file://0001-To-enable-arm32BE.patch \
 "
 
 # for syncqt
-- 
2.7.4




