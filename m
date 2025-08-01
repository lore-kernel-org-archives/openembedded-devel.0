Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CA1C87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 04:43:05 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.80612.1754023383210140051
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Jul 2025 21:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OAsnrtIO;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76bde897110so178474b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Jul 2025 21:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754023382; x=1754628182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=29VigLG+bPRCmdSAHOE7rye+45O7AaKEnnGwCttFPbE=;
        b=OAsnrtIOjIK5R9hhnTZMM/aIjpo7/QYC7dW1JTyvME0FwhOBqCv8SGKx0/EYauMs7D
         HfDQOD9VsJMm/94TgeMHfEIavl1fajG5ITvpXfHGfo57VxRROZewtNWmRt8ET51DwuPQ
         wfwO6UIu7mPmKKdAW00fg8aFkygjh3d5inkiOU2vW5HFTWGxa2djyi3zxxY+YBlTcuYm
         aY/qqrG/rQvLG4XG5loj5e1OgXRrz1v7bYi5geCkAC/aUJsILFWRDUFv/dAb3NmCL+Iv
         ldDMS0Jw697ZLTxnzc8WiFU2j2D8vCg8ReWJawkmYT1A2dRMwrG7wvNd1nVu2BAoX81K
         rgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754023382; x=1754628182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29VigLG+bPRCmdSAHOE7rye+45O7AaKEnnGwCttFPbE=;
        b=vQ2t1PIasbLkMUVkGmkTi/pDJRqOTzZsmMP3dQui3UcLCmOnxN90T0EpI7E//gW+Iv
         2rjI7mYYtnnfD5W4Ho9pYpKeuPwbVFh7/NfARlNWQVPcHE+0kQoI2P94rRhLUJNkiFTD
         GW786J4sxoHNzluLr1MuqrUMApicBqCdtHtUrTHkiRCVH+1jyiEnjUoOZhRAnlvz2U0M
         Sr9lK7DQ/eWgTczEgE9PoXD2F4hQ0z8ml/4+lhUPDtNLZyy2owgTEzKKe8pLlSiIEMBE
         9IUuvLYdyCBkEKkyN0HzEPs8/wFyEypLrlZQs3rAz/tf4wE9uKZSPJDSV5iMcMEUPazl
         VeuA==
X-Gm-Message-State: AOJu0Yyll+hcvr9FpgDWnUvEOZjMShkNHSCYRmUI+J4j2kDZRu+5jHaE
	DPQgt90yhm7Ad/AHjIwxeoG5wyHk6fR2RCxCnDAmtYG7FcacnR9ymNREm5xxUTMj868=
X-Gm-Gg: ASbGnctDObaT7CDWUzeAizNhVHftHX9f2Sv81TUZGChYIyoSYh5R67K6NpUYByfdkuQ
	iaQ/z+0i/ClmSbNGx7eee7G5Xmeq53+dJRmQOIeSsqNllVbyR9HzelK9MihZKHExxShhMEAItWL
	QMzKQd0vUx/hhodmvnhn3pcHOqZopA2tFAMSjjZ2aHbvWTjpwlsFNSaKWzKNbQ4Wf0LAgHKyjdo
	S0/K2mRWpeUzOLEczPubQ4Ux55AjiEnfst2JJ86JaCvxZF2mcVDY8js5QJO5Y2qXaBn+Wb6Yjh5
	WZnQfg5euI7kOtBdozipa1OMsFN5xeFyOp/g+THMe2byP/yMCVSw/66Dekf4jBhDr0KacO/JXho
	8EVsuz6I05G8PgLWGsC6WpQw6
X-Google-Smtp-Source: AGHT+IGvFB0XhNXJtXIpsOaxiGrtvlYhrYMy0fCwqNKhfkE7DkIR2NQynOEc7BY/e9xrNw7SoOSYEg==
X-Received: by 2002:a05:6a20:7485:b0:220:a24b:8701 with SMTP id adf61e73a8af0-23dc0eac364mr15548357637.41.1754023382114;
        Thu, 31 Jul 2025 21:43:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbcbf0sm3014884b3a.69.2025.07.31.21.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 21:43:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pydantic-core: Upgrade to 2.37.2
Date: Thu, 31 Jul 2025 21:42:59 -0700
Message-ID: <20250801044259.3647773-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 04:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118819

Add a patch to fix with rust 1.88+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pydantic-core-crates.inc   | 46 ++++++++++++-------
 .../python/python3-pydantic-core/atomic.patch | 39 ++++++++++++++++
 ...5.2.bb => python3-pydantic-core_2.37.2.bb} |  3 +-
 3 files changed, 71 insertions(+), 17 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/atomic.patch
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.35.2.bb => python3-pydantic-core_2.37.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index c76f69d4e0..42d7a830c1 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -8,6 +8,7 @@ SRC_URI += " \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/bitflags/2.9.1 \
     crate://crates.io/bitvec/1.0.1 \
+    crate://crates.io/bumpalo/3.19.0 \
     crate://crates.io/cc/1.0.101 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/displaydoc/0.2.5 \
@@ -32,11 +33,13 @@ SRC_URI += " \
     crate://crates.io/indoc/2.0.5 \
     crate://crates.io/itoa/1.0.11 \
     crate://crates.io/jiter/0.10.0 \
+    crate://crates.io/js-sys/0.3.77 \
     crate://crates.io/lexical-parse-float/1.0.5 \
     crate://crates.io/lexical-parse-integer/1.0.5 \
     crate://crates.io/lexical-util/1.0.6 \
     crate://crates.io/libc/0.2.155 \
     crate://crates.io/litemap/0.7.3 \
+    crate://crates.io/log/0.4.27 \
     crate://crates.io/memchr/2.7.4 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/num-bigint/0.4.6 \
@@ -46,15 +49,14 @@ SRC_URI += " \
     crate://crates.io/percent-encoding/2.3.1 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.25.0 \
-    crate://crates.io/pyo3-build-config/0.25.0 \
-    crate://crates.io/pyo3-ffi/0.25.0 \
-    crate://crates.io/pyo3-macros/0.25.0 \
-    crate://crates.io/pyo3-macros-backend/0.25.0 \
+    crate://crates.io/pyo3/0.25.1 \
+    crate://crates.io/pyo3-build-config/0.25.1 \
+    crate://crates.io/pyo3-ffi/0.25.1 \
+    crate://crates.io/pyo3-macros/0.25.1 \
+    crate://crates.io/pyo3-macros-backend/0.25.1 \
     crate://crates.io/python3-dll-a/0.2.14 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/r-efi/5.2.0 \
-    crate://crates.io/radium/0.7.0 \
     crate://crates.io/radium/1.1.0 \
     crate://crates.io/regex/1.11.1 \
     crate://crates.io/regex-automata/0.4.8 \
@@ -64,7 +66,7 @@ SRC_URI += " \
     crate://crates.io/serde/1.0.219 \
     crate://crates.io/serde_derive/1.0.219 \
     crate://crates.io/serde_json/1.0.140 \
-    crate://crates.io/smallvec/1.15.0 \
+    crate://crates.io/smallvec/1.15.1 \
     crate://crates.io/speedate/0.16.0 \
     crate://crates.io/stable_deref_trait/1.2.0 \
     crate://crates.io/static_assertions/1.1.0 \
@@ -80,9 +82,14 @@ SRC_URI += " \
     crate://crates.io/url/2.5.4 \
     crate://crates.io/utf16_iter/1.0.5 \
     crate://crates.io/utf8_iter/1.0.4 \
-    crate://crates.io/uuid/1.16.0 \
+    crate://crates.io/uuid/1.17.0 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
+    crate://crates.io/wasm-bindgen/0.2.100 \
+    crate://crates.io/wasm-bindgen-backend/0.2.100 \
+    crate://crates.io/wasm-bindgen-macro/0.2.100 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.100 \
+    crate://crates.io/wasm-bindgen-shared/0.2.100 \
     crate://crates.io/wit-bindgen-rt/0.39.0 \
     crate://crates.io/write16/1.0.0 \
     crate://crates.io/writeable/0.5.5 \
@@ -103,6 +110,7 @@ SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b102
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[bitflags-2.9.1.sha256sum] = "1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967"
 SRC_URI[bitvec-1.0.1.sha256sum] = "1bc2832c24239b0141d5674bb9174f9d68a8b5b3f2753311927c172ca46f7e9c"
+SRC_URI[bumpalo-3.19.0.sha256sum] = "46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a66f80a5a72e1cb76b34d43"
 SRC_URI[cc-1.0.101.sha256sum] = "ac367972e516d45567c7eafc73d24e1c193dcf200a8d94e9db7b3d38b349572d"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
@@ -127,11 +135,13 @@ SRC_URI[idna_adapter-1.2.0.sha256sum] = "daca1df1c957320b2cf139ac61e7bd64fed304c
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
 SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
 SRC_URI[jiter-0.10.0.sha256sum] = "1bcfb1e43bda3ba59889499ff494c5f5b6b10864b74aa0bd4593ce4d16838aa6"
+SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
 SRC_URI[lexical-parse-float-1.0.5.sha256sum] = "de6f9cb01fb0b08060209a057c048fcbab8717b4c1ecd2eac66ebfe39a65b0f2"
 SRC_URI[lexical-parse-integer-1.0.5.sha256sum] = "72207aae22fc0a121ba7b6d479e42cbfea549af1479c3f3a4f12c70dd66df12e"
 SRC_URI[lexical-util-1.0.6.sha256sum] = "5a82e24bf537fd24c177ffbbdc6ebcc8d54732c35b50a3f28cc3f4e4c949a0b3"
 SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
 SRC_URI[litemap-0.7.3.sha256sum] = "643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e1e71bc420f4688a3a704"
+SRC_URI[log-0.4.27.sha256sum] = "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
 SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
@@ -141,15 +151,14 @@ SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa
 SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.25.0.sha256sum] = "f239d656363bcee73afef85277f1b281e8ac6212a1d42aa90e55b90ed43c47a4"
-SRC_URI[pyo3-build-config-0.25.0.sha256sum] = "755ea671a1c34044fa165247aaf6f419ca39caa6003aee791a0df2713d8f1b6d"
-SRC_URI[pyo3-ffi-0.25.0.sha256sum] = "fc95a2e67091e44791d4ea300ff744be5293f394f1bafd9f78c080814d35956e"
-SRC_URI[pyo3-macros-0.25.0.sha256sum] = "a179641d1b93920829a62f15e87c0ed791b6c8db2271ba0fd7c2686090510214"
-SRC_URI[pyo3-macros-backend-0.25.0.sha256sum] = "9dff85ebcaab8c441b0e3f7ae40a6963ecea8a9f5e74f647e33fcf5ec9a1e89e"
+SRC_URI[pyo3-0.25.1.sha256sum] = "8970a78afe0628a3e3430376fc5fd76b6b45c4d43360ffd6cdd40bdde72b682a"
+SRC_URI[pyo3-build-config-0.25.1.sha256sum] = "458eb0c55e7ece017adeba38f2248ff3ac615e53660d7c71a238d7d2a01c7598"
+SRC_URI[pyo3-ffi-0.25.1.sha256sum] = "7114fe5457c61b276ab77c5055f206295b812608083644a5c5b2640c3102565c"
+SRC_URI[pyo3-macros-0.25.1.sha256sum] = "a8725c0a622b374d6cb051d11a0983786448f7785336139c3c94f5aa6bef7e50"
+SRC_URI[pyo3-macros-backend-0.25.1.sha256sum] = "4109984c22491085343c05b0dbc54ddc405c3cf7b4374fc533f5c3313a572ccc"
 SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[r-efi-5.2.0.sha256sum] = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
-SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
 SRC_URI[radium-1.1.0.sha256sum] = "db0b76288902db304c864a12046b73d2d895cc34a4bb8137baaeebe9978a072c"
 SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
 SRC_URI[regex-automata-0.4.8.sha256sum] = "368758f23274712b504848e9d5a6f010445cc8b87a7cdb4d7cbee666c1288da3"
@@ -159,7 +168,7 @@ SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc95
 SRC_URI[serde-1.0.219.sha256sum] = "5f0e2c6ed6606019b4e29e69dbaba95b11854410e5347d525002456dbbb786b6"
 SRC_URI[serde_derive-1.0.219.sha256sum] = "5b0276cf7f2c73365f7157c8123c21cd9a50fbbd844757af28ca1f5925fc2a00"
 SRC_URI[serde_json-1.0.140.sha256sum] = "20068b6e96dc6c9bd23e01df8827e6c7e1f2fddd43c21810382803c136b99373"
-SRC_URI[smallvec-1.15.0.sha256sum] = "8917285742e9f3e1683f0a9c4e6b57960b7314d0b08d30d1ecd426713ee2eee9"
+SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 SRC_URI[speedate-0.16.0.sha256sum] = "bc823f2eb39713ef0d286058af264ce0d8ddcf62b8a78a0aec02cd0105576d87"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
@@ -175,9 +184,14 @@ SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd8
 SRC_URI[url-2.5.4.sha256sum] = "32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7fda60"
 SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
-SRC_URI[uuid-1.16.0.sha256sum] = "458f7a779bf54acc9f347480ac654f68407d3aab21269a6e3c9f922acd9e2da9"
+SRC_URI[uuid-1.17.0.sha256sum] = "3cf4199d1e5d15ddd86a694e4d0dffa9c323ce759fea589f00fef9d81cc1931d"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
+SRC_URI[wasm-bindgen-0.2.100.sha256sum] = "1edc8929d7499fc4e8f0be2262a241556cfc54a0bea223790e71446f2aab1ef5"
+SRC_URI[wasm-bindgen-backend-0.2.100.sha256sum] = "2f0a0651a5c2bc21487bde11ee802ccaf4c51935d0d3d42a6101f98161700bc6"
+SRC_URI[wasm-bindgen-macro-0.2.100.sha256sum] = "7fe63fc6d09ed3792bd0897b314f53de8e16568c2b3f7982f468c0bf9bd0b407"
+SRC_URI[wasm-bindgen-macro-support-0.2.100.sha256sum] = "8ae87ea40c9f689fc23f209965b6fb8a99ad69aeeb0231408be24920604395de"
+SRC_URI[wasm-bindgen-shared-0.2.100.sha256sum] = "1a05d73b933a847d6cccdda8f838a22ff101ad9bf93e33684f39c1f5f0eece3d"
 SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] = "6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1"
 SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
 SRC_URI[writeable-0.5.5.sha256sum] = "1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc95c51"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/atomic.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/atomic.patch
new file mode 100644
index 0000000000..1a6a55737c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/atomic.patch
@@ -0,0 +1,39 @@
+Fix ambiguous import of marker::Atomic crate
+
+The problem is that Atomic is being imported from two different places:
+
+As a type alias from sync::atomic::*
+As a trait from crate::marker::*
+
+This creates ambiguity when the code tries to use T: Atomic + PartialEq as a trait bound.
+adds explicit imports to radium-1.1.0/src/lib.rs
+
+Fixes
+error[E0404]: expected trait, found type alias `Atomic`
+error[E0659]: `Atomic` is ambiguous 
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: radium-1.1.0/src/lib.rs
+===================================================================
+--- radium-1.1.0.orig/src/lib.rs
++++ radium-1.1.0/src/lib.rs
+@@ -12,6 +12,8 @@ use core::{
+ };
+ 
+ use crate::marker::*;
++use crate::marker::Atomic as AtomicTrait;
++
+ pub use crate::types::{
+ 	Atom,
+ 	Isotope,
+@@ -801,7 +803,7 @@ radium! {
+ 
+ unsafe impl<T> Radium for Atom<T>
+ where
+-	T: Atomic + PartialEq,
++	T: AtomicTrait + PartialEq,
+ 	T::Atom: Radium<Item = T>,
+ {
+ 	type Item = T;
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.35.2.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.37.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.35.2.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.37.2.bb
index 788cbd2ceb..b64f781481 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.35.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.37.2.bb
@@ -11,9 +11,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 require ${BPN}-crates.inc
 
 SRC_URI += "file://0001-Upgrade-radium-to-1.0.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/bitvec-1.0.1/"
+SRC_URI += "file://atomic.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/radium-1.1.0/"
 SRC_URI += "file://0001-musl-enable-getrandom-on-all-musl-platforms.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/libc-0.2.155/"
 SRC_URI += "file://0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch"
-SRC_URI[sha256sum] = "e010b13ff0d6375ee83f7478fbda42e1fbf55f1b2feef76b673c40861ffd31e6"
+SRC_URI[sha256sum] = "78fb2a749123408fedaf540a22ca6bf0b5ec1f522a14fc00e27ede33d8ac088c"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 

