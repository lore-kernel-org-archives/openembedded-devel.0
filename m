Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178D5C6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 12:24:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.10701.1678969475945559728
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Mar 2023 05:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E7kcEqgF;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso1007785wmo.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 05:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678969474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o72mdKk1ssvR0X88BU/wGi0c2C99v2AG2t1BuhQPI0E=;
        b=E7kcEqgFqVP2a8VnLzcVbppfT07/g02Ze20j1WtwGnvjyYLRiOl3xv/1X/b7p2cNWI
         9G614fPKcFMFSoZ6HeDJsCBmjQdSYiZIFVvBTSY3pQzIaEH/6JNjBvI+i659/XXpF+mU
         3Ae0qFIW/Xihhq5CGuXtOA5cutN3oo1BsDgx/5MhCCWCckqPQZuk2m99Or9if5nZyU2W
         Ujl30d+SsTCFj41x+oW7P7PyzlEa8HNFEPa+2Ulg9x99Jd93f480QTf6UhdC4gP1Kuiq
         UZdSti5lpaqgoGaz6LcSUpAmTaSUWiPETbyJngdE6K8t40scfMhWVPxxOpgkHRZoAkQA
         PHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678969474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o72mdKk1ssvR0X88BU/wGi0c2C99v2AG2t1BuhQPI0E=;
        b=X6ptsMEsO9dOZRnooNZKVRo3CTZQwcvMZol735YH3RHxqgv+9Vq2/bhINdslNpYMkP
         r3bWS2oRtUBmMELZoyUMX30XCR4lnISkD8ByV/xFKJgprRE5tmnjfaci6cYan40gu8iJ
         yYmT3VELSmlInsaeDvs66Dee+qH9VS3Tau9M0kqDHxRARodfZkoLqlMEbaKJcOKuIkrn
         z6mQet5ErvPE7pqRL+oZ4tzuf5szPV6yCpqJLlcNH0uprOA54n0osmaaYB2aJ9ZAmZXy
         38e+Zda5YH0n++I95IqnJbiLWL783YYGH01cI1ksvLiPFdlrvM+CsG3e0Rt505U55F7A
         AYgw==
X-Gm-Message-State: AO0yUKWkfTNFK+4Rd3ktyBI8OnY3XAUsJKe0dlA3IvuKUHQl+npIC5z4
	d9tw9mEcdUyhL8bv8LKGEQvSaP3Izzs=
X-Google-Smtp-Source: AK7set8O8yteuPSrjlIYqC+bz5uI48zCLlYt6XJWBcVKo3O7g08uS4PmTe4/tPmIXlEYBm4T8oS1CQ==
X-Received: by 2002:a05:600c:19ca:b0:3ed:290b:dc76 with SMTP id u10-20020a05600c19ca00b003ed290bdc76mr12008337wmq.1.1678969473695;
        Thu, 16 Mar 2023 05:24:33 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:65ad:993a:17fa:6608])
        by smtp.gmail.com with ESMTPSA id t9-20020a7bc3c9000000b003eb3933ef10sm4739864wmj.46.2023.03.16.05.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 05:24:33 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [meta-oe][PATCH] uutils-coreutils: Add crates checksum and use cargo-update-recipes-crates
Date: Thu, 16 Mar 2023 13:24:19 +0100
Message-Id: <20230316122419.29717-1-frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 12:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101574

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This is related to checksum verification introduction in bitbake
crate fetcher:
https://patchwork.yoctoproject.org/project/bitbake/patch/20230315131513.50635-1-frederic.martinsons@gmail.com/

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 .../recipes-core/uutils-coreutils/README.txt  |  19 --
 .../uutils-coreutils-crates.inc               | 269 ++++++++++++++++
 .../uutils-coreutils_0.0.17.bb                | 301 +-----------------
 3 files changed, 275 insertions(+), 314 deletions(-)
 delete mode 100644 meta-oe/recipes-core/uutils-coreutils/README.txt
 create mode 100644 meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc

diff --git a/meta-oe/recipes-core/uutils-coreutils/README.txt b/meta-oe/recipes-core/uutils-coreutils/README.txt
deleted file mode 100644
index cfd7b051b..000000000
--- a/meta-oe/recipes-core/uutils-coreutils/README.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-How to generate/update the file uutils-coreutils_XXX.bb:
-
-cargo with version > 1.60 is needed so cargo from Ubuntu's apt will not work
-(because of https://github.com/rust-lang/cargo/issues/10623):
-This package is needed (tested on Ubuntu 22.04):
-sudo apt-get -y install librust-cargo+openssl-dev
-
-Then install cargo-bitbake with:
-$ cargo install --locked cargo-bitbake
-
-You can now update coreutils:
-$ git clone https://github.com/uutils/coreutils.git
-$ cd coreutils
-$ git tag
-$ git checkout 0.0.XXX
-$ cargo-bitbake bitbake
-Wrote: coreutils_0.0.15.bb
-
-Verify manual changes in the bb file (rename coreutils.inc to uutils-coreutils.inc)
diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
new file mode 100644
index 000000000..4bdb7b2ec
--- /dev/null
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
@@ -0,0 +1,269 @@
+SRC_URI += " \
+    crate://crates.io/Inflector/0.11.4 \
+    crate://crates.io/adler/1.0.2 \
+    crate://crates.io/ahash/0.7.6 \
+    crate://crates.io/aho-corasick/0.7.19 \
+    crate://crates.io/aliasable/0.1.3 \
+    crate://crates.io/android_system_properties/0.1.5 \
+    crate://crates.io/arrayref/0.3.6 \
+    crate://crates.io/arrayvec/0.7.2 \
+    crate://crates.io/atty/0.2.14 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/bigdecimal/0.3.0 \
+    crate://crates.io/binary-heap-plus/0.5.0 \
+    crate://crates.io/bindgen/0.62.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/blake2b_simd/1.0.0 \
+    crate://crates.io/blake3/1.3.2 \
+    crate://crates.io/block-buffer/0.10.3 \
+    crate://crates.io/bstr/1.0.1 \
+    crate://crates.io/bumpalo/3.11.1 \
+    crate://crates.io/bytecount/0.6.3 \
+    crate://crates.io/byteorder/1.4.3 \
+    crate://crates.io/cc/1.0.77 \
+    crate://crates.io/cexpr/0.6.0 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/chrono/0.4.23 \
+    crate://crates.io/clang-sys/1.4.0 \
+    crate://crates.io/clap/4.0.26 \
+    crate://crates.io/clap_complete/4.0.6 \
+    crate://crates.io/clap_lex/0.3.0 \
+    crate://crates.io/codespan-reporting/0.11.1 \
+    crate://crates.io/compare/0.1.0 \
+    crate://crates.io/console/0.15.2 \
+    crate://crates.io/constant_time_eq/0.1.5 \
+    crate://crates.io/constant_time_eq/0.2.4 \
+    crate://crates.io/conv/0.3.3 \
+    crate://crates.io/core-foundation-sys/0.8.3 \
+    crate://crates.io/coz/0.1.3 \
+    crate://crates.io/cpp/0.5.7 \
+    crate://crates.io/cpp_build/0.5.7 \
+    crate://crates.io/cpp_common/0.5.7 \
+    crate://crates.io/cpp_macros/0.5.7 \
+    crate://crates.io/cpufeatures/0.2.5 \
+    crate://crates.io/crc32fast/1.3.2 \
+    crate://crates.io/crossbeam-channel/0.5.6 \
+    crate://crates.io/crossbeam-deque/0.8.2 \
+    crate://crates.io/crossbeam-epoch/0.9.12 \
+    crate://crates.io/crossbeam-utils/0.8.13 \
+    crate://crates.io/crossterm/0.25.0 \
+    crate://crates.io/crossterm_winapi/0.9.0 \
+    crate://crates.io/crunchy/0.2.2 \
+    crate://crates.io/crypto-common/0.1.6 \
+    crate://crates.io/ctor/0.1.26 \
+    crate://crates.io/ctrlc/3.2.3 \
+    crate://crates.io/custom_derive/0.1.7 \
+    crate://crates.io/cxx-build/1.0.82 \
+    crate://crates.io/cxx/1.0.82 \
+    crate://crates.io/cxxbridge-flags/1.0.82 \
+    crate://crates.io/cxxbridge-macro/1.0.82 \
+    crate://crates.io/data-encoding-macro-internal/0.1.10 \
+    crate://crates.io/data-encoding-macro/0.1.12 \
+    crate://crates.io/data-encoding/2.3.2 \
+    crate://crates.io/diff/0.1.13 \
+    crate://crates.io/digest/0.10.6 \
+    crate://crates.io/dlv-list/0.3.0 \
+    crate://crates.io/dns-lookup/1.0.8 \
+    crate://crates.io/dunce/1.0.3 \
+    crate://crates.io/either/1.8.0 \
+    crate://crates.io/encode_unicode/0.3.6 \
+    crate://crates.io/env_logger/0.8.4 \
+    crate://crates.io/errno-dragonfly/0.1.2 \
+    crate://crates.io/errno/0.2.8 \
+    crate://crates.io/exacl/0.9.0 \
+    crate://crates.io/fastrand/1.8.0 \
+    crate://crates.io/file_diff/1.0.0 \
+    crate://crates.io/filetime/0.2.18 \
+    crate://crates.io/flate2/1.0.24 \
+    crate://crates.io/fnv/1.0.7 \
+    crate://crates.io/fs_extra/1.2.0 \
+    crate://crates.io/fsevent-sys/4.1.0 \
+    crate://crates.io/fts-sys/0.2.3 \
+    crate://crates.io/futures-channel/0.3.25 \
+    crate://crates.io/futures-core/0.3.25 \
+    crate://crates.io/futures-executor/0.3.25 \
+    crate://crates.io/futures-io/0.3.25 \
+    crate://crates.io/futures-macro/0.3.25 \
+    crate://crates.io/futures-sink/0.3.25 \
+    crate://crates.io/futures-task/0.3.25 \
+    crate://crates.io/futures-timer/3.0.2 \
+    crate://crates.io/futures-util/0.3.25 \
+    crate://crates.io/futures/0.3.25 \
+    crate://crates.io/gcd/2.1.0 \
+    crate://crates.io/generic-array/0.14.6 \
+    crate://crates.io/getrandom/0.2.8 \
+    crate://crates.io/glob/0.3.0 \
+    crate://crates.io/half/2.1.0 \
+    crate://crates.io/hashbrown/0.12.3 \
+    crate://crates.io/heck/0.4.0 \
+    crate://crates.io/hermit-abi/0.1.19 \
+    crate://crates.io/hex-literal/0.3.4 \
+    crate://crates.io/hex/0.4.3 \
+    crate://crates.io/hostname/0.3.1 \
+    crate://crates.io/iana-time-zone-haiku/0.1.1 \
+    crate://crates.io/iana-time-zone/0.1.53 \
+    crate://crates.io/indicatif/0.17.2 \
+    crate://crates.io/inotify-sys/0.1.5 \
+    crate://crates.io/inotify/0.9.6 \
+    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/io-lifetimes/0.7.5 \
+    crate://crates.io/itertools/0.10.5 \
+    crate://crates.io/itoa/1.0.4 \
+    crate://crates.io/js-sys/0.3.60 \
+    crate://crates.io/keccak/0.1.3 \
+    crate://crates.io/kqueue-sys/1.0.3 \
+    crate://crates.io/kqueue/1.0.7 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/lazycell/1.3.0 \
+    crate://crates.io/libc/0.2.137 \
+    crate://crates.io/libloading/0.7.4 \
+    crate://crates.io/link-cplusplus/1.0.7 \
+    crate://crates.io/linux-raw-sys/0.0.46 \
+    crate://crates.io/lock_api/0.4.9 \
+    crate://crates.io/log/0.4.17 \
+    crate://crates.io/lscolors/0.13.0 \
+    crate://crates.io/match_cfg/0.1.0 \
+    crate://crates.io/md-5/0.10.5 \
+    crate://crates.io/memchr/2.5.0 \
+    crate://crates.io/memmap2/0.5.8 \
+    crate://crates.io/memoffset/0.6.5 \
+    crate://crates.io/memoffset/0.7.1 \
+    crate://crates.io/minimal-lexical/0.2.1 \
+    crate://crates.io/miniz_oxide/0.5.4 \
+    crate://crates.io/mio/0.8.5 \
+    crate://crates.io/nix/0.25.0 \
+    crate://crates.io/nom/7.1.1 \
+    crate://crates.io/notify/5.0.0 \
+    crate://crates.io/nu-ansi-term/0.46.0 \
+    crate://crates.io/num-bigint/0.4.3 \
+    crate://crates.io/num-integer/0.1.45 \
+    crate://crates.io/num-traits/0.2.15 \
+    crate://crates.io/num_cpus/1.14.0 \
+    crate://crates.io/num_threads/0.1.6 \
+    crate://crates.io/number_prefix/0.4.0 \
+    crate://crates.io/once_cell/1.16.0 \
+    crate://crates.io/onig/6.4.0 \
+    crate://crates.io/onig_sys/69.8.1 \
+    crate://crates.io/ordered-multimap/0.4.3 \
+    crate://crates.io/os_display/0.1.3 \
+    crate://crates.io/os_str_bytes/6.4.1 \
+    crate://crates.io/ouroboros/0.15.5 \
+    crate://crates.io/ouroboros_macro/0.15.5 \
+    crate://crates.io/output_vt100/0.1.3 \
+    crate://crates.io/overload/0.1.1 \
+    crate://crates.io/parking_lot/0.12.1 \
+    crate://crates.io/parking_lot_core/0.9.4 \
+    crate://crates.io/paste/1.0.9 \
+    crate://crates.io/peeking_take_while/0.1.2 \
+    crate://crates.io/phf/0.11.1 \
+    crate://crates.io/phf_codegen/0.11.1 \
+    crate://crates.io/phf_generator/0.11.1 \
+    crate://crates.io/phf_shared/0.11.1 \
+    crate://crates.io/pin-project-lite/0.2.9 \
+    crate://crates.io/pin-utils/0.1.0 \
+    crate://crates.io/pkg-config/0.3.26 \
+    crate://crates.io/platform-info/1.0.2 \
+    crate://crates.io/portable-atomic/0.3.15 \
+    crate://crates.io/ppv-lite86/0.2.17 \
+    crate://crates.io/pretty_assertions/1.3.0 \
+    crate://crates.io/proc-macro-error-attr/1.0.4 \
+    crate://crates.io/proc-macro-error/1.0.4 \
+    crate://crates.io/proc-macro2/1.0.47 \
+    crate://crates.io/procfs/0.14.1 \
+    crate://crates.io/quick-error/2.0.1 \
+    crate://crates.io/quickcheck/1.0.3 \
+    crate://crates.io/quote/1.0.21 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_core/0.6.4 \
+    crate://crates.io/rand_pcg/0.3.1 \
+    crate://crates.io/rayon-core/1.10.1 \
+    crate://crates.io/rayon/1.6.0 \
+    crate://crates.io/redox_syscall/0.2.16 \
+    crate://crates.io/reference-counted-singleton/0.1.2 \
+    crate://crates.io/regex-automata/0.1.10 \
+    crate://crates.io/regex-syntax/0.6.28 \
+    crate://crates.io/regex/1.7.0 \
+    crate://crates.io/remove_dir_all/0.5.3 \
+    crate://crates.io/remove_dir_all/0.7.0 \
+    crate://crates.io/retain_mut/0.1.7 \
+    crate://crates.io/rlimit/0.8.3 \
+    crate://crates.io/rstest/0.16.0 \
+    crate://crates.io/rstest_macros/0.16.0 \
+    crate://crates.io/rust-ini/0.18.0 \
+    crate://crates.io/rustc-hash/1.1.0 \
+    crate://crates.io/rustc_version/0.4.0 \
+    crate://crates.io/rustix/0.35.13 \
+    crate://crates.io/rustversion/1.0.9 \
+    crate://crates.io/same-file/1.0.6 \
+    crate://crates.io/scopeguard/1.1.0 \
+    crate://crates.io/scratch/1.0.2 \
+    crate://crates.io/selinux-sys/0.6.1 \
+    crate://crates.io/selinux/0.3.1 \
+    crate://crates.io/semver/1.0.14 \
+    crate://crates.io/serde/1.0.147 \
+    crate://crates.io/sha1/0.10.5 \
+    crate://crates.io/sha2/0.10.6 \
+    crate://crates.io/sha3/0.10.6 \
+    crate://crates.io/shlex/1.1.0 \
+    crate://crates.io/signal-hook-mio/0.2.3 \
+    crate://crates.io/signal-hook-registry/1.4.0 \
+    crate://crates.io/signal-hook/0.3.14 \
+    crate://crates.io/siphasher/0.3.10 \
+    crate://crates.io/slab/0.4.7 \
+    crate://crates.io/smallvec/1.10.0 \
+    crate://crates.io/smawk/0.3.1 \
+    crate://crates.io/socket2/0.4.7 \
+    crate://crates.io/strsim/0.10.0 \
+    crate://crates.io/strum/0.24.1 \
+    crate://crates.io/strum_macros/0.24.3 \
+    crate://crates.io/subtle/2.4.1 \
+    crate://crates.io/syn/1.0.103 \
+    crate://crates.io/tempfile/3.3.0 \
+    crate://crates.io/term_grid/0.1.7 \
+    crate://crates.io/termcolor/1.1.3 \
+    crate://crates.io/terminal_size/0.1.17 \
+    crate://crates.io/terminal_size/0.2.2 \
+    crate://crates.io/textwrap/0.16.0 \
+    crate://crates.io/thiserror-impl/1.0.37 \
+    crate://crates.io/thiserror/1.0.37 \
+    crate://crates.io/time-core/0.1.0 \
+    crate://crates.io/time-macros/0.2.6 \
+    crate://crates.io/time/0.3.17 \
+    crate://crates.io/typenum/1.15.0 \
+    crate://crates.io/unicode-ident/1.0.5 \
+    crate://crates.io/unicode-linebreak/0.1.4 \
+    crate://crates.io/unicode-segmentation/1.10.0 \
+    crate://crates.io/unicode-width/0.1.10 \
+    crate://crates.io/unicode-xid/0.2.4 \
+    crate://crates.io/unindent/0.1.10 \
+    crate://crates.io/users/0.11.0 \
+    crate://crates.io/utf-8/0.7.6 \
+    crate://crates.io/uuid/1.2.2 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/walkdir/2.3.2 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasm-bindgen-backend/0.2.83 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.83 \
+    crate://crates.io/wasm-bindgen-macro/0.2.83 \
+    crate://crates.io/wasm-bindgen-shared/0.2.83 \
+    crate://crates.io/wasm-bindgen/0.2.83 \
+    crate://crates.io/which/4.3.0 \
+    crate://crates.io/wild/2.1.0 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.5 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/windows-sys/0.42.0 \
+    crate://crates.io/windows_aarch64_gnullvm/0.42.0 \
+    crate://crates.io/windows_aarch64_msvc/0.42.0 \
+    crate://crates.io/windows_i686_gnu/0.42.0 \
+    crate://crates.io/windows_i686_msvc/0.42.0 \
+    crate://crates.io/windows_x86_64_gnu/0.42.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.42.0 \
+    crate://crates.io/windows_x86_64_msvc/0.42.0 \
+    crate://crates.io/xattr/0.2.3 \
+    crate://crates.io/yansi/0.5.1 \
+    crate://crates.io/z85/3.0.5 \
+    crate://crates.io/zip/0.6.3 \
+"
diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.17.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.17.bb
index 61d7c8c06..4d3c2f7fe 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.17.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.17.bb
@@ -1,303 +1,14 @@
-# Auto-Generated by cargo-bitbake 0.3.16
-#
-inherit cargo
+SUMMARY = "coreutils ~ GNU coreutils (updated); implemented as universal (cross-platform) utils, written in Rust"
+HOMEPAGE = "https://github.com/uutils/coreutils"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=41f7469eaacac62c67d5664fff2c062d"
 
-# If this is git based prefer versioned ones if they exist
-# DEFAULT_PREFERENCE = "-1"
+inherit cargo cargo-update-recipe-crates
 
-# how to get coreutils could be as easy as but default to a git checkout:
-# SRC_URI += "crate://crates.io/coreutils/0.0.17"
 SRC_URI += "git://github.com/uutils/coreutils.git;protocol=https;nobranch=1"
 SRCREV = "7e127005afbd6c3632d74ad8082340ccb8329d67"
 S = "${WORKDIR}/git"
-CARGO_SRC_DIR = ""
-
-
-# please note if you have entries that do not begin with crate://
-# you must change them to how that package can be fetched
-SRC_URI += " \
-    crate://crates.io/Inflector/0.11.4 \
-    crate://crates.io/adler/1.0.2 \
-    crate://crates.io/ahash/0.7.6 \
-    crate://crates.io/aho-corasick/0.7.19 \
-    crate://crates.io/aliasable/0.1.3 \
-    crate://crates.io/android_system_properties/0.1.5 \
-    crate://crates.io/arrayref/0.3.6 \
-    crate://crates.io/arrayvec/0.7.2 \
-    crate://crates.io/atty/0.2.14 \
-    crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/bigdecimal/0.3.0 \
-    crate://crates.io/binary-heap-plus/0.5.0 \
-    crate://crates.io/bindgen/0.62.0 \
-    crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/blake2b_simd/1.0.0 \
-    crate://crates.io/blake3/1.3.2 \
-    crate://crates.io/block-buffer/0.10.3 \
-    crate://crates.io/bstr/1.0.1 \
-    crate://crates.io/bumpalo/3.11.1 \
-    crate://crates.io/bytecount/0.6.3 \
-    crate://crates.io/byteorder/1.4.3 \
-    crate://crates.io/cc/1.0.77 \
-    crate://crates.io/cexpr/0.6.0 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/chrono/0.4.23 \
-    crate://crates.io/clang-sys/1.4.0 \
-    crate://crates.io/clap/4.0.26 \
-    crate://crates.io/clap_complete/4.0.6 \
-    crate://crates.io/clap_lex/0.3.0 \
-    crate://crates.io/codespan-reporting/0.11.1 \
-    crate://crates.io/compare/0.1.0 \
-    crate://crates.io/console/0.15.2 \
-    crate://crates.io/constant_time_eq/0.1.5 \
-    crate://crates.io/constant_time_eq/0.2.4 \
-    crate://crates.io/conv/0.3.3 \
-    crate://crates.io/core-foundation-sys/0.8.3 \
-    crate://crates.io/coz/0.1.3 \
-    crate://crates.io/cpp/0.5.7 \
-    crate://crates.io/cpp_build/0.5.7 \
-    crate://crates.io/cpp_common/0.5.7 \
-    crate://crates.io/cpp_macros/0.5.7 \
-    crate://crates.io/cpufeatures/0.2.5 \
-    crate://crates.io/crc32fast/1.3.2 \
-    crate://crates.io/crossbeam-channel/0.5.6 \
-    crate://crates.io/crossbeam-deque/0.8.2 \
-    crate://crates.io/crossbeam-epoch/0.9.12 \
-    crate://crates.io/crossbeam-utils/0.8.13 \
-    crate://crates.io/crossterm/0.25.0 \
-    crate://crates.io/crossterm_winapi/0.9.0 \
-    crate://crates.io/crunchy/0.2.2 \
-    crate://crates.io/crypto-common/0.1.6 \
-    crate://crates.io/ctor/0.1.26 \
-    crate://crates.io/ctrlc/3.2.3 \
-    crate://crates.io/custom_derive/0.1.7 \
-    crate://crates.io/cxx-build/1.0.82 \
-    crate://crates.io/cxx/1.0.82 \
-    crate://crates.io/cxxbridge-flags/1.0.82 \
-    crate://crates.io/cxxbridge-macro/1.0.82 \
-    crate://crates.io/data-encoding-macro-internal/0.1.10 \
-    crate://crates.io/data-encoding-macro/0.1.12 \
-    crate://crates.io/data-encoding/2.3.2 \
-    crate://crates.io/diff/0.1.13 \
-    crate://crates.io/digest/0.10.6 \
-    crate://crates.io/dlv-list/0.3.0 \
-    crate://crates.io/dns-lookup/1.0.8 \
-    crate://crates.io/dunce/1.0.3 \
-    crate://crates.io/either/1.8.0 \
-    crate://crates.io/encode_unicode/0.3.6 \
-    crate://crates.io/env_logger/0.8.4 \
-    crate://crates.io/errno-dragonfly/0.1.2 \
-    crate://crates.io/errno/0.2.8 \
-    crate://crates.io/exacl/0.9.0 \
-    crate://crates.io/fastrand/1.8.0 \
-    crate://crates.io/file_diff/1.0.0 \
-    crate://crates.io/filetime/0.2.18 \
-    crate://crates.io/flate2/1.0.24 \
-    crate://crates.io/fnv/1.0.7 \
-    crate://crates.io/fs_extra/1.2.0 \
-    crate://crates.io/fsevent-sys/4.1.0 \
-    crate://crates.io/fts-sys/0.2.3 \
-    crate://crates.io/futures-channel/0.3.25 \
-    crate://crates.io/futures-core/0.3.25 \
-    crate://crates.io/futures-executor/0.3.25 \
-    crate://crates.io/futures-io/0.3.25 \
-    crate://crates.io/futures-macro/0.3.25 \
-    crate://crates.io/futures-sink/0.3.25 \
-    crate://crates.io/futures-task/0.3.25 \
-    crate://crates.io/futures-timer/3.0.2 \
-    crate://crates.io/futures-util/0.3.25 \
-    crate://crates.io/futures/0.3.25 \
-    crate://crates.io/gcd/2.1.0 \
-    crate://crates.io/generic-array/0.14.6 \
-    crate://crates.io/getrandom/0.2.8 \
-    crate://crates.io/glob/0.3.0 \
-    crate://crates.io/half/2.1.0 \
-    crate://crates.io/hashbrown/0.12.3 \
-    crate://crates.io/heck/0.4.0 \
-    crate://crates.io/hermit-abi/0.1.19 \
-    crate://crates.io/hex-literal/0.3.4 \
-    crate://crates.io/hex/0.4.3 \
-    crate://crates.io/hostname/0.3.1 \
-    crate://crates.io/iana-time-zone-haiku/0.1.1 \
-    crate://crates.io/iana-time-zone/0.1.53 \
-    crate://crates.io/indicatif/0.17.2 \
-    crate://crates.io/inotify-sys/0.1.5 \
-    crate://crates.io/inotify/0.9.6 \
-    crate://crates.io/instant/0.1.12 \
-    crate://crates.io/io-lifetimes/0.7.5 \
-    crate://crates.io/itertools/0.10.5 \
-    crate://crates.io/itoa/1.0.4 \
-    crate://crates.io/js-sys/0.3.60 \
-    crate://crates.io/keccak/0.1.3 \
-    crate://crates.io/kqueue-sys/1.0.3 \
-    crate://crates.io/kqueue/1.0.7 \
-    crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/lazycell/1.3.0 \
-    crate://crates.io/libc/0.2.137 \
-    crate://crates.io/libloading/0.7.4 \
-    crate://crates.io/link-cplusplus/1.0.7 \
-    crate://crates.io/linux-raw-sys/0.0.46 \
-    crate://crates.io/lock_api/0.4.9 \
-    crate://crates.io/log/0.4.17 \
-    crate://crates.io/lscolors/0.13.0 \
-    crate://crates.io/match_cfg/0.1.0 \
-    crate://crates.io/md-5/0.10.5 \
-    crate://crates.io/memchr/2.5.0 \
-    crate://crates.io/memmap2/0.5.8 \
-    crate://crates.io/memoffset/0.6.5 \
-    crate://crates.io/memoffset/0.7.1 \
-    crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/miniz_oxide/0.5.4 \
-    crate://crates.io/mio/0.8.5 \
-    crate://crates.io/nix/0.25.0 \
-    crate://crates.io/nom/7.1.1 \
-    crate://crates.io/notify/5.0.0 \
-    crate://crates.io/nu-ansi-term/0.46.0 \
-    crate://crates.io/num-bigint/0.4.3 \
-    crate://crates.io/num-integer/0.1.45 \
-    crate://crates.io/num-traits/0.2.15 \
-    crate://crates.io/num_cpus/1.14.0 \
-    crate://crates.io/num_threads/0.1.6 \
-    crate://crates.io/number_prefix/0.4.0 \
-    crate://crates.io/once_cell/1.16.0 \
-    crate://crates.io/onig/6.4.0 \
-    crate://crates.io/onig_sys/69.8.1 \
-    crate://crates.io/ordered-multimap/0.4.3 \
-    crate://crates.io/os_display/0.1.3 \
-    crate://crates.io/os_str_bytes/6.4.1 \
-    crate://crates.io/ouroboros/0.15.5 \
-    crate://crates.io/ouroboros_macro/0.15.5 \
-    crate://crates.io/output_vt100/0.1.3 \
-    crate://crates.io/overload/0.1.1 \
-    crate://crates.io/parking_lot/0.12.1 \
-    crate://crates.io/parking_lot_core/0.9.4 \
-    crate://crates.io/paste/1.0.9 \
-    crate://crates.io/peeking_take_while/0.1.2 \
-    crate://crates.io/phf/0.11.1 \
-    crate://crates.io/phf_codegen/0.11.1 \
-    crate://crates.io/phf_generator/0.11.1 \
-    crate://crates.io/phf_shared/0.11.1 \
-    crate://crates.io/pin-project-lite/0.2.9 \
-    crate://crates.io/pin-utils/0.1.0 \
-    crate://crates.io/pkg-config/0.3.26 \
-    crate://crates.io/platform-info/1.0.2 \
-    crate://crates.io/portable-atomic/0.3.15 \
-    crate://crates.io/ppv-lite86/0.2.17 \
-    crate://crates.io/pretty_assertions/1.3.0 \
-    crate://crates.io/proc-macro-error-attr/1.0.4 \
-    crate://crates.io/proc-macro-error/1.0.4 \
-    crate://crates.io/proc-macro2/1.0.47 \
-    crate://crates.io/procfs/0.14.1 \
-    crate://crates.io/quick-error/2.0.1 \
-    crate://crates.io/quickcheck/1.0.3 \
-    crate://crates.io/quote/1.0.21 \
-    crate://crates.io/rand/0.8.5 \
-    crate://crates.io/rand_chacha/0.3.1 \
-    crate://crates.io/rand_core/0.6.4 \
-    crate://crates.io/rand_pcg/0.3.1 \
-    crate://crates.io/rayon-core/1.10.1 \
-    crate://crates.io/rayon/1.6.0 \
-    crate://crates.io/redox_syscall/0.2.16 \
-    crate://crates.io/reference-counted-singleton/0.1.2 \
-    crate://crates.io/regex-automata/0.1.10 \
-    crate://crates.io/regex-syntax/0.6.28 \
-    crate://crates.io/regex/1.7.0 \
-    crate://crates.io/remove_dir_all/0.5.3 \
-    crate://crates.io/remove_dir_all/0.7.0 \
-    crate://crates.io/retain_mut/0.1.7 \
-    crate://crates.io/rlimit/0.8.3 \
-    crate://crates.io/rstest/0.16.0 \
-    crate://crates.io/rstest_macros/0.16.0 \
-    crate://crates.io/rust-ini/0.18.0 \
-    crate://crates.io/rustc-hash/1.1.0 \
-    crate://crates.io/rustc_version/0.4.0 \
-    crate://crates.io/rustix/0.35.13 \
-    crate://crates.io/rustversion/1.0.9 \
-    crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/scratch/1.0.2 \
-    crate://crates.io/selinux-sys/0.6.1 \
-    crate://crates.io/selinux/0.3.1 \
-    crate://crates.io/semver/1.0.14 \
-    crate://crates.io/serde/1.0.147 \
-    crate://crates.io/sha1/0.10.5 \
-    crate://crates.io/sha2/0.10.6 \
-    crate://crates.io/sha3/0.10.6 \
-    crate://crates.io/shlex/1.1.0 \
-    crate://crates.io/signal-hook-mio/0.2.3 \
-    crate://crates.io/signal-hook-registry/1.4.0 \
-    crate://crates.io/signal-hook/0.3.14 \
-    crate://crates.io/siphasher/0.3.10 \
-    crate://crates.io/slab/0.4.7 \
-    crate://crates.io/smallvec/1.10.0 \
-    crate://crates.io/smawk/0.3.1 \
-    crate://crates.io/socket2/0.4.7 \
-    crate://crates.io/strsim/0.10.0 \
-    crate://crates.io/strum/0.24.1 \
-    crate://crates.io/strum_macros/0.24.3 \
-    crate://crates.io/subtle/2.4.1 \
-    crate://crates.io/syn/1.0.103 \
-    crate://crates.io/tempfile/3.3.0 \
-    crate://crates.io/term_grid/0.1.7 \
-    crate://crates.io/termcolor/1.1.3 \
-    crate://crates.io/terminal_size/0.1.17 \
-    crate://crates.io/terminal_size/0.2.2 \
-    crate://crates.io/textwrap/0.16.0 \
-    crate://crates.io/thiserror-impl/1.0.37 \
-    crate://crates.io/thiserror/1.0.37 \
-    crate://crates.io/time-core/0.1.0 \
-    crate://crates.io/time-macros/0.2.6 \
-    crate://crates.io/time/0.3.17 \
-    crate://crates.io/typenum/1.15.0 \
-    crate://crates.io/unicode-ident/1.0.5 \
-    crate://crates.io/unicode-linebreak/0.1.4 \
-    crate://crates.io/unicode-segmentation/1.10.0 \
-    crate://crates.io/unicode-width/0.1.10 \
-    crate://crates.io/unicode-xid/0.2.4 \
-    crate://crates.io/unindent/0.1.10 \
-    crate://crates.io/users/0.11.0 \
-    crate://crates.io/utf-8/0.7.6 \
-    crate://crates.io/uuid/1.2.2 \
-    crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/walkdir/2.3.2 \
-    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/wasm-bindgen-backend/0.2.83 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.83 \
-    crate://crates.io/wasm-bindgen-macro/0.2.83 \
-    crate://crates.io/wasm-bindgen-shared/0.2.83 \
-    crate://crates.io/wasm-bindgen/0.2.83 \
-    crate://crates.io/which/4.3.0 \
-    crate://crates.io/wild/2.1.0 \
-    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.5 \
-    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi/0.3.9 \
-    crate://crates.io/windows-sys/0.42.0 \
-    crate://crates.io/windows_aarch64_gnullvm/0.42.0 \
-    crate://crates.io/windows_aarch64_msvc/0.42.0 \
-    crate://crates.io/windows_i686_gnu/0.42.0 \
-    crate://crates.io/windows_i686_msvc/0.42.0 \
-    crate://crates.io/windows_x86_64_gnu/0.42.0 \
-    crate://crates.io/windows_x86_64_gnullvm/0.42.0 \
-    crate://crates.io/windows_x86_64_msvc/0.42.0 \
-    crate://crates.io/xattr/0.2.3 \
-    crate://crates.io/yansi/0.5.1 \
-    crate://crates.io/z85/3.0.5 \
-    crate://crates.io/zip/0.6.3 \
-"
-
 
+require ${BPN}-crates.inc
 
-# FIXME: update generateme with the real MD5 of the license file
-LIC_FILES_CHKSUM = " \
-    file://LICENSE;md5=41f7469eaacac62c67d5664fff2c062d \
-"
-
-SUMMARY = "coreutils ~ GNU coreutils (updated); implemented as universal (cross-platform) utils, written in Rust"
-HOMEPAGE = "https://github.com/uutils/coreutils"
-LICENSE = "MIT"
-
-# includes this file if it exists but does not fail
-# this is useful for anything you may want to override from
-# what cargo-bitbake generates.
-include uutils-coreutils-${PV}.inc
 include uutils-coreutils.inc
-- 
2.34.1


