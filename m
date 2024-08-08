Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F79C52D7D
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 16:38:59 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.64587.1723135133335750802
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 09:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=udViST4Q;
 spf=pass (domain: konsulko.com, ip: 209.85.215.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7aa7703cf08so890224a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 09:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723135132; x=1723739932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDEzoKzlFhzgyBi86z7TNSBSmtmB6hxFeCBtA9ulhtk=;
        b=udViST4QgbsjakcPGCjizNs3oCzyIedktJKrKK95xXXZoo/Rpmn91r5yAsv2Rl/fp7
         8MRKTHFSx/3lnPXGISXXXeOVrsOH17EUI7BKL2FYa6GKYpAbWeBqKBFP4pK+cLMpcw67
         QdpfdkRFRpqh+rvVKTo6YPS+ek9VSJhliiPGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723135132; x=1723739932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDEzoKzlFhzgyBi86z7TNSBSmtmB6hxFeCBtA9ulhtk=;
        b=gBAJDoSoiUocMx4pv1md12Yq0FYvXVAEOlHvNI4s87Vf3ZhOV7Smaza9h5EKRZDlQ/
         aDXfAwzznud8HCb2pL7fx4l/OTFlppxd/k9D7sBHYigKhnPZZNTlNyU8WqnBnK3vZawK
         FjVWAPnc++smIoyYZVW9iO5keLipcKzW5EsLKV6Wkauz+l5PRYFvvQrcFr1jramc7iV/
         /sneVpT4l8uk7MK0ukO6UvrrfyK01jSAPn6ynbSLxh1XlNtVhTrMOF+U5dATqEaAQZDe
         FiB+AY0YlmpbkJddLLKqJLouLxk2JAmT/WgiSpLeJ/JuAOtNSnNG/PU1LLV6uq0lJvVr
         F/aQ==
X-Gm-Message-State: AOJu0Yx9s2xrlACN19QpO3G9uPHFY0+t7E9RZBzY1TwCtW6Amu1woT1I
	b1rI7ICtBjEqhJeApwvaE7aBxaWfz9/4bTJjOeO8Yng/h+PebZrO65xZFiQM4cAfnlJ4QkzRlO6
	Xz60=
X-Google-Smtp-Source: AGHT+IG5XR98gzZ7AjaRinB/J/VTceJFVcfdM/hjnIhpKQoeZOCLCQJ3fUL7n7eySqC/DfMUPJ6YjQ==
X-Received: by 2002:a17:90b:3803:b0:2c9:66d3:4663 with SMTP id 98e67ed59e1d1-2d1c347b7d9mr2773913a91.43.1723135131778;
        Thu, 08 Aug 2024 09:38:51 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3a9cc5asm3675640a91.10.2024.08.08.09.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 09:38:51 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pydantic-core: upgrade 2.18.4 -> 2.21.0
Date: Thu,  8 Aug 2024 09:38:40 -0700
Message-ID: <c7ecb39074722a44c58b814dc38d4c4815ebd399.1723134758.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723134758.git.tim.orling@konsulko.com>
References: <cover.1723134758.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 16:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111672

From: Tim Orling <tim.orling@konsulko.com>

* Refresh -crates.inc
* Drop rust 1.76 to 1.75 patch, upstream reverted [1]
* Add ptest RDEPENDS [2]:
  - python3-dateutil
  - python3-tzdata
  - python3-zoneinfo
* Add python3-misc to ptest RDEPENDS as we need Lib/timeit.py

Full commit log:
https://github.com/pydantic/pydantic-core/compare/v2.18.4...v2.21.0

[1] https://github.com/pydantic/pydantic-core/commit/ebef5bdf92707f5e1739931150893ae6c7ccc531
[2] https://github.com/pydantic/pydantic-core/blob/v2.21.0/tests/requirements.txt

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pydantic-core-crates.inc   | 280 ++++++++++--------
 ...sion-from-1.76-to-1.75-in-Cargo.toml.patch |  29 --
 ...8.4.bb => python3-pydantic-core_2.21.0.bb} |  15 +-
 3 files changed, 162 insertions(+), 162 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.patch
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.18.4.bb => python3-pydantic-core_2.21.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index c6b30bc677..531632f32b 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -2,173 +2,197 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/ahash/0.8.10 \
-    crate://crates.io/aho-corasick/1.0.2 \
-    crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/base64/0.21.7 \
-    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/ahash/0.8.11 \
+    crate://crates.io/aho-corasick/1.1.3 \
+    crate://crates.io/autocfg/1.3.0 \
+    crate://crates.io/base64/0.22.1 \
     crate://crates.io/bitvec/1.0.1 \
-    crate://crates.io/cc/1.0.79 \
+    crate://crates.io/cc/1.0.101 \
     crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/enum_dispatch/0.3.13 \
     crate://crates.io/equivalent/1.0.1 \
     crate://crates.io/form_urlencoded/1.2.1 \
     crate://crates.io/funty/2.0.0 \
-    crate://crates.io/getrandom/0.2.10 \
-    crate://crates.io/hashbrown/0.14.3 \
-    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/getrandom/0.2.15 \
+    crate://crates.io/hashbrown/0.14.5 \
+    crate://crates.io/heck/0.5.0 \
+    crate://crates.io/hex/0.4.3 \
+    crate://crates.io/icu_collections/1.5.0 \
+    crate://crates.io/icu_locid/1.5.0 \
+    crate://crates.io/icu_locid_transform/1.5.0 \
+    crate://crates.io/icu_locid_transform_data/1.5.0 \
+    crate://crates.io/icu_normalizer/1.5.0 \
+    crate://crates.io/icu_normalizer_data/1.5.0 \
+    crate://crates.io/icu_properties/1.5.1 \
+    crate://crates.io/icu_properties_data/1.5.0 \
+    crate://crates.io/icu_provider/1.5.0 \
+    crate://crates.io/icu_provider_macros/1.5.0 \
     crate://crates.io/idna/0.5.0 \
-    crate://crates.io/indexmap/2.2.2 \
-    crate://crates.io/indoc/2.0.4 \
-    crate://crates.io/itoa/1.0.8 \
-    crate://crates.io/jiter/0.4.1 \
+    crate://crates.io/idna/1.0.1 \
+    crate://crates.io/indexmap/2.2.6 \
+    crate://crates.io/indoc/2.0.5 \
+    crate://crates.io/itoa/1.0.11 \
+    crate://crates.io/jiter/0.5.0 \
     crate://crates.io/lexical-parse-float/0.8.5 \
     crate://crates.io/lexical-parse-integer/0.8.6 \
     crate://crates.io/lexical-util/0.8.5 \
-    crate://crates.io/libc/0.2.147 \
-    crate://crates.io/lock_api/0.4.10 \
-    crate://crates.io/memchr/2.6.3 \
-    crate://crates.io/memoffset/0.9.0 \
-    crate://crates.io/num-bigint/0.4.4 \
-    crate://crates.io/num-integer/0.1.45 \
-    crate://crates.io/num-traits/0.2.16 \
-    crate://crates.io/once_cell/1.18.0 \
-    crate://crates.io/parking_lot/0.12.1 \
-    crate://crates.io/parking_lot_core/0.9.8 \
+    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/litemap/0.7.3 \
+    crate://crates.io/memchr/2.7.4 \
+    crate://crates.io/memoffset/0.9.1 \
+    crate://crates.io/num-bigint/0.4.6 \
+    crate://crates.io/num-integer/0.1.46 \
+    crate://crates.io/num-traits/0.2.19 \
+    crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/percent-encoding/2.3.1 \
     crate://crates.io/portable-atomic/1.6.0 \
-    crate://crates.io/proc-macro2/1.0.76 \
-    crate://crates.io/pyo3/0.21.2 \
-    crate://crates.io/pyo3-build-config/0.21.2 \
-    crate://crates.io/pyo3-ffi/0.21.2 \
-    crate://crates.io/pyo3-macros/0.21.2 \
-    crate://crates.io/pyo3-macros-backend/0.21.2 \
-    crate://crates.io/python3-dll-a/0.2.9 \
-    crate://crates.io/quote/1.0.35 \
+    crate://crates.io/proc-macro2/1.0.86 \
+    crate://crates.io/pyo3/0.22.2 \
+    crate://crates.io/pyo3-build-config/0.22.2 \
+    crate://crates.io/pyo3-ffi/0.22.2 \
+    crate://crates.io/pyo3-macros/0.22.2 \
+    crate://crates.io/pyo3-macros-backend/0.22.2 \
+    crate://crates.io/python3-dll-a/0.2.10 \
+    crate://crates.io/quote/1.0.36 \
     crate://crates.io/radium/0.7.0 \
-    crate://crates.io/redox_syscall/0.3.5 \
-    crate://crates.io/regex/1.10.4 \
-    crate://crates.io/regex-automata/0.4.5 \
-    crate://crates.io/regex-syntax/0.8.2 \
-    crate://crates.io/rustversion/1.0.13 \
-    crate://crates.io/ryu/1.0.14 \
-    crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/serde/1.0.203 \
-    crate://crates.io/serde_derive/1.0.203 \
-    crate://crates.io/serde_json/1.0.116 \
+    crate://crates.io/regex/1.10.5 \
+    crate://crates.io/regex-automata/0.4.7 \
+    crate://crates.io/regex-syntax/0.8.4 \
+    crate://crates.io/rustversion/1.0.17 \
+    crate://crates.io/ryu/1.0.18 \
+    crate://crates.io/serde/1.0.204 \
+    crate://crates.io/serde_derive/1.0.204 \
+    crate://crates.io/serde_json/1.0.121 \
     crate://crates.io/smallvec/1.13.2 \
-    crate://crates.io/speedate/0.14.0 \
+    crate://crates.io/speedate/0.14.4 \
+    crate://crates.io/stable_deref_trait/1.2.0 \
     crate://crates.io/static_assertions/1.1.0 \
-    crate://crates.io/strum/0.25.0 \
-    crate://crates.io/strum_macros/0.25.3 \
-    crate://crates.io/strum_macros/0.26.1 \
-    crate://crates.io/syn/2.0.48 \
+    crate://crates.io/strum/0.26.3 \
+    crate://crates.io/strum_macros/0.26.4 \
+    crate://crates.io/syn/2.0.68 \
+    crate://crates.io/synstructure/0.13.1 \
     crate://crates.io/tap/1.0.1 \
-    crate://crates.io/target-lexicon/0.12.9 \
-    crate://crates.io/tinyvec/1.6.0 \
+    crate://crates.io/target-lexicon/0.12.14 \
+    crate://crates.io/tinystr/0.7.6 \
+    crate://crates.io/tinyvec/1.6.1 \
     crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/unicode-bidi/0.3.13 \
-    crate://crates.io/unicode-ident/1.0.10 \
-    crate://crates.io/unicode-normalization/0.1.22 \
+    crate://crates.io/unicode-bidi/0.3.15 \
+    crate://crates.io/unicode-ident/1.0.12 \
+    crate://crates.io/unicode-normalization/0.1.23 \
     crate://crates.io/unindent/0.2.3 \
-    crate://crates.io/url/2.5.0 \
-    crate://crates.io/uuid/1.8.0 \
-    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/url/2.5.2 \
+    crate://crates.io/utf16_iter/1.0.5 \
+    crate://crates.io/utf8_iter/1.0.4 \
+    crate://crates.io/uuid/1.9.1 \
+    crate://crates.io/version_check/0.9.5 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/windows-targets/0.48.1 \
-    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
-    crate://crates.io/windows_aarch64_msvc/0.48.0 \
-    crate://crates.io/windows_i686_gnu/0.48.0 \
-    crate://crates.io/windows_i686_msvc/0.48.0 \
-    crate://crates.io/windows_x86_64_gnu/0.48.0 \
-    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
-    crate://crates.io/windows_x86_64_msvc/0.48.0 \
+    crate://crates.io/write16/1.0.0 \
+    crate://crates.io/writeable/0.5.5 \
     crate://crates.io/wyz/0.5.1 \
-    crate://crates.io/zerocopy/0.7.32 \
-    crate://crates.io/zerocopy-derive/0.7.32 \
+    crate://crates.io/yoke/0.7.4 \
+    crate://crates.io/yoke-derive/0.7.4 \
+    crate://crates.io/zerocopy/0.7.34 \
+    crate://crates.io/zerocopy-derive/0.7.34 \
+    crate://crates.io/zerofrom/0.1.4 \
+    crate://crates.io/zerofrom-derive/0.1.4 \
+    crate://crates.io/zerovec/0.10.4 \
+    crate://crates.io/zerovec-derive/0.10.3 \
 "
 
-SRC_URI[ahash-0.8.10.sha256sum] = "8b79b82693f705137f8fb9b37871d99e4f9a7df12b917eed79c3d3954830a60b"
-SRC_URI[aho-corasick-1.0.2.sha256sum] = "43f6cb1bf222025340178f382c426f13757b2960e89779dfcb319c32542a5a41"
-SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
-SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[ahash-0.8.11.sha256sum] = "e89da841a80418a9b391ebaea17f5c112ffaaa96f621d2c285b5174da76b9011"
+SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
+SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
+SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[bitvec-1.0.1.sha256sum] = "1bc2832c24239b0141d5674bb9174f9d68a8b5b3f2753311927c172ca46f7e9c"
-SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
+SRC_URI[cc-1.0.101.sha256sum] = "ac367972e516d45567c7eafc73d24e1c193dcf200a8d94e9db7b3d38b349572d"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[enum_dispatch-0.3.13.sha256sum] = "aa18ce2bc66555b3218614519ac839ddb759a7d6720732f979ef8d13be147ecd"
 SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
 SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
 SRC_URI[funty-2.0.0.sha256sum] = "e6d5a32815ae3f33302d95fdcb2ce17862f8c65363dcfd29360480ba1001fc9c"
-SRC_URI[getrandom-0.2.10.sha256sum] = "be4136b2a15dd319360be1c07d9933517ccf0be8f16bf62a3bee4f0d618df427"
-SRC_URI[hashbrown-0.14.3.sha256sum] = "290f1a1d9242c78d09ce40a5e87e7554ee637af1351968159f4952f028f75604"
-SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
+SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
+SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
+SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
+SRC_URI[icu_collections-1.5.0.sha256sum] = "db2fa452206ebee18c4b5c2274dbf1de17008e874b4dc4f0aea9d01ca79e4526"
+SRC_URI[icu_locid-1.5.0.sha256sum] = "13acbb8371917fc971be86fc8057c41a64b521c184808a698c02acc242dbf637"
+SRC_URI[icu_locid_transform-1.5.0.sha256sum] = "01d11ac35de8e40fdeda00d9e1e9d92525f3f9d887cdd7aa81d727596788b54e"
+SRC_URI[icu_locid_transform_data-1.5.0.sha256sum] = "fdc8ff3388f852bede6b579ad4e978ab004f139284d7b28715f773507b946f6e"
+SRC_URI[icu_normalizer-1.5.0.sha256sum] = "19ce3e0da2ec68599d193c93d088142efd7f9c5d6fc9b803774855747dc6a84f"
+SRC_URI[icu_normalizer_data-1.5.0.sha256sum] = "f8cafbf7aa791e9b22bec55a167906f9e1215fd475cd22adfcf660e03e989516"
+SRC_URI[icu_properties-1.5.1.sha256sum] = "93d6020766cfc6302c15dbbc9c8778c37e62c14427cb7f6e601d849e092aeef5"
+SRC_URI[icu_properties_data-1.5.0.sha256sum] = "67a8effbc3dd3e4ba1afa8ad918d5684b8868b3b26500753effea8d2eed19569"
+SRC_URI[icu_provider-1.5.0.sha256sum] = "6ed421c8a8ef78d3e2dbc98a973be2f3770cb42b606e3ab18d6237c4dfde68d9"
+SRC_URI[icu_provider_macros-1.5.0.sha256sum] = "1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6"
 SRC_URI[idna-0.5.0.sha256sum] = "634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6"
-SRC_URI[indexmap-2.2.2.sha256sum] = "824b2ae422412366ba479e8111fd301f7b5faece8149317bb81925979a53f520"
-SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
-SRC_URI[itoa-1.0.8.sha256sum] = "62b02a5381cc465bd3041d84623d0fa3b66738b52b8e2fc3bab8ad63ab032f4a"
-SRC_URI[jiter-0.4.1.sha256sum] = "abbbbe1bad457e3cd5503af716aedc735e849505a0d2172c55a753ae1b127458"
+SRC_URI[idna-1.0.1.sha256sum] = "44a986806a1cc899952ba462bc1f28afbfd5850ab6cb030ccb20dd02cc527a24"
+SRC_URI[indexmap-2.2.6.sha256sum] = "168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26"
+SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
+SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
+SRC_URI[jiter-0.5.0.sha256sum] = "02e23549143ef50eddffd46ba8cd0229b0a4500aef7518cf2eb0f41c9a09d22b"
 SRC_URI[lexical-parse-float-0.8.5.sha256sum] = "683b3a5ebd0130b8fb52ba0bdc718cc56815b6a097e28ae5a6997d0ad17dc05f"
 SRC_URI[lexical-parse-integer-0.8.6.sha256sum] = "6d0994485ed0c312f6d965766754ea177d07f9c00c9b82a5ee62ed5b47945ee9"
 SRC_URI[lexical-util-0.8.5.sha256sum] = "5255b9ff16ff898710eb9eb63cb39248ea8a5bb036bea8085b1a767ff6c4e3fc"
-SRC_URI[libc-0.2.147.sha256sum] = "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
-SRC_URI[lock_api-0.4.10.sha256sum] = "c1cc9717a20b1bb222f333e6a92fd32f7d8a18ddc5a3191a11af45dcbf4dcd16"
-SRC_URI[memchr-2.6.3.sha256sum] = "8f232d6ef707e1956a43342693d2a31e72989554d58299d7a88738cc95b0d35c"
-SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
-SRC_URI[num-bigint-0.4.4.sha256sum] = "608e7659b5c3d7cba262d894801b9ec9d00de989e8a82bd4bef91d08da45cdc0"
-SRC_URI[num-integer-0.1.45.sha256sum] = "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
-SRC_URI[num-traits-0.2.16.sha256sum] = "f30b0abd723be7e2ffca1272140fac1a2f084c77ec3e123c192b66af1ee9e6c2"
-SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
-SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
-SRC_URI[parking_lot_core-0.9.8.sha256sum] = "93f00c865fe7cabf650081affecd3871070f26767e7b2070a3ffae14c654b447"
+SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[litemap-0.7.3.sha256sum] = "643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e1e71bc420f4688a3a704"
+SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
+SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
+SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
+SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
+SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
+SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
-SRC_URI[proc-macro2-1.0.76.sha256sum] = "95fc56cda0b5c3325f5fbbd7ff9fda9e02bb00bb3dac51252d2f1bfa1cb8cc8c"
-SRC_URI[pyo3-0.21.2.sha256sum] = "a5e00b96a521718e08e03b1a622f01c8a8deb50719335de3f60b3b3950f069d8"
-SRC_URI[pyo3-build-config-0.21.2.sha256sum] = "7883df5835fafdad87c0d888b266c8ec0f4c9ca48a5bed6bbb592e8dedee1b50"
-SRC_URI[pyo3-ffi-0.21.2.sha256sum] = "01be5843dc60b916ab4dad1dca6d20b9b4e6ddc8e15f50c47fe6d85f1fb97403"
-SRC_URI[pyo3-macros-0.21.2.sha256sum] = "77b34069fc0682e11b31dbd10321cbf94808394c56fd996796ce45217dfac53c"
-SRC_URI[pyo3-macros-backend-0.21.2.sha256sum] = "08260721f32db5e1a5beae69a55553f56b99bd0e1c3e6e0a5e8851a9d0f5a85c"
-SRC_URI[python3-dll-a-0.2.9.sha256sum] = "d5f07cd4412be8fa09a721d40007c483981bbe072cd6a21f2e83e04ec8f8343f"
-SRC_URI[quote-1.0.35.sha256sum] = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
+SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
+SRC_URI[pyo3-0.22.2.sha256sum] = "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
+SRC_URI[pyo3-build-config-0.22.2.sha256sum] = "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
+SRC_URI[pyo3-ffi-0.22.2.sha256sum] = "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
+SRC_URI[pyo3-macros-0.22.2.sha256sum] = "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
+SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] = "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
+SRC_URI[python3-dll-a-0.2.10.sha256sum] = "bd0b78171a90d808b319acfad166c4790d9e9759bbc14ac8273fe133673dd41b"
+SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
-SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
-SRC_URI[regex-1.10.4.sha256sum] = "c117dbdfde9c8308975b6a18d71f3f385c89461f7b3fb054288ecf2a2058ba4c"
-SRC_URI[regex-automata-0.4.5.sha256sum] = "5bb987efffd3c6d0d8f5f89510bb458559eab11e4f869acb20bf845e016259cd"
-SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
-SRC_URI[rustversion-1.0.13.sha256sum] = "dc31bd9b61a32c31f9650d18add92aa83a49ba979c143eefd27fe7177b05bd5f"
-SRC_URI[ryu-1.0.14.sha256sum] = "fe232bdf6be8c8de797b22184ee71118d63780ea42ac85b61d1baa6d3b782ae9"
-SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[serde-1.0.203.sha256sum] = "7253ab4de971e72fb7be983802300c30b5a7f0c2e56fab8abfc6a214307c0094"
-SRC_URI[serde_derive-1.0.203.sha256sum] = "500cbc0ebeb6f46627f50f3f5811ccf6bf00643be300b4c3eabc0ef55dc5b5ba"
-SRC_URI[serde_json-1.0.116.sha256sum] = "3e17db7126d17feb94eb3fad46bf1a96b034e8aacbc2e775fe81505f8b0b2813"
+SRC_URI[regex-1.10.5.sha256sum] = "b91213439dad192326a0d7c6ee3955910425f441d7038e0d6933b0aec5c4517f"
+SRC_URI[regex-automata-0.4.7.sha256sum] = "38caf58cc5ef2fed281f89292ef23f6365465ed9a41b7a7754eb4e26496c92df"
+SRC_URI[regex-syntax-0.8.4.sha256sum] = "7a66a03ae7c801facd77a29370b4faec201768915ac14a721ba36f20bc9c209b"
+SRC_URI[rustversion-1.0.17.sha256sum] = "955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6"
+SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
+SRC_URI[serde-1.0.204.sha256sum] = "bc76f558e0cbb2a839d37354c575f1dc3fdc6546b5be373ba43d95f231bf7c12"
+SRC_URI[serde_derive-1.0.204.sha256sum] = "e0cd7e117be63d3c3678776753929474f3b04a43a080c744d6b0ae2a8c28e222"
+SRC_URI[serde_json-1.0.121.sha256sum] = "4ab380d7d9f22ef3f21ad3e6c1ebe8e4fc7a2000ccba2e4d71fc96f15b2cb609"
 SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
-SRC_URI[speedate-0.14.0.sha256sum] = "c323c4e6fece5a5a1a2a7f726d243144cce9fbcfe3ce4d9f3c6ede726a2bc780"
+SRC_URI[speedate-0.14.4.sha256sum] = "08a20480dbd4c693f0b0f3210f2cee5bfa21a176c1fa4df0e65cc0474e7fa557"
+SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
-SRC_URI[strum-0.25.0.sha256sum] = "290d54ea6f91c969195bdbcd7442c8c2a2ba87da8bf60a7ee86a235d4bc1e125"
-SRC_URI[strum_macros-0.25.3.sha256sum] = "23dc1fa9ac9c169a78ba62f0b841814b7abae11bdd047b9c58f893439e309ea0"
-SRC_URI[strum_macros-0.26.1.sha256sum] = "7a3417fc93d76740d974a01654a09777cb500428cc874ca9f45edfe0c4d4cd18"
-SRC_URI[syn-2.0.48.sha256sum] = "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
+SRC_URI[strum-0.26.3.sha256sum] = "8fec0f0aef304996cf250b31b5a10dee7980c85da9d759361292b8bca5a18f06"
+SRC_URI[strum_macros-0.26.4.sha256sum] = "4c6bee85a5a24955dc440386795aa378cd9cf82acd5f764469152d2270e581be"
+SRC_URI[syn-2.0.68.sha256sum] = "901fa70d88b9d6c98022e23b4136f9f3e54e4662c3bc1bd1d84a42a9a0f0c1e9"
+SRC_URI[synstructure-0.13.1.sha256sum] = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
-SRC_URI[target-lexicon-0.12.9.sha256sum] = "df8e77cb757a61f51b947ec4a7e3646efd825b73561db1c232a8ccb639e611a0"
-SRC_URI[tinyvec-1.6.0.sha256sum] = "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
+SRC_URI[target-lexicon-0.12.14.sha256sum] = "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f"
+SRC_URI[tinystr-0.7.6.sha256sum] = "9117f5d4db391c1cf6927e7bea3db74b9a1c1add8f7eda9ffd5364f40f57b82f"
+SRC_URI[tinyvec-1.6.1.sha256sum] = "c55115c6fbe2d2bef26eb09ad74bde02d8255476fc0c7b515ef09fbb35742d82"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[unicode-bidi-0.3.13.sha256sum] = "92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385b3e1460"
-SRC_URI[unicode-ident-1.0.10.sha256sum] = "22049a19f4a68748a168c0fc439f9516686aa045927ff767eca0a85101fb6e73"
-SRC_URI[unicode-normalization-0.1.22.sha256sum] = "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
+SRC_URI[unicode-bidi-0.3.15.sha256sum] = "08f95100a766bf4f8f28f90d77e0a5461bbdb219042e7679bebe79004fed8d75"
+SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
+SRC_URI[unicode-normalization-0.1.23.sha256sum] = "a56d1686db2308d901306f92a263857ef59ea39678a5458e7cb17f01415101f5"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
-SRC_URI[url-2.5.0.sha256sum] = "31e6302e3bb753d46e83516cae55ae196fc0c309407cf11ab35cc51a4c2a4633"
-SRC_URI[uuid-1.8.0.sha256sum] = "a183cf7feeba97b4dd1c0d46788634f6221d87fa961b305bed08c851829efcc0"
-SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
+SRC_URI[url-2.5.2.sha256sum] = "22784dbdf76fdde8af1aeda5622b546b422b6fc585325248a2bf9f5e41e94d6c"
+SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
+SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
+SRC_URI[uuid-1.9.1.sha256sum] = "5de17fd2f7da591098415cff336e12965a28061ddace43b59cb3c430179c9439"
+SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[windows-targets-0.48.1.sha256sum] = "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
-SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
-SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
-SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
-SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
-SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
-SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
-SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
+SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
+SRC_URI[writeable-0.5.5.sha256sum] = "1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc95c51"
 SRC_URI[wyz-0.5.1.sha256sum] = "05f360fc0b24296329c78fda852a1e9ae82de9cf7b27dae4b7f62f118f77b9ed"
-SRC_URI[zerocopy-0.7.32.sha256sum] = "74d4d3961e53fa4c9a25a8637fc2bfaf2595b3d3ae34875568a5cf64787716be"
-SRC_URI[zerocopy-derive-0.7.32.sha256sum] = "9ce1b18ccd8e73a9321186f97e46f9f04b778851177567b1975109d26a08d2a6"
+SRC_URI[yoke-0.7.4.sha256sum] = "6c5b1314b079b0930c31e3af543d8ee1757b1951ae1e1565ec704403a7240ca5"
+SRC_URI[yoke-derive-0.7.4.sha256sum] = "28cc31741b18cb6f1d5ff12f5b7523e3d6eb0852bbbad19d73905511d9849b95"
+SRC_URI[zerocopy-0.7.34.sha256sum] = "ae87e3fcd617500e5d106f0380cf7b77f3c6092aae37191433159dda23cfb087"
+SRC_URI[zerocopy-derive-0.7.34.sha256sum] = "15e934569e47891f7d9411f1a451d947a60e000ab3bd24fbb970f000387d1b3b"
+SRC_URI[zerofrom-0.1.4.sha256sum] = "91ec111ce797d0e0784a1116d0ddcdbea84322cd79e5d5ad173daeba4f93ab55"
+SRC_URI[zerofrom-derive-0.1.4.sha256sum] = "0ea7b4a3637ea8669cedf0f1fd5c286a17f3de97b8dd5a70a6c167a1730e63a5"
+SRC_URI[zerovec-0.10.4.sha256sum] = "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079"
+SRC_URI[zerovec-derive-0.10.3.sha256sum] = "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.patch
deleted file mode 100644
index c4e6f2f6ab..0000000000
--- a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 6e1852228a2aa38cc76b9a968bba6b603efa5b28 Mon Sep 17 00:00:00 2001
-From: Frank de Brabander <debrabander@gmail.com>
-Date: Thu, 25 Jul 2024 13:50:44 +0200
-Subject: [PATCH] Set rust version from 1.76 to 1.75 in Cargo.toml
-
-Current openembedded-core uses 1.75 and this packages doesn't actually
-require a newer version.
-
-Upstream-Status: Inappropriate
----
- Cargo.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Cargo.toml b/Cargo.toml
-index 8f0ea44..10b277c 100644
---- a/Cargo.toml
-+++ b/Cargo.toml
-@@ -24,7 +24,7 @@ include = [
-     "!tests/.pytest_cache",
-     "!*.so",
- ]
--rust-version = "1.76"
-+rust-version = "1.75"
- 
- [dependencies]
- pyo3 = { version = "0.21.2", features = ["generate-import-lib", "num-bigint"] }
--- 
-2.39.2
-
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb
index eb55991995..b4ca66a54d 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb
@@ -8,12 +8,13 @@ HOMEPAGE = "https://github.com/pydantic/pydantic-core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 
-SRC_URI += "file://0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.patch"
-SRC_URI[sha256sum] = "ec3beeada09ff865c344ff3bc2f427f5e6c26401cc6113d77e372c3fdac73864"
+require ${BPN}-crates.inc
 
-DEPENDS = "python3-maturin-native python3-typing-extensions"
+SRC_URI += "file://run-ptest"
 
-require ${BPN}-crates.inc
+SRC_URI[sha256sum] = "79c747f9916e5b6cb588dfd994d9ac15a93e43eb07467d9e6f24d892c176bbf5"
+
+DEPENDS = "python3-maturin-native python3-typing-extensions"
 
 inherit pypi cargo-update-recipe-crates python_maturin
 
@@ -27,16 +28,20 @@ RDEPENDS:${PN} += " \
 INSANE_SKIP:${PN} = "already-stripped"
 INSANE_SKIP:${PN} += "buildpaths"
 
+# python3-misc is for Lib/timeit.py which is not split out elsewhere
 inherit ptest
-SRC_URI += "file://run-ptest"
 RDEPENDS:${PN}-ptest += "\
+	python3-dateutil \
     python3-dirty-equals \
     python3-hypothesis \
+    python3-misc \
     python3-pytest \
     python3-pytest-mock \
     python3-pytest-timeout \
     python3-pytest-benchmark \
+	python3-tzdata \
     python3-unittest-automake-output \
+	python3-zoneinfo \
 "
 
 do_install_ptest() {
-- 
2.46.0


