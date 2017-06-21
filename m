Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f174.google.com (mail-yb0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 409C4601D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jun 2017 05:16:05 +0000 (UTC)
Received: by mail-yb0-f174.google.com with SMTP id t7so43224361yba.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 22:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=utNFlH18iTYMq4u4tE+pan0SEcfdYv7VSVj2+47TaiE=;
	b=k2vfaCCq0ZTu8P+r3b4JgJNO8nF8fKRuijaUz/v3+PG/AsncImaE7H8KIZ+pNagPWH
	8Du7Lg44kJXTqHzcz8Qz5S2CLDMZsgavcZUqiKlAsp7vAtfakPmjI+ORR3aMNaJVHKxI
	NMv1NegGEPk+a4ZuL4JI6IAPb5MzFo75vmLS6CYFoyrR2zkh9wPvJhKn92uFzDKPbw5G
	qFcKsR2MSmINcP24qBizynjs+wInPO7Wqwd1rVRFiPOtBqeqolvuyr9gAvDN9YrYsivE
	sje6UZIJ/icAMH5i/q+bjRAjuiCCA81pG8hz0mA/FFd5sGluRazgfCmAvmybWFfdZQq7
	JanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=utNFlH18iTYMq4u4tE+pan0SEcfdYv7VSVj2+47TaiE=;
	b=eRQDdQ/B7UKFAtEUSQyPhXq3ouxJ3xxvd4CFn/v0NJ6kwTD7JGyQCa4DW3xuTh/zl+
	qneuMZ4OkQE+Ix9rmb+DmjIDEM5ePYbFad2nfWfnt2jkpV1pgGkw2VqJQDYHUuKyct9y
	6msHGSKRmz74OYDUrrv4MkxPE9HI42/Z48XXdoEVLag6pRmue6fsQ20UuSGKub9ORtNs
	DK6qa2w4viQy0yWDu0WOynueR3ysaICKaxZ444WU4zNA0M4HTUnlS5w0q4WAkOyV0t8H
	o7u+FYLyxiIdYvKYNOOgE/K54sOvCKDCslXLOhio31FebMHjQv/ghN3gJRPR0chvKwnY
	jp0Q==
X-Gm-Message-State: AKS2vOwjaWHi/sT/oZth14nWFmRi6QNEw61D7UefWbtaM6AhMl+C/hr2
	HmeJ9armDn1Xjcg3eaaekgMx/8zxAA==
X-Received: by 10.37.74.67 with SMTP id x64mr24474401yba.69.1498022166797;
	Tue, 20 Jun 2017 22:16:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Tue, 20 Jun 2017 22:16:06 -0700 (PDT)
In-Reply-To: <1497997712-10615-1-git-send-email-andrea.adami@gmail.com>
References: <1497997712-10615-1-git-send-email-andrea.adami@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Jun 2017 07:16:06 +0200
Message-ID: <CA+chaQfB4VnSz2TORbG8Y06uWtJrNgtL1J1o4HLniPNYj7ME_A@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] kexecboot: update recipe to master on github (4c4f127)
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
X-List-Received-Date: Wed, 21 Jun 2017 05:16:06 -0000
Content-Type: text/plain; charset="UTF-8"

You forgot to set PV (now it would be default 1.0).

On Wed, Jun 21, 2017 at 12:28 AM, Andrea Adami <andrea.adami@gmail.com>
wrote:

> With pending OE patches and a new fix for gcc 7.
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../files/0001-kexecboot-fix-build-when-S-B.patch  |  61 ----------
>  .../0002-kexecboot-fix-configure-warnings.patch    |  33 -----
>  ...0003-kexecboot-do-not-hardcode-MOUNTPOINT.patch |  97 ---------------
>  ...-workaround-for-absolute-kernel-and-initr.patch | 135
> ---------------------
>  .../files/0005-rgb.h-fix-build-with-gcc5.patch     |  35 ------
>  .../{kexecboot_0.6.bb => kexecboot_git.bb}         |  18 +--
>  6 files changed, 3 insertions(+), 376 deletions(-)
>  delete mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0001-
> kexecboot-fix-build-when-S-B.patch
>  delete mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0002-
> kexecboot-fix-configure-warnings.patch
>  delete mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0003-
> kexecboot-do-not-hardcode-MOUNTPOINT.patch
>  delete mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0004-
> kexecboot.c-workaround-for-absolute-kernel-and-initr.patch
>  delete mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h-
> fix-build-with-gcc5.patch
>  rename meta-initramfs/recipes-bsp/kexecboot/{kexecboot_0.6.bb =>
> kexecboot_git.bb} (81%)
>
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0001-
> kexecboot-fix-build-when-S-B.patch b/meta-initramfs/recipes-bsp/
> kexecboot/files/0001-kexecboot-fix-build-when-S-B.patch
> deleted file mode 100644
> index 6d3270f..0000000
> --- a/meta-initramfs/recipes-bsp/kexecboot/files/0001-
> kexecboot-fix-build-when-S-B.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 8519d61a7097498b0ee93fb8dc8262286825f3e5 Mon Sep 17 00:00:00 2001
> -From: Andrea Adami <andrea.adami@gmail.com>
> -Date: Thu, 1 May 2014 23:58:51 +0200
> -Subject: [PATCH 1/4] kexecboot: fix build when S != B
> -
> -* fatal error: ../config.h: No such file or directory
> -
> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ----
> - machine/zaurus.c | 2 +-
> - res/theme-gui.h  | 2 +-
> - res/theme-tui.h  | 4 ++--
> - 3 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/machine/zaurus.c b/machine/zaurus.c
> -index ea21047..83be13b 100644
> ---- a/machine/zaurus.c
> -+++ b/machine/zaurus.c
> -@@ -25,7 +25,7 @@
> -  *
> -  */
> -
> --#include "../config.h"
> -+#include "config.h"
> -
> - #ifdef USE_ZAURUS
> -
> -diff --git a/res/theme-gui.h b/res/theme-gui.h
> -index f8fef7f..79bed39 100644
> ---- a/res/theme-gui.h
> -+++ b/res/theme-gui.h
> -@@ -15,7 +15,7 @@
> -  *
> -  */
> -
> --#include "../config.h"
> -+#include "config.h"
> -
> - #ifdef USE_ICONS
> - /** Icons **/
> -diff --git a/res/theme-tui.h b/res/theme-tui.h
> -index 94e7693..909be56 100644
> ---- a/res/theme-tui.h
> -+++ b/res/theme-tui.h
> -@@ -15,11 +15,11 @@
> -  *
> -  */
> -
> --#include "../config.h"
> -+#include "config.h"
> -
> - #ifdef USE_TEXTUI
> - /** TEXT UI colors **/
> --#include "../termseq.h"
> -+#include "termseq.h"
> -
> - /* Background color pair */
> - #define TUI_CLR_BG            TERM_CSI TERM_BG_BLACK ";" TERM_FG_WHITE
> TERM_SGR
> ---
> -1.9.1
> -
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0002-
> kexecboot-fix-configure-warnings.patch b/meta-initramfs/recipes-bsp/
> kexecboot/files/0002-kexecboot-fix-configure-warnings.patch
> deleted file mode 100644
> index ecf422b..0000000
> --- a/meta-initramfs/recipes-bsp/kexecboot/files/0002-
> kexecboot-fix-configure-warnings.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From b8938acc3f1ab35273fa9a2fa7728050ef72ff65 Mon Sep 17 00:00:00 2001
> -From: Andrea Adami <andrea.adami@gmail.com>
> -Date: Fri, 2 May 2014 00:19:24 +0200
> -Subject: [PATCH 2/4] kexecboot: fix configure warnings
> -
> -Makefile.am:5: warning: source file 'fstype/fstype.c' is in a
> subdirectory,
> -Makefile.am:5: but option 'subdir-objects' is disabled
> -automake: warning: possible forward-incompatibility.
> -...
> -Makefile.am:5: warning: source file 'machine/zaurus.c' is in a
> subdirectory,
> -...
> -
> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 0ca4b81..66ec54e 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1,7 +1,7 @@
> - AC_PREREQ(2.53)
> - AC_INIT([kexecboot], [0.6], [kexecboot-devel@linuxtogo.org])
> - AC_CANONICAL_HOST
> --AM_INIT_AUTOMAKE([-Wall foreign])
> -+AM_INIT_AUTOMAKE([-Wall foreign] [subdir-objects])
> - AC_CONFIG_SRCDIR(kexecboot.c)
> - AC_CONFIG_HEADERS(config.h)
> - AM_MAINTAINER_MODE
> ---
> -1.9.1
> -
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0003-
> kexecboot-do-not-hardcode-MOUNTPOINT.patch b/meta-initramfs/recipes-bsp/
> kexecboot/files/0003-kexecboot-do-not-hardcode-MOUNTPOINT.patch
> deleted file mode 100644
> index 4caa0d5..0000000
> --- a/meta-initramfs/recipes-bsp/kexecboot/files/0003-
> kexecboot-do-not-hardcode-MOUNTPOINT.patch
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -From 800dae0d34f8629a34c638a612166b76dda03e27 Mon Sep 17 00:00:00 2001
> -From: Andrea Adami <andrea.adami@gmail.com>
> -Date: Sat, 2 Aug 2014 01:13:08 +0200
> -Subject: [PATCH 3/4] kexecboot: do not hardcode MOUNTPOINT
> -
> -Avoid to hardcode it: could be requested as a new configure option.
> -
> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ----
> - cfgparser.c |  6 +++---
> - kexecboot.c | 18 ++++++++++--------
> - 2 files changed, 13 insertions(+), 11 deletions(-)
> -
> -diff --git a/cfgparser.c b/cfgparser.c
> -index 8f6688c..dec27b1 100644
> ---- a/cfgparser.c
> -+++ b/cfgparser.c
> -@@ -141,7 +141,7 @@ static int set_kernel(struct cfgdata_t *cfgdata, char
> *value)
> -               return -1;
> -       }
> -
> --      strcpy(sc->kernelpath, "/mnt");
> -+      strcpy(sc->kernelpath, MOUNTPOINT);
> -       strcat(sc->kernelpath, value);
> -       return 0;
> - }
> -@@ -155,7 +155,7 @@ static int set_icon(struct cfgdata_t *cfgdata, char
> *value)
> -
> -       dispose(sc->iconpath);
> -       /* Add our mountpoint, since the enduser won't know it */
> --      sc->iconpath = malloc(sizeof(MOUNTPOINT)+strlen(value));
> -+      sc->iconpath = malloc(strlen(MOUNTPOINT)+strlen(value)+1);
> -       if (NULL == sc->iconpath) {
> -               DPRINTF("Can't allocate memory to store iconpath '%s'",
> value);
> -               return -1;
> -@@ -194,7 +194,7 @@ static int set_initrd(struct cfgdata_t *cfgdata, char
> *value)
> -               return -1;
> -       }
> -
> --      strcpy(sc->initrd, "/mnt");
> -+      strcpy(sc->initrd, MOUNTPOINT);
> -       strcat(sc->initrd, value);
> -       return 0;
> - }
> -diff --git a/kexecboot.c b/kexecboot.c
> -index d6657a0..7268d6b 100644
> ---- a/kexecboot.c
> -+++ b/kexecboot.c
> -@@ -57,20 +57,22 @@
> - #endif
> -
> - #ifdef USE_MACHINE_KERNEL
> --/* Machine-dependent kernel patch */
> -+/* Machine-dependent kernel path */
> - char *machine_kernel = NULL;
> - #endif
> -
> -+#define PREPEND_MOUNTPATH(string) MOUNTPOINT""string
> -+
> - /* NULL-terminated array of kernel search paths
> -  * First item should be filled with machine-dependent path */
> - char *default_kernels[] = {
> - #ifdef USE_ZIMAGE
> --      "/mnt/boot/zImage",
> --      "/mnt/zImage",
> -+      PREPEND_MOUNTPATH("/boot/zImage"),
> -+      PREPEND_MOUNTPATH("/zImage"),
> - #endif
> - #ifdef USE_UIMAGE
> --      "/mnt/boot/uImage",
> --      "/mnt/uImage",
> -+      PREPEND_MOUNTPATH("/boot/uImage"),
> -+      PREPEND_MOUNTPATH("/uImage"),
> - #endif
> -       NULL
> - };
> -@@ -149,14 +151,14 @@ char *get_machine_kernelpath() {
> -                       ++tmp;
> -               }
> -
> --              /* Prepend "/mnt/boot/zImage-" to hw */
> --              tmp = malloc(strlen(hw) + 17 + 1);      /*
> strlen("/mnt/boot/zImage-") */
> -+              /* Prepend  MOUNTPOINT"/boot/zImage-" to hw */
> -+              tmp = malloc(strlen(PREPEND_MOUNTPATH("/boot/zImage-")) +
> strlen(hw) + 1);
> -               if (NULL == tmp) {
> -                       DPRINTF("Can't allocate memory for
> machine-specific kernel path");
> -                       return NULL;
> -               }
> -
> --              strcpy(tmp, "/mnt/boot/zImage-");
> -+              strcpy(tmp, PREPEND_MOUNTPATH("/boot/zImage-"));
> -               strcat(tmp, hw);
> -
> -               return tmp;
> ---
> -1.9.1
> -
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0004-
> kexecboot.c-workaround-for-absolute-kernel-and-initr.patch
> b/meta-initramfs/recipes-bsp/kexecboot/files/0004-
> kexecboot.c-workaround-for-absolute-kernel-and-initr.patch
> deleted file mode 100644
> index 6d81d83..0000000
> --- a/meta-initramfs/recipes-bsp/kexecboot/files/0004-
> kexecboot.c-workaround-for-absolute-kernel-and-initr.patch
> +++ /dev/null
> @@ -1,135 +0,0 @@
> -From de9a6284df8add6ec03e1d9981d0b6d0595bbc69 Mon Sep 17 00:00:00 2001
> -From: Andrea Adami <andrea.adami@gmail.com>
> -Date: Mon, 10 Nov 2014 23:37:23 +0100
> -Subject: [PATCH 4/4] kexecboot.c: workaround for absolute kernel and
> initrd
> - symlinks
> -
> -Add MOUNTPOINT prefix if the kernel/initrd symlinks start with '/'.
> -Do nothing if the path is a relative symbolic link or not a symlink.
> -
> -Fix following situation:
> -
> -root@mizar:/var/tmp# ls -al boot/
> -total 2076
> -drwxr-xr-x 2 root root    4096 lug  5 01:38 .
> -drwxrwxrwt 4 root root    4096 lug  5 12:26 ..
> --rw-r--r-- 1 root root     831 lug  5 01:24 boot.cfg
> --rw-r--r-- 1 root root    1322 lug  5 01:24 icon.xpm
> -lrwxrwxrwx 1 root root      34 lug  5 12:26 zImage ->
> -/boot/zImage-3.14.5-yocto-standard
> --rw-r--r-- 1 root root 2106832 lug  5 01:20 zImage-3.14.5-yocto-standard
> -
> -Cannot open `/mnt/boot/zImage': No such file or directory
> -Nothing has been loaded!
> -
> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ----
> - kexecboot.c | 53 ++++++++++++++++++++++++++++++++++++++++++++---------
> - 1 file changed, 44 insertions(+), 9 deletions(-)
> -
> -diff --git a/kexecboot.c b/kexecboot.c
> -index 7268d6b..8a7a7d2 100644
> ---- a/kexecboot.c
> -+++ b/kexecboot.c
> -@@ -208,11 +208,16 @@ void start_kernel(struct params_t *params, int
> choice)
> -       const char *load_argv[] = { NULL, "-l", NULL, NULL, NULL, NULL };
> -       const char *exec_argv[] = { NULL, "-e", NULL, NULL};
> -
> --      char *cmdline_arg = NULL, *initrd_arg = NULL;
> -+      char *cmdline_arg = NULL, *initrd_arg = NULL, *kernel_arg = NULL;
> -       int n, idx, u;
> -       struct stat sinfo;
> -       struct boot_item_t *item;
> -
> -+      /* buffer for readlink (could be truncated) */
> -+      char buf[512];
> -+      int len;
> -+
> -+
> -       item = params->bootcfg->list[choice];
> -
> -       exec_argv[0] = kexec_path;
> -@@ -306,10 +311,17 @@ void start_kernel(struct params_t *params, int
> choice)
> -               }
> -       }
> -
> -+      /* Mount boot device */
> -+      if ( -1 == mount(mount_dev, mount_point, mount_fstype,
> -+                      MS_RDONLY, NULL) ) {
> -+              perror("Can't mount boot device");
> -+              exit(-1);
> -+      }
> -+
> -       /* fill '--initrd' option */
> -       if (item->initrd) {
> -               /* allocate space */
> --              n = sizeof(str_initrd_start) + strlen(item->initrd);
> -+              n = sizeof(str_initrd_start) + strlen(item->initrd) + 1 +
> sizeof(mount_point) + sizeof(buf);
> -
> -               initrd_arg = (char *)malloc(n);
> -               if (NULL == initrd_arg) {
> -@@ -317,24 +329,46 @@ void start_kernel(struct params_t *params, int
> choice)
> -               } else {
> -                       strcpy(initrd_arg, str_initrd_start);   /*
> --initrd= */
> -                       strcat(initrd_arg, item->initrd);
> -+
> -+                      if ((len = readlink(item->initrd, buf,
> sizeof(buf)-1)) != -1) {
> -+                              buf[len] = '\0';
> -+                              /* Fix absolute symlinks: prepend
> MOUNTPOINT */
> -+                              if (buf[0] == '/') {
> -+                                      strcpy(initrd_arg,
> str_initrd_start);   /* --initrd= */
> -+                                      strcat(initrd_arg, mount_point);
> -+                                      strcat(initrd_arg, buf);
> -+                              }
> -+                      }
> -                       load_argv[idx] = initrd_arg;
> -                       ++idx;
> -               }
> -       }
> -
> -       /* Append kernelpath as last arg of kexec */
> --      load_argv[idx] = item->kernelpath;
> -+              /* allocate space */
> -+              n = strlen(item->kernelpath) + 1 + sizeof(mount_point) +
> sizeof(buf);
> -+
> -+              kernel_arg = (char *)malloc(n);
> -+              if (NULL == kernel_arg) {
> -+                      perror("Can't allocate memory for kernel_arg");
> -+              } else {
> -+                      strcpy(kernel_arg, item->kernelpath);
> -+
> -+                      if ((len = readlink(item->kernelpath, buf,
> sizeof(buf)-1)) != -1) {
> -+                              buf[len] = '\0';
> -+                              /* Fix absolute symlinks: prepend
> MOUNTPOINT */
> -+                              if (buf[0] == '/') {
> -+                                      strcpy(kernel_arg, mount_point);
> -+                                      strcat(kernel_arg, buf);
> -+                              }
> -+                      }
> -+                      load_argv[idx] = kernel_arg;
> -+              }
> -
> -       DPRINTF("load_argv: %s, %s, %s, %s, %s", load_argv[0],
> -                       load_argv[1], load_argv[2],
> -                       load_argv[3], load_argv[4]);
> -
> --      /* Mount boot device */
> --      if ( -1 == mount(mount_dev, mount_point, mount_fstype,
> --                      MS_RDONLY, NULL) ) {
> --              perror("Can't mount boot device");
> --              exit(-1);
> --      }
> -
> -       /* Load kernel */
> -       n = fexecw(kexec_path, (char *const *)load_argv, envp);
> -@@ -347,6 +381,7 @@ void start_kernel(struct params_t *params, int choice)
> -
> -       dispose(cmdline_arg);
> -       dispose(initrd_arg);
> -+      dispose(kernel_arg);
> -
> -       /* Check /proc/sys/net presence */
> -       if ( -1 == stat("/proc/sys/net", &sinfo) ) {
> ---
> -1.9.1
> -
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h-fix-build-with-gcc5.patch
> b/meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h-
> fix-build-with-gcc5.patch
> deleted file mode 100644
> index b54199b..0000000
> --- a/meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h-
> fix-build-with-gcc5.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From b2c4fc69868a4831ec798ad98f5e7fce200cf0e3 Mon Sep 17 00:00:00 2001
> -From: Andrea Adami <andrea.adami@gmail.com>
> -Date: Thu, 24 Sep 2015 00:02:48 +0200
> -Subject: [PATCH] rgb.h: fix build with gcc 5 (C99 inline semantic)
> -
> -Building with gcc 5.2 we trigger the following error:
> -
> -rgb.h:55:1: warning: inline function 'rgba2comp' declared but never
> defined
> -|  rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
> -|  ^
> -
> -https://gcc.gnu.org/gcc-5/porting_to.html
> -
> -Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ----
> - rgb.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/rgb.h b/rgb.h
> -index 0ba987a..4f64622 100644
> ---- a/rgb.h
> -+++ b/rgb.h
> -@@ -51,8 +51,7 @@ typedef struct {
> - } kx_named_color;
> -
> - /* Convert RGBA uint32 to red/green/blue/alpha components */
> --inline void
> --rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
> -+void rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
> -               kx_ccomp *blue, kx_ccomp *alpha);
> -
> - /* Convert hex rgb color to rgba color */
> ---
> -1.9.1
> -
> diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
> b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> similarity index 81%
> rename from meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
> rename to meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> index 45095f3..2984e2c 100644
> --- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
> +++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
> @@ -36,21 +36,9 @@ DESCRIPTION = "kexecboot is a graphical
> linux-as-bootloader implementation based
>  HOMEPAGE = "http://kexecboot.org"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> -
> -S = "${WORKDIR}/kexecboot-${PV}"
> -SRC_URI = "https://github.com/kexecboot/kexecboot/archive/v${PV}.tar.gz"
> -SRC_URI[md5sum] = "46b7c1a6f20531be56445ebb8669a2b8"
> -SRC_URI[sha256sum] = "6b360b8aa59bc5d68a96705349a0dd
> 416f8ed704e931fa0ac7849298258f0f15"
> -
> -SRC_URI += "\
> -            file://0001-kexecboot-fix-build-when-S-B.patch \
> -            file://0002-kexecboot-fix-configure-warnings.patch \
> -            file://0003-kexecboot-do-not-hardcode-MOUNTPOINT.patch \
> -            file://0004-kexecboot.c-workaround-for-absolute-kernel-and-initr.patch
> \
> -            \
> -            file://0005-rgb.h-fix-build-with-gcc5.patch \
> -            "
> -
> +S = "${WORKDIR}/git"
> +SRC_URI = "git://github.com/kexecboot/kexecboot.git"
> +SRCREV = "4c4f127e79ac5b8d6b6e2fbb938ccbf12b04c531"
>  inherit autotools
>
>  EXTRA_OECONF = "--enable-textui --enable-delay=2
> --enable-evdev-rate=1000,250"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

