Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5C54E7887D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vANC9olt013318
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Nov 2017 04:09:50 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:09:48 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 23 Nov 2017 07:09:14 -0500
Message-ID: <cd35f1e094bfa14a2dc34ee1abc501e0e1350e64.1511437794.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1511437793.git.hongxu.jia@windriver.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/15] meta-installer: add recipe core-image-anaconda
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
X-List-Received-Date: Thu, 23 Nov 2017 12:09:49 -0000
Content-Type: text/plain

In the host build, it generates a live iso image which runs anaconda
to do the installation.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../images/core-image-anaconda.bb                  | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-installer/recipes-installer/images/core-image-anaconda.bb

diff --git a/meta-installer/recipes-installer/images/core-image-anaconda.bb b/meta-installer/recipes-installer/images/core-image-anaconda.bb
new file mode 100644
index 0000000..9f50ca3
--- /dev/null
+++ b/meta-installer/recipes-installer/images/core-image-anaconda.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "An image with Anaconda to do installation."
+
+LICENSE = "MIT"
+
+# Support installation from initrd boot
+do_image_complete[depends] += "${PN}-initramfs:do_image_complete"
+
+DEPENDS += "isomd5sum-native \
+"
+
+CUSTOMIZE_LOGOS ??= "yocto-compat-logos"
+
+# We override what gets set in core-image.bbclass
+IMAGE_INSTALL = "\
+    packagegroup-core-boot \
+    packagegroup-core-ssh-openssh \
+    ${@['', 'packagegroup-installer-x11-anaconda'][bool(d.getVar('XSERVER', True))]} \
+    python3-anaconda \
+    anaconda-init \
+    kernel-modules \
+    ${CUSTOMIZE_LOGOS} \
+    dhcp-client \
+    ldd \
+    "
+IMAGE_LINGUAS = "en-us en-gb"
+
+# Generate live image
+IMAGE_FSTYPES_remove = "wic wic.bmap"
+IMAGE_FSTYPES_append = " live"
+NOHDD = "1"
+
+IMAGE_ROOTFS_EXTRA_SPACE =" + 102400"
+
+inherit core-image anaconda_image
-- 
2.8.1


