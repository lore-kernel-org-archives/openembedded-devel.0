Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7456260030
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Nov 2014 23:17:53 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so10839767wgh.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Nov 2014 15:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uyyucxROPBp/k6tud+FfGC2MTKaYJ+yr4As6lRLkTdE=;
	b=bGiA6c5LLlsUM1vUlzclcZ5kfJa9xOYRM8no4LxyZaD2EURJKiDSadSEAOMGEFim3G
	eDjQ4Zs7gWev32zlPwfX6PlRccTFk1MsdrFOuznKzdODQ6YwXMqvaX/GVGlRJa7v4H2i
	APi4yDKR0VEb7BnBuNqupGSEwxnwpLQ0+v0npCGynLcnvUHbkn3sSccpoDaqoM97M4cW
	wVSRuU+g91msG9GMHjnXiMhm4iNNuTcFDpdzOOq/yHIwKof/GdApVaj839+JZjMWR6jT
	zKznk5A8zho3Raq5VRAcEIo1+8wI384JFSpQu1pWTFq7T5p6SqkGLSKDV6NC0cCuqDpn
	d50w==
X-Received: by 10.194.92.82 with SMTP id ck18mr27978552wjb.103.1416784673384; 
	Sun, 23 Nov 2014 15:17:53 -0800 (PST)
Received: from mizar.208.67.220.220
	(host149-167-dynamic.7-79-r.retail.telecomitalia.it. [79.7.167.149])
	by mx.google.com with ESMTPSA id pl6sm9536924wic.22.2014.11.23.15.17.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Nov 2014 15:17:52 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Nov 2014 00:17:44 +0100
Message-Id: <1416784664-21061-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] kexecboot: apply OE specific fixes (pending upstream)
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
X-List-Received-Date: Sun, 23 Nov 2014 23:17:55 -0000

After 78ee4d8b1782445caecce8331e68efe83fc32044 in oe-core
the kernel is an *absolute* symlink in /boot.
Unfortunately this implies the stock images built with OE can not be booted.
The last patch of this commit fixes this issue.

The other patches are fixing build when S!=B, autotools-brokensep and
configure warnings.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../files/0001-kexecboot-fix-build-when-S-B.patch  |  61 ++++++++++
 .../0002-kexecboot-fix-configure-warnings.patch    |  33 +++++
 ...0003-kexecboot-do-not-hardcode-MOUNTPOINT.patch |  97 +++++++++++++++
 ...-workaround-for-absolute-kernel-and-initr.patch | 135 +++++++++++++++++++++
 .../recipes-bsp/kexecboot/kexecboot_0.6.bb         |   9 +-
 5 files changed, 334 insertions(+), 1 deletion(-)
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0001-kexecboot-fix-build-when-S-B.patch
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0002-kexecboot-fix-configure-warnings.patch
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0003-kexecboot-do-not-hardcode-MOUNTPOINT.patch
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0004-kexecboot.c-workaround-for-absolute-kernel-and-initr.patch

diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0001-kexecboot-fix-build-when-S-B.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0001-kexecboot-fix-build-when-S-B.patch
new file mode 100644
index 0000000..6d3270f
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/files/0001-kexecboot-fix-build-when-S-B.patch
@@ -0,0 +1,61 @@
+From 8519d61a7097498b0ee93fb8dc8262286825f3e5 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Thu, 1 May 2014 23:58:51 +0200
+Subject: [PATCH 1/4] kexecboot: fix build when S != B
+
+* fatal error: ../config.h: No such file or directory
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ machine/zaurus.c | 2 +-
+ res/theme-gui.h  | 2 +-
+ res/theme-tui.h  | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/machine/zaurus.c b/machine/zaurus.c
+index ea21047..83be13b 100644
+--- a/machine/zaurus.c
++++ b/machine/zaurus.c
+@@ -25,7 +25,7 @@
+  *
+  */
+ 
+-#include "../config.h"
++#include "config.h"
+ 
+ #ifdef USE_ZAURUS
+ 
+diff --git a/res/theme-gui.h b/res/theme-gui.h
+index f8fef7f..79bed39 100644
+--- a/res/theme-gui.h
++++ b/res/theme-gui.h
+@@ -15,7 +15,7 @@
+  *
+  */
+ 
+-#include "../config.h"
++#include "config.h"
+ 
+ #ifdef USE_ICONS
+ /** Icons **/
+diff --git a/res/theme-tui.h b/res/theme-tui.h
+index 94e7693..909be56 100644
+--- a/res/theme-tui.h
++++ b/res/theme-tui.h
+@@ -15,11 +15,11 @@
+  *
+  */
+ 
+-#include "../config.h"
++#include "config.h"
+ 
+ #ifdef USE_TEXTUI
+ /** TEXT UI colors **/
+-#include "../termseq.h"
++#include "termseq.h"
+ 
+ /* Background color pair */
+ #define TUI_CLR_BG		TERM_CSI TERM_BG_BLACK ";" TERM_FG_WHITE TERM_SGR
+-- 
+1.9.1
+
diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0002-kexecboot-fix-configure-warnings.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0002-kexecboot-fix-configure-warnings.patch
new file mode 100644
index 0000000..ecf422b
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/files/0002-kexecboot-fix-configure-warnings.patch
@@ -0,0 +1,33 @@
+From b8938acc3f1ab35273fa9a2fa7728050ef72ff65 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Fri, 2 May 2014 00:19:24 +0200
+Subject: [PATCH 2/4] kexecboot: fix configure warnings
+
+Makefile.am:5: warning: source file 'fstype/fstype.c' is in a subdirectory,
+Makefile.am:5: but option 'subdir-objects' is disabled
+automake: warning: possible forward-incompatibility.
+...
+Makefile.am:5: warning: source file 'machine/zaurus.c' is in a subdirectory,
+...
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0ca4b81..66ec54e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,7 +1,7 @@
+ AC_PREREQ(2.53)
+ AC_INIT([kexecboot], [0.6], [kexecboot-devel@linuxtogo.org])
+ AC_CANONICAL_HOST
+-AM_INIT_AUTOMAKE([-Wall foreign])
++AM_INIT_AUTOMAKE([-Wall foreign] [subdir-objects])
+ AC_CONFIG_SRCDIR(kexecboot.c)
+ AC_CONFIG_HEADERS(config.h)
+ AM_MAINTAINER_MODE
+-- 
+1.9.1
+
diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0003-kexecboot-do-not-hardcode-MOUNTPOINT.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0003-kexecboot-do-not-hardcode-MOUNTPOINT.patch
new file mode 100644
index 0000000..4caa0d5
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/files/0003-kexecboot-do-not-hardcode-MOUNTPOINT.patch
@@ -0,0 +1,97 @@
+From 800dae0d34f8629a34c638a612166b76dda03e27 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sat, 2 Aug 2014 01:13:08 +0200
+Subject: [PATCH 3/4] kexecboot: do not hardcode MOUNTPOINT
+
+Avoid to hardcode it: could be requested as a new configure option.
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ cfgparser.c |  6 +++---
+ kexecboot.c | 18 ++++++++++--------
+ 2 files changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/cfgparser.c b/cfgparser.c
+index 8f6688c..dec27b1 100644
+--- a/cfgparser.c
++++ b/cfgparser.c
+@@ -141,7 +141,7 @@ static int set_kernel(struct cfgdata_t *cfgdata, char *value)
+ 		return -1;
+ 	}
+ 
+-	strcpy(sc->kernelpath, "/mnt");
++	strcpy(sc->kernelpath, MOUNTPOINT);
+ 	strcat(sc->kernelpath, value);
+ 	return 0;
+ }
+@@ -155,7 +155,7 @@ static int set_icon(struct cfgdata_t *cfgdata, char *value)
+ 
+ 	dispose(sc->iconpath);
+ 	/* Add our mountpoint, since the enduser won't know it */
+-	sc->iconpath = malloc(sizeof(MOUNTPOINT)+strlen(value));
++	sc->iconpath = malloc(strlen(MOUNTPOINT)+strlen(value)+1);
+ 	if (NULL == sc->iconpath) {
+ 		DPRINTF("Can't allocate memory to store iconpath '%s'", value);
+ 		return -1;
+@@ -194,7 +194,7 @@ static int set_initrd(struct cfgdata_t *cfgdata, char *value)
+ 		return -1;
+ 	}
+ 
+-	strcpy(sc->initrd, "/mnt");
++	strcpy(sc->initrd, MOUNTPOINT);
+ 	strcat(sc->initrd, value);
+ 	return 0;
+ }
+diff --git a/kexecboot.c b/kexecboot.c
+index d6657a0..7268d6b 100644
+--- a/kexecboot.c
++++ b/kexecboot.c
+@@ -57,20 +57,22 @@
+ #endif
+ 
+ #ifdef USE_MACHINE_KERNEL
+-/* Machine-dependent kernel patch */
++/* Machine-dependent kernel path */
+ char *machine_kernel = NULL;
+ #endif
+ 
++#define PREPEND_MOUNTPATH(string) MOUNTPOINT""string
++
+ /* NULL-terminated array of kernel search paths
+  * First item should be filled with machine-dependent path */
+ char *default_kernels[] = {
+ #ifdef USE_ZIMAGE
+-	"/mnt/boot/zImage",
+-	"/mnt/zImage",
++	PREPEND_MOUNTPATH("/boot/zImage"),
++	PREPEND_MOUNTPATH("/zImage"),
+ #endif
+ #ifdef USE_UIMAGE
+-	"/mnt/boot/uImage",
+-	"/mnt/uImage",
++	PREPEND_MOUNTPATH("/boot/uImage"),
++	PREPEND_MOUNTPATH("/uImage"),
+ #endif
+ 	NULL
+ };
+@@ -149,14 +151,14 @@ char *get_machine_kernelpath() {
+ 			++tmp;
+ 		}
+ 
+-		/* Prepend "/mnt/boot/zImage-" to hw */
+-		tmp = malloc(strlen(hw) + 17 + 1);	/* strlen("/mnt/boot/zImage-") */
++		/* Prepend  MOUNTPOINT"/boot/zImage-" to hw */
++		tmp = malloc(strlen(PREPEND_MOUNTPATH("/boot/zImage-")) + strlen(hw) + 1);
+ 		if (NULL == tmp) {
+ 			DPRINTF("Can't allocate memory for machine-specific kernel path");
+ 			return NULL;
+ 		}
+ 
+-		strcpy(tmp, "/mnt/boot/zImage-");
++		strcpy(tmp, PREPEND_MOUNTPATH("/boot/zImage-"));
+ 		strcat(tmp, hw);
+ 
+ 		return tmp;
+-- 
+1.9.1
+
diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0004-kexecboot.c-workaround-for-absolute-kernel-and-initr.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0004-kexecboot.c-workaround-for-absolute-kernel-and-initr.patch
new file mode 100644
index 0000000..6d81d83
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/files/0004-kexecboot.c-workaround-for-absolute-kernel-and-initr.patch
@@ -0,0 +1,135 @@
+From de9a6284df8add6ec03e1d9981d0b6d0595bbc69 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Mon, 10 Nov 2014 23:37:23 +0100
+Subject: [PATCH 4/4] kexecboot.c: workaround for absolute kernel and initrd
+ symlinks
+
+Add MOUNTPOINT prefix if the kernel/initrd symlinks start with '/'.
+Do nothing if the path is a relative symbolic link or not a symlink.
+
+Fix following situation:
+
+root@mizar:/var/tmp# ls -al boot/
+total 2076
+drwxr-xr-x 2 root root    4096 lug  5 01:38 .
+drwxrwxrwt 4 root root    4096 lug  5 12:26 ..
+-rw-r--r-- 1 root root     831 lug  5 01:24 boot.cfg
+-rw-r--r-- 1 root root    1322 lug  5 01:24 icon.xpm
+lrwxrwxrwx 1 root root      34 lug  5 12:26 zImage ->
+/boot/zImage-3.14.5-yocto-standard
+-rw-r--r-- 1 root root 2106832 lug  5 01:20 zImage-3.14.5-yocto-standard
+
+Cannot open `/mnt/boot/zImage': No such file or directory
+Nothing has been loaded!
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ kexecboot.c | 53 ++++++++++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 44 insertions(+), 9 deletions(-)
+
+diff --git a/kexecboot.c b/kexecboot.c
+index 7268d6b..8a7a7d2 100644
+--- a/kexecboot.c
++++ b/kexecboot.c
+@@ -208,11 +208,16 @@ void start_kernel(struct params_t *params, int choice)
+ 	const char *load_argv[] = { NULL, "-l", NULL, NULL, NULL, NULL };
+ 	const char *exec_argv[] = { NULL, "-e", NULL, NULL};
+ 
+-	char *cmdline_arg = NULL, *initrd_arg = NULL;
++	char *cmdline_arg = NULL, *initrd_arg = NULL, *kernel_arg = NULL;
+ 	int n, idx, u;
+ 	struct stat sinfo;
+ 	struct boot_item_t *item;
+ 
++	/* buffer for readlink (could be truncated) */
++	char buf[512];
++	int len;
++
++
+ 	item = params->bootcfg->list[choice];
+ 
+ 	exec_argv[0] = kexec_path;
+@@ -306,10 +311,17 @@ void start_kernel(struct params_t *params, int choice)
+ 		}
+ 	}
+ 
++	/* Mount boot device */
++	if ( -1 == mount(mount_dev, mount_point, mount_fstype,
++			MS_RDONLY, NULL) ) {
++		perror("Can't mount boot device");
++		exit(-1);
++	}
++
+ 	/* fill '--initrd' option */
+ 	if (item->initrd) {
+ 		/* allocate space */
+-		n = sizeof(str_initrd_start) + strlen(item->initrd);
++		n = sizeof(str_initrd_start) + strlen(item->initrd) + 1 + sizeof(mount_point) + sizeof(buf);
+ 
+ 		initrd_arg = (char *)malloc(n);
+ 		if (NULL == initrd_arg) {
+@@ -317,24 +329,46 @@ void start_kernel(struct params_t *params, int choice)
+ 		} else {
+ 			strcpy(initrd_arg, str_initrd_start);	/* --initrd= */
+ 			strcat(initrd_arg, item->initrd);
++
++			if ((len = readlink(item->initrd, buf, sizeof(buf)-1)) != -1) {
++				buf[len] = '\0';
++				/* Fix absolute symlinks: prepend MOUNTPOINT */
++				if (buf[0] == '/') {
++					strcpy(initrd_arg, str_initrd_start);	/* --initrd= */
++					strcat(initrd_arg, mount_point);
++					strcat(initrd_arg, buf);
++				}
++			}
+ 			load_argv[idx] = initrd_arg;
+ 			++idx;
+ 		}
+ 	}
+ 
+ 	/* Append kernelpath as last arg of kexec */
+-	load_argv[idx] = item->kernelpath;
++		/* allocate space */
++		n = strlen(item->kernelpath) + 1 + sizeof(mount_point) + sizeof(buf);
++
++		kernel_arg = (char *)malloc(n);
++		if (NULL == kernel_arg) {
++			perror("Can't allocate memory for kernel_arg");
++		} else {
++			strcpy(kernel_arg, item->kernelpath);
++
++			if ((len = readlink(item->kernelpath, buf, sizeof(buf)-1)) != -1) {
++				buf[len] = '\0';
++				/* Fix absolute symlinks: prepend MOUNTPOINT */
++				if (buf[0] == '/') {
++					strcpy(kernel_arg, mount_point);
++					strcat(kernel_arg, buf);
++				}
++			}
++			load_argv[idx] = kernel_arg;
++		}
+ 
+ 	DPRINTF("load_argv: %s, %s, %s, %s, %s", load_argv[0],
+ 			load_argv[1], load_argv[2],
+ 			load_argv[3], load_argv[4]);
+ 
+-	/* Mount boot device */
+-	if ( -1 == mount(mount_dev, mount_point, mount_fstype,
+-			MS_RDONLY, NULL) ) {
+-		perror("Can't mount boot device");
+-		exit(-1);
+-	}
+ 
+ 	/* Load kernel */
+ 	n = fexecw(kexec_path, (char *const *)load_argv, envp);
+@@ -347,6 +381,7 @@ void start_kernel(struct params_t *params, int choice)
+ 
+ 	dispose(cmdline_arg);
+ 	dispose(initrd_arg);
++	dispose(kernel_arg);
+ 
+ 	/* Check /proc/sys/net presence */
+ 	if ( -1 == stat("/proc/sys/net", &sinfo) ) {
+-- 
+1.9.1
+
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
index 1fb5f0d..9061c27 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
@@ -42,7 +42,14 @@ SRC_URI = "https://github.com/kexecboot/kexecboot/archive/v${PV}.tar.gz"
 SRC_URI[md5sum] = "46b7c1a6f20531be56445ebb8669a2b8"
 SRC_URI[sha256sum] = "6b360b8aa59bc5d68a96705349a0dd416f8ed704e931fa0ac7849298258f0f15"
 
-inherit autotools-brokensep
+SRC_URI += "\
+            file://0001-kexecboot-fix-build-when-S-B.patch \
+            file://0002-kexecboot-fix-configure-warnings.patch \
+            file://0003-kexecboot-do-not-hardcode-MOUNTPOINT.patch \
+            file://0004-kexecboot.c-workaround-for-absolute-kernel-and-initr.patch \
+            "
+
+inherit autotools
 
 EXTRA_OECONF = "--enable-delay=2 --enable-evdev-rate=1000,250"
 
-- 
1.9.1


