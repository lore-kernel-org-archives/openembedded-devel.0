Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0DC60557
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2017 05:37:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14792370"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jan 2017 13:36:59 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0A0D547AD1FB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2017 13:36:55 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 16 Jan 2017 13:37:00 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Jan 2017 13:36:45 +0800
Message-ID: <1484545005-24745-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 0A0D547AD1FB.A6173
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-greenlet: 0.4.9 -> 0.4.11
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
X-List-Received-Date: Mon, 16 Jan 2017 05:37:08 -0000
Content-Type: text/plain

1) Upgrade python-greenlet from 0.4.9 to 0.4.11.
2) Delete 0001-Use-x-instead-of-r-for-aarch64-register-names.patch, since it is integrated upstream.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...x-instead-of-r-for-aarch64-register-names.patch | 38 ----------------------
 ...greenlet_0.4.9.bb => python-greenlet_0.4.11.bb} |  7 ++--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-greenlet/0001-Use-x-instead-of-r-for-aarch64-register-names.patch
 rename meta-python/recipes-devtools/python/{python-greenlet_0.4.9.bb => python-greenlet_0.4.11.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python-greenlet/0001-Use-x-instead-of-r-for-aarch64-register-names.patch b/meta-python/recipes-devtools/python/python-greenlet/0001-Use-x-instead-of-r-for-aarch64-register-names.patch
deleted file mode 100644
index 4868bf3..0000000
--- a/meta-python/recipes-devtools/python/python-greenlet/0001-Use-x-instead-of-r-for-aarch64-register-names.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b53fb3bf861f895034452e984f2accb8bebbd3c9 Mon Sep 17 00:00:00 2001
-From: Fredrik Fornwall <fredrik@fornwall.net>
-Date: Wed, 7 Sep 2016 09:25:54 +0200
-Subject: [PATCH] Use x instead of r for aarch64 register names
-
-This fixes clang compatibility.
----
-Upstream-Status: Backport
-
- platform/switch_aarch64_gcc.h | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/platform/switch_aarch64_gcc.h b/platform/switch_aarch64_gcc.h
-index 2fbc569..0b9d556 100644
---- a/platform/switch_aarch64_gcc.h
-+++ b/platform/switch_aarch64_gcc.h
-@@ -2,6 +2,7 @@
-  * this is the internal transfer function.
-  *
-  * HISTORY
-+ * 07-Sep-16 Add clang support using x register naming. Fredrik Fornwall
-  * 13-Apr-13 Add support for strange GCC caller-save decisions
-  * 08-Apr-13 File creation. Michael Matz
-  *
-@@ -15,8 +16,8 @@
- 
- #ifdef SLP_EVAL
- #define STACK_MAGIC 0
--#define REGS_TO_SAVE "r19", "r20", "r21", "r22", "r23", "r24", "r25", "r26", \
--                     "r27", "r28", "r30" /* aka lr */, \
-+#define REGS_TO_SAVE "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26", \
-+                     "x27", "x28", "x30" /* aka lr */, \
-                      "v8", "v9", "v10", "v11", \
-                      "v12", "v13", "v14", "v15"
- 
--- 
-1.9.1
-
diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.11.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb
rename to meta-python/recipes-devtools/python/python-greenlet_0.4.11.bb
index 4c0faf5..ca4786f 100644
--- a/meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb
+++ b/meta-python/recipes-devtools/python/python-greenlet_0.4.11.bb
@@ -3,11 +3,8 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI += "\
-           file://0001-Use-x-instead-of-r-for-aarch64-register-names.patch \
-           "
-SRC_URI[md5sum] = "c6659cdb2a5e591723e629d2eef22e82"
-SRC_URI[sha256sum] = "58b2f3a2e7075c655616bf95e82868db4980f3bb6661db70ad02a51e4ddd2252"
+SRC_URI[md5sum] = "774808f543e130621700863bc20a21fe"
+SRC_URI[sha256sum] = "e46510543912135b2663c2fc4e2867497579466d82184710b84fb718b31cc95d"
 
 PYPI_PACKAGE_EXT = "zip"
 inherit pypi distutils
-- 
2.7.4




