Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FC9ED7BA7
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:39:59 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15854.1776163197755722549
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dHS3LHuM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163198; x=1807699198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jvhzZs9T6SKFV0VIVBNr6D58qMM97SCF3Nb7PBaeXLc=;
  b=dHS3LHuMXLPqR5l4enp7iDj/O9Sibk0x8V6Ri5EHkDMZ6szfeIOyk5Ak
   9d0268Kcr4ABno2jaIRGLecuIedwMHIlfG0ymCT6gVwi5ssT3/bCrYv+m
   JNVKYE++TVxtLR11lnJDezXceiJJyHtXrkyQcWtQdAGHGW6cAiMVTadkF
   Y+rNJJ6MW3TZpHjsilzncc8iIxvIjzpRY3y3DM9voL7WDh/RJLr5+AG80
   KUNMJMbI6HAPCQT7X3CdErdnv5b5vbpYCdQu6JoaLeW5uRoxJhamn6MUL
   NMf24Xb0T7J7z3D5KrRfSy+mr9rd6dflTroPChHq97S4rkEF5LaN6Ow/t
   w==;
X-CSE-ConnectionGUID: cAlVBF0uSYS0zkJk7Zatsg==
X-CSE-MsgGUID: ijvbRXcWTrucEMEM2jQVMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236867034"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236867034"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:39:57 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 36DA0C0009E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:56 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E36BD18002C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 774E814000E2;
	Tue, 14 Apr 2026 10:39:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/32] libsodium: upgrade 1.0.21 -> 1.0.22
Date: Tue, 14 Apr 2026 18:38:23 +0800
Message-ID: <20260414103845.1728-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126314

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-compilation-with-GCC-on-aarch64.patch
removed since it's included in 1.0.22

Changelog:
============
- Post-quantum key encapsulation is now available. ML-KEM768, the
  NIST-standardized lattice-based KEM, is accessible through the
  'crypto_kem_mlkem768_*()' functions.
- X-Wing, a hybrid KEM combining ML-KEM768 with X25519 for protection
  against both classical and quantum adversaries, is available through the
  'crypto_kem_*()' functions. X-Wing is the recommended KEM for most
  applications.
- SHA-3 hash functions are now available as 'crypto_hash_sha3256_*()'
  and 'crypto_hash_sha3512_*()', with both one-shot and streaming APIs.
- Performance: NEON optimizations for Argon2 on ARM platforms.
- Performance: SHA3 (Keccak1600) now leverages ARM SHA3 instructions when
  available on ARM platforms.
- Performance: WebAssembly SIMD implementations of Argon2 have been added.
- Emscripten: LTO is now disabled. With Emscripten 4, LTO produced
  WebAssembly modules with functions that ran significantly slower than
  without it.
- Emscripten: a new option allows compilation with SIMD support.
- Emscripten: native ESM module generation is now supported.
- JavaScript sumo builds now allow up to 80 MiB memory usage, so that
  'crypto_pwhash' with the interactive settings can be used in pure
  JavaScript, not just WebAssembly.
- XOF state alignment has been relaxed.
- 'crypto_core_keccak1600_state' has been added.
- Export missing 'crypto_ipcrypt_nd_keygen()' helper function.
- 'crypto_auth_hmacsha256_init' and 'crypto_auth_hmacsha512_init' now
  accept NULL key pointers (with a zero key length), for consistency with
  other '_init' functions.
- apple-xcframework: headers are now in a Clibsodium subdirectory
  to prevent module.modulemap collisions with other xcframeworks.
- Fixed compilation with GCC on aarch64 and gcc 4.x.
- On aarch64, aes256-gcm is now enabled even when not using clang,
  including MSVC.
- Added compatibility with Visual Studio 2026 when toolsets do not
  define PlatformToolsetVersion.
- Libsodium can be directly used as a dependency in a Zig project.
- Performance of MSVC builds has been improved.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-Fix-compilation-with-GCC-on-aarch64.patch | 49 -------------------
 ...ibsodium_1.0.21.bb => libsodium_1.0.22.bb} |  6 +--
 2 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-crypto/libsodium/libsodium/0001-Fix-compilation-with-GCC-on-aarch64.patch
 rename meta-oe/recipes-crypto/libsodium/{libsodium_1.0.21.bb => libsodium_1.0.22.bb} (68%)

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium/0001-Fix-compilation-with-GCC-on-aarch64.patch b/meta-oe/recipes-crypto/libsodium/libsodium/0001-Fix-compilation-with-GCC-on-aarch64.patch
deleted file mode 100644
index c5c0d12b87..0000000000
--- a/meta-oe/recipes-crypto/libsodium/libsodium/0001-Fix-compilation-with-GCC-on-aarch64.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From fc66d1bd0d3db6392424a1fd10dcf4343ce72c52 Mon Sep 17 00:00:00 2001
-From: Frank Denis <github@pureftpd.org>
-Date: Wed, 7 Jan 2026 12:00:49 +0100
-Subject: [PATCH] Fix compilation with GCC on aarch64
-
-Use unsigned NEON intrinsics everywhere
-
-Fixes #1502
-
-Upstream-Status: Backport [https://github.com/jedisct1/libsodium/commit/6702f69bef6044163acc7715e6ac7e430890ce78]
----
- src/libsodium/crypto_ipcrypt/ipcrypt_armcrypto.c | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/libsodium/crypto_ipcrypt/ipcrypt_armcrypto.c b/src/libsodium/crypto_ipcrypt/ipcrypt_armcrypto.c
-index c5a27e92..bad4ce38 100644
---- a/src/libsodium/crypto_ipcrypt/ipcrypt_armcrypto.c
-+++ b/src/libsodium/crypto_ipcrypt/ipcrypt_armcrypto.c
-@@ -37,7 +37,7 @@ typedef uint64x2_t BlockVec;
- #    define XOR128_3(a, b, c) veorq_u64(veorq_u64((a), (b)), (c))
- #    define SET64x2(a, b)     vsetq_lane_u64((uint64_t) (a), vmovq_n_u64((uint64_t) (b)), 1)
- #    define BYTESHL128(a, b) \
--        vreinterpretq_u64_u8(vextq_s8(vdupq_n_s8(0), vreinterpretq_s8_u64(a), 16 - (b)))
-+        vreinterpretq_u64_u8(vextq_u8(vdupq_n_u8(0), vreinterpretq_u8_u64(a), 16 - (b)))
- 
- #    define AES_XENCRYPT(block_vec, rkey) \
-         vreinterpretq_u64_u8(             \
-@@ -348,12 +348,12 @@ pfx_set_bit(uint8_t ip16[16], const unsigned int bit_index, const uint8_t bit_va
- static void
- pfx_shift_left(uint8_t ip16[16])
- {
--    BlockVec       v       = LOAD128(ip16);
--    const BlockVec shl     = vshlq_n_u8(vreinterpretq_u8_u64(v), 1);
--    const BlockVec msb     = vshrq_n_u8(vreinterpretq_u8_u64(v), 7);
--    const BlockVec zero    = vdupq_n_u8(0);
--    const BlockVec carries = vextq_u8(vreinterpretq_u8_u64(msb), zero, 1);
--    v                      = vreinterpretq_u64_u8(vorrq_u8(shl, carries));
-+    BlockVec         v       = LOAD128(ip16);
-+    const uint8x16_t shl     = vshlq_n_u8(vreinterpretq_u8_u64(v), 1);
-+    const uint8x16_t msb     = vshrq_n_u8(vreinterpretq_u8_u64(v), 7);
-+    const uint8x16_t zero    = vdupq_n_u8(0);
-+    const uint8x16_t carries = vextq_u8(msb, zero, 1);
-+    v                        = vreinterpretq_u64_u8(vorrq_u8(shl, carries));
-     STORE128(ip16, v);
- }
- 
--- 
-2.47.3
-
diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.21.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.22.bb
similarity index 68%
rename from meta-oe/recipes-crypto/libsodium/libsodium_1.0.21.bb
rename to meta-oe/recipes-crypto/libsodium/libsodium_1.0.22.bb
index a1647d2a30..fbd14a8181 100644
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.21.bb
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.22.bb
@@ -4,10 +4,8 @@ BUGTRACKER = "https://github.com/jedisct1/libsodium/issues"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4942a8ebbbc7f2212bd68a47df264a4f"
 
-SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz \
-           file://0001-Fix-compilation-with-GCC-on-aarch64.patch \
-           "
-SRC_URI[sha256sum] = "9e4285c7a419e82dedb0be63a72eea357d6943bc3e28e6735bf600dd4883feaf"
+SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
+SRC_URI[sha256sum] = "adbdd8f16149e81ac6078a03aca6fc03b592b89ef7b5ed83841c086191be3349"
 
 
 inherit autotools
-- 
2.43.0


