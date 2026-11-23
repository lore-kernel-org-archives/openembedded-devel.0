Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48060.1795411899055553456
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=c+WQbA5W;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2678949c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411898; x=1796016698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Y1X6g55xo/nIjnJRUS16ZbQDOcGdjQ54rTlwGX2f10=;
        b=c+WQbA5WnUgHeg1vceL9qGLa5eS85ksupZqtV9af6LJHxjexA8u0JlfJ7ykEU6bJDD
         CXGNJrK3WetwLYsK2ncw79eIhUhgP1VKcf65gjH8gYyMdEutzLBZcd4DvYwoF0aNoIHW
         ly8RAIMC4ERM0kFRVmBOY8PwHFA66b4eSuHdMWLjpyRtScDYxuLkN+V68CuYLQJOnAYA
         WV/MjeDdfIyHyrOMBfs0jEYDSJWOm8Id8e3ABkjTnI4MSOs70ZYSJhcSwPXuMAq7T7bP
         xeF9oMj1Q4wwNa9VPuHGDKuFPmjTzfbAtCrvlDWrJ2jvVF5yuffhnxJpQKWmML8/2MJ7
         v8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411898; x=1796016698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Y1X6g55xo/nIjnJRUS16ZbQDOcGdjQ54rTlwGX2f10=;
        b=Bc1Ja5u5fPc3V9SJK3Yy6SvOUltrYRkDSvLdwvNJhJKoUCZj2NazYxTcwJrXT0daHw
         IJ7Jpa75rQmVabx0U6dV4K/t3r86dh6yYUX8XqA61wb6f1dHVrsFvIsYwXsWbGzK7biH
         p1wgraduQpCSUJa8o4cNsBsXzPX8K2HTAI/oUrA3lwg65mt/r7aNa6YjEcBblpV02Gbd
         gGnzqxjPnb/JjV6NCr8VbZQvJntb7+CsPOy02pWi7BSGo82LpYcPLI0c+fouFC7PwoZa
         Btp/6Yk7pcjXZOhRuYgHOVLjlgyLCZV6rPvroqrACT7z0oKPCFphtyv6YUxLQVw9Mz5x
         F/ow==
X-Gm-Message-State: APuU4Z/bcxi0Sw7N6s2aa5ezSntKFxsgG4GpI/S2zAuKrRVQS3SLXoEL
	e9n3glg8IbcvmC6Zu+/8AzOD7zMCEWwq7byhhk3mSqesl5GWyq7kX/iHVXdbUOiEZ/s=
X-Gm-Gg: AZFdTZe9CCAYWUp9fAC71aU35l1zqLntVjzcKUyK9Bv+1FwE4jvmeNgpxWauno6cmJ6
	piU/3exV5+/d+CEIEGMS5Qjxfi59q+rrUPta4uRaoxfNoeIP8rZMgOdKC5Sprbz3bj25WAbhSvK
	r5qICJzg6pMvq5olcS5zKeh8bfSq9PWY3pZafbbn4dcIab5k50IzpSFaGOdrJKOvrhHIfcYnXQ1
	Tfnd+jvDpw3t2+DVghtIWCtO0hz1iyKEe6HARHTFkVAGyQOlJCNpKrRXv/m494Z7naTw/YZr3En
	cM2dtBVmYMDxmO7pmfZ7wi/1mCukVUOYKl2XCr/u1LVDl6zeQicj2YK3ImsljkXnSbBqACtyvVs
	Egp3fWzwgKlK+NVV9M/2Cm2dQ1NdP2rp4LsWlkx1LJpj9TLRatUwo8Jcpj8XxMSjntnYRJrTEVc
	O8miSsPqH9vklTzn3js1QXy499m9YbcwMCAwEpuJ0oAQiw85P0L78xm5vQh9l7EK4z9kupqkvtR
	9pGE9+/K9WRuX2ppiek781lBcn0ESl38rqkaoojC2ctXO8KzNB6srhdb2vFLiDxbHeRgFTv10yY
	t1WAGD16nlqaUOv1FHxwXudg1FnWUhDAr0r8egO3BrP6HIA57GDZvazxMDYHl7+qticXk8r5X8x
	VtDh4i8PRBwJ9YcRlJSbhU0C6/PRRCK+VPO4hNj2N80rknrzyCrzGIYSfjpHtkIn8xd8AbROIVq
	6Jgo03gLWPJjDeHEwyIpSC30b9kJR4pgSR6PT00rBbGpPW2WsEwm44VTAm/Xafc49R0Bfbtg+jd
	ZlOlPEqP4oNbtsck0hNKmC1VFccEkVJ6pn26foxG/2hRDlQA7CgdvS4z3Y3PY1iPK7BgRwsLZ4S
	qVQI
X-Received: by 2002:a05:7301:1a02:b0:376:b957:c08 with SMTP id 5a478bee46e88-3856fe5acd0mr10635360eec.9.1795411898148;
        Sun, 22 Nov 2026 21:31:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 09/16] python3-ruff: upgrade 0.17.5 -> 0.17.6
Date: Sun, 22 Nov 2026 21:29:39 -0800
Message-ID: <20261123052953.3658549-83-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132870
Content-Type: text/plain; charset="utf-8"

- Preview: add a fix for runtime-string-union (TC010)
- Fix duplicate parenthesized items (B033, RUF068), an F823 false
  negative, a PLR1733/PLR1736 false positive and a RUF072 fix that
  produced a syntax error
- Treat relative imports from .__future__ as ordinary imports
- SIM208 fixes avoid redundant bool(); F841 ignores __traceback_hide__
- Performance: stream JSON diagnostics, faster notebook decoding
- Rust toolchain updated to 1.100, MSRV raised to 1.98

Regenerate python3-ruff-crates.inc with bitbake -c update_crates.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-ruff-crates.inc            | 62 +++++++------------
 ...-ruff_0.17.5.bb => python3-ruff_0.17.6.bb} |  2 +-
 2 files changed, 23 insertions(+), 41 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruff_0.17.5.bb => python3-ruff_0.17.6.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-ruff-crates.inc b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
index c4269600da..3ad4689653 100644
--- a/meta-python/recipes-devtools/python/python3-ruff-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
@@ -6,7 +6,6 @@ SRC_URI += " \
     crate://crates.io/aho-corasick/1.1.5 \
     crate://crates.io/alloca/0.4.0 \
     crate://crates.io/allocator-api2/0.2.21 \
-    crate://crates.io/android_system_properties/0.1.5 \
     crate://crates.io/anes/0.1.6 \
     crate://crates.io/annotate-snippets/0.11.5 \
     crate://crates.io/anstream/0.6.21 \
@@ -21,7 +20,7 @@ SRC_URI += " \
     crate://crates.io/anyhow/1.0.104 \
     crate://crates.io/approx/0.5.1 \
     crate://crates.io/ar_archive_writer/0.5.3 \
-    crate://crates.io/arc-swap/1.9.2 \
+    crate://crates.io/arc-swap/1.9.3 \
     crate://crates.io/argfile/1.0.0 \
     crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/assert_fs/1.1.4 \
@@ -51,7 +50,6 @@ SRC_URI += " \
     crate://crates.io/cfg_aliases/0.2.1 \
     crate://crates.io/chacha20/0.10.0 \
     crate://crates.io/char_str/0.0.4 \
-    crate://crates.io/chrono/0.4.45 \
     crate://crates.io/ciborium/0.2.2 \
     crate://crates.io/ciborium-io/0.2.2 \
     crate://crates.io/ciborium-ll/0.2.2 \
@@ -77,7 +75,7 @@ SRC_URI += " \
     crate://crates.io/console/0.16.6 \
     crate://crates.io/console_error_panic_hook/0.1.7 \
     crate://crates.io/console_log/1.1.0 \
-    crate://crates.io/core-foundation-sys/0.8.7 \
+    crate://crates.io/constant_time_eq/0.6.1 \
     crate://crates.io/countme/3.0.1 \
     crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/cpufeatures/0.3.0 \
@@ -153,8 +151,6 @@ SRC_URI += " \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/hermit-abi/0.5.2 \
     crate://crates.io/html-escape/0.2.13 \
-    crate://crates.io/iana-time-zone/0.1.64 \
-    crate://crates.io/iana-time-zone-haiku/0.1.2 \
     crate://crates.io/icu_collections/2.3.0 \
     crate://crates.io/icu_locale_core/2.3.0 \
     crate://crates.io/icu_normalizer/2.3.0 \
@@ -198,7 +194,7 @@ SRC_URI += " \
     crate://crates.io/kqueue-sys/1.0.4 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/leb128fmt/0.1.0 \
-    crate://crates.io/libc/0.2.190 \
+    crate://crates.io/libc/0.2.191 \
     crate://crates.io/libcst/1.9.0 \
     crate://crates.io/libcst_derive/1.9.0 \
     crate://crates.io/libm/0.2.16 \
@@ -226,7 +222,6 @@ SRC_URI += " \
     crate://crates.io/munge/0.4.7 \
     crate://crates.io/munge_macro/0.4.7 \
     crate://crates.io/natord/1.0.9 \
-    crate://crates.io/newtype-uuid/1.3.2 \
     crate://crates.io/nix/0.31.3 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/normalize-line-endings/0.3.0 \
@@ -291,7 +286,6 @@ SRC_URI += " \
     crate://crates.io/ptr_meta/0.3.1 \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/pyproject-toml/0.13.7 \
-    crate://crates.io/quick-junit/0.8.0 \
     crate://crates.io/quick-xml/0.41.0 \
     crate://crates.io/quickcheck/1.1.0 \
     crate://crates.io/quickcheck_macros/1.2.0 \
@@ -330,8 +324,8 @@ SRC_URI += " \
     crate://crates.io/salsa-macro-rules/0.28.5 \
     crate://crates.io/salsa-macros/0.28.5 \
     crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/schemars/1.2.2 \
-    crate://crates.io/schemars_derive/1.2.2 \
+    crate://crates.io/schemars/1.2.3 \
+    crate://crates.io/schemars_derive/1.2.3 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/semver/1.0.27 \
@@ -365,7 +359,7 @@ SRC_URI += " \
     crate://crates.io/strum_macros/0.28.0 \
     crate://crates.io/supports-hyperlinks/3.2.0 \
     crate://crates.io/syn/2.0.119 \
-    crate://crates.io/syn/3.0.8 \
+    crate://crates.io/syn/3.0.9 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/tap/1.0.1 \
     crate://crates.io/tempfile/3.27.0 \
@@ -402,7 +396,7 @@ SRC_URI += " \
     crate://crates.io/tracing-log/0.2.0 \
     crate://crates.io/tracing-subscriber/0.3.23 \
     crate://crates.io/typed-arena/2.0.2 \
-    crate://crates.io/typed-path/0.12.3 \
+    crate://crates.io/typed-path/0.13.0 \
     crate://crates.io/typeid/1.0.3 \
     crate://crates.io/typenum/1.18.0 \
     crate://crates.io/ucd-trie/0.1.7 \
@@ -449,17 +443,12 @@ SRC_URI += " \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-util/0.1.11 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/windows-core/0.62.0 \
-    crate://crates.io/windows-implement/0.60.0 \
-    crate://crates.io/windows-interface/0.59.1 \
     crate://crates.io/windows-link/0.1.3 \
     crate://crates.io/windows-link/0.2.1 \
-    crate://crates.io/windows-result/0.4.0 \
-    crate://crates.io/windows-strings/0.5.0 \
     crate://crates.io/windows-sys/0.52.0 \
     crate://crates.io/windows-sys/0.59.0 \
     crate://crates.io/windows-sys/0.60.2 \
-    crate://crates.io/windows-sys/0.61.0 \
+    crate://crates.io/windows-sys/0.61.2 \
     crate://crates.io/windows-targets/0.52.6 \
     crate://crates.io/windows-targets/0.53.3 \
     crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
@@ -494,10 +483,12 @@ SRC_URI += " \
     crate://crates.io/yoke-derive/0.8.2 \
     crate://crates.io/zerofrom/0.1.6 \
     crate://crates.io/zerofrom-derive/0.1.6 \
+    crate://crates.io/zeroize/1.9.1 \
+    crate://crates.io/zeroize_derive/1.5.0 \
     crate://crates.io/zerotrie/0.2.5 \
     crate://crates.io/zerovec/0.11.8 \
     crate://crates.io/zerovec-derive/0.11.6 \
-    crate://crates.io/zip/9.0.5 \
+    crate://crates.io/zip/9.5.1 \
     crate://crates.io/zlib-rs/0.5.5 \
     crate://crates.io/zmij/1.0.10 \
     crate://crates.io/zstd/0.14.3 \
@@ -509,7 +500,6 @@ SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e062506252
 SRC_URI[aho-corasick-1.1.5.sha256sum] = "c982642fa9e8606056828ee9a8505737230110bb1099153c79efe865c59d12ba"
 SRC_URI[alloca-0.4.0.sha256sum] = "e5a7d05ea6aea7e9e64d25b9156ba2fee3fdd659e34e41063cd2fc7cd020d7f4"
 SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
-SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
 SRC_URI[anes-0.1.6.sha256sum] = "4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275b9fcf1e380f7299"
 SRC_URI[annotate-snippets-0.11.5.sha256sum] = "710e8eae58854cdc1790fcb56cca04d712a17be849eeb81da2a724bf4bae2bc4"
 SRC_URI[anstream-0.6.21.sha256sum] = "43d5b281e737544384e969a5ccad3f1cdd24b48086a0fc1b2a5262a26b8f4f4a"
@@ -524,7 +514,7 @@ SRC_URI[anstyle-wincon-3.0.10.sha256sum] = "3e0633414522a32ffaac8ac6cc8f748e090c
 SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
 SRC_URI[approx-0.5.1.sha256sum] = "cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684db5561995f6dad897c6"
 SRC_URI[ar_archive_writer-0.5.3.sha256sum] = "73cd58deff2140a0a8eae87e417bd01db68a33e148aa93d1e8cd837e55e312b6"
-SRC_URI[arc-swap-1.9.2.sha256sum] = "c049c0be4daef0b145cb3555416b3b8ef5b7888a38aea1a3a155801fe7b0810b"
+SRC_URI[arc-swap-1.9.3.sha256sum] = "380962b3d93b99642e50b9febf72c071e97e8b32d86eae9cf4ef582bb960ae6e"
 SRC_URI[argfile-1.0.0.sha256sum] = "99489a733dea0d2930bfa59c243146a8513ce7b0991b9d006647687cc61f53e7"
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
 SRC_URI[assert_fs-1.1.4.sha256sum] = "6ecf5c70ca07b7f80220bce936f0556a960ca6fb00fc2bd4125b5e581b218137"
@@ -554,7 +544,6 @@ SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d332
 SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
 SRC_URI[chacha20-0.10.0.sha256sum] = "6f8d983286843e49675a4b7a2d174efe136dc93a18d69130dd18198a6c167601"
 SRC_URI[char_str-0.0.4.sha256sum] = "c9cba78a5abb515610e10af297615434b019755b5d7be14e559ff5340dff50c4"
-SRC_URI[chrono-0.4.45.sha256sum] = "1aa79e62e7697b8e29b513a68abacf485adcd1fe8284a4316c5ae868e6633327"
 SRC_URI[ciborium-0.2.2.sha256sum] = "42e69ffd6f0917f5c029256a24d0161db17cea3997d185db0d35926308770f0e"
 SRC_URI[ciborium-io-0.2.2.sha256sum] = "05afea1e0a06c9be33d539b876f1ce3692f4afea2cb41f740e7743225ed1c757"
 SRC_URI[ciborium-ll-0.2.2.sha256sum] = "57663b653d948a338bfb3eeba9bb2fd5fcfaecb9e199e87e1eda4d9e8b240fd9"
@@ -580,7 +569,7 @@ SRC_URI[condtype-1.3.0.sha256sum] = "baf0a07a401f374238ab8e2f11a104d2851bf9ce711
 SRC_URI[console-0.16.6.sha256sum] = "e96a4956774c13c126a8b5af4daa79384f4d826534c95a02d76afb39e2ab64e3"
 SRC_URI[console_error_panic_hook-0.1.7.sha256sum] = "a06aeb73f470f66dcdbf7223caeebb85984942f22f1adb2a088cf9668146bbbc"
 SRC_URI[console_log-1.1.0.sha256sum] = "86919cef3e37b9356ccf54d4421208c17ecfda01beae61393e7ffd72916c0ef1"
-SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
+SRC_URI[constant_time_eq-0.6.1.sha256sum] = "9eb6feb175df65d0a3ccd3e73484e940d0ac664e8034f0519fd49a93db3071d9"
 SRC_URI[countme-3.0.1.sha256sum] = "7704b5fdd17b18ae31c4c1da5a2e0305a2bf17b5249300a9ee9ed7b72114c636"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[cpufeatures-0.3.0.sha256sum] = "8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201"
@@ -656,8 +645,6 @@ SRC_URI[hashlink-0.12.0.sha256sum] = "a5081f264ed7adee96ea4b4778b6bb9da0a7228b08
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hermit-abi-0.5.2.sha256sum] = "fc0fef456e4baa96da950455cd02c081ca953b141298e41db3fc7e36b1da849c"
 SRC_URI[html-escape-0.2.13.sha256sum] = "6d1ad449764d627e22bfd7cd5e8868264fc9236e07c752972b4080cd351cb476"
-SRC_URI[iana-time-zone-0.1.64.sha256sum] = "33e57f83510bb73707521ebaffa789ec8caf86f9657cad665b092b581d40e9fb"
-SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
 SRC_URI[icu_collections-2.3.0.sha256sum] = "fa68d21081c4a05d5a901a1c62add574c77048b6a1c67be3b50ce0b60d4ca513"
 SRC_URI[icu_locale_core-2.3.0.sha256sum] = "d56e28588da92eee5c3201a6eff33fabdd49b62269c8938d4ff050ce4d900deb"
 SRC_URI[icu_normalizer-2.3.0.sha256sum] = "12f9cf5f235641ed274641dd81c3f28d870e276763d0797aeeab72317b1c646f"
@@ -701,7 +688,7 @@ SRC_URI[kqueue-1.1.1.sha256sum] = "eac30106d7dce88daf4a3fcb4879ea939476d5074a9b7
 SRC_URI[kqueue-sys-1.0.4.sha256sum] = "ed9625ffda8729b85e45cf04090035ac368927b8cebc34898e7c120f52e4838b"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
-SRC_URI[libc-0.2.190.sha256sum] = "ce5d3ddc6d3fa000eb1536d85e147bfe31aacaba692ed6a876f95cb7c855be78"
+SRC_URI[libc-0.2.191.sha256sum] = "65cd87c9a6d60536580b316ad985726104730a5151c99845f2490428ef91240a"
 SRC_URI[libcst-1.9.0.sha256sum] = "21b68d9c60cba9c333f89596ef5c4d3b6c9bd0b7d2e48a9810df6fa7976102a3"
 SRC_URI[libcst_derive-1.9.0.sha256sum] = "57a1ac6fb3fbdc3408a2f138e54d11c3dd338f12c2efc3db47477cc2227d89c2"
 SRC_URI[libm-0.2.16.sha256sum] = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981"
@@ -729,7 +716,6 @@ SRC_URI[mio-1.2.4.sha256sum] = "1788edb87fdc09c7e26304471e2f5be8cdefb1b6930d6e39
 SRC_URI[munge-0.4.7.sha256sum] = "5e17401f259eba956ca16491461b6e8f72913a0a114e39736ce404410f915a0c"
 SRC_URI[munge_macro-0.4.7.sha256sum] = "4568f25ccbd45ab5d5603dc34318c1ec56b117531781260002151b8530a9f931"
 SRC_URI[natord-1.0.9.sha256sum] = "308d96db8debc727c3fd9744aac51751243420e46edf401010908da7f8d5e57c"
-SRC_URI[newtype-uuid-1.3.2.sha256sum] = "5c012d14ef788ab066a347d19e3dda699916c92293b05b85ba2c76b8c82d2830"
 SRC_URI[nix-0.31.3.sha256sum] = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[normalize-line-endings-0.3.0.sha256sum] = "61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be"
@@ -794,7 +780,6 @@ SRC_URI[psm-0.1.32.sha256sum] = "4dcd034599e63b970727f70d79e02d62390a4a84f7c6b82
 SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a4312af1f31948f8f6224a79"
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[pyproject-toml-0.13.7.sha256sum] = "f6d755483ad14b49e76713b52285235461a5b4f73f17612353e11a5de36a5fd2"
-SRC_URI[quick-junit-0.8.0.sha256sum] = "bae23b8e1a59a90f7bf98caa2f4c8c2eedf6df011c6c88ed633e85a87c84526e"
 SRC_URI[quick-xml-0.41.0.sha256sum] = "e660451e55124f798a69a5af3f49ccfbefbd41910eefd25caf2393e1f3473ec1"
 SRC_URI[quickcheck-1.1.0.sha256sum] = "95c589f335db0f6aaa168a7cd27b1fc6920f5e1470c804f814d9cd6e62a0f70b"
 SRC_URI[quickcheck_macros-1.2.0.sha256sum] = "a9a28b8493dd664c8b171dd944da82d933f7d456b829bfb236738e1fe06c5ba4"
@@ -833,8 +818,8 @@ SRC_URI[salsa-0.28.5.sha256sum] = "27d2e6e19e39591cd99c01ac4141544b4d012cfd08313
 SRC_URI[salsa-macro-rules-0.28.5.sha256sum] = "baf90a551c38f25ed8489111d3d5827aa18e1b85963f5e6a298505b1d1e2cb7e"
 SRC_URI[salsa-macros-0.28.5.sha256sum] = "69dd77f86ec10e72e314f4ddf7c44c8d349e73cdff1aad524ba9668603fb0549"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
-SRC_URI[schemars-1.2.2.sha256sum] = "687274d293b6cdc6e73e0fee520bf2049650090d7164f87672d212a3c530cf4a"
-SRC_URI[schemars_derive-1.2.2.sha256sum] = "d98c67716b46af2f0b8cf752abc930f6f9aecfbf671ecfb531db8a31dbe4e2ba"
+SRC_URI[schemars-1.2.3.sha256sum] = "ab508826f74a77ca9d5aba6ff19b522583ee3eaf28a19384ff3d0e5835fadf6e"
+SRC_URI[schemars_derive-1.2.3.sha256sum] = "e1c3a92094fa7d61aa124645844facb6b554dfc797136d0f5fd1f890e2bffc69"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
 SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
@@ -868,7 +853,7 @@ SRC_URI[strum-0.28.0.sha256sum] = "9628de9b8791db39ceda2b119bbe13134770b56c138ec
 SRC_URI[strum_macros-0.28.0.sha256sum] = "ab85eea0270ee17587ed4156089e10b9e6880ee688791d45a905f5b1ca36f664"
 SRC_URI[supports-hyperlinks-3.2.0.sha256sum] = "e396b6523b11ccb83120b115a0b7366de372751aa6edf19844dfb13a6af97e91"
 SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
-SRC_URI[syn-3.0.8.sha256sum] = "01016da373cd8f7ef12624f796309f5c31ba8d646dd08856c02cd741d823c622"
+SRC_URI[syn-3.0.9.sha256sum] = "d78c8dee4c7bf0e14673097256fed6142ce9d3b85a408189d07482442145823b"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
@@ -905,7 +890,7 @@ SRC_URI[tracing-indicatif-0.3.14.sha256sum] = "e1ef6990e0438749f0080573248e96631
 SRC_URI[tracing-log-0.2.0.sha256sum] = "ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3"
 SRC_URI[tracing-subscriber-0.3.23.sha256sum] = "cb7f578e5945fb242538965c2d0b04418d38ec25c79d160cd279bf0731c8d319"
 SRC_URI[typed-arena-2.0.2.sha256sum] = "6af6ae20167a9ece4bcb41af5b80f8a1f1df981f6391189ce00fd257af04126a"
-SRC_URI[typed-path-0.12.3.sha256sum] = "8e28f89b80c87b8fb0cf04ab448d5dd0dd0ade2f8891bae878de66a75a28600e"
+SRC_URI[typed-path-0.13.0.sha256sum] = "9ce898823d8cd0f028662d2f349694b1af0a5cc9be83f1d213a00d3147445e1e"
 SRC_URI[typeid-1.0.3.sha256sum] = "bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c"
 SRC_URI[typenum-1.18.0.sha256sum] = "1dccffe3ce07af9386bfd29e80c0ab1a8205a2fc34e4bcd40364df902cfa8f3f"
 SRC_URI[ucd-trie-0.1.7.sha256sum] = "2896d95c02a80c6d6a5d6e953d479f5ddf2dfdb6a244441010e373ac0fb88971"
@@ -952,17 +937,12 @@ SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[windows-core-0.62.0.sha256sum] = "57fe7168f7de578d2d8a05b07fd61870d2e73b4020e9f49aa00da8471723497c"
-SRC_URI[windows-implement-0.60.0.sha256sum] = "a47fddd13af08290e67f4acabf4b459f647552718f683a7b415d290ac744a836"
-SRC_URI[windows-interface-0.59.1.sha256sum] = "bd9211b69f8dcdfa817bfd14bf1c97c9188afa36f4750130fcdf3f400eca9fa8"
 SRC_URI[windows-link-0.1.3.sha256sum] = "5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a"
 SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
-SRC_URI[windows-result-0.4.0.sha256sum] = "7084dcc306f89883455a206237404d3eaf961e5bd7e0f312f7c91f57eb44167f"
-SRC_URI[windows-strings-0.5.0.sha256sum] = "7218c655a553b0bed4426cf54b20d7ba363ef543b52d515b3e48d7fd55318dda"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
 SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
 SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
-SRC_URI[windows-sys-0.61.0.sha256sum] = "e201184e40b2ede64bc2ea34968b28e33622acdbbf37104f0e4a33f7abe657aa"
+SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
 SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
 SRC_URI[windows-targets-0.53.3.sha256sum] = "d5fe6031c4041849d7c496a8ded650796e7b6ecc19df1a431c1a363342e5dc91"
 SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
@@ -997,10 +977,12 @@ SRC_URI[yoke-0.8.3.sha256sum] = "709fe23a0424b6a435d82152b1bd3fdfb0833487d5fa90d
 SRC_URI[yoke-derive-0.8.2.sha256sum] = "de844c262c8848816172cef550288e7dc6c7b7814b4ee56b3e1553f275f1858e"
 SRC_URI[zerofrom-0.1.6.sha256sum] = "50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5"
 SRC_URI[zerofrom-derive-0.1.6.sha256sum] = "d71e5d6e06ab090c67b5e44993ec16b72dcbaabc526db883a360057678b48502"
+SRC_URI[zeroize-1.9.1.sha256sum] = "e13084392c5e4bc371903e2935a5eaeed24905a7511356b883835e18a78f6879"
+SRC_URI[zeroize_derive-1.5.0.sha256sum] = "3c50655cbb0fe3fc43170059e702f1ce5e19b84cec58dc87b037a09935c2f328"
 SRC_URI[zerotrie-0.2.5.sha256sum] = "4ea269c3bd32f0a32c321907a2ae912ba6f4649bb0fc764a15627e99a7095a3f"
 SRC_URI[zerovec-0.11.8.sha256sum] = "bb0464e17806c1d976d5cba29399c7f08e516e279e2ba493f63123b5fca67dd8"
 SRC_URI[zerovec-derive-0.11.6.sha256sum] = "34df6fc39dbd26ddc9c10e6a2984476e13acce22e64e4487636ef494369225da"
-SRC_URI[zip-9.0.5.sha256sum] = "6e04976da629d3b04204ba8105b396a193af8ad2583b2c79bfb3ab8af580a11e"
+SRC_URI[zip-9.5.1.sha256sum] = "e3476fd497ac8af5b1ec7b51acab7bef380f7e8dd8e0487595bafd839417a302"
 SRC_URI[zlib-rs-0.5.5.sha256sum] = "40990edd51aae2c2b6907af74ffb635029d5788228222c4bb811e9351c0caad3"
 SRC_URI[zmij-1.0.10.sha256sum] = "30e0d8dffbae3d840f64bda38e28391faef673a7b5a6017840f2a106c8145868"
 SRC_URI[zstd-0.14.3.sha256sum] = "db3ae9bf90af6e40197bef767eeefc46ad6397420fe873830bd85e5fbbfb3c70"
diff --git a/meta-python/recipes-devtools/python/python3-ruff_0.17.5.bb b/meta-python/recipes-devtools/python/python3-ruff_0.17.6.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-ruff_0.17.5.bb
rename to meta-python/recipes-devtools/python/python3-ruff_0.17.6.bb
index de6e6d0be5..7c727e9ba6 100644
--- a/meta-python/recipes-devtools/python/python3-ruff_0.17.5.bb
+++ b/meta-python/recipes-devtools/python/python3-ruff_0.17.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e679ca4f742cbfa29ab6a499529c2d39"
 
 SRC_URI += "file://0001-ruff-Use-portable-atomic-for-AtomicU64-on-targets-wi.patch"
 
-SRC_URI[sha256sum] = "625e57d80cd43352d12ea81690f3eac46cddc8c0f35026d137fb0f157f94592e"
+SRC_URI[sha256sum] = "2b04276561331300325040bdca21460770029ec574d4c479099e39e8ad1ed43c"
 
 inherit pypi python_maturin cargo-update-recipe-crates
 
