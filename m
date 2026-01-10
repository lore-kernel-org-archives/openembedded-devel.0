Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BA1D26D9B
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 20:00:06 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15480.1768075196697110850
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 11:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=C2NONCoQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260110195954fc486206e90002072d-jgdswk@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260110195954fc486206e90002072d
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 10 Jan 2026 20:59:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=3ZEfu7p2ZGKagCFciuuK3RUpn/fx0e2H9RIvSwqrn0s=;
 b=C2NONCoQN5wLSCLqqDtpSmY7tSEdRXjSYL2G3aeqPtA9VaKre8hnwUIYZY3xenpupaDEeG
 knMT7I+Kcg3MgRekA9/N4tCb/YBhUtsIxg/c2Tm0VhYCDvc3h+qxahd84S7j7bsC9EhbtHyU
 x7fjnxPGPmyyjv2G8a2v9GkC0r3IWMXOZVxIYG3eU8TVrRlpsctKvd9Lkp6DW2FuQIgp1v+8
 mxjDUUlJ26HVEH0MnWyjHvE02+i/Llad7un9UxfcZsFwy8GGLK23YPRwyzFkePfUKvLNxQ6z
 H++v0rkz8qQqPN2ESvBeBPhtEDxwzuETYNDry8FyLt5OZ47zcwY5aYgA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libsodium: patch CVE-2025-69277
Date: Sat, 10 Jan 2026 20:59:12 +0100
Message-Id: <20260110195912.3946463-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 20:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123335

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-69277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libsodium/libsodium/CVE-2025-69277.patch  | 61 +++++++++++++++++++
 .../libsodium/libsodium_1.0.18.bb             |  2 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch b/meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch
new file mode 100644
index 0000000000..a0c4a0b33f
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
+@@ -992,10 +992,13 @@ int
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
+ 
+ static void
+ add_P(unsigned char * const S)
+@@ -130,11 +134,12 @@ main(void)
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
diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb
index 53b3ddc26f..1b22e8d7bc 100644
--- a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb
+++ b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.18.bb
@@ -8,6 +8,8 @@ SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz
 SRC_URI[md5sum] = "3ca9ebc13b6b4735acae0a6a4c4f9a95"
 SRC_URI[sha256sum] = "6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1"
 
+SRC_URI += "file://CVE-2025-69277.patch"
+
 inherit autotools
 
 BBCLASSEXTEND = "native nativesdk"

