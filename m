Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37934.1795594089576409510
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NrnjTXCD;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3863db981d4so7616321eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594089; x=1796198889; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HD2WNCEJ/VOqpCOo4PY0+0OwzdWAI/zEV7mrpa/EBRo=;
        b=NrnjTXCD29HxKGbnC5ZFTmkcWs9KT/U1QEwn7DAUToafgOLEiz+iYJiKmCmbM280uX
         Wc+REvjZmbJLTaIneaqoAERfEySUml3DVU0xU+9wtlasnx+WwW2sTEVm2xjbMWUjMjCV
         yAFcJGHnqjDJjVtQE4taAB4DhKRWBXDKIUqlDS66kfVDaNsk+r4eTq+2VNmh7/eL+/RU
         lNpI9WRBjDVUh/+k5U14V3vo7bqcZvSxTVwyPICQWz1pqiAOZZTGEL6kzkAHUPSMsOHv
         6BmZEODzkdWPKq16DwiVBNsro2fdee50w66ukQ6yf5kUGgF9rO9znLowI/8m0+IblcIq
         7rTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594089; x=1796198889;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HD2WNCEJ/VOqpCOo4PY0+0OwzdWAI/zEV7mrpa/EBRo=;
        b=O6bRSnnejM1iKelCOZfrYj38EkWmieWO78B/E5qLPVyiS4BNfgBb39ChLsx7AK2poV
         qw8nr2o+o0oBtZp+LCFtzKeV3ulWValRhyLaAPemVFlpG9PX1yktKVzitXss6Z/nWBut
         lSRhaWT5Am6PADIlWL24mCZj3meGepWeFrOfiL/HiF/kg2rRbF0/5/5bLph/Ztzzj1Hd
         pBpP8q6ChqvzlVzKjpRYJnRnOMmJ6BUDcgbLTagTRS9z+edy+sG9jlWmsFLwok4D+iPv
         MF1OGD4j5BUkV6qImVI3OJT0jMc4rcXKA9HMl82N82/QRW9Bx2OfaAyLVcbwae2CNEBL
         0IxA==
X-Gm-Message-State: APuU4Z8KbGoppZPrXw35uZxdZHyTpiAmtKd8guCcudOkOvAIm3WRw4LU
	g/wOsC/H6IYVSYGGq8iJMAOvmrnfIVRq90gmUS7+rriYeOpNbMqxSH0m9kQlFwr9
X-Gm-Gg: AZFdTZe9mxIg/wLqPDbcWE5+ZyU718fHig52YW+VyJ8ps7nhpx8Q3qotwgQW3f/C63O
	hkJxUlpOspBzUbh8Fkq8Skjl5V5RckF4y0ZJtRs22GjQpb9x8DLUbGyfHpfdorozyvH/RCCo8ID
	eWxCRSQoDy+9VVONFWHc25q6KRi1O6CmKWn7FrKJpztyck6qeskOEXOu56uO9UTjWhWSVife2T/
	9czb8ukpptbUHnEePTRolNzxF1EVQ8N3hPdX+ys+ppoc38M60DIOfav27YxqYkk2iqpR8aSyV+P
	gKSIl8KHhYIBapIdf7ioVVvZWB7C9WKzktSWal9ELNRbkg/Yd5H5huzy/TcQY/jGJJi9Uo4PZyY
	riQoglDzUuIioY0ygjUzapngDZy1/8ZZ01sSRDKM7/mIV6kDUvwQ684rRad/n4X702CZs3s/lla
	ndnayNORmaA61yqq5pFtgDe8r60f9ESfN4xohjM5X2SV0BhMahJHRQXJ+xwoBrkhVpfAtMmq5x8
	ybnhiMxy0k05U12Po8SeVHeaFNBhemR5duAbEyjXz3AJ33dtNei6xi/U79YtI1O+sa/pIC1wYTW
	NDmK22SKkuPnszjBaYV+LA7h4AKouxueCsVhf+tGLVFZwyGLEp+pctyYpyBDYBJHGXpmPilzNBu
	4PUbIG5w1aQYnoCgs5j9O3XpYLG5909bpKqaZ23kLiQb3LZUkWTD1YGBIssxFE4KTZnYywySFny
	ME+JlJr1f1rgCupqZVXII7m/YNJbbVZXRY9rTfP7+YkvvbfWikq5Az9KI0zqj8zHUbxQFlw8/fs
	jna6kKS6uLFVZzs8c47F4q5fLd74YSQKE6jS7fKEyOMWQf8FLRd+j77TLN9kpwqw+K+nfdzu76f
	I2rR
X-Received: by 2002:a05:693c:41c3:10b0:386:acf5:b4b5 with SMTP id 5a478bee46e88-386acf5b7c7mr8993108eec.23.1795594088337;
        Wed, 25 Nov 2026 00:08:08 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 21/55] nodejs: upgrade 24.22.3 -> 26.13.1
Date: Wed, 25 Nov 2026 00:06:37 -0800
Message-ID: <20261125080732.2419614-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133024
Content-Type: text/plain; charset="utf-8"

Node.js 26 'Lithium' became Active LTS on 2026-10-28; 24 is now in
maintenance.
- Node 25: V8 14.1, permission model --allow-net, Web Storage on by
  default, SlowBuffer and other long-deprecated APIs removed.
- Node 26: V8 14.6, Temporal API enabled by default (needs Rust),
  Undici 8, npm 11.20, corepack no longer bundled.
- Removed: http writeHeader(), legacy _stream_* modules,
  --experimental-transform-types; module.register() is deprecated.
- Build needs GCC >= 13.2 or Clang >= 19.1, Python >= 3.10.
- 26.13.1 is a security release fixing CVE-2026-123828,
  CVE-2026-123829, CVE-2026-123862..123868, CVE-2026-123871..123875,
  CVE-2026-123877 and CVE-2026-126051 (http2, tls, http, permission).

Configure with --v8-disable-temporal-support: Temporal pulls in the
Rust temporal_rs crate, and configure.py enables it whenever it finds
cargo/rustc on the build host, so disable it for deterministic builds.
Drop the GCC 15 ia32 -Wtemplate-body and histogram AVX2 patches, both
are upstream. Drop the riscv hunk of the liftoff patch since that code
no longer exists, and refresh the remaining patches for 26.13.1. Drop
corepack from FILES since it is no longer installed. Add an upstream
check restricted to the even-numbered (LTS) majors. Rename the
nodejs-oe-cache-native recipe to 26.13 to match.

License-Update: LIEF copyright years updated to 2026, and the
large_pages (Intel, MIT) section removed with src/large_pages.

V8 14.6 decodes hex with NEON intrinsics in src/objects/simd.cc that
rely on implicit vector conversions. GCC rejects those, which breaks the
host (BUILD_CXX) build on aarch64 build hosts, so pass
-flax-vector-conversions to the host compiler there.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...plate-body-error-with-GCC-15-on-ia32.patch | 52 -------------------
 ...ram-restrict-avx2-dispatch-to-x86_64.patch | 44 ----------------
 .../0001-Do-not-use-glob-in-deps.patch        |  6 ++-
 .../0002-v8-don-t-override-ARM-CFLAGS.patch   |  8 +--
 .../0003-system-c-ares.patch                  |  4 +-
 ...-liftoff-Correct-function-signatures.patch | 30 +++--------
 ...ps-disable-io_uring-support-in-libuv.patch |  8 +--
 .../0007-positional-args.patch                |  3 +-
 .../0008-custom-env.patch                     |  2 +-
 .../0009-Using-native-binaries.patch          | 20 +++----
 ...y-case-equivalents-of-BMP-characters.patch |  6 +--
 .../nodejs/{nodejs-24 => nodejs-26}/run-ptest |  0
 .../oe-npm-cache                              |  0
 ....22.bb => nodejs-oe-cache-native_26.13.bb} |  0
 .../{nodejs_24.22.3.bb => nodejs_26.13.1.bb}  | 20 ++++---
 15 files changed, 50 insertions(+), 153 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs-24/0010-v8-fix-Wtemplate-body-error-with-GCC-15-on-ia32.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs-24/0012-histogram-restrict-avx2-dispatch-to-x86_64.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs-24 => nodejs-26}/0001-Do-not-use-glob-in-deps.patch (94%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-24 => nodejs-26}/0002-v8-don-t-override-ARM-CFLAGS.patch (97%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-24 => nodejs-26}/0003-system-c-ares.patch (93%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-24 => nodejs-26}/0004-liftoff-Correct-function-signatures.patch (65%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-24 => nodejs-26}/0006-deps-disable-io_uring-support-in-libuv.patch (90%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-24 => nodejs-26}/0007-positional-args.patch (96%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-24 => nodejs-26}/0008-custom-env.patch (95%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-24 => nodejs-26}/0009-Using-native-binaries.patch (93%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-24 => nodejs-26}/0011-v8-handle-supplementary-case-equivalents-of-BMP-characters.patch (98%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-24 => nodejs-26}/run-ptest (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-24.22 => nodejs-oe-cache-26.13}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_24.22.bb => nodejs-oe-cache-native_26.13.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_24.22.3.bb => nodejs_26.13.1.bb} (91%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0010-v8-fix-Wtemplate-body-error-with-GCC-15-on-ia32.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0010-v8-fix-Wtemplate-body-error-with-GCC-15-on-ia32.patch
deleted file mode 100644
index 4053f97053..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs-24/0010-v8-fix-Wtemplate-body-error-with-GCC-15-on-ia32.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 9f1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a Mon Sep 17 00:00:00 2001
-From: Bin Cao <bin.cao.cn@windriver.com>
-Date: Thu, 29 May 2026 12:00:00 +0800
-Subject: [PATCH] v8: fix -Wtemplate-body error with GCC 15 on ia32
-
-GCC 15 introduced -Wtemplate-body (enabled by default as an error) which
-performs stricter name lookup checking inside template bodies. In the
-Int64LoweringReducer template class (only compiled for 32-bit targets),
-the expression `__ Tuple<Word32, Word32>(...)` is ambiguous in a
-dependent context because GCC cannot determine whether `Tuple` after
-the `__` macro expansion (`Asm().`) refers to a template member function
-or the struct type `Tuple`.
-
-Add the C++ `template` disambiguator keyword to tell the compiler that
-`Tuple` is a dependent template name. This is the standards-correct fix
-and is backward-compatible with older GCC versions.
-
-This is a minimal backport of the fix already present in upstream V8
-(main branch), where the method was additionally renamed from `Tuple` to
-`MakeTuple`.
-
-Upstream-Status: Backport [https://github.com/nodejs/node/commit/7772a2df9d0b4db9947dbb902b4aec33c35401c0]
-Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
----
- .../turboshaft/int64-lowering-reducer.h       | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/deps/v8/src/compiler/turboshaft/int64-lowering-reducer.h b/deps/v8/src/compiler/turboshaft/int64-lowering-reducer.h
-index abcdef1..1234567 100644
---- a/deps/v8/src/compiler/turboshaft/int64-lowering-reducer.h
-+++ b/deps/v8/src/compiler/turboshaft/int64-lowering-reducer.h
-@@ -637,7 +637,7 @@ class Int64LoweringReducer : public Next {
-       result = __ Word32CountLeadingZeros(high);
-     }
- 
--    return __ Tuple<Word32, Word32>(result, __ Word32Constant(0));
-+    return __ template Tuple<Word32, Word32>(result, __ Word32Constant(0));
-   }
- 
-   V<Word32Pair> LowerCtz(V<Word32Pair> input) {
-@@ -650,7 +650,7 @@ class Int64LoweringReducer : public Next {
-       result = __ Word32CountTrailingZeros(low);
-     }
- 
--    return __ Tuple<Word32, Word32>(result, __ Word32Constant(0));
-+    return __ template Tuple<Word32, Word32>(result, __ Word32Constant(0));
-   }
- 
-   V<Word32Pair> LowerPopCount(V<Word32Pair> input) {
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0012-histogram-restrict-avx2-dispatch-to-x86_64.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0012-histogram-restrict-avx2-dispatch-to-x86_64.patch
deleted file mode 100644
index 9f5ea60212..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs-24/0012-histogram-restrict-avx2-dispatch-to-x86_64.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 059887c4e51ff49dd8d944eb6ca732a6cfd3043f Mon Sep 17 00:00:00 2001
-From: Kanksha Paturi <Kanksha.Paturi@windriver.com>
-Date: Tue, 10 Nov 2026 17:24:56 +0000
-Subject: [PATCH] deps: histogram: restrict AVX2 dispatch to x86_64
-
-The bundled hdr_histogram enables its AVX2 dispatch on 32-bit x86, but
-the AVX2 path uses _mm_extract_epi64(), which only exists on 64-bit
-x86. Building for 32-bit x86 (qemux86) fails with:
-
-  hdr_histogram.c:740: error: implicit declaration of function
-  '_mm_extract_epi64'
-
-Only the AVX2 dispatch guard is backported from the histogram 0.12.0
-update, not the whole commit.
-
-Upstream-Status: Backport [https://github.com/nodejs/node/commit/1271bb448ae46ca67ad6306b43e3aab2c5b36d3c]
-
-Signed-off-by: Kanksha Paturi <Kanksha.Paturi@windriver.com>
----
- deps/histogram/src/hdr_histogram.c | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/deps/histogram/src/hdr_histogram.c b/deps/histogram/src/hdr_histogram.c
-index a34de2c1b2..7a1531a71e 100644
---- a/deps/histogram/src/hdr_histogram.c
-+++ b/deps/histogram/src/hdr_histogram.c
-@@ -34,9 +34,14 @@
- #  define HDR_UNLIKELY(x) (x)
- #endif
-
--/* Runtime-dispatched AVX2 path: keep the rest of this TU at the project's
--   baseline ISA so the shipped binary does not silently require AVX2. */
--#if (defined(__x86_64__) || defined(_M_X64) || defined(__i386__) || defined(_M_IX86)) \
-+/* Runtime-dispatched AVX2 path; rest of TU stays at baseline ISA so the binary
-+   doesn't silently require AVX2. 64-bit x86 + GCC/Clang only:
-+     - 32-bit x86: _mm_extract_epi64 unavailable in 32-bit codegen.
-+     - _MSC_VER: __builtin_cpu_supports's __cpu_model isn't linked under MSVC;
-+       clang-cl also defines __x86_64__/__clang__ so this exclusion is load-bearing.
-+     - __INTEL_COMPILER: ICC classic. */
-+#if !defined(HDR_DISABLE_AVX2) \
-+    && defined(__x86_64__) \
-     && (defined(__GNUC__) || defined(__clang__)) && !defined(__INTEL_COMPILER) && !defined(_MSC_VER)
- #  define HDR_HAS_AVX2_DISPATCH 1
- #  include <immintrin.h>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0001-Do-not-use-glob-in-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs-26/0001-Do-not-use-glob-in-deps.patch
similarity index 94%
rename from meta-oe/recipes-devtools/nodejs/nodejs-24/0001-Do-not-use-glob-in-deps.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-26/0001-Do-not-use-glob-in-deps.patch
index 622d25bbd3..de65a01829 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs-24/0001-Do-not-use-glob-in-deps.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-26/0001-Do-not-use-glob-in-deps.patch
@@ -34,11 +34,13 @@ do_unpack[postfuncs] += "prune_sources"
 
 Upstream-Status: Inappropriate [embedded specific]
 
+diff --git a/Makefile b/Makefile
+index 15de440..c6f95ca 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -179,7 +179,7 @@ with-code-cache test-code-cache:
+@@ -181,7 +181,7 @@ with-code-cache test-code-cache:
  	$(warning '$@' target is a noop)
-
+ 
  out/Makefile: config.gypi common.gypi node.gyp \
 -	deps/*/*.gyp \
 +	deps/llhttp/llhttp.gyp deps/ada/ada.gyp deps/nbytes/nbytes.gyp \
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0002-v8-don-t-override-ARM-CFLAGS.patch b/meta-oe/recipes-devtools/nodejs/nodejs-26/0002-v8-don-t-override-ARM-CFLAGS.patch
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs-24/0002-v8-don-t-override-ARM-CFLAGS.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-26/0002-v8-don-t-override-ARM-CFLAGS.patch
index cc920118a2..107103e452 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs-24/0002-v8-don-t-override-ARM-CFLAGS.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-26/0002-v8-don-t-override-ARM-CFLAGS.patch
@@ -24,14 +24,14 @@ problems have been noted during compilation or runtime.
 Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: André Draszik <git@andred.net>
 ---
- tools/v8_gypfiles/toolchain.gypi | 52 ++------------------------------
+ tools/v8_gypfiles/toolchain.gypi | 52 ++--------------------------------------
  1 file changed, 2 insertions(+), 50 deletions(-)
 
 diff --git a/tools/v8_gypfiles/toolchain.gypi b/tools/v8_gypfiles/toolchain.gypi
-index 9d1b0987..4df15e60 100644
+index 3676848..ac6fee0 100644
 --- a/tools/v8_gypfiles/toolchain.gypi
 +++ b/tools/v8_gypfiles/toolchain.gypi
-@@ -203,31 +203,7 @@
+@@ -192,31 +192,7 @@
          'target_conditions': [
            ['_toolset=="host"', {
              'conditions': [
@@ -64,7 +64,7 @@ index 9d1b0987..4df15e60 100644
                  # Host not built with an Arm CXX compiler (simulator build).
                  'conditions': [
                    [ 'arm_float_abi=="hard"', {
-@@ -246,31 +222,7 @@
+@@ -235,31 +211,7 @@
            }],  # _toolset=="host"
            ['_toolset=="target"', {
              'conditions': [
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0003-system-c-ares.patch b/meta-oe/recipes-devtools/nodejs/nodejs-26/0003-system-c-ares.patch
similarity index 93%
rename from meta-oe/recipes-devtools/nodejs/nodejs-24/0003-system-c-ares.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-26/0003-system-c-ares.patch
index 6f08c71e18..c8348a3985 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs-24/0003-system-c-ares.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-26/0003-system-c-ares.patch
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 9 insertions(+), 1 deletion(-)
 
 diff --git a/src/cares_wrap.h b/src/cares_wrap.h
-index 021ef1c9..820c5d88 100644
+index fd66a67..e3720e5 100644
 --- a/src/cares_wrap.h
 +++ b/src/cares_wrap.h
-@@ -23,7 +23,15 @@
+@@ -24,7 +24,15 @@
  # include <netdb.h>
  #endif  // __POSIX__
  
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0004-liftoff-Correct-function-signatures.patch b/meta-oe/recipes-devtools/nodejs/nodejs-26/0004-liftoff-Correct-function-signatures.patch
similarity index 65%
rename from meta-oe/recipes-devtools/nodejs/nodejs-24/0004-liftoff-Correct-function-signatures.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-26/0004-liftoff-Correct-function-signatures.patch
index 5e617e6554..31547fae7b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs-24/0004-liftoff-Correct-function-signatures.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-26/0004-liftoff-Correct-function-signatures.patch
@@ -12,16 +12,15 @@ Upstream-Status: Submitted [https://chromium-review.googlesource.com/c/v8/v8/+/3
 
 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
- deps/v8/src/wasm/baseline/liftoff-assembler.h               | 6 +++---
- .../src/wasm/baseline/mips64/liftoff-assembler-mips64-inl.h | 2 +-
- .../src/wasm/baseline/riscv/liftoff-assembler-riscv64-inl.h | 2 +-
- 3 files changed, 5 insertions(+), 5 deletions(-)
+ deps/v8/src/wasm/baseline/liftoff-assembler.h                   | 6 +++---
+ deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64-inl.h | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/deps/v8/src/wasm/baseline/liftoff-assembler.h b/deps/v8/src/wasm/baseline/liftoff-assembler.h
-index 7cb2f500..713d16db 100644
+index 160ec7a..ea759a2 100644
 --- a/deps/v8/src/wasm/baseline/liftoff-assembler.h
 +++ b/deps/v8/src/wasm/baseline/liftoff-assembler.h
-@@ -681,7 +681,7 @@ class LiftoffAssembler : public MacroAssembler {
+@@ -622,7 +622,7 @@ class LiftoffAssembler : public MacroAssembler {
    void FinishCall(const ValueKindSig*, compiler::CallDescriptor*);
  
    // Move {src} into {dst}. {src} and {dst} must be different.
@@ -30,7 +29,7 @@ index 7cb2f500..713d16db 100644
  
    // Parallel register move: For a list of tuples <dst, src, kind>, move the
    // {src} register of kind {kind} into {dst}. If {src} equals {dst}, ignore
-@@ -851,8 +851,8 @@ class LiftoffAssembler : public MacroAssembler {
+@@ -824,8 +824,8 @@ class LiftoffAssembler : public MacroAssembler {
    inline void MoveStackValue(uint32_t dst_offset, uint32_t src_offset,
                               ValueKind);
  
@@ -42,10 +41,10 @@ index 7cb2f500..713d16db 100644
    inline void Spill(int offset, LiftoffRegister, ValueKind);
    inline void Spill(int offset, WasmValue);
 diff --git a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64-inl.h b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64-inl.h
-index bd59f162..56b4d70c 100644
+index a05d03b..b55d808 100644
 --- a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64-inl.h
 +++ b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64-inl.h
-@@ -672,7 +672,7 @@ void LiftoffAssembler::Store(Register dst_addr, Register offset_reg,
+@@ -684,7 +684,7 @@ void LiftoffAssembler::Store(Register dst_addr, Register offset_reg,
      pinned.set(dst_op.rm());
      LiftoffRegister tmp = kScratchReg2;
      // Save original value.
@@ -54,16 +53,3 @@ index bd59f162..56b4d70c 100644
  
      src = tmp;
      pinned.set(tmp);
-diff --git a/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64-inl.h b/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64-inl.h
-index a3c94af0..456e5334 100644
---- a/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64-inl.h
-+++ b/deps/v8/src/wasm/baseline/riscv/liftoff-assembler-riscv64-inl.h
-@@ -452,7 +452,7 @@ void LiftoffAssembler::Store(Register dst_addr, Register offset_reg,
-     pinned.set(dst_op.rm());
-     LiftoffRegister tmp = GetUnusedRegister(src.reg_class(), pinned);
-     // Save original value.
--    Move(tmp, src, type.value_type());
-+    Move(tmp, src, type.value_type().kind());
- 
-     src = tmp;
-     pinned.set(tmp);
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0006-deps-disable-io_uring-support-in-libuv.patch b/meta-oe/recipes-devtools/nodejs/nodejs-26/0006-deps-disable-io_uring-support-in-libuv.patch
similarity index 90%
rename from meta-oe/recipes-devtools/nodejs/nodejs-24/0006-deps-disable-io_uring-support-in-libuv.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-26/0006-deps-disable-io_uring-support-in-libuv.patch
index 50d63cf78c..743cf8e62d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs-24/0006-deps-disable-io_uring-support-in-libuv.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-26/0006-deps-disable-io_uring-support-in-libuv.patch
@@ -18,13 +18,14 @@ Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
 Updated by Jason Schonberg <schonm@gamil.com> August 1, 2025 for nodejs 22.18.0
 which uses libuv 1.51.0
 ---
- deps/uv/src/unix/linux.c | 29 +----------------------------
- 1 file changed, 1 insertion(+), 28 deletions(-)
+ deps/uv/src/unix/linux.c | 31 +------------------------------
+ 1 file changed, 1 insertion(+), 30 deletions(-)
 
 diff --git a/deps/uv/src/unix/linux.c b/deps/uv/src/unix/linux.c
+index 1109648..ca84eb5 100644
 --- a/deps/uv/src/unix/linux.c
 +++ b/deps/uv/src/unix/linux.c
-@@ -465,36 +465,7 @@
+@@ -462,36 +462,7 @@ static int uv__use_io_uring(uint32_t flags) {
    /* See https://github.com/libuv/libuv/issues/4283. */
    return 0; /* Random SIGSEGV in signal handler. */
  #else
@@ -62,4 +63,3 @@ diff --git a/deps/uv/src/unix/linux.c b/deps/uv/src/unix/linux.c
  #endif
  }
  
- 
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0007-positional-args.patch b/meta-oe/recipes-devtools/nodejs/nodejs-26/0007-positional-args.patch
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs-24/0007-positional-args.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-26/0007-positional-args.patch
index 42b2e6c8e0..d34cbe4814 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs-24/0007-positional-args.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-26/0007-positional-args.patch
@@ -9,6 +9,7 @@ Upstream-Status: Inappropriate [embedded specific]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/test/fixtures/run-script/node_modules/.bin/positional-args b/test/fixtures/run-script/node_modules/.bin/positional-args
+index 18c7bfa..1739ce6 100755
 --- a/test/fixtures/run-script/node_modules/.bin/positional-args
 +++ b/test/fixtures/run-script/node_modules/.bin/positional-args
 @@ -1,3 +1,3 @@
@@ -16,5 +17,3 @@ diff --git a/test/fixtures/run-script/node_modules/.bin/positional-args b/test/f
 +#!/bin/sh
  echo "Arguments: '$@'"
  echo "The total number of arguments is: $#"
---
-2.34.1
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0008-custom-env.patch b/meta-oe/recipes-devtools/nodejs/nodejs-26/0008-custom-env.patch
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs-24/0008-custom-env.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-26/0008-custom-env.patch
index 532d3c5f51..34f6b80348 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs-24/0008-custom-env.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-26/0008-custom-env.patch
@@ -9,7 +9,7 @@ Upstream-Status: Inappropriate [embedded specific]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/test/fixtures/run-script/node_modules/.bin/custom-env b/test/fixtures/run-script/node_modules/.bin/custom-env
-index e6f291c6..1430f2e9 100755
+index e6f291c..1430f2e 100755
 --- a/test/fixtures/run-script/node_modules/.bin/custom-env
 +++ b/test/fixtures/run-script/node_modules/.bin/custom-env
 @@ -1,2 +1,2 @@
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0009-Using-native-binaries.patch b/meta-oe/recipes-devtools/nodejs/nodejs-26/0009-Using-native-binaries.patch
similarity index 93%
rename from meta-oe/recipes-devtools/nodejs/nodejs-24/0009-Using-native-binaries.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-26/0009-Using-native-binaries.patch
index 2e2d2bf3f7..baf7114bf4 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs-24/0009-Using-native-binaries.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-26/0009-Using-native-binaries.patch
@@ -22,9 +22,10 @@ Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
  2 files changed, 8 insertions(+)
 
 diff --git a/node.gyp b/node.gyp
+index 5334b8a..d2b3ce6 100644
 --- a/node.gyp
 +++ b/node.gyp
-@@ -993,6 +993,7 @@
+@@ -1062,6 +1062,7 @@
            'action_name': 'node_js2c',
            'process_outputs_as_sources': 1,
            'inputs': [
@@ -32,7 +33,7 @@ diff --git a/node.gyp b/node.gyp
              '<(node_js2c_exec)',
              '<@(library_files)',
              '<@(deps_files)',
-@@ -1013,6 +1014,7 @@
+@@ -1082,6 +1083,7 @@
            ],
            'action': [
              '<@(emulator)',
@@ -40,7 +41,7 @@ diff --git a/node.gyp b/node.gyp
              '<(node_js2c_exec)',
              '<@(_outputs)',
              'lib',
-@@ -1072,6 +1074,7 @@
+@@ -1141,6 +1143,7 @@
                    'action_name': 'node_mksnapshot',
                    'process_outputs_as_sources': 1,
                    'inputs': [
@@ -49,9 +50,10 @@ diff --git a/node.gyp b/node.gyp
                      '<(node_snapshot_main)',
                    ],
 diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
+index fd8394b..85dfc80 100644
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
-@@ -113,6 +113,7 @@
+@@ -121,6 +121,7 @@
          {
            'action_name': 'run_torque_action',
            'inputs': [  # Order matters.
@@ -59,7 +61,7 @@ diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
              '<@(torque_files)',
            ],
-@@ -145,6 +146,7 @@
+@@ -153,6 +154,7 @@
            ],
            'action': [
              '<@(emulator)',
@@ -67,7 +69,7 @@ diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
              '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated',
              '-v8-root', '<(V8_ROOT)',
-@@ -257,6 +259,7 @@
+@@ -265,6 +267,7 @@
          {
            'action_name': 'generate_bytecode_builtins_list_action',
            'inputs': [
@@ -75,7 +77,7 @@ diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)',
            ],
            'outputs': [
-@@ -443,6 +446,7 @@
+@@ -430,6 +433,7 @@
              ],
            },
            'inputs': [
@@ -83,7 +85,7 @@ diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
              '<(mksnapshot_exec)',
            ],
            'outputs': [
-@@ -1976,6 +1980,7 @@
+@@ -2084,6 +2088,7 @@
          {
            'action_name': 'run_gen-regexp-special-case_action',
            'inputs': [
@@ -91,5 +93,3 @@ diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUTABLE_SUFFIX)',
            ],
            'outputs': [
---
-2.34.1
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0011-v8-handle-supplementary-case-equivalents-of-BMP-characters.patch b/meta-oe/recipes-devtools/nodejs/nodejs-26/0011-v8-handle-supplementary-case-equivalents-of-BMP-characters.patch
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs-24/0011-v8-handle-supplementary-case-equivalents-of-BMP-characters.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-26/0011-v8-handle-supplementary-case-equivalents-of-BMP-characters.patch
index 36703eedd4..a1b1e9d71a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs-24/0011-v8-handle-supplementary-case-equivalents-of-BMP-characters.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-26/0011-v8-handle-supplementary-case-equivalents-of-BMP-characters.patch
@@ -47,7 +47,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  3 files changed, 77 insertions(+), 6 deletions(-)
 
 diff --git a/deps/v8/src/regexp/gen-regexp-special-case.cc b/deps/v8/src/regexp/gen-regexp-special-case.cc
-index 86f6b212c93..98f70975be1 100644
+index 86f6b21..98f7097 100644
 --- a/deps/v8/src/regexp/gen-regexp-special-case.cc
 +++ b/deps/v8/src/regexp/gen-regexp-special-case.cc
 @@ -9,6 +9,7 @@
@@ -111,7 +111,7 @@ index 86f6b212c93..98f70975be1 100644
  
  void WriteHeader(const char* header_filename) {
 diff --git a/deps/v8/src/regexp/regexp-parser.cc b/deps/v8/src/regexp/regexp-parser.cc
-index 2792cd0f1e9..dd883c3eddc 100644
+index 2792cd0..dd883c3 100644
 --- a/deps/v8/src/regexp/regexp-parser.cc
 +++ b/deps/v8/src/regexp/regexp-parser.cc
 @@ -10,6 +10,7 @@
@@ -158,7 +158,7 @@ index 2792cd0f1e9..dd883c3eddc 100644
    }
    // In the case where ICU is not included, we act as if the unicode flag is
 diff --git a/deps/v8/src/regexp/special-case.h b/deps/v8/src/regexp/special-case.h
-index 753c9231ede..80b88a308cc 100644
+index 753c923..80b88a3 100644
 --- a/deps/v8/src/regexp/special-case.h
 +++ b/deps/v8/src/regexp/special-case.h
 @@ -7,8 +7,8 @@
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/run-ptest b/meta-oe/recipes-devtools/nodejs/nodejs-26/run-ptest
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-24/run-ptest
rename to meta-oe/recipes-devtools/nodejs/nodejs-26/run-ptest
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.22/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-26.13/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-24.22/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-26.13/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.22.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_26.13.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_24.22.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_26.13.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.22.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_26.13.1.bb
similarity index 91%
rename from meta-oe/recipes-devtools/nodejs/nodejs_24.22.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_26.13.1.bb
index 166d1b018f..c42b07acf3 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.22.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_26.13.1.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "Apache-2.0 AND Artistic-2.0 AND BSD-2-Clause AND BSD-3-Clause AND BlueOak-1.0.0 AND ISC AND MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=edc0683b77d2c503217642fa000b5b31"
-FILESEXTRAPATHS:prepend := "${THISDIR}/nodejs-24:"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=89253653f0ff2153f09502963f07bb42"
+FILESEXTRAPATHS:prepend := "${THISDIR}/nodejs-26:"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -29,15 +29,17 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0006-deps-disable-io_uring-support-in-libuv.patch \
            file://0007-positional-args.patch \
            file://0008-custom-env.patch \
-           file://0010-v8-fix-Wtemplate-body-error-with-GCC-15-on-ia32.patch \
            file://0011-v8-handle-supplementary-case-equivalents-of-BMP-characters.patch \
-           file://0012-histogram-restrict-avx2-dispatch-to-x86_64.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \
            file://0009-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "48ca3aa8a9b02133356922ef4fc80200e00598c80a4ef446f7c39a459222593d"
+SRC_URI[sha256sum] = "a7f6204ff63b6a2cd274d48903285abb86ed53a99070e532d4c2fd787457d9e6"
+
+# Even-numbered majors are the LTS lines
+UPSTREAM_CHECK_URI = "https://nodejs.org/dist/"
+UPSTREAM_CHECK_REGEX = "v(?P<pver>\d*[02468]\.\d+\.\d+)/"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
@@ -144,6 +146,7 @@ do_configure () {
     # $TARGET_ARCH settings don't match --dest-cpu settings
     python3 configure.py --verbose --prefix=${prefix} \
                --shared-openssl \
+               --v8-disable-temporal-support \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
                --dest-os=linux \
                --libdir=${baselib} \
@@ -172,7 +175,7 @@ do_install_ptest () {
 }
 
 PACKAGES =+ "${PN}-npm"
-FILES:${PN}-npm = "${nonarch_libdir}/node_modules ${bindir}/npm ${bindir}/npx ${bindir}/corepack"
+FILES:${PN}-npm = "${nonarch_libdir}/node_modules ${bindir}/npm ${bindir}/npx"
 RDEPENDS:${PN}-npm = "bash python3-core python3-shell python3-datetime \
     python3-misc python3-multiprocessing"
 
@@ -198,7 +201,10 @@ python set_gyp_variables () {
         d.setVar("CC_host", d.getVar("BUILD_CC"))
         d.setVar("CFLAGS_host", d.getVar("BUILD_CFLAGS"))
         d.setVar("CXX_host", d.getVar("BUILD_CXX"))
-        d.setVar("CXXFLAGS_host", d.getVar("BUILD_CXXFLAGS"))
+        # V8's NEON hex decoding (src/objects/simd.cc) relies on implicit vector
+        # conversions, which GCC rejects without -flax-vector-conversions
+        d.setVar("CXXFLAGS_host", d.getVar("BUILD_CXXFLAGS") +
+                 (" -flax-vector-conversions" if d.getVar("BUILD_ARCH") == "aarch64" else ""))
         d.setVar("LDFLAGS_host", d.getVar("BUILD_LDFLAGS"))
         d.setVar("AR_host", d.getVar("BUILD_AR"))
 }
