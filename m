Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9969DC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 20:41:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.32076.1703104890544237912
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 12:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ivyRXEsG;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so1114495e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 12:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703104888; x=1703709688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3wIbVep9aFDjCXzj4YlMC/ku7/SxG4iVkyuZeLR7W1A=;
        b=ivyRXEsGxQl3FtJHBdG43UM0qx8+CG9/RfQMRnkOH/viVosx7t+FBEm8jFMi9hdRpu
         d//8y1WsBLmH4g5Wq1SqZUCn8ceIZGnkWaSGbF4r+20Y0lTtUr3/RYZnUuml+t0xUXHL
         SioA9qg4q3nZxC9ql/PwILzlD7ZHx3I+sAGVS2FEWFOpoPXNt8uQZRUBe5AaH/wrIN5E
         9tDPxMAdNAH+W8OLAnj8zWIftgoKTtMlFqqaHNZgdYOLLrqEflOUup4+nZ+orw+10OG+
         H8R/VaCIBfvfM9u8cqJIq8E3t4X6tP5ExV50BkvN933dvTjIWC1tJS/SAO0WDRrbS5dJ
         wcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703104888; x=1703709688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wIbVep9aFDjCXzj4YlMC/ku7/SxG4iVkyuZeLR7W1A=;
        b=FpyAlyOQLwFkGERviiwPOGrD+sOacfysP3+ecDjjwCtFjyn/BKfFM7I0JURohkCGSC
         ju8zhFVBE2hG35/4Mz+7CsZRKl8878eozZ2x/MgZHKjmrHI0OX4E3UhytTXIrqdaAZeI
         e2dWd4Qxbs2lIUqfYGcrP3GkzcJ2EswLrk/4TJxAMJCZV9+0Q3ERig04V8JokD/K0ekL
         DMQohnvHbXdWsmlCgMhmHreRtXKBZElQXBvzLzwVzWgUrURc5KADITPxhVjMejrqL6DR
         Kd6UeuDWB+/GE+PAN/rJcoYA4WKwJkG5ksDx6ryzXH2EmqwaQhP1A6eQr0bOZvHli60Q
         +9OQ==
X-Gm-Message-State: AOJu0YxG93vT8uwOCR/qOwLQTLnKC0O3eYIIA9avQbyfm5qP8k6USWfp
	3VJcDsRgsaWGl2nqliaFuRhGlQuMzRc=
X-Google-Smtp-Source: AGHT+IH2LtD4tDzRVuiClz/cWDR+x9+ZhTj9LrNDOdbPBJAI/Snb++k36+ELzsZBfvhfKBKyRzBnkg==
X-Received: by 2002:a05:600c:5251:b0:40c:3187:b022 with SMTP id fc17-20020a05600c525100b0040c3187b022mr138896wmb.125.1703104887521;
        Wed, 20 Dec 2023 12:41:27 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:8108:f84e:1a21:c7d3])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c444800b0040c2c5f5844sm753146wmn.21.2023.12.20.12.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 12:41:27 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] thin-provisioning-tools: Upgrade 1.0.4 -> 1.0.9
Date: Wed, 20 Dec 2023 20:41:25 +0000
Message-Id: <20231220204125.28017-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 20:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107669

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../thin-provisioning-tools-crates.inc        | 318 ++++++++----------
 .../thin-provisioning-tools-git-crates.inc    |   4 -
 ....4.bb => thin-provisioning-tools_1.0.9.bb} |   2 +-
 3 files changed, 139 insertions(+), 185 deletions(-)
 rename meta-oe/recipes-support/thin-provisioning-tools/{thin-provisioning-tools_1.0.4.bb => thin-provisioning-tools_1.0.9.bb} (95%)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
index f7992b9411e9..52a8180d23a1 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
@@ -3,304 +3,262 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/adler/1.0.2 \
-    crate://crates.io/aho-corasick/1.0.1 \
-    crate://crates.io/anyhow/1.0.70 \
+    crate://crates.io/aho-corasick/1.1.2 \
+    crate://crates.io/anstyle/1.0.4 \
+    crate://crates.io/anyhow/1.0.75 \
     crate://crates.io/atty/0.2.14 \
     crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/base64/0.20.0 \
+    crate://crates.io/base64/0.21.5 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bytemuck/1.13.1 \
-    crate://crates.io/byteorder/1.4.3 \
+    crate://crates.io/bitflags/2.4.1 \
+    crate://crates.io/bytemuck/1.14.0 \
+    crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/cassowary/0.3.0 \
-    crate://crates.io/cc/1.0.79 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/clap/3.2.23 \
-    crate://crates.io/clap_lex/0.2.4 \
-    crate://crates.io/console/0.15.5 \
+    crate://crates.io/clap/4.4.11 \
+    crate://crates.io/clap_builder/4.4.11 \
+    crate://crates.io/clap_lex/0.6.0 \
+    crate://crates.io/console/0.15.7 \
+    crate://crates.io/crc32c/0.6.4 \
     crate://crates.io/crc32fast/1.3.2 \
-    crate://crates.io/data-encoding/2.3.3 \
+    crate://crates.io/data-encoding/2.5.0 \
     crate://crates.io/difflib/0.4.0 \
     crate://crates.io/downcast/0.11.0 \
     crate://crates.io/duct/0.13.6 \
-    crate://crates.io/either/1.8.1 \
+    crate://crates.io/either/1.9.0 \
     crate://crates.io/encode_unicode/0.3.6 \
-    crate://crates.io/env_logger/0.7.1 \
-    crate://crates.io/errno/0.3.1 \
-    crate://crates.io/errno-dragonfly/0.1.2 \
+    crate://crates.io/env_logger/0.8.4 \
+    crate://crates.io/errno/0.3.8 \
     crate://crates.io/exitcode/1.1.2 \
-    crate://crates.io/fastrand/1.9.0 \
+    crate://crates.io/fastrand/2.0.1 \
     crate://crates.io/fixedbitset/0.4.2 \
-    crate://crates.io/flate2/1.0.25 \
+    crate://crates.io/flate2/1.0.28 \
     crate://crates.io/float-cmp/0.9.0 \
     crate://crates.io/fragile/2.0.0 \
-    crate://crates.io/futures/0.3.28 \
-    crate://crates.io/futures-channel/0.3.28 \
-    crate://crates.io/futures-core/0.3.28 \
-    crate://crates.io/futures-executor/0.3.28 \
-    crate://crates.io/futures-io/0.3.28 \
-    crate://crates.io/futures-macro/0.3.28 \
-    crate://crates.io/futures-sink/0.3.28 \
-    crate://crates.io/futures-task/0.3.28 \
-    crate://crates.io/futures-util/0.3.28 \
-    crate://crates.io/getrandom/0.1.16 \
-    crate://crates.io/getrandom/0.2.9 \
-    crate://crates.io/hashbrown/0.12.3 \
+    crate://crates.io/getrandom/0.2.11 \
     crate://crates.io/hermit-abi/0.1.19 \
-    crate://crates.io/hermit-abi/0.2.6 \
-    crate://crates.io/hermit-abi/0.3.1 \
-    crate://crates.io/indexmap/1.9.3 \
-    crate://crates.io/indicatif/0.17.3 \
+    crate://crates.io/hermit-abi/0.3.3 \
+    crate://crates.io/indicatif/0.17.7 \
     crate://crates.io/instant/0.1.12 \
-    crate://crates.io/io-lifetimes/1.0.10 \
     crate://crates.io/iovec/0.1.4 \
     crate://crates.io/itertools/0.10.5 \
-    crate://crates.io/jobserver/0.1.26 \
-    crate://crates.io/json/0.12.4 \
     crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/libc/0.2.142 \
-    crate://crates.io/linux-raw-sys/0.3.4 \
-    crate://crates.io/log/0.4.17 \
-    crate://crates.io/memchr/2.5.0 \
+    crate://crates.io/libc/0.2.150 \
+    crate://crates.io/linux-raw-sys/0.4.12 \
+    crate://crates.io/log/0.4.20 \
+    crate://crates.io/memchr/2.6.4 \
     crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/miniz_oxide/0.6.2 \
+    crate://crates.io/miniz_oxide/0.7.1 \
     crate://crates.io/mockall/0.11.4 \
     crate://crates.io/mockall_derive/0.11.4 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/normalize-line-endings/0.3.0 \
-    crate://crates.io/num-derive/0.3.3 \
-    crate://crates.io/num-traits/0.2.15 \
-    crate://crates.io/num_cpus/1.15.0 \
+    crate://crates.io/num-derive/0.4.1 \
+    crate://crates.io/num-traits/0.2.17 \
+    crate://crates.io/num_cpus/1.16.0 \
     crate://crates.io/number_prefix/0.4.0 \
     crate://crates.io/numtoa/0.1.0 \
-    crate://crates.io/once_cell/1.17.1 \
+    crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/os_pipe/1.1.4 \
-    crate://crates.io/os_str_bytes/6.5.0 \
-    crate://crates.io/pin-project-lite/0.2.9 \
-    crate://crates.io/pin-utils/0.1.0 \
-    crate://crates.io/pkg-config/0.3.26 \
-    crate://crates.io/portable-atomic/0.3.19 \
+    crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/ppv-lite86/0.2.17 \
     crate://crates.io/predicates/2.1.5 \
     crate://crates.io/predicates-core/1.0.6 \
     crate://crates.io/predicates-tree/1.0.9 \
-    crate://crates.io/proc-macro2/1.0.56 \
-    crate://crates.io/quick-xml/0.23.1 \
-    crate://crates.io/quickcheck/0.9.2 \
-    crate://crates.io/quickcheck_macros/0.9.1 \
-    crate://crates.io/quote/1.0.26 \
-    crate://crates.io/rand/0.7.3 \
+    crate://crates.io/proc-macro2/1.0.70 \
+    crate://crates.io/quick-xml/0.29.0 \
+    crate://crates.io/quickcheck/1.0.3 \
+    crate://crates.io/quickcheck_macros/1.0.0 \
+    crate://crates.io/quote/1.0.33 \
     crate://crates.io/rand/0.8.5 \
-    crate://crates.io/rand_chacha/0.2.2 \
     crate://crates.io/rand_chacha/0.3.1 \
-    crate://crates.io/rand_core/0.5.1 \
     crate://crates.io/rand_core/0.6.4 \
-    crate://crates.io/rand_hc/0.2.0 \
-    crate://crates.io/rangemap/1.3.0 \
+    crate://crates.io/rangemap/1.4.0 \
     crate://crates.io/redox_syscall/0.2.16 \
-    crate://crates.io/redox_syscall/0.3.5 \
-    crate://crates.io/redox_termios/0.1.2 \
-    crate://crates.io/regex/1.8.1 \
-    crate://crates.io/regex-syntax/0.7.1 \
+    crate://crates.io/redox_syscall/0.4.1 \
+    crate://crates.io/redox_termios/0.1.3 \
+    crate://crates.io/regex/1.10.2 \
+    crate://crates.io/regex-automata/0.4.3 \
+    crate://crates.io/regex-syntax/0.8.2 \
     crate://crates.io/retain_mut/0.1.7 \
-    crate://crates.io/roaring/0.10.1 \
+    crate://crates.io/roaring/0.10.2 \
     crate://crates.io/rustc_version/0.4.0 \
-    crate://crates.io/rustix/0.37.14 \
+    crate://crates.io/rustix/0.38.27 \
     crate://crates.io/safemem/0.3.3 \
-    crate://crates.io/semver/1.0.17 \
+    crate://crates.io/semver/1.0.20 \
     crate://crates.io/shared_child/1.0.0 \
-    crate://crates.io/slab/0.4.8 \
     crate://crates.io/strsim/0.10.0 \
     crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.15 \
-    crate://crates.io/tempfile/3.5.0 \
-    crate://crates.io/termcolor/1.2.0 \
+    crate://crates.io/syn/2.0.39 \
+    crate://crates.io/tempfile/3.8.1 \
     crate://crates.io/termion/1.5.6 \
     crate://crates.io/termtree/0.4.1 \
-    crate://crates.io/textwrap/0.16.0 \
-    crate://crates.io/thiserror/1.0.40 \
-    crate://crates.io/thiserror-impl/1.0.40 \
+    crate://crates.io/thiserror/1.0.50 \
+    crate://crates.io/thiserror-impl/1.0.50 \
     crate://crates.io/threadpool/1.8.1 \
-    crate://crates.io/tui/0.16.0 \
-    crate://crates.io/unicode-ident/1.0.8 \
+    crate://crates.io/tui/0.19.0 \
+    crate://crates.io/unicode-ident/1.0.12 \
     crate://crates.io/unicode-segmentation/1.10.1 \
-    crate://crates.io/unicode-width/0.1.10 \
-    crate://crates.io/wasi/0.9.0+wasi-snapshot-preview1 \
+    crate://crates.io/unicode-width/0.1.11 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.5 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/windows-sys/0.42.0 \
     crate://crates.io/windows-sys/0.45.0 \
     crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-sys/0.52.0 \
     crate://crates.io/windows-targets/0.42.2 \
-    crate://crates.io/windows-targets/0.48.0 \
+    crate://crates.io/windows-targets/0.48.5 \
+    crate://crates.io/windows-targets/0.52.0 \
     crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
-    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.0 \
     crate://crates.io/windows_aarch64_msvc/0.42.2 \
-    crate://crates.io/windows_aarch64_msvc/0.48.0 \
+    crate://crates.io/windows_aarch64_msvc/0.48.5 \
+    crate://crates.io/windows_aarch64_msvc/0.52.0 \
     crate://crates.io/windows_i686_gnu/0.42.2 \
-    crate://crates.io/windows_i686_gnu/0.48.0 \
+    crate://crates.io/windows_i686_gnu/0.48.5 \
+    crate://crates.io/windows_i686_gnu/0.52.0 \
     crate://crates.io/windows_i686_msvc/0.42.2 \
-    crate://crates.io/windows_i686_msvc/0.48.0 \
+    crate://crates.io/windows_i686_msvc/0.48.5 \
+    crate://crates.io/windows_i686_msvc/0.52.0 \
     crate://crates.io/windows_x86_64_gnu/0.42.2 \
-    crate://crates.io/windows_x86_64_gnu/0.48.0 \
+    crate://crates.io/windows_x86_64_gnu/0.48.5 \
+    crate://crates.io/windows_x86_64_gnu/0.52.0 \
     crate://crates.io/windows_x86_64_gnullvm/0.42.2 \
-    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.0 \
     crate://crates.io/windows_x86_64_msvc/0.42.2 \
-    crate://crates.io/windows_x86_64_msvc/0.48.0 \
-    crate://crates.io/zstd/0.11.2+zstd.1.5.2 \
-    crate://crates.io/zstd-safe/5.0.2+zstd.1.5.2 \
-    crate://crates.io/zstd-sys/2.0.8+zstd.1.5.5 \
+    crate://crates.io/windows_x86_64_msvc/0.48.5 \
+    crate://crates.io/windows_x86_64_msvc/0.52.0 \
 "
 
 SRC_URI[adler-1.0.2.sha256sum] = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
-SRC_URI[aho-corasick-1.0.1.sha256sum] = "67fc08ce920c31afb70f013dcce1bfc3a3195de6a228474e45e1f145b36f8d04"
-SRC_URI[anyhow-1.0.70.sha256sum] = "7de8ce5e0f9f8d88245311066a578d72b7af3e7088f32783804676302df237e4"
+SRC_URI[aho-corasick-1.1.2.sha256sum] = "b2969dcb958b36655471fc61f7e416fa76033bdd4bfed0678d8fee1e2d07a1f0"
+SRC_URI[anstyle-1.0.4.sha256sum] = "7079075b41f533b8c61d2a4d073c4676e1f8b249ff94a393b0595db304e0dd87"
+SRC_URI[anyhow-1.0.75.sha256sum] = "a4668cab20f66d8d020e1fbc0ebe47217433c1b6c8f2040faf858554e394ace6"
 SRC_URI[atty-0.2.14.sha256sum] = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
 SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[base64-0.20.0.sha256sum] = "0ea22880d78093b0cbe17c89f64a7d457941e65759157ec6cb31a31d652b05e5"
+SRC_URI[base64-0.21.5.sha256sum] = "35636a1494ede3b646cc98f74f8e62c773a38a659ebc777a2cf26b9b74171df9"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bytemuck-1.13.1.sha256sum] = "17febce684fd15d89027105661fec94afb475cb995fbc59d2865198446ba2eea"
-SRC_URI[byteorder-1.4.3.sha256sum] = "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610"
+SRC_URI[bitflags-2.4.1.sha256sum] = "327762f6e5a765692301e5bb513e0d9fef63be86bbc14528052b1cd3e6f03e07"
+SRC_URI[bytemuck-1.14.0.sha256sum] = "374d28ec25809ee0e23827c2ab573d729e293f281dfe393500e7ad618baa61c6"
+SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[cassowary-0.3.0.sha256sum] = "df8670b8c7b9dae1793364eafadf7239c40d669904660c5960d74cfd80b46a53"
-SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[clap-3.2.23.sha256sum] = "71655c45cb9845d3270c9d6df84ebe72b4dad3c2ba3f7023ad47c144e4e473a5"
-SRC_URI[clap_lex-0.2.4.sha256sum] = "2850f2f5a82cbf437dd5af4d49848fbdfc27c157c3d010345776f952765261c5"
-SRC_URI[console-0.15.5.sha256sum] = "c3d79fbe8970a77e3e34151cc13d3b3e248aa0faaecb9f6091fa07ebefe5ad60"
+SRC_URI[clap-4.4.11.sha256sum] = "bfaff671f6b22ca62406885ece523383b9b64022e341e53e009a62ebc47a45f2"
+SRC_URI[clap_builder-4.4.11.sha256sum] = "a216b506622bb1d316cd51328dce24e07bdff4a6128a47c7e7fad11878d5adbb"
+SRC_URI[clap_lex-0.6.0.sha256sum] = "702fc72eb24e5a1e48ce58027a675bc24edd52096d5397d4aea7c6dd9eca0bd1"
+SRC_URI[console-0.15.7.sha256sum] = "c926e00cc70edefdc64d3a5ff31cc65bb97a3460097762bd23afb4d8145fccf8"
+SRC_URI[crc32c-0.6.4.sha256sum] = "d8f48d60e5b4d2c53d5c2b1d8a58c849a70ae5e5509b08a48d047e3b65714a74"
 SRC_URI[crc32fast-1.3.2.sha256sum] = "b540bd8bc810d3885c6ea91e2018302f68baba2129ab3e88f32389ee9370880d"
-SRC_URI[data-encoding-2.3.3.sha256sum] = "23d8666cb01533c39dde32bcbab8e227b4ed6679b2c925eba05feabea39508fb"
+SRC_URI[data-encoding-2.5.0.sha256sum] = "7e962a19be5cfc3f3bf6dd8f61eb50107f356ad6270fbb3ed41476571db78be5"
 SRC_URI[difflib-0.4.0.sha256sum] = "6184e33543162437515c2e2b48714794e37845ec9851711914eec9d308f6ebe8"
 SRC_URI[downcast-0.11.0.sha256sum] = "1435fa1053d8b2fbbe9be7e97eca7f33d37b28409959813daefc1446a14247f1"
 SRC_URI[duct-0.13.6.sha256sum] = "37ae3fc31835f74c2a7ceda3aeede378b0ae2e74c8f1c36559fcc9ae2a4e7d3e"
-SRC_URI[either-1.8.1.sha256sum] = "7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae31f16d91"
+SRC_URI[either-1.9.0.sha256sum] = "a26ae43d7bcc3b814de94796a5e736d4029efb0ee900c12e2d54c993ad1a1e07"
 SRC_URI[encode_unicode-0.3.6.sha256sum] = "a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
-SRC_URI[env_logger-0.7.1.sha256sum] = "44533bbbb3bb3c1fa17d9f2e4e38bbbaf8396ba82193c4cb1b6445d711445d36"
-SRC_URI[errno-0.3.1.sha256sum] = "4bcfec3a70f97c962c307b2d2c56e358cf1d00b558d74262b5f929ee8cc7e73a"
-SRC_URI[errno-dragonfly-0.1.2.sha256sum] = "aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf"
+SRC_URI[env_logger-0.8.4.sha256sum] = "a19187fea3ac7e84da7dacf48de0c45d63c6a76f9490dae389aead16c243fce3"
+SRC_URI[errno-0.3.8.sha256sum] = "a258e46cdc063eb8519c00b9fc845fc47bcfca4130e2f08e88665ceda8474245"
 SRC_URI[exitcode-1.1.2.sha256sum] = "de853764b47027c2e862a995c34978ffa63c1501f2e15f987ba11bd4f9bba193"
-SRC_URI[fastrand-1.9.0.sha256sum] = "e51093e27b0797c359783294ca4f0a911c270184cb10f85783b118614a1501be"
+SRC_URI[fastrand-2.0.1.sha256sum] = "25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5"
 SRC_URI[fixedbitset-0.4.2.sha256sum] = "0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80"
-SRC_URI[flate2-1.0.25.sha256sum] = "a8a2db397cb1c8772f31494cb8917e48cd1e64f0fa7efac59fbd741a0a8ce841"
+SRC_URI[flate2-1.0.28.sha256sum] = "46303f565772937ffe1d394a4fac6f411c6013172fadde9dcdb1e147a086940e"
 SRC_URI[float-cmp-0.9.0.sha256sum] = "98de4bbd547a563b716d8dfa9aad1cb19bfab00f4fa09a6a4ed21dbcf44ce9c4"
 SRC_URI[fragile-2.0.0.sha256sum] = "6c2141d6d6c8512188a7891b4b01590a45f6dac67afb4f255c4124dbb86d4eaa"
-SRC_URI[futures-0.3.28.sha256sum] = "23342abe12aba583913b2e62f22225ff9c950774065e4bfb61a19cd9770fec40"
-SRC_URI[futures-channel-0.3.28.sha256sum] = "955518d47e09b25bbebc7a18df10b81f0c766eaf4c4f1cccef2fca5f2a4fb5f2"
-SRC_URI[futures-core-0.3.28.sha256sum] = "4bca583b7e26f571124fe5b7561d49cb2868d79116cfa0eefce955557c6fee8c"
-SRC_URI[futures-executor-0.3.28.sha256sum] = "ccecee823288125bd88b4d7f565c9e58e41858e47ab72e8ea2d64e93624386e0"
-SRC_URI[futures-io-0.3.28.sha256sum] = "4fff74096e71ed47f8e023204cfd0aa1289cd54ae5430a9523be060cdb849964"
-SRC_URI[futures-macro-0.3.28.sha256sum] = "89ca545a94061b6365f2c7355b4b32bd20df3ff95f02da9329b34ccc3bd6ee72"
-SRC_URI[futures-sink-0.3.28.sha256sum] = "f43be4fe21a13b9781a69afa4985b0f6ee0e1afab2c6f454a8cf30e2b2237b6e"
-SRC_URI[futures-task-0.3.28.sha256sum] = "76d3d132be6c0e6aa1534069c705a74a5997a356c0dc2f86a47765e5617c5b65"
-SRC_URI[futures-util-0.3.28.sha256sum] = "26b01e40b772d54cf6c6d721c1d1abd0647a0106a12ecaa1c186273392a69533"
-SRC_URI[getrandom-0.1.16.sha256sum] = "8fc3cb4d91f53b50155bdcfd23f6a4c39ae1969c2ae85982b135750cccaf5fce"
-SRC_URI[getrandom-0.2.9.sha256sum] = "c85e1d9ab2eadba7e5040d4e09cbd6d072b76a557ad64e797c2cb9d4da21d7e4"
-SRC_URI[hashbrown-0.12.3.sha256sum] = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
+SRC_URI[getrandom-0.2.11.sha256sum] = "fe9006bed769170c11f845cf00c7c1e9092aeb3f268e007c3e760ac68008070f"
 SRC_URI[hermit-abi-0.1.19.sha256sum] = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
-SRC_URI[hermit-abi-0.2.6.sha256sum] = "ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601ef3e3f47d1ae4c7"
-SRC_URI[hermit-abi-0.3.1.sha256sum] = "fed44880c466736ef9a5c5b5facefb5ed0785676d0c02d612db14e54f0d84286"
-SRC_URI[indexmap-1.9.3.sha256sum] = "bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99"
-SRC_URI[indicatif-0.17.3.sha256sum] = "cef509aa9bc73864d6756f0d34d35504af3cf0844373afe9b8669a5b8005a729"
+SRC_URI[hermit-abi-0.3.3.sha256sum] = "d77f7ec81a6d05a3abb01ab6eb7590f6083d08449fe5a1c8b1e620283546ccb7"
+SRC_URI[indicatif-0.17.7.sha256sum] = "fb28741c9db9a713d93deb3bb9515c20788cef5815265bee4980e87bde7e0f25"
 SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
-SRC_URI[io-lifetimes-1.0.10.sha256sum] = "9c66c74d2ae7e79a5a8f7ac924adbe38ee42a859c6539ad869eb51f0b52dc220"
 SRC_URI[iovec-0.1.4.sha256sum] = "b2b3ea6ff95e175473f8ffe6a7eb7c00d054240321b84c57051175fe3c1e075e"
 SRC_URI[itertools-0.10.5.sha256sum] = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473"
-SRC_URI[jobserver-0.1.26.sha256sum] = "936cfd212a0155903bcbc060e316fb6cc7cbf2e1907329391ebadc1fe0ce77c2"
-SRC_URI[json-0.12.4.sha256sum] = "078e285eafdfb6c4b434e0d31e8cfcb5115b651496faca5749b88fafd4f23bfd"
 SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
-SRC_URI[libc-0.2.142.sha256sum] = "6a987beff54b60ffa6d51982e1aa1146bc42f19bd26be28b0586f252fccf5317"
-SRC_URI[linux-raw-sys-0.3.4.sha256sum] = "36eb31c1778188ae1e64398743890d0877fef36d11521ac60406b42016e8c2cf"
-SRC_URI[log-0.4.17.sha256sum] = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"
-SRC_URI[memchr-2.5.0.sha256sum] = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
+SRC_URI[libc-0.2.150.sha256sum] = "89d92a4743f9a61002fae18374ed11e7973f530cb3a3255fb354818118b2203c"
+SRC_URI[linux-raw-sys-0.4.12.sha256sum] = "c4cd1a83af159aa67994778be9070f0ae1bd732942279cabb14f86f986a21456"
+SRC_URI[log-0.4.20.sha256sum] = "b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f"
+SRC_URI[memchr-2.6.4.sha256sum] = "f665ee40bc4a3c5590afb1e9677db74a508659dfd71e126420da8274909a0167"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
-SRC_URI[miniz_oxide-0.6.2.sha256sum] = "b275950c28b37e794e8c55d88aeb5e139d0ce23fdbbeda68f8d7174abdf9e8fa"
+SRC_URI[miniz_oxide-0.7.1.sha256sum] = "e7810e0be55b428ada41041c41f32c9f1a42817901b4ccf45fa3d4b6561e74c7"
 SRC_URI[mockall-0.11.4.sha256sum] = "4c84490118f2ee2d74570d114f3d0493cbf02790df303d2707606c3e14e07c96"
 SRC_URI[mockall_derive-0.11.4.sha256sum] = "22ce75669015c4f47b289fd4d4f56e894e4c96003ffdf3ac51313126f94c6cbb"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[normalize-line-endings-0.3.0.sha256sum] = "61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be"
-SRC_URI[num-derive-0.3.3.sha256sum] = "876a53fff98e03a936a674b29568b0e605f06b29372c2489ff4de23f1949743d"
-SRC_URI[num-traits-0.2.15.sha256sum] = "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd"
-SRC_URI[num_cpus-1.15.0.sha256sum] = "0fac9e2da13b5eb447a6ce3d392f23a29d8694bff781bf03a16cd9ac8697593b"
+SRC_URI[num-derive-0.4.1.sha256sum] = "cfb77679af88f8b125209d354a202862602672222e7f2313fdd6dc349bad4712"
+SRC_URI[num-traits-0.2.17.sha256sum] = "39e3200413f237f41ab11ad6d161bc7239c84dcb631773ccd7de3dfe4b5c267c"
+SRC_URI[num_cpus-1.16.0.sha256sum] = "4161fcb6d602d4d2081af7c3a45852d875a03dd337a6bfdd6e06407b61342a43"
 SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
 SRC_URI[numtoa-0.1.0.sha256sum] = "b8f8bdf33df195859076e54ab11ee78a1b208382d3a26ec40d142ffc1ecc49ef"
-SRC_URI[once_cell-1.17.1.sha256sum] = "b7e5500299e16ebb147ae15a00a942af264cf3688f47923b8fc2cd5858f23ad3"
+SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[os_pipe-1.1.4.sha256sum] = "0ae859aa07428ca9a929b936690f8b12dc5f11dd8c6992a18ca93919f28bc177"
-SRC_URI[os_str_bytes-6.5.0.sha256sum] = "ceedf44fb00f2d1984b0bc98102627ce622e083e49a5bacdb3e514fa4238e267"
-SRC_URI[pin-project-lite-0.2.9.sha256sum] = "e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0afac116"
-SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
-SRC_URI[pkg-config-0.3.26.sha256sum] = "6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160"
-SRC_URI[portable-atomic-0.3.19.sha256sum] = "26f6a7b87c2e435a3241addceeeff740ff8b7e76b74c13bf9acb17fa454ea00b"
+SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
 SRC_URI[predicates-2.1.5.sha256sum] = "59230a63c37f3e18569bdb90e4a89cbf5bf8b06fea0b84e65ea10cc4df47addd"
 SRC_URI[predicates-core-1.0.6.sha256sum] = "b794032607612e7abeb4db69adb4e33590fa6cf1149e95fd7cb00e634b92f174"
 SRC_URI[predicates-tree-1.0.9.sha256sum] = "368ba315fb8c5052ab692e68a0eefec6ec57b23a36959c14496f0b0df2c0cecf"
-SRC_URI[proc-macro2-1.0.56.sha256sum] = "2b63bdb0cd06f1f4dedf69b254734f9b45af66e4a031e42a7480257d9898b435"
-SRC_URI[quick-xml-0.23.1.sha256sum] = "11bafc859c6815fbaffbbbf4229ecb767ac913fecb27f9ad4343662e9ef099ea"
-SRC_URI[quickcheck-0.9.2.sha256sum] = "a44883e74aa97ad63db83c4bf8ca490f02b2fc02f92575e720c8551e843c945f"
-SRC_URI[quickcheck_macros-0.9.1.sha256sum] = "608c156fd8e97febc07dc9c2e2c80bf74cfc6ef26893eae3daf8bc2bc94a4b7f"
-SRC_URI[quote-1.0.26.sha256sum] = "4424af4bf778aae2051a77b60283332f386554255d722233d09fbfc7e30da2fc"
-SRC_URI[rand-0.7.3.sha256sum] = "6a6b1679d49b24bbfe0c803429aa1874472f50d9b363131f0e89fc356b544d03"
+SRC_URI[proc-macro2-1.0.70.sha256sum] = "39278fbbf5fb4f646ce651690877f89d1c5811a3d4acb27700c1cb3cdb78fd3b"
+SRC_URI[quick-xml-0.29.0.sha256sum] = "81b9228215d82c7b61490fec1de287136b5de6f5700f6e58ea9ad61a7964ca51"
+SRC_URI[quickcheck-1.0.3.sha256sum] = "588f6378e4dd99458b60ec275b4477add41ce4fa9f64dcba6f15adccb19b50d6"
+SRC_URI[quickcheck_macros-1.0.0.sha256sum] = "b22a693222d716a9587786f37ac3f6b4faedb5b80c23914e7303ff5a1d8016e9"
+SRC_URI[quote-1.0.33.sha256sum] = "5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
-SRC_URI[rand_chacha-0.2.2.sha256sum] = "f4c8ed856279c9737206bf725bf36935d8666ead7aa69b52be55af369d193402"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
-SRC_URI[rand_core-0.5.1.sha256sum] = "90bde5296fc891b0cef12a6d03ddccc162ce7b2aff54160af9338f8d40df6d19"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
-SRC_URI[rand_hc-0.2.0.sha256sum] = "ca3129af7b92a17112d59ad498c6f81eaf463253766b90396d39ea7a39d6613c"
-SRC_URI[rangemap-1.3.0.sha256sum] = "8b9283c6b06096b47afc7109834fdedab891175bb5241ee5d4f7d2546549f263"
+SRC_URI[rangemap-1.4.0.sha256sum] = "977b1e897f9d764566891689e642653e5ed90c6895106acd005eb4c1d0203991"
 SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
-SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
-SRC_URI[redox_termios-0.1.2.sha256sum] = "8440d8acb4fd3d277125b4bd01a6f38aee8d814b3b5fc09b3f2b825d37d3fe8f"
-SRC_URI[regex-1.8.1.sha256sum] = "af83e617f331cc6ae2da5443c602dfa5af81e517212d9d611a5b3ba1777b5370"
-SRC_URI[regex-syntax-0.7.1.sha256sum] = "a5996294f19bd3aae0453a862ad728f60e6600695733dd5df01da90c54363a3c"
+SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
+SRC_URI[redox_termios-0.1.3.sha256sum] = "20145670ba436b55d91fc92d25e71160fbfbdd57831631c8d7d36377a476f1cb"
+SRC_URI[regex-1.10.2.sha256sum] = "380b951a9c5e80ddfd6136919eef32310721aa4aacd4889a8d39124b026ab343"
+SRC_URI[regex-automata-0.4.3.sha256sum] = "5f804c7828047e88b2d32e2d7fe5a105da8ee3264f01902f796c8e067dc2483f"
+SRC_URI[regex-syntax-0.8.2.sha256sum] = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"
 SRC_URI[retain_mut-0.1.7.sha256sum] = "8c31b5c4033f8fdde8700e4657be2c497e7288f01515be52168c631e2e4d4086"
-SRC_URI[roaring-0.10.1.sha256sum] = "ef0fb5e826a8bde011ecae6a8539dd333884335c57ff0f003fbe27c25bbe8f71"
+SRC_URI[roaring-0.10.2.sha256sum] = "6106b5cf8587f5834158895e9715a3c6c9716c8aefab57f1f7680917191c7873"
 SRC_URI[rustc_version-0.4.0.sha256sum] = "bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366"
-SRC_URI[rustix-0.37.14.sha256sum] = "d9b864d3c18a5785a05953adeed93e2dca37ed30f18e69bba9f30079d51f363f"
+SRC_URI[rustix-0.38.27.sha256sum] = "bfeae074e687625746172d639330f1de242a178bf3189b51e35a7a21573513ac"
 SRC_URI[safemem-0.3.3.sha256sum] = "ef703b7cb59335eae2eb93ceb664c0eb7ea6bf567079d843e09420219668e072"
-SRC_URI[semver-1.0.17.sha256sum] = "bebd363326d05ec3e2f532ab7660680f3b02130d780c299bca73469d521bc0ed"
+SRC_URI[semver-1.0.20.sha256sum] = "836fa6a3e1e547f9a2c4040802ec865b5d85f4014efe00555d7090a3dcaa1090"
 SRC_URI[shared_child-1.0.0.sha256sum] = "b0d94659ad3c2137fef23ae75b03d5241d633f8acded53d672decfa0e6e0caef"
-SRC_URI[slab-0.4.8.sha256sum] = "6528351c9bc8ab22353f9d776db39a20288e8d6c37ef8cfe3317cf875eecfc2d"
 SRC_URI[strsim-0.10.0.sha256sum] = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.15.sha256sum] = "a34fcf3e8b60f57e6a14301a2e916d323af98b0ea63c599441eec8558660c822"
-SRC_URI[tempfile-3.5.0.sha256sum] = "b9fbec84f381d5795b08656e4912bec604d162bff9291d6189a78f4c8ab87998"
-SRC_URI[termcolor-1.2.0.sha256sum] = "be55cf8942feac5c765c2c993422806843c9a9a45d4d5c407ad6dd2ea95eb9b6"
+SRC_URI[syn-2.0.39.sha256sum] = "23e78b90f2fcf45d3e842032ce32e3f2d1545ba6636271dcbf24fa306d87be7a"
+SRC_URI[tempfile-3.8.1.sha256sum] = "7ef1adac450ad7f4b3c28589471ade84f25f731a7a0fe30d71dfa9f60fd808e5"
 SRC_URI[termion-1.5.6.sha256sum] = "077185e2eac69c3f8379a4298e1e07cd36beb962290d4a51199acf0fdc10607e"
 SRC_URI[termtree-0.4.1.sha256sum] = "3369f5ac52d5eb6ab48c6b4ffdc8efbcad6b89c765749064ba298f2c68a16a76"
-SRC_URI[textwrap-0.16.0.sha256sum] = "222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e499451fd7d0129c9c7c3d"
-SRC_URI[thiserror-1.0.40.sha256sum] = "978c9a314bd8dc99be594bc3c175faaa9794be04a5a5e153caba6915336cebac"
-SRC_URI[thiserror-impl-1.0.40.sha256sum] = "f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a3550d286d5e86720569f"
+SRC_URI[thiserror-1.0.50.sha256sum] = "f9a7210f5c9a7156bb50aa36aed4c95afb51df0df00713949448cf9e97d382d2"
+SRC_URI[thiserror-impl-1.0.50.sha256sum] = "266b2e40bc00e5a6c09c3584011e08b06f123c00362c92b975ba9843aaaa14b8"
 SRC_URI[threadpool-1.8.1.sha256sum] = "d050e60b33d41c19108b32cea32164033a9013fe3b46cbd4457559bfbf77afaa"
-SRC_URI[tui-0.16.0.sha256sum] = "39c8ce4e27049eed97cfa363a5048b09d995e209994634a0efc26a14ab6c0c23"
-SRC_URI[unicode-ident-1.0.8.sha256sum] = "e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb12f6d57d2269bf4"
+SRC_URI[tui-0.19.0.sha256sum] = "ccdd26cbd674007e649a272da4475fb666d3aa0ad0531da7136db6fab0e5bad1"
+SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
 SRC_URI[unicode-segmentation-1.10.1.sha256sum] = "1dd624098567895118886609431a7c3b8f516e41d30e0643f03d94592a147e36"
-SRC_URI[unicode-width-0.1.10.sha256sum] = "c0edd1e5b14653f783770bce4a4dabb4a5108a5370a5f5d8cfe8710c361f6c8b"
-SRC_URI[wasi-0.9.0+wasi-snapshot-preview1.sha256sum] = "cccddf32554fecc6acb585f82a32a72e28b48f8c4c1883ddfeeeaa96f7d8e519"
+SRC_URI[unicode-width-0.1.11.sha256sum] = "e51733f11c9c4f72aa0c160008246859e340b00807569a0da0e7a1079b27ba85"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.5.sha256sum] = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[windows-sys-0.42.0.sha256sum] = "5a3e1820f08b8513f676f7ab6c1f99ff312fb97b553d30ff4dd86f9f15728aa7"
 SRC_URI[windows-sys-0.45.0.sha256sum] = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
 SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
 SRC_URI[windows-targets-0.42.2.sha256sum] = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
-SRC_URI[windows-targets-0.48.0.sha256sum] = "7b1eb6f0cd7c80c79759c929114ef071b87354ce476d9d94271031c0497adfd5"
+SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
+SRC_URI[windows-targets-0.52.0.sha256sum] = "8a18201040b24831fbb9e4eb208f8892e1f50a37feb53cc7ff887feb8f50e7cd"
 SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
-SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+SRC_URI[windows_aarch64_gnullvm-0.52.0.sha256sum] = "cb7764e35d4db8a7921e09562a0304bf2f93e0a51bfccee0bd0bb0b666b015ea"
 SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
-SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
+SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+SRC_URI[windows_aarch64_msvc-0.52.0.sha256sum] = "bbaa0368d4f1d2aaefc55b6fcfee13f41544ddf36801e793edbbfd7d7df075ef"
 SRC_URI[windows_i686_gnu-0.42.2.sha256sum] = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"
-SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
+SRC_URI[windows_i686_gnu-0.52.0.sha256sum] = "a28637cb1fa3560a16915793afb20081aba2c92ee8af57b4d5f28e4b3e7df313"
 SRC_URI[windows_i686_msvc-0.42.2.sha256sum] = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"
-SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
+SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
+SRC_URI[windows_i686_msvc-0.52.0.sha256sum] = "ffe5e8e31046ce6230cc7215707b816e339ff4d4d67c65dffa206fd0f7aa7b9a"
 SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
-SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
+SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+SRC_URI[windows_x86_64_gnu-0.52.0.sha256sum] = "3d6fa32db2bc4a2f5abeacf2b69f7992cd09dca97498da74a151a3132c26befd"
 SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
-SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+SRC_URI[windows_x86_64_gnullvm-0.52.0.sha256sum] = "1a657e1e9d3f514745a572a6846d3c7aa7dbe1658c056ed9c3344c4109a6949e"
 SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
-SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
-SRC_URI[zstd-0.11.2+zstd.1.5.2.sha256sum] = "20cc960326ece64f010d2d2107537f26dc589a6573a316bd5b1dba685fa5fde4"
-SRC_URI[zstd-safe-5.0.2+zstd.1.5.2.sha256sum] = "1d2a5585e04f9eea4b2a3d1eca508c4dee9592a89ef6f450c11719da0726f4db"
-SRC_URI[zstd-sys-2.0.8+zstd.1.5.5.sha256sum] = "5556e6ee25d32df2586c098bbfa278803692a20d0ab9565e049480d52707ec8c"
+SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
+SRC_URI[windows_x86_64_msvc-0.52.0.sha256sum] = "dff9641d1cd4be8d1a070daf9e3773c5f67e78b4d9d42263020c057706765c04"
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc
index 46e826cabc4f..ceea67c364f1 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc
@@ -1,10 +1,6 @@
 SRC_URI += "\
-    git://github.com/zowens/crc32c;protocol=https;nobranch=1;name=crc32c;destsuffix=crc32c;type=git-dependency \
     git://github.com/jthornber/rio;protocol=https;nobranch=1;name=rio;destsuffix=rio;type=git-dependency \
 "
 
-SRCREV_FORMAT .= "_crc32c"
-SRCREV_crc32c = "3779fe88fea034922f808586b2564fbcab31efdc"
-
 SRCREV_FORMAT .= "_rio"
 SRCREV_rio = "2979a720f671e836302c01546f9cc9f7988610c8"
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.4.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.9.bb
similarity index 95%
rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.4.bb
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.9.bb
index e79f62ff6eec..b643ad6dc8d3 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.4.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.9.bb
@@ -12,7 +12,7 @@ SRC_URI = " \
     "
 SRC_URI:append:libc-musl = " file://0001-Replace-LFS-functions.patch"
 
-SRCREV = "3baa3fa3a3e4f714e6170a4152b186f0fa1d76e1"
+SRCREV = "1d60839b0a920df6476712b80f933854fb32e160"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cargo cargo-update-recipe-crates
-- 
2.39.0


