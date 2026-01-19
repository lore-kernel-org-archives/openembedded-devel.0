Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62ECBCA601D
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:29:09 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31279.1768811339255706213
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DFfNOuw9;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0d0788adaso25887155ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811338; x=1769416138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GelhiwY8UBKhrGEz7yboVdHqFYac0GNe+D8kuaHDjms=;
        b=DFfNOuw93ELnBsdG5EtvLJVlSwvKzLhaqEUj64BdsPvzn8EUqxOSxRdSrpjGvRSUWC
         LJnjctKfTsGf+wr9GRPZyXjrG7yQyNvyVXraDhXmrY1LuNAhKfn6FJ77P++yw8SldNhE
         Tx13bIFsq0jmDhf75Aso0juyp4W2xQTYp50cdcM8lARgs5WgPYKWSW1v+wEk5YpKtsoG
         lrRdyzbgPwfsnPxo+INEu0RLFnLJdAQvDQAO2/ihTTylYpqIEcEDOFuXdMlZhea9mRmW
         L/vwAYnGDqSX55TXfRGwT8/FRtyOegzmoMZc82Dv+ZJtE4lFFnJqfcwfPCFLLqRMAqfL
         O1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811338; x=1769416138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GelhiwY8UBKhrGEz7yboVdHqFYac0GNe+D8kuaHDjms=;
        b=YbrtqNWFgrkBYCvL80BilD6lT3PPi7ogop387i1kEXJOiCdaSedv7q/qMEgSlNZdFy
         mTS6OGCF3npnN21FBVFayfHZDenzn0ay310LEHM139fr2UqEz5zzIkklJ+kIMzw1Y/2R
         QYAofemAzhqnXIj/VpamFsjP5m3ZvtMCd9mLr8eJMCYGgaQD8hrfCezCMjUrjAyF85/D
         hCcd9Tsq/CUtfyGw348rZwoSbmHYxgngIUoLlZCEoH3HfVP9jEZa8hqI+cV7IDuuo5w9
         PYpVCvxY12K+8X+IEDzGXIpq0hUN4O8SVQ9q2yAdaPy8f/+EBvgdMIyDrermbEwVjikW
         MsBg==
X-Gm-Message-State: AOJu0YxPConvEkKQkaGLs7Sz6HD1e3VpndECrQJqlM4l4f609NWffRx9
	dtWoqzf6HFiYzeOYkxIVkgrdj30ueok4n2x35Pd5IUKaTMS4VdZHgC/3s5fx/w==
X-Gm-Gg: AZuq6aIWv3z5iH91ixN7UJVqjHbWaBesjI6XJceLimvq+d62fA8kXb0jiWtcLodddJW
	MI12DutOSdgS8iGfsc6wP1MVBO531EUqhLHz653+CZQswk7oo/r5eOYeJ9tANtSaAVI7YHw842F
	Xzr899DYcC7zJ2xuFtLSRMtrNlstXmG/NnbI/MwNREeiyD8rsw1IOV3ERWxTyNiMNWfq+fW5l1Q
	agSpgsHqh+Tyu/MBg4MoNdZTtQOfFUWo71ufQP+pr/8gkA/x5vintM9IvyfgPnKqb+3UowoOXP2
	k3NNcWmhz48T6odSJOcsL2elORP1QLEEipOAoZrOHDhdEifngKg7QToeC/M02BpysQ36IUx3whm
	99fgUy6DNhBfWXGvJIaVS07Ce1l9OrkoHQMM6XgyoPRxLmoHM7T0qm4aPhWoYLK2vKdZETdkdhO
	kuXCumMuhseLOXbhyL6nqbQJM=
X-Received: by 2002:a17:903:3846:b0:2a5:8c1c:744f with SMTP id d9443c01a7336-2a7177ce31cmr100903685ad.40.1768811338413;
        Mon, 19 Jan 2026 00:28:58 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:58 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 22/28] libsodium: patch CVE-2025-69277
Date: Mon, 19 Jan 2026 21:27:44 +1300
Message-ID: <20260119082752.4120991-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123616

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-69277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 264d8acc9232f68eb28703d5110b1b6ce6a3fb48)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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

