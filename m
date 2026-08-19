Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EF3C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3348.1787132217428468842
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AD0A5Nvm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132221; x=1818668221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AaUCPUdEvlcyuAAvwbQjuYhztvNssd6HHyeap70DF68=;
  b=AD0A5NvmHn8Tecw+QkQvDwNPHfaIYSn4WhengjUV1W4FPOc34OU95Hhc
   aD+Qvq6ry1HwLfR1/6WcYbihwRjvxgUDBgpE4+SF/bzPIisYC3cuVTeA7
   foGg8eX1w441lok+NXNoNrX35u8ZCBZdok7HKo0qJ6PR1qWjfzNJK955g
   Yz5A8TGhaQWSKU0472yerAfdCdDdOAI2Jv9a+D+escOnqtc6iAqizy/5C
   ZcgsWCA8l1Jqpy9h3uivXUeOEuhfIFItuyo5YpWHWR4ymRLDdyZvgyR1d
   DvklYPJ7SfZIvjl/FwIWcmE/lh3HJGzv5qGNoDSqnL3T2Pg7ndzxmjRs1
   A==;
X-CSE-ConnectionGUID: 2IH2oZGxTxqiNyfwsJM2wg==
X-CSE-MsgGUID: CxDZ9PwWSOeHYAakkCextg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255507929"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255507929"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:59 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CC0538200BB
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:55 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 85B98C0246E
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 19F631801C0F;
	Wed, 19 Aug 2026 09:36:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 54/70] python3-ruff: upgrade 0.16.1 -> 0.16.3
Date: Wed, 19 Aug 2026 17:34:58 +0800
Message-ID: <20260819093514.1101-54-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129324

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-ruff-crates.inc            | 76 +++++++++----------
 ...-ruff_0.16.1.bb => python3-ruff_0.16.3.bb} |  2 +-
 2 files changed, 39 insertions(+), 39 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruff_0.16.1.bb => python3-ruff_0.16.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-ruff-crates.inc b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
index b61f90df0d..b5835d4ce2 100644
--- a/meta-python/recipes-devtools/python/python3-ruff-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
@@ -3,7 +3,7 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/adler2/2.0.1 \
-    crate://crates.io/aho-corasick/1.1.4 \
+    crate://crates.io/aho-corasick/1.1.5 \
     crate://crates.io/alloca/0.4.0 \
     crate://crates.io/allocator-api2/0.2.21 \
     crate://crates.io/android_system_properties/0.1.5 \
@@ -42,7 +42,7 @@ SRC_URI += " \
     crate://crates.io/bytecheck_derive/0.8.2 \
     crate://crates.io/bytes/1.12.0 \
     crate://crates.io/cachedir/0.3.1 \
-    crate://crates.io/camino/1.2.4 \
+    crate://crates.io/camino/1.2.5 \
     crate://crates.io/cast/0.3.0 \
     crate://crates.io/castaway/0.2.4 \
     crate://crates.io/cc/1.2.65 \
@@ -54,8 +54,8 @@ SRC_URI += " \
     crate://crates.io/ciborium/0.2.2 \
     crate://crates.io/ciborium-io/0.2.2 \
     crate://crates.io/ciborium-ll/0.2.2 \
-    crate://crates.io/clap/4.6.4 \
-    crate://crates.io/clap_builder/4.6.2 \
+    crate://crates.io/clap/4.6.5 \
+    crate://crates.io/clap_builder/4.6.5 \
     crate://crates.io/clap_complete/4.5.58 \
     crate://crates.io/clap_complete_command/0.6.1 \
     crate://crates.io/clap_complete_nushell/4.5.8 \
@@ -144,7 +144,7 @@ SRC_URI += " \
     crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.2 \
     crate://crates.io/glob/0.3.4 \
-    crate://crates.io/globset/0.4.19 \
+    crate://crates.io/globset/0.4.20 \
     crate://crates.io/globwalk/0.9.1 \
     crate://crates.io/half/2.6.0 \
     crate://crates.io/hashbrown/0.14.5 \
@@ -166,7 +166,7 @@ SRC_URI += " \
     crate://crates.io/id-arena/2.3.0 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
-    crate://crates.io/ignore/0.4.31 \
+    crate://crates.io/ignore/0.4.33 \
     crate://crates.io/imara-diff/0.2.0 \
     crate://crates.io/imperative/1.0.7 \
     crate://crates.io/indexmap/2.14.0 \
@@ -187,9 +187,9 @@ SRC_URI += " \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itertools/0.15.0 \
     crate://crates.io/itoa/1.0.15 \
-    crate://crates.io/jiff/0.2.34 \
+    crate://crates.io/jiff/0.2.35 \
     crate://crates.io/jiff-core/0.1.0 \
-    crate://crates.io/jiff-static/0.2.34 \
+    crate://crates.io/jiff-static/0.2.35 \
     crate://crates.io/jiff-tzdb/0.1.4 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.34 \
@@ -310,7 +310,7 @@ SRC_URI += " \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
     crate://crates.io/regex/1.13.1 \
-    crate://crates.io/regex-automata/0.4.16 \
+    crate://crates.io/regex-automata/0.4.18 \
     crate://crates.io/regex-lite/0.1.7 \
     crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rend/0.5.3 \
@@ -323,12 +323,12 @@ SRC_URI += " \
     crate://crates.io/rustix/1.1.4 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ryu/1.0.20 \
-    crate://crates.io/salsa/0.28.1 \
-    crate://crates.io/salsa-macro-rules/0.28.1 \
-    crate://crates.io/salsa-macros/0.28.1 \
+    crate://crates.io/salsa/0.28.2 \
+    crate://crates.io/salsa-macro-rules/0.28.2 \
+    crate://crates.io/salsa-macros/0.28.2 \
     crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/schemars/1.2.1 \
-    crate://crates.io/schemars_derive/1.2.1 \
+    crate://crates.io/schemars/1.2.2 \
+    crate://crates.io/schemars_derive/1.2.2 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/semver/1.0.27 \
@@ -336,7 +336,7 @@ SRC_URI += " \
     crate://crates.io/serde-wasm-bindgen/0.6.5 \
     crate://crates.io/serde_core/1.0.229 \
     crate://crates.io/serde_derive/1.0.229 \
-    crate://crates.io/serde_derive_internals/0.29.1 \
+    crate://crates.io/serde_derive_internals/0.30.0 \
     crate://crates.io/serde_json/1.0.151 \
     crate://crates.io/serde_spanned/1.1.1 \
     crate://crates.io/serde_test/1.0.177 \
@@ -346,7 +346,7 @@ SRC_URI += " \
     crate://crates.io/shlex/2.0.1 \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/similar/2.7.0 \
-    crate://crates.io/similar/3.1.1 \
+    crate://crates.io/similar/3.1.2 \
     crate://crates.io/siphasher/1.0.1 \
     crate://crates.io/slab/0.4.12 \
     crate://crates.io/smallvec/1.15.2 \
@@ -371,7 +371,7 @@ SRC_URI += " \
     crate://crates.io/test-case/3.3.1 \
     crate://crates.io/test-case-core/3.3.1 \
     crate://crates.io/test-case-macros/3.3.1 \
-    crate://crates.io/thin-vec/0.2.18 \
+    crate://crates.io/thin-vec/0.2.19 \
     crate://crates.io/thiserror/1.0.69 \
     crate://crates.io/thiserror/2.0.19 \
     crate://crates.io/thiserror-impl/1.0.69 \
@@ -384,11 +384,11 @@ SRC_URI += " \
     crate://crates.io/tinyvec/1.10.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
     crate://crates.io/toml/0.9.12+spec-1.1.0 \
-    crate://crates.io/toml/1.1.3+spec-1.1.0 \
+    crate://crates.io/toml/1.1.4+spec-1.1.0 \
     crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
     crate://crates.io/toml_edit/0.25.12+spec-1.1.0 \
-    crate://crates.io/toml_parser/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.1.3+spec-1.1.0 \
     crate://crates.io/toml_writer/1.1.2+spec-1.1.0 \
     crate://crates.io/tracing/0.1.44 \
     crate://crates.io/tracing-attributes/0.1.31 \
@@ -506,7 +506,7 @@ SRC_URI += " \
 "
 
 SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
-SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
+SRC_URI[aho-corasick-1.1.5.sha256sum] = "c982642fa9e8606056828ee9a8505737230110bb1099153c79efe865c59d12ba"
 SRC_URI[alloca-0.4.0.sha256sum] = "e5a7d05ea6aea7e9e64d25b9156ba2fee3fdd659e34e41063cd2fc7cd020d7f4"
 SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
 SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
@@ -545,7 +545,7 @@ SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f79783
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
 SRC_URI[bytes-1.12.0.sha256sum] = "8ae3f5d315924270530207e2a68396c3cc547f6dca3fbdca317cfb1a51edb593"
 SRC_URI[cachedir-0.3.1.sha256sum] = "4703f3937077db8fa35bee3c8789343c1aec2585f0146f09d658d4ccc0e8d873"
-SRC_URI[camino-1.2.4.sha256sum] = "5f2d30e4173c4026932d51d31d6b0613b1fd3014bf3f9f8943d4ba139c437ba0"
+SRC_URI[camino-1.2.5.sha256sum] = "bb1307f12aa967b5a58416e87b3653360e0fd614a016b6e970db08fecbb1b80d"
 SRC_URI[cast-0.3.0.sha256sum] = "37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5"
 SRC_URI[castaway-0.2.4.sha256sum] = "dec551ab6e7578819132c713a93c022a05d60159dc86e7a7050223577484c55a"
 SRC_URI[cc-1.2.65.sha256sum] = "e228eec9be7c17ccb640b59b36a5cd805ea2a564a4c5e162c2f659fea30d3b96"
@@ -557,8 +557,8 @@ SRC_URI[chrono-0.4.44.sha256sum] = "c673075a2e0e5f4a1dde27ce9dee1ea4558c7ffe648f
 SRC_URI[ciborium-0.2.2.sha256sum] = "42e69ffd6f0917f5c029256a24d0161db17cea3997d185db0d35926308770f0e"
 SRC_URI[ciborium-io-0.2.2.sha256sum] = "05afea1e0a06c9be33d539b876f1ce3692f4afea2cb41f740e7743225ed1c757"
 SRC_URI[ciborium-ll-0.2.2.sha256sum] = "57663b653d948a338bfb3eeba9bb2fd5fcfaecb9e199e87e1eda4d9e8b240fd9"
-SRC_URI[clap-4.6.4.sha256sum] = "d91e0c145792ef73a6ad36d27c75ac09f1832222a3c209689d90f534685ee5b7"
-SRC_URI[clap_builder-4.6.2.sha256sum] = "f09628afdcc538b57f3c6341e9c8e9970f18e4a481690a64974d7023bd33548b"
+SRC_URI[clap-4.6.5.sha256sum] = "301b56658598e48f3648647ac6fc887be7e7108eddfa4e9b63fcf3ec58c0cadf"
+SRC_URI[clap_builder-4.6.5.sha256sum] = "94a65403d1a1bd28f7dc68eb8506e8874808ee5eecb59298de588e2e1407a078"
 SRC_URI[clap_complete-4.5.58.sha256sum] = "75bf0b32ad2e152de789bb635ea4d3078f6b838ad7974143e99b99f45a04af4a"
 SRC_URI[clap_complete_command-0.6.1.sha256sum] = "da8e198c052315686d36371e8a3c5778b7852fc75cc313e4e11eeb7a644a1b62"
 SRC_URI[clap_complete_nushell-4.5.8.sha256sum] = "0a0c951694691e65bf9d421d597d68416c22de9632e884c28412cb8cd8b73dce"
@@ -647,7 +647,7 @@ SRC_URI[getrandom-0.2.16.sha256sum] = "335ff9f135e4384c8150d6f27c6daed433577f86b
 SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.2.sha256sum] = "0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555"
 SRC_URI[glob-0.3.4.sha256sum] = "e4eba85ea1d0a966a983acd07deee566e67395d2d96b6fb39e62b5a833f1eb0b"
-SRC_URI[globset-0.4.19.sha256sum] = "e47d37d2ae4464254884b60ab7071be2b876a9c35b696bd018ddcc76847309cd"
+SRC_URI[globset-0.4.20.sha256sum] = "07c34a9410465b45bd9787443bc7370f37735bad04b0f0cd57ff1a3186c98988"
 SRC_URI[globwalk-0.9.1.sha256sum] = "0bf760ebf69878d9fd8f110c89703d90ce35095324d1f1edcb595c63945ee757"
 SRC_URI[half-2.6.0.sha256sum] = "459196ed295495a68f7d7fe1d84f6c4b7ff0e21fe3017b2f283c6fac3ad803c9"
 SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
@@ -669,7 +669,7 @@ SRC_URI[icu_provider-2.2.0.sha256sum] = "139c4cf31c8b5f33d7e199446eff9c1e02decfc
 SRC_URI[id-arena-2.3.0.sha256sum] = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
-SRC_URI[ignore-0.4.31.sha256sum] = "7f8a7b8211e695a1d0cd91cace480d4d0bd57667ab10277cc412c5f7f4884f83"
+SRC_URI[ignore-0.4.33.sha256sum] = "00b69833ed729dc5aa7d19541d96d6cf8e9137194207a04916d658e43168402f"
 SRC_URI[imara-diff-0.2.0.sha256sum] = "2f01d462f766df78ab820dd06f5eb700233c51f0f4c2e846520eaf4ba6aa5c5c"
 SRC_URI[imperative-1.0.7.sha256sum] = "35e1d0bd9c575c52e59aad8e122a11786e852a154678d0c86e9e243d55273970"
 SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
@@ -690,9 +690,9 @@ SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c08819
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itertools-0.15.0.sha256sum] = "8b4baf93f58d4425749ca49a51c50ebab072c5df6994d08fed93541c331481dc"
 SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
-SRC_URI[jiff-0.2.34.sha256sum] = "e184d09547b80eb7e20d141ba2fb1fbac843ca53f4cf1b31210adc4c1adc6e16"
+SRC_URI[jiff-0.2.35.sha256sum] = "668b7183bd07af9a4885f5c35b0cc5c83c4607a913c16b7e17291832910d2dcc"
 SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09"
-SRC_URI[jiff-static-0.2.34.sha256sum] = "323da076b7a6faf914dc677cb05a4b907742ff7375c8322c9e7f5061e5e0e9de"
+SRC_URI[jiff-static-0.2.35.sha256sum] = "3a69dcb3a21cfb32ce1cd056169337ca284af0766dd766e7878819b251a49204"
 SRC_URI[jiff-tzdb-0.1.4.sha256sum] = "c1283705eb0a21404d2bfd6eef2a7593d240bc42a0bdb39db0ad6fa2ec026524"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
@@ -813,7 +813,7 @@ SRC_URI[redox_users-0.5.2.sha256sum] = "a4e608c6638b9c18977b00b475ac1f28d14e84b2
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
 SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
-SRC_URI[regex-automata-0.4.16.sha256sum] = "8fcfdb36bda0c880c5931cdc7a2bcdc8ba4556847b9d912bca70bc94708711ad"
+SRC_URI[regex-automata-0.4.18.sha256sum] = "ad8553b9b26413251cbf30e620595c7a41b3887f03da04579c0e6b0d6a06b4b2"
 SRC_URI[regex-lite-0.1.7.sha256sum] = "943f41321c63ef1c92fd763bfe054d2668f7f225a5c29f0105903dc2fc04ba30"
 SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
@@ -826,12 +826,12 @@ SRC_URI[rustc-stable-hash-0.1.2.sha256sum] = "781442f29170c5c93b7185ad559492601a
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ryu-1.0.20.sha256sum] = "28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f"
-SRC_URI[salsa-0.28.1.sha256sum] = "a14fdadbf856222e731756d7fdbdf193a7abf8fdab009bb45f48671a42719a84"
-SRC_URI[salsa-macro-rules-0.28.1.sha256sum] = "50d7dc08ba69b9aedfa61dfc4d65548ae42c0d8b90bbd62cd121776920841bcf"
-SRC_URI[salsa-macros-0.28.1.sha256sum] = "ec5c48c5a4a53a6e2be9762f56566f1325d4394c011c00b3ea86ba2d13411e71"
+SRC_URI[salsa-0.28.2.sha256sum] = "cf0e374215cd2db2b5c75d7b3a99cb0cc052c0595335dfdefc03d4eb08f4aa81"
+SRC_URI[salsa-macro-rules-0.28.2.sha256sum] = "85f4b7d4405540bbd6d4ffa52d4322d983f3781954d3073067ac1bdb028459b3"
+SRC_URI[salsa-macros-0.28.2.sha256sum] = "445be2bfbb2f67cb663225ecd7bc5a25370c0250fca30f9d8cbad9a913650370"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
-SRC_URI[schemars-1.2.1.sha256sum] = "a2b42f36aa1cd011945615b92222f6bf73c599a102a300334cd7f8dbeec726cc"
-SRC_URI[schemars_derive-1.2.1.sha256sum] = "7d115b50f4aaeea07e79c1912f645c7513d81715d0420f8bc77a18c6260b307f"
+SRC_URI[schemars-1.2.2.sha256sum] = "687274d293b6cdc6e73e0fee520bf2049650090d7164f87672d212a3c530cf4a"
+SRC_URI[schemars_derive-1.2.2.sha256sum] = "d98c67716b46af2f0b8cf752abc930f6f9aecfbf671ecfb531db8a31dbe4e2ba"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
 SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
@@ -839,7 +839,7 @@ SRC_URI[serde-1.0.229.sha256sum] = "4148590afebada386688f18773da617792bf2ef03ffc
 SRC_URI[serde-wasm-bindgen-0.6.5.sha256sum] = "8302e169f0eddcc139c70f139d19d6467353af16f9fce27e8c30158036a1e16b"
 SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
 SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
-SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
+SRC_URI[serde_derive_internals-0.30.0.sha256sum] = "f852137cce035d6a4df67ccce505ff6b3e9fd3a10e3e52b24dc71e650bb1a9bd"
 SRC_URI[serde_json-1.0.151.sha256sum] = "c841b55ecdae098c80dcae9cf767f6f8a0c2cdb3416bbef72181df4d0fe73f14"
 SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
 SRC_URI[serde_test-1.0.177.sha256sum] = "7f901ee573cab6b3060453d2d5f0bae4e6d628c23c0a962ff9b5f1d7c8d4f1ed"
@@ -849,7 +849,7 @@ SRC_URI[shellexpand-3.1.2.sha256sum] = "32824fab5e16e6c4d86dc1ba84489390419a39f9
 SRC_URI[shlex-2.0.1.sha256sum] = "f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba"
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
 SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa"
-SRC_URI[similar-3.1.1.sha256sum] = "e6505efef05804732ed8a3f2d4f279429eb485bd69d5b0cc6b19cc02005cda16"
+SRC_URI[similar-3.1.2.sha256sum] = "85ee016af5d736b69fc89e19254540fa4b5f5492853fb5503920f084011c78b6"
 SRC_URI[siphasher-1.0.1.sha256sum] = "56199f7ddabf13fe5074ce809e7d3f42b42ae711800501b5b16ea82ad029c39d"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
 SRC_URI[smallvec-1.15.2.sha256sum] = "8ed6a63f02c8539c91a8685a86f4099661ba3da017932f6ebbea6de3f0fa7c90"
@@ -874,7 +874,7 @@ SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcb
 SRC_URI[test-case-3.3.1.sha256sum] = "eb2550dd13afcd286853192af8601920d959b14c401fcece38071d53bf0768a8"
 SRC_URI[test-case-core-3.3.1.sha256sum] = "adcb7fd841cd518e279be3d5a3eb0636409487998a4aff22f3de87b81e88384f"
 SRC_URI[test-case-macros-3.3.1.sha256sum] = "5c89e72a01ed4c579669add59014b9a524d609c0c88c6a585ce37485879f6ffb"
-SRC_URI[thin-vec-0.2.18.sha256sum] = "b0f7e269b48f0a7dd0146680fa24b50cc67fc0373f086a5b2f99bd084639b482"
+SRC_URI[thin-vec-0.2.19.sha256sum] = "79def32ffcd477db1ff26f76dab9e3a91f0bd42a85ca96577089b24623056f9d"
 SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
 SRC_URI[thiserror-2.0.19.sha256sum] = "09a43598840e33d5b0331f38c5e30d13bb11c11210a4b58f0d9b18a5a5eefcd9"
 SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
@@ -887,11 +887,11 @@ SRC_URI[tinytemplate-1.2.1.sha256sum] = "be4d6b5f19ff7664e8c98d03e2139cb510db9b0
 SRC_URI[tinyvec-1.10.0.sha256sum] = "bfa5fdc3bce6191a1dbc8c02d5c8bffcf557bafa17c124c5264a458f1b0613fa"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
 SRC_URI[toml-0.9.12+spec-1.1.0.sha256sum] = "cf92845e79fc2e2def6a5d828f0801e29a2f8acc037becc5ab08595c7d5e9863"
-SRC_URI[toml-1.1.3+spec-1.1.0.sha256sum] = "53c96ecdfa941c8fc4fcaed14f99ada8ebed502eef533015095a07e3301d4c3c"
+SRC_URI[toml-1.1.4+spec-1.1.0.sha256sum] = "3aace63f4bbcdfc2c965b059de67119c89c4017a70d633be6c104910f67056f5"
 SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
 SRC_URI[toml_edit-0.25.12+spec-1.1.0.sha256sum] = "d2153edc6955a6c354fad8f5efd38b6a8769bdccf9fe50f8e1329f81b0baa5d7"
-SRC_URI[toml_parser-1.1.2+spec-1.1.0.sha256sum] = "a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526"
+SRC_URI[toml_parser-1.1.3+spec-1.1.0.sha256sum] = "1d38ac1cf9b95face32296c0a3ede1fdc270627c9d9c02a7274dd6d960dc4d56"
 SRC_URI[toml_writer-1.1.2+spec-1.1.0.sha256sum] = "7d56353a2a665ad0f41a421187180aab746c8c325620617ad883a99a1cbe66d2"
 SRC_URI[tracing-0.1.44.sha256sum] = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
 SRC_URI[tracing-attributes-0.1.31.sha256sum] = "7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
diff --git a/meta-python/recipes-devtools/python/python3-ruff_0.16.1.bb b/meta-python/recipes-devtools/python/python3-ruff_0.16.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-ruff_0.16.1.bb
rename to meta-python/recipes-devtools/python/python3-ruff_0.16.3.bb
index 1fc503b5d9..0106ca6fa4 100644
--- a/meta-python/recipes-devtools/python/python3-ruff_0.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ruff_0.16.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e679ca4f742cbfa29ab6a499529c2d39"
 
 DEPENDS += "python3-maturin-native"
 
-SRC_URI[sha256sum] = "fedad7c801dabd3fb9741d76aca39246e6ddd9ca446a015875207bf19f1e6bc7"
+SRC_URI[sha256sum] = "e76d33a347661a84b5be6d043d0347fdc745dfdcf825a8f4fed64b5e26eebdf2"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates
 
-- 
2.43.0


