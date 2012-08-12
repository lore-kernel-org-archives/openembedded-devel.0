Received: from mail-wg0-f49.google.com ([74.125.82.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1T0fl8-00035S-LX
	for openembedded-devel@lists.linuxtogo.org;
	Sun, 12 Aug 2012 23:31:42 +0200
Received: by wgbez12 with SMTP id ez12so2805432wgb.6
	for <openembedded-devel@lists.linuxtogo.org>;
	Sun, 12 Aug 2012 14:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=AInGZSSCMxe8y5OxF4JXU2lbISCm62wMaT4gVYXyKbY=;
	b=yR+PZEbyo8PhUCqABiSBJSU9AbChfatU5TUODb1TvpMo7/Vvqc6YTDA/YOwUONdSQ6
	I3f3hn4MEvToPuL6YbCH4PxTgl1kZSZus4MyUBbP8xLyqXW4wf8UKCB211UsIVPexsDT
	cPci9mSIpQg7x0c0UiP8sDTsqlPedRczJdtbXwhQJ6C30gVYY9Be6hUCEkVYP++lgJ56
	sgy+6ZVDBO/QvSyjdl0F5/iiAeRYa+QTeZbBnvT2tQ4gfPs47s3ZHdD1EzAiobqUQrc8
	L5ZQ9SoG4pZbJbouUp4qaPdHZoatFLj4e2G/bNPc3m46IDlXagHrrKqPMYMoTy128An9
	u/kA==
Received: by 10.216.242.204 with SMTP id i54mr5445036wer.114.1344806390199;
	Sun, 12 Aug 2012 14:19:50 -0700 (PDT)
Received: from mizar.localdomain
	(host84-251-dynamic.9-87-r.retail.telecomitalia.it. [87.9.251.84])
	by mx.google.com with ESMTPS id ef5sm18324104wib.3.2012.08.12.14.19.48
	(version=SSLv3 cipher=OTHER); Sun, 12 Aug 2012 14:19:49 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.linuxtogo.org
Date: Sun, 12 Aug 2012 23:19:44 +0200
Message-Id: <1344806385-16888-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][meta-initramfs][PATCH 1/2] klibc: fix runtime dependencies for shared utils
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 Aug 2012 21:31:42 -0000

* and remove bogus dependencies for the static utils
* introduced by do_split_packages
* bump INC_PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-devtools/klibc/klibc-utils.inc         |   42 +++++++++++++++++++-
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |    4 +-
 2 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
index 8ce3d77..c7e36e3 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
@@ -58,13 +58,51 @@ do_install_append() {
         ln -s gzip ${D}${base_bindir}/zcat
 }
 
+RDEPENDS_klibc-utils-cat = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-chroot = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-cpio = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-dd = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-dmesg = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-false = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-fstype = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-gzip = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-halt = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-ipconfig = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-kill = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-kinit.shared = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-ln = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-losetup = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-ls = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-minips = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-mkdir = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-mkfifo = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-mknod = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-modprobe = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-mount = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-mv = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-nfsmount = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-nuke = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-pivot-root = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-poweroff = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-readlink = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-reboot = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-resume = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-run-init = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-sh.shared = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-sleep = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-sync = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-true = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-umount = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-uname = "${THIS_LIBKLIBC}"
+RDEPENDS_klibc-utils-wc = "${THIS_LIBKLIBC}"
+
 PACKAGES_DYNAMIC = "${KLIBC_UTILS_PKGNAME}-*"
 
 python populate_packages_prepend () {
 
     base_bin_dir = bb.data.expand('${base_bindir}', d)
-    do_split_packages(d, base_bin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', allow_links=True, allow_dirs=True)
+    do_split_packages(d, base_bin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='', allow_links=True, allow_dirs=True)
 
     base_sbin_dir = bb.data.expand('${base_sbindir}', d)
-    do_split_packages(d, base_sbin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', allow_dirs=True)
+    do_split_packages(d, base_sbin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='', allow_dirs=True)
 }
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 7741a58..4963a29 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8
 # debugsources.list: No such file or directory:
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
@@ -47,3 +47,5 @@ do_configure () {
 
         ln -sf "${STAGING_DIR_TARGET}${exec_prefix}" linux
 }
+
+THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
-- 
1.7.8.6



