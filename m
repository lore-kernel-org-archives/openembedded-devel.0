Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55335C5478C
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:14 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.9269.1708419300752778585
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HHKwJQpj;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419305; x=1739955305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=L37B6BYjZfA+xB7hITGoO/PzbJQ8og4MXnTfL68ELFQ=;
  b=HHKwJQpjcJuVfTDWWqmrQb4St3H1yS+oIW5k/3yj9SSIQkjb1qAoJCXM
   PVkL1xFg52pCsMM8wp/vp1ENNPeP7gkxqJOGeCgHi0WHr3vx4htWQjmsI
   YwfVmQ8ciY+o8lgpjToYtlBCmQAd6q1AiVPbJguAGH+xPrBgGzBSnRb3j
   gH3tIndNpYhXNjYCwBwffHEUuyVooFK9sZiJXsbSNuI32X5lX7aKASKI2
   LP6OvOk6ALxajoiiTKNYs8MjA7i6DeJDM0u4G9gUkyo73ehQWi5DkFWlU
   8T8o+MwNTqRnxGYF2aTny1BzQDujKw4GzfFymSuYE5cSAVbUJo3lyoL89
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149872576"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149872576"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:55:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 75BD81F4749
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:55:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A6BF9F314E
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:55:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C8D56C9D6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:55:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C0A8D1A00A0;
	Tue, 20 Feb 2024 16:54:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/26] python3-pydantic: upgrade 2.5.3 -> 2.6.0
Date: Tue, 20 Feb 2024 16:54:41 +0800
Message-Id: <1708419281-26047-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10-0.908800-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yUIIxwDaU5mrNi8L88UV9IDT+1Zj+w66+hxq
	dt22rdOgbkdDsltVts2qLHYw/Ac7JnYMpxnz5ObKXoBhYs0FZYY0x1JSmIVxrSWT5HLhPbce2d8
	mtRIRsUMkw8PwVHl/nwXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZCLUHeeoJ+yE46n
	nHFTLuhgal9p+6MHJQUZe34kYYsKjOQ7w/i3HxIq0HJs3FfKL8SExHL6o3BeB9avChsELqKHWCd
	6QvVzbeDo/5+EYQKP64V/5VEBnHsOIHbm50UBYMzmwpmAFt7kVC4sa7AidY08EguqiGeZ5Jo8WM
	kQWv6iXBcIE78YqRWo6HM5rqDwqt8ABRu3efzDFpeHKhgDPxhZDDw2/WyJnobWPTQc6ANd+4Ko9
	qSsk1Z8s1KB3rZyyxS3HxA154Jd8mV3k1i+rohmxuApkDgcMhHSbhGbmGylXFJK7yLnZRGZdO3Q
	67ImL8gi4RUz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108946

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Drop Python3.7 support
-Drop Python 3.7, and PyPy 3.7 and 3.8
-Use positional-only self in BaseModel constructor, so no field name can ever
 conflict with it
-Make @validate_call return a function instead of a custom descriptor - fixes
 binding issue with inheritance and adds self/cls argument to validation errors
-Exclude BaseModel docstring from JSON schema description
-Introducing classproperty decorator for model_computed_fields
-Explicitly raise an error if field names clashes with types
-Use stricter serializer for unions of simple types

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-pydantic-core-crates.inc   | 94 ++++++++++---------
 ...4.6.bb => python3-pydantic-core_2.16.2.bb} |  2 +-
 ...tic_2.5.3.bb => python3-pydantic_2.6.0.bb} |  2 +-
 3 files changed, 50 insertions(+), 48 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.14.6.bb => python3-pydantic-core_2.16.2.bb} (94%)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.5.3.bb => python3-pydantic_2.6.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index 932cfc852..5518ff6ec 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -2,24 +2,25 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/ahash/0.8.6 \
+    crate://crates.io/ahash/0.8.7 \
     crate://crates.io/aho-corasick/1.0.2 \
+    crate://crates.io/allocator-api2/0.2.16 \
     crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/base64/0.21.5 \
+    crate://crates.io/base64/0.21.7 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/cc/1.0.79 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/enum_dispatch/0.3.12 \
     crate://crates.io/equivalent/1.0.1 \
-    crate://crates.io/form_urlencoded/1.2.0 \
+    crate://crates.io/form_urlencoded/1.2.1 \
     crate://crates.io/getrandom/0.2.10 \
-    crate://crates.io/hashbrown/0.14.0 \
+    crate://crates.io/hashbrown/0.14.3 \
     crate://crates.io/heck/0.4.1 \
-    crate://crates.io/idna/0.4.0 \
+    crate://crates.io/idna/0.5.0 \
     crate://crates.io/indexmap/2.0.0 \
     crate://crates.io/indoc/2.0.4 \
     crate://crates.io/itoa/1.0.8 \
-    crate://crates.io/jiter/0.0.4 \
+    crate://crates.io/jiter/0.0.6 \
     crate://crates.io/lexical-core/0.8.5 \
     crate://crates.io/lexical-parse-float/0.8.5 \
     crate://crates.io/lexical-parse-integer/0.8.6 \
@@ -36,15 +37,15 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.18.0 \
     crate://crates.io/parking_lot/0.12.1 \
     crate://crates.io/parking_lot_core/0.9.8 \
-    crate://crates.io/percent-encoding/2.3.0 \
-    crate://crates.io/proc-macro2/1.0.69 \
-    crate://crates.io/pyo3/0.20.0 \
-    crate://crates.io/pyo3-build-config/0.20.0 \
-    crate://crates.io/pyo3-ffi/0.20.0 \
-    crate://crates.io/pyo3-macros/0.20.0 \
-    crate://crates.io/pyo3-macros-backend/0.20.0 \
+    crate://crates.io/percent-encoding/2.3.1 \
+    crate://crates.io/proc-macro2/1.0.76 \
+    crate://crates.io/pyo3/0.20.2 \
+    crate://crates.io/pyo3-build-config/0.20.2 \
+    crate://crates.io/pyo3-ffi/0.20.2 \
+    crate://crates.io/pyo3-macros/0.20.2 \
+    crate://crates.io/pyo3-macros-backend/0.20.2 \
     crate://crates.io/python3-dll-a/0.2.9 \
-    crate://crates.io/quote/1.0.29 \
+    crate://crates.io/quote/1.0.35 \
     crate://crates.io/redox_syscall/0.3.5 \
     crate://crates.io/regex/1.10.2 \
     crate://crates.io/regex-automata/0.4.3 \
@@ -52,15 +53,15 @@ SRC_URI += " \
     crate://crates.io/rustversion/1.0.13 \
     crate://crates.io/ryu/1.0.14 \
     crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/serde/1.0.190 \
-    crate://crates.io/serde_derive/1.0.190 \
-    crate://crates.io/serde_json/1.0.108 \
-    crate://crates.io/smallvec/1.11.1 \
+    crate://crates.io/serde/1.0.195 \
+    crate://crates.io/serde_derive/1.0.195 \
+    crate://crates.io/serde_json/1.0.109 \
+    crate://crates.io/smallvec/1.11.2 \
     crate://crates.io/speedate/0.13.0 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/strum/0.25.0 \
     crate://crates.io/strum_macros/0.25.3 \
-    crate://crates.io/syn/2.0.38 \
+    crate://crates.io/syn/2.0.48 \
     crate://crates.io/target-lexicon/0.12.9 \
     crate://crates.io/tinyvec/1.6.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
@@ -68,8 +69,8 @@ SRC_URI += " \
     crate://crates.io/unicode-ident/1.0.10 \
     crate://crates.io/unicode-normalization/0.1.22 \
     crate://crates.io/unindent/0.2.3 \
-    crate://crates.io/url/2.4.1 \
-    crate://crates.io/uuid/1.5.0 \
+    crate://crates.io/url/2.5.0 \
+    crate://crates.io/uuid/1.6.1 \
     crate://crates.io/version_check/0.9.4 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/windows-targets/0.48.1 \
@@ -80,28 +81,29 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_gnu/0.48.0 \
     crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
     crate://crates.io/windows_x86_64_msvc/0.48.0 \
-    crate://crates.io/zerocopy/0.7.20 \
-    crate://crates.io/zerocopy-derive/0.7.20 \
+    crate://crates.io/zerocopy/0.7.32 \
+    crate://crates.io/zerocopy-derive/0.7.32 \
 "
 
-SRC_URI[ahash-0.8.6.sha256sum] = "91429305e9f0a25f6205c5b8e0d2db09e0708a7a6df0f42212bb56c32c8ac97a"
+SRC_URI[ahash-0.8.7.sha256sum] = "77c3a9648d43b9cd48db467b3f87fdd6e146bcc88ab0180006cef2179fe11d01"
 SRC_URI[aho-corasick-1.0.2.sha256sum] = "43f6cb1bf222025340178f382c426f13757b2960e89779dfcb319c32542a5a41"
+SRC_URI[allocator-api2-0.2.16.sha256sum] = "0942ffc6dcaadf03badf6e6a2d0228460359d5e34b57ccdc720b7382dfbd5ec5"
 SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[base64-0.21.5.sha256sum] = "35636a1494ede3b646cc98f74f8e62c773a38a659ebc777a2cf26b9b74171df9"
+SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[enum_dispatch-0.3.12.sha256sum] = "8f33313078bb8d4d05a2733a94ac4c2d8a0df9a2b84424ebf4f33bfc224a890e"
 SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
-SRC_URI[form_urlencoded-1.2.0.sha256sum] = "a62bc1cf6f830c2ec14a513a9fb124d0a213a629668a4186f329db21fe045652"
+SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
 SRC_URI[getrandom-0.2.10.sha256sum] = "be4136b2a15dd319360be1c07d9933517ccf0be8f16bf62a3bee4f0d618df427"
-SRC_URI[hashbrown-0.14.0.sha256sum] = "2c6201b9ff9fd90a5a3bac2e56a830d0caa509576f0e503818ee82c181b3437a"
+SRC_URI[hashbrown-0.14.3.sha256sum] = "290f1a1d9242c78d09ce40a5e87e7554ee637af1351968159f4952f028f75604"
 SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
-SRC_URI[idna-0.4.0.sha256sum] = "7d20d6b07bfbc108882d88ed8e37d39636dcc260e15e30c45e6ba089610b917c"
+SRC_URI[idna-0.5.0.sha256sum] = "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6"
 SRC_URI[indexmap-2.0.0.sha256sum] = "d5477fe2230a79769d8dc68e0eabf5437907c0457a5614a9e8dddb67f65eb65d"
 SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
 SRC_URI[itoa-1.0.8.sha256sum] = "62b02a5381cc465bd3041d84623d0fa3b66738b52b8e2fc3bab8ad63ab032f4a"
-SRC_URI[jiter-0.0.4.sha256sum] = "b27d419c535bf7b50ad355278b1159cbf0cc8d507ea003d625b17bf0375720b8"
+SRC_URI[jiter-0.0.6.sha256sum] = "87db066a99f69382be06d02313f8ce989996b53a04a8a70cfd1a6483a56227f7"
 SRC_URI[lexical-core-0.8.5.sha256sum] = "2cde5de06e8d4c2faabc400238f9ae1c74d5412d03a7bd067645ccbc47070e46"
 SRC_URI[lexical-parse-float-0.8.5.sha256sum] = "683b3a5ebd0130b8fb52ba0bdc718cc56815b6a097e28ae5a6997d0ad17dc05f"
 SRC_URI[lexical-parse-integer-0.8.6.sha256sum] = "6d0994485ed0c312f6d965766754ea177d07f9c00c9b82a5ee62ed5b47945ee9"
@@ -118,15 +120,15 @@ SRC_URI[num-traits-0.2.16.sha256sum] = "f30b0abd723be7e2ffca1272140fac1a2f084c77
 SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
 SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
 SRC_URI[parking_lot_core-0.9.8.sha256sum] = "93f00c865fe7cabf650081affecd3871070f26767e7b2070a3ffae14c654b447"
-SRC_URI[percent-encoding-2.3.0.sha256sum] = "9b2a4787296e9989611394c33f193f676704af1686e70b8f8033ab5ba9a35a94"
-SRC_URI[proc-macro2-1.0.69.sha256sum] = "134c189feb4956b20f6f547d2cf727d4c0fe06722b20a0eec87ed445a97f92da"
-SRC_URI[pyo3-0.20.0.sha256sum] = "04e8453b658fe480c3e70c8ed4e3d3ec33eb74988bd186561b0cc66b85c3bc4b"
-SRC_URI[pyo3-build-config-0.20.0.sha256sum] = "a96fe70b176a89cff78f2fa7b3c930081e163d5379b4dcdf993e3ae29ca662e5"
-SRC_URI[pyo3-ffi-0.20.0.sha256sum] = "214929900fd25e6604661ed9cf349727c8920d47deff196c4e28165a6ef2a96b"
-SRC_URI[pyo3-macros-0.20.0.sha256sum] = "dac53072f717aa1bfa4db832b39de8c875b7c7af4f4a6fe93cdbf9264cf8383b"
-SRC_URI[pyo3-macros-backend-0.20.0.sha256sum] = "7774b5a8282bd4f25f803b1f0d945120be959a36c72e08e7cd031c792fdfd424"
+SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
+SRC_URI[proc-macro2-1.0.76.sha256sum] = "95fc56cda0b5c3325f5fbbd7ff9fda9e02bb00bb3dac51252d2f1bfa1cb8cc8c"
+SRC_URI[pyo3-0.20.2.sha256sum] = "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
+SRC_URI[pyo3-build-config-0.20.2.sha256sum] = "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
+SRC_URI[pyo3-ffi-0.20.2.sha256sum] = "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
+SRC_URI[pyo3-macros-0.20.2.sha256sum] = "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
+SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] = "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
 SRC_URI[python3-dll-a-0.2.9.sha256sum] = "d5f07cd4412be8fa09a721d40007c483981bbe072cd6a21f2e83e04ec8f8343f"
-SRC_URI[quote-1.0.29.sha256sum] = "573015e8ab27661678357f27dc26460738fd2b6c86e46f386fde94cb5d913105"
+SRC_URI[quote-1.0.35.sha256sum] = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
 SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
 SRC_URI[regex-1.10.2.sha256sum] = "380b951a9c5e80ddfd6136919eef32310721aa4aacd4889a8d39124b026ab343"
 SRC_URI[regex-automata-0.4.3.sha256sum] = "5f804c7828047e88b2d32e2d7fe5a105da8ee3264f01902f796c8e067dc2483f"
@@ -134,15 +136,15 @@ SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f487
 SRC_URI[rustversion-1.0.13.sha256sum] = "dc31bd9b61a32c31f9650d18add92aa83a49ba979c143eefd27fe7177b05bd5f"
 SRC_URI[ryu-1.0.14.sha256sum] = "fe232bdf6be8c8de797b22184ee71118d63780ea42ac85b61d1baa6d3b782ae9"
 SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[serde-1.0.190.sha256sum] = "91d3c334ca1ee894a2c6f6ad698fe8c435b76d504b13d436f0685d648d6d96f7"
-SRC_URI[serde_derive-1.0.190.sha256sum] = "67c5609f394e5c2bd7fc51efda478004ea80ef42fee983d5c67a65e34f32c0e3"
-SRC_URI[serde_json-1.0.108.sha256sum] = "3d1c7e3eac408d115102c4c24ad393e0821bb3a5df4d506a80f85f7a742a526b"
-SRC_URI[smallvec-1.11.1.sha256sum] = "942b4a808e05215192e39f4ab80813e599068285906cc91aa64f923db842bd5a"
+SRC_URI[serde-1.0.195.sha256sum] = "63261df402c67811e9ac6def069e4786148c4563f4b50fd4bf30aa370d626b02"
+SRC_URI[serde_derive-1.0.195.sha256sum] = "46fe8f8603d81ba86327b23a2e9cdf49e1255fb94a4c5f297f6ee0547178ea2c"
+SRC_URI[serde_json-1.0.109.sha256sum] = "cb0652c533506ad7a2e353cce269330d6afd8bdfb6d75e0ace5b35aacbd7b9e9"
+SRC_URI[smallvec-1.11.2.sha256sum] = "4dccd0940a2dcdf68d092b8cbab7dc0ad8fa938bf95787e1b916b0e3d0e8e970"
 SRC_URI[speedate-0.13.0.sha256sum] = "242f76c50fd18cbf098607090ade73a08d39cfd84ea835f3796a2c855223b19b"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[strum-0.25.0.sha256sum] = "290d54ea6f91c969195bdbcd7442c8c2a2ba87da8bf60a7ee86a235d4bc1e125"
 SRC_URI[strum_macros-0.25.3.sha256sum] = "23dc1fa9ac9c169a78ba62f0b841814b7abae11bdd047b9c58f893439e309ea0"
-SRC_URI[syn-2.0.38.sha256sum] = "e96b79aaa137db8f61e26363a0c9b47d8b4ec75da28b7d1d614c2303e232408b"
+SRC_URI[syn-2.0.48.sha256sum] = "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
 SRC_URI[target-lexicon-0.12.9.sha256sum] = "df8e77cb757a61f51b947ec4a7e3646efd825b73561db1c232a8ccb639e611a0"
 SRC_URI[tinyvec-1.6.0.sha256sum] = "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
@@ -150,8 +152,8 @@ SRC_URI[unicode-bidi-0.3.13.sha256sum] = "92888ba5573ff080736b3648696b70cafad7d2
 SRC_URI[unicode-ident-1.0.10.sha256sum] = "22049a19f4a68748a168c0fc439f9516686aa045927ff767eca0a85101fb6e73"
 SRC_URI[unicode-normalization-0.1.22.sha256sum] = "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
-SRC_URI[url-2.4.1.sha256sum] = "143b538f18257fac9cad154828a57c6bf5157e1aa604d4816b5995bf6de87ae5"
-SRC_URI[uuid-1.5.0.sha256sum] = "88ad59a7560b41a70d191093a945f0b87bc1deeda46fb237479708a1d6b6cdfc"
+SRC_URI[url-2.5.0.sha256sum] = "31e6302e3bb753d46e83516cae55ae196fc0c309407cf11ab35cc51a4c2a4633"
+SRC_URI[uuid-1.6.1.sha256sum] = "5e395fcf16a7a3d8127ec99782007af141946b4795001f876d54fb0d55978560"
 SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[windows-targets-0.48.1.sha256sum] = "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
@@ -162,5 +164,5 @@ SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa
 SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
 SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
 SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
-SRC_URI[zerocopy-0.7.20.sha256sum] = "dd66a62464e3ffd4e37bd09950c2b9dd6c4f8767380fabba0d523f9a775bc85a"
-SRC_URI[zerocopy-derive-0.7.20.sha256sum] = "255c4596d41e6916ced49cfafea18727b24d67878fa180ddfd69b9df34fd1726"
+SRC_URI[zerocopy-0.7.32.sha256sum] = "74d4d3961e53fa4c9a25a8637fc2bfaf2595b3d3ae34875568a5cf64787716be"
+SRC_URI[zerocopy-derive-0.7.32.sha256sum] = "9ce1b18ccd8e73a9321186f97e46f9f04b778851177567b1975109d26a08d2a6"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.6.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.14.6.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.16.2.bb
index e58ee7fd6..7ac2b076c 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/pydantic/pydantic-core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 
-SRC_URI[sha256sum] = "1fd0c1d395372843fba13a51c28e3bb9d59bd7aebfeb17358ffaaa1e4dbbe948"
+SRC_URI[sha256sum] = "0ba503850d8b8dcc18391f10de896ae51d37fe5fe43dbfb6a35c5c5cad271a06"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.5.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.5.3.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
index 21341d26c..af465f423 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.6.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "b3ef57c62535b0941697cce638c08900d87fcb67e29cfa99e8a68f747f393f7a"
+SRC_URI[sha256sum] = "ae887bd94eb404b09d86e4d12f93893bdca79d766e738528c6fa1c849f3c6bcf"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.34.1


