Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4285.1793738741305544104
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 12:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=m8pxOuNL;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1150490c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 12:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738741; x=1794343541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAPV7tLALOyF8kcJAo8uB/3eGeYcXjwdZvjl/36mhaI=;
        b=m8pxOuNLlgfSU+ix3fvbnXKfZ387kyhezhNko256SljJvkz86JjWGngAG8XRR40Bqo
         O5SicklqYDGkQ3Su/Va35TM8emaMIN4O3P6toowNghNMDiHzXJrA5VTwldrUjZz1hUV3
         y2sX6WBK6NplmBdCiYh+NZ+Xl4PEYRllxR2c7KgSUfGdW3P5CxylX7R15tywlY/+8gQ/
         AgDLpTxr+MsfMl4UzPc0NkInZa7kkC1kNoxHhd5qaxq4AOUg6RzmQVQ528TxS8cqZeF4
         og2R6Uz7d+e3+Wg+SAb2mpPTf9mq7X6YmqBwEpNS21vEDbJ3zV0lM8a+XhtPl7ml3ZW9
         ZLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738741; x=1794343541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DAPV7tLALOyF8kcJAo8uB/3eGeYcXjwdZvjl/36mhaI=;
        b=2dOSMGAdj2Sqy1feBro0vFVp3WNMIqWwHaOc1USHUBb1KARR+9+4OSQTPefR7nfVpM
         Mnrm05BsG/sNkgvbhuehj4tmfA/bagXv6FC91MeLC4B3pOt51szd5D53wVs224yxBfow
         iM7cSWsR52LHVTXV/DLGGrszEy/u16PvH3R1/XGDl/WncsiFt9rQBdsuKasvi017BFux
         DM/IcSIdX5CAy+KSM5xU70ly0jAmgDEZjJ2lzNsobNk9Iz3oF406oooX+03WiTlf+3re
         GPX7zrMqRIz+ZRl1/buSceVyOKEK4AiBX7rHyVAVuTlpzi5fFSZJeKhErFUbgEx5YhRm
         0zbA==
X-Gm-Message-State: APuU4Z9HPJAAkzuGd42mTwccM5IJXwD2j25pr9/syolLboQMThJOdxLL
	2CNYOPddNNeGCFhlJ6cdqFq29IltZJVcXxrsrmHIxpcR0cmBP9UadwAB9Io5yA==
X-Gm-Gg: AYBFou3tRZoycMGHZVilf0PgaQ5D3ke7bjuQ2mJ6Aftp1zPTYGH14QyZbf/TFV2Ebge
	uPx16kqS4/vn8/0AWEqWFTA5owHsbRt4FaWBJQCYGdXPpYjEsuXdU7uQrzQHskfKcM8ySn1BJ78
	3rB2L1epJ42HEtJDQ2L8GG1DBLso47uMPkmzTW5//JhonhMLHYcEFSAaYSII3Zr+rIvUyoq/h0M
	5p23Ea8ptn9FjV4y0uJOmYN6NUOiROj0mEjgSBZ/LH6Y73OVZ7YyhRlrHDc0Pf1mWc/pcQMaWwi
	jmgTyF7zRlpIosr0dXwsDc88ysWPHFrSXrWIlGEnALkGSKzgbFlpQWJb3CPQCO7v3E/kysk/4P0
	bQqQZWIqzRsOoDXOpsDmcFkWTmIszSaJZ2K+lJMCVb65Pe2/iohlCUogvxBHSvIUAJkiAYhDuo1
	nXuqbS+bCRKKZp+Nlg1DZ09b7KXuLGkUbps8Jzn3RBHlyWb9pvcKS8EoNL8ZgQxpUCB64sZs1FR
	2tnCieUMhhvfZ17UbnhrE55XMyF3bCjNQb9WMg5htXaLQyRPmdlRXgCdbLEu1teXCpglLuqDacF
	0ZiaiNy13Fob90SvlkPBZs6EykbKUwBmhLM6BpUbXqoW8sPO22kEoyhbrw+gjA==
X-Received: by 2002:a05:7022:f507:b0:1ab:90a8:87a2 with SMTP id a92af1059eb24-1ad1077e9a6mr17057106c88.11.1793738739910;
        Tue, 03 Nov 2026 12:45:39 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c47076sm1104555c88.16.2026.11.03.12.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:45:38 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/5] thin-provisioning-tools: upgrade 1.3.3 -> 1.3.4
Date: Wed,  4 Nov 2026 09:45:25 +1300
Message-ID: <20261103204529.1094356-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103204529.1094356-1-ankur.tyagi85@gmail.com>
References: <20261103204529.1094356-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 20:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131826
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
- Fix panics in thin_dump when btree nodes point beyond the metadata device
- Fix overflows in IoEngine block range tracking and offset calculation,
  which caused panics or reads at wrong offsets on damaged metadata in
  thin_check, cache_check and other tools.
- Fix integer overflow in space map boundary checks
- Remove redundant leaf insertions in LeafWalker

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../thin-provisioning-tools-crates.inc        | 446 +++++++++---------
 ....3.bb => thin-provisioning-tools_1.3.4.bb} |   2 +-
 2 files changed, 225 insertions(+), 223 deletions(-)
 rename meta-oe/recipes-support/thin-provisioning-tools/{thin-provisioning-tools_1.3.3.bb => thin-provisioning-tools_1.3.4.bb} (97%)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
index 4c211d420d..4805c35151 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
@@ -3,408 +3,410 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/adler2/2.0.1 \
-    crate://crates.io/aho-corasick/1.1.4 \
+    crate://crates.io/aho-corasick/1.1.5 \
     crate://crates.io/allocator-api2/0.2.21 \
-    crate://crates.io/anstream/0.6.21 \
-    crate://crates.io/anstyle/1.0.13 \
-    crate://crates.io/anstyle-parse/0.2.7 \
+    crate://crates.io/anstream/1.0.0 \
+    crate://crates.io/anstyle/1.0.14 \
+    crate://crates.io/anstyle-parse/1.0.0 \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
-    crate://crates.io/anyhow/1.0.102 \
+    crate://crates.io/anyhow/1.0.104 \
     crate://crates.io/approx/0.5.1 \
-    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/autocfg/1.5.1 \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/bindgen/0.72.1 \
-    crate://crates.io/bitflags/2.13.0 \
-    crate://crates.io/bumpalo/3.19.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.13.2 \
+    crate://crates.io/bumpalo/3.20.3 \
     crate://crates.io/by_address/1.2.1 \
-    crate://crates.io/bytemuck/1.24.0 \
+    crate://crates.io/bytemuck/1.25.2 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/castaway/0.2.4 \
     crate://crates.io/cexpr/0.6.0 \
-    crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/cfg_aliases/0.2.1 \
-    crate://crates.io/chacha20/0.10.0 \
-    crate://crates.io/clang-sys/1.8.1 \
-    crate://crates.io/clap/4.5.61 \
-    crate://crates.io/clap_builder/4.5.61 \
-    crate://crates.io/clap_lex/1.1.0 \
-    crate://crates.io/colorchoice/1.0.4 \
-    crate://crates.io/compact_str/0.9.0 \
-    crate://crates.io/console/0.16.1 \
-    crate://crates.io/cpufeatures/0.3.0 \
+    crate://crates.io/cfg-if/1.0.5 \
+    crate://crates.io/cfg_aliases/0.2.2 \
+    crate://crates.io/chacha20/0.10.2 \
+    crate://crates.io/clang-sys/1.9.1 \
+    crate://crates.io/clap/4.6.7 \
+    crate://crates.io/clap_builder/4.6.7 \
+    crate://crates.io/clap_lex/1.1.1 \
+    crate://crates.io/colorchoice/1.0.5 \
+    crate://crates.io/compact_str/0.9.1 \
+    crate://crates.io/console/0.16.6 \
+    crate://crates.io/cpufeatures/0.3.1 \
     crate://crates.io/crc32c/0.6.8 \
-    crate://crates.io/crc32fast/1.5.0 \
-    crate://crates.io/darling/0.20.11 \
-    crate://crates.io/darling_core/0.20.11 \
-    crate://crates.io/darling_macro/0.20.11 \
-    crate://crates.io/data-encoding/2.9.0 \
+    crate://crates.io/crc32fast/1.5.2 \
+    crate://crates.io/darling/0.24.1 \
+    crate://crates.io/darling_core/0.24.1 \
+    crate://crates.io/darling_macro/0.24.1 \
+    crate://crates.io/data-encoding/2.11.1 \
+    crate://crates.io/defmt/1.1.1 \
+    crate://crates.io/defmt-macros/1.1.1 \
+    crate://crates.io/defmt-parser/1.0.0 \
     crate://crates.io/deranged/0.5.8 \
-    crate://crates.io/devicemapper/0.34.7 \
+    crate://crates.io/devicemapper/0.34.8 \
     crate://crates.io/devicemapper-sys/0.3.3 \
     crate://crates.io/downcast/0.11.0 \
-    crate://crates.io/duct/1.1.1 \
-    crate://crates.io/either/1.15.0 \
+    crate://crates.io/duct/1.1.2 \
+    crate://crates.io/either/1.18.0 \
     crate://crates.io/encode_unicode/1.0.0 \
-    crate://crates.io/env_filter/0.1.4 \
-    crate://crates.io/env_logger/0.11.8 \
+    crate://crates.io/env_filter/2.0.0 \
+    crate://crates.io/env_logger/0.11.11 \
     crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/errno/0.3.14 \
     crate://crates.io/exitcode/1.1.2 \
-    crate://crates.io/fast-srgb8/1.0.0 \
-    crate://crates.io/fastrand/2.3.0 \
+    crate://crates.io/fastrand/2.5.0 \
     crate://crates.io/fixedbitset/0.5.7 \
-    crate://crates.io/flate2/1.1.9 \
-    crate://crates.io/fnv/1.0.7 \
+    crate://crates.io/flate2/1.1.10 \
     crate://crates.io/foldhash/0.2.0 \
-    crate://crates.io/fragile/2.0.1 \
+    crate://crates.io/fragile/2.1.0 \
+    crate://crates.io/futures-core/0.3.34 \
+    crate://crates.io/futures-task/0.3.34 \
+    crate://crates.io/futures-util/0.3.34 \
     crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.3 \
-    crate://crates.io/glob/0.3.3 \
+    crate://crates.io/glob/0.3.4 \
     crate://crates.io/hashbrown/0.16.1 \
     crate://crates.io/hashbrown/0.17.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/hermit-abi/0.3.9 \
-    crate://crates.io/hermit-abi/0.5.2 \
+    crate://crates.io/hermit-abi/0.5.3 \
     crate://crates.io/ident_case/1.0.1 \
-    crate://crates.io/indicatif/0.18.4 \
+    crate://crates.io/indicatif/0.18.6 \
     crate://crates.io/indoc/2.0.7 \
-    crate://crates.io/instability/0.3.9 \
+    crate://crates.io/instability/0.3.13 \
     crate://crates.io/io-lifetimes/1.0.11 \
-    crate://crates.io/io-uring/0.7.12 \
+    crate://crates.io/io-uring/0.7.15 \
     crate://crates.io/iovec/0.1.4 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itertools/0.14.0 \
-    crate://crates.io/itoa/1.0.15 \
-    crate://crates.io/jiff/0.2.16 \
-    crate://crates.io/jiff-static/0.2.16 \
-    crate://crates.io/js-sys/0.3.82 \
+    crate://crates.io/itoa/1.0.18 \
+    crate://crates.io/jiff/0.2.37 \
+    crate://crates.io/jiff-core/0.1.1 \
+    crate://crates.io/jiff-static/0.2.37 \
+    crate://crates.io/js-sys/0.3.105 \
     crate://crates.io/kasuari/0.4.12 \
-    crate://crates.io/libc/0.2.186 \
+    crate://crates.io/libc/0.2.189 \
     crate://crates.io/libloading/0.8.9 \
     crate://crates.io/libm/0.2.16 \
     crate://crates.io/libudev-sys/0.1.4 \
-    crate://crates.io/line-clipping/0.3.5 \
+    crate://crates.io/line-clipping/0.3.8 \
     crate://crates.io/linux-raw-sys/0.12.1 \
-    crate://crates.io/log/0.4.28 \
-    crate://crates.io/lru/0.18.0 \
-    crate://crates.io/memchr/2.7.6 \
+    crate://crates.io/log/0.4.34 \
+    crate://crates.io/lru/0.18.4 \
+    crate://crates.io/memchr/2.8.3 \
     crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/miniz_oxide/0.8.9 \
+    crate://crates.io/miniz_oxide/0.9.1 \
     crate://crates.io/mockall/0.13.1 \
     crate://crates.io/mockall_derive/0.13.1 \
     crate://crates.io/nix/0.31.3 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/nom/8.0.0 \
-    crate://crates.io/num-conv/0.2.1 \
+    crate://crates.io/num-conv/0.2.2 \
     crate://crates.io/num-derive/0.4.2 \
     crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/num_cpus/1.17.0 \
     crate://crates.io/num_threads/0.1.7 \
     crate://crates.io/numtoa/0.2.4 \
-    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/once_cell_polyfill/1.70.2 \
     crate://crates.io/os_pipe/1.2.3 \
-    crate://crates.io/palette/0.7.6 \
-    crate://crates.io/palette_derive/0.7.6 \
-    crate://crates.io/pkg-config/0.3.32 \
-    crate://crates.io/portable-atomic/1.13.1 \
-    crate://crates.io/portable-atomic-util/0.2.4 \
+    crate://crates.io/palette/0.7.7 \
+    crate://crates.io/palette_derive/0.7.7 \
+    crate://crates.io/palette_math/0.7.7 \
+    crate://crates.io/pin-project-lite/0.2.17 \
+    crate://crates.io/pkg-config/0.3.34 \
+    crate://crates.io/portable-atomic/1.15.0 \
+    crate://crates.io/portable-atomic-util/0.2.8 \
     crate://crates.io/powerfmt/0.2.0 \
     crate://crates.io/ppv-lite86/0.2.21 \
-    crate://crates.io/predicates/3.1.3 \
-    crate://crates.io/predicates-core/1.0.9 \
-    crate://crates.io/predicates-tree/1.0.12 \
+    crate://crates.io/predicates/3.1.4 \
+    crate://crates.io/predicates-core/1.0.10 \
+    crate://crates.io/predicates-tree/1.0.13 \
     crate://crates.io/prettyplease/0.2.37 \
-    crate://crates.io/proc-macro2/1.0.103 \
+    crate://crates.io/proc-macro2/1.0.107 \
     crate://crates.io/quick-xml/0.38.4 \
     crate://crates.io/quickcheck/1.1.0 \
     crate://crates.io/quickcheck_macros/1.2.0 \
-    crate://crates.io/quote/1.0.42 \
+    crate://crates.io/quote/1.0.47 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
-    crate://crates.io/rand/0.9.4 \
-    crate://crates.io/rand/0.10.1 \
+    crate://crates.io/rand/0.9.5 \
+    crate://crates.io/rand/0.10.2 \
     crate://crates.io/rand_chacha/0.9.0 \
-    crate://crates.io/rand_core/0.9.3 \
+    crate://crates.io/rand_core/0.9.5 \
     crate://crates.io/rand_core/0.10.1 \
-    crate://crates.io/rangemap/1.7.1 \
+    crate://crates.io/rangemap/1.8.0 \
     crate://crates.io/ratatui/0.30.2 \
     crate://crates.io/ratatui-core/0.1.2 \
     crate://crates.io/ratatui-termion/0.1.2 \
     crate://crates.io/ratatui-widgets/0.3.2 \
-    crate://crates.io/regex/1.12.2 \
-    crate://crates.io/regex-automata/0.4.13 \
-    crate://crates.io/regex-syntax/0.8.8 \
-    crate://crates.io/retry/2.1.0 \
-    crate://crates.io/roaring/0.11.4 \
-    crate://crates.io/rustc-hash/2.1.1 \
+    crate://crates.io/regex/1.13.1 \
+    crate://crates.io/regex-automata/0.4.18 \
+    crate://crates.io/regex-syntax/0.8.11 \
+    crate://crates.io/retry/2.2.0 \
+    crate://crates.io/roaring/0.11.5 \
+    crate://crates.io/rustc-hash/2.1.3 \
     crate://crates.io/rustc_version/0.4.1 \
-    crate://crates.io/rustix/1.1.4 \
-    crate://crates.io/rustversion/1.0.22 \
-    crate://crates.io/ryu/1.0.20 \
-    crate://crates.io/semver/1.0.27 \
-    crate://crates.io/serde/1.0.228 \
-    crate://crates.io/serde_core/1.0.228 \
-    crate://crates.io/serde_derive/1.0.228 \
-    crate://crates.io/shared_child/1.1.1 \
-    crate://crates.io/shared_thread/0.2.0 \
+    crate://crates.io/rustix/1.1.5 \
+    crate://crates.io/rustversion/1.0.23 \
+    crate://crates.io/ryu/1.0.23 \
+    crate://crates.io/semver/1.0.28 \
+    crate://crates.io/serde/1.0.229 \
+    crate://crates.io/serde_core/1.0.229 \
+    crate://crates.io/serde_derive/1.0.229 \
+    crate://crates.io/shared_child/1.1.2 \
+    crate://crates.io/shared_thread/0.2.1 \
     crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/sigchld/0.2.4 \
-    crate://crates.io/signal-hook/0.3.18 \
-    crate://crates.io/signal-hook-registry/1.4.6 \
-    crate://crates.io/simd-adler32/0.3.7 \
+    crate://crates.io/sigchld/0.2.5 \
+    crate://crates.io/signal-hook/0.4.4 \
+    crate://crates.io/signal-hook-registry/1.4.8 \
+    crate://crates.io/simd-adler32/0.3.10 \
+    crate://crates.io/slab/0.4.12 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/strum/0.28.0 \
     crate://crates.io/strum_macros/0.28.0 \
-    crate://crates.io/syn/2.0.110 \
+    crate://crates.io/syn/2.0.119 \
+    crate://crates.io/syn/3.0.6 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/termion/4.0.6 \
     crate://crates.io/termtree/0.5.1 \
-    crate://crates.io/thiserror/2.0.18 \
-    crate://crates.io/thiserror-impl/2.0.18 \
-    crate://crates.io/time/0.3.47 \
-    crate://crates.io/time-core/0.1.8 \
+    crate://crates.io/thiserror/2.0.20 \
+    crate://crates.io/thiserror-impl/2.0.20 \
+    crate://crates.io/time/0.3.55 \
+    crate://crates.io/time-core/0.1.9 \
     crate://crates.io/udev/0.9.3 \
-    crate://crates.io/unicode-ident/1.0.22 \
-    crate://crates.io/unicode-segmentation/1.12.0 \
+    crate://crates.io/unicode-ident/1.0.26 \
+    crate://crates.io/unicode-segmentation/1.13.3 \
     crate://crates.io/unicode-truncate/2.0.1 \
-    crate://crates.io/unicode-width/0.2.0 \
+    crate://crates.io/unicode-width/0.2.2 \
     crate://crates.io/unit-prefix/0.5.2 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
-    crate://crates.io/wasm-bindgen/0.2.105 \
-    crate://crates.io/wasm-bindgen-macro/0.2.105 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.105 \
-    crate://crates.io/wasm-bindgen-shared/0.2.105 \
+    crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
+    crate://crates.io/wasm-bindgen/0.2.128 \
+    crate://crates.io/wasm-bindgen-macro/0.2.128 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.128 \
+    crate://crates.io/wasm-bindgen-shared/0.2.128 \
     crate://crates.io/web-time/1.1.0 \
     crate://crates.io/windows-link/0.2.1 \
     crate://crates.io/windows-sys/0.48.0 \
-    crate://crates.io/windows-sys/0.60.2 \
     crate://crates.io/windows-sys/0.61.2 \
     crate://crates.io/windows-targets/0.48.5 \
-    crate://crates.io/windows-targets/0.53.5 \
     crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
-    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
     crate://crates.io/windows_aarch64_msvc/0.48.5 \
-    crate://crates.io/windows_aarch64_msvc/0.53.1 \
     crate://crates.io/windows_i686_gnu/0.48.5 \
-    crate://crates.io/windows_i686_gnu/0.53.1 \
-    crate://crates.io/windows_i686_gnullvm/0.53.1 \
     crate://crates.io/windows_i686_msvc/0.48.5 \
-    crate://crates.io/windows_i686_msvc/0.53.1 \
     crate://crates.io/windows_x86_64_gnu/0.48.5 \
-    crate://crates.io/windows_x86_64_gnu/0.53.1 \
     crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
-    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
     crate://crates.io/windows_x86_64_msvc/0.48.5 \
-    crate://crates.io/windows_x86_64_msvc/0.53.1 \
-    crate://crates.io/wit-bindgen/0.46.0 \
-    crate://crates.io/zerocopy/0.8.27 \
-    crate://crates.io/zerocopy-derive/0.8.27 \
+    crate://crates.io/wit-bindgen/0.57.1 \
+    crate://crates.io/zerocopy/0.8.57 \
+    crate://crates.io/zerocopy-derive/0.8.57 \
+    crate://crates.io/zlib-rs/0.6.8 \
 "
 
 SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
-SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
+SRC_URI[aho-corasick-1.1.5.sha256sum] = "c982642fa9e8606056828ee9a8505737230110bb1099153c79efe865c59d12ba"
 SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
-SRC_URI[anstream-0.6.21.sha256sum] = "43d5b281e737544384e969a5ccad3f1cdd24b48086a0fc1b2a5262a26b8f4f4a"
-SRC_URI[anstyle-1.0.13.sha256sum] = "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78"
-SRC_URI[anstyle-parse-0.2.7.sha256sum] = "4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2"
+SRC_URI[anstream-1.0.0.sha256sum] = "824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d"
+SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
+SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e"
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
-SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
+SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
 SRC_URI[approx-0.5.1.sha256sum] = "cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684db5561995f6dad897c6"
-SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
+SRC_URI[autocfg-1.5.1.sha256sum] = "f2032f911046de80f0a198e0901378627c33f59ea0ac00e363d481118bd70a53"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[bindgen-0.72.1.sha256sum] = "993776b509cfb49c750f11b8f07a46fa23e0a1386ffc01fb1e7d343efc387895"
-SRC_URI[bitflags-2.13.0.sha256sum] = "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
-SRC_URI[bumpalo-3.19.0.sha256sum] = "46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a66f80a5a72e1cb76b34d43"
+SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.13.2.sha256sum] = "3ded4057c258ba199e2d26386d3af3780957ecaee6c4ef4041c6b4b8b97c0b06"
+SRC_URI[bumpalo-3.20.3.sha256sum] = "72f5acc6cb2ba439de613abc23857ec3d78374d8ed5ac84e9d11336e87da8649"
 SRC_URI[by_address-1.2.1.sha256sum] = "64fa3c856b712db6612c019f14756e64e4bcea13337a6b33b696333a9eaa2d06"
-SRC_URI[bytemuck-1.24.0.sha256sum] = "1fbdf580320f38b612e485521afda1ee26d10cc9884efaaa750d383e13e3c5f4"
+SRC_URI[bytemuck-1.25.2.sha256sum] = "95832e849adfb21180ccb6826a99da14e5d266ae5c2e668e1602cf234f153797"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[castaway-0.2.4.sha256sum] = "dec551ab6e7578819132c713a93c022a05d60159dc86e7a7050223577484c55a"
 SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
-SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
-SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
-SRC_URI[chacha20-0.10.0.sha256sum] = "6f8d983286843e49675a4b7a2d174efe136dc93a18d69130dd18198a6c167601"
-SRC_URI[clang-sys-1.8.1.sha256sum] = "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
-SRC_URI[clap-4.5.61.sha256sum] = "52fa72306bb30daf11bc97773431628e5b4916e97aaa74b7d3f625d4d495da02"
-SRC_URI[clap_builder-4.5.61.sha256sum] = "2071365c5c56eae7d77414029dde2f4f4ba151cf68d5a3261c9a40de428ace93"
-SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
-SRC_URI[colorchoice-1.0.4.sha256sum] = "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
-SRC_URI[compact_str-0.9.0.sha256sum] = "3fdb1325a1cece981e8a296ab8f0f9b63ae357bd0784a9faaf548cc7b480707a"
-SRC_URI[console-0.16.1.sha256sum] = "b430743a6eb14e9764d4260d4c0d8123087d504eeb9c48f2b2a5e810dd369df4"
-SRC_URI[cpufeatures-0.3.0.sha256sum] = "8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201"
+SRC_URI[cfg-if-1.0.5.sha256sum] = "4e7648175b45a9a48536d676f68d918270699102aa8dab5496df06904c914600"
+SRC_URI[cfg_aliases-0.2.2.sha256sum] = "f079e83a288787bcd14a6aea84cee5c87a67c5a3e660c30f557a3d24761b3527"
+SRC_URI[chacha20-0.10.2.sha256sum] = "65c35e4b699c7e15ccbe7ee35c005e4fc0a278d22238a2857e6ce2dadeda1b06"
+SRC_URI[clang-sys-1.9.1.sha256sum] = "157a8ba7b480713b56f4c09fd13fc3e0a22a5dfab8097ba61cbc5feef950788a"
+SRC_URI[clap-4.6.7.sha256sum] = "aa8876b300ab35ba921adea3dfd70157a46249b33f95c9084ae5709785478946"
+SRC_URI[clap_builder-4.6.7.sha256sum] = "ec0797fb7aeb1406c84efac526901f7ec3ead2124f946b494e72879d4b54704d"
+SRC_URI[clap_lex-1.1.1.sha256sum] = "1c133bc6a41be0d194c306b5506d15e6feeea7b1d6604bd3f8310dfb2ca96486"
+SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
+SRC_URI[compact_str-0.9.1.sha256sum] = "9dfdd1c2274d9aa354115b09dc9a901d6c5576818cdf70d14cae2bdb47df00ab"
+SRC_URI[console-0.16.6.sha256sum] = "e96a4956774c13c126a8b5af4daa79384f4d826534c95a02d76afb39e2ab64e3"
+SRC_URI[cpufeatures-0.3.1.sha256sum] = "5ca28b0ae3115b884660db4118d803791fd6756b6e88f39c0f3f7859060d7566"
 SRC_URI[crc32c-0.6.8.sha256sum] = "3a47af21622d091a8f0fb295b88bc886ac74efcc613efc19f5d0b21de5c89e47"
-SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
-SRC_URI[darling-0.20.11.sha256sum] = "fc7f46116c46ff9ab3eb1597a45688b6715c6e628b5c133e288e709a29bcb4ee"
-SRC_URI[darling_core-0.20.11.sha256sum] = "0d00b9596d185e565c2207a0b01f8bd1a135483d02d9b7b0a54b11da8d53412e"
-SRC_URI[darling_macro-0.20.11.sha256sum] = "fc34b93ccb385b40dc71c6fceac4b2ad23662c7eeb248cf10d529b7e055b6ead"
-SRC_URI[data-encoding-2.9.0.sha256sum] = "2a2330da5de22e8a3cb63252ce2abb30116bf5265e89c0e01bc17015ce30a476"
+SRC_URI[crc32fast-1.5.2.sha256sum] = "01a7799fd6b852db0e61728dde9a204c423b44d689dbd432522543614b490e78"
+SRC_URI[darling-0.24.1.sha256sum] = "ed17f5901b6630b993ca003def43f2f8ef4014fc13b047b57aad617ff32bc2ec"
+SRC_URI[darling_core-0.24.1.sha256sum] = "6837e2cf7485aaae18f86181d2f0e9a7ed297a025e220aeabf63fdebd3a2ddff"
+SRC_URI[darling_macro-0.24.1.sha256sum] = "2ac7135c3ef02b2f7833bbeb1be5ba7f966dcde8a87c6b87f65a778d71a02785"
+SRC_URI[data-encoding-2.11.1.sha256sum] = "4583a4551df46e2792f82ceeac45e850d2e2d5debba0b91f102385cda5b11f06"
+SRC_URI[defmt-1.1.1.sha256sum] = "e2953bfe4f93bbd20cc71198842756f77d161884c99ebbabc41d80231ded88d1"
+SRC_URI[defmt-macros-1.1.1.sha256sum] = "bad9c72e7ca2137e0dc3813245a0d282fd6daad32fd800af018306a9169b5fe8"
+SRC_URI[defmt-parser-1.0.0.sha256sum] = "10d60334b3b2e7c9d91ef8150abfb6fa4c1c39ebbcf4a81c2e346aad939fee3e"
 SRC_URI[deranged-0.5.8.sha256sum] = "7cd812cc2bc1d69d4764bd80df88b4317eaef9e773c75226407d9bc0876b211c"
-SRC_URI[devicemapper-0.34.7.sha256sum] = "607791a4633fca6e032a66614f4fe96a721dd8641ebe98438283e53d361503cd"
+SRC_URI[devicemapper-0.34.8.sha256sum] = "6d95021344f9715868259d6b500aa0fb2a3b53c39b5c88fc45814355e53ce83a"
 SRC_URI[devicemapper-sys-0.3.3.sha256sum] = "06421aaad10b53bd5d1fe004c26efddfaaeaa4438ff52b84a0f660b3c87d63e6"
 SRC_URI[downcast-0.11.0.sha256sum] = "1435fa1053d8b2fbbe9be7e97eca7f33d37b28409959813daefc1446a14247f1"
-SRC_URI[duct-1.1.1.sha256sum] = "7e66e9c0c03d094e1a0ba1be130b849034aa80c3a2ab8ee94316bc809f3fa684"
-SRC_URI[either-1.15.0.sha256sum] = "48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719"
+SRC_URI[duct-1.1.2.sha256sum] = "61b9e2a29ff01e8bb526a571ad06c10ed72aae80d5999ed204f7971f99f19974"
+SRC_URI[either-1.18.0.sha256sum] = "252afb9ae5eaa683babdc6a068b3f5726eb19e05070c731f9b2a23a7c3e8ed34"
 SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
-SRC_URI[env_filter-0.1.4.sha256sum] = "1bf3c259d255ca70051b30e2e95b5446cdb8949ac4cd22c0d7fd634d89f568e2"
-SRC_URI[env_logger-0.11.8.sha256sum] = "13c863f0904021b108aa8b2f55046443e6b1ebde8fd4a15c399893aae4fa069f"
+SRC_URI[env_filter-2.0.0.sha256sum] = "900d271a03799a1ee8d1ca9b19893b48ca674a9284fefcfb85f05e74ed314217"
+SRC_URI[env_logger-0.11.11.sha256sum] = "de671bd27a75a797dc9ae289ba1e77276e75e2026408aab65185384e2d5cd3f6"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
 SRC_URI[exitcode-1.1.2.sha256sum] = "de853764b47027c2e862a995c34978ffa63c1501f2e15f987ba11bd4f9bba193"
-SRC_URI[fast-srgb8-1.0.0.sha256sum] = "dd2e7510819d6fbf51a5545c8f922716ecfb14df168a3242f7d33e0239efe6a1"
-SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
+SRC_URI[fastrand-2.5.0.sha256sum] = "da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223"
 SRC_URI[fixedbitset-0.5.7.sha256sum] = "1d674e81391d1e1ab681a28d99df07927c6d4aa5b027d7da16ba32d1d21ecd99"
-SRC_URI[flate2-1.1.9.sha256sum] = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
-SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
+SRC_URI[flate2-1.1.10.sha256sum] = "6e634e2e0ebac1ee034020da1ca582e17ffe4e0f5e985823721e168928136dcb"
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
-SRC_URI[fragile-2.0.1.sha256sum] = "28dd6caf6059519a65843af8fe2a3ae298b14b80179855aeb4adc2c1934ee619"
+SRC_URI[fragile-2.1.0.sha256sum] = "8878864ba14bb86e818a412bfd6f18f9eabd4ec0f008a28e8f7eb61db532fcf9"
+SRC_URI[futures-core-0.3.34.sha256sum] = "92d699e522242e69e3003b94ecc1f960f3a5e015aa7c5d7486e65ad01dd94f5e"
+SRC_URI[futures-task-0.3.34.sha256sum] = "cd417de3d1d015fc3bfd2b1ea46dfc7bab72ef86f1cc7cc9c78e728b34a6d1fd"
+SRC_URI[futures-util-0.3.34.sha256sum] = "0d50a92467f8ba5dd6e3ee5d4bd04d73ab2e4e1c44474a0674821dfce14b79bc"
 SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
-SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
+SRC_URI[glob-0.3.4.sha256sum] = "e4eba85ea1d0a966a983acd07deee566e67395d2d96b6fb39e62b5a833f1eb0b"
 SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
 SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hermit-abi-0.3.9.sha256sum] = "d231dfb89cfffdbc30e7fc41579ed6066ad03abda9e567ccafae602b97ec5024"
-SRC_URI[hermit-abi-0.5.2.sha256sum] = "fc0fef456e4baa96da950455cd02c081ca953b141298e41db3fc7e36b1da849c"
+SRC_URI[hermit-abi-0.5.3.sha256sum] = "e17592d60ebacc7d5e169f4663c5f84f9161cc90328abcfe8456f41e4dfcb284"
 SRC_URI[ident_case-1.0.1.sha256sum] = "b9e0384b61958566e926dc50660321d12159025e767c18e043daf26b70104c39"
-SRC_URI[indicatif-0.18.4.sha256sum] = "25470f23803092da7d239834776d653104d551bc4d7eacaf31e6837854b8e9eb"
+SRC_URI[indicatif-0.18.6.sha256sum] = "9433806cd6b4ec1aba79c021c7e4c58fb4c3b9977c085062e611ac929998fb0c"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
-SRC_URI[instability-0.3.9.sha256sum] = "435d80800b936787d62688c927b6490e887c7ef5ff9ce922c6c6050fca75eb9a"
+SRC_URI[instability-0.3.13.sha256sum] = "2bf84e73fa6f27f299dec58e13223cf70db80da872eb921d4f6138342a0eabc8"
 SRC_URI[io-lifetimes-1.0.11.sha256sum] = "eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2"
-SRC_URI[io-uring-0.7.12.sha256sum] = "4d09b98f7eace8982db770e4408e7470b028ce513ac28fecdc6bf4c30fe92b62"
+SRC_URI[io-uring-0.7.15.sha256sum] = "ed3bd0ecfbb87805f538bb7b32e5239ca0763890c623e349860ecba69469f2bb"
 SRC_URI[iovec-0.1.4.sha256sum] = "b2b3ea6ff95e175473f8ffe6a7eb7c00d054240321b84c57051175fe3c1e075e"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
-SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
-SRC_URI[jiff-0.2.16.sha256sum] = "49cce2b81f2098e7e3efc35bc2e0a6b7abec9d34128283d7a26fa8f32a6dbb35"
-SRC_URI[jiff-static-0.2.16.sha256sum] = "980af8b43c3ad5d8d349ace167ec8170839f753a42d233ba19e08afe1850fa69"
-SRC_URI[js-sys-0.3.82.sha256sum] = "b011eec8cc36da2aab2d5cff675ec18454fad408585853910a202391cf9f8e65"
+SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
+SRC_URI[jiff-0.2.37.sha256sum] = "0ab1baf72f08796de0260609515130699b890ac25f30e610ad894bc5856cafdb"
+SRC_URI[jiff-core-0.1.1.sha256sum] = "5e52fe76043ccecc9005d2305ebaadf7d7fc0cc89ca6baa10a94d6bc68c7128c"
+SRC_URI[jiff-static-0.2.37.sha256sum] = "378268a1116ad67ae6228701118ac9f491d78fda38a40a1f1a9e1348de6f7212"
+SRC_URI[js-sys-0.3.105.sha256sum] = "ce57d20d1ea864ce2ac172ab472d409214f4fd359f0b2a2775abdf522e2af99e"
 SRC_URI[kasuari-0.4.12.sha256sum] = "bde5057d6143cc94e861d90f591b9303d6716c6b9602309150bd068853c10899"
-SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
+SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
 SRC_URI[libloading-0.8.9.sha256sum] = "d7c4b02199fee7c5d21a5ae7d8cfa79a6ef5bb2fc834d6e9058e89c825efdc55"
 SRC_URI[libm-0.2.16.sha256sum] = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981"
 SRC_URI[libudev-sys-0.1.4.sha256sum] = "3c8469b4a23b962c1396b9b451dda50ef5b283e8dd309d69033475fa9b334324"
-SRC_URI[line-clipping-0.3.5.sha256sum] = "5f4de44e98ddbf09375cbf4d17714d18f39195f4f4894e8524501726fd9a8a4a"
+SRC_URI[line-clipping-0.3.8.sha256sum] = "e752191d037c44ad111a8caa762921926658402f01cc1253f7bef2020ece4f5e"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
-SRC_URI[log-0.4.28.sha256sum] = "34080505efa8e45a4b816c349525ebe327ceaa8559756f0356cba97ef3bf7432"
-SRC_URI[lru-0.18.0.sha256sum] = "8a860605968fce16869fd239cf4237a82f3ac470723415db603b0e8b6c8d4fb9"
-SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
+SRC_URI[log-0.4.34.sha256sum] = "f9f8bd3e56ce4dfc153cf470fffbfa98c7620958b312ca5c3a4b8d5181fd13c6"
+SRC_URI[lru-0.18.4.sha256sum] = "ff9840bcc50b71349309900da0ce7279aa336ae71d73250b07998932c7d97c25"
+SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
-SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
+SRC_URI[miniz_oxide-0.9.1.sha256sum] = "b63fbc4a50860e98e7b2aa7804ded1db5cbc3aff9193adaff57a6931bf7c4b4c"
 SRC_URI[mockall-0.13.1.sha256sum] = "39a6bfcc6c8c7eed5ee98b9c3e33adc726054389233e201c95dab2d41a3839d2"
 SRC_URI[mockall_derive-0.13.1.sha256sum] = "25ca3004c2efe9011bd4e461bd8256445052b9615405b4f7ea43fc8ca5c20898"
 SRC_URI[nix-0.31.3.sha256sum] = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[nom-8.0.0.sha256sum] = "df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405"
-SRC_URI[num-conv-0.2.1.sha256sum] = "c6673768db2d862beb9b39a78fdcb1a69439615d5794a1be50caa9bc92c81967"
+SRC_URI[num-conv-0.2.2.sha256sum] = "521739c6d2bac4aa25192232afe6841231376b2b26d4d9fae5ecf8ca5772e441"
 SRC_URI[num-derive-0.4.2.sha256sum] = "ed3955f1a9c7c0c15e092f9c887db08b1fc683305fdf6eb6684f22555355e202"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[num_cpus-1.17.0.sha256sum] = "91df4bbde75afed763b708b7eee1e8e7651e02d97f6d5dd763e89367e957b23b"
 SRC_URI[num_threads-0.1.7.sha256sum] = "5c7398b9c8b70908f6371f47ed36737907c87c52af34c268fed0bf0ceb92ead9"
 SRC_URI[numtoa-0.2.4.sha256sum] = "6aa2c4e539b869820a2b82e1aef6ff40aa85e65decdd5185e83fb4b1249cd00f"
-SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
 SRC_URI[os_pipe-1.2.3.sha256sum] = "7d8fae84b431384b68627d0f9b3b1245fcf9f46f6c0e3dc902e9dce64edd1967"
-SRC_URI[palette-0.7.6.sha256sum] = "4cbf71184cc5ecc2e4e1baccdb21026c20e5fc3dcf63028a086131b3ab00b6e6"
-SRC_URI[palette_derive-0.7.6.sha256sum] = "f5030daf005bface118c096f510ffb781fc28f9ab6a32ab224d8631be6851d30"
-SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
-SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
-SRC_URI[portable-atomic-util-0.2.4.sha256sum] = "d8a2f0d8d040d7848a709caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
+SRC_URI[palette-0.7.7.sha256sum] = "ddeed8580d347d2abf3dcf06a5f0b3dc020258338526b277847cd4248a70fc64"
+SRC_URI[palette_derive-0.7.7.sha256sum] = "88537020289b719d81be994ccf1bbf4990f477e2f69ee52fe3e45f43a02e56be"
+SRC_URI[palette_math-0.7.7.sha256sum] = "6e6eb142958d64335fb0e345c5b9ead2ecd6fc438c307e9d7d3c4fd428dbaf12"
+SRC_URI[pin-project-lite-0.2.17.sha256sum] = "a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd"
+SRC_URI[pkg-config-0.3.34.sha256sum] = "f6b464fbc74e149a392436b17d523f769e057cb6877f6a5c4618bc6f11800548"
+SRC_URI[portable-atomic-1.15.0.sha256sum] = "05c8b63e8d9609db387f0324918f81d68fe27748f084ef092fb35954d0539a85"
+SRC_URI[portable-atomic-util-0.2.8.sha256sum] = "10ab3eb7f3becc3a1cbc4f2c6f20267996cfc1a6467a873763411b136a122715"
 SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
-SRC_URI[predicates-3.1.3.sha256sum] = "a5d19ee57562043d37e82899fade9a22ebab7be9cef5026b07fda9cdd4293573"
-SRC_URI[predicates-core-1.0.9.sha256sum] = "727e462b119fe9c93fd0eb1429a5f7647394014cf3c04ab2c0350eeb09095ffa"
-SRC_URI[predicates-tree-1.0.12.sha256sum] = "72dd2d6d381dfb73a193c7fca536518d7caee39fc8503f74e7dc0be0531b425c"
+SRC_URI[predicates-3.1.4.sha256sum] = "ada8f2932f28a27ee7b70dd6c1c39ea0675c55a36879ab92f3a715eaa1e63cfe"
+SRC_URI[predicates-core-1.0.10.sha256sum] = "cad38746f3166b4031b1a0d39ad9f954dd291e7854fcc0eed52ee41a0b50d144"
+SRC_URI[predicates-tree-1.0.13.sha256sum] = "d0de1b847b39c8131db0467e9df1ff60e6d0562ab8e9a16e568ad0fdb372e2f2"
 SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
-SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
+SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
 SRC_URI[quick-xml-0.38.4.sha256sum] = "b66c2058c55a409d601666cffe35f04333cf1013010882cec174a7467cd4e21c"
 SRC_URI[quickcheck-1.1.0.sha256sum] = "95c589f335db0f6aaa168a7cd27b1fc6920f5e1470c804f814d9cd6e62a0f70b"
 SRC_URI[quickcheck_macros-1.2.0.sha256sum] = "a9a28b8493dd664c8b171dd944da82d933f7d456b829bfb236738e1fe06c5ba4"
-SRC_URI[quote-1.0.42.sha256sum] = "a338cc41d27e6cc6dce6cefc13a0729dfbb81c262b1f519331575dd80ef3067f"
+SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
-SRC_URI[rand-0.9.4.sha256sum] = "44c5af06bb1b7d3216d91932aed5265164bf384dc89cd6ba05cf59a35f5f76ea"
-SRC_URI[rand-0.10.1.sha256sum] = "d2e8e8bcc7961af1fdac401278c6a831614941f6164ee3bf4ce61b7edb162207"
+SRC_URI[rand-0.9.5.sha256sum] = "b9ef1d0d795eb7d84685bca4f72f3649f064e6641543d3a8c415898726a57b41"
+SRC_URI[rand-0.10.2.sha256sum] = "c7f5fa3a058cd35567ef9bfa5e75732bee0f9e4c55fa90477bef2dfcdbc4be80"
 SRC_URI[rand_chacha-0.9.0.sha256sum] = "d3022b5f1df60f26e1ffddd6c66e8aa15de382ae63b3a0c1bfc0e4d3e3f325cb"
-SRC_URI[rand_core-0.9.3.sha256sum] = "99d9a13982dcf210057a8a78572b2217b667c3beacbf3a0d8b454f6f82837d38"
+SRC_URI[rand_core-0.9.5.sha256sum] = "76afc826de14238e6e8c374ddcc1fa19e374fd8dd986b0d2af0d02377261d83c"
 SRC_URI[rand_core-0.10.1.sha256sum] = "63b8176103e19a2643978565ca18b50549f6101881c443590420e4dc998a3c69"
-SRC_URI[rangemap-1.7.1.sha256sum] = "973443cf09a9c8656b574a866ab68dfa19f0867d0340648c7d2f6a71b8a8ea68"
+SRC_URI[rangemap-1.8.0.sha256sum] = "a611d15b50743feb4c76b7d03edcb0e64f399c26961e4efe6975bc398be6aa3d"
 SRC_URI[ratatui-0.30.2.sha256sum] = "3274ba0a2c5e1bcad2a2005d20f4dc59dad26b2eb0940fb094500dba4099d57d"
 SRC_URI[ratatui-core-0.1.2.sha256sum] = "cbb175c433c8e28a809d1f5773a2ae96e68c0ce40db865cbab1020bf33ae479c"
 SRC_URI[ratatui-termion-0.1.2.sha256sum] = "87c732202fa5a71a9da0991013f0853e53f87048f45198e3a1ca3ee722accc2f"
 SRC_URI[ratatui-widgets-0.3.2.sha256sum] = "66e3d19bcc9130ca376277d93b60767ff121ace3be06f5f95f81dd68956407d1"
-SRC_URI[regex-1.12.2.sha256sum] = "843bc0191f75f3e22651ae5f1e72939ab2f72a4bc30fa80a066bd66edefc24d4"
-SRC_URI[regex-automata-0.4.13.sha256sum] = "5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
-SRC_URI[regex-syntax-0.8.8.sha256sum] = "7a2d987857b319362043e95f5353c0535c1f58eec5336fdfcf626430af7def58"
-SRC_URI[retry-2.1.0.sha256sum] = "a1e211f878258887b3e65dd3c8ff9f530fe109f441a117ee0cdc27f341355032"
-SRC_URI[roaring-0.11.4.sha256sum] = "1dedc5658c6ecb3bdb5ef5f3295bb9253f42dcf3fd1402c03f6b1f7659c3c4a9"
-SRC_URI[rustc-hash-2.1.1.sha256sum] = "357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d"
+SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
+SRC_URI[regex-automata-0.4.18.sha256sum] = "ad8553b9b26413251cbf30e620595c7a41b3887f03da04579c0e6b0d6a06b4b2"
+SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
+SRC_URI[retry-2.2.0.sha256sum] = "1cab9bd343c737660e523ee69f788018f3db686d537d2fd0f99c9f747c1bda4f"
+SRC_URI[roaring-0.11.5.sha256sum] = "18bd8a37d17a58532776dcdf6041ce64929adca78e8489d5cacbafe99229d3e1"
+SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
 SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
-SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
-SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
-SRC_URI[ryu-1.0.20.sha256sum] = "28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f"
-SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
-SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
-SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
-SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
-SRC_URI[shared_child-1.1.1.sha256sum] = "1e362d9935bc50f019969e2f9ecd66786612daae13e8f277be7bfb66e8bed3f7"
-SRC_URI[shared_thread-0.2.0.sha256sum] = "52b86057fcb5423f5018e331ac04623e32d6b5ce85e33300f92c79a1973928b0"
+SRC_URI[rustix-1.1.5.sha256sum] = "891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d"
+SRC_URI[rustversion-1.0.23.sha256sum] = "cf54715a573b99ac80df0bc206da022bcd442c974952c7b9720069370852e21f"
+SRC_URI[ryu-1.0.23.sha256sum] = "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
+SRC_URI[semver-1.0.28.sha256sum] = "8a7852d02fc848982e0c167ef163aaff9cd91dc640ba85e263cb1ce46fae51cd"
+SRC_URI[serde-1.0.229.sha256sum] = "4148590afebada386688f18773da617792bf2ef03ffc1e4cbd2b1d45b023e0ba"
+SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
+SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
+SRC_URI[shared_child-1.1.2.sha256sum] = "607549934f6cc26b89cfecfdc46fa90f1e5d1536a68349b0c3a4f9d1c0d37959"
+SRC_URI[shared_thread-0.2.1.sha256sum] = "de1c6cdf07f3a4b1900680728ac1a12f72aa6424f37138f9253116461576e00f"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
-SRC_URI[sigchld-0.2.4.sha256sum] = "47106eded3c154e70176fc83df9737335c94ce22f821c32d17ed1db1f83badb1"
-SRC_URI[signal-hook-0.3.18.sha256sum] = "d881a16cf4426aa584979d30bd82cb33429027e42122b169753d6ef1085ed6e2"
-SRC_URI[signal-hook-registry-1.4.6.sha256sum] = "b2a4719bff48cee6b39d12c020eeb490953ad2443b7055bd0b21fca26bd8c28b"
-SRC_URI[simd-adler32-0.3.7.sha256sum] = "d66dc143e6b11c1eddc06d5c423cfc97062865baf299914ab64caa38182078fe"
+SRC_URI[sigchld-0.2.5.sha256sum] = "24f2b37f04360cd465089b87a9c3869c08220a2f3458463f0adf8badf5e77f2c"
+SRC_URI[signal-hook-0.4.4.sha256sum] = "b2a0c28ca5908dbdbcd52e6fdaa00358ab88637f8ab33e1f188dd510eb44b53d"
+SRC_URI[signal-hook-registry-1.4.8.sha256sum] = "c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
+SRC_URI[simd-adler32-0.3.10.sha256sum] = "3a219298ac11a56ea9a6d2120044824d6f01aeb034955e7af7bc16858527deea"
+SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[strum-0.28.0.sha256sum] = "9628de9b8791db39ceda2b119bbe13134770b56c138ec1d3af810d045c04f9bd"
 SRC_URI[strum_macros-0.28.0.sha256sum] = "ab85eea0270ee17587ed4156089e10b9e6880ee688791d45a905f5b1ca36f664"
-SRC_URI[syn-2.0.110.sha256sum] = "a99801b5bd34ede4cf3fc688c5919368fea4e4814a4664359503e6015b280aea"
+SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
+SRC_URI[syn-3.0.6.sha256sum] = "8593e8e72159ed2257d083c7a454a85cbf854f37a0966d8d483aff8c8a3ebcee"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[termion-4.0.6.sha256sum] = "f44138a9ae08f0f502f24104d82517ef4da7330c35acd638f1f29d3cd5475ecb"
 SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
-SRC_URI[thiserror-2.0.18.sha256sum] = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
-SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
-SRC_URI[time-0.3.47.sha256sum] = "743bd48c283afc0388f9b8827b976905fb217ad9e647fae3a379a9283c4def2c"
-SRC_URI[time-core-0.1.8.sha256sum] = "7694e1cfe791f8d31026952abf09c69ca6f6fa4e1a1229e18988f06a04a12dca"
+SRC_URI[thiserror-2.0.20.sha256sum] = "ec86235f5fcc2a73650310756d2ac5b138a5780bbbdfae3eeccec992c435ba4f"
+SRC_URI[thiserror-impl-2.0.20.sha256sum] = "bc04cd3e1236dd4a98afca4569f2deb3f120e5422a4023be2cb683f8486292af"
+SRC_URI[time-0.3.55.sha256sum] = "cdb87b95ec50ddfa440816d227a17b2ccbdda963a316a727fda0fc4334f7d134"
+SRC_URI[time-core-0.1.9.sha256sum] = "9e1c906769ad99c88eaa54e728060edef082f8e358ff32030cb7c7d315e81109"
 SRC_URI[udev-0.9.3.sha256sum] = "af4e37e9ea4401fc841ff54b9ddfc9be1079b1e89434c1a6a865dd68980f7e9f"
-SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
-SRC_URI[unicode-segmentation-1.12.0.sha256sum] = "f6ccf251212114b54433ec949fd6a7841275f9ada20dddd2f29e9ceea4501493"
+SRC_URI[unicode-ident-1.0.26.sha256sum] = "d245f478577f809a851594d02313b640fb437e0bb33866753cff937863096954"
+SRC_URI[unicode-segmentation-1.13.3.sha256sum] = "c6f5d3c3b1bf09027a88a6bc961fc00497d651009560b5463668dc81b0fa87a8"
 SRC_URI[unicode-truncate-2.0.1.sha256sum] = "16b380a1238663e5f8a691f9039c73e1cdae598a30e9855f541d29b08b53e9a5"
-SRC_URI[unicode-width-0.2.0.sha256sum] = "1fc81956842c57dac11422a97c3b8195a1ff727f06e85c84ed2e8aa277c9a0fd"
+SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
 SRC_URI[unit-prefix-0.5.2.sha256sum] = "81e544489bf3d8ef66c953931f56617f423cd4b5494be343d9b9d3dda037b9a3"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] = "0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
-SRC_URI[wasm-bindgen-0.2.105.sha256sum] = "da95793dfc411fbbd93f5be7715b0578ec61fe87cb1a42b12eb625caa5c5ea60"
-SRC_URI[wasm-bindgen-macro-0.2.105.sha256sum] = "04264334509e04a7bf8690f2384ef5265f05143a4bff3889ab7a3269adab59c2"
-SRC_URI[wasm-bindgen-macro-support-0.2.105.sha256sum] = "420bc339d9f322e562942d52e115d57e950d12d88983a14c79b86859ee6c7ebc"
-SRC_URI[wasm-bindgen-shared-0.2.105.sha256sum] = "76f218a38c84bcb33c25ec7059b07847d465ce0e0a76b995e134a45adcb6af76"
+SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] = "b67efb37e106e55ce722a510d6b5f9c17f083e5fc79afc2badeb12cc313d9487"
+SRC_URI[wasm-bindgen-0.2.128.sha256sum] = "aecb87a33d3b0c5e3b7aa46336eaf486cffafbd281b195e4c8b80d50df2351bf"
+SRC_URI[wasm-bindgen-macro-0.2.128.sha256sum] = "a690d511e3c1a8b3a55e33511e3c2c00c78415cd23650f32b808627f5696b9ed"
+SRC_URI[wasm-bindgen-macro-support-0.2.128.sha256sum] = "411e4887f0071ef2d2164a9d5fdf2d20efbef78fccd3a78b0c10a1dc5295e48a"
+SRC_URI[wasm-bindgen-shared-0.2.128.sha256sum] = "81941cd78d0c92026c33e5e01312845a4cb1e9af3407f9134b100dd03144103e"
 SRC_URI[web-time-1.1.0.sha256sum] = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
 SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
 SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
-SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
 SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
-SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
 SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
-SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
 SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
-SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
 SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
-SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
-SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
 SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
-SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
 SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
-SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
 SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
-SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
 SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
-SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
-SRC_URI[wit-bindgen-0.46.0.sha256sum] = "f17a85883d4e6d00e8a97c586de764dabcc06133f7f1d55dce5cdc070ad7fe59"
-SRC_URI[zerocopy-0.8.27.sha256sum] = "0894878a5fa3edfd6da3f88c4805f4c8558e2b996227a3d864f47fe11e38282c"
-SRC_URI[zerocopy-derive-0.8.27.sha256sum] = "88d2b8d9c68ad2b9e4340d7832716a4d21a22a1154777ad56ea55c51a9cf3831"
+SRC_URI[wit-bindgen-0.57.1.sha256sum] = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
+SRC_URI[zerocopy-0.8.57.sha256sum] = "d35102a9f36d089ccae9e4c6802bc118be4487b80aaffc0ab4e0cf5ce92d2873"
+SRC_URI[zerocopy-derive-0.8.57.sha256sum] = "146c01f5ab44258da43cf276c74a2763db2ff3969c9c652c3f2de07041d0b2bc"
+SRC_URI[zlib-rs-0.6.8.sha256sum] = "b268e58e7c693d7c271f93ffc4ba3b380412554231c85bf61ca7af91042a4112"
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.3.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.4.bb
similarity index 97%
rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.3.bb
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.4.bb
index 92b1caa8ee..c6ae257ad5 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.3.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.4.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
         '', d)} \
     "
 
-SRCREV = "b61de422f87f06ca7526d0b378de4412ad2c760c"
+SRCREV = "b4db8332a7586985149b9545bb2592d4b274c99e"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cargo cargo-update-recipe-crates
