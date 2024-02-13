Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D159C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 22:50:48 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.28355.1707864637939629220
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Feb 2024 14:50:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=Cqdyrz2P;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-411e698e679so182725e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 14:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707864635; x=1708469435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AueLKWSqNiVbOLFfNU7hr5siih1DoWza3eJD289Chdc=;
        b=Cqdyrz2PsncsZWsDaAgvC84RxmYKChmvVXmR7wiYmXHuuAaoWw63NDBnFjJrMBrqF+
         +BPmWjUTkmELiPwwvZBd4hHuzxDSIFiFAffok7JCTuYHgDDUkQKa/4HyxCoCUNNaC+hB
         nXAvIrRBtDotFnn++15yDfreSZ4fDCt6cHo3Jz4MUsmPehEStVo/AmwV0TwhVV4hpCAa
         /NENZ2EVMSA0L3UZnYwvv/tB8BPC/Fg+mIwDMEWLVSHYZlfLPtxelVRFNDGI5OQAmQSn
         AzoVEkh7VA+1ZwCrtkEjD56p82lpHP0hTdJJwLZyJ+HhGvj2feE2L53m2pNn903b0fp/
         jpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707864635; x=1708469435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AueLKWSqNiVbOLFfNU7hr5siih1DoWza3eJD289Chdc=;
        b=PtYgNNZgnSjSNlnXP2+PNYYrKWNNTQA2qnaIx2LtKmHDHFtLDIqvV0CIbbkALBS2GZ
         Ujo9t4CbKub2lvoB09zNoBqnW+Q1T+4MG9eXrCLXim5jI6C8Lsdb6jHmjj81p1ZBkEXB
         gRkep1PFm1nZFClw2JNlj2qYe/qAJMwgrHpmpLPO9aK58jw3k1C+Vi7lIxlgpyGzZH0L
         /GRk6NRyD5w36I5GWc98zrD7zjtLL3mhbyLeMEUh9oTuMt2U8EHR3aaY5gDKvVFbpJvn
         J1VkMdnL42N9Uxdmy464l5vgMCTzZggDr+fX1YJTw879gPmxvewxnjvJicWxEVVZI1y7
         A4Yg==
X-Gm-Message-State: AOJu0YzEJ42rYgT1Br2msOblJoVV5KqChXgd0NkCeMRYFVNcrHK5WvXy
	1VqrR+Pt873mUj/nyB8Ye/XxWWFC+y9+4pq0WmXg5MlaOS+mC5rIkQri9gpJJITxbdSI25PTT2Y
	m4t0=
X-Google-Smtp-Source: AGHT+IEjjDj6GP3s3UqOZGF4hXdkwOJUmQhDXtrN1ykejJOs2UqnM1kuAoohE8Q/SXjtdLKH2GgPsw==
X-Received: by 2002:a5d:5913:0:b0:33b:628f:3690 with SMTP id v19-20020a5d5913000000b0033b628f3690mr397453wrd.20.1707864635285;
        Tue, 13 Feb 2024 14:50:35 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c248800b00411e75eb83fsm5118wms.18.2024.02.13.14.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 14:50:35 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: Fix building on x86_64 with binutils 2.41
Date: Tue, 13 Feb 2024 23:50:17 +0100
Message-Id: <20240213225017.2107323-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 22:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108732

Newer versions of the GNU assembler (observed with binutils 2.41) will
complain about the ".arch i386" in files assembled with "as --64",
with the message "Error: 64bit mode not supported on 'i386'".

Fix by moving ".arch i386" below the relevant ".code32" directive, so
that the assembler is no longer expecting 64-bit instructions to be used
by the time that the ".arch i386" directive is encountered.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...uilding-on-x86_64-with-binutils-2.41.patch | 95 +++++++++++++++++++
 .../kexec/kexec-tools-klibc_git.bb            |  4 +-
 2 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/Fix-building-on-x86_64-with-binutils-2.41.patch

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/Fix-building-on-x86_64-with-binutils-2.41.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/Fix-building-on-x86_64-with-binutils-2.41.patch
new file mode 100644
index 000000000..4894f044f
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/Fix-building-on-x86_64-with-binutils-2.41.patch
@@ -0,0 +1,95 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Michel Lind <salimma@fedoraproject.org>
+Date: Tue, 30 Jan 2024 04:14:31 -0600
+Subject: [PATCH] Fix building on x86_64 with binutils 2.41
+
+Newer versions of the GNU assembler (observed with binutils 2.41) will
+complain about the ".arch i386" in files assembled with "as --64",
+with the message "Error: 64bit mode not supported on 'i386'".
+
+Fix by moving ".arch i386" below the relevant ".code32" directive, so
+that the assembler is no longer expecting 64-bit instructions to be used
+by the time that the ".arch i386" directive is encountered.
+
+Based on similar iPXE fix:
+https://github.com/ipxe/ipxe/commit/6ca597eee
+
+Signed-off-by: Michel Lind <michel@michel-slm.name>
+Signed-off-by: Simon Horman <horms@kernel.org>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?h=main&id=328de8e00e298f00d7ba6b25dc3950147e9642e6]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ purgatory/arch/i386/entry32-16-debug.S | 2 +-
+ purgatory/arch/i386/entry32-16.S       | 2 +-
+ purgatory/arch/i386/entry32.S          | 2 +-
+ purgatory/arch/i386/setup-x86.S        | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/purgatory/arch/i386/entry32-16-debug.S b/purgatory/arch/i386/entry32-16-debug.S
+index 5167944..12e1164 100644
+--- a/purgatory/arch/i386/entry32-16-debug.S
++++ b/purgatory/arch/i386/entry32-16-debug.S
+@@ -25,10 +25,10 @@
+ 	.globl entry16_debug_pre32
+ 	.globl entry16_debug_first32
+ 	.globl entry16_debug_old_first32
+-	.arch i386
+ 	.balign 16
+ entry16_debug:
+ 	.code32
++	.arch i386
+ 	/* Compute where I am running at (assumes esp valid) */
+ 	call	1f
+ 1:	popl	%ebx
+diff --git a/purgatory/arch/i386/entry32-16.S b/purgatory/arch/i386/entry32-16.S
+index c051aab..eace095 100644
+--- a/purgatory/arch/i386/entry32-16.S
++++ b/purgatory/arch/i386/entry32-16.S
+@@ -20,10 +20,10 @@
+ #undef i386	
+ 	.text
+ 	.globl entry16, entry16_regs
+-	.arch i386
+ 	.balign 16
+ entry16:
+ 	.code32
++	.arch i386
+ 	/* Compute where I am running at (assumes esp valid) */
+ 	call	1f
+ 1:	popl	%ebx
+diff --git a/purgatory/arch/i386/entry32.S b/purgatory/arch/i386/entry32.S
+index f7a494f..8ce9e31 100644
+--- a/purgatory/arch/i386/entry32.S
++++ b/purgatory/arch/i386/entry32.S
+@@ -20,10 +20,10 @@
+ #undef i386
+ 
+ 	.text
+-	.arch	i386
+ 	.globl entry32, entry32_regs
+ entry32:
+ 	.code32
++	.arch	i386
+ 
+ 	/* Setup a gdt that should that is generally usefully */
+ 	lgdt	%cs:gdt
+diff --git a/purgatory/arch/i386/setup-x86.S b/purgatory/arch/i386/setup-x86.S
+index 201bb2c..a212eed 100644
+--- a/purgatory/arch/i386/setup-x86.S
++++ b/purgatory/arch/i386/setup-x86.S
+@@ -21,10 +21,10 @@
+ #undef i386
+ 
+ 	.text
+-	.arch	i386
+ 	.globl purgatory_start
+ purgatory_start:
+ 	.code32
++	.arch	i386
+ 
+ 	/* Load a gdt so I know what the segment registers are */
+ 	lgdt	%cs:gdt
+-- 
+2.39.2
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index adfc3ba73..363cdb9ad 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -15,7 +15,9 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git;branc
 SRCREV = "5750980cdbbc33ef75bfba6660295b932376ce15"
 
 BUILD_PATCHES = "file://0001-force-static-build.patch \
-                 file://0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch"
+                 file://0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch \
+                 file://Fix-building-on-x86_64-with-binutils-2.41.patch \
+                 "
 
 KLIBC_PATCHES += " \
             file://0003-kexec-elf-rel-use-our-elf.h.patch \
-- 
2.39.2


