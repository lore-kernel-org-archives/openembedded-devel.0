Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 73486605FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 21:06:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Apr 2016 14:06:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,485,1455004800"; d="scan'208";a="932700571"
Received: from unknown (HELO yocto-dev86.jf.intel.com) ([10.7.198.63])
	by orsmga001.jf.intel.com with ESMTP; 14 Apr 2016 14:06:22 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2016 14:06:51 -0700
Message-Id: <1460668011-18502-1-git-send-email-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.0
Subject: [meta-oe][PATCH] zero out the rootfs_extra_space in initramfs images
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
X-List-Received-Date: Thu, 14 Apr 2016 21:06:25 -0000

Setting IMAGE_ROOTFS_EXTRA_SPACE impacts the initramfs images, results
in an error about INITRAMFS_MAXSIZE.

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta-initramfs/recipes-bsp/images/initramfs-debug-image.bb     | 1 +
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-debug-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-debug-image.bb
index 8e87c19..be7350a 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-debug-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-debug-image.bb
@@ -17,5 +17,6 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 inherit core-image
 
 IMAGE_ROOTFS_SIZE = "8192"
+IMAGE_ROOTFS_EXTRA_SPACE = "0"
 
 BAD_RECOMMENDATIONS += "busybox-syslog"
diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
index 35eb245..45ff50d 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -19,4 +19,6 @@ IMAGE_LINGUAS = ""
 FEED_DEPLOYDIR_BASE_URI = ""
 LDCONFIGDEPEND = ""
 
+IMAGE_ROOTFS_EXTRA_SPACE = "0"
+
 inherit image
-- 
2.8.0


