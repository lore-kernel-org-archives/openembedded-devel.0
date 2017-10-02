Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id B4D75774DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Oct 2017 16:07:05 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id m28so6027417pfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Oct 2017 09:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=68jjHlpEDk6PXOVICykhxZOCIXYAWRThxb2fIpLwk+g=;
	b=JuczjVF1ixOM9wyfJMozU9GLh5B8O1coko477FThdkEPwdoRAIOFhoJyNPptZOvLmt
	F/NJKJILTzkAABwOnzURiOMy8uK/lBN8/cVZxDWwnBdGUCdah+RpZTQ7w3Cmsk/YZ6ok
	q0W5jc5L+gpjta/AvR8ruprkJT51GieFIrsTzt7AczC0GVxNWSVsI4y3SyFNyInGXO/R
	ACUtnmNhS+1UUKwFcyacW/lc9XnsH1aEMfNxPTqSsoBkEatSGpr5arayj8C37shT6cSw
	W0N1f96f2SS5+mz6eTmcGKrou3UwhOIogM76m5HBJM0TB6Htv/ncnGkjau+EhA3S9Apu
	cV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=68jjHlpEDk6PXOVICykhxZOCIXYAWRThxb2fIpLwk+g=;
	b=rQkbeyUKvfnNjd/KLe12W0E9XsQZZ86L1Xvf89vvQ25z2pUY52zII1KyzP+thWrl24
	uY3Vz3CExvHizF5sPRVh2f7J3/41TRKIUd7SCj3sXQn0A9m01Sc1YK7jWyKQUgZoOoSg
	7gZkGt8paX15aQPnjQCNgQhnOE6Cv8wODk1oHJtp+4ZIomB1FBdoxStUYDMYb41/+Xf9
	8F86nvsXZQ4LkcXPox29IN/RsMBQwT26oAZDvDEsuMPNVj5xngVybyn33tboIA4yyY5u
	kque/VuwxUTKaOcEHz2BxvsRMWre/je7yy+JWUuYlWG40IjY2VU+U/wvQADpma7c60pm
	cUkQ==
X-Gm-Message-State: AHPjjUizazOIG2lS1KP8ZHleanPR8uIQEcmgbfiWubhM+sit+Umxjv7s
	fq2n1cGgL7S75igK8JpVDSMkWw==
X-Google-Smtp-Source: AOwi7QAmwZzKrKQcVb0pETqjljZggPVv0RepjSdlfQQiIEoYaWQFDcW+qaeAJgl2pTR6On1HiQXONA==
X-Received: by 10.99.45.198 with SMTP id t189mr8773817pgt.286.1506960426604;
	Mon, 02 Oct 2017 09:07:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id
	f2sm17329405pfg.135.2017.10.02.09.07.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 09:07:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Oct 2017 09:06:53 -0700
Message-Id: <20171002160657.39576-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [meta-initramfs][PATCH 1/5] klibc: Pass Optimization with KLIBCOPTFLAGS
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
X-List-Received-Date: Mon, 02 Oct 2017 16:07:05 -0000

Overriding KLIBCOPTFLAGS also meant that -Ox flags
were taken off. Which results in errors like

| usr/dash/shell.h: In function 'max_int_length':
| usr/dash/shell.h:103:25: error: '-mgeneral-regs-only' is incompatible with floating-point code
|   return (bytes * 8 - 1) * 0.30102999566398119521 + 14;
|          ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
| usr/dash/shell.h:103:25: error: '-mgeneral-regs-only' is incompatible with floating-point argument

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...arm-Do-not-set-a-fallback-march-and-mtune.patch | 33 ++++++++++++++++++++++
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
new file mode 100644
index 000000000..9c0ea6397
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
@@ -0,0 +1,33 @@
+From a46a144ac883898d9cedf7a0b13aec6d10116125 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Sep 2017 23:11:53 -0700
+Subject: [PATCH] arm: Do not set a fallback march and mtune
+
+In OE we pass the options explicitly, there is
+no need to set it inside the makefiles, we will
+need to compute values for CPU_ARCH and CPU_TUNE
+which is a bit harder in OE
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ usr/klibc/arch/arm/MCONFIG | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usr/klibc/arch/arm/MCONFIG b/usr/klibc/arch/arm/MCONFIG
+index 53bc1dc3..857e2f2d 100644
+--- a/usr/klibc/arch/arm/MCONFIG
++++ b/usr/klibc/arch/arm/MCONFIG
+@@ -10,7 +10,7 @@
+ CPU_ARCH ?= armv4
+ CPU_TUNE ?= strongarm
+ 
+-KLIBCOPTFLAGS += -Os -march=$(CPU_ARCH) -mtune=$(CPU_TUNE)
++KLIBCOPTFLAGS += -Os
+ KLIBCBITSIZE  = 32
+ KLIBCREQFLAGS += -fno-exceptions
+ KLIBCSTRIPFLAGS += -R .ARM.exidx
+-- 
+2.14.2
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index dec3d3704..30294b19a 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -19,6 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
            file://0001-always-use-bfd-linker.patch \
            file://0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch \
            file://0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch \
+           file://0001-arm-Do-not-set-a-fallback-march-and-mtune.patch \
 "
 
 ARMPATCHES ?= ""
@@ -40,7 +41,8 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'INSTALLDIR=${libdir}/klibc' \
                 'SHLIBDIR=${libdir}' \
                 '${KLIBCTHUMB}' \
-                'KLIBCOPTFLAGS=${TUNE_CCARGS}' \
+                'KLIBCOPTFLAGS=${TUNE_CCARGS} -Os' \
+                 V=1 \
                 "
 
 export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
-- 
2.14.2


