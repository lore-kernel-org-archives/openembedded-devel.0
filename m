Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3835.1794729062563993266
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MF+QO3U5;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so4585117eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729062; x=1795333862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MHwB0MOYeMJW/sY1bQta68KbSJWg7zyfiz3I1x6kRo=;
        b=MF+QO3U51c1SZCa8nlVIyhP9/sAej/m1xyC35U26nnVw5/FKWA3HAMMnR3bUnxkVS9
         sUO9susXKICXyFhv47QW0dk6KEkN/MXOtB6Y1xmD3XleWDDadXc5JqX1Kj6Phd2HuM+0
         fcnGBUAjB20J0LAvFn0dX4MtmtxpW8HJMhPgEPBWlLXLJVhEvgKqWM66DlH1WS6RqfoK
         +R4LmjbY/wDSabn+h5NR/+ncSZFzVanz0h0JG9QiU9K0YGkm+Z2n6CSQdAUADCf4IRDW
         VUnV156ADH+VtlEbWXewHFl/MwyzM0w4tEr3C5n4o1PUwu44ThXXUVAk4b4oH+wvzeLa
         sevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729062; x=1795333862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MHwB0MOYeMJW/sY1bQta68KbSJWg7zyfiz3I1x6kRo=;
        b=izdf23SQvisU4ecibBj0jKskTQkbVnP2Hlo7zZKQFGzrXcqQDerNtK6wihXs0P3D2d
         Kls20XYxcLU3EPf0NtEeg9sLhpEACDVb5I+0RznupouWMg9NRcn3E+ILI/l4T50in85a
         h/GQZhHwlGqEL1g31Nl4CwObCO1DyrO8Y4XvexFHwlAqutDaj27+59kqq+ZtkRWR8f95
         sxouh7zqISI6SeWWjUnGeDgT2zyQbD0yUJWq3cTO0AJU2fnnWB5p7Akmy5m4BGNYhn9d
         u/NS2RzvtW58HpHXeFMSvKCoNDr4f7HsNv02L3pygytk+yGk7UwDEeN6X3JiqI0HPZFZ
         XLQg==
X-Gm-Message-State: APuU4Z98TAAMmlt8vWgSulBbBq54qfFtmzuTiWwRU1NTmQgxlQiCYVLM
	cL682Wa+ffTn0dmzIDNZOtyaU/VliucIgEvjww28Yfi2l3a5MbrIy/Yj9jy+CQ2m
X-Gm-Gg: AYBFou0Cdh2YwexACiV9GRPPmMV3oa0ncOWxsd7bwl/beXHYQIaTtHi0Yr5B/6BG4bs
	pgrm41ClVI4nlpHNiarxdKHI+TdKxZ7Sb0xCGkSHaPkmYO2/L29L2XxSR/ZmD+bWEPaJaDp9/cg
	QgMI8i/NaPfoZ9H3XHZEQbK6fU3IbkfEVyfczfmLt0jqPSse5hc2TlDSEaNZu+SBx2EPtgwtNNf
	urz7wEWLsFl5939tuphCthzDZuQUIQCdzAKRFW+Th1O9ExmbMnT/KwRgm6zlvZqOp+0A8gOJZ3I
	29t/+PyW2U4L9KpmHOvdvSG43QmB5w5Vq2djR5BobiGKC/OZiSogl9dGhEWuBMz4uAKxjEO3437
	xjMrgr3zBf1Ox7EFhV0Opmv+gj95S0VZZJkGQENK/mPfIpRn/AGrDajiSXcn1HDYMVbAYTns76R
	S1T8i7bbR3IZKrmVJSfuhaGU6v3DsCIVD1RDZigCTCBH2NMQKocH0ZXpK4Sh/jiL/POzIIOh5zp
	zH4oeD4wyvSd7YuMqlav9VTqpcXgghM/fGi4P/6+zdPsL7DzQZfG5AS4cwWlAMu/HHeL+5kvOri
	D+FlAlvh1Rmv54EKK7zH2DfZi+K4tbBhhfTnrvE1RA3XTf7CFAKY3Wd9Tn7tHve4olsXP+ubnnE
	83arzBfuaUN3lI48hluD0yxJl0EQT9bLoX8UD7DKdG7pqGqKrBzkAdMohvvOFWmkkngT5QgmNwl
	8yDFvZdnMvgV6bq20m+/W8TXyWZkIKlVvyHJsyfj7V4QZaf8MsuJxLqIZJmUyeDPLfaUaS88hRn
	8MITHiZPNuUMGu3bo/OrYiGOdzrwheo9zCIDcngHuuUsNztSyun/U8J8FwWeF9ZuEtmTBdVLaQE
	66FudBCabdcwR4MhgR6S/TPAcg==
X-Received: by 2002:a05:693c:829b:10b0:370:ff2:f78d with SMTP id 5a478bee46e88-37965ca7d77mr8141936eec.8.1794729061615;
        Sat, 14 Nov 2026 23:51:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 63/96] fd-find: upgrade 10.5.0 -> 10.5.2
Date: Sat, 14 Nov 2026 23:48:41 -0800
Message-ID: <20261115074918.2932593-63-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132333
Content-Type: text/plain; charset="utf-8"

Regenerate the crates list with bitbake -c update_crates.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../fd-find/fd-find-crates.inc                | 286 +++++++-----------
 .../{fd-find_10.5.0.bb => fd-find_10.5.2.bb}  |   2 +-
 2 files changed, 109 insertions(+), 179 deletions(-)
 rename meta-oe/recipes-extended/fd-find/{fd-find_10.5.0.bb => fd-find_10.5.2.bb} (91%)

diff --git a/meta-oe/recipes-extended/fd-find/fd-find-crates.inc b/meta-oe/recipes-extended/fd-find/fd-find-crates.inc
index 6c4ec90150..7d4f3a2514 100644
--- a/meta-oe/recipes-extended/fd-find/fd-find-crates.inc
+++ b/meta-oe/recipes-extended/fd-find/fd-find-crates.inc
@@ -2,263 +2,193 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/aho-corasick/1.1.4 \
+    crate://crates.io/aho-corasick/1.1.5 \
     crate://crates.io/anstream/1.0.0 \
-    crate://crates.io/anstyle/1.0.13 \
+    crate://crates.io/anstyle/1.0.14 \
     crate://crates.io/anstyle-parse/1.0.0 \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.104 \
     crate://crates.io/argmax/0.4.0 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.11.0 \
+    crate://crates.io/bitflags/2.13.2 \
     crate://crates.io/block2/0.6.2 \
-    crate://crates.io/bstr/1.12.1 \
-    crate://crates.io/cc/1.2.56 \
-    crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/cfg_aliases/0.2.1 \
-    crate://crates.io/clap/4.6.1 \
-    crate://crates.io/clap_builder/4.6.0 \
-    crate://crates.io/clap_complete/4.6.5 \
-    crate://crates.io/clap_derive/4.6.1 \
-    crate://crates.io/clap_lex/1.0.0 \
-    crate://crates.io/colorchoice/1.0.4 \
-    crate://crates.io/crossbeam-channel/0.5.16 \
-    crate://crates.io/crossbeam-deque/0.8.6 \
-    crate://crates.io/crossbeam-epoch/0.9.18 \
-    crate://crates.io/crossbeam-utils/0.8.21 \
+    crate://crates.io/bstr/1.13.1 \
+    crate://crates.io/cc/1.10.0 \
+    crate://crates.io/cfg-if/1.0.5 \
+    crate://crates.io/cfg_aliases/0.2.2 \
+    crate://crates.io/clap/4.6.7 \
+    crate://crates.io/clap_builder/4.6.7 \
+    crate://crates.io/clap_complete/4.6.11 \
+    crate://crates.io/clap_derive/4.6.7 \
+    crate://crates.io/clap_lex/1.1.1 \
+    crate://crates.io/colorchoice/1.0.5 \
+    crate://crates.io/crossbeam-channel/0.5.17 \
+    crate://crates.io/crossbeam-deque/0.8.8 \
+    crate://crates.io/crossbeam-epoch/0.9.21 \
+    crate://crates.io/crossbeam-utils/0.8.23 \
     crate://crates.io/ctrlc/3.5.2 \
-    crate://crates.io/defmt/1.1.0 \
-    crate://crates.io/defmt-macros/1.1.0 \
-    crate://crates.io/defmt-parser/1.0.0 \
+    crate://crates.io/defmt/1.2.0 \
+    crate://crates.io/defmt-macros/1.2.0 \
+    crate://crates.io/defmt-parser/1.1.0 \
     crate://crates.io/diff/0.1.13 \
     crate://crates.io/dispatch2/0.3.1 \
-    crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/errno/0.3.14 \
     crate://crates.io/etcetera/0.11.0 \
     crate://crates.io/faccess/0.2.4 \
-    crate://crates.io/fastrand/2.3.0 \
+    crate://crates.io/fastrand/2.5.0 \
     crate://crates.io/filetime/0.2.29 \
-    crate://crates.io/find-msvc-tools/0.1.9 \
-    crate://crates.io/foldhash/0.1.5 \
-    crate://crates.io/getrandom/0.4.2 \
-    crate://crates.io/globset/0.4.19 \
-    crate://crates.io/hashbrown/0.15.5 \
-    crate://crates.io/hashbrown/0.16.1 \
+    crate://crates.io/find-msvc-tools/0.1.15 \
+    crate://crates.io/getrandom/0.4.3 \
+    crate://crates.io/globset/0.4.21 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/id-arena/2.3.0 \
-    crate://crates.io/ignore/0.4.31 \
-    crate://crates.io/indexmap/2.13.0 \
+    crate://crates.io/ignore/0.4.34 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
-    crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.29 \
-    crate://crates.io/jiff-static/0.2.29 \
-    crate://crates.io/jiff-tzdb/0.1.6 \
+    crate://crates.io/jiff/0.2.38 \
+    crate://crates.io/jiff-core/0.1.1 \
+    crate://crates.io/jiff-static/0.2.38 \
+    crate://crates.io/jiff-tzdb/0.1.9 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
-    crate://crates.io/leb128fmt/0.1.0 \
-    crate://crates.io/libc/0.2.189 \
+    crate://crates.io/libc/0.2.191 \
     crate://crates.io/linux-raw-sys/0.12.1 \
-    crate://crates.io/log/0.4.29 \
+    crate://crates.io/log/0.4.34 \
     crate://crates.io/lscolors/0.21.0 \
-    crate://crates.io/memchr/2.8.0 \
+    crate://crates.io/memchr/2.8.3 \
     crate://crates.io/nix/0.30.1 \
     crate://crates.io/nix/0.31.3 \
-    crate://crates.io/normpath/1.5.1 \
+    crate://crates.io/normpath/1.5.2 \
     crate://crates.io/nu-ansi-term/0.50.3 \
-    crate://crates.io/objc2/0.6.4 \
+    crate://crates.io/objc2/0.6.5 \
     crate://crates.io/objc2-encode/4.1.0 \
-    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/once_cell_polyfill/1.70.2 \
-    crate://crates.io/portable-atomic/1.13.1 \
-    crate://crates.io/portable-atomic-util/0.2.5 \
-    crate://crates.io/prettyplease/0.2.37 \
-    crate://crates.io/proc-macro-error-attr2/2.0.0 \
-    crate://crates.io/proc-macro-error2/2.0.1 \
-    crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/quote/1.0.45 \
+    crate://crates.io/portable-atomic/1.15.0 \
+    crate://crates.io/portable-atomic-util/0.2.8 \
+    crate://crates.io/proc-macro2/1.0.107 \
+    crate://crates.io/quote/1.0.47 \
     crate://crates.io/r-efi/6.0.0 \
-    crate://crates.io/regex/1.12.4 \
-    crate://crates.io/regex-automata/0.4.14 \
+    crate://crates.io/regex/1.13.1 \
+    crate://crates.io/regex-automata/0.4.18 \
     crate://crates.io/regex-syntax/0.8.11 \
-    crate://crates.io/rustix/1.1.4 \
+    crate://crates.io/rustix/1.1.6 \
     crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/semver/1.0.27 \
-    crate://crates.io/serde/1.0.228 \
-    crate://crates.io/serde_core/1.0.228 \
-    crate://crates.io/serde_derive/1.0.228 \
-    crate://crates.io/serde_json/1.0.149 \
-    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/serde_core/1.0.229 \
+    crate://crates.io/serde_derive/1.0.229 \
+    crate://crates.io/shlex/2.0.1 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/syn/2.0.117 \
+    crate://crates.io/syn/2.0.119 \
+    crate://crates.io/syn/3.0.9 \
     crate://crates.io/tempfile/3.27.0 \
-    crate://crates.io/terminal_size/0.4.3 \
-    crate://crates.io/test-case/3.3.1 \
-    crate://crates.io/test-case-core/3.3.1 \
-    crate://crates.io/test-case-macros/3.3.1 \
-    crate://crates.io/thiserror/2.0.18 \
-    crate://crates.io/thiserror-impl/2.0.18 \
+    crate://crates.io/terminal_size/0.4.4 \
+    crate://crates.io/test-case/3.4.0 \
+    crate://crates.io/test-case-core/3.4.0 \
+    crate://crates.io/test-case-macros/3.4.0 \
+    crate://crates.io/thiserror/2.0.21 \
+    crate://crates.io/thiserror-impl/2.0.21 \
     crate://crates.io/tikv-jemalloc-sys/0.7.1+5.3.1-0-g81034ce1f1373e37dc865038e1bc8eeecf559ce8 \
     crate://crates.io/tikv-jemallocator/0.7.0 \
-    crate://crates.io/unicode-ident/1.0.24 \
-    crate://crates.io/unicode-xid/0.2.6 \
+    crate://crates.io/unicode-ident/1.0.27 \
     crate://crates.io/utf8parse/0.2.2 \
     crate://crates.io/walkdir/2.5.0 \
-    crate://crates.io/wasip2/1.0.2+wasi-0.2.9 \
-    crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 \
-    crate://crates.io/wasm-encoder/0.244.0 \
-    crate://crates.io/wasm-metadata/0.244.0 \
-    crate://crates.io/wasmparser/0.244.0 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-util/0.1.11 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
     crate://crates.io/windows-link/0.2.1 \
-    crate://crates.io/windows-sys/0.60.2 \
     crate://crates.io/windows-sys/0.61.2 \
-    crate://crates.io/windows-targets/0.53.5 \
-    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
-    crate://crates.io/windows_aarch64_msvc/0.53.1 \
-    crate://crates.io/windows_i686_gnu/0.53.1 \
-    crate://crates.io/windows_i686_gnullvm/0.53.1 \
-    crate://crates.io/windows_i686_msvc/0.53.1 \
-    crate://crates.io/windows_x86_64_gnu/0.53.1 \
-    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
-    crate://crates.io/windows_x86_64_msvc/0.53.1 \
-    crate://crates.io/wit-bindgen/0.51.0 \
-    crate://crates.io/wit-bindgen-core/0.51.0 \
-    crate://crates.io/wit-bindgen-rust/0.51.0 \
-    crate://crates.io/wit-bindgen-rust-macro/0.51.0 \
-    crate://crates.io/wit-component/0.244.0 \
-    crate://crates.io/wit-parser/0.244.0 \
-    crate://crates.io/zmij/1.0.21 \
 "
 
-SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
+SRC_URI[aho-corasick-1.1.5.sha256sum] = "c982642fa9e8606056828ee9a8505737230110bb1099153c79efe865c59d12ba"
 SRC_URI[anstream-1.0.0.sha256sum] = "824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d"
-SRC_URI[anstyle-1.0.13.sha256sum] = "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78"
+SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
 SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e"
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
 SRC_URI[argmax-0.4.0.sha256sum] = "0144c58b55af0133ec3963ce5e4d07aad866e3bbcfdcddbf4590dbd7ad6ff557"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.11.0.sha256sum] = "843867be96c8daad0d758b57df9392b6d8d271134fce549de6ce169ff98a92af"
+SRC_URI[bitflags-2.13.2.sha256sum] = "3ded4057c258ba199e2d26386d3af3780957ecaee6c4ef4041c6b4b8b97c0b06"
 SRC_URI[block2-0.6.2.sha256sum] = "cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5"
-SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
-SRC_URI[cc-1.2.56.sha256sum] = "aebf35691d1bfb0ac386a69bac2fde4dd276fb618cf8bf4f5318fe285e821bb2"
-SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
-SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
-SRC_URI[clap-4.6.1.sha256sum] = "1ddb117e43bbf7dacf0a4190fef4d345b9bad68dfc649cb349e7d17d28428e51"
-SRC_URI[clap_builder-4.6.0.sha256sum] = "714a53001bf66416adb0e2ef5ac857140e7dc3a0c48fb28b2f10762fc4b5069f"
-SRC_URI[clap_complete-4.6.5.sha256sum] = "e0a7a9bfdb35811f9e59832f0f05975114d2251b415fb534108e6f34060fd772"
-SRC_URI[clap_derive-4.6.1.sha256sum] = "f2ce8604710f6733aa641a2b3731eaa1e8b3d9973d5e3565da11800813f997a9"
-SRC_URI[clap_lex-1.0.0.sha256sum] = "3a822ea5bc7590f9d40f1ba12c0dc3c2760f3482c6984db1573ad11031420831"
-SRC_URI[colorchoice-1.0.4.sha256sum] = "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
-SRC_URI[crossbeam-channel-0.5.16.sha256sum] = "d85363c37faeca707aef026efa9f3b34d077bce547e48f770770625c6013679e"
-SRC_URI[crossbeam-deque-0.8.6.sha256sum] = "9dd111b7b7f7d55b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51"
-SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
-SRC_URI[crossbeam-utils-0.8.21.sha256sum] = "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
+SRC_URI[bstr-1.13.1.sha256sum] = "6bb31b46c14244e20ee9984b11bf5c992b91fb6939fea616e3512c8baecdbe5f"
+SRC_URI[cc-1.10.0.sha256sum] = "86e055fa6e3e40ad6187ba25b6855eeb635d5271f8e0f0e1e9a5826b8d75bea0"
+SRC_URI[cfg-if-1.0.5.sha256sum] = "4e7648175b45a9a48536d676f68d918270699102aa8dab5496df06904c914600"
+SRC_URI[cfg_aliases-0.2.2.sha256sum] = "f079e83a288787bcd14a6aea84cee5c87a67c5a3e660c30f557a3d24761b3527"
+SRC_URI[clap-4.6.7.sha256sum] = "aa8876b300ab35ba921adea3dfd70157a46249b33f95c9084ae5709785478946"
+SRC_URI[clap_builder-4.6.7.sha256sum] = "ec0797fb7aeb1406c84efac526901f7ec3ead2124f946b494e72879d4b54704d"
+SRC_URI[clap_complete-4.6.11.sha256sum] = "037e2a1a92236d0aff7e845093f64661d6df4c02c9fcc61a60e9e1d736fa392f"
+SRC_URI[clap_derive-4.6.7.sha256sum] = "f9c751b79415d4e559e3d1fcf128e09e720eb673a06d26cf6f392d37d75b66e0"
+SRC_URI[clap_lex-1.1.1.sha256sum] = "1c133bc6a41be0d194c306b5506d15e6feeea7b1d6604bd3f8310dfb2ca96486"
+SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
+SRC_URI[crossbeam-channel-0.5.17.sha256sum] = "98b0cc327b5bc766e7fda9c9260cc0fa81b43a8e240440422dff70788e3f9ef1"
+SRC_URI[crossbeam-deque-0.8.8.sha256sum] = "622f3fc73690be383c7214310406f28a90e6edeadc3cea882f9d71e495b9711a"
+SRC_URI[crossbeam-epoch-0.9.21.sha256sum] = "dc74980687109a3b14c72fd458107bf0baa1da1a1a805e178d15501ba9b86d9d"
+SRC_URI[crossbeam-utils-0.8.23.sha256sum] = "a31eee39dddec8330830986fcd7625edb5a24ec90ea038215273bbc3adb08ac6"
 SRC_URI[ctrlc-3.5.2.sha256sum] = "e0b1fab2ae45819af2d0731d60f2afe17227ebb1a1538a236da84c93e9a60162"
-SRC_URI[defmt-1.1.0.sha256sum] = "a6e524506490a1953d237cb87b1cfc1e46f88c18f10a22dfe0f507dc6bfc7f7f"
-SRC_URI[defmt-macros-1.1.0.sha256sum] = "f0a27770e9c8f719a79d8b638281f4d828f77d8fd61e0bd94451b9b85e576a0b"
-SRC_URI[defmt-parser-1.0.0.sha256sum] = "10d60334b3b2e7c9d91ef8150abfb6fa4c1c39ebbcf4a81c2e346aad939fee3e"
+SRC_URI[defmt-1.2.0.sha256sum] = "e4a0795ac740cb54d7b3775c9c17345f6aaecf884c01733b39d6017738e0e3e1"
+SRC_URI[defmt-macros-1.2.0.sha256sum] = "840bb056bd99c495c9188198a258ab787c79f306d864db3e6e8451442d6d8366"
+SRC_URI[defmt-parser-1.1.0.sha256sum] = "71958f69fb2de856c5dd51ac9377e986ca1aa5919f931bf5395a807277f889a0"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
 SRC_URI[dispatch2-0.3.1.sha256sum] = "1e0e367e4e7da84520dedcac1901e4da967309406d1e51017ae1abfb97adbd38"
-SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
 SRC_URI[etcetera-0.11.0.sha256sum] = "de48cc4d1c1d97a20fd819def54b890cadde72ed3ad0c614822a0a433361be96"
 SRC_URI[faccess-0.2.4.sha256sum] = "59ae66425802d6a903e268ae1a08b8c38ba143520f227a205edf4e9c7e3e26d5"
-SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
+SRC_URI[fastrand-2.5.0.sha256sum] = "da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223"
 SRC_URI[filetime-0.2.29.sha256sum] = "5c287a33c7f0a620c38e641e7f60827713987b3c0f26e8ddc9462cc69cf75759"
-SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
-SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2"
-SRC_URI[getrandom-0.4.2.sha256sum] = "0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555"
-SRC_URI[globset-0.4.19.sha256sum] = "e47d37d2ae4464254884b60ab7071be2b876a9c35b696bd018ddcc76847309cd"
-SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
-SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
+SRC_URI[find-msvc-tools-0.1.15.sha256sum] = "1c66915cc5391097de7a2b0b972e8505aa33c0df401fd3a6811dbdb32881ba48"
+SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
+SRC_URI[globset-0.4.21.sha256sum] = "f98b0d85522dc0a824cfebbc9594ff4a9b289c568bea0370319dfbdf20ccdd2d"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[id-arena-2.3.0.sha256sum] = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
-SRC_URI[ignore-0.4.31.sha256sum] = "7f8a7b8211e695a1d0cd91cace480d4d0bd57667ab10277cc412c5f7f4884f83"
-SRC_URI[indexmap-2.13.0.sha256sum] = "7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc7678aff7364301092b1017"
+SRC_URI[ignore-0.4.34.sha256sum] = "484be5657551d7868d67587df967fb4fcbe9d266a761cc855aaa148fda0b3cc7"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
-SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.29.sha256sum] = "34f877a98676d2fb664698d74cc6a51ce6c484ce8c770f05d0108ec9090aeb46"
-SRC_URI[jiff-static-0.2.29.sha256sum] = "0666b5ab5ecaca213fc2a85b8c0083d9004e84ee2d5f9a7e0017aaf50986f25f"
-SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
+SRC_URI[jiff-0.2.38.sha256sum] = "b2b005715dcbeb0089a3c0dab99f2ff1cc3b2525323552703d648585d342a383"
+SRC_URI[jiff-core-0.1.1.sha256sum] = "5e52fe76043ccecc9005d2305ebaadf7d7fc0cc89ca6baa10a94d6bc68c7128c"
+SRC_URI[jiff-static-0.2.38.sha256sum] = "2cc9817253cf7c7ee4684451bd327e88d6f3658014e54a29198625590650695c"
+SRC_URI[jiff-tzdb-0.1.9.sha256sum] = "fa8377070c6bae868759445e5a77f66d84f0b72f3a054bfb00e6d038b8282da7"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
-SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
-SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
+SRC_URI[libc-0.2.191.sha256sum] = "65cd87c9a6d60536580b316ad985726104730a5151c99845f2490428ef91240a"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
-SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
+SRC_URI[log-0.4.34.sha256sum] = "f9f8bd3e56ce4dfc153cf470fffbfa98c7620958b312ca5c3a4b8d5181fd13c6"
 SRC_URI[lscolors-0.21.0.sha256sum] = "d60e266dfb1426eb2d24792602e041131fdc0236bb7007abc0e589acafd60929"
-SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
+SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
 SRC_URI[nix-0.30.1.sha256sum] = "74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6"
 SRC_URI[nix-0.31.3.sha256sum] = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
-SRC_URI[normpath-1.5.1.sha256sum] = "b9985ef7269fa99f3b12437bb698381da2428743ab90f20393f399fa14cab21a"
+SRC_URI[normpath-1.5.2.sha256sum] = "b11ce00d2594068e8a27c9146fdc5cf9f3ac38eb42c7cd34d05fea618873ac9f"
 SRC_URI[nu-ansi-term-0.50.3.sha256sum] = "7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5"
-SRC_URI[objc2-0.6.4.sha256sum] = "3a12a8ed07aefc768292f076dc3ac8c48f3781c8f2d5851dd3d98950e8c5a89f"
+SRC_URI[objc2-0.6.5.sha256sum] = "08849bbd4767dfae9457696856ae1c84fe4e0281bbe4a7abff2d0e06fb7981f8"
 SRC_URI[objc2-encode-4.1.0.sha256sum] = "ef25abbcd74fb2609453eb695bd2f860d389e457f67dc17cafc8b8cbc89d0c33"
-SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
-SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
-SRC_URI[portable-atomic-util-0.2.5.sha256sum] = "7a9db96d7fa8782dd8c15ce32ffe8680bbd1e978a43bf51a34d39483540495f5"
-SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
-SRC_URI[proc-macro-error-attr2-2.0.0.sha256sum] = "96de42df36bb9bba5542fe9f1a054b8cc87e172759a1868aa05c1f3acc89dfc5"
-SRC_URI[proc-macro-error2-2.0.1.sha256sum] = "11ec05c52be0a07b08061f7dd003e7d7092e0472bc731b4af7bb1ef876109802"
-SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
+SRC_URI[portable-atomic-1.15.0.sha256sum] = "05c8b63e8d9609db387f0324918f81d68fe27748f084ef092fb35954d0539a85"
+SRC_URI[portable-atomic-util-0.2.8.sha256sum] = "10ab3eb7f3becc3a1cbc4f2c6f20267996cfc1a6467a873763411b136a122715"
+SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
+SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
-SRC_URI[regex-1.12.4.sha256sum] = "f1292b7759ae1cb9ec195452d1390a074f0cd8541ab7a5a8c31cd6db45d4a6ba"
-SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
+SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
+SRC_URI[regex-automata-0.4.18.sha256sum] = "ad8553b9b26413251cbf30e620595c7a41b3887f03da04579c0e6b0d6a06b4b2"
 SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
-SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
+SRC_URI[rustix-1.1.6.sha256sum] = "e5e76742e5294153d4dde1207dbec5bdd81eef6fabdc0d2118babadabfd858aa"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
-SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
-SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
-SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
-SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
-SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
-SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
+SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
+SRC_URI[shlex-2.0.1.sha256sum] = "f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
+SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
+SRC_URI[syn-3.0.9.sha256sum] = "d78c8dee4c7bf0e14673097256fed6142ce9d3b85a408189d07482442145823b"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
-SRC_URI[terminal_size-0.4.3.sha256sum] = "60b8cb979cb11c32ce1603f8137b22262a9d131aaa5c37b5678025f22b8becd0"
-SRC_URI[test-case-3.3.1.sha256sum] = "eb2550dd13afcd286853192af8601920d959b14c401fcece38071d53bf0768a8"
-SRC_URI[test-case-core-3.3.1.sha256sum] = "adcb7fd841cd518e279be3d5a3eb0636409487998a4aff22f3de87b81e88384f"
-SRC_URI[test-case-macros-3.3.1.sha256sum] = "5c89e72a01ed4c579669add59014b9a524d609c0c88c6a585ce37485879f6ffb"
-SRC_URI[thiserror-2.0.18.sha256sum] = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
-SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
+SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
+SRC_URI[test-case-3.4.0.sha256sum] = "124953e7f67cb0b2fcfb87e899e4ae5a64fb68e2e160767933cc67b646fb0042"
+SRC_URI[test-case-core-3.4.0.sha256sum] = "bd097615b407247e102046ba34426bb594923ab3554cf0f3cdfed050f1a5a3e8"
+SRC_URI[test-case-macros-3.4.0.sha256sum] = "f4ce35ece947bccac166e1ded639133827a953f69a48ba134d17f91108333082"
+SRC_URI[thiserror-2.0.21.sha256sum] = "09e52cb86a36cede5cb101bf8908837b3e4c6e5e59fe7fd85c23fb56200d189e"
+SRC_URI[thiserror-impl-2.0.21.sha256sum] = "fe5197923287db20a58125f0bc85c062f7f2c892de97b18c356f9efb14b28524"
 SRC_URI[tikv-jemalloc-sys-0.7.1+5.3.1-0-g81034ce1f1373e37dc865038e1bc8eeecf559ce8.sha256sum] = "1a2825c78386b4ae0314074867860ba9577875de945f05992c38815cbec327f0"
 SRC_URI[tikv-jemallocator-0.7.0.sha256sum] = "249f09e49ab1609436f34c776e84231bead18d6a955f119f939bdc1d847561bd"
-SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
-SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
+SRC_URI[unicode-ident-1.0.27.sha256sum] = "a2c754d6c33795a1c324727428e5a7dedb5b06195f9890bdbcba760d3e246563"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
-SRC_URI[wasip2-1.0.2+wasi-0.2.9.sha256sum] = "9517f9239f02c069db75e65f174b3da828fe5f5b945c4dd26bd25d89c03ebcf5"
-SRC_URI[wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06.sha256sum] = "5428f8bf88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
-SRC_URI[wasm-encoder-0.244.0.sha256sum] = "990065f2fe63003fe337b932cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319"
-SRC_URI[wasm-metadata-0.244.0.sha256sum] = "bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909"
-SRC_URI[wasmparser-0.244.0.sha256sum] = "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
 SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
-SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
-SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
-SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
-SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
-SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
-SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
-SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
-SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
-SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
-SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
-SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
-SRC_URI[wit-bindgen-core-0.51.0.sha256sum] = "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
-SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] = "b7c566e0f4b284dd6561c786d9cb0142da491f46a9fbed79ea69cdad5db17f21"
-SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] = "0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
-SRC_URI[wit-component-0.244.0.sha256sum] = "9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2"
-SRC_URI[wit-parser-0.244.0.sha256sum] = "ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736"
-SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
diff --git a/meta-oe/recipes-extended/fd-find/fd-find_10.5.0.bb b/meta-oe/recipes-extended/fd-find/fd-find_10.5.2.bb
similarity index 91%
rename from meta-oe/recipes-extended/fd-find/fd-find_10.5.0.bb
rename to meta-oe/recipes-extended/fd-find/fd-find_10.5.2.bb
index 134e5763aa..02f717376f 100644
--- a/meta-oe/recipes-extended/fd-find/fd-find_10.5.0.bb
+++ b/meta-oe/recipes-extended/fd-find/fd-find_10.5.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "crate://crates.io/fd-find/${PV};name=fd-find"
-SRC_URI[fd-find.sha256sum] = "f35becce49c551724fd26d9824ec01d6578868cecbcc4e3d060658f9f8ad1e4d"
+SRC_URI[fd-find.sha256sum] = "f7e6acb754467c87dddb589ea068a0b07249da8b99231fec1c329419c9cfc72e"
 S = "${CARGO_VENDORING_DIRECTORY}/fd-find-${PV}"
 
 inherit cargo cargo-update-recipe-crates
