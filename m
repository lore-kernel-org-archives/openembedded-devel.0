Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.4149.1587594035900433504
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 15:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WcrH4oso;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id p8so1825443pgi.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2020 15:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5qxf7Ou2oMTJaPIwMTSs2f+phP27arYpgE7fNcxCkio=;
        b=WcrH4osojXdrVWCmiaIMFkt93enCJvoaVkG4jkNm6rRhv1RCHl8OoFxkt60HJ0W4hM
         magpJVoJ3+zy6NUtAxfGAJBlZfGgsR90t+Y9K7Zr0WdFT0m5yYnyFqDdSo4YcxRLRmqR
         bfLY2y+E8RPPzHbgX4odRIkSg20ZktzcCjwTPj+7hIGY3KVT0qakWq83k0OxZKCVzcJv
         Oku55gGMCYW7Q/sDHC/jGTkG5N2FynxuYPTpdVJwiAg0rA7jWXEkjQdAOJ6PT3RrV+uF
         feCgg3u+vgY0Rhv1cYl6orXA0+A4Uhngw+s08Ny2R6gN1dTu69QszBwjXnmvPdAaP0/I
         ZLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5qxf7Ou2oMTJaPIwMTSs2f+phP27arYpgE7fNcxCkio=;
        b=CPdIhW8B29xo86MqQWYNtKf0jWk4eO3eOo2iXBRyAj2vU6RV2MbfwLyPu4a5uuGOe8
         z4BDPVbHB1/lOVoStbeXBJjfbbVwNFyj1Llv0j+GxENPKJU+KHI1t+cxVEZKsmikB1eB
         4z/CkwzXKRLs9CHWyRzt0ZV1bSz7pHlxJGcM4kqSZvJYrbFt6viFGJA8IELTtojiAABO
         U5QUt/SldocnnutYjSbSJw1VpQrrMwWG96ewOwqpwDN198mM1HW6mP5TtYQi6KP87Zvt
         qxkt5WkSFagxUyk9KkIOJw1QOusQmqjInc7H80gdwixStSXsX1aUNP3OOHspUPkiSLg0
         hvpQ==
X-Gm-Message-State: AGi0PuYkBmwUjcQrpO3Nn0HIHvLUfinIXn2Z0F/cLPv9o+ycRChhv03N
	eHiJ7WuppRvm6HKi01xmU0LckaoPKhk=
X-Google-Smtp-Source: APiQypJqaVF714ax9h3Vvxk75/8x+8Y4IE1vpk+e2DQrZ5kTy1hFaY6YastI79ZEX45xNpIMTfghsQ==
X-Received: by 2002:aa7:9e49:: with SMTP id z9mr676058pfq.225.1587594034842;
        Wed, 22 Apr 2020 15:20:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1a60])
        by smtp.gmail.com with ESMTPSA id g22sm248307pju.21.2020.04.22.15.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 15:20:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2] nss: Fix build on riscv64
Date: Wed, 22 Apr 2020 15:20:31 -0700
Message-Id: <20200422222031.1014636-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Drop pinning to gcc alone

 meta-oe/recipes-support/nss/nss/riscv.patch | 36 +++++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb   |  1 +
 2 files changed, 37 insertions(+)
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
index 755eb76585..001124011e 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
+           file://riscv.patch \
            "
 
 SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
-- 
2.26.2

