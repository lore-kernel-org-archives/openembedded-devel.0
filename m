Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61EAC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 03:42:56 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.17.1743565371876130332
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 20:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q6gw8zWk;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3035858c687so8678776a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 20:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743565371; x=1744170171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLtSSUdSnUidtzSUNJcp2yoGtk87aezu1GszDPga350=;
        b=Q6gw8zWk3Bw3fnuZv1Esjsax1hUFpkY8XP3d9g+4jM4JTKHKjRJNhQrTwKsAaVzQuT
         /FnYsdkTBarJMstpYIeHdNFcfpEPIbmDelP8QCA2xcud4jBrrubEfheXRR6tvwEFzmjF
         xFZj2it0UYbQL0nUkVNGU4JUaKMsAGXr1icJiwNGGDHrxebHJUSQOpMYiTkes5Whny6B
         H/j5I+S4m3M0oACvghIi556CzUy+w1KIRpTnaH9o76B9i7b8pPTt3/nI/GrDkDjZ8GmB
         rhwbJppqg6Dy8BenPROoruRNp08qzK9ONQbUgz5v5FJ2K+D07oGyEA/Cy8MY+XwwlVe5
         8hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743565371; x=1744170171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLtSSUdSnUidtzSUNJcp2yoGtk87aezu1GszDPga350=;
        b=u3SJeJUUVNksjCGYO/n6TRKSv2ECsKOut6+WDFi0AxEwNlWkd7eheGM/+mBwcgYeQF
         s21KaVGiQ2biV5f+4O1GA4SGmDLjSjAUHUdsDFuFsp6S9iBv8BASn+6MWiphhesIpAyC
         3azk9k29xBl3iw5uBVcYCnpjkwZG6Vqe6jCqWxOsQlHN/++vGtx+IGZSfRvFjXdiFjWR
         c2oXiVWybo/0z6mP8qTUnmqQi4fepdAf6RmC8Y08swQBcZs3QSCtymbVq3+18l7nU7D/
         HL4CikHWb6cKBczOvyxj7NTnh4VrYKXDjfxsN/kbaN35gRA3bns58GV4qO2SNVTcAMLB
         YhPQ==
X-Gm-Message-State: AOJu0YxfsqrFNgaHI2HbWSPcEtFmL5f7pSkJq0xkPnjj0/GJpXmGUTRd
	+VFcAbhE4nMnCRgZfOFIOD8vptNo735uK4rZoL+Lh9olBoPbbo0rpC/F4VPU
X-Gm-Gg: ASbGncu2aWP8NNcKagsRLbwP0bPK76iayu0fWN8Nv3JQeKuaZHksz0u2P/U9XO37iVh
	Fbqc4Ch6P460RHX/jVbj+3GObD7SW4cRIlE53bKdNjag23YM0LOcfDaIz/8sw/qYYP3MxqIvCXR
	H8arvnZcB0A2Ujq8KMtiqrufFapVC5J2m5ddoTWF6O5sI24jNIKnt2PIHCW1CFSR6MIJ9kx4m8p
	fiUqlJ9JuiO1K1WBDH3VZeNPf7VpiOi9TQ4Bg7GWwnKes99YAV64Tfo+T19BxQc89D4rytHOKS3
	Yw6XXI+7cG3ja3164XnmNNttRriEujmNgrac
X-Google-Smtp-Source: AGHT+IEtsUZ3Px4lOdmv1lZHH6Ajbg3yGDkNYjAU5/8SDwOFlZZ6BCT6s1DolGMMoQAFWoQ5yc/r5A==
X-Received: by 2002:a17:90b:1648:b0:2ff:62b7:dcc0 with SMTP id 98e67ed59e1d1-305320af245mr21298020a91.15.1743565370835;
        Tue, 01 Apr 2025 20:42:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a85b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f93417bsm423010a91.37.2025.04.01.20.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 20:42:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/6] python3-pydantic-core: Upgrade to 2.33.0 release
Date: Tue,  1 Apr 2025 20:42:43 -0700
Message-ID: <20250402034246.1488516-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402034246.1488516-1-raj.khem@gmail.com>
References: <20250402034246.1488516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 03:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116494

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pydantic-core-crates.inc   | 84 +++++++++----------
 ...7.2.bb => python3-pydantic-core_2.33.0.bb} |  2 +-
 2 files changed, 39 insertions(+), 47 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.27.2.bb => python3-pydantic-core_2.33.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index 2903562e1f..8c2a25dd7a 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -28,15 +28,15 @@ SRC_URI += " \
     crate://crates.io/icu_properties_data/1.5.0 \
     crate://crates.io/icu_provider/1.5.0 \
     crate://crates.io/icu_provider_macros/1.5.0 \
-    crate://crates.io/idna/0.5.0 \
-    crate://crates.io/idna/1.0.2 \
+    crate://crates.io/idna/1.0.3 \
+    crate://crates.io/idna_adapter/1.2.0 \
     crate://crates.io/indexmap/2.2.6 \
     crate://crates.io/indoc/2.0.5 \
     crate://crates.io/itoa/1.0.11 \
-    crate://crates.io/jiter/0.7.1 \
-    crate://crates.io/lexical-parse-float/0.8.5 \
-    crate://crates.io/lexical-parse-integer/0.8.6 \
-    crate://crates.io/lexical-util/0.8.5 \
+    crate://crates.io/jiter/0.9.0 \
+    crate://crates.io/lexical-parse-float/1.0.5 \
+    crate://crates.io/lexical-parse-integer/1.0.5 \
+    crate://crates.io/lexical-util/1.0.6 \
     crate://crates.io/libc/0.2.155 \
     crate://crates.io/litemap/0.7.3 \
     crate://crates.io/memchr/2.7.4 \
@@ -48,12 +48,12 @@ SRC_URI += " \
     crate://crates.io/percent-encoding/2.3.1 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.22.6 \
-    crate://crates.io/pyo3-build-config/0.22.6 \
-    crate://crates.io/pyo3-ffi/0.22.6 \
-    crate://crates.io/pyo3-macros/0.22.6 \
-    crate://crates.io/pyo3-macros-backend/0.22.6 \
-    crate://crates.io/python3-dll-a/0.2.10 \
+    crate://crates.io/pyo3/0.24.0 \
+    crate://crates.io/pyo3-build-config/0.24.0 \
+    crate://crates.io/pyo3-ffi/0.24.0 \
+    crate://crates.io/pyo3-macros/0.24.0 \
+    crate://crates.io/pyo3-macros-backend/0.24.0 \
+    crate://crates.io/python3-dll-a/0.2.13 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/radium/0.7.0 \
     crate://crates.io/regex/1.11.1 \
@@ -61,10 +61,10 @@ SRC_URI += " \
     crate://crates.io/regex-syntax/0.8.5 \
     crate://crates.io/rustversion/1.0.17 \
     crate://crates.io/ryu/1.0.18 \
-    crate://crates.io/serde/1.0.214 \
-    crate://crates.io/serde_derive/1.0.214 \
-    crate://crates.io/serde_json/1.0.132 \
-    crate://crates.io/smallvec/1.13.2 \
+    crate://crates.io/serde/1.0.218 \
+    crate://crates.io/serde_derive/1.0.218 \
+    crate://crates.io/serde_json/1.0.138 \
+    crate://crates.io/smallvec/1.14.0 \
     crate://crates.io/speedate/0.15.0 \
     crate://crates.io/stable_deref_trait/1.2.0 \
     crate://crates.io/static_assertions/1.1.0 \
@@ -73,18 +73,14 @@ SRC_URI += " \
     crate://crates.io/syn/2.0.82 \
     crate://crates.io/synstructure/0.13.1 \
     crate://crates.io/tap/1.0.1 \
-    crate://crates.io/target-lexicon/0.12.14 \
+    crate://crates.io/target-lexicon/0.13.2 \
     crate://crates.io/tinystr/0.7.6 \
-    crate://crates.io/tinyvec/1.6.1 \
-    crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/unicode-bidi/0.3.15 \
     crate://crates.io/unicode-ident/1.0.12 \
-    crate://crates.io/unicode-normalization/0.1.23 \
     crate://crates.io/unindent/0.2.3 \
-    crate://crates.io/url/2.5.2 \
+    crate://crates.io/url/2.5.4 \
     crate://crates.io/utf16_iter/1.0.5 \
     crate://crates.io/utf8_iter/1.0.4 \
-    crate://crates.io/uuid/1.11.0 \
+    crate://crates.io/uuid/1.15.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/write16/1.0.0 \
@@ -126,15 +122,15 @@ SRC_URI[icu_properties-1.5.1.sha256sum] = "93d6020766cfc6302c15dbbc9c8778c37e62c
 SRC_URI[icu_properties_data-1.5.0.sha256sum] = "67a8effbc3dd3e4ba1afa8ad918d5684b8868b3b26500753effea8d2eed19569"
 SRC_URI[icu_provider-1.5.0.sha256sum] = "6ed421c8a8ef78d3e2dbc98a973be2f3770cb42b606e3ab18d6237c4dfde68d9"
 SRC_URI[icu_provider_macros-1.5.0.sha256sum] = "1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6"
-SRC_URI[idna-0.5.0.sha256sum] = "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6"
-SRC_URI[idna-1.0.2.sha256sum] = "bd69211b9b519e98303c015e21a007e293db403b6c85b9b124e133d25e242cdd"
+SRC_URI[idna-1.0.3.sha256sum] = "686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea968a7e"
+SRC_URI[idna_adapter-1.2.0.sha256sum] = "daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71"
 SRC_URI[indexmap-2.2.6.sha256sum] = "168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
 SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
-SRC_URI[jiter-0.7.1.sha256sum] = "07f69a121b68af57bc10f151f3f67444a64d1d3a0eb48b042801ea917a38dd25"
-SRC_URI[lexical-parse-float-0.8.5.sha256sum] = "683b3a5ebd0130b8fb52ba0bdc718cc56815b6a097e28ae5a6997d0ad17dc05f"
-SRC_URI[lexical-parse-integer-0.8.6.sha256sum] = "6d0994485ed0c312f6d965766754ea177d07f9c00c9b82a5ee62ed5b47945ee9"
-SRC_URI[lexical-util-0.8.5.sha256sum] = "5255b9ff16ff898710eb9eb63cb39248ea8a5bb036bea8085b1a767ff6c4e3fc"
+SRC_URI[jiter-0.9.0.sha256sum] = "c024ccb0ed468a474efa325edea34d4198fb601d290c4d1bc24fe31ed11902fc"
+SRC_URI[lexical-parse-float-1.0.5.sha256sum] = "de6f9cb01fb0b08060209a057c048fcbab8717b4c1ecd2eac66ebfe39a65b0f2"
+SRC_URI[lexical-parse-integer-1.0.5.sha256sum] = "72207aae22fc0a121ba7b6d479e42cbfea549af1479c3f3a4f12c70dd66df12e"
+SRC_URI[lexical-util-1.0.6.sha256sum] = "5a82e24bf537fd24c177ffbbdc6ebcc8d54732c35b50a3f28cc3f4e4c949a0b3"
 SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
 SRC_URI[litemap-0.7.3.sha256sum] = "643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e1e71bc420f4688a3a704"
 SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
@@ -146,12 +142,12 @@ SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa
 SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.22.6.sha256sum] = "f402062616ab18202ae8319da13fa4279883a2b8a9d9f83f20dbade813ce1884"
-SRC_URI[pyo3-build-config-0.22.6.sha256sum] = "b14b5775b5ff446dd1056212d778012cbe8a0fbffd368029fd9e25b514479c38"
-SRC_URI[pyo3-ffi-0.22.6.sha256sum] = "9ab5bcf04a2cdcbb50c7d6105de943f543f9ed92af55818fd17b660390fc8636"
-SRC_URI[pyo3-macros-0.22.6.sha256sum] = "0fd24d897903a9e6d80b968368a34e1525aeb719d568dba8b3d4bfa5dc67d453"
-SRC_URI[pyo3-macros-backend-0.22.6.sha256sum] = "36c011a03ba1e50152b4b394b479826cad97e7a21eb52df179cd91ac411cbfbe"
-SRC_URI[python3-dll-a-0.2.10.sha256sum] = "bd0b78171a90d808b319acfad166c4790d9e9759bbc14ac8273fe133673dd41b"
+SRC_URI[pyo3-0.24.0.sha256sum] = "7f1c6c3591120564d64db2261bec5f910ae454f01def849b9c22835a84695e86"
+SRC_URI[pyo3-build-config-0.24.0.sha256sum] = "e9b6c2b34cf71427ea37c7001aefbaeb85886a074795e35f161f5aecc7620a7a"
+SRC_URI[pyo3-ffi-0.24.0.sha256sum] = "5507651906a46432cdda02cd02dd0319f6064f1374c9147c45b978621d2c3a9c"
+SRC_URI[pyo3-macros-0.24.0.sha256sum] = "b0d394b5b4fd8d97d48336bb0dd2aebabad39f1d294edd6bcd2cccf2eefe6f42"
+SRC_URI[pyo3-macros-backend-0.24.0.sha256sum] = "fd72da09cfa943b1080f621f024d2ef7e2773df7badd51aa30a2be1f8caa7c8e"
+SRC_URI[python3-dll-a-0.2.13.sha256sum] = "49fe4227a288cf9493942ad0220ea3f185f4d1f2a14f197f7344d6d02f4ed4ed"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
 SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
@@ -159,10 +155,10 @@ SRC_URI[regex-automata-0.4.8.sha256sum] = "368758f23274712b504848e9d5a6f010445cc
 SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
 SRC_URI[rustversion-1.0.17.sha256sum] = "955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6"
 SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
-SRC_URI[serde-1.0.214.sha256sum] = "f55c3193aca71c12ad7890f1785d2b73e1b9f63a0bbc353c08ef26fe03fc56b5"
-SRC_URI[serde_derive-1.0.214.sha256sum] = "de523f781f095e28fa605cdce0f8307e451cc0fd14e2eb4cd2e98a355b147766"
-SRC_URI[serde_json-1.0.132.sha256sum] = "d726bfaff4b320266d395898905d0eba0345aae23b54aee3a737e260fd46db03"
-SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
+SRC_URI[serde-1.0.218.sha256sum] = "e8dfc9d19bdbf6d17e22319da49161d5d0108e4188e8b680aef6299eed22df60"
+SRC_URI[serde_derive-1.0.218.sha256sum] = "f09503e191f4e797cb8aac08e9a4a4695c5edf6a2e70e376d961ddd5c969f82b"
+SRC_URI[serde_json-1.0.138.sha256sum] = "d434192e7da787e94a6ea7e9670b26a036d0ca41e0b7efb2676dd32bae872949"
+SRC_URI[smallvec-1.14.0.sha256sum] = "7fcf8323ef1faaee30a44a340193b1ac6814fd9b7b4e88e9d4519a3e4abe1cfd"
 SRC_URI[speedate-0.15.0.sha256sum] = "9a5e7adf4e07e7de39a64d77962ca14a09165e592d42d0c9f9acadb679f4f937"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
@@ -171,18 +167,14 @@ SRC_URI[strum_macros-0.26.4.sha256sum] = "4c6bee85a5a24955dc440386795aa378cd9cf8
 SRC_URI[syn-2.0.82.sha256sum] = "83540f837a8afc019423a8edb95b52a8effe46957ee402287f4292fae35be021"
 SRC_URI[synstructure-0.13.1.sha256sum] = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
-SRC_URI[target-lexicon-0.12.14.sha256sum] = "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f"
+SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
 SRC_URI[tinystr-0.7.6.sha256sum] = "9117f5d4db391c1cf6927e7bea3db74b9a1c1add8f7eda9ffd5364f40f57b82f"
-SRC_URI[tinyvec-1.6.1.sha256sum] = "c55115c6fbe2d2bef26eb09ad74bde02d8255476fc0c7b515ef09fbb35742d82"
-SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[unicode-bidi-0.3.15.sha256sum] = "08f95100a766bf4f8f28f90d77e0a5461bbdb219042e7679bebe79004fed8d75"
 SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
-SRC_URI[unicode-normalization-0.1.23.sha256sum] = "a56d1686db2308d901306f92a263857ef59ea39678a5458e7cb17f01415101f5"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
-SRC_URI[url-2.5.2.sha256sum] = "22784dbdf76fdde8af1aeda5622b546b422b6fc585325248a2bf9f5e41e94d6c"
+SRC_URI[url-2.5.4.sha256sum] = "32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7fda60"
 SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
-SRC_URI[uuid-1.11.0.sha256sum] = "f8c5f0a0af699448548ad1a2fbf920fb4bee257eae39953ba95cb84891a0446a"
+SRC_URI[uuid-1.15.1.sha256sum] = "e0f540e3240398cce6128b64ba83fdbdd86129c16a3aa1a3a252efd66eb3d587"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.33.0.bb
index 7b84a3a6f7..11bcbd259c 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 
 require ${BPN}-crates.inc
 
-SRC_URI[sha256sum] = "eb026e5a4c1fee05726072337ff51d1efb6f59090b7da90d30ea58625b1ffb39"
+SRC_URI[sha256sum] = "40eb8af662ba409c3cbf4a8150ad32ae73514cd7cb1f1a2113af39763dd616b3"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 

