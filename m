Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B98CCD18E
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:17:39 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.43438.1760361452419970866
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NsL7ADhP;
 spf=pass (domain: konsulko.com, ip: 209.85.218.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b00a9989633so798543666b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 06:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1760361450; x=1760966250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmtZ5IUxr8P/4iuNMIjHyn07bBM5bR3SIDoIFHdOMUA=;
        b=NsL7ADhPAVhYnaqbHt6QodL2//BkRPVwb4oPQMeACJpOQTV+SG2q7k+8OQddDKfwQg
         vpwDu1oS7BxxdxMboIBZ0ZKdFXd3XV9Lf7sFrFghrdW6vaUINcMUCvxzlCnBHSqpucRk
         NqXH3s5cB0YCURVR/KjvXqZxVo19LfvVRxWVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361450; x=1760966250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmtZ5IUxr8P/4iuNMIjHyn07bBM5bR3SIDoIFHdOMUA=;
        b=U1vIGJ3RJSea8rWRK7ZMW+iZUx4RQzMdspapuM7v2zJCFZjQURsXGUiZjvcgtE/Lql
         QdEAzJ1WsR+JQYAE47OnruSbg9y9vFs+IKVd9IU/jBcgUtu2+w7UVV6SdkIHqf/zqzRf
         CaYiYaXUVeE6tNworKQ5IKF1pEubj0mls1dA2KV/RGYJLSfyUne7T99/6LW7pEZE36Dp
         ABWD7P/aOkD1VO5m5GO2coiCZJbDmybkPE9CWsivYpHVeegmL7PxY4LDFxnigJxZS+zI
         1jVxvyQl1hxOkr7gKbcB/ll9yb1ucTW7ME6xJNpFtdlXO3ZvHnXB5s+x4VEm32ZWluNM
         JxMg==
X-Gm-Message-State: AOJu0YyFe4uR3FTjiWoh+HP5ZuGLO8g2Z5LXQTYkzIho7PMgG36yEawN
	S2FOkqNzj62/Oa7c43uQhXXNyWNvEhvCVB5xZP0q1R/VV9AX78bjeZc9yWeeI4Il6nbchAF0/LL
	RlIYC
X-Gm-Gg: ASbGncsUY3Q53g5b3oD/6mbzhEvhLKFnY0yGxMuyuWr4sNY/yBC6K9sY8BYtUHW6nKR
	kVV0I3rsXFb4CYGhm8E4Ka4CfTP+PbMbwCdSEML72NZ/x2tXD5k0tNCwMI9gLXad1YQufNKChdb
	yT10NPc3CIa4Hwh0ZIHpQK4ykv3rTFdNm2i8eC4Ayy1Jv9kxIdjoWOzuZmHAqKZ5vXYqSuZCyiH
	S2KvkQyIpPV86ZDsXwyhAIVVUkCJfkWy07DiB/d64dVDOIbu0gedzj2Uz8jFQwmsotZxG7+XeeP
	JVoiVXOFmyt/VyGn1zQAzmO6Ta79nmqJzjr7QxEWZptAQxCFmcWhiIIUC3D5d5Utk9d08gs88T6
	A9BJJmwwcNHeskf7TZar/FNLVlJfHjgRqK6Syv8TkefUhY8Mf6Wa2xrUDILY+Qs4Rkw==
X-Google-Smtp-Source: AGHT+IG0XeNVsYb9S3U/3N3UYt+waLn8Rx813SF3gQnvDNxai+tsUITD2Iz7N10cDNH9oWlYS7DwLQ==
X-Received: by 2002:a17:907:c814:b0:b50:149d:4af with SMTP id a640c23a62f3a-b50149d0847mr2558506566b.27.1760361450358;
        Mon, 13 Oct 2025 06:17:30 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d952a273sm948768366b.83.2025.10.13.06.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:17:29 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-pydantic-core: Upgrade 2.37.2 -> 2.41.1
Date: Mon, 13 Oct 2025 16:17:24 +0300
Message-ID: <20251013131725.2583786-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013131725.2583786-1-leon.anavi@konsulko.com>
References: <20251013131725.2583786-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 13:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120530

Upgrade to release 2.41.1:

- Add url_preserve_empty_path entry to CoreConfig

v2.41.0:

- Do not call default factories taking the data argument if a
  validation error already occurred
- fix default_factory which takes data on more types
- ci: avoid timeout on aarch64 tests
- make _pydantic_core._pydantic_core pub for static linking
- Preserve order for collections.OrderedDict

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pydantic-core-crates.inc   | 72 ++++++++++---------
 ...toml-Update-bitvec-to-use-radium-1.x.patch | 15 ++--
 ...7.2.bb => python3-pydantic-core_2.41.1.bb} |  2 +-
 3 files changed, 47 insertions(+), 42 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.37.2.bb => python3-pydantic-core_2.41.1.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index 42d7a830c1..1bee2b03ea 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -28,11 +28,11 @@ SRC_URI += " \
     crate://crates.io/icu_properties_data/1.5.0 \
     crate://crates.io/icu_provider/1.5.0 \
     crate://crates.io/icu_provider_macros/1.5.0 \
-    crate://crates.io/idna/1.0.3 \
+    crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.0 \
     crate://crates.io/indoc/2.0.5 \
     crate://crates.io/itoa/1.0.11 \
-    crate://crates.io/jiter/0.10.0 \
+    crate://crates.io/jiter/0.11.0 \
     crate://crates.io/js-sys/0.3.77 \
     crate://crates.io/lexical-parse-float/1.0.5 \
     crate://crates.io/lexical-parse-integer/1.0.5 \
@@ -45,33 +45,35 @@ SRC_URI += " \
     crate://crates.io/num-bigint/0.4.6 \
     crate://crates.io/num-integer/0.1.46 \
     crate://crates.io/num-traits/0.2.19 \
-    crate://crates.io/once_cell/1.19.0 \
+    crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/percent-encoding/2.3.1 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.25.1 \
-    crate://crates.io/pyo3-build-config/0.25.1 \
-    crate://crates.io/pyo3-ffi/0.25.1 \
-    crate://crates.io/pyo3-macros/0.25.1 \
-    crate://crates.io/pyo3-macros-backend/0.25.1 \
+    crate://crates.io/pyo3/0.26.0 \
+    crate://crates.io/pyo3-build-config/0.26.0 \
+    crate://crates.io/pyo3-ffi/0.26.0 \
+    crate://crates.io/pyo3-macros/0.26.0 \
+    crate://crates.io/pyo3-macros-backend/0.26.0 \
     crate://crates.io/python3-dll-a/0.2.14 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/r-efi/5.2.0 \
+    crate://crates.io/radium/0.7.0 \
     crate://crates.io/radium/1.1.0 \
-    crate://crates.io/regex/1.11.1 \
-    crate://crates.io/regex-automata/0.4.8 \
+    crate://crates.io/regex/1.11.3 \
+    crate://crates.io/regex-automata/0.4.11 \
     crate://crates.io/regex-syntax/0.8.5 \
     crate://crates.io/rustversion/1.0.17 \
     crate://crates.io/ryu/1.0.18 \
-    crate://crates.io/serde/1.0.219 \
-    crate://crates.io/serde_derive/1.0.219 \
-    crate://crates.io/serde_json/1.0.140 \
+    crate://crates.io/serde/1.0.228 \
+    crate://crates.io/serde_core/1.0.228 \
+    crate://crates.io/serde_derive/1.0.228 \
+    crate://crates.io/serde_json/1.0.145 \
     crate://crates.io/smallvec/1.15.1 \
-    crate://crates.io/speedate/0.16.0 \
+    crate://crates.io/speedate/0.17.0 \
     crate://crates.io/stable_deref_trait/1.2.0 \
     crate://crates.io/static_assertions/1.1.0 \
-    crate://crates.io/strum/0.27.1 \
-    crate://crates.io/strum_macros/0.27.1 \
+    crate://crates.io/strum/0.27.2 \
+    crate://crates.io/strum_macros/0.27.2 \
     crate://crates.io/syn/2.0.82 \
     crate://crates.io/synstructure/0.13.1 \
     crate://crates.io/tap/1.0.1 \
@@ -82,7 +84,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.4 \
     crate://crates.io/utf16_iter/1.0.5 \
     crate://crates.io/utf8_iter/1.0.4 \
-    crate://crates.io/uuid/1.17.0 \
+    crate://crates.io/uuid/1.18.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
     crate://crates.io/wasm-bindgen/0.2.100 \
@@ -130,11 +132,11 @@ SRC_URI[icu_properties-1.5.1.sha256sum] = "93d6020766cfc6302c15dbbc9c8778c37e62c
 SRC_URI[icu_properties_data-1.5.0.sha256sum] = "67a8effbc3dd3e4ba1afa8ad918d5684b8868b3b26500753effea8d2eed19569"
 SRC_URI[icu_provider-1.5.0.sha256sum] = "6ed421c8a8ef78d3e2dbc98a973be2f3770cb42b606e3ab18d6237c4dfde68d9"
 SRC_URI[icu_provider_macros-1.5.0.sha256sum] = "1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6"
-SRC_URI[idna-1.0.3.sha256sum] = "686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea968a7e"
+SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.0.sha256sum] = "daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
 SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
-SRC_URI[jiter-0.10.0.sha256sum] = "1bcfb1e43bda3ba59889499ff494c5f5b6b10864b74aa0bd4593ce4d16838aa6"
+SRC_URI[jiter-0.11.0.sha256sum] = "ed1be5dfeadf968b30fa03a012a2f161de8be6df2d91bd8085c62cfb5efca65a"
 SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
 SRC_URI[lexical-parse-float-1.0.5.sha256sum] = "de6f9cb01fb0b08060209a057c048fcbab8717b4c1ecd2eac66ebfe39a65b0f2"
 SRC_URI[lexical-parse-integer-1.0.5.sha256sum] = "72207aae22fc0a121ba7b6d479e42cbfea549af1479c3f3a4f12c70dd66df12e"
@@ -147,33 +149,35 @@ SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce444
 SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
 SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
-SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.25.1.sha256sum] = "8970a78afe0628a3e3430376fc5fd76b6b45c4d43360ffd6cdd40bdde72b682a"
-SRC_URI[pyo3-build-config-0.25.1.sha256sum] = "458eb0c55e7ece017adeba38f2248ff3ac615e53660d7c71a238d7d2a01c7598"
-SRC_URI[pyo3-ffi-0.25.1.sha256sum] = "7114fe5457c61b276ab77c5055f206295b812608083644a5c5b2640c3102565c"
-SRC_URI[pyo3-macros-0.25.1.sha256sum] = "a8725c0a622b374d6cb051d11a0983786448f7785336139c3c94f5aa6bef7e50"
-SRC_URI[pyo3-macros-backend-0.25.1.sha256sum] = "4109984c22491085343c05b0dbc54ddc405c3cf7b4374fc533f5c3313a572ccc"
+SRC_URI[pyo3-0.26.0.sha256sum] = "7ba0117f4212101ee6544044dae45abe1083d30ce7b29c4b5cbdfa2354e07383"
+SRC_URI[pyo3-build-config-0.26.0.sha256sum] = "4fc6ddaf24947d12a9aa31ac65431fb1b851b8f4365426e182901eabfb87df5f"
+SRC_URI[pyo3-ffi-0.26.0.sha256sum] = "025474d3928738efb38ac36d4744a74a400c901c7596199e20e45d98eb194105"
+SRC_URI[pyo3-macros-0.26.0.sha256sum] = "2e64eb489f22fe1c95911b77c44cc41e7c19f3082fc81cce90f657cdc42ffded"
+SRC_URI[pyo3-macros-backend-0.26.0.sha256sum] = "100246c0ecf400b475341b8455a9213344569af29a3c841d29270e53102e0fcf"
 SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[r-efi-5.2.0.sha256sum] = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
+SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
 SRC_URI[radium-1.1.0.sha256sum] = "db0b76288902db304c864a12046b73d2d895cc34a4bb8137baaeebe9978a072c"
-SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
-SRC_URI[regex-automata-0.4.8.sha256sum] = "368758f23274712b504848e9d5a6f010445cc8b87a7cdb4d7cbee666c1288da3"
+SRC_URI[regex-1.11.3.sha256sum] = "8b5288124840bee7b386bc413c487869b360b2b4ec421ea56425128692f2a82c"
+SRC_URI[regex-automata-0.4.11.sha256sum] = "833eb9ce86d40ef33cb1306d8accf7bc8ec2bfea4355cbdebb3df68b40925cad"
 SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
 SRC_URI[rustversion-1.0.17.sha256sum] = "955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6"
 SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
-SRC_URI[serde-1.0.219.sha256sum] = "5f0e2c6ed6606019b4e29e69dbaba95b11854410e5347d525002456dbbb786b6"
-SRC_URI[serde_derive-1.0.219.sha256sum] = "5b0276cf7f2c73365f7157c8123c21cd9a50fbbd844757af28ca1f5925fc2a00"
-SRC_URI[serde_json-1.0.140.sha256sum] = "20068b6e96dc6c9bd23e01df8827e6c7e1f2fddd43c21810382803c136b99373"
+SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
+SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
+SRC_URI[serde_json-1.0.145.sha256sum] = "402a6f66d8c709116cf22f558eab210f5a50187f702eb4d7e5ef38d9a7f1c79c"
 SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
-SRC_URI[speedate-0.16.0.sha256sum] = "bc823f2eb39713ef0d286058af264ce0d8ddcf62b8a78a0aec02cd0105576d87"
+SRC_URI[speedate-0.17.0.sha256sum] = "aba069c070b5e213f2a094deb7e5ed50ecb092be36102a4f4042e8d2056d060e"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
-SRC_URI[strum-0.27.1.sha256sum] = "f64def088c51c9510a8579e3c5d67c65349dcf755e5479ad3d010aa6454e2c32"
-SRC_URI[strum_macros-0.27.1.sha256sum] = "c77a8c5abcaf0f9ce05d62342b7d298c346515365c36b673df4ebe3ced01fde8"
+SRC_URI[strum-0.27.2.sha256sum] = "af23d6f6c1a224baef9d3f61e287d2761385a5b88fdab4eb4c6f11aeb54c4bcf"
+SRC_URI[strum_macros-0.27.2.sha256sum] = "7695ce3845ea4b33927c055a39dc438a45b059f7c1b3d91d38d10355fb8cbca7"
 SRC_URI[syn-2.0.82.sha256sum] = "83540f837a8afc019423a8edb95b52a8effe46957ee402287f4292fae35be021"
 SRC_URI[synstructure-0.13.1.sha256sum] = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
@@ -184,7 +188,7 @@ SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd8
 SRC_URI[url-2.5.4.sha256sum] = "32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7fda60"
 SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
-SRC_URI[uuid-1.17.0.sha256sum] = "3cf4199d1e5d15ddd86a694e4d0dffa9c323ce759fea589f00fef9d81cc1931d"
+SRC_URI[uuid-1.18.1.sha256sum] = "2f87b8aa10b915a06587d0dec516c282ff295b475d94abf425d62b57710070a2"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
 SRC_URI[wasm-bindgen-0.2.100.sha256sum] = "1edc8929d7499fc4e8f0be2262a241556cfc54a0bea223790e71446f2aab1ef5"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
index 58f8514630..ccaae06b7b 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
@@ -1,4 +1,4 @@
-From 41fded05f38bdb8378b98be4f1dd5392a00f3d1b Mon Sep 17 00:00:00 2001
+From c4ebe7d218f7415b7c0137c231a47455b237840b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 19 Apr 2025 00:09:42 -0700
 Subject: [PATCH] cargo.toml: Update bitvec to use radium 1.x
@@ -6,13 +6,14 @@ Subject: [PATCH] cargo.toml: Update bitvec to use radium 1.x
 Upstream-Status: Submitted [https://github.com/ferrilab/bitvec/pull/220]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  Cargo.lock | 12 +++++++++++-
  Cargo.toml |  2 ++
  2 files changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/Cargo.lock b/Cargo.lock
-index 44bdf4e..274b828 100644
+index c1d0e44..9fc5367 100644
 --- a/Cargo.lock
 +++ b/Cargo.lock
 @@ -49,7 +49,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
@@ -24,7 +25,7 @@ index 44bdf4e..274b828 100644
   "tap",
   "wyz",
  ]
-@@ -421,6 +421,7 @@ dependencies = [
+@@ -443,6 +443,7 @@ dependencies = [
   "num-traits",
   "pyo3",
   "pyo3-build-config",
@@ -32,7 +33,7 @@ index 44bdf4e..274b828 100644
   "regex",
   "serde",
   "serde_json",
-@@ -527,6 +528,15 @@ version = "0.7.0"
+@@ -548,6 +549,15 @@ version = "0.7.0"
  source = "registry+https://github.com/rust-lang/crates.io-index"
  checksum = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
  
@@ -47,9 +48,9 @@ index 44bdf4e..274b828 100644
 +
  [[package]]
  name = "regex"
- version = "1.11.1"
+ version = "1.11.3"
 diff --git a/Cargo.toml b/Cargo.toml
-index 660e06a..7ee67d6 100644
+index df90031..e671ade 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
 @@ -25,6 +25,8 @@ include = [
@@ -60,4 +61,4 @@ index 660e06a..7ee67d6 100644
 +radium = "1"
  # TODO it would be very nice to remove the "py-clone" feature as it can panic,
  # but needs a bit of work to make sure it's not used in the codebase
- pyo3 = { version = "0.25", features = ["generate-import-lib", "num-bigint", "py-clone"] }
+ pyo3 = { version = "0.26", features = ["generate-import-lib", "num-bigint", "py-clone"] }
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.37.2.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.41.1.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.37.2.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.41.1.bb
index b64f781481..611199890e 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.37.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.41.1.bb
@@ -14,7 +14,7 @@ SRC_URI += "file://0001-Upgrade-radium-to-1.0.patch;patchdir=${UNPACKDIR}/cargo_
 SRC_URI += "file://atomic.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/radium-1.1.0/"
 SRC_URI += "file://0001-musl-enable-getrandom-on-all-musl-platforms.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/libc-0.2.155/"
 SRC_URI += "file://0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch"
-SRC_URI[sha256sum] = "78fb2a749123408fedaf540a22ca6bf0b5ec1f522a14fc00e27ede33d8ac088c"
+SRC_URI[sha256sum] = "1ad375859a6d8c356b7704ec0f547a58e82ee80bb41baa811ad710e124bc8f2f"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
-- 
2.47.3


