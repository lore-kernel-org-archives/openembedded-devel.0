Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5643C3DA7C
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 02:31:18 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.197717.1672281074541118208
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Dec 2022 18:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qvpdpXAb;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso21681975pjt.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Dec 2022 18:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8HreB7zJd2ll07MfCZUVfjn6twQEZquqzxWWGiGR8s0=;
        b=qvpdpXAbK0+io9IOS1RBZrDmaib2r5CYpj2QDQlGsNrR3mOYHgMW2vyDKWZhkkOsHs
         VYStvPkX/kAyNf7LrgBdx72Vo+dhdPqc2uQ5aLpgXQwIt7gxusZfWsdA66o2pe9eumrl
         c1+M7z+B22i1Wfu1SFl4LoXJgnHoYudeydcEyacRC2KmLZuQTEslDlNAcCR2AKxvhnQc
         rzFBMa0wpjuuQOiLq3AdkHcI7nF64jep3Mtt5RFGhur5CA1h/k0nSmO0xQMAY3pU4k9B
         DK4cUEX2ppXKBynx3FWsR6jf/8Vq6O5SORLx5ztH6WqmcAKYk26rBIAOBciqSg+B9rMC
         9g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8HreB7zJd2ll07MfCZUVfjn6twQEZquqzxWWGiGR8s0=;
        b=ssmbZcDt89rGd5Y+WL3DUde/cC0Bn5Un9oMlm0x/+XYVd/KfPsUnEaU7KFRymJlHbM
         nZoHxsGOx8/6t3oXAXH7zZ4sWg7Yeyowgce5LEWkqDC/BZca0KTBu7xAn0wk9nL7Q93T
         q1Z7rZrbZ6I/fqG98bp5CxjX5X7+tKB3oj1eTc2WPIX2BZ1ECcigiJ5mJHrNeSK0QmVw
         N5Hpj06h9NmqNadlVUr9X74tk7TeIpIrCyZWsYHQ7xBg9fV8ZHCyCUBPExsfrCCw0xHx
         yQLauGqcFws5BiLv8D8BsI5ymLU2MxK1+/7TWDBRvKXN6hmxrbeLg4woy8ahQUURzr7U
         h76A==
X-Gm-Message-State: AFqh2kqro3Z9G/xS7S57pEHjD7lhxsYsz/gb4bOZgib5cSgCIqQxJb+v
	10fin0+HzPaCFBsi3cDYa81YYw3AX00=
X-Google-Smtp-Source: AMrXdXv/e69O4mfxrGX8ICJHMP8PtTwTUtujNQNEHwXc85DxJY1qkLNsOFEkFlG/+PxUUe8GOS7SYA==
X-Received: by 2002:a17:902:e74c:b0:189:dd98:b96b with SMTP id p12-20020a170902e74c00b00189dd98b96bmr41739998plf.22.1672281073518;
        Wed, 28 Dec 2022 18:31:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902ce8c00b001896522a23bsm11736752plg.39.2022.12.28.18.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 18:31:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] abseil-cpp: Replace off64_t with off_t
Date: Wed, 28 Dec 2022 18:31:10 -0800
Message-Id: <20221229023110.3853852-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Dec 2022 02:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100295

Fixes

TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-musleabi/abseil-cpp/20221014.0-r0/git/absl/base/internal/direct_mmap.h:71:25: error: unknown type name 'off64_t'; did you mean 'off_t'?
                        off64_t offset) noexcept {
                        ^~~~~~~
                        off_t

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-direct_mmap-Use-off_t-on-linux.patch | 42 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_git.bb              |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-direct_mmap-Use-off_t-on-linux.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-direct_mmap-Use-off_t-on-linux.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-direct_mmap-Use-off_t-on-linux.patch
new file mode 100644
index 0000000000..49df528d7e
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-direct_mmap-Use-off_t-on-linux.patch
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
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 9f8c48cfa4..f7f8fc848e 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            file://0003-Remove-neon-option-from-cross-compilation.patch \
+           file://0001-direct_mmap-Use-off_t-on-linux.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.39.0


