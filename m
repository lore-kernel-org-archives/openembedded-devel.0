Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9835678864
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vANC9qTj025985
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Nov 2017 04:09:52 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:09:51 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 23 Nov 2017 07:09:15 -0500
Message-ID: <220aa3f948eff98d2bf4bf377a5e66b8b963cd2d.1511437794.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1511437793.git.hongxu.jia@windriver.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/15] meta-installer: add recipe core-image-anaconda-initramfs
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
X-List-Received-Date: Thu, 23 Nov 2017 12:09:51 -0000
Content-Type: text/plain

The initramfs image is used for PXE install (net boot installation)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../images/core-image-anaconda-initramfs.bb        | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-installer/recipes-installer/images/core-image-anaconda-initramfs.bb

diff --git a/meta-installer/recipes-installer/images/core-image-anaconda-initramfs.bb b/meta-installer/recipes-installer/images/core-image-anaconda-initramfs.bb
new file mode 100644
index 0000000..8f2dc3b
--- /dev/null
+++ b/meta-installer/recipes-installer/images/core-image-anaconda-initramfs.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "The initramfs contains anaconda installer, which supports \
+PXE install (net boot installation)"
+
+CUSTOMIZE_LOGOS ??= "yocto-compat-logos"
+
+IMAGE_INSTALL = "\
+    initramfs-live-boot \
+    initramfs-live-install \
+    initramfs-live-install-efi \
+    busybox udev ldd \
+    initscripts \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit', '', d)} \
+    sysvinit-inittab \
+    base-passwd \
+    kernel-modules \
+    ${CUSTOMIZE_LOGOS} \
+    python3-anaconda \
+    anaconda-init \
+    ${@['', 'packagegroup-installer-x11-anaconda'][bool(d.getVar('XSERVER', True))]} \
+    packagegroup-core-boot \
+    packagegroup-core-ssh-openssh \
+"
+
+IMAGE_LINGUAS = "en-us en-gb"
+
+LICENSE = "MIT"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+inherit core-image anaconda_image
+
+IMAGE_ROOTFS_SIZE = "8192"
+INITRAMFS_MAXSIZE ?= "1048576"
+
-- 
2.8.1


