Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C83AC05027
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 02:38:28 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.74639.1675737502767395847
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 18:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XqnY2WNC;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id q9so9551242pgq.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 18:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fEjpiRH8cWqTN2KNBhE7lpmQX7+VA6cTp5ccCDUCiRs=;
        b=XqnY2WNCAeTP1dncTIMMAjVrxTDX87CX0DzYH5q6FPqQUpKnfF/iwRq04nzjmp/arz
         kHYjTzRHPppII/VQICBrRfbZSj/GI9EaUF9BimU7+LHBx6qzhcnI0iapxNpRRNjfiaiM
         bRli9/9BHmdV2350z9pJyZMXjahIb8E+CQqidEkVTK/asYd53M6whps8YfO8cNN+RSuQ
         YyjKwhrztfcFMbmCvHd/WCyg9Iu8iiPoG466t41jcnsLDb2zomrSou/MCGdjKmEEDwwX
         K1GUwTd5wgYXdLlN+oT5V8t1ZUUPd07c9MzVmUVFspTs5bdLVEFyAr0oycsJcaBTDYNm
         I+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEjpiRH8cWqTN2KNBhE7lpmQX7+VA6cTp5ccCDUCiRs=;
        b=2WsvwE8/3ucrR5CZCQ472qd7GfumdL0FRe98GD9HZ01VM0tnFY7xuu5K/bhIgGQNCB
         ebz9jQfsHIyrJEswr/WjDKgWMWv92tenTY2ksPOKEPvyHwfRTpNPM+/H4eQOuIjtOsuR
         vNah9bJWI0rYeFtwG2itiKTug53yA1wvaCR3qUH80SKs1owD6kuJn1h1PaJKc4ER2WqC
         qXb0tnmwQltLnI40jWYWv3mBDDFLdun8tc8hO5o+6oKEQPZ/dLY2XOPggXQQpK8F0XiX
         RHAWsnZfWZJUkSdGdd96vS/4AE+c5Qn4KxW+UFlnzLLjFNtDY/c/9K2R4d/er6Io94wm
         lhuQ==
X-Gm-Message-State: AO0yUKUh73qwizMUQFDBDxYxYEGSkW+8E4ZE+yX0D8+bjGEP0vVIq72+
	WWpiWc43/JuL2QCZFRipSOgXGmin/iY=
X-Google-Smtp-Source: AK7set9AfMi4L7WpqZyCj+pqmRcGA+hCUuXljxvGDKGXnVZshKr5RTFuNR0SzUXiFkTYzzWjrUXwsw==
X-Received: by 2002:a62:174c:0:b0:58e:151c:f7fe with SMTP id 73-20020a62174c000000b0058e151cf7femr1627763pfx.4.1675737501850;
        Mon, 06 Feb 2023 18:38:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id c17-20020aa781d1000000b0058c8bf500bcsm7788311pfn.72.2023.02.06.18.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 18:38:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] ltrace: Fix build with clang16
Date: Mon,  6 Feb 2023 18:38:18 -0800
Message-Id: <20230207023819.2244963-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 02:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100951

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Fix-type-of-single-bit-bitfields.patch | 86 +++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-Fix-type-of-single-bit-bitfields.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-Fix-type-of-single-bit-bitfields.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-Fix-type-of-single-bit-bitfields.patch
new file mode 100644
index 0000000000..61932269bd
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-Fix-type-of-single-bit-bitfields.patch
@@ -0,0 +1,86 @@
+From 491b3b153f6b5cbf2d23a9778e5676eb29a6705f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Feb 2023 16:37:19 -0800
+Subject: [PATCH] Fix type of single bit bitfields
+
+clang16 warns
+trace.c:311:22: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
+
+quash the warning by using an unsigned type to allow
+an assignment of 0 or 1 without implicit conversion.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ library.h                 |  6 +++---
+ prototype.h               |  2 +-
+ sysdeps/linux-gnu/trace.h | 10 +++++-----
+ 3 files changed, 9 insertions(+), 9 deletions(-)
+
+--- a/library.h
++++ b/library.h
+@@ -71,20 +71,20 @@ struct library_symbol {
+ 	 * looking up one in LIB->protolib.  */
+ 	struct prototype *proto;
+ 
+-	int own_name : 1;
++	unsigned int own_name : 1;
+ 
+ 	/* This is relevant for PLT symbols.  Latent PLT symbols are
+ 	 * those that don't match any of the -e rules, but that might
+ 	 * potentially become active if a library implementing them
+ 	 * appears that matches a -l rule.  Ltrace core is responsible
+ 	 * for clearing latent flag.  */
+-	int latent : 1;
++	unsigned latent : 1;
+ 
+ 	/* Delayed symbols are those for which a breakpoint shouldn't
+ 	 * be enabled yet.  They are similar to latent symbols, but
+ 	 * backend is responsible for clearing the delayed flag.  See
+ 	 * proc_activate_delayed_symbol.  */
+-	int delayed : 1;
++	unsigned int delayed : 1;
+ 
+ 	struct arch_library_symbol_data arch;
+ 	struct os_library_symbol_data os;
+--- a/prototype.h
++++ b/prototype.h
+@@ -162,7 +162,7 @@ struct protolib_cache {
+ 
+ 	/* For tracking uses of cache during cache's own
+ 	 * initialization.  */
+-	int bootstrap : 1;
++	unsigned int bootstrap : 1;
+ };
+ 
+ /* Initialize CACHE.  Returns 0 on success or a negative value on
+--- a/sysdeps/linux-gnu/trace.h
++++ b/sysdeps/linux-gnu/trace.h
+@@ -33,11 +33,11 @@
+ struct pid_task {
+ 	pid_t pid;	/* This may be 0 for tasks that exited
+ 			 * mid-handling.  */
+-	int sigstopped : 1;
+-	int got_event : 1;
+-	int delivered : 1;
+-	int vforked : 1;
+-	int sysret : 1;
++	unsigned int sigstopped : 1;
++	unsigned int got_event : 1;
++	unsigned int delivered : 1;
++	unsigned int vforked : 1;
++	unsigned int sysret : 1;
+ };
+ 
+ struct pid_set {
+--- a/sysdeps/linux-gnu/trace.c
++++ b/sysdeps/linux-gnu/trace.c
+@@ -1043,7 +1043,7 @@ ltrace_exiting_install_handler(struct pr
+ struct process_vfork_handler
+ {
+ 	struct event_handler super;
+-	int vfork_bp_refd:1;
++	unsigned int vfork_bp_refd:1;
+ };
+ 
+ static Event *
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 72bec301fb..976bb482aa 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http;
            file://0001-ppc-Remove-unused-host_powerpc64-function.patch \
            file://0001-mips-Use-hardcodes-values-for-ABI-syscall-bases.patch \
            file://0001-ppc-plt-do-not-free-symbol-libsym.patch \
+           file://0001-Fix-type-of-single-bit-bitfields.patch \
            "
 SRC_URI:append:libc-musl = " file://add_ppc64le.patch"
 
-- 
2.39.1


