Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B5CC5DF9D
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:18 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12909.1787485928187154442
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GZGcOYJU;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf52d15d88so20368965ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485927; x=1788090727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1uukYA1yJko11S6h9M6Ad3tkEKKhoF8tv8C05G8lglo=;
        b=GZGcOYJUNIknrlVyWIMgsEs4UvB6o3k9spn3GxYPq27oprPEJ6uoXEX6q2iCYoza+H
         Lir3CLsUfQyNJIa89LZUP2qVfWdWpkmw3eCBrCQg0OObamQ7wHWJK7N2eNr24DtXPGSJ
         2loaBxgKkq6fr/KWzYZ0wP7C6o8O7iHLnSd91c/1uRFEwsfD2WhRpfAvNamSEW1sQjLd
         B3PnrQdlqc0CJpNb5PiTUJahVkoXqA56Sge16lboCzJwmcNYv2/DefGHbRsjGupWEcTa
         4td7dmMsxgUM4iGsKnekSx/iojEDQWNayO7c+2chDg7yW15CXaTXMFiG0JP32P/qVERy
         DeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485927; x=1788090727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uukYA1yJko11S6h9M6Ad3tkEKKhoF8tv8C05G8lglo=;
        b=ZB1SiFLQk85m5GJibt//POBILhoDTk+8dyod2Xamv5HcuEkVY15tG3O5Lfph0Ybbcl
         l//PxHwshGSx6WIbKZBgQ2t8dt3b064A1AhGccKFZHIrujnuBYH/hwwXvNDin9bqa9K3
         NinOyXLiDmPaZM2lx/6m18ngkDk7yG1A7YMC5Kc/yujwQdIP39IFSc3lKC9cihEeRUVX
         ipgKgzo7iS6aIKEq3sxS1w2I/4eTuCB0TbPtBWOs38e4Mj6xB7muXFuaYldmmUTrJAv/
         5zkBMpxO4Lm5y4W4yaMfZDKHXsgOQ2jXOSoUArggluWf0xwRhseqXqrEjH1KmGy76tGJ
         ZLoQ==
X-Gm-Message-State: AFuF++m9g+GuMPdqRxFPWeWbLoMjXk1Ev5e8iotb3oVluqaKFZe84Wdh
	79/fxPgMmRWTnFU7JOltW1ZIy/WZUtR4j2m4G90ijn68GFVYIaqK6xvSTJwuDg==
X-Gm-Gg: AR+sD11YkK1Q2Pmdo4LTCz2K0coZON+kGFhjL5zaN32libOB/ZYgzsSqb/NZKQOdaTv
	t3il60n4w2drlQn3vufAzsP94EGuJxUPafjf4EcBLt4GJOsDPH58Ty488CcNBQwAU4HbvPmSbLH
	2qMu508JpwMfs+B0lFBj4TaxJZzjCCtgbqx2MD6ioiatARL8rAU+ubC1G0UfWksIOU7OJjUFkfx
	G0jn+m/fat/ze8fi+2HoATdmZcrrj3qVaHTKeuCBLuY7+1s38SWIB+LEZG4YhOr5hVI7kpW/i/1
	S2pGUGRlpi1dson+C4URCp09IQiHg0bFkRPQ7k1gl4LCEKSbYwCt8CyJzcPAepvZJVlBFl9SDxq
	F3Sy6ZhcAtmu76R26XietK7xLrcsYRJYlW40orLrXBnJyp0ousDXnm+FAz9eI3punXzbvfrqfIa
	RbA7fa2qLiMbDTeUNCXwpYjFZZjCSWuaI4IHyF/tHEwuKTs4MStJOuiDNLg5M/63+Mo7bwo954t
	Q==
X-Received: by 2002:a17:90b:4acd:b0:38f:1a2e:6e56 with SMTP id 98e67ed59e1d1-395c387407cmr31320130a91.9.1787485927089;
        Sun, 23 Aug 2026 04:52:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/20] thin-provisioning-tools: upgrade 1.3.1 -> 1.3.3
Date: Sun, 23 Aug 2026 23:51:39 +1200
Message-ID: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129435

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/device-mapper-utils/thin-provisioning-tools/blob/v1.3.3/CHANGES

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 3a85fbdfef00e4268f2792a8fce5bd7a9773da6d)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../thin-provisioning-tools-crates.inc        | 196 ++++++++++--------
 ....1.bb => thin-provisioning-tools_1.3.3.bb} |   2 +-
 2 files changed, 113 insertions(+), 85 deletions(-)
 rename meta-oe/recipes-support/thin-provisioning-tools/{thin-provisioning-tools_1.3.1.bb => thin-provisioning-tools_1.3.3.bb} (97%)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
index 3876cb88cc..4c211d420d 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
@@ -10,96 +10,108 @@ SRC_URI += " \
     crate://crates.io/anstyle-parse/0.2.7 \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
-    crate://crates.io/anyhow/1.0.100 \
+    crate://crates.io/anyhow/1.0.102 \
+    crate://crates.io/approx/0.5.1 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/bindgen/0.72.1 \
-    crate://crates.io/bitflags/2.10.0 \
+    crate://crates.io/bitflags/2.13.0 \
     crate://crates.io/bumpalo/3.19.0 \
+    crate://crates.io/by_address/1.2.1 \
     crate://crates.io/bytemuck/1.24.0 \
     crate://crates.io/byteorder/1.5.0 \
-    crate://crates.io/cassowary/0.3.0 \
     crate://crates.io/castaway/0.2.4 \
     crate://crates.io/cexpr/0.6.0 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/cfg_aliases/0.2.1 \
+    crate://crates.io/chacha20/0.10.0 \
     crate://crates.io/clang-sys/1.8.1 \
-    crate://crates.io/clap/4.5.52 \
-    crate://crates.io/clap_builder/4.5.52 \
-    crate://crates.io/clap_lex/0.7.6 \
+    crate://crates.io/clap/4.5.61 \
+    crate://crates.io/clap_builder/4.5.61 \
+    crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.4 \
-    crate://crates.io/compact_str/0.8.1 \
+    crate://crates.io/compact_str/0.9.0 \
     crate://crates.io/console/0.16.1 \
+    crate://crates.io/cpufeatures/0.3.0 \
     crate://crates.io/crc32c/0.6.8 \
     crate://crates.io/crc32fast/1.5.0 \
     crate://crates.io/darling/0.20.11 \
     crate://crates.io/darling_core/0.20.11 \
     crate://crates.io/darling_macro/0.20.11 \
     crate://crates.io/data-encoding/2.9.0 \
-    crate://crates.io/devicemapper/0.34.5 \
+    crate://crates.io/deranged/0.5.8 \
+    crate://crates.io/devicemapper/0.34.7 \
     crate://crates.io/devicemapper-sys/0.3.3 \
     crate://crates.io/downcast/0.11.0 \
     crate://crates.io/duct/1.1.1 \
     crate://crates.io/either/1.15.0 \
     crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/env_filter/0.1.4 \
-    crate://crates.io/env_logger/0.8.4 \
     crate://crates.io/env_logger/0.11.8 \
     crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/errno/0.3.14 \
     crate://crates.io/exitcode/1.1.2 \
+    crate://crates.io/fast-srgb8/1.0.0 \
     crate://crates.io/fastrand/2.3.0 \
     crate://crates.io/fixedbitset/0.5.7 \
-    crate://crates.io/flate2/1.1.5 \
+    crate://crates.io/flate2/1.1.9 \
     crate://crates.io/fnv/1.0.7 \
-    crate://crates.io/foldhash/0.1.5 \
+    crate://crates.io/foldhash/0.2.0 \
     crate://crates.io/fragile/2.0.1 \
-    crate://crates.io/getrandom/0.2.16 \
     crate://crates.io/getrandom/0.3.4 \
+    crate://crates.io/getrandom/0.4.3 \
     crate://crates.io/glob/0.3.3 \
-    crate://crates.io/hashbrown/0.15.5 \
+    crate://crates.io/hashbrown/0.16.1 \
+    crate://crates.io/hashbrown/0.17.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/hermit-abi/0.3.9 \
     crate://crates.io/hermit-abi/0.5.2 \
     crate://crates.io/ident_case/1.0.1 \
-    crate://crates.io/indicatif/0.18.3 \
+    crate://crates.io/indicatif/0.18.4 \
     crate://crates.io/indoc/2.0.7 \
     crate://crates.io/instability/0.3.9 \
     crate://crates.io/io-lifetimes/1.0.11 \
-    crate://crates.io/io-uring/0.7.11 \
+    crate://crates.io/io-uring/0.7.12 \
     crate://crates.io/iovec/0.1.4 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.13.0 \
+    crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.15 \
     crate://crates.io/jiff/0.2.16 \
     crate://crates.io/jiff-static/0.2.16 \
     crate://crates.io/js-sys/0.3.82 \
-    crate://crates.io/libc/0.2.177 \
+    crate://crates.io/kasuari/0.4.12 \
+    crate://crates.io/libc/0.2.186 \
     crate://crates.io/libloading/0.8.9 \
-    crate://crates.io/libredox/0.1.10 \
+    crate://crates.io/libm/0.2.16 \
     crate://crates.io/libudev-sys/0.1.4 \
-    crate://crates.io/linux-raw-sys/0.11.0 \
+    crate://crates.io/line-clipping/0.3.5 \
+    crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/log/0.4.28 \
-    crate://crates.io/lru/0.12.5 \
+    crate://crates.io/lru/0.18.0 \
     crate://crates.io/memchr/2.7.6 \
     crate://crates.io/minimal-lexical/0.2.1 \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mockall/0.13.1 \
     crate://crates.io/mockall_derive/0.13.1 \
-    crate://crates.io/nix/0.30.1 \
+    crate://crates.io/nix/0.31.3 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/nom/8.0.0 \
+    crate://crates.io/num-conv/0.2.1 \
     crate://crates.io/num-derive/0.4.2 \
     crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/num_cpus/1.17.0 \
+    crate://crates.io/num_threads/0.1.7 \
     crate://crates.io/numtoa/0.2.4 \
     crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/once_cell_polyfill/1.70.2 \
     crate://crates.io/os_pipe/1.2.3 \
-    crate://crates.io/paste/1.0.15 \
+    crate://crates.io/palette/0.7.6 \
+    crate://crates.io/palette_derive/0.7.6 \
     crate://crates.io/pkg-config/0.3.32 \
-    crate://crates.io/portable-atomic/1.11.1 \
+    crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/portable-atomic-util/0.2.4 \
+    crate://crates.io/powerfmt/0.2.0 \
     crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/predicates/3.1.3 \
     crate://crates.io/predicates-core/1.0.9 \
@@ -107,27 +119,29 @@ SRC_URI += " \
     crate://crates.io/prettyplease/0.2.37 \
     crate://crates.io/proc-macro2/1.0.103 \
     crate://crates.io/quick-xml/0.38.4 \
-    crate://crates.io/quickcheck/1.0.3 \
-    crate://crates.io/quickcheck_macros/1.1.0 \
+    crate://crates.io/quickcheck/1.1.0 \
+    crate://crates.io/quickcheck_macros/1.2.0 \
     crate://crates.io/quote/1.0.42 \
     crate://crates.io/r-efi/5.3.0 \
-    crate://crates.io/rand/0.8.5 \
-    crate://crates.io/rand/0.9.2 \
+    crate://crates.io/r-efi/6.0.0 \
+    crate://crates.io/rand/0.9.4 \
+    crate://crates.io/rand/0.10.1 \
     crate://crates.io/rand_chacha/0.9.0 \
-    crate://crates.io/rand_core/0.6.4 \
     crate://crates.io/rand_core/0.9.3 \
-    crate://crates.io/rangemap/1.7.0 \
-    crate://crates.io/ratatui/0.29.0 \
-    crate://crates.io/redox_syscall/0.5.18 \
-    crate://crates.io/redox_termios/0.1.3 \
+    crate://crates.io/rand_core/0.10.1 \
+    crate://crates.io/rangemap/1.7.1 \
+    crate://crates.io/ratatui/0.30.2 \
+    crate://crates.io/ratatui-core/0.1.2 \
+    crate://crates.io/ratatui-termion/0.1.2 \
+    crate://crates.io/ratatui-widgets/0.3.2 \
     crate://crates.io/regex/1.12.2 \
     crate://crates.io/regex-automata/0.4.13 \
     crate://crates.io/regex-syntax/0.8.8 \
     crate://crates.io/retry/2.1.0 \
-    crate://crates.io/roaring/0.11.2 \
+    crate://crates.io/roaring/0.11.4 \
     crate://crates.io/rustc-hash/2.1.1 \
     crate://crates.io/rustc_version/0.4.1 \
-    crate://crates.io/rustix/1.1.2 \
+    crate://crates.io/rustix/1.1.4 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ryu/1.0.20 \
     crate://crates.io/semver/1.0.27 \
@@ -143,23 +157,23 @@ SRC_URI += " \
     crate://crates.io/simd-adler32/0.3.7 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/strum/0.26.3 \
-    crate://crates.io/strum_macros/0.26.4 \
+    crate://crates.io/strum/0.28.0 \
+    crate://crates.io/strum_macros/0.28.0 \
     crate://crates.io/syn/2.0.110 \
-    crate://crates.io/tempfile/3.23.0 \
-    crate://crates.io/termion/4.0.5 \
+    crate://crates.io/tempfile/3.27.0 \
+    crate://crates.io/termion/4.0.6 \
     crate://crates.io/termtree/0.5.1 \
-    crate://crates.io/thiserror/2.0.17 \
-    crate://crates.io/thiserror-impl/2.0.17 \
+    crate://crates.io/thiserror/2.0.18 \
+    crate://crates.io/thiserror-impl/2.0.18 \
+    crate://crates.io/time/0.3.47 \
+    crate://crates.io/time-core/0.1.8 \
     crate://crates.io/udev/0.9.3 \
     crate://crates.io/unicode-ident/1.0.22 \
     crate://crates.io/unicode-segmentation/1.12.0 \
-    crate://crates.io/unicode-truncate/1.1.0 \
-    crate://crates.io/unicode-width/0.1.14 \
+    crate://crates.io/unicode-truncate/2.0.1 \
     crate://crates.io/unicode-width/0.2.0 \
     crate://crates.io/unit-prefix/0.5.2 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
     crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
     crate://crates.io/wasm-bindgen/0.2.105 \
     crate://crates.io/wasm-bindgen-macro/0.2.105 \
@@ -200,96 +214,108 @@ SRC_URI[anstyle-1.0.13.sha256sum] = "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfe
 SRC_URI[anstyle-parse-0.2.7.sha256sum] = "4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2"
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
-SRC_URI[anyhow-1.0.100.sha256sum] = "a23eb6b1614318a8071c9b2521f36b424b2c83db5eb3a0fead4a6c0809af6e61"
+SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
+SRC_URI[approx-0.5.1.sha256sum] = "cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684db5561995f6dad897c6"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[bindgen-0.72.1.sha256sum] = "993776b509cfb49c750f11b8f07a46fa23e0a1386ffc01fb1e7d343efc387895"
-SRC_URI[bitflags-2.10.0.sha256sum] = "812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3"
+SRC_URI[bitflags-2.13.0.sha256sum] = "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
 SRC_URI[bumpalo-3.19.0.sha256sum] = "46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a66f80a5a72e1cb76b34d43"
+SRC_URI[by_address-1.2.1.sha256sum] = "64fa3c856b712db6612c019f14756e64e4bcea13337a6b33b696333a9eaa2d06"
 SRC_URI[bytemuck-1.24.0.sha256sum] = "1fbdf580320f38b612e485521afda1ee26d10cc9884efaaa750d383e13e3c5f4"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
-SRC_URI[cassowary-0.3.0.sha256sum] = "df8670b8c7b9dae1793364eafadf7239c40d669904660c5960d74cfd80b46a53"
 SRC_URI[castaway-0.2.4.sha256sum] = "dec551ab6e7578819132c713a93c022a05d60159dc86e7a7050223577484c55a"
 SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
+SRC_URI[chacha20-0.10.0.sha256sum] = "6f8d983286843e49675a4b7a2d174efe136dc93a18d69130dd18198a6c167601"
 SRC_URI[clang-sys-1.8.1.sha256sum] = "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
-SRC_URI[clap-4.5.52.sha256sum] = "aa8120877db0e5c011242f96806ce3c94e0737ab8108532a76a3300a01db2ab8"
-SRC_URI[clap_builder-4.5.52.sha256sum] = "02576b399397b659c26064fbc92a75fede9d18ffd5f80ca1cd74ddab167016e1"
-SRC_URI[clap_lex-0.7.6.sha256sum] = "a1d728cc89cf3aee9ff92b05e62b19ee65a02b5702cff7d5a377e32c6ae29d8d"
+SRC_URI[clap-4.5.61.sha256sum] = "52fa72306bb30daf11bc97773431628e5b4916e97aaa74b7d3f625d4d495da02"
+SRC_URI[clap_builder-4.5.61.sha256sum] = "2071365c5c56eae7d77414029dde2f4f4ba151cf68d5a3261c9a40de428ace93"
+SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.4.sha256sum] = "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
-SRC_URI[compact_str-0.8.1.sha256sum] = "3b79c4069c6cad78e2e0cdfcbd26275770669fb39fd308a752dc110e83b9af32"
+SRC_URI[compact_str-0.9.0.sha256sum] = "3fdb1325a1cece981e8a296ab8f0f9b63ae357bd0784a9faaf548cc7b480707a"
 SRC_URI[console-0.16.1.sha256sum] = "b430743a6eb14e9764d4260d4c0d8123087d504eeb9c48f2b2a5e810dd369df4"
+SRC_URI[cpufeatures-0.3.0.sha256sum] = "8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201"
 SRC_URI[crc32c-0.6.8.sha256sum] = "3a47af21622d091a8f0fb295b88bc886ac74efcc613efc19f5d0b21de5c89e47"
 SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
 SRC_URI[darling-0.20.11.sha256sum] = "fc7f46116c46ff9ab3eb1597a45688b6715c6e628b5c133e288e709a29bcb4ee"
 SRC_URI[darling_core-0.20.11.sha256sum] = "0d00b9596d185e565c2207a0b01f8bd1a135483d02d9b7b0a54b11da8d53412e"
 SRC_URI[darling_macro-0.20.11.sha256sum] = "fc34b93ccb385b40dc71c6fceac4b2ad23662c7eeb248cf10d529b7e055b6ead"
 SRC_URI[data-encoding-2.9.0.sha256sum] = "2a2330da5de22e8a3cb63252ce2abb30116bf5265e89c0e01bc17015ce30a476"
-SRC_URI[devicemapper-0.34.5.sha256sum] = "f8ca2baf05e507adafc3524fb687aa15f2f9953de808c6a4cbd57a7f2e5aa883"
+SRC_URI[deranged-0.5.8.sha256sum] = "7cd812cc2bc1d69d4764bd80df88b4317eaef9e773c75226407d9bc0876b211c"
+SRC_URI[devicemapper-0.34.7.sha256sum] = "607791a4633fca6e032a66614f4fe96a721dd8641ebe98438283e53d361503cd"
 SRC_URI[devicemapper-sys-0.3.3.sha256sum] = "06421aaad10b53bd5d1fe004c26efddfaaeaa4438ff52b84a0f660b3c87d63e6"
 SRC_URI[downcast-0.11.0.sha256sum] = "1435fa1053d8b2fbbe9be7e97eca7f33d37b28409959813daefc1446a14247f1"
 SRC_URI[duct-1.1.1.sha256sum] = "7e66e9c0c03d094e1a0ba1be130b849034aa80c3a2ab8ee94316bc809f3fa684"
 SRC_URI[either-1.15.0.sha256sum] = "48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719"
 SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[env_filter-0.1.4.sha256sum] = "1bf3c259d255ca70051b30e2e95b5446cdb8949ac4cd22c0d7fd634d89f568e2"
-SRC_URI[env_logger-0.8.4.sha256sum] = "a19187fea3ac7e84da7dacf48de0c45d63c6a76f9490dae389aead16c243fce3"
 SRC_URI[env_logger-0.11.8.sha256sum] = "13c863f0904021b108aa8b2f55046443e6b1ebde8fd4a15c399893aae4fa069f"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
 SRC_URI[exitcode-1.1.2.sha256sum] = "de853764b47027c2e862a995c34978ffa63c1501f2e15f987ba11bd4f9bba193"
+SRC_URI[fast-srgb8-1.0.0.sha256sum] = "dd2e7510819d6fbf51a5545c8f922716ecfb14df168a3242f7d33e0239efe6a1"
 SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
 SRC_URI[fixedbitset-0.5.7.sha256sum] = "1d674e81391d1e1ab681a28d99df07927c6d4aa5b027d7da16ba32d1d21ecd99"
-SRC_URI[flate2-1.1.5.sha256sum] = "bfe33edd8e85a12a67454e37f8c75e730830d83e313556ab9ebf9ee7fbeb3bfb"
+SRC_URI[flate2-1.1.9.sha256sum] = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
 SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
-SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2"
+SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
 SRC_URI[fragile-2.0.1.sha256sum] = "28dd6caf6059519a65843af8fe2a3ae298b14b80179855aeb4adc2c1934ee619"
-SRC_URI[getrandom-0.2.16.sha256sum] = "335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592"
 SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
+SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
 SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
-SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
+SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
+SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hermit-abi-0.3.9.sha256sum] = "d231dfb89cfffdbc30e7fc41579ed6066ad03abda9e567ccafae602b97ec5024"
 SRC_URI[hermit-abi-0.5.2.sha256sum] = "fc0fef456e4baa96da950455cd02c081ca953b141298e41db3fc7e36b1da849c"
 SRC_URI[ident_case-1.0.1.sha256sum] = "b9e0384b61958566e926dc50660321d12159025e767c18e043daf26b70104c39"
-SRC_URI[indicatif-0.18.3.sha256sum] = "9375e112e4b463ec1b1c6c011953545c65a30164fbab5b581df32b3abf0dcb88"
+SRC_URI[indicatif-0.18.4.sha256sum] = "25470f23803092da7d239834776d653104d551bc4d7eacaf31e6837854b8e9eb"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[instability-0.3.9.sha256sum] = "435d80800b936787d62688c927b6490e887c7ef5ff9ce922c6c6050fca75eb9a"
 SRC_URI[io-lifetimes-1.0.11.sha256sum] = "eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2"
-SRC_URI[io-uring-0.7.11.sha256sum] = "fdd7bddefd0a8833b88a4b68f90dae22c7450d11b354198baee3874fd811b344"
+SRC_URI[io-uring-0.7.12.sha256sum] = "4d09b98f7eace8982db770e4408e7470b028ce513ac28fecdc6bf4c30fe92b62"
 SRC_URI[iovec-0.1.4.sha256sum] = "b2b3ea6ff95e175473f8ffe6a7eb7c00d054240321b84c57051175fe3c1e075e"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
+SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
 SRC_URI[jiff-0.2.16.sha256sum] = "49cce2b81f2098e7e3efc35bc2e0a6b7abec9d34128283d7a26fa8f32a6dbb35"
 SRC_URI[jiff-static-0.2.16.sha256sum] = "980af8b43c3ad5d8d349ace167ec8170839f753a42d233ba19e08afe1850fa69"
 SRC_URI[js-sys-0.3.82.sha256sum] = "b011eec8cc36da2aab2d5cff675ec18454fad408585853910a202391cf9f8e65"
-SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
+SRC_URI[kasuari-0.4.12.sha256sum] = "bde5057d6143cc94e861d90f591b9303d6716c6b9602309150bd068853c10899"
+SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
 SRC_URI[libloading-0.8.9.sha256sum] = "d7c4b02199fee7c5d21a5ae7d8cfa79a6ef5bb2fc834d6e9058e89c825efdc55"
-SRC_URI[libredox-0.1.10.sha256sum] = "416f7e718bdb06000964960ffa43b4335ad4012ae8b99060261aa4a8088d5ccb"
+SRC_URI[libm-0.2.16.sha256sum] = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981"
 SRC_URI[libudev-sys-0.1.4.sha256sum] = "3c8469b4a23b962c1396b9b451dda50ef5b283e8dd309d69033475fa9b334324"
-SRC_URI[linux-raw-sys-0.11.0.sha256sum] = "df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039"
+SRC_URI[line-clipping-0.3.5.sha256sum] = "5f4de44e98ddbf09375cbf4d17714d18f39195f4f4894e8524501726fd9a8a4a"
+SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[log-0.4.28.sha256sum] = "34080505efa8e45a4b816c349525ebe327ceaa8559756f0356cba97ef3bf7432"
-SRC_URI[lru-0.12.5.sha256sum] = "234cf4f4a04dc1f57e24b96cc0cd600cf2af460d4161ac5ecdd0af8e1f3b2a38"
+SRC_URI[lru-0.18.0.sha256sum] = "8a860605968fce16869fd239cf4237a82f3ac470723415db603b0e8b6c8d4fb9"
 SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mockall-0.13.1.sha256sum] = "39a6bfcc6c8c7eed5ee98b9c3e33adc726054389233e201c95dab2d41a3839d2"
 SRC_URI[mockall_derive-0.13.1.sha256sum] = "25ca3004c2efe9011bd4e461bd8256445052b9615405b4f7ea43fc8ca5c20898"
-SRC_URI[nix-0.30.1.sha256sum] = "74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6"
+SRC_URI[nix-0.31.3.sha256sum] = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[nom-8.0.0.sha256sum] = "df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405"
+SRC_URI[num-conv-0.2.1.sha256sum] = "c6673768db2d862beb9b39a78fdcb1a69439615d5794a1be50caa9bc92c81967"
 SRC_URI[num-derive-0.4.2.sha256sum] = "ed3955f1a9c7c0c15e092f9c887db08b1fc683305fdf6eb6684f22555355e202"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[num_cpus-1.17.0.sha256sum] = "91df4bbde75afed763b708b7eee1e8e7651e02d97f6d5dd763e89367e957b23b"
+SRC_URI[num_threads-0.1.7.sha256sum] = "5c7398b9c8b70908f6371f47ed36737907c87c52af34c268fed0bf0ceb92ead9"
 SRC_URI[numtoa-0.2.4.sha256sum] = "6aa2c4e539b869820a2b82e1aef6ff40aa85e65decdd5185e83fb4b1249cd00f"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
 SRC_URI[os_pipe-1.2.3.sha256sum] = "7d8fae84b431384b68627d0f9b3b1245fcf9f46f6c0e3dc902e9dce64edd1967"
-SRC_URI[paste-1.0.15.sha256sum] = "57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a"
+SRC_URI[palette-0.7.6.sha256sum] = "4cbf71184cc5ecc2e4e1baccdb21026c20e5fc3dcf63028a086131b3ab00b6e6"
+SRC_URI[palette_derive-0.7.6.sha256sum] = "f5030daf005bface118c096f510ffb781fc28f9ab6a32ab224d8631be6851d30"
 SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
-SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
+SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[portable-atomic-util-0.2.4.sha256sum] = "d8a2f0d8d040d7848a709caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
+SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[predicates-3.1.3.sha256sum] = "a5d19ee57562043d37e82899fade9a22ebab7be9cef5026b07fda9cdd4293573"
 SRC_URI[predicates-core-1.0.9.sha256sum] = "727e462b119fe9c93fd0eb1429a5f7647394014cf3c04ab2c0350eeb09095ffa"
@@ -297,27 +323,29 @@ SRC_URI[predicates-tree-1.0.12.sha256sum] = "72dd2d6d381dfb73a193c7fca536518d7ca
 SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
 SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
 SRC_URI[quick-xml-0.38.4.sha256sum] = "b66c2058c55a409d601666cffe35f04333cf1013010882cec174a7467cd4e21c"
-SRC_URI[quickcheck-1.0.3.sha256sum] = "588f6378e4dd99458b60ec275b4477add41ce4fa9f64dcba6f15adccb19b50d6"
-SRC_URI[quickcheck_macros-1.1.0.sha256sum] = "f71ee38b42f8459a88d3362be6f9b841ad2d5421844f61eb1c59c11bff3ac14a"
+SRC_URI[quickcheck-1.1.0.sha256sum] = "95c589f335db0f6aaa168a7cd27b1fc6920f5e1470c804f814d9cd6e62a0f70b"
+SRC_URI[quickcheck_macros-1.2.0.sha256sum] = "a9a28b8493dd664c8b171dd944da82d933f7d456b829bfb236738e1fe06c5ba4"
 SRC_URI[quote-1.0.42.sha256sum] = "a338cc41d27e6cc6dce6cefc13a0729dfbb81c262b1f519331575dd80ef3067f"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
-SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
-SRC_URI[rand-0.9.2.sha256sum] = "6db2770f06117d490610c7488547d543617b21bfa07796d7a12f6f1bd53850d1"
+SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
+SRC_URI[rand-0.9.4.sha256sum] = "44c5af06bb1b7d3216d91932aed5265164bf384dc89cd6ba05cf59a35f5f76ea"
+SRC_URI[rand-0.10.1.sha256sum] = "d2e8e8bcc7961af1fdac401278c6a831614941f6164ee3bf4ce61b7edb162207"
 SRC_URI[rand_chacha-0.9.0.sha256sum] = "d3022b5f1df60f26e1ffddd6c66e8aa15de382ae63b3a0c1bfc0e4d3e3f325cb"
-SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
 SRC_URI[rand_core-0.9.3.sha256sum] = "99d9a13982dcf210057a8a78572b2217b667c3beacbf3a0d8b454f6f82837d38"
-SRC_URI[rangemap-1.7.0.sha256sum] = "acbbbbea733ec66275512d0b9694f34102e7d5406fdbe2ad8d21b28dce92887c"
-SRC_URI[ratatui-0.29.0.sha256sum] = "eabd94c2f37801c20583fc49dd5cd6b0ba68c716787c2dd6ed18571e1e63117b"
-SRC_URI[redox_syscall-0.5.18.sha256sum] = "ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d"
-SRC_URI[redox_termios-0.1.3.sha256sum] = "20145670ba436b55d91fc92d25e71160fbfbdd57831631c8d7d36377a476f1cb"
+SRC_URI[rand_core-0.10.1.sha256sum] = "63b8176103e19a2643978565ca18b50549f6101881c443590420e4dc998a3c69"
+SRC_URI[rangemap-1.7.1.sha256sum] = "973443cf09a9c8656b574a866ab68dfa19f0867d0340648c7d2f6a71b8a8ea68"
+SRC_URI[ratatui-0.30.2.sha256sum] = "3274ba0a2c5e1bcad2a2005d20f4dc59dad26b2eb0940fb094500dba4099d57d"
+SRC_URI[ratatui-core-0.1.2.sha256sum] = "cbb175c433c8e28a809d1f5773a2ae96e68c0ce40db865cbab1020bf33ae479c"
+SRC_URI[ratatui-termion-0.1.2.sha256sum] = "87c732202fa5a71a9da0991013f0853e53f87048f45198e3a1ca3ee722accc2f"
+SRC_URI[ratatui-widgets-0.3.2.sha256sum] = "66e3d19bcc9130ca376277d93b60767ff121ace3be06f5f95f81dd68956407d1"
 SRC_URI[regex-1.12.2.sha256sum] = "843bc0191f75f3e22651ae5f1e72939ab2f72a4bc30fa80a066bd66edefc24d4"
 SRC_URI[regex-automata-0.4.13.sha256sum] = "5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
 SRC_URI[regex-syntax-0.8.8.sha256sum] = "7a2d987857b319362043e95f5353c0535c1f58eec5336fdfcf626430af7def58"
 SRC_URI[retry-2.1.0.sha256sum] = "a1e211f878258887b3e65dd3c8ff9f530fe109f441a117ee0cdc27f341355032"
-SRC_URI[roaring-0.11.2.sha256sum] = "f08d6a905edb32d74a5d5737a0c9d7e950c312f3c46cb0ca0a2ca09ea11878a0"
+SRC_URI[roaring-0.11.4.sha256sum] = "1dedc5658c6ecb3bdb5ef5f3295bb9253f42dcf3fd1402c03f6b1f7659c3c4a9"
 SRC_URI[rustc-hash-2.1.1.sha256sum] = "357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d"
 SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
-SRC_URI[rustix-1.1.2.sha256sum] = "cd15f8a2c5551a84d56efdc1cd049089e409ac19a3072d5037a17fd70719ff3e"
+SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ryu-1.0.20.sha256sum] = "28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f"
 SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
@@ -333,23 +361,23 @@ SRC_URI[signal-hook-registry-1.4.6.sha256sum] = "b2a4719bff48cee6b39d12c020eeb49
 SRC_URI[simd-adler32-0.3.7.sha256sum] = "d66dc143e6b11c1eddc06d5c423cfc97062865baf299914ab64caa38182078fe"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[strum-0.26.3.sha256sum] = "8fec0f0aef304996cf250b31b5a10dee7980c85da9d759361292b8bca5a18f06"
-SRC_URI[strum_macros-0.26.4.sha256sum] = "4c6bee85a5a24955dc440386795aa378cd9cf82acd5f764469152d2270e581be"
+SRC_URI[strum-0.28.0.sha256sum] = "9628de9b8791db39ceda2b119bbe13134770b56c138ec1d3af810d045c04f9bd"
+SRC_URI[strum_macros-0.28.0.sha256sum] = "ab85eea0270ee17587ed4156089e10b9e6880ee688791d45a905f5b1ca36f664"
 SRC_URI[syn-2.0.110.sha256sum] = "a99801b5bd34ede4cf3fc688c5919368fea4e4814a4664359503e6015b280aea"
-SRC_URI[tempfile-3.23.0.sha256sum] = "2d31c77bdf42a745371d260a26ca7163f1e0924b64afa0b688e61b5a9fa02f16"
-SRC_URI[termion-4.0.5.sha256sum] = "3669a69de26799d6321a5aa713f55f7e2cd37bd47be044b50f2acafc42c122bb"
+SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
+SRC_URI[termion-4.0.6.sha256sum] = "f44138a9ae08f0f502f24104d82517ef4da7330c35acd638f1f29d3cd5475ecb"
 SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
-SRC_URI[thiserror-2.0.17.sha256sum] = "f63587ca0f12b72a0600bcba1d40081f830876000bb46dd2337a3051618f4fc8"
-SRC_URI[thiserror-impl-2.0.17.sha256sum] = "3ff15c8ecd7de3849db632e14d18d2571fa09dfc5ed93479bc4485c7a517c913"
+SRC_URI[thiserror-2.0.18.sha256sum] = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
+SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
+SRC_URI[time-0.3.47.sha256sum] = "743bd48c283afc0388f9b8827b976905fb217ad9e647fae3a379a9283c4def2c"
+SRC_URI[time-core-0.1.8.sha256sum] = "7694e1cfe791f8d31026952abf09c69ca6f6fa4e1a1229e18988f06a04a12dca"
 SRC_URI[udev-0.9.3.sha256sum] = "af4e37e9ea4401fc841ff54b9ddfc9be1079b1e89434c1a6a865dd68980f7e9f"
 SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
 SRC_URI[unicode-segmentation-1.12.0.sha256sum] = "f6ccf251212114b54433ec949fd6a7841275f9ada20dddd2f29e9ceea4501493"
-SRC_URI[unicode-truncate-1.1.0.sha256sum] = "b3644627a5af5fa321c95b9b235a72fd24cd29c648c2c379431e6628655627bf"
-SRC_URI[unicode-width-0.1.14.sha256sum] = "7dd6e30e90baa6f72411720665d41d89b9a3d039dc45b8faea1ddd07f617f6af"
+SRC_URI[unicode-truncate-2.0.1.sha256sum] = "16b380a1238663e5f8a691f9039c73e1cdae598a30e9855f541d29b08b53e9a5"
 SRC_URI[unicode-width-0.2.0.sha256sum] = "1fc81956842c57dac11422a97c3b8195a1ff727f06e85c84ed2e8aa277c9a0fd"
 SRC_URI[unit-prefix-0.5.2.sha256sum] = "81e544489bf3d8ef66c953931f56617f423cd4b5494be343d9b9d3dda037b9a3"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
 SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] = "0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
 SRC_URI[wasm-bindgen-0.2.105.sha256sum] = "da95793dfc411fbbd93f5be7715b0578ec61fe87cb1a42b12eb625caa5c5ea60"
 SRC_URI[wasm-bindgen-macro-0.2.105.sha256sum] = "04264334509e04a7bf8690f2384ef5265f05143a4bff3889ab7a3269adab59c2"
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.3.bb
similarity index 97%
rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.3.bb
index bdfadc04e8..92b1caa8ee 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.3.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
         '', d)} \
     "
 
-SRCREV = "8b663fb4c6fb8e52ca06cea57b986c5ba45f668d"
+SRCREV = "b61de422f87f06ca7526d0b378de4412ad2c760c"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cargo cargo-update-recipe-crates

