Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 918D77F972
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 12:19:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,228,1569254400"; d="scan'208";a="77477608"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Oct 2019 20:19:58 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 8F0654CE150E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 20:12:04 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 25 Oct 2019 20:20:00 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 26 Oct 2019 04:14:21 +0800
Message-ID: <1572034461-73779-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8F0654CE150E.A5748
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems][PATCH] f2fs-tools: upgrade 1.11.0 -> 1.13.0
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
X-List-Received-Date: Fri, 25 Oct 2019 12:19:58 -0000
Content-Type: text/plain

1) Upgrade f2fs-tools from 1.11.0 to 1.13.0.

2) Remove patch 0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch as there is no AC_CHECK_FILE in configure.ac.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...emove-AC_CHECK_FILE-for-cross-compilation.patch | 32 ----------------------
 .../{f2fs-tools_1.11.0.bb => f2fs-tools_1.13.0.bb} |  5 ++--
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch
 rename meta-filesystems/recipes-utils/f2fs-tools/{f2fs-tools_1.11.0.bb => f2fs-tools_1.13.0.bb} (78%)

diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch
deleted file mode 100644
index cf844bf..0000000
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3b3c6e6376babcd9a0b0db312b0e1e3bb3ab833e Mon Sep 17 00:00:00 2001
-From: Sven Ebenfeld <sven.ebenfeld@vaillant.de>
-Date: Wed, 26 Nov 2014 10:36:44 +0100
-Subject: [PATCH] Remove AC_CHECK_FILE for cross compilation
-
----
- configure.ac | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0111e72..8c286d4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -20,14 +20,9 @@ AC_DEFINE([F2FS_MINOR_VERSION], m4_bpatsubst(f2fs_tools_version,
- 				[\([0-9]*\).\([0-9]*\)\(\w\|\W\)*], [\2]),
- 				[Minor version for f2fs-tools])
- 
--AC_CHECK_FILE(.git,
--	AC_DEFINE([F2FS_TOOLS_DATE],
--		"m4_bpatsubst(f2fs_tools_gitdate,
--		[\([0-9-]*\)\(\w\|\W\)*], [\1])",
--		[f2fs-tools date based on Git commits]),
- 	AC_DEFINE([F2FS_TOOLS_DATE],
- 		"f2fs_tools_date",
--		[f2fs-tools date based on Source releases]))
-+		[f2fs-tools date based on Source releases])
- 
- AC_CONFIG_SRCDIR([config.h.in])
- AC_CONFIG_HEADER([config.h])
--- 
-1.8.1.rc3
-
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.11.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.13.0.bb
similarity index 78%
rename from meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.11.0.bb
rename to meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.13.0.bb
index 2240049..870281b 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.11.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.13.0.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=362b4b2594cd362b874a97718faa51d3"
 # to provide libuuid
 DEPENDS = "util-linux"
 
-# v1.11.0
-SRCREV = "b98fab3666e498c2e27ad9dcda6874c9b683f06b"
+# v1.13.0
+SRCREV = "284f77f0075a16a2ad1f3b0fb89b7f64a1bc755d"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git \
-           file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch \
            file://0001-f2fs-tools-Use-srcdir-prefix-to-denote-include-path.patch \
            "
 S = "${WORKDIR}/git"
-- 
2.7.4




