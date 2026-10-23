Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1648.1792738438669124617
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JRP2OUBS;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a05da1cc1fso226751b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738438; x=1793343238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8gpWczVAPe1SLttlBXId3aoYvuzhvXKj3+UlEyW3kw=;
        b=JRP2OUBSGC401ny/p36eYxaTVp4nrcGxL47J4OO3igKNJWw34o31RBXzyQNU3yXhW0
         j4BRcBGz9uA8qwaZFITF599TifC2ik/RPOTvctjqkjwjr0YRukaLJxY/+N249NRVHVNk
         TyvXqH++k2CBykKfh9GC4TyZA3YwMvcQ4y9HQTfbK1jwXOrxZSttJVqQqDt5ZFNWHYj8
         jt2z0TxMDaGN9KOkPu6ptLoP6UyHO4vRlHNbB1JTvS8kFTHioZjSR2eeVA0/q9MAMGyF
         rFn9vKF1SgYjupTXJOb23FlalH/72G0CIxh6BBn9sGLafpguVZ3od0v+Bo2m7D2kuADT
         /WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738438; x=1793343238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w8gpWczVAPe1SLttlBXId3aoYvuzhvXKj3+UlEyW3kw=;
        b=qgnPEUvK6RWlFjciMgPvkCuFZoOQRTG+eqTZm7Utmhq4emDJTCRCjZJUIxJSyz1Aha
         awiEFkg4U+t6Tca0eoh4uL4wxhqOSKiC6bkoEpKjIFFnLZvG6SC93Za90iQISaXkaLp4
         lcS9bKoSvADFjjun6Nx0WBdVwWgtwhX5qldRsaAO7foKeTUmSDY93nmvLL2d6gJ47/XJ
         hwPh0g9tO91Oy6jfglBp6PGcO+Gd7EF29lBRP2evl0x1iNKDE+x9voafVIEO/se4lXkG
         Lsmnn0Z+6EsM8rtWIT4WC4HHuPgUWrF6g27w6uKkXcEWF5pMCC9HA/5bNCUc7wntmSw2
         cj1A==
X-Gm-Message-State: AFq9FYJFuiUDdjFjWwvAstvSLBJwWm/zXU/k6+ptQHL876+GTGUNAZKn
	W1MdUMRH9K54ZAG3pO7KKqRcYENsAc2YiFGXNfFbmrlTwoaw4XEL7trG73uifbk6Uv0=
X-Gm-Gg: AYBFou1gLR9cuF2i63Sohzo0XckgxoI7QTecIXhgeufCY8r/qm85b5M3FZSg+ElhLps
	BPhjQQeNF90KHnoO14h/IZro/vgbkAwWo4+rjckWVEVmJ/zdlvmkXY6yyFLfOoR0cTNGlUKm9Hl
	t3hnD6E2xCR5+BX9vzGliraaVoCtnJGqAJgmiOTC2NdIqa6znOhFy58L9N0EU9lAOAOe7L/qKx0
	qgvkcmc9Ec2ztwcISjZKZApwgnjwyjBri19XvUxo7tOWdH3HOOl3RqY7kW+OHKgc4ACkFOmXYoL
	y48elYew8NSSpcQlPtbLZkdFPOF4HdlM7020jrjcavy1w0M2GNZY22niJv738jNtIO9ppf8hI7G
	rAwCxY7J201ZswUm+r7puZSaGfCb+UbvBh1miYFUyN/V/Erw5OFaoNPRENg0RAQYr338sXu6nv5
	8OOMWB8o8d/xoBaeml7p65Lg31OKnOpnQGZzOZXaao+TyGLHcta4C2SYQw7rDkvJtwyI5KiHVvd
	TiDcKnEHKWUbI11V9/oEHC8tZ8UR0Ux3+/3ipSU47oBKNvmApQ88DvjaQl6UDosYpbLdeE8HzDt
	TB/N6Mf6WEGeAjsmurbleTGh6CY2zB80FVAZVxR1k75oIjeGJbyZjWbb/N/NKRy5Umg/HOqGq+X
	878iPl52Xc2elhp2Mi7zpWaTKqJCCsryi36MHfTQGQlqY9M+s5yDc/IApx4EY2JzzwTeGIGHdfL
	i95FOMBeV1m5k0zs+B55DZ0JAjTthA6ReG4ztDBg1fIBpRuRfhCWzcJePYvnsXlwg6V13v9eDhc
	8fbJKARO69bbRWEoBCbpOWY0Di6Hofw
X-Received: by 2002:a05:6a00:1c8f:b0:893:12e5:c07c with SMTP id d2e1a72fcca58-8a2c69af806mr1189224b3a.27.1792738437897;
        Thu, 22 Oct 2026 23:53:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:53:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 04/29] rdma-core: Link libmana with libatomic when needed
Date: Thu, 22 Oct 2026 23:53:25 -0700
Message-ID: <20261023065350.3228996-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131328
Content-Type: text/plain; charset="utf-8"

libmana uses 64-bit C11 atomics, which riscv32 lowers to
__atomic_load_8/__atomic_store_8 libcalls, so linking libmana fails:

  ld.lld: error: undefined symbol: __atomic_load_8
  ld.lld: error: undefined symbol: __atomic_store_8

Add a patch that checks at configure time whether 64-bit atomics need
libatomic and links libmana with it only in that case.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ibatomic-when-64-bit-atomics-need-it.patch | 69 +++++++++++++++++++
 .../rdma-core/rdma-core_65.0.bb               |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0002-mana-Link-with-libatomic-when-64-bit-atomics-need-it.patch

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0002-mana-Link-with-libatomic-when-64-bit-atomics-need-it.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0002-mana-Link-with-libatomic-when-64-bit-atomics-need-it.patch
new file mode 100644
index 0000000000..6817904790
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0002-mana-Link-with-libatomic-when-64-bit-atomics-need-it.patch
@@ -0,0 +1,69 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 20 Oct 2026 22:00:00 -0700
+Subject: [PATCH] mana: Link with libatomic when 64-bit atomics need it
+
+shadow_queue.h keeps the producer and consumer indexes in
+_Atomic(uint64_t). On 32-bit targets without native 64-bit atomic
+instructions, such as riscv32, the compiler lowers these to
+__atomic_load_8/__atomic_store_8 libcalls, and libmana fails to link:
+
+  ld.lld: error: undefined symbol: __atomic_load_8
+  ld.lld: error: undefined symbol: __atomic_store_8
+
+Check whether a 64-bit atomic load/store links on its own, and if not,
+whether it links with -latomic. Link libmana with libatomic and add it
+to the libmana.pc private libs only when it is needed, so targets with
+native 64-bit atomics are unchanged.
+
+Upstream-Status: Submitted [https://github.com/linux-rdma/rdma-core/pull/1831]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ CMakeLists.txt                | 21 +++++++++++++++++++++
+ providers/mana/CMakeLists.txt |  5 ++++-
+ 2 files changed, 25 insertions(+), 1 deletion(-)
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -510,6 +510,27 @@
+   RDMA_DoFixup("${HAVE_STDATOMIC}" "stdatomic.h")
+ endif()
+
++# 64-bit C11 atomics are not lock free on some 32-bit targets (e.g. riscv32)
++# and the compiler emits __atomic_* libcalls that libatomic provides.
++set(ATOMIC64_CHECK_PROGRAM "
++#include <stdatomic.h>
++#include <stdint.h>
++_Atomic(uint64_t) v;
++int main(int argc, const char *argv[]) {
++  atomic_store(&v, (uint64_t)argc);
++  return (int)atomic_load(&v);
++}")
++CHECK_C_SOURCE_COMPILES("${ATOMIC64_CHECK_PROGRAM}" HAVE_ATOMIC64_WITHOUT_LIBATOMIC)
++set(ATOMIC_LIBRARIES "")
++if (NOT HAVE_ATOMIC64_WITHOUT_LIBATOMIC)
++  set(CMAKE_REQUIRED_LIBRARIES "-latomic")
++  CHECK_C_SOURCE_COMPILES("${ATOMIC64_CHECK_PROGRAM}" HAVE_ATOMIC64_WITH_LIBATOMIC)
++  unset(CMAKE_REQUIRED_LIBRARIES)
++  if (HAVE_ATOMIC64_WITH_LIBATOMIC)
++    set(ATOMIC_LIBRARIES "-latomic")
++  endif()
++endif()
++
+ CHECK_INCLUDE_FILE("linux/dma-heap.h" HAVE_LINUX_DMA_HEAP_H)
+
+ RDMA_Check_SSE(HAVE_TARGET_SSE)
+--- a/providers/mana/CMakeLists.txt
++++ b/providers/mana/CMakeLists.txt
+@@ -8,8 +8,11 @@
+   wr.c
+ )
+
++# shadow_queue.h uses 64-bit atomics
++target_link_libraries(mana LINK_PRIVATE ${ATOMIC_LIBRARIES})
++
+ publish_headers(infiniband
+   manadv.h
+ )
+
+-rdma_pkg_config("mana" "libibverbs" "${CMAKE_THREAD_LIBS_INIT}")
++rdma_pkg_config("mana" "libibverbs" "${CMAKE_THREAD_LIBS_INIT} ${ATOMIC_LIBRARIES}")
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_65.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_65.0.bb
index a465bda583..39b5690d39 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_65.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_65.0.bb
@@ -7,6 +7,7 @@ RDEPENDS:${PN} = "bash perl"

 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch \
+           file://0002-mana-Link-with-libatomic-when-64-bit-atomics-need-it.patch \
 "
 SRCREV = "58e40801bfed5a8befc0881594820fa0a0baa4a1"

