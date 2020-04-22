Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web12.4013.1587593629982196276
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 15:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tvds5mUe;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id n24so1491889plp.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2020 15:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bqJfXQyTbP0YyiM2sJosV5sBScK4ub04AyCXpenyk1s=;
        b=tvds5mUe9IM7FO0hM/jmX7qKA1qzlV1Oq5Wd5sfTMjp/DB/rHWoYO4Wv3pcA2E6Nqn
         ORay2M4ZRNztkkwVvMYius5JGO/CCpcvGrUKRlZXunJoUigrTZ7pHmL3gomzw/OXAHVg
         bfIw7sLVY62UyVzj2zx9Mv8lv3jwkRt9JrmRmM6VQYN5YIwX+9ZtaEhn49j5qIgUlWkq
         GcWf2iBWD/UtFLP0DwLO5jZJQJv5JeH0t8J4vTQaSDLHqHfWj2KADDm8uj7T/vsnYw4C
         7v+9cHZWeMj4j3MI5vwy/wkJMGSYOY7NO8zgoQGhnl99Smi45+uVT3G0jzhN33/PHDrt
         QxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bqJfXQyTbP0YyiM2sJosV5sBScK4ub04AyCXpenyk1s=;
        b=swmRx1Ei4R9uLSSHB+nibdsPn73/UHi0jqy4erBTOQzaH1YShXuLtqgQu8/UYIYvY3
         UWHVk8AuavxAOhHtRcApyaRcF65u+WOus0uzPClYQSNTZOM8WhO+IMqdgOYyQVkqcKHt
         UyqF8KTrZyBCt/nTGe8WT1G4J4Rr6388Ixyivc6qZVFiLPYcUZ7/dYXRpyKq64aXmImP
         4mWwr+XvxhPCHtmORakBIc1AORAz1U5ETNTidW2qlC0oUIRyuk74G28eFn8Tvp+QgWiw
         A9Iq/06OfGFS7FV/zTxYzBonk2Tnkn8CKXqNdMr18xmIggDIZC9X5L/7Yo0c4gDjo8jg
         QWmw==
X-Gm-Message-State: AGi0PuZ9kFeYxUp5FYqZiP2yZC6rAA6wP3YXcEWucjf2A1u1MSO/r3wI
	AaEdg52NXfdBHamZBoFZvLbM4VBX0wU=
X-Google-Smtp-Source: APiQypJborJP17m16jxC5F5ZidFugUnvZNKC8Bar5g/kkkoDmxv+AJkWcAeTOM8fPtbQR24GVMG4XA==
X-Received: by 2002:a17:90a:37a3:: with SMTP id v32mr1009505pjb.2.1587593629051;
        Wed, 22 Apr 2020 15:13:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1a60])
        by smtp.gmail.com with ESMTPSA id g2sm485729pfh.193.2020.04.22.15.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 15:13:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nss: Fix build on riscv64
Date: Wed, 22 Apr 2020 15:13:46 -0700
Message-Id: <20200422221346.1006384-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/nss/nss/riscv.patch | 36 +++++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb   |  3 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/riscv.patch

diff --git a/meta-oe/recipes-support/nss/nss/riscv.patch b/meta-oe/recipes-support/nss/nss/riscv.patch
new file mode 100644
index 0000000000..aef91a7c37
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/riscv.patch
@@ -0,0 +1,36 @@
+Enable uint128 on riscv64
+
+Fixes
+| verified/kremlin/kremlib/dist/minimal/LowStar_Endianness.h:29:37: error: 'load128_be' declared 'static' but never defined [-Werror=unused-function]
+|    29 | inline static FStar_UInt128_uint128 load128_be(uint8_t *x0);
+|       |                                     ^~~~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h
++++ b/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h
+@@ -56,7 +56,8 @@ typedef const char *Prims_string;
+ #include <emmintrin.h>
+ typedef __m128i FStar_UInt128_uint128;
+ #elif !defined(KRML_VERIFIED_UINT128) && !defined(_MSC_VER) && \
+-    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__))
++    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__) || \
++     (defined(__riscv) && __riscv_xlen == 64))
+ typedef unsigned __int128 FStar_UInt128_uint128;
+ #else
+ typedef struct FStar_UInt128_uint128_s {
+--- a/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h
++++ b/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h
+@@ -23,9 +23,10 @@
+ #include "FStar_UInt128.h"
+ #include "FStar_UInt_8_16_32_64.h"
+ #include "LowStar_Endianness.h"
+-
++#include <stdint.h>
+ #if !defined(KRML_VERIFIED_UINT128) && !defined(_MSC_VER) && \
+-    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__))
++    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__) || \
++     (defined(__riscv) && __riscv_xlen == 64))
+ 
+ /* GCC + using native unsigned __int128 support */
+ 
diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index 755eb76585..b107c1b178 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
+           file://riscv.patch \
            "
 
 SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
@@ -271,3 +272,5 @@ FILES_${PN}-dev = "\
 RDEPENDS_${PN}-smime = "perl"
 
 BBCLASSEXTEND = "native nativesdk"
+
+TOOLCHAIN = "gcc"
-- 
2.26.2

