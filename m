Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TU03a-0005D3-4n
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Nov 2012 20:03:58 +0100
Received: by mail-ea0-f175.google.com with SMTP id c1so1084263eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Nov 2012 11:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=2epLFdsV55UEx3WghcFKpXELcPexccPhAem0LhLvdCU=;
	b=E3kqBpk85/UL+rNMZxDwVW06osy53nt6QNu6xbEClvNl0wA5Xp1AiRylxkz5g+oLm+
	3JHCRmX+JUEUitO82kRbZ07OszdGyn7GQ9Y9Bw96eYDrN7j6FUgeI5plUOqwZGS+NK1R
	NLWkzujvCXAsXRc+6+o3bQJUZQ7kYDH16cvIL33nLq0zCRVCQyIICH38NqnEF3s4xfkz
	JaxLzcpWaItslvhVCA/sp+SQCEkxDNDprwhTOhU4zJGGVRlS6224Lj64MrJHOIguX1SB
	BQG3QqNfu54vSSscWNerK44KtxUl9GuYg7O221geQx+WSsA32G19uBd9ud5WpSG7u8tC
	AW4Q==
Received: by 10.14.173.67 with SMTP id u43mr100924252eel.27.1351795819809;
	Thu, 01 Nov 2012 11:50:19 -0700 (PDT)
Received: from mizar.localdomain
	(host69-225-dynamic.58-82-r.retail.telecomitalia.it. [82.58.225.69])
	by mx.google.com with ESMTPS id o47sm16661386eem.11.2012.11.01.11.50.17
	(version=SSLv3 cipher=OTHER); Thu, 01 Nov 2012 11:50:18 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Nov 2012 19:50:11 +0100
Message-Id: <1351795811-9291-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1351117890-13744-1-git-send-email-andrea.adami@gmail.com>
References: <1351117890-13744-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH v2] klibc: refactor runtime deps for shared utils
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
X-List-Received-Date: Thu, 01 Nov 2012 19:03:58 -0000

 rebased after d.expand / bb.data.expand change

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-devtools/klibc/klibc-utils.inc         |   43 ++------------------
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |    2 +-
 2 files changed, 5 insertions(+), 40 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
index 16cba89..cdcaafa 100644
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
 
     base_bin_dir = d.expand('${base_bindir}')
-    do_split_packages(d, base_bin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='', allow_links=True, allow_dirs=True)
+    do_split_packages(d, base_bin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='${EXTRA_KLIBC_DEPS}', allow_links=True, allow_dirs=True)
 
     base_sbin_dir = d.expand('${base_sbindir}')
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



