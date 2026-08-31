Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEC4C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 10:20:20 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26427.1788171612917135343
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2026 03:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CmE6Qq3/;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48431648f33so1089009f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 03:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788171611; x=1788776411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcvNAWkW4o9YAYgG/TmL+J3wxhogA6aKg0kGl12QNvM=;
        b=CmE6Qq3/LUeEM32ae1EvB4CKU+v0o40l2kvpmodiC3J8EKv5g0w7iBpZGtYXSpfu5E
         cL319laKrcmzVj4LlVn4BJ37dNvfOXkyRbIRKim7Ule4TX5R792X4ISJC+zZGzGvJONG
         fzdHoZIf7HfBSMrWvb2pCHb8BRH3Ps59NkbOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171611; x=1788776411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcvNAWkW4o9YAYgG/TmL+J3wxhogA6aKg0kGl12QNvM=;
        b=LHgGlG0YwkNduR91JPdq3j2BJq4yHxmXIH/oQ5nO0P675WpjwM/62hIaqWBCpDjvvZ
         xEZQHGAwRHpwV0JNFtAGbwMKOS0SUGjfd97GpSAJdibfaHjkVazycHatixA8i0J6GHZ0
         atzj8ogsErtjpm1ihsGED2MucRHT5qAo1nk6+fG7uSCeXec5YyiEKSCnVE/Kl/I0lgEI
         Xnuo53DqB6aaX0ZlPh+H48SKt9dsZTPPKVudYWGopNCSv/DSJ5RhWPji69Kb/xPo7WBc
         xGhN0qynFz4u313JvxF+N3CF6WC0MDpnW2zz5GLCcysfZphaMBsnB1Ku7LeNDEXmGI1h
         FT8g==
X-Gm-Message-State: AFuF++mz4krgaDqBmbhsFnkkSf8KyK5Ch/LrkflR3fMglMFLTcstcw3q
	RtrDyDqE/yQhPhXfherq/oepd9DGQKu4A7+kbNgU9VTUmKBdKpjoTjUTOU3If8SfYftDM9Uq5tj
	qsYPi
X-Gm-Gg: AYBFou0ZS1PCrkldld+PW8stg2l+qwlIrJ2/uBXKJ132Td7wmhADNN1Dfcviz88N6PK
	/FWe0KHG/hZIb1alvlAljg+o5/1Qpxnq21mt8nNIINs7BVASMA8OZgLHW4LFMBzDvSyHLJ+IFTU
	Ple44V1JFTcHuUblw6hDQRoe8xgV0JH9/N/kVszdGjHI/FPXelgCT9mUfCZyy/moCqWFhkAZqYk
	YG2O9BC2P7LtRb4Hk79dL17AFiXA+2Ea4TirJ85jTWG7+3qvxRlFBGqDGFuZpKPFFTvdbdnb22o
	Y1hWmCIfDq8xsVJRxY9c3b+ZpYefVmcJFdDSX1MRz0LmcaodljaZpMCTQbVKJ2gzVLPb3as9B7C
	6dP6ERUvW5cyETkbehpuytBMG9yaCRF/tVvrhTl+x6X11TExoGzRnFYWs+QVyOxMfyZ3VV2T7zH
	0p19llqw0xObqahuV374b0eDQVgp+s0WHcJFGSgvMiabVW16djTwOCc4+jYSuvApscSsxXmdvWN
	j3R/rhEvp8uSsepeGOXO0+YUkXnRm671Qv2aivFzlCzWapz19EdzTr7wrUGnd168PtAkZwJq3vn
	45pARz+8TMBupQ==
X-Received: by 2002:a05:6000:2313:b0:481:562d:6fb1 with SMTP id ffacd0b85a97d-4843979a4d0mr11884988f8f.6.1788171611041;
        Mon, 31 Aug 2026 03:20:11 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb33070sm22463513f8f.36.2026.08.31.03.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:20:10 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-orjson: Upgrade 3.11.9 -> 3.12.0
Date: Mon, 31 Aug 2026 13:20:06 +0300
Message-ID: <20260831102006.2348475-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 10:20:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129611

Upgrade to release 3.12.0:

- Serialization implementation substantially rewritten.
- Publish PyPI wheels for Python 3.15. For Python 3.15 and later,
manylinux_2_39 (2024) is targeted instead of manylinux_2_17 (2012).
- No longer publish PyPI wheels for ppc64le and s390x.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-orjson-crates.inc          | 72 +++++++------------
 ...son_3.11.9.bb => python3-orjson_3.12.0.bb} |  2 +-
 2 files changed, 27 insertions(+), 47 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-orjson_3.11.9.bb => python3-orjson_3.12.0.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-orjson-crates.inc b/meta-python/recipes-devtools/python/python3-orjson-crates.inc
index c262bfdd44..156e974218 100644
--- a/meta-python/recipes-devtools/python/python3-orjson-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-orjson-crates.inc
@@ -4,71 +4,51 @@
 SRC_URI += " \
     crate://crates.io/associative-cache/3.0.1 \
     crate://crates.io/bytecount/0.6.9 \
-    crate://crates.io/bytes/1.11.1 \
-    crate://crates.io/cc/1.2.61 \
+    crate://crates.io/cc/1.4.3 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/encoding_rs/0.8.35 \
-    crate://crates.io/find-msvc-tools/0.1.9 \
-    crate://crates.io/gimli/0.32.3 \
-    crate://crates.io/itoa/1.0.18 \
+    crate://crates.io/find-msvc-tools/0.1.11 \
+    crate://crates.io/gimli/0.34.0 \
     crate://crates.io/itoap/1.0.1 \
-    crate://crates.io/jiff/0.2.24 \
-    crate://crates.io/jiff-static/0.2.24 \
-    crate://crates.io/libc/0.2.186 \
-    crate://crates.io/memchr/2.8.0 \
-    crate://crates.io/no-panic/0.1.36 \
+    crate://crates.io/jiff-core/0.1.0 \
+    crate://crates.io/libc/0.2.189 \
+    crate://crates.io/no-panic/0.1.37 \
     crate://crates.io/once_cell/1.21.4 \
-    crate://crates.io/portable-atomic/1.13.1 \
-    crate://crates.io/portable-atomic-util/0.2.7 \
-    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/proc-macro2/1.0.107 \
     crate://crates.io/pyo3-build-config/0.28.3 \
     crate://crates.io/pyo3-ffi/0.28.3 \
-    crate://crates.io/quote/1.0.45 \
-    crate://crates.io/serde/1.0.228 \
-    crate://crates.io/serde_core/1.0.228 \
-    crate://crates.io/serde_derive/1.0.228 \
-    crate://crates.io/serde_json/1.0.149 \
-    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/quote/1.0.47 \
+    crate://crates.io/shlex/2.0.1 \
     crate://crates.io/simdutf8/0.1.5 \
-    crate://crates.io/syn/2.0.117 \
+    crate://crates.io/syn/3.0.3 \
     crate://crates.io/target-lexicon/0.13.5 \
     crate://crates.io/unicode-ident/1.0.24 \
-    crate://crates.io/unwinding/0.2.8 \
-    crate://crates.io/xxhash-rust/0.8.15 \
-    crate://crates.io/zmij/1.0.21 \
+    crate://crates.io/unwinding/0.2.10 \
+    crate://crates.io/xxhash-rust/0.8.18 \
+    crate://crates.io/zmij/1.0.23 \
 "
 
 SRC_URI[associative-cache-3.0.1.sha256sum] = "138b4febdc7d0135523c55358c97361fd45089bc65fe859ef21a58d0892deb00"
 SRC_URI[bytecount-0.6.9.sha256sum] = "175812e0be2bccb6abe50bb8d566126198344f707e304f45c648fd8f2cc0365e"
-SRC_URI[bytes-1.11.1.sha256sum] = "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
-SRC_URI[cc-1.2.61.sha256sum] = "d16d90359e986641506914ba71350897565610e87ce0ad9e6f28569db3dd5c6d"
+SRC_URI[cc-1.4.3.sha256sum] = "509591b7bcd67f4ef775afad7662703b4935daaa6ec0e5605cfb1090b32a2b6d"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
-SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
-SRC_URI[gimli-0.32.3.sha256sum] = "e629b9b98ef3dd8afe6ca2bd0f89306cec16d43d907889945bc5d6687f2f13c7"
-SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
+SRC_URI[find-msvc-tools-0.1.11.sha256sum] = "d45db016d36b838f563236e9193d0ee6ce38f3f68b6c94e914b4929c96bbb890"
+SRC_URI[gimli-0.34.0.sha256sum] = "1033caf0b349c518623b5396bfb2cf0bddf44f0306d543a250e5743297aafd10"
 SRC_URI[itoap-1.0.1.sha256sum] = "9028f49264629065d057f340a86acb84867925865f73bbf8d47b4d149a7e88b8"
-SRC_URI[jiff-0.2.24.sha256sum] = "f00b5dbd620d61dfdcb6007c9c1f6054ebd75319f163d886a9055cec1155073d"
-SRC_URI[jiff-static-0.2.24.sha256sum] = "e000de030ff8022ea1da3f466fbb0f3a809f5e51ed31f6dd931c35181ad8e6d7"
-SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
-SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
-SRC_URI[no-panic-0.1.36.sha256sum] = "f967505aabc8af5752d098c34146544a43684817cdba8f9725b292530cabbf53"
+SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09"
+SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
+SRC_URI[no-panic-0.1.37.sha256sum] = "fc80370b4544f28ffa317e3c3474ee3ecbfe269196c01ae657d9f837a7d944a1"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
-SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
-SRC_URI[portable-atomic-util-0.2.7.sha256sum] = "c2a106d1259c23fac8e543272398ae0e3c0b8d33c88ed73d0cc71b0f1d902618"
-SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
 SRC_URI[pyo3-build-config-0.28.3.sha256sum] = "e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e"
 SRC_URI[pyo3-ffi-0.28.3.sha256sum] = "7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e"
-SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
-SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
-SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
-SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
-SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
-SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
+SRC_URI[shlex-2.0.1.sha256sum] = "f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba"
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
-SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
+SRC_URI[syn-3.0.3.sha256sum] = "53e9bae58849f64dfa4f5d5ae372c8341f7305f82a3868709269343628b659a3"
 SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
-SRC_URI[unwinding-0.2.8.sha256sum] = "60612c845ef41699f39dc8c5391f252942c0a88b7d15da672eff0d14101bbd6d"
-SRC_URI[xxhash-rust-0.8.15.sha256sum] = "fdd20c5420375476fbd4394763288da7eb0cc0b8c11deed431a91562af7335d3"
-SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
+SRC_URI[unwinding-0.2.10.sha256sum] = "4b134ada16dda9e435abe2a6d76a01d497bc60707357845a15f9b0ed42dc88ce"
+SRC_URI[xxhash-rust-0.8.18.sha256sum] = "aee1b19627c7c60102ab80d3a9cbe18de90bfe03bfa6c3715447681f0e8c8af6"
+SRC_URI[zmij-1.0.23.sha256sum] = "29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b"
diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.11.9.bb b/meta-python/recipes-devtools/python/python3-orjson_3.12.0.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-orjson_3.11.9.bb
rename to meta-python/recipes-devtools/python/python3-orjson_3.12.0.bb
index 1b49a76b9f..0be63c6c8a 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.11.9.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/orjson/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
 
-SRCREV = "705515d77b28429d0b7c30c3d781abe52e8a1e5a"
+SRCREV = "6737895a1a4e3e26df0569a40147893a786f9a58"
 PYPI_SRC_URI = "git://github.com/ijl/orjson;protocol=https;branch=master;tag=${PV};destsuffix=orjson-${PV}"
 
 CVE_PRODUCT = "orjson"
-- 
2.47.3


