Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B967C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:15:16 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6853.1784124913912376064
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SbVQ+Yvs;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso3409219f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 07:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784124912; x=1784729712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kkqn1TcxVW03A4mTNaNt5AhIITHH9kjyrpgWiMcXyZI=;
        b=SbVQ+YvsJqrxvE5iJfklV40GxEAfvwRm8xBko7+4FqeQnjxzAHC3ymbyD0YqDtqJId
         Bp76KCRsarjC8oOavjWH7nRfCWFDp43D2NIqxZ//JOMsS0zk16hTzuhlOc5099qZDWD/
         5JctTw6gdgz5ooEfnnlsxH0gd4EBgucVqLpSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124912; x=1784729712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kkqn1TcxVW03A4mTNaNt5AhIITHH9kjyrpgWiMcXyZI=;
        b=Na1ih/uHQNk5evgIhmbtEEybF9GSlIEGeQGhjFTB2zt9D/fSeUt/JODknRtltSZLJ1
         K7jkM7PRz0uFSoGn6yde2j2x4hZDd7zgazjBLWO84FZ9/6F4G5KZFL6eFP047EHYPJth
         GwUx37gLLOxh3x1+Wsq2CKxoZjdLb1WUfTMHQhPPbjjbS1W3Kbbx9ZvP6Gfc8DCBsS7w
         nryU7HWYnOzSMOggZspARneuuH5N5yJnv+UA0ttw1aHSq3oOBq/42H5yjmuQd3IkCTtj
         xV17DeAkqVfjthVd7OP7fEcLhGP5Dv19/0J8NGP6+3qXUHXN5+0QPRXXumJdRGa+MZy+
         T8Sw==
X-Gm-Message-State: AOJu0YwlHROLVZ4YDq9sXkmXaqnAs/bEwPA3iveAeCVZ6fT/FPl8+JCN
	fd5RNVrLjw7AuvEqT7Be2Gtusm1bxju0/9gljkQK+7Bs8TMiSfDj/1ASJyi5SWB9ieW6gOziXGL
	fZMh5
X-Gm-Gg: AfdE7clvHbCGfSuwOCk1MCFbMVo5Zblt2txorERrNR6XILvcm/lUvl76YP3trAtDGad
	0LbxczBVvv3rvrh1KmAnVDCWXlO09URQIs2WKZ6at7DKAklZTZC1AfZbtXJW8P39+v+I5MmsK7Y
	qyxk1k7uZEZv/Ol2kWMMNIGb4dbw/8F3DDsNmJWzBOiHUriJs3BeWTJ0ssn85kQI+m0a3/Use9m
	2/bQzxg9eehrwNTOeuNHdrwCLJl15j7kc3lhl8IRm/CN3Pv+WaAdlReCn6MNwPG3U2zv67PlkoB
	KD6Svj+osE75l4wO0ER8kMRAox+zxZpBIUqFqSifDdigXiO3kBydoRzsYqpWkLT6+VohKXpVVhC
	g9peucd98XO3gyjNI2HV3NYqYVoTxxGFSraFUHXsM7763Vpqfq+/lREkzaA8mPelf+/MNBNeUL5
	WImRLdBOQ+XKxyHxe+UJ1q3kt/qEc/OqVx2pLpim0mNz/eXso7/w6ZXUhPBjso2gmWnYpv/KN0y
	4pEOtXRGdwXqAoBA2VpAyylgn2AnCZsgNvkBINmgefd848gBZPT
X-Received: by 2002:a05:600c:3113:b0:495:3f84:a794 with SMTP id 5b1f17b1804b1-4953f84a90fmr15396655e9.36.1784124911461;
        Wed, 15 Jul 2026 07:15:11 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950872424asm156777845e9.1.2026.07.15.07.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:15:10 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-pydantic-core: Upgrade 2.41.5 -> 2.46.4
Date: Wed, 15 Jul 2026 17:15:06 +0300
Message-ID: <20260715141507.3352685-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715141507.3352685-1-leon.anavi@konsulko.com>
References: <20260715141507.3352685-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 14:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128220

Upgrade pydantic-core to version 2.46.4 as it required for newer
Pydantic versions.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pydantic-core-crates.inc   | 99 ++++++++++++-------
 ...toml-Update-bitvec-to-use-radium-1.x.patch | 36 +++----
 ...1.5.bb => python3-pydantic-core_2.46.4.bb} |  2 +-
 3 files changed, 81 insertions(+), 56 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.41.5.bb => python3-pydantic-core_2.46.4.bb} (98%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index ba13535d1d..44c19ac76a 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -4,6 +4,7 @@
 SRC_URI += " \
     crate://crates.io/ahash/0.8.12 \
     crate://crates.io/aho-corasick/1.1.3 \
+    crate://crates.io/allocator-api2/0.2.21 \
     crate://crates.io/autocfg/1.3.0 \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/bitflags/2.9.1 \
@@ -13,9 +14,12 @@ SRC_URI += " \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/enum_dispatch/0.3.13 \
-    crate://crates.io/form_urlencoded/1.2.1 \
+    crate://crates.io/equivalent/1.0.2 \
+    crate://crates.io/foldhash/0.2.0 \
+    crate://crates.io/form_urlencoded/1.2.2 \
     crate://crates.io/funty/2.0.0 \
     crate://crates.io/getrandom/0.3.3 \
+    crate://crates.io/hashbrown/0.16.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/hex/0.4.3 \
     crate://crates.io/icu_collections/1.5.0 \
@@ -30,18 +34,17 @@ SRC_URI += " \
     crate://crates.io/icu_provider_macros/1.5.0 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.0 \
-    crate://crates.io/indoc/2.0.5 \
     crate://crates.io/itoa/1.0.11 \
-    crate://crates.io/jiter/0.11.1 \
+    crate://crates.io/jiter/0.14.0 \
     crate://crates.io/js-sys/0.3.77 \
     crate://crates.io/lexical-parse-float/1.0.5 \
     crate://crates.io/lexical-parse-integer/1.0.5 \
     crate://crates.io/lexical-util/1.0.6 \
-    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/libc/0.2.185 \
     crate://crates.io/litemap/0.7.3 \
     crate://crates.io/log/0.4.27 \
+    crate://crates.io/lru/0.16.3 \
     crate://crates.io/memchr/2.7.4 \
-    crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/num-bigint/0.4.6 \
     crate://crates.io/num-integer/0.1.46 \
     crate://crates.io/num-traits/0.2.19 \
@@ -49,24 +52,23 @@ SRC_URI += " \
     crate://crates.io/percent-encoding/2.3.2 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.26.0 \
-    crate://crates.io/pyo3-build-config/0.26.0 \
-    crate://crates.io/pyo3-ffi/0.26.0 \
-    crate://crates.io/pyo3-macros/0.26.0 \
-    crate://crates.io/pyo3-macros-backend/0.26.0 \
+    crate://crates.io/pyo3/0.28.3 \
+    crate://crates.io/pyo3-build-config/0.28.3 \
+    crate://crates.io/pyo3-ffi/0.28.3 \
+    crate://crates.io/pyo3-macros/0.28.3 \
+    crate://crates.io/pyo3-macros-backend/0.28.3 \
     crate://crates.io/python3-dll-a/0.2.14 \
-    crate://crates.io/quote/1.0.36 \
+    crate://crates.io/quote/1.0.44 \
     crate://crates.io/r-efi/5.2.0 \
-    crate://crates.io/radium/1.1.0 \
-    crate://crates.io/regex/1.12.2 \
+    crate://crates.io/radium/0.7.0 \
+    crate://crates.io/regex/1.12.3 \
     crate://crates.io/regex-automata/0.4.13 \
     crate://crates.io/regex-syntax/0.8.5 \
     crate://crates.io/rustversion/1.0.17 \
-    crate://crates.io/ryu/1.0.18 \
     crate://crates.io/serde/1.0.228 \
     crate://crates.io/serde_core/1.0.228 \
     crate://crates.io/serde_derive/1.0.228 \
-    crate://crates.io/serde_json/1.0.145 \
+    crate://crates.io/serde_json/1.0.149 \
     crate://crates.io/smallvec/1.15.1 \
     crate://crates.io/speedate/0.17.0 \
     crate://crates.io/stable_deref_trait/1.2.0 \
@@ -76,14 +78,13 @@ SRC_URI += " \
     crate://crates.io/syn/2.0.82 \
     crate://crates.io/synstructure/0.13.1 \
     crate://crates.io/tap/1.0.1 \
-    crate://crates.io/target-lexicon/0.13.2 \
+    crate://crates.io/target-lexicon/0.13.4 \
     crate://crates.io/tinystr/0.7.6 \
     crate://crates.io/unicode-ident/1.0.12 \
-    crate://crates.io/unindent/0.2.3 \
-    crate://crates.io/url/2.5.4 \
+    crate://crates.io/url/2.5.8 \
     crate://crates.io/utf16_iter/1.0.5 \
     crate://crates.io/utf8_iter/1.0.4 \
-    crate://crates.io/uuid/1.18.1 \
+    crate://crates.io/uuid/1.23.0 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
     crate://crates.io/wasm-bindgen/0.2.100 \
@@ -103,10 +104,12 @@ SRC_URI += " \
     crate://crates.io/zerofrom-derive/0.1.4 \
     crate://crates.io/zerovec/0.10.4 \
     crate://crates.io/zerovec-derive/0.10.3 \
+    crate://crates.io/zmij/1.0.6 \
 "
 
 SRC_URI[ahash-0.8.12.sha256sum] = "5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75"
 SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
+SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
 SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[bitflags-2.9.1.sha256sum] = "1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967"
@@ -116,9 +119,12 @@ SRC_URI[cc-1.0.101.sha256sum] = "ac367972e516d45567c7eafc73d24e1c193dcf200a8d94e
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[enum_dispatch-0.3.13.sha256sum] = "aa18ce2bc66555b3218614519ac839ddb759a7d6720732f979ef8d13be147ecd"
-SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
+SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
+SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
+SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
 SRC_URI[funty-2.0.0.sha256sum] = "e6d5a32815ae3f33302d95fdcb2ce17862f8c65363dcfd29360480ba1001fc9c"
 SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
+SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
 SRC_URI[icu_collections-1.5.0.sha256sum] = "db2fa452206ebee18c4b5c2274dbf1de17008e874b4dc4f0aea9d01ca79e4526"
@@ -133,18 +139,17 @@ SRC_URI[icu_provider-1.5.0.sha256sum] = "6ed421c8a8ef78d3e2dbc98a973be2f3770cb42
 SRC_URI[icu_provider_macros-1.5.0.sha256sum] = "1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.0.sha256sum] = "daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71"
-SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
 SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
-SRC_URI[jiter-0.11.1.sha256sum] = "8e805fb15a8249d25213202b9098f7b9ad00f8042ccc6f0063d2ae7b33f3d7da"
+SRC_URI[jiter-0.14.0.sha256sum] = "b6f3b5d3f84b36f4ad09fd1da896d23d9852a1aa86556578dd0289f43dce311d"
 SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
 SRC_URI[lexical-parse-float-1.0.5.sha256sum] = "de6f9cb01fb0b08060209a057c048fcbab8717b4c1ecd2eac66ebfe39a65b0f2"
 SRC_URI[lexical-parse-integer-1.0.5.sha256sum] = "72207aae22fc0a121ba7b6d479e42cbfea549af1479c3f3a4f12c70dd66df12e"
 SRC_URI[lexical-util-1.0.6.sha256sum] = "5a82e24bf537fd24c177ffbbdc6ebcc8d54732c35b50a3f28cc3f4e4c949a0b3"
-SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[libc-0.2.185.sha256sum] = "52ff2c0fe9bc6cb6b14a0592c2ff4fa9ceb83eea9db979b0487cd054946a2b8f"
 SRC_URI[litemap-0.7.3.sha256sum] = "643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e1e71bc420f4688a3a704"
 SRC_URI[log-0.4.27.sha256sum] = "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
+SRC_URI[lru-0.16.3.sha256sum] = "a1dc47f592c06f33f8e3aea9591776ec7c9f9e4124778ff8a3c3b87159f7e593"
 SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
-SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
 SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
@@ -152,24 +157,23 @@ SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515
 SRC_URI[percent-encoding-2.3.2.sha256sum] = "9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.26.0.sha256sum] = "7ba0117f4212101ee6544044dae45abe1083d30ce7b29c4b5cbdfa2354e07383"
-SRC_URI[pyo3-build-config-0.26.0.sha256sum] = "4fc6ddaf24947d12a9aa31ac65431fb1b851b8f4365426e182901eabfb87df5f"
-SRC_URI[pyo3-ffi-0.26.0.sha256sum] = "025474d3928738efb38ac36d4744a74a400c901c7596199e20e45d98eb194105"
-SRC_URI[pyo3-macros-0.26.0.sha256sum] = "2e64eb489f22fe1c95911b77c44cc41e7c19f3082fc81cce90f657cdc42ffded"
-SRC_URI[pyo3-macros-backend-0.26.0.sha256sum] = "100246c0ecf400b475341b8455a9213344569af29a3c841d29270e53102e0fcf"
+SRC_URI[pyo3-0.28.3.sha256sum] = "91fd8e38a3b50ed1167fb981cd6fd60147e091784c427b8f7183a7ee32c31c12"
+SRC_URI[pyo3-build-config-0.28.3.sha256sum] = "e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e"
+SRC_URI[pyo3-ffi-0.28.3.sha256sum] = "7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e"
+SRC_URI[pyo3-macros-0.28.3.sha256sum] = "df6e520eff47c45997d2fc7dd8214b25dd1310918bbb2642156ef66a67f29813"
+SRC_URI[pyo3-macros-backend-0.28.3.sha256sum] = "c4cdc218d835738f81c2338f822078af45b4afdf8b2e33cbb5916f108b813acb"
 SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
-SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
 SRC_URI[r-efi-5.2.0.sha256sum] = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
-SRC_URI[radium-1.1.0.sha256sum] = "db0b76288902db304c864a12046b73d2d895cc34a4bb8137baaeebe9978a072c"
-SRC_URI[regex-1.12.2.sha256sum] = "843bc0191f75f3e22651ae5f1e72939ab2f72a4bc30fa80a066bd66edefc24d4"
+SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
+SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
 SRC_URI[regex-automata-0.4.13.sha256sum] = "5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
 SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
 SRC_URI[rustversion-1.0.17.sha256sum] = "955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6"
-SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
 SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
 SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
-SRC_URI[serde_json-1.0.145.sha256sum] = "402a6f66d8c709116cf22f558eab210f5a50187f702eb4d7e5ef38d9a7f1c79c"
+SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
 SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 SRC_URI[speedate-0.17.0.sha256sum] = "aba069c070b5e213f2a094deb7e5ed50ecb092be36102a4f4042e8d2056d060e"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
@@ -179,14 +183,13 @@ SRC_URI[strum_macros-0.27.2.sha256sum] = "7695ce3845ea4b33927c055a39dc438a45b059
 SRC_URI[syn-2.0.82.sha256sum] = "83540f837a8afc019423a8edb95b52a8effe46957ee402287f4292fae35be021"
 SRC_URI[synstructure-0.13.1.sha256sum] = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
-SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
+SRC_URI[target-lexicon-0.13.4.sha256sum] = "b1dd07eb858a2067e2f3c7155d54e929265c264e6f37efe3ee7a8d1b5a1dd0ba"
 SRC_URI[tinystr-0.7.6.sha256sum] = "9117f5d4db391c1cf6927e7bea3db74b9a1c1add8f7eda9ffd5364f40f57b82f"
 SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
-SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
-SRC_URI[url-2.5.4.sha256sum] = "32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7fda60"
+SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
-SRC_URI[uuid-1.18.1.sha256sum] = "2f87b8aa10b915a06587d0dec516c282ff295b475d94abf425d62b57710070a2"
+SRC_URI[uuid-1.23.0.sha256sum] = "5ac8b6f42ead25368cf5b098aeb3dc8a1a2c05a3eee8a9a1a68c640edbfc79d9"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
 SRC_URI[wasm-bindgen-0.2.100.sha256sum] = "1edc8929d7499fc4e8f0be2262a241556cfc54a0bea223790e71446f2aab1ef5"
@@ -206,3 +209,23 @@ SRC_URI[zerofrom-0.1.4.sha256sum] = "91ec111ce797d0e0784a1116d0ddcdbea84322cd79e
 SRC_URI[zerofrom-derive-0.1.4.sha256sum] = "0ea7b4a3637ea8669cedf0f1fd5c286a17f3de97b8dd5a70a6c167a1730e63a5"
 SRC_URI[zerovec-0.10.4.sha256sum] = "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079"
 SRC_URI[zerovec-derive-0.10.3.sha256sum] = "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
+SRC_URI[zmij-1.0.6.sha256sum] = "aac060176f7020d62c3bcc1cdbcec619d54f48b07ad1963a3f80ce7a0c17755f"
+SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
+SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
+SRC_URI[jiter-0.11.1.sha256sum] = "8e805fb15a8249d25213202b9098f7b9ad00f8042ccc6f0063d2ae7b33f3d7da"
+SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
+SRC_URI[pyo3-0.26.0.sha256sum] = "7ba0117f4212101ee6544044dae45abe1083d30ce7b29c4b5cbdfa2354e07383"
+SRC_URI[pyo3-build-config-0.26.0.sha256sum] = "4fc6ddaf24947d12a9aa31ac65431fb1b851b8f4365426e182901eabfb87df5f"
+SRC_URI[pyo3-ffi-0.26.0.sha256sum] = "025474d3928738efb38ac36d4744a74a400c901c7596199e20e45d98eb194105"
+SRC_URI[pyo3-macros-0.26.0.sha256sum] = "2e64eb489f22fe1c95911b77c44cc41e7c19f3082fc81cce90f657cdc42ffded"
+SRC_URI[pyo3-macros-backend-0.26.0.sha256sum] = "100246c0ecf400b475341b8455a9213344569af29a3c841d29270e53102e0fcf"
+SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[radium-1.1.0.sha256sum] = "db0b76288902db304c864a12046b73d2d895cc34a4bb8137baaeebe9978a072c"
+SRC_URI[regex-1.12.2.sha256sum] = "843bc0191f75f3e22651ae5f1e72939ab2f72a4bc30fa80a066bd66edefc24d4"
+SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
+SRC_URI[serde_json-1.0.145.sha256sum] = "402a6f66d8c709116cf22f558eab210f5a50187f702eb4d7e5ef38d9a7f1c79c"
+SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
+SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
+SRC_URI[url-2.5.4.sha256sum] = "32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7fda60"
+SRC_URI[uuid-1.18.1.sha256sum] = "2f87b8aa10b915a06587d0dec516c282ff295b475d94abf425d62b57710070a2"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
index e4f19a1e3a..53fd2a4785 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
@@ -1,4 +1,4 @@
-From 1f0eaed9473f2a60f4a4e2dd95e376cebc0112d9 Mon Sep 17 00:00:00 2001
+From ca6400743a86fa334936d9984dcd40e90bb06e60 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 19 Apr 2025 00:09:42 -0700
 Subject: [PATCH] cargo.toml: Update bitvec to use radium 1.x
@@ -8,15 +8,15 @@ Upstream-Status: Submitted [https://github.com/ferrilab/bitvec/pull/220]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- Cargo.lock | 12 +++++++++++-
+ Cargo.lock | 10 +++++++---
  Cargo.toml |  2 ++
- 2 files changed, 13 insertions(+), 1 deletion(-)
+ 2 files changed, 9 insertions(+), 3 deletions(-)
 
 diff --git a/Cargo.lock b/Cargo.lock
-index 1a7c8ea..3d5eafe 100644
+index 6f26c8a..91ceade 100644
 --- a/Cargo.lock
 +++ b/Cargo.lock
-@@ -49,7 +49,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+@@ -55,7 +55,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
  checksum = "1bc2832c24239b0141d5674bb9174f9d68a8b5b3f2753311927c172ca46f7e9c"
  dependencies = [
   "funty",
@@ -25,7 +25,7 @@ index 1a7c8ea..3d5eafe 100644
   "tap",
   "wyz",
  ]
-@@ -444,6 +444,7 @@ dependencies = [
+@@ -469,6 +469,7 @@ dependencies = [
   "percent-encoding",
   "pyo3",
   "pyo3-build-config",
@@ -33,32 +33,34 @@ index 1a7c8ea..3d5eafe 100644
   "regex",
   "serde",
   "serde_json",
-@@ -549,6 +550,15 @@ version = "0.7.0"
- source = "registry+https://github.com/rust-lang/crates.io-index"
- checksum = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
+@@ -569,9 +570,12 @@ checksum = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
  
-+[[package]]
-+name = "radium"
+ [[package]]
+ name = "radium"
+-version = "0.7.0"
 +version = "1.1.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
 +checksum = "db0b76288902db304c864a12046b73d2d895cc34a4bb8137baaeebe9978a072c"
 +dependencies = [
 + "cfg-if",
 +]
-+
+ 
  [[package]]
  name = "regex"
- version = "1.12.2"
 diff --git a/Cargo.toml b/Cargo.toml
-index a7e86ab..09eaf64 100644
+index 1fb5dcc..4949c8a 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
 @@ -25,6 +25,8 @@ include = [
- rust-version = "1.75"
+ rust-version = "1.88"
  
  [dependencies]
 +#bitvec = { git = "https://github.com/alexanderkjall/bitvec", branch = "upgrade-radium-to-1" }
 +radium = "1"
  # TODO it would be very nice to remove the "py-clone" feature as it can panic,
  # but needs a bit of work to make sure it's not used in the codebase
- pyo3 = { version = "0.26", features = ["generate-import-lib", "num-bigint", "py-clone"] }
+ pyo3 = { version = "0.28", features = ["generate-import-lib", "num-bigint", "py-clone", "smallvec"] }
+-- 
+2.47.3
+
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.41.5.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.4.bb
similarity index 98%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.41.5.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.46.4.bb
index dbd4673734..9bfbb701e4 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.41.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.46.4.bb
@@ -116,7 +116,7 @@ SRC_URI += "crate://crates.io/ahash/0.8.12 \
            crate://crates.io/zerovec/0.10.4 \
            crate://crates.io/zerovec-derive/0.10.3 \
            "
-SRC_URI[sha256sum] = "08daa51ea16ad373ffd5e7606252cc32f07bc72b28284b6bc9c6df804816476e"
+SRC_URI[sha256sum] = "62f875393d7f270851f20523dd2e29f082bcc82292d66db2b64ea71f64b6e1c1"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
-- 
2.47.3


