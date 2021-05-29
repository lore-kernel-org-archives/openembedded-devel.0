Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.16428.1622249883315437492
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 May 2021 17:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ucPudP7e;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d78so4495918pfd.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 May 2021 17:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DhjaEn4Ra96ND5gj041kD61klgwEGXQdhjWxDP8gwhw=;
        b=ucPudP7eEMdZp6TyYvAShvsL08EW9594hPU+RAXaV805UVHd6nkP9dzRLaoG1OVcOg
         Lt+44iiZMPyLjLJg7sY0hfIT7vwNVv/kUBF4+ohdHWnY1kurb6eza0LTMRCWpKR0tgeF
         Mk5v+EISIa91wRYY7zxDCcV9uPMG6FfdEblM5/WZkQ6eyps+itZRT0MDfSAnMaBLvWgl
         p+wMBR2pLjlXaiUpxQ8bP8X2OBKLq6KDBU5oAILW9jePHH2+zmJLdTTQb6PnYa+de4IK
         B0FVQxMCxXiL+b3X28XBd5kMc1DU2aSMx0N97VU2xdGh2ZAHEUkvwphvAI140hML+wa3
         rjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DhjaEn4Ra96ND5gj041kD61klgwEGXQdhjWxDP8gwhw=;
        b=i+p/4ydJThPZmJWHu/eEdxeUN1EP+xAKaA3OZTr26OqkHT9f1sEIVeqOLknS31GtiE
         24RY75TYw+ZGJbBZ6FE1lQVcmST7L12IVmAZpLWqq8Fb0vzZu8MGeCXvRWh4tfHTn7BX
         3fGhDeDfFcDipOBgzqKxp7oNSMKgJaFjuHERlqTPGZixfRZeV68FagUgEi3FNhZQ8m+k
         aGuBNvqM3CBcueoYe087934qslS9hhtKu6ceakTTwuRf+X8G22ujbSzwqwxH22fPTq9H
         V+anCBcdBR/AWmwCVzuooQtnf/Duz3042GpB2mu3TsVVf8AH6YSF3vgeLd+45vhst4rw
         s3BA==
X-Gm-Message-State: AOAM533YUw61S1NWdsUgSMxuMXB8fWAGnq+oLKskJWJe+D69NhRV44C4
	JlGmlUTVgCfXahPrzIG4gve7pmhN7TGp0g==
X-Google-Smtp-Source: ABdhPJyubkz6VMbpSzn4aBSrCJQneEO+tDbVdqfmwKGvscKjUCPxTXrxSouhVL526wPcrybXRSAynw==
X-Received: by 2002:a05:6a00:1489:b029:2e9:a990:65ec with SMTP id v9-20020a056a001489b02902e9a99065ecmr674820pfu.67.1622249882462;
        Fri, 28 May 2021 17:58:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d579])
        by smtp.gmail.com with ESMTPSA id l3sm5459833pgb.77.2021.05.28.17.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 17:58:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] heaptrack: Fix build with clang and llvm libunwind
Date: Fri, 28 May 2021 17:58:00 -0700
Message-Id: <20210529005800.3231365-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-unw_set_caching_policy-before-using.patch | 41 +++++++++++++++++++
 .../heaptrack/heaptrack_1.2.0.bb              |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack/0001-track-Check-for-unw_set_caching_policy-before-using.patch

diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack/0001-track-Check-for-unw_set_caching_policy-before-using.patch b/meta-oe/recipes-devtools/heaptrack/heaptrack/0001-track-Check-for-unw_set_caching_policy-before-using.patch
new file mode 100644
index 0000000000..a6547eded8
--- /dev/null
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack/0001-track-Check-for-unw_set_caching_policy-before-using.patch
@@ -0,0 +1,41 @@
+From bcfc4c8d7dc70bd81367c183a68cc9ee02ab4744 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 28 May 2021 17:52:57 -0700
+Subject: [PATCH] track: Check for unw_set_caching_policy before using
+
+llvm libunwind does not implement unw_cache_* functions yet
+Include inttypes.h got PRI* macros
+
+Upstream-Status: Submitted [https://github.com/KDE/heaptrack/pull/33]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/track/trace_libunwind.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/track/trace_libunwind.cpp b/src/track/trace_libunwind.cpp
+index c76337c..96b2176 100644
+--- a/src/track/trace_libunwind.cpp
++++ b/src/track/trace_libunwind.cpp
+@@ -26,6 +26,7 @@
+ 
+ #define UNW_LOCAL_ONLY
+ #include <libunwind.h>
++#include <inttypes.h>
+ 
+ #include <stdio.h>
+ 
+@@ -60,9 +61,11 @@ void Trace::print()
+ void Trace::setup()
+ {
+     // configure libunwind for better speed
++#if UNW_CACHE_PER_THREAD
+     if (unw_set_caching_policy(unw_local_addr_space, UNW_CACHE_PER_THREAD)) {
+         fprintf(stderr, "WARNING: Failed to enable per-thread libunwind caching.\n");
+     }
++#endif
+ #if LIBUNWIND_HAS_UNW_SET_CACHE_SIZE
+     if (unw_set_cache_size(unw_local_addr_space, 1024, 0)) {
+         fprintf(stderr, "WARNING: Failed to set libunwind cache size.\n");
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
index f2235afef3..207c45284f 100644
--- a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/KDE/heaptrack.git;protocol=https \
            file://0002-heaptrack_inject-Include-dlfcn.h-for-dlopen-dlclose.patch \
            file://0003-heaptrack_preload-Make-noexcept-attribute-conditiona.patch \
            file://0004-backtrace-Always-include-stdint.h.patch \
+           file://0001-track-Check-for-unw_set_caching_policy-before-using.patch \
            "
 
 SRCREV = "bc9e3744bcc47de978673d1e382f4125a1ab5fa8"
-- 
2.31.1

