Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916D3EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 06:31:18 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.15814.1688625077889029804
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jul 2023 23:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PT0lezSE;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7653bd3ff2fso44023185a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 23:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688625077; x=1691217077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gMzFUC8GQwyGvBM/yxOQkBFN9kMfhh5UB52I2JFElLA=;
        b=PT0lezSEicopcjfQ9P5KTAWt+4rA0NB5xO9KZfs9NmlHsIYfBae49SzCVui0WAFldw
         8KnOYKb+J0WYrOJjJTnSIM9r/XVU2dMWyzcz4NgRJJ5/5CA/wlL1dNf/ANepDuZzrB/3
         1RPVXuInbP3AMWAp3GR5jKMh8aiXtMwpDv/MZUsTbW+AqZ5QC5js0MwTnDXDUotJLycV
         mCGcgjPLB6KC0heiH6EQgtC0kaQK29lUbrIfhxxSBX9p9qNP5PpwIjPdOH2pqUgEvTAH
         3nKXJbWgb8aLcO53mhBj69hs1TYELDxQglcczEkA24B/CRa8ix8n7Fb33Ex7c5+XnPcw
         tP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688625077; x=1691217077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMzFUC8GQwyGvBM/yxOQkBFN9kMfhh5UB52I2JFElLA=;
        b=ejwliC5d7ZeBY9+v8/mIXt/7IorhzAvDGddoDq3GXvuJApFP9Iu+HmsAdttreG6OoM
         rXXI2mYMuU75SJO/sezCNiCGMq8q3NSOaLfDkjE5XY589yhfhHw/EIzQqkxehllnr5Py
         60lGgrRtRYiHQ4l8OQXLz9UxvA5MOh/MwdexJPKcGQNEwdeI6KGpf+f1NRRKBp1Mo3Jo
         dAdoqQkMJrZCRgrSPOrxWaYT3dZAKpr7FA6hUoqq5menymsSvf3G7eUx0VqeBr7uFmf2
         TSIsTb7RuuhBjU95ZgTkMgIUQwE+j2tjFw/ug9W5mo8yD6sbOUy99M4pa5++OwOF/ooU
         oktg==
X-Gm-Message-State: ABy/qLZ/RPPqz7KGdJQOqlYKkcRa3q2GbIQR41uH3/n2jrrfxT/MWZqy
	uVz2UlhF4KHe2PkcenKSEPHTLeiKBPs=
X-Google-Smtp-Source: APBJJlH3MwTYbuq3CSEvMiteBy64kYBn/CwztR+qOBquOUdvp/25C95KW0/JWBq/1eAGDCQv8NYA1w==
X-Received: by 2002:a05:620a:3c13:b0:765:aac3:7668 with SMTP id tn19-20020a05620a3c1300b00765aac37668mr735806qkn.71.1688625076601;
        Wed, 05 Jul 2023 23:31:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::81d4])
        by smtp.gmail.com with ESMTPSA id x11-20020a056a00270b00b0068288aaf23esm531909pfv.100.2023.07.05.23.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 23:31:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-grpcio: Fix build on musl
Date: Wed,  5 Jul 2023 23:31:13 -0700
Message-ID: <20230706063114.2784093-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jul 2023 06:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103679

Use off_t instead of deprecated off64_t LFS interface
makes it portable across musl and glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-direct_mmap-Use-off_t-on-linux.patch | 42 +++++++++++++++++++
 .../python/python3-grpcio_1.56.0.bb           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-direct_mmap-Use-off_t-on-linux.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-direct_mmap-Use-off_t-on-linux.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-direct_mmap-Use-off_t-on-linux.patch
new file mode 100644
index 0000000000..49df528d7e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-direct_mmap-Use-off_t-on-linux.patch
@@ -0,0 +1,42 @@
+From 45fdade6c0415ec5af3f9312e6311a4ccc682a7b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 28 Dec 2022 18:24:21 -0800
+Subject: [PATCH] direct_mmap: Use off_t on linux
+
+off64_t is not provided without defining _LARGEFILE64_SOURCE on musl
+this define is not defined automatically like glibc where it gets
+defined when _GNU_SOURCE is defined. Using off_t makes it portable
+across musl/glibc and for using 64bit off_t on glibc 32bit systems
+-D_FILE_OFFSET_BITS=64 can be defined during build via CXXFLAGS
+
+Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/1349]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ absl/base/internal/direct_mmap.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direct_mmap.h
+index 815b8d23..fdf88f0b 100644
+--- a/absl/base/internal/direct_mmap.h
++++ b/absl/base/internal/direct_mmap.h
+@@ -72,7 +72,7 @@ namespace base_internal {
+ // Platform specific logic extracted from
+ // https://chromium.googlesource.com/linux-syscall-support/+/master/linux_syscall_support.h
+ inline void* DirectMmap(void* start, size_t length, int prot, int flags, int fd,
+-                        off64_t offset) noexcept {
++                        off_t offset) noexcept {
+ #if defined(__i386__) || defined(__ARM_ARCH_3__) || defined(__ARM_EABI__) || \
+     defined(__m68k__) || defined(__sh__) ||                                  \
+     (defined(__hppa__) && !defined(__LP64__)) ||                             \
+@@ -102,7 +102,7 @@ inline void* DirectMmap(void* start, size_t length, int prot, int flags, int fd,
+ #else
+   return reinterpret_cast<void*>(
+       syscall(SYS_mmap2, start, length, prot, flags, fd,
+-              static_cast<off_t>(offset / pagesize)));
++              offset / pagesize));
+ #endif
+ #elif defined(__s390x__)
+   // On s390x, mmap() arguments are passed in memory.
+-- 
+2.39.0
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb
index 33c13b0a01..fc871adec4 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.56.0.bb
@@ -11,6 +11,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://0001-Include-missing-cstdint-header.patch \
                                 file://abseil-ppc-fixes.patch;patchdir=third_party/abseil-cpp \
+                                file://0001-direct_mmap-Use-off_t-on-linux.patch;patchdir=third_party/abseil-cpp \
                                 file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
 "
 SRC_URI[sha256sum] = "4c08ee21b3d10315b8dc26f6c13917b20ed574cdbed2d2d80c53d5508fdcc0f2"
-- 
2.41.0


