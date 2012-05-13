Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1STigr-0007MV-2K
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 01:59:05 +0200
Received: from mizar.localdomain (87.9.251.174) by smtp206.alice.it
	(8.6.023.02) id 4F9BF1D301A33C64; Mon, 14 May 2012 01:49:08 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 May 2012 01:49:02 +0200
Message-Id: <1336952942-15164-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1336951873-22151-1-git-send-email-andrea.adami@gmail.com>
References: <1336951873-22151-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][meta-initramfs][PATCH v2] klibc: upgrade to latest git (pre 2.0)
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
X-List-Received-Date: Sun, 13 May 2012 23:59:05 -0000

* remove cherry-picked patch applied in master
* remove comments in klcc recipe
* remove slashes from paths in klibc recipe
* revert involontary oe_runmake install changes
* reset INC_PR
* v2 removes obolete cleanings wrt headers_install

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../klibc/klcc-cross_1.5.26+2.0.bb                 |   27 +
 .../recipes-devtools/klibc/klcc-cross_1.5.26.bb    |   32 -
 .../klibc/klibc-1.5.26+2.0/dash_readopt.patch      |  111 ++
 .../fstype-sane-vfat-and-jffs2-for-1.5.patch       |   74 +
 .../klibc/klibc-1.5.26+2.0/klcc_prefix.patch       |   24 +
 .../klibc/klibc-1.5.26+2.0/klibc-config-eabi.patch |   14 +
 .../klibc-1.5.26+2.0/klibc-linux-libc-dev.patch    |   23 +
 .../klibc/klibc-1.5.26+2.0/modprobe.patch          | 1984 ++++++++++++++++++++
 .../klibc/klibc-1.5.26+2.0/prefix.patch            |   14 +
 .../klibc/klibc-1.5.26+2.0/staging.patch           |  144 ++
 .../klibc/klibc-1.5.26+2.0/use-env-for-perl.patch  |   25 +
 .../klibc/klibc-1.5.26+2.0/wc.patch                |  245 +++
 .../klibc/klibc-1.5.26/dash_readopt.patch          |  111 --
 .../fstype-sane-vfat-and-jffs2-for-1.5.patch       |   74 -
 .../klibc-1.5.26/kernel_3.2__aligned_u64.patch     |   46 -
 .../klibc/klibc-1.5.26/klcc_prefix.patch           |   24 -
 .../klibc/klibc-1.5.26/klibc-config-eabi.patch     |   14 -
 .../klibc/klibc-1.5.26/klibc-linux-libc-dev.patch  |   23 -
 .../klibc/klibc-1.5.26/modprobe.patch              | 1984 --------------------
 .../klibc/klibc-1.5.26/prefix.patch                |   14 -
 .../klibc/klibc-1.5.26/staging.patch               |  144 --
 .../klibc/klibc-1.5.26/use-env-for-perl.patch      |   25 -
 .../recipes-devtools/klibc/klibc-1.5.26/wc.patch   |  245 ---
 .../klibc/klibc-static-utils_1.5.26+2.0.bb         |   16 +
 .../klibc/klibc-static-utils_1.5.26.bb             |   16 -
 .../klibc/klibc-utils_1.5.26+2.0.bb                |   16 +
 .../recipes-devtools/klibc/klibc-utils_1.5.26.bb   |   16 -
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |    9 +-
 .../recipes-devtools/klibc/klibc_1.5.26+2.0.bb     |   28 +
 .../recipes-devtools/klibc/klibc_1.5.26.bb         |   32 -
 30 files changed, 2749 insertions(+), 2805 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.26+2.0.bb
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.26.bb
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/dash_readopt.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/fstype-sane-vfat-and-jffs2-for-1.5.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/klcc_prefix.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/klibc-config-eabi.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/klibc-linux-libc-dev.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/modprobe.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/prefix.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/staging.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/use-env-for-perl.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/wc.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/dash_readopt.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/fstype-sane-vfat-and-jffs2-for-1.5.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/kernel_3.2__aligned_u64.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klcc_prefix.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klibc-config-eabi.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klibc-linux-libc-dev.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/modprobe.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/prefix.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/staging.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/use-env-for-perl.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/wc.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-static-utils_1.5.26+2.0.bb
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-static-utils_1.5.26.bb
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-utils_1.5.26+2.0.bb
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-utils_1.5.26.bb
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc_1.5.26+2.0.bb
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc_1.5.26.bb

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.26+2.0.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.26+2.0.bb
new file mode 100644
index 0000000..56456f7
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.26+2.0.bb
@@ -0,0 +1,27 @@
+PR = "${INC_PR}.0"
+
+require klibc.inc
+
+export KLCC_INST = "${STAGING_DIR_TARGET}/lib/klibc"
+
+SRC_URI += "file://klcc_prefix.patch \
+            file://use-env-for-perl.patch"
+
+DEPENDS = "klibc"
+
+FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
+
+inherit cross
+
+do_configure () {
+        :
+}
+
+do_compile() {
+        oe_runmake klcc
+}
+
+do_install() {
+        install -d ${D}${base_bindir}
+        install -m 0755 klcc/klcc ${D}${base_bindir}/${TARGET_PREFIX}klcc
+}
diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.26.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.26.bb
deleted file mode 100644
index 5a6739d..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.26.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-PR = "${INC_PR}.0"
-
-require klibc.inc
-
-export KLCC_INST = "${STAGING_DIR_TARGET}/lib/klibc"
-
-SRC_URI += "file://klcc_prefix.patch \
-            file://use-env-for-perl.patch"
-
-DEPENDS = "klibc"
-
-FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
-
-# ${TARGET_PREFIX}klcc is just a
-# perl wrapper around gcc-cross
-# so give it the same arch and path
-#PACKAGE_ARCH = "${TUNE_PKGARCH}"
-
-inherit cross
-
-do_configure () {
-        :
-}
-
-do_compile() {
-        oe_runmake klcc
-}
-
-do_install() {
-        install -d ${D}${base_bindir}
-        install -m 0755 klcc/klcc ${D}${base_bindir}/${TARGET_PREFIX}klcc
-}
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/dash_readopt.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/dash_readopt.patch
new file mode 100644
index 0000000..3be1be0
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/dash_readopt.patch
@@ -0,0 +1,111 @@
+Patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded)
+as of commit id ad67a97e8fbfb03a68088a6ca6ad87b086c88094
+Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
+Minor adjustments tracking upstream changes
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+diff -uNr klibc-1.5.22.orig//usr/dash/miscbltin.c klibc-1.5.22/usr/dash/miscbltin.c
+--- klibc-1.5.22.orig//usr/dash/miscbltin.c	2011-06-11 02:08:49.000000000 +0200
++++ klibc-1.5.22/usr/dash/miscbltin.c	2011-06-11 13:55:32.000000000 +0200
+@@ -46,6 +46,7 @@
+ #include <ctype.h>
+ #include <inttypes.h>
+ #include <time.h>		/* strtotimeval() */
++#include <termios.h>
+ 
+ #include "shell.h"
+ #include "options.h"
+@@ -149,6 +150,11 @@
+ 	int timeout;
+ 	int i;
+ 	fd_set set;
++	int n_flag = 0;
++	unsigned int nchars = 0;
++	int silent = 0;
++	struct termios tty, old_tty;
++
+ 	struct timeval ts, t0, t1, to;
+ 
+ 	ts.tv_sec = ts.tv_usec = 0;
+@@ -156,11 +162,18 @@
+ 	rflag = 0;
+ 	timeout = 0;
+ 	prompt = NULL;
+-	while ((i = nextopt("p:rt:")) != '\0') {
++	while ((i = nextopt("p:rt:n:s")) != '\0') {
+ 		switch(i) {
+ 		case 'p':
+ 			prompt = optionarg;
+ 			break;
++		case 'n':
++			nchars = strtoul(optionarg, NULL, 10);
++			n_flag = nchars; /* just a flag "nchars is nonzero" */
++			break;
++		case 's':
++			silent = 1;
++			break;
+ 		case 't':
+ 			p = strtotimeval(optionarg, &ts);
+ 			if (*p || (!ts.tv_sec && !ts.tv_usec))
+@@ -182,6 +197,24 @@
+ 	}
+ 	if (*(ap = argptr) == NULL)
+ 		sh_error("arg count");
++	if (n_flag || silent) {
++		if (tcgetattr(0, &tty) != 0) {
++			/* Not a tty */
++			n_flag = 0;
++			silent = 0;
++		} else {
++			old_tty = tty;
++			if (n_flag) {
++				tty.c_lflag &= ~ICANON;
++				tty.c_cc[VMIN] = nchars < 256 ? nchars : 255;
++			}
++			if (silent) {
++				tty.c_lflag &= ~(ECHO | ECHOK | ECHONL);
++			}
++			tcsetattr(0, TCSANOW, &tty);
++		}
++	}
++
+ 
+ 	status = 0;
+ 	if (timeout) {
+@@ -200,12 +231,14 @@
+	goto start;
+ 
+-	for (;;) {
++	do {
+ 		if (timeout) {
+ 			gettimeofday(&t1, NULL);
+ 			if (t1.tv_sec > ts.tv_sec ||
+ 			    (t1.tv_sec == ts.tv_sec &&
+ 			     t1.tv_usec >= ts.tv_usec)) {
+ 				status = 1;
++				if (n_flag)
++					tcsetattr(0, TCSANOW, &old_tty);
+ 				break;	/* Timeout! */
+ 			}
+ 
+@@ -222,6 +255,8 @@
+ 			FD_SET(0, &set);
+ 			if (select(1, &set, NULL, NULL, &to) != 1) {
+ 				status = 1;
++				if (n_flag)
++					tcsetattr(0, TCSANOW, &old_tty);
+ 				break; /* Timeout! */
+ 			}
+ 		}
+@@ -263,6 +298,9 @@
+ 			newloc = startloc - 1;
+ 		}
+-	}
++	} while (!n_flag || --nchars);
++	if (n_flag || silent)
++		tcsetattr(0, TCSANOW, &old_tty);
++
+ out:
+ 	recordregion(startloc, p - (char *)stackblock(), 0);
+ 	STACKSTRNUL(p);
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/fstype-sane-vfat-and-jffs2-for-1.5.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/fstype-sane-vfat-and-jffs2-for-1.5.patch
new file mode 100644
index 0000000..3fec98d
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/fstype-sane-vfat-and-jffs2-for-1.5.patch
@@ -0,0 +1,74 @@
+Patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded)
+as of commit id 2a98e2a2c1b55a0eb0ac09f2f9b55db2e4c23553
+Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
+Refresh and fixes as of commit id 5dbd8d611f3cb7eb8baddb17211d6077e2060fdb
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+Index: klibc-1.5.22/usr/kinit/fstype/fstype.c
+===================================================================
+--- a/usr/kinit/fstype/fstype.c
++++ b/usr/kinit/fstype/fstype.c
+@@ -20,7 +20,7 @@
+ #include <netinet/in.h>
+ #include <sys/utsname.h>
+ #include <sys/vfs.h>
+-
++#include <linux/types.h>
+ #define cpu_to_be32(x) __cpu_to_be32(x)	/* Needed by romfs_fs.h */
+ 
+ #include "btrfs.h"
+@@ -38,6 +38,12 @@
+ #include "squashfs_fs.h"
+ #include "xfs_sb.h"
+ 
++#if __BYTE_ORDER == __BIG_ENDIAN
++#include <linux/byteorder/big_endian.h>
++#else
++#include <linux/byteorder/little_endian.h>
++#endif
++
+ /*
+  * Slightly cleaned up version of jfs_superblock to
+  * avoid pulling in other kernel header files.
+@@ -60,6 +66,30 @@
+ /* Swap needs the definition of block size */
+ #include "swap_fs.h"
+ 
++static int jffs2_image(const void *buf, unsigned long long *blocks)
++{
++	const unsigned char *p = buf;
++
++	if (p[0] == 0x85 && p[1] == 0x19) {
++		*blocks=0;
++		return 1;
++	}
++	return 0;
++}
++
++static int vfat_image(const void *buf, unsigned long long *blocks)
++{
++	const char *p = buf;
++
++	if (!strncmp(p + 54, "FAT12   ", 8)
++	 || !strncmp(p + 54, "FAT16   ", 8)
++	 || !strncmp(p + 82, "FAT32   ", 8)) {
++		*blocks=0;
++		return 1;
++	}
++	return 0;
++}
++
+ static int gzip_image(const void *buf, unsigned long long *bytes)
+ {
+ 	const unsigned char *p = buf;
+@@ -495,6 +525,8 @@ static struct imagetype images[] = {
+ 	{1, "ext3", ext3_image},
+ 	{1, "ext2", ext2_image},
+ 	{1, "minix", minix_image},
++	{0, "jffs2", jffs2_image},
++	{0, "vfat", vfat_image},
+ 	{1, "nilfs2", nilfs2_image},
+ 	{2, "ocfs2", ocfs2_image},
+ 	{8, "reiserfs", reiserfs_image},
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/klcc_prefix.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/klcc_prefix.patch
new file mode 100644
index 0000000..a4a0026
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/klcc_prefix.patch
@@ -0,0 +1,24 @@
+Patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded)
+as of commit id a29bf15b9c9c0d15f96c254b2ed830e104ae3436
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+Index: klibc-1.5.19/klcc/Kbuild
+===================================================================
+--- --- klibc-1.5.19.orig/klcc/Kbuild	2010-07-07 14:07:48.000000000 +0200
++++ --- klibc-1.5.19./klcc/Kbuild	2010-08-18 23:39:23.000000000 +0200
+@@ -22,10 +22,10 @@
+ 	$(Q)echo 'EMAIN=$(KLIBCEMAIN)' >> $@
+ 	$(Q)echo 'BITSIZE=$(KLIBCBITSIZE)' >> $@
+ 	$(Q)echo 'VERSION=$(shell cat $(srctree)/usr/klibc/version)' >> $@
+-	$(Q)echo 'prefix=$(INSTALLDIR)' >> $@
+-	$(Q)echo 'bindir=$(INSTALLDIR)/$(KCROSS)bin' >> $@
+-	$(Q)echo 'libdir=$(INSTALLDIR)/$(KCROSS)lib' >> $@
+-	$(Q)echo 'includedir=$(INSTALLDIR)/$(KCROSS)include' >> $@
++	$(Q)echo 'prefix=$(KLCC_INST)' >> $@
++	$(Q)echo 'bindir=$(KLCC_INST)/$(KCROSS)bin' >> $@
++	$(Q)echo 'libdir=$(KLCC_INST)/$(KCROSS)lib' >> $@
++	$(Q)echo 'includedir=$(KLCC_INST)/$(KCROSS)include' >> $@
+ 
+ 
+ # Generate klcc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/klibc-config-eabi.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/klibc-config-eabi.patch
new file mode 100644
index 0000000..316c80a
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/klibc-config-eabi.patch
@@ -0,0 +1,14 @@
+Patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded)
+as of commit id b6764cf32ec93547531130dca364fb95e1c495f4
+Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
+
+diff -Nur klibc-1.5/defconfig klibc-1.5p/defconfig
+--- klibc-1.5/defconfig	2007-03-04 02:52:10.000000000 +0100
++++ klibc-1.5p/defconfig	2008-02-08 19:24:22.337127756 +0100
+@@ -5,4 +5,4 @@
+ CONFIG_REGPARM=y
+ # ARM options
+ # CONFIG_KLIBC_THUMB is not set
+-# CONFIG_AEABI is not set
++CONFIG_AEABI=y
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/klibc-linux-libc-dev.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/klibc-linux-libc-dev.patch
new file mode 100644
index 0000000..3c55e14
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/klibc-linux-libc-dev.patch
@@ -0,0 +1,23 @@
+commit 43adf69062254fb4f8d4d11fb5fe36a60ae25d5a
+Author: Ben Hutchings <ben@decadent.org.uk>
+Date:   Sun Mar 14 18:41:56 2010 +0000
+
+    Taken from debian "Fix klibc Debian specific build trouble"
+
+Index: klibc-2.0~rc2/scripts/Kbuild.install
+===================================================================
+--- klibc-2.0~rc2.orig/scripts/Kbuild.install	2012-02-11 18:50:21.000000000 +0000
++++ klibc-2.0~rc2/scripts/Kbuild.install	2012-02-11 19:04:52.000000000 +0000
+@@ -95,8 +95,11 @@
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
+-	$(Q)$(MAKE) -C $(KLIBCKERNELSRC) ARCH=$(KLIBCARCH) INSTALL_HDR_PATH=$(INSTALLROOT)$(INSTALLDIR)/$(KCROSS) headers_install
++	$(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
++		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
++	done
+ 	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
++	$(Q)chmod -R a+rX $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
+ 	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
+ 	$(Q)$(install-bin) $(objtree)/klcc/$(KCROSS)klcc $(INSTALLROOT)$(bindir)
+ 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/modprobe.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/modprobe.patch
new file mode 100644
index 0000000..eb2fb39
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/modprobe.patch
@@ -0,0 +1,1984 @@
+Patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded)
+as of commit id 70ae69edb02e0174db0841ae501299159c888514
+Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
+Minor adjustments tracking upstream changes
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+diff --git a/usr/utils/Kbuild b/usr/utils/Kbuild
+--- a/usr/utils/Kbuild
++++ b/usr/utils/Kbuild
+@@ -4,7 +4,7 @@
+ 
+ progs := chroot dd mkdir mkfifo mknod mount pivot_root umount
+ progs += true false sleep ln mv nuke minips cat ls losetup
+-progs += uname halt kill readlink cpio sync dmesg
++progs += uname halt kill readlink cpio sync dmesg modprobe
+ 
+ static-y := $(addprefix static/, $(progs))
+ shared-y := $(addprefix shared/, $(progs))
+@@ -58,6 +58,8 @@ static/sync-y       := sync.o
+ shared/sync-y       := sync.o
+ static/losetup-y    := losetup.o
+ shared/losetup-y    := losetup.o
++static/modprobe-y   := modprobe.o
++shared/modprobe-y   := modprobe.o
+ 
+ # Additionally linked targets
+ always := static/reboot static/poweroff shared/reboot shared/poweroff
+diff --git a/usr/utils/list.h b/usr/utils/list.h
+--- /dev/null
++++ b/usr/utils/list.h
+@@ -0,0 +1,238 @@
++/* Stolen from Linux Kernel Source's list.h -- GPL. */
++#ifndef _MODINITTOOLS_LIST_H
++#define _MODINITTOOLS_LIST_H
++
++#undef offsetof
++#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
++
++/**
++ * container_of - cast a member of a structure out to the containing structure
++ *
++ * @ptr:	the pointer to the member.
++ * @type:	the type of the container struct this is embedded in.
++ * @member:	the name of the member within the struct.
++ *
++ */
++#define container_of(ptr, type, member) ({			\
++        const typeof( ((type *)0)->member ) *__mptr = (ptr);	\
++        (type *)( (char *)__mptr - offsetof(type,member) );})
++
++/*
++ * Simple doubly linked list implementation.
++ *
++ * Some of the internal functions ("__xxx") are useful when
++ * manipulating whole lists rather than single entries, as
++ * sometimes we already know the next/prev entries and we can
++ * generate better code by using them directly rather than
++ * using the generic single-entry routines.
++ */
++
++struct list_head {
++	struct list_head *next, *prev;
++};
++
++#define LIST_HEAD_INIT(name) { &(name), &(name) }
++
++#define LIST_HEAD(name) \
++	struct list_head name = LIST_HEAD_INIT(name)
++
++#define INIT_LIST_HEAD(ptr) do { \
++	(ptr)->next = (ptr); (ptr)->prev = (ptr); \
++} while (0)
++
++/*
++ * Insert a new entry between two known consecutive entries.
++ *
++ * This is only for internal list manipulation where we know
++ * the prev/next entries already!
++ */
++static inline void __list_add(struct list_head *new,
++			      struct list_head *prev,
++			      struct list_head *next)
++{
++	next->prev = new;
++	new->next = next;
++	new->prev = prev;
++	prev->next = new;
++}
++
++/**
++ * list_add - add a new entry
++ * @new: new entry to be added
++ * @head: list head to add it after
++ *
++ * Insert a new entry after the specified head.
++ * This is good for implementing stacks.
++ */
++static inline void list_add(struct list_head *new, struct list_head *head)
++{
++	__list_add(new, head, head->next);
++}
++
++/**
++ * list_add_tail - add a new entry
++ * @new: new entry to be added
++ * @head: list head to add it before
++ *
++ * Insert a new entry before the specified head.
++ * This is useful for implementing queues.
++ */
++static inline void list_add_tail(struct list_head *new, struct list_head *head)
++{
++	__list_add(new, head->prev, head);
++}
++
++/*
++ * Delete a list entry by making the prev/next entries
++ * point to each other.
++ *
++ * This is only for internal list manipulation where we know
++ * the prev/next entries already!
++ */
++static inline void __list_del(struct list_head * prev, struct list_head * next)
++{
++	next->prev = prev;
++	prev->next = next;
++}
++
++/**
++ * list_del - deletes entry from list.
++ * @entry: the element to delete from the list.
++ * Note: list_empty on entry does not return true after this, the entry is
++ * in an undefined state.
++ */
++static inline void list_del(struct list_head *entry)
++{
++	__list_del(entry->prev, entry->next);
++}
++
++/**
++ * list_del_init - deletes entry from list and reinitialize it.
++ * @entry: the element to delete from the list.
++ */
++static inline void list_del_init(struct list_head *entry)
++{
++	__list_del(entry->prev, entry->next);
++	INIT_LIST_HEAD(entry);
++}
++
++/**
++ * list_move - delete from one list and add as another's head
++ * @list: the entry to move
++ * @head: the head that will precede our entry
++ */
++static inline void list_move(struct list_head *list, struct list_head *head)
++{
++        __list_del(list->prev, list->next);
++        list_add(list, head);
++}
++
++/**
++ * list_move_tail - delete from one list and add as another's tail
++ * @list: the entry to move
++ * @head: the head that will follow our entry
++ */
++static inline void list_move_tail(struct list_head *list,
++				  struct list_head *head)
++{
++        __list_del(list->prev, list->next);
++        list_add_tail(list, head);
++}
++
++/**
++ * list_empty - tests whether a list is empty
++ * @head: the list to test.
++ */
++static inline int list_empty(struct list_head *head)
++{
++	return head->next == head;
++}
++
++static inline void __list_splice(struct list_head *list,
++				 struct list_head *head)
++{
++	struct list_head *first = list->next;
++	struct list_head *last = list->prev;
++	struct list_head *at = head->next;
++
++	first->prev = head;
++	head->next = first;
++
++	last->next = at;
++	at->prev = last;
++}
++
++/**
++ * list_splice - join two lists
++ * @list: the new list to add.
++ * @head: the place to add it in the first list.
++ */
++static inline void list_splice(struct list_head *list, struct list_head *head)
++{
++	if (!list_empty(list))
++		__list_splice(list, head);
++}
++
++/**
++ * list_splice_init - join two lists and reinitialise the emptied list.
++ * @list: the new list to add.
++ * @head: the place to add it in the first list.
++ *
++ * The list at @list is reinitialised
++ */
++static inline void list_splice_init(struct list_head *list,
++				    struct list_head *head)
++{
++	if (!list_empty(list)) {
++		__list_splice(list, head);
++		INIT_LIST_HEAD(list);
++	}
++}
++
++/**
++ * list_entry - get the struct for this entry
++ * @ptr:	the &struct list_head pointer.
++ * @type:	the type of the struct this is embedded in.
++ * @member:	the name of the list_struct within the struct.
++ */
++#define list_entry(ptr, type, member) \
++	container_of(ptr, type, member)
++
++/**
++ * list_for_each	-	iterate over a list
++ * @pos:	the &struct list_head to use as a loop counter.
++ * @head:	the head for your list.
++ */
++#define list_for_each(pos, head) \
++	for (pos = (head)->next; pos != (head); pos = pos->next)
++
++/**
++ * list_for_each_prev	-	iterate over a list backwards
++ * @pos:	the &struct list_head to use as a loop counter.
++ * @head:	the head for your list.
++ */
++#define list_for_each_prev(pos, head) \
++	for (pos = (head)->prev; pos != (head); pos = pos->prev)
++
++/**
++ * list_for_each_safe	-	iterate over a list safe against removal of list entry
++ * @pos:	the &struct list_head to use as a loop counter.
++ * @n:		another &struct list_head to use as temporary storage
++ * @head:	the head for your list.
++ */
++#define list_for_each_safe(pos, n, head) \
++	for (pos = (head)->next, n = pos->next; pos != (head); \
++		pos = n, n = pos->next)
++
++/**
++ * list_for_each_entry	-	iterate over list of given type
++ * @pos:	the type * to use as a loop counter.
++ * @head:	the head for your list.
++ * @member:	the name of the list_struct within the struct.
++ */
++#define list_for_each_entry(pos, head, member)				\
++	for (pos = list_entry((head)->next, typeof(*pos), member);	\
++	     &pos->member != (head);					\
++	     pos = list_entry(pos->member.next, typeof(*pos), member))
++
++#endif
+diff --git a/usr/utils/modprobe.c b/usr/utils/modprobe.c
+--- /dev/null
++++ b/usr/utils/modprobe.c
+@@ -0,0 +1,1710 @@
++/* modprobe.c: insert a module into the kernel, intelligently.
++    Copyright (C) 2001  Rusty Russell.
++    Copyright (C) 2002, 2003  Rusty Russell, IBM Corporation.
++
++    This program is free software; you can redistribute it and/or modify
++    it under the terms of the GNU General Public License as published by
++    the Free Software Foundation; either version 2 of the License, or
++    (at your option) any later version.
++
++    This program is distributed in the hope that it will be useful,
++    but WITHOUT ANY WARRANTY; without even the implied warranty of
++    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++    GNU General Public License for more details.
++
++    You should have received a copy of the GNU General Public License
++    along with this program; if not, write to the Free Software
++    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
++*/
++#define _GNU_SOURCE /* asprintf */
++
++#include <sys/utsname.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <sys/mman.h>
++#include <fcntl.h>
++#include <stdarg.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <ctype.h>
++#include <string.h>
++#include <errno.h>
++#include <unistd.h>
++#include <dirent.h>
++#include <limits.h>
++#include <elf.h>
++#include <getopt.h>
++#include <fnmatch.h>
++#include <asm/unistd.h>
++#include <sys/wait.h>
++#include <syslog.h>
++#include <zlib.h>
++
++#define streq(a,b) (strcmp((a),(b)) == 0)
++#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
++
++#include "list.h"
++static inline void try_old_version(const char *progname, char *argv[])
++{
++}
++extern long init_module(void *, unsigned long, const char *);
++extern long delete_module(const char *, unsigned int);
++
++struct module {
++	struct list_head list;
++	char *modname;
++	char filename[0];
++};
++
++#ifndef MODULE_DIR
++#define MODULE_DIR "/lib/modules"
++#endif
++
++typedef void (*errfn_t)(const char *fmt, ...);
++
++/* Do we use syslog or stderr for messages? */
++static int log;
++
++static void message(const char *prefix, const char *fmt, va_list *arglist)
++{
++	char *buf, *buf2;
++
++	vasprintf(&buf, fmt, *arglist);
++	asprintf(&buf2, "%s%s", prefix, buf);
++
++	if (log)
++		syslog(LOG_NOTICE, "%s", buf2);
++	else
++		fprintf(stderr, "%s", buf2);
++	free(buf2);
++	free(buf);
++}
++void *grab_contents(gzFile *gzfd, unsigned long *size)
++{
++        unsigned int max = 16384;
++        void *buffer = malloc(max);
++        int ret;
++
++        if (!buffer)
++                return NULL;
++
++        *size = 0;
++        while ((ret = gzread(gzfd, buffer + *size, max - *size)) > 0) {
++                *size += ret;
++                if (*size == max) {
++                        buffer = realloc(buffer, max *= 2);
++                        if (!buffer)
++                                return NULL;
++                }
++        }
++        if (ret < 0) {
++                free(buffer);
++                buffer = NULL;
++        }
++        return buffer;
++}
++
++void *grab_fd(int fd, unsigned long *size)
++{
++        gzFile gzfd;
++
++        gzfd = gzdopen(fd, "rb");
++        if (!gzfd)
++                return NULL;
++
++        /* gzclose(gzfd) would close fd, which would drop locks.
++           Don't blame zlib: POSIX locking semantics are so horribly
++           broken that they should be ripped out. */
++        return grab_contents(gzfd, size);
++}
++void release_file(void *data, unsigned long size)
++{
++        free(data);
++}
++
++
++static int warned = 0;
++static void warn(const char *fmt, ...)
++{
++	va_list arglist;
++	warned++;
++	va_start(arglist, fmt);
++	message("WARNING: ", fmt, &arglist);
++	va_end(arglist);
++}
++
++static void fatal(const char *fmt, ...)
++{
++	va_list arglist;
++	va_start(arglist, fmt);
++	message("FATAL: ", fmt, &arglist);
++	va_end(arglist);
++	exit(1);
++}
++
++
++static void grammar(const char *cmd, const char *filename, unsigned int line)
++{
++	warn("%s line %u: ignoring bad line starting with '%s'\n",
++	     filename, line, cmd);
++}
++
++static void *do_nofail(void *ptr, const char *file, int line, const char *expr)
++{
++	if (!ptr) {
++		fatal("Memory allocation failure %s line %d: %s.\n",
++		      file, line, expr);
++	}
++	return ptr;
++}
++
++#define NOFAIL(ptr)	do_nofail((ptr), __FILE__, __LINE__, #ptr)
++
++static void print_usage(const char *progname)
++{
++	fprintf(stderr,
++		"Usage: %s [-v] [-V] [-C config-file] [-n] [-i] [-q] [-b] [-o <modname>] <modname> [parameters...]\n"
++		"%s -r [-n] [-i] [-v] <modulename> ...\n"
++		"%s -l -t <dirname> [ -a <modulename> ...]\n",
++		progname, progname, progname);
++	exit(1);
++}
++
++static int fgetc_wrapped(FILE *file, unsigned int *linenum)
++{
++	for (;;) {
++	  	int ch = fgetc(file);
++		if (ch != '\\')
++			return ch;
++		ch = fgetc(file);
++		if (ch != '\n')
++			return ch;
++		if (linenum)
++			(*linenum)++;
++	}
++}
++
++static char *getline_wrapped(FILE *file, unsigned int *linenum)
++{
++	int size = 1024;
++	int i = 0;
++	char *buf = NOFAIL(malloc(size));
++	for(;;) {
++		int ch = fgetc_wrapped(file, linenum);
++		if (i == size) {
++			size *= 2;
++			buf = NOFAIL(realloc(buf, size));
++		}
++		if (ch < 0 && i == 0) {
++			free(buf);
++			return NULL;
++		}
++		if (ch < 0 || ch == '\n') {
++			if (linenum)
++				(*linenum)++;
++			buf[i] = '\0';
++			return NOFAIL(realloc(buf, i+1));
++		}
++		buf[i++] = ch;
++	}
++}
++
++static struct module *find_module(const char *filename, struct list_head *list)
++{
++	struct module *i;
++
++	list_for_each_entry(i, list, list) {
++		if (strcmp(i->filename, filename) == 0)
++			return i;
++	}
++	return NULL;
++}
++
++/* Convert filename to the module name.  Works if filename == modname, too. */
++static void filename2modname(char *modname, const char *filename)
++{
++	const char *afterslash;
++	unsigned int i;
++
++	afterslash = strrchr(filename, '/');
++	if (!afterslash)
++		afterslash = filename;
++	else
++		afterslash++;
++
++	/* Convert to underscores, stop at first . */
++	for (i = 0; afterslash[i] && afterslash[i] != '.'; i++) {
++		if (afterslash[i] == '-')
++			modname[i] = '_';
++		else
++			modname[i] = afterslash[i];
++	}
++	modname[i] = '\0';
++}
++
++static int lock_file(const char *filename)
++{
++	int fd = open(filename, O_RDWR, 0);
++
++	if (fd >= 0) {
++		struct flock lock;
++		lock.l_type = F_WRLCK;
++		lock.l_whence = SEEK_SET;
++		lock.l_start = 0;
++		lock.l_len = 1;
++		fcntl(fd, F_SETLKW, &lock);
++	} else
++		/* Read-only filesystem?  There goes locking... */
++		fd = open(filename, O_RDONLY, 0);
++	return fd;
++}
++
++static void unlock_file(int fd)
++{
++	/* Valgrind is picky... */
++	close(fd);
++}
++
++static void add_module(char *filename, int namelen, struct list_head *list)
++{
++	struct module *mod;
++
++	/* If it's a duplicate: move it to the end, so it gets
++	   inserted where it is *first* required. */
++	mod = find_module(filename, list);
++	if (mod)
++		list_del(&mod->list);
++	else {
++		/* No match.  Create a new module. */
++		mod = NOFAIL(malloc(sizeof(struct module) + namelen + 1));
++		memcpy(mod->filename, filename, namelen);
++		mod->filename[namelen] = '\0';
++		mod->modname = NOFAIL(malloc(namelen + 1));
++		filename2modname(mod->modname, mod->filename);
++	}
++
++	list_add_tail(&mod->list, list);
++}
++
++/* Compare len chars of a to b, with _ and - equivalent. */
++static int modname_equal(const char *a, const char *b, unsigned int len)
++{
++	unsigned int i;
++
++	if (strlen(b) != len)
++		return 0;
++
++	for (i = 0; i < len; i++) {
++		if ((a[i] == '_' || a[i] == '-')
++		    && (b[i] == '_' || b[i] == '-'))
++			continue;
++		if (a[i] != b[i])
++			return 0;
++	}
++	return 1;
++}
++
++/* Fills in list of modules if this is the line we want. */
++static int add_modules_dep_line(char *line,
++				const char *name,
++				struct list_head *list)
++{
++	char *ptr;
++	int len;
++	char *modname;
++
++	/* Ignore lines without : or which start with a # */
++	ptr = strchr(line, ':');
++	if (ptr == NULL || line[strspn(line, "\t ")] == '#')
++		return 0;
++
++	/* Is this the module we are looking for? */
++	*ptr = '\0';
++	if (strrchr(line, '/'))
++		modname = strrchr(line, '/') + 1;
++	else
++		modname = line;
++
++	len = strlen(modname);
++	if (strchr(modname, '.'))
++		len = strchr(modname, '.') - modname;
++	if (!modname_equal(modname, name, len))
++		return 0;
++
++	/* Create the list. */
++	add_module(line, ptr - line, list);
++
++	ptr++;
++	for(;;) {
++		char *dep_start;
++		ptr += strspn(ptr, " \t");
++		if (*ptr == '\0')
++			break;
++		dep_start = ptr;
++		ptr += strcspn(ptr, " \t");
++		add_module(dep_start, ptr - dep_start, list);
++	}
++	return 1;
++}
++
++static void read_depends(const char *dirname,
++			 const char *start_name,
++			 struct list_head *list)
++{
++	char *modules_dep_name;
++	char *line;
++	FILE *modules_dep;
++	int done = 0;
++
++	asprintf(&modules_dep_name, "%s/%s", dirname, "modules.dep");
++	modules_dep = fopen(modules_dep_name, "r");
++	if (!modules_dep)
++		fatal("Could not load %s: %s\n",
++		      modules_dep_name, strerror(errno));
++
++	/* Stop at first line, as we can have duplicates (eg. symlinks
++           from boot/ */
++	while (!done && (line = getline_wrapped(modules_dep, NULL)) != NULL) {
++		done = add_modules_dep_line(line, start_name, list);
++		free(line);
++	}
++	fclose(modules_dep);
++	free(modules_dep_name);
++}
++
++/* We use error numbers in a loose translation... */
++static const char *insert_moderror(int err)
++{
++	switch (err) {
++	case ENOEXEC:
++		return "Invalid module format";
++	case ENOENT:
++		return "Unknown symbol in module, or unknown parameter (see dmesg)";
++	case ENOSYS:
++		return "Kernel does not have module support";
++	default:
++		return strerror(err);
++	}
++}
++
++static const char *remove_moderror(int err)
++{
++	switch (err) {
++	case ENOENT:
++		return "No such module";
++	case ENOSYS:
++		return "Kernel does not have module unloading support";
++	default:
++		return strerror(err);
++	}
++}
++
++/* Is module in /proc/modules?  If so, fill in usecount if not NULL. 
++   0 means no, 1 means yes, -1 means unknown.
++ */
++static int module_in_kernel(const char *modname, unsigned int *usecount)
++{
++	FILE *proc_modules;
++	char *line;
++
++again:
++	/* Might not be mounted yet.  Don't fail. */
++	proc_modules = fopen("/proc/modules", "r");
++	if (!proc_modules)
++		return -1;
++
++	while ((line = getline_wrapped(proc_modules, NULL)) != NULL) {
++		char *entry = strtok(line, " \n");
++
++		if (entry && streq(entry, modname)) {
++			/* If it exists, usecount is the third entry. */
++			if (!strtok(NULL, " \n"))
++				goto out;
++
++			if (!(entry = strtok(NULL, " \n"))) /* usecount */
++				goto out;
++			else
++				if (usecount)
++					*usecount = atoi(entry);
++
++			/* Followed by - then status. */
++			if (strtok(NULL, " \n")
++			    && (entry = strtok(NULL, " \n")) != NULL) {
++				/* Locking will fail on ro fs, we might hit
++				 * cases where module is in flux.  Spin. */
++				if (streq(entry, "Loading")
++				    || streq(entry, "Unloading")) {
++					usleep(100000);
++					free(line);
++					fclose(proc_modules);
++					goto again;
++				}
++			}
++
++		out:
++			free(line);
++			fclose(proc_modules);
++			return 1;
++		}
++		free(line);
++	}
++	fclose(proc_modules);
++	return 0;
++}
++
++static void replace_modname(struct module *module,
++			    void *mem, unsigned long len,
++			    const char *oldname, const char *newname)
++{
++	char *p;
++
++	/* 64 - sizeof(unsigned long) - 1 */
++	if (strlen(newname) > 55)
++		fatal("New name %s is too long\n", newname);
++
++	/* Find where it is in the module structure.  Don't assume layout! */
++	for (p = mem; p < (char *)mem + len - strlen(oldname); p++) {
++		if (memcmp(p, oldname, strlen(oldname)) == 0) {
++			strcpy(p, newname);
++			return;
++		}
++	}
++
++	warn("Could not find old name in %s to replace!\n", module->filename);
++}
++
++static void *get_section32(void *file,
++			   unsigned long size,
++			   const char *name,
++			   unsigned long *secsize)
++{
++	Elf32_Ehdr *hdr = file;
++	Elf32_Shdr *sechdrs = file + hdr->e_shoff;
++	const char *secnames;
++	unsigned int i;
++
++	/* Too short? */
++	if (size < sizeof(*hdr))
++		return NULL;
++	if (size < hdr->e_shoff + hdr->e_shnum * sizeof(sechdrs[0]))
++		return NULL;
++	if (size < sechdrs[hdr->e_shstrndx].sh_offset)
++		return NULL;
++		
++	secnames = file + sechdrs[hdr->e_shstrndx].sh_offset;
++	for (i = 1; i < hdr->e_shnum; i++)
++		if (strcmp(secnames + sechdrs[i].sh_name, name) == 0) {
++			*secsize = sechdrs[i].sh_size;
++			return file + sechdrs[i].sh_offset;
++		}
++	return NULL;
++}
++
++static void *get_section64(void *file,
++			   unsigned long size,
++			   const char *name,
++			   unsigned long *secsize)
++{
++	Elf64_Ehdr *hdr = file;
++	Elf64_Shdr *sechdrs = file + hdr->e_shoff;
++	const char *secnames;
++	unsigned int i;
++
++	/* Too short? */
++	if (size < sizeof(*hdr))
++		return NULL;
++	if (size < hdr->e_shoff + hdr->e_shnum * sizeof(sechdrs[0]))
++		return NULL;
++	if (size < sechdrs[hdr->e_shstrndx].sh_offset)
++		return NULL;
++		
++	secnames = file + sechdrs[hdr->e_shstrndx].sh_offset;
++	for (i = 1; i < hdr->e_shnum; i++)
++		if (strcmp(secnames + sechdrs[i].sh_name, name) == 0) {
++			*secsize = sechdrs[i].sh_size;
++			return file + sechdrs[i].sh_offset;
++		}
++	return NULL;
++}
++
++static int elf_ident(void *mod, unsigned long size)
++{
++	/* "\177ELF" <byte> where byte = 001 for 32-bit, 002 for 64 */
++	char *ident = mod;
++
++	if (size < EI_CLASS || memcmp(mod, ELFMAG, SELFMAG) != 0)
++		return ELFCLASSNONE;
++	return ident[EI_CLASS];
++}
++
++static void *get_section(void *file,
++			 unsigned long size,
++			 const char *name,
++			 unsigned long *secsize)
++{
++	switch (elf_ident(file, size)) {
++	case ELFCLASS32:
++		return get_section32(file, size, name, secsize);
++	case ELFCLASS64:
++		return get_section64(file, size, name, secsize);
++	default:
++		return NULL;
++	}
++}
++
++static void rename_module(struct module *module,
++			  void *mod,
++			  unsigned long len,
++			  const char *newname)
++{
++	void *modstruct;
++	unsigned long modstruct_len;
++
++	/* Old-style */
++	modstruct = get_section(mod, len, ".gnu.linkonce.this_module",
++				&modstruct_len);
++	/* New-style */
++	if (!modstruct)
++		modstruct = get_section(mod, len, "__module", &modstruct_len);
++	if (!modstruct)
++		warn("Could not find module name to change in %s\n",
++		     module->filename);
++	else
++		replace_modname(module, modstruct, modstruct_len,
++				module->modname, newname);
++}
++
++/* Kernel told to ignore these sections if SHF_ALLOC not set. */
++static void invalidate_section32(void *mod, const char *secname)
++{
++	Elf32_Ehdr *hdr = mod;
++	Elf32_Shdr *sechdrs = mod + hdr->e_shoff;
++	const char *secnames = mod + sechdrs[hdr->e_shstrndx].sh_offset;
++	unsigned int i;
++
++	for (i = 1; i < hdr->e_shnum; i++)
++		if (strcmp(secnames+sechdrs[i].sh_name, secname) == 0)
++			sechdrs[i].sh_flags &= ~SHF_ALLOC;
++}
++
++static void invalidate_section64(void *mod, const char *secname)
++{
++	Elf64_Ehdr *hdr = mod;
++	Elf64_Shdr *sechdrs = mod + hdr->e_shoff;
++	const char *secnames = mod + sechdrs[hdr->e_shstrndx].sh_offset;
++	unsigned int i;
++
++	for (i = 1; i < hdr->e_shnum; i++)
++		if (strcmp(secnames+sechdrs[i].sh_name, secname) == 0)
++			sechdrs[i].sh_flags &= ~(unsigned long long)SHF_ALLOC;
++}
++
++static void strip_section(struct module *module,
++			  void *mod,
++			  unsigned long len,
++			  const char *secname)
++{
++	switch (elf_ident(mod, len)) {
++	case ELFCLASS32:
++		invalidate_section32(mod, secname);
++		break;
++	case ELFCLASS64:
++		invalidate_section64(mod, secname);
++		break;
++	default:
++		warn("Unknown module format in %s: not forcing version\n",
++		     module->filename);
++	}
++}
++
++static const char *next_string(const char *string, unsigned long *secsize)
++{
++	/* Skip non-zero chars */
++	while (string[0]) {
++		string++;
++		if ((*secsize)-- <= 1)
++			return NULL;
++	}
++
++	/* Skip any zero padding. */
++	while (!string[0]) {
++		string++;
++		if ((*secsize)-- <= 1)
++			return NULL;
++	}
++	return string;
++}
++
++static void clear_magic(struct module *module, void *mod, unsigned long len)
++{
++	const char *p;
++	unsigned long modlen;
++
++	/* Old-style: __vermagic section */
++	strip_section(module, mod, len, "__vermagic");
++
++	/* New-style: in .modinfo section */
++	for (p = get_section(mod, len, ".modinfo", &modlen);
++	     p;
++	     p = next_string(p, &modlen)) {
++		if (strncmp(p, "vermagic=", strlen("vermagic=")) == 0) {
++			memset((char *)p, 0, strlen(p));
++			return;
++		}
++	}
++}
++
++struct module_options
++{
++	struct module_options *next;
++	char *modulename;
++	char *options;
++};
++
++struct module_command
++{
++	struct module_command *next;
++	char *modulename;
++	char *command;
++};
++
++struct module_alias
++{
++	struct module_alias *next;
++	char *module;
++};
++
++struct module_blacklist
++{
++	struct module_blacklist *next;
++	char *modulename;
++};
++
++/* Link in a new option line from the config file. */
++static struct module_options *
++add_options(const char *modname,
++	    const char *option,
++	    struct module_options *options)
++{
++	struct module_options *new;
++	char *tab; 
++
++	new = NOFAIL(malloc(sizeof(*new)));
++	new->modulename = NOFAIL(strdup(modname));
++	new->options = NOFAIL(strdup(option));
++	/* We can handle tabs, kernel can't. */
++	for (tab = strchr(new->options, '\t'); tab; tab = strchr(tab, '\t'))
++		*tab = ' ';
++	new->next = options;
++	return new;
++}
++
++/* Link in a new install line from the config file. */
++static struct module_command *
++add_command(const char *modname,
++	       const char *command,
++	       struct module_command *commands)
++{
++	struct module_command *new;
++
++	new = NOFAIL(malloc(sizeof(*new)));
++	new->modulename = NOFAIL(strdup(modname));
++	new->command = NOFAIL(strdup(command));
++	new->next = commands;
++	return new;
++}
++
++/* Link in a new alias line from the config file. */
++static struct module_alias *
++add_alias(const char *modname, struct module_alias *aliases)
++{
++	struct module_alias *new;
++
++	new = NOFAIL(malloc(sizeof(*new)));
++	new->module = NOFAIL(strdup(modname));
++	new->next = aliases;
++	return new;
++}
++
++/* Link in a new blacklist line from the config file. */
++static struct module_blacklist *
++add_blacklist(const char *modname, struct module_blacklist *blacklist)
++{
++	struct module_blacklist *new;
++
++	new = NOFAIL(malloc(sizeof(*new)));
++	new->modulename = NOFAIL(strdup(modname));
++	new->next = blacklist;
++	return new;
++}
++
++/* Find blacklist commands if any. */
++static  int
++find_blacklist(const char *modname, const struct module_blacklist *blacklist)
++{
++	while (blacklist) {
++		if (strcmp(blacklist->modulename, modname) == 0)
++			return 1;
++		blacklist = blacklist->next;
++	}
++	return 0;
++}
++
++/* return a new alias list, with backlisted elems filtered out */
++static struct module_alias *
++apply_blacklist(const struct module_alias *aliases,
++		const struct module_blacklist *blacklist)
++{
++	struct module_alias *result = NULL;
++	while (aliases) {
++		char *modname = aliases->module;
++		if (!find_blacklist(modname, blacklist))
++			result = add_alias(modname, result);
++		aliases = aliases->next;
++	}
++	return result;
++}
++
++/* Find install commands if any. */
++static const char *find_command(const char *modname,
++				const struct module_command *commands)
++{
++	while (commands) {
++		if (fnmatch(commands->modulename, modname, 0) == 0)
++			return commands->command;
++		commands = commands->next;
++	}
++	return NULL;
++}
++
++static char *append_option(char *options, const char *newoption)
++{
++	options = NOFAIL(realloc(options, strlen(options) + 1
++				 + strlen(newoption) + 1));
++	if (strlen(options)) strcat(options, " ");
++	strcat(options, newoption);
++	return options;
++}
++
++/* Add to options */
++static char *add_extra_options(const char *modname,
++			       char *optstring,
++			       const struct module_options *options)
++{
++	while (options) {
++		if (strcmp(options->modulename, modname) == 0)
++			optstring = append_option(optstring, options->options);
++		options = options->next;
++	}
++	return optstring;
++}
++
++/* If we don't flush, then child processes print before we do */
++static void verbose_printf(int verbose, const char *fmt, ...)
++{
++	va_list arglist;
++
++	if (verbose) {
++		va_start(arglist, fmt);
++		vprintf(fmt, arglist);
++		fflush(stdout);
++		va_end(arglist);
++	}
++}
++
++/* Do an install/remove command: replace $CMDLINE_OPTS if it's specified. */
++static void do_command(const char *modname,
++		       const char *command,
++		       int verbose, int dry_run,
++		       errfn_t error,
++		       const char *type,
++		       const char *cmdline_opts)
++{
++	int ret;
++	char *p, *replaced_cmd = NOFAIL(strdup(command));
++
++	while ((p = strstr(replaced_cmd, "$CMDLINE_OPTS")) != NULL) {
++		char *new;
++		asprintf(&new, "%.*s%s%s",
++			 p - replaced_cmd, replaced_cmd, cmdline_opts,
++			 p + strlen("$CMDLINE_OPTS"));
++		NOFAIL(new);
++		free(replaced_cmd);
++		replaced_cmd = new;
++	}
++
++	verbose_printf(verbose, "%s %s\n", type, replaced_cmd);
++	if (dry_run)
++		return;
++
++	setenv("MODPROBE_MODULE", modname, 1);
++	ret = system(replaced_cmd);
++	if (ret == -1 || WEXITSTATUS(ret))
++		error("Error running %s command for %s\n", type, modname);
++	free(replaced_cmd);
++}
++
++/* Actually do the insert.  Frees second arg. */
++static void insmod(struct list_head *list,
++		   char *optstring,
++		   const char *newname,
++		   int first_time,
++		   errfn_t error,
++		   int dry_run,
++		   int verbose,
++		   const struct module_options *options,
++		   const struct module_command *commands,
++		   int ignore_commands,
++		   int ignore_proc,
++		   int strip_vermagic,
++		   int strip_modversion,
++		   const char *cmdline_opts)
++{
++	int ret, fd;
++	unsigned long len;
++	void *map;
++	const char *command;
++	struct module *mod = list_entry(list->next, struct module, list);
++
++	/* Take us off the list. */
++	list_del(&mod->list);
++
++	/* Do things we (or parent) depend on first, but don't die if
++	 * they fail. */
++	if (!list_empty(list)) {
++		insmod(list, NOFAIL(strdup("")), NULL, 0, warn,
++		       dry_run, verbose, options, commands, 0, ignore_proc,
++		       strip_vermagic, strip_modversion, cmdline_opts);
++	}
++
++	/* Lock before we look, in case it's initializing. */
++	fd = lock_file(mod->filename);
++	if (fd < 0) {
++		error("Could not open '%s': %s\n",
++		      mod->filename, strerror(errno));
++		goto out_optstring;
++	}
++
++	/* Don't do ANYTHING if already in kernel. */
++	if (!ignore_proc
++	    && module_in_kernel(newname ?: mod->modname, NULL) == 1) {
++		if (first_time)
++			error("Module %s already in kernel.\n",
++			      newname ?: mod->modname);
++		goto out_unlock;
++	}
++
++	command = find_command(mod->modname, commands);
++	if (command && !ignore_commands) {
++		/* It might recurse: unlock. */
++		unlock_file(fd);
++		do_command(mod->modname, command, verbose, dry_run, error,
++			   "install", cmdline_opts);
++		goto out_optstring;
++	}
++
++	map = grab_fd(fd, &len);
++	if (!map) {
++		error("Could not read '%s': %s\n",
++		      mod->filename, strerror(errno));
++		goto out_unlock;
++	}
++
++	/* Rename it? */
++	if (newname)
++		rename_module(mod, map, len, newname);
++
++	if (strip_modversion)
++		strip_section(mod, map, len, "__versions");
++	if (strip_vermagic)
++		clear_magic(mod, map, len);
++
++	/* Config file might have given more options */
++	optstring = add_extra_options(mod->modname, optstring, options);
++
++	verbose_printf(verbose, "insmod %s %s\n", mod->filename, optstring);
++
++	if (dry_run)
++		goto out;
++
++	ret = init_module(map, len, optstring);
++	if (ret != 0) {
++		if (errno == EEXIST) {
++			if (first_time)
++				error("Module %s already in kernel.\n",
++				      newname ?: mod->modname);
++			goto out_unlock;
++		}
++		error("Error inserting %s (%s): %s\n",
++		      mod->modname, mod->filename, insert_moderror(errno));
++	}
++ out:
++	release_file(map, len);
++ out_unlock:
++	unlock_file(fd);
++ out_optstring:
++	free(optstring);
++	return;
++}
++
++/* Do recursive removal. */
++static void rmmod(struct list_head *list,
++		  const char *name,
++		  int first_time,
++		  errfn_t error,
++		  int dry_run,
++		  int verbose,
++		  struct module_command *commands,
++		  int ignore_commands,
++		  int ignore_inuse,
++		  const char *cmdline_opts)
++{
++	const char *command;
++	unsigned int usecount = 0;
++	int lock;
++	struct module *mod = list_entry(list->next, struct module, list);
++
++	/* Take first one off the list. */
++	list_del(&mod->list);
++
++	/* Ignore failure; it's best effort here. */
++	lock = lock_file(mod->filename);
++
++	if (!name)
++		name = mod->modname;
++
++	/* Even if renamed, find commands to orig. name. */
++	command = find_command(mod->modname, commands);
++	if (command && !ignore_commands) {
++		/* It might recurse: unlock. */
++		unlock_file(lock);
++		do_command(mod->modname, command, verbose, dry_run, error,
++			   "remove", cmdline_opts);
++		goto remove_rest_no_unlock;
++	}
++
++	if (module_in_kernel(name, &usecount) == 0)
++		goto nonexistent_module;
++
++	if (usecount != 0) {
++		if (!ignore_inuse)
++			error("Module %s is in use.\n", name);
++		goto remove_rest;
++	}
++
++	verbose_printf(verbose, "rmmod %s\n", mod->filename);
++
++	if (dry_run)
++		goto remove_rest;
++
++	if (delete_module(name, O_EXCL) != 0) {
++		if (errno == ENOENT)
++			goto nonexistent_module;
++		error("Error removing %s (%s): %s\n",
++		      name, mod->filename,
++		      remove_moderror(errno));
++	}
++
++ remove_rest:
++	unlock_file(lock);
++ remove_rest_no_unlock:
++	/* Now do things we depend. */
++	if (!list_empty(list))
++		rmmod(list, NULL, 0, warn, dry_run, verbose, commands,
++		      0, 1, cmdline_opts);
++	return;
++
++nonexistent_module:
++	if (first_time)
++		fatal("Module %s is not in kernel.\n", mod->modname);
++	goto remove_rest;
++}
++
++/* Does path contain directory(s) subpath? */
++static int type_matches(const char *path, const char *subpath)
++{
++	char *subpath_with_slashes;
++	int ret;
++
++	asprintf(&subpath_with_slashes, "/%s/", subpath);
++	NOFAIL(subpath_with_slashes);
++
++	ret = (strstr(path, subpath_with_slashes) != NULL);
++	free(subpath_with_slashes);
++	return ret;
++}
++
++static char *underscores(char *string)
++{
++	if (string) {
++		unsigned int i;
++		for (i = 0; string[i]; i++)
++			if (string[i] == '-')
++				string[i] = '_';
++	}
++	return string;
++}
++
++static int do_wildcard(const char *dirname,
++		       const char *type,
++		       const char *wildcard)
++{
++	char modules_dep_name[strlen(dirname) + sizeof("modules.dep") + 1];
++	char *line, *wcard;
++	FILE *modules_dep;
++
++	/* Canonicalize wildcard */
++	wcard = strdup(wildcard);
++	underscores(wcard);
++
++	sprintf(modules_dep_name, "%s/%s", dirname, "modules.dep");
++	modules_dep = fopen(modules_dep_name, "r");
++	if (!modules_dep)
++		fatal("Could not load %s: %s\n",
++		      modules_dep_name, strerror(errno));
++
++	while ((line = getline_wrapped(modules_dep, NULL)) != NULL) {
++		char *ptr;
++
++		/* Ignore lines without : or which start with a # */
++		ptr = strchr(line, ':');
++		if (ptr == NULL || line[strspn(line, "\t ")] == '#')
++			goto next;
++		*ptr = '\0';
++
++		/* "type" must match complete directory component(s). */
++		if (!type || type_matches(line, type)) {
++			char modname[strlen(line)+1];
++
++			filename2modname(modname, line);
++			if (fnmatch(wcard, modname, 0) == 0)
++				printf("%s\n", line);
++		}
++	next:
++		free(line);
++	}
++
++	free(wcard);
++	return 0;
++}
++
++static char *strsep_skipspace(char **string, char *delim)
++{
++	if (!*string)
++		return NULL;
++	*string += strspn(*string, delim);
++	return strsep(string, delim);
++}
++
++/* Recursion */
++static int read_config(const char *filename,
++		       const char *name,
++		       int dump_only,
++		       int removing,
++		       struct module_options **options,
++		       struct module_command **commands,
++		       struct module_alias **alias,
++		       struct module_blacklist **blacklist);
++
++/* FIXME: Maybe should be extended to "alias a b [and|or c]...". --RR */
++static int read_config_file(const char *filename,
++			    const char *name,
++			    int dump_only,
++			    int removing,
++			    struct module_options **options,
++			    struct module_command **commands,
++			    struct module_alias **aliases,
++			    struct module_blacklist **blacklist)
++{
++	char *line;
++	unsigned int linenum = 0;
++	FILE *cfile;
++
++	cfile = fopen(filename, "r");
++	if (!cfile)
++		return 0;
++
++	while ((line = getline_wrapped(cfile, &linenum)) != NULL) {
++		char *ptr = line;
++		char *cmd, *modname;
++
++		if (dump_only)
++			printf("%s\n", line);
++
++		cmd = strsep_skipspace(&ptr, "\t ");
++		if (cmd == NULL || cmd[0] == '#' || cmd[0] == '\0')
++			continue;
++
++		if (strcmp(cmd, "alias") == 0) {
++			char *wildcard
++				= underscores(strsep_skipspace(&ptr, "\t "));
++			char *realname
++				= underscores(strsep_skipspace(&ptr, "\t "));
++
++			if (!wildcard || !realname)
++				grammar(cmd, filename, linenum);
++			else if (fnmatch(wildcard,name,0) == 0)
++				*aliases = add_alias(realname, *aliases);
++		} else if (strcmp(cmd, "include") == 0) {
++			struct module_alias *newalias = NULL;
++			char *newfilename;
++
++			newfilename = strsep_skipspace(&ptr, "\t ");
++			if (!newfilename)
++				grammar(cmd, filename, linenum);
++			else {
++				if (!read_config(newfilename, name,
++						 dump_only, removing,
++						 options, commands, &newalias,
++						 blacklist))
++					warn("Failed to open included"
++					      " config file %s: %s\n",
++					      newfilename, strerror(errno));
++
++				/* Files included override aliases,
++				   etc that was already set ... */
++				if (newalias)
++					*aliases = newalias;
++			}
++		} else if (strcmp(cmd, "options") == 0) {
++			modname = strsep_skipspace(&ptr, "\t ");
++			if (!modname || !ptr)
++				grammar(cmd, filename, linenum);
++			else {
++				ptr += strspn(ptr, "\t ");
++				*options = add_options(underscores(modname),
++						       ptr, *options);
++			}
++		} else if (strcmp(cmd, "install") == 0) {
++			modname = strsep_skipspace(&ptr, "\t ");
++			if (!modname || !ptr)
++				grammar(cmd, filename, linenum);
++			else if (!removing) {
++				ptr += strspn(ptr, "\t ");
++				*commands = add_command(underscores(modname),
++							ptr, *commands);
++			}
++		} else if (strcmp(cmd, "blacklist") == 0) {
++			modname = strsep_skipspace(&ptr, "\t ");
++			if (!modname)
++				grammar(cmd, filename, linenum);
++			else if (!removing) {
++				*blacklist = add_blacklist(underscores(modname),
++							*blacklist);
++			}
++		} else if (strcmp(cmd, "remove") == 0) {
++			modname = strsep_skipspace(&ptr, "\t ");
++			if (!modname || !ptr)
++				grammar(cmd, filename, linenum);
++			else if (removing) {
++				ptr += strspn(ptr, "\t ");
++				*commands = add_command(underscores(modname),
++							ptr, *commands);
++			}
++		} else
++			grammar(cmd, filename, linenum);
++
++		free(line);
++	}
++	fclose(cfile);
++	return 1;
++}
++
++/* Simple format, ignore lines starting with #, one command per line.
++   Returns true or false. */
++static int read_config(const char *filename,
++		       const char *name,
++		       int dump_only,
++		       int removing,
++		       struct module_options **options,
++		       struct module_command **commands,
++		       struct module_alias **aliases,
++		       struct module_blacklist **blacklist)
++{
++	DIR *dir;
++	int ret = 0;
++
++	/* ignore everything in this directory */
++	if (streq(filename, "/etc/modprobe.d/arch"))
++		return 1;
++
++	/* Reiser4 has file/directory duality: treat it as both. */
++	dir = opendir(filename);
++	if (dir) {
++		struct dirent *i;
++		while ((i = readdir(dir)) != NULL) {
++			if (!streq(i->d_name,".") && !streq(i->d_name,"..")) {
++				char sub[strlen(filename) + 1
++					 + strlen(i->d_name) + 1];
++
++				sprintf(sub, "%s/%s", filename, i->d_name);
++				if (!read_config(sub, name,
++						 dump_only, removing, options,
++						 commands, aliases, blacklist))
++					warn("Failed to open"
++					     " config file %s: %s\n",
++					     sub, strerror(errno));
++			}
++		}
++		closedir(dir);
++		ret = 1;
++	}
++
++	if (read_config_file(filename, name, dump_only, removing,
++			     options, commands, aliases, blacklist))
++		ret = 1;
++
++	return ret;
++}
++
++static const char *default_configs[] = 
++{
++	"/etc/modprobe.conf",
++	"/etc/modprobe.d",
++};
++
++static void read_toplevel_config(const char *filename,
++				 const char *name,
++				 int dump_only,
++				 int removing,
++				 struct module_options **options,
++				 struct module_command **commands,
++				 struct module_alias **aliases,
++				 struct module_blacklist **blacklist)
++{
++	unsigned int i;
++
++	if (filename) {
++		if (!read_config(filename, name, dump_only, removing,
++				 options, commands, aliases, blacklist))
++			fatal("Failed to open config file %s: %s\n",
++			      filename, strerror(errno));
++		return;
++	}
++
++	/* Try defaults. */
++	for (i = 0; i < ARRAY_SIZE(default_configs); i++) {
++		if (read_config(default_configs[i], name, dump_only, removing,
++				options, commands, aliases, blacklist))
++			return;
++	}
++}
++
++static void add_to_env_var(const char *option)
++{
++	const char *oldenv;
++
++	if ((oldenv = getenv("MODPROBE_OPTIONS")) != NULL) {
++		char *newenv;
++		asprintf(&newenv, "%s %s", oldenv, option);
++		setenv("MODPROBE_OPTIONS", newenv, 1);
++	} else
++		setenv("MODPROBE_OPTIONS", option, 1);
++}
++
++/* Prepend options from environment. */
++static char **merge_args(char *args, char *argv[], int *argc)
++{
++	char *arg, *argstring;
++	char **newargs = NULL;
++	unsigned int i, num_env = 0;
++
++	if (!args)
++		return argv;
++
++	argstring = NOFAIL(strdup(args));
++	for (arg = strtok(argstring, " "); arg; arg = strtok(NULL, " ")) {
++		num_env++;
++		newargs = NOFAIL(realloc(newargs,
++					 sizeof(newargs[0])
++					 * (num_env + *argc + 1)));
++		newargs[num_env] = arg;
++	}
++
++	/* Append commandline args */
++	newargs[0] = argv[0];
++	for (i = 1; i <= *argc; i++)
++		newargs[num_env+i] = argv[i];
++
++	*argc += num_env;
++	return newargs;
++}
++
++static char *gather_options(char *argv[])
++{
++	char *optstring = NOFAIL(strdup(""));
++
++	/* Rest is module options */
++	while (*argv) {
++		/* Quote value if it contains spaces. */
++		unsigned int eq = strcspn(*argv, "=");
++
++		if (strchr(*argv+eq, ' ') && !strchr(*argv, '"')) {
++			char quoted[strlen(*argv) + 3];
++			(*argv)[eq] = '\0';
++			sprintf(quoted, "%s=\"%s\"", *argv, *argv+eq+1);
++			optstring = append_option(optstring, quoted);
++		} else
++			optstring = append_option(optstring, *argv);
++		argv++;
++	}
++	return optstring;
++}
++
++static void handle_module(const char *modname,
++			  struct list_head *todo_list,
++			  const char *newname,
++			  int remove,
++			  char *options,
++			  int first_time,
++			  errfn_t error,
++			  int dry_run,
++			  int verbose,
++			  struct module_options *modoptions,
++			  struct module_command *commands,
++			  int ignore_commands,
++			  int ignore_proc,
++			  int strip_vermagic,
++			  int strip_modversion,
++			  int unknown_silent,
++			  const char *cmdline_opts)
++{
++	if (list_empty(todo_list)) {
++		const char *command;
++
++		/* The dependencies have to be real modules, but
++		   handle case where the first is completely bogus. */
++		command = find_command(modname, commands);
++		if (command && !ignore_commands) {
++			do_command(modname, command, verbose, dry_run, error,
++				   remove ? "remove":"install", cmdline_opts);
++			return;
++		}
++
++		if (unknown_silent)
++			exit(1);
++		error("Module %s not found.\n", modname);
++		return;
++	}
++
++	if (remove)
++		rmmod(todo_list, newname, first_time, error, dry_run, verbose,
++		      commands, ignore_commands, 0, cmdline_opts);
++	else
++		insmod(todo_list, NOFAIL(strdup(options)), newname,
++		       first_time, error, dry_run, verbose, modoptions,
++		       commands, ignore_commands, ignore_proc, strip_vermagic,
++		       strip_modversion, cmdline_opts);
++}
++
++static struct option options[] = { { "verbose", 0, NULL, 'v' },
++				   { "version", 0, NULL, 'V' },
++				   { "config", 1, NULL, 'C' },
++				   { "name", 1, NULL, 'o' },
++				   { "remove", 0, NULL, 'r' },
++				   { "showconfig", 0, NULL, 'c' },
++				   { "autoclean", 0, NULL, 'k' },
++				   { "quiet", 0, NULL, 'q' },
++				   { "show", 0, NULL, 'n' },
++				   { "dry-run", 0, NULL, 'n' },
++				   { "syslog", 0, NULL, 's' },
++				   { "type", 1, NULL, 't' },
++				   { "list", 0, NULL, 'l' },
++				   { "all", 0, NULL, 'a' },
++				   { "ignore-install", 0, NULL, 'i' },
++				   { "ignore-remove", 0, NULL, 'i' },
++				   { "force", 0, NULL, 'f' },
++				   { "force-vermagic", 0, NULL, 1 },
++				   { "force-modversion", 0, NULL, 2 },
++				   { "set-version", 1, NULL, 'S' },
++				   { "show-depends", 0, NULL, 'D' },
++				   { "first-time", 0, NULL, 3 },
++				   { "use-blacklist", 0, NULL, 'b' },
++				   { NULL, 0, NULL, 0 } };
++
++#define MODPROBE_DEVFSD_CONF "/etc/modprobe.devfs"
++
++/* This is a horrible hack to allow devfsd, which calls modprobe with
++   -C /etc/modules.conf or /etc/modules.devfs, to work.  FIXME. */
++/* Modern devfsd or variants should use -q explicitly in 2.6. */
++static int is_devfs_call(char *argv[])
++{
++	unsigned int i;
++
++	/* Look for "/dev" arg */
++	for (i = 1; argv[i]; i++) {
++		if (strncmp(argv[i], "/dev/", 5) == 0)
++			return 1;
++	}
++	return 0;
++}
++
++int main(int argc, char *argv[])
++{
++	struct utsname buf;
++	struct stat statbuf;
++	int opt;
++	int dump_only = 0;
++	int dry_run = 0;
++	int remove = 0;
++	int verbose = 0;
++	int unknown_silent = 0;
++	int list_only = 0;
++	int all = 0;
++	int ignore_commands = 0;
++	int strip_vermagic = 0;
++	int strip_modversion = 0;
++	int ignore_proc = 0;
++	int first_time = 0;
++	int use_blacklist = 0;
++	unsigned int i, num_modules;
++	char *type = NULL;
++	const char *config = NULL;
++	char *dirname, *optstring;
++	char *newname = NULL;
++	char *aliasfilename, *symfilename;
++	errfn_t error = fatal;
++
++	/* Prepend options from environment. */
++	argv = merge_args(getenv("MODPROBE_OPTIONS"), argv, &argc);
++
++	/* --set-version overrides version, and disables backwards compat. */
++	for (opt = 1; opt < argc; opt++)
++		if (strncmp(argv[opt],"--set-version",strlen("--set-version"))
++		    == 0)
++			break;
++
++	if (opt == argc)
++		try_old_version("modprobe", argv);
++
++	uname(&buf);
++	while ((opt = getopt_long(argc, argv, "vVC:o:rknqQsclt:aifb", options, NULL)) != -1){
++		switch (opt) {
++		case 'v':
++			add_to_env_var("-v");
++			verbose = 1;
++			break;
++		case 'V':
++			puts("module-init-tools version 3.2.2");
++			exit(0);
++		case 'S':
++			strncpy(buf.release, optarg, sizeof(buf.release));
++			buf.release[sizeof(buf.release)-1] = '\0';
++			break;
++		case 'C':
++			if (is_devfs_call(argv)) {
++				if (streq("/etc/modules.devfs", optarg)) {
++					config = MODPROBE_DEVFSD_CONF;
++					add_to_env_var("-C");
++					add_to_env_var(config);
++					/* Fall thru to -q */
++				} else if (streq("/etc/modules.conf", optarg))
++					/* Ignore config, fall thru to -q */
++					;
++				else {
++					/* False alarm.  Treat as normal. */
++					config = optarg;
++					add_to_env_var("-C");
++					add_to_env_var(config);
++					break;
++				}
++			} else {
++				config = optarg;
++				add_to_env_var("-C");
++				add_to_env_var(config);
++				break;
++			}
++		case 'q':
++			unknown_silent = 1;
++			add_to_env_var("-q");
++			break;
++		case 'D':
++			dry_run = 1;
++			ignore_proc = 1;
++			verbose = 1;
++			add_to_env_var("-D");
++			break;
++		case 'o':
++			newname = optarg;
++			break;
++		case 'r':
++			remove = 1;
++			break;
++		case 'c':
++			dump_only = 1;
++			break;
++		case 't':
++			type = optarg;
++			break;
++		case 'l':
++			list_only = 1;
++			break;
++		case 'a':
++			all = 1;
++			error = warn;
++			break;
++		case 'k':
++			/* FIXME: This should actually do something */
++			break;
++		case 'n':
++			dry_run = 1;
++			break;
++		case 's':
++			add_to_env_var("-s");
++			log = 1;
++			break;
++		case 'i':
++			ignore_commands = 1;
++			break;
++		case 'f':
++			strip_vermagic = 1;
++			strip_modversion = 1;
++			break;
++		case 'b':
++			use_blacklist = 1;
++			break;
++		case 1:
++			strip_vermagic = 1;
++			break;
++		case 2:
++			strip_modversion = 1;
++			break;
++		case 3:
++			first_time = 1;
++			break;
++		default:
++			print_usage(argv[0]);
++		}
++	}
++
++	/* If stderr not open, go to syslog */
++	if (log || fstat(STDERR_FILENO, &statbuf) != 0) {
++		openlog("modprobe", LOG_CONS, LOG_DAEMON);
++		log = 1;
++	}
++
++	if (argc < optind + 1 && !dump_only && !list_only && !remove)
++		print_usage(argv[0]);
++
++	dirname = NOFAIL(malloc(strlen(buf.release) + sizeof(MODULE_DIR) + 1));
++	sprintf(dirname, "%s/%s", MODULE_DIR, buf.release);
++	aliasfilename = NOFAIL(malloc(strlen(dirname)
++				      + sizeof("/modules.alias")));
++	sprintf(aliasfilename, "%s/modules.alias", dirname);
++	symfilename = NOFAIL(malloc(strlen(dirname)
++				    + sizeof("/modules.symbols")));
++	sprintf(symfilename, "%s/modules.symbols", dirname);
++
++	/* Old-style -t xxx wildcard?  Only with -l. */
++	if (list_only) {
++		if (optind+1 < argc)
++			fatal("Can't have multiple wildcards\n");
++		/* fprintf(stderr, "man find\n"); return 1; */
++		return do_wildcard(dirname, type, argv[optind]?:"*");
++	}
++	if (type)
++		fatal("-t only supported with -l");
++
++	if (dump_only) {
++		struct module_command *commands = NULL;
++		struct module_options *modoptions = NULL;
++		struct module_alias *aliases = NULL;
++		struct module_blacklist *blacklist = NULL;
++
++		read_toplevel_config(config, "", 1, 0,
++			     &modoptions, &commands, &aliases, &blacklist);
++		read_config(aliasfilename, "", 1, 0,&modoptions, &commands,
++			    &aliases, &blacklist);
++		read_config(symfilename, "", 1, 0, &modoptions, &commands,
++			    &aliases, &blacklist);
++		exit(0);
++	}
++
++	if (remove || all) {
++		num_modules = argc - optind;
++		optstring = NOFAIL(strdup(""));
++	} else {
++		num_modules = 1;
++		optstring = gather_options(argv+optind+1);
++	}
++
++	/* num_modules is always 1 except for -r or -a. */
++	for (i = 0; i < num_modules; i++) {
++		struct module_command *commands = NULL;
++		struct module_options *modoptions = NULL;
++		struct module_alias *aliases = NULL;
++		struct module_blacklist *blacklist = NULL;
++		LIST_HEAD(list);
++		char *modulearg = argv[optind + i];
++
++		/* Convert name we are looking for */
++		underscores(modulearg);
++
++		/* Returns the resolved alias, options */
++		read_toplevel_config(config, modulearg, 0,
++		     remove, &modoptions, &commands, &aliases, &blacklist);
++
++		/* No luck?  Try symbol names, if starts with symbol:. */
++		if (!aliases
++		    && strncmp(modulearg, "symbol:", strlen("symbol:")) == 0)
++			read_config(symfilename, modulearg, 0,
++			    remove, &modoptions, &commands,
++			    	&aliases, &blacklist);
++
++		if (!aliases) {
++			/* We only use canned aliases as last resort. */
++			read_depends(dirname, modulearg, &list);
++
++			if (list_empty(&list)
++			    && !find_command(modulearg, commands))
++			{
++				read_config(aliasfilename, modulearg, 0,
++					    remove, &modoptions, &commands,
++					    &aliases, &blacklist);
++				aliases = apply_blacklist(aliases, blacklist);
++			}
++		}
++
++		if (aliases) {
++			errfn_t err = error;
++
++			/* More than one alias?  Don't bail out on failure. */
++			if (aliases->next)
++				err = warn;
++			while (aliases) {
++				/* Add the options for this alias. */
++				char *opts = NOFAIL(strdup(optstring));
++				opts = add_extra_options(modulearg,
++							 opts, modoptions);
++
++				read_depends(dirname, aliases->module, &list);
++				handle_module(aliases->module, &list, newname,
++					      remove, opts, first_time, err,
++					      dry_run, verbose, modoptions,
++					      commands, ignore_commands,
++					      ignore_proc, strip_vermagic,
++					      strip_modversion,
++					      unknown_silent,
++					      optstring);
++
++				aliases = aliases->next;
++				INIT_LIST_HEAD(&list);
++			}
++		} else {
++			if (use_blacklist
++			    && find_blacklist(modulearg, blacklist))
++				continue;
++
++			handle_module(modulearg, &list, newname, remove,
++				      optstring, first_time, error, dry_run,
++				      verbose, modoptions, commands,
++				      ignore_commands, ignore_proc,
++				      strip_vermagic, strip_modversion,
++				      unknown_silent, optstring);
++		}
++	}
++	if (log)
++		closelog();
++
++	return 0;
++}
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/prefix.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/prefix.patch
new file mode 100644
index 0000000..6f5ff0d
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/prefix.patch
@@ -0,0 +1,14 @@
+Index: klibc-1.5.24/Makefile
+===================================================================
+--- a/Makefile	2011-07-27 15:50:53.000000000 +0200
++++ b/Makefile	2011-08-01 00:47:56.000000000 +0200
+@@ -39,7 +39,7 @@
+ export PERL       := perl
+ 
+ # Location for installation
+-export prefix      = /usr
++export prefix      = $(INST)
+ export bindir      = $(prefix)/bin
+ export libdir      = $(prefix)/lib
+ export mandir      = $(prefix)/man
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/staging.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/staging.patch
new file mode 100644
index 0000000..03955f2
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/staging.patch
@@ -0,0 +1,144 @@
+Patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded)
+as of commit id eefb99a313bbcc8f34c8b32bf0c5aa2dd2580735
+Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
+
+Minor edits following upstream changes
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+Index: klibc-1.5.24/scripts/Kbuild.install
+===================================================================
+--- a/scripts/Kbuild.install	2011-07-27 15:50:53.000000000 +0200
++++ b/scripts/Kbuild.install	2011-08-01 00:03:03.000000000 +0200
+@@ -88,13 +88,10 @@
+ header:
+ 	$(Q)echo "  INSTALL headers + man pages to $(INSTALLROOT)$(INSTALLDIR)"
+ 	$(Q)mkdir -p $(INSTALLROOT)$(bindir)
+-	$(Q)mkdir -p $(INSTALLROOT)$(mandir)/man1
+-	$(Q)mkdir -p $(INSTALLROOT)$(SHLIBDIR)
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)
+ 	$(Q)-rm -rf $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
+ 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
+-	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
+ 	$(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
+ 		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
+ 	done
+@@ -103,7 +100,6 @@
+ 	done
+ 	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
+ 	$(Q)chmod -R a+rX $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
+-	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
+ 	$(Q)$(install-bin) $(objtree)/klcc/$(KCROSS)klcc $(INSTALLROOT)$(bindir)
+ 
+ footer: header
+
+Index: klibc-1.5.24/usr/dash/Kbuild
+===================================================================
+--- a/usr/dash/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/dash/Kbuild	2011-08-01 00:07:56.000000000 +0200
+@@ -92,5 +92,3 @@
+ $(obj)/syntax.h: $(obj)/syntax.c
+ 	$(Q):
+ 
+-# Targets to install
+-install-y := sh.shared
+
+Index: klibc-1.5.24/usr/gzip/Kbuild
+===================================================================
+--- a/usr/gzip/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/gzip/Kbuild	2011-08-01 00:06:39.000000000 +0200
+@@ -21,5 +21,3 @@
+ # Cleaning
+ targets := gzip gzip.g gunzip zcat
+ 
+-# Targets to install
+-install-y := gzip gunzip zcat
+
+Index: klibc-1.5.24/usr/kinit/fstype/Kbuild
+===================================================================
+--- a/usr/kinit/fstype/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/kinit/fstype/Kbuild	2011-08-01 00:09:12.000000000 +0200
+@@ -21,5 +21,3 @@
+ # Cleaning
+ clean-dirs := static shared
+ 
+-# install binary
+-install-y := $(shared-y)
+
+Index: klibc-1.5.24/usr/kinit/ipconfig/Kbuild
+===================================================================
+--- a/usr/kinit/ipconfig/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/kinit/ipconfig/Kbuild	2011-08-01 00:10:52.000000000 +0200
+@@ -27,5 +27,3 @@
+ # Cleaning
+ clean-dirs := static shared
+ 
+-# install binary
+-install-y := $(shared-y)
+
+Index: klibc-1.5.24/usr/kinit/Kbuild
+===================================================================
+--- a/usr/kinit/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/kinit/Kbuild	2011-08-01 00:20:18.000000000 +0200
+@@ -33,5 +33,3 @@
+ subdir- := fstype ipconfig nfsmount resume run-init
+ 
+ 
+-# install binary
+-install-y := kinit kinit.shared
+
+Index: klibc-1.5.24/usr/kinit/nfsmount/Kbuild
+===================================================================
+--- a/usr/kinit/nfsmount/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/kinit/nfsmount/Kbuild	2011-08-01 00:12:52.000000000 +0200
+@@ -23,5 +23,3 @@
+ 
+ clean-dirs := static shared
+ 
+-# Install binary
+-install-y := $(shared-y)
+
+Index: klibc-1.5.24/usr/kinit/resume/Kbuild
+===================================================================
+--- a/usr/kinit/resume/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/kinit/resume/Kbuild	2011-08-01 00:13:51.000000000 +0200
+@@ -26,5 +26,3 @@
+ # Cleaning
+ clean-dirs := static shared
+ 
+-# install binary
+-install-y := $(shared-y)
+
+Index: klibc-1.5.24/usr/kinit/run-init/Kbuild
+===================================================================
+--- a/usr/kinit/run-init/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/kinit/run-init/Kbuild	2011-08-01 00:14:41.000000000 +0200
+@@ -25,5 +25,3 @@
+ # Cleaning
+ clean-dirs := static shared
+ 
+-# install binary
+-install-y := $(shared-y)
+
+Index: klibc-1.5.24/usr/klibc/Kbuild
+===================================================================
+--- a/usr/klibc/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/klibc/Kbuild	2011-08-01 00:18:11.000000000 +0200
+@@ -177,5 +177,3 @@
+ 	          $(INSTALLROOT)$(INSTALLDIR)/$(KLIBCCROSS)lib))
+ 	$(Q)$(install-lib) $(obj)/klibc-$(SOLIBHASH).so \
+ 	                      $(INSTALLROOT)$(INSTALLDIR)/$(KLIBCCROSS)lib
+-	$(Q)$(install-lib) $(obj)/klibc-$(SOLIBHASH).so \
+-	                      $(INSTALLROOT)$(SHLIBDIR)
+
+Index: klibc-1.5.24/usr/utils/Kbuild
+===================================================================
+--- a/usr/utils/Kbuild	2011-07-27 15:50:53.000000000 +0200
++++ b/usr/utils/Kbuild	2011-08-01 00:19:13.000000000 +0200
+@@ -72,5 +72,3 @@
+ # Clean deletes the static and shared dir
+ clean-dirs := static shared
+ 
+-# install only install the shared binaries
+-install-y := $(shared-y) shared/reboot shared/poweroff
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/use-env-for-perl.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/use-env-for-perl.patch
new file mode 100644
index 0000000..eac128c
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/use-env-for-perl.patch
@@ -0,0 +1,25 @@
+Patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded)
+as of commit id 676cbb54d42c89a4832871064cfcb7ee2ad372ee
+
+klcc-cross: Add patch to use /usr/bin/env perl
+Certain configurations (such as autobuilders) may build in very
+deep paths (that are longer than the #! mechanism allows) which
+makes it unsafe to use the direct path for perl.  In our case we know
+that /usr/bin/env perl will always return ours (if it has been built).
+
+Signed-off-by: Tom Rini <tom_rini@mentor.com>
+
+Index: klibc-1.5.20/klcc/makeklcc.pl
+===================================================================
+--- a/klcc/makeklcc.pl
++++ b/klcc/makeklcc.pl
+@@ -26,7 +26,7 @@ sub pathsearch($) {
+     return undef;
+ }
+ 
+-print "#!${perlpath}\n";
++print "#!/usr/bin/env perl\n";
+ 
+ open(KLIBCCONF, "< $klibcconf\0")
+     or die "$0: cannot open $klibcconf: $!\n";
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/wc.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/wc.patch
new file mode 100644
index 0000000..28705fd
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26+2.0/wc.patch
@@ -0,0 +1,245 @@
+Patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded)
+as of commit id acb6fa33fccf7196c86a3a28f927d4fa441d05eb
+
+klibc: add wc to tools
+ * for use with uniboot
+
+Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
+
+diff --git a/usr/utils/Kbuild b/usr/utils/Kbuild
+index a52ea61..7c8ccfb 100644
+--- a/usr/utils/Kbuild
++++ b/usr/utils/Kbuild
+@@ -3,7 +3,7 @@
+ #
+ 
+ progs := chroot dd mkdir mkfifo mknod mount pivot_root umount
+-progs += true false sleep ln mv nuke minips cat ls losetup
++progs += true false sleep ln mv nuke minips cat ls losetup wc
+ progs += uname halt kill readlink cpio sync dmesg modprobe
+ 
+ static-y := $(addprefix static/, $(progs))
+@@ -62,6 +62,8 @@ static/losetup-y    := losetup.o
+ shared/losetup-y    := losetup.o
+ static/modprobe-y   := modprobe.o
+ shared/modprobe-y   := modprobe.o
++static/wc-y	    := wc.o
++shared/wc-y	    := wc.o
+ 
+ # Additionally linked targets
+ always := static/reboot static/poweroff shared/reboot shared/poweroff
+diff --git a/usr/utils/wc.c b/usr/utils/wc.c
+new file mode 100644
+index 0000000..f5059fc
+--- /dev/null
++++ b/usr/utils/wc.c
+@@ -0,0 +1,208 @@
++/* vi: set sw=4 ts=4: */
++/*
++ * wc implementation for busybox
++ *
++ * Copyright (C) 2003  Manuel Novoa III  <mjn3@codepoet.org>
++ *
++ * Licensed under GPLv2 or later, see file LICENSE in this tarball for details.
++ */
++
++/* BB_AUDIT SUSv3 _NOT_ compliant -- option -m is not currently supported. */
++/* http://www.opengroup.org/onlinepubs/007904975/utilities/wc.html */
++
++/* Mar 16, 2003      Manuel Novoa III   (mjn3@codepoet.org)
++ *
++ * Rewritten to fix a number of problems and do some size optimizations.
++ * Problems in the previous busybox implementation (besides bloat) included:
++ *  1) broken 'wc -c' optimization (read note below)
++ *  2) broken handling of '-' args
++ *  3) no checking of ferror on EOF returns
++ *  4) isprint() wasn't considered when word counting.
++ *
++ * TODO:
++ *
++ * When locale support is enabled, count multibyte chars in the '-m' case.
++ *
++ * NOTES:
++ *
++ * The previous busybox wc attempted an optimization using stat for the
++ * case of counting chars only.  I omitted that because it was broken.
++ * It didn't take into account the possibility of input coming from a
++ * pipe, or input from a file with file pointer not at the beginning.
++ *
++ * To implement such a speed optimization correctly, not only do you
++ * need the size, but also the file position.  Note also that the
++ * file position may be past the end of file.  Consider the example
++ * (adapted from example in gnu wc.c)
++ *
++ *      echo hello > /tmp/testfile &&
++ *      (dd ibs=1k skip=1 count=0 &> /dev/null; wc -c) < /tmp/testfile
++ *
++ * for which 'wc -c' should output '0'.
++ */
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <unistd.h>
++#undef isspace
++#undef isprint
++#define isspace(c) ((((c) == ' ') || (((unsigned int)((c) - 9)) <= (13 - 9))))
++#define isprint(c) (((unsigned int)((c) - 0x20)) <= (0x7e - 0x20))
++#define isspace_given_isprint(c) ((c) == ' ')
++
++#define COUNT_T unsigned long
++#define COUNT_FMT "u"
++#define optind 1
++FILE *fopen_or_warn_stdin(const char *filename)
++{
++        FILE *fp = stdin;
++
++        if (filename[0]) {
++                fp = fopen(filename, "r");
++        }
++
++        return fp;
++}
++
++enum {
++	WC_LINES	= 0,
++	WC_WORDS	= 1,
++	WC_CHARS	= 2,
++	WC_LENGTH	= 3
++};
++
++int main(int argc, char **argv)
++{
++	FILE *fp;
++	const char *s, *arg;
++	const char *start_fmt = "%9"COUNT_FMT;
++	const char *fname_fmt = " %s\n";
++	COUNT_T *pcounts;
++	COUNT_T counts[4];
++	COUNT_T totals[4];
++	unsigned linepos;
++	unsigned u;
++	int num_files = 0;
++	int c;
++	signed char status = EXIT_SUCCESS;
++	signed char in_word;
++	unsigned print_type;
++
++	print_type = getopt(argc, argv, "lwcL");
++
++	if (print_type == 0) {
++		print_type = (1 << WC_LINES) | (1 << WC_WORDS) | (1 << WC_CHARS);
++	}
++
++	argv += optind;
++	if (!argv[0]) {
++		*--argv = (char *) "wc";
++		fname_fmt = "\n";
++		if (!((print_type-1) & print_type)) /* exactly one option? */
++			start_fmt = "%"COUNT_FMT;
++	}
++
++	memset(totals, 0, sizeof(totals));
++
++	pcounts = counts;
++
++	while ((arg = *argv++) != 0) {
++		++num_files;
++		fp = fopen_or_warn_stdin(arg);
++		if (!fp) {
++			status = EXIT_FAILURE;
++			continue;
++		}
++
++		memset(counts, 0, sizeof(counts));
++		linepos = 0;
++		in_word = 0;
++
++		do {
++			/* Our -w doesn't match GNU wc exactly... oh well */
++
++			++counts[WC_CHARS];
++			c = getc(fp);
++			if (isprint(c)) {
++				++linepos;
++				if (!isspace_given_isprint(c)) {
++					in_word = 1;
++					continue;
++				}
++			} else if (((unsigned int)(c - 9)) <= 4) {
++				/* \t  9
++				 * \n 10
++				 * \v 11
++				 * \f 12
++				 * \r 13
++				 */
++				if (c == '\t') {
++					linepos = (linepos | 7) + 1;
++				} else {			/* '\n', '\r', '\f', or '\v' */
++				DO_EOF:
++					if (linepos > counts[WC_LENGTH]) {
++						counts[WC_LENGTH] = linepos;
++					}
++					if (c == '\n') {
++						++counts[WC_LINES];
++					}
++					if (c != '\v') {
++						linepos = 0;
++					}
++				}
++			} else if (c == EOF) {
++/*				if (ferror(fp)) {
++					status = EXIT_FAILURE;
++				}
++*/				--counts[WC_CHARS];
++				goto DO_EOF;		/* Treat an EOF as '\r'. */
++			} else {
++				continue;
++			}
++
++			counts[WC_WORDS] += in_word;
++			in_word = 0;
++			if (c == EOF) {
++				break;
++			}
++		} while (1);
++
++		if (totals[WC_LENGTH] < counts[WC_LENGTH]) {
++			totals[WC_LENGTH] = counts[WC_LENGTH];
++		}
++		totals[WC_LENGTH] -= counts[WC_LENGTH];
++
++		if(fp != stdin)
++			fclose(fp);
++
++	OUTPUT:
++		/* coreutils wc tries hard to print pretty columns
++		 * (saves results for all files, find max col len etc...)
++		 * we won't try that hard, it will bloat us too much */
++		s = start_fmt;
++		u = 0;
++		do {
++			if (print_type & (1 << u)) {
++				printf(s, pcounts[u]);
++				s = " %9"COUNT_FMT; /* Ok... restore the leading space. */
++			}
++			totals[u] += pcounts[u];
++		} while (++u < 4);
++		printf(fname_fmt, arg);
++	}
++
++	/* If more than one file was processed, we want the totals.  To save some
++	 * space, we set the pcounts ptr to the totals array.  This has the side
++	 * effect of trashing the totals array after outputting it, but that's
++	 * irrelavent since we no longer need it. */
++	if (num_files > 1) {
++		num_files = 0;				/* Make sure we don't get here again. */
++		arg = "total";
++		pcounts = totals;
++		--argv;
++		goto OUTPUT;
++	}
++
++	fflush(stdout);
++	exit(status);
++}
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/dash_readopt.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/dash_readopt.patch
deleted file mode 100644
index 3be1be0..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/dash_readopt.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id ad67a97e8fbfb03a68088a6ca6ad87b086c88094
-Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
-Minor adjustments tracking upstream changes
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
-diff -uNr klibc-1.5.22.orig//usr/dash/miscbltin.c klibc-1.5.22/usr/dash/miscbltin.c
---- klibc-1.5.22.orig//usr/dash/miscbltin.c	2011-06-11 02:08:49.000000000 +0200
-+++ klibc-1.5.22/usr/dash/miscbltin.c	2011-06-11 13:55:32.000000000 +0200
-@@ -46,6 +46,7 @@
- #include <ctype.h>
- #include <inttypes.h>
- #include <time.h>		/* strtotimeval() */
-+#include <termios.h>
- 
- #include "shell.h"
- #include "options.h"
-@@ -149,6 +150,11 @@
- 	int timeout;
- 	int i;
- 	fd_set set;
-+	int n_flag = 0;
-+	unsigned int nchars = 0;
-+	int silent = 0;
-+	struct termios tty, old_tty;
-+
- 	struct timeval ts, t0, t1, to;
- 
- 	ts.tv_sec = ts.tv_usec = 0;
-@@ -156,11 +162,18 @@
- 	rflag = 0;
- 	timeout = 0;
- 	prompt = NULL;
--	while ((i = nextopt("p:rt:")) != '\0') {
-+	while ((i = nextopt("p:rt:n:s")) != '\0') {
- 		switch(i) {
- 		case 'p':
- 			prompt = optionarg;
- 			break;
-+		case 'n':
-+			nchars = strtoul(optionarg, NULL, 10);
-+			n_flag = nchars; /* just a flag "nchars is nonzero" */
-+			break;
-+		case 's':
-+			silent = 1;
-+			break;
- 		case 't':
- 			p = strtotimeval(optionarg, &ts);
- 			if (*p || (!ts.tv_sec && !ts.tv_usec))
-@@ -182,6 +197,24 @@
- 	}
- 	if (*(ap = argptr) == NULL)
- 		sh_error("arg count");
-+	if (n_flag || silent) {
-+		if (tcgetattr(0, &tty) != 0) {
-+			/* Not a tty */
-+			n_flag = 0;
-+			silent = 0;
-+		} else {
-+			old_tty = tty;
-+			if (n_flag) {
-+				tty.c_lflag &= ~ICANON;
-+				tty.c_cc[VMIN] = nchars < 256 ? nchars : 255;
-+			}
-+			if (silent) {
-+				tty.c_lflag &= ~(ECHO | ECHOK | ECHONL);
-+			}
-+			tcsetattr(0, TCSANOW, &tty);
-+		}
-+	}
-+
- 
- 	status = 0;
- 	if (timeout) {
-@@ -200,12 +231,14 @@
-	goto start;
- 
--	for (;;) {
-+	do {
- 		if (timeout) {
- 			gettimeofday(&t1, NULL);
- 			if (t1.tv_sec > ts.tv_sec ||
- 			    (t1.tv_sec == ts.tv_sec &&
- 			     t1.tv_usec >= ts.tv_usec)) {
- 				status = 1;
-+				if (n_flag)
-+					tcsetattr(0, TCSANOW, &old_tty);
- 				break;	/* Timeout! */
- 			}
- 
-@@ -222,6 +255,8 @@
- 			FD_SET(0, &set);
- 			if (select(1, &set, NULL, NULL, &to) != 1) {
- 				status = 1;
-+				if (n_flag)
-+					tcsetattr(0, TCSANOW, &old_tty);
- 				break; /* Timeout! */
- 			}
- 		}
-@@ -263,6 +298,9 @@
- 			newloc = startloc - 1;
- 		}
--	}
-+	} while (!n_flag || --nchars);
-+	if (n_flag || silent)
-+		tcsetattr(0, TCSANOW, &old_tty);
-+
- out:
- 	recordregion(startloc, p - (char *)stackblock(), 0);
- 	STACKSTRNUL(p);
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/fstype-sane-vfat-and-jffs2-for-1.5.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/fstype-sane-vfat-and-jffs2-for-1.5.patch
deleted file mode 100644
index 3fec98d..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/fstype-sane-vfat-and-jffs2-for-1.5.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id 2a98e2a2c1b55a0eb0ac09f2f9b55db2e4c23553
-Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
-Refresh and fixes as of commit id 5dbd8d611f3cb7eb8baddb17211d6077e2060fdb
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
-Index: klibc-1.5.22/usr/kinit/fstype/fstype.c
-===================================================================
---- a/usr/kinit/fstype/fstype.c
-+++ b/usr/kinit/fstype/fstype.c
-@@ -20,7 +20,7 @@
- #include <netinet/in.h>
- #include <sys/utsname.h>
- #include <sys/vfs.h>
--
-+#include <linux/types.h>
- #define cpu_to_be32(x) __cpu_to_be32(x)	/* Needed by romfs_fs.h */
- 
- #include "btrfs.h"
-@@ -38,6 +38,12 @@
- #include "squashfs_fs.h"
- #include "xfs_sb.h"
- 
-+#if __BYTE_ORDER == __BIG_ENDIAN
-+#include <linux/byteorder/big_endian.h>
-+#else
-+#include <linux/byteorder/little_endian.h>
-+#endif
-+
- /*
-  * Slightly cleaned up version of jfs_superblock to
-  * avoid pulling in other kernel header files.
-@@ -60,6 +66,30 @@
- /* Swap needs the definition of block size */
- #include "swap_fs.h"
- 
-+static int jffs2_image(const void *buf, unsigned long long *blocks)
-+{
-+	const unsigned char *p = buf;
-+
-+	if (p[0] == 0x85 && p[1] == 0x19) {
-+		*blocks=0;
-+		return 1;
-+	}
-+	return 0;
-+}
-+
-+static int vfat_image(const void *buf, unsigned long long *blocks)
-+{
-+	const char *p = buf;
-+
-+	if (!strncmp(p + 54, "FAT12   ", 8)
-+	 || !strncmp(p + 54, "FAT16   ", 8)
-+	 || !strncmp(p + 82, "FAT32   ", 8)) {
-+		*blocks=0;
-+		return 1;
-+	}
-+	return 0;
-+}
-+
- static int gzip_image(const void *buf, unsigned long long *bytes)
- {
- 	const unsigned char *p = buf;
-@@ -495,6 +525,8 @@ static struct imagetype images[] = {
- 	{1, "ext3", ext3_image},
- 	{1, "ext2", ext2_image},
- 	{1, "minix", minix_image},
-+	{0, "jffs2", jffs2_image},
-+	{0, "vfat", vfat_image},
- 	{1, "nilfs2", nilfs2_image},
- 	{2, "ocfs2", ocfs2_image},
- 	{8, "reiserfs", reiserfs_image},
-
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/kernel_3.2__aligned_u64.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/kernel_3.2__aligned_u64.patch
deleted file mode 100644
index c2369cd..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/kernel_3.2__aligned_u64.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 7f47891c1678874cccca66cd25e6a13486c86d78 Mon Sep 17 00:00:00 2001
-From: =?utf8?q?Maciej=20=C5=BBenczykowski?= <zenczykowski@gmail.com>
-Date: Sun, 6 Nov 2011 14:33:40 -0800
-Subject: [PATCH] [klibc] include: [sys/types.h] -> linux/types.h and
- __aligned_u64
-
-When building klibc 1.5.25 against linux/master (ie. post 3.1) I'm seeing:
-
-klibc/generated/include/linux/if_packet.h:176: error: expected
-specifier-qualifier-list before '__aligned_u64'
-
-which seems to come from upstream commits:
-0d4691ce112be025019999df5f2a5e00c03f03c2 remotes/linux/master~90^2~408  (origin)
-96c131842aab45b5d139d0bcb417796819f5ee92 remotes/linux/master~90^2~169
- (change from aligned_u64 to __aligned_u64)
-
-and collides with klibc/usr/include/sys/types.h
-
-/* Keeps linux/types.h from getting included elsewhere */
-#define _LINUX_TYPES_H
-
-not defining __aligned_u64 like the kernel's include/linux/types.h does.
-
-Signed-off-by: maximilian attems <max@stro.at>
----
- usr/include/sys/types.h |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/usr/include/sys/types.h b/usr/include/sys/types.h
-index 6780ed1..3a4c738 100644
---- a/usr/include/sys/types.h
-+++ b/usr/include/sys/types.h
-@@ -100,6 +100,10 @@ typedef uint16_t __sum16;
- typedef uint32_t __sum32;
- typedef uint64_t __sum64;
- 
-+#define __aligned_u64 __u64 __attribute__((aligned(8)))
-+#define __aligned_be64 __be64 __attribute__((aligned(8)))
-+#define __aligned_le64 __le64 __attribute__((aligned(8)))
-+
- /*
-  * Some headers seem to require this...
-  */
--- 
-1.7.6.5
-
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klcc_prefix.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klcc_prefix.patch
deleted file mode 100644
index a4a0026..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klcc_prefix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id a29bf15b9c9c0d15f96c254b2ed830e104ae3436
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
-Index: klibc-1.5.19/klcc/Kbuild
-===================================================================
---- --- klibc-1.5.19.orig/klcc/Kbuild	2010-07-07 14:07:48.000000000 +0200
-+++ --- klibc-1.5.19./klcc/Kbuild	2010-08-18 23:39:23.000000000 +0200
-@@ -22,10 +22,10 @@
- 	$(Q)echo 'EMAIN=$(KLIBCEMAIN)' >> $@
- 	$(Q)echo 'BITSIZE=$(KLIBCBITSIZE)' >> $@
- 	$(Q)echo 'VERSION=$(shell cat $(srctree)/usr/klibc/version)' >> $@
--	$(Q)echo 'prefix=$(INSTALLDIR)' >> $@
--	$(Q)echo 'bindir=$(INSTALLDIR)/$(KCROSS)bin' >> $@
--	$(Q)echo 'libdir=$(INSTALLDIR)/$(KCROSS)lib' >> $@
--	$(Q)echo 'includedir=$(INSTALLDIR)/$(KCROSS)include' >> $@
-+	$(Q)echo 'prefix=$(KLCC_INST)' >> $@
-+	$(Q)echo 'bindir=$(KLCC_INST)/$(KCROSS)bin' >> $@
-+	$(Q)echo 'libdir=$(KLCC_INST)/$(KCROSS)lib' >> $@
-+	$(Q)echo 'includedir=$(KLCC_INST)/$(KCROSS)include' >> $@
- 
- 
- # Generate klcc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klibc-config-eabi.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klibc-config-eabi.patch
deleted file mode 100644
index 316c80a..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klibc-config-eabi.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id b6764cf32ec93547531130dca364fb95e1c495f4
-Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
-
-diff -Nur klibc-1.5/defconfig klibc-1.5p/defconfig
---- klibc-1.5/defconfig	2007-03-04 02:52:10.000000000 +0100
-+++ klibc-1.5p/defconfig	2008-02-08 19:24:22.337127756 +0100
-@@ -5,4 +5,4 @@
- CONFIG_REGPARM=y
- # ARM options
- # CONFIG_KLIBC_THUMB is not set
--# CONFIG_AEABI is not set
-+CONFIG_AEABI=y
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klibc-linux-libc-dev.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klibc-linux-libc-dev.patch
deleted file mode 100644
index 3c55e14..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/klibc-linux-libc-dev.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-commit 43adf69062254fb4f8d4d11fb5fe36a60ae25d5a
-Author: Ben Hutchings <ben@decadent.org.uk>
-Date:   Sun Mar 14 18:41:56 2010 +0000
-
-    Taken from debian "Fix klibc Debian specific build trouble"
-
-Index: klibc-2.0~rc2/scripts/Kbuild.install
-===================================================================
---- klibc-2.0~rc2.orig/scripts/Kbuild.install	2012-02-11 18:50:21.000000000 +0000
-+++ klibc-2.0~rc2/scripts/Kbuild.install	2012-02-11 19:04:52.000000000 +0000
-@@ -95,8 +95,11 @@
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
--	$(Q)$(MAKE) -C $(KLIBCKERNELSRC) ARCH=$(KLIBCARCH) INSTALL_HDR_PATH=$(INSTALLROOT)$(INSTALLDIR)/$(KCROSS) headers_install
-+	$(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
-+		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
-+	done
- 	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
-+	$(Q)chmod -R a+rX $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
- 	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
- 	$(Q)$(install-bin) $(objtree)/klcc/$(KCROSS)klcc $(INSTALLROOT)$(bindir)
- 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/modprobe.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/modprobe.patch
deleted file mode 100644
index eb2fb39..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/modprobe.patch
+++ /dev/null
@@ -1,1984 +0,0 @@
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id 70ae69edb02e0174db0841ae501299159c888514
-Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
-Minor adjustments tracking upstream changes
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
-diff --git a/usr/utils/Kbuild b/usr/utils/Kbuild
---- a/usr/utils/Kbuild
-+++ b/usr/utils/Kbuild
-@@ -4,7 +4,7 @@
- 
- progs := chroot dd mkdir mkfifo mknod mount pivot_root umount
- progs += true false sleep ln mv nuke minips cat ls losetup
--progs += uname halt kill readlink cpio sync dmesg
-+progs += uname halt kill readlink cpio sync dmesg modprobe
- 
- static-y := $(addprefix static/, $(progs))
- shared-y := $(addprefix shared/, $(progs))
-@@ -58,6 +58,8 @@ static/sync-y       := sync.o
- shared/sync-y       := sync.o
- static/losetup-y    := losetup.o
- shared/losetup-y    := losetup.o
-+static/modprobe-y   := modprobe.o
-+shared/modprobe-y   := modprobe.o
- 
- # Additionally linked targets
- always := static/reboot static/poweroff shared/reboot shared/poweroff
-diff --git a/usr/utils/list.h b/usr/utils/list.h
---- /dev/null
-+++ b/usr/utils/list.h
-@@ -0,0 +1,238 @@
-+/* Stolen from Linux Kernel Source's list.h -- GPL. */
-+#ifndef _MODINITTOOLS_LIST_H
-+#define _MODINITTOOLS_LIST_H
-+
-+#undef offsetof
-+#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
-+
-+/**
-+ * container_of - cast a member of a structure out to the containing structure
-+ *
-+ * @ptr:	the pointer to the member.
-+ * @type:	the type of the container struct this is embedded in.
-+ * @member:	the name of the member within the struct.
-+ *
-+ */
-+#define container_of(ptr, type, member) ({			\
-+        const typeof( ((type *)0)->member ) *__mptr = (ptr);	\
-+        (type *)( (char *)__mptr - offsetof(type,member) );})
-+
-+/*
-+ * Simple doubly linked list implementation.
-+ *
-+ * Some of the internal functions ("__xxx") are useful when
-+ * manipulating whole lists rather than single entries, as
-+ * sometimes we already know the next/prev entries and we can
-+ * generate better code by using them directly rather than
-+ * using the generic single-entry routines.
-+ */
-+
-+struct list_head {
-+	struct list_head *next, *prev;
-+};
-+
-+#define LIST_HEAD_INIT(name) { &(name), &(name) }
-+
-+#define LIST_HEAD(name) \
-+	struct list_head name = LIST_HEAD_INIT(name)
-+
-+#define INIT_LIST_HEAD(ptr) do { \
-+	(ptr)->next = (ptr); (ptr)->prev = (ptr); \
-+} while (0)
-+
-+/*
-+ * Insert a new entry between two known consecutive entries.
-+ *
-+ * This is only for internal list manipulation where we know
-+ * the prev/next entries already!
-+ */
-+static inline void __list_add(struct list_head *new,
-+			      struct list_head *prev,
-+			      struct list_head *next)
-+{
-+	next->prev = new;
-+	new->next = next;
-+	new->prev = prev;
-+	prev->next = new;
-+}
-+
-+/**
-+ * list_add - add a new entry
-+ * @new: new entry to be added
-+ * @head: list head to add it after
-+ *
-+ * Insert a new entry after the specified head.
-+ * This is good for implementing stacks.
-+ */
-+static inline void list_add(struct list_head *new, struct list_head *head)
-+{
-+	__list_add(new, head, head->next);
-+}
-+
-+/**
-+ * list_add_tail - add a new entry
-+ * @new: new entry to be added
-+ * @head: list head to add it before
-+ *
-+ * Insert a new entry before the specified head.
-+ * This is useful for implementing queues.
-+ */
-+static inline void list_add_tail(struct list_head *new, struct list_head *head)
-+{
-+	__list_add(new, head->prev, head);
-+}
-+
-+/*
-+ * Delete a list entry by making the prev/next entries
-+ * point to each other.
-+ *
-+ * This is only for internal list manipulation where we know
-+ * the prev/next entries already!
-+ */
-+static inline void __list_del(struct list_head * prev, struct list_head * next)
-+{
-+	next->prev = prev;
-+	prev->next = next;
-+}
-+
-+/**
-+ * list_del - deletes entry from list.
-+ * @entry: the element to delete from the list.
-+ * Note: list_empty on entry does not return true after this, the entry is
-+ * in an undefined state.
-+ */
-+static inline void list_del(struct list_head *entry)
-+{
-+	__list_del(entry->prev, entry->next);
-+}
-+
-+/**
-+ * list_del_init - deletes entry from list and reinitialize it.
-+ * @entry: the element to delete from the list.
-+ */
-+static inline void list_del_init(struct list_head *entry)
-+{
-+	__list_del(entry->prev, entry->next);
-+	INIT_LIST_HEAD(entry);
-+}
-+
-+/**
-+ * list_move - delete from one list and add as another's head
-+ * @list: the entry to move
-+ * @head: the head that will precede our entry
-+ */
-+static inline void list_move(struct list_head *list, struct list_head *head)
-+{
-+        __list_del(list->prev, list->next);
-+        list_add(list, head);
-+}
-+
-+/**
-+ * list_move_tail - delete from one list and add as another's tail
-+ * @list: the entry to move
-+ * @head: the head that will follow our entry
-+ */
-+static inline void list_move_tail(struct list_head *list,
-+				  struct list_head *head)
-+{
-+        __list_del(list->prev, list->next);
-+        list_add_tail(list, head);
-+}
-+
-+/**
-+ * list_empty - tests whether a list is empty
-+ * @head: the list to test.
-+ */
-+static inline int list_empty(struct list_head *head)
-+{
-+	return head->next == head;
-+}
-+
-+static inline void __list_splice(struct list_head *list,
-+				 struct list_head *head)
-+{
-+	struct list_head *first = list->next;
-+	struct list_head *last = list->prev;
-+	struct list_head *at = head->next;
-+
-+	first->prev = head;
-+	head->next = first;
-+
-+	last->next = at;
-+	at->prev = last;
-+}
-+
-+/**
-+ * list_splice - join two lists
-+ * @list: the new list to add.
-+ * @head: the place to add it in the first list.
-+ */
-+static inline void list_splice(struct list_head *list, struct list_head *head)
-+{
-+	if (!list_empty(list))
-+		__list_splice(list, head);
-+}
-+
-+/**
-+ * list_splice_init - join two lists and reinitialise the emptied list.
-+ * @list: the new list to add.
-+ * @head: the place to add it in the first list.
-+ *
-+ * The list at @list is reinitialised
-+ */
-+static inline void list_splice_init(struct list_head *list,
-+				    struct list_head *head)
-+{
-+	if (!list_empty(list)) {
-+		__list_splice(list, head);
-+		INIT_LIST_HEAD(list);
-+	}
-+}
-+
-+/**
-+ * list_entry - get the struct for this entry
-+ * @ptr:	the &struct list_head pointer.
-+ * @type:	the type of the struct this is embedded in.
-+ * @member:	the name of the list_struct within the struct.
-+ */
-+#define list_entry(ptr, type, member) \
-+	container_of(ptr, type, member)
-+
-+/**
-+ * list_for_each	-	iterate over a list
-+ * @pos:	the &struct list_head to use as a loop counter.
-+ * @head:	the head for your list.
-+ */
-+#define list_for_each(pos, head) \
-+	for (pos = (head)->next; pos != (head); pos = pos->next)
-+
-+/**
-+ * list_for_each_prev	-	iterate over a list backwards
-+ * @pos:	the &struct list_head to use as a loop counter.
-+ * @head:	the head for your list.
-+ */
-+#define list_for_each_prev(pos, head) \
-+	for (pos = (head)->prev; pos != (head); pos = pos->prev)
-+
-+/**
-+ * list_for_each_safe	-	iterate over a list safe against removal of list entry
-+ * @pos:	the &struct list_head to use as a loop counter.
-+ * @n:		another &struct list_head to use as temporary storage
-+ * @head:	the head for your list.
-+ */
-+#define list_for_each_safe(pos, n, head) \
-+	for (pos = (head)->next, n = pos->next; pos != (head); \
-+		pos = n, n = pos->next)
-+
-+/**
-+ * list_for_each_entry	-	iterate over list of given type
-+ * @pos:	the type * to use as a loop counter.
-+ * @head:	the head for your list.
-+ * @member:	the name of the list_struct within the struct.
-+ */
-+#define list_for_each_entry(pos, head, member)				\
-+	for (pos = list_entry((head)->next, typeof(*pos), member);	\
-+	     &pos->member != (head);					\
-+	     pos = list_entry(pos->member.next, typeof(*pos), member))
-+
-+#endif
-diff --git a/usr/utils/modprobe.c b/usr/utils/modprobe.c
---- /dev/null
-+++ b/usr/utils/modprobe.c
-@@ -0,0 +1,1710 @@
-+/* modprobe.c: insert a module into the kernel, intelligently.
-+    Copyright (C) 2001  Rusty Russell.
-+    Copyright (C) 2002, 2003  Rusty Russell, IBM Corporation.
-+
-+    This program is free software; you can redistribute it and/or modify
-+    it under the terms of the GNU General Public License as published by
-+    the Free Software Foundation; either version 2 of the License, or
-+    (at your option) any later version.
-+
-+    This program is distributed in the hope that it will be useful,
-+    but WITHOUT ANY WARRANTY; without even the implied warranty of
-+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+    GNU General Public License for more details.
-+
-+    You should have received a copy of the GNU General Public License
-+    along with this program; if not, write to the Free Software
-+    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-+*/
-+#define _GNU_SOURCE /* asprintf */
-+
-+#include <sys/utsname.h>
-+#include <sys/types.h>
-+#include <sys/stat.h>
-+#include <sys/mman.h>
-+#include <fcntl.h>
-+#include <stdarg.h>
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <ctype.h>
-+#include <string.h>
-+#include <errno.h>
-+#include <unistd.h>
-+#include <dirent.h>
-+#include <limits.h>
-+#include <elf.h>
-+#include <getopt.h>
-+#include <fnmatch.h>
-+#include <asm/unistd.h>
-+#include <sys/wait.h>
-+#include <syslog.h>
-+#include <zlib.h>
-+
-+#define streq(a,b) (strcmp((a),(b)) == 0)
-+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
-+
-+#include "list.h"
-+static inline void try_old_version(const char *progname, char *argv[])
-+{
-+}
-+extern long init_module(void *, unsigned long, const char *);
-+extern long delete_module(const char *, unsigned int);
-+
-+struct module {
-+	struct list_head list;
-+	char *modname;
-+	char filename[0];
-+};
-+
-+#ifndef MODULE_DIR
-+#define MODULE_DIR "/lib/modules"
-+#endif
-+
-+typedef void (*errfn_t)(const char *fmt, ...);
-+
-+/* Do we use syslog or stderr for messages? */
-+static int log;
-+
-+static void message(const char *prefix, const char *fmt, va_list *arglist)
-+{
-+	char *buf, *buf2;
-+
-+	vasprintf(&buf, fmt, *arglist);
-+	asprintf(&buf2, "%s%s", prefix, buf);
-+
-+	if (log)
-+		syslog(LOG_NOTICE, "%s", buf2);
-+	else
-+		fprintf(stderr, "%s", buf2);
-+	free(buf2);
-+	free(buf);
-+}
-+void *grab_contents(gzFile *gzfd, unsigned long *size)
-+{
-+        unsigned int max = 16384;
-+        void *buffer = malloc(max);
-+        int ret;
-+
-+        if (!buffer)
-+                return NULL;
-+
-+        *size = 0;
-+        while ((ret = gzread(gzfd, buffer + *size, max - *size)) > 0) {
-+                *size += ret;
-+                if (*size == max) {
-+                        buffer = realloc(buffer, max *= 2);
-+                        if (!buffer)
-+                                return NULL;
-+                }
-+        }
-+        if (ret < 0) {
-+                free(buffer);
-+                buffer = NULL;
-+        }
-+        return buffer;
-+}
-+
-+void *grab_fd(int fd, unsigned long *size)
-+{
-+        gzFile gzfd;
-+
-+        gzfd = gzdopen(fd, "rb");
-+        if (!gzfd)
-+                return NULL;
-+
-+        /* gzclose(gzfd) would close fd, which would drop locks.
-+           Don't blame zlib: POSIX locking semantics are so horribly
-+           broken that they should be ripped out. */
-+        return grab_contents(gzfd, size);
-+}
-+void release_file(void *data, unsigned long size)
-+{
-+        free(data);
-+}
-+
-+
-+static int warned = 0;
-+static void warn(const char *fmt, ...)
-+{
-+	va_list arglist;
-+	warned++;
-+	va_start(arglist, fmt);
-+	message("WARNING: ", fmt, &arglist);
-+	va_end(arglist);
-+}
-+
-+static void fatal(const char *fmt, ...)
-+{
-+	va_list arglist;
-+	va_start(arglist, fmt);
-+	message("FATAL: ", fmt, &arglist);
-+	va_end(arglist);
-+	exit(1);
-+}
-+
-+
-+static void grammar(const char *cmd, const char *filename, unsigned int line)
-+{
-+	warn("%s line %u: ignoring bad line starting with '%s'\n",
-+	     filename, line, cmd);
-+}
-+
-+static void *do_nofail(void *ptr, const char *file, int line, const char *expr)
-+{
-+	if (!ptr) {
-+		fatal("Memory allocation failure %s line %d: %s.\n",
-+		      file, line, expr);
-+	}
-+	return ptr;
-+}
-+
-+#define NOFAIL(ptr)	do_nofail((ptr), __FILE__, __LINE__, #ptr)
-+
-+static void print_usage(const char *progname)
-+{
-+	fprintf(stderr,
-+		"Usage: %s [-v] [-V] [-C config-file] [-n] [-i] [-q] [-b] [-o <modname>] <modname> [parameters...]\n"
-+		"%s -r [-n] [-i] [-v] <modulename> ...\n"
-+		"%s -l -t <dirname> [ -a <modulename> ...]\n",
-+		progname, progname, progname);
-+	exit(1);
-+}
-+
-+static int fgetc_wrapped(FILE *file, unsigned int *linenum)
-+{
-+	for (;;) {
-+	  	int ch = fgetc(file);
-+		if (ch != '\\')
-+			return ch;
-+		ch = fgetc(file);
-+		if (ch != '\n')
-+			return ch;
-+		if (linenum)
-+			(*linenum)++;
-+	}
-+}
-+
-+static char *getline_wrapped(FILE *file, unsigned int *linenum)
-+{
-+	int size = 1024;
-+	int i = 0;
-+	char *buf = NOFAIL(malloc(size));
-+	for(;;) {
-+		int ch = fgetc_wrapped(file, linenum);
-+		if (i == size) {
-+			size *= 2;
-+			buf = NOFAIL(realloc(buf, size));
-+		}
-+		if (ch < 0 && i == 0) {
-+			free(buf);
-+			return NULL;
-+		}
-+		if (ch < 0 || ch == '\n') {
-+			if (linenum)
-+				(*linenum)++;
-+			buf[i] = '\0';
-+			return NOFAIL(realloc(buf, i+1));
-+		}
-+		buf[i++] = ch;
-+	}
-+}
-+
-+static struct module *find_module(const char *filename, struct list_head *list)
-+{
-+	struct module *i;
-+
-+	list_for_each_entry(i, list, list) {
-+		if (strcmp(i->filename, filename) == 0)
-+			return i;
-+	}
-+	return NULL;
-+}
-+
-+/* Convert filename to the module name.  Works if filename == modname, too. */
-+static void filename2modname(char *modname, const char *filename)
-+{
-+	const char *afterslash;
-+	unsigned int i;
-+
-+	afterslash = strrchr(filename, '/');
-+	if (!afterslash)
-+		afterslash = filename;
-+	else
-+		afterslash++;
-+
-+	/* Convert to underscores, stop at first . */
-+	for (i = 0; afterslash[i] && afterslash[i] != '.'; i++) {
-+		if (afterslash[i] == '-')
-+			modname[i] = '_';
-+		else
-+			modname[i] = afterslash[i];
-+	}
-+	modname[i] = '\0';
-+}
-+
-+static int lock_file(const char *filename)
-+{
-+	int fd = open(filename, O_RDWR, 0);
-+
-+	if (fd >= 0) {
-+		struct flock lock;
-+		lock.l_type = F_WRLCK;
-+		lock.l_whence = SEEK_SET;
-+		lock.l_start = 0;
-+		lock.l_len = 1;
-+		fcntl(fd, F_SETLKW, &lock);
-+	} else
-+		/* Read-only filesystem?  There goes locking... */
-+		fd = open(filename, O_RDONLY, 0);
-+	return fd;
-+}
-+
-+static void unlock_file(int fd)
-+{
-+	/* Valgrind is picky... */
-+	close(fd);
-+}
-+
-+static void add_module(char *filename, int namelen, struct list_head *list)
-+{
-+	struct module *mod;
-+
-+	/* If it's a duplicate: move it to the end, so it gets
-+	   inserted where it is *first* required. */
-+	mod = find_module(filename, list);
-+	if (mod)
-+		list_del(&mod->list);
-+	else {
-+		/* No match.  Create a new module. */
-+		mod = NOFAIL(malloc(sizeof(struct module) + namelen + 1));
-+		memcpy(mod->filename, filename, namelen);
-+		mod->filename[namelen] = '\0';
-+		mod->modname = NOFAIL(malloc(namelen + 1));
-+		filename2modname(mod->modname, mod->filename);
-+	}
-+
-+	list_add_tail(&mod->list, list);
-+}
-+
-+/* Compare len chars of a to b, with _ and - equivalent. */
-+static int modname_equal(const char *a, const char *b, unsigned int len)
-+{
-+	unsigned int i;
-+
-+	if (strlen(b) != len)
-+		return 0;
-+
-+	for (i = 0; i < len; i++) {
-+		if ((a[i] == '_' || a[i] == '-')
-+		    && (b[i] == '_' || b[i] == '-'))
-+			continue;
-+		if (a[i] != b[i])
-+			return 0;
-+	}
-+	return 1;
-+}
-+
-+/* Fills in list of modules if this is the line we want. */
-+static int add_modules_dep_line(char *line,
-+				const char *name,
-+				struct list_head *list)
-+{
-+	char *ptr;
-+	int len;
-+	char *modname;
-+
-+	/* Ignore lines without : or which start with a # */
-+	ptr = strchr(line, ':');
-+	if (ptr == NULL || line[strspn(line, "\t ")] == '#')
-+		return 0;
-+
-+	/* Is this the module we are looking for? */
-+	*ptr = '\0';
-+	if (strrchr(line, '/'))
-+		modname = strrchr(line, '/') + 1;
-+	else
-+		modname = line;
-+
-+	len = strlen(modname);
-+	if (strchr(modname, '.'))
-+		len = strchr(modname, '.') - modname;
-+	if (!modname_equal(modname, name, len))
-+		return 0;
-+
-+	/* Create the list. */
-+	add_module(line, ptr - line, list);
-+
-+	ptr++;
-+	for(;;) {
-+		char *dep_start;
-+		ptr += strspn(ptr, " \t");
-+		if (*ptr == '\0')
-+			break;
-+		dep_start = ptr;
-+		ptr += strcspn(ptr, " \t");
-+		add_module(dep_start, ptr - dep_start, list);
-+	}
-+	return 1;
-+}
-+
-+static void read_depends(const char *dirname,
-+			 const char *start_name,
-+			 struct list_head *list)
-+{
-+	char *modules_dep_name;
-+	char *line;
-+	FILE *modules_dep;
-+	int done = 0;
-+
-+	asprintf(&modules_dep_name, "%s/%s", dirname, "modules.dep");
-+	modules_dep = fopen(modules_dep_name, "r");
-+	if (!modules_dep)
-+		fatal("Could not load %s: %s\n",
-+		      modules_dep_name, strerror(errno));
-+
-+	/* Stop at first line, as we can have duplicates (eg. symlinks
-+           from boot/ */
-+	while (!done && (line = getline_wrapped(modules_dep, NULL)) != NULL) {
-+		done = add_modules_dep_line(line, start_name, list);
-+		free(line);
-+	}
-+	fclose(modules_dep);
-+	free(modules_dep_name);
-+}
-+
-+/* We use error numbers in a loose translation... */
-+static const char *insert_moderror(int err)
-+{
-+	switch (err) {
-+	case ENOEXEC:
-+		return "Invalid module format";
-+	case ENOENT:
-+		return "Unknown symbol in module, or unknown parameter (see dmesg)";
-+	case ENOSYS:
-+		return "Kernel does not have module support";
-+	default:
-+		return strerror(err);
-+	}
-+}
-+
-+static const char *remove_moderror(int err)
-+{
-+	switch (err) {
-+	case ENOENT:
-+		return "No such module";
-+	case ENOSYS:
-+		return "Kernel does not have module unloading support";
-+	default:
-+		return strerror(err);
-+	}
-+}
-+
-+/* Is module in /proc/modules?  If so, fill in usecount if not NULL. 
-+   0 means no, 1 means yes, -1 means unknown.
-+ */
-+static int module_in_kernel(const char *modname, unsigned int *usecount)
-+{
-+	FILE *proc_modules;
-+	char *line;
-+
-+again:
-+	/* Might not be mounted yet.  Don't fail. */
-+	proc_modules = fopen("/proc/modules", "r");
-+	if (!proc_modules)
-+		return -1;
-+
-+	while ((line = getline_wrapped(proc_modules, NULL)) != NULL) {
-+		char *entry = strtok(line, " \n");
-+
-+		if (entry && streq(entry, modname)) {
-+			/* If it exists, usecount is the third entry. */
-+			if (!strtok(NULL, " \n"))
-+				goto out;
-+
-+			if (!(entry = strtok(NULL, " \n"))) /* usecount */
-+				goto out;
-+			else
-+				if (usecount)
-+					*usecount = atoi(entry);
-+
-+			/* Followed by - then status. */
-+			if (strtok(NULL, " \n")
-+			    && (entry = strtok(NULL, " \n")) != NULL) {
-+				/* Locking will fail on ro fs, we might hit
-+				 * cases where module is in flux.  Spin. */
-+				if (streq(entry, "Loading")
-+				    || streq(entry, "Unloading")) {
-+					usleep(100000);
-+					free(line);
-+					fclose(proc_modules);
-+					goto again;
-+				}
-+			}
-+
-+		out:
-+			free(line);
-+			fclose(proc_modules);
-+			return 1;
-+		}
-+		free(line);
-+	}
-+	fclose(proc_modules);
-+	return 0;
-+}
-+
-+static void replace_modname(struct module *module,
-+			    void *mem, unsigned long len,
-+			    const char *oldname, const char *newname)
-+{
-+	char *p;
-+
-+	/* 64 - sizeof(unsigned long) - 1 */
-+	if (strlen(newname) > 55)
-+		fatal("New name %s is too long\n", newname);
-+
-+	/* Find where it is in the module structure.  Don't assume layout! */
-+	for (p = mem; p < (char *)mem + len - strlen(oldname); p++) {
-+		if (memcmp(p, oldname, strlen(oldname)) == 0) {
-+			strcpy(p, newname);
-+			return;
-+		}
-+	}
-+
-+	warn("Could not find old name in %s to replace!\n", module->filename);
-+}
-+
-+static void *get_section32(void *file,
-+			   unsigned long size,
-+			   const char *name,
-+			   unsigned long *secsize)
-+{
-+	Elf32_Ehdr *hdr = file;
-+	Elf32_Shdr *sechdrs = file + hdr->e_shoff;
-+	const char *secnames;
-+	unsigned int i;
-+
-+	/* Too short? */
-+	if (size < sizeof(*hdr))
-+		return NULL;
-+	if (size < hdr->e_shoff + hdr->e_shnum * sizeof(sechdrs[0]))
-+		return NULL;
-+	if (size < sechdrs[hdr->e_shstrndx].sh_offset)
-+		return NULL;
-+		
-+	secnames = file + sechdrs[hdr->e_shstrndx].sh_offset;
-+	for (i = 1; i < hdr->e_shnum; i++)
-+		if (strcmp(secnames + sechdrs[i].sh_name, name) == 0) {
-+			*secsize = sechdrs[i].sh_size;
-+			return file + sechdrs[i].sh_offset;
-+		}
-+	return NULL;
-+}
-+
-+static void *get_section64(void *file,
-+			   unsigned long size,
-+			   const char *name,
-+			   unsigned long *secsize)
-+{
-+	Elf64_Ehdr *hdr = file;
-+	Elf64_Shdr *sechdrs = file + hdr->e_shoff;
-+	const char *secnames;
-+	unsigned int i;
-+
-+	/* Too short? */
-+	if (size < sizeof(*hdr))
-+		return NULL;
-+	if (size < hdr->e_shoff + hdr->e_shnum * sizeof(sechdrs[0]))
-+		return NULL;
-+	if (size < sechdrs[hdr->e_shstrndx].sh_offset)
-+		return NULL;
-+		
-+	secnames = file + sechdrs[hdr->e_shstrndx].sh_offset;
-+	for (i = 1; i < hdr->e_shnum; i++)
-+		if (strcmp(secnames + sechdrs[i].sh_name, name) == 0) {
-+			*secsize = sechdrs[i].sh_size;
-+			return file + sechdrs[i].sh_offset;
-+		}
-+	return NULL;
-+}
-+
-+static int elf_ident(void *mod, unsigned long size)
-+{
-+	/* "\177ELF" <byte> where byte = 001 for 32-bit, 002 for 64 */
-+	char *ident = mod;
-+
-+	if (size < EI_CLASS || memcmp(mod, ELFMAG, SELFMAG) != 0)
-+		return ELFCLASSNONE;
-+	return ident[EI_CLASS];
-+}
-+
-+static void *get_section(void *file,
-+			 unsigned long size,
-+			 const char *name,
-+			 unsigned long *secsize)
-+{
-+	switch (elf_ident(file, size)) {
-+	case ELFCLASS32:
-+		return get_section32(file, size, name, secsize);
-+	case ELFCLASS64:
-+		return get_section64(file, size, name, secsize);
-+	default:
-+		return NULL;
-+	}
-+}
-+
-+static void rename_module(struct module *module,
-+			  void *mod,
-+			  unsigned long len,
-+			  const char *newname)
-+{
-+	void *modstruct;
-+	unsigned long modstruct_len;
-+
-+	/* Old-style */
-+	modstruct = get_section(mod, len, ".gnu.linkonce.this_module",
-+				&modstruct_len);
-+	/* New-style */
-+	if (!modstruct)
-+		modstruct = get_section(mod, len, "__module", &modstruct_len);
-+	if (!modstruct)
-+		warn("Could not find module name to change in %s\n",
-+		     module->filename);
-+	else
-+		replace_modname(module, modstruct, modstruct_len,
-+				module->modname, newname);
-+}
-+
-+/* Kernel told to ignore these sections if SHF_ALLOC not set. */
-+static void invalidate_section32(void *mod, const char *secname)
-+{
-+	Elf32_Ehdr *hdr = mod;
-+	Elf32_Shdr *sechdrs = mod + hdr->e_shoff;
-+	const char *secnames = mod + sechdrs[hdr->e_shstrndx].sh_offset;
-+	unsigned int i;
-+
-+	for (i = 1; i < hdr->e_shnum; i++)
-+		if (strcmp(secnames+sechdrs[i].sh_name, secname) == 0)
-+			sechdrs[i].sh_flags &= ~SHF_ALLOC;
-+}
-+
-+static void invalidate_section64(void *mod, const char *secname)
-+{
-+	Elf64_Ehdr *hdr = mod;
-+	Elf64_Shdr *sechdrs = mod + hdr->e_shoff;
-+	const char *secnames = mod + sechdrs[hdr->e_shstrndx].sh_offset;
-+	unsigned int i;
-+
-+	for (i = 1; i < hdr->e_shnum; i++)
-+		if (strcmp(secnames+sechdrs[i].sh_name, secname) == 0)
-+			sechdrs[i].sh_flags &= ~(unsigned long long)SHF_ALLOC;
-+}
-+
-+static void strip_section(struct module *module,
-+			  void *mod,
-+			  unsigned long len,
-+			  const char *secname)
-+{
-+	switch (elf_ident(mod, len)) {
-+	case ELFCLASS32:
-+		invalidate_section32(mod, secname);
-+		break;
-+	case ELFCLASS64:
-+		invalidate_section64(mod, secname);
-+		break;
-+	default:
-+		warn("Unknown module format in %s: not forcing version\n",
-+		     module->filename);
-+	}
-+}
-+
-+static const char *next_string(const char *string, unsigned long *secsize)
-+{
-+	/* Skip non-zero chars */
-+	while (string[0]) {
-+		string++;
-+		if ((*secsize)-- <= 1)
-+			return NULL;
-+	}
-+
-+	/* Skip any zero padding. */
-+	while (!string[0]) {
-+		string++;
-+		if ((*secsize)-- <= 1)
-+			return NULL;
-+	}
-+	return string;
-+}
-+
-+static void clear_magic(struct module *module, void *mod, unsigned long len)
-+{
-+	const char *p;
-+	unsigned long modlen;
-+
-+	/* Old-style: __vermagic section */
-+	strip_section(module, mod, len, "__vermagic");
-+
-+	/* New-style: in .modinfo section */
-+	for (p = get_section(mod, len, ".modinfo", &modlen);
-+	     p;
-+	     p = next_string(p, &modlen)) {
-+		if (strncmp(p, "vermagic=", strlen("vermagic=")) == 0) {
-+			memset((char *)p, 0, strlen(p));
-+			return;
-+		}
-+	}
-+}
-+
-+struct module_options
-+{
-+	struct module_options *next;
-+	char *modulename;
-+	char *options;
-+};
-+
-+struct module_command
-+{
-+	struct module_command *next;
-+	char *modulename;
-+	char *command;
-+};
-+
-+struct module_alias
-+{
-+	struct module_alias *next;
-+	char *module;
-+};
-+
-+struct module_blacklist
-+{
-+	struct module_blacklist *next;
-+	char *modulename;
-+};
-+
-+/* Link in a new option line from the config file. */
-+static struct module_options *
-+add_options(const char *modname,
-+	    const char *option,
-+	    struct module_options *options)
-+{
-+	struct module_options *new;
-+	char *tab; 
-+
-+	new = NOFAIL(malloc(sizeof(*new)));
-+	new->modulename = NOFAIL(strdup(modname));
-+	new->options = NOFAIL(strdup(option));
-+	/* We can handle tabs, kernel can't. */
-+	for (tab = strchr(new->options, '\t'); tab; tab = strchr(tab, '\t'))
-+		*tab = ' ';
-+	new->next = options;
-+	return new;
-+}
-+
-+/* Link in a new install line from the config file. */
-+static struct module_command *
-+add_command(const char *modname,
-+	       const char *command,
-+	       struct module_command *commands)
-+{
-+	struct module_command *new;
-+
-+	new = NOFAIL(malloc(sizeof(*new)));
-+	new->modulename = NOFAIL(strdup(modname));
-+	new->command = NOFAIL(strdup(command));
-+	new->next = commands;
-+	return new;
-+}
-+
-+/* Link in a new alias line from the config file. */
-+static struct module_alias *
-+add_alias(const char *modname, struct module_alias *aliases)
-+{
-+	struct module_alias *new;
-+
-+	new = NOFAIL(malloc(sizeof(*new)));
-+	new->module = NOFAIL(strdup(modname));
-+	new->next = aliases;
-+	return new;
-+}
-+
-+/* Link in a new blacklist line from the config file. */
-+static struct module_blacklist *
-+add_blacklist(const char *modname, struct module_blacklist *blacklist)
-+{
-+	struct module_blacklist *new;
-+
-+	new = NOFAIL(malloc(sizeof(*new)));
-+	new->modulename = NOFAIL(strdup(modname));
-+	new->next = blacklist;
-+	return new;
-+}
-+
-+/* Find blacklist commands if any. */
-+static  int
-+find_blacklist(const char *modname, const struct module_blacklist *blacklist)
-+{
-+	while (blacklist) {
-+		if (strcmp(blacklist->modulename, modname) == 0)
-+			return 1;
-+		blacklist = blacklist->next;
-+	}
-+	return 0;
-+}
-+
-+/* return a new alias list, with backlisted elems filtered out */
-+static struct module_alias *
-+apply_blacklist(const struct module_alias *aliases,
-+		const struct module_blacklist *blacklist)
-+{
-+	struct module_alias *result = NULL;
-+	while (aliases) {
-+		char *modname = aliases->module;
-+		if (!find_blacklist(modname, blacklist))
-+			result = add_alias(modname, result);
-+		aliases = aliases->next;
-+	}
-+	return result;
-+}
-+
-+/* Find install commands if any. */
-+static const char *find_command(const char *modname,
-+				const struct module_command *commands)
-+{
-+	while (commands) {
-+		if (fnmatch(commands->modulename, modname, 0) == 0)
-+			return commands->command;
-+		commands = commands->next;
-+	}
-+	return NULL;
-+}
-+
-+static char *append_option(char *options, const char *newoption)
-+{
-+	options = NOFAIL(realloc(options, strlen(options) + 1
-+				 + strlen(newoption) + 1));
-+	if (strlen(options)) strcat(options, " ");
-+	strcat(options, newoption);
-+	return options;
-+}
-+
-+/* Add to options */
-+static char *add_extra_options(const char *modname,
-+			       char *optstring,
-+			       const struct module_options *options)
-+{
-+	while (options) {
-+		if (strcmp(options->modulename, modname) == 0)
-+			optstring = append_option(optstring, options->options);
-+		options = options->next;
-+	}
-+	return optstring;
-+}
-+
-+/* If we don't flush, then child processes print before we do */
-+static void verbose_printf(int verbose, const char *fmt, ...)
-+{
-+	va_list arglist;
-+
-+	if (verbose) {
-+		va_start(arglist, fmt);
-+		vprintf(fmt, arglist);
-+		fflush(stdout);
-+		va_end(arglist);
-+	}
-+}
-+
-+/* Do an install/remove command: replace $CMDLINE_OPTS if it's specified. */
-+static void do_command(const char *modname,
-+		       const char *command,
-+		       int verbose, int dry_run,
-+		       errfn_t error,
-+		       const char *type,
-+		       const char *cmdline_opts)
-+{
-+	int ret;
-+	char *p, *replaced_cmd = NOFAIL(strdup(command));
-+
-+	while ((p = strstr(replaced_cmd, "$CMDLINE_OPTS")) != NULL) {
-+		char *new;
-+		asprintf(&new, "%.*s%s%s",
-+			 p - replaced_cmd, replaced_cmd, cmdline_opts,
-+			 p + strlen("$CMDLINE_OPTS"));
-+		NOFAIL(new);
-+		free(replaced_cmd);
-+		replaced_cmd = new;
-+	}
-+
-+	verbose_printf(verbose, "%s %s\n", type, replaced_cmd);
-+	if (dry_run)
-+		return;
-+
-+	setenv("MODPROBE_MODULE", modname, 1);
-+	ret = system(replaced_cmd);
-+	if (ret == -1 || WEXITSTATUS(ret))
-+		error("Error running %s command for %s\n", type, modname);
-+	free(replaced_cmd);
-+}
-+
-+/* Actually do the insert.  Frees second arg. */
-+static void insmod(struct list_head *list,
-+		   char *optstring,
-+		   const char *newname,
-+		   int first_time,
-+		   errfn_t error,
-+		   int dry_run,
-+		   int verbose,
-+		   const struct module_options *options,
-+		   const struct module_command *commands,
-+		   int ignore_commands,
-+		   int ignore_proc,
-+		   int strip_vermagic,
-+		   int strip_modversion,
-+		   const char *cmdline_opts)
-+{
-+	int ret, fd;
-+	unsigned long len;
-+	void *map;
-+	const char *command;
-+	struct module *mod = list_entry(list->next, struct module, list);
-+
-+	/* Take us off the list. */
-+	list_del(&mod->list);
-+
-+	/* Do things we (or parent) depend on first, but don't die if
-+	 * they fail. */
-+	if (!list_empty(list)) {
-+		insmod(list, NOFAIL(strdup("")), NULL, 0, warn,
-+		       dry_run, verbose, options, commands, 0, ignore_proc,
-+		       strip_vermagic, strip_modversion, cmdline_opts);
-+	}
-+
-+	/* Lock before we look, in case it's initializing. */
-+	fd = lock_file(mod->filename);
-+	if (fd < 0) {
-+		error("Could not open '%s': %s\n",
-+		      mod->filename, strerror(errno));
-+		goto out_optstring;
-+	}
-+
-+	/* Don't do ANYTHING if already in kernel. */
-+	if (!ignore_proc
-+	    && module_in_kernel(newname ?: mod->modname, NULL) == 1) {
-+		if (first_time)
-+			error("Module %s already in kernel.\n",
-+			      newname ?: mod->modname);
-+		goto out_unlock;
-+	}
-+
-+	command = find_command(mod->modname, commands);
-+	if (command && !ignore_commands) {
-+		/* It might recurse: unlock. */
-+		unlock_file(fd);
-+		do_command(mod->modname, command, verbose, dry_run, error,
-+			   "install", cmdline_opts);
-+		goto out_optstring;
-+	}
-+
-+	map = grab_fd(fd, &len);
-+	if (!map) {
-+		error("Could not read '%s': %s\n",
-+		      mod->filename, strerror(errno));
-+		goto out_unlock;
-+	}
-+
-+	/* Rename it? */
-+	if (newname)
-+		rename_module(mod, map, len, newname);
-+
-+	if (strip_modversion)
-+		strip_section(mod, map, len, "__versions");
-+	if (strip_vermagic)
-+		clear_magic(mod, map, len);
-+
-+	/* Config file might have given more options */
-+	optstring = add_extra_options(mod->modname, optstring, options);
-+
-+	verbose_printf(verbose, "insmod %s %s\n", mod->filename, optstring);
-+
-+	if (dry_run)
-+		goto out;
-+
-+	ret = init_module(map, len, optstring);
-+	if (ret != 0) {
-+		if (errno == EEXIST) {
-+			if (first_time)
-+				error("Module %s already in kernel.\n",
-+				      newname ?: mod->modname);
-+			goto out_unlock;
-+		}
-+		error("Error inserting %s (%s): %s\n",
-+		      mod->modname, mod->filename, insert_moderror(errno));
-+	}
-+ out:
-+	release_file(map, len);
-+ out_unlock:
-+	unlock_file(fd);
-+ out_optstring:
-+	free(optstring);
-+	return;
-+}
-+
-+/* Do recursive removal. */
-+static void rmmod(struct list_head *list,
-+		  const char *name,
-+		  int first_time,
-+		  errfn_t error,
-+		  int dry_run,
-+		  int verbose,
-+		  struct module_command *commands,
-+		  int ignore_commands,
-+		  int ignore_inuse,
-+		  const char *cmdline_opts)
-+{
-+	const char *command;
-+	unsigned int usecount = 0;
-+	int lock;
-+	struct module *mod = list_entry(list->next, struct module, list);
-+
-+	/* Take first one off the list. */
-+	list_del(&mod->list);
-+
-+	/* Ignore failure; it's best effort here. */
-+	lock = lock_file(mod->filename);
-+
-+	if (!name)
-+		name = mod->modname;
-+
-+	/* Even if renamed, find commands to orig. name. */
-+	command = find_command(mod->modname, commands);
-+	if (command && !ignore_commands) {
-+		/* It might recurse: unlock. */
-+		unlock_file(lock);
-+		do_command(mod->modname, command, verbose, dry_run, error,
-+			   "remove", cmdline_opts);
-+		goto remove_rest_no_unlock;
-+	}
-+
-+	if (module_in_kernel(name, &usecount) == 0)
-+		goto nonexistent_module;
-+
-+	if (usecount != 0) {
-+		if (!ignore_inuse)
-+			error("Module %s is in use.\n", name);
-+		goto remove_rest;
-+	}
-+
-+	verbose_printf(verbose, "rmmod %s\n", mod->filename);
-+
-+	if (dry_run)
-+		goto remove_rest;
-+
-+	if (delete_module(name, O_EXCL) != 0) {
-+		if (errno == ENOENT)
-+			goto nonexistent_module;
-+		error("Error removing %s (%s): %s\n",
-+		      name, mod->filename,
-+		      remove_moderror(errno));
-+	}
-+
-+ remove_rest:
-+	unlock_file(lock);
-+ remove_rest_no_unlock:
-+	/* Now do things we depend. */
-+	if (!list_empty(list))
-+		rmmod(list, NULL, 0, warn, dry_run, verbose, commands,
-+		      0, 1, cmdline_opts);
-+	return;
-+
-+nonexistent_module:
-+	if (first_time)
-+		fatal("Module %s is not in kernel.\n", mod->modname);
-+	goto remove_rest;
-+}
-+
-+/* Does path contain directory(s) subpath? */
-+static int type_matches(const char *path, const char *subpath)
-+{
-+	char *subpath_with_slashes;
-+	int ret;
-+
-+	asprintf(&subpath_with_slashes, "/%s/", subpath);
-+	NOFAIL(subpath_with_slashes);
-+
-+	ret = (strstr(path, subpath_with_slashes) != NULL);
-+	free(subpath_with_slashes);
-+	return ret;
-+}
-+
-+static char *underscores(char *string)
-+{
-+	if (string) {
-+		unsigned int i;
-+		for (i = 0; string[i]; i++)
-+			if (string[i] == '-')
-+				string[i] = '_';
-+	}
-+	return string;
-+}
-+
-+static int do_wildcard(const char *dirname,
-+		       const char *type,
-+		       const char *wildcard)
-+{
-+	char modules_dep_name[strlen(dirname) + sizeof("modules.dep") + 1];
-+	char *line, *wcard;
-+	FILE *modules_dep;
-+
-+	/* Canonicalize wildcard */
-+	wcard = strdup(wildcard);
-+	underscores(wcard);
-+
-+	sprintf(modules_dep_name, "%s/%s", dirname, "modules.dep");
-+	modules_dep = fopen(modules_dep_name, "r");
-+	if (!modules_dep)
-+		fatal("Could not load %s: %s\n",
-+		      modules_dep_name, strerror(errno));
-+
-+	while ((line = getline_wrapped(modules_dep, NULL)) != NULL) {
-+		char *ptr;
-+
-+		/* Ignore lines without : or which start with a # */
-+		ptr = strchr(line, ':');
-+		if (ptr == NULL || line[strspn(line, "\t ")] == '#')
-+			goto next;
-+		*ptr = '\0';
-+
-+		/* "type" must match complete directory component(s). */
-+		if (!type || type_matches(line, type)) {
-+			char modname[strlen(line)+1];
-+
-+			filename2modname(modname, line);
-+			if (fnmatch(wcard, modname, 0) == 0)
-+				printf("%s\n", line);
-+		}
-+	next:
-+		free(line);
-+	}
-+
-+	free(wcard);
-+	return 0;
-+}
-+
-+static char *strsep_skipspace(char **string, char *delim)
-+{
-+	if (!*string)
-+		return NULL;
-+	*string += strspn(*string, delim);
-+	return strsep(string, delim);
-+}
-+
-+/* Recursion */
-+static int read_config(const char *filename,
-+		       const char *name,
-+		       int dump_only,
-+		       int removing,
-+		       struct module_options **options,
-+		       struct module_command **commands,
-+		       struct module_alias **alias,
-+		       struct module_blacklist **blacklist);
-+
-+/* FIXME: Maybe should be extended to "alias a b [and|or c]...". --RR */
-+static int read_config_file(const char *filename,
-+			    const char *name,
-+			    int dump_only,
-+			    int removing,
-+			    struct module_options **options,
-+			    struct module_command **commands,
-+			    struct module_alias **aliases,
-+			    struct module_blacklist **blacklist)
-+{
-+	char *line;
-+	unsigned int linenum = 0;
-+	FILE *cfile;
-+
-+	cfile = fopen(filename, "r");
-+	if (!cfile)
-+		return 0;
-+
-+	while ((line = getline_wrapped(cfile, &linenum)) != NULL) {
-+		char *ptr = line;
-+		char *cmd, *modname;
-+
-+		if (dump_only)
-+			printf("%s\n", line);
-+
-+		cmd = strsep_skipspace(&ptr, "\t ");
-+		if (cmd == NULL || cmd[0] == '#' || cmd[0] == '\0')
-+			continue;
-+
-+		if (strcmp(cmd, "alias") == 0) {
-+			char *wildcard
-+				= underscores(strsep_skipspace(&ptr, "\t "));
-+			char *realname
-+				= underscores(strsep_skipspace(&ptr, "\t "));
-+
-+			if (!wildcard || !realname)
-+				grammar(cmd, filename, linenum);
-+			else if (fnmatch(wildcard,name,0) == 0)
-+				*aliases = add_alias(realname, *aliases);
-+		} else if (strcmp(cmd, "include") == 0) {
-+			struct module_alias *newalias = NULL;
-+			char *newfilename;
-+
-+			newfilename = strsep_skipspace(&ptr, "\t ");
-+			if (!newfilename)
-+				grammar(cmd, filename, linenum);
-+			else {
-+				if (!read_config(newfilename, name,
-+						 dump_only, removing,
-+						 options, commands, &newalias,
-+						 blacklist))
-+					warn("Failed to open included"
-+					      " config file %s: %s\n",
-+					      newfilename, strerror(errno));
-+
-+				/* Files included override aliases,
-+				   etc that was already set ... */
-+				if (newalias)
-+					*aliases = newalias;
-+			}
-+		} else if (strcmp(cmd, "options") == 0) {
-+			modname = strsep_skipspace(&ptr, "\t ");
-+			if (!modname || !ptr)
-+				grammar(cmd, filename, linenum);
-+			else {
-+				ptr += strspn(ptr, "\t ");
-+				*options = add_options(underscores(modname),
-+						       ptr, *options);
-+			}
-+		} else if (strcmp(cmd, "install") == 0) {
-+			modname = strsep_skipspace(&ptr, "\t ");
-+			if (!modname || !ptr)
-+				grammar(cmd, filename, linenum);
-+			else if (!removing) {
-+				ptr += strspn(ptr, "\t ");
-+				*commands = add_command(underscores(modname),
-+							ptr, *commands);
-+			}
-+		} else if (strcmp(cmd, "blacklist") == 0) {
-+			modname = strsep_skipspace(&ptr, "\t ");
-+			if (!modname)
-+				grammar(cmd, filename, linenum);
-+			else if (!removing) {
-+				*blacklist = add_blacklist(underscores(modname),
-+							*blacklist);
-+			}
-+		} else if (strcmp(cmd, "remove") == 0) {
-+			modname = strsep_skipspace(&ptr, "\t ");
-+			if (!modname || !ptr)
-+				grammar(cmd, filename, linenum);
-+			else if (removing) {
-+				ptr += strspn(ptr, "\t ");
-+				*commands = add_command(underscores(modname),
-+							ptr, *commands);
-+			}
-+		} else
-+			grammar(cmd, filename, linenum);
-+
-+		free(line);
-+	}
-+	fclose(cfile);
-+	return 1;
-+}
-+
-+/* Simple format, ignore lines starting with #, one command per line.
-+   Returns true or false. */
-+static int read_config(const char *filename,
-+		       const char *name,
-+		       int dump_only,
-+		       int removing,
-+		       struct module_options **options,
-+		       struct module_command **commands,
-+		       struct module_alias **aliases,
-+		       struct module_blacklist **blacklist)
-+{
-+	DIR *dir;
-+	int ret = 0;
-+
-+	/* ignore everything in this directory */
-+	if (streq(filename, "/etc/modprobe.d/arch"))
-+		return 1;
-+
-+	/* Reiser4 has file/directory duality: treat it as both. */
-+	dir = opendir(filename);
-+	if (dir) {
-+		struct dirent *i;
-+		while ((i = readdir(dir)) != NULL) {
-+			if (!streq(i->d_name,".") && !streq(i->d_name,"..")) {
-+				char sub[strlen(filename) + 1
-+					 + strlen(i->d_name) + 1];
-+
-+				sprintf(sub, "%s/%s", filename, i->d_name);
-+				if (!read_config(sub, name,
-+						 dump_only, removing, options,
-+						 commands, aliases, blacklist))
-+					warn("Failed to open"
-+					     " config file %s: %s\n",
-+					     sub, strerror(errno));
-+			}
-+		}
-+		closedir(dir);
-+		ret = 1;
-+	}
-+
-+	if (read_config_file(filename, name, dump_only, removing,
-+			     options, commands, aliases, blacklist))
-+		ret = 1;
-+
-+	return ret;
-+}
-+
-+static const char *default_configs[] = 
-+{
-+	"/etc/modprobe.conf",
-+	"/etc/modprobe.d",
-+};
-+
-+static void read_toplevel_config(const char *filename,
-+				 const char *name,
-+				 int dump_only,
-+				 int removing,
-+				 struct module_options **options,
-+				 struct module_command **commands,
-+				 struct module_alias **aliases,
-+				 struct module_blacklist **blacklist)
-+{
-+	unsigned int i;
-+
-+	if (filename) {
-+		if (!read_config(filename, name, dump_only, removing,
-+				 options, commands, aliases, blacklist))
-+			fatal("Failed to open config file %s: %s\n",
-+			      filename, strerror(errno));
-+		return;
-+	}
-+
-+	/* Try defaults. */
-+	for (i = 0; i < ARRAY_SIZE(default_configs); i++) {
-+		if (read_config(default_configs[i], name, dump_only, removing,
-+				options, commands, aliases, blacklist))
-+			return;
-+	}
-+}
-+
-+static void add_to_env_var(const char *option)
-+{
-+	const char *oldenv;
-+
-+	if ((oldenv = getenv("MODPROBE_OPTIONS")) != NULL) {
-+		char *newenv;
-+		asprintf(&newenv, "%s %s", oldenv, option);
-+		setenv("MODPROBE_OPTIONS", newenv, 1);
-+	} else
-+		setenv("MODPROBE_OPTIONS", option, 1);
-+}
-+
-+/* Prepend options from environment. */
-+static char **merge_args(char *args, char *argv[], int *argc)
-+{
-+	char *arg, *argstring;
-+	char **newargs = NULL;
-+	unsigned int i, num_env = 0;
-+
-+	if (!args)
-+		return argv;
-+
-+	argstring = NOFAIL(strdup(args));
-+	for (arg = strtok(argstring, " "); arg; arg = strtok(NULL, " ")) {
-+		num_env++;
-+		newargs = NOFAIL(realloc(newargs,
-+					 sizeof(newargs[0])
-+					 * (num_env + *argc + 1)));
-+		newargs[num_env] = arg;
-+	}
-+
-+	/* Append commandline args */
-+	newargs[0] = argv[0];
-+	for (i = 1; i <= *argc; i++)
-+		newargs[num_env+i] = argv[i];
-+
-+	*argc += num_env;
-+	return newargs;
-+}
-+
-+static char *gather_options(char *argv[])
-+{
-+	char *optstring = NOFAIL(strdup(""));
-+
-+	/* Rest is module options */
-+	while (*argv) {
-+		/* Quote value if it contains spaces. */
-+		unsigned int eq = strcspn(*argv, "=");
-+
-+		if (strchr(*argv+eq, ' ') && !strchr(*argv, '"')) {
-+			char quoted[strlen(*argv) + 3];
-+			(*argv)[eq] = '\0';
-+			sprintf(quoted, "%s=\"%s\"", *argv, *argv+eq+1);
-+			optstring = append_option(optstring, quoted);
-+		} else
-+			optstring = append_option(optstring, *argv);
-+		argv++;
-+	}
-+	return optstring;
-+}
-+
-+static void handle_module(const char *modname,
-+			  struct list_head *todo_list,
-+			  const char *newname,
-+			  int remove,
-+			  char *options,
-+			  int first_time,
-+			  errfn_t error,
-+			  int dry_run,
-+			  int verbose,
-+			  struct module_options *modoptions,
-+			  struct module_command *commands,
-+			  int ignore_commands,
-+			  int ignore_proc,
-+			  int strip_vermagic,
-+			  int strip_modversion,
-+			  int unknown_silent,
-+			  const char *cmdline_opts)
-+{
-+	if (list_empty(todo_list)) {
-+		const char *command;
-+
-+		/* The dependencies have to be real modules, but
-+		   handle case where the first is completely bogus. */
-+		command = find_command(modname, commands);
-+		if (command && !ignore_commands) {
-+			do_command(modname, command, verbose, dry_run, error,
-+				   remove ? "remove":"install", cmdline_opts);
-+			return;
-+		}
-+
-+		if (unknown_silent)
-+			exit(1);
-+		error("Module %s not found.\n", modname);
-+		return;
-+	}
-+
-+	if (remove)
-+		rmmod(todo_list, newname, first_time, error, dry_run, verbose,
-+		      commands, ignore_commands, 0, cmdline_opts);
-+	else
-+		insmod(todo_list, NOFAIL(strdup(options)), newname,
-+		       first_time, error, dry_run, verbose, modoptions,
-+		       commands, ignore_commands, ignore_proc, strip_vermagic,
-+		       strip_modversion, cmdline_opts);
-+}
-+
-+static struct option options[] = { { "verbose", 0, NULL, 'v' },
-+				   { "version", 0, NULL, 'V' },
-+				   { "config", 1, NULL, 'C' },
-+				   { "name", 1, NULL, 'o' },
-+				   { "remove", 0, NULL, 'r' },
-+				   { "showconfig", 0, NULL, 'c' },
-+				   { "autoclean", 0, NULL, 'k' },
-+				   { "quiet", 0, NULL, 'q' },
-+				   { "show", 0, NULL, 'n' },
-+				   { "dry-run", 0, NULL, 'n' },
-+				   { "syslog", 0, NULL, 's' },
-+				   { "type", 1, NULL, 't' },
-+				   { "list", 0, NULL, 'l' },
-+				   { "all", 0, NULL, 'a' },
-+				   { "ignore-install", 0, NULL, 'i' },
-+				   { "ignore-remove", 0, NULL, 'i' },
-+				   { "force", 0, NULL, 'f' },
-+				   { "force-vermagic", 0, NULL, 1 },
-+				   { "force-modversion", 0, NULL, 2 },
-+				   { "set-version", 1, NULL, 'S' },
-+				   { "show-depends", 0, NULL, 'D' },
-+				   { "first-time", 0, NULL, 3 },
-+				   { "use-blacklist", 0, NULL, 'b' },
-+				   { NULL, 0, NULL, 0 } };
-+
-+#define MODPROBE_DEVFSD_CONF "/etc/modprobe.devfs"
-+
-+/* This is a horrible hack to allow devfsd, which calls modprobe with
-+   -C /etc/modules.conf or /etc/modules.devfs, to work.  FIXME. */
-+/* Modern devfsd or variants should use -q explicitly in 2.6. */
-+static int is_devfs_call(char *argv[])
-+{
-+	unsigned int i;
-+
-+	/* Look for "/dev" arg */
-+	for (i = 1; argv[i]; i++) {
-+		if (strncmp(argv[i], "/dev/", 5) == 0)
-+			return 1;
-+	}
-+	return 0;
-+}
-+
-+int main(int argc, char *argv[])
-+{
-+	struct utsname buf;
-+	struct stat statbuf;
-+	int opt;
-+	int dump_only = 0;
-+	int dry_run = 0;
-+	int remove = 0;
-+	int verbose = 0;
-+	int unknown_silent = 0;
-+	int list_only = 0;
-+	int all = 0;
-+	int ignore_commands = 0;
-+	int strip_vermagic = 0;
-+	int strip_modversion = 0;
-+	int ignore_proc = 0;
-+	int first_time = 0;
-+	int use_blacklist = 0;
-+	unsigned int i, num_modules;
-+	char *type = NULL;
-+	const char *config = NULL;
-+	char *dirname, *optstring;
-+	char *newname = NULL;
-+	char *aliasfilename, *symfilename;
-+	errfn_t error = fatal;
-+
-+	/* Prepend options from environment. */
-+	argv = merge_args(getenv("MODPROBE_OPTIONS"), argv, &argc);
-+
-+	/* --set-version overrides version, and disables backwards compat. */
-+	for (opt = 1; opt < argc; opt++)
-+		if (strncmp(argv[opt],"--set-version",strlen("--set-version"))
-+		    == 0)
-+			break;
-+
-+	if (opt == argc)
-+		try_old_version("modprobe", argv);
-+
-+	uname(&buf);
-+	while ((opt = getopt_long(argc, argv, "vVC:o:rknqQsclt:aifb", options, NULL)) != -1){
-+		switch (opt) {
-+		case 'v':
-+			add_to_env_var("-v");
-+			verbose = 1;
-+			break;
-+		case 'V':
-+			puts("module-init-tools version 3.2.2");
-+			exit(0);
-+		case 'S':
-+			strncpy(buf.release, optarg, sizeof(buf.release));
-+			buf.release[sizeof(buf.release)-1] = '\0';
-+			break;
-+		case 'C':
-+			if (is_devfs_call(argv)) {
-+				if (streq("/etc/modules.devfs", optarg)) {
-+					config = MODPROBE_DEVFSD_CONF;
-+					add_to_env_var("-C");
-+					add_to_env_var(config);
-+					/* Fall thru to -q */
-+				} else if (streq("/etc/modules.conf", optarg))
-+					/* Ignore config, fall thru to -q */
-+					;
-+				else {
-+					/* False alarm.  Treat as normal. */
-+					config = optarg;
-+					add_to_env_var("-C");
-+					add_to_env_var(config);
-+					break;
-+				}
-+			} else {
-+				config = optarg;
-+				add_to_env_var("-C");
-+				add_to_env_var(config);
-+				break;
-+			}
-+		case 'q':
-+			unknown_silent = 1;
-+			add_to_env_var("-q");
-+			break;
-+		case 'D':
-+			dry_run = 1;
-+			ignore_proc = 1;
-+			verbose = 1;
-+			add_to_env_var("-D");
-+			break;
-+		case 'o':
-+			newname = optarg;
-+			break;
-+		case 'r':
-+			remove = 1;
-+			break;
-+		case 'c':
-+			dump_only = 1;
-+			break;
-+		case 't':
-+			type = optarg;
-+			break;
-+		case 'l':
-+			list_only = 1;
-+			break;
-+		case 'a':
-+			all = 1;
-+			error = warn;
-+			break;
-+		case 'k':
-+			/* FIXME: This should actually do something */
-+			break;
-+		case 'n':
-+			dry_run = 1;
-+			break;
-+		case 's':
-+			add_to_env_var("-s");
-+			log = 1;
-+			break;
-+		case 'i':
-+			ignore_commands = 1;
-+			break;
-+		case 'f':
-+			strip_vermagic = 1;
-+			strip_modversion = 1;
-+			break;
-+		case 'b':
-+			use_blacklist = 1;
-+			break;
-+		case 1:
-+			strip_vermagic = 1;
-+			break;
-+		case 2:
-+			strip_modversion = 1;
-+			break;
-+		case 3:
-+			first_time = 1;
-+			break;
-+		default:
-+			print_usage(argv[0]);
-+		}
-+	}
-+
-+	/* If stderr not open, go to syslog */
-+	if (log || fstat(STDERR_FILENO, &statbuf) != 0) {
-+		openlog("modprobe", LOG_CONS, LOG_DAEMON);
-+		log = 1;
-+	}
-+
-+	if (argc < optind + 1 && !dump_only && !list_only && !remove)
-+		print_usage(argv[0]);
-+
-+	dirname = NOFAIL(malloc(strlen(buf.release) + sizeof(MODULE_DIR) + 1));
-+	sprintf(dirname, "%s/%s", MODULE_DIR, buf.release);
-+	aliasfilename = NOFAIL(malloc(strlen(dirname)
-+				      + sizeof("/modules.alias")));
-+	sprintf(aliasfilename, "%s/modules.alias", dirname);
-+	symfilename = NOFAIL(malloc(strlen(dirname)
-+				    + sizeof("/modules.symbols")));
-+	sprintf(symfilename, "%s/modules.symbols", dirname);
-+
-+	/* Old-style -t xxx wildcard?  Only with -l. */
-+	if (list_only) {
-+		if (optind+1 < argc)
-+			fatal("Can't have multiple wildcards\n");
-+		/* fprintf(stderr, "man find\n"); return 1; */
-+		return do_wildcard(dirname, type, argv[optind]?:"*");
-+	}
-+	if (type)
-+		fatal("-t only supported with -l");
-+
-+	if (dump_only) {
-+		struct module_command *commands = NULL;
-+		struct module_options *modoptions = NULL;
-+		struct module_alias *aliases = NULL;
-+		struct module_blacklist *blacklist = NULL;
-+
-+		read_toplevel_config(config, "", 1, 0,
-+			     &modoptions, &commands, &aliases, &blacklist);
-+		read_config(aliasfilename, "", 1, 0,&modoptions, &commands,
-+			    &aliases, &blacklist);
-+		read_config(symfilename, "", 1, 0, &modoptions, &commands,
-+			    &aliases, &blacklist);
-+		exit(0);
-+	}
-+
-+	if (remove || all) {
-+		num_modules = argc - optind;
-+		optstring = NOFAIL(strdup(""));
-+	} else {
-+		num_modules = 1;
-+		optstring = gather_options(argv+optind+1);
-+	}
-+
-+	/* num_modules is always 1 except for -r or -a. */
-+	for (i = 0; i < num_modules; i++) {
-+		struct module_command *commands = NULL;
-+		struct module_options *modoptions = NULL;
-+		struct module_alias *aliases = NULL;
-+		struct module_blacklist *blacklist = NULL;
-+		LIST_HEAD(list);
-+		char *modulearg = argv[optind + i];
-+
-+		/* Convert name we are looking for */
-+		underscores(modulearg);
-+
-+		/* Returns the resolved alias, options */
-+		read_toplevel_config(config, modulearg, 0,
-+		     remove, &modoptions, &commands, &aliases, &blacklist);
-+
-+		/* No luck?  Try symbol names, if starts with symbol:. */
-+		if (!aliases
-+		    && strncmp(modulearg, "symbol:", strlen("symbol:")) == 0)
-+			read_config(symfilename, modulearg, 0,
-+			    remove, &modoptions, &commands,
-+			    	&aliases, &blacklist);
-+
-+		if (!aliases) {
-+			/* We only use canned aliases as last resort. */
-+			read_depends(dirname, modulearg, &list);
-+
-+			if (list_empty(&list)
-+			    && !find_command(modulearg, commands))
-+			{
-+				read_config(aliasfilename, modulearg, 0,
-+					    remove, &modoptions, &commands,
-+					    &aliases, &blacklist);
-+				aliases = apply_blacklist(aliases, blacklist);
-+			}
-+		}
-+
-+		if (aliases) {
-+			errfn_t err = error;
-+
-+			/* More than one alias?  Don't bail out on failure. */
-+			if (aliases->next)
-+				err = warn;
-+			while (aliases) {
-+				/* Add the options for this alias. */
-+				char *opts = NOFAIL(strdup(optstring));
-+				opts = add_extra_options(modulearg,
-+							 opts, modoptions);
-+
-+				read_depends(dirname, aliases->module, &list);
-+				handle_module(aliases->module, &list, newname,
-+					      remove, opts, first_time, err,
-+					      dry_run, verbose, modoptions,
-+					      commands, ignore_commands,
-+					      ignore_proc, strip_vermagic,
-+					      strip_modversion,
-+					      unknown_silent,
-+					      optstring);
-+
-+				aliases = aliases->next;
-+				INIT_LIST_HEAD(&list);
-+			}
-+		} else {
-+			if (use_blacklist
-+			    && find_blacklist(modulearg, blacklist))
-+				continue;
-+
-+			handle_module(modulearg, &list, newname, remove,
-+				      optstring, first_time, error, dry_run,
-+				      verbose, modoptions, commands,
-+				      ignore_commands, ignore_proc,
-+				      strip_vermagic, strip_modversion,
-+				      unknown_silent, optstring);
-+		}
-+	}
-+	if (log)
-+		closelog();
-+
-+	return 0;
-+}
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/prefix.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/prefix.patch
deleted file mode 100644
index 6f5ff0d..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/prefix.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: klibc-1.5.24/Makefile
-===================================================================
---- a/Makefile	2011-07-27 15:50:53.000000000 +0200
-+++ b/Makefile	2011-08-01 00:47:56.000000000 +0200
-@@ -39,7 +39,7 @@
- export PERL       := perl
- 
- # Location for installation
--export prefix      = /usr
-+export prefix      = $(INST)
- export bindir      = $(prefix)/bin
- export libdir      = $(prefix)/lib
- export mandir      = $(prefix)/man
-
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/staging.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/staging.patch
deleted file mode 100644
index 03955f2..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/staging.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id eefb99a313bbcc8f34c8b32bf0c5aa2dd2580735
-Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
-
-Minor edits following upstream changes
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
-Index: klibc-1.5.24/scripts/Kbuild.install
-===================================================================
---- a/scripts/Kbuild.install	2011-07-27 15:50:53.000000000 +0200
-+++ b/scripts/Kbuild.install	2011-08-01 00:03:03.000000000 +0200
-@@ -88,13 +88,10 @@
- header:
- 	$(Q)echo "  INSTALL headers + man pages to $(INSTALLROOT)$(INSTALLDIR)"
- 	$(Q)mkdir -p $(INSTALLROOT)$(bindir)
--	$(Q)mkdir -p $(INSTALLROOT)$(mandir)/man1
--	$(Q)mkdir -p $(INSTALLROOT)$(SHLIBDIR)
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)
- 	$(Q)-rm -rf $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
- 	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
--	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
- 	$(Q)for x in $(KLIBCKERNELSRC)/include/asm $(KLIBCKERNELSRC)/include/asm* $(KLIBCKERNELSRC)/include/linux $(KLIBCKERNELSRC)/include/mtd; do \
- 		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
- 	done
-@@ -103,7 +100,6 @@
- 	done
- 	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
- 	$(Q)chmod -R a+rX $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
--	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
- 	$(Q)$(install-bin) $(objtree)/klcc/$(KCROSS)klcc $(INSTALLROOT)$(bindir)
- 
- footer: header
-
-Index: klibc-1.5.24/usr/dash/Kbuild
-===================================================================
---- a/usr/dash/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/dash/Kbuild	2011-08-01 00:07:56.000000000 +0200
-@@ -92,5 +92,3 @@
- $(obj)/syntax.h: $(obj)/syntax.c
- 	$(Q):
- 
--# Targets to install
--install-y := sh.shared
-
-Index: klibc-1.5.24/usr/gzip/Kbuild
-===================================================================
---- a/usr/gzip/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/gzip/Kbuild	2011-08-01 00:06:39.000000000 +0200
-@@ -21,5 +21,3 @@
- # Cleaning
- targets := gzip gzip.g gunzip zcat
- 
--# Targets to install
--install-y := gzip gunzip zcat
-
-Index: klibc-1.5.24/usr/kinit/fstype/Kbuild
-===================================================================
---- a/usr/kinit/fstype/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/fstype/Kbuild	2011-08-01 00:09:12.000000000 +0200
-@@ -21,5 +21,3 @@
- # Cleaning
- clean-dirs := static shared
- 
--# install binary
--install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/kinit/ipconfig/Kbuild
-===================================================================
---- a/usr/kinit/ipconfig/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/ipconfig/Kbuild	2011-08-01 00:10:52.000000000 +0200
-@@ -27,5 +27,3 @@
- # Cleaning
- clean-dirs := static shared
- 
--# install binary
--install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/kinit/Kbuild
-===================================================================
---- a/usr/kinit/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/Kbuild	2011-08-01 00:20:18.000000000 +0200
-@@ -33,5 +33,3 @@
- subdir- := fstype ipconfig nfsmount resume run-init
- 
- 
--# install binary
--install-y := kinit kinit.shared
-
-Index: klibc-1.5.24/usr/kinit/nfsmount/Kbuild
-===================================================================
---- a/usr/kinit/nfsmount/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/nfsmount/Kbuild	2011-08-01 00:12:52.000000000 +0200
-@@ -23,5 +23,3 @@
- 
- clean-dirs := static shared
- 
--# Install binary
--install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/kinit/resume/Kbuild
-===================================================================
---- a/usr/kinit/resume/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/resume/Kbuild	2011-08-01 00:13:51.000000000 +0200
-@@ -26,5 +26,3 @@
- # Cleaning
- clean-dirs := static shared
- 
--# install binary
--install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/kinit/run-init/Kbuild
-===================================================================
---- a/usr/kinit/run-init/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/run-init/Kbuild	2011-08-01 00:14:41.000000000 +0200
-@@ -25,5 +25,3 @@
- # Cleaning
- clean-dirs := static shared
- 
--# install binary
--install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/klibc/Kbuild
-===================================================================
---- a/usr/klibc/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/klibc/Kbuild	2011-08-01 00:18:11.000000000 +0200
-@@ -177,5 +177,3 @@
- 	          $(INSTALLROOT)$(INSTALLDIR)/$(KLIBCCROSS)lib))
- 	$(Q)$(install-lib) $(obj)/klibc-$(SOLIBHASH).so \
- 	                      $(INSTALLROOT)$(INSTALLDIR)/$(KLIBCCROSS)lib
--	$(Q)$(install-lib) $(obj)/klibc-$(SOLIBHASH).so \
--	                      $(INSTALLROOT)$(SHLIBDIR)
-
-Index: klibc-1.5.24/usr/utils/Kbuild
-===================================================================
---- a/usr/utils/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/utils/Kbuild	2011-08-01 00:19:13.000000000 +0200
-@@ -72,5 +72,3 @@
- # Clean deletes the static and shared dir
- clean-dirs := static shared
- 
--# install only install the shared binaries
--install-y := $(shared-y) shared/reboot shared/poweroff
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/use-env-for-perl.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/use-env-for-perl.patch
deleted file mode 100644
index eac128c..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/use-env-for-perl.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id 676cbb54d42c89a4832871064cfcb7ee2ad372ee
-
-klcc-cross: Add patch to use /usr/bin/env perl
-Certain configurations (such as autobuilders) may build in very
-deep paths (that are longer than the #! mechanism allows) which
-makes it unsafe to use the direct path for perl.  In our case we know
-that /usr/bin/env perl will always return ours (if it has been built).
-
-Signed-off-by: Tom Rini <tom_rini@mentor.com>
-
-Index: klibc-1.5.20/klcc/makeklcc.pl
-===================================================================
---- a/klcc/makeklcc.pl
-+++ b/klcc/makeklcc.pl
-@@ -26,7 +26,7 @@ sub pathsearch($) {
-     return undef;
- }
- 
--print "#!${perlpath}\n";
-+print "#!/usr/bin/env perl\n";
- 
- open(KLIBCCONF, "< $klibcconf\0")
-     or die "$0: cannot open $klibcconf: $!\n";
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/wc.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/wc.patch
deleted file mode 100644
index 28705fd..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.26/wc.patch
+++ /dev/null
@@ -1,245 +0,0 @@
-Patch was imported from the OpenEmbedded git server
-(git://git.openembedded.org/openembedded)
-as of commit id acb6fa33fccf7196c86a3a28f927d4fa441d05eb
-
-klibc: add wc to tools
- * for use with uniboot
-
-Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
-
-diff --git a/usr/utils/Kbuild b/usr/utils/Kbuild
-index a52ea61..7c8ccfb 100644
---- a/usr/utils/Kbuild
-+++ b/usr/utils/Kbuild
-@@ -3,7 +3,7 @@
- #
- 
- progs := chroot dd mkdir mkfifo mknod mount pivot_root umount
--progs += true false sleep ln mv nuke minips cat ls losetup
-+progs += true false sleep ln mv nuke minips cat ls losetup wc
- progs += uname halt kill readlink cpio sync dmesg modprobe
- 
- static-y := $(addprefix static/, $(progs))
-@@ -62,6 +62,8 @@ static/losetup-y    := losetup.o
- shared/losetup-y    := losetup.o
- static/modprobe-y   := modprobe.o
- shared/modprobe-y   := modprobe.o
-+static/wc-y	    := wc.o
-+shared/wc-y	    := wc.o
- 
- # Additionally linked targets
- always := static/reboot static/poweroff shared/reboot shared/poweroff
-diff --git a/usr/utils/wc.c b/usr/utils/wc.c
-new file mode 100644
-index 0000000..f5059fc
---- /dev/null
-+++ b/usr/utils/wc.c
-@@ -0,0 +1,208 @@
-+/* vi: set sw=4 ts=4: */
-+/*
-+ * wc implementation for busybox
-+ *
-+ * Copyright (C) 2003  Manuel Novoa III  <mjn3@codepoet.org>
-+ *
-+ * Licensed under GPLv2 or later, see file LICENSE in this tarball for details.
-+ */
-+
-+/* BB_AUDIT SUSv3 _NOT_ compliant -- option -m is not currently supported. */
-+/* http://www.opengroup.org/onlinepubs/007904975/utilities/wc.html */
-+
-+/* Mar 16, 2003      Manuel Novoa III   (mjn3@codepoet.org)
-+ *
-+ * Rewritten to fix a number of problems and do some size optimizations.
-+ * Problems in the previous busybox implementation (besides bloat) included:
-+ *  1) broken 'wc -c' optimization (read note below)
-+ *  2) broken handling of '-' args
-+ *  3) no checking of ferror on EOF returns
-+ *  4) isprint() wasn't considered when word counting.
-+ *
-+ * TODO:
-+ *
-+ * When locale support is enabled, count multibyte chars in the '-m' case.
-+ *
-+ * NOTES:
-+ *
-+ * The previous busybox wc attempted an optimization using stat for the
-+ * case of counting chars only.  I omitted that because it was broken.
-+ * It didn't take into account the possibility of input coming from a
-+ * pipe, or input from a file with file pointer not at the beginning.
-+ *
-+ * To implement such a speed optimization correctly, not only do you
-+ * need the size, but also the file position.  Note also that the
-+ * file position may be past the end of file.  Consider the example
-+ * (adapted from example in gnu wc.c)
-+ *
-+ *      echo hello > /tmp/testfile &&
-+ *      (dd ibs=1k skip=1 count=0 &> /dev/null; wc -c) < /tmp/testfile
-+ *
-+ * for which 'wc -c' should output '0'.
-+ */
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include <unistd.h>
-+#undef isspace
-+#undef isprint
-+#define isspace(c) ((((c) == ' ') || (((unsigned int)((c) - 9)) <= (13 - 9))))
-+#define isprint(c) (((unsigned int)((c) - 0x20)) <= (0x7e - 0x20))
-+#define isspace_given_isprint(c) ((c) == ' ')
-+
-+#define COUNT_T unsigned long
-+#define COUNT_FMT "u"
-+#define optind 1
-+FILE *fopen_or_warn_stdin(const char *filename)
-+{
-+        FILE *fp = stdin;
-+
-+        if (filename[0]) {
-+                fp = fopen(filename, "r");
-+        }
-+
-+        return fp;
-+}
-+
-+enum {
-+	WC_LINES	= 0,
-+	WC_WORDS	= 1,
-+	WC_CHARS	= 2,
-+	WC_LENGTH	= 3
-+};
-+
-+int main(int argc, char **argv)
-+{
-+	FILE *fp;
-+	const char *s, *arg;
-+	const char *start_fmt = "%9"COUNT_FMT;
-+	const char *fname_fmt = " %s\n";
-+	COUNT_T *pcounts;
-+	COUNT_T counts[4];
-+	COUNT_T totals[4];
-+	unsigned linepos;
-+	unsigned u;
-+	int num_files = 0;
-+	int c;
-+	signed char status = EXIT_SUCCESS;
-+	signed char in_word;
-+	unsigned print_type;
-+
-+	print_type = getopt(argc, argv, "lwcL");
-+
-+	if (print_type == 0) {
-+		print_type = (1 << WC_LINES) | (1 << WC_WORDS) | (1 << WC_CHARS);
-+	}
-+
-+	argv += optind;
-+	if (!argv[0]) {
-+		*--argv = (char *) "wc";
-+		fname_fmt = "\n";
-+		if (!((print_type-1) & print_type)) /* exactly one option? */
-+			start_fmt = "%"COUNT_FMT;
-+	}
-+
-+	memset(totals, 0, sizeof(totals));
-+
-+	pcounts = counts;
-+
-+	while ((arg = *argv++) != 0) {
-+		++num_files;
-+		fp = fopen_or_warn_stdin(arg);
-+		if (!fp) {
-+			status = EXIT_FAILURE;
-+			continue;
-+		}
-+
-+		memset(counts, 0, sizeof(counts));
-+		linepos = 0;
-+		in_word = 0;
-+
-+		do {
-+			/* Our -w doesn't match GNU wc exactly... oh well */
-+
-+			++counts[WC_CHARS];
-+			c = getc(fp);
-+			if (isprint(c)) {
-+				++linepos;
-+				if (!isspace_given_isprint(c)) {
-+					in_word = 1;
-+					continue;
-+				}
-+			} else if (((unsigned int)(c - 9)) <= 4) {
-+				/* \t  9
-+				 * \n 10
-+				 * \v 11
-+				 * \f 12
-+				 * \r 13
-+				 */
-+				if (c == '\t') {
-+					linepos = (linepos | 7) + 1;
-+				} else {			/* '\n', '\r', '\f', or '\v' */
-+				DO_EOF:
-+					if (linepos > counts[WC_LENGTH]) {
-+						counts[WC_LENGTH] = linepos;
-+					}
-+					if (c == '\n') {
-+						++counts[WC_LINES];
-+					}
-+					if (c != '\v') {
-+						linepos = 0;
-+					}
-+				}
-+			} else if (c == EOF) {
-+/*				if (ferror(fp)) {
-+					status = EXIT_FAILURE;
-+				}
-+*/				--counts[WC_CHARS];
-+				goto DO_EOF;		/* Treat an EOF as '\r'. */
-+			} else {
-+				continue;
-+			}
-+
-+			counts[WC_WORDS] += in_word;
-+			in_word = 0;
-+			if (c == EOF) {
-+				break;
-+			}
-+		} while (1);
-+
-+		if (totals[WC_LENGTH] < counts[WC_LENGTH]) {
-+			totals[WC_LENGTH] = counts[WC_LENGTH];
-+		}
-+		totals[WC_LENGTH] -= counts[WC_LENGTH];
-+
-+		if(fp != stdin)
-+			fclose(fp);
-+
-+	OUTPUT:
-+		/* coreutils wc tries hard to print pretty columns
-+		 * (saves results for all files, find max col len etc...)
-+		 * we won't try that hard, it will bloat us too much */
-+		s = start_fmt;
-+		u = 0;
-+		do {
-+			if (print_type & (1 << u)) {
-+				printf(s, pcounts[u]);
-+				s = " %9"COUNT_FMT; /* Ok... restore the leading space. */
-+			}
-+			totals[u] += pcounts[u];
-+		} while (++u < 4);
-+		printf(fname_fmt, arg);
-+	}
-+
-+	/* If more than one file was processed, we want the totals.  To save some
-+	 * space, we set the pcounts ptr to the totals array.  This has the side
-+	 * effect of trashing the totals array after outputting it, but that's
-+	 * irrelavent since we no longer need it. */
-+	if (num_files > 1) {
-+		num_files = 0;				/* Make sure we don't get here again. */
-+		arg = "total";
-+		pcounts = totals;
-+		--argv;
-+		goto OUTPUT;
-+	}
-+
-+	fflush(stdout);
-+	exit(status);
-+}
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_1.5.26+2.0.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_1.5.26+2.0.bb
new file mode 100644
index 0000000..484134e
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_1.5.26+2.0.bb
@@ -0,0 +1,16 @@
+PR = "${INC_PR}.0"
+
+KLIBC_UTILS_VARIANT = "static"
+KLIBC_UTILS_PKGNAME = "klibc-static-utils"
+
+FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
+
+do_install() {
+        :
+}
+
+PACKAGES_${PN} = "${PN}"
+FILES_${PN} = ""
+
+require klibc-utils.inc
+require klibc.inc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_1.5.26.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_1.5.26.bb
deleted file mode 100644
index 484134e..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_1.5.26.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-PR = "${INC_PR}.0"
-
-KLIBC_UTILS_VARIANT = "static"
-KLIBC_UTILS_PKGNAME = "klibc-static-utils"
-
-FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
-
-do_install() {
-        :
-}
-
-PACKAGES_${PN} = "${PN}"
-FILES_${PN} = ""
-
-require klibc-utils.inc
-require klibc.inc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_1.5.26+2.0.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_1.5.26+2.0.bb
new file mode 100644
index 0000000..37cab84
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils_1.5.26+2.0.bb
@@ -0,0 +1,16 @@
+PR = "${INC_PR}.0"
+
+KLIBC_UTILS_VARIANT = "shared"
+KLIBC_UTILS_PKGNAME = "klibc-utils"
+
+FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
+
+do_install() {
+        :
+}
+
+PACKAGES_${PN} = "${PN}"
+FILES_${PN} = ""
+
+require klibc-utils.inc
+require klibc.inc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_1.5.26.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_1.5.26.bb
deleted file mode 100644
index 37cab84..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils_1.5.26.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-PR = "${INC_PR}.0"
-
-KLIBC_UTILS_VARIANT = "shared"
-KLIBC_UTILS_PKGNAME = "klibc-utils"
-
-FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
-
-do_install() {
-        :
-}
-
-PACKAGES_${PN} = "${PN}"
-FILES_${PN} = ""
-
-require klibc-utils.inc
-require klibc.inc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index f89af9d..3706598 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8
 # debugsources.list: No such file or directory:
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INC_PR = "r1"
+INC_PR = "r0"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
@@ -21,7 +21,7 @@ KLIBC_ARCH_i586 = 'i386'
 KLIBC_ARCH_i686 = 'i386'
 KLIBC_ARCH_pentium = 'i386'
 
-SRCREV = "c7dedd5d11b075b5e6cecd6aa82b70b748179121"
+SRCREV = "f8e0ad9812f5e3fe0e7006061b1d5f9f67a80325"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git;protocol=git"
 
 SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch"
@@ -34,17 +34,16 @@ SRC_URI += "file://fstype-sane-vfat-and-jffs2-for-1.5.patch \
             file://wc.patch \
             file://prefix.patch \
             file://staging.patch \
-            file://kernel_3.2__aligned_u64.patch  \
             "
 
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'CROSS_COMPILE=${TARGET_PREFIX}' \
-                'KLIBCKERNELSRC=${STAGING_DIR_TARGET}/${exec_prefix}' \
+                'KLIBCKERNELSRC=${STAGING_DIR_TARGET}${exec_prefix}' \
                 "
 
 do_configure () {
 
-        ln -sf "${STAGING_DIR_TARGET}/${exec_prefix}" linux
+        ln -sf "${STAGING_DIR_TARGET}${exec_prefix}" linux
 }
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_1.5.26+2.0.bb b/meta-initramfs/recipes-devtools/klibc/klibc_1.5.26+2.0.bb
new file mode 100644
index 0000000..8eaab2c
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc_1.5.26+2.0.bb
@@ -0,0 +1,28 @@
+PR = "${INC_PR}.0"
+
+export INST = "${D}"
+
+do_install() {
+
+        oe_runmake install
+
+        # the crosscompiler is packaged by klcc-cross
+        # remove klcc
+        rm ${D}${base_bindir}/klcc
+        # remove now empty dir
+        rmdir ${D}${base_bindir}
+
+        install -d ${D}${base_libdir}
+        install -m 755 usr/klibc/klibc-*.so ${D}${base_libdir}
+        (cd  ${D}${base_libdir}; ln -s klibc-*.so klibc.so)
+
+}
+
+PACKAGES = "libklibc libklibc-staticdev libklibc-dev"
+FILES_libklibc = "${base_libdir}/klibc-*.so"
+FILES_libklibc-staticdev = "${base_libdir}/klibc/lib/libc.a"
+FILES_libklibc-dev = "${base_libdir}/klibc.so \
+                      ${base_libdir}/klibc/lib/* \
+                      ${base_libdir}/klibc/include/* \
+                      "
+require klibc.inc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_1.5.26.bb b/meta-initramfs/recipes-devtools/klibc/klibc_1.5.26.bb
deleted file mode 100644
index 101ba55..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc_1.5.26.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-PR = "${INC_PR}.0"
-
-export INST = "${D}"
-
-do_install() {
-
-        oe_runmake DESTDIR="${D}" install
-
-        # the crosscompiler is packaged by klcc-cross
-        # remove klcc
-        rm ${D}${base_bindir}/klcc
-        # remove now empty dir
-        rmdir ${D}${base_bindir}
-
-        # remove Linux headers .install and ..install.cmd files
-        find ${D}${base_libdir}/klibc/include -name '.install' -delete
-        find ${D}${base_libdir}/klibc/include -name '..install.cmd' -delete
-
-        install -d ${D}${base_libdir}
-        install -m 755 usr/klibc/klibc-*.so ${D}${base_libdir}
-        (cd  ${D}${base_libdir}; ln -s klibc-*.so klibc.so)
-
-}
-
-PACKAGES = "libklibc libklibc-staticdev libklibc-dev"
-FILES_libklibc = "${base_libdir}/klibc-*.so"
-FILES_libklibc-staticdev = "${base_libdir}/klibc/lib/libc.a"
-FILES_libklibc-dev = "${base_libdir}/klibc.so \
-                      ${base_libdir}/klibc/lib/* \
-                      ${base_libdir}/klibc/include/* \
-                      "
-require klibc.inc
-- 
1.7.3.4



