Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TR9iK-0003G4-Oh
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 00:46:16 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so738102wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 15:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=COqfnqk1UMCXUG3SuQIPcofk/1De3DpC719EK/3GJek=;
	b=rgL2nWZUKJZguWH/83hBs5UG2d8UaLuk+40sjO8NISQjK/wP/ImFICK6NIslMxFrJB
	Sr2xD7mrR1+pMUQGMeTh1EPGeNRQ/SXS8P16YFkp6rwnj9xi1/5zaJNjVzOYE8rRVOfp
	bbt+zcCG4G08iN/rEyQfiBZ77b21X7YqNWqtcopz82lADr/y5BvV3oDdhrbKdqVWp+V5
	i7yXInp1J4LL1LhsOSBt8QTWpfzGlOs9T5ivTi1V2LIclrnr3pvM7+PIzYInFEMX5KLO
	PPahnFb8WVwloc1KXXfCQbTR61K7K73LyEIdm+7NtIQ/18xfYSIVVdGX7V8ab6pJ0tUf
	LiMQ==
Received: by 10.180.94.102 with SMTP id db6mr8966620wib.20.1351117968849;
	Wed, 24 Oct 2012 15:32:48 -0700 (PDT)
Received: from mizar.localdomain
	(host16-250-dynamic.2-87-r.retail.telecomitalia.it. [87.2.250.16])
	by mx.google.com with ESMTPS id f1sm6672552wiy.2.2012.10.24.15.32.46
	(version=SSLv3 cipher=OTHER); Wed, 24 Oct 2012 15:32:47 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 00:31:30 +0200
Message-Id: <1351117890-13744-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-initramfs][PATCH] klibc: refactor runtime deps for shared utils
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
X-List-Received-Date: Wed, 24 Oct 2012 22:46:16 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-devtools/klibc/klibc-utils.inc         |   43 ++------------------
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |    2 +-
 2 files changed, 5 insertions(+), 40 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
index 2190ca2..04bc91a 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
@@ -1,8 +1,7 @@
 KLIBC_UTILS_VARIANT ?= "shared"
 KLIBC_UTILS_PKGNAME ?= "klibc-utils"
 
-# modprobe and losetup go to ${base_sbindir}
-# even though debian packages all in /usr/lib/klibc/bin
+# losetup goes in ${base_sbindir}
 
 do_install_append() {
 
@@ -56,49 +55,15 @@ do_install_append() {
         ln -s gzip ${D}${base_bindir}/zcat
 }
 
-RDEPENDS_klibc-utils-cat = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-chroot = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-cpio = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-dd = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-dmesg = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-false = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-fstype = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-gzip = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-halt = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-ipconfig = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-kill = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-kinit.shared = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-ln = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-losetup = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-ls = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-minips = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-mkdir = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-mkfifo = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-mknod = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-mount = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-mv = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-nfsmount = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-nuke = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-pivot-root = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-poweroff = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-readlink = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-reboot = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-resume = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-run-init = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-sh.shared = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-sleep = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-sync = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-true = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-umount = "${THIS_LIBKLIBC}"
-RDEPENDS_klibc-utils-uname = "${THIS_LIBKLIBC}"
+EXTRA_KLIBC_DEPS = '${@base_conditional("KLIBC_UTILS_VARIANT", "shared", "${THIS_LIBKLIBC}", "", d)}'
 
 PACKAGES_DYNAMIC += "^${KLIBC_UTILS_PKGNAME}-.*"
 
 python populate_packages_prepend () {
 
     base_bin_dir = bb.data.expand('${base_bindir}', d)
-    do_split_packages(d, base_bin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='', allow_links=True, allow_dirs=True)
+    do_split_packages(d, base_bin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='${EXTRA_KLIBC_DEPS}', allow_links=True, allow_dirs=True)
 
     base_sbin_dir = bb.data.expand('${base_sbindir}', d)
-    do_split_packages(d, base_sbin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='', allow_dirs=True)
+    do_split_packages(d, base_sbin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='${EXTRA_KLIBC_DEPS}', allow_dirs=True)
 }
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index b1f531a..07b8e1a 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8
 # debugsources.list: No such file or directory:
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
-- 
1.7.8.6



