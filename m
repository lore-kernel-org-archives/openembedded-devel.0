Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41233.1795611509692849861
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 04:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pDSOg3Z9;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so5355369f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 04:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795611508; x=1796216308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LtEhYhElBnj3Ijg40BSG/mpIaLdtPVoJcC4A029R3rk=;
        b=pDSOg3Z95Hx5inYgkd3Zi51PFulhO2QyTpRPOxn3GO98Z3EleNAkf7uVMDtvFr/Wdn
         MkPgOoXBbMufLGKVQh+hcEANAbVCMylwfOUSEqMtwIrINr2XDeWPYN2CctV3G/TPK1HA
         kgViKmBVzqcrklIMtyy8cK4e2qz2HOSlyoCps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611508; x=1796216308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LtEhYhElBnj3Ijg40BSG/mpIaLdtPVoJcC4A029R3rk=;
        b=vcHRqCNQvIhTBoI+lKPchBPMGSgSNunNZbUJETip4qJZhRULJes9B5oq/4o6Hud1Q7
         fpmKTLZkaWcgO1YhSYwDbwiEQwmz3JY6GD2ZuVenOEi7Ot7jI6LXeOC3yVj5Q8yRmFGT
         4kSpRvp2M6AFLBwDF+Eo+YYNDD1rPkhe/KmzBRM17SXOWCBaY4jumYKSF9hdXUsmqa5Z
         WPz7MLwbgdBxV9ckHeMgcbYrsVPnj+An7XhZx/fuP3bnuFkHudQJswe7zzZEJ7NTk+rV
         T6FZXceQZplBuCQRMJUCqeeo93G6ynqfpLHRimutbPPKM30DeXkDhI1i0p72UFdrnhsf
         CfKQ==
X-Gm-Message-State: APuU4Z/TuZaawC4V7jEifDA4p0aF4F2l+IpA1GxZgOmlgcHL+byPgLXm
	rzUrSQMfERYCjRAjDQkqyEyih8pchOQ3Du7500P9OJb+/usa+IFsFRWlHquZ2Omqk3qJ0dtXCrZ
	wlUlF
X-Gm-Gg: AZFdTZcNhEQIyRjSsUE5NywC77l7HkXWvFyG+5ZSvsht/K9uqs1M3T9+dhl/kVntFES
	gMfMT9BjvzJY4NA4R/Wglk4Djlh265b/NUezIswvw87Yyh1uuhEDBNhXIjD1pDygDEE/ZE38EDL
	vXg4JPxRodhV2XjLIs6n3BrminINsZrIVq8UiQ7SLOGNMY3ft5lao5YwXo78TZbSmLYnxDL7ZJn
	IbIS4Gh2SuJSUMAJGg0CkIWsc/Z61ebq4H6cFcd3XnP3TMjXxUBI5ysGkx7Ww86Obtk258ZGYSe
	Jv7d33eZ6ZCmOSkj+DTk3nOOAYhFrVwEiN1v+BYor6DBv7zUCY6zzZFDMFySCSnh8tMlbGHpEFQ
	HP2ewV6rW4LEFJTLYK3YODkuz4+YigI4TIcNhHdYYS+yZYrhHDlMToIFNwl/FQO4nT8LbrP8Iv0
	22hffJdqa6JotExCtqSHcLYhhvGGnAWb5vqjPsm0/ePZmOeBFMcixY7MAKJlxqJB+ESr6431KIY
	xcANvTuLBPMpRR/EUBKFJ+8EKq2OiKtJE+P7M9Cy2keeoqRJLeQWeA2PsaeJ+WMdnVeJYv9b6DR
	FTAM6hHN4SyluAVvHAAn4RS2W+Jk5+nbZqsYP8Wjh075LQOXsFxgL2U1WtkclZzVemVKXtWBjcB
	lUbgkR+ZzcyKJSraCVMAu9qfuyVylkpgXumX3JPeAIuRwHlXpxklBtQ==
X-Received: by 2002:a05:600c:3d05:b0:4b8:d17e:da27 with SMTP id 5b1f17b1804b1-4bb88930872mr364148145e9.27.1795611507582;
        Wed, 25 Nov 2026 04:58:27 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm32919300f8f.40.2026.11.25.04.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:58:27 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/8] python3-grpcio: Upgrade 1.85.3 -> 1.85.4
Date: Wed, 25 Nov 2026 14:58:17 +0200
Message-ID: <20261125125824.1799066-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 12:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133074
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.85.4:

This is release gRPC Core 1.85.4 (googol).

For gRPC documentation, see grpc.io. For previous releases, see
Releases.

This release contains refinements, improvements, and bug fixes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...h_set-include-immintrin.h-instead-of-b.patch | 17 ++++++++++-------
 ...hon-enable-unbundled-cross-compilation.patch |  6 ++++--
 .../python3-grpcio/abseil-ppc-fixes.patch       | 14 +++++++-------
 ...rpcio_1.85.3.bb => python3-grpcio_1.85.4.bb} |  2 +-
 4 files changed, 22 insertions(+), 17 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.85.3.bb => python3-grpcio_1.85.4.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
index 7b31540ead..c554a297f6 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch
@@ -1,7 +1,8 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From 4b5c47f16a89c16cac1b6f5ee6259ea4ca428409 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 24 Jun 2026 00:00:00 +0000
-Subject: [PATCH] abseil: raw_hash_set: include <immintrin.h> instead of <bmi2intrin.h>
+Date: Wed, 24 Jun 2026 00:00:00 +0000
+Subject: [PATCH] abseil: raw_hash_set: include <immintrin.h> instead of
+ <bmi2intrin.h>
 
 Clang refuses a direct include of <bmi2intrin.h> and errors out with:
 
@@ -16,21 +17,23 @@ Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/d851fdd76
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- third_party/abseil-cpp/absl/container/internal/raw_hash_set.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ .../abseil-cpp/absl/container/internal/raw_hash_set.h       | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
+diff --git a/third_party/abseil-cpp/absl/container/internal/raw_hash_set.h b/third_party/abseil-cpp/absl/container/internal/raw_hash_set.h
+index a50a488..1964e7b 100644
 --- a/third_party/abseil-cpp/absl/container/internal/raw_hash_set.h
 +++ b/third_party/abseil-cpp/absl/container/internal/raw_hash_set.h
 @@ -225,9 +225,9 @@
  #include <ranges>  // NOLINT(build/c++20)
  #endif
-
+ 
 -#ifdef __BMI2__
 -#include <bmi2intrin.h>
 -#endif  // __BMI2__
 +#if defined(__i386__) || defined(__x86_64__)
 +#include <immintrin.h>
 +#endif
-
+ 
  namespace absl {
  ABSL_NAMESPACE_BEGIN
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
index 0eb688ca28..048b6f2c05 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 55405c161ec71068229d13ef19d2f01ff59c2b77 Mon Sep 17 00:00:00 2001
+From cec28bc7abdd9fcb123f4403b9ffa2071c9b2516 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Wed, 5 Feb 2025 21:06:50 +0100
 Subject: [PATCH] python: enable unbundled cross compilation
@@ -12,9 +12,11 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  setup.py | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
+diff --git a/setup.py b/setup.py
+index 0a811c9..21577ef 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -345,25 +345,25 @@
+@@ -345,25 +345,25 @@ if BUILD_WITH_SYSTEM_OPENSSL:
      CORE_C_FILES = filter(
          lambda x: "third_party/boringssl" not in x, CORE_C_FILES
      )
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
index 946e36f53f..8afaf9b4b3 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
@@ -1,4 +1,4 @@
-From 42b215f964b2c13db4adb0ee72f024607f74e6d1 Mon Sep 17 00:00:00 2001
+From 1aa6db269ca0293cb0ad0ecdcea0085a4487ed6a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 13 Mar 2021 10:26:25 -0800
 Subject: [PATCH] An all-in-one patch that fixes several issues:
@@ -22,7 +22,7 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  4 files changed, 12 insertions(+), 5 deletions(-)
 
 diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
-index 68f9273..5dbfaab 100644
+index 73e4145..52cffa7 100644
 --- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
 +++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
 @@ -20,7 +20,7 @@
@@ -44,7 +44,7 @@ index 68f9273..5dbfaab 100644
  int64_t UnscaledCycleClock::Now() {
  #ifdef __GLIBC__
 diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
-index 43a3dab..196a853 100644
+index 9a0841d..934d5d7 100644
 --- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
 +++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
 @@ -21,7 +21,8 @@
@@ -58,7 +58,7 @@ index 43a3dab..196a853 100644
  #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
  #else
 diff --git a/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc b/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
-index 3dd6ba1..9f0601c 100644
+index 9a47f19..005239f 100644
 --- a/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
 +++ b/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
 @@ -36,6 +36,10 @@
@@ -72,7 +72,7 @@ index 3dd6ba1..9f0601c 100644
  #include "absl/base/attributes.h"
  #include "absl/base/internal/raw_logging.h"
  #include "absl/base/macros.h"
-@@ -177,8 +181,10 @@ void* GetProgramCounter(void* const vuc) {
+@@ -191,8 +195,10 @@ void* GetProgramCounter(void* const vuc) {
      return reinterpret_cast<void*>(context->uc_mcontext.pc);
  #elif defined(__powerpc64__)
      return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
@@ -85,10 +85,10 @@ index 3dd6ba1..9f0601c 100644
      return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
  #elif defined(__s390__) && !defined(__s390x__)
 diff --git a/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h b/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
-index 88949fe..4e26a6b 100644
+index c82d4a3..f7ee6cb 100644
 --- a/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
 +++ b/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
-@@ -67,7 +67,7 @@
+@@ -68,7 +68,7 @@
  #elif defined(__i386__) || defined(__x86_64__)
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_x86-inl.inc"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.85.3.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.85.4.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.85.3.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.85.4.bb
index 01848eeadf..5e9f637fd4 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.85.3.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.85.4.bb
@@ -14,7 +14,7 @@ SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            file://0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch \
            "
-SRC_URI[sha256sum] = "8e18f15d1b09b8771edbf59d634b26cbe4903bc2577cb667264934a6655eb8b4"
+SRC_URI[sha256sum] = "45c4efd77dbfbb92cfebe493518c7e2a97ef3f4da2673508f81214b7493d7cca"
 
 RDEPENDS:${PN} = "python3-protobuf python3-typing-extensions"
 
-- 
2.47.3

