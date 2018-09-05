Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0A1FA79435
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:32:22 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id j192-v6so9215625wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=mY4ilS45AW9dYN+fAAJN3eqqFsrmlgv3RF+ncEvToF8=;
	b=O7uTOA5ooAqD9InuAujh4WoTV3JvHLxvaRp/c3v4a4K1aeHA9B8NTL4AI7gEazRskn
	Ws9Q+SfywVURX8rWWQqf/H1NGIL5qavN/8pax9nGGX9UmLoY2TfSvQoOlegB26FA5pAn
	KtJNtWKcfnQh1+o5TWd1rs+MQa6vl/3/EFijytuK3bx44ivJhbqJz6w42zHrkEanJHaY
	XQ5hLCNGRw4avqtSpbYWQ4WnI8pUbLBLwFpoUIKrUQ7sJxjgBm1b/VwJ3Ye8SeFlOQ+H
	49d5ZpN8Oa8rfLqt8yJkT8piDLU4F9TGL81U4hhWymD3PKTx+fSyfaV6yvQe1W0tJUNc
	KSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mY4ilS45AW9dYN+fAAJN3eqqFsrmlgv3RF+ncEvToF8=;
	b=JPlCZvuy4uzTGiXH0hsi3zYcpYMlRhurMZgAgVQ2PwKiY6cEZ8YaXchxhe5t4sWHVc
	PxZN9M3nDE4BG+xfYBJ1vfnWDX9qXY0ki+9ZNe7bz1pSmhfYTwrdPHIcF0tewKWrt0BZ
	xz45FZlUgipjG9ivTjLEhyfHbc/PLuRZJ7iaSJl1NkfBNo++quqbFkdyZ/L/4m8ajQ1O
	Jx68JHfGURA/VTwEyT7U7RBeDyg9wwuJ8Nwfs3UBB8Ypsaqz2D7T6U5u4TLS3+8Lq290
	jzUyivVFxhdSk8GUoueTk5iR/w6eMNoqt0xWfnr85vYBm147yyGEz6JxKbX2yEGY5KI4
	y2tg==
X-Gm-Message-State: APzg51Cvh2acp/AUHmUX4rxRAN7MJkrfNiDEOiygJv2oC7vrgSuFXBI4
	CzWJ2anP7LIVE8NkbOrAUjr0TgUG
X-Google-Smtp-Source: ANB0VdaHhuQNvlhL0GrRcFBBUK91Fr7L11qcVP/Us2SPhijROr2nlNPEED4TLNQWnNmlGaofa+xkNw==
X-Received: by 2002:a1c:9dc3:: with SMTP id
	g186-v6mr192352wme.26.1536183143341; 
	Wed, 05 Sep 2018 14:32:23 -0700 (PDT)
Received: from localhost.localdomain
	(host205-252-dynamic.245-95-r.retail.telecomitalia.it.
	[95.245.252.205]) by smtp.gmail.com with ESMTPSA id
	14-v6sm4811352wmp.32.2018.09.05.14.32.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Sep 2018 14:32:22 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 23:32:20 +0200
Message-Id: <1536183140-21646-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: remove unneeded aarch64 patch
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
X-List-Received-Date: Wed, 05 Sep 2018 21:32:23 -0000

Remove temporary development leftover (hack).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...4_purgatory-Makefile-remove-unknown-flags.patch | 51 ----------------------
 .../recipes-kernel/kexec/kexec-tools-klibc_git.bb  |  3 +-
 2 files changed, 1 insertion(+), 53 deletions(-)
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_purgatory-Makefile-remove-unknown-flags.patch

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_purgatory-Makefile-remove-unknown-flags.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_purgatory-Makefile-remove-unknown-flags.patch
deleted file mode 100644
index f87f433..0000000
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/arm64_purgatory-Makefile-remove-unknown-flags.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 1ceca8645dbe2780e1b8993c80de772993fe3053 Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Thu, 19 Apr 2018 10:43:34 +0200
-Subject: [PATCH 1/2] purgatory/arm64: Makefile: remove unknown flags for arm64
-
-Fix
-
- | aarch64-oe-linux-musl-ld: unrecognised emulation mode: cmodel=large
- | Supported emulations: aarch64linux aarch64elf aarch64elf32
-   aarch64elf32b aarch64elfb armelf armelfb aarch64linuxb aarch64linux32
-  aarch64linux32b armelfb_linux_eabi armelf_linux_eabi
-
-Upstream-Status: Inappropriate [klibc specific]
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
-
----
- purgatory/arch/arm64/Makefile | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/purgatory/arch/arm64/Makefile b/purgatory/arch/arm64/Makefile
-index 636abea..ddc9461 100644
---- a/purgatory/arch/arm64/Makefile
-+++ b/purgatory/arch/arm64/Makefile
-@@ -1,13 +1,13 @@
- 
--arm64_PURGATORY_EXTRA_CFLAGS = \
--	-mcmodel=large \
--	-fno-PIC \
--	-fno-stack-protector \
--	-fno-asynchronous-unwind-tables \
--	-Wundef \
--	-Werror-implicit-function-declaration \
--	-Wdeclaration-after-statement \
--	-Werror=implicit-int \
--	-Werror=strict-prototypes
-+#arm64_PURGATORY_EXTRA_CFLAGS = \
-+#	-mcmodel=large \
-+#	-fno-PIC \
-+#	-fno-stack-protector \
-+#	-fno-asynchronous-unwind-tables \
-+#	-Wundef \
-+#	-Werror-implicit-function-declaration \
-+#	-Wdeclaration-after-statement \
-+#	-Werror=implicit-int \
-+#	-Werror=strict-prototypes
- 
- arm64_PURGATORY_SRCS += \
- 	purgatory/arch/arm64/entry.S \
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index 92ab7e6..fe34671 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -48,8 +48,7 @@ SRC_URI_append_x86 = " file://x86_sys_io.patch file://x86_basename.patch \
 SRC_URI_append_x86-64 = " file://x86_sys_io.patch file://x86_basename.patch \
                           file://x86_vfscanf.patch file://x86_kexec_test.patch"
 
-SRC_URI_append_aarch64 = " file://arm64_purgatory-Makefile-remove-unknown-flags.patch \
-                           file://arm64_kexec-image-header.h-add-missing-le64toh.patch \
+SRC_URI_append_aarch64 = " file://arm64_kexec-image-header.h-add-missing-le64toh.patch \
                            file://arm64-crashdump-arm64.c-fix-warning.patch \
                            file://arm64_kexec-arm64.c-workaround-for-getrandom-syscall.patch"
 
-- 
2.7.4


