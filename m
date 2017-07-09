Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9492A60269
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Jul 2017 23:37:20 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id e199so12098012pfh.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Jul 2017 16:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pP5SKdNMITmFPcoKL45Ror0tiNq3+LjITypB4/gTIzk=;
	b=ZjiFRklnpTse7nVc+84+spY9tbVm6hg306c7gxylHppT3Xo7AyvwQzPGZGt1NbVNoK
	qN7ve47wgtNAeDOeqgZ0Mz7VJrWPJ5z1UruB5KfLb4VEUngyNaahLM+dPLEmHILnIVOQ
	pENESdEswpxZT+sA9n2qIcfUvOQSJ9V4cg/PTcGDtfa5tMxQLWHTHHEBpjsFNxUn+Om5
	sYtNQjxol6DuMR/AKwsu4UYNOWTvt8tfcU23bPtKn88DCnSMIJj+xI/xRO99kHcHl7lE
	+uYGnNhZJPsKf2gktUYNHl3FYooQaTC58giwIFTUAolsHo654xNG1fLnv3P/hlKp5GTE
	HKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pP5SKdNMITmFPcoKL45Ror0tiNq3+LjITypB4/gTIzk=;
	b=fPU1VRCfq4VS1TxOuVFmHFli4R2U2R5UF3knwSlgjR8a9c04jJtMLLbnPLd2bXBpXa
	s5h72raM/5BmwXHRO0ZRWsoVYWccVkKb19zMCXCrMoabq3xnjOWsk2LexBseXfocoqo5
	YSXZ+X6esV7ZfXXxlU6jrBIUR7+JjNfHIi9YNQnYwcH0+dwepDheTAJ7733U/gt0TjtT
	0rVyo646YmJNTKcQLpDEWoC6UdIdnUzNp/xki7zTaFch159MuMV1dYK6Krp8s6p8eYB5
	5iuc2rx4lcPL55+SVEubG9X06lxx32F8PxOXMxbJCRpKOZU5OaY8bAzpMHE+TFLKFRip
	ilag==
X-Gm-Message-State: AIVw111ERmnQI7CKrQQ3soUrf1dfHbk0Krk86hMjcl0Ilbv01pSrtEGY
	6Lc/XZ4dRLSmqRbp
X-Received: by 10.98.47.194 with SMTP id v185mr15573203pfv.62.1499643441095;
	Sun, 09 Jul 2017 16:37:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	75sm22682875pfk.84.2017.07.09.16.37.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Jul 2017 16:37:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Jul 2017 16:37:09 -0700
Message-Id: <20170709233709.15822-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-initramfs[PATCH] klibc: Fix build with musl
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
X-List-Received-Date: Sun, 09 Jul 2017 23:37:20 -0000

klibc failed to build with armv7+ when using thumb2
it needed to resepct CC/CXX/LD from environment

Add patches to fix build with musl, to sort out
the linux header maze.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 ...ine-in_-structs-for-non-glibc-system-libs.patch | 85 ++++++++++++++++++++++
 ...t-override-variables-passed-from-environm.patch | 73 +++++++++++++++++++
 ...0001-dash-Specify-format-string-in-fmtstr.patch | 31 ++++++++
 .../0001-include-linux-sysinfo.h-directly.patch    | 32 ++++++++
 meta-initramfs/recipes-devtools/klibc/klibc.inc    | 45 +++++++++---
 5 files changed, 255 insertions(+), 11 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-build-Do-not-override-variables-passed-from-environm.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch
new file mode 100644
index 000000000..8d1ec69ae
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch
@@ -0,0 +1,85 @@
+From f414dea1316a48aba3e8e293201ebd51652d3ef4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 9 Jul 2017 15:17:29 -0700
+Subject: [PATCH] Define in_* structs for non-glibc system libs
+
+These defines and structs are required to be coming from
+userspace netinet/in.h, which is being overridden in klibc
+however, libc-compat.h from kernel is only written keeping
+glibc in mind, and does not provide adequate guards for musl
+to infer that these structs should be defined in linux/in.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usr/include/netinet/in.h | 33 +++++++++++++++++++++++++++++++++
+ 1 file changed, 33 insertions(+)
+
+Index: git/usr/include/netinet/in.h
+===================================================================
+--- git.orig/usr/include/netinet/in.h
++++ git/usr/include/netinet/in.h
+@@ -5,6 +5,42 @@
+ #ifndef _NETINET_IN_H
+ #define _NETINET_IN_H
+ 
++#ifndef __GLIBC__
++#include <linux/libc-compat.h>
++
++#undef __UAPI_DEF_IN_ADDR
++#undef __UAPI_DEF_IN_IPPROTO
++#undef __UAPI_DEF_IN_PKTINFO
++#undef __UAPI_DEF_IP_MREQ
++#undef __UAPI_DEF_SOCKADDR_IN
++#undef __UAPI_DEF_IN_CLASS
++#undef __UAPI_DEF_IN6_ADDR
++#undef __UAPI_DEF_IN6_ADDR_ALT
++#undef __UAPI_DEF_SOCKADDR_IN6
++#undef __UAPI_DEF_IPV6_MREQ
++#undef __UAPI_DEF_IPPROTO_V6
++#undef __UAPI_DEF_IPV6_OPTIONS
++#undef __UAPI_DEF_IN6_PKTINFO
++#undef __UAPI_DEF_IP6_MTUINFO
++#undef __UAPI_DEF_IF_IFREQ
++
++#define __UAPI_DEF_IN_ADDR      1
++#define __UAPI_DEF_IN_IPPROTO   1
++#define __UAPI_DEF_IN_PKTINFO   1
++#define __UAPI_DEF_IP_MREQ      1
++#define __UAPI_DEF_SOCKADDR_IN  1
++#define __UAPI_DEF_IN_CLASS     1
++#define __UAPI_DEF_IN6_ADDR     1
++#define __UAPI_DEF_IN6_ADDR_ALT 1
++#define __UAPI_DEF_SOCKADDR_IN6 1
++#define __UAPI_DEF_IPV6_MREQ    1
++#define __UAPI_DEF_IPPROTO_V6   1
++#define __UAPI_DEF_IPV6_OPTIONS 1
++#define __UAPI_DEF_IN6_PKTINFO  1
++#define __UAPI_DEF_IP6_MTUINFO  1
++#define __UAPI_DEF_IF_IFREQ     1
++#endif
++
+ #include <klibc/extern.h>
+ #include <stdint.h>
+ #include <endian.h>		/* Must be included *before* <linux/in.h> */
+Index: git/usr/include/net/if.h
+===================================================================
+--- git.orig/usr/include/net/if.h
++++ git/usr/include/net/if.h
+@@ -1,6 +1,17 @@
+ #ifndef _NET_IF_H
+ #define _NET_IF_H
+ 
++#ifndef __GLIBC__
++#include <linux/libc-compat.h>
++#undef __UAPI_DEF_IF_IFREQ
++#define __UAPI_DEF_IF_IFREQ            1
++#undef __UAPI_DEF_IF_IFNAMSIZ
++#define __UAPI_DEF_IF_IFNAMSIZ         1
++#undef __UAPI_DEF_IF_IFMAP
++#define __UAPI_DEF_IF_IFMAP            1
++#undef __UAPI_DEF_IF_NET_DEVICE_FLAGS
++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS 1
++#endif
+ #include <sys/socket.h>
+ #include <sys/types.h>
+ #include <linux/if.h>
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-build-Do-not-override-variables-passed-from-environm.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-build-Do-not-override-variables-passed-from-environm.patch
new file mode 100644
index 000000000..53ab1451e
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-build-Do-not-override-variables-passed-from-environm.patch
@@ -0,0 +1,73 @@
+From b7e28e93776c2f08590d95f3b00975b42cfdb5f5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 9 Jul 2017 13:15:38 -0700
+Subject: [PATCH] build: Do not override variables passed from environment
+
+OE already passes right options via compiler
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile                     | 16 ++++++++--------
+ usr/klibc/arch/arm/MCONFIG   |  6 ++----
+ usr/klibc/arch/arm64/MCONFIG |  5 +----
+ 3 files changed, 11 insertions(+), 16 deletions(-)
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -19,14 +19,14 @@ include $(srctree)/scripts/Kbuild.includ
+ 
+ KLIBCROSS	?= $(CROSS_COMPILE)
+ export KLIBCROSS
+-export CC	:= $(KLIBCROSS)gcc
+-export LD	:= $(KLIBCROSS)ld
+-export AR	:= $(KLIBCROSS)ar
+-export RANLIB	:= $(KLIBCROSS)ranlib
+-export STRIP	:= $(KLIBCROSS)strip
+-export NM	:= $(KLIBCROSS)nm
+-export OBJCOPY  := $(KLIBCROSS)objcopy
+-export OBJDUMP  := $(KLIBCROSS)objdump
++export CC	?= $(KLIBCROSS)gcc
++export LD	?= $(KLIBCROSS)ld
++export AR	?= $(KLIBCROSS)ar
++export RANLIB	?= $(KLIBCROSS)ranlib
++export STRIP	?= $(KLIBCROSS)strip
++export NM	?= $(KLIBCROSS)nm
++export OBJCOPY  ?= $(KLIBCROSS)objcopy
++export OBJDUMP  ?= $(KLIBCROSS)objdump
+ 
+ NOSTDINC_FLAGS := -nostdlib -nostdinc -isystem $(shell $(CC) -print-file-name=include)
+ 
+Index: git/usr/klibc/arch/arm/MCONFIG
+===================================================================
+--- git.orig/usr/klibc/arch/arm/MCONFIG
++++ git/usr/klibc/arch/arm/MCONFIG
+@@ -7,10 +7,7 @@
+ # accordingly.
+ #
+ 
+-CPU_ARCH ?= armv4
+-CPU_TUNE ?= strongarm
+-
+-KLIBCOPTFLAGS += -Os -march=$(CPU_ARCH) -mtune=$(CPU_TUNE)
++KLIBCOPTFLAGS += -Os
+ KLIBCBITSIZE  = 32
+ KLIBCREQFLAGS += -fno-exceptions
+ KLIBCSTRIPFLAGS += -R .ARM.exidx
+Index: git/usr/klibc/arch/arm64/MCONFIG
+===================================================================
+--- git.orig/usr/klibc/arch/arm64/MCONFIG
++++ git/usr/klibc/arch/arm64/MCONFIG
+@@ -7,10 +7,7 @@
+ # accordingly.
+ #
+ 
+-CPU_ARCH ?= armv8-a
+-CPU_TUNE ?= generic
+-
+-KLIBCOPTFLAGS += -g -Os -march=$(CPU_ARCH) -mtune=$(CPU_TUNE)
++KLIBCOPTFLAGS += -g -Os
+ KLIBCBITSIZE  = 64
+ KLIBCREQFLAGS += -fno-exceptions -mgeneral-regs-only
+ 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch
new file mode 100644
index 000000000..ae8c1f11a
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch
@@ -0,0 +1,31 @@
+From 2fff607fd0b5550e5072a6fffcbb01c29d5207d2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 9 Jul 2017 13:51:25 -0700
+Subject: [PATCH] dash: Specify format string in fmtstr()
+
+Fixes build with hardening flags
+
+usr/dash/jobs.c:429:3: error: format not a string literal and no format arguments [-Werror=format-security]
+   col = fmtstr(s, 32, strsignal(st));
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usr/dash/jobs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usr/dash/jobs.c b/usr/dash/jobs.c
+index 009bbfee..299bcacc 100644
+--- a/usr/dash/jobs.c
++++ b/usr/dash/jobs.c
+@@ -426,7 +426,7 @@ sprint_status(char *s, int status, int sigonly)
+ 				goto out;
+ #endif
+ 		}
+-		col = fmtstr(s, 32, strsignal(st));
++		col = fmtstr(s, 32, "%s", strsignal(st));
+ #ifdef WCOREDUMP
+ 		if (WCOREDUMP(status)) {
+ 			col += fmtstr(s + col, 16, " (core dumped)");
+-- 
+2.13.2
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch
new file mode 100644
index 000000000..1b033acc4
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch
@@ -0,0 +1,32 @@
+From ab060a57b41f989665ade20e813bbcb67f91f1f2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 9 Jul 2017 15:56:28 -0700
+Subject: [PATCH] include linux/sysinfo.h directly
+
+This is done to avoid the kernel header linux/kernel.h to use
+__GLIBC__ define to decide on if libc implements sysinfo() API
+or not. Kernel headers should be independent of such assumptions
+but until its done in right place, change the local header
+override to avoid this assumption
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usr/include/sys/sysinfo.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usr/include/sys/sysinfo.h b/usr/include/sys/sysinfo.h
+index dba68dc6..d145c0b1 100644
+--- a/usr/include/sys/sysinfo.h
++++ b/usr/include/sys/sysinfo.h
+@@ -5,7 +5,7 @@
+ #ifndef _SYS_SYSINFO_H
+ #define _SYS_SYSINFO_H
+ 
+-#include <linux/kernel.h>
++#include <linux/sysinfo.h>
+ 
+ extern int sysinfo(struct sysinfo *info);
+ 
+-- 
+2.13.2
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index e039cb2c1..13244f864 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -7,17 +7,23 @@ LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8
 DEPENDS = "linux-libc-headers perl-native"
 SRCREV = "4d19974d7020488f63651244e1f9f51727c3f66c"
 
-SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git"
-SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch \
-                                 file://armv4-fix-v4bx.patch \
-                                 "
-SRC_URI_append_linux-uclibceabi = " file://klibc-config-eabi.patch \
-                                    file://armv4-fix-v4bx.patch \
-                                    "
-SRC_URI += "file://klibc-linux-libc-dev.patch \
-            file://staging.patch \
-            file://klcc-consider-sysroot.patch \
-            "
+SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
+           ${ARMPATCHES} \
+           file://klibc-linux-libc-dev.patch \
+           file://staging.patch \
+           file://klcc-consider-sysroot.patch \
+           file://0001-build-Do-not-override-variables-passed-from-environm.patch \
+           file://0001-dash-Specify-format-string-in-fmtstr.patch \
+           file://0001-Define-in_-structs-for-non-glibc-system-libs.patch \
+           file://0001-include-linux-sysinfo.h-directly.patch \
+"
+
+ARMPATCHES ?= ""
+
+ARMPATCHES_arm = "file://klibc-config-eabi.patch \
+                  file://armv4-fix-v4bx.patch \
+                 "
+
 
 S = "${WORKDIR}/git"
 
@@ -34,10 +40,27 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
 
 export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
 
+#klibc_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\""
+
+klibc_conf_variable() {
+    CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1[ =]/d;"
+    if test "$2" = "n"
+    then
+        echo "# CONFIG_$1 is not set" >> ${S}/defconfig
+    else
+        echo "CONFIG_$1=$2" >> ${S}/defconfig
+    fi
+}
+
 do_configure () {
     ln -sf "${STAGING_DIR_TARGET}${exec_prefix}" linux
+    if [ "${ARM_INSTRUCTION_SET}" = "thumb" ] ; then
+        klibc_conf_variable KLIBC_THUMB y
+    fi
+
 }
 
+
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INSANE_SKIP_${PN} = "already-stripped"
-- 
2.13.2


