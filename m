Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D09DEA3C41
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:11 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129135.1775730850359344839
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=N2lySdSc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730851; x=1807266851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6PAZzn9K+cRjdseHJ0/ucTD5wLBhxVeMo0atnmmPMys=;
  b=N2lySdScmObPLBywYU6xN1Upbob3Ao25cLIDtq2x3lGnliTtTLrzlwpA
   2TqBFJ+diX4T956fu6os0003+I3beaih4myFyzaTpLJs9pObH3w9sRczw
   Zd3nMFtUj5+FMC8qKwiIaODRo9npVIo83dR8h9GQM8asGbwx4L0vVPNyn
   vChpU8dfAkRYFoadv2BS5968syrGSKgZkOfa+a/lSWjjHxi6HMTpr5t01
   BgnEEbOCEMg5qUU0aASO2NOZXdzsAlmcCBaydMN5dxPXJ8q6+YA5zq0kb
   RjhBr1MfgznWKwu28ydxvYTYPpRH4dpxWUJcAbPTe+NjxoBr0PO7nsaWw
   Q==;
X-CSE-ConnectionGUID: WRR6i3XZRPWlsDLfs0sW4A==
X-CSE-MsgGUID: 3Ye/YhZLSkyOCTiA+lqeVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="240796150"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="240796150"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:09 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EAD8C3FF6
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:08 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9D6C6180414F
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 09AB7404336;
	Thu,  9 Apr 2026 10:34:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/37] python3-orjson: upgrade 3.11.7 -> 3.11.8
Date: Thu,  9 Apr 2026 18:32:10 +0800
Message-ID: <20260409103223.1574-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126173

From: Wang Mingyu <wangmy@fujitsu.com>

Build and compatibility improvements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-orjson-crates.inc          | 80 ++++++++-----------
 ...son_3.11.7.bb => python3-orjson_3.11.8.bb} |  2 +-
 2 files changed, 35 insertions(+), 47 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-orjson_3.11.7.bb => python3-orjson_3.11.8.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-orjson-crates.inc b/meta-python/recipes-devtools/python/python3-orjson-crates.inc
index 5e3aa8592b..3feff8d77d 100644
--- a/meta-python/recipes-devtools/python/python3-orjson-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-orjson-crates.inc
@@ -2,87 +2,75 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/associative-cache/2.0.0 \
+    crate://crates.io/associative-cache/3.0.0 \
     crate://crates.io/bytecount/0.6.9 \
-    crate://crates.io/bytes/1.11.0 \
-    crate://crates.io/cc/1.2.55 \
+    crate://crates.io/bytes/1.11.1 \
+    crate://crates.io/cc/1.2.58 \
     crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/crunchy/0.2.4 \
     crate://crates.io/encoding_rs/0.8.35 \
     crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/gimli/0.32.3 \
-    crate://crates.io/half/2.7.1 \
-    crate://crates.io/itoa/1.0.17 \
+    crate://crates.io/itoa/1.0.18 \
     crate://crates.io/itoap/1.0.1 \
-    crate://crates.io/jiff/0.2.18 \
-    crate://crates.io/jiff-static/0.2.18 \
-    crate://crates.io/libc/0.2.180 \
-    crate://crates.io/memchr/2.7.6 \
+    crate://crates.io/jiff/0.2.23 \
+    crate://crates.io/jiff-static/0.2.23 \
+    crate://crates.io/libc/0.2.183 \
+    crate://crates.io/memchr/2.8.0 \
     crate://crates.io/no-panic/0.1.36 \
-    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/portable-atomic/1.13.1 \
-    crate://crates.io/portable-atomic-util/0.2.5 \
+    crate://crates.io/portable-atomic-util/0.2.6 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3-build-config/0.28.0 \
-    crate://crates.io/pyo3-ffi/0.28.0 \
-    crate://crates.io/quote/1.0.44 \
+    crate://crates.io/pyo3-build-config/0.28.2 \
+    crate://crates.io/pyo3-ffi/0.28.2 \
+    crate://crates.io/quote/1.0.45 \
     crate://crates.io/serde/1.0.228 \
     crate://crates.io/serde_core/1.0.228 \
     crate://crates.io/serde_derive/1.0.228 \
     crate://crates.io/serde_json/1.0.149 \
     crate://crates.io/shlex/1.3.0 \
     crate://crates.io/simdutf8/0.1.5 \
-    crate://crates.io/smallvec/1.15.1 \
-    crate://crates.io/syn/2.0.114 \
-    crate://crates.io/target-lexicon/0.13.4 \
-    crate://crates.io/unicode-ident/1.0.22 \
+    crate://crates.io/syn/2.0.117 \
+    crate://crates.io/target-lexicon/0.13.5 \
+    crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/unwinding/0.2.8 \
-    crate://crates.io/uuid/1.20.0 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/xxhash-rust/0.8.15 \
-    crate://crates.io/zerocopy/0.8.37 \
-    crate://crates.io/zerocopy-derive/0.8.37 \
-    crate://crates.io/zmij/1.0.19 \
+    crate://crates.io/zmij/1.0.21 \
 "
 
-SRC_URI[associative-cache-2.0.0.sha256sum] = "b993cd767a2bc7307dd87622311ca22c44329cc7a21366206bfa0896827b2bad"
+SRC_URI[associative-cache-3.0.0.sha256sum] = "6104bd6fd778b62f638add0dd848dca9887cf016a343d15a21d27fb8a3965b98"
 SRC_URI[bytecount-0.6.9.sha256sum] = "175812e0be2bccb6abe50bb8d566126198344f707e304f45c648fd8f2cc0365e"
-SRC_URI[bytes-1.11.0.sha256sum] = "b35204fbdc0b3f4446b89fc1ac2cf84a8a68971995d0bf2e925ec7cd960f9cb3"
-SRC_URI[cc-1.2.55.sha256sum] = "47b26a0954ae34af09b50f0de26458fa95369a0d478d8236d3f93082b219bd29"
+SRC_URI[bytes-1.11.1.sha256sum] = "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
+SRC_URI[cc-1.2.58.sha256sum] = "e1e928d4b69e3077709075a938a05ffbedfa53a84c8f766efbf8220bb1ff60e1"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
-SRC_URI[crunchy-0.2.4.sha256sum] = "460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
 SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[gimli-0.32.3.sha256sum] = "e629b9b98ef3dd8afe6ca2bd0f89306cec16d43d907889945bc5d6687f2f13c7"
-SRC_URI[half-2.7.1.sha256sum] = "6ea2d84b969582b4b1864a92dc5d27cd2b77b622a8d79306834f1be5ba20d84b"
-SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
+SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
 SRC_URI[itoap-1.0.1.sha256sum] = "9028f49264629065d057f340a86acb84867925865f73bbf8d47b4d149a7e88b8"
-SRC_URI[jiff-0.2.18.sha256sum] = "e67e8da4c49d6d9909fe03361f9b620f58898859f5c7aded68351e85e71ecf50"
-SRC_URI[jiff-static-0.2.18.sha256sum] = "e0c84ee7f197eca9a86c6fd6cb771e55eb991632f15f2bc3ca6ec838929e6e78"
-SRC_URI[libc-0.2.180.sha256sum] = "bcc35a38544a891a5f7c865aca548a982ccb3b8650a5b06d0fd33a10283c56fc"
-SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
+SRC_URI[jiff-0.2.23.sha256sum] = "1a3546dc96b6d42c5f24902af9e2538e82e39ad350b0c766eb3fbf2d8f3d8359"
+SRC_URI[jiff-static-0.2.23.sha256sum] = "2a8c8b344124222efd714b73bb41f8b5120b27a7cc1c75593a6ff768d9d05aa4"
+SRC_URI[libc-0.2.183.sha256sum] = "b5b646652bf6661599e1da8901b3b9522896f01e736bad5f723fe7a3a27f899d"
+SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
 SRC_URI[no-panic-0.1.36.sha256sum] = "f967505aabc8af5752d098c34146544a43684817cdba8f9725b292530cabbf53"
-SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
-SRC_URI[portable-atomic-util-0.2.5.sha256sum] = "7a9db96d7fa8782dd8c15ce32ffe8680bbd1e978a43bf51a34d39483540495f5"
+SRC_URI[portable-atomic-util-0.2.6.sha256sum] = "091397be61a01d4be58e7841595bd4bfedb15f1cd54977d79b8271e94ed799a3"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-build-config-0.28.0.sha256sum] = "972720a441c91fd9c49f212a1d2d74c6e3803b231ebc8d66c51efbd7ccab11c8"
-SRC_URI[pyo3-ffi-0.28.0.sha256sum] = "5994456d9dab8934d600d3867571b6410f24fbd6002570ad56356733eb54859b"
-SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
+SRC_URI[pyo3-build-config-0.28.2.sha256sum] = "8bf94ee265674bf76c09fa430b0e99c26e319c945d96ca0d5a8215f31bf81cf7"
+SRC_URI[pyo3-ffi-0.28.2.sha256sum] = "491aa5fc66d8059dd44a75f4580a2962c1862a1c2945359db36f6c2818b748dc"
+SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
 SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
 SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
 SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
-SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
-SRC_URI[syn-2.0.114.sha256sum] = "d4d107df263a3013ef9b1879b0df87d706ff80f65a86ea879bd9c31f9b307c2a"
-SRC_URI[target-lexicon-0.13.4.sha256sum] = "b1dd07eb858a2067e2f3c7155d54e929265c264e6f37efe3ee7a8d1b5a1dd0ba"
-SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
+SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
+SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
+SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[unwinding-0.2.8.sha256sum] = "60612c845ef41699f39dc8c5391f252942c0a88b7d15da672eff0d14101bbd6d"
-SRC_URI[uuid-1.20.0.sha256sum] = "ee48d38b119b0cd71fe4141b30f5ba9c7c5d9f4e7a3a8b4a674e4b6ef789976f"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[xxhash-rust-0.8.15.sha256sum] = "fdd20c5420375476fbd4394763288da7eb0cc0b8c11deed431a91562af7335d3"
-SRC_URI[zerocopy-0.8.37.sha256sum] = "7456cf00f0685ad319c5b1693f291a650eaf345e941d082fc4e03df8a03996ac"
-SRC_URI[zerocopy-derive-0.8.37.sha256sum] = "1328722bbf2115db7e19d69ebcc15e795719e2d66b60827c6a69a117365e37a0"
-SRC_URI[zmij-1.0.19.sha256sum] = "3ff05f8caa9038894637571ae6b9e29466c1f4f829d26c9b28f869a29cbe3445"
+SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.11.7.bb b/meta-python/recipes-devtools/python/python3-orjson_3.11.8.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-orjson_3.11.7.bb
rename to meta-python/recipes-devtools/python/python3-orjson_3.11.8.bb
index 63e2e089e1..22a0205af3 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.11.7.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.11.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/orjson/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
 
-SRCREV = "ec2b066cae79ae4a90ed126ac5723335dd99e408"
+SRCREV = "5cbb3d0398a2f42de51210270286fecd798c5d78"
 PYPI_SRC_URI = "git://github.com/ijl/orjson;protocol=https;branch=master;tag=${PV};destsuffix=orjson-${PV}"
 
 CVE_PRODUCT = "orjson"
-- 
2.43.0


