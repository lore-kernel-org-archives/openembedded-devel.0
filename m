Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7167FC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 23:22:27 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.5115.1640906545820835009
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 15:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YozC8//Q;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id v7so52974998wrv.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 15:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=md0NqTB2EuNApMTbyK7rL0EdjrYmK67zSO3DXE11Ios=;
        b=YozC8//QvmUheku+RF0Hg8epmtnrCpU9BXNetuu1b3/IMyiJX26yb8r254PQTfqTcL
         q8zCI8WZrH+mWVSCneVMKNlaj7CYJ+pY1eDBYMQp3jucfD2aY+yiP4shD4CJ7i2qZ5ha
         WiAJUby0lEMtRSSnhtLFQ35NUgMOtwRwSjRjMjNh3di/l3g3TZ1AzRpSlj35EyyKe0c/
         CPvGUBvqpyCYJoj/OmhghtjNvB70QW7FrtmlQV07313tTUT6r27gAiP6H/SR8Z7FEL60
         sqgWS5yKxgWhSY0RuaAmAmnx40jfUm20XKAuFpStBEiGKOwXWK12isQYriuVfFSVHx6W
         wnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=md0NqTB2EuNApMTbyK7rL0EdjrYmK67zSO3DXE11Ios=;
        b=qw6v9lKK2U+dZiVjV1k3JDgSKx0DckMiAPom8wHs6a4oRnjwrgmE2n2hERM+oTRMDI
         4x4j4fE2AbjFRKmSMuUXJtK4e/14niKgQ48QM7K3yj/Wr25AE5RvY9vqiLM3ePckaEP5
         M/BpwA3+LmM0fmyTCxovqCVYAHSHqYU42JC6DQfNlqqzLLt3xuXwTT9EwIlYaUTHiwAc
         7IL+OHfZIG8112+A17tU+S1dJRPYj99PAtZveWaxbTcLSvCri60hkmFcziUPNblwP9SZ
         aicbbMXycq9oGlnU9j3+NX5pmiYaalxHSVRS7CxuK5LzR8SBHrG/62Re1I2gz4t5i2CE
         3Jnw==
X-Gm-Message-State: AOAM530wJ6iszd14bK02OsiEcYhbOkpKxIe1gRUnI3QNXoU83mLG+WCi
	5sA7F8gzMhdFAD+urOjLH5AobVMm/Z0=
X-Google-Smtp-Source: 
 ABdhPJwXwWPNg1SXP/XAz2n9O1s59GYO+c/PSDFT6rzkG7oLrAWqq3QVr4+jG3U53q+6EjD9pQXc5A==
X-Received: by 2002:adf:8165:: with SMTP id 92mr27645068wrm.199.1640906543885;
        Thu, 30 Dec 2021 15:22:23 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 c11sm31316198wmq.48.2021.12.30.15.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 15:22:23 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] ntpsec: Add glib-2.34/kernel-5.14 seccomp
 fixes
Date: Thu, 30 Dec 2021 23:21:55 +0000
Message-Id: <20211230232154.10021-1-alexk@zuma.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Dec 2021 23:22:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94577

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 ....c-allow-clone3-for-glibc-2.34-in-se.patch | 31 +++++++++++++
 ....c-allow-newfstatat-on-all-archs-for.patch | 43 +++++++++++++++++++
 ....c-match-riscv-to-aarch-in-seccomp-f.patch | 35 +++++++++++++++
 .../recipes-support/ntpsec/ntpsec_1.2.1.bb    |  3 ++
 4 files changed, 112 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-clone3-for-glibc-2.34-in-se.patch
 create mode 100644 meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-newfstatat-on-all-archs-for.patch
 create mode 100644 meta-networking/recipes-support/ntpsec/ntpsec/0002-ntpd-ntp_sandbox.c-match-riscv-to-aarch-in-seccomp-f.patch

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-clone3-for-glibc-2.34-in-se.patch b/meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-clone3-for-glibc-2.34-in-se.patch
new file mode 100644
index 000000000000..112aaa2a07d6
--- /dev/null
+++ b/meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-clone3-for-glibc-2.34-in-se.patch
@@ -0,0 +1,31 @@
+From d474682bb30b93d04b7b01c2dd09832e483265ed Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sun, 14 Nov 2021 08:54:58 +0000
+Subject: [PATCH] ntpd/ntp_sandbox.c: allow clone3 for glibc-2.34 in seccomp
+ filter
+
+Bug: https://bugs.gentoo.org/823692
+Fixes: https://gitlab.com/NTPsec/ntpsec/-/issues/713
+Signed-off-by: Sam James <sam@gentoo.org>
+Upstream-Status: Backport [https://gitlab.com/NTPsec/ntpsec/-/commit/d474682bb30b93d04b7b01c2dd09832e483265ed]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Signed-off-by: Alex Kiernan <alexk@zuma.ai>
+---
+ ntpd/ntp_sandbox.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ntpd/ntp_sandbox.c b/ntpd/ntp_sandbox.c
+index e66faaa8cbb0..3d6bccdfcf77 100644
+--- a/ntpd/ntp_sandbox.c
++++ b/ntpd/ntp_sandbox.c
+@@ -401,6 +401,7 @@ int scmp_sc[] = {
+  * rather than generate a trap.
+  */
+ 	SCMP_SYS(clone),	/* threads */
++	SCMP_SYS(clone3),
+ 	SCMP_SYS(kill),		/* generate signal */
+ 	SCMP_SYS(madvise),
+ 	SCMP_SYS(mprotect),
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-newfstatat-on-all-archs-for.patch b/meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-newfstatat-on-all-archs-for.patch
new file mode 100644
index 000000000000..b4e6a2d0d5f7
--- /dev/null
+++ b/meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-newfstatat-on-all-archs-for.patch
@@ -0,0 +1,43 @@
+From 1e58cdd2ee488e1b20fbfcf80faa438d22820d0c Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alexk@zuma.ai>
+Date: Thu, 30 Dec 2021 09:32:26 +0000
+Subject: [PATCH 1/2] ntpd/ntp_sandbox.c: allow newfstatat on all archs for
+ glibc-2.34 in seccomp filter
+
+On Yocto Poky, newfstatat is used on (at least) arm64, x86_64 and
+riscv64:
+
+  2021-12-30T09:32:04 ntpd[341]: ERR: SIGSYS: got a trap.
+  2021-12-30T09:32:04 ntpd[341]: ERR: SIGSYS/seccomp bad syscall 262/0xc000003e
+
+Upstream-Status: Submitted
+  https://gitlab.com/NTPsec/ntpsec/-/merge_requests/1248
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Signed-off-by: Alex Kiernan <alexk@zuma.ai>
+---
+ ntpd/ntp_sandbox.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ntpd/ntp_sandbox.c b/ntpd/ntp_sandbox.c
+index 3d6bccdfcf77..1ae82a671344 100644
+--- a/ntpd/ntp_sandbox.c
++++ b/ntpd/ntp_sandbox.c
+@@ -349,6 +349,7 @@ int scmp_sc[] = {
+ 	SCMP_SYS(lseek),
+ 	SCMP_SYS(membarrier),	/* Needed on Alpine 3.11.3 */
+ 	SCMP_SYS(munmap),
++	SCMP_SYS(newfstatat),
+ 	SCMP_SYS(open),
+ #ifdef __NR_openat
+ 	SCMP_SYS(openat),	/* SUSE */
+@@ -452,7 +453,6 @@ int scmp_sc[] = {
+ #endif
+ #if defined(__aarch64__)
+ 	SCMP_SYS(faccessat),
+-	SCMP_SYS(newfstatat),
+ 	SCMP_SYS(renameat),
+ 	SCMP_SYS(linkat),
+ 	SCMP_SYS(unlinkat),
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec/0002-ntpd-ntp_sandbox.c-match-riscv-to-aarch-in-seccomp-f.patch b/meta-networking/recipes-support/ntpsec/ntpsec/0002-ntpd-ntp_sandbox.c-match-riscv-to-aarch-in-seccomp-f.patch
new file mode 100644
index 000000000000..cca6649e5f57
--- /dev/null
+++ b/meta-networking/recipes-support/ntpsec/ntpsec/0002-ntpd-ntp_sandbox.c-match-riscv-to-aarch-in-seccomp-f.patch
@@ -0,0 +1,35 @@
+From 7536e2e4bc25fc8db4d5a2f00a91e91ba82d7d7b Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alexk@zuma.ai>
+Date: Thu, 30 Dec 2021 10:41:20 +0000
+Subject: [PATCH 2/2] ntpd/ntp_sandbox.c: match riscv to aarch in seccomp
+ filter
+
+On Yocto Poky, faccessat (et al) are also used on riscv64:
+
+  2018-03-09T12:35:32 ntpd[341]: ERR: SIGSYS: got a trap.
+  2018-03-09T12:35:32 ntpd[341]: ERR: SIGSYS/seccomp bad syscall 48/0xc00000f3
+
+Upstream-Status: Submitted
+  https://gitlab.com/NTPsec/ntpsec/-/merge_requests/1248
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Signed-off-by: Alex Kiernan <alexk@zuma.ai>
+---
+ ntpd/ntp_sandbox.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ntpd/ntp_sandbox.c b/ntpd/ntp_sandbox.c
+index 1ae82a671344..4a14ae224dc6 100644
+--- a/ntpd/ntp_sandbox.c
++++ b/ntpd/ntp_sandbox.c
+@@ -451,7 +451,7 @@ int scmp_sc[] = {
+ 	/* gentoo 64-bit and 32-bit, Intel and Arm use mmap */
+ 	SCMP_SYS(mmap),
+ #endif
+-#if defined(__aarch64__)
++#if defined(__aarch64__) || defined(__riscv)
+ 	SCMP_SYS(faccessat),
+ 	SCMP_SYS(renameat),
+ 	SCMP_SYS(linkat),
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
index 2551b6aab828..3efac7d98383 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
@@ -13,6 +13,9 @@ DEPENDS += "bison-native \
 
 SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
            file://0001-Update-to-OpenSSL-3.0.0-alpha15.patch \
+           file://0001-ntpd-ntp_sandbox.c-allow-clone3-for-glibc-2.34-in-se.patch \
+           file://0001-ntpd-ntp_sandbox.c-allow-newfstatat-on-all-archs-for.patch \
+           file://0002-ntpd-ntp_sandbox.c-match-riscv-to-aarch-in-seccomp-f.patch \
            file://volatiles.ntpsec"
 
 SRC_URI[sha256sum] = "f2684835116c80b8f21782a5959a805ba3c44e3a681dd6c17c7cb00cc242c27a"
-- 
2.34.1


