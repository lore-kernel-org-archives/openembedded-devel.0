Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id BE0A66D125
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Oct 2013 12:53:56 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so3043148eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Oct 2013 05:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gKHGmKaAOr2eJ5izXUGK6XLvc7cASbvQLiYiYUSk6N8=;
	b=Up0mz0akUkq7EgYruZr6yYoxZ+2FNjZ3Jd4i3V3ctz1B4JTMWBBRaAOnfabjyfzD7W
	XB/7936hwWWTUcNbpQ48692lan8N88jjBXmmB0UB6wPBF24XMBsyjj6g2ew6Yg6K/eCF
	Rltyno3z7MovDrbmxb1qsVV+zftV6BmNWUZfujXXSbRVBquiLDb1VRmm2bG8dxBPz01c
	yIL/ixGEnn5HBM8p3CT1si5o2hNHixUIgsmP7zyZiZnI/DD4fPDcjJJQcVZ22vQI6wTl
	y0D/uuTDKk9y825oWbBapBX0/bnHO8zEiu9XRToJF/scZd+RDel2vH3Rpw+YyDOjLg6P
	GNkA==
X-Received: by 10.15.54.199 with SMTP id t47mr2513731eew.46.1382273637435;
	Sun, 20 Oct 2013 05:53:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-36.net.upcbroadband.cz. [62.24.80.36])
	by mx.google.com with ESMTPSA id
	bn13sm30309908eeb.11.2013.10.20.05.53.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Oct 2013 05:53:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Oct 2013 14:53:51 +0200
Message-Id: <1382273632-10984-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [meta-oe][meta-multimedia][PATCH 1/2] llvm3.2: drop this version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Oct 2013 12:53:59 -0000

* 3.3 is used by default mesa config, 2.8 is used in meta-java, keep 2.9 as last in 2*

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch | 14 --------------
 meta-oe/recipes-core/llvm/llvm3.2_3.2.bb                |  9 ---------
 2 files changed, 23 deletions(-)
 delete mode 100644 meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch
 delete mode 100644 meta-oe/recipes-core/llvm/llvm3.2_3.2.bb

diff --git a/meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch b/meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch
deleted file mode 100644
index c3ae494..0000000
--- a/meta-oe/recipes-core/llvm/llvm3.2/arm_fenv_uclibc.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: llvm-2.9/include/llvm/Support/FEnv.h
-===================================================================
---- llvm-2.9.orig/include/llvm/Support/FEnv.h	2010-11-29 20:44:50.000000000 +0100
-+++ llvm-2.9/include/llvm/Support/FEnv.h	2011-11-18 18:42:22.580161297 +0100
-@@ -17,6 +17,9 @@
- 
- #include "llvm/Config/config.h"
- #include <cerrno>
-+
-+#undef HAVE_FENV_H
-+
- #ifdef HAVE_FENV_H
- #include <fenv.h>
- #endif
diff --git a/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb b/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
deleted file mode 100644
index 48e27b9..0000000
--- a/meta-oe/recipes-core/llvm/llvm3.2_3.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require llvm.inc
-require llvm3.inc
-
-# 3.2 is different then 2.8, 2.9 and 3.3
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=60fdd7739841f04a2ce2171a726be8f3"
-
-SRC_URI_append_libc-uclibc = " file://arm_fenv_uclibc.patch "
-SRC_URI[md5sum] = "71610289bbc819e3e15fdd562809a2d7"
-SRC_URI[sha256sum] = "125090c4d26740f1d5e9838477c931ed7d9ad70d599ba265f46f3a42cb066343"
-- 
1.8.4


