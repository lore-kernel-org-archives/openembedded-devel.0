Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.1898.1588224716043314945
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 22:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LCSX/z2j;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d184so2366586pfd.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2020 22:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+r08S7Zx3SRc7tTFkeuEgw08BYA13PS7K1fpnlvnATY=;
        b=LCSX/z2jiMYow0McPQ2Bkh+fmjB9nZsxtgmJ1qgDPTX+2dKCeo+M+UtC8EAPKJXO7a
         FoVYpZkYlR9HASPYK9lsoBc0akXktErTCJG5f+droE18oZ+WGsEtdcXqg7CAwumbsxEC
         p/ZXr72ge9kP8X+30ciAq5HICPUbayKIPqmgDNtSoWavKs+VFvxy1tgstQR+m4lFtbpk
         YyMysxXomH449iLF0HZn7gF/m/XECDza+wxQkdW/YTnT9MkIRfTbSrCg/ygpdhjFdgsn
         XiZLRy6LP9gOgK7BE+iMrtL8GZlnz4bhmkuUDgGdCDf3jGRhmS4Nw2w2J4coZAANv8p9
         /oyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+r08S7Zx3SRc7tTFkeuEgw08BYA13PS7K1fpnlvnATY=;
        b=iplxN2J8nI8Yya8Ao0U1Iyx34ep1MM5ZF0T3V+VuxYqk/APTSPxb4nOz8h/tkKSJVp
         gniXmlXwX1bcEnIYzcYeghYKWI/n2MJ6/icqcnK5k6h2yz5o3jTWu59oKUzr28CEzpTU
         sC62q3XKpvoJMgCfaXXQVzLdDJTNE0OzGW/HGRKN9zD/snICIt3JP5ttzf6EAFwWn+Ce
         FLXWUdMcdQopc3/yWbuF2JZogtN0USryJrMQg6lH3JYJRWIx89Eyhhjxsj7Cyly6w2jB
         PX1kyFM5OjcT104CSgeogjjCbii0ZsjF2CsCvZGf5L3LGHEntiDcq2gprpEym8E+FOAM
         GDfw==
X-Gm-Message-State: AGi0PuYa2glp0rIh8lF2mrxgne6apXFg7AaV6G/6uGW1VPtlzBhYsAs8
	qr3pLjng6jUhZ1IZl7HBBCgsWlqHaus=
X-Google-Smtp-Source: APiQypKYfqPEmTVJCD9ZPrCLlq0p0XaIgOkpVEb7ck7EFQen9rD/IbPRNQhkMDTCNzHDYKnFMe88ow==
X-Received: by 2002:aa7:84c5:: with SMTP id x5mr1837618pfn.277.1588224715116;
        Wed, 29 Apr 2020 22:31:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e11c])
        by smtp.gmail.com with ESMTPSA id v26sm2418780pfe.121.2020.04.29.22.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 22:31:54 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/6] python3-grpcio: Fix build with riscv32
Date: Wed, 29 Apr 2020 22:31:47 -0700
Message-Id: <20200430053149.226494-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430053149.226494-1-raj.khem@gmail.com>
References: <20200430053149.226494-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure libseil-cpp can build for rv32 and boringssl riscv patch
considers rv32 separate from rv64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-on-riscv32.patch           | 65 +++++++++++++++++++
 .../python3-grpcio/riscv64_support.patch      | 13 ++--
 .../python/python3-grpcio_1.27.1.bb           |  1 +
 3 files changed, 75 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch
new file mode 100644
index 0000000000..920fc1169d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch
@@ -0,0 +1,65 @@
+From 04e28fdda03b545a0f7b446a784ec2fa7249cbb8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 29 Apr 2020 15:37:40 -0700
+Subject: [PATCH] Fix build on riscv32
+
+Define __NR_mmap in terms of __NR_mmap2 and __NR_futex interms of
+__NR_futex_time64 for rv32, since there calls dont exist for rv32
+
+Also recognise rv32 as a new 32bit platform
+
+Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/675]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ absl/base/internal/direct_mmap.h        | 5 +++++
+ absl/base/internal/spinlock_linux.inc   | 4 ++++
+ absl/synchronization/internal/waiter.cc | 4 ++++
+ 3 files changed, 13 insertions(+)
+
+--- a/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
++++ b/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
+@@ -26,6 +26,10 @@
+ 
+ #ifdef __linux__
+ 
++#if !defined(__NR_mmap) && defined(__riscv) && __riscv_xlen == 32
++# define __NR_mmap __NR_mmap2
++#endif
++
+ #include <sys/types.h>
+ #ifdef __BIONIC__
+ #include <sys/syscall.h>
+@@ -72,6 +76,7 @@ inline void* DirectMmap(void* start, siz
+ #if defined(__i386__) || defined(__ARM_ARCH_3__) || defined(__ARM_EABI__) || \
+     (defined(__mips__) && _MIPS_SIM == _MIPS_SIM_ABI32) ||                   \
+     (defined(__PPC__) && !defined(__PPC64__)) ||                             \
++    (defined(__riscv) && __riscv_xlen == 32)  ||                             \
+     (defined(__s390__) && !defined(__s390x__))
+   // On these architectures, implement mmap with mmap2.
+   static int pagesize = 0;
+--- a/third_party/abseil-cpp/absl/base/internal/spinlock_linux.inc
++++ b/third_party/abseil-cpp/absl/base/internal/spinlock_linux.inc
+@@ -14,6 +14,10 @@
+ //
+ // This file is a Linux-specific part of spinlock_wait.cc
+ 
++#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen == 32
++# define __NR_futex __NR_futex_time64
++#endif
++
+ #include <linux/futex.h>
+ #include <sys/syscall.h>
+ #include <unistd.h>
+--- a/third_party/abseil-cpp/absl/synchronization/internal/waiter.cc
++++ b/third_party/abseil-cpp/absl/synchronization/internal/waiter.cc
+@@ -24,6 +24,10 @@
+ #include <unistd.h>
+ #endif
+ 
++#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen == 32
++# define __NR_futex __NR_futex_time64
++#endif
++
+ #ifdef __linux__
+ #include <linux/futex.h>
+ #include <sys/syscall.h>
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
index b55d50bde5..8c9ffa21b7 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
@@ -4,13 +4,18 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/third_party/boringssl/include/openssl/base.h
 +++ b/third_party/boringssl/include/openssl/base.h
-@@ -108,6 +108,9 @@ extern "C" {
+@@ -108,6 +108,14 @@ extern "C" {
  #elif defined(__mips__) && defined(__LP64__)
  #define OPENSSL_64_BIT
  #define OPENSSL_MIPS64
-+#elif defined(__riscv) && defined(__riscv_xlen)
-+#define OPENSSL_64_BIT
-+#define OPENSSL_RISCV64
++#elif defined(__riscv)
++# if (__riscv_xlen == 64)
++#  define OPENSSL_64_BIT
++#  define OPENSSL_RISCV64
++# elif(__riscv_xlen == 32)
++#  define OPENSSL_32_BIT
++#  define OPENSSL_RISCV32
++# endif
  #elif defined(__pnacl__)
  #define OPENSSL_32_BIT
  #define OPENSSL_PNACL
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
index 83d3671016..129bb35bcc 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
@@ -9,6 +9,7 @@ DEPENDS += "${PYTHON_PN}-protobuf"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 SRC_URI_append_class-target = " file://ppc-boringssl-support.patch \
                                 file://riscv64_support.patch \
+                                file://0001-Fix-build-on-riscv32.patch \
 "
 SRC_URI[md5sum] = "ccaf4e7eb4f031d926fb80035d193b98"
 SRC_URI[sha256sum] = "a899725d34769a498ecd3be154021c4368dd22bdc69473f6ec46779696f626c4"
-- 
2.26.2

