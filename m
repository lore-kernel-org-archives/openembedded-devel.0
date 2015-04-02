Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 304C365C9C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2015 15:23:04 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YdgxV-00061y-J5 from Dmitry_Eremin@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2015 08:23:05 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Thu, 2 Apr 2015 16:23:04 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Apr 2015 18:23:02 +0300
Message-ID: <1427988182-26274-2-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1427988182-26274-1-git-send-email-dmitry_eremin@mentor.com>
References: <1427988182-26274-1-git-send-email-dmitry_eremin@mentor.com>
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH 2/2] initramfs-debug-image: tiny debugging initramfs image
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
X-List-Received-Date: Thu, 02 Apr 2015 15:23:04 -0000
Content-Type: text/plain

A tiny initramfs image suitable for initial bringup of the hardware.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 .../recipes-bsp/images/initramfs-debug-image.bb     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-initramfs/recipes-bsp/images/initramfs-debug-image.bb

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-debug-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-debug-image.bb
new file mode 100644
index 0000000..8e87c19
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/images/initramfs-debug-image.bb
@@ -0,0 +1,21 @@
+# Simple initramfs image. Mostly used for live images.
+DESCRIPTION = "Small image capable of booting a device. The kernel includes \
+the Minimal RAM-based Initial Root Filesystem (initramfs), which one can use \
+to check the hardware efficiently."
+
+PACKAGE_INSTALL = "initramfs-debug busybox base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
+
+# Do not pollute the initrd image with rootfs features
+IMAGE_FEATURES = ""
+
+export IMAGE_BASENAME = "initramfs-debug-image"
+IMAGE_LINGUAS = ""
+
+LICENSE = "MIT"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+inherit core-image
+
+IMAGE_ROOTFS_SIZE = "8192"
+
+BAD_RECOMMENDATIONS += "busybox-syslog"
-- 
2.1.4


