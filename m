Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBE4D3F29F
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 21:27:14 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.32770.1729286829446245098
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 14:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hbTa1OpE;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539d9fffea1so2696579e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 14:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729286827; x=1729891627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rDaicXuu/0J5GJiGJZscMte0AQ2ZJ75hhaxWF96IUQk=;
        b=hbTa1OpEdXEKBd6ZE+W2Jp9YCRN6mBeHXdG2GflWANtUMGE3r/1+GGeFziBwBUo+wO
         V7d9V/fwX4Y6fZtdibIf0dqe/5ThUsFNDEoFtj/u5S1whQxSH8yWG3QRp3YY/Lt19V4G
         +yM+zQcaBd147XorhxJ7btsmYj7IvVymB4W2nq32VX1s32Kxo4E4AYPbnIAauVP8U+I2
         RXdymu6mTHT1HUQ1DHwEebN0jUZL94ivuHAzT8A1RKz1cUpyBZGHLXzhSKeI5uKnrcOz
         XiQVsF10rXtM/bEVi0nQHU5hqdFSzg8wN7Qb4nwGcTyRIbXlKLM3Fi3radVe7jCsvYzU
         Vp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729286827; x=1729891627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDaicXuu/0J5GJiGJZscMte0AQ2ZJ75hhaxWF96IUQk=;
        b=Ua+MQITJUDM8vWMwLYqK3lbRGrfS3IrJ27dLszSGcogFDeTf/ZQrc9XsYlcP2dqaNh
         hzI4T1AugPdHNGSD4GZizVFiO6eiO/rlfrglvhJB2FxXKFc03/JMhfDKQ0wPMWQDnb2F
         vT+8sSyCUA0i2exSMD2s+ZIkIkjPRQjR6iUYiBwqNnQcCLNVQkN1G3duaOCFlo1pP7G3
         Ce9shC6XxOe66oiWUjSgi/VXx4okpx8+HngVAYFveqC12QLIxjg+yhmS94OIKqcuEjgI
         HU4JBe0HDYguVheLUM7/6JQbU6QsKClpjXf2v5EINMOhOBCckrKYQDK90EbNaWp4jseF
         gbHA==
X-Gm-Message-State: AOJu0YxQKTohg5a3m48RmGc0F6y2ELtOyt7K06Fc0EVB4k1YdV6D1QfY
	4dx4ep+fY6p2T5jrL/VlyYy1rRwiF8gmNSD1E6MnBLRyW5k+6qIPjefp4jb/6Atq6M9Pu3UOQbF
	2yFc=
X-Google-Smtp-Source: AGHT+IGt1IJ/kSjRgvn9gc38tPZqxFD5oPdXlGuvSsfbraA6cqWNHI1Q2HsHn/mwqqP6UjEfhRjuHw==
X-Received: by 2002:a05:6512:2396:b0:536:54df:bffa with SMTP id 2adb3069b0e04-53a1544c1e8mr2744212e87.45.1729286826901;
        Fri, 18 Oct 2024 14:27:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151b90c0sm325607e87.73.2024.10.18.14.27.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 14:27:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] deqp-runner: update 0.20.0 -> 0.20.2
Date: Sat, 19 Oct 2024 00:27:04 +0300
Message-Id: <20241018212704.1603498-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 21:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113056

Update deqp-runner to the fresh 0.20.2 release.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../deqp-runner/deqp-runner-crates.inc        | 24 +++++++++----------
 .../0001-deqp-runner-drop-zstd-support.patch  |  6 ++---
 ...runner_0.20.0.bb => deqp-runner_0.20.2.bb} |  4 ++--
 3 files changed, 17 insertions(+), 17 deletions(-)
 rename meta-oe/recipes-graphics/deqp-runner/{deqp-runner_0.20.0.bb => deqp-runner_0.20.2.bb} (73%)

diff --git a/meta-oe/recipes-graphics/deqp-runner/deqp-runner-crates.inc b/meta-oe/recipes-graphics/deqp-runner/deqp-runner-crates.inc
index 09a3f675a6f4..13bf640479b4 100644
--- a/meta-oe/recipes-graphics/deqp-runner/deqp-runner-crates.inc
+++ b/meta-oe/recipes-graphics/deqp-runner/deqp-runner-crates.inc
@@ -65,8 +65,8 @@ SRC_URI += " \
     crate://crates.io/ppv-lite86/0.2.17 \
     crate://crates.io/proc-macro-error/1.0.4 \
     crate://crates.io/proc-macro-error-attr/1.0.4 \
-    crate://crates.io/proc-macro2/1.0.66 \
-    crate://crates.io/quote/1.0.33 \
+    crate://crates.io/proc-macro2/1.0.85 \
+    crate://crates.io/quote/1.0.36 \
     crate://crates.io/rand/0.7.3 \
     crate://crates.io/rand_chacha/0.2.2 \
     crate://crates.io/rand_core/0.5.1 \
@@ -82,18 +82,18 @@ SRC_URI += " \
     crate://crates.io/ryu/1.0.15 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/scopeguard/1.2.0 \
-    crate://crates.io/serde/1.0.188 \
+    crate://crates.io/serde/1.0.203 \
     crate://crates.io/serde-tuple-vec-map/1.0.1 \
     crate://crates.io/serde_cbor/0.11.2 \
-    crate://crates.io/serde_derive/1.0.188 \
-    crate://crates.io/serde_json/1.0.106 \
+    crate://crates.io/serde_derive/1.0.203 \
+    crate://crates.io/serde_json/1.0.117 \
     crate://crates.io/serde_yaml/0.9.21 \
     crate://crates.io/stderrlog/0.5.4 \
     crate://crates.io/strsim/0.8.0 \
     crate://crates.io/structopt/0.3.26 \
     crate://crates.io/structopt-derive/0.4.18 \
     crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.32 \
+    crate://crates.io/syn/2.0.66 \
     crate://crates.io/tempfile/3.8.0 \
     crate://crates.io/termcolor/1.1.3 \
     crate://crates.io/textwrap/0.11.0 \
@@ -198,8 +198,8 @@ SRC_URI[plotters-svg-0.3.5.sha256sum] = "38f6d39893cca0701371e3c27294f09797214b8
 SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
 SRC_URI[proc-macro-error-1.0.4.sha256sum] = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
 SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
-SRC_URI[proc-macro2-1.0.66.sha256sum] = "18fb31db3f9bddb2ea821cde30a9f70117e3f119938b5ee630b7403aa6e2ead9"
-SRC_URI[quote-1.0.33.sha256sum] = "5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae"
+SRC_URI[proc-macro2-1.0.85.sha256sum] = "22244ce15aa966053a896d1accb3a6e68469b97c7f33f284b99f0d576879fc23"
+SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[rand-0.7.3.sha256sum] = "6a6b1679d49b24bbfe0c803429aa1874472f50d9b363131f0e89fc356b544d03"
 SRC_URI[rand_chacha-0.2.2.sha256sum] = "f4c8ed856279c9737206bf725bf36935d8666ead7aa69b52be55af369d193402"
 SRC_URI[rand_core-0.5.1.sha256sum] = "90bde5296fc891b0cef12a6d03ddccc162ce7b2aff54160af9338f8d40df6d19"
@@ -215,18 +215,18 @@ SRC_URI[rustix-0.38.13.sha256sum] = "d7db8590df6dfcd144d22afd1b83b36c21a18d7cbc1
 SRC_URI[ryu-1.0.15.sha256sum] = "1ad4cc8da4ef723ed60bced201181d83791ad433213d8c24efffda1eec85d741"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
-SRC_URI[serde-1.0.188.sha256sum] = "cf9e0fcba69a370eed61bcf2b728575f726b50b55cba78064753d708ddc7549e"
+SRC_URI[serde-1.0.203.sha256sum] = "7253ab4de971e72fb7be983802300c30b5a7f0c2e56fab8abfc6a214307c0094"
 SRC_URI[serde-tuple-vec-map-1.0.1.sha256sum] = "a04d0ebe0de77d7d445bb729a895dcb0a288854b267ca85f030ce51cdc578c82"
 SRC_URI[serde_cbor-0.11.2.sha256sum] = "2bef2ebfde456fb76bbcf9f59315333decc4fda0b2b44b420243c11e0f5ec1f5"
-SRC_URI[serde_derive-1.0.188.sha256sum] = "4eca7ac642d82aa35b60049a6eccb4be6be75e599bd2e9adb5f875a737654af2"
-SRC_URI[serde_json-1.0.106.sha256sum] = "2cc66a619ed80bf7a0f6b17dd063a84b88f6dea1813737cf469aef1d081142c2"
+SRC_URI[serde_derive-1.0.203.sha256sum] = "500cbc0ebeb6f46627f50f3f5811ccf6bf00643be300b4c3eabc0ef55dc5b5ba"
+SRC_URI[serde_json-1.0.117.sha256sum] = "455182ea6142b14f93f4bc5320a2b31c1f266b66a4a5c858b013302a5d8cbfc3"
 SRC_URI[serde_yaml-0.9.21.sha256sum] = "d9d684e3ec7de3bf5466b32bd75303ac16f0736426e5a4e0d6e489559ce1249c"
 SRC_URI[stderrlog-0.5.4.sha256sum] = "69a26bbf6de627d389164afa9783739b56746c6c72c4ed16539f4ff54170327b"
 SRC_URI[strsim-0.8.0.sha256sum] = "8ea5119cdb4c55b55d432abb513a0429384878c15dde60cc77b1c99de1a95a6a"
 SRC_URI[structopt-0.3.26.sha256sum] = "0c6b5c64445ba8094a6ab0c3cd2ad323e07171012d9c98b0b15651daf1787a10"
 SRC_URI[structopt-derive-0.4.18.sha256sum] = "dcb5ae327f9cc13b68763b5749770cb9e048a99bd9dfdfa58d0cf05d5f64afe0"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.32.sha256sum] = "239814284fd6f1a4ffe4ca893952cdd93c224b6a1571c9a9eadd670295c0c9e2"
+SRC_URI[syn-2.0.66.sha256sum] = "c42f3f41a2de00b01c0aaad383c5a45241efc8b2d1eda5661812fda5f3cdcff5"
 SRC_URI[tempfile-3.8.0.sha256sum] = "cb94d2f3cc536af71caac6b6fcebf65860b347e7ce0cc9ebe8f70d3e521054ef"
 SRC_URI[termcolor-1.1.3.sha256sum] = "bab24d30b911b2376f3a13cc2cd443142f0c81dda04c118693e35b3835757755"
 SRC_URI[textwrap-0.11.0.sha256sum] = "d326610f408c7a4eb6f51c37c330e496b08506c9457c9d34287ecc38809fb060"
diff --git a/meta-oe/recipes-graphics/deqp-runner/deqp-runner/0001-deqp-runner-drop-zstd-support.patch b/meta-oe/recipes-graphics/deqp-runner/deqp-runner/0001-deqp-runner-drop-zstd-support.patch
index e29b78fde353..1e2cdacf4cd0 100644
--- a/meta-oe/recipes-graphics/deqp-runner/deqp-runner/0001-deqp-runner-drop-zstd-support.patch
+++ b/meta-oe/recipes-graphics/deqp-runner/deqp-runner/0001-deqp-runner-drop-zstd-support.patch
@@ -89,9 +89,9 @@ index 8443695e2bd5..50924576a8e3 100644
 -
 -[[package]]
 -name = "zstd-sys"
--version = "2.0.11+zstd.1.5.6"
+-version = "2.0.10+zstd.1.5.6"
 -source = "registry+https://github.com/rust-lang/crates.io-index"
--checksum = "75652c55c0b6f3e6f12eb786fe1bc960396bf05a1eb3bf1f3691c3610ac2e6d4"
+-checksum = "c253a4914af5bafc8fa8c86ee400827e83cf6ec01195ec1f1ed8441bf00d65aa"
 -dependencies = [
 - "cc",
 - "pkg-config",
@@ -116,7 +116,7 @@ index e7095267f1cd..ff7bc4f5d025 100644
 +++ b/src/lib.rs
 @@ -63,7 +63,6 @@ use rayon::prelude::*;
  use regex::RegexSet;
- use serde::Deserialize;
+ use serde::{Deserialize, Serialize};
  use std::collections::HashMap;
 -use std::ffi::OsStr;
  use std::fs::File;
diff --git a/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.0.bb b/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.2.bb
similarity index 73%
rename from meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.0.bb
rename to meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.2.bb
index 04de074d24fb..cf1cafa1227c 100644
--- a/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.0.bb
+++ b/meta-oe/recipes-graphics/deqp-runner/deqp-runner_0.20.2.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = " \
 inherit cargo cargo-update-recipe-crates
 
 SRC_URI += " \
-    crate://crates.io/deqp-runner/0.20.0 \
+    crate://crates.io/deqp-runner/${PV} \
     file://0001-deqp-runner-drop-zstd-support.patch \
 "
 
-SRC_URI[deqp-runner-0.20.0.sha256sum] = "a3f4fab1179a01cbbdbe4b93e0a040f74de7b9086498d91976d93844a31439dd"
+SRC_URI[deqp-runner-0.20.2.sha256sum] = "600ea527945ea2d0c5d2987d6adb4d2944731ea95906de2c94eb419148cc398b"
 
 require deqp-runner-crates.inc
-- 
2.39.5


