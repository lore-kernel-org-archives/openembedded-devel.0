Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6042F7597C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 07:51:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H7pl8J015647
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 00:51:48 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Fri, 17 Jul 2015 00:51:45 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jul 2015 15:50:10 +0800
Message-ID: <1437119410-3462-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [meta-oe][PATCH] dracut: upgrade from 038 to 043
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
X-List-Received-Date: Fri, 17 Jul 2015 07:51:50 -0000
Content-Type: text/plain

Upgrade dracut from 038 to 043. Update SRC_URI by replacing git with tar
ball. And update bb file name at same time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-devtools/dracut/dracut_043.bb          | 53 +++++++++++++++++++++
 .../recipes-devtools/dracut/dracut_git.bb          | 55 ----------------------
 2 files changed, 53 insertions(+), 55 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut_043.bb
 delete mode 100644 meta-initramfs/recipes-devtools/dracut/dracut_git.bb

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_043.bb b/meta-initramfs/recipes-devtools/dracut/dracut_043.bb
new file mode 100644
index 0000000..22c6bae
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_043.bb
@@ -0,0 +1,53 @@
+SUMMARY = "Initramfs generator using udev"
+DESCRIPTION = "Dracut is an event driven initramfs infrastructure. dracut (the tool) is used to create an initramfs image by copying tools and files from an installed system and combining it with the dracut framework, usually found in /usr/lib/dracut/modules.d."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PE = "1"
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/dracut/dracut-043.tar.xz"
+
+SRC_URI[md5sum] = "85de75ddf00962e7bb0ae387f05794e5"
+SRC_URI[sha256sum] = "1484b558ed20330125aa04dcccab84da15c5689e19068285aa011f7177889cd1"
+
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+EXTRA_OECONF = "--prefix=${prefix} \
+                --libdir=${libdir} \
+                --datadir=${datadir} \
+                --sysconfdir=${sysconfdir} \
+                --sbindir=${sbindir} \
+                --disable-documentation \
+                --bindir=${bindir} \
+                --includedir=${includedir} \
+                --localstatedir=${localstatedir} \
+                --systemdsystemunitdir=${systemd_unitdir}/system"
+
+do_configure() {
+    ./configure ${EXTRA_OECONF}
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+PACKAGES =+ "${PN}-bash-completion"
+
+FILES_${PN}-bash-completion = "${datadir}/bash-completion"
+
+FILES_${PN} += " ${libdir}/kernel \
+                ${systemd_unitdir} \
+               "
+CONFFILES_${PN} += "${sysconfdir}/dracut.conf"
+
+RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid util-linux-getopt bash ldd"
+RDEPENDS_${PN}-bash-completion = "bash-completion"
+
+# This could be optimized a bit, but let's avoid non-booting systems :)
+RRECOMMENDS_${PN} = " \
+                     kernel-modules \
+                     busybox \
+                     coreutils \ 
+                    "
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
deleted file mode 100644
index 77c137c..0000000
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-SUMMARY = "Initramfs generator using udev"
-DESCRIPTION = "Dracut is an event driven initramfs infrastructure. dracut (the tool) is used to create an initramfs image by copying tools and files from an installed system and combining it with the dracut framework, usually found in /usr/lib/dracut/modules.d."
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-PE = "1"
-PV = "038"
-
-# v038 tag
-SRCREV = "267a109a81715c8957f14659593deb7b6255d40e"
-SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
-
-S = "${WORKDIR}/git"
-
-inherit distro_features_check
-REQUIRED_DISTRO_FEATURES = "systemd"
-
-EXTRA_OECONF = "--prefix=${prefix} \
-                --libdir=${libdir} \
-                --datadir=${datadir} \
-                --sysconfdir=${sysconfdir} \
-                --sbindir=${sbindir} \
-                --disable-documentation \
-                --bindir=${bindir} \
-                --includedir=${includedir} \
-                --localstatedir=${localstatedir} \
-                --systemdsystemunitdir=${systemd_unitdir}/system"
-
-do_configure() {
-    ./configure ${EXTRA_OECONF}
-}
-
-do_install() {
-    oe_runmake install DESTDIR=${D}
-}
-
-PACKAGES =+ "${PN}-bash-completion"
-
-FILES_${PN}-bash-completion = "${datadir}/bash-completion"
-
-FILES_${PN} += " ${libdir}/kernel \
-                ${systemd_unitdir} \
-               "
-CONFFILES_${PN} += "${sysconfdir}/dracut.conf"
-
-RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid util-linux-getopt bash ldd"
-RDEPENDS_${PN}-bash-completion = "bash-completion"
-
-# This could be optimized a bit, but let's avoid non-booting systems :)
-RRECOMMENDS_${PN} = " \
-                     kernel-modules \
-                     busybox \
-                     coreutils \ 
-                    "
-- 
1.9.1


