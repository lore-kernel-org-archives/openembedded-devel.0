Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC3D0C433F5
	for <webhook@archiver.kernel.org>; Sat,  1 Jan 2022 22:30:55 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.4850.1641076254200585642
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Jan 2022 14:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EYeOjZ4O;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 n10-20020a7bc5ca000000b00345c520d38eso16397893wmk.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Jan 2022 14:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6pXt86+JhNwB8wQ6E3X1syuHbJtPyCu5NDKGYjOAJrQ=;
        b=EYeOjZ4OZqj+6IRwiGKrA27QNKxChwyxu1mEqzd+N1MTKMqnpfVlAzgx18Ft/tfrd9
         a0qmAPWWTFDPz6Eyo4iFIediEUXfJkuap1MvjSGpj7Yhx9lQSs7c5n+l5GNLCHUw2f+x
         WlTqlYXa6h9bIrdLSgBq5xG6sPCr88BlGV+XrDatGqRgwrBp090ZS5nqgAwmJgyNki4r
         b3mNukWCZDIW5hE1Ii5t44UUTMTIOlOK2DqoRLltWZ9VUli5/J2I0tlfYoImyvbhngJg
         Bda8gd6E28Qw/pEGt0O4l3L8Kely0GXmiicJUlgNYLY4vCtzuui3RXJARAp3a/wGxqqx
         g/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6pXt86+JhNwB8wQ6E3X1syuHbJtPyCu5NDKGYjOAJrQ=;
        b=i8YuV3/rYbQG3jGoQwUPkm3Px33qS+ODXT5zxwySXjGI9NDMhUk/jzLAnm/61y2HxP
         fbP/5OhNVTtcjarvntp8V2+bC1cqoOnxPPGzfpA4L3qfLCAD2eWESchMWh6ZaUBpKgM0
         EW5wm0Wk9DilPjb7EknYTttdD+3ajWbDYfjF5P1YP0bt3ak4TXfnNp3DtJ22vdqQ8NLn
         5OFGGieGW7ScdanKepQyTQ9uUflzv6ZY58V7sqkwFffoH34FikVuZfC0XX1dbUuN3j33
         gfqqD/ZmE1EaQ0YCUAfJ+3qfT3kHk6Cs3XR8uRp4yPwA5Bo4DkiLOWelNtjvd64pQ+wI
         AotA==
X-Gm-Message-State: AOAM533qWXQCvLE1xJgfY4Hq33T3GVpS+ojNRgB1W24/Rz3H+e4YWWvb
	6ZQ2ylazL1XhHzCj0rwyHBAR0wfSMzE=
X-Google-Smtp-Source: 
 ABdhPJyeOwF9qGpGwxDhjgrCow5CcOcqtAo1JKVNe0JJZIY4YXs2JdwtR1FQFDPZmaglD35R5ncinA==
X-Received: by 2002:a1c:1b8c:: with SMTP id
 b134mr33325732wmb.44.1641076252221;
        Sat, 01 Jan 2022 14:30:52 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 j85sm46460983wmj.3.2022.01.01.14.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 14:30:51 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH v2] ntpsec: Add glibc-2.34/kernel-5.14
 seccomp fixes
Date: Sat,  1 Jan 2022 17:17:51 +0000
Message-Id: <20220101171750.14316-1-alexk@zuma.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Jan 2022 22:30:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94634

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
Changes in v2:
- Correct subject (glib -> glibc)
- Reference backport patches as they're merged upstream

 ....c-allow-clone3-for-glibc-2.34-in-se.patch | 31 ++++++++++++++
 ....c-allow-newfstatat-on-all-archs-for.patch | 42 +++++++++++++++++++
 ....c-match-riscv-to-aarch-in-seccomp-f.patch | 34 +++++++++++++++
 .../recipes-support/ntpsec/ntpsec_1.2.1.bb    |  3 ++
 4 files changed, 110 insertions(+)
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
index 000000000000..3bec2cea7768
--- /dev/null
+++ b/meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-newfstatat-on-all-archs-for.patch
@@ -0,0 +1,42 @@
+From a6c0847582305aaab122d54b635954829812922f Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://gitlab.com/NTPsec/ntpsec/-/commit/a6c0847582305aaab122d54b635954829812922f]
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
index 000000000000..705a87bdfaa4
--- /dev/null
+++ b/meta-networking/recipes-support/ntpsec/ntpsec/0002-ntpd-ntp_sandbox.c-match-riscv-to-aarch-in-seccomp-f.patch
@@ -0,0 +1,34 @@
+From 0f94870b84e68448f16b1304058bde4628dafde5 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://gitlab.com/NTPsec/ntpsec/-/commit/0f94870b84e68448f16b1304058bde4628dafde5]
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


