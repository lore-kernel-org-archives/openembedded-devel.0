Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1660.1792738456461870814
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bWyGfC26;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a07025cce4so347783b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738456; x=1793343256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=od9P4r+MXwwCJV3UIe1Da0fZFnrwR41pBfKRUu/+cFY=;
        b=bWyGfC26Ln0oaLEn6c8pv5xVT9wgcKakMbBDbpXq0NwKltCsKQbUXhjt4drsaSi7iY
         fqzdu5ZvCbx8qfYu/05vyONGVU5IaK89VzDQ72wfRenmlblVyPHu9ySsxkO1jMuowu6u
         3neOd8zXI6Xg7NEo1aPrE8hZhgcoyXgx08z5KckUAH0CmBJ/ytkecJuN7M0XFjhlZzkE
         8j0V6T9SPZiWdfV77AH+dGiIU9I1IlXcwNWkW5KtVhexAq7pGB8/HDMKIAue3urd5oxr
         CDRziOyeegLD3W3ih3pkcpKNrS1YV1XyG27pJMJo7Sm0LonZnquoy56tUGz8xj1RKpY8
         3Xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738456; x=1793343256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=od9P4r+MXwwCJV3UIe1Da0fZFnrwR41pBfKRUu/+cFY=;
        b=f4RSpGFR3axl16Ez431w2OruhfPGaBJFDxYteLJTuUFWrSY0Vs/PAo/adQPBFOBBRl
         lir4GYN2mbU4RAnJ2H5CiqgKVfdLSZGs7lp8JEZCwYxLm8C/vkZR712p3oUWYtyujceU
         sRu8Zkj2wZFkYpKaQBYnGLEqb1Pk+mBtEkhJsesV7cj/RMRHymG2Ec8an7FlTLActrH4
         pWHsSDSuwgD3SvXQUb19toNDe8S/HT0scACOIiGF6SSLSW0lautRL4GzlgNuucrFgjkc
         8wpj9jI2lKJ96uYILC6HS6kMJGpTO06FwZsYcLkYyZrPsSjEWLyKZCTBn0vYRN2K/8iF
         Yn3w==
X-Gm-Message-State: AFq9FYIy95rfitckxa0BrJaoAcW/FUfXnO/3tflHJJ7LPQYxWVR2apXF
	CIjQnaXc+dP6pWUDO8qv5PABNaHNh+EgaA+imktmtr3rCQ92/avDWqDnrXs/Fu/bGvs=
X-Gm-Gg: AYBFou28UZLHHAKewBI10pK1fLyAVHxXXkioyYbzQeU6U8U0DzgyXA371AVUN8/wiar
	8HWFOQtOzDOH/odW1qC2j6HIhYxkmjn3FmL9l4IKr+NQ+3/RjevkQPYbDvRGUbkZYrPbbYjGMLi
	FDvWXw2qZesR6Iq638CDWTQ3BH4mgqYre4VPMwRPTW6awxesUFS/p00mf4Q0VWFMb4N1sxnUJsh
	fTyqJLNKUa5rtZEfKHBX968rqM1NbL5O1HybEnT10JsMM4hBVntp++U+r2UkkqjSRMG6eY5mzsn
	2FP/tfAffuu9xpbyIeCnIPAiJamBFrvx4KK1mS/XZrmwOtZvXEDkSQ+CpBXVgay6zyx7Yy2PZwY
	9F1KHJqXwKaXXbr82hbjKMm3hHj5/12Qj05uUMBae0ZPFNph5RsPAMqY/YVmiEw5ajw4BceJ9wt
	9jSZCY8cnFAv2vlYZ2czLkBgwOCo4qG+gWE9Vk/k/xwwCFo5xTrWmlx7RE+XJ5gFoP3XTyo5uVc
	9PoLD8f0/c8NkPnRA3/AiKj5bBfKH8af0deSGiym/8T7tv9xkSiZN0ZABaezgSz4diGA0nqGfxG
	+RkIlQlX6SdrRQQSRl5p57kV5/xRbIq1KdGsHIBWn3w6ZVHRFanjtFgUzEoiBXppwWa6rmy5UNe
	lBtA1Iq0w6XH26MjFRLcKzHC8ZU0d2IEI8FKi2wMxnXta5xrCARPfFYnFZ1w3F+mWheH59PV/46
	StUdZp6H+jbZE7zC1rfshYikO77SqEOB1jXddCsZQg9eqW964OfSoUgBq6xZsG2BibbK8rVErrr
	58VzIwb2IvVnb/cUbwilbWpFPK4HdRcylm8zG1QUlhSIj5plpS6
X-Received: by 2002:a05:6a00:3909:b0:899:13ee:1bd7 with SMTP id d2e1a72fcca58-8a2c661e59cmr1218603b3a.35.1792738455515;
        Thu, 22 Oct 2026 23:54:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 18/29] python3-ruff: Upgrade 0.16.8 -> 0.17.1
Date: Thu, 22 Oct 2026 23:53:39 -0700
Message-ID: <20261023065350.3228996-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131342
Content-Type: text/plain; charset="utf-8"

Regenerate python3-ruff-crates.inc with 'bitbake -c update_crates'.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-ruff-crates.inc            | 158 ++++++++----------
 ...-ruff_0.16.8.bb => python3-ruff_0.17.1.bb} |   2 +-
 2 files changed, 73 insertions(+), 87 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruff_0.16.8.bb => python3-ruff_0.17.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-ruff-crates.inc b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
index 03b8a06f2f..50b22b418a 100644
--- a/meta-python/recipes-devtools/python/python3-ruff-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
@@ -32,7 +32,7 @@ SRC_URI += " \
     crate://crates.io/bit-set/0.8.0 \
     crate://crates.io/bit-vec/0.8.0 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.13.1 \
+    crate://crates.io/bitflags/2.13.2 \
     crate://crates.io/bitvec/1.1.1 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/block2/0.6.2 \
@@ -51,7 +51,7 @@ SRC_URI += " \
     crate://crates.io/cfg_aliases/0.2.1 \
     crate://crates.io/chacha20/0.10.0 \
     crate://crates.io/char_str/0.0.4 \
-    crate://crates.io/chrono/0.4.44 \
+    crate://crates.io/chrono/0.4.45 \
     crate://crates.io/ciborium/0.2.2 \
     crate://crates.io/ciborium-io/0.2.2 \
     crate://crates.io/ciborium-ll/0.2.2 \
@@ -85,7 +85,7 @@ SRC_URI += " \
     crate://crates.io/criterion/0.8.2 \
     crate://crates.io/criterion-plot/0.5.0 \
     crate://crates.io/criterion-plot/0.8.2 \
-    crate://crates.io/crossbeam/0.8.4 \
+    crate://crates.io/crossbeam/0.8.5 \
     crate://crates.io/crossbeam-channel/0.5.15 \
     crate://crates.io/crossbeam-deque/0.8.6 \
     crate://crates.io/crossbeam-epoch/0.9.18 \
@@ -140,7 +140,6 @@ SRC_URI += " \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/get-size-derive2/0.11.0 \
     crate://crates.io/get-size2/0.11.0 \
-    crate://crates.io/getopts/0.2.24 \
     crate://crates.io/getrandom/0.2.16 \
     crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.2 \
@@ -157,20 +156,20 @@ SRC_URI += " \
     crate://crates.io/html-escape/0.2.13 \
     crate://crates.io/iana-time-zone/0.1.64 \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
-    crate://crates.io/icu_collections/2.2.0 \
-    crate://crates.io/icu_locale_core/2.2.0 \
-    crate://crates.io/icu_normalizer/2.2.0 \
-    crate://crates.io/icu_normalizer_data/2.2.0 \
-    crate://crates.io/icu_properties/2.2.0 \
-    crate://crates.io/icu_properties_data/2.2.0 \
-    crate://crates.io/icu_provider/2.2.0 \
+    crate://crates.io/icu_collections/2.3.0 \
+    crate://crates.io/icu_locale_core/2.3.0 \
+    crate://crates.io/icu_normalizer/2.3.0 \
+    crate://crates.io/icu_normalizer_data/2.3.0 \
+    crate://crates.io/icu_properties/2.3.0 \
+    crate://crates.io/icu_properties_data/2.3.0 \
+    crate://crates.io/icu_provider/2.3.1 \
     crate://crates.io/id-arena/2.3.0 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/ignore/0.4.33 \
     crate://crates.io/imara-diff/0.2.0 \
     crate://crates.io/imperative/1.0.7 \
-    crate://crates.io/indexmap/2.14.0 \
+    crate://crates.io/indexmap/2.14.2 \
     crate://crates.io/indicatif/0.18.6 \
     crate://crates.io/indoc/2.0.7 \
     crate://crates.io/inotify/0.11.0 \
@@ -180,7 +179,7 @@ SRC_URI += " \
     crate://crates.io/interpolator/0.5.0 \
     crate://crates.io/intrusive-collections/0.10.1 \
     crate://crates.io/inventory/0.3.24 \
-    crate://crates.io/is-macro/0.3.7 \
+    crate://crates.io/is-macro/0.3.8 \
     crate://crates.io/is-terminal/0.4.16 \
     crate://crates.io/is_terminal_polyfill/1.70.1 \
     crate://crates.io/itertools/0.10.5 \
@@ -188,9 +187,9 @@ SRC_URI += " \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itertools/0.15.0 \
     crate://crates.io/itoa/1.0.15 \
-    crate://crates.io/jiff/0.2.35 \
+    crate://crates.io/jiff/0.2.37 \
     crate://crates.io/jiff-core/0.1.0 \
-    crate://crates.io/jiff-static/0.2.35 \
+    crate://crates.io/jiff-static/0.2.37 \
     crate://crates.io/jiff-tzdb/0.1.4 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.34 \
@@ -201,8 +200,8 @@ SRC_URI += " \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/leb128fmt/0.1.0 \
     crate://crates.io/libc/0.2.189 \
-    crate://crates.io/libcst/1.8.6 \
-    crate://crates.io/libcst_derive/1.8.6 \
+    crate://crates.io/libcst/1.9.0 \
+    crate://crates.io/libcst_derive/1.9.0 \
     crate://crates.io/libm/0.2.16 \
     crate://crates.io/libmimalloc-sys/0.1.49 \
     crate://crates.io/libredox/0.1.10 \
@@ -211,7 +210,7 @@ SRC_URI += " \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.0 \
     crate://crates.io/lock_api/0.4.14 \
-    crate://crates.io/log/0.4.33 \
+    crate://crates.io/log/0.4.34 \
     crate://crates.io/lsp-server/0.10.0 \
     crate://crates.io/manyhow/0.11.4 \
     crate://crates.io/manyhow-macros/0.11.4 \
@@ -243,7 +242,7 @@ SRC_URI += " \
     crate://crates.io/once_cell_polyfill/1.70.1 \
     crate://crates.io/oorandom/11.1.5 \
     crate://crates.io/option-ext/0.2.0 \
-    crate://crates.io/ordermap/1.2.0 \
+    crate://crates.io/ordermap/1.2.2 \
     crate://crates.io/os_pipe/1.2.2 \
     crate://crates.io/os_str_bytes/7.1.1 \
     crate://crates.io/page_size/0.6.0 \
@@ -275,7 +274,6 @@ SRC_URI += " \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/portable-atomic-util/0.2.4 \
     crate://crates.io/potential_utf/0.1.3 \
-    crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/predicates/3.1.4 \
     crate://crates.io/predicates-core/1.0.10 \
     crate://crates.io/predicates-tree/1.0.13 \
@@ -290,7 +288,7 @@ SRC_URI += " \
     crate://crates.io/ptr_meta/0.3.1 \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/pyproject-toml/0.13.7 \
-    crate://crates.io/quick-junit/0.6.1 \
+    crate://crates.io/quick-junit/0.8.0 \
     crate://crates.io/quick-xml/0.41.0 \
     crate://crates.io/quickcheck/1.1.0 \
     crate://crates.io/quickcheck_macros/1.2.0 \
@@ -303,7 +301,6 @@ SRC_URI += " \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/rand/0.8.5 \
     crate://crates.io/rand/0.10.2 \
-    crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_core/0.6.4 \
     crate://crates.io/rand_core/0.10.0 \
     crate://crates.io/rayon/1.12.0 \
@@ -323,12 +320,12 @@ SRC_URI += " \
     crate://crates.io/rust-stemmers/1.2.0 \
     crate://crates.io/rustc-hash/2.1.3 \
     crate://crates.io/rustc-stable-hash/0.1.2 \
-    crate://crates.io/rustix/1.1.4 \
+    crate://crates.io/rustix/1.1.5 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ryu/1.0.20 \
-    crate://crates.io/salsa/0.28.2 \
-    crate://crates.io/salsa-macro-rules/0.28.2 \
-    crate://crates.io/salsa-macros/0.28.2 \
+    crate://crates.io/salsa/0.28.5 \
+    crate://crates.io/salsa-macro-rules/0.28.5 \
+    crate://crates.io/salsa-macros/0.28.5 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/schemars/1.2.2 \
     crate://crates.io/schemars_derive/1.2.2 \
@@ -349,10 +346,10 @@ SRC_URI += " \
     crate://crates.io/shlex/2.0.1 \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/similar/2.7.0 \
-    crate://crates.io/similar/3.1.2 \
+    crate://crates.io/similar/3.2.0 \
     crate://crates.io/siphasher/1.0.1 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.15.2 \
+    crate://crates.io/smallvec/1.16.1 \
     crate://crates.io/snapbox/1.0.0 \
     crate://crates.io/snapbox-macros/1.0.0 \
     crate://crates.io/stable_deref_trait/1.2.0 \
@@ -365,7 +362,7 @@ SRC_URI += " \
     crate://crates.io/strum_macros/0.28.0 \
     crate://crates.io/supports-hyperlinks/3.2.0 \
     crate://crates.io/syn/2.0.119 \
-    crate://crates.io/syn/3.0.3 \
+    crate://crates.io/syn/3.0.5 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/tap/1.0.1 \
     crate://crates.io/tempfile/3.27.0 \
@@ -383,12 +380,12 @@ SRC_URI += " \
     crate://crates.io/thread_local/1.1.9 \
     crate://crates.io/tikv-jemalloc-sys/0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7 \
     crate://crates.io/tikv-jemallocator/0.6.1 \
-    crate://crates.io/tinystr/0.8.3 \
+    crate://crates.io/tinystr/0.8.4 \
     crate://crates.io/tinytemplate/1.2.1 \
     crate://crates.io/tinyvec/1.10.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
     crate://crates.io/toml/0.9.12+spec-1.1.0 \
-    crate://crates.io/toml/1.1.4+spec-1.1.0 \
+    crate://crates.io/toml/1.1.6+spec-1.1.0 \
     crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
     crate://crates.io/toml_edit/0.25.12+spec-1.1.0 \
@@ -408,11 +405,9 @@ SRC_URI += " \
     crate://crates.io/ucd-trie/0.1.7 \
     crate://crates.io/unicode-id/0.3.6 \
     crate://crates.io/unicode-ident/1.0.24 \
-    crate://crates.io/unicode-normalization/0.1.24 \
+    crate://crates.io/unicode-normalization/0.1.25 \
     crate://crates.io/unicode-width/0.2.2 \
     crate://crates.io/unicode-xid/0.2.6 \
-    crate://crates.io/unicode_names2/1.3.0 \
-    crate://crates.io/unicode_names2_generator/1.3.0 \
     crate://crates.io/unit-prefix/0.5.1 \
     crate://crates.io/unscanny/0.1.0 \
     crate://crates.io/url/2.5.8 \
@@ -420,7 +415,7 @@ SRC_URI += " \
     crate://crates.io/utf8-width/0.1.7 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.24.1 \
+    crate://crates.io/uuid/1.26.1 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version-ranges/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
@@ -445,7 +440,7 @@ SRC_URI += " \
     crate://crates.io/wasmparser/0.244.0 \
     crate://crates.io/web-sys/0.3.100 \
     crate://crates.io/web-time/1.1.0 \
-    crate://crates.io/which/8.0.5 \
+    crate://crates.io/which/8.0.6 \
     crate://crates.io/wild/2.2.1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
@@ -489,18 +484,16 @@ SRC_URI += " \
     crate://crates.io/wit-bindgen-rust-macro/0.51.0 \
     crate://crates.io/wit-component/0.244.0 \
     crate://crates.io/wit-parser/0.244.0 \
-    crate://crates.io/writeable/0.6.2 \
+    crate://crates.io/writeable/0.6.4 \
     crate://crates.io/wyz/0.5.1 \
     crate://crates.io/yansi/1.0.1 \
-    crate://crates.io/yoke/0.8.2 \
+    crate://crates.io/yoke/0.8.3 \
     crate://crates.io/yoke-derive/0.8.2 \
-    crate://crates.io/zerocopy/0.8.27 \
-    crate://crates.io/zerocopy-derive/0.8.27 \
     crate://crates.io/zerofrom/0.1.6 \
     crate://crates.io/zerofrom-derive/0.1.6 \
-    crate://crates.io/zerotrie/0.2.4 \
-    crate://crates.io/zerovec/0.11.6 \
-    crate://crates.io/zerovec-derive/0.11.3 \
+    crate://crates.io/zerotrie/0.2.5 \
+    crate://crates.io/zerovec/0.11.8 \
+    crate://crates.io/zerovec-derive/0.11.6 \
     crate://crates.io/zip/8.6.0 \
     crate://crates.io/zlib-rs/0.5.5 \
     crate://crates.io/zmij/1.0.10 \
@@ -539,7 +532,7 @@ SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954e
 SRC_URI[bit-set-0.8.0.sha256sum] = "08807e080ed7f9d5433fa9b275196cfc35414f66a0c79d864dc51a0d825231a3"
 SRC_URI[bit-vec-0.8.0.sha256sum] = "5e764a1d40d510daf35e07be9eb06e75770908c27d411ee6c92109c9840eaaf7"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.13.1.sha256sum] = "b588b76d00fde79687d7646a9b5bdf3cc0f655e0bbd080335a95d7e96f3587da"
+SRC_URI[bitflags-2.13.2.sha256sum] = "3ded4057c258ba199e2d26386d3af3780957ecaee6c4ef4041c6b4b8b97c0b06"
 SRC_URI[bitvec-1.1.1.sha256sum] = "ddcec3d12c579d40898fe0a9a358a803c23e9c52ca3c425707f81c9436211837"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[block2-0.6.2.sha256sum] = "cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5"
@@ -558,7 +551,7 @@ SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d332
 SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
 SRC_URI[chacha20-0.10.0.sha256sum] = "6f8d983286843e49675a4b7a2d174efe136dc93a18d69130dd18198a6c167601"
 SRC_URI[char_str-0.0.4.sha256sum] = "c9cba78a5abb515610e10af297615434b019755b5d7be14e559ff5340dff50c4"
-SRC_URI[chrono-0.4.44.sha256sum] = "c673075a2e0e5f4a1dde27ce9dee1ea4558c7ffe648f576438a20ca1d2acc4b0"
+SRC_URI[chrono-0.4.45.sha256sum] = "1aa79e62e7697b8e29b513a68abacf485adcd1fe8284a4316c5ae868e6633327"
 SRC_URI[ciborium-0.2.2.sha256sum] = "42e69ffd6f0917f5c029256a24d0161db17cea3997d185db0d35926308770f0e"
 SRC_URI[ciborium-io-0.2.2.sha256sum] = "05afea1e0a06c9be33d539b876f1ce3692f4afea2cb41f740e7743225ed1c757"
 SRC_URI[ciborium-ll-0.2.2.sha256sum] = "57663b653d948a338bfb3eeba9bb2fd5fcfaecb9e199e87e1eda4d9e8b240fd9"
@@ -592,7 +585,7 @@ SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b718
 SRC_URI[criterion-0.8.2.sha256sum] = "950046b2aa2492f9a536f5f4f9a3de7b9e2476e575e05bd6c333371add4d98f3"
 SRC_URI[criterion-plot-0.5.0.sha256sum] = "6b50826342786a51a89e2da3a28f1c32b06e387201bc2d19791f622c673706b1"
 SRC_URI[criterion-plot-0.8.2.sha256sum] = "d8d80a2f4f5b554395e47b5d8305bc3d27813bacb73493eb1001e8f76dae29ea"
-SRC_URI[crossbeam-0.8.4.sha256sum] = "1137cd7e7fc0fb5d3c5a8678be38ec56e819125d8d7907411fe24ccb943faca8"
+SRC_URI[crossbeam-0.8.5.sha256sum] = "e71406cd8807725f7ac2f999a4cdd32e98f829fdf65f528343cebf945e41df1e"
 SRC_URI[crossbeam-channel-0.5.15.sha256sum] = "82b8f8f868b36967f9606790d1903570de9ceaf870a7bf9fbbd3016d636a2cb2"
 SRC_URI[crossbeam-deque-0.8.6.sha256sum] = "9dd111b7b7f7d55b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51"
 SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
@@ -647,7 +640,6 @@ SRC_URI[gen-lsp-types-0.11.0.sha256sum] = "b64887ac3a8083427ae935a7296db87687158
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[get-size-derive2-0.11.0.sha256sum] = "7efe46d2adb529015748742f1a38594039ce357dbb21e6d178de342cfce468d4"
 SRC_URI[get-size2-0.11.0.sha256sum] = "d4d338de392104417fe6fdbe588c52383b9236956d8afe5654f0077176edc632"
-SRC_URI[getopts-0.2.24.sha256sum] = "cfe4fbac503b8d1f88e6676011885f34b7174f46e59956bba534ba83abded4df"
 SRC_URI[getrandom-0.2.16.sha256sum] = "335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592"
 SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.2.sha256sum] = "0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555"
@@ -664,20 +656,20 @@ SRC_URI[hermit-abi-0.5.2.sha256sum] = "fc0fef456e4baa96da950455cd02c081ca953b141
 SRC_URI[html-escape-0.2.13.sha256sum] = "6d1ad449764d627e22bfd7cd5e8868264fc9236e07c752972b4080cd351cb476"
 SRC_URI[iana-time-zone-0.1.64.sha256sum] = "33e57f83510bb73707521ebaffa789ec8caf86f9657cad665b092b581d40e9fb"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
-SRC_URI[icu_collections-2.2.0.sha256sum] = "2984d1cd16c883d7935b9e07e44071dca8d917fd52ecc02c04d5fa0b5a3f191c"
-SRC_URI[icu_locale_core-2.2.0.sha256sum] = "92219b62b3e2b4d88ac5119f8904c10f8f61bf7e95b640d25ba3075e6cac2c29"
-SRC_URI[icu_normalizer-2.2.0.sha256sum] = "c56e5ee99d6e3d33bd91c5d85458b6005a22140021cc324cea84dd0e72cff3b4"
-SRC_URI[icu_normalizer_data-2.2.0.sha256sum] = "da3be0ae77ea334f4da67c12f149704f19f81d1adf7c51cf482943e84a2bad38"
-SRC_URI[icu_properties-2.2.0.sha256sum] = "bee3b67d0ea5c2cca5003417989af8996f8604e34fb9ddf96208a033901e70de"
-SRC_URI[icu_properties_data-2.2.0.sha256sum] = "8e2bbb201e0c04f7b4b3e14382af113e17ba4f63e2c9d2ee626b720cbce54a14"
-SRC_URI[icu_provider-2.2.0.sha256sum] = "139c4cf31c8b5f33d7e199446eff9c1e02decfc2f0eec2c8d71f65befa45b421"
+SRC_URI[icu_collections-2.3.0.sha256sum] = "fa68d21081c4a05d5a901a1c62add574c77048b6a1c67be3b50ce0b60d4ca513"
+SRC_URI[icu_locale_core-2.3.0.sha256sum] = "d56e28588da92eee5c3201a6eff33fabdd49b62269c8938d4ff050ce4d900deb"
+SRC_URI[icu_normalizer-2.3.0.sha256sum] = "12f9cf5f235641ed274641dd81c3f28d870e276763d0797aeeab72317b1c646f"
+SRC_URI[icu_normalizer_data-2.3.0.sha256sum] = "1563da1ed3e0b3bf3d74c9b85917ac9c56464d2f57242270c09c9e752f8021a0"
+SRC_URI[icu_properties-2.3.0.sha256sum] = "7e7ca276ad3145661a65914e6daf131ca5120cd3dcee8f8f3214b8875184a148"
+SRC_URI[icu_properties_data-2.3.0.sha256sum] = "e590f038c1464a96894fd6d10127e90a8be4509f56ff7ecef851b15cee0b7caa"
+SRC_URI[icu_provider-2.3.1.sha256sum] = "d27bbb9d3abbefac45d55f647c9de1d44aafcd1186eb91879afef17c396c3e73"
 SRC_URI[id-arena-2.3.0.sha256sum] = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[ignore-0.4.33.sha256sum] = "00b69833ed729dc5aa7d19541d96d6cf8e9137194207a04916d658e43168402f"
 SRC_URI[imara-diff-0.2.0.sha256sum] = "2f01d462f766df78ab820dd06f5eb700233c51f0f4c2e846520eaf4ba6aa5c5c"
 SRC_URI[imperative-1.0.7.sha256sum] = "35e1d0bd9c575c52e59aad8e122a11786e852a154678d0c86e9e243d55273970"
-SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
+SRC_URI[indexmap-2.14.2.sha256sum] = "cc4e190f5d26ca7051642629da2c52fc03bde85a03197c99408dcd291734c855"
 SRC_URI[indicatif-0.18.6.sha256sum] = "9433806cd6b4ec1aba79c021c7e4c58fb4c3b9977c085062e611ac929998fb0c"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[inotify-0.11.0.sha256sum] = "f37dccff2791ab604f9babef0ba14fbe0be30bd368dc541e2b08d07c8aa908f3"
@@ -687,7 +679,7 @@ SRC_URI[insta-cmd-0.7.0.sha256sum] = "bffdf4af1db390cf0401535d7c1303cd079a074d28
 SRC_URI[interpolator-0.5.0.sha256sum] = "71dd52191aae121e8611f1e8dc3e324dd0dd1dee1e6dd91d10ee07a3cfb4d9d8"
 SRC_URI[intrusive-collections-0.10.1.sha256sum] = "80e165935eba36cb526af8389effd2005a741adcbb6ed32106cc68e3f7b92960"
 SRC_URI[inventory-0.3.24.sha256sum] = "a4f0c30c76f2f4ccee3fe55a2435f691ca00c0e4bd87abe4f4a851b1d4dac39b"
-SRC_URI[is-macro-0.3.7.sha256sum] = "1d57a3e447e24c22647738e4607f1df1e0ec6f72e16182c4cd199f647cdfb0e4"
+SRC_URI[is-macro-0.3.8.sha256sum] = "8267aa6001e25494f3015f9663bbd88a18240c74483afa5f0934a1b3e4c388e9"
 SRC_URI[is-terminal-0.4.16.sha256sum] = "e04d7f318608d35d4b61ddd75cbdaee86b023ebe2bd5a66ee0915f0bf93095a9"
 SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] = "7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
 SRC_URI[itertools-0.10.5.sha256sum] = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473"
@@ -695,9 +687,9 @@ SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c08819
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itertools-0.15.0.sha256sum] = "8b4baf93f58d4425749ca49a51c50ebab072c5df6994d08fed93541c331481dc"
 SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
-SRC_URI[jiff-0.2.35.sha256sum] = "668b7183bd07af9a4885f5c35b0cc5c83c4607a913c16b7e17291832910d2dcc"
+SRC_URI[jiff-0.2.37.sha256sum] = "0ab1baf72f08796de0260609515130699b890ac25f30e610ad894bc5856cafdb"
 SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09"
-SRC_URI[jiff-static-0.2.35.sha256sum] = "3a69dcb3a21cfb32ce1cd056169337ca284af0766dd766e7878819b251a49204"
+SRC_URI[jiff-static-0.2.37.sha256sum] = "378268a1116ad67ae6228701118ac9f491d78fda38a40a1f1a9e1348de6f7212"
 SRC_URI[jiff-tzdb-0.1.4.sha256sum] = "c1283705eb0a21404d2bfd6eef2a7593d240bc42a0bdb39db0ad6fa2ec026524"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
@@ -708,8 +700,8 @@ SRC_URI[kqueue-sys-1.0.4.sha256sum] = "ed9625ffda8729b85e45cf04090035ac368927b8c
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
 SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
-SRC_URI[libcst-1.8.6.sha256sum] = "6aea7143e4a0ed59b87a1ee71e198500889f8b005311136be15e84c97a6fcd8d"
-SRC_URI[libcst_derive-1.8.6.sha256sum] = "0903173ea316c34a44d0497161e04d9210af44f5f5e89bf2f55d9a254c9a0e8d"
+SRC_URI[libcst-1.9.0.sha256sum] = "21b68d9c60cba9c333f89596ef5c4d3b6c9bd0b7d2e48a9810df6fa7976102a3"
+SRC_URI[libcst_derive-1.9.0.sha256sum] = "57a1ac6fb3fbdc3408a2f138e54d11c3dd338f12c2efc3db47477cc2227d89c2"
 SRC_URI[libm-0.2.16.sha256sum] = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981"
 SRC_URI[libmimalloc-sys-0.1.49.sha256sum] = "6a45a52f43e1c16f667ccfe4dd8c85b7f7c204fd5e3bf46c5b0db9a5c3c0b8e9"
 SRC_URI[libredox-0.1.10.sha256sum] = "416f7e718bdb06000964960ffa43b4335ad4012ae8b99060261aa4a8088d5ccb"
@@ -718,7 +710,7 @@ SRC_URI[libz-rs-sys-0.5.5.sha256sum] = "c10501e7805cee23da17c7790e59df2870c0d404
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.0.sha256sum] = "241eaef5fd12c88705a01fc1066c48c4b36e0dd4377dcdc7ec3942cea7a69956"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
-SRC_URI[log-0.4.33.sha256sum] = "0ceec5bc11778974d1bcb055b18002eba7f4b3518b6a0081b3af5f21666da9ad"
+SRC_URI[log-0.4.34.sha256sum] = "f9f8bd3e56ce4dfc153cf470fffbfa98c7620958b312ca5c3a4b8d5181fd13c6"
 SRC_URI[lsp-server-0.10.0.sha256sum] = "3ee25a31f2e571e426eef2896179450cafc7e2f5be00d8a93b1c2d21c0ff7656"
 SRC_URI[manyhow-0.11.4.sha256sum] = "b33efb3ca6d3b07393750d4030418d594ab1139cee518f0dc88db70fec873587"
 SRC_URI[manyhow-macros-0.11.4.sha256sum] = "46fce34d199b78b6e6073abf984c9cf5fd3e9330145a93ee0738a7443e371495"
@@ -750,7 +742,7 @@ SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d0
 SRC_URI[once_cell_polyfill-1.70.1.sha256sum] = "a4895175b425cb1f87721b59f0f286c2092bd4af812243672510e1ac53e2e0ad"
 SRC_URI[oorandom-11.1.5.sha256sum] = "d6790f58c7ff633d8771f42965289203411a5e5c68388703c06e14f24770b41e"
 SRC_URI[option-ext-0.2.0.sha256sum] = "04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d"
-SRC_URI[ordermap-1.2.0.sha256sum] = "7f7476a5b122ff1fce7208e7ee9dccd0a516e835f5b8b19b8f3c98a34cf757c1"
+SRC_URI[ordermap-1.2.2.sha256sum] = "16a756ddcdeb6c0efc8927bdf0ed112885815a35ba350472a467be5104f01ca1"
 SRC_URI[os_pipe-1.2.2.sha256sum] = "db335f4760b14ead6290116f2427bf33a14d4f0617d49f78a246de10c1831224"
 SRC_URI[os_str_bytes-7.1.1.sha256sum] = "63eceb7b5d757011a87d08eb2123db15d87fb0c281f65d101ce30a1e96c3ad5c"
 SRC_URI[page_size-0.6.0.sha256sum] = "30d5b2194ed13191c1999ae0704b7839fb18384fa22e49b57eeaa97d79ce40da"
@@ -782,7 +774,6 @@ SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[portable-atomic-util-0.2.4.sha256sum] = "d8a2f0d8d040d7848a709caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
 SRC_URI[potential_utf-0.1.3.sha256sum] = "84df19adbe5b5a0782edcab45899906947ab039ccf4573713735ee7de1e6b08a"
-SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[predicates-3.1.4.sha256sum] = "ada8f2932f28a27ee7b70dd6c1c39ea0675c55a36879ab92f3a715eaa1e63cfe"
 SRC_URI[predicates-core-1.0.10.sha256sum] = "cad38746f3166b4031b1a0d39ad9f954dd291e7854fcc0eed52ee41a0b50d144"
 SRC_URI[predicates-tree-1.0.13.sha256sum] = "d0de1b847b39c8131db0467e9df1ff60e6d0562ab8e9a16e568ad0fdb372e2f2"
@@ -797,7 +788,7 @@ SRC_URI[psm-0.1.32.sha256sum] = "4dcd034599e63b970727f70d79e02d62390a4a84f7c6b82
 SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a4312af1f31948f8f6224a79"
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[pyproject-toml-0.13.7.sha256sum] = "f6d755483ad14b49e76713b52285235461a5b4f73f17612353e11a5de36a5fd2"
-SRC_URI[quick-junit-0.6.1.sha256sum] = "8216516c957e00535b3c91770524c219dd7df90dec439a182547f750dfe41591"
+SRC_URI[quick-junit-0.8.0.sha256sum] = "bae23b8e1a59a90f7bf98caa2f4c8c2eedf6df011c6c88ed633e85a87c84526e"
 SRC_URI[quick-xml-0.41.0.sha256sum] = "e660451e55124f798a69a5af3f49ccfbefbd41910eefd25caf2393e1f3473ec1"
 SRC_URI[quickcheck-1.1.0.sha256sum] = "95c589f335db0f6aaa168a7cd27b1fc6920f5e1470c804f814d9cd6e62a0f70b"
 SRC_URI[quickcheck_macros-1.2.0.sha256sum] = "a9a28b8493dd664c8b171dd944da82d933f7d456b829bfb236738e1fe06c5ba4"
@@ -810,7 +801,6 @@ SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand-0.10.2.sha256sum] = "c7f5fa3a058cd35567ef9bfa5e75732bee0f9e4c55fa90477bef2dfcdbc4be80"
-SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
 SRC_URI[rand_core-0.10.0.sha256sum] = "0c8d0fd677905edcbeedbf2edb6494d676f0e98d54d5cf9bda0b061cb8fb8aba"
 SRC_URI[rayon-1.12.0.sha256sum] = "fb39b166781f92d482534ef4b4b1b2568f42613b53e5b6c160e24cfbfa30926d"
@@ -830,12 +820,12 @@ SRC_URI[ron-0.12.0.sha256sum] = "fd490c5b18261893f14449cbd28cb9c0b637aebf161cd77
 SRC_URI[rust-stemmers-1.2.0.sha256sum] = "e46a2036019fdb888131db7a4c847a1063a7493f971ed94ea82c67eada63ca54"
 SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
 SRC_URI[rustc-stable-hash-0.1.2.sha256sum] = "781442f29170c5c93b7185ad559492601acdc71d5bb0706f5868094f45cfcd08"
-SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
+SRC_URI[rustix-1.1.5.sha256sum] = "891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ryu-1.0.20.sha256sum] = "28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f"
-SRC_URI[salsa-0.28.2.sha256sum] = "cf0e374215cd2db2b5c75d7b3a99cb0cc052c0595335dfdefc03d4eb08f4aa81"
-SRC_URI[salsa-macro-rules-0.28.2.sha256sum] = "85f4b7d4405540bbd6d4ffa52d4322d983f3781954d3073067ac1bdb028459b3"
-SRC_URI[salsa-macros-0.28.2.sha256sum] = "445be2bfbb2f67cb663225ecd7bc5a25370c0250fca30f9d8cbad9a913650370"
+SRC_URI[salsa-0.28.5.sha256sum] = "27d2e6e19e39591cd99c01ac4141544b4d012cfd0831348629b8187fa9fe6d34"
+SRC_URI[salsa-macro-rules-0.28.5.sha256sum] = "baf90a551c38f25ed8489111d3d5827aa18e1b85963f5e6a298505b1d1e2cb7e"
+SRC_URI[salsa-macros-0.28.5.sha256sum] = "69dd77f86ec10e72e314f4ddf7c44c8d349e73cdff1aad524ba9668603fb0549"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[schemars-1.2.2.sha256sum] = "687274d293b6cdc6e73e0fee520bf2049650090d7164f87672d212a3c530cf4a"
 SRC_URI[schemars_derive-1.2.2.sha256sum] = "d98c67716b46af2f0b8cf752abc930f6f9aecfbf671ecfb531db8a31dbe4e2ba"
@@ -856,10 +846,10 @@ SRC_URI[shellexpand-3.1.2.sha256sum] = "32824fab5e16e6c4d86dc1ba84489390419a39f9
 SRC_URI[shlex-2.0.1.sha256sum] = "f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba"
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
 SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa"
-SRC_URI[similar-3.1.2.sha256sum] = "85ee016af5d736b69fc89e19254540fa4b5f5492853fb5503920f084011c78b6"
+SRC_URI[similar-3.2.0.sha256sum] = "4f66ca1f7aca2474dc10c942eb22feffc897735f54cd1db90138c2fddb490987"
 SRC_URI[siphasher-1.0.1.sha256sum] = "56199f7ddabf13fe5074ce809e7d3f42b42ae711800501b5b16ea82ad029c39d"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.15.2.sha256sum] = "8ed6a63f02c8539c91a8685a86f4099661ba3da017932f6ebbea6de3f0fa7c90"
+SRC_URI[smallvec-1.16.1.sha256sum] = "ba467056f1b547ed52077911161fc86985becbc60e8e1857c8a144dab0def891"
 SRC_URI[snapbox-1.0.0.sha256sum] = "71d70a71b68054cbe88708f77abfc4bd2daf75028f8f55f4f1cff63565df89ea"
 SRC_URI[snapbox-macros-1.0.0.sha256sum] = "d248cef42e1456ab2f7149c0376985351b7d849ea9ad2a957bf15ddfebf1fdf9"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
@@ -872,7 +862,7 @@ SRC_URI[strum-0.28.0.sha256sum] = "9628de9b8791db39ceda2b119bbe13134770b56c138ec
 SRC_URI[strum_macros-0.28.0.sha256sum] = "ab85eea0270ee17587ed4156089e10b9e6880ee688791d45a905f5b1ca36f664"
 SRC_URI[supports-hyperlinks-3.2.0.sha256sum] = "e396b6523b11ccb83120b115a0b7366de372751aa6edf19844dfb13a6af97e91"
 SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
-SRC_URI[syn-3.0.3.sha256sum] = "53e9bae58849f64dfa4f5d5ae372c8341f7305f82a3868709269343628b659a3"
+SRC_URI[syn-3.0.5.sha256sum] = "12df2e0110f65b775f769bb17ef989067a1d931b2eb822bd4346631eeada89f9"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
@@ -890,12 +880,12 @@ SRC_URI[thiserror-impl-2.0.20.sha256sum] = "bc04cd3e1236dd4a98afca4569f2deb3f120
 SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
 SRC_URI[tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7.sha256sum] = "cd8aa5b2ab86a2cefa406d889139c162cbb230092f7d1d7cbc1716405d852a3b"
 SRC_URI[tikv-jemallocator-0.6.1.sha256sum] = "0359b4327f954e0567e69fb191cf1436617748813819c94b8cd4a431422d053a"
-SRC_URI[tinystr-0.8.3.sha256sum] = "c8323304221c2a851516f22236c5722a72eaa19749016521d6dff0824447d96d"
+SRC_URI[tinystr-0.8.4.sha256sum] = "b1e27c91459209c2986af3dcf603a5a74a4368754ce37414f59acc971167f643"
 SRC_URI[tinytemplate-1.2.1.sha256sum] = "be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc"
 SRC_URI[tinyvec-1.10.0.sha256sum] = "bfa5fdc3bce6191a1dbc8c02d5c8bffcf557bafa17c124c5264a458f1b0613fa"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
 SRC_URI[toml-0.9.12+spec-1.1.0.sha256sum] = "cf92845e79fc2e2def6a5d828f0801e29a2f8acc037becc5ab08595c7d5e9863"
-SRC_URI[toml-1.1.4+spec-1.1.0.sha256sum] = "3aace63f4bbcdfc2c965b059de67119c89c4017a70d633be6c104910f67056f5"
+SRC_URI[toml-1.1.6+spec-1.1.0.sha256sum] = "920602543f0911ab71da12c50d59701da54c196d1a2bf5cb4b75667f137a406a"
 SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
 SRC_URI[toml_edit-0.25.12+spec-1.1.0.sha256sum] = "d2153edc6955a6c354fad8f5efd38b6a8769bdccf9fe50f8e1329f81b0baa5d7"
@@ -915,11 +905,9 @@ SRC_URI[typenum-1.18.0.sha256sum] = "1dccffe3ce07af9386bfd29e80c0ab1a8205a2fc34e
 SRC_URI[ucd-trie-0.1.7.sha256sum] = "2896d95c02a80c6d6a5d6e953d479f5ddf2dfdb6a244441010e373ac0fb88971"
 SRC_URI[unicode-id-0.3.6.sha256sum] = "70ba288e709927c043cbe476718d37be306be53fb1fafecd0dbe36d072be2580"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
-SRC_URI[unicode-normalization-0.1.24.sha256sum] = "5033c97c4262335cded6d6fc3e5c18ab755e1a3dc96376350f3d8e9f009ad956"
+SRC_URI[unicode-normalization-0.1.25.sha256sum] = "5fd4f6878c9cb28d874b009da9e8d183b5abc80117c40bbd187a1fde336be6e8"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
 SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
-SRC_URI[unicode_names2-1.3.0.sha256sum] = "d1673eca9782c84de5f81b82e4109dcfb3611c8ba0d52930ec4a9478f547b2dd"
-SRC_URI[unicode_names2_generator-1.3.0.sha256sum] = "b91e5b84611016120197efd7dc93ef76774f4e084cd73c9fb3ea4a86c570c56e"
 SRC_URI[unit-prefix-0.5.1.sha256sum] = "323402cff2dd658f39ca17c789b502021b3f18707c91cdf22e3838e1b4023817"
 SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47"
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
@@ -927,7 +915,7 @@ SRC_URI[urlencoding-2.1.3.sha256sum] = "daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdf
 SRC_URI[utf8-width-0.1.7.sha256sum] = "86bd8d4e895da8537e5315b8254664e6b769c4ff3db18321b297a1e7004392e3"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.24.1.sha256sum] = "2cefc03fd367c0c6d4305de1b312cf00248c4114f4a0418ce6a6af769e3b0bd9"
+SRC_URI[uuid-1.26.1.sha256sum] = "2ef6dac1e96601b4fb3acccccff2139741fcb757cb9a36089bf5be91cfb285ce"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version-ranges-0.1.1.sha256sum] = "f8d079415ceb2be83fc355adbadafe401307d5c309c7e6ade6638e6f9f42f42d"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
@@ -952,7 +940,7 @@ SRC_URI[wasm-metadata-0.244.0.sha256sum] = "bb0e353e6a2fbdc176932bbaab493762eb12
 SRC_URI[wasmparser-0.244.0.sha256sum] = "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
 SRC_URI[web-sys-0.3.100.sha256sum] = "6e0871acf327f283dc6da28a1696cdc64fb355ba9f935d052021fa77f35cce69"
 SRC_URI[web-time-1.1.0.sha256sum] = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
-SRC_URI[which-8.0.5.sha256sum] = "8f3ef584124b911bcc3875c2f1472e80f24361ceb789bd1c62b3e9a3df9ff43c"
+SRC_URI[which-8.0.6.sha256sum] = "bae2f2b2b816647a1cab1acc91f5bd20812d53cb344382635ec2181940c8034f"
 SRC_URI[wild-2.2.1.sha256sum] = "a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
@@ -996,18 +984,16 @@ SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] = "b7c566e0f4b284dd6561c786d9cb0142da
 SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] = "0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
 SRC_URI[wit-component-0.244.0.sha256sum] = "9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2"
 SRC_URI[wit-parser-0.244.0.sha256sum] = "ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736"
-SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
+SRC_URI[writeable-0.6.4.sha256sum] = "3ad82d2a33cdc9674dc7465672f271e096168fcdbe0f799d9e6db8c5892679dc"
 SRC_URI[wyz-0.5.1.sha256sum] = "05f360fc0b24296329c78fda852a1e9ae82de9cf7b27dae4b7f62f118f77b9ed"
 SRC_URI[yansi-1.0.1.sha256sum] = "cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049"
-SRC_URI[yoke-0.8.2.sha256sum] = "abe8c5fda708d9ca3df187cae8bfb9ceda00dd96231bed36e445a1a48e66f9ca"
+SRC_URI[yoke-0.8.3.sha256sum] = "709fe23a0424b6a435d82152b1bd3fdfb0833487d5fa90d05d42762a9891fef5"
 SRC_URI[yoke-derive-0.8.2.sha256sum] = "de844c262c8848816172cef550288e7dc6c7b7814b4ee56b3e1553f275f1858e"
-SRC_URI[zerocopy-0.8.27.sha256sum] = "0894878a5fa3edfd6da3f88c4805f4c8558e2b996227a3d864f47fe11e38282c"
-SRC_URI[zerocopy-derive-0.8.27.sha256sum] = "88d2b8d9c68ad2b9e4340d7832716a4d21a22a1154777ad56ea55c51a9cf3831"
 SRC_URI[zerofrom-0.1.6.sha256sum] = "50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5"
 SRC_URI[zerofrom-derive-0.1.6.sha256sum] = "d71e5d6e06ab090c67b5e44993ec16b72dcbaabc526db883a360057678b48502"
-SRC_URI[zerotrie-0.2.4.sha256sum] = "0f9152d31db0792fa83f70fb2f83148effb5c1f5b8c7686c3459e361d9bc20bf"
-SRC_URI[zerovec-0.11.6.sha256sum] = "90f911cbc359ab6af17377d242225f4d75119aec87ea711a880987b18cd7b239"
-SRC_URI[zerovec-derive-0.11.3.sha256sum] = "625dc425cab0dca6dc3c3319506e6593dcb08a9f387ea3b284dbd52a92c40555"
+SRC_URI[zerotrie-0.2.5.sha256sum] = "4ea269c3bd32f0a32c321907a2ae912ba6f4649bb0fc764a15627e99a7095a3f"
+SRC_URI[zerovec-0.11.8.sha256sum] = "bb0464e17806c1d976d5cba29399c7f08e516e279e2ba493f63123b5fca67dd8"
+SRC_URI[zerovec-derive-0.11.6.sha256sum] = "34df6fc39dbd26ddc9c10e6a2984476e13acce22e64e4487636ef494369225da"
 SRC_URI[zip-8.6.0.sha256sum] = "2d04a6b5381502aa6087c94c669499eb1602eb9c5e8198e534de571f7154809b"
 SRC_URI[zlib-rs-0.5.5.sha256sum] = "40990edd51aae2c2b6907af74ffb635029d5788228222c4bb811e9351c0caad3"
 SRC_URI[zmij-1.0.10.sha256sum] = "30e0d8dffbae3d840f64bda38e28391faef673a7b5a6017840f2a106c8145868"
diff --git a/meta-python/recipes-devtools/python/python3-ruff_0.16.8.bb b/meta-python/recipes-devtools/python/python3-ruff_0.17.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-ruff_0.16.8.bb
rename to meta-python/recipes-devtools/python/python3-ruff_0.17.1.bb
index 38151a5bd3..0028b6ede3 100644
--- a/meta-python/recipes-devtools/python/python3-ruff_0.16.8.bb
+++ b/meta-python/recipes-devtools/python/python3-ruff_0.17.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e679ca4f742cbfa29ab6a499529c2d39"

 DEPENDS += "python3-maturin-native"

-SRC_URI[sha256sum] = "9247bf92b5f04d825c8639a4fe423ec2e4222acd9222e58412b0dab7e442798b"
+SRC_URI[sha256sum] = "5bb796c5112e9fb9527f2ef2faa0a130d6312d19de92bcfaddd70dbb2d41020f"

 inherit pypi python_setuptools3_rust cargo-update-recipe-crates

