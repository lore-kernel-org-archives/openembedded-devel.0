Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167EBC982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 14:26:31 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12348.1789741581243959905
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2026 07:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=WhHC1cqm;
 spf=pass (domain: snapchat.com, ip: 74.125.225.141, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d8239so6147275e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2026 07:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1789741579; x=1790346379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ep1CSbxWMJ0Do07bYJt4Dw7jK7rCTuDtSCcRXDGClz4=;
        b=WhHC1cqm6ZUoaIQZTfMl3AsV67g6S0gxfxAi5+J8tBpXLVA2KJwY2JNhPDnGgFMeWS
         XiPqtDc49VbG/zpxFAStlR3aimbTj9QXHOTdl86fBvt/NVER1Bb1CcYiAPaDHre3nQSW
         nRVfhdIbDKI+yMhOkKXjvrmQJipksofP5EAY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741579; x=1790346379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ep1CSbxWMJ0Do07bYJt4Dw7jK7rCTuDtSCcRXDGClz4=;
        b=fjB6z0+TJ1drgbpFZqJOY70zcFdRCD3om8RxqxUlHxo88+glOJyJoMtZ04SCvs6SnI
         TINAW3e72p50w64DRoUeIWmddFHMbE/C+aq8jH9Hd3+KhiwL2Du3rdLB/yo1+4Rf77ri
         4hdXq0kwSNjbEooei6EuEXgqaa3NEgfiHL293S9DoDRnwhIm2APcHW9LaqOz4BPpihp6
         TuNuGBwxnlOmt3nnZvUTfiTso4mZwZ9QB0OXt0tQB6c29M3s5+irp1SJozKbGvLNLzjs
         jvLRBs2jCgEPydUSVl/ORNxoRbtptF6+KuNvDiGz+Yi1/z5wSB3ZSNeUgvE8UEtCj3Ie
         09QA==
X-Gm-Message-State: AFuF++n6qrtWTRj5Af831LhnNekiQ4R2Hh5Df32HDqDBEAVQQ5X/qK8n
	GG1giRDrbHBhVVeFayeOQafah8q6ZAU9gtrwP1c0R5Syzq4E0Woq6etkaTd5tn6qBcDabctTUyr
	6vjDey/c=
X-Gm-Gg: AYBFou2dJL8/AoNBaIVn0FUc+r7CDQGwY+pRLhCBppvtVRlD+XTXeh23BVTzSnqhwhR
	4ssefbsa39iF/Oqi40IJa1W1GtqdwnkYAn098ctyOS7BmzSyKDBcYvcyhu767a5HdiB5RbhJYCa
	Sj4KsXCBBfiSgfdNnX1TpAIhY/6zF1OvWqCeCK+vEIxlsLcWtkHzi2tsiPTJSNXFqcHhkJo5s/k
	6rQsXOGIHTa5+bFZUkSHH+gqnghTZCRv2iWbZyLJpqLe8hHROHDvMmwyz+E5gyN0s9tM7GYcaNw
	VJg9aQe7E9ZaBlzS9wFjZNoOqYhEcYZDBpz99duuU2Pxcm6VKHgZVO4uf4Mha5G3GGc233JbyxW
	5UGZH3+LWk/+/vj5OBBpPpXkD70dOnmgMZuIKe4ZiYSXCNBpkHVSmscyTB2Pa7qG65YX0Lf6W3L
	Vs034kTlHNwvV3vTI6o/uUrITcAHqBp7SoxQFOBrpPiXZP5LGtSmdAdaF/GzoS9SXiY6cDdx80J
	zpkdQJnnYEZZNYL79lVa5a4ZZeEmLJkZhynKwH6+A==
X-Received: by 2002:a05:600c:548c:b0:49c:fa21:1c7e with SMTP id 5b1f17b1804b1-49fc5734e52mr36591255e9.19.1789741578258;
        Fri, 18 Sep 2026 07:26:18 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc57547easm49648235e9.3.2026.09.18.07.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:26:17 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH] uutils-coreutils: upgrade 0.11.0 -> 0.12.0
Date: Fri, 18 Sep 2026 16:26:14 +0200
Message-ID: <20260918142614.2229105-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2026 14:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130115

From: Etienne Cordonnier <ecordonnier@snap.com>

See release notes at https://github.com/uutils/coreutils/releases/tag/0.12.0

AI-Generated: Uses Claude Code (Claude Sonnet 5)
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 .../uutils-coreutils-crates.inc               | 458 +++++++++---------
 ...s_0.11.0.bb => uutils-coreutils_0.12.0.bb} |   2 +-
 2 files changed, 225 insertions(+), 235 deletions(-)
 rename meta-oe/recipes-core/uutils-coreutils/{uutils-coreutils_0.11.0.bb => uutils-coreutils_0.12.0.bb} (98%)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
index 621ad27e9e..17077e7c8f 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
@@ -17,9 +17,12 @@ SRC_URI += " \
     crate://crates.io/ariadne/0.6.0 \
     crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/autocfg/1.5.1 \
+    crate://crates.io/aws-lc-sys/0.41.0 \
     crate://crates.io/base64-simd/0.8.0 \
     crate://crates.io/bigdecimal/0.4.10 \
     crate://crates.io/bindgen/0.72.1 \
+    crate://crates.io/bit-set/0.8.0 \
+    crate://crates.io/bit-vec/0.8.0 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/bitflags/2.13.1 \
     crate://crates.io/bitvec/1.1.1 \
@@ -32,18 +35,19 @@ SRC_URI += " \
     crate://crates.io/bytecount/0.6.9 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/calendrical_calculations/0.2.4 \
-    crate://crates.io/cc/1.4.3 \
+    crate://crates.io/cc/1.4.4 \
     crate://crates.io/cexpr/0.6.0 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/cfg_aliases/0.2.2 \
-    crate://crates.io/chacha20/0.10.1 \
+    crate://crates.io/chacha20/0.10.2 \
     crate://crates.io/chrono/0.4.45 \
     crate://crates.io/clang-sys/1.9.1 \
-    crate://crates.io/clap/4.6.6 \
-    crate://crates.io/clap_builder/4.6.6 \
-    crate://crates.io/clap_complete/4.6.9 \
+    crate://crates.io/clap/4.6.7 \
+    crate://crates.io/clap_builder/4.6.7 \
+    crate://crates.io/clap_complete/4.6.11 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/clap_mangen/0.3.3 \
+    crate://crates.io/cmake/0.1.58 \
     crate://crates.io/codspeed/5.0.1 \
     crate://crates.io/codspeed-divan-compat/5.0.1 \
     crate://crates.io/codspeed-divan-compat-macros/5.0.1 \
@@ -57,11 +61,11 @@ SRC_URI += " \
     crate://crates.io/constant_time_eq/0.4.2 \
     crate://crates.io/core-foundation-sys/0.8.7 \
     crate://crates.io/core_maths/0.1.1 \
-    crate://crates.io/cpufeatures/0.3.0 \
+    crate://crates.io/cpufeatures/0.3.1 \
     crate://crates.io/crc/3.3.0 \
     crate://crates.io/crc-catalog/2.5.0 \
     crate://crates.io/crc-fast/1.9.0 \
-    crate://crates.io/crc32fast/1.5.0 \
+    crate://crates.io/crc32fast/1.5.1 \
     crate://crates.io/crossbeam-deque/0.8.7 \
     crate://crates.io/crossbeam-epoch/0.9.20 \
     crate://crates.io/crossbeam-utils/0.8.22 \
@@ -89,16 +93,17 @@ SRC_URI += " \
     crate://crates.io/dns-lookup/4.0.1 \
     crate://crates.io/document-features/0.2.12 \
     crate://crates.io/dunce/1.0.5 \
-    crate://crates.io/either/1.17.0 \
+    crate://crates.io/either/1.18.0 \
     crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/errno/0.3.14 \
+    crate://crates.io/fancy-regex/0.19.2 \
     crate://crates.io/fastrand/2.5.0 \
     crate://crates.io/filedescriptor/0.8.3 \
     crate://crates.io/filetime/0.2.29 \
     crate://crates.io/find-msvc-tools/0.1.11 \
     crate://crates.io/fixed_decimal/0.7.2 \
-    crate://crates.io/flate2/1.1.9 \
+    crate://crates.io/flate2/1.1.10 \
     crate://crates.io/fluent/0.17.0 \
     crate://crates.io/fluent-bundle/0.16.0 \
     crate://crates.io/fluent-langneg/0.13.1 \
@@ -108,13 +113,11 @@ SRC_URI += " \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/fs_extra/1.3.0 \
     crate://crates.io/fsevent-sys/4.1.0 \
-    crate://crates.io/fts-sys/0.2.17 \
     crate://crates.io/funty/2.0.0 \
-    crate://crates.io/futures-core/0.3.33 \
-    crate://crates.io/futures-macro/0.3.33 \
-    crate://crates.io/futures-task/0.3.33 \
+    crate://crates.io/futures-core/0.3.34 \
+    crate://crates.io/futures-task/0.3.34 \
     crate://crates.io/futures-timer/3.0.4 \
-    crate://crates.io/futures-util/0.3.33 \
+    crate://crates.io/futures-util/0.3.34 \
     crate://crates.io/gcd/2.3.0 \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/getrandom/0.2.17 \
@@ -152,11 +155,13 @@ SRC_URI += " \
     crate://crates.io/icu_properties/2.3.0 \
     crate://crates.io/icu_properties_data/2.3.0 \
     crate://crates.io/icu_provider/2.3.1 \
+    crate://crates.io/icu_segmenter/2.3.0 \
+    crate://crates.io/icu_segmenter_data/2.3.0 \
     crate://crates.io/icu_time/2.3.0 \
     crate://crates.io/icu_time_data/2.3.0 \
-    crate://crates.io/indexmap/2.14.0 \
+    crate://crates.io/indexmap/2.14.1 \
     crate://crates.io/indicatif/0.18.6 \
-    crate://crates.io/inotify/0.11.4 \
+    crate://crates.io/inotify/0.11.5 \
     crate://crates.io/inotify-sys/0.1.8 \
     crate://crates.io/intl-memoizer/0.5.3 \
     crate://crates.io/intl_pluralrules/7.0.2 \
@@ -165,14 +170,15 @@ SRC_URI += " \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itertools/0.15.0 \
     crate://crates.io/itoa/1.0.18 \
-    crate://crates.io/jiff/0.2.35 \
+    crate://crates.io/jiff/0.2.37 \
     crate://crates.io/jiff-core/0.1.0 \
     crate://crates.io/jiff-icu/0.2.2 \
-    crate://crates.io/jiff-static/0.2.35 \
+    crate://crates.io/jiff-static/0.2.37 \
     crate://crates.io/jiff-tzdb/0.1.8 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
-    crate://crates.io/js-sys/0.3.103 \
-    crate://crates.io/keccak/0.2.1 \
+    crate://crates.io/jobserver/0.1.35 \
+    crate://crates.io/js-sys/0.3.104 \
+    crate://crates.io/keccak/0.2.2 \
     crate://crates.io/kqueue/1.2.1 \
     crate://crates.io/kqueue-sys/1.1.2 \
     crate://crates.io/libc/0.2.189 \
@@ -181,18 +187,17 @@ SRC_URI += " \
     crate://crates.io/link-section/0.19.3 \
     crate://crates.io/linktime-proc-macro/0.2.3 \
     crate://crates.io/linux-raw-sys/0.12.1 \
-    crate://crates.io/litemap/0.8.2 \
+    crate://crates.io/litemap/0.8.3 \
     crate://crates.io/litrs/1.0.0 \
     crate://crates.io/lock_api/0.4.14 \
-    crate://crates.io/log/0.4.33 \
+    crate://crates.io/log/0.4.34 \
     crate://crates.io/lru/0.16.4 \
     crate://crates.io/lscolors/0.21.0 \
     crate://crates.io/md-5/0.11.0 \
     crate://crates.io/memchr/2.8.3 \
     crate://crates.io/memmap2/0.9.11 \
-    crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/miniz_oxide/0.8.9 \
+    crate://crates.io/miniz_oxide/0.9.1 \
     crate://crates.io/mio/1.2.2 \
     crate://crates.io/nix/0.31.3 \
     crate://crates.io/nom/7.1.3 \
@@ -202,7 +207,7 @@ SRC_URI += " \
     crate://crates.io/nu-ansi-term/0.50.3 \
     crate://crates.io/num-bigint/0.4.8 \
     crate://crates.io/num-conv/0.2.2 \
-    crate://crates.io/num-integer/0.1.46 \
+    crate://crates.io/num-integer/0.1.47 \
     crate://crates.io/num-modular/0.6.1 \
     crate://crates.io/num-prime/0.5.0 \
     crate://crates.io/num-traits/0.2.19 \
@@ -211,8 +216,6 @@ SRC_URI += " \
     crate://crates.io/objc2-encode/4.1.0 \
     crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/once_cell_polyfill/1.70.2 \
-    crate://crates.io/onig/6.5.3 \
-    crate://crates.io/onig_sys/69.9.3 \
     crate://crates.io/openssl/0.10.81 \
     crate://crates.io/openssl-macros/0.1.1 \
     crate://crates.io/openssl-src/300.6.1+3.6.3 \
@@ -228,11 +231,11 @@ SRC_URI += " \
     crate://crates.io/phf_generator/0.14.0 \
     crate://crates.io/phf_shared/0.14.0 \
     crate://crates.io/pin-project-lite/0.2.17 \
-    crate://crates.io/pkg-config/0.3.33 \
-    crate://crates.io/platform-info/2.1.0 \
-    crate://crates.io/portable-atomic/1.14.0 \
+    crate://crates.io/pkg-config/0.3.34 \
+    crate://crates.io/platform-info/2.2.0 \
+    crate://crates.io/portable-atomic/1.15.0 \
     crate://crates.io/portable-atomic-util/0.2.7 \
-    crate://crates.io/potential_utf/0.1.5 \
+    crate://crates.io/potential_utf/0.1.6 \
     crate://crates.io/powerfmt/0.2.0 \
     crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/pretty_assertions/1.4.1 \
@@ -244,7 +247,7 @@ SRC_URI += " \
     crate://crates.io/quote/1.0.47 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/radium/0.7.0 \
-    crate://crates.io/rand/0.8.7 \
+    crate://crates.io/rand/0.8.8 \
     crate://crates.io/rand/0.10.2 \
     crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_chacha/0.10.0 \
@@ -260,8 +263,8 @@ SRC_URI += " \
     crate://crates.io/relative-path/1.9.3 \
     crate://crates.io/rlimit/0.11.0 \
     crate://crates.io/roff/1.1.1 \
-    crate://crates.io/rstest/0.26.1 \
-    crate://crates.io/rstest_macros/0.26.1 \
+    crate://crates.io/rstest/0.27.0 \
+    crate://crates.io/rstest_macros/0.27.0 \
     crate://crates.io/rstest_reuse/0.7.0 \
     crate://crates.io/rust-ini/0.21.3 \
     crate://crates.io/rustc-hash/2.1.3 \
@@ -298,15 +301,14 @@ SRC_URI += " \
     crate://crates.io/sponge-cursor/0.1.0 \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/statrs/0.18.0 \
-    crate://crates.io/string-interner/0.20.0 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/2.0.119 \
-    crate://crates.io/syn/3.0.3 \
-    crate://crates.io/synstructure/0.13.2 \
+    crate://crates.io/syn/3.0.4 \
+    crate://crates.io/synstructure/0.14.0 \
     crate://crates.io/tap/1.0.1 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
-    crate://crates.io/textwrap/0.16.2 \
+    crate://crates.io/textwrap/0.16.4 \
     crate://crates.io/thiserror/1.0.69 \
     crate://crates.io/thiserror/2.0.20 \
     crate://crates.io/thiserror-impl/1.0.69 \
@@ -325,7 +327,6 @@ SRC_URI += " \
     crate://crates.io/unic-langid/0.9.6 \
     crate://crates.io/unic-langid-impl/0.9.6 \
     crate://crates.io/unicode-ident/1.0.24 \
-    crate://crates.io/unicode-linebreak/0.1.5 \
     crate://crates.io/unicode-width/0.1.14 \
     crate://crates.io/unicode-width/0.2.2 \
     crate://crates.io/unindent/0.2.4 \
@@ -341,10 +342,10 @@ SRC_URI += " \
     crate://crates.io/vsimd/0.8.0 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
-    crate://crates.io/wasm-bindgen/0.2.126 \
-    crate://crates.io/wasm-bindgen-macro/0.2.126 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.126 \
-    crate://crates.io/wasm-bindgen-shared/0.2.126 \
+    crate://crates.io/wasm-bindgen/0.2.127 \
+    crate://crates.io/wasm-bindgen-macro/0.2.127 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.127 \
+    crate://crates.io/wasm-bindgen-shared/0.2.127 \
     crate://crates.io/web-time/1.1.0 \
     crate://crates.io/wild/2.2.1 \
     crate://crates.io/winapi/0.3.9 \
@@ -357,26 +358,16 @@ SRC_URI += " \
     crate://crates.io/windows-link/0.2.1 \
     crate://crates.io/windows-result/0.4.1 \
     crate://crates.io/windows-strings/0.5.1 \
-    crate://crates.io/windows-sys/0.59.0 \
     crate://crates.io/windows-sys/0.60.2 \
     crate://crates.io/windows-sys/0.61.2 \
-    crate://crates.io/windows-targets/0.52.6 \
     crate://crates.io/windows-targets/0.53.5 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
     crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
-    crate://crates.io/windows_aarch64_msvc/0.52.6 \
     crate://crates.io/windows_aarch64_msvc/0.53.1 \
-    crate://crates.io/windows_i686_gnu/0.52.6 \
     crate://crates.io/windows_i686_gnu/0.53.1 \
-    crate://crates.io/windows_i686_gnullvm/0.52.6 \
     crate://crates.io/windows_i686_gnullvm/0.53.1 \
-    crate://crates.io/windows_i686_msvc/0.52.6 \
     crate://crates.io/windows_i686_msvc/0.53.1 \
-    crate://crates.io/windows_x86_64_gnu/0.52.6 \
     crate://crates.io/windows_x86_64_gnu/0.53.1 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
     crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
-    crate://crates.io/windows_x86_64_msvc/0.52.6 \
     crate://crates.io/windows_x86_64_msvc/0.53.1 \
     crate://crates.io/winnow/1.0.4 \
     crate://crates.io/write16/1.0.0 \
@@ -385,14 +376,14 @@ SRC_URI += " \
     crate://crates.io/xattr/1.6.1 \
     crate://crates.io/yansi/1.0.1 \
     crate://crates.io/yoke/0.8.3 \
-    crate://crates.io/yoke-derive/0.8.2 \
+    crate://crates.io/yoke-derive/0.8.3 \
     crate://crates.io/z85/3.0.7 \
     crate://crates.io/zerocopy/0.7.35 \
     crate://crates.io/zerocopy/0.8.56 \
     crate://crates.io/zerocopy-derive/0.7.35 \
     crate://crates.io/zerocopy-derive/0.8.56 \
     crate://crates.io/zerofrom/0.1.8 \
-    crate://crates.io/zerofrom-derive/0.1.7 \
+    crate://crates.io/zerofrom-derive/0.1.8 \
     crate://crates.io/zerotrie/0.2.5 \
     crate://crates.io/zerovec/0.11.8 \
     crate://crates.io/zerovec-derive/0.11.6 \
@@ -417,9 +408,12 @@ SRC_URI[approx-0.5.1.sha256sum] = "cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684
 SRC_URI[ariadne-0.6.0.sha256sum] = "8454c8a44ce2cb9cc7e7fae67fc6128465b343b92c6631e94beca3c8d1524ea5"
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
 SRC_URI[autocfg-1.5.1.sha256sum] = "f2032f911046de80f0a198e0901378627c33f59ea0ac00e363d481118bd70a53"
+SRC_URI[aws-lc-sys-0.41.0.sha256sum] = "1a2f9779ce85b93ab6170dd940ad0169b5766ff848247aff13bb788b832fe3f4"
 SRC_URI[base64-simd-0.8.0.sha256sum] = "339abbe78e73178762e23bea9dfd08e697eb3f3301cd4be981c0f78ba5859195"
 SRC_URI[bigdecimal-0.4.10.sha256sum] = "4d6867f1565b3aad85681f1015055b087fcfd840d6aeee6eee7f2da317603695"
 SRC_URI[bindgen-0.72.1.sha256sum] = "993776b509cfb49c750f11b8f07a46fa23e0a1386ffc01fb1e7d343efc387895"
+SRC_URI[bit-set-0.8.0.sha256sum] = "08807e080ed7f9d5433fa9b275196cfc35414f66a0c79d864dc51a0d825231a3"
+SRC_URI[bit-vec-0.8.0.sha256sum] = "5e764a1d40d510daf35e07be9eb06e75770908c27d411ee6c92109c9840eaaf7"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[bitflags-2.13.1.sha256sum] = "b588b76d00fde79687d7646a9b5bdf3cc0f655e0bbd080335a95d7e96f3587da"
 SRC_URI[bitvec-1.1.1.sha256sum] = "ddcec3d12c579d40898fe0a9a358a803c23e9c52ca3c425707f81c9436211837"
@@ -432,18 +426,19 @@ SRC_URI[bumpalo-3.20.3.sha256sum] = "72f5acc6cb2ba439de613abc23857ec3d78374d8ed5
 SRC_URI[bytecount-0.6.9.sha256sum] = "175812e0be2bccb6abe50bb8d566126198344f707e304f45c648fd8f2cc0365e"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[calendrical_calculations-0.2.4.sha256sum] = "5abbd6eeda6885048d357edc66748eea6e0268e3dd11f326fff5bd248d779c26"
-SRC_URI[cc-1.4.3.sha256sum] = "509591b7bcd67f4ef775afad7662703b4935daaa6ec0e5605cfb1090b32a2b6d"
+SRC_URI[cc-1.4.4.sha256sum] = "0ad534f4357a5264cce5019c989cf66a4f0dc4e0d1b1d15f8aacec0ff7360273"
 SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[cfg_aliases-0.2.2.sha256sum] = "f079e83a288787bcd14a6aea84cee5c87a67c5a3e660c30f557a3d24761b3527"
-SRC_URI[chacha20-0.10.1.sha256sum] = "d524456ba66e72eb8b115ff89e01e497f8e6d11d78b70b1aa13c0fbd97540a81"
+SRC_URI[chacha20-0.10.2.sha256sum] = "65c35e4b699c7e15ccbe7ee35c005e4fc0a278d22238a2857e6ce2dadeda1b06"
 SRC_URI[chrono-0.4.45.sha256sum] = "1aa79e62e7697b8e29b513a68abacf485adcd1fe8284a4316c5ae868e6633327"
 SRC_URI[clang-sys-1.9.1.sha256sum] = "157a8ba7b480713b56f4c09fd13fc3e0a22a5dfab8097ba61cbc5feef950788a"
-SRC_URI[clap-4.6.6.sha256sum] = "473c7e07f409a8d772161724aa8db6a765a2532a70f9667eeb7b49d3d02fbdca"
-SRC_URI[clap_builder-4.6.6.sha256sum] = "7b48fea5a88e9ae728a2dcbedbfc0e730f7d60da42e1cb049a83c9fb8b789889"
-SRC_URI[clap_complete-4.6.9.sha256sum] = "3be2ad0423bdbbb0e25bc89add796f3559706d4a95e1bc98e4d9662a957b6a19"
+SRC_URI[clap-4.6.7.sha256sum] = "aa8876b300ab35ba921adea3dfd70157a46249b33f95c9084ae5709785478946"
+SRC_URI[clap_builder-4.6.7.sha256sum] = "ec0797fb7aeb1406c84efac526901f7ec3ead2124f946b494e72879d4b54704d"
+SRC_URI[clap_complete-4.6.11.sha256sum] = "037e2a1a92236d0aff7e845093f64661d6df4c02c9fcc61a60e9e1d736fa392f"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[clap_mangen-0.3.3.sha256sum] = "211d617eaa4b735c96c9e0228fcbdb5120ef623f2b8cb67ffb84c3e02dbc28a4"
+SRC_URI[cmake-0.1.58.sha256sum] = "c0f78a02292a74a88ac736019ab962ece0bc380e3f977bf72e376c5d78ff0678"
 SRC_URI[codspeed-5.0.1.sha256sum] = "7083f253260bcb4aaa3b4aa4c52973703dabc1a85c2f193997e2689aafa8a919"
 SRC_URI[codspeed-divan-compat-5.0.1.sha256sum] = "bc1065d507e1cbab731a7976db4cef7e47e49b87b4dbc0a925df07d343558420"
 SRC_URI[codspeed-divan-compat-macros-5.0.1.sha256sum] = "2fd05482a95823ffe421e8a9ba24fa22a6a30d594e2c60455cbb43a41bf2d8fa"
@@ -457,11 +452,11 @@ SRC_URI[const-random-macro-0.1.16.sha256sum] = "f9d839f2a20b0aee515dc581a6172f23
 SRC_URI[constant_time_eq-0.4.2.sha256sum] = "3d52eff69cd5e647efe296129160853a42795992097e8af39800e1060caeea9b"
 SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
 SRC_URI[core_maths-0.1.1.sha256sum] = "77745e017f5edba1a9c1d854f6f3a52dac8a12dd5af5d2f54aecf61e43d80d30"
-SRC_URI[cpufeatures-0.3.0.sha256sum] = "8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201"
+SRC_URI[cpufeatures-0.3.1.sha256sum] = "5ca28b0ae3115b884660db4118d803791fd6756b6e88f39c0f3f7859060d7566"
 SRC_URI[crc-3.3.0.sha256sum] = "9710d3b3739c2e349eb44fe848ad0b7c8cb1e42bd87ee49371df2f7acaf3e675"
 SRC_URI[crc-catalog-2.5.0.sha256sum] = "217698eaf96b4a3f0bc4f3662aaa55bdf913cd54d7204591faa790070c6d0853"
 SRC_URI[crc-fast-1.9.0.sha256sum] = "2fd92aca2c6001b1bf5ba0ff84ee74ec8501b52bbef0cac80bf25a6c1d87a83d"
-SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
+SRC_URI[crc32fast-1.5.1.sha256sum] = "8498c871161e1742aaa9d52551b2d6ebdd4c3d45a3be423e3728f33b955be550"
 SRC_URI[crossbeam-deque-0.8.7.sha256sum] = "5181e0de7b61eb03a81e347d6dd8797bae9da5146707b51077e2d71a54ec0ceb"
 SRC_URI[crossbeam-epoch-0.9.20.sha256sum] = "2d6914041f254d6e9176c01941b21115dcfb7089e55135a35411081bd106ef3f"
 SRC_URI[crossbeam-utils-0.8.22.sha256sum] = "61803da095bee82a81bb1a452ecc25d3b2f1416d1897eb86430c6159ef717c17"
@@ -489,16 +484,17 @@ SRC_URI[dlv-list-0.5.2.sha256sum] = "442039f5147480ba31067cb00ada1adae6892028e40
 SRC_URI[dns-lookup-4.0.1.sha256sum] = "6120e7e5dcd1c90098e349def389e2797377cdbe6b465ad8fdd115c0c99d5cf2"
 SRC_URI[document-features-0.2.12.sha256sum] = "d4b8a88685455ed29a21542a33abd9cb6510b6b129abadabdcef0f4c55bc8f61"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
-SRC_URI[either-1.17.0.sha256sum] = "9e5e8f6c15a24b9a3ee5efec809ccd006d3b30e8b3bb63c39af737c7f87daa1d"
+SRC_URI[either-1.18.0.sha256sum] = "252afb9ae5eaa683babdc6a068b3f5726eb19e05070c731f9b2a23a7c3e8ed34"
 SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
+SRC_URI[fancy-regex-0.19.2.sha256sum] = "d301f5bf187b3c295fce6468d3875037a0bccc5f6b151c63cac2f85babf21912"
 SRC_URI[fastrand-2.5.0.sha256sum] = "da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223"
 SRC_URI[filedescriptor-0.8.3.sha256sum] = "e40758ed24c9b2eeb76c35fb0aebc66c626084edd827e07e1552279814c6682d"
 SRC_URI[filetime-0.2.29.sha256sum] = "5c287a33c7f0a620c38e641e7f60827713987b3c0f26e8ddc9462cc69cf75759"
 SRC_URI[find-msvc-tools-0.1.11.sha256sum] = "d45db016d36b838f563236e9193d0ee6ce38f3f68b6c94e914b4929c96bbb890"
 SRC_URI[fixed_decimal-0.7.2.sha256sum] = "79c3c892f121fff406e5dd6b28c1b30096b95111c30701a899d4f2b18da6d1bd"
-SRC_URI[flate2-1.1.9.sha256sum] = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
+SRC_URI[flate2-1.1.10.sha256sum] = "6e634e2e0ebac1ee034020da1ca582e17ffe4e0f5e985823721e168928136dcb"
 SRC_URI[fluent-0.17.0.sha256sum] = "8137a6d5a2c50d6b0ebfcb9aaa91a28154e0a70605f112d30cb0cd4a78670477"
 SRC_URI[fluent-bundle-0.16.0.sha256sum] = "01203cb8918f5711e73891b347816d932046f95f54207710bda99beaeb423bf4"
 SRC_URI[fluent-langneg-0.13.1.sha256sum] = "7eebbe59450baee8282d71676f3bfed5689aeab00b27545e83e5f14b1195e8b0"
@@ -508,13 +504,11 @@ SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[fs_extra-1.3.0.sha256sum] = "42703706b716c37f96a77aea830392ad231f44c9e9a67872fa5548707e11b11c"
 SRC_URI[fsevent-sys-4.1.0.sha256sum] = "76ee7a02da4d231650c7cea31349b889be2f45ddb3ef3032d2ec8185f6313fd2"
-SRC_URI[fts-sys-0.2.17.sha256sum] = "9c03259139c9b098dd92241b046fedfeebcd6b000d491c821b24ced28558a9c2"
 SRC_URI[funty-2.0.0.sha256sum] = "e6d5a32815ae3f33302d95fdcb2ce17862f8c65363dcfd29360480ba1001fc9c"
-SRC_URI[futures-core-0.3.33.sha256sum] = "2cd50c473c80f6d7c3670a752354b8e569b1a7cbfdc0419ec88e5edad85e0dc7"
-SRC_URI[futures-macro-0.3.33.sha256sum] = "2d6d3cde68c518367be28956066ddfef33813991b77a55005a69dae04bf3b10b"
-SRC_URI[futures-task-0.3.33.sha256sum] = "b231ed28831efb4a61a08580c4bc233ec56bc009f4cd8f52da2c3cb97df0c109"
+SRC_URI[futures-core-0.3.34.sha256sum] = "92d699e522242e69e3003b94ecc1f960f3a5e015aa7c5d7486e65ad01dd94f5e"
+SRC_URI[futures-task-0.3.34.sha256sum] = "cd417de3d1d015fc3bfd2b1ea46dfc7bab72ef86f1cc7cc9c78e728b34a6d1fd"
 SRC_URI[futures-timer-3.0.4.sha256sum] = "af43fadb8a98512d547e37b4e92e0ced13e205c061b87b4623eff01d918d6968"
-SRC_URI[futures-util-0.3.33.sha256sum] = "a77a90a256fce34da66415271e30f94ee91c57b04b8a2c042d9cf3220179deaa"
+SRC_URI[futures-util-0.3.34.sha256sum] = "0d50a92467f8ba5dd6e3ee5d4bd04d73ab2e4e1c44474a0674821dfce14b79bc"
 SRC_URI[gcd-2.3.0.sha256sum] = "1d758ba1b47b00caf47f24925c0074ecb20d6dfcffe7f6d53395c0465674841a"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.2.17.sha256sum] = "ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0"
@@ -552,11 +546,13 @@ SRC_URI[icu_plurals_data-2.3.0.sha256sum] = "1251aa39a95e1333888e499b1263e1c1964
 SRC_URI[icu_properties-2.3.0.sha256sum] = "7e7ca276ad3145661a65914e6daf131ca5120cd3dcee8f8f3214b8875184a148"
 SRC_URI[icu_properties_data-2.3.0.sha256sum] = "e590f038c1464a96894fd6d10127e90a8be4509f56ff7ecef851b15cee0b7caa"
 SRC_URI[icu_provider-2.3.1.sha256sum] = "d27bbb9d3abbefac45d55f647c9de1d44aafcd1186eb91879afef17c396c3e73"
+SRC_URI[icu_segmenter-2.3.0.sha256sum] = "82d07aafccd67af15d02512a6adf5896fbc5ed00f2e99b471d2efa14016db3db"
+SRC_URI[icu_segmenter_data-2.3.0.sha256sum] = "ae293c039020f9ec10710af98d29ce6aa2051486638b49c9a6409f3b4a9e98ad"
 SRC_URI[icu_time-2.3.0.sha256sum] = "af37e1c3b9f3ab564b619fdf4b22de169f6381eb0f7048e3ca454290c438126b"
 SRC_URI[icu_time_data-2.3.0.sha256sum] = "005ff86fa5851a77fc0a977b72d717f777bd9230415a247219d7898aefb1517a"
-SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
+SRC_URI[indexmap-2.14.1.sha256sum] = "07aa2048142242915a31d35844fb311e0e53fcca590c3a0a40dcf1b841fa09eb"
 SRC_URI[indicatif-0.18.6.sha256sum] = "9433806cd6b4ec1aba79c021c7e4c58fb4c3b9977c085062e611ac929998fb0c"
-SRC_URI[inotify-0.11.4.sha256sum] = "153be1941a183ec9ccd095ddbe17a8b8d435ef6c76e9e02451b933c3999af2c8"
+SRC_URI[inotify-0.11.5.sha256sum] = "4cc00ea907cab49550b7da656f80ebb97be1b997d931fbcd28d39734e17ce592"
 SRC_URI[inotify-sys-0.1.8.sha256sum] = "c033f80b2c113cdf91ab7a33faa9cbc014726dcad99880c8609af2a370edf37d"
 SRC_URI[intl-memoizer-0.5.3.sha256sum] = "310da2e345f5eb861e7a07ee182262e94975051db9e4223e909ba90f392f163f"
 SRC_URI[intl_pluralrules-7.0.2.sha256sum] = "078ea7b7c29a2b4df841a7f6ac8775ff6074020c6776d48491ce2268e068f972"
@@ -565,14 +561,15 @@ SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c08819
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itertools-0.15.0.sha256sum] = "8b4baf93f58d4425749ca49a51c50ebab072c5df6994d08fed93541c331481dc"
 SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
-SRC_URI[jiff-0.2.35.sha256sum] = "668b7183bd07af9a4885f5c35b0cc5c83c4607a913c16b7e17291832910d2dcc"
+SRC_URI[jiff-0.2.37.sha256sum] = "0ab1baf72f08796de0260609515130699b890ac25f30e610ad894bc5856cafdb"
 SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09"
 SRC_URI[jiff-icu-0.2.2.sha256sum] = "0e67c2beaae8b10a82d849b9aabb698a43a682f32b17bcdc035d5ecadb44d646"
-SRC_URI[jiff-static-0.2.35.sha256sum] = "3a69dcb3a21cfb32ce1cd056169337ca284af0766dd766e7878819b251a49204"
+SRC_URI[jiff-static-0.2.37.sha256sum] = "378268a1116ad67ae6228701118ac9f491d78fda38a40a1f1a9e1348de6f7212"
 SRC_URI[jiff-tzdb-0.1.8.sha256sum] = "142bd39932ad231f10513df9ab62661fead8719872150b7ad02a2df79f4e141e"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
-SRC_URI[js-sys-0.3.103.sha256sum] = "53b44bfcdb3f8d5837a46dae1ca9660a837176eee74a28b229bc626816589102"
-SRC_URI[keccak-0.2.1.sha256sum] = "ffd9697dc4a9a62e2da93389f34400b77a28f0287711263cabb203b3ccb9c0e4"
+SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3"
+SRC_URI[js-sys-0.3.104.sha256sum] = "0e0c1080212aad755ea003d18543e8768dd432c48819efd73a7bf1e39b7a5a3a"
+SRC_URI[keccak-0.2.2.sha256sum] = "d8f198d1db720e4940b5a493201d199d9f24f568f8f746bd13706243a2f71598"
 SRC_URI[kqueue-1.2.1.sha256sum] = "8d763e5b24120b4ddf50de6c92308156765aabfbbccebf401da7cff2d70a41ea"
 SRC_URI[kqueue-sys-1.1.2.sha256sum] = "07293a4e297ac234359b510362495713f75ea345d5307140414f20c69ffeb087"
 SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
@@ -581,18 +578,17 @@ SRC_URI[libm-0.2.16.sha256sum] = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85a
 SRC_URI[link-section-0.19.3.sha256sum] = "39c29a617ce3df32c08497bdc1ab6e2376e0b17948ac166a2fbe5977c5954cd9"
 SRC_URI[linktime-proc-macro-0.2.3.sha256sum] = "7e57c38c1e860fd37c604281cdfb1dd2216977fd76a50f85ba2f388ef3219616"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
-SRC_URI[litemap-0.8.2.sha256sum] = "92daf443525c4cce67b150400bc2316076100ce0b3686209eb8cf3c31612e6f0"
+SRC_URI[litemap-0.8.3.sha256sum] = "47d9d19d1d6efa0109d2f65ff4c85cddd50bd572e5a00127ab10987290bcefae"
 SRC_URI[litrs-1.0.0.sha256sum] = "11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9db1621bafc7ed66e35ff9fe092"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
-SRC_URI[log-0.4.33.sha256sum] = "0ceec5bc11778974d1bcb055b18002eba7f4b3518b6a0081b3af5f21666da9ad"
+SRC_URI[log-0.4.34.sha256sum] = "f9f8bd3e56ce4dfc153cf470fffbfa98c7620958b312ca5c3a4b8d5181fd13c6"
 SRC_URI[lru-0.16.4.sha256sum] = "7f66e8d5d03f609abc3a39e6f08e4164ebf1447a732906d39eb9b99b7919ef39"
 SRC_URI[lscolors-0.21.0.sha256sum] = "d60e266dfb1426eb2d24792602e041131fdc0236bb7007abc0e589acafd60929"
 SRC_URI[md-5-0.11.0.sha256sum] = "69b6441f590336821bb897fb28fc622898ccceb1d6cea3fde5ea86b090c4de98"
 SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
 SRC_URI[memmap2-0.9.11.sha256sum] = "d1219ed1b7f229ee7104d281dd01d6802fe28bb6e95d292942c4daacdeb798c0"
-SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
-SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
+SRC_URI[miniz_oxide-0.9.1.sha256sum] = "b63fbc4a50860e98e7b2aa7804ded1db5cbc3aff9193adaff57a6931bf7c4b4c"
 SRC_URI[mio-1.2.2.sha256sum] = "30d65c71f1ce40ab09135ce117d742b9f8a19ff91a41a8b57ed50bc2de59c427"
 SRC_URI[nix-0.31.3.sha256sum] = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
@@ -602,7 +598,7 @@ SRC_URI[notify-types-2.1.0.sha256sum] = "42b8cfee0e339a0337359f3c88165702ac6e600
 SRC_URI[nu-ansi-term-0.50.3.sha256sum] = "7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5"
 SRC_URI[num-bigint-0.4.8.sha256sum] = "c89e69e7e0f03bea5ef08013795c25018e101932225a656383bd384495ecc367"
 SRC_URI[num-conv-0.2.2.sha256sum] = "521739c6d2bac4aa25192232afe6841231376b2b26d4d9fae5ecf8ca5772e441"
-SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
+SRC_URI[num-integer-0.1.47.sha256sum] = "7ce2d95d4b3734dc35aa2f45e1aa22cd416814592a4f9d9205e11affd5b8e10b"
 SRC_URI[num-modular-0.6.1.sha256sum] = "17bb261bf36fa7d83f4c294f834e91256769097b3cb505d44831e0a179ac647f"
 SRC_URI[num-prime-0.5.0.sha256sum] = "b285c575532a33ef6fdd3a57640d0b1c70e6ca48644d6df7bbd4b7a0cfbbb12d"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
@@ -611,8 +607,6 @@ SRC_URI[objc2-0.6.4.sha256sum] = "3a12a8ed07aefc768292f076dc3ac8c48f3781c8f2d585
 SRC_URI[objc2-encode-4.1.0.sha256sum] = "ef25abbcd74fb2609453eb695bd2f860d389e457f67dc17cafc8b8cbc89d0c33"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
-SRC_URI[onig-6.5.3.sha256sum] = "0cc3cbf698f9438986c11a880c90a6d04b9de27575afd28bbf45b154b6c709e2"
-SRC_URI[onig_sys-69.9.3.sha256sum] = "1e68317604e77e53b85896388e1a803c1d21b74c899ec9e5e1112db90735edd7"
 SRC_URI[openssl-0.10.81.sha256sum] = "77823a27f0babb03091cb9ed9ef80af3b39dbc82f97e8fa530374b7dafd87a45"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
 SRC_URI[openssl-src-300.6.1+3.6.3.sha256sum] = "46eb8fb9fb3b61ce1c0f8a026c4c1a0714d3a9e138e7fbde78753ce2babc3846"
@@ -628,11 +622,11 @@ SRC_URI[phf_codegen-0.14.0.sha256sum] = "41b585a510fb76fdebead6897982ef2a03a21d8
 SRC_URI[phf_generator-0.14.0.sha256sum] = "aeb62e0959d5a1bebc965f4d15d9e2b7cea002b6b0f5ba8cde6cc26738467100"
 SRC_URI[phf_shared-0.14.0.sha256sum] = "c6fd9027e2d9319be6349febd1db4e8d02aa544921200c9b777720ac34a3aa89"
 SRC_URI[pin-project-lite-0.2.17.sha256sum] = "a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd"
-SRC_URI[pkg-config-0.3.33.sha256sum] = "19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e"
-SRC_URI[platform-info-2.1.0.sha256sum] = "9368d62437c8cbb7c31ee37fd8c08a7d390e09a3ff75698a674953f46705ffcb"
-SRC_URI[portable-atomic-1.14.0.sha256sum] = "3d20d5497ef88037a52ff98267d066e7f11fcc5e99bbfbd58a42336193aacec3"
+SRC_URI[pkg-config-0.3.34.sha256sum] = "f6b464fbc74e149a392436b17d523f769e057cb6877f6a5c4618bc6f11800548"
+SRC_URI[platform-info-2.2.0.sha256sum] = "ba7c3f5af00d3596a148cc80178ac690152b71c283d15a8bcea0cddfea759a36"
+SRC_URI[portable-atomic-1.15.0.sha256sum] = "05c8b63e8d9609db387f0324918f81d68fe27748f084ef092fb35954d0539a85"
 SRC_URI[portable-atomic-util-0.2.7.sha256sum] = "c2a106d1259c23fac8e543272398ae0e3c0b8d33c88ed73d0cc71b0f1d902618"
-SRC_URI[potential_utf-0.1.5.sha256sum] = "0103b1cef7ec0cf76490e969665504990193874ea05c85ff9bab8b911d0a0564"
+SRC_URI[potential_utf-0.1.6.sha256sum] = "d83eb9bc6d8e5cf568e7a1101d60ee05e81ed50ea106026f3d18deeb046d7661"
 SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[pretty_assertions-1.4.1.sha256sum] = "3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d"
@@ -644,7 +638,7 @@ SRC_URI[procfs-core-0.18.0.sha256sum] = "e6401bf7b6af22f78b563665d15a22e9aef2777
 SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
-SRC_URI[rand-0.8.7.sha256sum] = "22f6172bdec972074665ed81ed53b71da00bfc44b65a753cfde883ec4c702a1a"
+SRC_URI[rand-0.8.8.sha256sum] = "e058c7de0b26af77780c769414d6257830bb240f3c38477dbc2c16e5f54d6d4c"
 SRC_URI[rand-0.10.2.sha256sum] = "c7f5fa3a058cd35567ef9bfa5e75732bee0f9e4c55fa90477bef2dfcdbc4be80"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_chacha-0.10.0.sha256sum] = "3e6af7f3e25ded52c41df4e0b1af2d047e45896c2f3281792ed68a1c243daedb"
@@ -660,8 +654,8 @@ SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413
 SRC_URI[relative-path-1.9.3.sha256sum] = "ba39f3699c378cd8970968dcbff9c43159ea4cfbd88d43c00b22f2ef10a435d2"
 SRC_URI[rlimit-0.11.0.sha256sum] = "f35ee2729c56bb610f6dba436bf78135f728b7373bdffae2ec815b2d3eb98cc3"
 SRC_URI[roff-1.1.1.sha256sum] = "323c417e1d9665a65b263ec744ba09030cfb277e9daa0b018a4ab62e57bc8189"
-SRC_URI[rstest-0.26.1.sha256sum] = "f5a3193c063baaa2a95a33f03035c8a72b83d97a54916055ba22d35ed3839d49"
-SRC_URI[rstest_macros-0.26.1.sha256sum] = "9c845311f0ff7951c5506121a9ad75aec44d083c31583b2ea5a30bcb0b0abba0"
+SRC_URI[rstest-0.27.0.sha256sum] = "948203e6d13b83e51a90d7cf236dd58a0065f23f4b902f00f306e7eb2bd09b9c"
+SRC_URI[rstest_macros-0.27.0.sha256sum] = "a8d92eaf7b6e51e12471d71ddc72608e7151573de44099aacfbb1128177c0da4"
 SRC_URI[rstest_reuse-0.7.0.sha256sum] = "b3a8fb4672e840a587a66fc577a5491375df51ddb88f2a2c2a792598c326fe14"
 SRC_URI[rust-ini-0.21.3.sha256sum] = "796e8d2b6696392a43bea58116b667fb4c29727dc5abd27d6acf338bb4f688c7"
 SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
@@ -698,15 +692,14 @@ SRC_URI[spin-0.10.1.sha256sum] = "023a211cb3138dbc438680b32560ad89f699977624c9f8
 SRC_URI[sponge-cursor-0.1.0.sha256sum] = "3a0219bd7d979d58245a4f41f695e1ac9f8befdffadd7f61f1bae9e39abc6620"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[statrs-0.18.0.sha256sum] = "2a3fe7c28c6512e766b0874335db33c94ad7b8f9054228ae1c2abd47ce7d335e"
-SRC_URI[string-interner-0.20.0.sha256sum] = "ad3df9b59e2eded8d825c7c4363ad339a20fb6bc0b9a4778560f518f59910b15"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
-SRC_URI[syn-3.0.3.sha256sum] = "53e9bae58849f64dfa4f5d5ae372c8341f7305f82a3868709269343628b659a3"
-SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
+SRC_URI[syn-3.0.4.sha256sum] = "e6275cddf4610d1775e6d1fe9469b2e77d0f39fd98fb7450901b821e0c53649f"
+SRC_URI[synstructure-0.14.0.sha256sum] = "901704edd0dfe137f1987838ee4f259e4e063c31371bdb423f7ae38ec6f77f02"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
-SRC_URI[textwrap-0.16.2.sha256sum] = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
+SRC_URI[textwrap-0.16.4.sha256sum] = "6ecfad6c3abc80a577f2b91c1e412ee57e7a060d430b553c1b0c940974ebcd49"
 SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
 SRC_URI[thiserror-2.0.20.sha256sum] = "ec86235f5fcc2a73650310756d2ac5b138a5780bbbdfae3eeccec992c435ba4f"
 SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
@@ -725,7 +718,6 @@ SRC_URI[typenum-1.20.1.sha256sum] = "b6f5e870be6c3b371b77fe0ee0bafb859fa4964b440
 SRC_URI[unic-langid-0.9.6.sha256sum] = "a28ba52c9b05311f4f6e62d5d9d46f094bd6e84cb8df7b3ef952748d752a7d05"
 SRC_URI[unic-langid-impl-0.9.6.sha256sum] = "dce1bf08044d4b7a94028c93786f8566047edc11110595914de93362559bc658"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
-SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
 SRC_URI[unicode-width-0.1.14.sha256sum] = "7dd6e30e90baa6f72411720665d41d89b9a3d039dc45b8faea1ddd07f617f6af"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
 SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
@@ -741,10 +733,10 @@ SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5
 SRC_URI[vsimd-0.8.0.sha256sum] = "5c3082ca00d5a5ef149bb8b555a72ae84c9c59f7250f013ac822ac2e49b19c64"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
-SRC_URI[wasm-bindgen-0.2.126.sha256sum] = "4b067c0c11094aef6b7a801c1e34a26affafdf3d051dba08456b868789aaf9a4"
-SRC_URI[wasm-bindgen-macro-0.2.126.sha256sum] = "167ce5e579f6bcf889c4f7175a8a5a585de84e8ff93976ce393efa5f2837aab1"
-SRC_URI[wasm-bindgen-macro-support-0.2.126.sha256sum] = "f3997c7839262f4ef12cf90b818d6340c18e80f263f1a94bf157d0ec4420380e"
-SRC_URI[wasm-bindgen-shared-0.2.126.sha256sum] = "dc1b4cb0cc549fcf58d7dfc081778139b3d283a081644e833e84682ad71cea24"
+SRC_URI[wasm-bindgen-0.2.127.sha256sum] = "1b70935747edd64d89de3efa29d73789b806c15798f8e7dca4d8ac356b50ce70"
+SRC_URI[wasm-bindgen-macro-0.2.127.sha256sum] = "77775f8f3f7217702089053b94958f8f54061a3f663417df76e19cbdcca29bc1"
+SRC_URI[wasm-bindgen-macro-support-0.2.127.sha256sum] = "e11d33f857dc2fb11b8bc75aee111aa9cbeb12cd9f25efd3d4c2a3dd4e235284"
+SRC_URI[wasm-bindgen-shared-0.2.127.sha256sum] = "7ef64dbcc55df09c7e5a46182d181c2cfa3e925f3da937ea764728b4bbb9dcbf"
 SRC_URI[web-time-1.1.0.sha256sum] = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
 SRC_URI[wild-2.2.1.sha256sum] = "a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
@@ -757,26 +749,16 @@ SRC_URI[windows-interface-0.59.3.sha256sum] = "3f316c4a2570ba26bbec722032c4099d8
 SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
 SRC_URI[windows-result-0.4.1.sha256sum] = "7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5"
 SRC_URI[windows-strings-0.5.1.sha256sum] = "7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091"
-SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
 SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
-SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
 SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
-SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
 SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
-SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
 SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
-SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
 SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
-SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
 SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
-SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
 SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
-SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
 SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
-SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
-SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
 SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 SRC_URI[winnow-1.0.4.sha256sum] = "23b97319f7b8343df12cc98938e5c3eb436064524c8d2b4e30a1d3a36eecdf81"
 SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
@@ -785,14 +767,14 @@ SRC_URI[wyz-0.5.1.sha256sum] = "05f360fc0b24296329c78fda852a1e9ae82de9cf7b27dae4
 SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[yansi-1.0.1.sha256sum] = "cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049"
 SRC_URI[yoke-0.8.3.sha256sum] = "709fe23a0424b6a435d82152b1bd3fdfb0833487d5fa90d05d42762a9891fef5"
-SRC_URI[yoke-derive-0.8.2.sha256sum] = "de844c262c8848816172cef550288e7dc6c7b7814b4ee56b3e1553f275f1858e"
+SRC_URI[yoke-derive-0.8.3.sha256sum] = "33811428bee40dbceb6d545e95754741d17a6aef9a4849f0fd62e2ba4f412a78"
 SRC_URI[z85-3.0.7.sha256sum] = "c6e61e59a957b7ccee15d2049f86e8bfd6f66968fcd88f018950662d9b86e675"
 SRC_URI[zerocopy-0.7.35.sha256sum] = "1b9b4fd18abc82b8136838da5d50bae7bdea537c574d8dc1a34ed098d6c166f0"
 SRC_URI[zerocopy-0.8.56.sha256sum] = "556764e583adb45a9f8d413c2a147fa7e8d821e48e12b14fd560b607998b75eb"
 SRC_URI[zerocopy-derive-0.7.35.sha256sum] = "fa4f8080344d4671fb4e831a13ad1e68092748387dfc4f55e356242fae12ce3e"
 SRC_URI[zerocopy-derive-0.8.56.sha256sum] = "f2ab42fc20575779bd240faa45f94a74256f755c0fa9e89f0ede20d91d0cdfc1"
 SRC_URI[zerofrom-0.1.8.sha256sum] = "0ec05a11813ea801ff6d75110ad09cd0824ddba17dfe17128ea0d5f68e6c5272"
-SRC_URI[zerofrom-derive-0.1.7.sha256sum] = "11532158c46691caf0f2593ea8358fed6bbf68a0315e80aae9bd41fbade684a1"
+SRC_URI[zerofrom-derive-0.1.8.sha256sum] = "f75b4683f6c7f45248d4d64056a24298c6281e0993356d7d1b4a1a962ef10d4a"
 SRC_URI[zerotrie-0.2.5.sha256sum] = "4ea269c3bd32f0a32c321907a2ae912ba6f4649bb0fc764a15627e99a7095a3f"
 SRC_URI[zerovec-0.11.8.sha256sum] = "bb0464e17806c1d976d5cba29399c7f08e516e279e2ba493f63123b5fca67dd8"
 SRC_URI[zerovec-derive-0.11.6.sha256sum] = "34df6fc39dbd26ddc9c10e6a2984476e13acce22e64e4487636ef494369225da"
@@ -803,6 +785,7 @@ SRC_URI[zopfli-0.8.3.sha256sum] = "f05cd8797d63865425ff89b5c4a48804f35ba0ce8d125
 # from fuzz/Cargo.lock
 SRC_URI += " \
     crate://crates.io/adler2/2.0.1 \
+    crate://crates.io/aho-corasick/1.1.5 \
     crate://crates.io/android_system_properties/0.1.6 \
     crate://crates.io/anstream/1.0.0 \
     crate://crates.io/anstyle/1.0.14 \
@@ -810,41 +793,42 @@ SRC_URI += " \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/arbitrary/1.4.2 \
-    crate://crates.io/arrayref/0.3.9 \
     crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/autocfg/1.5.1 \
     crate://crates.io/base64-simd/0.8.0 \
     crate://crates.io/bigdecimal/0.4.10 \
+    crate://crates.io/bit-set/0.8.0 \
+    crate://crates.io/bit-vec/0.8.0 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/bitflags/2.13.1 \
-    crate://crates.io/blake2b_simd/1.0.4 \
-    crate://crates.io/blake3/1.8.5 \
+    crate://crates.io/blake2b_simd/1.0.5 \
+    crate://crates.io/blake3/1.8.7 \
     crate://crates.io/block-buffer/0.12.1 \
     crate://crates.io/block2/0.6.2 \
-    crate://crates.io/bstr/1.13.0 \
+    crate://crates.io/bstr/1.13.1 \
     crate://crates.io/bumpalo/3.20.3 \
     crate://crates.io/bytecount/0.6.9 \
     crate://crates.io/calendrical_calculations/0.2.4 \
-    crate://crates.io/cc/1.4.3 \
+    crate://crates.io/cc/1.4.4 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/cfg_aliases/0.2.2 \
-    crate://crates.io/chacha20/0.10.1 \
+    crate://crates.io/chacha20/0.10.2 \
     crate://crates.io/chrono/0.4.45 \
-    crate://crates.io/clap/4.6.5 \
-    crate://crates.io/clap_builder/4.6.5 \
+    crate://crates.io/clap/4.6.6 \
+    crate://crates.io/clap_builder/4.6.6 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
-    crate://crates.io/console/0.16.4 \
+    crate://crates.io/console/0.16.6 \
     crate://crates.io/const-random/0.1.18 \
     crate://crates.io/const-random-macro/0.1.16 \
     crate://crates.io/constant_time_eq/0.4.2 \
     crate://crates.io/core-foundation-sys/0.8.7 \
     crate://crates.io/core_maths/0.1.1 \
-    crate://crates.io/cpufeatures/0.3.0 \
+    crate://crates.io/cpufeatures/0.3.1 \
     crate://crates.io/crc/3.3.0 \
     crate://crates.io/crc-catalog/2.5.0 \
     crate://crates.io/crc-fast/1.9.0 \
-    crate://crates.io/crc32fast/1.5.0 \
+    crate://crates.io/crc32fast/1.5.1 \
     crate://crates.io/crossbeam-deque/0.8.7 \
     crate://crates.io/crossbeam-epoch/0.9.20 \
     crate://crates.io/crossbeam-utils/0.8.22 \
@@ -864,21 +848,22 @@ SRC_URI += " \
     crate://crates.io/displaydoc/0.2.7 \
     crate://crates.io/dlv-list/0.5.2 \
     crate://crates.io/dunce/1.0.5 \
-    crate://crates.io/either/1.17.0 \
+    crate://crates.io/either/1.18.0 \
     crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/errno/0.3.14 \
+    crate://crates.io/fancy-regex/0.19.2 \
     crate://crates.io/fastrand/2.5.0 \
     crate://crates.io/find-msvc-tools/0.1.11 \
     crate://crates.io/fixed_decimal/0.7.2 \
-    crate://crates.io/flate2/1.1.9 \
+    crate://crates.io/flate2/1.1.10 \
     crate://crates.io/fluent/0.17.0 \
     crate://crates.io/fluent-bundle/0.16.0 \
     crate://crates.io/fluent-langneg/0.13.1 \
     crate://crates.io/fluent-syntax/0.12.0 \
     crate://crates.io/foldhash/0.2.0 \
-    crate://crates.io/futures-core/0.3.33 \
-    crate://crates.io/futures-task/0.3.33 \
-    crate://crates.io/futures-util/0.3.33 \
+    crate://crates.io/futures-core/0.3.34 \
+    crate://crates.io/futures-task/0.3.34 \
+    crate://crates.io/futures-util/0.3.34 \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/getrandom/0.2.17 \
     crate://crates.io/getrandom/0.4.3 \
@@ -888,28 +873,30 @@ SRC_URI += " \
     crate://crates.io/hybrid-array/0.4.14 \
     crate://crates.io/iana-time-zone/0.1.65 \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
-    crate://crates.io/icu_calendar/2.2.1 \
-    crate://crates.io/icu_calendar_data/2.2.0 \
-    crate://crates.io/icu_collator/2.2.1 \
-    crate://crates.io/icu_collator_data/2.2.0 \
-    crate://crates.io/icu_collections/2.2.0 \
-    crate://crates.io/icu_datetime/2.2.0 \
-    crate://crates.io/icu_datetime_data/2.2.0 \
-    crate://crates.io/icu_decimal/2.2.0 \
-    crate://crates.io/icu_decimal_data/2.2.0 \
-    crate://crates.io/icu_locale/2.2.0 \
-    crate://crates.io/icu_locale_core/2.2.0 \
-    crate://crates.io/icu_locale_data/2.2.0 \
-    crate://crates.io/icu_normalizer/2.2.0 \
-    crate://crates.io/icu_normalizer_data/2.2.0 \
-    crate://crates.io/icu_pattern/0.4.2 \
-    crate://crates.io/icu_plurals/2.2.0 \
-    crate://crates.io/icu_plurals_data/2.2.0 \
-    crate://crates.io/icu_properties/2.2.0 \
-    crate://crates.io/icu_properties_data/2.2.0 \
-    crate://crates.io/icu_provider/2.2.0 \
-    crate://crates.io/icu_time/2.2.0 \
-    crate://crates.io/icu_time_data/2.2.1 \
+    crate://crates.io/icu_calendar/2.3.0 \
+    crate://crates.io/icu_calendar_data/2.3.0 \
+    crate://crates.io/icu_collator/2.3.1 \
+    crate://crates.io/icu_collator_data/2.3.0 \
+    crate://crates.io/icu_collections/2.3.0 \
+    crate://crates.io/icu_datetime/2.3.0 \
+    crate://crates.io/icu_datetime_data/2.3.0 \
+    crate://crates.io/icu_decimal/2.3.0 \
+    crate://crates.io/icu_decimal_data/2.3.0 \
+    crate://crates.io/icu_locale/2.3.1 \
+    crate://crates.io/icu_locale_core/2.3.0 \
+    crate://crates.io/icu_locale_data/2.3.0 \
+    crate://crates.io/icu_locale_fallback/2.3.0 \
+    crate://crates.io/icu_locale_fallback_data/2.3.0 \
+    crate://crates.io/icu_normalizer/2.3.0 \
+    crate://crates.io/icu_normalizer_data/2.3.0 \
+    crate://crates.io/icu_pattern/0.5.0 \
+    crate://crates.io/icu_plurals/2.3.0 \
+    crate://crates.io/icu_plurals_data/2.3.0 \
+    crate://crates.io/icu_properties/2.3.0 \
+    crate://crates.io/icu_properties_data/2.3.0 \
+    crate://crates.io/icu_provider/2.3.1 \
+    crate://crates.io/icu_time/2.3.0 \
+    crate://crates.io/icu_time_data/2.3.0 \
     crate://crates.io/intl-memoizer/0.5.3 \
     crate://crates.io/intl_pluralrules/7.0.2 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
@@ -921,37 +908,34 @@ SRC_URI += " \
     crate://crates.io/jiff-tzdb/0.1.8 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.35 \
-    crate://crates.io/js-sys/0.3.103 \
-    crate://crates.io/keccak/0.2.1 \
+    crate://crates.io/js-sys/0.3.104 \
+    crate://crates.io/keccak/0.2.2 \
     crate://crates.io/libc/0.2.189 \
     crate://crates.io/libfuzzer-sys/0.4.13 \
     crate://crates.io/libm/0.2.16 \
     crate://crates.io/linux-raw-sys/0.12.1 \
-    crate://crates.io/litemap/0.8.2 \
-    crate://crates.io/log/0.4.33 \
+    crate://crates.io/litemap/0.8.3 \
+    crate://crates.io/log/0.4.34 \
     crate://crates.io/md-5/0.11.0 \
     crate://crates.io/memchr/2.8.3 \
-    crate://crates.io/miniz_oxide/0.8.9 \
+    crate://crates.io/miniz_oxide/0.9.1 \
     crate://crates.io/nix/0.31.3 \
     crate://crates.io/nom/8.0.0 \
     crate://crates.io/num-bigint/0.4.8 \
-    crate://crates.io/num-integer/0.1.46 \
+    crate://crates.io/num-integer/0.1.47 \
     crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/objc2/0.6.4 \
     crate://crates.io/objc2-encode/4.1.0 \
     crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/once_cell_polyfill/1.70.2 \
-    crate://crates.io/onig/6.5.3 \
-    crate://crates.io/onig_sys/69.9.3 \
     crate://crates.io/ordered-multimap/0.7.3 \
     crate://crates.io/os_display/0.1.4 \
     crate://crates.io/outref/0.5.2 \
     crate://crates.io/parse_datetime/0.16.0 \
     crate://crates.io/pin-project-lite/0.2.17 \
-    crate://crates.io/pkg-config/0.3.33 \
-    crate://crates.io/portable-atomic/1.14.0 \
+    crate://crates.io/portable-atomic/1.15.0 \
     crate://crates.io/portable-atomic-util/0.2.7 \
-    crate://crates.io/potential_utf/0.1.5 \
+    crate://crates.io/potential_utf/0.1.6 \
     crate://crates.io/proc-macro2/1.0.107 \
     crate://crates.io/procfs/0.18.0 \
     crate://crates.io/procfs-core/0.18.0 \
@@ -962,6 +946,7 @@ SRC_URI += " \
     crate://crates.io/rayon/1.12.0 \
     crate://crates.io/rayon-core/1.13.0 \
     crate://crates.io/regex-automata/0.4.18 \
+    crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rust-ini/0.21.3 \
     crate://crates.io/rustc-hash/2.1.3 \
     crate://crates.io/rustix/1.1.4 \
@@ -985,14 +970,14 @@ SRC_URI += " \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/2.0.119 \
-    crate://crates.io/syn/3.0.3 \
-    crate://crates.io/synstructure/0.13.2 \
+    crate://crates.io/syn/3.0.4 \
+    crate://crates.io/synstructure/0.14.0 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
     crate://crates.io/thiserror/2.0.20 \
     crate://crates.io/thiserror-impl/2.0.20 \
     crate://crates.io/tiny-keccak/2.0.2 \
-    crate://crates.io/tinystr/0.8.3 \
+    crate://crates.io/tinystr/0.8.4 \
     crate://crates.io/type-map/0.5.1 \
     crate://crates.io/typenum/1.20.1 \
     crate://crates.io/unic-langid/0.9.6 \
@@ -1006,10 +991,10 @@ SRC_URI += " \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vsimd/0.8.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
-    crate://crates.io/wasm-bindgen/0.2.126 \
-    crate://crates.io/wasm-bindgen-macro/0.2.126 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.126 \
-    crate://crates.io/wasm-bindgen-shared/0.2.126 \
+    crate://crates.io/wasm-bindgen/0.2.127 \
+    crate://crates.io/wasm-bindgen-macro/0.2.127 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.127 \
+    crate://crates.io/wasm-bindgen-shared/0.2.127 \
     crate://crates.io/wild/2.2.1 \
     crate://crates.io/windows-core/0.62.2 \
     crate://crates.io/windows-implement/0.60.2 \
@@ -1020,18 +1005,20 @@ SRC_URI += " \
     crate://crates.io/windows-sys/0.61.2 \
     crate://crates.io/winnow/1.0.4 \
     crate://crates.io/write16/1.0.0 \
-    crate://crates.io/writeable/0.6.3 \
+    crate://crates.io/writeable/0.6.4 \
     crate://crates.io/yoke/0.8.3 \
-    crate://crates.io/yoke-derive/0.8.2 \
+    crate://crates.io/yoke-derive/0.8.3 \
     crate://crates.io/z85/3.0.7 \
     crate://crates.io/zerofrom/0.1.8 \
-    crate://crates.io/zerofrom-derive/0.1.7 \
-    crate://crates.io/zerotrie/0.2.4 \
-    crate://crates.io/zerovec/0.11.6 \
-    crate://crates.io/zerovec-derive/0.11.3 \
+    crate://crates.io/zerofrom-derive/0.1.8 \
+    crate://crates.io/zerotrie/0.2.5 \
+    crate://crates.io/zerovec/0.11.8 \
+    crate://crates.io/zerovec-derive/0.11.6 \
+    crate://crates.io/zlib-rs/0.6.7 \
 "
 
 SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
+SRC_URI[aho-corasick-1.1.5.sha256sum] = "c982642fa9e8606056828ee9a8505737230110bb1099153c79efe865c59d12ba"
 SRC_URI[android_system_properties-0.1.6.sha256sum] = "ae221649c9976a6f6c56ae1facf410f3ddb33cc661c4b7b61020a912d4237fbc"
 SRC_URI[anstream-1.0.0.sha256sum] = "824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d"
 SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
@@ -1039,41 +1026,42 @@ SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecd
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[arbitrary-1.4.2.sha256sum] = "c3d036a3c4ab069c7b410a2ce876bd74808d2d0888a82667669f8e783a898bf1"
-SRC_URI[arrayref-0.3.9.sha256sum] = "76a2e8124351fda1ef8aaaa3bbd7ebbcb486bbcd4225aca0aa0d84bb2db8fecb"
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
 SRC_URI[autocfg-1.5.1.sha256sum] = "f2032f911046de80f0a198e0901378627c33f59ea0ac00e363d481118bd70a53"
 SRC_URI[base64-simd-0.8.0.sha256sum] = "339abbe78e73178762e23bea9dfd08e697eb3f3301cd4be981c0f78ba5859195"
 SRC_URI[bigdecimal-0.4.10.sha256sum] = "4d6867f1565b3aad85681f1015055b087fcfd840d6aeee6eee7f2da317603695"
+SRC_URI[bit-set-0.8.0.sha256sum] = "08807e080ed7f9d5433fa9b275196cfc35414f66a0c79d864dc51a0d825231a3"
+SRC_URI[bit-vec-0.8.0.sha256sum] = "5e764a1d40d510daf35e07be9eb06e75770908c27d411ee6c92109c9840eaaf7"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[bitflags-2.13.1.sha256sum] = "b588b76d00fde79687d7646a9b5bdf3cc0f655e0bbd080335a95d7e96f3587da"
-SRC_URI[blake2b_simd-1.0.4.sha256sum] = "b79834656f71332577234b50bfc009996f7449e0c056884e6a02492ded0ca2f3"
-SRC_URI[blake3-1.8.5.sha256sum] = "0aa83c34e62843d924f905e0f5c866eb1dd6545fc4d719e803d9ba6030371fce"
+SRC_URI[blake2b_simd-1.0.5.sha256sum] = "3560a7b1951efe814fcd721938313adc56753ca39f4b23847d7e9a2402f5dbff"
+SRC_URI[blake3-1.8.7.sha256sum] = "6d9e454fc11f76977dc803893aff6304ed33d6a26efae8696573bea74baa27ae"
 SRC_URI[block-buffer-0.12.1.sha256sum] = "d2f6c7dbe95a6ed67ad9f18e57daf93a2f034c524b99fd2b76d18fdfeb6660aa"
 SRC_URI[block2-0.6.2.sha256sum] = "cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5"
-SRC_URI[bstr-1.13.0.sha256sum] = "1f7dc094d718f2e1c1559ad110e27eeaae14a5465d3d56dd6dbd793079fbd530"
+SRC_URI[bstr-1.13.1.sha256sum] = "6bb31b46c14244e20ee9984b11bf5c992b91fb6939fea616e3512c8baecdbe5f"
 SRC_URI[bumpalo-3.20.3.sha256sum] = "72f5acc6cb2ba439de613abc23857ec3d78374d8ed5ac84e9d11336e87da8649"
 SRC_URI[bytecount-0.6.9.sha256sum] = "175812e0be2bccb6abe50bb8d566126198344f707e304f45c648fd8f2cc0365e"
 SRC_URI[calendrical_calculations-0.2.4.sha256sum] = "5abbd6eeda6885048d357edc66748eea6e0268e3dd11f326fff5bd248d779c26"
-SRC_URI[cc-1.4.3.sha256sum] = "509591b7bcd67f4ef775afad7662703b4935daaa6ec0e5605cfb1090b32a2b6d"
+SRC_URI[cc-1.4.4.sha256sum] = "0ad534f4357a5264cce5019c989cf66a4f0dc4e0d1b1d15f8aacec0ff7360273"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[cfg_aliases-0.2.2.sha256sum] = "f079e83a288787bcd14a6aea84cee5c87a67c5a3e660c30f557a3d24761b3527"
-SRC_URI[chacha20-0.10.1.sha256sum] = "d524456ba66e72eb8b115ff89e01e497f8e6d11d78b70b1aa13c0fbd97540a81"
+SRC_URI[chacha20-0.10.2.sha256sum] = "65c35e4b699c7e15ccbe7ee35c005e4fc0a278d22238a2857e6ce2dadeda1b06"
 SRC_URI[chrono-0.4.45.sha256sum] = "1aa79e62e7697b8e29b513a68abacf485adcd1fe8284a4316c5ae868e6633327"
-SRC_URI[clap-4.6.5.sha256sum] = "301b56658598e48f3648647ac6fc887be7e7108eddfa4e9b63fcf3ec58c0cadf"
-SRC_URI[clap_builder-4.6.5.sha256sum] = "94a65403d1a1bd28f7dc68eb8506e8874808ee5eecb59298de588e2e1407a078"
+SRC_URI[clap-4.6.6.sha256sum] = "473c7e07f409a8d772161724aa8db6a765a2532a70f9667eeb7b49d3d02fbdca"
+SRC_URI[clap_builder-4.6.6.sha256sum] = "7b48fea5a88e9ae728a2dcbedbfc0e730f7d60da42e1cb049a83c9fb8b789889"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
-SRC_URI[console-0.16.4.sha256sum] = "4fe5f465a4f6fee88fad41b85d990f84c835335e85b5d9e6e63e0d06d28cba7c"
+SRC_URI[console-0.16.6.sha256sum] = "e96a4956774c13c126a8b5af4daa79384f4d826534c95a02d76afb39e2ab64e3"
 SRC_URI[const-random-0.1.18.sha256sum] = "87e00182fe74b066627d63b85fd550ac2998d4b0bd86bfed477a0ae4c7c71359"
 SRC_URI[const-random-macro-0.1.16.sha256sum] = "f9d839f2a20b0aee515dc581a6172f2321f96cab76c1a38a4c584a194955390e"
 SRC_URI[constant_time_eq-0.4.2.sha256sum] = "3d52eff69cd5e647efe296129160853a42795992097e8af39800e1060caeea9b"
 SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
 SRC_URI[core_maths-0.1.1.sha256sum] = "77745e017f5edba1a9c1d854f6f3a52dac8a12dd5af5d2f54aecf61e43d80d30"
-SRC_URI[cpufeatures-0.3.0.sha256sum] = "8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201"
+SRC_URI[cpufeatures-0.3.1.sha256sum] = "5ca28b0ae3115b884660db4118d803791fd6756b6e88f39c0f3f7859060d7566"
 SRC_URI[crc-3.3.0.sha256sum] = "9710d3b3739c2e349eb44fe848ad0b7c8cb1e42bd87ee49371df2f7acaf3e675"
 SRC_URI[crc-catalog-2.5.0.sha256sum] = "217698eaf96b4a3f0bc4f3662aaa55bdf913cd54d7204591faa790070c6d0853"
 SRC_URI[crc-fast-1.9.0.sha256sum] = "2fd92aca2c6001b1bf5ba0ff84ee74ec8501b52bbef0cac80bf25a6c1d87a83d"
-SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
+SRC_URI[crc32fast-1.5.1.sha256sum] = "8498c871161e1742aaa9d52551b2d6ebdd4c3d45a3be423e3728f33b955be550"
 SRC_URI[crossbeam-deque-0.8.7.sha256sum] = "5181e0de7b61eb03a81e347d6dd8797bae9da5146707b51077e2d71a54ec0ceb"
 SRC_URI[crossbeam-epoch-0.9.20.sha256sum] = "2d6914041f254d6e9176c01941b21115dcfb7089e55135a35411081bd106ef3f"
 SRC_URI[crossbeam-utils-0.8.22.sha256sum] = "61803da095bee82a81bb1a452ecc25d3b2f1416d1897eb86430c6159ef717c17"
@@ -1093,21 +1081,22 @@ SRC_URI[dispatch2-0.3.1.sha256sum] = "1e0e367e4e7da84520dedcac1901e4da967309406d
 SRC_URI[displaydoc-0.2.7.sha256sum] = "c6232dd377dcc64799954cbd3a9bb882e9cdc1308ccd87b1c098f1fb2eaf82a8"
 SRC_URI[dlv-list-0.5.2.sha256sum] = "442039f5147480ba31067cb00ada1adae6892028e40e45fc5de7b7df6dcc1b5f"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
-SRC_URI[either-1.17.0.sha256sum] = "9e5e8f6c15a24b9a3ee5efec809ccd006d3b30e8b3bb63c39af737c7f87daa1d"
+SRC_URI[either-1.18.0.sha256sum] = "252afb9ae5eaa683babdc6a068b3f5726eb19e05070c731f9b2a23a7c3e8ed34"
 SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
+SRC_URI[fancy-regex-0.19.2.sha256sum] = "d301f5bf187b3c295fce6468d3875037a0bccc5f6b151c63cac2f85babf21912"
 SRC_URI[fastrand-2.5.0.sha256sum] = "da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223"
 SRC_URI[find-msvc-tools-0.1.11.sha256sum] = "d45db016d36b838f563236e9193d0ee6ce38f3f68b6c94e914b4929c96bbb890"
 SRC_URI[fixed_decimal-0.7.2.sha256sum] = "79c3c892f121fff406e5dd6b28c1b30096b95111c30701a899d4f2b18da6d1bd"
-SRC_URI[flate2-1.1.9.sha256sum] = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
+SRC_URI[flate2-1.1.10.sha256sum] = "6e634e2e0ebac1ee034020da1ca582e17ffe4e0f5e985823721e168928136dcb"
 SRC_URI[fluent-0.17.0.sha256sum] = "8137a6d5a2c50d6b0ebfcb9aaa91a28154e0a70605f112d30cb0cd4a78670477"
 SRC_URI[fluent-bundle-0.16.0.sha256sum] = "01203cb8918f5711e73891b347816d932046f95f54207710bda99beaeb423bf4"
 SRC_URI[fluent-langneg-0.13.1.sha256sum] = "7eebbe59450baee8282d71676f3bfed5689aeab00b27545e83e5f14b1195e8b0"
 SRC_URI[fluent-syntax-0.12.0.sha256sum] = "54f0d287c53ffd184d04d8677f590f4ac5379785529e5e08b1c8083acdd5c198"
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
-SRC_URI[futures-core-0.3.33.sha256sum] = "2cd50c473c80f6d7c3670a752354b8e569b1a7cbfdc0419ec88e5edad85e0dc7"
-SRC_URI[futures-task-0.3.33.sha256sum] = "b231ed28831efb4a61a08580c4bc233ec56bc009f4cd8f52da2c3cb97df0c109"
-SRC_URI[futures-util-0.3.33.sha256sum] = "a77a90a256fce34da66415271e30f94ee91c57b04b8a2c042d9cf3220179deaa"
+SRC_URI[futures-core-0.3.34.sha256sum] = "92d699e522242e69e3003b94ecc1f960f3a5e015aa7c5d7486e65ad01dd94f5e"
+SRC_URI[futures-task-0.3.34.sha256sum] = "cd417de3d1d015fc3bfd2b1ea46dfc7bab72ef86f1cc7cc9c78e728b34a6d1fd"
+SRC_URI[futures-util-0.3.34.sha256sum] = "0d50a92467f8ba5dd6e3ee5d4bd04d73ab2e4e1c44474a0674821dfce14b79bc"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.2.17.sha256sum] = "ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0"
 SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
@@ -1117,28 +1106,30 @@ SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5
 SRC_URI[hybrid-array-0.4.14.sha256sum] = "707114b52a152fa7bdb290cd7cd5912d9467273b6d74e21b8d81aca1f8533f6b"
 SRC_URI[iana-time-zone-0.1.65.sha256sum] = "e31bc9ad994ba00e440a8aa5c9ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
-SRC_URI[icu_calendar-2.2.1.sha256sum] = "a2b2acc6263f494f1df50685b53ff8e57869e47d5c6fe39c23d518ae9a4f3e45"
-SRC_URI[icu_calendar_data-2.2.0.sha256sum] = "118577bcf3a0fa7c6ac0a7d6e951814da84ee56b9b1f68fb4d8d10b08cefaf4d"
-SRC_URI[icu_collator-2.2.1.sha256sum] = "8bbdf98e5e0aa827770acee171ebb568aaab975a36b56afdb5fd0e2f525750bb"
-SRC_URI[icu_collator_data-2.2.0.sha256sum] = "038ed8e5817f2059c2f3efb0945ba78d060d3d25e8f1a1bea5139f821a21a2f0"
-SRC_URI[icu_collections-2.2.0.sha256sum] = "2984d1cd16c883d7935b9e07e44071dca8d917fd52ecc02c04d5fa0b5a3f191c"
-SRC_URI[icu_datetime-2.2.0.sha256sum] = "989d56ea5bbc43ae2b4e0388874b002884eaf4ed3a76c84a6c8c5ad575e04d72"
-SRC_URI[icu_datetime_data-2.2.0.sha256sum] = "40d3cc1b690d9703202bc319692ac8a1f3a6390686f0930ff40542450fa34f0b"
-SRC_URI[icu_decimal-2.2.0.sha256sum] = "288247df2e32aa776ac54fdd64de552149ac43cb840f2761811f0e8d09719dd4"
-SRC_URI[icu_decimal_data-2.2.0.sha256sum] = "6f14a5ca9e8af29eef62064f269078424283d90dbaffeac5225addf62aaabc22"
-SRC_URI[icu_locale-2.2.0.sha256sum] = "d5a396343c7208121dc86e35623d3dfe19814a7613cfd14964994cdc9c9a2e26"
-SRC_URI[icu_locale_core-2.2.0.sha256sum] = "92219b62b3e2b4d88ac5119f8904c10f8f61bf7e95b640d25ba3075e6cac2c29"
-SRC_URI[icu_locale_data-2.2.0.sha256sum] = "d5fdcc9ac77c6d74ff5cf6e65ef3181d6af32003b16fce3a77fb451d2f695993"
-SRC_URI[icu_normalizer-2.2.0.sha256sum] = "c56e5ee99d6e3d33bd91c5d85458b6005a22140021cc324cea84dd0e72cff3b4"
-SRC_URI[icu_normalizer_data-2.2.0.sha256sum] = "da3be0ae77ea334f4da67c12f149704f19f81d1adf7c51cf482943e84a2bad38"
-SRC_URI[icu_pattern-0.4.2.sha256sum] = "1c4c568054ffe735398a9f4c55aec37ad7c768844553cc0978f09cc9b933a1fb"
-SRC_URI[icu_plurals-2.2.0.sha256sum] = "2a50023f1d49ad5c4333380328a0d4a19e4b9d6d842ec06639affd5ba47c8103"
-SRC_URI[icu_plurals_data-2.2.0.sha256sum] = "8485497155dc865f901decb93ecc20d3e467df67bfeceb91e3ba34e2b11e8e1d"
-SRC_URI[icu_properties-2.2.0.sha256sum] = "bee3b67d0ea5c2cca5003417989af8996f8604e34fb9ddf96208a033901e70de"
-SRC_URI[icu_properties_data-2.2.0.sha256sum] = "8e2bbb201e0c04f7b4b3e14382af113e17ba4f63e2c9d2ee626b720cbce54a14"
-SRC_URI[icu_provider-2.2.0.sha256sum] = "139c4cf31c8b5f33d7e199446eff9c1e02decfc2f0eec2c8d71f65befa45b421"
-SRC_URI[icu_time-2.2.0.sha256sum] = "ec3af0c141da0a61d4f6970cd1d5f4b388b17ea22f8124f8f6049d3d5147586a"
-SRC_URI[icu_time_data-2.2.1.sha256sum] = "2e0ee79a0bb29772465234bfbad6ea04fbc5220bef9fa4f318cc53eb8897070e"
+SRC_URI[icu_calendar-2.3.0.sha256sum] = "58655df2f728e46e4eee80bddebefacf52ec3e77cdb925014b47c5a5905eb55c"
+SRC_URI[icu_calendar_data-2.3.0.sha256sum] = "dc00caaa3fb3201ff7a18aa458e8c3ab042b9da154cfdf948bdde3936c31c36e"
+SRC_URI[icu_collator-2.3.1.sha256sum] = "08984ed58ac439ebf3e13d2cf26b0c46a60afcd21721c1d14087c0b240344dda"
+SRC_URI[icu_collator_data-2.3.0.sha256sum] = "f7d7e54efdddeb1208c08dd5d32b53a879ac00d2d3d051b2255fd26821d16368"
+SRC_URI[icu_collections-2.3.0.sha256sum] = "fa68d21081c4a05d5a901a1c62add574c77048b6a1c67be3b50ce0b60d4ca513"
+SRC_URI[icu_datetime-2.3.0.sha256sum] = "c44df99c4c5297b05653d1a1629f13bdc9fd4044acfbbaf30b15194a1eed4cd6"
+SRC_URI[icu_datetime_data-2.3.0.sha256sum] = "8bb5555f6e4b42233f58564351ce16d73e9e6ebfce6bdcf29875d0cfc554d6a8"
+SRC_URI[icu_decimal-2.3.0.sha256sum] = "9eb8f655bba2d0c0459e43a5b0e6cd3cd388109898fb3d85d048165e8b0abd08"
+SRC_URI[icu_decimal_data-2.3.0.sha256sum] = "e4c887fc7d4c297cf3f9436864af9e3dba7f8be9415a6c2a7f392f3b1636298c"
+SRC_URI[icu_locale-2.3.1.sha256sum] = "785f595c61ef57169a467eeed7b4b6936a66f6cacbb116a96ee86da983251bf4"
+SRC_URI[icu_locale_core-2.3.0.sha256sum] = "d56e28588da92eee5c3201a6eff33fabdd49b62269c8938d4ff050ce4d900deb"
+SRC_URI[icu_locale_data-2.3.0.sha256sum] = "d37d91460e362a5cf58907cd7ce871411775ee6294e49a5cc8e6cec16dfa75ea"
+SRC_URI[icu_locale_fallback-2.3.0.sha256sum] = "251af8e57c9400e3eb58242fe5b8b1152b2a64fdf4cf632f923c38ccee6f2fa9"
+SRC_URI[icu_locale_fallback_data-2.3.0.sha256sum] = "decf2a22ec8fa68f1a0c1129a3f8583f8f8bc24e8b9ccbe98ead99f62a4dc3a8"
+SRC_URI[icu_normalizer-2.3.0.sha256sum] = "12f9cf5f235641ed274641dd81c3f28d870e276763d0797aeeab72317b1c646f"
+SRC_URI[icu_normalizer_data-2.3.0.sha256sum] = "1563da1ed3e0b3bf3d74c9b85917ac9c56464d2f57242270c09c9e752f8021a0"
+SRC_URI[icu_pattern-0.5.0.sha256sum] = "2b3db611446bd92c246b03e4aa0bafa71ddb194af431ddbb42b9d70e4bfce1a0"
+SRC_URI[icu_plurals-2.3.0.sha256sum] = "e475e6766ef87b1d3c1f97be6363995b0bfaeddbc789671615df598a97ff0593"
+SRC_URI[icu_plurals_data-2.3.0.sha256sum] = "1251aa39a95e1333888e499b1263e1c196447a28948acf5bdabd82c046f153bf"
+SRC_URI[icu_properties-2.3.0.sha256sum] = "7e7ca276ad3145661a65914e6daf131ca5120cd3dcee8f8f3214b8875184a148"
+SRC_URI[icu_properties_data-2.3.0.sha256sum] = "e590f038c1464a96894fd6d10127e90a8be4509f56ff7ecef851b15cee0b7caa"
+SRC_URI[icu_provider-2.3.1.sha256sum] = "d27bbb9d3abbefac45d55f647c9de1d44aafcd1186eb91879afef17c396c3e73"
+SRC_URI[icu_time-2.3.0.sha256sum] = "af37e1c3b9f3ab564b619fdf4b22de169f6381eb0f7048e3ca454290c438126b"
+SRC_URI[icu_time_data-2.3.0.sha256sum] = "005ff86fa5851a77fc0a977b72d717f777bd9230415a247219d7898aefb1517a"
 SRC_URI[intl-memoizer-0.5.3.sha256sum] = "310da2e345f5eb861e7a07ee182262e94975051db9e4223e909ba90f392f163f"
 SRC_URI[intl_pluralrules-7.0.2.sha256sum] = "078ea7b7c29a2b4df841a7f6ac8775ff6074020c6776d48491ce2268e068f972"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
@@ -1150,37 +1141,34 @@ SRC_URI[jiff-static-0.2.35.sha256sum] = "3a69dcb3a21cfb32ce1cd056169337ca284af07
 SRC_URI[jiff-tzdb-0.1.8.sha256sum] = "142bd39932ad231f10513df9ab62661fead8719872150b7ad02a2df79f4e141e"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3"
-SRC_URI[js-sys-0.3.103.sha256sum] = "53b44bfcdb3f8d5837a46dae1ca9660a837176eee74a28b229bc626816589102"
-SRC_URI[keccak-0.2.1.sha256sum] = "ffd9697dc4a9a62e2da93389f34400b77a28f0287711263cabb203b3ccb9c0e4"
+SRC_URI[js-sys-0.3.104.sha256sum] = "0e0c1080212aad755ea003d18543e8768dd432c48819efd73a7bf1e39b7a5a3a"
+SRC_URI[keccak-0.2.2.sha256sum] = "d8f198d1db720e4940b5a493201d199d9f24f568f8f746bd13706243a2f71598"
 SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
 SRC_URI[libfuzzer-sys-0.4.13.sha256sum] = "a9fd2f41a1cba099f79a0b6b6c35656cf7c03351a7bae8ff0f28f25270f929d2"
 SRC_URI[libm-0.2.16.sha256sum] = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
-SRC_URI[litemap-0.8.2.sha256sum] = "92daf443525c4cce67b150400bc2316076100ce0b3686209eb8cf3c31612e6f0"
-SRC_URI[log-0.4.33.sha256sum] = "0ceec5bc11778974d1bcb055b18002eba7f4b3518b6a0081b3af5f21666da9ad"
+SRC_URI[litemap-0.8.3.sha256sum] = "47d9d19d1d6efa0109d2f65ff4c85cddd50bd572e5a00127ab10987290bcefae"
+SRC_URI[log-0.4.34.sha256sum] = "f9f8bd3e56ce4dfc153cf470fffbfa98c7620958b312ca5c3a4b8d5181fd13c6"
 SRC_URI[md-5-0.11.0.sha256sum] = "69b6441f590336821bb897fb28fc622898ccceb1d6cea3fde5ea86b090c4de98"
 SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
-SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
+SRC_URI[miniz_oxide-0.9.1.sha256sum] = "b63fbc4a50860e98e7b2aa7804ded1db5cbc3aff9193adaff57a6931bf7c4b4c"
 SRC_URI[nix-0.31.3.sha256sum] = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
 SRC_URI[nom-8.0.0.sha256sum] = "df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405"
 SRC_URI[num-bigint-0.4.8.sha256sum] = "c89e69e7e0f03bea5ef08013795c25018e101932225a656383bd384495ecc367"
-SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
+SRC_URI[num-integer-0.1.47.sha256sum] = "7ce2d95d4b3734dc35aa2f45e1aa22cd416814592a4f9d9205e11affd5b8e10b"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[objc2-0.6.4.sha256sum] = "3a12a8ed07aefc768292f076dc3ac8c48f3781c8f2d5851dd3d98950e8c5a89f"
 SRC_URI[objc2-encode-4.1.0.sha256sum] = "ef25abbcd74fb2609453eb695bd2f860d389e457f67dc17cafc8b8cbc89d0c33"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
-SRC_URI[onig-6.5.3.sha256sum] = "0cc3cbf698f9438986c11a880c90a6d04b9de27575afd28bbf45b154b6c709e2"
-SRC_URI[onig_sys-69.9.3.sha256sum] = "1e68317604e77e53b85896388e1a803c1d21b74c899ec9e5e1112db90735edd7"
 SRC_URI[ordered-multimap-0.7.3.sha256sum] = "49203cdcae0030493bad186b28da2fa25645fa276a51b6fec8010d281e02ef79"
 SRC_URI[os_display-0.1.4.sha256sum] = "ad5fd71b79026fb918650dde6d125000a233764f1c2f1659a1c71118e33ea08f"
 SRC_URI[outref-0.5.2.sha256sum] = "1a80800c0488c3a21695ea981a54918fbb37abf04f4d0720c453632255e2ff0e"
 SRC_URI[parse_datetime-0.16.0.sha256sum] = "503fd4c8b0685e5eb32a8276533611f63e3b44768e9e8724e73f6852c2542f82"
 SRC_URI[pin-project-lite-0.2.17.sha256sum] = "a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd"
-SRC_URI[pkg-config-0.3.33.sha256sum] = "19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e"
-SRC_URI[portable-atomic-1.14.0.sha256sum] = "3d20d5497ef88037a52ff98267d066e7f11fcc5e99bbfbd58a42336193aacec3"
+SRC_URI[portable-atomic-1.15.0.sha256sum] = "05c8b63e8d9609db387f0324918f81d68fe27748f084ef092fb35954d0539a85"
 SRC_URI[portable-atomic-util-0.2.7.sha256sum] = "c2a106d1259c23fac8e543272398ae0e3c0b8d33c88ed73d0cc71b0f1d902618"
-SRC_URI[potential_utf-0.1.5.sha256sum] = "0103b1cef7ec0cf76490e969665504990193874ea05c85ff9bab8b911d0a0564"
+SRC_URI[potential_utf-0.1.6.sha256sum] = "d83eb9bc6d8e5cf568e7a1101d60ee05e81ed50ea106026f3d18deeb046d7661"
 SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
 SRC_URI[procfs-0.18.0.sha256sum] = "25485360a54d6861439d60facef26de713b1e126bf015ec8f98239467a2b82f7"
 SRC_URI[procfs-core-0.18.0.sha256sum] = "e6401bf7b6af22f78b563665d15a22e9aef27775b79b149a66ca022468a4e405"
@@ -1191,6 +1179,7 @@ SRC_URI[rand_core-0.10.1.sha256sum] = "63b8176103e19a2643978565ca18b50549f610188
 SRC_URI[rayon-1.12.0.sha256sum] = "fb39b166781f92d482534ef4b4b1b2568f42613b53e5b6c160e24cfbfa30926d"
 SRC_URI[rayon-core-1.13.0.sha256sum] = "22e18b0f0062d30d4230b2e85ff77fdfe4326feb054b9783a3460d8435c8ab91"
 SRC_URI[regex-automata-0.4.18.sha256sum] = "ad8553b9b26413251cbf30e620595c7a41b3887f03da04579c0e6b0d6a06b4b2"
+SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rust-ini-0.21.3.sha256sum] = "796e8d2b6696392a43bea58116b667fb4c29727dc5abd27d6acf338bb4f688c7"
 SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
@@ -1214,14 +1203,14 @@ SRC_URI[sponge-cursor-0.1.0.sha256sum] = "3a0219bd7d979d58245a4f41f695e1ac9f8bef
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
-SRC_URI[syn-3.0.3.sha256sum] = "53e9bae58849f64dfa4f5d5ae372c8341f7305f82a3868709269343628b659a3"
-SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
+SRC_URI[syn-3.0.4.sha256sum] = "e6275cddf4610d1775e6d1fe9469b2e77d0f39fd98fb7450901b821e0c53649f"
+SRC_URI[synstructure-0.14.0.sha256sum] = "901704edd0dfe137f1987838ee4f259e4e063c31371bdb423f7ae38ec6f77f02"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
 SRC_URI[thiserror-2.0.20.sha256sum] = "ec86235f5fcc2a73650310756d2ac5b138a5780bbbdfae3eeccec992c435ba4f"
 SRC_URI[thiserror-impl-2.0.20.sha256sum] = "bc04cd3e1236dd4a98afca4569f2deb3f120e5422a4023be2cb683f8486292af"
 SRC_URI[tiny-keccak-2.0.2.sha256sum] = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
-SRC_URI[tinystr-0.8.3.sha256sum] = "c8323304221c2a851516f22236c5722a72eaa19749016521d6dff0824447d96d"
+SRC_URI[tinystr-0.8.4.sha256sum] = "b1e27c91459209c2986af3dcf603a5a74a4368754ce37414f59acc971167f643"
 SRC_URI[type-map-0.5.1.sha256sum] = "cb30dbbd9036155e74adad6812e9898d03ec374946234fbcebd5dfc7b9187b90"
 SRC_URI[typenum-1.20.1.sha256sum] = "b6f5e870be6c3b371b77fe0ee0bafb859fa4964b4404c27de1d380043c4dda20"
 SRC_URI[unic-langid-0.9.6.sha256sum] = "a28ba52c9b05311f4f6e62d5d9d46f094bd6e84cb8df7b3ef952748d752a7d05"
@@ -1235,10 +1224,10 @@ SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa570
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vsimd-0.8.0.sha256sum] = "5c3082ca00d5a5ef149bb8b555a72ae84c9c59f7250f013ac822ac2e49b19c64"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
-SRC_URI[wasm-bindgen-0.2.126.sha256sum] = "4b067c0c11094aef6b7a801c1e34a26affafdf3d051dba08456b868789aaf9a4"
-SRC_URI[wasm-bindgen-macro-0.2.126.sha256sum] = "167ce5e579f6bcf889c4f7175a8a5a585de84e8ff93976ce393efa5f2837aab1"
-SRC_URI[wasm-bindgen-macro-support-0.2.126.sha256sum] = "f3997c7839262f4ef12cf90b818d6340c18e80f263f1a94bf157d0ec4420380e"
-SRC_URI[wasm-bindgen-shared-0.2.126.sha256sum] = "dc1b4cb0cc549fcf58d7dfc081778139b3d283a081644e833e84682ad71cea24"
+SRC_URI[wasm-bindgen-0.2.127.sha256sum] = "1b70935747edd64d89de3efa29d73789b806c15798f8e7dca4d8ac356b50ce70"
+SRC_URI[wasm-bindgen-macro-0.2.127.sha256sum] = "77775f8f3f7217702089053b94958f8f54061a3f663417df76e19cbdcca29bc1"
+SRC_URI[wasm-bindgen-macro-support-0.2.127.sha256sum] = "e11d33f857dc2fb11b8bc75aee111aa9cbeb12cd9f25efd3d4c2a3dd4e235284"
+SRC_URI[wasm-bindgen-shared-0.2.127.sha256sum] = "7ef64dbcc55df09c7e5a46182d181c2cfa3e925f3da937ea764728b4bbb9dcbf"
 SRC_URI[wild-2.2.1.sha256sum] = "a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1"
 SRC_URI[windows-core-0.62.2.sha256sum] = "b8e83a14d34d0623b51dce9581199302a221863196a1dde71a7663a4c2be9deb"
 SRC_URI[windows-implement-0.60.2.sha256sum] = "053e2e040ab57b9dc951b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf"
@@ -1249,12 +1238,13 @@ SRC_URI[windows-strings-0.5.1.sha256sum] = "7837d08f69c77cf6b07689544538e017c1bf
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
 SRC_URI[winnow-1.0.4.sha256sum] = "23b97319f7b8343df12cc98938e5c3eb436064524c8d2b4e30a1d3a36eecdf81"
 SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
-SRC_URI[writeable-0.6.3.sha256sum] = "1ffae5123b2d3fc086436f8834ae3ab053a283cfac8fe0a0b8eaae044768a4c4"
+SRC_URI[writeable-0.6.4.sha256sum] = "3ad82d2a33cdc9674dc7465672f271e096168fcdbe0f799d9e6db8c5892679dc"
 SRC_URI[yoke-0.8.3.sha256sum] = "709fe23a0424b6a435d82152b1bd3fdfb0833487d5fa90d05d42762a9891fef5"
-SRC_URI[yoke-derive-0.8.2.sha256sum] = "de844c262c8848816172cef550288e7dc6c7b7814b4ee56b3e1553f275f1858e"
+SRC_URI[yoke-derive-0.8.3.sha256sum] = "33811428bee40dbceb6d545e95754741d17a6aef9a4849f0fd62e2ba4f412a78"
 SRC_URI[z85-3.0.7.sha256sum] = "c6e61e59a957b7ccee15d2049f86e8bfd6f66968fcd88f018950662d9b86e675"
 SRC_URI[zerofrom-0.1.8.sha256sum] = "0ec05a11813ea801ff6d75110ad09cd0824ddba17dfe17128ea0d5f68e6c5272"
-SRC_URI[zerofrom-derive-0.1.7.sha256sum] = "11532158c46691caf0f2593ea8358fed6bbf68a0315e80aae9bd41fbade684a1"
-SRC_URI[zerotrie-0.2.4.sha256sum] = "0f9152d31db0792fa83f70fb2f83148effb5c1f5b8c7686c3459e361d9bc20bf"
-SRC_URI[zerovec-0.11.6.sha256sum] = "90f911cbc359ab6af17377d242225f4d75119aec87ea711a880987b18cd7b239"
-SRC_URI[zerovec-derive-0.11.3.sha256sum] = "625dc425cab0dca6dc3c3319506e6593dcb08a9f387ea3b284dbd52a92c40555"
+SRC_URI[zerofrom-derive-0.1.8.sha256sum] = "f75b4683f6c7f45248d4d64056a24298c6281e0993356d7d1b4a1a962ef10d4a"
+SRC_URI[zerotrie-0.2.5.sha256sum] = "4ea269c3bd32f0a32c321907a2ae912ba6f4649bb0fc764a15627e99a7095a3f"
+SRC_URI[zerovec-0.11.8.sha256sum] = "bb0464e17806c1d976d5cba29399c7f08e516e279e2ba493f63123b5fca67dd8"
+SRC_URI[zerovec-derive-0.11.6.sha256sum] = "34df6fc39dbd26ddc9c10e6a2984476e13acce22e64e4487636ef494369225da"
+SRC_URI[zlib-rs-0.6.7.sha256sum] = "34b31d188d9d685a4f9c7b46d6e36631b07058d2cfe190267adce54dc230bf12"
diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.11.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
similarity index 98%
rename from meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.11.0.bb
rename to meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
index 4d9a0f525c..26e494209a 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.11.0.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     git://github.com/uutils/coreutils.git;protocol=https;branch=main;tag=${PV} \
 "
 
-SRCREV = "bf65901e1ed82963436844c2cf8e796ba9158c65"
+SRCREV = "dc1efd89948a9ca4c78c3a4b9a6ac891019a8c69"
 
 require ${BPN}-crates.inc
 
-- 
2.43.0


