Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5585ACCF2D8
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 00:41:35 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24902.1792370491841553144
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 17:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Png8/0yB;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2830014eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 17:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792370491; x=1792975291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQn8NLEZlDtS0spPyIDzu9rqCzd/3jrvkkbLumj9s2Q=;
        b=Png8/0yBljKWt9GWomypxml4bD4Mf9qKk2VZvSBWGZlNIiWwUW0dV//KzmIQmfVqi+
         zyuI3sky3S13ZKYyfnOKNCI9STbLe+KDWqef8Ga0NstMwX5uK/MNsgBTVVla4nwAH8vH
         NNv6/0MtNQ0vPa9BeWrAMlU/4vWw3l07+XCs0XjNXYJwz4/vScK3Flj1R3LmpnRaEA7o
         lm3itx3kxuyOFBSiVAelj8dQdqvszGIXgtpkRvVrVQvJv/CCwGH7D1AZ/LhDAXuWaTok
         o0HS65vkibwfpUlFu9RDWBa39eAvny9Du8kquGtXKtmuXjHbUeiY4fFul9KM6084dInf
         cE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792370491; x=1792975291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQn8NLEZlDtS0spPyIDzu9rqCzd/3jrvkkbLumj9s2Q=;
        b=0YKnIrtrTUD//zUOi8BbFe7Ga/NRltdj7ckIdzHREuPB8OL5eZ1AFB1aRPel3B6MPo
         P8lS5P8ffkTWRA+vpagn0yBSXg78Ohos3hkHgMkM0iToH+6rIjDwu4t1d0Q2ri3NRkhM
         pyg9ODGhOB3m9cmsGC62KMlebzF9zUrrRZ/4zWxYlQr3QRsWI/aqqBs8Lb6OLsUTGN3H
         BGbTLZAwJmWhtIqD/CQiNGJVL9hNbbuInMT7Shl5Rz/XIrRaNDMQb+nb79ZewHF4FRHv
         G4V4XZ7a8IlnrqLuExAoj8hnEgmO0yFH+eGY/GzA1mVsG8HS0gWV28PYf783i7io/Hr7
         iHAg==
X-Gm-Message-State: AFq9FYLvUNH95tEu0TB91TW6MDyi471l0D/sB1YHaCgK7xzVixhxJqmo
	i80iTUjw9ejXOszF+bV0TMVrmlLrCJ/qfnDkDzkGf9UfqUbIEPgMBiI9BZimtWs9rjA=
X-Gm-Gg: AYBFou1ZY5u8wTpyQcErapcPZQ6VsdxrHhLNom/51hq5nYZEuDjyI+CeNpKs0f/sOkE
	XOwdDPwNtK9ImjyK0TVTAtHx+GrsprKtuttShzh7YUdxmqzBuFfLUFmcSq4qamvIGE3wepaVJrH
	LO9zlq9NHul9nCBfUzcK3tkRc9SiJn5x4DhfjTwb/V1Z67Q8yQ6v1DEGuSgQjmv6+fBD/bDV2A3
	8W2R7PzkGF59s3DYdLVS9pc9wfG8GhGITkVTWLia/KQ3oiINSI7502IiNDZ5zerbmjXVjH2DhnS
	ABM5c9EMeOIJ5z52+o8sPJTCsCfY4fszMTgrIVrgUJ+UFGfvS8vGSh3hxac7kC0EHpV8VOOOtFw
	XuVC5ZH8R2ynL02bAVcvus9/C8Q7F+9qvs/ESpt6epo7reseJkFaEKo4KVfX53IezYWpnKj4m5A
	DyuJjMLnYOuL1i4WluVR3KAiUfnwddH5668y/SXcydNK8srpyQ/xrj8TUgWtusFTZiqe3GeflPA
	9sAkZdMP+iy8Kthx5MMqA0mpE2XR8JB1Uz/622vGpeI4d8T/EamerqtyydSnVU03u/C+KM6m9Qz
	l1+2E2MJ3XfoW2J/LjmgMh0dsuo0tqkXB376au4OLuivQm7GBuDATAW1AqDWn+xZYmSwePaUm+P
	EW/WePz6r6Wb2fGwdfeURAJRAMnKts2wbYIENeh/wMObMLmZ+zctzNvn7ZIuXl2YZJ7pHgakl4M
	k1Y+2kc3m8hjjcpexIL/GEnyuOTdBsC7dj+7MKy2b08ViawA==
X-Received: by 2002:a05:7301:424a:b0:35b:9bd:1435 with SMTP id 5a478bee46e88-3619ea236e5mr8447856eec.2.1792370491095;
        Sun, 18 Oct 2026 17:41:31 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm45211774eec.28.2026.10.18.17.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:41:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 6/8] sockperf: Add RISC-V support
Date: Sun, 18 Oct 2026 17:41:20 -0700
Message-ID: <20261019004122.2475327-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
References: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 00:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131105

configure rejected riscv hosts as not ported, and the TSC read fell back
to x86 rdtsc. Patch both, reading the time CSR with rdtime.

Tested by building for qemuriscv64 (musl, clang) and running a loopback
ping-pong under qemu-riscv64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../files/0002-Add-RISC-V-support.patch       | 66 +++++++++++++++++++
 .../sockperf/sockperf_git.bb                  |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/sockperf/files/0002-Add-RISC-V-support.patch

diff --git a/meta-oe/recipes-benchmark/sockperf/files/0002-Add-RISC-V-support.patch b/meta-oe/recipes-benchmark/sockperf/files/0002-Add-RISC-V-support.patch
new file mode 100644
index 0000000000..ce0cd306c9
--- /dev/null
+++ b/meta-oe/recipes-benchmark/sockperf/files/0002-Add-RISC-V-support.patch
@@ -0,0 +1,66 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 18 Oct 2026 17:20:00 -0700
+Subject: [PATCH] Add RISC-V support
+
+configure rejects riscv hosts with "it has not been ported", and
+os_gettimeoftsc() falls back to the x86 rdtsc instruction for any
+unknown architecture.
+
+Accept riscv* hosts and read the time CSR with rdtime, which Linux lets
+user mode access (unlike the cycle CSR). On rv32 read the high half
+around the low half and retry on carry.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ configure.ac   |  2 ++
+ src/ticks_os.h | 14 ++++++++++++++
+ 2 files changed, 16 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 258bbb0..13900cf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -29,6 +29,7 @@ case "$host" in
+   i386-*-freebsd*) TARGET=FREEBSD; TARGETDIR=x86;;
+   aarch64-*-*) TARGET=AARCH64; TARGETDIR=aarch64;;
+   s390*-*-*) TARGET=S390; TARGETDIR=s390;;
++  riscv*-*-*) TARGET=RISCV; TARGETDIR=riscv;;
+ esac
+
+ AC_SUBST(AM_RUNTESTFLAGS)
+@@ -48,6 +49,7 @@ AM_CONDITIONAL(POWERPC_FREEBSD, test x$TARGET = xPOWERPC_FREEBSD)
+ AM_CONDITIONAL(FREEBSD, test x$TARGET = xFREEBSD)
+ AM_CONDITIONAL(AARCH64, test x$TARGET = xAARCH64)
+ AM_CONDITIONAL(S390, test x$TARGET = xS390)
++AM_CONDITIONAL(RISCV, test x$TARGET = xRISCV)
+
+ AC_SUBST(TARGET)
+ AC_SUBST(TARGETDIR)
+diff --git a/src/ticks_os.h b/src/ticks_os.h
+index 46e313c..023be3a 100644
+--- a/src/ticks_os.h
++++ b/src/ticks_os.h
+@@ -100,6 +100,20 @@ inline ticks_t os_gettimeoftsc() {
+     asm volatile("isb" : : : "memory");
+     asm volatile("mrs %0, cntvct_el0" : "=r" (ret));
+     return ret;
++#elif defined(__riscv)
++    // Linux allows user mode to read the time CSR, but not cycle
++#if __riscv_xlen == 64
++    uint64_t ret;
++    asm volatile("rdtime %0" : "=r"(ret));
++    return (ticks_t)ret;
++#else
++    uint32_t tmp;
++    do {
++        asm volatile("rdtimeh %0" : "=r"(upper_32));
++        asm volatile("rdtime %0" : "=r"(lower_32));
++        asm volatile("rdtimeh %0" : "=r"(tmp));
++    } while (upper_32 != tmp);
++#endif
+ #elif defined(__arm__)
+     // so the compiler will not complain. for
+     // AArch32 compile, this inline is not used
diff --git a/meta-oe/recipes-benchmark/sockperf/sockperf_git.bb b/meta-oe/recipes-benchmark/sockperf/sockperf_git.bb
index fe285465e6..f4a113ee1c 100644
--- a/meta-oe/recipes-benchmark/sockperf/sockperf_git.bb
+++ b/meta-oe/recipes-benchmark/sockperf/sockperf_git.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://copying;md5=b4563b57c98bc23c8cecbc0b6d9546e9"

 SRC_URI = "git://github.com/Mellanox/sockperf;branch=sockperf_v2;protocol=https \
            file://0001-src-fix-missing-includes-for-musl-struct-timeval-ss.patch \
+           file://0002-Add-RISC-V-support.patch \
            "
 SRCREV = "3c65ad99cd385e18f8a2a655c19826e81a4d17e8"


