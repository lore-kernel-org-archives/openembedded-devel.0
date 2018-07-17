Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B5811784DF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 09:01:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42731875"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jul 2018 17:01:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A08174B69E01
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 17:01:25 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Fri, 27 Jul 2018 17:01:24 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Jul 2018 13:15:14 -0700
Message-ID: <1531858514-4984-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: A08174B69E01.ABCD2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-qt5][sumo][PATCH] qtwebkit: Make qtwebkit support armv BE
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
X-List-Received-Date: Fri, 27 Jul 2018 09:01:30 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../qtwebkit/0001-Fix-build-bug-for-armeb.patch    | 26 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebkit_git.bb                     |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebkit/0001-Fix-build-bug-for-armeb.patch

diff --git a/recipes-qt/qt5/qtwebkit/0001-Fix-build-bug-for-armeb.patch b/recipes-qt/qt5/qtwebkit/0001-Fix-build-bug-for-armeb.patch
new file mode 100644
index 0000000..9e15205
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit/0001-Fix-build-bug-for-armeb.patch
@@ -0,0 +1,26 @@
+From 21cd85076261611a28d5f0a68828bc2216b8e7fe Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Thu, 26 Jul 2018 17:50:32 +0900
+Subject: [PATCH] Fix build bug for armeb.
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ Source/WTF/wtf/dtoa/utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/WTF/wtf/dtoa/utils.h b/Source/WTF/wtf/dtoa/utils.h
+index 298bf4d..7f6c873 100644
+--- a/Source/WTF/wtf/dtoa/utils.h
++++ b/Source/WTF/wtf/dtoa/utils.h
+@@ -46,7 +46,7 @@
+ // disabled.)
+ // On Linux,x86 89255e-22 != Div_double(89255.0/1e22)
+ #if defined(_M_X64) || defined(__x86_64__) || \
+-defined(__ARMEL__) || \
++defined(__arm__) || \
+ defined(_MIPS_ARCH_MIPS32R2)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif CPU(MIPS) || CPU(PPC) || CPU(PPC64) || OS(WINCE) || CPU(SH4) || CPU(S390) || CPU(S390X) || CPU(IA64) || CPU(SPARC) || CPU(ALPHA) || CPU(MIPS64) || CPU(AARCH64) || CPU(HPPA)
+-- 
+2.7.4
+
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index c8e8328..025f0b1 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -31,6 +31,7 @@ ARM_INSTRUCTION_SET_armv7ve = "thumb"
 SRC_URI += "\
     file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
     file://0002-Exclude-backtrace-API-for-non-glibc-libraries.patch \
+    file://0001-Fix-build-bug-for-armeb.patch \
 "
 
 PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel \
-- 
2.7.4




