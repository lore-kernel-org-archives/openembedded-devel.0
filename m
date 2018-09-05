Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id F260674A35
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 15:45:29 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r1-v6so12106841wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=veyl06g+qVS57Wi65TsCA7yZcJUQJ3BPhgmjHAD+aVM=;
	b=NkdaoaJ1nVWy0vQdgB9dw8V1c94kNO9PlOcxAtfltHaEJodqEliYChWVg02ocqp+3B
	HMyDA41PRmzAMCwO+41ZD75Z6Rq0N/BjU2Z9PIByImQflQJkUUIQ3BH8+j98rFsTF/tG
	gsBtAbmsBBxcUoAjgj54cTG/8x8UcK+EaJMAZ5n8nSlnPO3fGEVCEj9aUx/j+eqLWKsT
	sgQgxaAdQaxjqykW+K4ca/06JmB1CmNvS9wzVW2Gsyr73zoAFDqqGagEhiFSOk9r+R+I
	uhZQO0B+XO4AYlTw8c855KHYBs6PmflQPNpgg4PdQYJ8eh6dQpP/j9P5DB5Z93hh1i52
	7Fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=veyl06g+qVS57Wi65TsCA7yZcJUQJ3BPhgmjHAD+aVM=;
	b=L7PFxFmj+OMfWSy7MDPWsVxLfiq/vDcUjG5jm1ajQFSpSQpBvlTKpzewfTBVS1drjS
	maILxp/6FtxIOaK20WStkabnQgn1oG+gAMwFafLXmOen7lHOUNtpTzlj6wt1ggZogtxa
	93yAYXQiPVKY82J2QqEDeTsXfxCFiJnrS0fR2VQzrVuy/AK7ecH487fIbFHEycThvrie
	ZcFb7ElPpYVsJpWuq4rtomKM03fgPbnQeQd+piuup4vEBoNP0KBfoJGB9G4XbOW7pzza
	Io/0TlqeKeCVA/jwqjETqQyTI15ia3EuMsAQHLC6C+aEQTlPXks2IwETqjj4330CduBs
	uJUA==
X-Gm-Message-State: APzg51DOKLllwt+ygPQgaR8ti458tR/cvQlRC1kooCFcETUHLiSxw6Hy
	nh4z9J3MU987LV++n4HIh/3Ck1pS
X-Google-Smtp-Source: ANB0VdZUiIZFbFWevYEmUrPV104XIxd2w/nRJFASP/tIMtuqr6pc22pHhuIebM5LD2oC1L36kzJ4rA==
X-Received: by 2002:a1c:7412:: with SMTP id p18-v6mr585482wmc.49.1536162330302;
	Wed, 05 Sep 2018 08:45:30 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host63-251-dynamic.54-79-r.retail.telecomitalia.it. [79.54.251.63])
	by smtp.gmail.com with ESMTPSA id
	q135-v6sm4400245wmd.4.2018.09.05.08.45.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Sep 2018 08:45:29 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 17:45:26 +0200
Message-Id: <1536162326-10038-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: fix build for qemuarm64
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
X-List-Received-Date: Wed, 05 Sep 2018 15:45:30 -0000

Since c3f043241a86 upstream the getrandom() syscall is used.
Last recipe bump overlooked that.

The syscall has been added to OE's klibc so we can fix this.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...-arm64.c-workaround-for-getrandom-syscall.patch | 61 ++++++++++++++++++++++
 .../recipes-kernel/kexec/kexec-tools-klibc_git.bb  |  3 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-arm64.c-workaround-for-getrandom-syscall.patch

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-arm64.c-workaround-for-getrandom-syscall.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-arm64.c-workaround-for-getrandom-syscall.patch
new file mode 100644
index 0000000..b22ac3a
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_kexec-arm64.c-workaround-for-getrandom-syscall.patch
@@ -0,0 +1,61 @@
+From 10afeecd10499fbd64b2c68d3b076c6906df441f Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Wed, 5 Sep 2018 17:07:48 +0200
+Subject: [PATCH] kexec-arm64.c: workaround for getrandom() syscall
+
+The syscall was added to OE's klibc.
+Fix
+
+| ../git/kexec/arch/arm64/kexec-arm64.c:19:10: fatal error: syscall.h: No such file or directory
+|  #include <syscall.h>
+
+and
+
+| ../git/kexec/arch/arm64/kexec-arm64.c: In function 'setup_2nd_dtb':
+| ../git/kexec/arch/arm64/kexec-arm64.c:499:12: warning: implicit declaration of function 'getrandom'; did you mean 'srandom'? [-Wimplicit-function-declaration]
+|    result = getrandom(&fdt_val64,
+
+
+Upstream-Status: Inappropriate [klibc specific]
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ kexec/arch/arm64/kexec-arm64.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-arm64.c
+index 7a12479..8a7f5c5 100644
+--- a/kexec/arch/arm64/kexec-arm64.c
++++ b/kexec/arch/arm64/kexec-arm64.c
+@@ -16,7 +16,11 @@
+ #include <elf.h>
+ 
+ #include <unistd.h>
++
++#ifndef __KLIBC__
+ #include <syscall.h>
++#endif
++
+ #include <errno.h>
+ #include <linux/random.h>
+ 
+@@ -487,10 +491,16 @@ static int setup_2nd_dtb(struct dtb *dtb, char *command_line, int on_crash)
+ 		 * have a valid random seed to pass to the
+ 		 * secondary kernel.
+ 		 */
++#ifndef __KLIBC__
+ 		result = syscall(SYS_getrandom, &fdt_val64,
+ 				sizeof(fdt_val64),
+ 				GRND_NONBLOCK);
+-
++#else
++		extern ssize_t getrandom(void *, size_t, unsigned int);
++		result = getrandom(&fdt_val64,
++				sizeof(fdt_val64),
++				GRND_NONBLOCK);
++#endif
+ 		if(result == -1) {
+ 			dbgprintf("%s: Reading random bytes failed.\n",
+ 					__func__);
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index d6d3dc8..4bbda4c 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -51,7 +51,8 @@ SRC_URI_append_x86-64 = " file://x86_sys_io.patch file://x86_basename.patch \
 
 SRC_URI_append_aarch64 = " file://arm64_purgatory-Makefile-remove-unknown-flags.patch \
                            file://arm64_kexec-image-header.h-add-missing-le64toh.patch \
-                           file://arm64-crashdump-arm64.c-fix-warning.patch"
+                           file://arm64-crashdump-arm64.c-fix-warning.patch \
+                           file://arm64_kexec-arm64.c-workaround-for-getrandom-syscall.patch"
 
 SRC_URI_append_powerpc = " file://powerpc-purgatory-Makefile-remove-unknown-flags.patch"
 
-- 
2.7.4


