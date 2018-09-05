Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3105465CE8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 17:43:14 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w11-v6so8560939wrc.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 10:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OeGqVnuzQfbS52DwPyRnstxaiAA7ohVGYcNfIH4DeYQ=;
	b=TI/IKNs7qmrKq3qShQEYbFRsXB6Ed8Et9WzfxfJyGvO5OnoWHnUqRi3srKPB1l9Njs
	3nKoM3gnh/c1ZyiwCJmcE3zejjW1JhRWoxj3wvcP4sdC8z/OwzJLyqi3u9HDxDEM/zSv
	mQYdmVDL1nwhGIYCsE+OYyzQnjK5QAiqekG+YYQsk88P//+FKBkjtHRCXMaZQF33nmK0
	sPt+2a6xp+i3SUzn9sG/uWw+3wrZ1RlAGkU4bi66/jxtmZ582iGhJkXEjMEh4iFp+gDD
	+C+OqPfzTn5fVaB045n4Zs3nPs2mVAJ7mjLh4cXAdyj+XvrQnvuvlJ7N2HIrPGJavnuP
	WNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OeGqVnuzQfbS52DwPyRnstxaiAA7ohVGYcNfIH4DeYQ=;
	b=pPa49Jp8eu/0jEDUDLEqn+jqI2FEweMoQ35PGq1MrX8+p4Aq6z9lXOzhcpxAI+WDum
	L32ueSXieWL3WguJvANvVUk3q4Gcxjx/aNEKUNHvYAhfJoCD5GZm9W2lZUpiD04SzMyF
	vlsnMhwFu1sBazi/j6cRjoBgCSZmxBnrM8CMjW7PgioMrOcUfbjGHfDnWa5VHQGHH50q
	DMOyB+tTKTgU3byudn3GJIkEBET3j7ZsUW/jVuRulmNOJ14ZX8AzxLmzPRV9eZ56ZELs
	8ksxMuM5VkKeRu2rkajlmkaC4G3BtiTvEWnsuGAgie9m78sMYFYT2gyOHAGhu2deKwAS
	bNDg==
X-Gm-Message-State: APzg51BH/KnX6D/xmFqxZBtFyLrm1+UAWy/pXQDUpHrtXoNNV8nt3o8w
	OsiC5MnDK63iZq/b+Rg1FKSQSejr
X-Google-Smtp-Source: ANB0VdZI4tfzD1gT5+Cy3E3pSvOig1UFr98+8j6Ja9cyNO9eSUg2gOJE8ZissrW6VBZqxSGpV1nGzA==
X-Received: by 2002:a5d:438d:: with SMTP id
	i13-v6mr28266253wrq.156.1536169394579; 
	Wed, 05 Sep 2018 10:43:14 -0700 (PDT)
Received: from localhost.localdomain
	(host205-252-dynamic.245-95-r.retail.telecomitalia.it.
	[95.245.252.205]) by smtp.gmail.com with ESMTPSA id
	t131-v6sm3766287wmg.10.2018.09.05.10.43.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Sep 2018 10:43:13 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 19:43:10 +0200
Message-Id: <1536169390-18008-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: remove unneeded x86-64 patch
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
X-List-Received-Date: Wed, 05 Sep 2018 17:43:14 -0000

The issue with -mcmodel=large is already solved by the oe-core's patch

 "kexec-x32.patch"

so we can remove this one.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...4-purgatory-Makefile-remove-unknown-flags.patch | 35 ----------------------
 .../recipes-kernel/kexec/kexec-tools-klibc_git.bb  |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86-64-purgatory-Makefile-remove-unknown-flags.patch

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86-64-purgatory-Makefile-remove-unknown-flags.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86-64-purgatory-Makefile-remove-unknown-flags.patch
deleted file mode 100644
index 0ec880c..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/x86-64-purgatory-Makefile-remove-unknown-flags.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9453599fd833794fb5d87cab2622de286144ed54 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Wed, 18 Apr 2018 22:30:17 +0200
-Subject: [PATCH 6/6] purgatory: Makefile: remove unknown flags
-
-Fix
-
- x86_64-oe-linux-musl-ld: unrecognised emulation mode: cmodel=large
- Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu
-                       i386linux elf_l1om elf_k1om
- ../kexec-tools-2.0.17-rc1/purgatory/Makefile:67:
- recipe for target 'purgatory/purgatory.ro' failed
-
-Upstream-Status: Inappropriate [embedded specific]
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
----
- purgatory/arch/x86_64/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/purgatory/arch/x86_64/Makefile b/purgatory/arch/x86_64/Makefile
-index 7300937..73f6932 100644
---- a/purgatory/arch/x86_64/Makefile
-+++ b/purgatory/arch/x86_64/Makefile
-@@ -24,5 +24,5 @@ x86_64_PURGATORY_SRCS += purgatory/arch/i386/console-x86.c
- x86_64_PURGATORY_SRCS += purgatory/arch/i386/pic.c
- 
- ifeq ($(SUBARCH),64)
--        x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
-+#        x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
- endif
-
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index 4bbda4c..92ab7e6 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -46,8 +46,7 @@ SRC_URI_append_x86 = " file://x86_sys_io.patch file://x86_basename.patch \
                        file://x86_vfscanf.patch file://x86_kexec_test.patch"
 
 SRC_URI_append_x86-64 = " file://x86_sys_io.patch file://x86_basename.patch \
-                          file://x86_vfscanf.patch file://x86_kexec_test.patch \
-                          file://x86-64-purgatory-Makefile-remove-unknown-flags.patch"
+                          file://x86_vfscanf.patch file://x86_kexec_test.patch"
 
 SRC_URI_append_aarch64 = " file://arm64_purgatory-Makefile-remove-unknown-flags.patch \
                            file://arm64_kexec-image-header.h-add-missing-le64toh.patch \
-- 
2.7.4


