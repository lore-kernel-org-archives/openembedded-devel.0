Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B9BC55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 08:25:38 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15162.1786004730480082126
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2026 01:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=M2fkdfpP;
 spf=pass (domain: snapchat.com, ip: 209.85.215.175, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso1471415a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 01:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1786004730; x=1786609530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gi5jyWRJF3Gc3TEG56Q/6kVSlhNQIwkCIfx6PhKqWEQ=;
        b=M2fkdfpPiPMR7maGA0V4U/uFmesR1yijlh0zxJ+3Jyw+uzWG7Ii2a9cn7yw6LsTtGt
         T4qL+oAstBuQn/jimNdo1J+rH0REYNY8vjP2eMNqrFt8Ls1xBgSiU6M1Qix/hbwil9iT
         gA2Furyzf1lyIbIA5IrZcHLIGz+78XgPWykBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786004730; x=1786609530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gi5jyWRJF3Gc3TEG56Q/6kVSlhNQIwkCIfx6PhKqWEQ=;
        b=HTnVd9nW6l8OOu/AKdmAOwqFWqVWS/t8mSk2ZIlCo7KRSXCf++GAIRkP7VWkmZu4Ca
         dRHSuWfsHojjC0zXX6u8D3QEPZ1qhJE9LdiUdoskk/ZiLKN8uAudRTIKJv1HtRizZe+/
         y+zwS9jRTR8XCSEIjuVIMbGeopwd5hY9ITHUchKpQ4rqVDFwK7nnv6kwg0gn7O4dB7r/
         FFj8wP/oBLL/pYOn28/C1InYVIfP9IhfyLVLkxtssgRb+ZHrEqbzj4VkWCr9p0tGaz4C
         Fw2IxZHBo+9se8n+h52ruG5eleSmaVtmngi/g8r6wCPtBO9WyxETdE3IjHpBz7RMPet5
         Rvkg==
X-Gm-Message-State: AOJu0YzgdR3PCJu2G5BDZRUtBCCtgRFYTcBY5dDoZXZVGco6IKQ43IYf
	mOGDWHhYPXOp8M8EPtXRUBMsTQN8sGImNFLa5S0bu75LrCveIKV+brf3UTH3/3MDpX8foQmfIwD
	1JXPEb38=
X-Gm-Gg: AR+sD103TVkbHFEboGTMsDL3f+oCznyIq4ECjOvtVfUgssPRDcj/qnjHe8MzP0v0b8H
	jRg80vaSffzEWpsOR65HRpA49ikq+G1664BmfIf+p/IJTnXW8rfevpGqW6GNlXkMN16UBR5vhvd
	tLjtbzlFJhQvwgBSY7s+LmTLSa4sgK4roOYDLNSLsY6ZtXLD/JYUfs7kwiCrOlO/jRDv89tSCMI
	RJKkAX81Ag4tMfZy2mKYjypJCm4vdUivWNi0XzdhL+k4ivYO0u419XUnUAAN1ELTyGh8hPlhp3b
	nEGr/KWRyGOZtFi2+WL3exsXXUSkCk63SHzr5DRD2dtuwFYcIFGvzVuHHBY5YLH9yj1OERRVvEc
	sZKEwHhUWCbkhJWbrzHixRL5lsk6i5qjjLJ/mzG5YMCmJhMl2PkN/PF8svr+rb0aSkR8y35OdJA
	Bo1Broh+J8WITtQ97nVmzYKE2EIBMFm7PWOpGJTwxQxkg1M/Ceu95baDaAQq/V219dj6ku9uixu
	CduOEMwRaTBSGWo3UhxxHYt1AsU/sHZjA==
X-Received: by 2002:a05:6a20:e347:b0:3bd:3800:7538 with SMTP id adf61e73a8af0-3cb85ffdacamr14900743637.33.1786004728991;
        Thu, 06 Aug 2026 01:25:28 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586447d52sm23823990eec.12.2026.08.06.01.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:25:28 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH] uutils-coreutils: upgrade 0.9.0 -> 0.10.0
Date: Thu,  6 Aug 2026 10:25:21 +0200
Message-ID: <20260806082521.778276-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Aug 2026 08:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128838

From: Etienne Cordonnier <ecordonnier@snap.com>

See release notes at https://github.com/uutils/coreutils/releases/tag/0.10.0

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 .../uutils-coreutils-crates.inc               | 364 +++++++++---------
 ...ls_0.9.0.bb => uutils-coreutils_0.10.0.bb} |   0
 2 files changed, 174 insertions(+), 190 deletions(-)
 rename meta-oe/recipes-core/uutils-coreutils/{uutils-coreutils_0.9.0.bb => uutils-coreutils_0.10.0.bb} (100%)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
index 4b78be83de..7d16659d6c 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
@@ -21,13 +21,14 @@ SRC_URI += " \
     crate://crates.io/bigdecimal/0.4.10 \
     crate://crates.io/binary-heap-plus/0.5.0 \
     crate://crates.io/bindgen/0.72.1 \
+    crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/bitflags/2.11.1 \
     crate://crates.io/bitvec/1.0.1 \
     crate://crates.io/blake2b_simd/1.0.4 \
     crate://crates.io/blake3/1.8.5 \
     crate://crates.io/block-buffer/0.12.0 \
     crate://crates.io/block2/0.6.2 \
-    crate://crates.io/bstr/1.12.1 \
+    crate://crates.io/bstr/1.13.0 \
     crate://crates.io/bumpalo/3.20.2 \
     crate://crates.io/bytecount/0.6.9 \
     crate://crates.io/byteorder/1.5.0 \
@@ -35,24 +36,24 @@ SRC_URI += " \
     crate://crates.io/cc/1.2.59 \
     crate://crates.io/cexpr/0.6.0 \
     crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/cfg_aliases/0.2.1 \
+    crate://crates.io/cfg_aliases/0.2.2 \
     crate://crates.io/chacha20/0.10.0 \
     crate://crates.io/chrono/0.4.44 \
     crate://crates.io/clang-sys/1.8.1 \
-    crate://crates.io/clap/4.6.1 \
-    crate://crates.io/clap_builder/4.6.0 \
-    crate://crates.io/clap_complete/4.6.5 \
+    crate://crates.io/clap/4.6.5 \
+    crate://crates.io/clap_builder/4.6.5 \
+    crate://crates.io/clap_complete/4.6.8 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/clap_mangen/0.3.0 \
-    crate://crates.io/codspeed/4.7.0 \
-    crate://crates.io/codspeed-divan-compat/4.7.0 \
-    crate://crates.io/codspeed-divan-compat-macros/4.7.0 \
-    crate://crates.io/codspeed-divan-compat-walltime/4.7.0 \
+    crate://crates.io/codspeed/5.0.1 \
+    crate://crates.io/codspeed-divan-compat/5.0.1 \
+    crate://crates.io/codspeed-divan-compat-macros/5.0.1 \
+    crate://crates.io/codspeed-divan-compat-walltime/5.0.1 \
     crate://crates.io/colorchoice/1.0.5 \
-    crate://crates.io/colored/2.2.0 \
+    crate://crates.io/colored/3.1.1 \
     crate://crates.io/compare/0.1.0 \
     crate://crates.io/condtype/1.3.0 \
-    crate://crates.io/console/0.16.3 \
+    crate://crates.io/console/0.16.4 \
     crate://crates.io/const-oid/0.10.2 \
     crate://crates.io/const-random/0.1.18 \
     crate://crates.io/const-random-macro/0.1.16 \
@@ -65,24 +66,27 @@ SRC_URI += " \
     crate://crates.io/crc-fast/1.9.0 \
     crate://crates.io/crc32fast/1.5.0 \
     crate://crates.io/crossbeam-deque/0.8.6 \
-    crate://crates.io/crossbeam-epoch/0.9.18 \
+    crate://crates.io/crossbeam-epoch/0.9.20 \
     crate://crates.io/crossbeam-utils/0.8.21 \
     crate://crates.io/crossterm/0.29.0 \
     crate://crates.io/crossterm_winapi/0.9.1 \
     crate://crates.io/crunchy/0.2.4 \
     crate://crates.io/crypto-common/0.1.7 \
     crate://crates.io/crypto-common/0.2.1 \
-    crate://crates.io/ctor/1.0.7 \
+    crate://crates.io/ctor/1.0.12 \
     crate://crates.io/ctrlc/3.5.2 \
-    crate://crates.io/data-encoding/2.11.0 \
-    crate://crates.io/data-encoding-macro/0.1.20 \
-    crate://crates.io/data-encoding-macro-internal/0.1.18 \
+    crate://crates.io/data-encoding/2.11.1 \
+    crate://crates.io/data-encoding-macro/0.1.21 \
+    crate://crates.io/data-encoding-macro-internal/0.1.19 \
+    crate://crates.io/defmt/1.1.1 \
+    crate://crates.io/defmt-macros/1.1.1 \
+    crate://crates.io/defmt-parser/1.0.0 \
     crate://crates.io/deranged/0.5.8 \
     crate://crates.io/diff/0.1.13 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/digest/0.11.3 \
     crate://crates.io/dispatch2/0.3.1 \
-    crate://crates.io/displaydoc/0.2.5 \
+    crate://crates.io/displaydoc/0.2.7 \
     crate://crates.io/divan-macros/0.1.17 \
     crate://crates.io/dlv-list/0.5.2 \
     crate://crates.io/dns-lookup/3.0.1 \
@@ -92,7 +96,6 @@ SRC_URI += " \
     crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/errno/0.3.14 \
-    crate://crates.io/exacl/0.13.0 \
     crate://crates.io/fastrand/2.4.1 \
     crate://crates.io/file_diff/1.0.0 \
     crate://crates.io/filedescriptor/0.8.3 \
@@ -104,8 +107,9 @@ SRC_URI += " \
     crate://crates.io/fluent-bundle/0.16.0 \
     crate://crates.io/fluent-langneg/0.13.1 \
     crate://crates.io/fluent-syntax/0.12.0 \
-    crate://crates.io/foldhash/0.1.5 \
     crate://crates.io/foldhash/0.2.0 \
+    crate://crates.io/foreign-types/0.3.2 \
+    crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/fs_extra/1.3.0 \
     crate://crates.io/fsevent-sys/4.1.0 \
     crate://crates.io/fts-sys/0.2.17 \
@@ -118,13 +122,11 @@ SRC_URI += " \
     crate://crates.io/gcd/2.3.0 \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/getrandom/0.2.17 \
-    crate://crates.io/getrandom/0.4.2 \
-    crate://crates.io/glob/0.3.3 \
+    crate://crates.io/getrandom/0.4.3 \
+    crate://crates.io/glob/0.3.4 \
     crate://crates.io/half/2.7.1 \
     crate://crates.io/hashbrown/0.14.5 \
-    crate://crates.io/hashbrown/0.15.5 \
     crate://crates.io/hashbrown/0.16.1 \
-    crate://crates.io/heck/0.5.0 \
     crate://crates.io/hex/0.4.3 \
     crate://crates.io/hex-literal/1.1.0 \
     crate://crates.io/hostname/0.4.2 \
@@ -133,7 +135,7 @@ SRC_URI += " \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
     crate://crates.io/icu_calendar/2.2.1 \
     crate://crates.io/icu_calendar_data/2.2.0 \
-    crate://crates.io/icu_collator/2.2.0 \
+    crate://crates.io/icu_collator/2.2.1 \
     crate://crates.io/icu_collator_data/2.2.0 \
     crate://crates.io/icu_collections/2.2.0 \
     crate://crates.io/icu_datetime/2.2.0 \
@@ -153,9 +155,8 @@ SRC_URI += " \
     crate://crates.io/icu_provider/2.2.0 \
     crate://crates.io/icu_time/2.2.0 \
     crate://crates.io/icu_time_data/2.2.0 \
-    crate://crates.io/id-arena/2.3.0 \
     crate://crates.io/indexmap/2.13.1 \
-    crate://crates.io/indicatif/0.18.4 \
+    crate://crates.io/indicatif/0.18.6 \
     crate://crates.io/inotify/0.11.1 \
     crate://crates.io/inotify-sys/0.1.5 \
     crate://crates.io/intl-memoizer/0.5.3 \
@@ -163,23 +164,23 @@ SRC_URI += " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itertools/0.14.0 \
+    crate://crates.io/itertools/0.15.0 \
     crate://crates.io/itoa/1.0.18 \
-    crate://crates.io/jiff/0.2.28 \
+    crate://crates.io/jiff/0.2.35 \
+    crate://crates.io/jiff-core/0.1.0 \
     crate://crates.io/jiff-icu/0.2.2 \
-    crate://crates.io/jiff-static/0.2.28 \
-    crate://crates.io/jiff-tzdb/0.1.6 \
+    crate://crates.io/jiff-static/0.2.35 \
+    crate://crates.io/jiff-tzdb/0.1.8 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/js-sys/0.3.94 \
     crate://crates.io/keccak/0.2.0 \
     crate://crates.io/kqueue/1.1.1 \
     crate://crates.io/kqueue-sys/1.1.0 \
-    crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/leb128fmt/0.1.0 \
-    crate://crates.io/libc/0.2.186 \
+    crate://crates.io/libc/0.2.189 \
     crate://crates.io/libloading/0.8.9 \
     crate://crates.io/libm/0.2.16 \
-    crate://crates.io/link-section/0.18.0 \
-    crate://crates.io/linktime-proc-macro/0.2.0 \
+    crate://crates.io/link-section/0.19.2 \
+    crate://crates.io/linktime-proc-macro/0.2.2 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.2 \
     crate://crates.io/litrs/1.0.0 \
@@ -188,8 +189,8 @@ SRC_URI += " \
     crate://crates.io/lru/0.16.3 \
     crate://crates.io/lscolors/0.21.0 \
     crate://crates.io/md-5/0.11.0 \
-    crate://crates.io/memchr/2.8.1 \
-    crate://crates.io/memmap2/0.9.10 \
+    crate://crates.io/memchr/2.8.3 \
+    crate://crates.io/memmap2/0.9.11 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/minimal-lexical/0.2.1 \
     crate://crates.io/miniz_oxide/0.8.9 \
@@ -200,8 +201,8 @@ SRC_URI += " \
     crate://crates.io/notify/8.2.0 \
     crate://crates.io/notify-types/2.1.0 \
     crate://crates.io/nu-ansi-term/0.50.3 \
-    crate://crates.io/num-bigint/0.4.6 \
-    crate://crates.io/num-conv/0.2.1 \
+    crate://crates.io/num-bigint/0.4.8 \
+    crate://crates.io/num-conv/0.2.2 \
     crate://crates.io/num-integer/0.1.46 \
     crate://crates.io/num-modular/0.6.1 \
     crate://crates.io/num-prime/0.5.0 \
@@ -213,16 +214,20 @@ SRC_URI += " \
     crate://crates.io/once_cell_polyfill/1.70.2 \
     crate://crates.io/onig/6.5.3 \
     crate://crates.io/onig_sys/69.9.3 \
+    crate://crates.io/openssl/0.10.81 \
+    crate://crates.io/openssl-macros/0.1.1 \
+    crate://crates.io/openssl-src/300.5.5+3.5.5 \
+    crate://crates.io/openssl-sys/0.9.117 \
     crate://crates.io/ordered-multimap/0.7.3 \
     crate://crates.io/os_display/0.1.4 \
     crate://crates.io/outref/0.5.2 \
     crate://crates.io/parking_lot/0.12.5 \
     crate://crates.io/parking_lot_core/0.9.12 \
-    crate://crates.io/parse_datetime/0.14.0 \
-    crate://crates.io/phf/0.13.1 \
-    crate://crates.io/phf_codegen/0.13.1 \
-    crate://crates.io/phf_generator/0.13.1 \
-    crate://crates.io/phf_shared/0.13.1 \
+    crate://crates.io/parse_datetime/0.15.0 \
+    crate://crates.io/phf/0.14.0 \
+    crate://crates.io/phf_codegen/0.14.0 \
+    crate://crates.io/phf_generator/0.14.0 \
+    crate://crates.io/phf_shared/0.14.0 \
     crate://crates.io/pin-project-lite/0.2.17 \
     crate://crates.io/pkg-config/0.3.32 \
     crate://crates.io/platform-info/2.1.0 \
@@ -234,14 +239,14 @@ SRC_URI += " \
     crate://crates.io/pretty_assertions/1.4.1 \
     crate://crates.io/prettyplease/0.2.37 \
     crate://crates.io/proc-macro-crate/3.5.0 \
-    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/proc-macro2/1.0.107 \
     crate://crates.io/procfs/0.18.0 \
     crate://crates.io/procfs-core/0.18.0 \
-    crate://crates.io/quote/1.0.45 \
+    crate://crates.io/quote/1.0.47 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/radium/0.7.0 \
     crate://crates.io/rand/0.8.6 \
-    crate://crates.io/rand/0.10.1 \
+    crate://crates.io/rand/0.10.2 \
     crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_chacha/0.10.0 \
     crate://crates.io/rand_core/0.6.4 \
@@ -249,10 +254,10 @@ SRC_URI += " \
     crate://crates.io/rayon/1.12.0 \
     crate://crates.io/rayon-core/1.13.0 \
     crate://crates.io/redox_syscall/0.5.18 \
-    crate://crates.io/regex/1.12.3 \
-    crate://crates.io/regex-automata/0.4.14 \
+    crate://crates.io/regex/1.13.1 \
+    crate://crates.io/regex-automata/0.4.16 \
     crate://crates.io/regex-lite/0.1.9 \
-    crate://crates.io/regex-syntax/0.8.10 \
+    crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/relative-path/1.9.3 \
     crate://crates.io/rlimit/0.11.0 \
     crate://crates.io/roff/1.1.1 \
@@ -260,14 +265,14 @@ SRC_URI += " \
     crate://crates.io/rstest_macros/0.26.1 \
     crate://crates.io/rstest_reuse/0.7.0 \
     crate://crates.io/rust-ini/0.21.3 \
-    crate://crates.io/rustc-hash/2.1.2 \
+    crate://crates.io/rustc-hash/2.1.3 \
     crate://crates.io/rustc_version/0.4.1 \
     crate://crates.io/rustix/1.1.4 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/scopeguard/1.2.0 \
-    crate://crates.io/self_cell/1.2.2 \
-    crate://crates.io/selinux/0.6.2 \
+    crate://crates.io/self_cell/1.3.0 \
+    crate://crates.io/selinux/0.6.3 \
     crate://crates.io/selinux-sys/0.7.0 \
     crate://crates.io/semver/1.0.28 \
     crate://crates.io/serde/1.0.228 \
@@ -288,26 +293,27 @@ SRC_URI += " \
     crate://crates.io/sm3/0.5.0 \
     crate://crates.io/smallvec/1.15.1 \
     crate://crates.io/smawk/0.3.2 \
-    crate://crates.io/socket2/0.6.3 \
-    crate://crates.io/spin/0.10.0 \
+    crate://crates.io/socket2/0.6.5 \
+    crate://crates.io/spin/0.10.1 \
     crate://crates.io/sponge-cursor/0.1.0 \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/statrs/0.18.0 \
     crate://crates.io/string-interner/0.20.0 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/2.0.117 \
+    crate://crates.io/syn/3.0.2 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/tap/1.0.1 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
     crate://crates.io/textwrap/0.16.2 \
     crate://crates.io/thiserror/1.0.69 \
-    crate://crates.io/thiserror/2.0.18 \
+    crate://crates.io/thiserror/2.0.19 \
     crate://crates.io/thiserror-impl/1.0.69 \
-    crate://crates.io/thiserror-impl/2.0.18 \
-    crate://crates.io/time/0.3.47 \
-    crate://crates.io/time-core/0.1.8 \
-    crate://crates.io/time-macros/0.2.27 \
+    crate://crates.io/thiserror-impl/2.0.19 \
+    crate://crates.io/time/0.3.55 \
+    crate://crates.io/time-core/0.1.9 \
+    crate://crates.io/time-macros/0.2.32 \
     crate://crates.io/tiny-keccak/2.0.2 \
     crate://crates.io/tinystr/0.8.3 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
@@ -322,7 +328,6 @@ SRC_URI += " \
     crate://crates.io/unicode-linebreak/0.1.5 \
     crate://crates.io/unicode-width/0.1.14 \
     crate://crates.io/unicode-width/0.2.2 \
-    crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/unindent/0.2.4 \
     crate://crates.io/unit-prefix/0.5.2 \
     crate://crates.io/utf16_iter/1.0.5 \
@@ -330,21 +335,16 @@ SRC_URI += " \
     crate://crates.io/utf8parse/0.2.2 \
     crate://crates.io/utmp-classic/0.1.6 \
     crate://crates.io/utmp-classic-raw/0.1.3 \
-    crate://crates.io/uuid/1.23.1 \
     crate://crates.io/uutils_term_grid/0.8.0 \
+    crate://crates.io/vcpkg/0.2.15 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vsimd/0.8.0 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
-    crate://crates.io/wasip2/1.0.2+wasi-0.2.9 \
-    crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 \
     crate://crates.io/wasm-bindgen/0.2.117 \
     crate://crates.io/wasm-bindgen-macro/0.2.117 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.117 \
     crate://crates.io/wasm-bindgen-shared/0.2.117 \
-    crate://crates.io/wasm-encoder/0.244.0 \
-    crate://crates.io/wasm-metadata/0.244.0 \
-    crate://crates.io/wasmparser/0.244.0 \
     crate://crates.io/web-time/1.1.0 \
     crate://crates.io/wild/2.2.1 \
     crate://crates.io/winapi/0.3.9 \
@@ -378,14 +378,7 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
     crate://crates.io/windows_x86_64_msvc/0.53.1 \
-    crate://crates.io/winnow/0.7.15 \
     crate://crates.io/winnow/1.0.1 \
-    crate://crates.io/wit-bindgen/0.51.0 \
-    crate://crates.io/wit-bindgen-core/0.51.0 \
-    crate://crates.io/wit-bindgen-rust/0.51.0 \
-    crate://crates.io/wit-bindgen-rust-macro/0.51.0 \
-    crate://crates.io/wit-component/0.244.0 \
-    crate://crates.io/wit-parser/0.244.0 \
     crate://crates.io/write16/1.0.0 \
     crate://crates.io/writeable/0.6.3 \
     crate://crates.io/wyz/0.5.1 \
@@ -395,9 +388,9 @@ SRC_URI += " \
     crate://crates.io/yoke-derive/0.8.2 \
     crate://crates.io/z85/3.0.7 \
     crate://crates.io/zerocopy/0.7.35 \
-    crate://crates.io/zerocopy/0.8.48 \
+    crate://crates.io/zerocopy/0.8.55 \
     crate://crates.io/zerocopy-derive/0.7.35 \
-    crate://crates.io/zerocopy-derive/0.8.48 \
+    crate://crates.io/zerocopy-derive/0.8.55 \
     crate://crates.io/zerofrom/0.1.7 \
     crate://crates.io/zerofrom-derive/0.1.7 \
     crate://crates.io/zerotrie/0.2.4 \
@@ -405,7 +398,7 @@ SRC_URI += " \
     crate://crates.io/zerovec-derive/0.11.3 \
     crate://crates.io/zip/8.6.0 \
     crate://crates.io/zlib-rs/0.6.3 \
-    crate://crates.io/zmij/1.0.21 \
+    crate://crates.io/zmij/1.0.23 \
     crate://crates.io/zopfli/0.8.3 \
 "
 
@@ -428,13 +421,14 @@ SRC_URI[base64-simd-0.8.0.sha256sum] = "339abbe78e73178762e23bea9dfd08e697eb3f33
 SRC_URI[bigdecimal-0.4.10.sha256sum] = "4d6867f1565b3aad85681f1015055b087fcfd840d6aeee6eee7f2da317603695"
 SRC_URI[binary-heap-plus-0.5.0.sha256sum] = "e4551d8382e911ecc0d0f0ffb602777988669be09447d536ff4388d1def11296"
 SRC_URI[bindgen-0.72.1.sha256sum] = "993776b509cfb49c750f11b8f07a46fa23e0a1386ffc01fb1e7d343efc387895"
+SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[bitflags-2.11.1.sha256sum] = "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
 SRC_URI[bitvec-1.0.1.sha256sum] = "1bc2832c24239b0141d5674bb9174f9d68a8b5b3f2753311927c172ca46f7e9c"
 SRC_URI[blake2b_simd-1.0.4.sha256sum] = "b79834656f71332577234b50bfc009996f7449e0c056884e6a02492ded0ca2f3"
 SRC_URI[blake3-1.8.5.sha256sum] = "0aa83c34e62843d924f905e0f5c866eb1dd6545fc4d719e803d9ba6030371fce"
 SRC_URI[block-buffer-0.12.0.sha256sum] = "cdd35008169921d80bc60d3d0ab416eecb028c4cd653352907921d95084790be"
 SRC_URI[block2-0.6.2.sha256sum] = "cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5"
-SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
+SRC_URI[bstr-1.13.0.sha256sum] = "1f7dc094d718f2e1c1559ad110e27eeaae14a5465d3d56dd6dbd793079fbd530"
 SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
 SRC_URI[bytecount-0.6.9.sha256sum] = "175812e0be2bccb6abe50bb8d566126198344f707e304f45c648fd8f2cc0365e"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
@@ -442,24 +436,24 @@ SRC_URI[calendrical_calculations-0.2.4.sha256sum] = "5abbd6eeda6885048d357edc667
 SRC_URI[cc-1.2.59.sha256sum] = "b7a4d3ec6524d28a329fc53654bbadc9bdd7b0431f5d65f1a56ffb28a1ee5283"
 SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
-SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
+SRC_URI[cfg_aliases-0.2.2.sha256sum] = "f079e83a288787bcd14a6aea84cee5c87a67c5a3e660c30f557a3d24761b3527"
 SRC_URI[chacha20-0.10.0.sha256sum] = "6f8d983286843e49675a4b7a2d174efe136dc93a18d69130dd18198a6c167601"
 SRC_URI[chrono-0.4.44.sha256sum] = "c673075a2e0e5f4a1dde27ce9dee1ea4558c7ffe648f576438a20ca1d2acc4b0"
 SRC_URI[clang-sys-1.8.1.sha256sum] = "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
-SRC_URI[clap-4.6.1.sha256sum] = "1ddb117e43bbf7dacf0a4190fef4d345b9bad68dfc649cb349e7d17d28428e51"
-SRC_URI[clap_builder-4.6.0.sha256sum] = "714a53001bf66416adb0e2ef5ac857140e7dc3a0c48fb28b2f10762fc4b5069f"
-SRC_URI[clap_complete-4.6.5.sha256sum] = "e0a7a9bfdb35811f9e59832f0f05975114d2251b415fb534108e6f34060fd772"
+SRC_URI[clap-4.6.5.sha256sum] = "301b56658598e48f3648647ac6fc887be7e7108eddfa4e9b63fcf3ec58c0cadf"
+SRC_URI[clap_builder-4.6.5.sha256sum] = "94a65403d1a1bd28f7dc68eb8506e8874808ee5eecb59298de588e2e1407a078"
+SRC_URI[clap_complete-4.6.8.sha256sum] = "b1f84a88507dbd05c695f2cb5e8558e747179134005e9893882dec964190ed89"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[clap_mangen-0.3.0.sha256sum] = "d82842b45bf9f6a3be090dd860095ac30728042c08e0d6261ca7259b5d850f07"
-SRC_URI[codspeed-4.7.0.sha256sum] = "57af92d1db7f6871b7e82c79cd87f2501db66f36b0eab924be6ea83dd6b2f3f3"
-SRC_URI[codspeed-divan-compat-4.7.0.sha256sum] = "c4ea79fd0b1f2128cfac6308369013dba92df47baf4a4f66b57d8158224a361d"
-SRC_URI[codspeed-divan-compat-macros-4.7.0.sha256sum] = "f70e4ddd6beedefeb48f59d5f85fc21365a66e7976408c3d39f6cbbc4f03e08c"
-SRC_URI[codspeed-divan-compat-walltime-4.7.0.sha256sum] = "490c04f6076be6eacfafb496b8b237f3efbbed93838f2689115cc6f35fcf81c9"
+SRC_URI[codspeed-5.0.1.sha256sum] = "7083f253260bcb4aaa3b4aa4c52973703dabc1a85c2f193997e2689aafa8a919"
+SRC_URI[codspeed-divan-compat-5.0.1.sha256sum] = "bc1065d507e1cbab731a7976db4cef7e47e49b87b4dbc0a925df07d343558420"
+SRC_URI[codspeed-divan-compat-macros-5.0.1.sha256sum] = "2fd05482a95823ffe421e8a9ba24fa22a6a30d594e2c60455cbb43a41bf2d8fa"
+SRC_URI[codspeed-divan-compat-walltime-5.0.1.sha256sum] = "d2f8eae75b8fa85357020a404899c4280d590c9fd1c47640b3ce53106c62d2ee"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
-SRC_URI[colored-2.2.0.sha256sum] = "117725a109d387c937a1533ce01b450cbde6b88abceea8473c4d7a85853cda3c"
+SRC_URI[colored-3.1.1.sha256sum] = "faf9468729b8cbcea668e36183cb69d317348c2e08e994829fb56ebfdfbaac34"
 SRC_URI[compare-0.1.0.sha256sum] = "120133d4db2ec47efe2e26502ee984747630c67f51974fca0b6c1340cf2368d3"
 SRC_URI[condtype-1.3.0.sha256sum] = "baf0a07a401f374238ab8e2f11a104d2851bf9ce711ec69804834de8af45c7af"
-SRC_URI[console-0.16.3.sha256sum] = "d64e8af5551369d19cf50138de61f1c42074ab970f74e99be916646777f8fc87"
+SRC_URI[console-0.16.4.sha256sum] = "4fe5f465a4f6fee88fad41b85d990f84c835335e85b5d9e6e63e0d06d28cba7c"
 SRC_URI[const-oid-0.10.2.sha256sum] = "a6ef517f0926dd24a1582492c791b6a4818a4d94e789a334894aa15b0d12f55c"
 SRC_URI[const-random-0.1.18.sha256sum] = "87e00182fe74b066627d63b85fd550ac2998d4b0bd86bfed477a0ae4c7c71359"
 SRC_URI[const-random-macro-0.1.16.sha256sum] = "f9d839f2a20b0aee515dc581a6172f2321f96cab76c1a38a4c584a194955390e"
@@ -472,24 +466,27 @@ SRC_URI[crc-catalog-2.5.0.sha256sum] = "217698eaf96b4a3f0bc4f3662aaa55bdf913cd54
 SRC_URI[crc-fast-1.9.0.sha256sum] = "2fd92aca2c6001b1bf5ba0ff84ee74ec8501b52bbef0cac80bf25a6c1d87a83d"
 SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
 SRC_URI[crossbeam-deque-0.8.6.sha256sum] = "9dd111b7b7f7d55b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51"
-SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
+SRC_URI[crossbeam-epoch-0.9.20.sha256sum] = "2d6914041f254d6e9176c01941b21115dcfb7089e55135a35411081bd106ef3f"
 SRC_URI[crossbeam-utils-0.8.21.sha256sum] = "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
 SRC_URI[crossterm-0.29.0.sha256sum] = "d8b9f2e4c67f833b660cdb0a3523065869fb35570177239812ed4c905aeff87b"
 SRC_URI[crossterm_winapi-0.9.1.sha256sum] = "acdd7c62a3665c7f6830a51635d9ac9b23ed385797f70a83bb8bafe9c572ab2b"
 SRC_URI[crunchy-0.2.4.sha256sum] = "460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5"
 SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
 SRC_URI[crypto-common-0.2.1.sha256sum] = "77727bb15fa921304124b128af125e7e3b968275d1b108b379190264f4423710"
-SRC_URI[ctor-1.0.7.sha256sum] = "01334b89b69ff726750c5ce5073fc8bd860e99aa9a8fc5ca11b04730e3aee97a"
+SRC_URI[ctor-1.0.12.sha256sum] = "2d83cb7e7a873830708d6b02a78cd36a592c6fa14bf267b68725103b85c0d77f"
 SRC_URI[ctrlc-3.5.2.sha256sum] = "e0b1fab2ae45819af2d0731d60f2afe17227ebb1a1538a236da84c93e9a60162"
-SRC_URI[data-encoding-2.11.0.sha256sum] = "a4ae5f15dda3c708c0ade84bfee31ccab44a3da4f88015ed22f63732abe300c8"
-SRC_URI[data-encoding-macro-0.1.20.sha256sum] = "3259c913752a86488b501ed8680446a5ed2d5aeac6e596cb23ba3800768ea32c"
-SRC_URI[data-encoding-macro-internal-0.1.18.sha256sum] = "ccc2776f0c61eca1ca32528f85548abd1a4be8fb53d1b21c013e4f18da1e7090"
+SRC_URI[data-encoding-2.11.1.sha256sum] = "4583a4551df46e2792f82ceeac45e850d2e2d5debba0b91f102385cda5b11f06"
+SRC_URI[data-encoding-macro-0.1.21.sha256sum] = "c6a127ecbb3c4632e1525380e04c0c3fcf8dcb44d32a79ea290d8a36906edcd8"
+SRC_URI[data-encoding-macro-internal-0.1.19.sha256sum] = "c54e03a951783e8b327515db3f2a2fd0e3bed362a96b066f341ce66ed49b4ead"
+SRC_URI[defmt-1.1.1.sha256sum] = "e2953bfe4f93bbd20cc71198842756f77d161884c99ebbabc41d80231ded88d1"
+SRC_URI[defmt-macros-1.1.1.sha256sum] = "bad9c72e7ca2137e0dc3813245a0d282fd6daad32fd800af018306a9169b5fe8"
+SRC_URI[defmt-parser-1.0.0.sha256sum] = "10d60334b3b2e7c9d91ef8150abfb6fa4c1c39ebbcf4a81c2e346aad939fee3e"
 SRC_URI[deranged-0.5.8.sha256sum] = "7cd812cc2bc1d69d4764bd80df88b4317eaef9e773c75226407d9bc0876b211c"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[digest-0.11.3.sha256sum] = "f1dd6dbb5841937940781866fa1281a1ff7bd3bf827091440879f9994983d5c2"
 SRC_URI[dispatch2-0.3.1.sha256sum] = "1e0e367e4e7da84520dedcac1901e4da967309406d1e51017ae1abfb97adbd38"
-SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
+SRC_URI[displaydoc-0.2.7.sha256sum] = "c6232dd377dcc64799954cbd3a9bb882e9cdc1308ccd87b1c098f1fb2eaf82a8"
 SRC_URI[divan-macros-0.1.17.sha256sum] = "8dc51d98e636f5e3b0759a39257458b22619cac7e96d932da6eeb052891bb67c"
 SRC_URI[dlv-list-0.5.2.sha256sum] = "442039f5147480ba31067cb00ada1adae6892028e40e45fc5de7b7df6dcc1b5f"
 SRC_URI[dns-lookup-3.0.1.sha256sum] = "6e39034cee21a2f5bbb66ba0e3689819c4bb5d00382a282006e802a7ffa6c41d"
@@ -499,7 +496,6 @@ SRC_URI[either-1.15.0.sha256sum] = "48c757948c5ede0e46177b7add2e67155f70e33c07fe
 SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
-SRC_URI[exacl-0.13.0.sha256sum] = "8de9e551ced9d700a31dacb8b168129640240fcd7a279a3fa4d59608b84ebcae"
 SRC_URI[fastrand-2.4.1.sha256sum] = "9f1f227452a390804cdb637b74a86990f2a7d7ba4b7d5693aac9b4dd6defd8d6"
 SRC_URI[file_diff-1.0.0.sha256sum] = "31a7a908b8f32538a2143e59a6e4e2508988832d5d4d6f7c156b3cbc762643a5"
 SRC_URI[filedescriptor-0.8.3.sha256sum] = "e40758ed24c9b2eeb76c35fb0aebc66c626084edd827e07e1552279814c6682d"
@@ -511,8 +507,9 @@ SRC_URI[fluent-0.17.0.sha256sum] = "8137a6d5a2c50d6b0ebfcb9aaa91a28154e0a70605f1
 SRC_URI[fluent-bundle-0.16.0.sha256sum] = "01203cb8918f5711e73891b347816d932046f95f54207710bda99beaeb423bf4"
 SRC_URI[fluent-langneg-0.13.1.sha256sum] = "7eebbe59450baee8282d71676f3bfed5689aeab00b27545e83e5f14b1195e8b0"
 SRC_URI[fluent-syntax-0.12.0.sha256sum] = "54f0d287c53ffd184d04d8677f590f4ac5379785529e5e08b1c8083acdd5c198"
-SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2"
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
+SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
+SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[fs_extra-1.3.0.sha256sum] = "42703706b716c37f96a77aea830392ad231f44c9e9a67872fa5548707e11b11c"
 SRC_URI[fsevent-sys-4.1.0.sha256sum] = "76ee7a02da4d231650c7cea31349b889be2f45ddb3ef3032d2ec8185f6313fd2"
 SRC_URI[fts-sys-0.2.17.sha256sum] = "9c03259139c9b098dd92241b046fedfeebcd6b000d491c821b24ced28558a9c2"
@@ -525,13 +522,11 @@ SRC_URI[futures-util-0.3.32.sha256sum] = "389ca41296e6190b48053de0321d02a77f32f8
 SRC_URI[gcd-2.3.0.sha256sum] = "1d758ba1b47b00caf47f24925c0074ecb20d6dfcffe7f6d53395c0465674841a"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.2.17.sha256sum] = "ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0"
-SRC_URI[getrandom-0.4.2.sha256sum] = "0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555"
-SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
+SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
+SRC_URI[glob-0.3.4.sha256sum] = "e4eba85ea1d0a966a983acd07deee566e67395d2d96b6fb39e62b5a833f1eb0b"
 SRC_URI[half-2.7.1.sha256sum] = "6ea2d84b969582b4b1864a92dc5d27cd2b77b622a8d79306834f1be5ba20d84b"
 SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
-SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
 SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
-SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
 SRC_URI[hex-literal-1.1.0.sha256sum] = "e712f64ec3850b98572bffac52e2c6f282b29fe6c5fa6d42334b30be438d95c1"
 SRC_URI[hostname-0.4.2.sha256sum] = "617aaa3557aef3810a6369d0a99fac8a080891b68bd9f9812a1eeda0c0730cbd"
@@ -540,7 +535,7 @@ SRC_URI[iana-time-zone-0.1.65.sha256sum] = "e31bc9ad994ba00e440a8aa5c9ef0ec67d5c
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
 SRC_URI[icu_calendar-2.2.1.sha256sum] = "a2b2acc6263f494f1df50685b53ff8e57869e47d5c6fe39c23d518ae9a4f3e45"
 SRC_URI[icu_calendar_data-2.2.0.sha256sum] = "118577bcf3a0fa7c6ac0a7d6e951814da84ee56b9b1f68fb4d8d10b08cefaf4d"
-SRC_URI[icu_collator-2.2.0.sha256sum] = "b521b92a2666061ddda902769d8a4cf730b5c9529a845cc1b69770b12a6c9a71"
+SRC_URI[icu_collator-2.2.1.sha256sum] = "8bbdf98e5e0aa827770acee171ebb568aaab975a36b56afdb5fd0e2f525750bb"
 SRC_URI[icu_collator_data-2.2.0.sha256sum] = "038ed8e5817f2059c2f3efb0945ba78d060d3d25e8f1a1bea5139f821a21a2f0"
 SRC_URI[icu_collections-2.2.0.sha256sum] = "2984d1cd16c883d7935b9e07e44071dca8d917fd52ecc02c04d5fa0b5a3f191c"
 SRC_URI[icu_datetime-2.2.0.sha256sum] = "989d56ea5bbc43ae2b4e0388874b002884eaf4ed3a76c84a6c8c5ad575e04d72"
@@ -560,9 +555,8 @@ SRC_URI[icu_properties_data-2.2.0.sha256sum] = "8e2bbb201e0c04f7b4b3e14382af113e
 SRC_URI[icu_provider-2.2.0.sha256sum] = "139c4cf31c8b5f33d7e199446eff9c1e02decfc2f0eec2c8d71f65befa45b421"
 SRC_URI[icu_time-2.2.0.sha256sum] = "ec3af0c141da0a61d4f6970cd1d5f4b388b17ea22f8124f8f6049d3d5147586a"
 SRC_URI[icu_time_data-2.2.0.sha256sum] = "6f2f8aeca682d874a5247084aa4fb7d1cef9ba45d889c21209a8818dcaaa0ec9"
-SRC_URI[id-arena-2.3.0.sha256sum] = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
 SRC_URI[indexmap-2.13.1.sha256sum] = "45a8a2b9cb3e0b0c1803dbb0758ffac5de2f425b23c28f518faabd9d805342ff"
-SRC_URI[indicatif-0.18.4.sha256sum] = "25470f23803092da7d239834776d653104d551bc4d7eacaf31e6837854b8e9eb"
+SRC_URI[indicatif-0.18.6.sha256sum] = "9433806cd6b4ec1aba79c021c7e4c58fb4c3b9977c085062e611ac929998fb0c"
 SRC_URI[inotify-0.11.1.sha256sum] = "bd5b3eaf1a28b758ac0faa5a4254e8ab2705605496f1b1f3fbbc3988ad73d199"
 SRC_URI[inotify-sys-0.1.5.sha256sum] = "e05c02b5e89bff3b946cedeca278abc628fe811e604f027c45a8aa3cf793d0eb"
 SRC_URI[intl-memoizer-0.5.3.sha256sum] = "310da2e345f5eb861e7a07ee182262e94975051db9e4223e909ba90f392f163f"
@@ -570,23 +564,23 @@ SRC_URI[intl_pluralrules-7.0.2.sha256sum] = "078ea7b7c29a2b4df841a7f6ac8775ff607
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
+SRC_URI[itertools-0.15.0.sha256sum] = "8b4baf93f58d4425749ca49a51c50ebab072c5df6994d08fed93541c331481dc"
 SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
-SRC_URI[jiff-0.2.28.sha256sum] = "4603d3033e49e2b0e31229fcab20a5d40089c607d975cd9c80551dc69eed9102"
+SRC_URI[jiff-0.2.35.sha256sum] = "668b7183bd07af9a4885f5c35b0cc5c83c4607a913c16b7e17291832910d2dcc"
+SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09"
 SRC_URI[jiff-icu-0.2.2.sha256sum] = "0e67c2beaae8b10a82d849b9aabb698a43a682f32b17bcdc035d5ecadb44d646"
-SRC_URI[jiff-static-0.2.28.sha256sum] = "782d32378dddf207193ac91cefb848ad41abb58195c95168e1291227a0832b47"
-SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
+SRC_URI[jiff-static-0.2.35.sha256sum] = "3a69dcb3a21cfb32ce1cd056169337ca284af0766dd766e7878819b251a49204"
+SRC_URI[jiff-tzdb-0.1.8.sha256sum] = "142bd39932ad231f10513df9ab62661fead8719872150b7ad02a2df79f4e141e"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[js-sys-0.3.94.sha256sum] = "2e04e2ef80ce82e13552136fabeef8a5ed1f985a96805761cbb9a2c34e7664d9"
 SRC_URI[keccak-0.2.0.sha256sum] = "9e24a010dd405bd7ed803e5253182815b41bf2e6a80cc3bfc066658e03a198aa"
 SRC_URI[kqueue-1.1.1.sha256sum] = "eac30106d7dce88daf4a3fcb4879ea939476d5074a9b7ddd0fb97fa4bed5596a"
 SRC_URI[kqueue-sys-1.1.0.sha256sum] = "a7b65860415f949f23fa882e669f2dbd4a0f0eeb1acdd56790b30494afd7da2f"
-SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
-SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
+SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
 SRC_URI[libloading-0.8.9.sha256sum] = "d7c4b02199fee7c5d21a5ae7d8cfa79a6ef5bb2fc834d6e9058e89c825efdc55"
 SRC_URI[libm-0.2.16.sha256sum] = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981"
-SRC_URI[link-section-0.18.0.sha256sum] = "7a63f9687974de7e2caf6c96a1b19c6e882db299fdde09075c5b9e11c58421cd"
-SRC_URI[linktime-proc-macro-0.2.0.sha256sum] = "8c7b0a3383c2a1002d11349c92c85a666a5fb679e96c79d782cf0dbe557fd6ee"
+SRC_URI[link-section-0.19.2.sha256sum] = "5ee1a0d6e252afe82e7bc2db42fba60e02ddf3b1accaf8cb21d96e34ba61f3d4"
+SRC_URI[linktime-proc-macro-0.2.2.sha256sum] = "348d0075b1fc163b26d72a7f75fc5141daf2fd1bdf128d873cbaf6785d495bdf"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.2.sha256sum] = "92daf443525c4cce67b150400bc2316076100ce0b3686209eb8cf3c31612e6f0"
 SRC_URI[litrs-1.0.0.sha256sum] = "11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9db1621bafc7ed66e35ff9fe092"
@@ -595,8 +589,8 @@ SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a659083
 SRC_URI[lru-0.16.3.sha256sum] = "a1dc47f592c06f33f8e3aea9591776ec7c9f9e4124778ff8a3c3b87159f7e593"
 SRC_URI[lscolors-0.21.0.sha256sum] = "d60e266dfb1426eb2d24792602e041131fdc0236bb7007abc0e589acafd60929"
 SRC_URI[md-5-0.11.0.sha256sum] = "69b6441f590336821bb897fb28fc622898ccceb1d6cea3fde5ea86b090c4de98"
-SRC_URI[memchr-2.8.1.sha256sum] = "6b947ae49db0d222b1dbc6b113ce7248a3fc3a6ca21b696717bfc000ba4484d8"
-SRC_URI[memmap2-0.9.10.sha256sum] = "714098028fe011992e1c3962653c96b2d578c4b4bce9036e15ff220319b1e0e3"
+SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
+SRC_URI[memmap2-0.9.11.sha256sum] = "d1219ed1b7f229ee7104d281dd01d6802fe28bb6e95d292942c4daacdeb798c0"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
@@ -607,8 +601,8 @@ SRC_URI[nom-8.0.0.sha256sum] = "df9761775871bdef83bee530e60050f7e54b1105350d6884
 SRC_URI[notify-8.2.0.sha256sum] = "4d3d07927151ff8575b7087f245456e549fea62edf0ec4e565a5ee50c8402bc3"
 SRC_URI[notify-types-2.1.0.sha256sum] = "42b8cfee0e339a0337359f3c88165702ac6e600dc01c0cc9579a92d62b08477a"
 SRC_URI[nu-ansi-term-0.50.3.sha256sum] = "7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5"
-SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
-SRC_URI[num-conv-0.2.1.sha256sum] = "c6673768db2d862beb9b39a78fdcb1a69439615d5794a1be50caa9bc92c81967"
+SRC_URI[num-bigint-0.4.8.sha256sum] = "c89e69e7e0f03bea5ef08013795c25018e101932225a656383bd384495ecc367"
+SRC_URI[num-conv-0.2.2.sha256sum] = "521739c6d2bac4aa25192232afe6841231376b2b26d4d9fae5ecf8ca5772e441"
 SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
 SRC_URI[num-modular-0.6.1.sha256sum] = "17bb261bf36fa7d83f4c294f834e91256769097b3cb505d44831e0a179ac647f"
 SRC_URI[num-prime-0.5.0.sha256sum] = "b285c575532a33ef6fdd3a57640d0b1c70e6ca48644d6df7bbd4b7a0cfbbb12d"
@@ -620,16 +614,20 @@ SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d0
 SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
 SRC_URI[onig-6.5.3.sha256sum] = "0cc3cbf698f9438986c11a880c90a6d04b9de27575afd28bbf45b154b6c709e2"
 SRC_URI[onig_sys-69.9.3.sha256sum] = "1e68317604e77e53b85896388e1a803c1d21b74c899ec9e5e1112db90735edd7"
+SRC_URI[openssl-0.10.81.sha256sum] = "77823a27f0babb03091cb9ed9ef80af3b39dbc82f97e8fa530374b7dafd87a45"
+SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
+SRC_URI[openssl-src-300.5.5+3.5.5.sha256sum] = "3f1787d533e03597a7934fd0a765f0d28e94ecc5fb7789f8053b1e699a56f709"
+SRC_URI[openssl-sys-0.9.117.sha256sum] = "b47e7e6bb2c38cd930d25a23b40fa52e068c10e85f3e03a7f5ba5aaca5713695"
 SRC_URI[ordered-multimap-0.7.3.sha256sum] = "49203cdcae0030493bad186b28da2fa25645fa276a51b6fec8010d281e02ef79"
 SRC_URI[os_display-0.1.4.sha256sum] = "ad5fd71b79026fb918650dde6d125000a233764f1c2f1659a1c71118e33ea08f"
 SRC_URI[outref-0.5.2.sha256sum] = "1a80800c0488c3a21695ea981a54918fbb37abf04f4d0720c453632255e2ff0e"
 SRC_URI[parking_lot-0.12.5.sha256sum] = "93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a"
 SRC_URI[parking_lot_core-0.9.12.sha256sum] = "2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1"
-SRC_URI[parse_datetime-0.14.0.sha256sum] = "413775a7eac2261d2211a79d10ef275e5b6f7b527eec42ad09adce2ffa92b6e5"
-SRC_URI[phf-0.13.1.sha256sum] = "c1562dc717473dbaa4c1f85a36410e03c047b2e7df7f45ee938fbef64ae7fadf"
-SRC_URI[phf_codegen-0.13.1.sha256sum] = "49aa7f9d80421bca176ca8dbfebe668cc7a2684708594ec9f3c0db0805d5d6e1"
-SRC_URI[phf_generator-0.13.1.sha256sum] = "135ace3a761e564ec88c03a77317a7c6b80bb7f7135ef2544dbe054243b89737"
-SRC_URI[phf_shared-0.13.1.sha256sum] = "e57fef6bc5981e38c2ce2d63bfa546861309f875b8a75f092d1d54ae2d64f266"
+SRC_URI[parse_datetime-0.15.0.sha256sum] = "f15dc0ed203652fed0fc0e2b4de76bca160565afe16507973df55e6407b84353"
+SRC_URI[phf-0.14.0.sha256sum] = "010378780309880b08997fae13be7834dba947d36393bd372f2b1556deb2a2f6"
+SRC_URI[phf_codegen-0.14.0.sha256sum] = "41b585a510fb76fdebead6897982ef2a03a21d8e6cbcca904999742a4afc6ffe"
+SRC_URI[phf_generator-0.14.0.sha256sum] = "aeb62e0959d5a1bebc965f4d15d9e2b7cea002b6b0f5ba8cde6cc26738467100"
+SRC_URI[phf_shared-0.14.0.sha256sum] = "c6fd9027e2d9319be6349febd1db4e8d02aa544921200c9b777720ac34a3aa89"
 SRC_URI[pin-project-lite-0.2.17.sha256sum] = "a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd"
 SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
 SRC_URI[platform-info-2.1.0.sha256sum] = "9368d62437c8cbb7c31ee37fd8c08a7d390e09a3ff75698a674953f46705ffcb"
@@ -641,14 +639,14 @@ SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458
 SRC_URI[pretty_assertions-1.4.1.sha256sum] = "3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d"
 SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
 SRC_URI[proc-macro-crate-3.5.0.sha256sum] = "e67ba7e9b2b56446f1d419b1d807906278ffa1a658a8a5d8a39dcb1f5a78614f"
-SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
 SRC_URI[procfs-0.18.0.sha256sum] = "25485360a54d6861439d60facef26de713b1e126bf015ec8f98239467a2b82f7"
 SRC_URI[procfs-core-0.18.0.sha256sum] = "e6401bf7b6af22f78b563665d15a22e9aef27775b79b149a66ca022468a4e405"
-SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
+SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
 SRC_URI[rand-0.8.6.sha256sum] = "5ca0ecfa931c29007047d1bc58e623ab12e5590e8c7cc53200d5202b69266d8a"
-SRC_URI[rand-0.10.1.sha256sum] = "d2e8e8bcc7961af1fdac401278c6a831614941f6164ee3bf4ce61b7edb162207"
+SRC_URI[rand-0.10.2.sha256sum] = "c7f5fa3a058cd35567ef9bfa5e75732bee0f9e4c55fa90477bef2dfcdbc4be80"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_chacha-0.10.0.sha256sum] = "3e6af7f3e25ded52c41df4e0b1af2d047e45896c2f3281792ed68a1c243daedb"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
@@ -656,10 +654,10 @@ SRC_URI[rand_core-0.10.0.sha256sum] = "0c8d0fd677905edcbeedbf2edb6494d676f0e98d5
 SRC_URI[rayon-1.12.0.sha256sum] = "fb39b166781f92d482534ef4b4b1b2568f42613b53e5b6c160e24cfbfa30926d"
 SRC_URI[rayon-core-1.13.0.sha256sum] = "22e18b0f0062d30d4230b2e85ff77fdfe4326feb054b9783a3460d8435c8ab91"
 SRC_URI[redox_syscall-0.5.18.sha256sum] = "ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d"
-SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
-SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
+SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
+SRC_URI[regex-automata-0.4.16.sha256sum] = "8fcfdb36bda0c880c5931cdc7a2bcdc8ba4556847b9d912bca70bc94708711ad"
 SRC_URI[regex-lite-0.1.9.sha256sum] = "cab834c73d247e67f4fae452806d17d3c7501756d98c8808d7c9c7aa7d18f973"
-SRC_URI[regex-syntax-0.8.10.sha256sum] = "dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a"
+SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[relative-path-1.9.3.sha256sum] = "ba39f3699c378cd8970968dcbff9c43159ea4cfbd88d43c00b22f2ef10a435d2"
 SRC_URI[rlimit-0.11.0.sha256sum] = "f35ee2729c56bb610f6dba436bf78135f728b7373bdffae2ec815b2d3eb98cc3"
 SRC_URI[roff-1.1.1.sha256sum] = "323c417e1d9665a65b263ec744ba09030cfb277e9daa0b018a4ab62e57bc8189"
@@ -667,14 +665,14 @@ SRC_URI[rstest-0.26.1.sha256sum] = "f5a3193c063baaa2a95a33f03035c8a72b83d97a5491
 SRC_URI[rstest_macros-0.26.1.sha256sum] = "9c845311f0ff7951c5506121a9ad75aec44d083c31583b2ea5a30bcb0b0abba0"
 SRC_URI[rstest_reuse-0.7.0.sha256sum] = "b3a8fb4672e840a587a66fc577a5491375df51ddb88f2a2c2a792598c326fe14"
 SRC_URI[rust-ini-0.21.3.sha256sum] = "796e8d2b6696392a43bea58116b667fb4c29727dc5abd27d6acf338bb4f688c7"
-SRC_URI[rustc-hash-2.1.2.sha256sum] = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe"
+SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
 SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
-SRC_URI[self_cell-1.2.2.sha256sum] = "b12e76d157a900eb52e81bc6e9f3069344290341720e9178cde2407113ac8d89"
-SRC_URI[selinux-0.6.2.sha256sum] = "1d0000fdf34c841f92ad0b4c6eade9253121d3659e82cd24c1c4a65b8dbec027"
+SRC_URI[self_cell-1.3.0.sha256sum] = "2ab42ca02749e120097e328d91d415325bdf43b1c72c4c8badf37375fe40a813"
+SRC_URI[selinux-0.6.3.sha256sum] = "5e27b533f7b8e124356edfe653a21e5a5072585b4c0a67459519844c039bc4e1"
 SRC_URI[selinux-sys-0.7.0.sha256sum] = "acf9f7ddcfd31f0558b246d6ddc4a34fb4550668f364a09dd51f28409157e754"
 SRC_URI[semver-1.0.28.sha256sum] = "8a7852d02fc848982e0c167ef163aaff9cd91dc640ba85e263cb1ce46fae51cd"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
@@ -695,26 +693,27 @@ SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce50
 SRC_URI[sm3-0.5.0.sha256sum] = "da6a89ba31723d185fd7413b98c576a575f356d9b84729d8ecb6ead60000a5b6"
 SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
-SRC_URI[socket2-0.6.3.sha256sum] = "3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e"
-SRC_URI[spin-0.10.0.sha256sum] = "d5fe4ccb98d9c292d56fec89a5e07da7fc4cf0dc11e156b41793132775d3e591"
+SRC_URI[socket2-0.6.5.sha256sum] = "c3d1e2c7f27f8d4cb10542a02c49005dbd6e93095799d6f3be745fae9f8fedd4"
+SRC_URI[spin-0.10.1.sha256sum] = "023a211cb3138dbc438680b32560ad89f699977624c9f8dbb95a47d5b4c07dd3"
 SRC_URI[sponge-cursor-0.1.0.sha256sum] = "3a0219bd7d979d58245a4f41f695e1ac9f8befdffadd7f61f1bae9e39abc6620"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[statrs-0.18.0.sha256sum] = "2a3fe7c28c6512e766b0874335db33c94ad7b8f9054228ae1c2abd47ce7d335e"
 SRC_URI[string-interner-0.20.0.sha256sum] = "ad3df9b59e2eded8d825c7c4363ad339a20fb6bc0b9a4778560f518f59910b15"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
+SRC_URI[syn-3.0.2.sha256sum] = "a207d6d6a2b7fc470b80443726053f18a2481b7e1eee970597051596567987a3"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
 SRC_URI[textwrap-0.16.2.sha256sum] = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
 SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
-SRC_URI[thiserror-2.0.18.sha256sum] = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
+SRC_URI[thiserror-2.0.19.sha256sum] = "09a43598840e33d5b0331f38c5e30d13bb11c11210a4b58f0d9b18a5a5eefcd9"
 SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
-SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
-SRC_URI[time-0.3.47.sha256sum] = "743bd48c283afc0388f9b8827b976905fb217ad9e647fae3a379a9283c4def2c"
-SRC_URI[time-core-0.1.8.sha256sum] = "7694e1cfe791f8d31026952abf09c69ca6f6fa4e1a1229e18988f06a04a12dca"
-SRC_URI[time-macros-0.2.27.sha256sum] = "2e70e4c5a0e0a8a4823ad65dfe1a6930e4f4d756dcd9dd7939022b5e8c501215"
+SRC_URI[thiserror-impl-2.0.19.sha256sum] = "43cbfe0cf76104d42a574802844187e84a305e531ed54455f11fbde0f10541cd"
+SRC_URI[time-0.3.55.sha256sum] = "cdb87b95ec50ddfa440816d227a17b2ccbdda963a316a727fda0fc4334f7d134"
+SRC_URI[time-core-0.1.9.sha256sum] = "9e1c906769ad99c88eaa54e728060edef082f8e358ff32030cb7c7d315e81109"
+SRC_URI[time-macros-0.2.32.sha256sum] = "7e689342a48d2ea927c87ea50cabf8594854bf940e9310208848d680d668ed85"
 SRC_URI[tiny-keccak-2.0.2.sha256sum] = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
 SRC_URI[tinystr-0.8.3.sha256sum] = "c8323304221c2a851516f22236c5722a72eaa19749016521d6dff0824447d96d"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
@@ -729,7 +728,6 @@ SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f76
 SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
 SRC_URI[unicode-width-0.1.14.sha256sum] = "7dd6e30e90baa6f72411720665d41d89b9a3d039dc45b8faea1ddd07f617f6af"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
-SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
 SRC_URI[unit-prefix-0.5.2.sha256sum] = "81e544489bf3d8ef66c953931f56617f423cd4b5494be343d9b9d3dda037b9a3"
 SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
@@ -737,21 +735,16 @@ SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
 SRC_URI[utmp-classic-0.1.6.sha256sum] = "e24c654e19afaa6b8f3877ece5d3bed849c2719c56f6752b18ca7da4fcc6e85a"
 SRC_URI[utmp-classic-raw-0.1.3.sha256sum] = "22c226537a3d6e01c440c1926ca0256dbee2d19b2229ede6fc4863a6493dd831"
-SRC_URI[uuid-1.23.1.sha256sum] = "ddd74a9687298c6858e9b88ec8935ec45d22e8fd5e6394fa1bd4e99a87789c76"
 SRC_URI[uutils_term_grid-0.8.0.sha256sum] = "382d49b39de4a115f203305057741126b09a615892d773a2d419a2b816e30e39"
+SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vsimd-0.8.0.sha256sum] = "5c3082ca00d5a5ef149bb8b555a72ae84c9c59f7250f013ac822ac2e49b19c64"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
-SRC_URI[wasip2-1.0.2+wasi-0.2.9.sha256sum] = "9517f9239f02c069db75e65f174b3da828fe5f5b945c4dd26bd25d89c03ebcf5"
-SRC_URI[wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06.sha256sum] = "5428f8bf88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
 SRC_URI[wasm-bindgen-0.2.117.sha256sum] = "0551fc1bb415591e3372d0bc4780db7e587d84e2a7e79da121051c5c4b89d0b0"
 SRC_URI[wasm-bindgen-macro-0.2.117.sha256sum] = "7fbdf9a35adf44786aecd5ff89b4563a90325f9da0923236f6104e603c7e86be"
 SRC_URI[wasm-bindgen-macro-support-0.2.117.sha256sum] = "dca9693ef2bab6d4e6707234500350d8dad079eb508dca05530c85dc3a529ff2"
 SRC_URI[wasm-bindgen-shared-0.2.117.sha256sum] = "39129a682a6d2d841b6c429d0c51e5cb0ed1a03829d8b3d1e69a011e62cb3d3b"
-SRC_URI[wasm-encoder-0.244.0.sha256sum] = "990065f2fe63003fe337b932cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319"
-SRC_URI[wasm-metadata-0.244.0.sha256sum] = "bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909"
-SRC_URI[wasmparser-0.244.0.sha256sum] = "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
 SRC_URI[web-time-1.1.0.sha256sum] = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
 SRC_URI[wild-2.2.1.sha256sum] = "a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
@@ -785,14 +778,7 @@ SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b4
 SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
 SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
-SRC_URI[winnow-0.7.15.sha256sum] = "df79d97927682d2fd8adb29682d1140b343be4ac0f08fd68b7765d9c059d3945"
 SRC_URI[winnow-1.0.1.sha256sum] = "09dac053f1cd375980747450bfc7250c264eaae0583872e845c0c7cd578872b5"
-SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
-SRC_URI[wit-bindgen-core-0.51.0.sha256sum] = "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
-SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] = "b7c566e0f4b284dd6561c786d9cb0142da491f46a9fbed79ea69cdad5db17f21"
-SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] = "0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
-SRC_URI[wit-component-0.244.0.sha256sum] = "9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2"
-SRC_URI[wit-parser-0.244.0.sha256sum] = "ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736"
 SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
 SRC_URI[writeable-0.6.3.sha256sum] = "1ffae5123b2d3fc086436f8834ae3ab053a283cfac8fe0a0b8eaae044768a4c4"
 SRC_URI[wyz-0.5.1.sha256sum] = "05f360fc0b24296329c78fda852a1e9ae82de9cf7b27dae4b7f62f118f77b9ed"
@@ -802,9 +788,9 @@ SRC_URI[yoke-0.8.2.sha256sum] = "abe8c5fda708d9ca3df187cae8bfb9ceda00dd96231bed3
 SRC_URI[yoke-derive-0.8.2.sha256sum] = "de844c262c8848816172cef550288e7dc6c7b7814b4ee56b3e1553f275f1858e"
 SRC_URI[z85-3.0.7.sha256sum] = "c6e61e59a957b7ccee15d2049f86e8bfd6f66968fcd88f018950662d9b86e675"
 SRC_URI[zerocopy-0.7.35.sha256sum] = "1b9b4fd18abc82b8136838da5d50bae7bdea537c574d8dc1a34ed098d6c166f0"
-SRC_URI[zerocopy-0.8.48.sha256sum] = "eed437bf9d6692032087e337407a86f04cd8d6a16a37199ed57949d415bd68e9"
+SRC_URI[zerocopy-0.8.55.sha256sum] = "b5a105cd7b140f6eeec8acff2ea38135d3cab283ada58540f629fe51e46696eb"
 SRC_URI[zerocopy-derive-0.7.35.sha256sum] = "fa4f8080344d4671fb4e831a13ad1e68092748387dfc4f55e356242fae12ce3e"
-SRC_URI[zerocopy-derive-0.8.48.sha256sum] = "70e3cd084b1788766f53af483dd21f93881ff30d7320490ec3ef7526d203bad4"
+SRC_URI[zerocopy-derive-0.8.55.sha256sum] = "0fe976fb70c78cd64cccfe3a6fc142244e8a77b70959b30faf9d0ac37ee228eb"
 SRC_URI[zerofrom-0.1.7.sha256sum] = "69faa1f2a1ea75661980b013019ed6687ed0e83d069bc1114e2cc74c6c04c4df"
 SRC_URI[zerofrom-derive-0.1.7.sha256sum] = "11532158c46691caf0f2593ea8358fed6bbf68a0315e80aae9bd41fbade684a1"
 SRC_URI[zerotrie-0.2.4.sha256sum] = "0f9152d31db0792fa83f70fb2f83148effb5c1f5b8c7686c3459e361d9bc20bf"
@@ -812,7 +798,7 @@ SRC_URI[zerovec-0.11.6.sha256sum] = "90f911cbc359ab6af17377d242225f4d75119aec87e
 SRC_URI[zerovec-derive-0.11.3.sha256sum] = "625dc425cab0dca6dc3c3319506e6593dcb08a9f387ea3b284dbd52a92c40555"
 SRC_URI[zip-8.6.0.sha256sum] = "2d04a6b5381502aa6087c94c669499eb1602eb9c5e8198e534de571f7154809b"
 SRC_URI[zlib-rs-0.6.3.sha256sum] = "3be3d40e40a133f9c916ee3f9f4fa2d9d63435b5fbe1bfc6d9dae0aa0ada1513"
-SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
+SRC_URI[zmij-1.0.23.sha256sum] = "29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b"
 SRC_URI[zopfli-0.8.3.sha256sum] = "f05cd8797d63865425ff89b5c4a48804f35ba0ce8d125800027ad6017d2b5249"
 # from fuzz/Cargo.lock
 SRC_URI += " \
@@ -850,7 +836,7 @@ SRC_URI += " \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
     crate://crates.io/compare/0.1.0 \
-    crate://crates.io/console/0.16.3 \
+    crate://crates.io/console/0.16.4 \
     crate://crates.io/const-oid/0.10.2 \
     crate://crates.io/const-random/0.1.18 \
     crate://crates.io/const-random-macro/0.1.16 \
@@ -869,13 +855,13 @@ SRC_URI += " \
     crate://crates.io/crypto-common/0.1.7 \
     crate://crates.io/crypto-common/0.2.1 \
     crate://crates.io/ctrlc/3.5.2 \
-    crate://crates.io/data-encoding/2.11.0 \
-    crate://crates.io/data-encoding-macro/0.1.20 \
-    crate://crates.io/data-encoding-macro-internal/0.1.18 \
+    crate://crates.io/data-encoding/2.11.1 \
+    crate://crates.io/data-encoding-macro/0.1.21 \
+    crate://crates.io/data-encoding-macro-internal/0.1.19 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/digest/0.11.3 \
     crate://crates.io/dispatch2/0.3.1 \
-    crate://crates.io/displaydoc/0.2.5 \
+    crate://crates.io/displaydoc/0.2.7 \
     crate://crates.io/dlv-list/0.5.2 \
     crate://crates.io/dunce/1.0.5 \
     crate://crates.io/either/1.15.0 \
@@ -897,7 +883,6 @@ SRC_URI += " \
     crate://crates.io/futures-util/0.3.32 \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/getrandom/0.2.17 \
-    crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.2 \
     crate://crates.io/glob/0.3.3 \
     crate://crates.io/hashbrown/0.14.5 \
@@ -935,19 +920,19 @@ SRC_URI += " \
     crate://crates.io/intl-memoizer/0.5.3 \
     crate://crates.io/intl_pluralrules/7.0.2 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
-    crate://crates.io/itertools/0.14.0 \
+    crate://crates.io/itertools/0.15.0 \
     crate://crates.io/itoa/1.0.18 \
     crate://crates.io/jiff/0.2.24 \
     crate://crates.io/jiff-icu/0.2.2 \
     crate://crates.io/jiff-static/0.2.24 \
-    crate://crates.io/jiff-tzdb/0.1.6 \
+    crate://crates.io/jiff-tzdb/0.1.8 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
-    crate://crates.io/jobserver/0.1.34 \
+    crate://crates.io/jobserver/0.1.35 \
     crate://crates.io/js-sys/0.3.98 \
     crate://crates.io/keccak/0.2.0 \
     crate://crates.io/leb128fmt/0.1.0 \
     crate://crates.io/libc/0.2.186 \
-    crate://crates.io/libfuzzer-sys/0.4.12 \
+    crate://crates.io/libfuzzer-sys/0.4.13 \
     crate://crates.io/libm/0.2.16 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.2 \
@@ -957,7 +942,7 @@ SRC_URI += " \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/nix/0.31.3 \
     crate://crates.io/nom/8.0.0 \
-    crate://crates.io/num-bigint/0.4.6 \
+    crate://crates.io/num-bigint/0.4.8 \
     crate://crates.io/num-integer/0.1.46 \
     crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/objc2/0.6.4 \
@@ -969,7 +954,7 @@ SRC_URI += " \
     crate://crates.io/ordered-multimap/0.7.3 \
     crate://crates.io/os_display/0.1.4 \
     crate://crates.io/outref/0.5.2 \
-    crate://crates.io/parse_datetime/0.14.0 \
+    crate://crates.io/parse_datetime/0.15.0 \
     crate://crates.io/pin-project-lite/0.2.17 \
     crate://crates.io/pkg-config/0.3.33 \
     crate://crates.io/portable-atomic/1.13.1 \
@@ -980,9 +965,8 @@ SRC_URI += " \
     crate://crates.io/procfs/0.18.0 \
     crate://crates.io/procfs-core/0.18.0 \
     crate://crates.io/quote/1.0.45 \
-    crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
-    crate://crates.io/rand/0.10.1 \
+    crate://crates.io/rand/0.10.2 \
     crate://crates.io/rand_core/0.10.1 \
     crate://crates.io/rayon/1.12.0 \
     crate://crates.io/rayon-core/1.13.0 \
@@ -1003,7 +987,7 @@ SRC_URI += " \
     crate://crates.io/shake/0.1.0 \
     crate://crates.io/shlex/1.3.0 \
     crate://crates.io/simd-adler32/0.3.9 \
-    crate://crates.io/similar/3.1.1 \
+    crate://crates.io/similar/3.1.2 \
     crate://crates.io/slab/0.4.12 \
     crate://crates.io/sm3/0.5.0 \
     crate://crates.io/smallvec/1.15.1 \
@@ -1012,11 +996,12 @@ SRC_URI += " \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/2.0.117 \
+    crate://crates.io/syn/3.0.3 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
-    crate://crates.io/thiserror/2.0.18 \
-    crate://crates.io/thiserror-impl/2.0.18 \
+    crate://crates.io/thiserror/2.0.19 \
+    crate://crates.io/thiserror-impl/2.0.19 \
     crate://crates.io/tiny-keccak/2.0.2 \
     crate://crates.io/tinystr/0.8.3 \
     crate://crates.io/type-map/0.5.1 \
@@ -1051,7 +1036,7 @@ SRC_URI += " \
     crate://crates.io/windows-result/0.4.1 \
     crate://crates.io/windows-strings/0.5.1 \
     crate://crates.io/windows-sys/0.61.2 \
-    crate://crates.io/winnow/0.7.15 \
+    crate://crates.io/winnow/1.0.3 \
     crate://crates.io/wit-bindgen/0.51.0 \
     crate://crates.io/wit-bindgen/0.57.1 \
     crate://crates.io/wit-bindgen-core/0.51.0 \
@@ -1069,7 +1054,7 @@ SRC_URI += " \
     crate://crates.io/zerotrie/0.2.4 \
     crate://crates.io/zerovec/0.11.6 \
     crate://crates.io/zerovec-derive/0.11.3 \
-    crate://crates.io/zmij/1.0.21 \
+    crate://crates.io/zmij/1.0.23 \
 "
 
 SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
@@ -1106,7 +1091,7 @@ SRC_URI[clap_builder-4.6.0.sha256sum] = "714a53001bf66416adb0e2ef5ac857140e7dc3a
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
 SRC_URI[compare-0.1.0.sha256sum] = "120133d4db2ec47efe2e26502ee984747630c67f51974fca0b6c1340cf2368d3"
-SRC_URI[console-0.16.3.sha256sum] = "d64e8af5551369d19cf50138de61f1c42074ab970f74e99be916646777f8fc87"
+SRC_URI[console-0.16.4.sha256sum] = "4fe5f465a4f6fee88fad41b85d990f84c835335e85b5d9e6e63e0d06d28cba7c"
 SRC_URI[const-oid-0.10.2.sha256sum] = "a6ef517f0926dd24a1582492c791b6a4818a4d94e789a334894aa15b0d12f55c"
 SRC_URI[const-random-0.1.18.sha256sum] = "87e00182fe74b066627d63b85fd550ac2998d4b0bd86bfed477a0ae4c7c71359"
 SRC_URI[const-random-macro-0.1.16.sha256sum] = "f9d839f2a20b0aee515dc581a6172f2321f96cab76c1a38a4c584a194955390e"
@@ -1125,13 +1110,13 @@ SRC_URI[crunchy-0.2.4.sha256sum] = "460fbee9c2c2f33933d720630a6a0bac33ba7053db53
 SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
 SRC_URI[crypto-common-0.2.1.sha256sum] = "77727bb15fa921304124b128af125e7e3b968275d1b108b379190264f4423710"
 SRC_URI[ctrlc-3.5.2.sha256sum] = "e0b1fab2ae45819af2d0731d60f2afe17227ebb1a1538a236da84c93e9a60162"
-SRC_URI[data-encoding-2.11.0.sha256sum] = "a4ae5f15dda3c708c0ade84bfee31ccab44a3da4f88015ed22f63732abe300c8"
-SRC_URI[data-encoding-macro-0.1.20.sha256sum] = "3259c913752a86488b501ed8680446a5ed2d5aeac6e596cb23ba3800768ea32c"
-SRC_URI[data-encoding-macro-internal-0.1.18.sha256sum] = "ccc2776f0c61eca1ca32528f85548abd1a4be8fb53d1b21c013e4f18da1e7090"
+SRC_URI[data-encoding-2.11.1.sha256sum] = "4583a4551df46e2792f82ceeac45e850d2e2d5debba0b91f102385cda5b11f06"
+SRC_URI[data-encoding-macro-0.1.21.sha256sum] = "c6a127ecbb3c4632e1525380e04c0c3fcf8dcb44d32a79ea290d8a36906edcd8"
+SRC_URI[data-encoding-macro-internal-0.1.19.sha256sum] = "c54e03a951783e8b327515db3f2a2fd0e3bed362a96b066f341ce66ed49b4ead"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[digest-0.11.3.sha256sum] = "f1dd6dbb5841937940781866fa1281a1ff7bd3bf827091440879f9994983d5c2"
 SRC_URI[dispatch2-0.3.1.sha256sum] = "1e0e367e4e7da84520dedcac1901e4da967309406d1e51017ae1abfb97adbd38"
-SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
+SRC_URI[displaydoc-0.2.7.sha256sum] = "c6232dd377dcc64799954cbd3a9bb882e9cdc1308ccd87b1c098f1fb2eaf82a8"
 SRC_URI[dlv-list-0.5.2.sha256sum] = "442039f5147480ba31067cb00ada1adae6892028e40e45fc5de7b7df6dcc1b5f"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
 SRC_URI[either-1.15.0.sha256sum] = "48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719"
@@ -1153,7 +1138,6 @@ SRC_URI[futures-task-0.3.32.sha256sum] = "037711b3d59c33004d3856fbdc83b99d4ff37a
 SRC_URI[futures-util-0.3.32.sha256sum] = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.2.17.sha256sum] = "ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0"
-SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.2.sha256sum] = "0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555"
 SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
 SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
@@ -1191,19 +1175,19 @@ SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1
 SRC_URI[intl-memoizer-0.5.3.sha256sum] = "310da2e345f5eb861e7a07ee182262e94975051db9e4223e909ba90f392f163f"
 SRC_URI[intl_pluralrules-7.0.2.sha256sum] = "078ea7b7c29a2b4df841a7f6ac8775ff6074020c6776d48491ce2268e068f972"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
-SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
+SRC_URI[itertools-0.15.0.sha256sum] = "8b4baf93f58d4425749ca49a51c50ebab072c5df6994d08fed93541c331481dc"
 SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
 SRC_URI[jiff-0.2.24.sha256sum] = "f00b5dbd620d61dfdcb6007c9c1f6054ebd75319f163d886a9055cec1155073d"
 SRC_URI[jiff-icu-0.2.2.sha256sum] = "0e67c2beaae8b10a82d849b9aabb698a43a682f32b17bcdc035d5ecadb44d646"
 SRC_URI[jiff-static-0.2.24.sha256sum] = "e000de030ff8022ea1da3f466fbb0f3a809f5e51ed31f6dd931c35181ad8e6d7"
-SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
+SRC_URI[jiff-tzdb-0.1.8.sha256sum] = "142bd39932ad231f10513df9ab62661fead8719872150b7ad02a2df79f4e141e"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
-SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
+SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3"
 SRC_URI[js-sys-0.3.98.sha256sum] = "67df7112613f8bfd9150013a0314e196f4800d3201ae742489d999db2f979f08"
 SRC_URI[keccak-0.2.0.sha256sum] = "9e24a010dd405bd7ed803e5253182815b41bf2e6a80cc3bfc066658e03a198aa"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
 SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
-SRC_URI[libfuzzer-sys-0.4.12.sha256sum] = "f12a681b7dd8ce12bff52488013ba614b869148d54dd79836ab85aafdd53f08d"
+SRC_URI[libfuzzer-sys-0.4.13.sha256sum] = "a9fd2f41a1cba099f79a0b6b6c35656cf7c03351a7bae8ff0f28f25270f929d2"
 SRC_URI[libm-0.2.16.sha256sum] = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.2.sha256sum] = "92daf443525c4cce67b150400bc2316076100ce0b3686209eb8cf3c31612e6f0"
@@ -1213,7 +1197,7 @@ SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[nix-0.31.3.sha256sum] = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
 SRC_URI[nom-8.0.0.sha256sum] = "df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405"
-SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
+SRC_URI[num-bigint-0.4.8.sha256sum] = "c89e69e7e0f03bea5ef08013795c25018e101932225a656383bd384495ecc367"
 SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[objc2-0.6.4.sha256sum] = "3a12a8ed07aefc768292f076dc3ac8c48f3781c8f2d5851dd3d98950e8c5a89f"
@@ -1225,7 +1209,7 @@ SRC_URI[onig_sys-69.9.3.sha256sum] = "1e68317604e77e53b85896388e1a803c1d21b74c89
 SRC_URI[ordered-multimap-0.7.3.sha256sum] = "49203cdcae0030493bad186b28da2fa25645fa276a51b6fec8010d281e02ef79"
 SRC_URI[os_display-0.1.4.sha256sum] = "ad5fd71b79026fb918650dde6d125000a233764f1c2f1659a1c71118e33ea08f"
 SRC_URI[outref-0.5.2.sha256sum] = "1a80800c0488c3a21695ea981a54918fbb37abf04f4d0720c453632255e2ff0e"
-SRC_URI[parse_datetime-0.14.0.sha256sum] = "413775a7eac2261d2211a79d10ef275e5b6f7b527eec42ad09adce2ffa92b6e5"
+SRC_URI[parse_datetime-0.15.0.sha256sum] = "f15dc0ed203652fed0fc0e2b4de76bca160565afe16507973df55e6407b84353"
 SRC_URI[pin-project-lite-0.2.17.sha256sum] = "a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd"
 SRC_URI[pkg-config-0.3.33.sha256sum] = "19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e"
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
@@ -1236,9 +1220,8 @@ SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa
 SRC_URI[procfs-0.18.0.sha256sum] = "25485360a54d6861439d60facef26de713b1e126bf015ec8f98239467a2b82f7"
 SRC_URI[procfs-core-0.18.0.sha256sum] = "e6401bf7b6af22f78b563665d15a22e9aef27775b79b149a66ca022468a4e405"
 SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
-SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
-SRC_URI[rand-0.10.1.sha256sum] = "d2e8e8bcc7961af1fdac401278c6a831614941f6164ee3bf4ce61b7edb162207"
+SRC_URI[rand-0.10.2.sha256sum] = "c7f5fa3a058cd35567ef9bfa5e75732bee0f9e4c55fa90477bef2dfcdbc4be80"
 SRC_URI[rand_core-0.10.1.sha256sum] = "63b8176103e19a2643978565ca18b50549f6101881c443590420e4dc998a3c69"
 SRC_URI[rayon-1.12.0.sha256sum] = "fb39b166781f92d482534ef4b4b1b2568f42613b53e5b6c160e24cfbfa30926d"
 SRC_URI[rayon-core-1.13.0.sha256sum] = "22e18b0f0062d30d4230b2e85ff77fdfe4326feb054b9783a3460d8435c8ab91"
@@ -1259,7 +1242,7 @@ SRC_URI[sha3-0.12.0.sha256sum] = "bc9bad02c26382724b2d2692c6f179285e4b54eeecd796
 SRC_URI[shake-0.1.0.sha256sum] = "09057cb2149ad4cbd2da1e26b351f9a4c354219421229c69c3063e6f61947c4a"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[simd-adler32-0.3.9.sha256sum] = "703d5c7ef118737c72f1af64ad2f6f8c5e1921f818cdcb97b8fe6fc69bf66214"
-SRC_URI[similar-3.1.1.sha256sum] = "e6505efef05804732ed8a3f2d4f279429eb485bd69d5b0cc6b19cc02005cda16"
+SRC_URI[similar-3.1.2.sha256sum] = "85ee016af5d736b69fc89e19254540fa4b5f5492853fb5503920f084011c78b6"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
 SRC_URI[sm3-0.5.0.sha256sum] = "da6a89ba31723d185fd7413b98c576a575f356d9b84729d8ecb6ead60000a5b6"
 SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
@@ -1268,11 +1251,12 @@ SRC_URI[sponge-cursor-0.1.0.sha256sum] = "3a0219bd7d979d58245a4f41f695e1ac9f8bef
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
+SRC_URI[syn-3.0.3.sha256sum] = "53e9bae58849f64dfa4f5d5ae372c8341f7305f82a3868709269343628b659a3"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
-SRC_URI[thiserror-2.0.18.sha256sum] = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
-SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
+SRC_URI[thiserror-2.0.19.sha256sum] = "09a43598840e33d5b0331f38c5e30d13bb11c11210a4b58f0d9b18a5a5eefcd9"
+SRC_URI[thiserror-impl-2.0.19.sha256sum] = "43cbfe0cf76104d42a574802844187e84a305e531ed54455f11fbde0f10541cd"
 SRC_URI[tiny-keccak-2.0.2.sha256sum] = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
 SRC_URI[tinystr-0.8.3.sha256sum] = "c8323304221c2a851516f22236c5722a72eaa19749016521d6dff0824447d96d"
 SRC_URI[type-map-0.5.1.sha256sum] = "cb30dbbd9036155e74adad6812e9898d03ec374946234fbcebd5dfc7b9187b90"
@@ -1307,7 +1291,7 @@ SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd4
 SRC_URI[windows-result-0.4.1.sha256sum] = "7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5"
 SRC_URI[windows-strings-0.5.1.sha256sum] = "7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
-SRC_URI[winnow-0.7.15.sha256sum] = "df79d97927682d2fd8adb29682d1140b343be4ac0f08fd68b7765d9c059d3945"
+SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
 SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
 SRC_URI[wit-bindgen-0.57.1.sha256sum] = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
 SRC_URI[wit-bindgen-core-0.51.0.sha256sum] = "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
@@ -1325,4 +1309,4 @@ SRC_URI[zerofrom-derive-0.1.7.sha256sum] = "11532158c46691caf0f2593ea8358fed6bbf
 SRC_URI[zerotrie-0.2.4.sha256sum] = "0f9152d31db0792fa83f70fb2f83148effb5c1f5b8c7686c3459e361d9bc20bf"
 SRC_URI[zerovec-0.11.6.sha256sum] = "90f911cbc359ab6af17377d242225f4d75119aec87ea711a880987b18cd7b239"
 SRC_URI[zerovec-derive-0.11.3.sha256sum] = "625dc425cab0dca6dc3c3319506e6593dcb08a9f387ea3b284dbd52a92c40555"
-SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
+SRC_URI[zmij-1.0.23.sha256sum] = "29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b"
diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.10.0.bb
similarity index 100%
rename from meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb
rename to meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.10.0.bb
-- 
2.43.0


