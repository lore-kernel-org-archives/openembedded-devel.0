Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6807DF3D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 07:24:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,452,1549900800"; d="scan'208";a="62366142"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 May 2019 15:24:10 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 112DE4CDB74D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 15:24:06 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 10 May 2019 15:24:10 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1555736021-11973-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 112DE4CDB74D.AFCCC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] mozjs: Make mozjs support arm32BE.
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
Date: Fri, 10 May 2019 07:24:11 -0000
X-Original-Date: Sat, 20 Apr 2019 12:53:41 +0800
X-List-Received-Date: Fri, 10 May 2019 07:24:11 -0000
Content-Type: text/plain

Fixed a build error on arm32BE.

Upstream-Status: Pending

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../mozjs/0001-To-fix-build-error-on-arm32BE.patch | 28 ++++++++++++++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb     |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-To-fix-build-error-on-arm32BE.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-To-fix-build-error-on-arm32BE.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-To-fix-build-error-on-arm32BE.patch
new file mode 100644
index 0000000..3bbd10a
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-To-fix-build-error-on-arm32BE.patch
@@ -0,0 +1,28 @@
+From 9afb0e4d3b9209ea198052cea0401bef7ee25ad8 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Thu, 9 May 2019 12:23:40 +0900
+Subject: [PATCH] To fix build error on arm32BE.
+
+error: #error Target architecture was not detected as supported by Double-Conversion.
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ mfbt/double-conversion/utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mfbt/double-conversion/utils.h b/mfbt/double-conversion/utils.h
+index 4f37218..93575cb 100644
+--- a/mfbt/double-conversion/utils.h
++++ b/mfbt/double-conversion/utils.h
+@@ -53,7 +53,7 @@
+ // disabled.)
+ // On Linux,x86 89255e-22 != Div_double(89255.0/1e22)
+ #if defined(_M_X64) || defined(__x86_64__) || \
+-    defined(__ARMEL__) || defined(__avr32__) || \
++    defined(__arm__) || defined(__avr32__) || \
+     defined(__hppa__) || defined(__ia64__) || \
+     defined(__mips__) || \
+     defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
index 92d1572..5e67eee 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mozjs52/mozjs52_52.9.1.o
            file://0001-mozjs-fix-coredump-caused-by-getenv.patch \
            file://format-overflow.patch \
            file://JS_PUBLIC_API.patch \
+           file://0001-To-fix-build-error-on-arm32BE.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0006-support-musl.patch \
-- 
2.7.4




