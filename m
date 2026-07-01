Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121D9C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 06:33:00 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39109.1782887572765447714
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 23:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CT/5Z3uW;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37fb17e1435so129191a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 23:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782887572; x=1783492372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NSJWAV5Qn1OVOafjkUTfrYLW7WenIVUa+VL77otpgj8=;
        b=CT/5Z3uWIGa66IgFDw5P4fxQeaJkOA6+gWAp5Oz8u6uvmrVouYeIt0qfCHsqVIMis0
         1sZV4xTbr485x8A17WYdjGG0r6NlQ4QmqJWy09UFRXejsrm5NJMwJ2MGEZSZwUaJZMTF
         94NtTaB0tq/s3frYuToQCndpkb9z8pyBoynccUbN73vPTZbuxhfMBfULM/4KanIPEu1t
         IT8QWaf5z6x0WhjMJAdGjZpjd/+2wqIvSdx+kV1LRiEgpZ9LgqgNJDtoqYJWI9Iyzbo7
         yUqmxEy3+JU8rwnNTps4ZIgktd8w8uPaXT21OcXTn3HuDZLOb7LxZcnrT6GUCH0PvAxh
         jERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782887572; x=1783492372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSJWAV5Qn1OVOafjkUTfrYLW7WenIVUa+VL77otpgj8=;
        b=BITYNGBqVg5vbrajgS+/nXtgiTD8+jbXfFP/XuLvwhF8fQXsg0L+z05Wr2u+kSMf2S
         1Bx49p0HlioNvZqOYsiA+0CnZBrzoS190LKjGAu8Umb5LRR1Z+s9DAJnxNYxQk1i9RPH
         tPgw6Xl8yvB3n+24Zf72FnlJQI5eyJWNyJSKTGfPcmx+A4DCMRCE2EVLP0OcnIOXbs6i
         MRGnaXZ/pKqhumu7AJov1Aj7Hfttw888A4p3edl1XNPZo828kG5+HrMmCIj8OSLQrClk
         pzR3fpH1Hc0v1CveepA1opy5eTN+R1y2ZmfVOpbpN1lPjlxX1sREdgpRKpOmQ62lY79t
         hUGQ==
X-Gm-Message-State: AOJu0YzXfGJndqouAHqvQYy44Cl6ICgPatyai9LW6L2nc7FSXBv9rZo+
	AYsslA9wxty0Y7+Qn9QLNxt0iN18yzWNOmSYfzZlvjuB6TQo94U7GFkqzHFs/6zM0EQ=
X-Gm-Gg: AfdE7ck6SEgGJq2hDadMCPBjXCm4mOwOkJjvQNdDHWQgwRMrpdo6fHeTjR5FeipOdxe
	7NrGgyiPJGFx5uhJKDka2HgH9L+kXa5kf6pwdlEw5nVl0c07JCsHA7NFnBcz/Qos5WTLdasP/Pn
	LEj9MnNGoldtEYNbsxyDH0dlr6pMHYLtK7CqHL7v/XMjvYg4gCzK/DowxIJfxpVsPlRJOMCPTl7
	G+mj8wNmouogIMeIjuqsEGY/90X8WaXhEy30jrvcrKWqpMzN3d6paMVWv/gaavYcrb8j1Q+eCH8
	VRxT0n0qUKVxGPjay8y8BmdDqCD+LakbfjCKylEOockXTZVVhKYvNbw9P2rmvEyxoMINg3MTOpX
	VlIZwDYNmlhC9pT98pEiaFA1jKfKo1v6stX7tUZZz5FOOi/czrwIRhw5N0Uj+ERd6hfG3BO8HIb
	UMAmjV6WMkOyylFJrYnzrFL++tCcXq4Lnl4nWtuoIzi3/AUb09ZKkQnUYYj5886gRLnvoJ7J3vu
	s+Zlc5cNlrGUlXfv0nl+6m/RO86OAHk0feB+8Kk9Uhkr8hEBHJ78yCo6kwCksz0DQAULTQMzlGs
	o30gbxXKoatq/nnqgTYW7Szej9MmIg==
X-Received: by 2002:a17:90b:1dcf:b0:37f:e326:6559 with SMTP id 98e67ed59e1d1-380aa1c7ac5mr511156a91.22.1782887571986;
        Tue, 30 Jun 2026 23:32:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d6666esm1187220a91.6.2026.06.30.23.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 23:32:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Subject: [meta-oe][PATCH] crash: Fix cross compilation for 32-bit arm
Date: Tue, 30 Jun 2026 23:32:47 -0700
Message-ID: <20260701063247.2483496-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jul 2026 06:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127989

The upstream crash Makefile CONF_TARGET_ARCH mapping (used when
CROSS_COMPILE is set) enumerates most of OE supported arches
but omits 32-bit arm. Building with CROSS_COMPILE=arm-*
therefore aborts at Makefile parse time:

    Makefile:75: *** The current Arch(arm) does not support cross compilation.  Stop.

ARM is already a valid crash target (defs.h/configure.c), so add a patch
mapping the normalized "arm" arch to CONF_TARGET_ARCH=ARM like every
other supported arch.

Verified by cross building crash for qemuarm (arm-yoe-linux-gnueabi-):

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/crash/crash.inc        |  1 +
 ...pport-cross-compiling-for-32-bit-arm.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-Makefile-support-cross-compiling-for-32-bit-arm.patch

diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index dd231134b2..d6447ebe49 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=http
            file://gdb_build_jobs_and_not_write_crash_target.patch \
            file://0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch \
            file://0001-Use-CC-env-var-to-get-compiler-version.patch \
+           file://0001-Makefile-support-cross-compiling-for-32-bit-arm.patch \
           "
 # 0001-Use-CC-env-var-to-get-compiler-version.patch:
 # to get the right compiler info into ./crash --buildinfo
diff --git a/meta-oe/recipes-kernel/crash/crash/0001-Makefile-support-cross-compiling-for-32-bit-arm.patch b/meta-oe/recipes-kernel/crash/crash/0001-Makefile-support-cross-compiling-for-32-bit-arm.patch
new file mode 100644
index 0000000000..102674000b
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/0001-Makefile-support-cross-compiling-for-32-bit-arm.patch
@@ -0,0 +1,36 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 30 Jun 2026 00:00:00 +0000
+Subject: [PATCH] Makefile: support cross compiling for 32-bit arm
+
+The CONF_TARGET_ARCH cross-compilation mapping enumerates aarch64,
+s390x, powerpc64, ppc64le, alpha, i386, mips, sparc64 and riscv64 but
+omits 32-bit arm. As a result, building with CROSS_COMPILE=arm-* (e.g.
+arm-poky-linux-gnueabi-) aborts at Makefile parse time with:
+
+    Makefile:75: *** The current Arch(arm) does not support cross compilation.  Stop.
+
+ARM is already a valid crash target (defs.h/configure.c), so map the
+normalized "arm" arch to CONF_TARGET_ARCH=ARM like every other arch.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 1111111..2222222 100644
+--- a/Makefile
++++ b/Makefile
+@@ -55,6 +55,8 @@ ifeq (${ARCH}, x86_64)
+ CONF_TARGET_ARCH := X86_64
+ else ifeq (${ARCH}, aarch64)
+ CONF_TARGET_ARCH := ARM64
++else ifeq (${ARCH}, arm)
++CONF_TARGET_ARCH := ARM
+ else ifeq (${ARCH}, s390x)
+ CONF_TARGET_ARCH := S390X
+ else ifeq (${ARCH}, powerpc64)
+--
+2.43.0

