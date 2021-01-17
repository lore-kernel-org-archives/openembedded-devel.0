Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.21307.1610905614440053652
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aNzXGb3s;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id c12so8810371pfo.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xqEruv0Dgc+8hPcp6oLg59tEPIf+rhFT7TgcwWhiFbM=;
        b=aNzXGb3s6Vh/6Hofe52M6uG0612flAyM6zZOODmqi3Ro+dHaQCDtgi6nGPryp3IGoX
         nosmzGfXUjdCjbYS2R0Yyi0x6dpLj5Xl4M7mSh3RZKIDEajCAblZnakSPXXujQUBkcQB
         tjJ18pP+aNuX2Q7zxlJkTbajXDrr5yFhKBP3wx7ZiSb9XhO/k6pEvQisi+G+gCv3hpIL
         gDoo8aZgFB0N1eY5SBAKJ4LwcMpxjU0T7u9+0hWRAR/p//308FMqzJP/E/bIbg+/wQui
         VvYkN7T0p3FINhb63UzxwsX2CSWSJZtOgTBEwkzWl2meB4rHnMnsgY7TExBpE2QvS5gH
         KNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xqEruv0Dgc+8hPcp6oLg59tEPIf+rhFT7TgcwWhiFbM=;
        b=noDJrgKpiXapxjC/wQGJA2ZK9auChofJgd7sxVNtV798n0F624gZ4z3HMD6K6ya8PK
         TomGZtxdhGn1JJooXS009m4LDQliYdGfTGntMA+j3R4uZV4BcaZB524LWrqD0625xwRY
         jodn3c5HJODQ60VrG6/ZBS6a5pJiqhnaj+BrIlGixRNboIVMg+7D4eJDHcG/Eij8RDqg
         uCq+wTzYhdN6bDU73sldSQlKjPe/2hXuHNzddCyzp1U86+5hu0P2dwHriMWfVO91bE0v
         ZHdqAX9gyzZKSHnfgROBfuxbWHhivZuxMTqAKlfpd1sg8QK4bRhhIk4/O7Q03tUo1G+b
         qlnw==
X-Gm-Message-State: AOAM531QDk0aSM4UDTZQYGj5kGs10TuMebb6NhdsPSGg4kOZwjJE72JD
	lan1jiaPre5gfyO7XLLTCh7lhmyNVG366g==
X-Google-Smtp-Source: ABdhPJwBP5lDihKGOVX0ibxk5NOlDMjpkPuB4YvSFQkYGTtCX97tDCLpgq90Hkn4B9naDVPC6P+vQw==
X-Received: by 2002:a63:b4a:: with SMTP id a10mr22026647pgl.112.1610905613848;
        Sun, 17 Jan 2021 09:46:53 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:53 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 22/28] nodejs: Fix arm32/thumb builds with clang
Date: Sun, 17 Jan 2021 09:46:20 -0800
Message-Id: <00cf8917dc2a3c76ab7ec73a82c00ff079ddddbc.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Backport a patch from upstream to take care of build failure e.g.

| ../deps/v8/src/codegen/arm/cpu-arm.cc:38:16: error: write to reserved register 'R7'
|   asm volatile("svc 0\n"
|                ^
| 1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 45a2dfdd0f16ed6941926e2dca1ad90f36e120bc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.17.1

