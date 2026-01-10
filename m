Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3EED232D3
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 19:59:46 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15477.1768075183271784205
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 11:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WnMBUf0/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260110195939f5e71dfaca000207ab-g78xuj@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260110195939f5e71dfaca000207ab
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 10 Jan 2026 20:59:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=D+AamxEmusNbESHxF6WM++GLbkGZKvjpB1wPOD78nj8=;
 b=WnMBUf0/eAdKI/Nu8a7zRVnm7DJDrn3BfdKPv/I61avRd8YV8o2YEkiogsYIDsSLrFvIga
 dTOwhXceqg7ZRZIvy8HGG2+tutWKNz5ZCAUUAzRpnSJrkjNxH5CabCsbl3j5Nw2vdM+KkLei
 7PCc+foXZT4+MEwvLPyAGgJwpcPaDLGc8Ims7ETyxGAlquzeOmZTtcjKp1VakuboGW1Nlma8
 +qEM8LAe4BJYgdfyNKrdug+lUvIkSGUech3ga2H8wto/8WdRzmnOv8ec3ApeUI6RnZYMGdJX
 3NWV0At+wCIF+v6cNWWATiMGv7B0qw6ptXL0wGXwXKTryHpIIGKSPtOA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] libsodium: patch CVE-2025-69277
Date: Sat, 10 Jan 2026 20:58:48 +0100
Message-Id: <20260110195848.3946429-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 19:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123332

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-69277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libsodium/libsodium/CVE-2025-69277.patch  | 61 +++++++++++++++++++
 .../libsodium/libsodium_1.0.20.bb             |  2 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch b/meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch
new file mode 100644
index 0000000000..a2ced62760
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
+@@ -1141,10 +1141,13 @@ int
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
+@@ -133,11 +137,12 @@ main(void)
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
diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.20.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.20.bb
index 63d21576b4..972b8b8694 100644
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.20.bb
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.20.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c59be7bb29f8e431b5f2d690b6734185"
 SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
 SRC_URI[sha256sum] = "ebb65ef6ca439333c2bb41a0c1990587288da07f6c7fd07cb3a18cc18d30ce19"
 
+SRC_URI += "file://CVE-2025-69277.patch"
+
 inherit autotools
 
 BBCLASSEXTEND = "native nativesdk"

