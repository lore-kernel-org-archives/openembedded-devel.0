Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1656.1792738450780178285
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r3ZJnJ8q;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso321677b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738450; x=1793343250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haBQMTIhR++oK/lI/zr2kKi6NMr109lHohnOQooXoCs=;
        b=r3ZJnJ8q1aK/ThJRKP50Biau4oTk7J5xkqDobi1/2vXgFsPqTjtt3e4G9jz43GHkNr
         LKOJEwMe0mqxPxLcWhBQ+VWFv7XZ3AS2qebc6XpItqELK1ehZejtfjmi3eTUY6Zbq9Ra
         xnVNG6h8W74Y2S8WVXCCoHnaguX4fbwX0cZvD4AH27/2C8J7nxOTlUfOFfKysuLgxF/f
         iNUF00At95rZTrUOdPlIN9KPcmZlVdfbpJVdAwMsf7JCo93z7tuGOYDlOtxnMjZcMl6p
         tE5t4PDSSE45oZ8/cJGSQ++iXDNeoWrWQujmHAPkdMqz5uJsD0p+JfTRGiz+kH5LdIqI
         nplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738450; x=1793343250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=haBQMTIhR++oK/lI/zr2kKi6NMr109lHohnOQooXoCs=;
        b=ag43iNOU/lKD7IN62OfXxL3OhQbpi5x2TJuM9WywoSukIZ20U0Yfq6kO/QU1rhMbsL
         nAmepTLYl+tkjHfLTInVYzP1UKOtkqhfZXByv7lNVmcD6Cs7gR1GCRwJjAVBvRtiNSVu
         mwWlFnBkRjkNvjvygfTI/xlXzrnUknL442YaPDfBF016gpYlr0AATdO8qc5wMmI4zjNW
         0/0xKFDoBYm7dAaPPIF2fiZVuZWnEYZiIOeWPDZJzgL4pngSheMP1/OLzCQinJOjt4uN
         zHacqegcBcZbNzda4mhGXq5bp0tZ7O8k2lEwBRermz86qX2bPNvhqx9kIBd3j32iwLBW
         3bqw==
X-Gm-Message-State: AFq9FYIODQGlvmcOk4at6sAOkAez7a1WzFivzqCnBMXAz7L6cpna8nI2
	TZPHWhGHpU91yY16gj8ABzJOxGOnMkK4BVrjQ8RpLjWUCVtDMdQPua3W8Ut5fLXNzZg=
X-Gm-Gg: AYBFou0w++tdRRrSYpT6P1JX878DOWNr0Fw9AyCjlr4nAYysipjzL4pynqbjo6WNSoF
	hppRjOsah0hSyG+DvPAwt/yZUosuybRHiUc/HCfR+9+AGXKhnrCSBQBjKRSzHw/L/5xp1NrC5pn
	hI5Qn4E+1CYiaQK/r1qoNbhjvAal3pT2aoXSGwXuecQhGFU1whLqJfq6khoL/4M2lWW31eFae6v
	hmppUNc9h3QRFUhHSAq9wHVyhCRD3sdFdOvW+0rq7mDHd2W7HVjtPSaUjTGg9+I+37ZqQWoB0vG
	F7RkQjMxqfsqpxag0VC6WTXO5LvhtIyHfiol+4yjr/ZMCMK3f6p7tPTapBxgh0whFSRmFs1puiZ
	S/9nMn4Oix7cXexPQJCZJ7DtcSBXL8Les917rxz3KQxafO+8gcHzy0RQQVjlXdjQIKofbB4fGxG
	EIV/eUdzptLmn2mAQesu65RXbNxHFnHmzZAnn40rAIMfJWX6H0LnLe5GG52RE0SxjQB099z4AJ0
	sIkwn8a6Duiic/CiHdbj92hd9KWxZYAOzJhZlFzxTnQeA0V62OTeIQC4IAtIGIN3OwI33Gj7+pW
	iKSVnH+6s+aScj9pqUPXDCvLQ0ORk7RopxbUPw1ZwHo8FxIVvU2YWZLal7gkcIiMK4otrpM57g1
	dnafgzD9MFfnpLOCnXIQnapDtBEqkWX66hotJgml+KYDipfhSOW0R8RluGaJu655Vr3C714FCON
	iQ/ksz6RhhvT3RRN0UtFrv/UKoc7gFSJW54MuzScYNFwao9viL3gREBqwpRmC206M1eZNvrELx9
	j8yHiXPwDMUR+53Su1U8KGekXoP0zI=
X-Received: by 2002:a05:6a00:181c:b0:87d:3894:197b with SMTP id d2e1a72fcca58-8a2c668b824mr1290159b3a.59.1792738450066;
        Thu, 22 Oct 2026 23:54:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 14/29] x265: Link with libatomic when 64-bit atomics need it
Date: Thu, 22 Oct 2026 23:53:35 -0700
Message-ID: <20261023065350.3228996-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131338
Content-Type: text/plain; charset="utf-8"

The encoder uses atomic operations on 64-bit counters. On riscv32 these
become __atomic_*_8 libcalls, and libx265 is not linked with libatomic,
so linking the x265 CLI fails:

  ld.lld: error: undefined reference: __atomic_fetch_or_8
  >>> referenced by libx265.so.217 (disallowed by --no-allow-shlib-undefined)

Add a patch that checks in CMake whether 64-bit atomics need libatomic
and adds it to the platform libraries only in that case.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...libatomic-when-64-bit-atomics-need-i.patch | 55 +++++++++++++++++++
 .../recipes-multimedia/x265/x265_4.3.bb       |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/x265/x265/0004-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch

diff --git a/meta-multimedia/recipes-multimedia/x265/x265/0004-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch b/meta-multimedia/recipes-multimedia/x265/x265/0004-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch
new file mode 100644
index 0000000000..648bfe2255
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/x265/x265/0004-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch
@@ -0,0 +1,55 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 21 Oct 2026 15:00:00 -0700
+Subject: [PATCH] cmake: Link with libatomic when 64-bit atomics need it
+
+The encoder uses the ATOMIC_* macros, i.e. the __sync builtins, on
+64-bit counters, e.g. the threaded ME sequence number and timing
+totals. On 32-bit targets without 64-bit atomic instructions, such as
+riscv32, the compiler lowers these to __atomic_*_8 libcalls. libx265 is
+not linked with libatomic, so linking the x265 CLI against it fails:
+
+  ld.lld: error: undefined reference: __atomic_fetch_or_8
+  >>> referenced by libx265.so.217 (disallowed by --no-allow-shlib-undefined)
+
+Check whether 64-bit atomics link on their own, and if not, whether they
+link with libatomic, and add it to PLATFORM_LIBS only in that case, so
+libx265, the CLI and the Libs.private of x265.pc all get it. The test
+variable is global so the compiler cannot optimize the atomic
+operations away.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ source/CMakeLists.txt | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+--- a/source/CMakeLists.txt
++++ b/source/CMakeLists.txt
+@@ -191,6 +191,27 @@
+     if(NO_ATOMICS)
+         add_definitions(-DNO_ATOMICS=1)
+     endif(NO_ATOMICS)
++    if(NOT NO_ATOMICS)
++        # The atomics on 64-bit counters need libatomic on 32-bit targets
++        # without 64-bit atomic instructions, e.g. riscv32. The variable is
++        # global so the compiler cannot optimize the atomic operations away.
++        set(ATOMIC64_TEST "
++#include <stdint.h>
++uint64_t v;
++int main(void) {
++    __sync_fetch_and_add(&v, 1);
++    return (int)__sync_fetch_and_or(&v, 0);
++}")
++        check_c_source_compiles("${ATOMIC64_TEST}" HAVE_ATOMIC64)
++        if(NOT HAVE_ATOMIC64)
++            set(CMAKE_REQUIRED_LIBRARIES atomic)
++            check_c_source_compiles("${ATOMIC64_TEST}" HAVE_ATOMIC64_WITH_LIBATOMIC)
++            unset(CMAKE_REQUIRED_LIBRARIES)
++            if(HAVE_ATOMIC64_WITH_LIBATOMIC)
++                list(APPEND PLATFORM_LIBS atomic)
++            endif()
++        endif()
++    endif()
+     find_library(VMAF vmaf)
+     option(ENABLE_LIBVMAF "Enable VMAF" OFF)
+     if(ENABLE_LIBVMAF)
diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb b/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
index c657421783..31b28c3295 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     file://0001-fix-dynamicHDR10-undefined-uint8_t.patch;patchdir=.. \
     file://0002-x265-fix-build-with-cmake-4.patch;patchdir=.. \
     file://0003-riscv64-Fix-case-of-STRIDE_SHIFT-macro-invocation.patch;patchdir=.. \
+    file://0004-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch;patchdir=.. \
 "
 SRCREV = "e9b88125dc21393b3fd8d68e98083bdfb89778a8"
 S = "${UNPACKDIR}/x265-${PV}/source"
