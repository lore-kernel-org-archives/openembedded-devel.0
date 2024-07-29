Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49412C3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 16:37:10 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.60705.1722271027948520235
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 09:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=PC3rIjgi;
 spf=pass (domain: snapchat.com, ip: 209.85.210.170, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70d333d5890so3345937b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 09:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1722271027; x=1722875827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KdeeFf/btr8bhOWcamoVz5f9lQAMv5I7wCJ5NWrnUTk=;
        b=PC3rIjgiL31uhBXL02xnZNSTh206FLJp0Xzu0ozmwPY1Y2R31exmuCX50mg+GVvvGC
         0CHvP02xtx+yaKvr4dPEbLIYwDGJcm6f0t/4Sj0Fj2TROSARf3E5v9ZSLTA5XA3TFBJz
         /dSTtkEjfTuu9Buz9vMg7D6CwIMOLpxyGnu3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722271027; x=1722875827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdeeFf/btr8bhOWcamoVz5f9lQAMv5I7wCJ5NWrnUTk=;
        b=eF0PPWQXq4OtxTOo25gO8gwQY1UuHe8jgb7aJg3TkgCdca4MZlWu6EujN03+Q7pm4e
         n40irQRtsigRP2oGNo3R7cEjTBd8VGzwvHDXKyscG3mQA8a0xbgZxy9iBAat8Dn89xWT
         5urEvUwO/oO4Zf4ebHqrl7p7+IoVSpbxMiigQYEMszg6Fwdq9YYSDo3jEXJGJ4kdLV9J
         m0ol4tmP28OZTibNPUhqTRXnrbzrVxmDLBcI9voOJG19fV0jEOSR/8RI3gRyhtXfHCy2
         GtrV1YCmE6bSVNQXlJ/XL3pgvsDhsu6kiPqG+Sr0NNQbxHDN14AS46AbNtpW83RkEQ7P
         akcQ==
X-Gm-Message-State: AOJu0Yw0+xqv9kkU7d5F1Id31JA8MAbm3QM+/JhwIlkJEyNB4r5hhPKS
	wmm64olbsjcmDY1l1CbqJdW7JG5KJ9KIRozVtivjrScobToAFrrJs0tGANV5Yw4sre4hg/ACjsQ
	Jl7k=
X-Google-Smtp-Source: AGHT+IFpMwxuPsD39JVVR+O+W3AdjrDn93z+gv+nom2GHPCteNODb/7xaX//bMHE92Dr0uy/y44Piw==
X-Received: by 2002:a05:6a20:a110:b0:1c2:8dcf:1b8f with SMTP id adf61e73a8af0-1c4a1177dadmr13340077637.7.1722271026574;
        Mon, 29 Jul 2024 09:37:06 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28ca12fdsm8747498a91.32.2024.07.29.09.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 09:37:06 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 1/2] uutils-coreutils: upgrade 0.0.25 -> 0.0.26
Date: Mon, 29 Jul 2024 18:36:46 +0200
Message-Id: <20240729163647.4024004-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 16:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111460

From: Etienne Cordonnier <ecordonnier@snap.com>

See https://github.com/uutils/coreutils/releases/tag/0.0.26

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uutils-coreutils-crates.inc               | 106 +++++++++++-------
 ...s_0.0.25.bb => uutils-coreutils_0.0.26.bb} |   2 +-
 2 files changed, 67 insertions(+), 41 deletions(-)
 rename meta-oe/recipes-core/uutils-coreutils/{uutils-coreutils_0.0.25.bb => uutils-coreutils_0.0.26.bb} (98%)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
index 58d832562..3a5bee7ce 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
@@ -3,6 +3,7 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/adler/1.0.2 \
+    crate://crates.io/ahash/0.7.8 \
     crate://crates.io/aho-corasick/1.0.4 \
     crate://crates.io/android-tzdata/0.1.1 \
     crate://crates.io/android_system_properties/0.1.5 \
@@ -11,6 +12,7 @@ SRC_URI += " \
     crate://crates.io/anstyle-parse/0.2.0 \
     crate://crates.io/anstyle-query/1.0.0 \
     crate://crates.io/anstyle-wincon/2.1.0 \
+    crate://crates.io/arbitrary/1.3.2 \
     crate://crates.io/arrayref/0.3.6 \
     crate://crates.io/arrayvec/0.7.4 \
     crate://crates.io/autocfg/1.1.0 \
@@ -19,18 +21,19 @@ SRC_URI += " \
     crate://crates.io/bindgen/0.63.0 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/bitflags/2.4.2 \
+    crate://crates.io/bitvec/1.0.1 \
     crate://crates.io/blake2b_simd/1.0.2 \
     crate://crates.io/blake3/1.5.1 \
     crate://crates.io/block-buffer/0.10.3 \
     crate://crates.io/bstr/1.9.1 \
     crate://crates.io/bumpalo/3.11.1 \
-    crate://crates.io/bytecount/0.6.7 \
+    crate://crates.io/bytecount/0.6.8 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/cc/1.0.79 \
     crate://crates.io/cexpr/0.6.0 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/cfg_aliases/0.1.1 \
-    crate://crates.io/chrono/0.4.35 \
+    crate://crates.io/chrono/0.4.38 \
     crate://crates.io/clang-sys/1.4.0 \
     crate://crates.io/clap/4.4.2 \
     crate://crates.io/clap_builder/4.4.2 \
@@ -43,7 +46,6 @@ SRC_URI += " \
     crate://crates.io/const-random/0.1.16 \
     crate://crates.io/const-random-macro/0.1.16 \
     crate://crates.io/constant_time_eq/0.3.0 \
-    crate://crates.io/conv/0.3.3 \
     crate://crates.io/core-foundation-sys/0.8.3 \
     crate://crates.io/coz/0.1.3 \
     crate://crates.io/cpp/0.5.9 \
@@ -51,20 +53,20 @@ SRC_URI += " \
     crate://crates.io/cpp_common/0.5.9 \
     crate://crates.io/cpp_macros/0.5.9 \
     crate://crates.io/cpufeatures/0.2.5 \
-    crate://crates.io/crc32fast/1.3.2 \
+    crate://crates.io/crc32fast/1.4.0 \
     crate://crates.io/crossbeam-channel/0.5.10 \
     crate://crates.io/crossbeam-deque/0.8.4 \
     crate://crates.io/crossbeam-epoch/0.9.17 \
-    crate://crates.io/crossbeam-utils/0.8.18 \
+    crate://crates.io/crossbeam-utils/0.8.19 \
     crate://crates.io/crossterm/0.27.0 \
     crate://crates.io/crossterm_winapi/0.9.1 \
     crate://crates.io/crunchy/0.2.2 \
     crate://crates.io/crypto-common/0.1.6 \
     crate://crates.io/ctrlc/3.4.4 \
-    crate://crates.io/custom_derive/0.1.7 \
     crate://crates.io/data-encoding/2.5.0 \
     crate://crates.io/data-encoding-macro/0.1.14 \
     crate://crates.io/data-encoding-macro-internal/0.1.12 \
+    crate://crates.io/derive_arbitrary/1.3.2 \
     crate://crates.io/diff/0.1.13 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/dlv-list/0.5.0 \
@@ -77,14 +79,16 @@ SRC_URI += " \
     crate://crates.io/exacl/0.12.0 \
     crate://crates.io/fastrand/2.0.1 \
     crate://crates.io/file_diff/1.0.0 \
+    crate://crates.io/filedescriptor/0.8.2 \
     crate://crates.io/filetime/0.2.23 \
-    crate://crates.io/flate2/1.0.24 \
+    crate://crates.io/flate2/1.0.28 \
     crate://crates.io/fnv/1.0.7 \
     crate://crates.io/fs_extra/1.3.0 \
     crate://crates.io/fsevent-sys/4.1.0 \
     crate://crates.io/fts-sys/0.2.4 \
     crate://crates.io/fundu/2.0.0 \
     crate://crates.io/fundu-core/0.3.0 \
+    crate://crates.io/funty/2.0.0 \
     crate://crates.io/futures/0.3.28 \
     crate://crates.io/futures-channel/0.3.28 \
     crate://crates.io/futures-core/0.3.28 \
@@ -100,11 +104,12 @@ SRC_URI += " \
     crate://crates.io/getrandom/0.2.9 \
     crate://crates.io/glob/0.3.1 \
     crate://crates.io/half/2.4.0 \
-    crate://crates.io/hashbrown/0.13.2 \
+    crate://crates.io/hashbrown/0.12.3 \
+    crate://crates.io/hashbrown/0.14.3 \
     crate://crates.io/hermit-abi/0.3.2 \
     crate://crates.io/hex/0.4.3 \
     crate://crates.io/hex-literal/0.4.1 \
-    crate://crates.io/hostname/0.3.1 \
+    crate://crates.io/hostname/0.4.0 \
     crate://crates.io/iana-time-zone/0.1.53 \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
     crate://crates.io/indicatif/0.17.3 \
@@ -126,13 +131,13 @@ SRC_URI += " \
     crate://crates.io/linux-raw-sys/0.4.12 \
     crate://crates.io/lock_api/0.4.9 \
     crate://crates.io/log/0.4.20 \
+    crate://crates.io/lru/0.7.8 \
     crate://crates.io/lscolors/0.16.0 \
-    crate://crates.io/match_cfg/0.1.0 \
     crate://crates.io/md-5/0.10.6 \
     crate://crates.io/memchr/2.7.1 \
     crate://crates.io/memmap2/0.9.0 \
     crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/miniz_oxide/0.5.4 \
+    crate://crates.io/miniz_oxide/0.7.2 \
     crate://crates.io/mio/0.8.11 \
     crate://crates.io/nix/0.28.0 \
     crate://crates.io/nom/7.1.3 \
@@ -140,13 +145,15 @@ SRC_URI += " \
     crate://crates.io/nu-ansi-term/0.49.0 \
     crate://crates.io/num-bigint/0.4.4 \
     crate://crates.io/num-integer/0.1.45 \
+    crate://crates.io/num-modular/0.5.1 \
+    crate://crates.io/num-prime/0.4.3 \
     crate://crates.io/num-traits/0.2.18 \
     crate://crates.io/num_threads/0.1.6 \
     crate://crates.io/number_prefix/0.4.0 \
     crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/onig/6.4.0 \
     crate://crates.io/onig_sys/69.8.1 \
-    crate://crates.io/ordered-multimap/0.6.0 \
+    crate://crates.io/ordered-multimap/0.7.3 \
     crate://crates.io/os_display/0.1.3 \
     crate://crates.io/parking_lot/0.12.1 \
     crate://crates.io/parking_lot_core/0.9.9 \
@@ -159,7 +166,7 @@ SRC_URI += " \
     crate://crates.io/pin-project-lite/0.2.9 \
     crate://crates.io/pin-utils/0.1.0 \
     crate://crates.io/pkg-config/0.3.26 \
-    crate://crates.io/platform-info/2.0.2 \
+    crate://crates.io/platform-info/2.0.3 \
     crate://crates.io/portable-atomic/0.3.15 \
     crate://crates.io/ppv-lite86/0.2.17 \
     crate://crates.io/pretty_assertions/1.4.0 \
@@ -169,11 +176,12 @@ SRC_URI += " \
     crate://crates.io/quick-error/2.0.1 \
     crate://crates.io/quickcheck/1.0.3 \
     crate://crates.io/quote/1.0.29 \
+    crate://crates.io/radium/0.7.0 \
     crate://crates.io/rand/0.8.5 \
     crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_core/0.6.4 \
     crate://crates.io/rand_pcg/0.3.1 \
-    crate://crates.io/rayon/1.9.0 \
+    crate://crates.io/rayon/1.10.0 \
     crate://crates.io/rayon-core/1.12.1 \
     crate://crates.io/redox_syscall/0.4.1 \
     crate://crates.io/redox_syscall/0.5.0 \
@@ -184,9 +192,9 @@ SRC_URI += " \
     crate://crates.io/relative-path/1.8.0 \
     crate://crates.io/rlimit/0.10.1 \
     crate://crates.io/roff/0.2.1 \
-    crate://crates.io/rstest/0.18.2 \
-    crate://crates.io/rstest_macros/0.18.2 \
-    crate://crates.io/rust-ini/0.19.0 \
+    crate://crates.io/rstest/0.19.0 \
+    crate://crates.io/rstest_macros/0.19.0 \
+    crate://crates.io/rust-ini/0.21.0 \
     crate://crates.io/rustc-hash/1.1.0 \
     crate://crates.io/rustc_version/0.4.0 \
     crate://crates.io/rustix/0.37.26 \
@@ -205,7 +213,7 @@ SRC_URI += " \
     crate://crates.io/shlex/1.3.0 \
     crate://crates.io/signal-hook/0.3.17 \
     crate://crates.io/signal-hook-mio/0.2.3 \
-    crate://crates.io/signal-hook-registry/1.4.0 \
+    crate://crates.io/signal-hook-registry/1.4.1 \
     crate://crates.io/siphasher/0.3.10 \
     crate://crates.io/slab/0.4.7 \
     crate://crates.io/sm3/0.4.2 \
@@ -215,6 +223,7 @@ SRC_URI += " \
     crate://crates.io/strsim/0.10.0 \
     crate://crates.io/syn/1.0.109 \
     crate://crates.io/syn/2.0.32 \
+    crate://crates.io/tap/1.0.1 \
     crate://crates.io/tempfile/3.10.1 \
     crate://crates.io/terminal_size/0.2.6 \
     crate://crates.io/terminal_size/0.3.0 \
@@ -225,6 +234,7 @@ SRC_URI += " \
     crate://crates.io/time-core/0.1.0 \
     crate://crates.io/time-macros/0.2.8 \
     crate://crates.io/tiny-keccak/2.0.2 \
+    crate://crates.io/trim-in-place/0.1.7 \
     crate://crates.io/typenum/1.15.0 \
     crate://crates.io/unicode-ident/1.0.5 \
     crate://crates.io/unicode-linebreak/0.1.5 \
@@ -247,8 +257,10 @@ SRC_URI += " \
     crate://crates.io/wild/2.2.1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.6 \
+    crate://crates.io/winapi-util/0.1.8 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows/0.52.0 \
+    crate://crates.io/windows-core/0.52.0 \
     crate://crates.io/windows-sys/0.45.0 \
     crate://crates.io/windows-sys/0.48.0 \
     crate://crates.io/windows-sys/0.52.0 \
@@ -276,13 +288,15 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_msvc/0.42.2 \
     crate://crates.io/windows_x86_64_msvc/0.48.0 \
     crate://crates.io/windows_x86_64_msvc/0.52.0 \
+    crate://crates.io/wyz/0.5.1 \
     crate://crates.io/xattr/1.3.1 \
     crate://crates.io/yansi/0.5.1 \
     crate://crates.io/z85/3.0.5 \
-    crate://crates.io/zip/0.6.6 \
+    crate://crates.io/zip/1.1.1 \
 "
 
 SRC_URI[adler-1.0.2.sha256sum] = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
+SRC_URI[ahash-0.7.8.sha256sum] = "891477e0c6a8957309ee5c45a6368af3ae14bb510732d2684ffa19af310920f9"
 SRC_URI[aho-corasick-1.0.4.sha256sum] = "6748e8def348ed4d14996fa801f4122cd763fff530258cdc03f64b25f89d3a5a"
 SRC_URI[android-tzdata-0.1.1.sha256sum] = "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0"
 SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
@@ -291,6 +305,7 @@ SRC_URI[anstyle-1.0.0.sha256sum] = "41ed9a86bf92ae6580e0a31281f65a1b1d867c0cc68d
 SRC_URI[anstyle-parse-0.2.0.sha256sum] = "e765fd216e48e067936442276d1d57399e37bce53c264d6fefbe298080cb57ee"
 SRC_URI[anstyle-query-1.0.0.sha256sum] = "5ca11d4be1bab0c8bc8734a9aa7bf4ee8316d462a08c6ac5052f888fef5b494b"
 SRC_URI[anstyle-wincon-2.1.0.sha256sum] = "58f54d10c6dfa51283a066ceab3ec1ab78d13fae00aa49243a45e4571fb79dfd"
+SRC_URI[arbitrary-1.3.2.sha256sum] = "7d5a26814d8dcb93b0e5a0ff3c6d80a8843bafb21b39e8e18a6f05471870e110"
 SRC_URI[arrayref-0.3.6.sha256sum] = "a4c527152e37cf757a3f78aae5a06fbeefdb07ccc535c980a3208ee3060dd544"
 SRC_URI[arrayvec-0.7.4.sha256sum] = "96d30a06541fbafbc7f82ed10c06164cfbd2c401138f6addd8404629c4b16711"
 SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
@@ -299,18 +314,19 @@ SRC_URI[binary-heap-plus-0.5.0.sha256sum] = "e4551d8382e911ecc0d0f0ffb6027779886
 SRC_URI[bindgen-0.63.0.sha256sum] = "36d860121800b2a9a94f9b5604b332d5cffb234ce17609ea479d723dbc9d3885"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[bitflags-2.4.2.sha256sum] = "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
+SRC_URI[bitvec-1.0.1.sha256sum] = "1bc2832c24239b0141d5674bb9174f9d68a8b5b3f2753311927c172ca46f7e9c"
 SRC_URI[blake2b_simd-1.0.2.sha256sum] = "23285ad32269793932e830392f2fe2f83e26488fd3ec778883a93c8323735780"
 SRC_URI[blake3-1.5.1.sha256sum] = "30cca6d3674597c30ddf2c587bf8d9d65c9a84d2326d941cc79c9842dfe0ef52"
 SRC_URI[block-buffer-0.10.3.sha256sum] = "69cce20737498f97b993470a6e536b8523f0af7892a4f928cceb1ac5e52ebe7e"
 SRC_URI[bstr-1.9.1.sha256sum] = "05efc5cfd9110c8416e471df0e96702d58690178e206e61b7173706673c93706"
 SRC_URI[bumpalo-3.11.1.sha256sum] = "572f695136211188308f16ad2ca5c851a712c464060ae6974944458eb83880ba"
-SRC_URI[bytecount-0.6.7.sha256sum] = "e1e5f035d16fc623ae5f74981db80a439803888314e3a555fd6f04acd51a3205"
+SRC_URI[bytecount-0.6.8.sha256sum] = "5ce89b21cab1437276d2650d57e971f9d548a2d9037cc231abdc0562b97498ce"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
 SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[cfg_aliases-0.1.1.sha256sum] = "fd16c4719339c4530435d38e511904438d07cce7950afa3718a84ac36c10e89e"
-SRC_URI[chrono-0.4.35.sha256sum] = "8eaf5903dcbc0a39312feb77df2ff4c76387d591b9fc7b04a238dcf8bb62639a"
+SRC_URI[chrono-0.4.38.sha256sum] = "a21f936df1771bf62b77f047b726c4625ff2e8aa607c01ec06e5a05bd8463401"
 SRC_URI[clang-sys-1.4.0.sha256sum] = "fa2e27ae6ab525c3d369ded447057bca5438d86dc3a68f6faafb8269ba82ebf3"
 SRC_URI[clap-4.4.2.sha256sum] = "6a13b88d2c62ff462f88e4a121f17a82c1af05693a2f192b5c38d14de73c19f6"
 SRC_URI[clap_builder-4.4.2.sha256sum] = "2bb9faaa7c2ef94b2743a21f5a29e6f0010dff4caa69ac8e9d6cf8b6fa74da08"
@@ -323,7 +339,6 @@ SRC_URI[console-0.15.8.sha256sum] = "0e1f83fc076bd6dd27517eacdf25fef6c4dfe5f1d74
 SRC_URI[const-random-0.1.16.sha256sum] = "11df32a13d7892ec42d51d3d175faba5211ffe13ed25d4fb348ac9e9ce835593"
 SRC_URI[const-random-macro-0.1.16.sha256sum] = "f9d839f2a20b0aee515dc581a6172f2321f96cab76c1a38a4c584a194955390e"
 SRC_URI[constant_time_eq-0.3.0.sha256sum] = "f7144d30dcf0fafbce74250a3963025d8d52177934239851c917d29f1df280c2"
-SRC_URI[conv-0.3.3.sha256sum] = "78ff10625fd0ac447827aa30ea8b861fead473bb60aeb73af6c1c58caf0d1299"
 SRC_URI[core-foundation-sys-0.8.3.sha256sum] = "5827cebf4670468b8772dd191856768aedcb1b0278a04f989f7766351917b9dc"
 SRC_URI[coz-0.1.3.sha256sum] = "cef55b3fe2f5477d59e12bc792e8b3c95a25bd099eadcfae006ecea136de76e2"
 SRC_URI[cpp-0.5.9.sha256sum] = "bfa65869ef853e45c60e9828aa08cdd1398cb6e13f3911d9cb2a079b144fcd64"
@@ -331,20 +346,20 @@ SRC_URI[cpp_build-0.5.9.sha256sum] = "0e361fae2caf9758164b24da3eedd7f7d7451be30d
 SRC_URI[cpp_common-0.5.9.sha256sum] = "3e1a2532e4ed4ea13031c13bc7bc0dbca4aae32df48e9d77f0d1e743179f2ea1"
 SRC_URI[cpp_macros-0.5.9.sha256sum] = "47ec9cc90633446f779ef481a9ce5a0077107dd5b87016440448d908625a83fd"
 SRC_URI[cpufeatures-0.2.5.sha256sum] = "28d997bd5e24a5928dd43e46dc529867e207907fe0b239c3477d924f7f2ca320"
-SRC_URI[crc32fast-1.3.2.sha256sum] = "b540bd8bc810d3885c6ea91e2018302f68baba2129ab3e88f32389ee9370880d"
+SRC_URI[crc32fast-1.4.0.sha256sum] = "b3855a8a784b474f333699ef2bbca9db2c4a1f6d9088a90a2d25b1eb53111eaa"
 SRC_URI[crossbeam-channel-0.5.10.sha256sum] = "82a9b73a36529d9c47029b9fb3a6f0ea3cc916a261195352ba19e770fc1748b2"
 SRC_URI[crossbeam-deque-0.8.4.sha256sum] = "fca89a0e215bab21874660c67903c5f143333cab1da83d041c7ded6053774751"
 SRC_URI[crossbeam-epoch-0.9.17.sha256sum] = "0e3681d554572a651dda4186cd47240627c3d0114d45a95f6ad27f2f22e7548d"
-SRC_URI[crossbeam-utils-0.8.18.sha256sum] = "c3a430a770ebd84726f584a90ee7f020d28db52c6d02138900f22341f866d39c"
+SRC_URI[crossbeam-utils-0.8.19.sha256sum] = "248e3bacc7dc6baa3b21e405ee045c3047101a49145e7e9eca583ab4c2ca5345"
 SRC_URI[crossterm-0.27.0.sha256sum] = "f476fe445d41c9e991fd07515a6f463074b782242ccf4a5b7b1d1012e70824df"
 SRC_URI[crossterm_winapi-0.9.1.sha256sum] = "acdd7c62a3665c7f6830a51635d9ac9b23ed385797f70a83bb8bafe9c572ab2b"
 SRC_URI[crunchy-0.2.2.sha256sum] = "7a81dae078cea95a014a339291cec439d2f232ebe854a9d672b796c6afafa9b7"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
 SRC_URI[ctrlc-3.4.4.sha256sum] = "672465ae37dc1bc6380a6547a8883d5dd397b0f1faaad4f265726cc7042a5345"
-SRC_URI[custom_derive-0.1.7.sha256sum] = "ef8ae57c4978a2acd8b869ce6b9ca1dfe817bff704c220209fdef2c0b75a01b9"
 SRC_URI[data-encoding-2.5.0.sha256sum] = "7e962a19be5cfc3f3bf6dd8f61eb50107f356ad6270fbb3ed41476571db78be5"
 SRC_URI[data-encoding-macro-0.1.14.sha256sum] = "20c01c06f5f429efdf2bae21eb67c28b3df3cf85b7dd2d8ef09c0838dac5d33e"
 SRC_URI[data-encoding-macro-internal-0.1.12.sha256sum] = "0047d07f2c89b17dd631c80450d69841a6b5d7fb17278cbc43d7e4cfcf2576f3"
+SRC_URI[derive_arbitrary-1.3.2.sha256sum] = "67e77553c4162a157adbf834ebae5b415acbecbeafc7a74b0e886657506a7611"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[dlv-list-0.5.0.sha256sum] = "d529fd73d344663edfd598ccb3f344e46034db51ebd103518eae34338248ad73"
@@ -357,14 +372,16 @@ SRC_URI[errno-0.3.8.sha256sum] = "a258e46cdc063eb8519c00b9fc845fc47bcfca4130e2f0
 SRC_URI[exacl-0.12.0.sha256sum] = "22be12de19decddab85d09f251ec8363f060ccb22ec9c81bc157c0c8433946d8"
 SRC_URI[fastrand-2.0.1.sha256sum] = "25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5"
 SRC_URI[file_diff-1.0.0.sha256sum] = "31a7a908b8f32538a2143e59a6e4e2508988832d5d4d6f7c156b3cbc762643a5"
+SRC_URI[filedescriptor-0.8.2.sha256sum] = "7199d965852c3bac31f779ef99cbb4537f80e952e2d6aa0ffeb30cce00f4f46e"
 SRC_URI[filetime-0.2.23.sha256sum] = "1ee447700ac8aa0b2f2bd7bc4462ad686ba06baa6727ac149a2d6277f0d240fd"
-SRC_URI[flate2-1.0.24.sha256sum] = "f82b0f4c27ad9f8bfd1f3208d882da2b09c301bc1c828fd3a00d0216d2fbbff6"
+SRC_URI[flate2-1.0.28.sha256sum] = "46303f565772937ffe1d394a4fac6f411c6013172fadde9dcdb1e147a086940e"
 SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
 SRC_URI[fs_extra-1.3.0.sha256sum] = "42703706b716c37f96a77aea830392ad231f44c9e9a67872fa5548707e11b11c"
 SRC_URI[fsevent-sys-4.1.0.sha256sum] = "76ee7a02da4d231650c7cea31349b889be2f45ddb3ef3032d2ec8185f6313fd2"
 SRC_URI[fts-sys-0.2.4.sha256sum] = "9a66c0a21e344f20c87b4ca12643cf4f40a7018f132c98d344e989b959f49dd1"
 SRC_URI[fundu-2.0.0.sha256sum] = "6c04cb831a8dccadfe3774b07cba4574a1ec24974d761510e65d8a543c2d7cb4"
 SRC_URI[fundu-core-0.3.0.sha256sum] = "76a889e633afd839fb5b04fe53adfd588cefe518e71ec8d3c929698c6daf2acd"
+SRC_URI[funty-2.0.0.sha256sum] = "e6d5a32815ae3f33302d95fdcb2ce17862f8c65363dcfd29360480ba1001fc9c"
 SRC_URI[futures-0.3.28.sha256sum] = "23342abe12aba583913b2e62f22225ff9c950774065e4bfb61a19cd9770fec40"
 SRC_URI[futures-channel-0.3.28.sha256sum] = "955518d47e09b25bbebc7a18df10b81f0c766eaf4c4f1cccef2fca5f2a4fb5f2"
 SRC_URI[futures-core-0.3.28.sha256sum] = "4bca583b7e26f571124fe5b7561d49cb2868d79116cfa0eefce955557c6fee8c"
@@ -380,11 +397,12 @@ SRC_URI[generic-array-0.14.6.sha256sum] = "bff49e947297f3312447abdca79f45f473809
 SRC_URI[getrandom-0.2.9.sha256sum] = "c85e1d9ab2eadba7e5040d4e09cbd6d072b76a557ad64e797c2cb9d4da21d7e4"
 SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
 SRC_URI[half-2.4.0.sha256sum] = "b5eceaaeec696539ddaf7b333340f1af35a5aa87ae3e4f3ead0532f72affab2e"
-SRC_URI[hashbrown-0.13.2.sha256sum] = "43a3c133739dddd0d2990f9a4bdf8eb4b21ef50e4851ca85ab661199821d510e"
+SRC_URI[hashbrown-0.12.3.sha256sum] = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
+SRC_URI[hashbrown-0.14.3.sha256sum] = "290f1a1d9242c78d09ce40a5e87e7554ee637af1351968159f4952f028f75604"
 SRC_URI[hermit-abi-0.3.2.sha256sum] = "443144c8cdadd93ebf52ddb4056d257f5b52c04d3c804e657d19eb73fc33668b"
 SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
 SRC_URI[hex-literal-0.4.1.sha256sum] = "6fe2267d4ed49bc07b63801559be28c718ea06c4738b7a03c94df7386d2cde46"
-SRC_URI[hostname-0.3.1.sha256sum] = "3c731c3e10504cc8ed35cfe2f1db4c9274c3d35fa486e3b31df46f068ef3e867"
+SRC_URI[hostname-0.4.0.sha256sum] = "f9c7c7c8ac16c798734b8a24560c1362120597c40d5e1459f09498f8f6c8f2ba"
 SRC_URI[iana-time-zone-0.1.53.sha256sum] = "64c122667b287044802d6ce17ee2ddf13207ed924c712de9a66a5814d5b64765"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
 SRC_URI[indicatif-0.17.3.sha256sum] = "cef509aa9bc73864d6756f0d34d35504af3cf0844373afe9b8669a5b8005a729"
@@ -406,13 +424,13 @@ SRC_URI[linux-raw-sys-0.3.8.sha256sum] = "ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944
 SRC_URI[linux-raw-sys-0.4.12.sha256sum] = "c4cd1a83af159aa67994778be9070f0ae1bd732942279cabb14f86f986a21456"
 SRC_URI[lock_api-0.4.9.sha256sum] = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
 SRC_URI[log-0.4.20.sha256sum] = "b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f"
+SRC_URI[lru-0.7.8.sha256sum] = "e999beba7b6e8345721bd280141ed958096a2e4abdf74f67ff4ce49b4b54e47a"
 SRC_URI[lscolors-0.16.0.sha256sum] = "ab0b209ec3976527806024406fe765474b9a1750a0ed4b8f0372364741f50e7b"
-SRC_URI[match_cfg-0.1.0.sha256sum] = "ffbee8634e0d45d258acb448e7eaab3fce7a0a467395d4d9f228e3c1f01fb2e4"
 SRC_URI[md-5-0.10.6.sha256sum] = "d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf"
 SRC_URI[memchr-2.7.1.sha256sum] = "523dc4f511e55ab87b694dc30d0f820d60906ef06413f93d4d7a1385599cc149"
 SRC_URI[memmap2-0.9.0.sha256sum] = "deaba38d7abf1d4cca21cc89e932e542ba2b9258664d2a9ef0e61512039c9375"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
-SRC_URI[miniz_oxide-0.5.4.sha256sum] = "96590ba8f175222643a85693f33d26e9c8a015f599c216509b1a6894af675d34"
+SRC_URI[miniz_oxide-0.7.2.sha256sum] = "9d811f3e15f28568be3407c8e7fdb6514c1cda3cb30683f15b6a1a1dc4ea14a7"
 SRC_URI[mio-0.8.11.sha256sum] = "a4a650543ca06a924e8b371db273b2756685faae30f8487da1b56505a8f78b0c"
 SRC_URI[nix-0.28.0.sha256sum] = "ab2156c4fce2f8df6c499cc1c763e4394b7482525bf2a9701c9d79d215f519e4"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
@@ -420,13 +438,15 @@ SRC_URI[notify-6.0.1.sha256sum] = "5738a2795d57ea20abec2d6d76c6081186709c0024187
 SRC_URI[nu-ansi-term-0.49.0.sha256sum] = "c073d3c1930d0751774acf49e66653acecb416c3a54c6ec095a9b11caddb5a68"
 SRC_URI[num-bigint-0.4.4.sha256sum] = "608e7659b5c3d7cba262d894801b9ec9d00de989e8a82bd4bef91d08da45cdc0"
 SRC_URI[num-integer-0.1.45.sha256sum] = "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
+SRC_URI[num-modular-0.5.1.sha256sum] = "64a5fe11d4135c3bcdf3a95b18b194afa9608a5f6ff034f5d857bc9a27fb0119"
+SRC_URI[num-prime-0.4.3.sha256sum] = "5f4e3bc495f6e95bc15a6c0c55ac00421504a5a43d09e3cc455d1fea7015581d"
 SRC_URI[num-traits-0.2.18.sha256sum] = "da0df0e5185db44f69b44f26786fe401b6c293d1907744beaa7fa62b2e5a517a"
 SRC_URI[num_threads-0.1.6.sha256sum] = "2819ce041d2ee131036f4fc9d6ae7ae125a3a40e97ba64d04fe799ad9dabbb44"
 SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[onig-6.4.0.sha256sum] = "8c4b31c8722ad9171c6d77d3557db078cab2bd50afcc9d09c8b315c59df8ca4f"
 SRC_URI[onig_sys-69.8.1.sha256sum] = "7b829e3d7e9cc74c7e315ee8edb185bf4190da5acde74afd7fc59c35b1f086e7"
-SRC_URI[ordered-multimap-0.6.0.sha256sum] = "4ed8acf08e98e744e5384c8bc63ceb0364e68a6854187221c18df61c4797690e"
+SRC_URI[ordered-multimap-0.7.3.sha256sum] = "49203cdcae0030493bad186b28da2fa25645fa276a51b6fec8010d281e02ef79"
 SRC_URI[os_display-0.1.3.sha256sum] = "7a6229bad892b46b0dcfaaeb18ad0d2e56400f5aaea05b768bde96e73676cf75"
 SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
 SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
@@ -439,7 +459,7 @@ SRC_URI[phf_shared-0.11.2.sha256sum] = "90fcb95eef784c2ac79119d1dd819e162b5da872
 SRC_URI[pin-project-lite-0.2.9.sha256sum] = "e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0afac116"
 SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
 SRC_URI[pkg-config-0.3.26.sha256sum] = "6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160"
-SRC_URI[platform-info-2.0.2.sha256sum] = "d6259c4860e53bf665016f1b2f46a8859cadfa717581dc9d597ae4069de6300f"
+SRC_URI[platform-info-2.0.3.sha256sum] = "d5ff316b9c4642feda973c18f0decd6c8b0919d4722566f6e4337cce0dd88217"
 SRC_URI[portable-atomic-0.3.15.sha256sum] = "15eb2c6e362923af47e13c23ca5afb859e83d54452c55b0b9ac763b8f7c1ac16"
 SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
 SRC_URI[pretty_assertions-1.4.0.sha256sum] = "af7cee1a6c8a5b9208b3cb1061f10c0cb689087b3d8ce85fb9d2dd7a29b6ba66"
@@ -449,11 +469,12 @@ SRC_URI[procfs-core-0.16.0.sha256sum] = "2d3554923a69f4ce04c4a754260c338f505ce22
 SRC_URI[quick-error-2.0.1.sha256sum] = "a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3"
 SRC_URI[quickcheck-1.0.3.sha256sum] = "588f6378e4dd99458b60ec275b4477add41ce4fa9f64dcba6f15adccb19b50d6"
 SRC_URI[quote-1.0.29.sha256sum] = "573015e8ab27661678357f27dc26460738fd2b6c86e46f386fde94cb5d913105"
+SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
 SRC_URI[rand_pcg-0.3.1.sha256sum] = "59cad018caf63deb318e5a4586d99a24424a364f40f1e5778c29aca23f4fc73e"
-SRC_URI[rayon-1.9.0.sha256sum] = "e4963ed1bc86e4f3ee217022bd855b297cef07fb9eac5dfa1f788b220b49b3bd"
+SRC_URI[rayon-1.10.0.sha256sum] = "b418a60154510ca1a002a752ca9714984e21e4241e804d32555251faf8b78ffa"
 SRC_URI[rayon-core-1.12.1.sha256sum] = "1465873a3dfdaa8ae7cb14b4383657caab0b3e8a0aa9ae8e04b044854c8dfce2"
 SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
 SRC_URI[redox_syscall-0.5.0.sha256sum] = "13c178f952cc7eac391f3124bd9851d1ac0bdbc4c9de2d892ccd5f0d8b160e96"
@@ -464,9 +485,9 @@ SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f487
 SRC_URI[relative-path-1.8.0.sha256sum] = "4bf2521270932c3c7bed1a59151222bd7643c79310f2916f01925e1e16255698"
 SRC_URI[rlimit-0.10.1.sha256sum] = "3560f70f30a0f16d11d01ed078a07740fe6b489667abc7c7b029155d9f21c3d8"
 SRC_URI[roff-0.2.1.sha256sum] = "b833d8d034ea094b1ea68aa6d5c740e0d04bad9d16568d08ba6f76823a114316"
-SRC_URI[rstest-0.18.2.sha256sum] = "97eeab2f3c0a199bc4be135c36c924b6590b88c377d416494288c14f2db30199"
-SRC_URI[rstest_macros-0.18.2.sha256sum] = "d428f8247852f894ee1be110b375111b586d4fa431f6c46e64ba5a0dcccbe605"
-SRC_URI[rust-ini-0.19.0.sha256sum] = "7e2a3bcec1f113553ef1c88aae6c020a369d03d55b58de9869a0908930385091"
+SRC_URI[rstest-0.19.0.sha256sum] = "9d5316d2a1479eeef1ea21e7f9ddc67c191d497abc8fc3ba2467857abbb68330"
+SRC_URI[rstest_macros-0.19.0.sha256sum] = "04a9df72cc1f67020b0d63ad9bfe4a323e459ea7eb68e03bd9824db49f9a4c25"
+SRC_URI[rust-ini-0.21.0.sha256sum] = "0d625ed57d8f49af6cfa514c42e1a71fadcff60eb0b1c517ff82fe41aa025b41"
 SRC_URI[rustc-hash-1.1.0.sha256sum] = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
 SRC_URI[rustc_version-0.4.0.sha256sum] = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
 SRC_URI[rustix-0.37.26.sha256sum] = "84f3f8f960ed3b5a59055428714943298bf3fa2d4a1d53135084e0544829d995"
@@ -485,7 +506,7 @@ SRC_URI[sha3-0.10.8.sha256sum] = "75872d278a8f37ef87fa0ddbda7802605cb18344497949
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[signal-hook-0.3.17.sha256sum] = "8621587d4798caf8eb44879d42e56b9a93ea5dcd315a6487c357130095b62801"
 SRC_URI[signal-hook-mio-0.2.3.sha256sum] = "29ad2e15f37ec9a6cc544097b78a1ec90001e9f71b81338ca39f430adaca99af"
-SRC_URI[signal-hook-registry-1.4.0.sha256sum] = "e51e73328dc4ac0c7ccbda3a494dfa03df1de2f46018127f60c693f2648455b0"
+SRC_URI[signal-hook-registry-1.4.1.sha256sum] = "d8229b473baa5980ac72ef434c4415e70c4b5e71b423043adb4ba059f89c99a1"
 SRC_URI[siphasher-0.3.10.sha256sum] = "7bd3e3206899af3f8b12af284fafc038cc1dc2b41d1b89dd17297221c5d225de"
 SRC_URI[slab-0.4.7.sha256sum] = "4614a76b2a8be0058caa9dbbaf66d988527d86d003c11a94fbd335d7661edcef"
 SRC_URI[sm3-0.4.2.sha256sum] = "ebb9a3b702d0a7e33bc4d85a14456633d2b165c2ad839c5fd9a8417c1ab15860"
@@ -495,6 +516,7 @@ SRC_URI[socket2-0.5.3.sha256sum] = "2538b18701741680e0322a2302176d3253a35388e2e6
 SRC_URI[strsim-0.10.0.sha256sum] = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
 SRC_URI[syn-2.0.32.sha256sum] = "239814284fd6f1a4ffe4ca893952cdd93c224b6a1571c9a9eadd670295c0c9e2"
+SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
 SRC_URI[tempfile-3.10.1.sha256sum] = "85b77fafb263dd9d05cbeac119526425676db3784113aa9295c88498cbf8bff1"
 SRC_URI[terminal_size-0.2.6.sha256sum] = "8e6bf6f19e9f8ed8d4048dc22981458ebcf406d67e94cd422e5ecd73d63b3237"
 SRC_URI[terminal_size-0.3.0.sha256sum] = "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
@@ -505,6 +527,7 @@ SRC_URI[time-0.3.20.sha256sum] = "cd0cbfecb4d19b5ea75bb31ad904eb5b9fa13f21079c3b
 SRC_URI[time-core-0.1.0.sha256sum] = "2e153e1f1acaef8acc537e68b44906d2db6436e2b35ac2c6b42640fff91f00fd"
 SRC_URI[time-macros-0.2.8.sha256sum] = "fd80a657e71da814b8e5d60d3374fc6d35045062245d80224748ae522dd76f36"
 SRC_URI[tiny-keccak-2.0.2.sha256sum] = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
+SRC_URI[trim-in-place-0.1.7.sha256sum] = "343e926fc669bc8cde4fa3129ab681c63671bae288b1f1081ceee6d9d37904fc"
 SRC_URI[typenum-1.15.0.sha256sum] = "dcf81ac59edc17cc8697ff311e8f5ef2d99fcbd9817b34cec66f90b6c3dfd987"
 SRC_URI[unicode-ident-1.0.5.sha256sum] = "6ceab39d59e4c9499d4e5a8ee0e2735b891bb7308ac83dfb4e80cad195c9f6f3"
 SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
@@ -527,8 +550,10 @@ SRC_URI[which-4.3.0.sha256sum] = "1c831fbbee9e129a8cf93e7747a82da9d95ba8e16621ca
 SRC_URI[wild-2.2.1.sha256sum] = "a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.6.sha256sum] = "f29e6f9198ba0d26b4c9f07dbe6f9ed633e1f3d5b8b414090084349e46a52596"
+SRC_URI[winapi-util-0.1.8.sha256sum] = "4d4cc384e1e73b93bafa6fb4f1df8c41695c8a91cf9c4c64358067d15a7b6c6b"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-0.52.0.sha256sum] = "e48a53791691ab099e5e2ad123536d0fff50652600abaf43bbf952894110d0be"
+SRC_URI[windows-core-0.52.0.sha256sum] = "33ab640c8d7e35bf8ba19b884ba838ceb4fba93a4e8c65a9059d08afcfc683d9"
 SRC_URI[windows-sys-0.45.0.sha256sum] = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
 SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
@@ -556,7 +581,8 @@ SRC_URI[windows_x86_64_gnullvm-0.52.0.sha256sum] = "1a657e1e9d3f514745a572a6846d
 SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
 SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
 SRC_URI[windows_x86_64_msvc-0.52.0.sha256sum] = "dff9641d1cd4be8d1a070daf9e3773c5f67e78b4d9d42263020c057706765c04"
+SRC_URI[wyz-0.5.1.sha256sum] = "05f360fc0b24296329c78fda852a1e9ae82de9cf7b27dae4b7f62f118f77b9ed"
 SRC_URI[xattr-1.3.1.sha256sum] = "8da84f1a25939b27f6820d92aed108f83ff920fdf11a7b19366c27c4cda81d4f"
 SRC_URI[yansi-0.5.1.sha256sum] = "09041cd90cf85f7f8b2df60c646f853b7f535ce68f85244eb6731cf89fa498ec"
 SRC_URI[z85-3.0.5.sha256sum] = "2a599daf1b507819c1121f0bf87fa37eb19daac6aff3aefefd4e6e2e0f2020fc"
-SRC_URI[zip-0.6.6.sha256sum] = "760394e246e4c28189f19d488c058bf16f564016aefac5d32bb1f3b51d5e9261"
+SRC_URI[zip-1.1.1.sha256sum] = "f2655979068a1f8fa91cb9e8e5b9d3ee54d18e0ddc358f2f4a395afc0929a84b"
diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.25.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.26.bb
similarity index 98%
rename from meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.25.bb
rename to meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.26.bb
index 61f2dc298..5668aaac5 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.25.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.26.bb
@@ -13,7 +13,7 @@ SRC_URI += "git://github.com/uutils/coreutils.git;protocol=https;branch=main"
 # so src/uucore/src/lib/features.rs disables utmpx when targetting musl.
 COMPATIBLE_HOST:libc-musl = "null"
 
-SRCREV = "68c77b4bd129bdc12d03cc74fe0f817d2df75894"
+SRCREV = "f95f363096610d7e5e1556d6d0a32b5018065c4c"
 S = "${WORKDIR}/git"
 
 require ${BPN}-crates.inc
-- 
2.36.1.vfs.0.0


