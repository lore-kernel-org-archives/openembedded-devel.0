Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01276EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 21:34:45 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.6622.1688765681895885432
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jul 2023 14:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=V5RnMkBp;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b89600a37fso12852925ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 14:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688765681; x=1691357681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2VuTPqFhIVFdAoiEn9rm/bMakMhYvkdTtst3M7LqUCY=;
        b=V5RnMkBpuzZelwElm4P6x1q4owGhzSJRv35Csih01I9XNQDspphMY7VIlTz1KuZSwD
         83BeDdBf7K0zPAG1+yp/jy4vGc5WemfyLoqNbu2zGUf2IHRuB9VB2Rnoh5S0HllUEBrH
         yEK0gC4c4SDVRQrgOswyB3rOtZZX/XpLYYUJXIhgYw4KDOPzjqQpv94MyZYVXy4XNLZt
         JIWU1XRkVSSlLbQOPrQhqrS/qrGg2HxMDSqmKpIQvfT+AmVeBzBKz1dhcB33eMeylION
         KumZmreZtZkZdsQieaMUCU8whlGc2X7Z1OIxD57FfSwjki2tXqoXMf48HKKBnYyMDzpZ
         jk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688765681; x=1691357681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VuTPqFhIVFdAoiEn9rm/bMakMhYvkdTtst3M7LqUCY=;
        b=kguOCgAvvEj/iQlDK9DkaZaDQyFfI4OA6nvd5qMxiI9vgsZIgI0GnM+hOTTxs68OnH
         qHTJ16USsG7VlgH6kGCgt1brAM1kO78U8f12Bemx7/8i5xwVMabIuk5ydwChE6Pa92T1
         qTaofAKJFLvawvQu5e1lA8AkIWxUbkVJUol8RVxFrfduHHUamZZKQEWt5ZaIA3E+X7Xd
         yfQ1xMd10xN9yDzYytajXDIFMnQcWgS3UJd+qReYjAALQZnb7RxXjJg12VUL4MOsTsOm
         Vr0RtddOx1OWgOuaHAM+85oYtR+W0wGzYlIRHbeqJzsQFATY18s4O158JRN0XcrFh6P/
         CT2w==
X-Gm-Message-State: ABy/qLbtauMan4HarRQfJWntdCwYjuV8Vt+0UtjttKJO4IeLhhI/Hawe
	T5ZsSuHVDri4mjNxZv0uPTAVwzGB5GY=
X-Google-Smtp-Source: APBJJlEEhdRljHy4/LUYuV3zJLEmbvRDsH3g17wZ/FAdt8/BbAALiaxGbdkqlN5pwLmK9RnYgmCZxQ==
X-Received: by 2002:a17:902:b494:b0:1b6:771a:3516 with SMTP id y20-20020a170902b49400b001b6771a3516mr4651963plr.22.1688765680735;
        Fri, 07 Jul 2023 14:34:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::2823])
        by smtp.gmail.com with ESMTPSA id x19-20020a170902821300b001b23eb0b4bbsm3689687pln.147.2023.07.07.14.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 14:34:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-grpcio-tools: Fix build with musl
Date: Fri,  7 Jul 2023 14:34:37 -0700
Message-ID: <20230707213438.4112432-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 21:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103715

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-direct_mmap-Use-off_t-on-linux.patch | 37 +++++++++++++++++++
 .../python/python3-grpcio-tools_1.56.0.bb     |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools/0001-direct_mmap-Use-off_t-on-linux.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-direct_mmap-Use-off_t-on-linux.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-direct_mmap-Use-off_t-on-linux.patch
new file mode 100644
index 0000000000..9b3e5d4a5f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-direct_mmap-Use-off_t-on-linux.patch
@@ -0,0 +1,37 @@
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
+--- a/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
++++ b/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
+@@ -72,7 +72,7 @@ namespace base_internal {
+ // Platform specific logic extracted from
+ // https://chromium.googlesource.com/linux-syscall-support/+/master/linux_syscall_support.h
+ inline void* DirectMmap(void* start, size_t length, int prot, int flags, int fd,
+-                        off64_t offset) noexcept {
++                        off_t offset) noexcept {
+ #if defined(__i386__) || defined(__ARM_ARCH_3__) || defined(__ARM_EABI__) || \
+     defined(__m68k__) || defined(__sh__) ||                                  \
+     (defined(__hppa__) && !defined(__LP64__)) ||                             \
+@@ -102,7 +102,7 @@ inline void* DirectMmap(void* start, siz
+ #else
+   return reinterpret_cast<void*>(
+       syscall(SYS_mmap2, start, length, prot, flags, fd,
+-              static_cast<off_t>(offset / pagesize)));
++              offset / pagesize));
+ #endif
+ #elif defined(__s390x__)
+   // On s390x, mmap() arguments are passed in memory.
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb
index eb1994d7ce..8fbe1fa91f 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb
@@ -11,6 +11,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
+            file://0001-direct_mmap-Use-off_t-on-linux.patch \
             "
 SRC_URI[sha256sum] = "39f5877cea514b3da9f2683dfb3ffb45ef47b05f4ff39c287d7d61c5057f48b8"
 
-- 
2.41.0


