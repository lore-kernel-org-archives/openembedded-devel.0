Return-Path: <jonathan.yong@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5B57F77A2E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 08:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491468094; x=1523004094;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=9A+ZF6LfKNH4xP9Q7WjZYYqUR6o1O+W2bGp4mO5+Law=;
	b=vRKH4t3EFJ9LTRBF5FwRw52GhQDewOSa1pQfyVpqF0sraJ3OyFdAyik7
	esCPq0U6Y1yXiVLs2LnCfnJ3y3lEOw==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 01:41:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,283,1488873600"; d="scan'208";a="952517265"
Received: from vanguard-01.png.intel.com ([10.221.118.162])
	by orsmga003.jf.intel.com with ESMTP; 06 Apr 2017 01:41:32 -0700
From: "Yong, Jonathan" <jonathan.yong@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Apr 2017 08:41:29 +0000
Message-Id: <20170406084129.20466-2-jonathan.yong@intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170406084129.20466-1-jonathan.yong@intel.com>
References: <20170406084129.20466-1-jonathan.yong@intel.com>
Subject: [PATCH v2] f2fs-tools: Update to Version 1.8.0
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
X-List-Received-Date: Thu, 06 Apr 2017 08:41:32 -0000

Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
---
 .../0002-Fix-mkfs-out-of-tree-builds.patch         | 37 ++++++++++++++++++++++
 .../{f2fs-tools_1.4.0.bb => f2fs-tools_1.8.0.bb}   |  5 +--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
 rename meta-filesystems/recipes-utils/f2fs-tools/{f2fs-tools_1.4.0.bb => f2fs-tools_1.8.0.bb} (81%)

diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
new file mode 100644
index 0000000..9e561cb
--- /dev/null
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
@@ -0,0 +1,37 @@
+From 0731eefd389e01419f78a115e1363ed0c28cfd3a Mon Sep 17 00:00:00 2001
+From: "Yong, Jonathan" <jonathan.yong@intel.com>
+Date: Thu, 30 Mar 2017 08:03:37 +0000
+Subject: [PATCH] Fix mkfs out of tree builds
+
+Libraries are built in builddir, not srcdir, fix Makefile.am
+accordingly.
+
+Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
+Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
+
+The patch was imported from the f2fs-tools repo
+(git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git)
+commit ID 0731eefd389e01419f78a115e1363ed0c28cfd3a.
+
+Upstream-Status: Accepted, expected to be included in 1.9.0.
+
+Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
+
+---
+ mkfs/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
+index 162a0cf..0ea8b49 100644
+--- a/mkfs/Makefile.am
++++ b/mkfs/Makefile.am
+@@ -10,5 +10,5 @@ lib_LTLIBRARIES = libf2fs_format.la
+ libf2fs_format_la_SOURCES = f2fs_format_main.c f2fs_format.c f2fs_format_utils.c
+ libf2fs_format_la_CFLAGS = -DWITH_BLKDISCARD
+ libf2fs_format_la_CPPFLAGS = -I$(top_srcdir)/include
+-libf2fs_format_la_LDFLAGS = -luuid -L$(top_srcdir)/lib -lf2fs \
++libf2fs_format_la_LDFLAGS = -luuid -L$(top_builddir)/lib -lf2fs \
+ 	-version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
+-- 
+2.10.2
+
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
similarity index 81%
rename from meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
rename to meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
index 1a558e7..691cb6e 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=362b4b2594cd362b874a97718faa51d3"
 # to provide libuuid
 DEPENDS = "util-linux"
 
-SRCREV = "baac4b4e6f41ceb02511da49dd3707674f3fea21"
+SRCREV = "1e7aedf99b85d16f94d1d8ad2fcf846403bb2174"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git \
-    file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch"
+    file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch \
+    file://0002-Fix-mkfs-out-of-tree-builds.patch"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools
-- 
2.10.2


