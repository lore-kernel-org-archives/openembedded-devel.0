Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.2585.1614832913063972308
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 20:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f/RgH9uJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id u11so15398675plg.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 20:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A9xvxRJUlAB7SyJ+H1HH+bAXK7SrSJghH/rwwzhkZsk=;
        b=f/RgH9uJQpt1GqYkz8qjcfPSYI2O0+NDfFLdt8ehfk2avUYdO4/1hlnDgh7jXsxnMx
         20AcLX9kf4mcnYeFcJuspIzU+HM/yy11Rj2PRAu5WD2CosK++5WDhEC9wYm+sWcWd0uM
         lKsYCaakqgAzMfOtLs/2H43STvamkVch1I5pjHrYQxNa64LbdH3JcE7+bn9IMR7ALLqL
         J35zacInVp7XvzkLcRYntjWJ6X50CjpoMOtrKZ0WUguIaq1LxF6orbX9xdANr1VVcERV
         nW8Tmo0Dj865gM4guplIU1Pn5mG3gWbS8eT690lve9DiQsr60+mtBO34KGbX+aHX8RSc
         H93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A9xvxRJUlAB7SyJ+H1HH+bAXK7SrSJghH/rwwzhkZsk=;
        b=FftJPVyF7JYThcINMdtyJ7NxcgageeqgFnZAjeRSgxOOnBjMYjpMU00GhMlApQa5SK
         gD4ATPHk0+7OvB170P/kwMK65z7dGe9QB7K8LxdpWmsZZ8f5KKzKv9Yh6ARK25292yTX
         SGJbPEIu5wPbKBKm0qa+iTfi92EyCtSEvM60kNw34jL+K9afNmDAXYq3U8XiLw3TCTGv
         RhrrcWI91FRQMNvk8+nfrW6NOBQxCWqk45yucmM5cWF/Cnq+arWcI5k+gdMHqybaTKTe
         zgAN7T8PidPgFGiTBun4remACMksEHVWJlnO23sdNhzRaiq2GjPuyGhQ5fZMcogcjug+
         wHXA==
X-Gm-Message-State: AOAM533g8ayr06L5xW4+wG+9vv2dYTI7RTIDaH7DBYuY0PR3A/pSp/ZI
	hOagQQ1ZVP6cOgFTtR4SB6gYSeqCwH6nwQ==
X-Google-Smtp-Source: ABdhPJwNCGO8GCf8sitlePgYS7ot6ArtZu/ae075YY4s3c77G4bHa5s61S6hPQO0oaz9HV0m9NyUqw==
X-Received: by 2002:a17:90a:650b:: with SMTP id i11mr2448719pjj.130.1614832911936;
        Wed, 03 Mar 2021 20:41:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id v134sm2321709pfc.182.2021.03.03.20.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 20:41:51 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-grpcio: Fix build on mips and musl
Date: Wed,  3 Mar 2021 20:41:48 -0800
Message-Id: <20210304044148.2032330-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-absl-always-use-asm-sgidefs.h.patch  | 33 +++++++++++++++++++
 .../python3-grpcio/mips_bigendian.patch       | 15 +++++++++
 .../python/python3-grpcio_1.36.1.bb           |  2 ++
 3 files changed, 50 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000000..be516ca508
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch
@@ -0,0 +1,33 @@
+From 8f21fdfb83b0fa844a9f1f03a86a9ca46642d85e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 9 Apr 2020 13:06:27 -0700
+Subject: [PATCH 1/2] absl: always use <asm/sgidefs.h>
+
+Fixes mips/musl build, since sgidefs.h is not present on all C libraries
+but on linux asm/sgidefs.h is there and contains same definitions, using
+that makes it portable.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ third_party/abseil-cpp/absl/base/internal/direct_mmap.h | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+--- a/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
++++ b/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
+@@ -41,13 +41,9 @@
+ 
+ #ifdef __mips__
+ // Include definitions of the ABI currently in use.
+-#ifdef __BIONIC__
+-// Android doesn't have sgidefs.h, but does have asm/sgidefs.h, which has the
++// bionic/musl C libs don't have sgidefs.h, but do have asm/sgidefs.h, which has the
+ // definitions we need.
+ #include <asm/sgidefs.h>
+-#else
+-#include <sgidefs.h>
+-#endif  // __BIONIC__
+ #endif  // __mips__
+ 
+ // SYS_mmap and SYS_munmap are not defined in Android.
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch b/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
new file mode 100644
index 0000000000..343f25a46e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
@@ -0,0 +1,15 @@
+--- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
++++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
+@@ -102,10 +102,10 @@ extern "C" {
+ #elif (defined(__PPC__) || defined(__powerpc__))
+ #define OPENSSL_32_BIT
+ #define OPENSSL_PPC
+-#elif defined(__MIPSEL__) && !defined(__LP64__)
++#elif defined(__mips__) && !defined(__LP64__)
+ #define OPENSSL_32_BIT
+ #define OPENSSL_MIPS
+-#elif defined(__MIPSEL__) && defined(__LP64__)
++#elif defined(__mips__) && defined(__LP64__)
+ #define OPENSSL_64_BIT
+ #define OPENSSL_MIPS64
+ #elif defined(__riscv)
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
index d374b54b34..3d875bf4ba 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
@@ -10,6 +10,8 @@ SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 SRC_URI_append_class-target = " file://ppc-boringssl-support.patch \
                                 file://riscv64_support.patch \
                                 file://boring_ssl.patch \
+                                file://mips_bigendian.patch \
+                                file://0001-absl-always-use-asm-sgidefs.h.patch \
 "
 SRC_URI[sha256sum] = "a66ea59b20f3669df0f0c6a3bd57b985e5b2d1dcf3e4c29819bb8dc232d0fd38"
 
-- 
2.30.1

