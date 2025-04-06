Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E22C36002
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 18:09:53 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.29519.1743962983010758882
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 11:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kK2BMoio;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so2983358b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 11:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743962982; x=1744567782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BBaUf+YR9wskWpCMMC8rFUeq5o3Z3zzlMR3+Tgpof2U=;
        b=kK2BMoioUX0H5xso+NSF8YBNho4NdYLrq4dT8OcNmT8rCeUKrKQKmqmTp+AtGKiGcO
         BB4nVkmJZEyQjYM3GRjGgkQ6uCdGAoeOmlJfBxSsL32cBZ6cuhCoikfMMh/sO0g5zrjp
         XN7pdNb2u+IncSoHpAnljvyz1B+fHcVig86XEwFQR7d3r7GL/20LH6VHZ1kuiuxZjJdT
         fr7nbQTWZnYZxOjGMNEdTVEsXYEZbu671netKQYBNfUqgNlEeirRCgEhqYxxd0MDJBfd
         dl5oftwp4mNpm0/1HXIh2rAayS7zQwnDAnbgbQ7rUhQrp3YS8E3cNwjGYvFJSJzrQL05
         vpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743962982; x=1744567782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBaUf+YR9wskWpCMMC8rFUeq5o3Z3zzlMR3+Tgpof2U=;
        b=gt3071tZYuE+KmGx1pGDYOPHoiVzfogJ/CTG86Z9KVJFPHrQbKs/f0c94j/68ICeze
         buD4z2ft8OKTYeazTZFvRuEOAYhixCDxe/Vzga3KVNT3uDuVFlg+5fkM0sGc/QHcKYLW
         i8XTsV2YFtt3uwBlD83SL63AN3zqbMFdEl2I7oWwqCVwbDSbhIwUkQFTF4z1q3ejCFRe
         grRV+2sAnC+PoSoJ9m7aS4HmlKRQFvyw8TdJPPOBt7HH114nUtwKgv4scZdTBXMqHg1D
         BlspQANYxQQC0PuXI5QNOwszfp7Yqjn5kGEQwycJk9gNzOYhju9v2fgW++hWdQtI1f9Y
         ERoQ==
X-Gm-Message-State: AOJu0Yy6EyNhmTQHxCQqJBg39NF6rP33ommqIraSDwGN5EfW9zFd0usA
	5xURuFl34yR3tus6REoU7pxGpNtwLHfX1nq17ibVr13+U/ws6EAMzZelKpZ3
X-Gm-Gg: ASbGncvAbbn5ntz/qdAR/j/luYm4L9gT5gBxHphG28mGpsuYrJyh9Kxn6w1H6LMOGDb
	BBd1vuRWloe8fnd1U3M0tGOHS1TjF9ZspPQnnKBmrPiVCa3/hci6Mz1yTxRQ5Cp0ntZ0uX3bpvy
	iV9ir7m3b1wNXJso2mZWVTf5H0Z/5x/Q/SNde0+z8kn6agEhpbShW4aQm0jTR5XGUsYmY/xn7FI
	N7q7PGwxcT1quJV+wPcTjE+eaWy6SbtwDagj21kfZh+GiMYTvzRIR+lPczP1M1OiiplUn1giDxY
	DN2V03nTA8ihCvMOLEJvQtJsY/Ny9fXFLtwU
X-Google-Smtp-Source: AGHT+IFJ2E3rwVrnrSPQmxwPqCyaxz2OAzpL91QyGDHyTx0WnNSymiQ9WWIkmZbLvWgfnnWzJfAqeA==
X-Received: by 2002:a17:90b:5347:b0:2ff:5267:e7da with SMTP id 98e67ed59e1d1-306a4e62854mr12741218a91.3.1743962981563;
        Sun, 06 Apr 2025 11:09:41 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca1eb96sm7453354a91.9.2025.04.06.11.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 11:09:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 1/2] cbindgen: Fix build on riscv32
Date: Sun,  6 Apr 2025 11:09:36 -0700
Message-ID: <20250406180938.2326040-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 18:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116611

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Patch libc instead of rustix

 ...l-codes-on-riscv32gc-unknown-linux-g.patch | 38 +++++++++++++++++++
 .../cbindgen/cbindgen_0.28.0.bb               |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch

diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch b/meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
new file mode 100644
index 0000000000..75086aba75
--- /dev/null
+++ b/meta-oe/recipes-devtools/cbindgen/cbindgen/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
@@ -0,0 +1,38 @@
+From 6ab6af57cbd3b3b0cd4ba04f7f65693e1ca69870 Mon Sep 17 00:00:00 2001
+From: Dan Gohman <dev@sunfishcode.online>
+Date: Sun, 6 Apr 2025 05:22:49 -0700
+Subject: [PATCH] Define more ioctl codes on riscv32gc-unknown-linux-gnu
+
+Define ioctl codes including `FICLONE` and `FS_IOC32_GETVERSION` on
+riscv32gc-unknown-linux-gnu.
+
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/4382]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/unix/linux_like/linux/arch/generic/mod.rs | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/unix/linux_like/linux/arch/generic/mod.rs b/src/unix/linux_like/linux/arch/generic/mod.rs
+index 2f437e1..db1f1e7 100644
+--- a/src/unix/linux_like/linux/arch/generic/mod.rs
++++ b/src/unix/linux_like/linux/arch/generic/mod.rs
+@@ -114,6 +114,7 @@ cfg_if! {
+                  target_arch = "x86_64",
+                  target_arch = "arm",
+                  target_arch = "aarch64",
++                 target_arch = "riscv32",
+                  target_arch = "riscv64",
+                  target_arch = "s390x",
+                  target_arch = "csky",
+@@ -218,7 +219,10 @@ cfg_if! {
+     // where S stands for size (int, long, struct...)
+     // where T stands for type ('f','v','X'...)
+     // where N stands for NR (NumbeR)
+-    if #[cfg(any(target_arch = "x86", target_arch = "arm", target_arch = "csky"))] {
++    if #[cfg(any(target_arch = "x86",
++                 target_arch = "arm",
++                 target_arch = "riscv32",
++                 target_arch = "csky"))] {
+         pub const FS_IOC_GETFLAGS: ::Ioctl = 0x80046601;
+         pub const FS_IOC_SETFLAGS: ::Ioctl = 0x40046602;
+         pub const FS_IOC_GETVERSION: ::Ioctl = 0x80047601;
diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
index 40436ef035..eb8556ebc6 100644
--- a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
+++ b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
@@ -3,7 +3,8 @@ HOMEPAGE = "https://github.com/mozilla/cbindgen"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI += "git://github.com/mozilla/cbindgen.git;protocol=https;branch=master"
+SRC_URI += "git://github.com/mozilla/cbindgen.git;protocol=https;branch=master \
+            file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/libc-0.2.155"
 SRCREV = "bd78bbe59b10eda6ef1255e4acda95c56c6d0279"
 S = "${WORKDIR}/git"
 

