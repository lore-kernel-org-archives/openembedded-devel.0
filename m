Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3889.1794729069694704325
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Z8v4Sxko;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37071c0f42aso3571353eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729069; x=1795333869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unc0mBCr4Au3lBlBKPQuZ5YDi3nrDHWFE++uxuOrQ0c=;
        b=Z8v4Sxkot35JoWo8cA0OA/iIIeXW15fSjAFNZaLfiJhr746HX2umsSdehMyqZR8jBn
         0ntIHW+vXnXwmgrYH00GYFII51ed3KSgQHhLFWOqU8qVBVMeYcGyPkZYeH2Bu5FNIMyH
         N2qBvF8+y8tcJvEOGAnQ+xTiTC2e3UqNi4ZupHDgt4qwmEN8nNc1dFyyN1aBRRZjf62D
         s0EqLY2bFkwNJWjr2P1L5FxSJQDfAjhjSU0CHZuhQ1PxDJ0VuodIp75FS3CQVkkF60e/
         Y5aSgiZ4gt1214PzT4NPQ0eg6g2dPNbTno+OpbTwF80EyMH41W1iyF0Y3NjgN2eOHF8Y
         V3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729069; x=1795333869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unc0mBCr4Au3lBlBKPQuZ5YDi3nrDHWFE++uxuOrQ0c=;
        b=I/v2fTydoz5tJz2Jc+j2otfsUxLsw+aatvQME11U+H9usx6bzUZjNxuNgO6Vo9Vjxb
         eUU4680IMraJF08Ip5OPVOJvinb2aYwSAexOgk47RZ7o9gXG7YXxCrk4v/4cjMVuma7X
         RM4A0LYSG6O7/iUh61kr7oiocrFtjLhbxDQipFKBgGO5G39gtc0xENHie1v0RPBNzokj
         vY5JgbykrRws9Vq6MtbV1cR6UPDSv4AiYDaAeyDOU4n6XB9zLMLugx1Z1e3zXbS86Dnd
         mFgxpQzka1o5HZ/sUoMuzsngcacus09i2fniUQcfkYJ77rg1Mdjx6ZLX0ApDDW86q7gb
         /lXg==
X-Gm-Message-State: APuU4Z8z3eDuTtEZnMvmcXMwtyEszNV6SAr102ocWw2l/pnT4wbBZD4k
	Nts9sjBvgJ5xFP3LrNf1WZHgclEPQMm9DbDW8flC8AlGNK8tH5l6pqQdOAGBSxr4
X-Gm-Gg: AYBFou3Qkv2AbeLeZTTBBdCbSSFQnEURa6Q18HhQUm8XEZxu/Ddy4LP6P+w3ncFoSVY
	9lsUqpTpuPHXS0LP02siYlYL79x3hskYjCh5DcYGenPoBV6qcrlhOCR8gBxBSVEni7aoZ6k/jzq
	HmuQnjQUZIykQjvsrfD0gFt0CLT8el2atQtU4OD2MUmR4ZxP3PW9mdqNWDmVhuLJdzNJH7f9nrE
	idRbvkzL/3yhQLDpjuzWR2vEctrUt597N+yfWIHXmCl7X0VECtG+xmI1ztGP97Dwwmdoehb4nJZ
	fuzW/89KPT03LeiRCKMXAgj4e6M2N6zS7r5xQta0oiLgRWtZ0H0chK9E62Qb1+htL8k+0p7F/SK
	E9TnYf0NacnQPchI8uGF2m/qk/iI9lxHVvvCrGEnSwZKGo/ADUE+vM9bPYEe6mfm3S9p+4o0/ba
	CTVCfumLX++IC8mkZoLNYo1+1uhD4SFvAMr7/Duy+3J12WifgDD+9a0mQd93c/kVhXfEc/cYBxQ
	uKoHPvWe0zJtz1kemQKdmrzS4K/cV9VrIXnUqx2O44hfG95yF9PsmuxC4I8VkA0B3K6uyEgpiAO
	tTJ7JN2sWERU+J2M54/pV2XmracT+TJVGWgZwF+GRER2Dc96zN8cRUJYVY46Hionvyc2J4L6fi/
	2gEBrpfjP65JnKnYyDvr1hfOKK/8xhy0xt9YcI6sDuMUfDiRl89V5S6MhhO/TJdqPjtz86KvAvc
	kgMsUjHoTTbaHPUOAZovFFsmtnL5jTPcKAOx9cz3GDFEVA53IlbeHnEqJrbvTymEIc+He473doj
	ruNOiv8Hf2YKjR+0h3xKdebaMk00FqZYz4S9IxDhqwZcrBE1kpgt03ExRrzP6ByfV7kQUXv7w2p
	5PS8
X-Received: by 2002:a05:693c:4097:b0:372:7af9:b914 with SMTP id 5a478bee46e88-37967aeb603mr7227862eec.24.1794729068169;
        Sat, 14 Nov 2026 23:51:08 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 66/96] nushell: upgrade 0.116.1 -> 0.117.0
Date: Sat, 14 Nov 2026 23:48:44 -0800
Message-ID: <20261115074918.2932593-66-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132336
Content-Type: text/plain; charset="utf-8"

Regenerate the crates list and move the crate patches to the new
vendored crate versions (libc 0.2.189, rmcp 3.9.0, nu-command and
nu-dap 0.117.0), refreshing the nu-dap and Cargo.lock patches.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../nushell/nushell-crates.inc                | 354 ++++++++----------
 ...ble-atomic-for-64-bit-atomics-on-tar.patch |  16 +-
 ...dd-portable-atomic-to-patched-crates.patch |  16 +-
 ...{nushell_0.116.1.bb =3D> nushell_0.117.0.bb} |  10 +-
 4 files changed, 184 insertions(+), 212 deletions(-)
 rename meta-oe/recipes-extended/nushell/{nushell_0.116.1.bb =3D> nushell_0=
.117.0.bb} (82%)

diff --git a/meta-oe/recipes-extended/nushell/nushell-crates.inc b/meta-oe/=
recipes-extended/nushell/nushell-crates.inc
index 614ffff8d5..acb19cd80f 100644
--- a/meta-oe/recipes-extended/nushell/nushell-crates.inc
+++ b/meta-oe/recipes-extended/nushell/nushell-crates.inc
@@ -14,6 +14,7 @@ SRC_URI +=3D " \
     crate://crates.io/android_system_properties/0.1.5 \
     crate://crates.io/annotate-snippets/0.12.16 \
     crate://crates.io/ansi-str/0.9.0 \
+    crate://crates.io/ansiopt/0.4.0 \
     crate://crates.io/ansitok/0.3.0 \
     crate://crates.io/anstream/0.6.21 \
     crate://crates.io/anstyle/1.0.13 \
@@ -22,7 +23,7 @@ SRC_URI +=3D " \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.104 \
     crate://crates.io/approx/0.5.1 \
-    crate://crates.io/arboard/3.6.1 \
+    crate://crates.io/arboard/3.7.0 \
     crate://crates.io/arraydeque/0.5.1 \
     crate://crates.io/arrayref/0.3.9 \
     crate://crates.io/arrayvec/0.7.6 \
@@ -34,7 +35,6 @@ SRC_URI +=3D " \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backtrace/0.3.76 \
     crate://crates.io/backtrace-ext/0.2.1 \
-    crate://crates.io/base64/0.22.1 \
     crate://crates.io/base64/0.23.1 \
     crate://crates.io/base64ct/1.8.3 \
     crate://crates.io/better_default/1.0.5 \
@@ -51,8 +51,8 @@ SRC_URI +=3D " \
     crate://crates.io/block2/0.6.2 \
     crate://crates.io/borsh/1.6.1 \
     crate://crates.io/bracoxide/0.1.8 \
-    crate://crates.io/brotli/9.0.0 \
-    crate://crates.io/brotli-decompressor/6.0.0 \
+    crate://crates.io/brotli/9.1.1 \
+    crate://crates.io/brotli-decompressor/6.2.0 \
     crate://crates.io/bstr/1.13.1 \
     crate://crates.io/buf-trait/0.4.1 \
     crate://crates.io/bumpalo/3.20.2 \
@@ -64,23 +64,24 @@ SRC_URI +=3D " \
     crate://crates.io/bytes/1.12.1 \
     crate://crates.io/bytesize/2.7.0 \
     crate://crates.io/byteyarn/0.5.1 \
-    crate://crates.io/calamine/0.36.1 \
+    crate://crates.io/calamine/0.38.0 \
     crate://crates.io/castaway/0.2.4 \
     crate://crates.io/cc/1.2.56 \
     crate://crates.io/cexpr/0.6.0 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/cfg_aliases/0.2.1 \
-    crate://crates.io/chacha20/0.10.0 \
+    crate://crates.io/chacha20/0.10.2 \
     crate://crates.io/chardetng/1.0.0 \
     crate://crates.io/chrono/0.4.45 \
     crate://crates.io/chrono-humanize/0.2.3 \
     crate://crates.io/chrono-tz/0.10.4 \
+    crate://crates.io/chrono-tz-build/0.5.0 \
     crate://crates.io/clang-sys/1.8.1 \
     crate://crates.io/clap/4.5.60 \
     crate://crates.io/clap_builder/4.5.60 \
     crate://crates.io/clap_derive/4.5.55 \
     crate://crates.io/clap_lex/1.0.0 \
-    crate://crates.io/clipboard-win/5.4.1 \
+    crate://crates.io/clipboard-win/5.4.3 \
     crate://crates.io/codepage/0.1.2 \
     crate://crates.io/colorchoice/1.0.4 \
     crate://crates.io/colored/2.2.0 \
@@ -124,7 +125,7 @@ SRC_URI +=3D " \
     crate://crates.io/darling_macro/0.24.1 \
     crate://crates.io/data-encoding/2.11.0 \
     crate://crates.io/debug_unsafe/0.1.4 \
-    crate://crates.io/der/0.8.0 \
+    crate://crates.io/der/0.8.2 \
     crate://crates.io/deranged/0.5.8 \
     crate://crates.io/derive_more/2.1.1 \
     crate://crates.io/derive_more-impl/2.1.1 \
@@ -145,7 +146,6 @@ SRC_URI +=3D " \
     crate://crates.io/document-features/0.2.12 \
     crate://crates.io/downcast-rs/1.2.1 \
     crate://crates.io/doxygen-rs/0.4.2 \
-    crate://crates.io/dtparse/2.0.1 \
     crate://crates.io/dunce/1.0.5 \
     crate://crates.io/dyn-clone/1.0.20 \
     crate://crates.io/edit/0.1.5 \
@@ -160,10 +160,9 @@ SRC_URI +=3D " \
     crate://crates.io/erased-serde/0.4.10 \
     crate://crates.io/errno/0.3.14 \
     crate://crates.io/error-code/3.3.2 \
-    crate://crates.io/etcetera/0.10.0 \
     crate://crates.io/fallible-iterator/0.3.0 \
     crate://crates.io/fallible-streaming-iterator/0.1.9 \
-    crate://crates.io/fancy-regex/0.19.0 \
+    crate://crates.io/fancy-regex/0.20.0 \
     crate://crates.io/fast-float2/0.2.3 \
     crate://crates.io/fastrand/2.3.0 \
     crate://crates.io/fax/0.2.6 \
@@ -213,7 +212,7 @@ SRC_URI +=3D " \
     crate://crates.io/glob/0.3.3 \
     crate://crates.io/glob-match/0.2.1 \
     crate://crates.io/globset/0.4.19 \
-    crate://crates.io/granit-parser/1.3.0 \
+    crate://crates.io/granit-parser/2.0.0 \
     crate://crates.io/h2/0.4.18 \
     crate://crates.io/half/2.7.1 \
     crate://crates.io/hashbrown/0.15.5 \
@@ -236,8 +235,6 @@ SRC_URI +=3D " \
     crate://crates.io/humantime/2.4.0 \
     crate://crates.io/hybrid-array/0.4.13 \
     crate://crates.io/hyper/1.8.1 \
-    crate://crates.io/hyper-rustls/0.27.7 \
-    crate://crates.io/hyper-tls/0.6.0 \
     crate://crates.io/hyper-util/0.1.20 \
     crate://crates.io/iana-time-zone/0.1.65 \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
@@ -264,8 +261,6 @@ SRC_URI +=3D " \
     crate://crates.io/intl-memoizer/0.5.3 \
     crate://crates.io/intl_pluralrules/7.0.2 \
     crate://crates.io/inventory/0.3.22 \
-    crate://crates.io/ipnet/2.12.0 \
-    crate://crates.io/iri-string/0.7.10 \
     crate://crates.io/is-docker/0.2.0 \
     crate://crates.io/is-wsl/0.4.0 \
     crate://crates.io/is_ci/1.2.0 \
@@ -275,7 +270,7 @@ SRC_URI +=3D " \
     crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itertools/0.15.0 \
-    crate://crates.io/itoa/1.0.17 \
+    crate://crates.io/itoa/1.0.18 \
     crate://crates.io/jiff/0.2.23 \
     crate://crates.io/jiff-static/0.2.23 \
     crate://crates.io/jiff-tzdb/0.1.6 \
@@ -293,17 +288,17 @@ SRC_URI +=3D " \
     crate://crates.io/kqueue/1.1.1 \
     crate://crates.io/kqueue-sys/1.0.4 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/lean_string/0.7.0 \
+    crate://crates.io/lean_string/0.8.0 \
     crate://crates.io/leb128fmt/0.1.0 \
     crate://crates.io/lexopt/0.3.2 \
-    crate://crates.io/libc/0.2.186 \
+    crate://crates.io/libc/0.2.189 \
     crate://crates.io/libgit2-sys/0.18.7+1.9.6 \
     crate://crates.io/libloading/0.8.9 \
     crate://crates.io/libm/0.2.16 \
     crate://crates.io/libproc/0.14.11 \
     crate://crates.io/libredox/0.1.14 \
-    crate://crates.io/libsqlite3-sys/0.38.2 \
-    crate://crates.io/libz-sys/1.1.25 \
+    crate://crates.io/libsqlite3-sys/0.39.1 \
+    crate://crates.io/libz-sys/1.1.31 \
     crate://crates.io/line-clipping/0.3.5 \
     crate://crates.io/linked-hash-map/0.5.6 \
     crate://crates.io/linux-raw-sys/0.4.15 \
@@ -313,21 +308,20 @@ SRC_URI +=3D " \
     crate://crates.io/lmdb-master-sys/0.2.6 \
     crate://crates.io/lock_api/0.4.14 \
     crate://crates.io/log/0.4.34 \
-    crate://crates.io/lru/0.18.3 \
-    crate://crates.io/lru-slab/0.1.2 \
+    crate://crates.io/lru/0.18.5 \
+    crate://crates.io/lru/0.19.0 \
     crate://crates.io/lscolors/0.21.0 \
     crate://crates.io/lsp-server/0.10.0 \
     crate://crates.io/lsp-textdocument/0.5.0 \
     crate://crates.io/lsp-types/0.97.0 \
     crate://crates.io/mach2/0.7.0 \
-    crate://crates.io/markdown/1.0.0 \
     crate://crates.io/matchers/0.2.0 \
     crate://crates.io/matrixmultiply/0.3.10 \
     crate://crates.io/md-5/0.10.6 \
     crate://crates.io/md-5/0.11.0 \
     crate://crates.io/mediatype/0.21.0 \
     crate://crates.io/memchr/2.8.3 \
-    crate://crates.io/memmap2/0.9.10 \
+    crate://crates.io/memmap2/0.9.11 \
     crate://crates.io/memoffset/0.6.5 \
     crate://crates.io/miette/5.10.0 \
     crate://crates.io/miette/7.6.0 \
@@ -339,7 +333,7 @@ SRC_URI +=3D " \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mio/1.2.0 \
     crate://crates.io/moxcms/0.8.1 \
-    crate://crates.io/mq-markdown/0.9.2 \
+    crate://crates.io/mq-markdown/0.10.0 \
     crate://crates.io/multipart-rs/0.2.3 \
     crate://crates.io/native-tls/0.2.18 \
     crate://crates.io/ndarray/0.17.2 \
@@ -355,37 +349,37 @@ SRC_URI +=3D " \
     crate://crates.io/notify-types/2.1.0 \
     crate://crates.io/ntapi/0.4.3 \
     crate://crates.io/nu-ansi-term/0.50.3 \
-    crate://crates.io/nu-cli/0.116.1 \
-    crate://crates.io/nu-cmd-base/0.116.1 \
-    crate://crates.io/nu-cmd-extra/0.116.1 \
-    crate://crates.io/nu-cmd-lang/0.116.1 \
-    crate://crates.io/nu-cmd-plugin/0.116.1 \
-    crate://crates.io/nu-color-config/0.116.1 \
-    crate://crates.io/nu-command/0.116.1 \
-    crate://crates.io/nu-config/0.116.1 \
-    crate://crates.io/nu-dap/0.116.1 \
-    crate://crates.io/nu-derive-value/0.116.1 \
-    crate://crates.io/nu-engine/0.116.1 \
-    crate://crates.io/nu-experimental/0.116.1 \
-    crate://crates.io/nu-explore/0.116.1 \
-    crate://crates.io/nu-glob/0.116.1 \
-    crate://crates.io/nu-heavy-utils/0.116.1 \
-    crate://crates.io/nu-json/0.116.1 \
-    crate://crates.io/nu-lsp/0.116.1 \
-    crate://crates.io/nu-mcp/0.116.1 \
-    crate://crates.io/nu-parser/0.116.1 \
-    crate://crates.io/nu-path/0.116.1 \
-    crate://crates.io/nu-plugin-core/0.116.1 \
-    crate://crates.io/nu-plugin-engine/0.116.1 \
-    crate://crates.io/nu-plugin-protocol/0.116.1 \
-    crate://crates.io/nu-pretty-hex/0.116.1 \
-    crate://crates.io/nu-protocol/0.116.1 \
-    crate://crates.io/nu-std/0.116.1 \
-    crate://crates.io/nu-system/0.116.1 \
-    crate://crates.io/nu-table/0.116.1 \
-    crate://crates.io/nu-term-grid/0.116.1 \
-    crate://crates.io/nu-tui/0.116.1 \
-    crate://crates.io/nu-utils/0.116.1 \
+    crate://crates.io/nu-cli/0.117.0 \
+    crate://crates.io/nu-cmd-base/0.117.0 \
+    crate://crates.io/nu-cmd-extra/0.117.0 \
+    crate://crates.io/nu-cmd-lang/0.117.0 \
+    crate://crates.io/nu-cmd-plugin/0.117.0 \
+    crate://crates.io/nu-color-config/0.117.0 \
+    crate://crates.io/nu-command/0.117.0 \
+    crate://crates.io/nu-config/0.117.0 \
+    crate://crates.io/nu-dap/0.117.0 \
+    crate://crates.io/nu-derive-value/0.117.0 \
+    crate://crates.io/nu-engine/0.117.0 \
+    crate://crates.io/nu-experimental/0.117.0 \
+    crate://crates.io/nu-explore/0.117.0 \
+    crate://crates.io/nu-glob/0.117.0 \
+    crate://crates.io/nu-heavy-utils/0.117.0 \
+    crate://crates.io/nu-json/0.117.0 \
+    crate://crates.io/nu-lsp/0.117.0 \
+    crate://crates.io/nu-mcp/0.117.0 \
+    crate://crates.io/nu-parser/0.117.0 \
+    crate://crates.io/nu-path/0.117.0 \
+    crate://crates.io/nu-plugin-core/0.117.0 \
+    crate://crates.io/nu-plugin-engine/0.117.0 \
+    crate://crates.io/nu-plugin-protocol/0.117.0 \
+    crate://crates.io/nu-pretty-hex/0.117.0 \
+    crate://crates.io/nu-protocol/0.117.0 \
+    crate://crates.io/nu-std/0.117.0 \
+    crate://crates.io/nu-system/0.117.0 \
+    crate://crates.io/nu-table/0.117.0 \
+    crate://crates.io/nu-term-grid/0.117.0 \
+    crate://crates.io/nu-tui/0.117.0 \
+    crate://crates.io/nu-utils/0.117.0 \
     crate://crates.io/nucleo-matcher/0.3.1 \
     crate://crates.io/num-bigint/0.4.8 \
     crate://crates.io/num-complex/0.4.6 \
@@ -395,7 +389,7 @@ SRC_URI +=3D " \
     crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/num_cpus/1.17.0 \
     crate://crates.io/num_threads/0.1.7 \
-    crate://crates.io/nuon/0.116.1 \
+    crate://crates.io/nuon/0.117.0 \
     crate://crates.io/objc2/0.6.4 \
     crate://crates.io/objc2-app-kit/0.3.2 \
     crate://crates.io/objc2-core-foundation/0.3.2 \
@@ -428,6 +422,7 @@ SRC_URI +=3D " \
     crate://crates.io/papergrid/0.18.0 \
     crate://crates.io/parking_lot/0.12.5 \
     crate://crates.io/parking_lot_core/0.9.12 \
+    crate://crates.io/parse-zoneinfo/0.4.1 \
     crate://crates.io/parse_datetime/0.16.0 \
     crate://crates.io/pastey/0.2.3 \
     crate://crates.io/pathdiff/0.2.3 \
@@ -442,8 +437,11 @@ SRC_URI +=3D " \
     crate://crates.io/petgraph/0.8.3 \
     crate://crates.io/phf/0.11.3 \
     crate://crates.io/phf/0.12.1 \
+    crate://crates.io/phf_codegen/0.12.1 \
     crate://crates.io/phf_generator/0.11.3 \
+    crate://crates.io/phf_generator/0.12.1 \
     crate://crates.io/phf_macros/0.11.3 \
+    crate://crates.io/phf_macros/0.12.1 \
     crate://crates.io/phf_shared/0.11.3 \
     crate://crates.io/phf_shared/0.12.1 \
     crate://crates.io/pin-project-lite/0.2.17 \
@@ -473,16 +471,12 @@ SRC_URI +=3D " \
     crate://crates.io/pxfm/0.1.28 \
     crate://crates.io/quick-error/2.0.1 \
     crate://crates.io/quick-xml/0.39.4 \
-    crate://crates.io/quick-xml/0.41.0 \
     crate://crates.io/quick-xml/0.42.0 \
-    crate://crates.io/quinn/0.11.9 \
-    crate://crates.io/quinn-proto/0.11.15 \
-    crate://crates.io/quinn-udp/0.5.14 \
     crate://crates.io/quote/1.0.47 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
-    crate://crates.io/rand/0.8.5 \
-    crate://crates.io/rand/0.9.2 \
+    crate://crates.io/rand/0.8.8 \
+    crate://crates.io/rand/0.9.5 \
     crate://crates.io/rand/0.10.2 \
     crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_chacha/0.9.0 \
@@ -501,36 +495,34 @@ SRC_URI +=3D " \
     crate://crates.io/redox_syscall/0.5.18 \
     crate://crates.io/redox_users/0.4.6 \
     crate://crates.io/redox_users/0.5.2 \
-    crate://crates.io/reedline/0.52.1 \
+    crate://crates.io/reedline/0.53.0 \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
     crate://crates.io/regex/1.13.1 \
     crate://crates.io/regex-automata/0.4.16 \
     crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/relative-path/1.9.3 \
-    crate://crates.io/reqwest/0.12.28 \
     crate://crates.io/ring/0.17.14 \
-    crate://crates.io/rmcp/3.4.0 \
-    crate://crates.io/rmcp-macros/3.4.0 \
+    crate://crates.io/rmcp/3.9.0 \
+    crate://crates.io/rmcp-macros/3.9.0 \
     crate://crates.io/rmp/0.8.15 \
     crate://crates.io/rmp-serde/1.3.1 \
     crate://crates.io/roxmltree/0.21.1 \
     crate://crates.io/rsqlite-vfs/0.1.1 \
-    crate://crates.io/rstest/0.27.0 \
-    crate://crates.io/rstest_macros/0.27.0 \
-    crate://crates.io/rusqlite/0.40.2 \
-    crate://crates.io/rust_decimal/1.40.0 \
+    crate://crates.io/rstest/0.28.0 \
+    crate://crates.io/rstest_macros/0.28.0 \
+    crate://crates.io/rusqlite/0.41.1 \
     crate://crates.io/rustc-demangle/0.1.27 \
     crate://crates.io/rustc-hash/2.1.2 \
     crate://crates.io/rustc_version/0.4.1 \
     crate://crates.io/rustix/0.38.44 \
     crate://crates.io/rustix/1.1.4 \
-    crate://crates.io/rustls/0.23.45 \
+    crate://crates.io/rustls/0.23.46 \
     crate://crates.io/rustls-native-certs/0.8.4 \
     crate://crates.io/rustls-pki-types/1.14.0 \
     crate://crates.io/rustls-platform-verifier/0.7.0 \
     crate://crates.io/rustls-platform-verifier-android/0.1.1 \
-    crate://crates.io/rustls-webpki/0.103.15 \
+    crate://crates.io/rustls-webpki/0.103.16 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ryu/1.0.23 \
     crate://crates.io/same-file/1.0.6 \
@@ -543,7 +535,7 @@ SRC_URI +=3D " \
     crate://crates.io/self_cell/1.2.2 \
     crate://crates.io/semver/1.0.28 \
     crate://crates.io/serde/1.0.229 \
-    crate://crates.io/serde-saphyr/1.3.0 \
+    crate://crates.io/serde-saphyr/2.0.0 \
     crate://crates.io/serde_core/1.0.229 \
     crate://crates.io/serde_derive/1.0.229 \
     crate://crates.io/serde_derive_internals/0.29.1 \
@@ -587,13 +579,12 @@ SRC_URI +=3D " \
     crate://crates.io/syn/1.0.109 \
     crate://crates.io/syn/2.0.117 \
     crate://crates.io/syn/3.0.4 \
-    crate://crates.io/sync_wrapper/1.0.2 \
     crate://crates.io/synchronoise/1.0.1 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/sys-locale/0.3.2 \
     crate://crates.io/sysinfo/0.39.6 \
     crate://crates.io/tabled/0.22.0 \
-    crate://crates.io/tango-bench/0.8.0 \
+    crate://crates.io/tango-bench/0.9.0 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/termcolor/1.4.1 \
     crate://crates.io/terminal_size/0.4.3 \
@@ -611,13 +602,8 @@ SRC_URI +=3D " \
     crate://crates.io/time-core/0.1.9 \
     crate://crates.io/time-macros/0.2.32 \
     crate://crates.io/tinystr/0.8.2 \
-    crate://crates.io/tinyvec/1.10.0 \
-    crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/titlecase/3.6.0 \
-    crate://crates.io/tokio/1.53.1 \
+    crate://crates.io/tokio/1.54.1 \
     crate://crates.io/tokio-macros/2.7.0 \
-    crate://crates.io/tokio-native-tls/0.3.1 \
-    crate://crates.io/tokio-rustls/0.26.4 \
     crate://crates.io/tokio-stream/0.1.18 \
     crate://crates.io/tokio-util/0.7.18 \
     crate://crates.io/toml/1.1.4+spec-1.1.0 \
@@ -625,9 +611,6 @@ SRC_URI +=3D " \
     crate://crates.io/toml_edit/0.25.13+spec-1.1.0 \
     crate://crates.io/toml_parser/1.1.3+spec-1.1.0 \
     crate://crates.io/toml_writer/1.1.2+spec-1.1.0 \
-    crate://crates.io/tower/0.5.3 \
-    crate://crates.io/tower-http/0.6.8 \
-    crate://crates.io/tower-layer/0.3.3 \
     crate://crates.io/tower-service/0.3.3 \
     crate://crates.io/tracing/0.1.44 \
     crate://crates.io/tracing-appender/0.2.5 \
@@ -637,19 +620,19 @@ SRC_URI +=3D " \
     crate://crates.io/tracing-subscriber/0.3.22 \
     crate://crates.io/trash/5.2.9 \
     crate://crates.io/tree_magic_mini/3.2.2 \
-    crate://crates.io/try-lock/0.2.5 \
     crate://crates.io/tui-tree-widget/0.24.0 \
     crate://crates.io/type-map/0.5.1 \
-    crate://crates.io/typed-path/0.12.3 \
+    crate://crates.io/typed-path/0.13.0 \
     crate://crates.io/typeid/1.0.3 \
     crate://crates.io/typenum/1.20.1 \
     crate://crates.io/typetag/0.2.21 \
     crate://crates.io/typetag-impl/0.2.21 \
     crate://crates.io/ucd-trie/0.1.7 \
     crate://crates.io/umask/2.1.0 \
+    crate://crates.io/uncased/0.9.10 \
     crate://crates.io/unic-langid/0.9.6 \
     crate://crates.io/unic-langid-impl/0.9.6 \
-    crate://crates.io/unicase/2.9.0 \
+    crate://crates.io/unicase/2.10.0 \
     crate://crates.io/unicode-id/0.3.6 \
     crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/unicode-linebreak/0.1.5 \
@@ -660,7 +643,6 @@ SRC_URI +=3D " \
     crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/unit-prefix/0.5.2 \
     crate://crates.io/untrusted/0.9.0 \
-    crate://crates.io/update-informer/1.3.0 \
     crate://crates.io/ureq/3.4.0 \
     crate://crates.io/ureq-proto/0.6.1 \
     crate://crates.io/url/2.5.8 \
@@ -677,21 +659,21 @@ SRC_URI +=3D " \
     crate://crates.io/uu_whoami/0.12.0 \
     crate://crates.io/uucore/0.12.0 \
     crate://crates.io/uucore_procs/0.12.0 \
-    crate://crates.io/uuid/1.26.0 \
+    crate://crates.io/uuid/1.29.0 \
     crate://crates.io/v_escape-base/0.1.0 \
     crate://crates.io/v_htmlescape/0.17.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/vcpkg/0.2.15 \
     crate://crates.io/version_check/0.9.5 \
+    crate://crates.io/vt100/0.18.1 \
     crate://crates.io/vte/0.14.1 \
+    crate://crates.io/vte/0.15.0 \
     crate://crates.io/wait-timeout/0.2.1 \
     crate://crates.io/walkdir/2.5.0 \
-    crate://crates.io/want/0.3.1 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
     crate://crates.io/wasip2/1.0.2+wasi-0.2.9 \
     crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 \
     crate://crates.io/wasm-bindgen/0.2.114 \
-    crate://crates.io/wasm-bindgen-futures/0.4.64 \
     crate://crates.io/wasm-bindgen-macro/0.2.114 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.114 \
     crate://crates.io/wasm-bindgen-shared/0.2.114 \
@@ -705,10 +687,9 @@ SRC_URI +=3D " \
     crate://crates.io/wayland-protocols-wlr/0.3.11 \
     crate://crates.io/wayland-scanner/0.31.9 \
     crate://crates.io/wayland-sys/0.31.10 \
-    crate://crates.io/web-sys/0.3.91 \
     crate://crates.io/web-time/1.1.0 \
-    crate://crates.io/webpki-root-certs/1.0.6 \
-    crate://crates.io/webpki-roots/1.0.9 \
+    crate://crates.io/webpki-root-certs/1.0.10 \
+    crate://crates.io/webpki-roots/1.0.10 \
     crate://crates.io/weezl/0.1.12 \
     crate://crates.io/which/4.4.2 \
     crate://crates.io/which/8.0.6 \
@@ -783,7 +764,7 @@ SRC_URI +=3D " \
     crate://crates.io/x11rb/0.13.2 \
     crate://crates.io/x11rb-protocol/0.13.2 \
     crate://crates.io/xattr/1.6.1 \
-    crate://crates.io/xxhash-rust/0.8.15 \
+    crate://crates.io/xxhash-rust/0.8.19 \
     crate://crates.io/yansi/1.0.1 \
     crate://crates.io/yoke/0.8.1 \
     crate://crates.io/yoke-derive/0.8.1 \
@@ -797,7 +778,7 @@ SRC_URI +=3D " \
     crate://crates.io/zerotrie/0.2.3 \
     crate://crates.io/zerovec/0.11.5 \
     crate://crates.io/zerovec-derive/0.11.2 \
-    crate://crates.io/zip/8.6.0 \
+    crate://crates.io/zip/9.1.3 \
     crate://crates.io/zlib-rs/0.6.3 \
     crate://crates.io/zmij/1.0.21 \
     crate://crates.io/zopfli/0.8.3 \
@@ -817,6 +798,7 @@ SRC_URI[alphanumeric-sort-1.5.8.sha256sum] =3D "a97de3a=
d85c4425a2c267a5e91adbe49f9
 SRC_URI[android_system_properties-0.1.5.sha256sum] =3D "819e7219dbd41043ac=
279b19830f2efc897156490d7fd6ea916720117ee66311"
 SRC_URI[annotate-snippets-0.12.16.sha256sum] =3D "f211a51805bc641f3ad5b766=
4c77d2547af685cc33b4cd8d31964027a46f13f1"
 SRC_URI[ansi-str-0.9.0.sha256sum] =3D "060de1453b69f46304b28274f382132f4e7=
2c55637cf362920926a70d090890d"
+SRC_URI[ansiopt-0.4.0.sha256sum] =3D "5035af3f4e13856c6373940c4c58b4d362ca=
80359963dfc1daec3b6e9cf0f588"
 SRC_URI[ansitok-0.3.0.sha256sum] =3D "c0a8acea8c2f1c60f0a92a8cd26bf96ca97d=
b56f10bbcab238bbe0cceba659ee"
 SRC_URI[anstream-0.6.21.sha256sum] =3D "43d5b281e737544384e969a5ccad3f1cdd=
24b48086a0fc1b2a5262a26b8f4f4a"
 SRC_URI[anstyle-1.0.13.sha256sum] =3D "5192cca8006f1fd4f7237516f40fa183bb0=
7f8fbdfedaa0036de5ea9b0b45e78"
@@ -825,7 +807,7 @@ SRC_URI[anstyle-query-1.1.5.sha256sum] =3D "40c48f72fd5=
3cd289104fc64099abca73db416
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] =3D "291e6a250ff86cd4a820112fb889=
8808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.104.sha256sum] =3D "330a5ed07fa54e4702c9d6c4174f74427fc=
0ef6e214bbd677ae50a5099946470"
 SRC_URI[approx-0.5.1.sha256sum] =3D "cab112f0a86d568ea0e627cc1d6be74a1e9cd=
55214684db5561995f6dad897c6"
-SRC_URI[arboard-3.6.1.sha256sum] =3D "0348a1c054491f4bfe6ab86a7b6ab1e44e45=
d899005de92f58b3df180b36ddaf"
+SRC_URI[arboard-3.7.0.sha256sum] =3D "aeb9553e62312c8756a5979254fc6d7da8bb=
eb5986a1e17037fab932f7037917"
 SRC_URI[arraydeque-0.5.1.sha256sum] =3D "7d902e3d592a523def97af8f317b08ce1=
6b7ab854c1985a0c671e6f15cebc236"
 SRC_URI[arrayref-0.3.9.sha256sum] =3D "76a2e8124351fda1ef8aaaa3bbd7ebbcb48=
6bbcd4225aca0aa0d84bb2db8fecb"
 SRC_URI[arrayvec-0.7.6.sha256sum] =3D "7c02d123df017efcdfbd739ef81735b36c5=
ba83ec3c59c80a9d7ecc718f92e50"
@@ -837,7 +819,6 @@ SRC_URI[atomic-waker-1.1.2.sha256sum] =3D "1505bd5d3d11=
6872e7271a6d4e16d81d0c85708
 SRC_URI[autocfg-1.5.0.sha256sum] =3D "c08606f8c3cbf4ce6ec8e28fb0014a2c0867=
08fe954eaa885384a6165172e7e8"
 SRC_URI[backtrace-0.3.76.sha256sum] =3D "bb531853791a215d7c62a30daf0dde835=
f381ab5de4589cfe7c649d2cbe92bd6"
 SRC_URI[backtrace-ext-0.2.1.sha256sum] =3D "537beee3be4a18fb023b570f80e3ae=
28003db9167a751266b259926e25539d50"
-SRC_URI[base64-0.22.1.sha256sum] =3D "72b3254f16251a8381aa12e40e3c4d2f0199=
f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[base64-0.23.1.sha256sum] =3D "ac07cdecf99051d9a5238b80f35af32cdeba=
5b336e55d957b318b50137e18da5"
 SRC_URI[base64ct-1.8.3.sha256sum] =3D "2af50177e190e07a26ab74f8b1efbfe2ef8=
7da2116221318cb1c2e82baf7de06"
 SRC_URI[better_default-1.0.5.sha256sum] =3D "7b9a5040dce49a7642c97ccb1ae59=
567098967b5d52c29773f1299a42d23bb39"
@@ -854,8 +835,8 @@ SRC_URI[block-buffer-0.12.1.sha256sum] =3D "d2f6c7dbe95=
a6ed67ad9f18e57daf93a2f034c
 SRC_URI[block2-0.6.2.sha256sum] =3D "cdeb9d870516001442e364c5220d3574d2da8=
dc765554b4a617230d33fa58ef5"
 SRC_URI[borsh-1.6.1.sha256sum] =3D "cfd1e3f8955a5d7de9fab72fc8373fade9fb8a=
703968cb200ae3dc6cf08e185a"
 SRC_URI[bracoxide-0.1.8.sha256sum] =3D "daeb5b71668c934a1db0c7b07317a3564f=
2558c5e9155c70d7d6823c01f2ddcd"
-SRC_URI[brotli-9.0.0.sha256sum] =3D "f8b851b75c23ca7873623d612fe49bd1989ae=
b03d08fb9432187eb253d3d4c6b"
-SRC_URI[brotli-decompressor-6.0.0.sha256sum] =3D "46087801e40b785410c352be=
e60e9b6226312709cf52d5fff92776cdf5cf6490"
+SRC_URI[brotli-9.1.1.sha256sum] =3D "627b7cfb0578f0eafce087a90fcd40add1231=
900b69e4d4de2d456260a4f5d81"
+SRC_URI[brotli-decompressor-6.2.0.sha256sum] =3D "34c6783f42c21c952ad7112b=
354f0ba2f10760e9decea5b1b60523d6e270faaf"
 SRC_URI[bstr-1.13.1.sha256sum] =3D "6bb31b46c14244e20ee9984b11bf5c992b91fb=
6939fea616e3512c8baecdbe5f"
 SRC_URI[buf-trait-0.4.1.sha256sum] =3D "21eaafc770e8c073d6c3facafe7617e774=
305d4954aa6351b9c452eb37ee17b4"
 SRC_URI[bumpalo-3.20.2.sha256sum] =3D "5d20789868f4b01b2f2caec9f5c4e0213b4=
1e3e5702a50157d699ae31ced2fcb"
@@ -867,23 +848,24 @@ SRC_URI[byteorder-lite-0.1.0.sha256sum] =3D "8f1fe948=
ff07f4bd06c30984e69f5b4899c51
 SRC_URI[bytes-1.12.1.sha256sum] =3D "fc652a48c352aef3ea3aed32080501cf3ef6e=
d5da78602a020c991775b0aff04"
 SRC_URI[bytesize-2.7.0.sha256sum] =3D "7354288c522e7e980fafd2075d63d128579=
4c3a6a16cdd492f189ea406e5f18b"
 SRC_URI[byteyarn-0.5.1.sha256sum] =3D "b93e51d26468a15ea59f8525e0c13dc405d=
b43e644a0b1e6d44346c72cf4cf7b"
-SRC_URI[calamine-0.36.1.sha256sum] =3D "5fa68281b1a76b54a62156474adb06bb38=
0a67e07dd60656e3217152b42183f3"
+SRC_URI[calamine-0.38.0.sha256sum] =3D "f431b67cba6122a1f7d26b7adafc71bbdf=
07026095fe811f5efc025d8748e1d8"
 SRC_URI[castaway-0.2.4.sha256sum] =3D "dec551ab6e7578819132c713a93c022a05d=
60159dc86e7a7050223577484c55a"
 SRC_URI[cc-1.2.56.sha256sum] =3D "aebf35691d1bfb0ac386a69bac2fde4dd276fb61=
8cf8bf4f5318fe285e821bb2"
 SRC_URI[cexpr-0.6.0.sha256sum] =3D "6fac387a98bb7c37292057cffc56d62ecb6299=
00026402633ae9160df93a8766"
 SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef3511182572=
7b38d33286ef986142615121801"
 SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D "613afe47fcd5fac7ccf1db93babcb082=
c5994d996f20b8b159f2ad1658eb5724"
-SRC_URI[chacha20-0.10.0.sha256sum] =3D "6f8d983286843e49675a4b7a2d174efe13=
6dc93a18d69130dd18198a6c167601"
+SRC_URI[chacha20-0.10.2.sha256sum] =3D "65c35e4b699c7e15ccbe7ee35c005e4fc0=
a278d22238a2857e6ce2dadeda1b06"
 SRC_URI[chardetng-1.0.0.sha256sum] =3D "13de944a44b5064ee5d3a5ceccc49a41bf=
ec50f2580e66f82e87703acdb88b53"
 SRC_URI[chrono-0.4.45.sha256sum] =3D "1aa79e62e7697b8e29b513a68abacf485adc=
d1fe8284a4316c5ae868e6633327"
 SRC_URI[chrono-humanize-0.2.3.sha256sum] =3D "799627e6b4d27827a814e837b9d8=
a504832086081806d45b1afa34dc982b023b"
 SRC_URI[chrono-tz-0.10.4.sha256sum] =3D "a6139a8597ed92cf816dfb33f5dd6cf0b=
b93a6adc938f11039f371bc5bcd26c3"
+SRC_URI[chrono-tz-build-0.5.0.sha256sum] =3D "c7d8d1efd5109b9c1cd3b7966bd0=
71cdfb53bb6eb0b22a473a68c2f70a11a1eb"
 SRC_URI[clang-sys-1.8.1.sha256sum] =3D "0b023947811758c97c59bf9d1c188fd619=
ad4718dcaa767947df1cadb14f39f4"
 SRC_URI[clap-4.5.60.sha256sum] =3D "2797f34da339ce31042b27d23607e051786132=
987f595b02ba4f6a6dffb7030a"
 SRC_URI[clap_builder-4.5.60.sha256sum] =3D "24a241312cea5059b13574bb9b3861=
cabf758b879c15190b37b6d6fd63ab6876"
 SRC_URI[clap_derive-4.5.55.sha256sum] =3D "a92793da1a46a5f2a02a6f4c46c6496=
b28c43638adea8306fcb0caa1634f24e5"
 SRC_URI[clap_lex-1.0.0.sha256sum] =3D "3a822ea5bc7590f9d40f1ba12c0dc3c2760=
f3482c6984db1573ad11031420831"
-SRC_URI[clipboard-win-5.4.1.sha256sum] =3D "bde03770d3df201d4fb868f2c9c59e=
66a3e4e2bd06692a0fe701e7103c7e84d4"
+SRC_URI[clipboard-win-5.4.3.sha256sum] =3D "052af7878466feccda12ba7a6a67d0=
19d712f296809559b47c12c8cc196d3a9a"
 SRC_URI[codepage-0.1.2.sha256sum] =3D "48f68d061bc2828ae826206326e61251aca=
94c1e4a5305cf52d9138639c918b4"
 SRC_URI[colorchoice-1.0.4.sha256sum] =3D "b05b61dc5112cbb17e4b6cd61790d984=
5d13888356391624cbe7e41efeac1e75"
 SRC_URI[colored-2.2.0.sha256sum] =3D "117725a109d387c937a1533ce01b450cbde6=
b88abceea8473c4d7a85853cda3c"
@@ -927,7 +909,7 @@ SRC_URI[darling_macro-0.23.0.sha256sum] =3D "ac3984ec7b=
d6cfa798e62b4a642426a5be0e6
 SRC_URI[darling_macro-0.24.1.sha256sum] =3D "2ac7135c3ef02b2f7833bbeb1be5b=
a7f966dcde8a87c6b87f65a778d71a02785"
 SRC_URI[data-encoding-2.11.0.sha256sum] =3D "a4ae5f15dda3c708c0ade84bfee31=
ccab44a3da4f88015ed22f63732abe300c8"
 SRC_URI[debug_unsafe-0.1.4.sha256sum] =3D "7eed2c4702fa172d1ce21078faa7c52=
03e69f5394d48cc436d25928394a867a2"
-SRC_URI[der-0.8.0.sha256sum] =3D "71fd89660b2dc699704064e59e9dba0147b903e8=
5319429e131620d022be411b"
+SRC_URI[der-0.8.2.sha256sum] =3D "a878c850e9e421b20262e9b41f9c860e4785fa07=
541c266b62ff9d1ef998a80a"
 SRC_URI[deranged-0.5.8.sha256sum] =3D "7cd812cc2bc1d69d4764bd80df88b4317ea=
ef9e773c75226407d9bc0876b211c"
 SRC_URI[derive_more-2.1.1.sha256sum] =3D "d751e9e49156b02b44f9c1815bcb94b9=
84cdcc4396ecc32521c739452808b134"
 SRC_URI[derive_more-impl-2.1.1.sha256sum] =3D "799a97264921d8623a957f6c3b9=
011f3b5492f557bbb7a5a19b7fa6d06ba8dcb"
@@ -948,7 +930,6 @@ SRC_URI[doctest-file-1.0.0.sha256sum] =3D "aac81fa3e28d=
21450aa4d2ac065992ba96a1d73
 SRC_URI[document-features-0.2.12.sha256sum] =3D "d4b8a88685455ed29a21542a3=
3abd9cb6510b6b129abadabdcef0f4c55bc8f61"
 SRC_URI[downcast-rs-1.2.1.sha256sum] =3D "75b325c5dbd37f80359721ad39aca5a2=
9fb04c89279657cffdda8736d0c0b9d2"
 SRC_URI[doxygen-rs-0.4.2.sha256sum] =3D "415b6ec780d34dcf62466674719439360=
3d0373b7141eef01d12ee58881507d9"
-SRC_URI[dtparse-2.0.1.sha256sum] =3D "23fb403c0926d35af2cc54d961bc2696a10d=
40725c08360ef69db04a4c201fd7"
 SRC_URI[dunce-1.0.5.sha256sum] =3D "92773504d58c093f6de2459af4af33faa518c1=
3451eb8f2b5698ed3d36e7c813"
 SRC_URI[dyn-clone-1.0.20.sha256sum] =3D "d0881ea181b1df73ff77ffaaf9c7544ec=
c11e82fba9b5f27b262a3c73a332555"
 SRC_URI[edit-0.1.5.sha256sum] =3D "f364860e764787163c8c8f58231003839be3127=
6e821e2ad2092ddf496b1aa09"
@@ -963,10 +944,9 @@ SRC_URI[equivalent-1.0.2.sha256sum] =3D "877a4ace8713b=
0bcf2a4e7eec82529c029f1d0619
 SRC_URI[erased-serde-0.4.10.sha256sum] =3D "d2add8a07dd6a8d93ff627029c51de=
145e12686fbc36ecb298ac22e74cf02dec"
 SRC_URI[errno-0.3.14.sha256sum] =3D "39cab71617ae0d63f51a36d69f866391735b5=
1691dbda63cf6f96d042b63efeb"
 SRC_URI[error-code-3.3.2.sha256sum] =3D "dea2df4cf52843e0452895c455a1a2cfb=
b842a1e7329671acf418fdc53ed4c59"
-SRC_URI[etcetera-0.10.0.sha256sum] =3D "26c7b13d0780cb82722fd59f6f57f925e1=
43427e4a75313a6c77243bf5326ae6"
 SRC_URI[fallible-iterator-0.3.0.sha256sum] =3D "2acce4a10f12dc2fb14a218589=
d4f1f62ef011b2d0cc4b3cb1bba8e94da14649"
 SRC_URI[fallible-streaming-iterator-0.1.9.sha256sum] =3D "7360491ce676a36b=
f9bb3c56c1aa791658183a54d2744120f27285738d90465a"
-SRC_URI[fancy-regex-0.19.0.sha256sum] =3D "476de73bddf2ef8490aa4ee8f1cf40b=
430bf1d56c48c22080e5186952cd580e6"
+SRC_URI[fancy-regex-0.20.0.sha256sum] =3D "20ed7f62ce0ae0da1a8b93c3c7104ab=
7e0760a74491e097c701fff966e945390"
 SRC_URI[fast-float2-0.2.3.sha256sum] =3D "f8eb564c5c7423d25c886fb561d1e4ee=
69f72354d16918afa32c08811f6b6a55"
 SRC_URI[fastrand-2.3.0.sha256sum] =3D "37909eebbb50d72f9059c3b6d82c0463f2f=
f062c9e95845c43a6c9c0355411be"
 SRC_URI[fax-0.2.6.sha256sum] =3D "f05de7d48f37cd6730705cbca900770cab77a89f=
413d23e100ad7fad7795a0ab"
@@ -1016,7 +996,7 @@ SRC_URI[glidesort-0.1.2.sha256sum] =3D "f2e102e6eb644d=
3e0b186fc161e4460417880a0a0b
 SRC_URI[glob-0.3.3.sha256sum] =3D "0cc23270f6e1808e30a928bdc84dea0b9b4136a=
8bc82338574f23baf47bbd280"
 SRC_URI[glob-match-0.2.1.sha256sum] =3D "9985c9503b412198aa4197559e9a31852=
4ebc4519c229bfa05a535828c950b9d"
 SRC_URI[globset-0.4.19.sha256sum] =3D "e47d37d2ae4464254884b60ab7071be2b87=
6a9c35b696bd018ddcc76847309cd"
-SRC_URI[granit-parser-1.3.0.sha256sum] =3D "e20f99e46474f56bd905c56e817ebd=
dcf377a611f94c53ac4649e4d3fa3c0cd0"
+SRC_URI[granit-parser-2.0.0.sha256sum] =3D "da55feca5d1625466bae068f9fd4b8=
7892caeae70c3fe671ddb0f50d41aebf37"
 SRC_URI[h2-0.4.18.sha256sum] =3D "839c0e8a181239723652be9062bb56ca5bf5f640=
11f73b623f6f4fc59086a228"
 SRC_URI[half-2.7.1.sha256sum] =3D "6ea2d84b969582b4b1864a92dc5d27cd2b77b62=
2a8d79306834f1be5ba20d84b"
 SRC_URI[hashbrown-0.15.5.sha256sum] =3D "9229cfe53dfd69f0609a49f65461bd930=
01ea1ef889cd5529dd176593f5338a1"
@@ -1039,8 +1019,6 @@ SRC_URI[human-date-parser-0.3.1.sha256sum] =3D "406f8=
3c56de4b2c9183be52ae9a4fefa22
 SRC_URI[humantime-2.4.0.sha256sum] =3D "15cdd26707701c53297e2fa6afb323d55f=
bc1d0810c3aec078ae3ef0424c3c15"
 SRC_URI[hybrid-array-0.4.13.sha256sum] =3D "818356c5132c1fede50f837ca96afb=
e78ff42413047f4abb886217845e1b6c8c"
 SRC_URI[hyper-1.8.1.sha256sum] =3D "2ab2d4f250c3d7b1c9fcdff1cece94ea4e2dfb=
ec68614f7b87cb205f24ca9d11"
-SRC_URI[hyper-rustls-0.27.7.sha256sum] =3D "e3c93eb611681b207e1fe55d5a71ec=
f91572ec8a6705cdb6857f7d8d5242cf58"
-SRC_URI[hyper-tls-0.6.0.sha256sum] =3D "70206fc6890eaca9fde8a0bf71caa2ddfc=
9fe045ac9e5c70df101a7dbde866e0"
 SRC_URI[hyper-util-0.1.20.sha256sum] =3D "96547c2556ec9d12fb1578c4eaf448b0=
4993e7fb79cbaad930a656880a6bdfa0"
 SRC_URI[iana-time-zone-0.1.65.sha256sum] =3D "e31bc9ad994ba00e440a8aa5c9ef=
0ec67d5cb5e5cb0cc7f8b744a35b389cc470"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D "f31827a206f56af32e590ba=
56d5d2d085f558508192593743f16b2306495269f"
@@ -1067,8 +1045,6 @@ SRC_URI[interprocess-2.4.3.sha256sum] =3D "798de1433b=
a514cc6c04c4144c2469af81396e4
 SRC_URI[intl-memoizer-0.5.3.sha256sum] =3D "310da2e345f5eb861e7a07ee182262=
e94975051db9e4223e909ba90f392f163f"
 SRC_URI[intl_pluralrules-7.0.2.sha256sum] =3D "078ea7b7c29a2b4df841a7f6ac8=
775ff6074020c6776d48491ce2268e068f972"
 SRC_URI[inventory-0.3.22.sha256sum] =3D "009ae045c87e7082cb72dab0ccd01ae07=
5dd00141ddc108f43a0ea150a9e7227"
-SRC_URI[ipnet-2.12.0.sha256sum] =3D "d98f6fed1fde3f8c21bc40a1abb88dd75e679=
24f9cffc3ef95607bad8017f8e2"
-SRC_URI[iri-string-0.7.10.sha256sum] =3D "c91338f0783edbd6195decb37bae672f=
d3b165faffb89bf7b9e6942f8b1a731a"
 SRC_URI[is-docker-0.2.0.sha256sum] =3D "928bae27f42bc99b60d9ac7334e3a21d10=
ad8f1835a4e12ec3ec0464765ed1b3"
 SRC_URI[is-wsl-0.4.0.sha256sum] =3D "173609498df190136aa7dea1a91db051746d3=
39e18476eed5ca40521f02d7aa5"
 SRC_URI[is_ci-1.2.0.sha256sum] =3D "7655c9839580ee829dfacba1d1278c2b7883e5=
0a277ff7541299489d6bdfdc45"
@@ -1078,7 +1054,7 @@ SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] =3D "a=
6cb138bb79a146c1bd460005623e1
 SRC_URI[itertools-0.13.0.sha256sum] =3D "413ee7dfc52ee1a4949ceeb7dbc8a33f2=
d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itertools-0.14.0.sha256sum] =3D "2b192c782037fadd9cfa75548310488aa=
bdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itertools-0.15.0.sha256sum] =3D "8b4baf93f58d4425749ca49a51c50ebab=
072c5df6994d08fed93541c331481dc"
-SRC_URI[itoa-1.0.17.sha256sum] =3D "92ecc6618181def0457392ccd0ee51198e065e=
016d1d527a7ac1b6dc7c1f09d2"
+SRC_URI[itoa-1.0.18.sha256sum] =3D "8f42a60cbdf9a97f5d2305f08a87dc4e09308d=
1276d28c869c684d7777685682"
 SRC_URI[jiff-0.2.23.sha256sum] =3D "1a3546dc96b6d42c5f24902af9e2538e82e39a=
d350b0c766eb3fbf2d8f3d8359"
 SRC_URI[jiff-static-0.2.23.sha256sum] =3D "2a8c8b344124222efd714b73bb41f8b=
5120b27a7cc1c75593a6ff768d9d05aa4"
 SRC_URI[jiff-tzdb-0.1.6.sha256sum] =3D "c900ef84826f1338a557697dc8fc601df9=
ca9af4ac137c7fb61d4c6f2dfd3076"
@@ -1096,17 +1072,17 @@ SRC_URI[kdl-6.7.1.sha256sum] =3D "082ddf81b2acd76fe=
04412655d17befedfff1837db772f8e
 SRC_URI[kqueue-1.1.1.sha256sum] =3D "eac30106d7dce88daf4a3fcb4879ea939476d=
5074a9b7ddd0fb97fa4bed5596a"
 SRC_URI[kqueue-sys-1.0.4.sha256sum] =3D "ed9625ffda8729b85e45cf04090035ac3=
68927b8cebc34898e7c120f52e4838b"
 SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f359=
1312473c50c6685e1f298068316e66fe"
-SRC_URI[lean_string-0.7.0.sha256sum] =3D "d8899d72720b5241f886495ea979d964=
1ebeec862248f5b65236c659670df9e6"
+SRC_URI[lean_string-0.8.0.sha256sum] =3D "814388560189061a39bf531f64afd9a0=
36371e58edaf8566bd9ac4b8b0b823f0"
 SRC_URI[leb128fmt-0.1.0.sha256sum] =3D "09edd9e8b54e49e587e4f6295a7d29c3ea=
94d469cb40ab8ca70b288248a81db2"
 SRC_URI[lexopt-0.3.2.sha256sum] =3D "803ec87c9cfb29b9d2633f20cba1f488db3fd=
53f2158b1024cbefb47ba05d413"
-SRC_URI[libc-0.2.186.sha256sum] =3D "68ab91017fe16c622486840e4c83c9a37afef=
f978bd239b5293d61ece587de66"
+SRC_URI[libc-0.2.189.sha256sum] =3D "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc=
6d17f656fb07896ee72867612f2"
 SRC_URI[libgit2-sys-0.18.7+1.9.6.sha256sum] =3D "23c7391e4b9f4ffab1a624223=
cc1d7385ff9a678f490768add717de7ea2f4d89"
 SRC_URI[libloading-0.8.9.sha256sum] =3D "d7c4b02199fee7c5d21a5ae7d8cfa79a6=
ef5bb2fc834d6e9058e89c825efdc55"
 SRC_URI[libm-0.2.16.sha256sum] =3D "b6d2cec3eae94f9f509c767b45932f1ada8350=
c4bdb85af2fcab4a3c14807981"
 SRC_URI[libproc-0.14.11.sha256sum] =3D "a54ad7278b8bc5301d5ffd2a94251c004f=
eb971feba96c971ea4063645990757"
 SRC_URI[libredox-0.1.14.sha256sum] =3D "1744e39d1d6a9948f4f388969627434e31=
128196de472883b39f148769bfe30a"
-SRC_URI[libsqlite3-sys-0.38.2.sha256sum] =3D "f1d20bef17f513b9b30045322331=
87769cd072d790971f4e4da0e346eb6401e8"
-SRC_URI[libz-sys-1.1.25.sha256sum] =3D "d52f4c29e2a68ac30c9087e1b772dc9f44=
a2b66ed44edf2266cf2be9b03dafc1"
+SRC_URI[libsqlite3-sys-0.39.1.sha256sum] =3D "14a5f01b87b92705d07b433c06f9=
6cbc764637d81a0bffb5734ce17cf0f9a2b3"
+SRC_URI[libz-sys-1.1.31.sha256sum] =3D "ff20308ecabd635a2dc1dd5834a86c462c=
ca20efba1d5d3ddab1f8aea3455cb2"
 SRC_URI[line-clipping-0.3.5.sha256sum] =3D "5f4de44e98ddbf09375cbf4d17714d=
18f39195f4f4894e8524501726fd9a8a4a"
 SRC_URI[linked-hash-map-0.5.6.sha256sum] =3D "0717cef1bc8b636c6e1c1bbdefc0=
9e6322da8a9321966e8928ef80d20f7f770f"
 SRC_URI[linux-raw-sys-0.4.15.sha256sum] =3D "d26c52dbd32dccf2d10cac7725f8e=
ae5296885fb5703b261f7d0a0739ec807ab"
@@ -1116,21 +1092,20 @@ SRC_URI[litrs-1.0.0.sha256sum] =3D "11d3d7f243d5c5a=
8b9bb5d6dd2b1602c0cb0b9db1621ba
 SRC_URI[lmdb-master-sys-0.2.6.sha256sum] =3D "aaeb9bd22e73bd1babffff614994=
b341e9b2008de7bb73bf1f7e9154f1978f8b"
 SRC_URI[lock_api-0.4.14.sha256sum] =3D "224399e74b87b5f3557511d98dff8b1408=
9b3dadafcab6bb93eab67d3aace965"
 SRC_URI[log-0.4.34.sha256sum] =3D "f9f8bd3e56ce4dfc153cf470fffbfa98c762095=
8b312ca5c3a4b8d5181fd13c6"
-SRC_URI[lru-0.18.3.sha256sum] =3D "0d317b4b9eb398e6acce275758ec6125535505e=
7a146fb1a9b8bda2451b0ff4c"
-SRC_URI[lru-slab-0.1.2.sha256sum] =3D "112b39cec0b298b6c1999fee3e31427f74f=
676e4cb9879ed1a121b43661a4154"
+SRC_URI[lru-0.18.5.sha256sum] =3D "ef9ac18847474e638e3702b76c65d4eb9342847=
1a74778ef0f1be711717f89b5"
+SRC_URI[lru-0.19.0.sha256sum] =3D "4a9f71e3591c7ec44d3e563e87bf14ddc2bada8=
519dca046e5b0e560cd004e2d"
 SRC_URI[lscolors-0.21.0.sha256sum] =3D "d60e266dfb1426eb2d24792602e041131f=
dc0236bb7007abc0e589acafd60929"
 SRC_URI[lsp-server-0.10.0.sha256sum] =3D "3ee25a31f2e571e426eef2896179450c=
afc7e2f5be00d8a93b1c2d21c0ff7656"
 SRC_URI[lsp-textdocument-0.5.0.sha256sum] =3D "2da72ba568f141737cbaf0ce7c7=
f757a00f94f204352bb1297ae0f28ae43398a"
 SRC_URI[lsp-types-0.97.0.sha256sum] =3D "53353550a17c04ac46c585feb189c2db8=
2154fc84b79c7a66c96c2c644f66071"
 SRC_URI[mach2-0.7.0.sha256sum] =3D "b0d28e293f2b8c9d2b2d1c0193bd3c1cbdc0d2=
cf396888dc01162f7cf9d6c3f3"
-SRC_URI[markdown-1.0.0.sha256sum] =3D "a5cab8f2cadc416a82d2e783a1946388b31=
654d391d1c7d92cc1f03e295b1deb"
 SRC_URI[matchers-0.2.0.sha256sum] =3D "d1525a2a28c7f4fa0fc98bb91ae755d1e2d=
1505079e05539e35bc876b5d65ae9"
 SRC_URI[matrixmultiply-0.3.10.sha256sum] =3D "a06de3016e9fae57a36fd14dba13=
1fccf49f74b40b7fbdb472f96e361ec71a08"
 SRC_URI[md-5-0.10.6.sha256sum] =3D "d89e7ee0cfbedfc4da3340218492196241d89e=
efb6dab27de5df917a6d2e78cf"
 SRC_URI[md-5-0.11.0.sha256sum] =3D "69b6441f590336821bb897fb28fc622898ccce=
b1d6cea3fde5ea86b090c4de98"
 SRC_URI[mediatype-0.21.0.sha256sum] =3D "120fa187be19d9962f092663345378469=
1731018a2bf936ddb4e29101b79c4a7"
 SRC_URI[memchr-2.8.3.sha256sum] =3D "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4=
beb022d3b367256b91b87513d98"
-SRC_URI[memmap2-0.9.10.sha256sum] =3D "714098028fe011992e1c3962653c96b2d57=
8c4b4bce9036e15ff220319b1e0e3"
+SRC_URI[memmap2-0.9.11.sha256sum] =3D "d1219ed1b7f229ee7104d281dd01d6802fe=
28bb6e95d292942c4daacdeb798c0"
 SRC_URI[memoffset-0.6.5.sha256sum] =3D "5aa361d4faea93603064a027415f07bd8e=
1d5c88c9fbf68bf56a285428fd79ce"
 SRC_URI[miette-5.10.0.sha256sum] =3D "59bb584eaeeab6bd0226ccf3509a69d7936d=
148cf3d036ad350abe35e8c6856e"
 SRC_URI[miette-7.6.0.sha256sum] =3D "5f98efec8807c63c752b5bd61f862c165c115=
b0a35685bdcfd9238c7aeb592b7"
@@ -1142,7 +1117,7 @@ SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5=
c6bd36d73ff3feceb05efa59b6acb
 SRC_URI[miniz_oxide-0.8.9.sha256sum] =3D "1fa76a2c86f704bdb222d66965fb3d63=
269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mio-1.2.0.sha256sum] =3D "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f9=
2d3aac1a6ed369ee08cc56c1"
 SRC_URI[moxcms-0.8.1.sha256sum] =3D "bb85c154ba489f01b25c0d36ae69a87e4a1c7=
3a72631fc6c0eb6dde34a73e44b"
-SRC_URI[mq-markdown-0.9.2.sha256sum] =3D "dec960d112bb48d7ae31c2ad17ce8028=
c0df32909550ab78b183f49f39533e04"
+SRC_URI[mq-markdown-0.10.0.sha256sum] =3D "77a34c2913877119fa13c868329146a=
3b979d146718ce142b8ed079127cf579e"
 SRC_URI[multipart-rs-0.2.3.sha256sum] =3D "7161f77c3118271d59b61f0f3b7e8cf=
0c97c6217b33b36f33b6b64a38c9e466a"
 SRC_URI[native-tls-0.2.18.sha256sum] =3D "465500e14ea162429d264d44189adc38=
b199b62b1c21eea9f69e4b73cb03bbf2"
 SRC_URI[ndarray-0.17.2.sha256sum] =3D "520080814a7a6b4a6e9070823bb24b4531d=
aac8c4627e08ba5de8c5ef2f2752d"
@@ -1158,37 +1133,37 @@ SRC_URI[notify-debouncer-full-0.7.0.sha256sum] =3D =
"c02b49179cfebc9932238d04d60799
 SRC_URI[notify-types-2.1.0.sha256sum] =3D "42b8cfee0e339a0337359f3c8816570=
2ac6e600dc01c0cc9579a92d62b08477a"
 SRC_URI[ntapi-0.4.3.sha256sum] =3D "c3b335231dfd352ffb0f8017f3b6027a4917f7=
df785ea2143d8af2adc66980ae"
 SRC_URI[nu-ansi-term-0.50.3.sha256sum] =3D "7957b9740744892f114936ab4a57b3=
f487491bbeafaf8083688b16841a4240e5"
-SRC_URI[nu-cli-0.116.1.sha256sum] =3D "e3210a5075ebd0259b166602224a8ff2f4d=
c92305bf02c9dc6e5e7346583d530"
-SRC_URI[nu-cmd-base-0.116.1.sha256sum] =3D "6a344cc88e5548048b675898087654=
0f198f4954e6ac0b8ce23da06534067012"
-SRC_URI[nu-cmd-extra-0.116.1.sha256sum] =3D "270d811b97a4e5402fd948dd84467=
e123093b6b425ef7c2fc7e8f84191465db3"
-SRC_URI[nu-cmd-lang-0.116.1.sha256sum] =3D "20ede2fc8e7a07cad1b08866a6ec8e=
b0c74701b76200051150e3d3ad663b37ce"
-SRC_URI[nu-cmd-plugin-0.116.1.sha256sum] =3D "06ca340ef0473ccddf792ded1b4b=
f45593c889e2e955c61974adcfb0b219f8c7"
-SRC_URI[nu-color-config-0.116.1.sha256sum] =3D "3ab851824e4e070c32051fb308=
f12119f53b17c8dfe89295f5b8a322bb86ff4b"
-SRC_URI[nu-command-0.116.1.sha256sum] =3D "2013739bfb07cd24b3b79e10e573d57=
1f9f80fe67ba0d56d860cbc0e290d7a7a"
-SRC_URI[nu-config-0.116.1.sha256sum] =3D "3cf2614395b32b611aab1144863d74a0=
0cc88a58ce613f4c37fb00685be676da"
-SRC_URI[nu-dap-0.116.1.sha256sum] =3D "18306abb507bd0b2e8b089e4d97a6a0cb1e=
a96063cdfd8f85a590fa12427b0f2"
-SRC_URI[nu-derive-value-0.116.1.sha256sum] =3D "f8afb8851aef3f821c99450af4=
7563ebf477da7d8e0191332c3253cbca038cf5"
-SRC_URI[nu-engine-0.116.1.sha256sum] =3D "9624a038a70668003d9ef579c9d58c5c=
6b7c4b71e91518441ca51e004367d01e"
-SRC_URI[nu-experimental-0.116.1.sha256sum] =3D "8900751ec5ddae2757ec9f8095=
b7c11ab470e84e689b2ff8ac4d945b4f2f4ef0"
-SRC_URI[nu-explore-0.116.1.sha256sum] =3D "180d1183f62349a79b72f68f0626465=
42ffaafba1d027231b25cf7d6e0ae5e80"
-SRC_URI[nu-glob-0.116.1.sha256sum] =3D "562d41b0098df79d66e5a47537744ea901=
954260c23e7515f2117ebac6246fad"
-SRC_URI[nu-heavy-utils-0.116.1.sha256sum] =3D "0dad35ba4060a6977c07dd98eff=
f7bf57a35c8a11617abb313e48e9dc0580fbc"
-SRC_URI[nu-json-0.116.1.sha256sum] =3D "b0705efa4067d8ff9f580377651012b15a=
a002250fb18189e70fc0711cfe8af0"
-SRC_URI[nu-lsp-0.116.1.sha256sum] =3D "2c19194bfe2a57e44c2e564f7b43642a617=
8e19db0e09416c13c82f8818668d3"
-SRC_URI[nu-mcp-0.116.1.sha256sum] =3D "c8b43b92b8846b65520a44e5e61f24e552f=
510da9cd928659585a83836482694"
-SRC_URI[nu-parser-0.116.1.sha256sum] =3D "e2daa0ec931818191d23e8a6cdcc2882=
1ad2aeb9b466f84195c93d28cf9929dd"
-SRC_URI[nu-path-0.116.1.sha256sum] =3D "0909df2d047a887b37329b463d1a852246=
d40900bfd244f93ce32f4e3e3be7d3"
-SRC_URI[nu-plugin-core-0.116.1.sha256sum] =3D "fd20c167e7cebb67073c43f6812=
d7d9c83ea195143eae53619323ae4a4ec60db"
-SRC_URI[nu-plugin-engine-0.116.1.sha256sum] =3D "eba904d2e6d05bf9637bc6ca3=
9cdc046c68f791984f8e5311629202bc56b56be"
-SRC_URI[nu-plugin-protocol-0.116.1.sha256sum] =3D "7fd0f06dff8d83274e19ed2=
5af59204fb3b6e924c931636bb1a2745d88ac8458"
-SRC_URI[nu-pretty-hex-0.116.1.sha256sum] =3D "3cfc84ce8e31c2ff81ef96c031e8=
c5fb5306d71fa463d45ba063cc7dbcbfe62e"
-SRC_URI[nu-protocol-0.116.1.sha256sum] =3D "5516ed558d0e31509c62b41fabe4f7=
f08c9161ff9a77131f9320f1187cc9015c"
-SRC_URI[nu-std-0.116.1.sha256sum] =3D "3957dfe8a889daab2434883a000162a0fc8=
a516bae7c38b9ea325cea8eb5e650"
-SRC_URI[nu-system-0.116.1.sha256sum] =3D "a5b98a8adf1e469b19c80d24253f6c6d=
e2685a3c358b56ae5b55629c55185657"
-SRC_URI[nu-table-0.116.1.sha256sum] =3D "9c7a89377ef569a6890d82dc981407c4d=
a5dc2112c24343237c792949d33b618"
-SRC_URI[nu-term-grid-0.116.1.sha256sum] =3D "4f2639db435b9140a3e5dd295bb2c=
63e51cea28edcadb63749ed71077439d5be"
-SRC_URI[nu-tui-0.116.1.sha256sum] =3D "aa87f21a3095fd4b20a2e0d5070f97ee025=
072098e47cef5ccc2d723e7ad6c14"
-SRC_URI[nu-utils-0.116.1.sha256sum] =3D "84f521367a3e9a70ce78759106801961f=
108f1bad9b80ec9195fcb5eec3a1d85"
+SRC_URI[nu-cli-0.117.0.sha256sum] =3D "a8e44d029dbf8f3270ba615c733013d82cd=
c0726f41cb058e26ebfe068dbf316"
+SRC_URI[nu-cmd-base-0.117.0.sha256sum] =3D "af0380148dd82082ad492e0d7fe3d7=
228341fbe605692cb5198ed2d0033e76a5"
+SRC_URI[nu-cmd-extra-0.117.0.sha256sum] =3D "aaac58e5a90c75c5f06e71036995e=
32c0cfd43686cb01547d6371f8d9e7500be"
+SRC_URI[nu-cmd-lang-0.117.0.sha256sum] =3D "53ab7130bd996049bf59a1003ce892=
cf524d8eb7b777bc25e06ef6b73222645d"
+SRC_URI[nu-cmd-plugin-0.117.0.sha256sum] =3D "6c3fd0a70d709011a4c7d04be729=
6bfef539fb2a41d46ccfbc2ebf1946f533f7"
+SRC_URI[nu-color-config-0.117.0.sha256sum] =3D "d24caa33ab797f57bf20145f29=
2c241546c5f80933c5ae06d157d92896f75fb9"
+SRC_URI[nu-command-0.117.0.sha256sum] =3D "608150820b7600aaaa35d82d390a099=
49c73f8484b1e3a43ab6844522633ba4e"
+SRC_URI[nu-config-0.117.0.sha256sum] =3D "6516fe8ceb833969614d92908f6f1954=
8ff1ce250b807b3aee5cd55c951a10e8"
+SRC_URI[nu-dap-0.117.0.sha256sum] =3D "6d3e7cde9751dd6f91980c24ff939792887=
c73d3bfb778a50796efcd870197f7"
+SRC_URI[nu-derive-value-0.117.0.sha256sum] =3D "0ed50a57cd367d53474ebe4229=
48e86231ad5827cee72978ef772c150d2a6a17"
+SRC_URI[nu-engine-0.117.0.sha256sum] =3D "f61e90191eaa7c0b7a979e6e935ae997=
0a6e9fef5d69140b97296064b97def34"
+SRC_URI[nu-experimental-0.117.0.sha256sum] =3D "a4111afa74b8f4ad41cdf6b4aa=
d87cf59e5731cc7149b54ec4a5a53f5b0c9c52"
+SRC_URI[nu-explore-0.117.0.sha256sum] =3D "7b7f2da7478c1a92275fd1d1739100e=
d353b8e00ab9733dc90497ec7744e89c0"
+SRC_URI[nu-glob-0.117.0.sha256sum] =3D "3aae141d5ffc15e59d30390008e05bb547=
3d78c9355421fec35aafb15f2be0bb"
+SRC_URI[nu-heavy-utils-0.117.0.sha256sum] =3D "340d044318714cf5ceb07cd522b=
17575d782cdddcd97920281ab8b4398852ee9"
+SRC_URI[nu-json-0.117.0.sha256sum] =3D "457dd1b22c08186a335e2d5a72e7a1132d=
d415288864c66b3e46a10c9965a169"
+SRC_URI[nu-lsp-0.117.0.sha256sum] =3D "7599dbb106b47122183e909141bca3e2a67=
befbd64ad2a407866ade6b7f9225e"
+SRC_URI[nu-mcp-0.117.0.sha256sum] =3D "848a51af4d2ac1cfe8f39279950f193e00f=
44cdfd770447106584a886d46051d"
+SRC_URI[nu-parser-0.117.0.sha256sum] =3D "ecf00e4a0f60370a877df9e8a9fe3e3b=
6b7ecfb584ee3c3833cdcdee99ec0d8e"
+SRC_URI[nu-path-0.117.0.sha256sum] =3D "8fc326ae23f2a7be09df9be157da4f9f44=
e3d72f23e80a8d035a41d82b9c8e01"
+SRC_URI[nu-plugin-core-0.117.0.sha256sum] =3D "9e262196427aa75680c7a93c159=
07a4db74fd1b3e544b289387e99505eb81bbf"
+SRC_URI[nu-plugin-engine-0.117.0.sha256sum] =3D "bcb6e8d5df78a8255d8c3b1bf=
5e4acbd9ba7cd497dc2e8ddf62b69a1c0fb46dd"
+SRC_URI[nu-plugin-protocol-0.117.0.sha256sum] =3D "4c8c2afa925535bf9c425a8=
ea8a7b0c8f7eae7a3ab96097d7d197b241898149c"
+SRC_URI[nu-pretty-hex-0.117.0.sha256sum] =3D "d3b2ad0f7757d7d03b2a2cf8b666=
87e66b6314f230cc18012145d2b39085f2aa"
+SRC_URI[nu-protocol-0.117.0.sha256sum] =3D "2de097ebb326f231d87b36af9fd2e9=
5582fac1a14ddbb197e9384cf42a8a3353"
+SRC_URI[nu-std-0.117.0.sha256sum] =3D "4e5c41cf6ea797cde97653e3c725aac0f88=
f26096f6e27db964bb2401127932c"
+SRC_URI[nu-system-0.117.0.sha256sum] =3D "ccbdf0d1243db80d99c969f2a1155d9f=
0b113feeff69c39b6f498651f32e0662"
+SRC_URI[nu-table-0.117.0.sha256sum] =3D "6dd7f827a292d68c9e414f6d9be622fb9=
669d85bb6faa8b9df6fec1b3ddf3827"
+SRC_URI[nu-term-grid-0.117.0.sha256sum] =3D "28ae2f049e37782b972b5566dc7f3=
c004403485e88acd19c1e33cb218524589f"
+SRC_URI[nu-tui-0.117.0.sha256sum] =3D "4dd1a7b748fda072b63b7a3ae272bc45146=
acd479a6c16a5fc80482ec03d716a"
+SRC_URI[nu-utils-0.117.0.sha256sum] =3D "a00875ad38bccea3c23e50716ec10725e=
56ca79df19663c166c2d6ce27a17fbb"
 SRC_URI[nucleo-matcher-0.3.1.sha256sum] =3D "bf33f538733d1a5a3494b836ba913=
207f14d9d4a1d3cd67030c5061bdd2cac85"
 SRC_URI[num-bigint-0.4.8.sha256sum] =3D "c89e69e7e0f03bea5ef08013795c25018=
e101932225a656383bd384495ecc367"
 SRC_URI[num-complex-0.4.6.sha256sum] =3D "73f88a1307638156682bada9d7604135=
552957b7818057dcef22705b4d509495"
@@ -1198,7 +1173,7 @@ SRC_URI[num-integer-0.1.46.sha256sum] =3D "7969661fd2=
958a5cb096e56c8e1ad0444ac2bbc
 SRC_URI[num-traits-0.2.19.sha256sum] =3D "071dfc062690e90b734c0b2273ce72ad=
0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[num_cpus-1.17.0.sha256sum] =3D "91df4bbde75afed763b708b7eee1e8e765=
1e02d97f6d5dd763e89367e957b23b"
 SRC_URI[num_threads-0.1.7.sha256sum] =3D "5c7398b9c8b70908f6371f47ed367379=
07c87c52af34c268fed0bf0ceb92ead9"
-SRC_URI[nuon-0.116.1.sha256sum] =3D "7fb566b628d1806c6b2b5fbe7358bade2c5c3=
732832c7fd86e480f4970be51d7"
+SRC_URI[nuon-0.117.0.sha256sum] =3D "1ffbae1db591ca0f67537df8d9c7c19577977=
ba81c6e06028d3e01479974f1d6"
 SRC_URI[objc2-0.6.4.sha256sum] =3D "3a12a8ed07aefc768292f076dc3ac8c48f3781=
c8f2d5851dd3d98950e8c5a89f"
 SRC_URI[objc2-app-kit-0.3.2.sha256sum] =3D "d49e936b501e5c5bf01fda3a9452ff=
86dc3ea98ad5f283e1455153142d97518c"
 SRC_URI[objc2-core-foundation-0.3.2.sha256sum] =3D "2a180dd8642fa45cdb7dd7=
21cd4c11b1cadd4929ce112ebd8b9f5803cc79d536"
@@ -1231,6 +1206,7 @@ SRC_URI[palette_math-0.7.7.sha256sum] =3D "6e6eb14295=
8d64335fb0e345c5b9ead2ecd6fc4
 SRC_URI[papergrid-0.18.0.sha256sum] =3D "d0984e668274d34691bc2b262ef0d115d=
e5fa9973bcdee7ae32213f93099153e"
 SRC_URI[parking_lot-0.12.5.sha256sum] =3D "93857453250e3077bd71ff98b6a65ea=
6621a19bb0f559a85248955ac12c45a1a"
 SRC_URI[parking_lot_core-0.9.12.sha256sum] =3D "2621685985a2ebf1c516881c02=
6032ac7deafcda1a2c9b7850dc81e3dfcb64c1"
+SRC_URI[parse-zoneinfo-0.4.1.sha256sum] =3D "e3c406c9e2aa74554e662d2c2ee11=
cd3e73756988800be7e6f5eddb16fed4699"
 SRC_URI[parse_datetime-0.16.0.sha256sum] =3D "503fd4c8b0685e5eb32a82765336=
11f63e3b44768e9e8724e73f6852c2542f82"
 SRC_URI[pastey-0.2.3.sha256sum] =3D "2ee67f1008b1ba2321834326597b8e186293b=
049a023cdef258527550b9935b4"
 SRC_URI[pathdiff-0.2.3.sha256sum] =3D "df94ce210e5bc13cb6651479fa48d14f601=
d9858cfe0467f43ae157023b938d3"
@@ -1245,8 +1221,11 @@ SRC_URI[pest_meta-2.8.6.sha256sum] =3D "89815c69d360=
21a140146f26659a81d6c2afa33d21
 SRC_URI[petgraph-0.8.3.sha256sum] =3D "8701b58ea97060d5e5b155d383a69952a60=
943f0e6dfe30b04c287beb0b27455"
 SRC_URI[phf-0.11.3.sha256sum] =3D "1fd6780a80ae0c52cc120a26a1a42c1ae51b247=
a253e4e06113d23d2c2edd078"
 SRC_URI[phf-0.12.1.sha256sum] =3D "913273894cec178f401a31ec4b656318d954735=
27be05c0752cc41cdc32be8b7"
+SRC_URI[phf_codegen-0.12.1.sha256sum] =3D "efbdcb6f01d193b17f0b9c3360fa7e0=
e620991b193ff08702f78b3ce365d7e61"
 SRC_URI[phf_generator-0.11.3.sha256sum] =3D "3c80231409c20246a13fddb31776f=
b942c38553c51e871f8cbd687a4cfb5843d"
+SRC_URI[phf_generator-0.12.1.sha256sum] =3D "2cbb1126afed61dd6368748dae63b=
1ee7dc480191c6262a3b4ff1e29d86a6c5b"
 SRC_URI[phf_macros-0.11.3.sha256sum] =3D "f84ac04429c13a7ff43785d75ad27569=
f2951ce0ffd30a3321230db2fc727216"
+SRC_URI[phf_macros-0.12.1.sha256sum] =3D "d713258393a82f091ead52047ca779d3=
7e5766226d009de21696c4e667044368"
 SRC_URI[phf_shared-0.11.3.sha256sum] =3D "67eabc2ef2a60eb7faa00097bd1ffdb5=
bd28e62bf39990626a582201b7a754e5"
 SRC_URI[phf_shared-0.12.1.sha256sum] =3D "06005508882fb681fd97892ecff4b7fd=
0fee13ef1aa569f8695dae7ab9099981"
 SRC_URI[pin-project-lite-0.2.17.sha256sum] =3D "a89322df9ebe1c1578d689c923=
18e070967d1042b512afbe49518723f4e6d5cd"
@@ -1276,16 +1255,12 @@ SRC_URI[pwd-1.4.0.sha256sum] =3D "72c71c0c79b9701ef=
e4e1e4b563b2016dd4ee789eb99badc
 SRC_URI[pxfm-0.1.28.sha256sum] =3D "b5a041e753da8b807c9255f28de81879c78c87=
6392ff2469cde94799b2896b9d"
 SRC_URI[quick-error-2.0.1.sha256sum] =3D "a993555f31e5a609f617c12db6250ded=
cac1b0a85076912c436e6fc9b2c8e6a3"
 SRC_URI[quick-xml-0.39.4.sha256sum] =3D "cdcc8dd4e2f670d309a5f0e83fe36dfdc=
05af317008fea29144da1a2ac858e5e"
-SRC_URI[quick-xml-0.41.0.sha256sum] =3D "e660451e55124f798a69a5af3f49ccfbe=
fbd41910eefd25caf2393e1f3473ec1"
 SRC_URI[quick-xml-0.42.0.sha256sum] =3D "41b1177fdf999d2321d3fb46ff47159d9=
c1fb9ad66a4879f8c50a0b504615e9b"
-SRC_URI[quinn-0.11.9.sha256sum] =3D "b9e20a958963c291dc322d98411f541009df2=
ced7b5a4f2bd52337638cfccf20"
-SRC_URI[quinn-proto-0.11.15.sha256sum] =3D "4fcb935c5bec503c2f0e306bdd3e58=
bb9029dcb14fa8d9ac76e3a5256ac0763e"
-SRC_URI[quinn-udp-0.5.14.sha256sum] =3D "addec6a0dcad8a8d96a771f815f0eaf55=
f9d1805756410b39f5fa81332574cbd"
 SRC_URI[quote-1.0.47.sha256sum] =3D "1fbf4db142a473a8d80c26bbf18454ed458bf=
8d26c8219c331daecfdbd079001"
 SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f66=
57d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] =3D "f8dcc9c7d52a811697d2151c701e0d08956f92=
b0e24136cf4cf27b57a6a0d9bf"
-SRC_URI[rand-0.8.5.sha256sum] =3D "34af8d1a0e25924bc5b7c43c079c942339d8f0a=
8b57c39049bef581b46327404"
-SRC_URI[rand-0.9.2.sha256sum] =3D "6db2770f06117d490610c7488547d543617b21b=
fa07796d7a12f6f1bd53850d1"
+SRC_URI[rand-0.8.8.sha256sum] =3D "e058c7de0b26af77780c769414d6257830bb240=
f3c38477dbc2c16e5f54d6d4c"
+SRC_URI[rand-0.9.5.sha256sum] =3D "b9ef1d0d795eb7d84685bca4f72f3649f064e66=
41543d3a8c415898726a57b41"
 SRC_URI[rand-0.10.2.sha256sum] =3D "c7f5fa3a058cd35567ef9bfa5e75732bee0f9e=
4c55fa90477bef2dfcdbc4be80"
 SRC_URI[rand_chacha-0.3.1.sha256sum] =3D "e6c10a63a0fa32252be49d21e7709d4d=
4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_chacha-0.9.0.sha256sum] =3D "d3022b5f1df60f26e1ffddd6c66e8aa1=
5de382ae63b3a0c1bfc0e4d3e3f325cb"
@@ -1304,36 +1279,34 @@ SRC_URI[recvmsg-1.0.0.sha256sum] =3D "d3edd4d5d42c9=
2f0a659926464d4cce56b562761267e
 SRC_URI[redox_syscall-0.5.18.sha256sum] =3D "ed2bf2547551a7053d6fdfafda3f9=
38979645c44812fbfcda098faae3f1a362d"
 SRC_URI[redox_users-0.4.6.sha256sum] =3D "ba009ff324d1fc1b900bd1fdb31564fe=
be58a8ccc8a6fdbb93b543d33b13ca43"
 SRC_URI[redox_users-0.5.2.sha256sum] =3D "a4e608c6638b9c18977b00b475ac1f28=
d14e84b27d8d42f70e0bf1e3dec127ac"
-SRC_URI[reedline-0.52.1.sha256sum] =3D "cc0282eb061a7d039435f10075f22988e0=
dd7468901ee247a803021786afc662"
+SRC_URI[reedline-0.53.0.sha256sum] =3D "9b061d8059603bc95c569166a79ca60c01=
ccc8f8b6065035aed66a3753fdb06c"
 SRC_URI[ref-cast-1.0.25.sha256sum] =3D "f354300ae66f76f1c85c5f84693f0ce81d=
747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] =3D "b7186006dcb21920990093f30e3de=
a63b7d6e977bf1256be20c3563a5db070da"
 SRC_URI[regex-1.13.1.sha256sum] =3D "f020237b6c8eed93db2e2cb53c00c60a8e1bc=
73da7d073199a1180401450218d"
 SRC_URI[regex-automata-0.4.16.sha256sum] =3D "8fcfdb36bda0c880c5931cdc7a2b=
cdc8ba4556847b9d912bca70bc94708711ad"
 SRC_URI[regex-syntax-0.8.11.sha256sum] =3D "d6f6ff9a378485b298a5286656da66=
5ba74413d36db0979633275d2e708145d4"
 SRC_URI[relative-path-1.9.3.sha256sum] =3D "ba39f3699c378cd8970968dcbff9c4=
3159ea4cfbd88d43c00b22f2ef10a435d2"
-SRC_URI[reqwest-0.12.28.sha256sum] =3D "eddd3ca559203180a307f12d114c268abf=
583f59b03cb906fd0b3ff8646c1147"
 SRC_URI[ring-0.17.14.sha256sum] =3D "a4689e6c2294d81e88dc6261c768b63bc4fcd=
b852be6d1352498b114f61383b7"
-SRC_URI[rmcp-3.4.0.sha256sum] =3D "b23c62fe489ac1d401ab32688cfacac3737a897=
8dc3343e5361464c7724fd3cb"
-SRC_URI[rmcp-macros-3.4.0.sha256sum] =3D "cd740c45d66ceb87e5579082abc27bd7=
71665e464e9660a17a048c721b2a6025"
+SRC_URI[rmcp-3.9.0.sha256sum] =3D "d24a7e92f4bcaa36b97fa93c4fa7ca8f3e669ec=
ed949345b3462dba333c7f909"
+SRC_URI[rmcp-macros-3.9.0.sha256sum] =3D "b3140f24a766f80f9ec1607bde856809=
59a69b83d46fa9ce87dadab7e67ab029"
 SRC_URI[rmp-0.8.15.sha256sum] =3D "4ba8be72d372b2c9b35542551678538b562e7cf=
86c3315773cae48dfbfe7790c"
 SRC_URI[rmp-serde-1.3.1.sha256sum] =3D "72f81bee8c8ef9b577d1681a70ebbc962c=
232461e397b22c208c43c04b67a155"
 SRC_URI[roxmltree-0.21.1.sha256sum] =3D "f1964b10c76125c36f8afe190065a4bf9=
a87bf324842c05701330bba9f1cacbb"
 SRC_URI[rsqlite-vfs-0.1.1.sha256sum] =3D "c51c9ae4df8a7fba42103df5c621fa3c=
37eccf3a3c650879e90fc48b11cc192c"
-SRC_URI[rstest-0.27.0.sha256sum] =3D "948203e6d13b83e51a90d7cf236dd58a0065=
f23f4b902f00f306e7eb2bd09b9c"
-SRC_URI[rstest_macros-0.27.0.sha256sum] =3D "a8d92eaf7b6e51e12471d71ddc726=
08e7151573de44099aacfbb1128177c0da4"
-SRC_URI[rusqlite-0.40.2.sha256sum] =3D "23f2a97da3e3873c73cb2a2e71b35c40ff=
95e0b1eefa8d72d8499a6928c3b5b3"
-SRC_URI[rust_decimal-1.40.0.sha256sum] =3D "61f703d19852dbf87cbc513643fa81=
428361eb6940f1ac14fd58155d295a3eb0"
+SRC_URI[rstest-0.28.0.sha256sum] =3D "b376e512f30a7686a8dbc6aeaace99b3ade1=
c26c1c63473473a817ade226dafc"
+SRC_URI[rstest_macros-0.28.0.sha256sum] =3D "88512dbfb5b73a0dfa38aef7bc73b=
5657035fce477b923faf12d332dd83051ea"
+SRC_URI[rusqlite-0.41.1.sha256sum] =3D "da9bba6f3506135e120a6586df05be18b4=
8d18896600646a4bec8f993d91a594"
 SRC_URI[rustc-demangle-0.1.27.sha256sum] =3D "b50b8869d9fc858ce7266cce0194=
bd74df58b9d0e3f6df3a9fc8eb470d95c09d"
 SRC_URI[rustc-hash-2.1.2.sha256sum] =3D "94300abf3f1ae2e2b8ffb7b58043de3d3=
99c73fa6f4b73826402a5c457614dbe"
 SRC_URI[rustc_version-0.4.1.sha256sum] =3D "cfcb3a22ef46e85b45de6ee7e79d06=
3319ebb6594faafcf1c225ea92ab6e9b92"
 SRC_URI[rustix-0.38.44.sha256sum] =3D "fdb5bc1ae2baa591800df16c9ca78619bf6=
5c0488b41b96ccec5d11220d8c154"
 SRC_URI[rustix-1.1.4.sha256sum] =3D "b6fe4565b9518b83ef4f91bb47ce29620ca82=
8bd32cb7e408f0062e9930ba190"
-SRC_URI[rustls-0.23.45.sha256sum] =3D "0d41d731c7d2f962d1ccc364cec258de3c0=
e93b38c2fb3ba97ac74513048d634"
+SRC_URI[rustls-0.23.46.sha256sum] =3D "48e13bd8c0e9365c43cfa5c9e8f9ad49d3c=
8444926c9aac819e0e4dc503c8fdf"
 SRC_URI[rustls-native-certs-0.8.4.sha256sum] =3D "dab5152771c58876a2146916=
e53e35057e1a4dfa2b9df0f0305b07f611fdea4d"
 SRC_URI[rustls-pki-types-1.14.0.sha256sum] =3D "be040f8b0a225e40375822a563=
fa9524378b9d63112f53e19ffff34df5d33fdd"
 SRC_URI[rustls-platform-verifier-0.7.0.sha256sum] =3D "26d1e2536ce4f35f484=
6aa13bff16bd0ff40157cdb14cc056c7b14ba41233ba0"
 SRC_URI[rustls-platform-verifier-android-0.1.1.sha256sum] =3D "f87165f0995=
f63a9fbeea62b64d10b4d9d8e78ec6d7d51fb2125fda7bb36788f"
-SRC_URI[rustls-webpki-0.103.15.sha256sum] =3D "f3c3cf1d8b1e7d4927e2d154c3f=
cb02979afb9939629c62cd9048d4f07b60ac2"
+SRC_URI[rustls-webpki-0.103.16.sha256sum] =3D "4443b1b6d39d7c663139942cc45=
58262562d2c84123bb6282ef177009ca8b281"
 SRC_URI[rustversion-1.0.22.sha256sum] =3D "b39cdef0fa800fc44525c84ccb54a02=
9961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ryu-1.0.23.sha256sum] =3D "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5=
cccb8cc655a4e50009e06477f"
 SRC_URI[same-file-1.0.6.sha256sum] =3D "93fc1dc3aaa9bfed95e02e6eadabb4baf7=
e3078b0bd1b4d7b6b0b68378900502"
@@ -1346,7 +1319,7 @@ SRC_URI[security-framework-sys-2.17.0.sha256sum] =3D =
"6ce2691df843ecc5d231c0b14ece
 SRC_URI[self_cell-1.2.2.sha256sum] =3D "b12e76d157a900eb52e81bc6e9f3069344=
290341720e9178cde2407113ac8d89"
 SRC_URI[semver-1.0.28.sha256sum] =3D "8a7852d02fc848982e0c167ef163aaff9cd9=
1dc640ba85e263cb1ce46fae51cd"
 SRC_URI[serde-1.0.229.sha256sum] =3D "4148590afebada386688f18773da617792bf=
2ef03ffc1e4cbd2b1d45b023e0ba"
-SRC_URI[serde-saphyr-1.3.0.sha256sum] =3D "b8050abb251097357e24aff63ba2c52=
a6309ecb7d23a5474023df960a02694d8"
+SRC_URI[serde-saphyr-2.0.0.sha256sum] =3D "a253edfdea34032da21af84e16fcc94=
f4c7a6ba237f9f3bc2dbf43cea8535c44"
 SRC_URI[serde_core-1.0.229.sha256sum] =3D "67dca2c9c51e58a4791a4b1ed58308b=
39c64224d349a935ab5039aa360942a48"
 SRC_URI[serde_derive-1.0.229.sha256sum] =3D "e7a5d71263a5a7d47b41f6b3f06ba=
276f10cc18b0931f1799f710578e2309348"
 SRC_URI[serde_derive_internals-0.29.1.sha256sum] =3D "18d26a20a969b9e3fdf2=
fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
@@ -1390,13 +1363,12 @@ SRC_URI[symlink-0.1.0.sha256sum] =3D "a7973cce66684=
64ea31f176d85b13c7ab3bba2cb3b77
 SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3bafa6=
7b529ead792a6d0160888b4237"
 SRC_URI[syn-2.0.117.sha256sum] =3D "e665b8803e7b1d2a727f4023456bbbbe74da67=
099c585258af0ad9c5013b9b99"
 SRC_URI[syn-3.0.4.sha256sum] =3D "e6275cddf4610d1775e6d1fe9469b2e77d0f39fd=
98fb7450901b821e0c53649f"
-SRC_URI[sync_wrapper-1.0.2.sha256sum] =3D "0bf256ce5efdfa370213c1dabab5935=
a12e49f2c58d15e9eac2870d3b4f27263"
 SRC_URI[synchronoise-1.0.1.sha256sum] =3D "3dbc01390fc626ce8d1cffe3376ded2=
b72a11bb70e1c75f404a210e4daa4def2"
 SRC_URI[synstructure-0.13.2.sha256sum] =3D "728a70f3dbaf5bab7f0c4b1ac8d7ae=
5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[sys-locale-0.3.2.sha256sum] =3D "8eab9a99a024a169fe8a903cf9d4a3b36=
01109bcc13bd9e3c6fff259138626c4"
 SRC_URI[sysinfo-0.39.6.sha256sum] =3D "d2071df9448915b71c4fe6d25deaf1c22f1=
2bd234f01540b77312bb8e41361e6"
 SRC_URI[tabled-0.22.0.sha256sum] =3D "2d2596a104db1900b943f97d793a6c99addc=
a918c4525c999f751a0f17d472eb"
-SRC_URI[tango-bench-0.8.0.sha256sum] =3D "046b4d8c503bdcd19f78c1ac59d6d504=
e8675fdd95fadba71f47c86eb3688f93"
+SRC_URI[tango-bench-0.9.0.sha256sum] =3D "9b0ba05a1f5afd669746c89634423b34=
23020050b81405bb3e9a4364f56f64d9"
 SRC_URI[tempfile-3.27.0.sha256sum] =3D "32497e9a4c7b38532efcdebeef879707aa=
9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[termcolor-1.4.1.sha256sum] =3D "06794f8f6c5c898b3275aebefa6b8a1cb2=
4cd2c6c79397ab15774837a0bc5755"
 SRC_URI[terminal_size-0.4.3.sha256sum] =3D "60b8cb979cb11c32ce1603f8137b22=
262a9d131aaa5c37b5678025f22b8becd0"
@@ -1414,13 +1386,8 @@ SRC_URI[time-0.3.55.sha256sum] =3D "cdb87b95ec50ddfa=
440816d227a17b2ccbdda963a316a7
 SRC_URI[time-core-0.1.9.sha256sum] =3D "9e1c906769ad99c88eaa54e728060edef0=
82f8e358ff32030cb7c7d315e81109"
 SRC_URI[time-macros-0.2.32.sha256sum] =3D "7e689342a48d2ea927c87ea50cabf85=
94854bf940e9310208848d680d668ed85"
 SRC_URI[tinystr-0.8.2.sha256sum] =3D "42d3e9c45c09de15d06dd8acf5f4e0e399e8=
5927b7f00711024eb7ae10fa4869"
-SRC_URI[tinyvec-1.10.0.sha256sum] =3D "bfa5fdc3bce6191a1dbc8c02d5c8bffcf55=
7bafa17c124c5264a458f1b0613fa"
-SRC_URI[tinyvec_macros-0.1.1.sha256sum] =3D "1f3ccbac311fea05f86f61904b462=
b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[titlecase-3.6.0.sha256sum] =3D "eb567088a91d59b492520c8149e2be5ce1=
0d5deb2d9a383f3378df3259679d40"
-SRC_URI[tokio-1.53.1.sha256sum] =3D "202caea871b69668250d242070849eb495be1=
78ed697a3e98aebce5bc81a0bed"
+SRC_URI[tokio-1.54.1.sha256sum] =3D "b52fd3255258d26fac7264ab5a76b53c13367=
136dc011d3d6ad4f8ed070396a3"
 SRC_URI[tokio-macros-2.7.0.sha256sum] =3D "385a6cb71ab9ab790c5fe8d67f1645e=
6c450a7ce006a33de03daa956cf70a496"
-SRC_URI[tokio-native-tls-0.3.1.sha256sum] =3D "bbae76ab933c85776efabc97156=
9dd6119c580d8f5d448769dec1764bf796ef2"
-SRC_URI[tokio-rustls-0.26.4.sha256sum] =3D "1729aa945f29d91ba541258c8df890=
27d5792d85a8841fb65e8bf0f4ede4ef61"
 SRC_URI[tokio-stream-0.1.18.sha256sum] =3D "32da49809aab5c3bc678af03902d4c=
cddea2a87d028d86392a4b1560c6906c70"
 SRC_URI[tokio-util-0.7.18.sha256sum] =3D "9ae9cec805b01e8fc3fd2fe289f89149=
a9b66dd16786abd8b19cfa7b48cb0098"
 SRC_URI[toml-1.1.4+spec-1.1.0.sha256sum] =3D "3aace63f4bbcdfc2c965b059de67=
119c89c4017a70d633be6c104910f67056f5"
@@ -1428,9 +1395,6 @@ SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] =3D=
 "3165f65f62e28e0115a00b2ebdd
 SRC_URI[toml_edit-0.25.13+spec-1.1.0.sha256sum] =3D "6975367e4d2ef766d86af=
01ffad14b622fecc8d4357a998fbc4deb6e9bacaf9b"
 SRC_URI[toml_parser-1.1.3+spec-1.1.0.sha256sum] =3D "1d38ac1cf9b95face3229=
6c0a3ede1fdc270627c9d9c02a7274dd6d960dc4d56"
 SRC_URI[toml_writer-1.1.2+spec-1.1.0.sha256sum] =3D "7d56353a2a665ad0f41a4=
21187180aab746c8c325620617ad883a99a1cbe66d2"
-SRC_URI[tower-0.5.3.sha256sum] =3D "ebe5ef63511595f1344e2d5cfa636d973292ad=
c0eec1f0ad45fae9f0851ab1d4"
-SRC_URI[tower-http-0.6.8.sha256sum] =3D "d4e6559d53cc268e5031cd8429d05415b=
c4cb4aefc4aa5d6cc35fbf5b924a1f8"
-SRC_URI[tower-layer-0.3.3.sha256sum] =3D "121c2a6cda46980bb0fcd1647ffaf6cd=
3fc79a013de288782836f6df9c48780e"
 SRC_URI[tower-service-0.3.3.sha256sum] =3D "8df9b6e13f2d32c91b9bd719c00d19=
58837bc7dec474d94952798cc8e69eeec3"
 SRC_URI[tracing-0.1.44.sha256sum] =3D "63e71662fa4b2a2c3a26f570f037eb95bb1=
f85397f3cd8076caed2f026a6d100"
 SRC_URI[tracing-appender-0.2.5.sha256sum] =3D "050686193eb999b4bb3bc2acfa8=
91a13da00f79734704c4b8b4ef1a10b368a3c"
@@ -1440,19 +1404,19 @@ SRC_URI[tracing-log-0.2.0.sha256sum] =3D "ee855f1f4=
00bd0e5c02d150ae5de3840039a3f54
 SRC_URI[tracing-subscriber-0.3.22.sha256sum] =3D "2f30143827ddab0d256fd843=
b7a66d164e9f271cfa0dde49142c5ca0ca291f1e"
 SRC_URI[trash-5.2.9.sha256sum] =3D "be89b3fe156965d29ac4f8522f3a640c655aff=
dd9f21cb4f36857f0c92c00317"
 SRC_URI[tree_magic_mini-3.2.2.sha256sum] =3D "b8765b90061cba6c22b5831f675d=
a109ae5561588290f9fa2317adab2714d5a6"
-SRC_URI[try-lock-0.2.5.sha256sum] =3D "e421abadd41a4225275504ea4d656692341=
8b7f05506fbc9c0fe86ba7396114b"
 SRC_URI[tui-tree-widget-0.24.0.sha256sum] =3D "deca119555009eee2e0cfb9c020=
f39f632444dc4579918d5fc009d51d75dff92"
 SRC_URI[type-map-0.5.1.sha256sum] =3D "cb30dbbd9036155e74adad6812e9898d03e=
c374946234fbcebd5dfc7b9187b90"
-SRC_URI[typed-path-0.12.3.sha256sum] =3D "8e28f89b80c87b8fb0cf04ab448d5dd0=
dd0ade2f8891bae878de66a75a28600e"
+SRC_URI[typed-path-0.13.0.sha256sum] =3D "9ce898823d8cd0f028662d2f349694b1=
af0a5cc9be83f1d213a00d3147445e1e"
 SRC_URI[typeid-1.0.3.sha256sum] =3D "bc7d623258602320d5c55d1bc22793b57daff=
0ec7efc270ea7d55ce1d5f5471c"
 SRC_URI[typenum-1.20.1.sha256sum] =3D "b6f5e870be6c3b371b77fe0ee0bafb859fa=
4964b4404c27de1d380043c4dda20"
 SRC_URI[typetag-0.2.21.sha256sum] =3D "be2212c8a9b9bcfca32024de14998494cf9=
a5dfa59ea1b829de98bac374b86bf"
 SRC_URI[typetag-impl-0.2.21.sha256sum] =3D "27a7a9b72ba121f6f1f6c3632b8560=
4cac41aedb5ddc70accbebb6cac83de846"
 SRC_URI[ucd-trie-0.1.7.sha256sum] =3D "2896d95c02a80c6d6a5d6e953d479f5ddf2=
dfdb6a244441010e373ac0fb88971"
 SRC_URI[umask-2.1.0.sha256sum] =3D "ec9a46c2549e35c054e0ffe281a3a6ec000779=
3db4df106604d37ed3f4d73d1c"
+SRC_URI[uncased-0.9.10.sha256sum] =3D "e1b88fcfe09e89d3866a5c11019378088af=
2d24c3fbd4f0543f96b479ec90697"
 SRC_URI[unic-langid-0.9.6.sha256sum] =3D "a28ba52c9b05311f4f6e62d5d9d46f09=
4bd6e84cb8df7b3ef952748d752a7d05"
 SRC_URI[unic-langid-impl-0.9.6.sha256sum] =3D "dce1bf08044d4b7a94028c93786=
f8566047edc11110595914de93362559bc658"
-SRC_URI[unicase-2.9.0.sha256sum] =3D "dbc4bc3a9f746d862c45cb89d705aa10f187=
bb96c76001afab07a0d35ce60142"
+SRC_URI[unicase-2.10.0.sha256sum] =3D "357cc3acc6a036009fd6c973ed009037c73=
2d60d0b4f6c673e9041497482a28f"
 SRC_URI[unicode-id-0.3.6.sha256sum] =3D "70ba288e709927c043cbe476718d37be3=
06be53fb1fafecd0dbe36d072be2580"
 SRC_URI[unicode-ident-1.0.24.sha256sum] =3D "e6e4313cd5fcd3dad5cafa179702e=
2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[unicode-linebreak-0.1.5.sha256sum] =3D "3b09c83c3c29d37506a3e260c0=
8c03743a6bb66a9cd432c6934ab501a190571f"
@@ -1463,7 +1427,6 @@ SRC_URI[unicode-width-0.2.2.sha256sum] =3D "b4ac048d7=
1ede7ee76d585517add45da530660
 SRC_URI[unicode-xid-0.2.6.sha256sum] =3D "ebc1c04c71510c7f702b52b7c350734c=
9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[unit-prefix-0.5.2.sha256sum] =3D "81e544489bf3d8ef66c953931f56617f=
423cd4b5494be343d9b9d3dda037b9a3"
 SRC_URI[untrusted-0.9.0.sha256sum] =3D "8ecb6da28b8a351d773b68d5825ac39017=
e680750f980f3a1a85cd8dd28a47c1"
-SRC_URI[update-informer-1.3.0.sha256sum] =3D "67b27dcf766dc6ad64c208520162=
6e1a7955dc1983532bfc8406d552903ace2a"
 SRC_URI[ureq-3.4.0.sha256sum] =3D "972d7902c8735f2695410b8aed7df6ed12a4739=
4aa1c8d7af49f0497b731a94d"
 SRC_URI[ureq-proto-0.6.1.sha256sum] =3D "da5f78b09e6941e1a0f2e30e695e4b120=
377b54d5e0aec11b594bb57b3971613"
 SRC_URI[url-2.5.8.sha256sum] =3D "ff67a8a4397373c3ef660812acab326822203501=
0ab8680ec4215f38ba3d0eed"
@@ -1480,21 +1443,21 @@ SRC_URI[uu_uname-0.12.0.sha256sum] =3D "53566dcd5e3=
85c71e1fb277f1ebd5db0d3f04795fa
 SRC_URI[uu_whoami-0.12.0.sha256sum] =3D "c1267f81972136719195877c21cefd2fb=
1bc821c8fb692d16f8b0ce4b717108c"
 SRC_URI[uucore-0.12.0.sha256sum] =3D "f24a5910ebbf2c0baf486a9125705f8e026a=
8f7741a3ea8cf5eca3c9257c9bdf"
 SRC_URI[uucore_procs-0.12.0.sha256sum] =3D "50aa1f3bba55168888ae6f1f2714ce=
58897d8020d742d21f474f01e86468fedd"
-SRC_URI[uuid-1.26.0.sha256sum] =3D "b5772d71c9be8a8a6ac2117d949c5b224c1b72=
241bb611d9a3012edcf8af7812"
+SRC_URI[uuid-1.29.0.sha256sum] =3D "4a0e2d11620c50695fe12bbbfde96b3477fe60=
6e7284c22d505c12ce51214514"
 SRC_URI[v_escape-base-0.1.0.sha256sum] =3D "f1212fce830b75af194b578e55b3db=
9049f2c8c45f58d397fb25602fdb50fb3d"
 SRC_URI[v_htmlescape-0.17.0.sha256sum] =3D "befb3d53c9e3ec641417685896cbc8=
cc5bd264d6a2e190c56aaef1af24740d99"
 SRC_URI[valuable-0.1.1.sha256sum] =3D "ba73ea9cf16a25df0c8caa16c51acb937d5=
712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[vcpkg-0.2.15.sha256sum] =3D "accd4ea62f7bb7a82fe23066fb0957d48ef67=
7f6eeb8215f372f52e48bb32426"
 SRC_URI[version_check-0.9.5.sha256sum] =3D "0b928f33d975fc6ad9f86c8f283853=
ad26bdd5b10b7f1542aa2fa15e2289105a"
+SRC_URI[vt100-0.18.1.sha256sum] =3D "eb05cdd19ae8707bf6a0a269972c07e635810=
3a7079faec749dec318a5b3dc23"
 SRC_URI[vte-0.14.1.sha256sum] =3D "231fdcd7ef3037e8330d8e17e61011a2c244126=
acc0a982f4040ac3f9f0bc077"
+SRC_URI[vte-0.15.0.sha256sum] =3D "a5924018406ce0063cd67f8e008104968b74b56=
3ee1b85dde3ed1f7cb87d3dbd"
 SRC_URI[wait-timeout-0.2.1.sha256sum] =3D "09ac3b126d3914f9849036f826e054c=
babdc8519970b8998ddaf3b5bd3c65f11"
 SRC_URI[walkdir-2.5.0.sha256sum] =3D "29790946404f91d9c5d06f9874efddea1dc0=
6c5efe94541a7d6863108e3a5e4b"
-SRC_URI[want-0.3.1.sha256sum] =3D "bfa7760aed19e106de2c7c0b581b509f2f25d3d=
acaf737cb82ac61bc6d760b0e"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D "ccf3ec651a847eb=
01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
 SRC_URI[wasip2-1.0.2+wasi-0.2.9.sha256sum] =3D "9517f9239f02c069db75e65f17=
4b3da828fe5f5b945c4dd26bd25d89c03ebcf5"
 SRC_URI[wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06.sha256sum] =3D "5428f8bf88ea=
5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
 SRC_URI[wasm-bindgen-0.2.114.sha256sum] =3D "6532f9a5c1ece3798cb1c2cfdba64=
0b9b3ba884f5db45973a6f442510a87d38e"
-SRC_URI[wasm-bindgen-futures-0.4.64.sha256sum] =3D "e9c5522b3a28661442748e=
09d40924dfb9ca614b21c00d3fd135720e48b67db8"
 SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] =3D "18a2d50fcf105fb33bb15f0=
0e7a77b772945a2ee45dcf454961fd843e74c18e6"
 SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] =3D "03ce4caeaac547c=
df713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3"
 SRC_URI[wasm-bindgen-shared-0.2.114.sha256sum] =3D "75a326b8c223ee17883a42=
51907455a2431acc2791c98c26279376490c378c16"
@@ -1508,10 +1471,9 @@ SRC_URI[wayland-protocols-0.32.11.sha256sum] =3D "b2=
3b5df31ceff1328f06ac607591d5ba
 SRC_URI[wayland-protocols-wlr-0.3.11.sha256sum] =3D "78248e4cc0eff8163370b=
a5c158630dcae1f3497a586b826eca2ef5f348d6235"
 SRC_URI[wayland-scanner-0.31.9.sha256sum] =3D "c86287151a309799b821ca709b7=
345a048a2956af05957c89cb824ab919fa4e3"
 SRC_URI[wayland-sys-0.31.10.sha256sum] =3D "374f6b70e8e0d6bf9461a32988fd55=
3b59ff630964924dad6e4a4eb6bd538d17"
-SRC_URI[web-sys-0.3.91.sha256sum] =3D "854ba17bb104abfb26ba36da9729addc7ce=
7f06f5c0f90f3c391f8461cca21f9"
 SRC_URI[web-time-1.1.0.sha256sum] =3D "5a6580f308b1fad9207618087a65c04e7a1=
0bc77e02c8e84e9b00dd4b12fa0bb"
-SRC_URI[webpki-root-certs-1.0.6.sha256sum] =3D "804f18a4ac2676ffb4e8b5b5fa=
9ae38af06df08162314f96a68d2a363e21a8ca"
-SRC_URI[webpki-roots-1.0.9.sha256sum] =3D "7dcd9d09a39985f5344844e66b0c530=
a33843579125f23e21e9f0f220850f22a"
+SRC_URI[webpki-root-certs-1.0.10.sha256sum] =3D "58ec80e73fd8baf57bf0d9615=
554c75348bda990d6d5bbeab964dd068319fecb"
+SRC_URI[webpki-roots-1.0.10.sha256sum] =3D "1c1c8e20c8a38fc7d65abfe74eb728=
0e4aa667e8eec8bc84996d2874810748d9"
 SRC_URI[weezl-0.1.12.sha256sum] =3D "a28ac98ddc8b9274cb41bb4d9d4d5c425b602=
0c50c46f25559911905610b4a88"
 SRC_URI[which-4.4.2.sha256sum] =3D "87ba24419a2078cd2b0f2ede2691b6c66d8e47=
836da3b6db8265ebad47afbfc7"
 SRC_URI[which-8.0.6.sha256sum] =3D "bae2f2b2b816647a1cab1acc91f5bd20812d53=
cb344382635ec2181940c8034f"
@@ -1586,7 +1548,7 @@ SRC_URI[writeable-0.6.2.sha256sum] =3D "9edde0db4769d=
2dc68579893f2306b26c6ecfbe0ef
 SRC_URI[x11rb-0.13.2.sha256sum] =3D "9993aa5be5a26815fe2c3eacfc1fde061fc1a=
1f094bf1ad2a18bf9c495dd7414"
 SRC_URI[x11rb-protocol-0.13.2.sha256sum] =3D "ea6fc2961e4ef194dcbfe56bb845=
534d0dc8098940c7e5c012a258bfec6701bd"
 SRC_URI[xattr-1.6.1.sha256sum] =3D "32e45ad4206f6d2479085147f02bc2ef834ac8=
5886624a23575ae137c8aa8156"
-SRC_URI[xxhash-rust-0.8.15.sha256sum] =3D "fdd20c5420375476fbd4394763288da=
7eb0cc0b8c11deed431a91562af7335d3"
+SRC_URI[xxhash-rust-0.8.19.sha256sum] =3D "550a2b930b62486a393c52d5c3b84bf=
f264b28aa437ed64694d31e93b1757af7"
 SRC_URI[yansi-1.0.1.sha256sum] =3D "cfe53a6657fd280eaa890a3bc59152892ffa3e=
30101319d168b781ed6529b049"
 SRC_URI[yoke-0.8.1.sha256sum] =3D "72d6e5c6afb84d73944e5cedb052c4680d56573=
37201555f9f2a16b7406d4954"
 SRC_URI[yoke-derive-0.8.1.sha256sum] =3D "b659052874eb698efe5b9e8cf3822046=
78a0086ebf46982b79d6ca3182927e5d"
@@ -1600,7 +1562,7 @@ SRC_URI[zeroize-1.8.2.sha256sum] =3D "b97154e67e32c85=
465826e8bcc1c59429aaaf107c1e4
 SRC_URI[zerotrie-0.2.3.sha256sum] =3D "2a59c17a5562d507e4b54960e8569ebee33=
bee890c70aa3fe7b97e85a9fd7851"
 SRC_URI[zerovec-0.11.5.sha256sum] =3D "6c28719294829477f525be0186d13efa9a3=
c602f7ec202ca9e353d310fb9a002"
 SRC_URI[zerovec-derive-0.11.2.sha256sum] =3D "eadce39539ca5cb3985590102671=
f2567e659fca9666581ad3411d59207951f3"
-SRC_URI[zip-8.6.0.sha256sum] =3D "2d04a6b5381502aa6087c94c669499eb1602eb9c=
5e8198e534de571f7154809b"
+SRC_URI[zip-9.1.3.sha256sum] =3D "1156b39d142a34b999c2310a50455e0cb3760bf7=
efad0122f796d813bee26ccb"
 SRC_URI[zlib-rs-0.6.3.sha256sum] =3D "3be3d40e40a133f9c916ee3f9f4fa2d9d634=
35b5fbe1bfc6d9dae0aa0ada1513"
 SRC_URI[zmij-1.0.21.sha256sum] =3D "b8848ee67ecc8aedbaf3e4122217aff8926392=
31befc6a1b58d29fff4c2cabaa"
 SRC_URI[zopfli-0.8.3.sha256sum] =3D "f05cd8797d63865425ff89b5c4a48804f35ba=
0ce8d125800027ad6017d2b5249"
diff --git a/meta-oe/recipes-extended/nushell/nushell/0005-nu-dap-Use-porta=
ble-atomic-for-64-bit-atomics-on-tar.patch b/meta-oe/recipes-extended/nushe=
ll/nushell/0005-nu-dap-Use-portable-atomic-for-64-bit-atomics-on-tar.patch
index 1c53dd0a38..35e8b4a61d 100644
--- a/meta-oe/recipes-extended/nushell/nushell/0005-nu-dap-Use-portable-ato=
mic-for-64-bit-atomics-on-tar.patch
+++ b/meta-oe/recipes-extended/nushell/nushell/0005-nu-dap-Use-portable-ato=
mic-for-64-bit-atomics-on-tar.patch
@@ -22,9 +22,11 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  src/state.rs        | 2 +-
  4 files changed, 15 insertions(+), 2 deletions(-)
=20
+diff --git a/Cargo.toml b/Cargo.toml
+index 61635bf..f2324dc 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
-@@ -101,6 +101,11 @@
+@@ -101,6 +101,11 @@ default-features =3D false
  [dev-dependencies.typetag]
  version =3D "0.2"
=20=20
@@ -34,11 +36,13 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 +default-features =3D false
 +
  [target."cfg(unix)".dependencies.libc]
- version =3D "0.2.185"
+ version =3D "0.2.189"
=20=20
+diff --git a/src/dap/protocol.rs b/src/dap/protocol.rs
+index ce4eee8..cec1ef6 100644
 --- a/src/dap/protocol.rs
 +++ b/src/dap/protocol.rs
-@@ -9,7 +9,9 @@
+@@ -9,7 +9,9 @@ use serde::{Deserialize, Serialize};
  use serde_json::Value as Json;=0D
  use std::io::{BufRead, Write};=0D
  use std::sync::Arc;=0D
@@ -49,6 +53,8 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  =0D
  #[derive(Debug, Deserialize)]=0D
  pub struct Request {=0D
+diff --git a/src/lib.rs b/src/lib.rs
+index 7139b3d..21b55dd 100644
 --- a/src/lib.rs
 +++ b/src/lib.rs
 @@ -35,6 +35,12 @@
@@ -64,9 +70,11 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  mod debugger;=0D
  mod engine;=0D
  mod eval_scratch;=0D
+diff --git a/src/state.rs b/src/state.rs
+index e17e4e6..f08e7fa 100644
 --- a/src/state.rs
 +++ b/src/state.rs
-@@ -425,7 +425,7 @@
+@@ -425,7 +425,7 @@ pub(crate) struct UiReply {
  pub(crate) struct UiBridge {=0D
      pub replies: Mutex<HashMap<u64, UiReply>>,=0D
      pub cv: Condvar,=0D
diff --git a/meta-oe/recipes-extended/nushell/nushell/0006-Cargo.lock-Add-p=
ortable-atomic-to-patched-crates.patch b/meta-oe/recipes-extended/nushell/n=
ushell/0006-Cargo.lock-Add-portable-atomic-to-patched-crates.patch
index 48d1706b54..854bdac3fd 100644
--- a/meta-oe/recipes-extended/nushell/nushell/0006-Cargo.lock-Add-portable=
-atomic-to-patched-crates.patch
+++ b/meta-oe/recipes-extended/nushell/nushell/0006-Cargo.lock-Add-portable=
-atomic-to-patched-crates.patch
@@ -13,9 +13,11 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  Cargo.lock | 4 ++++
  1 file changed, 4 insertions(+)
=20
+diff --git a/Cargo.lock b/Cargo.lock
+index a621b2f..bc94b5a 100644
 --- a/Cargo.lock
 +++ b/Cargo.lock
-@@ -1629,6 +1629,7 @@
+@@ -1625,6 +1625,7 @@ dependencies =3D [
   "notify 9.0.0-rc.4",
   "parking_lot",
   "pathdiff",
@@ -23,15 +25,15 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
   "rayon",
   "regex",
   "regex-syntax",
-@@ -3732,6 +3733,7 @@
-  "os_pipe",
+@@ -3665,6 +3666,7 @@ dependencies =3D [
+  "parse_datetime",
   "pathdiff",
   "percent-encoding",
 + "portable-atomic",
   "print-positions",
-  "procfs",
   "pure-rust-locales",
-@@ -3812,6 +3814,7 @@
+  "quick-xml 0.42.0",
+@@ -3742,6 +3744,7 @@ dependencies =3D [
   "nu-protocol",
   "nu-utils",
   "parking_lot",
@@ -39,8 +41,8 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
   "serde",
   "serde_json",
   "windows-sys 0.61.2",
-@@ -5512,6 +5515,7 @@
-  "indexmap",
+@@ -5381,6 +5384,7 @@ dependencies =3D [
+  "libc",
   "pastey",
   "pin-project-lite",
 + "portable-atomic",
diff --git a/meta-oe/recipes-extended/nushell/nushell_0.116.1.bb b/meta-oe/=
recipes-extended/nushell/nushell_0.117.0.bb
similarity index 82%
rename from meta-oe/recipes-extended/nushell/nushell_0.116.1.bb
rename to meta-oe/recipes-extended/nushell/nushell_0.117.0.bb
index 3d33daaee9..2527c6ac88 100644
--- a/meta-oe/recipes-extended/nushell/nushell_0.116.1.bb
+++ b/meta-oe/recipes-extended/nushell/nushell_0.117.0.bb
@@ -14,14 +14,14 @@ DEPENDS =3D "libgit2 sqlite3"
=20
 SRC_URI =3D "crate://crates.io/nu/${PV};name=3Dnu"
 SRC_URI +=3D " \
-    file://0001-musl-riscv32-Add-syscall-numbers-443-to-450.patch;patchdir=
=3D${CARGO_VENDORING_DIRECTORY}/libc-0.2.186 \
+    file://0001-musl-riscv32-Add-syscall-numbers-443-to-450.patch;patchdir=
=3D${CARGO_VENDORING_DIRECTORY}/libc-0.2.189 \
     file://0002-Use-portable-atomic-for-AtomicU64-on-targets-without.patch=
;patchdir=3D${CARGO_VENDORING_DIRECTORY}/fff-search-0.11.0 \
-    file://0003-Use-portable-atomic-for-AtomicU64-on-targets-without.patch=
;patchdir=3D${CARGO_VENDORING_DIRECTORY}/rmcp-3.4.0 \
-    file://0004-nu-command-Use-portable-atomic-for-AtomicU64-on-targ.patch=
;patchdir=3D${CARGO_VENDORING_DIRECTORY}/nu-command-0.116.1 \
-    file://0005-nu-dap-Use-portable-atomic-for-64-bit-atomics-on-tar.patch=
;patchdir=3D${CARGO_VENDORING_DIRECTORY}/nu-dap-0.116.1 \
+    file://0003-Use-portable-atomic-for-AtomicU64-on-targets-without.patch=
;patchdir=3D${CARGO_VENDORING_DIRECTORY}/rmcp-3.9.0 \
+    file://0004-nu-command-Use-portable-atomic-for-AtomicU64-on-targ.patch=
;patchdir=3D${CARGO_VENDORING_DIRECTORY}/nu-command-0.117.0 \
+    file://0005-nu-dap-Use-portable-atomic-for-64-bit-atomics-on-tar.patch=
;patchdir=3D${CARGO_VENDORING_DIRECTORY}/nu-dap-0.117.0 \
     file://0006-Cargo.lock-Add-portable-atomic-to-patched-crates.patch \
 "
-SRC_URI[nu.sha256sum] =3D "62e21f2d6a14430ae2701a4e6f11be42d40a11204c204be=
f32a8b9879f79e767"
+SRC_URI[nu.sha256sum] =3D "136fc734fe97c961c84d1d5b77c629b36a15ca24204b2d6=
2dcd7920ed0d56e29"
=20
 S =3D "${CARGO_VENDORING_DIRECTORY}/nu-${PV}"
=20
