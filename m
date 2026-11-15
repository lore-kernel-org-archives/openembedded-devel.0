Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3801.1794728980534259122
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TbIBeTnP;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3712b6d9843so1902770eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728980; x=1795333780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BPQPoQki19V/I59CTktsVzep8/6dV7tSv3oUa32aRM=;
        b=TbIBeTnPyfx/UEyDVgCltD9tI4z4jDcF7k1QB+yNzVRPfqkp5GxaV0l3WWLOLSkEar
         hR7CL0wNPnJg10WN/WVYCUBcvQzFdtYrT0G3ixQWZQBQ6U2UfEXibgM+Ao/5VvSZgaqf
         2QGuC2RX2h+/8MMCJlS9ADHeHiVQQyu1hUC45xpDG714f5quopjGtHZy/xldoly6B/Up
         1ZeEP5ObzvO8yZ2OMLp1sj0y/AGp3yjQ2ZDpkpDHybSVZQXkgkAVKAoqRZL7vH2yz5Id
         381ueAvaSQHEaeNmG8vQkykU4u98NnyfLJc5sxdks5+AMJA9bj/haC8yTHZMs5fJWE6B
         ogIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728980; x=1795333780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3BPQPoQki19V/I59CTktsVzep8/6dV7tSv3oUa32aRM=;
        b=tvgLqSn55PE1RIg+BzDZ3DteNGdOPCtUeEZRW/tXKVDsaVHtqeCcOKI2aXwmPT48m5
         Se+OobYcGn/NowTFdSg+NeYAr9pJAGZ7a4hdEnn391ymxVleip1CyVnipkevvk7VCh19
         /fRqZnEQGT1TEZQCpYHG5WwhaDGp6ohEvJ4YOD1TWGDUWjgccxAxSGgQQ0iQkee/l2k1
         Mdb/kcuK6FEaBqfrncuBWSUNEEU2xBBeJbh8DofqluJQqYMPv1ue8QDQjV2a9nw7afZ5
         xMSPU80Ykl28yQO+jwC/WED4EU8uEZnBkjvez/UT7eeM76TULIJ5riM+3vLhVp3B8pVQ
         7vRQ==
X-Gm-Message-State: APuU4Z8odVxLRfejZytd0OwD3qN7rRx+mCN/bZSXGV//MfJe7NhTVOnn
	tXkvg6cSlxEAxY9c21HEJ/TVcrDKhJn72S/J93b8jO7u/Ow9CLLwsB7I6iS8D5Op
X-Gm-Gg: AYBFou0NMlLpYrZol6082Op0HDhDKeIePSmxjWzBZmudH1ViumxEWPY9uHUx726HZ5U
	3lIAZx+u3HQAtB0Q7vew0fbSklMIXv+nMd2senAjLXdzIMH1wjLrvKp/zPBGBd5y4OwJ0WsM7nb
	HMPy+wqlEAp8G+/RABCxT4G45cvjNCllv00MJ5lNrEXstjlsP1efsKH1iOdciKbAFB5GM83wCVN
	3MMOlQjuxFEfjHxG0Uka/umOXoTHex4WAl7Xn1LvPpa2HVZhtr3bQXSH+jrJQuKMs3ER5QLFeZF
	Rnycvw+JXZMjTWMIs58l39bT+P9fFT487uq+AtU1uhaCxYmEk74GyhqDylhx60/9hMIDJ9oVk+Q
	u8vnP6SRUEB9t/0U43OcBRAs28j1M8rakDgttdjAqv4+U0zKuPHKzBHLFEMJ/PHY166mfSD8bUU
	KAmSzol8e3+LVQOanhgpvBKnPpgyzUNQqS5lMczZrmWxqpCKI20TlRNDTcmr2CJlCwIN7QDzLmY
	tvVzPB1npsbPTDqAprgGPrV5/FZ7CUea3JT8jA7KxQFZq+VwqFqj1O9vQRxK3zQNHqXe64NfXdS
	WcrtSMxOAAkgjSjYm+aJwL+6Qavr445B93LdXX06UCK8+8txOFC7jJa0IbmLD1FZ748p7QjtyJP
	l8JF/08N4Jd94UYl/k3kmBkk5YHQZF+7XhgbiXoyIfE1XMFPbNHbIXo6TUfpeAmoG6LtV7zdmBS
	ARJJLdj7moq2DAnQjtHkcc3RK4+SqK16NjgxB1WWiCTzfcDOnJQXrsrubueR/U0MhzaOkcLHiJT
	DwfZGPsUkwDHRE8TIuvrFbZKQPE2cUIm0rfAWMQfEGmzdxr3peOf59jGzCPxDafXsJFCYu5U4gG
	nC/v
X-Received: by 2002:a05:7300:6148:b0:36a:270:ce76 with SMTP id 5a478bee46e88-379681c69afmr11014339eec.33.1794728979703;
        Sat, 14 Nov 2026 23:49:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 11/96] concurrencykit: upgrade 0.7.0+git -> 0.7.2
Date: Sat, 14 Nov 2026 23:47:49 -0800
Message-ID: <20261115074918.2932593-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132281
Content-Type: text/plain; charset="utf-8"

Move to the 0.7.2 release tag.

Drop 0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64.patch, the
riscv build files no longer set -mabi.

ck.pc is now installed with cp -p, which keeps the build user as owner;
chown it to root.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...32d-abi-on-riscv32-and-lp64d-on-rv64.patch | 32 -------------------
 .../concurrencykit/concurrencykit_git.bb      | 12 ++++---
 2 files changed, 8 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64.patch

diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64.patch
deleted file mode 100644
index a8ff77298f..0000000000
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 00f822ab79b6c06936147af4d832e439cecf0fc0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 7 Jan 2023 19:31:58 -0800
-Subject: [PATCH] build: Use ilp32d abi on riscv32 and lp64d on rv64
-
-ilp32d is common ABI used for linux distributions therefore a better
-default, similarily lp64d is common ABI for rv64 linux
-
-Upstream-Status: Submitted [https://github.com/concurrencykit/ck/pull/204]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- build/ck.build.riscv   | 2 +-
- build/ck.build.riscv64 | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/build/ck.build.riscv b/build/ck.build.riscv
-index 61e0033..11ac840 100644
---- a/build/ck.build.riscv
-+++ b/build/ck.build.riscv
-@@ -1 +1 @@
--CFLAGS+=-mabi=ilp32
-+CFLAGS+=-mabi=ilp32d
-diff --git a/build/ck.build.riscv64 b/build/ck.build.riscv64
-index 9f89791..7639bd6 100644
---- a/build/ck.build.riscv64
-+++ b/build/ck.build.riscv64
-@@ -1 +1 @@
--CFLAGS+=-mabi=lp64
-+CFLAGS+=-mabi=lp64d
--- 
-2.39.0
-
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index dabf9c2c9e..0a498e711e 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -7,12 +7,11 @@ LICENSE = "Apache-2.0 AND BSD-2-Clause"
 HOMEPAGE = "http://concurrencykit.org"
 SECTION = "base"
 
-PV = "0.7.0+git"
-SRCREV = "6e8e5bec2e2f8cef2072a68579cbb07ababf3331"
+PV = "0.7.2"
+SRCREV = "981e14290df3d4339974eade5d8820dafd506b58"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0b24c1a8f9ad516a297d055b0294231"
 SRC_URI = "git://github.com/concurrencykit/ck.git;branch=master;protocol=https \
-           file://0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch \
-           file://0001-build-Use-ilp32d-abi-on-riscv32-and-lp64d-on-rv64.patch"
+           file://0001-configure-Fix-compoiler-detection-logic-for-cross-co.patch"
 
 
 COMPATIBLE_HOST = "(arm|aarch64|i.86|x86_64|powerpc|powerpc64|riscv32|riscv64).*-linux*"
@@ -39,3 +38,8 @@ do_compile () {
 do_install () {
     oe_runmake 'DESTDIR=${D}' install
 }
+
+do_install:append () {
+    # ck.pc is installed with cp -p, keeping the build user as owner
+    chown root:root ${D}${libdir}/pkgconfig/ck.pc
+}
