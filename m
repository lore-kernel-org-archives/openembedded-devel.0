Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.1890.1588224714093475615
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 22:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=veYPHhSp;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id u22so1823997plq.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2020 22:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=guspmUMIc311whenEl/lx4wYyz326OdiU2cfUMCSb2Q=;
        b=veYPHhSp4M4HdQFe4loYUwgmmG0c1EB07Oo+4+n7Hh/6CIo8wyByOovYCIhDzwrn1o
         Tkw/xWd9JmnfnmQjM502CdR0EXcWf6dpeT5u8YYTPs1huztfXQuSRLOPC5JM3+VEg9VK
         ReiGomx8szjx1xNM7yfPu/HO9VKWPrh7IXDJCkxch+BkqGoDFUr8dZw88hAxx54b7Bvc
         Ma/j7E449o4pINCjeBmMazzIrdNeV6UvNgEbtPO1cC0CzoSNMwfNOtrQm5JGIz64MHLH
         dBE/cBS1PLJQQzkC+/u5cx6zgU+Zy1ViD0jziic+E/FuninLr1B4bHbBoz/5S6C9UfiY
         Ca0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=guspmUMIc311whenEl/lx4wYyz326OdiU2cfUMCSb2Q=;
        b=YZJz2Hvv8HRC1JZdOq5ucut17g7u0J9LqvQRO+wraBwg8FRbzrgHVEeXj4m7w1wJUm
         UxrUDZPQxtBzDhBNcIOsBSJ/H92HAcGV57feFzQT04pI2FVIuH+tHjpaixtw3WmqSex7
         yzDlN+mdFi+N+IzsxXMLa05ORFSw8/tYUah7WdwE/7peH8vRajJ9dkWKYUPKelt9nJBW
         TJTzZJEhniepWxJykjFUSMHNtY8jsFwxAJyo/lQRN5ff80staqkh/P98IDhdYO42O2iH
         sjIGzh2uIZ/ynC6s6DnllFy6jWfbzprqZUPOVJqdvZSQf1px0q3H2RGnWEud4vrSKuDi
         ewzg==
X-Gm-Message-State: AGi0PubQ/5e0+aNwJrgvKVvqO5Cop496nzG7KfVDlFUcazjES/Y6MU9U
	lt+xOv9sBBE6QSf5ITIMvfTA56vLOdU=
X-Google-Smtp-Source: APiQypLaJGljhvjVrm5ofJUL4AtCY3k7mC/lp/zs9viRtKJN+l916VEW1UUsHrbBRvjUxkIEn3T9YQ==
X-Received: by 2002:a17:90b:93:: with SMTP id bb19mr1067866pjb.134.1588224713204;
        Wed, 29 Apr 2020 22:31:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e11c])
        by smtp.gmail.com with ESMTPSA id v26sm2418780pfe.121.2020.04.29.22.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 22:31:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/6] abseil-cpp: Fix build on riscv32
Date: Wed, 29 Apr 2020 22:31:45 -0700
Message-Id: <20200430053149.226494-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430053149.226494-1-raj.khem@gmail.com>
References: <20200430053149.226494-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-on-riscv32.patch           | 74 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_git.bb              |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Fix-build-on-riscv32.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Fix-build-on-riscv32.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Fix-build-on-riscv32.patch
new file mode 100644
index 0000000000..e7c9b43c29
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Fix-build-on-riscv32.patch
@@ -0,0 +1,74 @@
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
+diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direct_mmap.h
+index 5618867..90cfeca 100644
+--- a/absl/base/internal/direct_mmap.h
++++ b/absl/base/internal/direct_mmap.h
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
+@@ -72,6 +76,7 @@ inline void* DirectMmap(void* start, size_t length, int prot, int flags, int fd,
+ #if defined(__i386__) || defined(__ARM_ARCH_3__) || defined(__ARM_EABI__) || \
+     (defined(__mips__) && _MIPS_SIM == _MIPS_SIM_ABI32) ||                   \
+     (defined(__PPC__) && !defined(__PPC64__)) ||                             \
++    (defined(__riscv) && __riscv_xlen == 32)  ||                             \
+     (defined(__s390__) && !defined(__s390x__))
+   // On these architectures, implement mmap with mmap2.
+   static int pagesize = 0;
+diff --git a/absl/base/internal/spinlock_linux.inc b/absl/base/internal/spinlock_linux.inc
+index 323edd6..3dca444 100644
+--- a/absl/base/internal/spinlock_linux.inc
++++ b/absl/base/internal/spinlock_linux.inc
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
+diff --git a/absl/synchronization/internal/waiter.cc b/absl/synchronization/internal/waiter.cc
+index 2949f5a..7411042 100644
+--- a/absl/synchronization/internal/waiter.cc
++++ b/absl/synchronization/internal/waiter.cc
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
+-- 
+2.26.2
+
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 9a44133c56..e874e4a5ea 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}                \
            file://0003-Add-fPIC-option.patch                                  \
            file://0001-Add-RISCV-support-to-GetProgramCounter.patch \
            file://0001-absl-always-use-asm-sgidefs.h.patch \
+           file://0001-Fix-build-on-riscv32.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.26.2

