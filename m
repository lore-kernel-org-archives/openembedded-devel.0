Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7005C5DF94
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 16:41:55 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11531.1787330510690944401
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 09:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p04PpQVU;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc149372c14so933000a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787330510; x=1787935310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgWIQ1WGJ252/okwRfy5bGjLN8xi4Gg/Tp2hcLgWorg=;
        b=p04PpQVUN9+qrmXN9QRxajgjZdGv8Ko1QVqLo4RaTlicS6H/JVxYJXhf3dCMCyvFgA
         2jm2IcodvE95Zt7qkt1TMk2e4nH+y+SF1U1rKsUcD/0sqffLbvpizkJMToa9AArufO7t
         D+HdGLZ6N6Kj4Rpa3kWD0SQXsMNoNsNmnKVr57yz4dYd8oyC4SZXNVWKGmy4lg/VIWKX
         aF2MUIWNZmWpan0i/lno54JaDbcFP5d58/qMnbFXMGgHKqbo+ZMBURr8YD5vqrTdLmdi
         1lXMepjLj8WQbQ1Zy2deGbqA6d+iCXvHYN74Gl1Fz+yqeYBh7lnpuT9grxX69tXqty+a
         Yk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787330510; x=1787935310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xgWIQ1WGJ252/okwRfy5bGjLN8xi4Gg/Tp2hcLgWorg=;
        b=qHQ/xiOI0t4PljDZsSi7W5BjPeMpV+iCf/bf2F8kyQQvVXgAPaTUVRucS/q8oY6bd2
         MEh/v0pavKvxqgrLKH3zjfIfW4P4CCM64ZzKAp1Ohw5g0cWaB1DbzXBKp7DgC1VlbCkT
         FlW0LSo9uMSAUQva3FZavrjCf9BqPY52DbCuN2KWQIM2WnVFn6QJ4YCVGJpkNZQfV5th
         Xm0gB+i/wxYoizFMphGjwo6o4X7FQqsocB8PAzjtBKsBqVPYr5FSeQgDfnGo7SZ+XBXb
         sQ9aM2CthrJR5zdnBvBw2SwLpR6rdDli5rrbaQiU6sQNKSUJtVVmfPC6Wyc7SESgMCcJ
         SKWQ==
X-Gm-Message-State: AFuF++mOtHawG7xqcNcM0Ha6rqUEF6FsF5JMq2VCBlkh9OCsXUjyapUq
	DWK8bO7NDKAmOWdHyODfh2beqWZcF3ubG/p0nzOHvQMUS4VJf7YCJaTy0So1pF6R
X-Gm-Gg: AR+sD13pewkBsYcCYno6JdpViqmFg8STQwWHLehL7UBBrS0ETfNMcp0lD7ItWTrEuyS
	511WfWCbSQ+vL3PmTubj9PIvQsc4joZWxrUlo0+ilZ9dq3XcJ0mut7tbvMLZrfhnmPlSSwHfoH5
	TFHZGh8yCe5B4rrNPniEx/sstKPf5ASgy0WTo4G2r94a3dq4vd5w+n2yWH49bigl2N7WpS3PD9S
	yI4tzb5vE+VU8Re7M85XgNw5sgZbCl6KiBe5lIrRteo/Q7iQ+Cm3ylK4elQ7schfRMy8I+Dkg6x
	y9vhAHyXZDGaQ5E5DAWnhA4d+3m4fzRoyaB3QuACvLEN1RyNHLPPllmaUsv0kKsZ5ntIHv7jKE1
	1WNCCMtFdczB/PE6i8cUm5T3lv8MrM5nhbyPKGDOMn3lILOTgkyhuIAvGSWJb5NP+AHMxdD5RMK
	9JVezcgisOWFjXmRkRxafyEPBdXDF5Yyla36YbuwCG4GMSvEiEQWq+iJC1oidysb0FiRA6gQvtU
	O6pIU6AT0M9JqYeh0076LU5RH5s3OgKz8zwTArTaqn3mcrKpWue54adH6GJvQNzpKip8g6VAWtX
	9lXEuLNqI43i80oE2uyuFeN9ecwhM1G/OqN8QVKGKk5SG0FNHV0Q0WqaH92WulRRvDdahtU1Yuj
	Hl6//mz2lDrth4jxSs3MZsyDgPhFheu5lHNY8VVvdN81KafSZjzbZiw+qzw==
X-Received: by 2002:a05:6a20:a122:b0:3bf:b84c:2984 with SMTP id adf61e73a8af0-3cd3007cf78mr12181497637.11.1787330509705;
        Fri, 21 Aug 2026 09:41:49 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae89189sm27634802c88.14.2026.08.21.09.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:41:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 2/2] linux-atm: Remove recipe
Date: Fri, 21 Aug 2026 09:41:45 -0700
Message-ID: <20260821164145.7081-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821164145.7081-1-khem.raj@oss.qualcomm.com>
References: <20260821164145.7081-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 16:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129424

Linux commit 8f9616500c59 ("atm: remove orphaned uAPI for deleted drivers,
protocols and SVCs") deleted atm uAPI headers and ioctls in
linux/atmdev.h, legacy ATM drivers had been dropped from the kernel.

linux-atm is the userspace side of exactly those interfaces, so it no
longer builds once linux-libc-headers is 7.2:

  | ispl_l.l:15:10: fatal error: 'linux/atmsvc.h' file not found
  | ispl_y.y:15:10: fatal error: 'linux/atmsvc.h' file not found
  | src/test/isp.c:19:10: fatal error: 'linux/atmsvc.h' file not found
  | make[3]: *** [Makefile:589: ispl_y.o] Error 1

Remove the package

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../packagegroup-meta-networking.bb           |  1 -
 .../0001-Fix-implicit-declaration-error.patch | 44 ---------
 ...0001-IFNAMSIZ-is-defined-in-net-if.h.patch | 48 ----------
 ...for-symbol-from-libresolv-instead-of.patch | 28 ------
 ...compile-error-with-linux-kernel-v4.8.patch | 74 ---------------
 ...-from-memcpy-and-strcpy-function-pro.patch | 87 ------------------
 .../linux-atm/0001-make-Add-PREFIX-knob.patch | 31 -------
 ...-Include-linux-sockios.h-for-SIOCGST.patch | 59 ------------
 .../0001-ttcp-Add-printf-format-string.patch  | 34 -------
 .../0002-Fix-build-with-gcc-15.patch          | 91 -------------------
 ...-hack-to-compile-with-very-old-glibc.patch | 37 --------
 .../linux-atm/install-from-buildir.patch      | 21 -----
 .../linux-atm/link-with-ldflags.patch         | 40 --------
 .../linux-atm/linux-atm/musl-no-on_exit.patch | 37 --------
 .../linux-atm/linux-atm_2.5.2.bb              | 39 --------
 15 files changed, 671 deletions(-)
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-Fix-implicit-declaration-error.patch
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-IFNAMSIZ-is-defined-in-net-if.h.patch
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-configure-Check-for-symbol-from-libresolv-instead-of.patch
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-fix-compile-error-with-linux-kernel-v4.8.patch
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-include-string-h-from-memcpy-and-strcpy-function-pro.patch
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-ttcp-Add-printf-format-string.patch
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0002-Fix-build-with-gcc-15.patch
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/install-from-buildir.patch
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/link-with-ldflags.patch
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/musl-no-on_exit.patch
 delete mode 100644 meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 21c9dce4e1..06cf5a7083 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -185,7 +185,6 @@ RDEPENDS:packagegroup-meta-networking-support = "\
     libtalloc \
     ipcalc \
     libtevent \
-    linux-atm \
     lksctp-tools \
     mctp \
     memcached \
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-Fix-implicit-declaration-error.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-Fix-implicit-declaration-error.patch
deleted file mode 100644
index 1c5f79c9d8..0000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm/0001-Fix-implicit-declaration-error.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1435d613ee632bd7a2aa15180acf06ff3723da41 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Sat, 26 Apr 2025 13:03:35 +0200
-Subject: [PATCH] Fix implicit-declaration error
-
-* taken from:
-  https://github.com/sbwml/package_network_utils_linux-atm/blob/main/patches/900-fix-implicit-declaration-error.patch
-
-* fixes:
-  http://errors.yoctoproject.org/Errors/Details/766901/
-  linux-atm-2.5.2/src/led/conn.c:414:57: error: passing argument 3 of 'accept' from incompatible pointer type [-Wincompatible-pointer-types]
-
-Upstream-Status: Inappropriate [Upstream is dead]
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- src/led/conn.c     | 2 +-
- src/maint/hediag.c | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/led/conn.c b/src/led/conn.c
-index 99da5e4..89639e1 100644
---- a/src/led/conn.c
-+++ b/src/led/conn.c
-@@ -405,7 +405,7 @@ Conn_t *accept_conn(Conn_t *conn)
- {
-         Conn_t *new;
-         struct sockaddr_atmsvc addr;
--        size_t len;
-+        socklen_t len;
-         int fd;
-         char buff[MAX_ATM_ADDR_LEN+1];
-
-diff --git a/src/maint/hediag.c b/src/maint/hediag.c
-index a4f792f..3b1b7fb 100644
---- a/src/maint/hediag.c
-+++ b/src/maint/hediag.c
-@@ -9,6 +9,7 @@
- #include <linux/atmdev.h>
- #include <linux/sonet.h>
- #include <linux/atm_he.h>
-+#include <string.h>
-
- struct reg_table {
- 	unsigned addr;
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-IFNAMSIZ-is-defined-in-net-if.h.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-IFNAMSIZ-is-defined-in-net-if.h.patch
deleted file mode 100644
index a7c7093e09..0000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm/0001-IFNAMSIZ-is-defined-in-net-if.h.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 29b37e45577c0921846c1709a190f08a3b032666 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Mar 2019 09:08:38 -0800
-Subject: [PATCH] IFNAMSIZ is defined in net/if.h
-
-Fixes
-/mnt/a/yoe/build/tmp/work/qemuriscv64-yoe-linux-musl/linux-atm/2.5.2-r0/recipe-sysroot/usr/include/linux/if_arp.h:121:16: error: 'IFNAMSIZ' undeclared here (not in a function)
-|  char  arp_dev[IFNAMSIZ];
-|                ^~~~~~~~
-In file included from ../../../linux-atm-2.5.2/src/arpd/itf.c:17:
-/mnt/a/yoe/build/tmp/work/qemuriscv64-yoe-linux-musl/linux-atm/2.5.2-r0/recipe-sysroot/usr/include/linux/if_arp.h:121:16: error: 'IFNAMSIZ' undeclared here (not in a function)
-|  char  arp_dev[IFNAMSIZ];
-|                ^~~~~~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/arpd/arp.c | 1 +
- src/arpd/itf.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/arpd/arp.c b/src/arpd/arp.c
-index 92d3787..ff1574c 100644
---- a/src/arpd/arp.c
-+++ b/src/arpd/arp.c
-@@ -17,6 +17,7 @@
- #include <netinet/in.h> /* for ntohs, etc. */
- #define _LINUX_NETDEVICE_H /* very crude hack for glibc2 */
- #include <linux/types.h>
-+#include <net/if.h>
- #include <linux/if_arp.h>
- #include <linux/if_ether.h>
- #include <atm.h>
-diff --git a/src/arpd/itf.c b/src/arpd/itf.c
-index 92f0951..d285e3b 100644
---- a/src/arpd/itf.c
-+++ b/src/arpd/itf.c
-@@ -14,6 +14,7 @@
- #include <sys/socket.h>
- #define _LINUX_NETDEVICE_H /* glibc2 */
- #include <linux/types.h>
-+#include <net/if.h>
- #include <linux/if_arp.h>
-
- #include "atmd.h"
---
-2.21.0
-
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-configure-Check-for-symbol-from-libresolv-instead-of.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-configure-Check-for-symbol-from-libresolv-instead-of.patch
deleted file mode 100644
index abae366d28..0000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm/0001-configure-Check-for-symbol-from-libresolv-instead-of.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a2a2e1b7a3f4f90e32912b5ba9b79e1a02275775 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 Sep 2022 11:17:13 -0700
-Subject: [PATCH] configure: Check for symbol from libresolv instead of main
-
-This checks will fail with modern autoconf and compilers
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/configure.in
-+++ b/configure.in
-@@ -45,12 +45,7 @@ AC_CHECK_HEADER(linux/atmsap.h, ,
- )
-
- dnl Check for libraries
--dnl libresolv is required
--AC_CHECK_LIB(resolv, main, ,
--	AC_MSG_ERROR([*** Unable to find libresolv!!!])
--)
-
--dnl We don't want libresolv everywhere, just with libatm
- LIBS=""
-
- INCLUDES="-I\$(top_srcdir)/src/include"
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-fix-compile-error-with-linux-kernel-v4.8.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-fix-compile-error-with-linux-kernel-v4.8.patch
deleted file mode 100644
index 403146e603..0000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm/0001-fix-compile-error-with-linux-kernel-v4.8.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 7cdafc0dee8054f82777ed3bf6d4c8b5582d09ad Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Tue, 18 Oct 2016 07:56:02 +0000
-Subject: [PATCH] fix compile error with linux kernel v4.8
-
-In src/maint/zntune.c, the glibc time.h is included before linux
-time.h, so when compile the zntune.c, it break down by errors:
-
-	redefinition of 'struct timespec' 'struct timeval'
-	                'struct timezone' 'struct itimerval'
-
-We should exclude the linux time.h by disable linux/atm_zatm.h and
-move some useful definition in linux/atm_zatm.h to zntune.c to resolve
-it.
-
-Upstream-Status: Pending
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- src/include/atm_zatm.h | 26 ++++++++++++++++++++++++++
- src/maint/zntune.c     |  3 +--
- 2 files changed, 27 insertions(+), 2 deletions(-)
- create mode 100644 src/include/atm_zatm.h
-
-diff --git a/src/include/atm_zatm.h b/src/include/atm_zatm.h
-new file mode 100644
-index 0000000..7d64f4d
---- /dev/null
-+++ b/src/include/atm_zatm.h
-@@ -0,0 +1,26 @@
-+#include <linux/atmapi.h>
-+#include <linux/atmioc.h>
-+
-+#define ZATM_GETPOOL    _IOW('a',ATMIOC_SARPRV+1,struct atmif_sioc)
-+                                                /* get pool statistics */
-+#define ZATM_GETPOOLZ   _IOW('a',ATMIOC_SARPRV+2,struct atmif_sioc)
-+                                                /* get statistics and zero */
-+#define ZATM_SETPOOL    _IOW('a',ATMIOC_SARPRV+3,struct atmif_sioc)
-+
-+struct zatm_pool_info {
-+        int ref_count;                  /* free buffer pool usage counters */
-+        int low_water,high_water;       /* refill parameters */
-+        int rqa_count,rqu_count;        /* queue condition counters */
-+        int offset,next_off;            /* alignment optimizations: offset */
-+        int next_cnt,next_thres;        /* repetition counter and threshold */
-+};                                                /* set pool parameters */
-+
-+struct zatm_pool_req {
-+        int pool_num;                   /* pool number */
-+        struct zatm_pool_info info;     /* actual information */
-+};
-+
-+#define ZATM_OAM_POOL           0       /* free buffer pool for OAM cells */
-+#define ZATM_AAL0_POOL          1       /* free buffer pool for AAL0 cells */
-+#define ZATM_AAL5_POOL_BASE     2       /* first AAL5 free buffer pool */
-+#define ZATM_LAST_POOL  ZATM_AAL5_POOL_BASE+10 /* max. 64 kB */
-diff --git a/src/maint/zntune.c b/src/maint/zntune.c
-index 62d62ab..bb93eab 100644
---- a/src/maint/zntune.c
-+++ b/src/maint/zntune.c
-@@ -13,9 +13,8 @@
- #include <sys/socket.h>
- #include <sys/ioctl.h>
- #include <atm.h>
-+#include <atm_zatm.h>
- #include <sys/time.h> /* for struct timeval, although it's not used */
--#include <linux/atm_zatm.h>
--
-
- static void usage(const char *name)
- {
---
-2.9.0
-
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-include-string-h-from-memcpy-and-strcpy-function-pro.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-include-string-h-from-memcpy-and-strcpy-function-pro.patch
deleted file mode 100644
index 81c5efd173..0000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm/0001-include-string-h-from-memcpy-and-strcpy-function-pro.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 5217cb7c829cf87771096c4ce41fd4648dca47cb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 29 Aug 2022 16:36:21 -0700
-Subject: [PATCH] include string,h from memcpy and strcpy function prototype
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/led/address.c  | 1 +
- src/led/display.c  | 1 +
- src/lib/unix.c     | 1 +
- src/maint/hediag.c | 1 +
- src/sigd/kernel.c  | 1 +
- src/sigd/policy.c  | 1 +
- 6 files changed, 6 insertions(+)
-
-diff --git a/src/led/address.c b/src/led/address.c
-index 574e881..b5c5fbb 100644
---- a/src/led/address.c
-+++ b/src/led/address.c
-@@ -31,6 +31,7 @@
- #endif
-
- #include <sys/ioctl.h>
-+#include <string.h>
- #include <unistd.h>
- #include <errno.h>
-
-diff --git a/src/led/display.c b/src/led/display.c
-index d78a15d..b835e89 100644
---- a/src/led/display.c
-+++ b/src/led/display.c
-@@ -5,6 +5,7 @@
- #if HAVE_CONFIG_H
- #include <config.h>
- #endif
-+#include <string.h>
-
- #include <atm.h>
- #include <atmd.h>
-diff --git a/src/lib/unix.c b/src/lib/unix.c
-index 34aa465..d5bef54 100644
---- a/src/lib/unix.c
-+++ b/src/lib/unix.c
-@@ -8,6 +8,7 @@
-
- #include <stdlib.h>
- #include <stdio.h>
-+#include <string.h>
- #include <unistd.h>
- #include <errno.h>
- #include <sys/types.h>
-diff --git a/src/maint/hediag.c b/src/maint/hediag.c
-index 8a4312a..a4f792f 100644
---- a/src/maint/hediag.c
-+++ b/src/maint/hediag.c
-@@ -1,5 +1,6 @@
- #include <stdio.h>
- #include <stdlib.h>
-+#include <string.h>
- #include <unistd.h>
- #include <sys/ioctl.h>
- #include <sys/types.h>
-diff --git a/src/sigd/kernel.c b/src/sigd/kernel.c
-index 9ee74b1..2491626 100644
---- a/src/sigd/kernel.c
-+++ b/src/sigd/kernel.c
-@@ -8,6 +8,7 @@
-
- #include <stdlib.h>
- #include <stdio.h>
-+#include <string.h>
- #include <errno.h>
- #include <assert.h>
-
-diff --git a/src/sigd/policy.c b/src/sigd/policy.c
-index 2cfb42d..87223a7 100644
---- a/src/sigd/policy.c
-+++ b/src/sigd/policy.c
-@@ -6,6 +6,7 @@
- #include <config.h>
- #endif
-
-+#include <string.h>
- #include <atm.h>
- #include <atmd.h>
-
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch
deleted file mode 100644
index 9c83ef0af4..0000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm/0001-make-Add-PREFIX-knob.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 94cb952207e44a5c29578c9c56912190a5422876 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 23 Apr 2022 09:41:51 -0700
-Subject: [PATCH] make: Add PREFIX knob
-
-This will be used to pass appropriate root prefix which is different
-when using usrmerge
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/extra/Makefile.am | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
---- a/src/extra/Makefile.am
-+++ b/src/extra/Makefile.am
-@@ -8,10 +8,10 @@ BUILT_SOURCES = pca200e.bin pca200e_ecd.
- CLEANFILES = pca200e.bin pca200e_ecd.bin2 sba200e_ecd.bin2
-
- install-exec-hook:
--	$(MKDIR_P) $(DESTDIR)/lib/firmware
--	$(INSTALL_DATA) $(builddir)/pca200e.bin $(DESTDIR)/lib/firmware
--	$(INSTALL_DATA) $(builddir)/pca200e_ecd.bin2 $(DESTDIR)/lib/firmware
--	$(INSTALL_DATA) $(builddir)/sba200e_ecd.bin2 $(DESTDIR)/lib/firmware
-+	$(MKDIR_P) $(DESTDIR)$(ROOTPREFIX)/lib/firmware
-+	$(INSTALL_DATA) $(builddir)/pca200e.bin $(DESTDIR)$(ROOTPREFIX)/lib/firmware
-+	$(INSTALL_DATA) $(builddir)/pca200e_ecd.bin2 $(DESTDIR)$(ROOTPREFIX)/lib/firmware
-+	$(INSTALL_DATA) $(builddir)/sba200e_ecd.bin2 $(DESTDIR)$(ROOTPREFIX)/lib/firmware
-
- %.bin %.bin2: %.data
- 	objcopy -Iihex $< -Obinary $@.gz
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch
deleted file mode 100644
index a54869db89..0000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm/0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 4456e13880803a300e4b6f263ad22a37481b5df5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Aug 2019 09:33:43 -0700
-Subject: [PATCH] saaldump,atmdump: Include linux/sockios.h for SIOCGSTAMP
-
-In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
-the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
-Instead it provides only SIOCGSTAMP_OLD.
-
-The linux/sockios.h header now defines SIOCGSTAMP using either
-SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. This linux only
-header file is not pulled so we get a build failure.
-
-Fixes
-../../../linux-atm-2.5.2/src/maint/atmdump.c:142:18: error: use of undeclared identifier 'SIOCGSTAMP'
-            if (ioctl(s,SIOCGSTAMP,&stamp) < 0) {
-                        ^
-1 error generated.
-make[3]: *** [Makefile:623: atmdump.o] Error 1
-make[3]: *** Waiting for unfinished jobs....
-../../../linux-atm-2.5.2/src/maint/saaldump.c:169:14: error: use of undeclared identifier 'SIOCGSTAMP'
-        if (ioctl(s,SIOCGSTAMP,&stamp) < 0) {
-                    ^
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/maint/atmdump.c  | 2 +-
- src/maint/saaldump.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/maint/atmdump.c b/src/maint/atmdump.c
-index 8b17826..9e4853b 100644
---- a/src/maint/atmdump.c
-+++ b/src/maint/atmdump.c
-@@ -5,7 +5,7 @@
- #if HAVE_CONFIG_H
- #include <config.h>
- #endif
--
-+#include <linux/sockios.h>
- #include <stdlib.h>
- #include <stdio.h>
- #include <unistd.h>
-diff --git a/src/maint/saaldump.c b/src/maint/saaldump.c
-index 83bdde9..69429a8 100644
---- a/src/maint/saaldump.c
-+++ b/src/maint/saaldump.c
-@@ -5,7 +5,7 @@
- #if HAVE_CONFIG_H
- #include <config.h>
- #endif
--
-+#include <linux/sockios.h>
- #include <stdlib.h>
- #include <stdarg.h>
- #include <stdio.h>
---
-2.23.0
-
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-ttcp-Add-printf-format-string.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-ttcp-Add-printf-format-string.patch
deleted file mode 100644
index 87e7dc3c69..0000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm/0001-ttcp-Add-printf-format-string.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b83fd54584fabd5d24f6645b4a3cf345c9d2020d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Jun 2017 16:11:59 -0700
-Subject: [PATCH 1/3] ttcp: Add printf format string
-
-Fixes compiler warnings when format security is enabled
-
-| ../../../linux-atm-2.5.2/src/test/ttcp.c:666:21: error: format not a string literal and no format arguments [-Werror=format-security]
-|      fprintf(stderr, Usage);
-|                      ^~~~~
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/test/ttcp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/test/ttcp.c b/src/test/ttcp.c
-index acb9185..337cee5 100644
---- a/src/test/ttcp.c
-+++ b/src/test/ttcp.c
-@@ -663,7 +663,7 @@ int no_check = 0;
-     exit(0);
-
-   usage:
--    fprintf(stderr, Usage);
-+    fprintf(stderr, "%s", Usage);
-     exit(1);
- }
-
---
-2.13.1
-
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0002-Fix-build-with-gcc-15.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0002-Fix-build-with-gcc-15.patch
deleted file mode 100644
index 1cbd6a5831..0000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm/0002-Fix-build-with-gcc-15.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 2a9d42b2b190d533cf126a93bcad842cea825bbe Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Sat, 26 Apr 2025 13:04:56 +0200
-Subject: [PATCH] Fix build with gcc-15
-
-* taken from:
-  https://github.com/sbwml/package_network_utils_linux-atm/blob/1d1c3f884daf9ee4bce077f3db9d990617683669/patches/901-linux-atm-dont-use-bool-keyword.patch
-
-* fixes:
-  http://errors.yoctoproject.org/Errors/Details/852979/
-
-In file included from load_lex.l:11:
-../../../linux-atm-2.5.2/src/lane/load_lex.h:27:10: error: two or more data types in declaration specifiers
-   27 |   Bool_t bool;
-      |          ^~~~
-../../../linux-atm-2.5.2/src/lane/load_lex.h:27:14: warning: declaration does not declare anything
-   27 |   Bool_t bool;
-      |              ^
-In file included from ../../../linux-atm-2.5.2/src/lane/load.c:29:
-../../../linux-atm-2.5.2/src/lane/load_lex.h:27:10: error: two or more data types in declaration specifiers
-   27 |   Bool_t bool;
-      |          ^~~~
-../../../linux-atm-2.5.2/src/lane/load_lex.h:27:14: warning: declaration does not declare anything
-   27 |   Bool_t bool;
-      |              ^
-load_lex.l: In function 'yylex':
-load_lex.l:47:11: error: expected identifier before 'bool'
-load_lex.l:51:11: error: expected identifier before 'bool'
-../../../linux-atm-2.5.2/src/lane/load.c: In function 'load_vars':
-../../../linux-atm-2.5.2/src/lane/load.c:501:29: error: expected identifier before 'bool'
-  501 |                    g_return.bool==BL_TRUE?"True":"False");
-      |                             ^~~~
-../../../linux-atm-2.5.2/src/lane/load.c:502:51: error: expected identifier before 'bool'
-  502 |         set_var_bool(curr_unit, varname, g_return.bool);
-      |                                                   ^~~~
-make[3]: *** [Makefile:513: load.o] Error 1
-
-Upstream-Status: Inappropriate [Upstream is dead]
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- src/lane/load.c     | 4 ++--
- src/lane/load_lex.h | 2 +-
- src/lane/load_lex.l | 4 ++--
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/lane/load.c b/src/lane/load.c
-index 39d4672..1cc2202 100644
---- a/src/lane/load.c
-+++ b/src/lane/load.c
-@@ -498,8 +498,8 @@ load_vars(const char *file)
- 	break;
-       case BOOLEAN:
- 	Debug_unit(&load_unit, "Variable is boolean: %s",
--		   g_return.bool==BL_TRUE?"True":"False");
--	set_var_bool(curr_unit, varname, g_return.bool);
-+		   g_return.b==BL_TRUE?"True":"False");
-+	set_var_bool(curr_unit, varname, g_return.b);
- 	break;
-       case INTEGER:
- 	Debug_unit(&load_unit, "Variable is integer: %d", g_return.intti);
-diff --git a/src/lane/load_lex.h b/src/lane/load_lex.h
-index 2384e70..72b8f9b 100644
---- a/src/lane/load_lex.h
-+++ b/src/lane/load_lex.h
-@@ -24,7 +24,7 @@
- #define END 0
-
- typedef struct {
--  Bool_t bool;
-+  Bool_t b;
-   int intti;
-   AtmAddr_t *atmaddress;
-   LaneDestination_t *destaddr;
-diff --git a/src/lane/load_lex.l b/src/lane/load_lex.l
-index c184795..1d412e3 100644
---- a/src/lane/load_lex.l
-+++ b/src/lane/load_lex.l
-@@ -44,11 +44,11 @@ H [0-9a-fA-F]
- 		 return ATMADDRESS;
- 	        }
- True	|
--true		{g_return.bool = BL_TRUE;
-+true		{g_return.b = BL_TRUE;
- 		 return BOOLEAN;
- 		}
- False	|
--false		{g_return.bool = BL_FALSE;
-+false		{g_return.b = BL_FALSE;
- 		 return BOOLEAN;
- 		}
- \#.*		{}
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch
deleted file mode 100644
index 0302286dc0..0000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm/0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From fe954b2fb17d813aaab3e926cee76144314a115a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Jun 2017 16:22:55 -0700
-Subject: [PATCH 3/3] mpoad: Drop old hack to compile with very old glibc
-
-Use poll.h instead of sys/poll.h
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/mpoad/io.c | 9 +--------
- 1 file changed, 1 insertion(+), 8 deletions(-)
-
-diff --git a/src/mpoad/io.c b/src/mpoad/io.c
-index 69900c2..8d1433f 100644
---- a/src/mpoad/io.c
-+++ b/src/mpoad/io.c
-@@ -10,14 +10,7 @@
- #include <errno.h>
- #include <sys/ioctl.h>
- #include <sys/param.h> /* for OPEN_MAX   */
--#if __GLIBC__ >= 2
--#include <sys/poll.h>
--#else /* ugly hack to make it compile on RH 4.2 - WA */
--#include <syscall.h>
--#include <linux/poll.h>
--#define SYS_poll 168
--_syscall3(int,poll,struct pollfd *,ufds,unsigned int,nfds,int,timeout);
--#endif
-+#include <poll.h>
- #include <atm.h>
- #include <linux/types.h>
- #include <linux/atmioc.h>
---
-2.13.1
-
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/install-from-buildir.patch b/meta-networking/recipes-support/linux-atm/linux-atm/install-from-buildir.patch
deleted file mode 100644
index 08cb817f77..0000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm/install-from-buildir.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Pending
-
-install binaries from builddir not srcdir.
-
-Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
-
---- linux-atm-2.5.2.orig/src/extra/Makefile.am	2010-12-21 05:07:22.000000000 +0800
-+++ linux-atm-2.5.2/src/extra/Makefile.am	2014-12-22 10:56:04.458563269 +0800
-@@ -9,9 +9,9 @@ CLEANFILES = pca200e.bin pca200e_ecd.bin
-
- install-exec-hook:
- 	$(MKDIR_P) $(DESTDIR)/lib/firmware
--	$(INSTALL_DATA) $(srcdir)/pca200e.bin $(DESTDIR)/lib/firmware
--	$(INSTALL_DATA) $(srcdir)/pca200e_ecd.bin2 $(DESTDIR)/lib/firmware
--	$(INSTALL_DATA) $(srcdir)/sba200e_ecd.bin2 $(DESTDIR)/lib/firmware
-+	$(INSTALL_DATA) $(builddir)/pca200e.bin $(DESTDIR)/lib/firmware
-+	$(INSTALL_DATA) $(builddir)/pca200e_ecd.bin2 $(DESTDIR)/lib/firmware
-+	$(INSTALL_DATA) $(builddir)/sba200e_ecd.bin2 $(DESTDIR)/lib/firmware
-
- %.bin %.bin2: %.data
- 	objcopy -Iihex $< -Obinary $@.gz
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/link-with-ldflags.patch b/meta-networking/recipes-support/linux-atm/linux-atm/link-with-ldflags.patch
deleted file mode 100644
index 8324040da9..0000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm/link-with-ldflags.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream-Status: Pending
-
-LDFLAGS_FOR_BUILD should be required when doing link for qgen.
-
-Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
-
-diff -Nurp linux-atm-2.5.2.orig/configure.in linux-atm-2.5.2/configure.in
---- linux-atm-2.5.2.orig/configure.in	2010-12-28 23:36:07.000000000 +0800
-+++ linux-atm-2.5.2/configure.in	2014-12-22 10:25:23.830510932 +0800
-@@ -66,6 +66,7 @@ else
- fi
- AC_SUBST(CC_FOR_BUILD)
- AC_SUBST(CFLAGS_FOR_BUILD)
-+AC_SUBST(LDFLAGS_FOR_BUILD)
- dnl Add -d flag to bison/yacc to create intermediate .h files
- YACC="$YACC -d"
-
-diff -Nurp linux-atm-2.5.2.orig/src/qgen/Makefile.am linux-atm-2.5.2/src/qgen/Makefile.am
---- linux-atm-2.5.2.orig/src/qgen/Makefile.am	2010-12-28 22:29:31.000000000 +0800
-+++ linux-atm-2.5.2/src/qgen/Makefile.am	2014-12-22 10:23:51.914508318 +0800
-@@ -5,7 +5,7 @@ qgen_SOURCES = common.c common.h file.c
- qgen_LDADD = -lfl
-
- COMPILE = @CC_FOR_BUILD@ @CFLAGS_FOR_BUILD@
--LINK = @CC_FOR_BUILD@ @CFLAGS_FOR_BUILD@ -o $@
-+LINK = @CC_FOR_BUILD@ @CFLAGS_FOR_BUILD@ @LDFLAGS_FOR_BUILD@ -o $@
-
- #TESTS = $(check_PROGRAMS)
-
-diff -Nurp linux-atm-2.5.2.orig/src/qgen/Makefile.in linux-atm-2.5.2/src/qgen/Makefile.in
---- linux-atm-2.5.2.orig/src/qgen/Makefile.in	2010-12-29 00:06:11.000000000 +0800
-+++ linux-atm-2.5.2/src/qgen/Makefile.in	2014-12-22 10:23:51.914508318 +0800
-@@ -106,6 +106,7 @@ INSTALL_SCRIPT = @INSTALL_SCRIPT@
- INSTALL_STRIP_PROGRAM = @INSTALL_STRIP_PROGRAM@
- LD = @LD@
- LDFLAGS = @LDFLAGS@
-+LDFLAGS_FOR_BUILD = @LDFLAGS_FOR_BUILD@
- LEX = @LEX@
- LEXLIB = @LEXLIB@
- LEX_OUTPUT_ROOT = @LEX_OUTPUT_ROOT@
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/musl-no-on_exit.patch b/meta-networking/recipes-support/linux-atm/linux-atm/musl-no-on_exit.patch
deleted file mode 100644
index 25211d7c10..0000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm/musl-no-on_exit.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Description: musl lacks on_exit
-Author: Adrian Bunk <bunk@stusta.de>
-
-Only prints a trace on nonzero exit(),
-so can safely be disabled in musl builds.
-
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
-Upstream-Status: Inappropriate [musl specific]
-
---- linux-atm-2.5.1.orig/src/sigd/atmsigd.c
-+++ linux-atm-2.5.1/src/sigd/atmsigd.c
-@@ -283,6 +283,7 @@ static void setup_signals(void)
- /* ------------------------------- main ...  ------------------------------- */
-
-
-+#if 0
- static void trace_on_exit(int status,void *dummy)
- {
-     char path[PATH_MAX+1];
-@@ -300,6 +301,7 @@ static void trace_on_exit(int status,voi
-     dump_trace(file,"Message trace (after error exit)");
-     if (file != stderr) (void) fclose(file);
- }
-+#endif
-
-
- static void manual_override(void)
-@@ -517,7 +519,9 @@ int main(int argc,char **argv)
- 	    exit(0);
- 	}
-     }
-+#if 0
-     (void) on_exit(trace_on_exit,NULL);
-+#endif
-     poll_loop();
-     close_all();
-     for (sig = entities; sig; sig = sig->next) stop_saal(&sig->saal);
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
deleted file mode 100644
index 5f9f355949..0000000000
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Drivers and tools to support ATM networking under Linux"
-HOMEPAGE = "http://linux-atm.sourceforge.net/"
-SECTION = "libs"
-LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
-
-DEPENDS = "flex flex-native"
-RRECOMMENDS:${PN} = "kernel-module-atm-tcp"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}.tar.gz \
-           file://link-with-ldflags.patch \
-           file://install-from-buildir.patch \
-           file://0001-fix-compile-error-with-linux-kernel-v4.8.patch \
-           file://0001-ttcp-Add-printf-format-string.patch \
-           file://0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch \
-           file://0001-IFNAMSIZ-is-defined-in-net-if.h.patch \
-           file://0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch \
-           file://0001-make-Add-PREFIX-knob.patch \
-           file://0001-include-string-h-from-memcpy-and-strcpy-function-pro.patch \
-           file://0001-configure-Check-for-symbol-from-libresolv-instead-of.patch \
-           file://0001-Fix-implicit-declaration-error.patch \
-           file://0002-Fix-build-with-gcc-15.patch \
-           "
-
-SRC_URI:append:libc-musl = " file://musl-no-on_exit.patch"
-
-SRC_URI[sha256sum] = "9645481a2b16476b59220aa2d6bc5bc41043f291326c9b37581018fbd16dd53a"
-
-LIC_FILES_CHKSUM = "\
-file://COPYING;md5=d928de9537d846935a98af3bbc6e6ee1 \
-file://COPYING.GPL;md5=ac2db169b9309e240555bc77be4f1a33 \
-file://COPYING.LGPL;md5=6e29c688d912da12b66b73e32b03d812"
-
-inherit autotools pkgconfig
-
-CACHED_CONFIGUREVARS += "ac_cv_prog_cc_c23=no"
-
-EXTRA_OEMAKE += "ROOTPREFIX=${root_prefix}"
-
-FILES:${PN} += "${nonarch_base_libdir}/firmware"

