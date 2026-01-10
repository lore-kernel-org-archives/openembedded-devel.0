Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38848D26D97
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 19:59:56 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15478.1768075190837620979
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 11:59:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=D8zoCwrB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260110195948fcc48ca783000207ea-kuyurf@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260110195948fcc48ca783000207ea
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 10 Jan 2026 20:59:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=doDFF07M4Pv7PtbCWVRCL+0/fpFaLLVyJ6RmDL8TvwE=;
 b=D8zoCwrBW036NXBFcEmMu7COc5n6Jl3fy1c3LFSNugOsf/MyQrEfSDr+V5jNTMGUsnbtxF
 Tf8pWIW+EQxtASpDZLpKZJrGvGx776r7SZAnppFF4LC1lDXnoXE5WJHxOEDarAujrpBy6giT
 Wi8sulPzEsWqUs/2FaoVMmpvvtPM6iTKJo5kc6pex8JTtsqTwFelAzxfVc+10eik0jmRGvHv
 bCWss9TXDJnl2khjpX9u0D0q7lXr+WsLYAUgcXJGOat2jr8+C0E1+JVlYZ62ETIKPwBTyaBX
 Uecl5aCxEyZMW39vqJX8EPKhljRO/cDz3RwsQrg+t1WOvsmh9UbdoUAA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] libsodium: patch CVE-2025-69277
Date: Sat, 10 Jan 2026 20:59:25 +0100
Message-Id: <20260110195925.3946482-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 19:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123334

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-69277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libsodium/libsodium/CVE-2025-69277.patch  | 61 +++++++++++++++++++
 .../libsodium/libsodium_1.0.19.bb             |  4 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch b/meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch
new file mode 100644
index 0000000000..55fada2a89
--- /dev/null
+++ b/meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch
@@ -0,0 +1,61 @@
+From ad3004ec8731730e93fcfbbc824e67eadc1c1bae Mon Sep 17 00:00:00 2001
+From: Frank Denis <github@pureftpd.org>
+Date: Mon, 29 Dec 2025 23:22:15 +0100
+Subject: [PATCH] core_ed25519_is_valid_point: check Y==Z in addition to X==0
+
+CVE: CVE-2025-69277
+Upstream-Status: Backport [https://github.com/jedisct1/libsodium/commit/ad3004ec8731730e93fcfbbc824e67eadc1c1bae]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c | 5 ++++-
+ test/default/core_ed25519.c                             | 7 ++++++-
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c b/src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c
+index d3020132..4b824f6d 100644
+--- a/src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c
++++ b/src/libsodium/crypto_core/ed25519/ref10/ed25519_ref10.c
+@@ -1029,10 +1029,13 @@ int
+ ge25519_is_on_main_subgroup(const ge25519_p3 *p)
+ {
+     ge25519_p3 pl;
++    fe25519    t;
+ 
+     ge25519_mul_l(&pl, p);
+ 
+-    return fe25519_iszero(pl.X);
++    fe25519_sub(t, pl.Y, pl.Z);
++
++    return fe25519_iszero(pl.X) & fe25519_iszero(t);
+ }
+ 
+ int
+diff --git a/test/default/core_ed25519.c b/test/default/core_ed25519.c
+index bc457493..02f72bd6 100644
+--- a/test/default/core_ed25519.c
++++ b/test/default/core_ed25519.c
+@@ -13,6 +13,10 @@ static const unsigned char max_canonical_p[32] = {
+     0xe4, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+     0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f
+ };
++static const unsigned char not_main_subgroup_p[32] = {
++    0x95, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99,
++    0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99
++};
+ static const unsigned char L_p1[32] = {
+     0xee, 0xd3, 0xf5, 0x5c, 0x1a, 0x63, 0x12, 0x58, 0xd6, 0x9c, 0xf7, 0xa2, 0xde, 0xf9, 0xde, 0x14,
+     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10
+@@ -142,11 +146,12 @@ main(void)
+     assert(crypto_core_ed25519_is_valid_point(p) == 0);
+ 
+     p[0] = 9;
+-    assert(crypto_core_ed25519_is_valid_point(p) == 1);
++    assert(crypto_core_ed25519_is_valid_point(p) == 0);
+ 
+     assert(crypto_core_ed25519_is_valid_point(max_canonical_p) == 1);
+     assert(crypto_core_ed25519_is_valid_point(non_canonical_invalid_p) == 0);
+     assert(crypto_core_ed25519_is_valid_point(non_canonical_p) == 0);
++    assert(crypto_core_ed25519_is_valid_point(not_main_subgroup_p) == 0);
+ 
+     memcpy(p2, p, crypto_core_ed25519_BYTES);
+     add_P(p2);
diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb
index 2e678f3f0f..9b60dcc62c 100644
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.19.bb
@@ -5,7 +5,9 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=49ce3b426e6a002e23a1387248e6dbe9"
 
 SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz \
-           file://0001-fix-aarch64-Move-target-pragma-after-arm_neon.h-incl.patch"
+           file://0001-fix-aarch64-Move-target-pragma-after-arm_neon.h-incl.patch \
+           file://CVE-2025-69277.patch \
+"
 SRC_URI[sha256sum] = "018d79fe0a045cca07331d37bd0cb57b2e838c51bc48fd837a1472e50068bbea"
 
 inherit autotools

