Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB159D3E781
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 22:34:55 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8905.1765406086087489077
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 14:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=en4kYNHI;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-11b6bc976d6so1914483c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 14:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765406085; x=1766010885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JpS6FdvyNb3WW13Qk2KvxYj3K6EpOSC5n3AGtXbRp5s=;
        b=en4kYNHIL29+OcpG9eWavsEWrKzAUnQU3HF880qQxIT+5Tdg9cDqpoYVMv9O+oTt4k
         Q44RPfmhawwwe+FvciNAAgPiLP1QK2F5wcs5dRNo5yxf5ZuJvhotJMX3fipDRX8kwcnY
         0BdHoBH5jCf38UgdT3/c0XQqI4sqa9XtsmzT2/ARTWWypxqupk0iP2SlhLrkrMH61DUQ
         YfPFKWd012vL5ndjtY4+XR4ahaikXp8N8++0icu9gfWnwvejhe9tPioJsYQrXFtQZ31W
         DLjJ9n6c909uhKsAv6uauAdhKQ/kts9SU2nltWwmRzUSNlfWWuFTxS7CGtvvHOQzT/nu
         +igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765406085; x=1766010885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpS6FdvyNb3WW13Qk2KvxYj3K6EpOSC5n3AGtXbRp5s=;
        b=T38EDQXKx2T856H0YnR668QMWfbwNjPX0hEdUvjwKlDwYcPnBiKHWN6zVKVXB0X3X5
         /oRKtkqullNf8DQT16oRd79ZltCltNeCGX8bcE6ZrlRMRssj/9ZKQ4Edu9+yc50DksgT
         d8AlZAI6k2UHFbRRlN8+6YBw3eCqJ3t7ESAUJLCgIUf4ypFah08aNbLiZbOo0I3RyOlq
         KZwhYr+LdY4e6s279MqJY4DM95uur4De9Fe0fWHAUxGXv+eharySlAiAaFwyetOWpPCs
         171Gmklsoi4oHT3eat5N0BwGhnbsdI25BJdf1vJrG1Zvd5OfYstvBqi7r07IDjiaOBTd
         nGeQ==
X-Gm-Message-State: AOJu0YwIsCoUyHjrrdGAlBIGsgc4X4QdhQLQx9oGE51psGYrqEVwJ4u9
	DygJ95nejYsCuia5zHIcfLMnv8zZj9lcA/lvv+r4MX2Vi6fCBdZbLVQrLckAbOSl
X-Gm-Gg: ASbGncvDbuUjbajdnV08N+qLxzkOssAxq+wN+2jpUT5sDSsutcvlrDMY4bKWOFR6YWD
	Y8L06ydiivpkmnEF6EXPxQzMs4MUr6PMKqCg0dkxPoZvT0ncBU7xPL1GSFruqZ9+i7uML+p9P1p
	ea7Fys4omotM4Qego0eqKKMIps4TmsLSkuNCQQlcxsvxVJnMGnrOo3Y0i3iXBA2am2zvgwMXbX3
	SKegnmcA9YUzJPdQoEFBexUD6nKxIgEzBFdCBlYXGF3yH4BHcLyYT6fupgcFGjxsrI/lzxx4+aZ
	rOI6kDtE8nSCUExeuRCddDD+39mAC8Ny0c5c22V34dCW1ERmnUHCMeT4KbwD3wNF2JPY3LT08LJ
	1o+faR0lS0n+54C5Q6cISiqZlIh+HNMSyIUwqvY9bCZJ/3j1eN1tGkyFmNu7/nYVGezXDN57sif
	tdIA6v4OPy0Qrculb3hdB0R5r/3RrcdLOQS6D7ijqHp+KfoZsXhQe+R/EuP/Uny1n14L/4xMjp8
	SbXGYfSyXfyvKTDl3wtdU0OYlPg7Zf+
X-Google-Smtp-Source: AGHT+IHvcw6mYLM7hc2P13njk5rGk5pP/E8uYE+qtM/DzABIi6+z1+1RI5HHWOoliXtTkg+dXfCHdg==
X-Received: by 2002:a05:7022:98c:b0:11f:1e5b:2dd6 with SMTP id a92af1059eb24-11f2ededcdamr10393c88.17.1765406084935;
        Wed, 10 Dec 2025 14:34:44 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b4bb8sm1726654c88.7.2025.12.10.14.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 14:34:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Subject: [meta-oe][PATCH] fd-find: Fix build on riscv32
Date: Wed, 10 Dec 2025 14:34:41 -0800
Message-ID: <20251210223442.851534-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 22:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122579

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...fine-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch | 26 +++++++++++++++++++
 .../fd-find/fd-find_10.3.0.bb                 |  7 ++---
 2 files changed, 30 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/fd-find/fd-find/0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch

diff --git a/meta-oe/recipes-extended/fd-find/fd-find/0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch b/meta-oe/recipes-extended/fd-find/fd-find/0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch
new file mode 100644
index 0000000000..82eac5e1a5
--- /dev/null
+++ b/meta-oe/recipes-extended/fd-find/fd-find/0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch
@@ -0,0 +1,26 @@
+From 7582be50050b36e3275f6d4eacd8eceada8b6afd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Dec 2025 11:58:21 -0800
+Subject: [PATCH] Define ALIGNOF_MAX_ALIGN_T for riscv32
+
+Long double is 16byte aligned on both rv32 and rv64
+
+Upstream-Status: Submitted [https://github.com/tikv/jemallocator/pull/153]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib.rs | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lib.rs b/src/lib.rs
+index 165660e..5f6a2a0 100644
+--- a/src/lib.rs
++++ b/src/lib.rs
+@@ -57,6 +57,7 @@ const ALIGNOF_MAX_ALIGN_T: usize = 8;
+     target_arch = "powerpc64le",
+     target_arch = "loongarch64",
+     target_arch = "mips64",
++    target_arch = "riscv32",
+     target_arch = "riscv64",
+     target_arch = "s390x",
+     target_arch = "sparc64"
diff --git a/meta-oe/recipes-extended/fd-find/fd-find_10.3.0.bb b/meta-oe/recipes-extended/fd-find/fd-find_10.3.0.bb
index 3df88c88b0..3a28009471 100644
--- a/meta-oe/recipes-extended/fd-find/fd-find_10.3.0.bb
+++ b/meta-oe/recipes-extended/fd-find/fd-find_10.3.0.bb
@@ -12,14 +12,15 @@ LIC_FILES_CHKSUM = " \
 "

 SRC_URI = "crate://crates.io/fd-find/${PV};name=fd-find"
+SRC_URI += "file://0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch;patchdir=../tikv-jemallocator-0.6.0"
 SRC_URI[fd-find.sha256sum] = "2fbf004b5bbdefab92e76237e2022c77842cdef5d3213fe09fd804e0474785db"
 S = "${CARGO_VENDORING_DIRECTORY}/fd-find-${PV}"

 inherit cargo cargo-update-recipe-crates

-#Upstream fd-find sets strip = true in [profile.release], which causes Cargo
-#to strip the binary during compilation. This interferes with Yocto’s normal
-#do_package stripping process.By adding the following flag, we ensure that
+#Upstream fd-find sets strip = true in [profile.release], which causes Cargo
+#to strip the binary during compilation. This interferes with Yocto’s normal
+#do_package stripping process.By adding the following flag, we ensure that
 #stripping is handled by Yocto as usual:
 CARGO_BUILD_FLAGS += " --config profile.release.strip=false"


