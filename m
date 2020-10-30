Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web09.17495.1604079099117482223
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2020 10:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dzKz4uPt;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id b19so3295475pld.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FUVp3lH8g6P2x5XO2sM2uFzeDJBxqj5GsA/C8r/BwsE=;
        b=dzKz4uPtkFR5u+KGvXgaSHXKqHsLVEirIIOlNyHKp/NRtzXdKc6wciLESHn9wHIHy4
         VjNCaWfxKHiCm5bTARlv0MwLaVfab2KjnfqOzGDCXD6CttqWXZkBvaIiTbuP/hyL6F4U
         ylBjtlg03m3L73/C8Z189hyoAGw9HiAtHpCyAlvejDveeEcAkMVLRY+8mzgeJTEAho3S
         fTkQSq6VMxUemioXOygrZRBm7cY2ejpIs4N/eTxOYOrc7H5sVcHGVbN6+hTWqaUHqLwq
         BAlF3rkciNpq4Rt8h4esgMu8MEJxrPLBRzWtxlhFAmLYx/w9kxac4x4NiuI2Zo+FVTCI
         1zpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FUVp3lH8g6P2x5XO2sM2uFzeDJBxqj5GsA/C8r/BwsE=;
        b=V9J02m8hvkv0/B3HrfGLjchYzVh2V4irJA4N29edZ5P/TBmCroEXKurCA2JphWAlAP
         W1dgShjcRYjTVVv98R8/g+lcZU3UQdL7sgEWok3zi32Up0CZ+3IdZlLI2GEogV827whI
         +5Wco2OL/U2YbecccyNXYkc3JirP7FkS8F2ugyj1DY/Plb8qfHr4XWG7LZ1858Z/uPzH
         ncyjOqz+MDVJC1r+dsTT3M7FZmJiHybsA0JMTLLlPobiKMTlwX2utnMQUwfYjMx6fcsd
         H1lKtp20/UhySAX5YYWZomdG9tDXxanu7vpdZX1qQEyiCWs1e1qVluHqhZAAFHDBikTn
         jo9w==
X-Gm-Message-State: AOAM5305NAmEDVhaDB+UhTrPE5aOPOeUtdnmx42en/8ZqIwuGJt/n93k
	JsC/GNauuVD2/idDzcwgmsKX0ayt39/vng==
X-Google-Smtp-Source: ABdhPJz6SffkIW9on3r9rOLn7uuvhIWStgc2fCS8bawvc05WUBI7w+b+5qobcevJf96L3K8+fepcTA==
X-Received: by 2002:a17:902:a70a:b029:d3:b4d2:32c3 with SMTP id w10-20020a170902a70ab02900d3b4d232c3mr10000515plq.66.1604079098309;
        Fri, 30 Oct 2020 10:31:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4874])
        by smtp.gmail.com with ESMTPSA id mp13sm3985025pjb.36.2020.10.30.10.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 10:31:37 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] nodejs: Fix arm32/thumb builds with clang
Date: Fri, 30 Oct 2020 10:31:34 -0700
Message-Id: <20201030173135.800026-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport a patch from upstream to take care of build failure e.g.

| ../deps/v8/src/codegen/arm/cpu-arm.cc:38:16: error: write to reserved register 'R7'
|   asm volatile("svc 0\n"
|                ^
| 1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...gister-r7-because-llvm-now-issues-an.patch | 53 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_12.18.3.bb |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch
new file mode 100644
index 0000000000..a23f1c243e
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch
@@ -0,0 +1,53 @@
+From be8d3cd6eab4b8f9849133060abb1aba4400276b Mon Sep 17 00:00:00 2001
+From: Amy Huang <akhuang@google.com>
+Date: Thu, 23 Apr 2020 11:25:53 -0700
+Subject: [PATCH] Remove use of register r7 because llvm now issues an error
+ when "r7" is used (starting in commit d85b3877)
+
+Bug: chromium:1073270
+Change-Id: I7ec8112f170b98d2edaf92bc9341e738f8de07a3
+Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/2163435
+Reviewed-by: Nico Weber <thakis@chromium.org>
+Reviewed-by: Ross McIlroy <rmcilroy@chromium.org>
+Commit-Queue: Nico Weber <thakis@chromium.org>
+Cr-Commit-Position: refs/heads/master@{#67371}
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Backport [https://chromium.googlesource.com/v8/v8/+/00604cd2806b5d26bef592dd19989a234bd07a4b%5E%21/]
+ deps/v8/src/codegen/arm/cpu-arm.cc | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/deps/v8/src/codegen/arm/cpu-arm.cc b/deps/v8/src/codegen/arm/cpu-arm.cc
+index 868f360..654d68f 100644
+--- a/deps/v8/src/codegen/arm/cpu-arm.cc
++++ b/deps/v8/src/codegen/arm/cpu-arm.cc
+@@ -30,18 +30,6 @@ V8_NOINLINE void CpuFeatures::FlushICache(void* start, size_t size) {
+   register uint32_t end asm("r1") = beg + size;
+   register uint32_t flg asm("r2") = 0;
+ 
+-#ifdef __clang__
+-  // This variant of the asm avoids a constant pool entry, which can be
+-  // problematic when LTO'ing. It is also slightly shorter.
+-  register uint32_t scno asm("r7") = __ARM_NR_cacheflush;
+-
+-  asm volatile("svc 0\n"
+-               :
+-               : "r"(beg), "r"(end), "r"(flg), "r"(scno)
+-               : "memory");
+-#else
+-  // Use a different variant of the asm with GCC because some versions doesn't
+-  // support r7 as an asm input.
+   asm volatile(
+       // This assembly works for both ARM and Thumb targets.
+ 
+@@ -59,7 +47,6 @@ V8_NOINLINE void CpuFeatures::FlushICache(void* start, size_t size) {
+       : "r"(beg), "r"(end), "r"(flg), [scno] "i"(__ARM_NR_cacheflush)
+       : "memory");
+ #endif
+-#endif
+ #endif  // !USE_SIMULATOR
+ }
+ 
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.18.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.18.3.bb
index 8a9f32bce2..7d8fd1db94 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.18.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.18.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://big-endian.patch \
            file://mips-warnings.patch \
+           file://0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
-- 
2.29.2

