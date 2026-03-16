Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4D7F506D2
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 13:53:03 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50786.1773669175875262853
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 06:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=NN6Ef2wq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1334352-202603161352505dd3d4074400020721-hxfenw@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202603161352505dd3d4074400020721
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 16 Mar 2026 14:52:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=TzD4N6Tg7y4tskAfhjUYDVs4UyLS8MiB+QHGSS/XIZY=;
 b=NN6Ef2wq504tNN+KHPQEdJDZyhJnBkk+120eiVK24KkkFJeS4ljofb8PSe9As2/Ze9vutO
 s1jyAOG0czfBQgoI9/IH7vlYo+HKNhmEF00plB/pryguLcqwJ1u4o69f2ZWDZjxyXX7K38lN
 Gj4c4OZEP1Y6EzPHwxBxpN/rXcL73oNU+/xVlO1tRGKt3CzSpdsYQCAkpezMw6sM7/lma7Un
 D442c9OW50gIhoj3N6dJtKZVq3FLmFwqduBY9K5rJKy7BdEj6x0fXebFPlMxzpqVWVUNYsPt
 twoBIlY1MfzWCfM/GanIpHLKV4BerCH2dzMxD/pUzMEFH3zurIEdIksA==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH v2 07/14] libsodium: upgrade 1.0.20 -> 1.0.21
Date: Mon, 16 Mar 2026 14:51:43 +0100
Message-ID: <20260316135143.264762-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 13:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125278

License-Update: copyright years refreshed

Removed patch included in this release

Add path to fix compilation with gcc on aarch64

Changelog:
  https://github.com/jedisct1/libsodium/releases/tag/1.0.21-RELEASE

Changes:

Version 1.0.21
- security fix for the crypto_core_ed25519_is_valid_point() function
- new crypto_ipcrypt_* functions
- sodium_bin2ip and sodium_ip2bin helper functions
- XOF: the crypto_xof_shake* and crypto_xof_turboshake* functions

Version 1.0.20-stable
- XCFramework: cross-compilation is now forced on Apple Silicon to avoid Rosetta-related build issues
- The Fil-C compiler is supported out of the box
- The CompCert compiler is supported out of the box
- MSVC 2026 (Visual Studio 2026) is now supported
- Zig builds now support FreeBSD targets
- Performance of AES256-GCM and AEGIS on ARM has been improved with some compilers
- Android binaries have been added to the NuGet package
- Windows ARM binaries have been added to the NuGet package
- The Android build script has been improved. The base SDK is now 27c, and the default platform is 21, supporting 16 KB page sizes.
- The library can now be compiled with Zig 0.15 and Zig 0.16
- Zig builds now generate position-independent static libraries by default on targets that support PIC
- arm64e builds have been added to the XCFramework packages
- XCFramework packages are now full builds instead of minimal builds
- MSVC builds have been enabled for ARM64
- iOS 32-bit (armv7/armv7s) support has been removed from the XCFramework build script
- Security: optblockers have been introduced in critical code paths to prevent compilers from introducing unwanted side channels via conditional jumps. This was observed on RISC-V targets with specific compilers and options.
- Security: crypto_core_ed25519_is_valid_point() now properly rejects small-order points that are not in the main subgroup
- ((nonnull)) attributes have been relaxed on some crypto_stream* functions to allow NULL output buffers when the output length is zero
- A cross-compilation issue with old clang versions has been fixed
- JavaScript: support for Cloudflare Workers has been added
- JavaScript: WASM_BIGINT is forcibly disabled to retain compatibility with older runtimes
- A compilation issue with old toolchains on Solaris has been fixed
- crypto_aead_aes256gcm_is_available is exported to JavaScript
- libsodium is now compatible with Emscripten 4.x
- Security: memory fences have been added after MAC verification in AEAD to prevent speculative access to plaintext before authentication is complete
- Assembly files now include .gnu.property notes for proper IBT and Shadow Stack support when building with CET instrumentation.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 ...-Fix-compilation-with-GCC-on-aarch64.patch | 49 +++++++++++++++
 .../libsodium/libsodium/CVE-2025-69277.patch  | 61 -------------------
 ...ibsodium_1.0.20.bb => libsodium_1.0.21.bb} |  9 +--
 3 files changed, 54 insertions(+), 65 deletions(-)
 create mode 100644 meta-oe/recipes-crypto/libsodium/libsodium/0001-Fix-compilation-with-GCC-on-aarch64.patch
 delete mode 100644 meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch
 rename meta-oe/recipes-crypto/libsodium/{libsodium_1.0.20.bb => libsodium_1.0.21.bb} (50%)

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium/0001-Fix-compilation-with-GCC-on-aarch64.patch b/meta-oe/recipes-crypto/libsodium/libsodium/0001-Fix-compilation-with-GCC-on-aarch64.patch
new file mode 100644
index 0000000000..c5c0d12b87
--- /dev/null
+++ b/meta-oe/recipes-crypto/libsodium/libsodium/0001-Fix-compilation-with-GCC-on-aarch64.patch
@@ -0,0 +1,49 @@
+From fc66d1bd0d3db6392424a1fd10dcf4343ce72c52 Mon Sep 17 00:00:00 2001
+From: Frank Denis <github@pureftpd.org>
+Date: Wed, 7 Jan 2026 12:00:49 +0100
+Subject: [PATCH] Fix compilation with GCC on aarch64
+
+Use unsigned NEON intrinsics everywhere
+
+Fixes #1502
+
+Upstream-Status: Backport [https://github.com/jedisct1/libsodium/commit/6702f69bef6044163acc7715e6ac7e430890ce78]
+---
+ src/libsodium/crypto_ipcrypt/ipcrypt_armcrypto.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/libsodium/crypto_ipcrypt/ipcrypt_armcrypto.c b/src/libsodium/crypto_ipcrypt/ipcrypt_armcrypto.c
+index c5a27e92..bad4ce38 100644
+--- a/src/libsodium/crypto_ipcrypt/ipcrypt_armcrypto.c
++++ b/src/libsodium/crypto_ipcrypt/ipcrypt_armcrypto.c
+@@ -37,7 +37,7 @@ typedef uint64x2_t BlockVec;
+ #    define XOR128_3(a, b, c) veorq_u64(veorq_u64((a), (b)), (c))
+ #    define SET64x2(a, b)     vsetq_lane_u64((uint64_t) (a), vmovq_n_u64((uint64_t) (b)), 1)
+ #    define BYTESHL128(a, b) \
+-        vreinterpretq_u64_u8(vextq_s8(vdupq_n_s8(0), vreinterpretq_s8_u64(a), 16 - (b)))
++        vreinterpretq_u64_u8(vextq_u8(vdupq_n_u8(0), vreinterpretq_u8_u64(a), 16 - (b)))
+ 
+ #    define AES_XENCRYPT(block_vec, rkey) \
+         vreinterpretq_u64_u8(             \
+@@ -348,12 +348,12 @@ pfx_set_bit(uint8_t ip16[16], const unsigned int bit_index, const uint8_t bit_va
+ static void
+ pfx_shift_left(uint8_t ip16[16])
+ {
+-    BlockVec       v       = LOAD128(ip16);
+-    const BlockVec shl     = vshlq_n_u8(vreinterpretq_u8_u64(v), 1);
+-    const BlockVec msb     = vshrq_n_u8(vreinterpretq_u8_u64(v), 7);
+-    const BlockVec zero    = vdupq_n_u8(0);
+-    const BlockVec carries = vextq_u8(vreinterpretq_u8_u64(msb), zero, 1);
+-    v                      = vreinterpretq_u64_u8(vorrq_u8(shl, carries));
++    BlockVec         v       = LOAD128(ip16);
++    const uint8x16_t shl     = vshlq_n_u8(vreinterpretq_u8_u64(v), 1);
++    const uint8x16_t msb     = vshrq_n_u8(vreinterpretq_u8_u64(v), 7);
++    const uint8x16_t zero    = vdupq_n_u8(0);
++    const uint8x16_t carries = vextq_u8(msb, zero, 1);
++    v                        = vreinterpretq_u64_u8(vorrq_u8(shl, carries));
+     STORE128(ip16, v);
+ }
+ 
+-- 
+2.47.3
+
diff --git a/meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch b/meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch
deleted file mode 100644
index a2ced62760..0000000000
--- a/meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From ad3004ec8731730e93fcfbbc824e67eadc1c1bae Mon Sep 17 00:00:00 2001
-From: Frank Denis <github@pureftpd.org>
-Date: Mon, 29 Dec 2025 23:22:15 +0100
-Subject: [PATCH] core_ed25519_is_valid_point: check Y==Z in addition to X==0
-
-CVE: CVE-2025-69277
-Upstream-Status: Backport [https://github.com/jedisct1/libsodium/commit/ad3004ec8731730e93fcfbbc824e67eadc1c1bae]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c | 5 ++++-
- test/default/core_ed25519.c                             | 7 ++++++-
- 2 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c b/src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c
-index d3020132..4b824f6d 100644
---- a/src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c
-+++ b/src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c
-@@ -1141,10 +1141,13 @@ int
- ge25519_is_on_main_subgroup(const ge25519_p3 *p)
- {
-     ge25519_p3 pl;
-+    fe25519    t;
- 
-     ge25519_mul_l(&pl, p);
- 
--    return fe25519_iszero(pl.X);
-+    fe25519_sub(t, pl.Y, pl.Z);
-+
-+    return fe25519_iszero(pl.X) & fe25519_iszero(t);
- }
- 
- int
-diff --git a/test/default/core_ed25519.c b/test/default/core_ed25519.c
-index bc457493..02f72bd6 100644
---- a/test/default/core_ed25519.c
-+++ b/test/default/core_ed25519.c
-@@ -13,6 +13,10 @@ static const unsigned char max_canonical_p[32] = {
-     0xe4, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
-     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f
- };
-+static const unsigned char not_main_subgroup_p[32] = {
-+    0x95, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99,
-+    0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99
-+};
- static const unsigned char L_p1[32] = {
-     0xee, 0xd3, 0xf5, 0x5c, 0x1a, 0x63, 0x12, 0x58, 0xd6, 0x9c, 0xf7, 0xa2, 0xde, 0xf9, 0xde, 0x14,
-     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10
-@@ -133,11 +137,12 @@ main(void)
-     assert(crypto_core_ed25519_is_valid_point(p) == 0);
- 
-     p[0] = 9;
--    assert(crypto_core_ed25519_is_valid_point(p) == 1);
-+    assert(crypto_core_ed25519_is_valid_point(p) == 0);
- 
-     assert(crypto_core_ed25519_is_valid_point(max_canonical_p) == 1);
-     assert(crypto_core_ed25519_is_valid_point(non_canonical_invalid_p) == 0);
-     assert(crypto_core_ed25519_is_valid_point(non_canonical_p) == 0);
-+    assert(crypto_core_ed25519_is_valid_point(not_main_subgroup_p) == 0);
- 
-     memcpy(p2, p, crypto_core_ed25519_BYTES);
-     add_P(p2);
diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.20.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.21.bb
similarity index 50%
rename from meta-oe/recipes-crypto/libsodium/libsodium_1.0.20.bb
rename to meta-oe/recipes-crypto/libsodium/libsodium_1.0.21.bb
index 972b8b8694..9f07634c41 100644
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.20.bb
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.21.bb
@@ -2,12 +2,13 @@ SUMMARY = "The Sodium crypto library"
 HOMEPAGE = "http://libsodium.org/"
 BUGTRACKER = "https://github.com/jedisct1/libsodium/issues"
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c59be7bb29f8e431b5f2d690b6734185"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4942a8ebbbc7f2212bd68a47df264a4f"
 
-SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "ebb65ef6ca439333c2bb41a0c1990587288da07f6c7fd07cb3a18cc18d30ce19"
+SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz \
+           file://0001-Fix-compilation-with-GCC-on-aarch64.patch \
+           "
+SRC_URI[sha256sum] = "9e4285c7a419e82dedb0be63a72eea357d6943bc3e28e6735bf600dd4883feaf"
 
-SRC_URI += "file://CVE-2025-69277.patch"
 
 inherit autotools
 
-- 
2.47.3


