Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF4CC3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 16:37:30 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.60272.1722271042066802797
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 09:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=E0QhHIbd;
 spf=pass (domain: snapchat.com, ip: 209.85.215.181, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so2037647a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 09:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1722271041; x=1722875841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gNbOO357wZaTCwbg1GTDH2ubapxrmDT02d2mDuTEm0=;
        b=E0QhHIbdDwoB3WETFSPE3skjclSCmJQXvWJp55ryxiHz2DoKdh+XJ4tkmQi+SccquC
         o3gfFUh4BCz+U09E1qtZ1VPFUAbew9BHTQ9xqHXtFMn/jLeUEhFp+ehAx/vmG5ebUrE1
         gWBrIJT6MiCB+5lUPR8JFYttIsgHrhmjlzMMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722271041; x=1722875841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gNbOO357wZaTCwbg1GTDH2ubapxrmDT02d2mDuTEm0=;
        b=kxs5PLIhLLWMynYefaM+doxV0fWRELOL72WO/jPrnEzslqfsgwVZGjz6PaJDU3P0vF
         Sn7sToTF3C2/4CcAzo+dH5FtV4+uGLgQkKlN/1xUyGHENVDrWUKKF8eA5AE8Mdi3alhC
         cgv7IemHPdnNkICzqPZBSxTBXknAA4/q5RxnoN+2kRn/91/XU2scKTTVwl0y9qpdNVZx
         4I/lN/Tf2pJUJLNubqmIe3+bSrxccbWCx3tkMcuFIwdQTf/eJpgv7OvCe0g0wMvn3EBy
         GlqBGnEtVo4wB6kA2Kr/xOMdFWME4sXPah+nvPgtbAMg/+1DRSsb9ls8yMiVNIBFNfoD
         Pqxg==
X-Gm-Message-State: AOJu0Yxm4fS1kH+nXOIoGsgIAledMEjEHgfIblQVmE8YRDCvIHn6TmWN
	ENEd36KqB39LMGUHJBnIawpL/BVJAA1Uw41Ms7sNUkKRuARRav/VtlWDxhVq5c4G5ex9gt9yPh0
	pOnY=
X-Google-Smtp-Source: AGHT+IF+ObeinZ7lS2jZrp5+TrbsiPrhx027EflqjC87LfuKUC6qXh1sGG5TUGcrb3ZsF8Yt8gWNzg==
X-Received: by 2002:a17:90a:db95:b0:2c9:6514:39ff with SMTP id 98e67ed59e1d1-2cf7e5e0d2bmr6038949a91.33.1722271040346;
        Mon, 29 Jul 2024 09:37:20 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28ca12fdsm8747498a91.32.2024.07.29.09.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 09:37:19 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 2/2] uutils-coreutils: upgrade 0.0.26 -> 0.0.27
Date: Mon, 29 Jul 2024 18:36:47 +0200
Message-Id: <20240729163647.4024004-2-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
In-Reply-To: <20240729163647.4024004-1-ecordonnier@snap.com>
References: <20240729163647.4024004-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 16:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111461

From: Etienne Cordonnier <ecordonnier@snap.com>

See https://github.com/uutils/coreutils/releases/tag/0.0.27

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uutils-coreutils-crates.inc               | 210 ++++++++++--------
 ...s_0.0.26.bb => uutils-coreutils_0.0.27.bb} |   2 +-
 2 files changed, 123 insertions(+), 89 deletions(-)
 rename meta-oe/recipes-core/uutils-coreutils/{uutils-coreutils_0.0.26.bb => uutils-coreutils_0.0.27.bb} (98%)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
index 3a5bee7ce..e5bde3d04 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
@@ -3,10 +3,12 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/adler/1.0.2 \
-    crate://crates.io/ahash/0.7.8 \
+    crate://crates.io/ahash/0.8.11 \
     crate://crates.io/aho-corasick/1.0.4 \
+    crate://crates.io/allocator-api2/0.2.18 \
     crate://crates.io/android-tzdata/0.1.1 \
     crate://crates.io/android_system_properties/0.1.5 \
+    crate://crates.io/ansi-width/0.1.0 \
     crate://crates.io/anstream/0.5.0 \
     crate://crates.io/anstyle/1.0.0 \
     crate://crates.io/anstyle-parse/0.2.0 \
@@ -16,11 +18,12 @@ SRC_URI += " \
     crate://crates.io/arrayref/0.3.6 \
     crate://crates.io/arrayvec/0.7.4 \
     crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/bigdecimal/0.4.0 \
+    crate://crates.io/bigdecimal/0.4.5 \
     crate://crates.io/binary-heap-plus/0.5.0 \
-    crate://crates.io/bindgen/0.63.0 \
+    crate://crates.io/bincode/1.3.3 \
+    crate://crates.io/bindgen/0.69.4 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.4.2 \
+    crate://crates.io/bitflags/2.5.0 \
     crate://crates.io/bitvec/1.0.1 \
     crate://crates.io/blake2b_simd/1.0.2 \
     crate://crates.io/blake3/1.5.1 \
@@ -63,18 +66,21 @@ SRC_URI += " \
     crate://crates.io/crunchy/0.2.2 \
     crate://crates.io/crypto-common/0.1.6 \
     crate://crates.io/ctrlc/3.4.4 \
-    crate://crates.io/data-encoding/2.5.0 \
-    crate://crates.io/data-encoding-macro/0.1.14 \
-    crate://crates.io/data-encoding-macro-internal/0.1.12 \
+    crate://crates.io/data-encoding/2.6.0 \
+    crate://crates.io/data-encoding-macro/0.1.15 \
+    crate://crates.io/data-encoding-macro-internal/0.1.13 \
+    crate://crates.io/deranged/0.3.11 \
     crate://crates.io/derive_arbitrary/1.3.2 \
     crate://crates.io/diff/0.1.13 \
     crate://crates.io/digest/0.10.7 \
+    crate://crates.io/displaydoc/0.2.4 \
     crate://crates.io/dlv-list/0.5.0 \
     crate://crates.io/dns-lookup/2.0.4 \
     crate://crates.io/dunce/1.0.4 \
     crate://crates.io/either/1.8.0 \
     crate://crates.io/encode_unicode/0.3.6 \
     crate://crates.io/env_logger/0.8.4 \
+    crate://crates.io/equivalent/1.0.1 \
     crate://crates.io/errno/0.3.8 \
     crate://crates.io/exacl/0.12.0 \
     crate://crates.io/fastrand/2.0.1 \
@@ -85,7 +91,7 @@ SRC_URI += " \
     crate://crates.io/fnv/1.0.7 \
     crate://crates.io/fs_extra/1.3.0 \
     crate://crates.io/fsevent-sys/4.1.0 \
-    crate://crates.io/fts-sys/0.2.4 \
+    crate://crates.io/fts-sys/0.2.9 \
     crate://crates.io/fundu/2.0.0 \
     crate://crates.io/fundu-core/0.3.0 \
     crate://crates.io/funty/2.0.0 \
@@ -103,8 +109,7 @@ SRC_URI += " \
     crate://crates.io/generic-array/0.14.6 \
     crate://crates.io/getrandom/0.2.9 \
     crate://crates.io/glob/0.3.1 \
-    crate://crates.io/half/2.4.0 \
-    crate://crates.io/hashbrown/0.12.3 \
+    crate://crates.io/half/2.4.1 \
     crate://crates.io/hashbrown/0.14.3 \
     crate://crates.io/hermit-abi/0.3.2 \
     crate://crates.io/hex/0.4.3 \
@@ -112,11 +117,14 @@ SRC_URI += " \
     crate://crates.io/hostname/0.4.0 \
     crate://crates.io/iana-time-zone/0.1.53 \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
-    crate://crates.io/indicatif/0.17.3 \
+    crate://crates.io/indexmap/2.2.6 \
+    crate://crates.io/indicatif/0.17.8 \
     crate://crates.io/inotify/0.9.6 \
     crate://crates.io/inotify-sys/0.1.5 \
+    crate://crates.io/instant/0.1.12 \
     crate://crates.io/io-lifetimes/1.0.11 \
     crate://crates.io/itertools/0.12.1 \
+    crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itoa/1.0.4 \
     crate://crates.io/js-sys/0.3.64 \
     crate://crates.io/keccak/0.1.4 \
@@ -124,18 +132,18 @@ SRC_URI += " \
     crate://crates.io/kqueue-sys/1.0.3 \
     crate://crates.io/lazy_static/1.4.0 \
     crate://crates.io/lazycell/1.3.0 \
-    crate://crates.io/libc/0.2.153 \
+    crate://crates.io/libc/0.2.155 \
     crate://crates.io/libloading/0.7.4 \
     crate://crates.io/libm/0.2.7 \
     crate://crates.io/linux-raw-sys/0.3.8 \
     crate://crates.io/linux-raw-sys/0.4.12 \
     crate://crates.io/lock_api/0.4.9 \
     crate://crates.io/log/0.4.20 \
-    crate://crates.io/lru/0.7.8 \
+    crate://crates.io/lru/0.12.3 \
     crate://crates.io/lscolors/0.16.0 \
     crate://crates.io/md-5/0.10.6 \
-    crate://crates.io/memchr/2.7.1 \
-    crate://crates.io/memmap2/0.9.0 \
+    crate://crates.io/memchr/2.7.4 \
+    crate://crates.io/memmap2/0.9.4 \
     crate://crates.io/minimal-lexical/0.2.1 \
     crate://crates.io/miniz_oxide/0.7.2 \
     crate://crates.io/mio/0.8.11 \
@@ -143,11 +151,12 @@ SRC_URI += " \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/notify/6.0.1 \
     crate://crates.io/nu-ansi-term/0.49.0 \
-    crate://crates.io/num-bigint/0.4.4 \
-    crate://crates.io/num-integer/0.1.45 \
+    crate://crates.io/num-bigint/0.4.5 \
+    crate://crates.io/num-conv/0.1.0 \
+    crate://crates.io/num-integer/0.1.46 \
     crate://crates.io/num-modular/0.5.1 \
-    crate://crates.io/num-prime/0.4.3 \
-    crate://crates.io/num-traits/0.2.18 \
+    crate://crates.io/num-prime/0.4.4 \
+    crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/num_threads/0.1.6 \
     crate://crates.io/number_prefix/0.4.0 \
     crate://crates.io/once_cell/1.19.0 \
@@ -157,8 +166,7 @@ SRC_URI += " \
     crate://crates.io/os_display/0.1.3 \
     crate://crates.io/parking_lot/0.12.1 \
     crate://crates.io/parking_lot_core/0.9.9 \
-    crate://crates.io/parse_datetime/0.5.0 \
-    crate://crates.io/peeking_take_while/0.1.2 \
+    crate://crates.io/parse_datetime/0.6.0 \
     crate://crates.io/phf/0.11.2 \
     crate://crates.io/phf_codegen/0.11.2 \
     crate://crates.io/phf_generator/0.11.1 \
@@ -167,15 +175,18 @@ SRC_URI += " \
     crate://crates.io/pin-utils/0.1.0 \
     crate://crates.io/pkg-config/0.3.26 \
     crate://crates.io/platform-info/2.0.3 \
-    crate://crates.io/portable-atomic/0.3.15 \
+    crate://crates.io/portable-atomic/1.6.0 \
+    crate://crates.io/powerfmt/0.2.0 \
     crate://crates.io/ppv-lite86/0.2.17 \
     crate://crates.io/pretty_assertions/1.4.0 \
-    crate://crates.io/proc-macro2/1.0.63 \
+    crate://crates.io/prettyplease/0.2.19 \
+    crate://crates.io/proc-macro-crate/3.1.0 \
+    crate://crates.io/proc-macro2/1.0.86 \
     crate://crates.io/procfs/0.16.0 \
     crate://crates.io/procfs-core/0.16.0 \
     crate://crates.io/quick-error/2.0.1 \
     crate://crates.io/quickcheck/1.0.3 \
-    crate://crates.io/quote/1.0.29 \
+    crate://crates.io/quote/1.0.36 \
     crate://crates.io/radium/0.7.0 \
     crate://crates.io/rand/0.8.5 \
     crate://crates.io/rand_chacha/0.3.1 \
@@ -184,16 +195,16 @@ SRC_URI += " \
     crate://crates.io/rayon/1.10.0 \
     crate://crates.io/rayon-core/1.12.1 \
     crate://crates.io/redox_syscall/0.4.1 \
-    crate://crates.io/redox_syscall/0.5.0 \
+    crate://crates.io/redox_syscall/0.5.2 \
     crate://crates.io/reference-counted-singleton/0.1.2 \
-    crate://crates.io/regex/1.10.4 \
+    crate://crates.io/regex/1.10.5 \
     crate://crates.io/regex-automata/0.4.4 \
     crate://crates.io/regex-syntax/0.8.2 \
     crate://crates.io/relative-path/1.8.0 \
     crate://crates.io/rlimit/0.10.1 \
     crate://crates.io/roff/0.2.1 \
-    crate://crates.io/rstest/0.19.0 \
-    crate://crates.io/rstest_macros/0.19.0 \
+    crate://crates.io/rstest/0.21.0 \
+    crate://crates.io/rstest_macros/0.21.0 \
     crate://crates.io/rust-ini/0.21.0 \
     crate://crates.io/rustc-hash/1.1.0 \
     crate://crates.io/rustc_version/0.4.0 \
@@ -201,12 +212,13 @@ SRC_URI += " \
     crate://crates.io/rustix/0.38.31 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/scopeguard/1.2.0 \
-    crate://crates.io/self_cell/1.0.3 \
-    crate://crates.io/selinux/0.4.0 \
-    crate://crates.io/selinux-sys/0.6.2 \
+    crate://crates.io/self_cell/1.0.4 \
+    crate://crates.io/selinux/0.4.4 \
+    crate://crates.io/selinux-sys/0.6.9 \
     crate://crates.io/semver/1.0.14 \
-    crate://crates.io/serde/1.0.193 \
-    crate://crates.io/serde_derive/1.0.193 \
+    crate://crates.io/serde/1.0.203 \
+    crate://crates.io/serde-big-array/0.5.1 \
+    crate://crates.io/serde_derive/1.0.203 \
     crate://crates.io/sha1/0.10.6 \
     crate://crates.io/sha2/0.10.8 \
     crate://crates.io/sha3/0.10.8 \
@@ -217,34 +229,36 @@ SRC_URI += " \
     crate://crates.io/siphasher/0.3.10 \
     crate://crates.io/slab/0.4.7 \
     crate://crates.io/sm3/0.4.2 \
-    crate://crates.io/smallvec/1.13.1 \
+    crate://crates.io/smallvec/1.13.2 \
     crate://crates.io/smawk/0.3.1 \
     crate://crates.io/socket2/0.5.3 \
     crate://crates.io/strsim/0.10.0 \
     crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.32 \
+    crate://crates.io/syn/2.0.60 \
     crate://crates.io/tap/1.0.1 \
     crate://crates.io/tempfile/3.10.1 \
     crate://crates.io/terminal_size/0.2.6 \
     crate://crates.io/terminal_size/0.3.0 \
     crate://crates.io/textwrap/0.16.1 \
-    crate://crates.io/thiserror/1.0.37 \
-    crate://crates.io/thiserror-impl/1.0.37 \
-    crate://crates.io/time/0.3.20 \
-    crate://crates.io/time-core/0.1.0 \
-    crate://crates.io/time-macros/0.2.8 \
+    crate://crates.io/thiserror/1.0.61 \
+    crate://crates.io/thiserror-impl/1.0.61 \
+    crate://crates.io/time/0.3.36 \
+    crate://crates.io/time-core/0.1.2 \
+    crate://crates.io/time-macros/0.2.18 \
     crate://crates.io/tiny-keccak/2.0.2 \
+    crate://crates.io/toml_datetime/0.6.6 \
+    crate://crates.io/toml_edit/0.21.1 \
     crate://crates.io/trim-in-place/0.1.7 \
     crate://crates.io/typenum/1.15.0 \
     crate://crates.io/unicode-ident/1.0.5 \
     crate://crates.io/unicode-linebreak/0.1.5 \
     crate://crates.io/unicode-segmentation/1.11.0 \
-    crate://crates.io/unicode-width/0.1.11 \
+    crate://crates.io/unicode-width/0.1.12 \
     crate://crates.io/unicode-xid/0.2.4 \
-    crate://crates.io/unindent/0.2.1 \
+    crate://crates.io/unindent/0.2.3 \
     crate://crates.io/utf8parse/0.2.1 \
     crate://crates.io/uuid/1.7.0 \
-    crate://crates.io/uutils_term_grid/0.3.0 \
+    crate://crates.io/uutils_term_grid/0.6.0 \
     crate://crates.io/version_check/0.9.4 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
@@ -288,18 +302,23 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_msvc/0.42.2 \
     crate://crates.io/windows_x86_64_msvc/0.48.0 \
     crate://crates.io/windows_x86_64_msvc/0.52.0 \
+    crate://crates.io/winnow/0.5.40 \
     crate://crates.io/wyz/0.5.1 \
     crate://crates.io/xattr/1.3.1 \
     crate://crates.io/yansi/0.5.1 \
     crate://crates.io/z85/3.0.5 \
-    crate://crates.io/zip/1.1.1 \
+    crate://crates.io/zerocopy/0.7.33 \
+    crate://crates.io/zerocopy-derive/0.7.33 \
+    crate://crates.io/zip/1.3.0 \
 "
 
 SRC_URI[adler-1.0.2.sha256sum] = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
-SRC_URI[ahash-0.7.8.sha256sum] = "891477e0c6a8957309ee5c45a6368af3ae14bb510732d2684ffa19af310920f9"
+SRC_URI[ahash-0.8.11.sha256sum] = "e89da841a80418a9b391ebaea17f5c112ffaaa96f621d2c285b5174da76b9011"
 SRC_URI[aho-corasick-1.0.4.sha256sum] = "6748e8def348ed4d14996fa801f4122cd763fff530258cdc03f64b25f89d3a5a"
+SRC_URI[allocator-api2-0.2.18.sha256sum] = "5c6cb57a04249c6480766f7f7cef5467412af1490f8d1e243141daddada3264f"
 SRC_URI[android-tzdata-0.1.1.sha256sum] = "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0"
 SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
+SRC_URI[ansi-width-0.1.0.sha256sum] = "219e3ce6f2611d83b51ec2098a12702112c29e57203a6b0a0929b2cddb486608"
 SRC_URI[anstream-0.5.0.sha256sum] = "b1f58811cfac344940f1a400b6e6231ce35171f614f26439e80f8c1465c5cc0c"
 SRC_URI[anstyle-1.0.0.sha256sum] = "41ed9a86bf92ae6580e0a31281f65a1b1d867c0cc68d5346e2ae128dddfa6a7d"
 SRC_URI[anstyle-parse-0.2.0.sha256sum] = "e765fd216e48e067936442276d1d57399e37bce53c264d6fefbe298080cb57ee"
@@ -309,11 +328,12 @@ SRC_URI[arbitrary-1.3.2.sha256sum] = "7d5a26814d8dcb93b0e5a0ff3c6d80a8843bafb21b
 SRC_URI[arrayref-0.3.6.sha256sum] = "a4c527152e37cf757a3f78aae5a06fbeefdb07ccc535c980a3208ee3060dd544"
 SRC_URI[arrayvec-0.7.4.sha256sum] = "96d30a06541fbafbc7f82ed10c06164cfbd2c401138f6addd8404629c4b16711"
 SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[bigdecimal-0.4.0.sha256sum] = "5274a6b6e0ee020148397245b973e30163b7bffbc6d473613f850cb99888581e"
+SRC_URI[bigdecimal-0.4.5.sha256sum] = "51d712318a27c7150326677b321a5fa91b55f6d9034ffd67f20319e147d40cee"
 SRC_URI[binary-heap-plus-0.5.0.sha256sum] = "e4551d8382e911ecc0d0f0ffb602777988669be09447d536ff4388d1def11296"
-SRC_URI[bindgen-0.63.0.sha256sum] = "36d860121800b2a9a94f9b5604b332d5cffb234ce17609ea479d723dbc9d3885"
+SRC_URI[bincode-1.3.3.sha256sum] = "b1f45e9417d87227c7a56d22e471c6206462cba514c7590c09aff4cf6d1ddcad"
+SRC_URI[bindgen-0.69.4.sha256sum] = "a00dc851838a2120612785d195287475a3ac45514741da670b735818822129a0"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.4.2.sha256sum] = "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
+SRC_URI[bitflags-2.5.0.sha256sum] = "cf4b9d6a944f767f8e5e0db018570623c85f3d925ac718db4e06d0187adb21c1"
 SRC_URI[bitvec-1.0.1.sha256sum] = "1bc2832c24239b0141d5674bb9174f9d68a8b5b3f2753311927c172ca46f7e9c"
 SRC_URI[blake2b_simd-1.0.2.sha256sum] = "23285ad32269793932e830392f2fe2f83e26488fd3ec778883a93c8323735780"
 SRC_URI[blake3-1.5.1.sha256sum] = "30cca6d3674597c30ddf2c587bf8d9d65c9a84d2326d941cc79c9842dfe0ef52"
@@ -356,18 +376,21 @@ SRC_URI[crossterm_winapi-0.9.1.sha256sum] = "acdd7c62a3665c7f6830a51635d9ac9b23e
 SRC_URI[crunchy-0.2.2.sha256sum] = "7a81dae078cea95a014a339291cec439d2f232ebe854a9d672b796c6afafa9b7"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
 SRC_URI[ctrlc-3.4.4.sha256sum] = "672465ae37dc1bc6380a6547a8883d5dd397b0f1faaad4f265726cc7042a5345"
-SRC_URI[data-encoding-2.5.0.sha256sum] = "7e962a19be5cfc3f3bf6dd8f61eb50107f356ad6270fbb3ed41476571db78be5"
-SRC_URI[data-encoding-macro-0.1.14.sha256sum] = "20c01c06f5f429efdf2bae21eb67c28b3df3cf85b7dd2d8ef09c0838dac5d33e"
-SRC_URI[data-encoding-macro-internal-0.1.12.sha256sum] = "0047d07f2c89b17dd631c80450d69841a6b5d7fb17278cbc43d7e4cfcf2576f3"
+SRC_URI[data-encoding-2.6.0.sha256sum] = "e8566979429cf69b49a5c740c60791108e86440e8be149bbea4fe54d2c32d6e2"
+SRC_URI[data-encoding-macro-0.1.15.sha256sum] = "f1559b6cba622276d6d63706db152618eeb15b89b3e4041446b05876e352e639"
+SRC_URI[data-encoding-macro-internal-0.1.13.sha256sum] = "332d754c0af53bc87c108fed664d121ecf59207ec4196041f04d6ab9002ad33f"
+SRC_URI[deranged-0.3.11.sha256sum] = "b42b6fa04a440b495c8b04d0e71b707c585f83cb9cb28cf8cd0d976c315e31b4"
 SRC_URI[derive_arbitrary-1.3.2.sha256sum] = "67e77553c4162a157adbf834ebae5b415acbecbeafc7a74b0e886657506a7611"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
+SRC_URI[displaydoc-0.2.4.sha256sum] = "487585f4d0c6655fe74905e2504d8ad6908e4db67f744eb140876906c2f3175d"
 SRC_URI[dlv-list-0.5.0.sha256sum] = "d529fd73d344663edfd598ccb3f344e46034db51ebd103518eae34338248ad73"
 SRC_URI[dns-lookup-2.0.4.sha256sum] = "e5766087c2235fec47fafa4cfecc81e494ee679d0fd4a59887ea0919bfb0e4fc"
 SRC_URI[dunce-1.0.4.sha256sum] = "56ce8c6da7551ec6c462cbaf3bfbc75131ebbfa1c944aeaa9dab51ca1c5f0c3b"
 SRC_URI[either-1.8.0.sha256sum] = "90e5c1c8368803113bf0c9584fc495a58b86dc8a29edbf8fe877d21d9507e797"
 SRC_URI[encode_unicode-0.3.6.sha256sum] = "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
 SRC_URI[env_logger-0.8.4.sha256sum] = "a19187fea3ac7e84da7dacf48de0c45d63c6a76f9490dae389aead16c243fce3"
+SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
 SRC_URI[errno-0.3.8.sha256sum] = "a258e46cdc063eb8519c00b9fc845fc47bcfca4130e2f08e88665ceda8474245"
 SRC_URI[exacl-0.12.0.sha256sum] = "22be12de19decddab85d09f251ec8363f060ccb22ec9c81bc157c0c8433946d8"
 SRC_URI[fastrand-2.0.1.sha256sum] = "25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5"
@@ -378,7 +401,7 @@ SRC_URI[flate2-1.0.28.sha256sum] = "46303f565772937ffe1d394a4fac6f411c6013172fad
 SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
 SRC_URI[fs_extra-1.3.0.sha256sum] = "42703706b716c37f96a77aea830392ad231f44c9e9a67872fa5548707e11b11c"
 SRC_URI[fsevent-sys-4.1.0.sha256sum] = "76ee7a02da4d231650c7cea31349b889be2f45ddb3ef3032d2ec8185f6313fd2"
-SRC_URI[fts-sys-0.2.4.sha256sum] = "9a66c0a21e344f20c87b4ca12643cf4f40a7018f132c98d344e989b959f49dd1"
+SRC_URI[fts-sys-0.2.9.sha256sum] = "4e184d5f593d19793f26afb6f9a58d25f0bc755c4e48890ffcba6db416153ebb"
 SRC_URI[fundu-2.0.0.sha256sum] = "6c04cb831a8dccadfe3774b07cba4574a1ec24974d761510e65d8a543c2d7cb4"
 SRC_URI[fundu-core-0.3.0.sha256sum] = "76a889e633afd839fb5b04fe53adfd588cefe518e71ec8d3c929698c6daf2acd"
 SRC_URI[funty-2.0.0.sha256sum] = "e6d5a32815ae3f33302d95fdcb2ce17862f8c65363dcfd29360480ba1001fc9c"
@@ -396,8 +419,7 @@ SRC_URI[gcd-2.3.0.sha256sum] = "1d758ba1b47b00caf47f24925c0074ecb20d6dfcffe7f6d5
 SRC_URI[generic-array-0.14.6.sha256sum] = "bff49e947297f3312447abdca79f45f4738097cc82b06e72054d2223f601f1b9"
 SRC_URI[getrandom-0.2.9.sha256sum] = "c85e1d9ab2eadba7e5040d4e09cbd6d072b76a557ad64e797c2cb9d4da21d7e4"
 SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
-SRC_URI[half-2.4.0.sha256sum] = "b5eceaaeec696539ddaf7b333340f1af35a5aa87ae3e4f3ead0532f72affab2e"
-SRC_URI[hashbrown-0.12.3.sha256sum] = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
+SRC_URI[half-2.4.1.sha256sum] = "6dd08c532ae367adf81c312a4580bc67f1d0fe8bc9c460520283f4c0ff277888"
 SRC_URI[hashbrown-0.14.3.sha256sum] = "290f1a1d9242c78d09ce40a5e87e7554ee637af1351968159f4952f028f75604"
 SRC_URI[hermit-abi-0.3.2.sha256sum] = "443144c8cdadd93ebf52ddb4056d257f5b52c04d3c804e657d19eb73fc33668b"
 SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
@@ -405,11 +427,14 @@ SRC_URI[hex-literal-0.4.1.sha256sum] = "6fe2267d4ed49bc07b63801559be28c718ea06c4
 SRC_URI[hostname-0.4.0.sha256sum] = "f9c7c7c8ac16c798734b8a24560c1362120597c40d5e1459f09498f8f6c8f2ba"
 SRC_URI[iana-time-zone-0.1.53.sha256sum] = "64c122667b287044802d6ce17ee2ddf13207ed924c712de9a66a5814d5b64765"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
-SRC_URI[indicatif-0.17.3.sha256sum] = "cef509aa9bc73864d6756f0d34d35504af3cf0844373afe9b8669a5b8005a729"
+SRC_URI[indexmap-2.2.6.sha256sum] = "168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26"
+SRC_URI[indicatif-0.17.8.sha256sum] = "763a5a8f45087d6bcea4222e7b72c291a054edf80e4ef6efd2a4979878c7bea3"
 SRC_URI[inotify-0.9.6.sha256sum] = "f8069d3ec154eb856955c1c0fbffefbf5f3c40a104ec912d4797314c1801abff"
 SRC_URI[inotify-sys-0.1.5.sha256sum] = "e05c02b5e89bff3b946cedeca278abc628fe811e604f027c45a8aa3cf793d0eb"
+SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
 SRC_URI[io-lifetimes-1.0.11.sha256sum] = "eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2"
 SRC_URI[itertools-0.12.1.sha256sum] = "ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569"
+SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itoa-1.0.4.sha256sum] = "4217ad341ebadf8d8e724e264f13e593e0648f5b3e94b3896a5df283be015ecc"
 SRC_URI[js-sys-0.3.64.sha256sum] = "c5f195fe497f702db0f318b07fdd68edb16955aed830df8363d837542f8f935a"
 SRC_URI[keccak-0.1.4.sha256sum] = "8f6d5ed8676d904364de097082f4e7d240b571b67989ced0240f08b7f966f940"
@@ -417,18 +442,18 @@ SRC_URI[kqueue-1.0.7.sha256sum] = "2c8fc60ba15bf51257aa9807a48a61013db043fcf3a78
 SRC_URI[kqueue-sys-1.0.3.sha256sum] = "8367585489f01bc55dd27404dcf56b95e6da061a256a666ab23be9ba96a2e587"
 SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
 SRC_URI[lazycell-1.3.0.sha256sum] = "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
-SRC_URI[libc-0.2.153.sha256sum] = "9c198f91728a82281a64e1f4f9eeb25d82cb32a5de251c6bd1b5154d63a8e7bd"
+SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
 SRC_URI[libloading-0.7.4.sha256sum] = "b67380fd3b2fbe7527a606e18729d21c6f3951633d0500574c4dc22d2d638b9f"
 SRC_URI[libm-0.2.7.sha256sum] = "f7012b1bbb0719e1097c47611d3898568c546d597c2e74d66f6087edd5233ff4"
 SRC_URI[linux-raw-sys-0.3.8.sha256sum] = "ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519"
 SRC_URI[linux-raw-sys-0.4.12.sha256sum] = "c4cd1a83af159aa67994778be9070f0ae1bd732942279cabb14f86f986a21456"
 SRC_URI[lock_api-0.4.9.sha256sum] = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
 SRC_URI[log-0.4.20.sha256sum] = "b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f"
-SRC_URI[lru-0.7.8.sha256sum] = "e999beba7b6e8345721bd280141ed958096a2e4abdf74f67ff4ce49b4b54e47a"
+SRC_URI[lru-0.12.3.sha256sum] = "d3262e75e648fce39813cb56ac41f3c3e3f65217ebf3844d818d1f9398cfb0dc"
 SRC_URI[lscolors-0.16.0.sha256sum] = "ab0b209ec3976527806024406fe765474b9a1750a0ed4b8f0372364741f50e7b"
 SRC_URI[md-5-0.10.6.sha256sum] = "d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf"
-SRC_URI[memchr-2.7.1.sha256sum] = "523dc4f511e55ab87b694dc30d0f820d60906ef06413f93d4d7a1385599cc149"
-SRC_URI[memmap2-0.9.0.sha256sum] = "deaba38d7abf1d4cca21cc89e932e542ba2b9258664d2a9ef0e61512039c9375"
+SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
+SRC_URI[memmap2-0.9.4.sha256sum] = "fe751422e4a8caa417e13c3ea66452215d7d63e19e604f4980461212f3ae1322"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
 SRC_URI[miniz_oxide-0.7.2.sha256sum] = "9d811f3e15f28568be3407c8e7fdb6514c1cda3cb30683f15b6a1a1dc4ea14a7"
 SRC_URI[mio-0.8.11.sha256sum] = "a4a650543ca06a924e8b371db273b2756685faae30f8487da1b56505a8f78b0c"
@@ -436,11 +461,12 @@ SRC_URI[nix-0.28.0.sha256sum] = "ab2156c4fce2f8df6c499cc1c763e4394b7482525bf2a97
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[notify-6.0.1.sha256sum] = "5738a2795d57ea20abec2d6d76c6081186709c0024187cd5977265eda6598b51"
 SRC_URI[nu-ansi-term-0.49.0.sha256sum] = "c073d3c1930d0751774acf49e66653acecb416c3a54c6ec095a9b11caddb5a68"
-SRC_URI[num-bigint-0.4.4.sha256sum] = "608e7659b5c3d7cba262d894801b9ec9d00de989e8a82bd4bef91d08da45cdc0"
-SRC_URI[num-integer-0.1.45.sha256sum] = "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
+SRC_URI[num-bigint-0.4.5.sha256sum] = "c165a9ab64cf766f73521c0dd2cfdff64f488b8f0b3e621face3462d3db536d7"
+SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
+SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
 SRC_URI[num-modular-0.5.1.sha256sum] = "64a5fe11d4135c3bcdf3a95b18b194afa9608a5f6ff034f5d857bc9a27fb0119"
-SRC_URI[num-prime-0.4.3.sha256sum] = "5f4e3bc495f6e95bc15a6c0c55ac00421504a5a43d09e3cc455d1fea7015581d"
-SRC_URI[num-traits-0.2.18.sha256sum] = "da0df0e5185db44f69b44f26786fe401b6c293d1907744beaa7fa62b2e5a517a"
+SRC_URI[num-prime-0.4.4.sha256sum] = "e238432a7881ec7164503ccc516c014bf009be7984cde1ba56837862543bdec3"
+SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[num_threads-0.1.6.sha256sum] = "2819ce041d2ee131036f4fc9d6ae7ae125a3a40e97ba64d04fe799ad9dabbb44"
 SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
@@ -450,8 +476,7 @@ SRC_URI[ordered-multimap-0.7.3.sha256sum] = "49203cdcae0030493bad186b28da2fa2564
 SRC_URI[os_display-0.1.3.sha256sum] = "7a6229bad892b46b0dcfaaeb18ad0d2e56400f5aaea05b768bde96e73676cf75"
 SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
 SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
-SRC_URI[parse_datetime-0.5.0.sha256sum] = "3bbf4e25b13841080e018a1e666358adfe5e39b6d353f986ca5091c210b586a1"
-SRC_URI[peeking_take_while-0.1.2.sha256sum] = "19b17cddbe7ec3f8bc800887bab5e717348c95ea2ca0b1bf0837fb964dc67099"
+SRC_URI[parse_datetime-0.6.0.sha256sum] = "a8720474e3dd4af20cea8716703498b9f3b690f318fa9d9d9e2e38eaf44b96d0"
 SRC_URI[phf-0.11.2.sha256sum] = "ade2d8b8f33c7333b51bcf0428d37e217e9f32192ae4772156f65063b8ce03dc"
 SRC_URI[phf_codegen-0.11.2.sha256sum] = "e8d39688d359e6b34654d328e262234662d16cc0f60ec8dcbe5e718709342a5a"
 SRC_URI[phf_generator-0.11.1.sha256sum] = "b1181c94580fa345f50f19d738aaa39c0ed30a600d95cb2d3e23f94266f14fbf"
@@ -460,15 +485,18 @@ SRC_URI[pin-project-lite-0.2.9.sha256sum] = "e0a7ae3ac2f1173085d398531c705756c94
 SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
 SRC_URI[pkg-config-0.3.26.sha256sum] = "6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160"
 SRC_URI[platform-info-2.0.3.sha256sum] = "d5ff316b9c4642feda973c18f0decd6c8b0919d4722566f6e4337cce0dd88217"
-SRC_URI[portable-atomic-0.3.15.sha256sum] = "15eb2c6e362923af47e13c23ca5afb859e83d54452c55b0b9ac763b8f7c1ac16"
+SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
+SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
 SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
 SRC_URI[pretty_assertions-1.4.0.sha256sum] = "af7cee1a6c8a5b9208b3cb1061f10c0cb689087b3d8ce85fb9d2dd7a29b6ba66"
-SRC_URI[proc-macro2-1.0.63.sha256sum] = "7b368fba921b0dce7e60f5e04ec15e565b3303972b42bcfde1d0713b881959eb"
+SRC_URI[prettyplease-0.2.19.sha256sum] = "5ac2cf0f2e4f42b49f5ffd07dae8d746508ef7526c13940e5f524012ae6c6550"
+SRC_URI[proc-macro-crate-3.1.0.sha256sum] = "6d37c51ca738a55da99dc0c4a34860fd675453b8b36209178c2249bb13651284"
+SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
 SRC_URI[procfs-0.16.0.sha256sum] = "731e0d9356b0c25f16f33b5be79b1c57b562f141ebfcdb0ad8ac2c13a24293b4"
 SRC_URI[procfs-core-0.16.0.sha256sum] = "2d3554923a69f4ce04c4a754260c338f505ce22642d3830e049a399fc2059a29"
 SRC_URI[quick-error-2.0.1.sha256sum] = "a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3"
 SRC_URI[quickcheck-1.0.3.sha256sum] = "588f6378e4dd99458b60ec275b4477add41ce4fa9f64dcba6f15adccb19b50d6"
-SRC_URI[quote-1.0.29.sha256sum] = "573015e8ab27661678357f27dc26460738fd2b6c86e46f386fde94cb5d913105"
+SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
@@ -477,16 +505,16 @@ SRC_URI[rand_pcg-0.3.1.sha256sum] = "59cad018caf63deb318e5a4586d99a24424a364f40f
 SRC_URI[rayon-1.10.0.sha256sum] = "b418a60154510ca1a002a752ca9714984e21e4241e804d32555251faf8b78ffa"
 SRC_URI[rayon-core-1.12.1.sha256sum] = "1465873a3dfdaa8ae7cb14b4383657caab0b3e8a0aa9ae8e04b044854c8dfce2"
 SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
-SRC_URI[redox_syscall-0.5.0.sha256sum] = "13c178f952cc7eac391f3124bd9851d1ac0bdbc4c9de2d892ccd5f0d8b160e96"
+SRC_URI[redox_syscall-0.5.2.sha256sum] = "c82cf8cff14456045f55ec4241383baeff27af886adb72ffb2162f99911de0fd"
 SRC_URI[reference-counted-singleton-0.1.2.sha256sum] = "f1bfbf25d7eb88ddcbb1ec3d755d0634da8f7657b2cb8b74089121409ab8228f"
-SRC_URI[regex-1.10.4.sha256sum] = "c117dbdfde9c8308975b6a18d71f3f385c89461f7b3fb054288ecf2a2058ba4c"
+SRC_URI[regex-1.10.5.sha256sum] = "b91213439dad192326a0d7c6ee3955910425f441d7038e0d6933b0aec5c4517f"
 SRC_URI[regex-automata-0.4.4.sha256sum] = "3b7fa1134405e2ec9353fd416b17f8dacd46c473d7d3fd1cf202706a14eb792a"
 SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
 SRC_URI[relative-path-1.8.0.sha256sum] = "4bf2521270932c3c7bed1a59151222bd7643c79310f2916f01925e1e16255698"
 SRC_URI[rlimit-0.10.1.sha256sum] = "3560f70f30a0f16d11d01ed078a07740fe6b489667abc7c7b029155d9f21c3d8"
 SRC_URI[roff-0.2.1.sha256sum] = "b833d8d034ea094b1ea68aa6d5c740e0d04bad9d16568d08ba6f76823a114316"
-SRC_URI[rstest-0.19.0.sha256sum] = "9d5316d2a1479eeef1ea21e7f9ddc67c191d497abc8fc3ba2467857abbb68330"
-SRC_URI[rstest_macros-0.19.0.sha256sum] = "04a9df72cc1f67020b0d63ad9bfe4a323e459ea7eb68e03bd9824db49f9a4c25"
+SRC_URI[rstest-0.21.0.sha256sum] = "9afd55a67069d6e434a95161415f5beeada95a01c7b815508a82dcb0e1593682"
+SRC_URI[rstest_macros-0.21.0.sha256sum] = "4165dfae59a39dd41d8dec720d3cbfbc71f69744efb480a3920f5d4e0cc6798d"
 SRC_URI[rust-ini-0.21.0.sha256sum] = "0d625ed57d8f49af6cfa514c42e1a71fadcff60eb0b1c517ff82fe41aa025b41"
 SRC_URI[rustc-hash-1.1.0.sha256sum] = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
 SRC_URI[rustc_version-0.4.0.sha256sum] = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
@@ -494,12 +522,13 @@ SRC_URI[rustix-0.37.26.sha256sum] = "84f3f8f960ed3b5a59055428714943298bf3fa2d4a1
 SRC_URI[rustix-0.38.31.sha256sum] = "6ea3e1a662af26cd7a3ba09c0297a31af215563ecf42817c98df621387f4e949"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
-SRC_URI[self_cell-1.0.3.sha256sum] = "58bf37232d3bb9a2c4e641ca2a11d83b5062066f88df7fed36c28772046d65ba"
-SRC_URI[selinux-0.4.0.sha256sum] = "a00576725d21b588213fbd4af84cd7e4cc4304e8e9bd6c0f5a1498a3e2ca6a51"
-SRC_URI[selinux-sys-0.6.2.sha256sum] = "806d381649bb85347189d2350728817418138d11d738e2482cb644ec7f3c755d"
+SRC_URI[self_cell-1.0.4.sha256sum] = "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
+SRC_URI[selinux-0.4.4.sha256sum] = "53371b1e9bbbfffd65e5ac3c895c786ec35b7695bdc4a67a8b08c29c8d057e0b"
+SRC_URI[selinux-sys-0.6.9.sha256sum] = "89d45498373dc17ec8ebb72e1fd320c015647b0157fc81dddf678e2e00205fec"
 SRC_URI[semver-1.0.14.sha256sum] = "e25dfac463d778e353db5be2449d1cce89bd6fd23c9f1ea21310ce6e5a1b29c4"
-SRC_URI[serde-1.0.193.sha256sum] = "25dd9975e68d0cb5aa1120c288333fc98731bd1dd12f561e468ea4728c042b89"
-SRC_URI[serde_derive-1.0.193.sha256sum] = "43576ca501357b9b071ac53cdc7da8ef0cbd9493d8df094cd821777ea6e894d3"
+SRC_URI[serde-1.0.203.sha256sum] = "7253ab4de971e72fb7be983802300c30b5a7f0c2e56fab8abfc6a214307c0094"
+SRC_URI[serde-big-array-0.5.1.sha256sum] = "11fc7cc2c76d73e0f27ee52abbd64eec84d46f370c88371120433196934e4b7f"
+SRC_URI[serde_derive-1.0.203.sha256sum] = "500cbc0ebeb6f46627f50f3f5811ccf6bf00643be300b4c3eabc0ef55dc5b5ba"
 SRC_URI[sha1-0.10.6.sha256sum] = "e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba"
 SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
 SRC_URI[sha3-0.10.8.sha256sum] = "75872d278a8f37ef87fa0ddbda7802605cb18344497949862c0d4dcb291eba60"
@@ -510,34 +539,36 @@ SRC_URI[signal-hook-registry-1.4.1.sha256sum] = "d8229b473baa5980ac72ef434c4415e
 SRC_URI[siphasher-0.3.10.sha256sum] = "7bd3e3206899af3f8b12af284fafc038cc1dc2b41d1b89dd17297221c5d225de"
 SRC_URI[slab-0.4.7.sha256sum] = "4614a76b2a8be0058caa9dbbaf66d988527d86d003c11a94fbd335d7661edcef"
 SRC_URI[sm3-0.4.2.sha256sum] = "ebb9a3b702d0a7e33bc4d85a14456633d2b165c2ad839c5fd9a8417c1ab15860"
-SRC_URI[smallvec-1.13.1.sha256sum] = "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
+SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
 SRC_URI[smawk-0.3.1.sha256sum] = "f67ad224767faa3c7d8b6d91985b78e70a1324408abcb1cfcc2be4c06bc06043"
 SRC_URI[socket2-0.5.3.sha256sum] = "2538b18701741680e0322a2302176d3253a35388e2e62f172f64f4f16605f877"
 SRC_URI[strsim-0.10.0.sha256sum] = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.32.sha256sum] = "239814284fd6f1a4ffe4ca893952cdd93c224b6a1571c9a9eadd670295c0c9e2"
+SRC_URI[syn-2.0.60.sha256sum] = "909518bc7b1c9b779f1bbf07f2929d35af9f0f37e47c6e9ef7f9dddc1e1821f3"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
 SRC_URI[tempfile-3.10.1.sha256sum] = "85b77fafb263dd9d05cbeac119526425676db3784113aa9295c88498cbf8bff1"
 SRC_URI[terminal_size-0.2.6.sha256sum] = "8e6bf6f19e9f8ed8d4048dc22981458ebcf406d67e94cd422e5ecd73d63b3237"
 SRC_URI[terminal_size-0.3.0.sha256sum] = "21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7"
 SRC_URI[textwrap-0.16.1.sha256sum] = "23d434d3f8967a09480fb04132ebe0a3e088c173e6d0ee7897abbdf4eab0f8b9"
-SRC_URI[thiserror-1.0.37.sha256sum] = "10deb33631e3c9018b9baf9dcbbc4f737320d2b576bac10f6aefa048fa407e3e"
-SRC_URI[thiserror-impl-1.0.37.sha256sum] = "982d17546b47146b28f7c22e3d08465f6b8903d0ea13c1660d9d84a6e7adcdbb"
-SRC_URI[time-0.3.20.sha256sum] = "cd0cbfecb4d19b5ea75bb31ad904eb5b9fa13f21079c3b92017ebdf4999a5890"
-SRC_URI[time-core-0.1.0.sha256sum] = "2e153e1f1acaef8acc537e68b44906d2db6436e2b35ac2c6b42640fff91f00fd"
-SRC_URI[time-macros-0.2.8.sha256sum] = "fd80a657e71da814b8e5d60d3374fc6d35045062245d80224748ae522dd76f36"
+SRC_URI[thiserror-1.0.61.sha256sum] = "c546c80d6be4bc6a00c0f01730c08df82eaa7a7a61f11d656526506112cc1709"
+SRC_URI[thiserror-impl-1.0.61.sha256sum] = "46c3384250002a6d5af4d114f2845d37b57521033f30d5c3f46c4d70e1197533"
+SRC_URI[time-0.3.36.sha256sum] = "5dfd88e563464686c916c7e46e623e520ddc6d79fa6641390f2e3fa86e83e885"
+SRC_URI[time-core-0.1.2.sha256sum] = "ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3"
+SRC_URI[time-macros-0.2.18.sha256sum] = "3f252a68540fde3a3877aeea552b832b40ab9a69e318efd078774a01ddee1ccf"
 SRC_URI[tiny-keccak-2.0.2.sha256sum] = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
+SRC_URI[toml_datetime-0.6.6.sha256sum] = "4badfd56924ae69bcc9039335b2e017639ce3f9b001c393c1b2d1ef846ce2cbf"
+SRC_URI[toml_edit-0.21.1.sha256sum] = "6a8534fd7f78b5405e860340ad6575217ce99f38d4d5c8f2442cb5ecb50090e1"
 SRC_URI[trim-in-place-0.1.7.sha256sum] = "343e926fc669bc8cde4fa3129ab681c63671bae288b1f1081ceee6d9d37904fc"
 SRC_URI[typenum-1.15.0.sha256sum] = "dcf81ac59edc17cc8697ff311e8f5ef2d99fcbd9817b34cec66f90b6c3dfd987"
 SRC_URI[unicode-ident-1.0.5.sha256sum] = "6ceab39d59e4c9499d4e5a8ee0e2735b891bb7308ac83dfb4e80cad195c9f6f3"
 SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
 SRC_URI[unicode-segmentation-1.11.0.sha256sum] = "d4c87d22b6e3f4a18d4d40ef354e97c90fcb14dd91d7dc0aa9d8a1172ebf7202"
-SRC_URI[unicode-width-0.1.11.sha256sum] = "e51733f11c9c4f72aa0c160008246859e340b00807569a0da0e7a1079b27ba85"
+SRC_URI[unicode-width-0.1.12.sha256sum] = "68f5e5f3158ecfd4b8ff6fe086db7c8467a2dfdac97fe420f2b7c4aa97af66d6"
 SRC_URI[unicode-xid-0.2.4.sha256sum] = "f962df74c8c05a667b5ee8bcf162993134c104e96440b663c8daa176dc772d8c"
-SRC_URI[unindent-0.2.1.sha256sum] = "5aa30f5ea51ff7edfc797c6d3f9ec8cbd8cfedef5371766b7181d33977f4814f"
+SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
 SRC_URI[utf8parse-0.2.1.sha256sum] = "711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a"
 SRC_URI[uuid-1.7.0.sha256sum] = "f00cc9702ca12d3c81455259621e676d0f7251cec66a21e98fe2e9a37db93b2a"
-SRC_URI[uutils_term_grid-0.3.0.sha256sum] = "b389452a568698688dda38802068378a16c15c4af9b153cdd99b65391292bbc7"
+SRC_URI[uutils_term_grid-0.6.0.sha256sum] = "f89defb4adb4ba5703a57abc879f96ddd6263a444cacc446db90bf2617f141fb"
 SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
@@ -581,8 +612,11 @@ SRC_URI[windows_x86_64_gnullvm-0.52.0.sha256sum] = "1a657e1e9d3f514745a572a6846d
 SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
 SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
 SRC_URI[windows_x86_64_msvc-0.52.0.sha256sum] = "dff9641d1cd4be8d1a070daf9e3773c5f67e78b4d9d42263020c057706765c04"
+SRC_URI[winnow-0.5.40.sha256sum] = "f593a95398737aeed53e489c785df13f3618e41dbcd6718c6addbf1395aa6876"
 SRC_URI[wyz-0.5.1.sha256sum] = "05f360fc0b24296329c78fda852a1e9ae82de9cf7b27dae4b7f62f118f77b9ed"
 SRC_URI[xattr-1.3.1.sha256sum] = "8da84f1a25939b27f6820d92aed108f83ff920fdf11a7b19366c27c4cda81d4f"
 SRC_URI[yansi-0.5.1.sha256sum] = "09041cd90cf85f7f8b2df60c646f853b7f535ce68f85244eb6731cf89fa498ec"
 SRC_URI[z85-3.0.5.sha256sum] = "2a599daf1b507819c1121f0bf87fa37eb19daac6aff3aefefd4e6e2e0f2020fc"
-SRC_URI[zip-1.1.1.sha256sum] = "f2655979068a1f8fa91cb9e8e5b9d3ee54d18e0ddc358f2f4a395afc0929a84b"
+SRC_URI[zerocopy-0.7.33.sha256sum] = "087eca3c1eaf8c47b94d02790dd086cd594b912d2043d4de4bfdd466b3befb7c"
+SRC_URI[zerocopy-derive-0.7.33.sha256sum] = "6f4b6c273f496d8fd4eaf18853e6b448760225dc030ff2c485a786859aea6393"
+SRC_URI[zip-1.3.0.sha256sum] = "f1f4a27345eb6f7aa7bd015ba7eb4175fa4e1b462a29874b779e0bbcf96c6ac7"
diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.26.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.27.bb
similarity index 98%
rename from meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.26.bb
rename to meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.27.bb
index 5668aaac5..ea0eb061f 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.26.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.27.bb
@@ -13,7 +13,7 @@ SRC_URI += "git://github.com/uutils/coreutils.git;protocol=https;branch=main"
 # so src/uucore/src/lib/features.rs disables utmpx when targetting musl.
 COMPATIBLE_HOST:libc-musl = "null"
 
-SRCREV = "f95f363096610d7e5e1556d6d0a32b5018065c4c"
+SRCREV = "9b11753e7cb06b0f76f4221fc237019c0a86f8f5"
 S = "${WORKDIR}/git"
 
 require ${BPN}-crates.inc
-- 
2.36.1.vfs.0.0


