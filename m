Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3512C55ABC
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:19:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10174.1785820770420675870
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BnV0yLOX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820770; x=1817356770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xCrIoFUbpPMprSZqQTh9ynRU6K+0t2U34e0LC3+leAE=;
  b=BnV0yLOXjQulmHeosseVgiO8iC1nNmMwf8/MDju0vP4j4fFtG1G0YN6/
   H40TD0OLRx6qtxmCY7jEXzKofSIrtjj8bwVpJogeP1kt5E+wV9+CZccPb
   rZifDA+ql5TwjE27G8sB8ySPnOjhzfTxO1DF26NYa+LqWKgfNlFz43IDq
   ZqmolDp7UPTDaZwhb146NWNrSAxKwfwW6GIk62Taj1lVnwctCsCygIXsa
   F7lGEHFi7qe7yoGMr7SYKMrPPUJClmjCV6GLYWXGKfDAPqe65E8+OdxAw
   +w6f5BuPoE47kfCcWQlY3cnIDdyrYs5ykGsQZjddPsQFpdIQO8WlQORiv
   g==;
X-CSE-ConnectionGUID: 6ZBTNYNMQ7OVhNSc9q1+UQ==
X-CSE-MsgGUID: iqb6vCPgSR+8nIgGNb/ZWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="235804240"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="235804240"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:19:29 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D48F41541
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:28 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 855D11C00142
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id A04821800139;
	Tue,  4 Aug 2026 05:19:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/28] python3-ruff: upgrade 0.16.0 -> 0.16.1
Date: Tue,  4 Aug 2026 13:17:21 +0800
Message-ID: <20260804051726.1489-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128728

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-ruff-crates.inc            | 118 +++++++++---------
 ...-ruff_0.16.0.bb => python3-ruff_0.16.1.bb} |   2 +-
 2 files changed, 57 insertions(+), 63 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruff_0.16.0.bb => python3-ruff_0.16.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-ruff-crates.inc b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
index 7d22918d9d..b61f90df0d 100644
--- a/meta-python/recipes-devtools/python/python3-ruff-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
@@ -18,7 +18,7 @@ SRC_URI += " \
     crate://crates.io/anstyle-query/1.1.4 \
     crate://crates.io/anstyle-svg/0.1.11 \
     crate://crates.io/anstyle-wincon/3.0.10 \
-    crate://crates.io/anyhow/1.0.103 \
+    crate://crates.io/anyhow/1.0.104 \
     crate://crates.io/approx/0.5.1 \
     crate://crates.io/arc-swap/1.9.2 \
     crate://crates.io/argfile/1.0.0 \
@@ -31,7 +31,7 @@ SRC_URI += " \
     crate://crates.io/bit-set/0.8.0 \
     crate://crates.io/bit-vec/0.8.0 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.13.0 \
+    crate://crates.io/bitflags/2.13.1 \
     crate://crates.io/bitvec/1.1.1 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/block2/0.6.2 \
@@ -54,12 +54,12 @@ SRC_URI += " \
     crate://crates.io/ciborium/0.2.2 \
     crate://crates.io/ciborium-io/0.2.2 \
     crate://crates.io/ciborium-ll/0.2.2 \
-    crate://crates.io/clap/4.6.1 \
-    crate://crates.io/clap_builder/4.6.0 \
+    crate://crates.io/clap/4.6.4 \
+    crate://crates.io/clap_builder/4.6.2 \
     crate://crates.io/clap_complete/4.5.58 \
     crate://crates.io/clap_complete_command/0.6.1 \
     crate://crates.io/clap_complete_nushell/4.5.8 \
-    crate://crates.io/clap_derive/4.6.1 \
+    crate://crates.io/clap_derive/4.6.4 \
     crate://crates.io/clap_lex/1.0.0 \
     crate://crates.io/clearscreen/4.0.6 \
     crate://crates.io/codspeed/5.0.1 \
@@ -75,7 +75,7 @@ SRC_URI += " \
     crate://crates.io/condtype/1.3.0 \
     crate://crates.io/console/0.16.4 \
     crate://crates.io/console_error_panic_hook/0.1.7 \
-    crate://crates.io/console_log/1.0.0 \
+    crate://crates.io/console_log/1.1.0 \
     crate://crates.io/core-foundation-sys/0.8.7 \
     crate://crates.io/countme/3.0.1 \
     crate://crates.io/cpufeatures/0.2.17 \
@@ -135,7 +135,7 @@ SRC_URI += " \
     crate://crates.io/futures-core/0.3.32 \
     crate://crates.io/futures-task/0.3.32 \
     crate://crates.io/futures-util/0.3.32 \
-    crate://crates.io/gen-lsp-types/0.10.0 \
+    crate://crates.io/gen-lsp-types/0.11.0 \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/get-size-derive2/0.10.3 \
     crate://crates.io/get-size2/0.10.3 \
@@ -143,8 +143,8 @@ SRC_URI += " \
     crate://crates.io/getrandom/0.2.16 \
     crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.2 \
-    crate://crates.io/glob/0.3.3 \
-    crate://crates.io/globset/0.4.18 \
+    crate://crates.io/glob/0.3.4 \
+    crate://crates.io/globset/0.4.19 \
     crate://crates.io/globwalk/0.9.1 \
     crate://crates.io/half/2.6.0 \
     crate://crates.io/hashbrown/0.14.5 \
@@ -166,7 +166,7 @@ SRC_URI += " \
     crate://crates.io/id-arena/2.3.0 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
-    crate://crates.io/ignore/0.4.30 \
+    crate://crates.io/ignore/0.4.31 \
     crate://crates.io/imara-diff/0.2.0 \
     crate://crates.io/imperative/1.0.7 \
     crate://crates.io/indexmap/2.14.0 \
@@ -187,8 +187,9 @@ SRC_URI += " \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itertools/0.15.0 \
     crate://crates.io/itoa/1.0.15 \
-    crate://crates.io/jiff/0.2.32 \
-    crate://crates.io/jiff-static/0.2.32 \
+    crate://crates.io/jiff/0.2.34 \
+    crate://crates.io/jiff-core/0.1.0 \
+    crate://crates.io/jiff-static/0.2.34 \
     crate://crates.io/jiff-tzdb/0.1.4 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.34 \
@@ -198,13 +199,12 @@ SRC_URI += " \
     crate://crates.io/kqueue-sys/1.0.4 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/leb128fmt/0.1.0 \
-    crate://crates.io/libc/0.2.186 \
+    crate://crates.io/libc/0.2.189 \
     crate://crates.io/libcst/1.8.6 \
     crate://crates.io/libcst_derive/1.8.6 \
     crate://crates.io/libm/0.2.16 \
     crate://crates.io/libmimalloc-sys/0.1.49 \
     crate://crates.io/libredox/0.1.10 \
-    crate://crates.io/libtest-mimic/0.7.3 \
     crate://crates.io/libtest-mimic/0.8.1 \
     crate://crates.io/libz-rs-sys/0.5.5 \
     crate://crates.io/linux-raw-sys/0.12.1 \
@@ -235,7 +235,6 @@ SRC_URI += " \
     crate://crates.io/notify-types/2.0.0 \
     crate://crates.io/nu-ansi-term/0.50.1 \
     crate://crates.io/num-traits/0.2.19 \
-    crate://crates.io/num_cpus/1.17.0 \
     crate://crates.io/objc2/0.6.3 \
     crate://crates.io/objc2-encode/4.1.0 \
     crate://crates.io/once_cell/1.21.4 \
@@ -284,7 +283,7 @@ SRC_URI += " \
     crate://crates.io/proc-macro-error-attr2/2.0.0 \
     crate://crates.io/proc-macro-error2/2.0.1 \
     crate://crates.io/proc-macro-utils/0.10.0 \
-    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/proc-macro2/1.0.107 \
     crate://crates.io/ptr_meta/0.3.1 \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/pyproject-toml/0.13.7 \
@@ -292,7 +291,7 @@ SRC_URI += " \
     crate://crates.io/quick-xml/0.41.0 \
     crate://crates.io/quickcheck/1.1.0 \
     crate://crates.io/quickcheck_macros/1.2.0 \
-    crate://crates.io/quote/1.0.46 \
+    crate://crates.io/quote/1.0.47 \
     crate://crates.io/quote-use/0.8.4 \
     crate://crates.io/quote-use-macros/0.8.4 \
     crate://crates.io/r-efi/5.3.0 \
@@ -310,8 +309,8 @@ SRC_URI += " \
     crate://crates.io/redox_users/0.5.2 \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
-    crate://crates.io/regex/1.13.0 \
-    crate://crates.io/regex-automata/0.4.15 \
+    crate://crates.io/regex/1.13.1 \
+    crate://crates.io/regex-automata/0.4.16 \
     crate://crates.io/regex-lite/0.1.7 \
     crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rend/0.5.3 \
@@ -333,12 +332,12 @@ SRC_URI += " \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/semver/1.0.27 \
-    crate://crates.io/serde/1.0.228 \
+    crate://crates.io/serde/1.0.229 \
     crate://crates.io/serde-wasm-bindgen/0.6.5 \
-    crate://crates.io/serde_core/1.0.228 \
-    crate://crates.io/serde_derive/1.0.228 \
+    crate://crates.io/serde_core/1.0.229 \
+    crate://crates.io/serde_derive/1.0.229 \
     crate://crates.io/serde_derive_internals/0.29.1 \
-    crate://crates.io/serde_json/1.0.150 \
+    crate://crates.io/serde_json/1.0.151 \
     crate://crates.io/serde_spanned/1.1.1 \
     crate://crates.io/serde_test/1.0.177 \
     crate://crates.io/sha2/0.10.9 \
@@ -362,11 +361,11 @@ SRC_URI += " \
     crate://crates.io/strum_macros/0.28.0 \
     crate://crates.io/supports-hyperlinks/3.2.0 \
     crate://crates.io/syn/2.0.119 \
+    crate://crates.io/syn/3.0.3 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/tap/1.0.1 \
     crate://crates.io/tempfile/3.27.0 \
-    crate://crates.io/termcolor/1.4.1 \
-    crate://crates.io/terminal_size/0.4.3 \
+    crate://crates.io/terminal_size/0.4.4 \
     crate://crates.io/terminfo/0.9.0 \
     crate://crates.io/termtree/0.5.1 \
     crate://crates.io/test-case/3.3.1 \
@@ -374,11 +373,10 @@ SRC_URI += " \
     crate://crates.io/test-case-macros/3.3.1 \
     crate://crates.io/thin-vec/0.2.18 \
     crate://crates.io/thiserror/1.0.69 \
-    crate://crates.io/thiserror/2.0.18 \
+    crate://crates.io/thiserror/2.0.19 \
     crate://crates.io/thiserror-impl/1.0.69 \
-    crate://crates.io/thiserror-impl/2.0.18 \
+    crate://crates.io/thiserror-impl/2.0.19 \
     crate://crates.io/thread_local/1.1.9 \
-    crate://crates.io/threadpool/1.8.1 \
     crate://crates.io/tikv-jemalloc-sys/0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7 \
     crate://crates.io/tikv-jemallocator/0.6.1 \
     crate://crates.io/tinystr/0.8.3 \
@@ -399,7 +397,6 @@ SRC_URI += " \
     crate://crates.io/tracing-indicatif/0.3.14 \
     crate://crates.io/tracing-log/0.2.0 \
     crate://crates.io/tracing-subscriber/0.3.23 \
-    crate://crates.io/tryfn/1.0.0 \
     crate://crates.io/typed-arena/2.0.2 \
     crate://crates.io/typed-path/0.12.3 \
     crate://crates.io/typeid/1.0.3 \
@@ -419,7 +416,7 @@ SRC_URI += " \
     crate://crates.io/utf8-width/0.1.7 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.23.5 \
+    crate://crates.io/uuid/1.24.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version-ranges/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
@@ -444,7 +441,7 @@ SRC_URI += " \
     crate://crates.io/wasmparser/0.244.0 \
     crate://crates.io/web-sys/0.3.100 \
     crate://crates.io/web-time/1.1.0 \
-    crate://crates.io/which/8.0.4 \
+    crate://crates.io/which/8.0.5 \
     crate://crates.io/wild/2.2.1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
@@ -524,7 +521,7 @@ SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecd
 SRC_URI[anstyle-query-1.1.4.sha256sum] = "9e231f6134f61b71076a3eab506c379d4f36122f2af15a9ff04415ea4c3339e2"
 SRC_URI[anstyle-svg-0.1.11.sha256sum] = "26b9ec8c976eada1b0f9747a3d7cc4eae3bef10613e443746e7487f26c872fde"
 SRC_URI[anstyle-wincon-3.0.10.sha256sum] = "3e0633414522a32ffaac8ac6cc8f748e090c5717661fddeea04219e2344f5f2a"
-SRC_URI[anyhow-1.0.103.sha256sum] = "2a4385e2e34eb35d6b3efe798b9eb88096925d87726c0798709bf56d9ed84af3"
+SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
 SRC_URI[approx-0.5.1.sha256sum] = "cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684db5561995f6dad897c6"
 SRC_URI[arc-swap-1.9.2.sha256sum] = "c049c0be4daef0b145cb3555416b3b8ef5b7888a38aea1a3a155801fe7b0810b"
 SRC_URI[argfile-1.0.0.sha256sum] = "99489a733dea0d2930bfa59c243146a8513ce7b0991b9d006647687cc61f53e7"
@@ -537,7 +534,7 @@ SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954e
 SRC_URI[bit-set-0.8.0.sha256sum] = "08807e080ed7f9d5433fa9b275196cfc35414f66a0c79d864dc51a0d825231a3"
 SRC_URI[bit-vec-0.8.0.sha256sum] = "5e764a1d40d510daf35e07be9eb06e75770908c27d411ee6c92109c9840eaaf7"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.13.0.sha256sum] = "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
+SRC_URI[bitflags-2.13.1.sha256sum] = "b588b76d00fde79687d7646a9b5bdf3cc0f655e0bbd080335a95d7e96f3587da"
 SRC_URI[bitvec-1.1.1.sha256sum] = "ddcec3d12c579d40898fe0a9a358a803c23e9c52ca3c425707f81c9436211837"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[block2-0.6.2.sha256sum] = "cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5"
@@ -560,12 +557,12 @@ SRC_URI[chrono-0.4.44.sha256sum] = "c673075a2e0e5f4a1dde27ce9dee1ea4558c7ffe648f
 SRC_URI[ciborium-0.2.2.sha256sum] = "42e69ffd6f0917f5c029256a24d0161db17cea3997d185db0d35926308770f0e"
 SRC_URI[ciborium-io-0.2.2.sha256sum] = "05afea1e0a06c9be33d539b876f1ce3692f4afea2cb41f740e7743225ed1c757"
 SRC_URI[ciborium-ll-0.2.2.sha256sum] = "57663b653d948a338bfb3eeba9bb2fd5fcfaecb9e199e87e1eda4d9e8b240fd9"
-SRC_URI[clap-4.6.1.sha256sum] = "1ddb117e43bbf7dacf0a4190fef4d345b9bad68dfc649cb349e7d17d28428e51"
-SRC_URI[clap_builder-4.6.0.sha256sum] = "714a53001bf66416adb0e2ef5ac857140e7dc3a0c48fb28b2f10762fc4b5069f"
+SRC_URI[clap-4.6.4.sha256sum] = "d91e0c145792ef73a6ad36d27c75ac09f1832222a3c209689d90f534685ee5b7"
+SRC_URI[clap_builder-4.6.2.sha256sum] = "f09628afdcc538b57f3c6341e9c8e9970f18e4a481690a64974d7023bd33548b"
 SRC_URI[clap_complete-4.5.58.sha256sum] = "75bf0b32ad2e152de789bb635ea4d3078f6b838ad7974143e99b99f45a04af4a"
 SRC_URI[clap_complete_command-0.6.1.sha256sum] = "da8e198c052315686d36371e8a3c5778b7852fc75cc313e4e11eeb7a644a1b62"
 SRC_URI[clap_complete_nushell-4.5.8.sha256sum] = "0a0c951694691e65bf9d421d597d68416c22de9632e884c28412cb8cd8b73dce"
-SRC_URI[clap_derive-4.6.1.sha256sum] = "f2ce8604710f6733aa641a2b3731eaa1e8b3d9973d5e3565da11800813f997a9"
+SRC_URI[clap_derive-4.6.4.sha256sum] = "d012d2b9d65aca7f18f4d9878a045bc17899bba951561ba5ec3c2ba1eed9a061"
 SRC_URI[clap_lex-1.0.0.sha256sum] = "3a822ea5bc7590f9d40f1ba12c0dc3c2760f3482c6984db1573ad11031420831"
 SRC_URI[clearscreen-4.0.6.sha256sum] = "d669bb552908e336ad5681789752033b45566b7e591aeaac7a614e58e5d6d8f2"
 SRC_URI[codspeed-5.0.1.sha256sum] = "7083f253260bcb4aaa3b4aa4c52973703dabc1a85c2f193997e2689aafa8a919"
@@ -581,7 +578,7 @@ SRC_URI[compact_str-0.10.0.sha256sum] = "79fcda08c33bb58b97008b2cdada6622500e949
 SRC_URI[condtype-1.3.0.sha256sum] = "baf0a07a401f374238ab8e2f11a104d2851bf9ce711ec69804834de8af45c7af"
 SRC_URI[console-0.16.4.sha256sum] = "4fe5f465a4f6fee88fad41b85d990f84c835335e85b5d9e6e63e0d06d28cba7c"
 SRC_URI[console_error_panic_hook-0.1.7.sha256sum] = "a06aeb73f470f66dcdbf7223caeebb85984942f22f1adb2a088cf9668146bbbc"
-SRC_URI[console_log-1.0.0.sha256sum] = "be8aed40e4edbf4d3b4431ab260b63fdc40f5780a4766824329ea0f1eefe3c0f"
+SRC_URI[console_log-1.1.0.sha256sum] = "86919cef3e37b9356ccf54d4421208c17ecfda01beae61393e7ffd72916c0ef1"
 SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
 SRC_URI[countme-3.0.1.sha256sum] = "7704b5fdd17b18ae31c4c1da5a2e0305a2bf17b5249300a9ee9ed7b72114c636"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
@@ -641,7 +638,7 @@ SRC_URI[funty-2.0.0.sha256sum] = "e6d5a32815ae3f33302d95fdcb2ce17862f8c65363dcfd
 SRC_URI[futures-core-0.3.32.sha256sum] = "7e3450815272ef58cec6d564423f6e755e25379b217b0bc688e295ba24df6b1d"
 SRC_URI[futures-task-0.3.32.sha256sum] = "037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393"
 SRC_URI[futures-util-0.3.32.sha256sum] = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
-SRC_URI[gen-lsp-types-0.10.0.sha256sum] = "4cd635c5206acd03ea024d6b5902539e5c903de3afa220fdb5c94b583af77f4f"
+SRC_URI[gen-lsp-types-0.11.0.sha256sum] = "b64887ac3a8083427ae935a7296db876871582cd57eac077564f8bc18fa49116"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[get-size-derive2-0.10.3.sha256sum] = "c736d226c32e496b8377813b52269e11ad3a48d8373b68862d0364f04fd1229d"
 SRC_URI[get-size2-0.10.3.sha256sum] = "b411f34418305908ab15a82ff78958c2a9aee9a272b2a2e663836b20a4e4b9d3"
@@ -649,8 +646,8 @@ SRC_URI[getopts-0.2.24.sha256sum] = "cfe4fbac503b8d1f88e6676011885f34b7174f46e59
 SRC_URI[getrandom-0.2.16.sha256sum] = "335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592"
 SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.2.sha256sum] = "0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555"
-SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
-SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
+SRC_URI[glob-0.3.4.sha256sum] = "e4eba85ea1d0a966a983acd07deee566e67395d2d96b6fb39e62b5a833f1eb0b"
+SRC_URI[globset-0.4.19.sha256sum] = "e47d37d2ae4464254884b60ab7071be2b876a9c35b696bd018ddcc76847309cd"
 SRC_URI[globwalk-0.9.1.sha256sum] = "0bf760ebf69878d9fd8f110c89703d90ce35095324d1f1edcb595c63945ee757"
 SRC_URI[half-2.6.0.sha256sum] = "459196ed295495a68f7d7fe1d84f6c4b7ff0e21fe3017b2f283c6fac3ad803c9"
 SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
@@ -672,7 +669,7 @@ SRC_URI[icu_provider-2.2.0.sha256sum] = "139c4cf31c8b5f33d7e199446eff9c1e02decfc
 SRC_URI[id-arena-2.3.0.sha256sum] = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
-SRC_URI[ignore-0.4.30.sha256sum] = "7b009b6744c1445efd7244084e25e498636412effb6760b55067553baa925cc7"
+SRC_URI[ignore-0.4.31.sha256sum] = "7f8a7b8211e695a1d0cd91cace480d4d0bd57667ab10277cc412c5f7f4884f83"
 SRC_URI[imara-diff-0.2.0.sha256sum] = "2f01d462f766df78ab820dd06f5eb700233c51f0f4c2e846520eaf4ba6aa5c5c"
 SRC_URI[imperative-1.0.7.sha256sum] = "35e1d0bd9c575c52e59aad8e122a11786e852a154678d0c86e9e243d55273970"
 SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
@@ -693,8 +690,9 @@ SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c08819
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itertools-0.15.0.sha256sum] = "8b4baf93f58d4425749ca49a51c50ebab072c5df6994d08fed93541c331481dc"
 SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
-SRC_URI[jiff-0.2.32.sha256sum] = "961d16382652bfdd8c6f68b223b26a8c93e0d475c672f414411db31c6c5c900e"
-SRC_URI[jiff-static-0.2.32.sha256sum] = "d0879bd39df99c4c5e2c6615ccc026391a423dde10532c573e6086eb94a802cc"
+SRC_URI[jiff-0.2.34.sha256sum] = "e184d09547b80eb7e20d141ba2fb1fbac843ca53f4cf1b31210adc4c1adc6e16"
+SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09"
+SRC_URI[jiff-static-0.2.34.sha256sum] = "323da076b7a6faf914dc677cb05a4b907742ff7375c8322c9e7f5061e5e0e9de"
 SRC_URI[jiff-tzdb-0.1.4.sha256sum] = "c1283705eb0a21404d2bfd6eef2a7593d240bc42a0bdb39db0ad6fa2ec026524"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
@@ -704,13 +702,12 @@ SRC_URI[kqueue-1.1.1.sha256sum] = "eac30106d7dce88daf4a3fcb4879ea939476d5074a9b7
 SRC_URI[kqueue-sys-1.0.4.sha256sum] = "ed9625ffda8729b85e45cf04090035ac368927b8cebc34898e7c120f52e4838b"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
-SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
+SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
 SRC_URI[libcst-1.8.6.sha256sum] = "6aea7143e4a0ed59b87a1ee71e198500889f8b005311136be15e84c97a6fcd8d"
 SRC_URI[libcst_derive-1.8.6.sha256sum] = "0903173ea316c34a44d0497161e04d9210af44f5f5e89bf2f55d9a254c9a0e8d"
 SRC_URI[libm-0.2.16.sha256sum] = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981"
 SRC_URI[libmimalloc-sys-0.1.49.sha256sum] = "6a45a52f43e1c16f667ccfe4dd8c85b7f7c204fd5e3bf46c5b0db9a5c3c0b8e9"
 SRC_URI[libredox-0.1.10.sha256sum] = "416f7e718bdb06000964960ffa43b4335ad4012ae8b99060261aa4a8088d5ccb"
-SRC_URI[libtest-mimic-0.7.3.sha256sum] = "cc0bda45ed5b3a2904262c1bb91e526127aa70e7ef3758aba2ef93cf896b9b58"
 SRC_URI[libtest-mimic-0.8.1.sha256sum] = "5297962ef19edda4ce33aaa484386e0a5b3d7f2f4e037cbeee00503ef6b29d33"
 SRC_URI[libz-rs-sys-0.5.5.sha256sum] = "c10501e7805cee23da17c7790e59df2870c0d4043ec6d03f67d31e2b53e77415"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
@@ -741,7 +738,6 @@ SRC_URI[notify-8.2.0.sha256sum] = "4d3d07927151ff8575b7087f245456e549fea62edf0ec
 SRC_URI[notify-types-2.0.0.sha256sum] = "5e0826a989adedc2a244799e823aece04662b66609d96af8dff7ac6df9a8925d"
 SRC_URI[nu-ansi-term-0.50.1.sha256sum] = "d4a28e057d01f97e61255210fcff094d74ed0466038633e95017f5beb68e4399"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
-SRC_URI[num_cpus-1.17.0.sha256sum] = "91df4bbde75afed763b708b7eee1e8e7651e02d97f6d5dd763e89367e957b23b"
 SRC_URI[objc2-0.6.3.sha256sum] = "b7c2599ce0ec54857b29ce62166b0ed9b4f6f1a70ccc9a71165b6154caca8c05"
 SRC_URI[objc2-encode-4.1.0.sha256sum] = "ef25abbcd74fb2609453eb695bd2f860d389e457f67dc17cafc8b8cbc89d0c33"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
@@ -790,7 +786,7 @@ SRC_URI[proc-macro-crate-3.5.0.sha256sum] = "e67ba7e9b2b56446f1d419b1d807906278f
 SRC_URI[proc-macro-error-attr2-2.0.0.sha256sum] = "96de42df36bb9bba5542fe9f1a054b8cc87e172759a1868aa05c1f3acc89dfc5"
 SRC_URI[proc-macro-error2-2.0.1.sha256sum] = "11ec05c52be0a07b08061f7dd003e7d7092e0472bc731b4af7bb1ef876109802"
 SRC_URI[proc-macro-utils-0.10.0.sha256sum] = "eeaf08a13de400bc215877b5bdc088f241b12eb42f0a548d3390dc1c56bb7071"
-SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
 SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a4312af1f31948f8f6224a79"
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[pyproject-toml-0.13.7.sha256sum] = "f6d755483ad14b49e76713b52285235461a5b4f73f17612353e11a5de36a5fd2"
@@ -798,7 +794,7 @@ SRC_URI[quick-junit-0.6.1.sha256sum] = "8216516c957e00535b3c91770524c219dd7df90d
 SRC_URI[quick-xml-0.41.0.sha256sum] = "e660451e55124f798a69a5af3f49ccfbefbd41910eefd25caf2393e1f3473ec1"
 SRC_URI[quickcheck-1.1.0.sha256sum] = "95c589f335db0f6aaa168a7cd27b1fc6920f5e1470c804f814d9cd6e62a0f70b"
 SRC_URI[quickcheck_macros-1.2.0.sha256sum] = "a9a28b8493dd664c8b171dd944da82d933f7d456b829bfb236738e1fe06c5ba4"
-SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
+SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[quote-use-0.8.4.sha256sum] = "9619db1197b497a36178cfc736dc96b271fe918875fbf1344c436a7e93d0321e"
 SRC_URI[quote-use-macros-0.8.4.sha256sum] = "82ebfb7faafadc06a7ab141a6f67bcfb24cb8beb158c6fe933f2f035afa99f35"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
@@ -816,8 +812,8 @@ SRC_URI[redox_syscall-0.5.17.sha256sum] = "5407465600fb0548f1442edf71dd20683c6ed
 SRC_URI[redox_users-0.5.2.sha256sum] = "a4e608c6638b9c18977b00b475ac1f28d14e84b27d8d42f70e0bf1e3dec127ac"
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
-SRC_URI[regex-1.13.0.sha256sum] = "2a0e75113e14dc5acb068cd0786884f214f1312650a3d36d269f5c4f3cdee8a2"
-SRC_URI[regex-automata-0.4.15.sha256sum] = "1f388202e4b80542a0921078cc23b6333bcf1409c1e3f86404cae4766a6131db"
+SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
+SRC_URI[regex-automata-0.4.16.sha256sum] = "8fcfdb36bda0c880c5931cdc7a2bcdc8ba4556847b9d912bca70bc94708711ad"
 SRC_URI[regex-lite-0.1.7.sha256sum] = "943f41321c63ef1c92fd763bfe054d2668f7f225a5c29f0105903dc2fc04ba30"
 SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
@@ -839,12 +835,12 @@ SRC_URI[schemars_derive-1.2.1.sha256sum] = "7d115b50f4aaeea07e79c1912f645c7513d8
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
 SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
-SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde-1.0.229.sha256sum] = "4148590afebada386688f18773da617792bf2ef03ffc1e4cbd2b1d45b023e0ba"
 SRC_URI[serde-wasm-bindgen-0.6.5.sha256sum] = "8302e169f0eddcc139c70f139d19d6467353af16f9fce27e8c30158036a1e16b"
-SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
-SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
+SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
+SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
 SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
-SRC_URI[serde_json-1.0.150.sha256sum] = "e8014e44b4736ed0538adeecded0fce2a272f22dc9578a7eb6b2d9993c74cfb9"
+SRC_URI[serde_json-1.0.151.sha256sum] = "c841b55ecdae098c80dcae9cf767f6f8a0c2cdb3416bbef72181df4d0fe73f14"
 SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
 SRC_URI[serde_test-1.0.177.sha256sum] = "7f901ee573cab6b3060453d2d5f0bae4e6d628c23c0a962ff9b5f1d7c8d4f1ed"
 SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
@@ -868,11 +864,11 @@ SRC_URI[strum-0.28.0.sha256sum] = "9628de9b8791db39ceda2b119bbe13134770b56c138ec
 SRC_URI[strum_macros-0.28.0.sha256sum] = "ab85eea0270ee17587ed4156089e10b9e6880ee688791d45a905f5b1ca36f664"
 SRC_URI[supports-hyperlinks-3.2.0.sha256sum] = "e396b6523b11ccb83120b115a0b7366de372751aa6edf19844dfb13a6af97e91"
 SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
+SRC_URI[syn-3.0.3.sha256sum] = "53e9bae58849f64dfa4f5d5ae372c8341f7305f82a3868709269343628b659a3"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
-SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
-SRC_URI[terminal_size-0.4.3.sha256sum] = "60b8cb979cb11c32ce1603f8137b22262a9d131aaa5c37b5678025f22b8becd0"
+SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
 SRC_URI[terminfo-0.9.0.sha256sum] = "d4ea810f0692f9f51b382fff5893887bb4580f5fa246fde546e0b13e7fcee662"
 SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
 SRC_URI[test-case-3.3.1.sha256sum] = "eb2550dd13afcd286853192af8601920d959b14c401fcece38071d53bf0768a8"
@@ -880,11 +876,10 @@ SRC_URI[test-case-core-3.3.1.sha256sum] = "adcb7fd841cd518e279be3d5a3eb063640948
 SRC_URI[test-case-macros-3.3.1.sha256sum] = "5c89e72a01ed4c579669add59014b9a524d609c0c88c6a585ce37485879f6ffb"
 SRC_URI[thin-vec-0.2.18.sha256sum] = "b0f7e269b48f0a7dd0146680fa24b50cc67fc0373f086a5b2f99bd084639b482"
 SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
-SRC_URI[thiserror-2.0.18.sha256sum] = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
+SRC_URI[thiserror-2.0.19.sha256sum] = "09a43598840e33d5b0331f38c5e30d13bb11c11210a4b58f0d9b18a5a5eefcd9"
 SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
-SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
+SRC_URI[thiserror-impl-2.0.19.sha256sum] = "43cbfe0cf76104d42a574802844187e84a305e531ed54455f11fbde0f10541cd"
 SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
-SRC_URI[threadpool-1.8.1.sha256sum] = "d050e60b33d41c19108b32cea32164033a9013fe3b46cbd4457559bfbf77afaa"
 SRC_URI[tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7.sha256sum] = "cd8aa5b2ab86a2cefa406d889139c162cbb230092f7d1d7cbc1716405d852a3b"
 SRC_URI[tikv-jemallocator-0.6.1.sha256sum] = "0359b4327f954e0567e69fb191cf1436617748813819c94b8cd4a431422d053a"
 SRC_URI[tinystr-0.8.3.sha256sum] = "c8323304221c2a851516f22236c5722a72eaa19749016521d6dff0824447d96d"
@@ -905,7 +900,6 @@ SRC_URI[tracing-flame-0.2.0.sha256sum] = "0bae117ee14789185e129aaee5d93750abe67f
 SRC_URI[tracing-indicatif-0.3.14.sha256sum] = "e1ef6990e0438749f0080573248e96631171a0b5ddfddde119aa5ba8c3a9c47e"
 SRC_URI[tracing-log-0.2.0.sha256sum] = "ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3"
 SRC_URI[tracing-subscriber-0.3.23.sha256sum] = "cb7f578e5945fb242538965c2d0b04418d38ec25c79d160cd279bf0731c8d319"
-SRC_URI[tryfn-1.0.0.sha256sum] = "f68b00518dd6c69ee2289900b140e55dad068cb925678603bfa8d539f61ef6c1"
 SRC_URI[typed-arena-2.0.2.sha256sum] = "6af6ae20167a9ece4bcb41af5b80f8a1f1df981f6391189ce00fd257af04126a"
 SRC_URI[typed-path-0.12.3.sha256sum] = "8e28f89b80c87b8fb0cf04ab448d5dd0dd0ade2f8891bae878de66a75a28600e"
 SRC_URI[typeid-1.0.3.sha256sum] = "bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c"
@@ -925,7 +919,7 @@ SRC_URI[urlencoding-2.1.3.sha256sum] = "daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdf
 SRC_URI[utf8-width-0.1.7.sha256sum] = "86bd8d4e895da8537e5315b8254664e6b769c4ff3db18321b297a1e7004392e3"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.23.5.sha256sum] = "ea5fab0d6c3c01ae70085a09cb03d4c7a1d6314e2b3e075392783396d724ca0a"
+SRC_URI[uuid-1.24.0.sha256sum] = "bf3923a6f5c4c6382e0b653c4117f48d631ea17f38ed86e2a828e6f7412f5239"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version-ranges-0.1.1.sha256sum] = "f8d079415ceb2be83fc355adbadafe401307d5c309c7e6ade6638e6f9f42f42d"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
@@ -950,7 +944,7 @@ SRC_URI[wasm-metadata-0.244.0.sha256sum] = "bb0e353e6a2fbdc176932bbaab493762eb12
 SRC_URI[wasmparser-0.244.0.sha256sum] = "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
 SRC_URI[web-sys-0.3.100.sha256sum] = "6e0871acf327f283dc6da28a1696cdc64fb355ba9f935d052021fa77f35cce69"
 SRC_URI[web-time-1.1.0.sha256sum] = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
-SRC_URI[which-8.0.4.sha256sum] = "48d7cd18d4acb58fb3cdfe9ea54e6cd96a4e7d4cc45c56338b236e82dad47248"
+SRC_URI[which-8.0.5.sha256sum] = "8f3ef584124b911bcc3875c2f1472e80f24361ceb789bd1c62b3e9a3df9ff43c"
 SRC_URI[wild-2.2.1.sha256sum] = "a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
diff --git a/meta-python/recipes-devtools/python/python3-ruff_0.16.0.bb b/meta-python/recipes-devtools/python/python3-ruff_0.16.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-ruff_0.16.0.bb
rename to meta-python/recipes-devtools/python/python3-ruff_0.16.1.bb
index c737ac6c1a..1fc503b5d9 100644
--- a/meta-python/recipes-devtools/python/python3-ruff_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ruff_0.16.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e679ca4f742cbfa29ab6a499529c2d39"
 
 DEPENDS += "python3-maturin-native"
 
-SRC_URI[sha256sum] = "e460aafd5495ec89efaa6ced2e4a9a581116451e1c88b9d37ef497e0f8e93982"
+SRC_URI[sha256sum] = "fedad7c801dabd3fb9741d76aca39246e6ddd9ca446a015875207bf19f1e6bc7"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates
 
-- 
2.43.0


