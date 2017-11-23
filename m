Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B8BC078715
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:09:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vANC9O01013306
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Nov 2017 04:09:24 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 23 Nov 2017 04:09:23 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>, <raj.khem@gmail.com>
Date: Thu, 23 Nov 2017 07:09:03 -0500
Message-ID: <70593ead7b9b3e1708cf8490d6b36fac2f325d5f.1511437793.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1511437793.git.hongxu.jia@windriver.com>
References: <cover.1511437793.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/15] meta-installer: add anaconda support for target build
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
X-List-Received-Date: Thu, 23 Nov 2017 12:09:24 -0000
Content-Type: text/plain

While "anaconda-support" in DISTRO_FEATURES, it enable
features of target build.

The target build requires:
- packages to help installation

- append anaconda_support_kernel to KERNEL_CLASSES which
  add dmthin.scc and crypt.scc to kernel config

- manually install grub/grub-efi for image install to workaround
  grub/grub-efi confliction

- add distro feature check of systemd and ldconfig

- add init manager checking

- add rpm packages check

- emit target image env to help installation

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../classes/anaconda_support_image.bbclass         | 40 ++++++++++++++++++++++
 meta-installer/conf/layer.conf                     |  2 ++
 .../packagegroups/packagegroup-anaconda-support.bb | 26 ++++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 meta-installer/classes/anaconda_support_image.bbclass
 create mode 100644 meta-installer/recipes-installersupport/packagegroups/packagegroup-anaconda-support.bb

diff --git a/meta-installer/classes/anaconda_support_image.bbclass b/meta-installer/classes/anaconda_support_image.bbclass
new file mode 100644
index 0000000..d11e85b
--- /dev/null
+++ b/meta-installer/classes/anaconda_support_image.bbclass
@@ -0,0 +1,40 @@
+FEATURE_PACKAGES_anaconda-support = "packagegroup-anaconda-support"
+IMAGE_FEATURES_append = " anaconda-support"
+
+# Generate filesystem images for image copy install
+IMAGE_FSTYPES += "ext4"
+
+ROOTFS_POSTPROCESS_COMMAND_append = " copy_grub_lib;"
+IMAGE_POSTPROCESS_COMMAND_append = " emit_image_env;"
+
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "systemd ldconfig"
+
+DEPENDS += "grub grub-efi"
+
+copy_grub_lib() {
+    if [ -d ${STAGING_DIR_HOST}${libdir}/grub ]; then
+        echo "Copy grub & grub-efi lib"
+        mkdir -p ${IMAGE_ROOTFS}${libdir}/grub
+        cp -rf ${STAGING_DIR_HOST}${libdir}/grub/* ${IMAGE_ROOTFS}${libdir}/grub
+    fi
+}
+
+python emit_image_env () {
+    localdata = bb.data.createCopy(d)
+
+    # Export DISTRO for installer build
+    localdata.setVarFlag("DISTRO", "unexport", "")
+
+    dumpfile = d.expand("${TOPDIR}/installersupport_${PN}")
+    with open(dumpfile , "w") as f:
+        bb.data.emit_env(f, localdata, True)
+}
+
+python __anonymous () {
+    if not bb.utils.contains("PACKAGE_CLASSES", "package_rpm", True, False, d):
+        raise bb.parse.SkipPackage('Target build requires RPM packages to be the default in PACKAGE_CLASSES.')
+
+    if d.getVar("VIRTUAL-RUNTIME_init_manager", True) != "systemd":
+        raise bb.parse.SkipPackage('Target build requires systemd, set VIRTUAL-RUNTIME_init_manager = "systemd" in local.conf')
+}
diff --git a/meta-installer/conf/layer.conf b/meta-installer/conf/layer.conf
index 2788d1c..95b5004 100644
--- a/meta-installer/conf/layer.conf
+++ b/meta-installer/conf/layer.conf
@@ -27,3 +27,5 @@ SRC_DISTRIBUTE_LICENSES += "FLTK"
 
 LAYER_PATH_meta-installer = "${LAYERDIR}"
 
+KERNEL_CLASSES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'anaconda-support', 'anaconda_support_kernel', '', d)}"
+IMAGE_CLASSES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'anaconda-support', 'anaconda_support_image', '', d)}"
diff --git a/meta-installer/recipes-installersupport/packagegroups/packagegroup-anaconda-support.bb b/meta-installer/recipes-installersupport/packagegroups/packagegroup-anaconda-support.bb
new file mode 100644
index 0000000..0617d90
--- /dev/null
+++ b/meta-installer/recipes-installersupport/packagegroups/packagegroup-anaconda-support.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Packages required by target build to help the installation"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = " \
+    sudo \
+    kernel-image \
+    grubby \
+    shadow \
+    efibootmgr \
+    kmod \
+    lvm2 \
+    util-linux-mount \
+    init-ifupdown \
+    libuser \
+    dracut \
+    cryptsetup \
+    sed \
+    grep \
+    dosfstools \
+    e2fsprogs \
+    btrfs-tools \
+"
+
-- 
2.8.1


