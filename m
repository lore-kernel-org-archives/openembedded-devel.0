Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.942.1618866286383930979
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 14:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qwFDvhbl;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so19254368pjv.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Apr 2021 14:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uZGqllAf0bH3aOsOYX63f39YDBPIyxcQzHo3No0m5Jw=;
        b=qwFDvhblDJrFoGBcpFcN51FXkAUh577QOwXUgUr3cps2IjGaVYaN1tF5543HoJD/8F
         pKTQiiueN4OvBRJIFo61myBr+sLU1OGcHjyGh6lIQC9KQtS5S4EDdVkquDc1G6ZdRlaY
         EyQr5m5yk7HqrUsptRuBV9NkX8Vvj/w4jXHt91E8f7ziz+2cPLnLcXlGg0NV4pIe0igt
         8wO2nT2CAUj1Zp1O9/fmISb2aIIk475bWt56LhIpmDpmR8pkvpdnhsfOMyizH1G0826j
         iaiWp4faO2sQnvsdPuwSDTY2TnC7ER5ZWIGSPXv0dUCL0+CJdSdD3K/Yhjp1ngJry6Pv
         yHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uZGqllAf0bH3aOsOYX63f39YDBPIyxcQzHo3No0m5Jw=;
        b=XvfiQJJE/1s3IovE5cKMH2L655I8GhZ/MkoK+FkLwgmuXE4hV4t1jYqn3K8L6pQYFN
         eIh5S+jkewKCx2mDJKg/NhjFRZVI2siB/OLnZtyUVE6+bC6+g3FdahBjAxbpl/IpTlHb
         EUR7LoOdzm2ZOj46wUKVQERGMU1g+Vp0IFUFQpUazTMCH31MQW30mTHTev14Ca7ClFj0
         2GerY3ADq+32DnZy1QbZ8EUayB1OL0hqt0+yne340JOAQFtzn2TCttmpVo1hzYL7la48
         OoiCgG7SS0uiItqzYlBwUjI7cDzse00rgs4A1fn1MpVNwdtg6SGVyTPSopHNljClDgHp
         tpjQ==
X-Gm-Message-State: AOAM531wZrT0PdVaoH+UIyK/pbCMT6NcDHqJQwcwvg7dAVdnOaB1Bi1J
	uCqeLMsnAMHSa0nqw+dOQciwc3cpNLtFHg==
X-Google-Smtp-Source: ABdhPJxLnIWukpPrPm68XdrUZsH3hFU2VvHidd3/j1PMKcIQHCxbCvxEmp60Gvwph+rMVxQ6rejN8Q==
X-Received: by 2002:a17:90a:6b4f:: with SMTP id x15mr1047135pjl.227.1618866285690;
        Mon, 19 Apr 2021 14:04:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id b7sm305439pjq.36.2021.04.19.14.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 14:04:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v3 4/4] nodejs: Fix build on mips
Date: Mon, 19 Apr 2021 14:04:40 -0700
Message-Id: <20210419210440.2446040-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419210440.2446040-1-raj.khem@gmail.com>
References: <20210419210440.2446040-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2G is too much for qemu-mips and perhaps also for real mips devices
as we use qemu-usermode during build to run host pieces like mksnapshot
they fail,  reducing the allocation range helps

Fixes
|   LD_LIBRARY_PATH=/mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux/nodejs/14.16.1-r0/node-v14.16.1/out/Release/lib.host:/mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux/nodejs/14.16.1-r0/node-v14.16.1
/out/Release/lib.target:$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd ../tools/v8_gypfiles; mkdir -p /mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux/nodejs/14.16.1-r0/node-v14.16.1/out/Release/obj.target/v
8_snapshot/geni; "/mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux/nodejs/14.16.1-r0/node-v14.16.1/out/Release/v8-qemu-wrapper.sh" "/mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux/nodejs/14.16.1-r0/nod
e-v14.16.1/out/Release/mksnapshot" --turbo_instruction_scheduling "--target_os=linux" "--target_arch=mips" --startup_src "/mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux/nodejs/14.16.1-r0/node-v14.16.1/ou
t/Release/obj.target/v8_snapshot/geni/snapshot.cc" --embedded_variant Default --embedded_src "/mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux/nodejs/14.16.1-r0/node-v14.16.1/out/Release/obj.target/v8_snap
shot/geni/embedded.S" --no-native-code-counters
|
| #
| # Fatal process OOM in CodeRange setup: allocate virtual memory
| #
|
| /mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux/nodejs/14.16.1-r0/node-v14.16.1/out/Release/v8-qemu-wrapper.sh: line 7: 2292880 Trace/breakpoint trap   (core dumped) PSEUDO_UNLOAD=1 qemu-mips -r 3.2.0 -

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nodejs/nodejs/mips-less-memory.patch      | 32 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_14.16.1.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch b/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
new file mode 100644
index 0000000000..56e93c50cf
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
@@ -0,0 +1,32 @@
+Description: mksnapshot uses too much memory on 32-bit mipsel
+Author: Jérémy Lal <kapouer@melix.org>
+Last-Update: 2020-06-03
+Forwarded: https://bugs.chromium.org/p/v8/issues/detail?id=10586
+
+This ensures that we reserve 500M instead of 2G range for codegen
+ensures that qemu-mips can allocate such large ranges
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/deps/v8/src/common/globals.h
++++ b/deps/v8/src/common/globals.h
+@@ -224,7 +224,7 @@ constexpr size_t kMinimumCodeRangeSize =
+ constexpr size_t kMinExpectedOSPageSize = 64 * KB;  // OS page on PPC Linux
+ #elif V8_TARGET_ARCH_MIPS
+ constexpr bool kPlatformRequiresCodeRange = false;
+-constexpr size_t kMaximalCodeRangeSize = 2048LL * MB;
++constexpr size_t kMaximalCodeRangeSize = 512 * MB;
+ constexpr size_t kMinimumCodeRangeSize = 0 * MB;
+ constexpr size_t kMinExpectedOSPageSize = 4 * KB;  // OS page.
+ #else
+--- a/deps/v8/src/codegen/mips/constants-mips.h
++++ b/deps/v8/src/codegen/mips/constants-mips.h
+@@ -140,7 +140,7 @@ const uint32_t kLeastSignificantByteInIn
+ namespace v8 {
+ namespace internal {
+ 
+-constexpr size_t kMaxPCRelativeCodeRangeInMB = 4096;
++constexpr size_t kMaxPCRelativeCodeRangeInMB = 1024;
+ 
+ // -----------------------------------------------------------------------------
+ // Registers and FPURegisters.
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
index aef83cc31c..9580ef6383 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.16.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://big-endian.patch \
            file://mips-warnings.patch \
            file://v8-call-new-ListFormatter-createInstance.patch \
+           file://mips-less-memory.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
-- 
2.31.1

