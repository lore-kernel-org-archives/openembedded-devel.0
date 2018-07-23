Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC6D753F1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 04:44:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6N4iXgZ009101
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2018 21:44:33 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 22 Jul 2018 21:44:33 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Jul 2018 12:44:21 +0800
Message-ID: <1532321061-20994-4-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532321061-20994-1-git-send-email-yi.zhao@windriver.com>
References: <1532321061-20994-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-filesystems][PATCH 2/2] xfsprogs: upgrade 4.14.0 -> 4.17.0
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
X-List-Received-Date: Mon, 23 Jul 2018 04:44:32 -0000
Content-Type: text/plain

Add a patch to disable xfs_scrub build since it is experimental.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../xfsprogs/files/disable-xfs_scrub-build.patch   | 30 ++++++++++++++++++++++
 .../{xfsprogs_4.14.0.bb => xfsprogs_4.17.0.bb}     |  5 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/disable-xfs_scrub-build.patch
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_4.14.0.bb => xfsprogs_4.17.0.bb} (91%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/disable-xfs_scrub-build.patch b/meta-filesystems/recipes-utils/xfsprogs/files/disable-xfs_scrub-build.patch
new file mode 100644
index 0000000..c07b4b5
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsprogs/files/disable-xfs_scrub-build.patch
@@ -0,0 +1,30 @@
+From 2bd40e5ed4df0b0a42beff8806b1ec5daa372c48 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 19 Jul 2018 16:49:41 +0800
+Subject: [PATCH] Disable xfs_scrub build
+
+Disable xfs_scrub build since it is experimental.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 7ddfa31..cd60319 100644
+--- a/Makefile
++++ b/Makefile
+@@ -48,7 +48,7 @@ LIBFROG_SUBDIR = libfrog
+ DLIB_SUBDIRS = libxlog libxcmd libhandle
+ LIB_SUBDIRS = libxfs $(DLIB_SUBDIRS)
+ TOOL_SUBDIRS = copy db estimate fsck growfs io logprint mkfs quota \
+-		mdrestore repair rtcp m4 man doc debian spaceman scrub
++		mdrestore repair rtcp m4 man doc debian spaceman
+ 
+ ifneq ("$(PKG_PLATFORM)","darwin")
+ TOOL_SUBDIRS += fsr
+-- 
+2.7.4
+
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.14.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.17.0.bb
similarity index 91%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.14.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.17.0.bb
index 5d76afe..06f774d 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.14.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.17.0.bb
@@ -8,9 +8,10 @@ DEPENDS = "util-linux util-linux-native"
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://remove_flags_from_build_flags.patch \
            file://0001-build-Check-for-sync_file_range-libc-function.patch \
+           file://disable-xfs_scrub-build.patch \
            "
-SRC_URI[md5sum] = "2d50e3751cc98e6c9364bc3d2297b9fd"
-SRC_URI[sha256sum] = "b1b710b268bc95d6f45eca06e1262c29eb38865a19cd4404e48ba446e043b7ec"
+SRC_URI[md5sum] = "b935b693dfac0264e232c3c4e52d5569"
+SRC_URI[sha256sum] = "f53f5169cb98cfca471ddea30092738c427ba284c5356e01b45dd1ae3b297e0d"
 
 inherit autotools-brokensep
 
-- 
2.7.4


