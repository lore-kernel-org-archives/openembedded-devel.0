Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3B3CDE001
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 03:56:36 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10543.1763092591905277282
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 19:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QDJz6MX4;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ba599137cf8so1003550a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 19:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763092591; x=1763697391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W9oG29xlEPQ9BFpeOb6cVgcBRewU1uwBKl0X7jgRYTM=;
        b=QDJz6MX4qbzio4r6zoeL6dBVUhU88GAUUfyzTAEhgt2K5J1Jr3050dHSWyHgi60Qbj
         HHY7KZkOUW+/wnUTjiegL/wc81GnlvfeAc0uOxx0auBzZxQm08D/OnVKVKqxTVOgaqYA
         fmujcd4IGbZLtV48d9N484E+nsloxtyodrZUbB3SaXsDSlQn98LTqAcgAVQEgmi+l8HU
         B3wdMw3pr8Y2tQZNtgvifzTmDOni5cr9Ur5m9CjCDuPP6cc0r8/Pt5+z8eh/WV9jyxto
         x0bWf1Kya/ebP8hw74hDbikSMMw9U1cw33CSJ5F6JMTVB92LERxJpvrMWItORDDYokhK
         jZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763092591; x=1763697391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9oG29xlEPQ9BFpeOb6cVgcBRewU1uwBKl0X7jgRYTM=;
        b=mb15EgD5z75P7hxRj+HScrEfi/9mW94QbkTGm1ZA662wTGjsxRN/ybiiW1Vfr3QyU3
         5b64IkrB2IBXfSd8gtCbT6/WVy/uIVRn8+nXkQIR3DhashuDxlXUDoNY4XUXbb0zclVr
         iChb4kRnSVtlpQmf53Z8f565EbGzCb6UMpd9XvWFs9pNvjxu4bbrW/tdG5SJbwetraTv
         2ZX6fw14XnS+JTf805RKVy0nYovbCHsjQB+JQ9On4ibvnmJu3NUI0fvKgm3RAlspBH9E
         WUEH12k16aJl65KtkPQuK/A1ylhN4+gf3r/dz2xtAQGG77EbGKIRu9KJI7vP5KdpDYTz
         jW0A==
X-Gm-Message-State: AOJu0YzPekl94d1LxkSZbIx6CvXMDHCR0fY3jhZ5ESqpe7UMBFwM43kV
	HFX+Awwk5y3AF3QpHH++hD7pZLtrAEZGCuVP84RA9ADBjRJMs/A5R604XcavN3PQ3Ks=
X-Gm-Gg: ASbGnctedo4+LDsKexacBmIMCjWA09NI+YA+J0NsID56B3MVO34+BpllPyyR2ZooY9h
	ibmIs5oMtkNWIn2DQbCDpFhoo9EM4JtaHT6lzZf0MHMGTwcYgQAFwYH/3ar3D5JCAOdevpi4s1/
	kWkV2FVD6wOHR55kp8hOtrhyqED9pj1N4wwMGUaBmzEW1hXZR8fDuTwfnfx6wo1BsZrIJHGdJSb
	e8em8itgPuc4MPkTYpT7vrAnoiiMLao6Y3uqXO/RY+sGdCiv8v47drO0xTm4vKW7fSB75cSFfpX
	VKaveGj/ZiYAE3ELNqef+JA4txH57w/1k1Qf81R8nYbi8ZEtDQSS7ffA0h83mif+jSBkercKIKq
	PTQjR1TE8DW/C64gjeXj1M9pNuKaS5Ad5yJAJlHcvXt+MC0zCyvNC/WNWzHuyNnlRg5Hq8QJb4A
	3EJN5FPSApIlQsV2zdPSant0UOPQimLc0j/A1MJ2vcYSzdpnt6pcjetkpqgsA6dduDdXE1qbFeh
	gVRS6HxEQoTlYnalpS0Q+v2UyP1jCEe
X-Google-Smtp-Source: AGHT+IE1utv9b+Y51lkan7s33xJOSuq0xYKRcwin69zFnr9OnC34C/7OOSnCVl8yaegIxUuk3KC3nQ==
X-Received: by 2002:a05:7022:e05:b0:119:e569:f85d with SMTP id a92af1059eb24-11b03516e5amr660659c88.20.1763092590874;
        Thu, 13 Nov 2025 19:56:30 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060886b0sm3450180c88.10.2025.11.13.19.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:56:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] cbindgen: Fix getrandom build with musl/riscv32
Date: Thu, 13 Nov 2025 19:56:27 -0800
Message-ID: <20251114035628.157073-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 03:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121682

New upgrade to 0.29.2 broke it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Use-libc-SYS_futex_time64-on-riscv32.patch | 53 +++++++++++++++++++
 .../cbindgen/cbindgen_0.29.2.bb               |  2 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Use-libc-SYS_futex_time64-on-riscv32.patch

diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Use-libc-SYS_futex_time64-on-riscv32.patch b/meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Use-libc-SYS_futex_time64-on-riscv32.patch
new file mode 100644
index 0000000000..4bb30a78cf
--- /dev/null
+++ b/meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Use-libc-SYS_futex_time64-on-riscv32.patch
@@ -0,0 +1,53 @@
+From a552c6891070bf400d4fe1f7c39c50b1a0b17748 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Jul 2025 09:46:03 -0700
+Subject: [PATCH] Use libc::SYS_futex_time64 on riscv32
+
+On RISC-V 32-bit (riscv32), the SYS_futex system call is
+often handled indirectly due to the use of a 64-bit time_t
+type. Specifically, while SYS_futex is not directly defined,
+a related syscall like SYS_futex_time64 can be used,
+
+Upstream-Status: Backport [https://github.com/rust-random/getrandom/pull/698/commits/03d2c9f164099a714c3141c53221ccb68101c460]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/backends/use_file.rs | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/src/backends/use_file.rs b/src/backends/use_file.rs
+index 7b48d43..baa0c66 100644
+--- a/src/backends/use_file.rs
++++ b/src/backends/use_file.rs
+@@ -158,7 +158,18 @@ mod sync {
+     pub(super) fn wait() {
+         let op = libc::FUTEX_WAIT | libc::FUTEX_PRIVATE_FLAG;
+         let timeout_ptr = core::ptr::null::<libc::timespec>();
++        #[cfg(not(target_arch = "riscv32"))]
+         let ret = unsafe { libc::syscall(libc::SYS_futex, &FD, op, FD_ONGOING_INIT, timeout_ptr) };
++        #[cfg(target_arch = "riscv32")]
++        let ret = unsafe {
++            libc::syscall(
++                libc::SYS_futex_time64,
++                &FD,
++                op,
++                FD_ONGOING_INIT,
++                timeout_ptr,
++            )
++        };
+         // FUTEX_WAIT should return either 0 or EAGAIN error
+         debug_assert!({
+             match ret {
+@@ -172,7 +183,13 @@ mod sync {
+     /// Wake up all threads which wait for value of atomic `FD` to change.
+     pub(super) fn wake() {
+         let op = libc::FUTEX_WAKE | libc::FUTEX_PRIVATE_FLAG;
++
++        #[cfg(not(target_arch = "riscv32"))]
+         let ret = unsafe { libc::syscall(libc::SYS_futex, &FD, op, libc::INT_MAX) };
++
++        #[cfg(target_arch = "riscv32")]
++        let ret = unsafe { libc::syscall(libc::SYS_futex_time64, &FD, op, libc::INT_MAX) };
++
+         debug_assert!(ret >= 0);
+     }
+
diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.29.2.bb b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.29.2.bb
index 0ba5392d6c..6b5fac9d47 100644
--- a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.29.2.bb
+++ b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.29.2.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"

 require cbindgen-crates.inc
 SRC_URI += "git://github.com/mozilla/cbindgen.git;protocol=https;branch=main;tag=v${PV}"
+SRC_URI += "file://0001-Use-libc-SYS_futex_time64-on-riscv32.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/getrandom-0.3.3/"
+
 SRCREV = "76f41c090c0587d940a0ef81a41c8b995f074926"

 inherit cargo pkgconfig

