Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3261A78449
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 16:51:01 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q85so7117366pfq.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 09:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CJHxdEDvnTigaLOKYdmh7HOZ84VQtMx0WnAULO2D9kM=;
	b=KvsE5sTT3uSdsw5/b6AYjhkLbfvVKaxBWPvwaSv6YgJHT7tQ2WxSuYI2IcWFEcbqfE
	vKc54e2jymPZrF6vHm6/dkuyES97indOs5cb15g5/7UQnzZzl9c0Gf0KO/lk1CJF45Hu
	WkcvkItRQI/U4x0dREvaR0QIJT945QqvfiFCoR/aZFJpvV6RzYsXDQOKlF9+CRx3q+mT
	5khFmqF0VUEHUBWkWwORaZKIFAe/cKFxZTJ7qY8C4eQQmuZzzmzunjqBsX/+18G2pTyJ
	46LIomb8wvq7W0nZcoKeKcFtbx7U+SU1xEA2jyHFmXad/bgcooKOnYsIdFtBkOfFx7TV
	+Exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CJHxdEDvnTigaLOKYdmh7HOZ84VQtMx0WnAULO2D9kM=;
	b=EZ0gdrp2snX8JSEaSOKrvLJiB0zfX1lVra8gWMa7qt6vefXVdfC4qYZjUnJkZJeIbn
	7gePRE7MgyPYzYVd8e1AfNPamoQf8QwowLbECvs6zqsjW/4Qb0aAWwNS6Ik+89bZa718
	xyxkAfhPHxUtfXd3dGuuOiy1MZ1FP+K1R6KmchyCse9dNy3bVL5/BOLLUpn9lbB3lbq0
	5T+St6a5zOoR8Sn4LVmIG6Gk6wr/cmdWV6eoYEolfYn1ex1Yr73inwH9Zi6j8ZzqL+ml
	hWM+o+5aTL++v2gL7lmGvc1GkjBjOHm79FzknXiiNk0k5yKtQx3t7+uSI3NMeN+ucLfT
	piBQ==
X-Gm-Message-State: AIVw112s+tFBZ/Utja4CoV0Inh0BfKKjgFs8TqKaE8AaetOW58fxzz4X
	/8GrkcaZ3aE3UQJl
X-Received: by 10.84.253.2 with SMTP id z2mr7010308pll.464.1500742262420;
	Sat, 22 Jul 2017 09:51:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	o10sm15628924pgc.81.2017.07.22.09.51.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Jul 2017 09:51:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jul 2017 09:50:43 -0700
Message-Id: <20170722165045.44735-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170722165045.44735-1-raj.khem@gmail.com>
References: <20170722165045.44735-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/4] openflow: Fix build with musl
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
X-List-Received-Date: Sat, 22 Jul 2017 16:51:01 -0000

Regenerate configure before running oe_runconf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/openflow/openflow.inc        |  3 +-
 ...use-strlcpy-from-libc-before-defining-own.patch | 64 ++++++++++++++++++++++
 ...lib-netdev-Adjust-header-include-sequence.patch | 59 ++++++++++++++++++++
 .../recipes-protocols/openflow/openflow_git.bb     |  5 ++
 4 files changed, 129 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/0002-lib-netdev-Adjust-header-include-sequence.patch

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index 0ae2d1f1d..cccbfa19a 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -27,9 +27,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig
 
-do_configure() {
+do_configure_prepend() {
     ./boot.sh
-    oe_runconf
 }
 
 do_install_append() {
diff --git a/meta-networking/recipes-protocols/openflow/openflow/0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch b/meta-networking/recipes-protocols/openflow/openflow/0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch
new file mode 100644
index 000000000..952274bb9
--- /dev/null
+++ b/meta-networking/recipes-protocols/openflow/openflow/0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch
@@ -0,0 +1,64 @@
+From 7b62e5884353b247f542844d1e4687d0e9211999 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Jul 2017 04:27:32 -0700
+Subject: [PATCH 1/2] Check and use strlcpy from libc before defining own
+
+This is required especially on musl where
+function prototype conflicts and causes build
+failures.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ lib/util.c   | 2 ++
+ lib/util.h   | 1 +
+ 3 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 13064f6..596c43f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -57,7 +57,7 @@ OFP_CHECK_HWTABLES
+ OFP_CHECK_HWLIBS
+ AC_SYS_LARGEFILE
+ 
+-AC_CHECK_FUNCS([strsignal])
++AC_CHECK_FUNCS([strlcpy strsignal])
+ 
+ AC_ARG_VAR(KARCH, [Kernel Architecture String])
+ AC_SUBST(KARCH)
+diff --git a/lib/util.c b/lib/util.c
+index 21cc28d..1f341b1 100644
+--- a/lib/util.c
++++ b/lib/util.c
+@@ -138,6 +138,7 @@ xasprintf(const char *format, ...)
+     return s;
+ }
+ 
++#ifndef HAVE_STRLCPY
+ void
+ strlcpy(char *dst, const char *src, size_t size)
+ {
+@@ -148,6 +149,7 @@ strlcpy(char *dst, const char *src, size_t size)
+         dst[n_copy] = '\0';
+     }
+ }
++#endif
+ 
+ void
+ ofp_fatal(int err_no, const char *format, ...)
+diff --git a/lib/util.h b/lib/util.h
+index fde681f..9e45ea9 100644
+--- a/lib/util.h
++++ b/lib/util.h
+@@ -41,6 +41,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include "compiler.h"
++#include "config.h"
+ 
+ #ifndef va_copy
+ #ifdef __va_copy
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-protocols/openflow/openflow/0002-lib-netdev-Adjust-header-include-sequence.patch b/meta-networking/recipes-protocols/openflow/openflow/0002-lib-netdev-Adjust-header-include-sequence.patch
new file mode 100644
index 000000000..75180fe32
--- /dev/null
+++ b/meta-networking/recipes-protocols/openflow/openflow/0002-lib-netdev-Adjust-header-include-sequence.patch
@@ -0,0 +1,59 @@
+From 5bba224edea38607e8732081f86679ffd8b218ab Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Jul 2017 04:29:04 -0700
+Subject: [PATCH 2/2] lib/netdev: Adjust header include sequence
+
+Specify libc headers before kernel UAPIs
+this helps compiling with musl where otherwise
+it uses the definition from kernel and complains
+about double definition in libc headers
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/netdev.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/lib/netdev.c b/lib/netdev.c
+index 3b6fbc5..c7de25e 100644
+--- a/lib/netdev.c
++++ b/lib/netdev.c
+@@ -39,7 +39,6 @@
+ #include <fcntl.h>
+ #include <arpa/inet.h>
+ #include <inttypes.h>
+-#include <linux/if_tun.h>
+ 
+ /* Fix for some compile issues we were experiencing when setting up openwrt
+  * with the 2.4 kernel. linux/ethtool.h seems to use kernel-style inttypes,
+@@ -57,10 +56,6 @@
+ #define s64 __s64
+ #endif
+ 
+-#include <linux/ethtool.h>
+-#include <linux/rtnetlink.h>
+-#include <linux/sockios.h>
+-#include <linux/version.h>
+ #include <sys/types.h>
+ #include <sys/ioctl.h>
+ #include <sys/socket.h>
+@@ -68,12 +63,16 @@
+ #include <net/ethernet.h>
+ #include <net/if.h>
+ #include <net/if_arp.h>
+-#include <net/if_packet.h>
+ #include <net/route.h>
+ #include <netinet/in.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
++#include <linux/ethtool.h>
++#include <linux/rtnetlink.h>
++#include <linux/sockios.h>
++#include <linux/version.h>
++#include <linux/if_tun.h>
+ 
+ #include "fatal-signal.h"
+ #include "list.h"
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index 6403bfb22..eceb45e94 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -2,3 +2,8 @@ include ${BPN}.inc
 
 SRCREV = "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
 PV = "1.0+git${SRCPV}"
+
+SRC_URI += "\
+           file://0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch \
+           file://0002-lib-netdev-Adjust-header-include-sequence.patch \
+           "
-- 
2.13.3


