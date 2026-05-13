Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329CECD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 23:30:11 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.941.1778715002674088386
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 16:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a3x35ws3;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-651c366f7efso8161723d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 16:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778715001; x=1779319801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6dYrxWp26mjKqz+Wgmv6zZH5Y6MNfL6UaLrfJkNYxPE=;
        b=a3x35ws3ke5mGxyCG8XzifXXj5bLAWtcvlB/ktY46TNatYfJSGKYbQKvQSJIGgkt8A
         6uzYBdIE/nukPW5KUgZQq1vu0xUfafeVXoVdo3blIa64M+n3CqT2rnkGE/CqlnKKoUGi
         GLUfoQwVg3cIVcQjWqA3AWe5ORW1p0n9fdvknCqjfFHMIn3UAJqVtD8BJCWAp+Jxf2Rh
         d9PVLmgTEk1exYfE9nefu0iwcI38c2UV/+16CHEPcdyiFyCJNtNt96c4t6iJ1986a3H0
         Fe7H/aT8QgvOLJwcrnaS+yUnZDiFjyIF5zHpFbg60oVpu6dAcmlEpAy5IPyvhoyB21qD
         No1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778715001; x=1779319801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dYrxWp26mjKqz+Wgmv6zZH5Y6MNfL6UaLrfJkNYxPE=;
        b=slftOS5mKJx3RiKLq1IrLRqZOsna3xFpfbPL2evZacpdUZFtxcSNoYJ2equgkpe+qp
         96PWCJAlEwx4A6eCL8YZQADCNbfljKXqD7qzpjPrcH39FWpRljhhNVu6u4POHUiyz0w2
         wcw8/1HYo6EnosN3tOkgALdhVllu0dApNQwGOz4bLpECriY6Qw1W4iqqTh57+TF5K5VT
         kfaFzbfnZuDR7JKyl6IXyJgTI+VBL7pGYWz7g/aCnayRnfm2PmWWnfer+bmUEjnJejP6
         4ZdGjnPw0vvuyinXkq58/apAJPhhxY3zDg0Ug+E6DRgcBl4U1udimgQw0R8ka9/yuhU/
         4NKw==
X-Gm-Message-State: AOJu0YxsDitKHwTAdkUgI9K7OJoe/1a10wGOOLFdsIBmdr3iDmYJB9OR
	0NEbMqBp1Mvv5nNcbmvuCrjRJKyRm+f3JNgDIkfusC7Fhjj9lxrT0TGRptgXYb85
X-Gm-Gg: Acq92OHB/RpfdlVMURieVDutgWMyw/W3NJqRIh+6VvxG98QkRLNF2auuFzpVR0oEpQU
	AcziBmt9Yp8AEOVYCl1qtUag0uJ9IL7sExcbiULOcWUl0LnCWdr+guOkJw/Kx5ifm8ci3UDguXr
	sPW50nQX3UgtL6rT0tzHTOwgoSP3gzdOnkz46vdEE1mtx4TTgIi5PsAhiM8azXauEd23EoLODfo
	a0LBxZpTxLOyE5DvBDWFo0mubk0WwyFBd2MX1uVl61W3mvKClHVh/4kDSIF6/IHodBDJUyllxUk
	C0PTCBw8IFMrccz6QGDqlXL5oj15GMXtHeag5NFHmLsS0nEjrrW7Ym9M/IhYp4e6Rr2Lv/Yqj9k
	+PrumdjZgVxsoU89By1vGKvr6c51PxcVb/v93TCo+IYfRk9BGxbn9qL/mVdn4RZMn3Whae8PSOa
	BW3+YzZ9R97eP9dIcCmdt3FlYLMi08lYHiYuREyESCn4YqKM4YuTSQOMG9KT+EFmamRpUcbYNqd
	9uGLNoJhoeCfFZm+tpvD+tljUoBlldSMc5cNnD4mS5UaUrV64Y=
X-Received: by 2002:a05:690c:9988:b0:7bd:cf35:e33b with SMTP id 00721157ae682-7c6aa50d525mr59586417b3.17.1778715001216;
        Wed, 13 May 2026 16:30:01 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f2ba567csm5044237b3.18.2026.05.13.16.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 16:30:00 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.22.2 -> 22.22.3
Date: Wed, 13 May 2026 19:29:20 -0400
Message-ID: <20260513232920.428901-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 23:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126978

With this upgrade, nodejs updated the llhttp dependency to version 9.3.1
So some of the patches are nolonger necessary.

Changelog: https://github.com/nodejs/node/releases/tag/v22.22.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../0001-detect-aarch64-Neon-correctly.patch  | 51 ----------------
 .../0001-fix-arm-Neon-intrinsics-types.patch  | 59 ------------------
 ...header-value-__builtin_ctzll-undefin.patch | 60 -------------------
 .../{nodejs_22.22.2.bb => nodejs_22.22.3.bb}  |  5 +-
 4 files changed, 1 insertion(+), 174 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-detect-aarch64-Neon-correctly.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-fix-arm-Neon-intrinsics-types.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.22.2.bb => nodejs_22.22.3.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-detect-aarch64-Neon-correctly.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-detect-aarch64-Neon-correctly.patch
deleted file mode 100644
index 15de2c1119..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-detect-aarch64-Neon-correctly.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 41ec2d5302b77be27ca972102c29ce12471ed4b0 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Thu, 12 Feb 2026 11:09:44 +0100
-Subject: [PATCH 2/2] detect aarch64 Neon correctly
-
-The llhttp vendored dependency of nodejs takes advantage of Arm NEON
-instructions when they are available, however they are detected by
-checking for an outdated CPU feature macro: it checks for __ARM_NEON__,
-however it is not defined by new compilers for aarch64, rather they
-set __ARM_NEON. The Arm C extension guide[1] refers to __ARM_NEON macro
-aswell.
-
-This patch changes the detection to check for both macros when detecting
-the availability of NEON instructions.
-
-The code this patch modifies is generated, so the patch itself isn't
-suitable for upstream submission, as the root cause of the error is
-in the generator itself. A PR has been submitted[2] to the generator
-project to rectify this issue.
-
-[1]: https://developer.arm.com/documentation/ihi0053/d/ - pdf, section 6.9
-[2]: https://github.com/nodejs/llparse/pull/84
-
-Upstream-Status: Inappropriate [see above]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- deps/llhttp/src/llhttp.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/deps/llhttp/src/llhttp.c b/deps/llhttp/src/llhttp.c
-index a0e59e50..b069bbbb 100644
---- a/deps/llhttp/src/llhttp.c
-+++ b/deps/llhttp/src/llhttp.c
-@@ -10,7 +10,7 @@
-  #endif  /* _MSC_VER */
- #endif  /* __SSE4_2__ */
- 
--#ifdef __ARM_NEON__
-+#if defined(__ARM_NEON__) || defined(__ARM_NEON)
-  #include <arm_neon.h>
- #endif  /* __ARM_NEON__ */
- 
-@@ -2625,7 +2625,7 @@ static llparse_state_t llhttp__internal__run(
-         goto s_n_llhttp__internal__n_header_value_otherwise;
-       }
-       #endif  /* __SSE4_2__ */
--      #ifdef __ARM_NEON__
-+      #if defined(__ARM_NEON__) || defined(__ARM_NEON)
-       while (endp - p >= 16) {
-         uint8x16_t input;
-         uint8x16_t single;
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-fix-arm-Neon-intrinsics-types.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-fix-arm-Neon-intrinsics-types.patch
deleted file mode 100644
index ddbad575f0..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-fix-arm-Neon-intrinsics-types.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 3f4283dac7d88a89b42f1f2966a862cee5afe486 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Thu, 12 Feb 2026 11:03:53 +0100
-Subject: [PATCH 1/2] fix arm Neon intrinsics types
-
-The current code calls these intrinsics with incorrect datatypes
-(it uses a vector of uint16 instead of uint8), causing compilation
-to fail with the following error:
-
-| ../deps/llhttp/src/llhttp.c: In function 'llhttp__internal__run':
-| ../deps/llhttp/src/llhttp.c:2645:9: note: use '-flax-vector-conversions' to permit conversions between vectors with differing element types or numbers of subparts
-|  2645 |         );
-|       |         ^
-| ../deps/llhttp/src/llhttp.c:2643:11: error: incompatible type for argument 1 of 'vandq_u16'
-|  2643 |           vcgeq_u8(input, vdupq_n_u8(' ')),
-
-To avoid this, set the correct intrinsics call that matches the
-actual arguments.
-
-The code that this patch modifies is generated code, so in itself
-this change isn't appropriate for upstream. The actual problem
-is in the code generator itself, for which a PR is already pending
-for merging[1]. This patch is a port of that PR.
-
-[1]: https://github.com/nodejs/llparse/pull/79
-
-Upstream-Status: Inappropriate [see above]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- deps/llhttp/src/llhttp.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/deps/llhttp/src/llhttp.c b/deps/llhttp/src/llhttp.c
-index aa4c4682..887603fd 100644
---- a/deps/llhttp/src/llhttp.c
-+++ b/deps/llhttp/src/llhttp.c
-@@ -2639,17 +2639,17 @@ static llparse_state_t llhttp__internal__run(
-         /* Find first character that does not match `ranges` */
-         single = vceqq_u8(input, vdupq_n_u8(0x9));
-         mask = single;
--        single = vandq_u16(
-+        single = vandq_u8(
-           vcgeq_u8(input, vdupq_n_u8(' ')),
-           vcleq_u8(input, vdupq_n_u8('~'))
-         );
--        mask = vorrq_u16(mask, single);
--        single = vandq_u16(
-+        mask = vorrq_u8(mask, single);
-+        single = vandq_u8(
-           vcgeq_u8(input, vdupq_n_u8(0x80)),
-           vcleq_u8(input, vdupq_n_u8(0xff))
-         );
--        mask = vorrq_u16(mask, single);
--        narrow = vshrn_n_u16(mask, 4);
-+        mask = vorrq_u8(mask, single);
-+        narrow = vshrn_n_u16(vreinterpretq_u16_u8(mask), 4);
-         match_mask = ~vget_lane_u64(vreinterpret_u64_u8(narrow), 0);
-         match_len = __builtin_ctzll(match_mask) >> 2;
-         if (match_len != 16) {
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch
deleted file mode 100644
index 683dddcf04..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-llhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From a63a5faea54055973bf5f0a514444532563cc20d Mon Sep 17 00:00:00 2001
-From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
-Date: Fri, 27 Feb 2026 20:58:43 +0530
-Subject: [PATCH] llhttp: fix NEON header value __builtin_ctzll undefined
- behavior
-
-When all 16 bytes match the allowed range, match_mask becomes 0 after
-the bitwise NOT. Calling __builtin_ctzll(0) is undefined behavior per
-the C standard.
-
-The code expects match_len == 16 when all bytes match (so the branch
-is skipped and p += 16 continues the loop), but this relied on
-ctzll(0) returning 64, which is not guaranteed.
-
-GCC at -O2 exploits this UB by deducing that __builtin_ctzll() result
-is always in range [0, 63], and after >> 2 always in [0, 15], which
-is never equal to 16. The compiler then optimizes
-"if (match_len != 16)" to always-true, causing every valid 16-byte
-chunk to be falsely rejected as containing an invalid character.
-
-This manifests as HTTP 400 Bad Request (HPE_INVALID_HEADER_TOKEN) for
-any HTTP header value longer than 16 characters on ARM targets with
-NEON enabled.
-
-Fix by explicitly checking for match_mask == 0 and setting
-match_len = 16, avoiding the undefined behavior entirely. This bug
-affects both aarch64 and armv7 NEON targets.
-
-The fix has been merged upstream in llparse 7.3.1 [1] and is included
-in llhttp 9.3.1. This patch can be dropped when nodejs updates its
-bundled llhttp to >= 9.3.1.
-
-[1]: https://github.com/nodejs/llparse/pull/83
-
-Upstream-Status: Inappropriate
-Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
----
- deps/llhttp/src/llhttp.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/deps/llhttp/src/llhttp.c b/deps/llhttp/src/llhttp.c
-index 14b731e..b0a46c6 100644
---- a/deps/llhttp/src/llhttp.c
-+++ b/deps/llhttp/src/llhttp.c
-@@ -2651,7 +2651,11 @@ static llparse_state_t llhttp__internal__run(
-         mask = vorrq_u8(mask, single);
-         narrow = vshrn_n_u16(vreinterpretq_u16_u8(mask), 4);
-         match_mask = ~vget_lane_u64(vreinterpret_u64_u8(narrow), 0);
--        match_len = __builtin_ctzll(match_mask) >> 2;
-+        if (match_mask == 0) {
-+          match_len = 16;
-+        } else {
-+          match_len = __builtin_ctzll(match_mask) >> 2;
-+        }
-         if (match_len != 16) {
-           p += match_len;
-           goto s_n_llhttp__internal__n_header_value_otherwise;
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.3.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.22.3.bb
index 3a1385f70a..a13b71b762 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.3.bb
@@ -31,9 +31,6 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-positional-args.patch \
            file://0001-custom-env.patch \
            file://0001-build-remove-redundant-mXX-flags-for-V8.patch \
-           file://0001-fix-arm-Neon-intrinsics-types.patch \
-           file://0001-detect-aarch64-Neon-correctly.patch \
-           file://0001-llhttp-fix-NEON-header-value-__builtin_ctzll-undefin.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \
@@ -42,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "b6bedd3a8cacd5df7df015a5088264b12c74a277ba60684cb9642ae8eb743132"
+SRC_URI[sha256sum] = "f3e6a578db1ab335a4a72785c1e87ad18a2cf6d2fc25747a1d741fb34af0bd0f"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


