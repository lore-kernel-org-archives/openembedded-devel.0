Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14EE109E546
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 04:34:08 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41124.1774499645480113366
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 21:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IipzDwOC;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b4520f6b32so666748eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 21:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774499645; x=1775104445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KWh9potINpXWFMTt/vO8oX/ql7hKpqgrCJJmVIim+/g=;
        b=IipzDwOC5AE4kHDoc73PVRyCzankLLvYJtKw1JhFW82YKFa7dSPM/54/SUQTe4K+MZ
         ++ehUV6qTM2f1JxLtAvNKT6kOwlZlBudiaw2nw8+pPp0wDZp/qrA58oV9DyX7e2qsXD4
         LbFGlVl9fWumznJM8eRJfyQFEpmILyG/UqpHnZN335qJhnCtYjGWMZcCvzjbYHHhU+8f
         inEyhyhrze/FPdyG6wq9cW0H3D4hxnKPfUu5vWkLaBQbWwPlx1FsKLb1I+cEMYSfH5o5
         xV/9HdVETgdkjtpOtWn9tpuPayy7OoF4OOhR4RuQZaxjjAwZskN4EfhzLkXWqdrND4dW
         gSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499645; x=1775104445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWh9potINpXWFMTt/vO8oX/ql7hKpqgrCJJmVIim+/g=;
        b=YXOBI8ielSEn//klAUv/q63fb9gJaLNhAqUmaZbeOwEhY+1Kl0qvObBIkHrnSJWzSW
         203kQVvE5dIxKHz0wIX9KG3SbcVO+d3MbDzMFUe4tSbq12jRSo0T2jCkAXwgxB4+xTLX
         VOoIMD22TdmNDQLGbP8DNye9S+yBBxLO8af56xkvDoACRSf5Ris4jVh6sQGd7PGLb6Qg
         Q9p1kVOSQIT7SKpVsWRGLSBjmVbYvY5SSsSC25JSHmL8qyf1ueseUYNEvYrr1Tj/BObV
         M+5Y12CT9qLkoTyUXsgyoBmi+kRE+9gSc5untGOsP8pSGi8HH+X5H4HV6zKeb/UGCdje
         xbXQ==
X-Gm-Message-State: AOJu0YxVHL51Iif7L0LJ1miIrw5e3sN7FoSHR4tnZgDgEni0Eaab+zCh
	W3H5TmSRdkONv0/hE4qndXT69C0A1PYeD87wNZWvzO6mt875Fk5sQXXxNsfP9A==
X-Gm-Gg: ATEYQzxiwgPmEy8+FzfRU8OdNiNEcqcYHcmoR44Rp1ifz0LI8YSeCCDRaMfLiO8JSuL
	7SaRr0cc6JzIDHHoG3ht4YvNxGLG15cKHoYfoQTRAFiWgusR0nXIV16RWUxrBQK/CDzYKipv0uT
	TS0nxpK2iGZuGMo/OVQKj/VjaF7VnNLrpx1qTWV6zakJMya3vhZ57SxOU1+1wQ7Ls1POy3IdAvO
	YPduuaU9zScW7lyD70/alACY8e1AKqOpMSldDFuZHl9e2vJ3QUczmqj/41GDO2vxnUx8KvvJVj3
	gAjKbtmQGk6woqoa50TE9/Js+crFOCRxaHIY+Ww9MTOXtPAl1cCJvbgEUx93XLFTzNBaL4qJ3pt
	n9y/Us/GOsm5Wln1sonV1XkkeDtLDleGAkx3iO2WHckN+e0m+6DdJYprkpa+uROph6IYvhe1H2s
	RY6i3mtNrJqNtKEaWjBndBRboPryGfgK0UrInXFm2NotP0ldhz+GgI7+FMd3fGe1lq9ieDB4kVz
	GPWjx2D6rt4RfS5zZgDg7XhPeYylgm8GmpZVMEbo0rBa3fVi+ph98ZsbDhkMkTV3kAA8DQ=
X-Received: by 2002:a05:7301:9f07:b0:2c1:27c:75ca with SMTP id 5a478bee46e88-2c15d32b08fmr3304603eec.12.1774499644002;
        Wed, 25 Mar 2026 21:34:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec47293sm1612959eec.9.2026.03.25.21.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:34:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH] spdm-utils: Upgrade to tip of trunk
Date: Wed, 25 Mar 2026 21:34:00 -0700
Message-ID: <20260326043400.2088136-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125634

Needed to fix build with rust 1.94+

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
 .../spdm-utils/spdm-utils-crates.inc          | 608 +++++++-----------
 .../spdm-utils/spdm-utils_0.7.2.bb            |   4 +-
 2 files changed, 225 insertions(+), 387 deletions(-)

diff --git a/meta-oe/recipes-devtools/spdm-utils/spdm-utils-crates.inc b/meta-oe/recipes-devtools/spdm-utils/spdm-utils-crates.inc
index 7a2aae9be7..0c3582d53d 100644
--- a/meta-oe/recipes-devtools/spdm-utils/spdm-utils-crates.inc
+++ b/meta-oe/recipes-devtools/spdm-utils/spdm-utils-crates.inc
@@ -2,557 +2,393 @@

 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/aho-corasick/1.1.3 \
-    crate://crates.io/anstream/0.6.18 \
-    crate://crates.io/anstyle/1.0.10 \
-    crate://crates.io/anstyle-parse/0.2.6 \
-    crate://crates.io/anstyle-query/1.1.2 \
-    crate://crates.io/anstyle-wincon/3.0.7 \
+    crate://crates.io/aho-corasick/1.1.4 \
+    crate://crates.io/anstream/0.6.21 \
+    crate://crates.io/anstyle/1.0.13 \
+    crate://crates.io/anstyle-parse/0.2.7 \
+    crate://crates.io/anstyle-query/1.1.5 \
+    crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/asn1-rs/0.5.2 \
     crate://crates.io/asn1-rs/0.6.2 \
     crate://crates.io/asn1-rs-derive/0.4.0 \
     crate://crates.io/asn1-rs-derive/0.5.1 \
     crate://crates.io/asn1-rs-impl/0.1.0 \
     crate://crates.io/asn1-rs-impl/0.2.0 \
-    crate://crates.io/async-attributes/1.1.2 \
-    crate://crates.io/async-channel/1.9.0 \
-    crate://crates.io/async-channel/2.3.1 \
-    crate://crates.io/async-executor/1.13.1 \
-    crate://crates.io/async-global-executor/2.4.1 \
-    crate://crates.io/async-io/2.4.0 \
-    crate://crates.io/async-lock/3.4.0 \
-    crate://crates.io/async-std/1.13.0 \
-    crate://crates.io/async-task/4.7.1 \
-    crate://crates.io/atomic-waker/1.1.2 \
-    crate://crates.io/autocfg/1.4.0 \
-    crate://crates.io/bindgen/0.71.1 \
+    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/bindgen/0.72.1 \
     crate://crates.io/bitfield/0.14.0 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.8.0 \
+    crate://crates.io/bitflags/2.10.0 \
     crate://crates.io/block-buffer/0.10.4 \
-    crate://crates.io/blocking/1.6.1 \
-    crate://crates.io/bumpalo/3.16.0 \
+    crate://crates.io/byteorder/1.5.0 \
+    crate://crates.io/bytes/1.11.1 \
     crate://crates.io/cexpr/0.6.0 \
-    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/cfg_aliases/0.2.1 \
     crate://crates.io/clang-sys/1.8.1 \
-    crate://crates.io/clap/4.5.27 \
-    crate://crates.io/clap_builder/4.5.27 \
-    crate://crates.io/clap_derive/4.5.24 \
-    crate://crates.io/clap_lex/0.7.4 \
-    crate://crates.io/colorchoice/1.0.3 \
+    crate://crates.io/clap/4.5.57 \
+    crate://crates.io/clap_builder/4.5.57 \
+    crate://crates.io/clap_derive/4.5.55 \
+    crate://crates.io/clap_lex/0.7.7 \
+    crate://crates.io/colorchoice/1.0.4 \
     crate://crates.io/colored/2.2.0 \
-    crate://crates.io/concurrent-queue/2.5.0 \
     crate://crates.io/core-foundation/0.10.0 \
     crate://crates.io/core-foundation-sys/0.8.7 \
     crate://crates.io/cpufeatures/0.2.17 \
-    crate://crates.io/crossbeam-utils/0.8.21 \
-    crate://crates.io/crunchy/0.2.3 \
-    crate://crates.io/crypto-common/0.1.6 \
-    crate://crates.io/data-encoding/2.7.0 \
+    crate://crates.io/crossterm/0.25.0 \
+    crate://crates.io/crossterm_winapi/0.9.1 \
+    crate://crates.io/crunchy/0.2.4 \
+    crate://crates.io/crypto-common/0.1.7 \
+    crate://crates.io/data-encoding/2.10.0 \
     crate://crates.io/der-parser/8.2.0 \
-    crate://crates.io/deranged/0.3.11 \
+    crate://crates.io/deranged/0.5.5 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/displaydoc/0.2.5 \
-    crate://crates.io/either/1.13.0 \
+    crate://crates.io/dyn-clone/1.0.20 \
+    crate://crates.io/either/1.15.0 \
     crate://crates.io/embedded-crc-macros/1.0.0 \
     crate://crates.io/env_logger/0.10.2 \
-    crate://crates.io/errno/0.3.10 \
-    crate://crates.io/event-listener/2.5.3 \
-    crate://crates.io/event-listener/5.4.0 \
-    crate://crates.io/event-listener-strategy/0.5.3 \
-    crate://crates.io/fastrand/2.3.0 \
+    crate://crates.io/errno/0.3.14 \
     crate://crates.io/futures/0.3.31 \
     crate://crates.io/futures-channel/0.3.31 \
     crate://crates.io/futures-core/0.3.31 \
     crate://crates.io/futures-executor/0.3.31 \
     crate://crates.io/futures-io/0.3.31 \
-    crate://crates.io/futures-lite/2.6.0 \
     crate://crates.io/futures-macro/0.3.31 \
     crate://crates.io/futures-sink/0.3.31 \
     crate://crates.io/futures-task/0.3.31 \
     crate://crates.io/futures-util/0.3.31 \
+    crate://crates.io/fuzzy-matcher/0.3.7 \
+    crate://crates.io/fxhash/0.2.1 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/glob/0.3.2 \
-    crate://crates.io/gloo-timers/0.3.0 \
-    crate://crates.io/half/2.4.1 \
+    crate://crates.io/glob/0.3.3 \
+    crate://crates.io/half/2.7.1 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/hermit-abi/0.4.0 \
-    crate://crates.io/home/0.5.11 \
-    crate://crates.io/humantime/2.1.0 \
+    crate://crates.io/hermit-abi/0.5.2 \
+    crate://crates.io/home/0.5.12 \
+    crate://crates.io/humantime/2.3.0 \
+    crate://crates.io/inquire/0.7.5 \
     crate://crates.io/io-kit-sys/0.4.1 \
-    crate://crates.io/is-terminal/0.4.15 \
-    crate://crates.io/is_terminal_polyfill/1.70.1 \
+    crate://crates.io/is-terminal/0.4.17 \
+    crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.13.0 \
-    crate://crates.io/itoa/1.0.14 \
-    crate://crates.io/js-sys/0.3.77 \
-    crate://crates.io/kv-log-macro/1.0.7 \
+    crate://crates.io/itoa/1.0.17 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/libc/0.2.169 \
-    crate://crates.io/libloading/0.8.6 \
+    crate://crates.io/libc/0.2.180 \
+    crate://crates.io/libloading/0.8.9 \
     crate://crates.io/libmctp/0.2.0 \
     crate://crates.io/libudev/0.3.0 \
     crate://crates.io/libudev-sys/0.1.4 \
     crate://crates.io/linux-raw-sys/0.4.15 \
-    crate://crates.io/log/0.4.25 \
-    crate://crates.io/mach2/0.4.2 \
-    crate://crates.io/memchr/2.7.4 \
+    crate://crates.io/lock_api/0.4.14 \
+    crate://crates.io/log/0.4.29 \
+    crate://crates.io/mach2/0.4.3 \
+    crate://crates.io/memchr/2.7.6 \
     crate://crates.io/memmap2/0.5.10 \
     crate://crates.io/minicbor/0.25.1 \
     crate://crates.io/minicbor-derive/0.15.3 \
     crate://crates.io/minimal-lexical/0.2.1 \
+    crate://crates.io/mio/0.8.11 \
+    crate://crates.io/mio/1.1.1 \
+    crate://crates.io/newline-converter/0.3.0 \
     crate://crates.io/nix/0.26.4 \
     crate://crates.io/nix/0.29.0 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/num-bigint/0.4.6 \
-    crate://crates.io/num-conv/0.1.0 \
+    crate://crates.io/num-conv/0.2.0 \
     crate://crates.io/num-integer/0.1.46 \
     crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/oid-registry/0.6.1 \
-    crate://crates.io/once_cell/1.20.2 \
-    crate://crates.io/parking/2.2.1 \
+    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/once_cell_polyfill/1.70.2 \
+    crate://crates.io/parking_lot/0.12.5 \
+    crate://crates.io/parking_lot_core/0.9.12 \
     crate://crates.io/pin-project-lite/0.2.16 \
     crate://crates.io/pin-utils/0.1.0 \
-    crate://crates.io/piper/0.2.4 \
-    crate://crates.io/pkg-config/0.3.31 \
-    crate://crates.io/polling/3.7.4 \
+    crate://crates.io/pkg-config/0.3.32 \
     crate://crates.io/powerfmt/0.2.0 \
-    crate://crates.io/prettyplease/0.2.29 \
-    crate://crates.io/proc-macro2/1.0.93 \
-    crate://crates.io/quote/1.0.38 \
-    crate://crates.io/regex/1.11.1 \
-    crate://crates.io/regex-automata/0.4.9 \
-    crate://crates.io/regex-syntax/0.8.5 \
-    crate://crates.io/rustc-hash/2.1.0 \
+    crate://crates.io/prettyplease/0.2.37 \
+    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/quote/1.0.40 \
+    crate://crates.io/redox_syscall/0.5.18 \
+    crate://crates.io/regex/1.12.3 \
+    crate://crates.io/regex-automata/0.4.14 \
+    crate://crates.io/regex-syntax/0.8.9 \
+    crate://crates.io/rustc-hash/2.1.1 \
     crate://crates.io/rusticata-macros/4.1.0 \
     crate://crates.io/rustix/0.38.44 \
-    crate://crates.io/rustversion/1.0.19 \
     crate://crates.io/scopeguard/1.2.0 \
-    crate://crates.io/serde/1.0.217 \
-    crate://crates.io/serde_derive/1.0.217 \
-    crate://crates.io/serialport/4.7.0 \
-    crate://crates.io/sha2/0.10.8 \
+    crate://crates.io/serde_core/1.0.228 \
+    crate://crates.io/serde_derive/1.0.228 \
+    crate://crates.io/serialport/4.8.1 \
+    crate://crates.io/sha2/0.10.9 \
     crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/slab/0.4.9 \
+    crate://crates.io/signal-hook/0.3.18 \
+    crate://crates.io/signal-hook-mio/0.2.5 \
+    crate://crates.io/signal-hook-registry/1.4.8 \
+    crate://crates.io/slab/0.4.12 \
+    crate://crates.io/smallvec/1.15.1 \
     crate://crates.io/smbus-pec/1.0.1 \
+    crate://crates.io/socket2/0.6.2 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.96 \
+    crate://crates.io/syn/2.0.114 \
     crate://crates.io/synstructure/0.12.6 \
-    crate://crates.io/synstructure/0.13.1 \
+    crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/termcolor/1.4.1 \
     crate://crates.io/thiserror/1.0.69 \
+    crate://crates.io/thiserror/2.0.18 \
     crate://crates.io/thiserror-impl/1.0.69 \
-    crate://crates.io/time/0.3.37 \
-    crate://crates.io/time-core/0.1.2 \
-    crate://crates.io/time-macros/0.2.19 \
-    crate://crates.io/tracing/0.1.41 \
-    crate://crates.io/tracing-core/0.1.33 \
-    crate://crates.io/typenum/1.17.0 \
-    crate://crates.io/unescaper/0.1.5 \
-    crate://crates.io/unicode-ident/1.0.15 \
+    crate://crates.io/thiserror-impl/2.0.18 \
+    crate://crates.io/thread_local/1.1.9 \
+    crate://crates.io/time/0.3.47 \
+    crate://crates.io/time-core/0.1.8 \
+    crate://crates.io/time-macros/0.2.27 \
+    crate://crates.io/tokio/1.49.0 \
+    crate://crates.io/tokio-macros/2.6.0 \
+    crate://crates.io/typenum/1.19.0 \
+    crate://crates.io/unescaper/0.1.8 \
+    crate://crates.io/unicode-ident/1.0.22 \
+    crate://crates.io/unicode-segmentation/1.12.0 \
+    crate://crates.io/unicode-width/0.1.14 \
     crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/value-bag/1.10.0 \
     crate://crates.io/version_check/0.9.5 \
-    crate://crates.io/wasm-bindgen/0.2.100 \
-    crate://crates.io/wasm-bindgen-backend/0.2.100 \
-    crate://crates.io/wasm-bindgen-futures/0.4.50 \
-    crate://crates.io/wasm-bindgen-macro/0.2.100 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.100 \
-    crate://crates.io/wasm-bindgen-shared/0.2.100 \
-    crate://crates.io/web-sys/0.3.77 \
+    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
     crate://crates.io/which/6.0.3 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.9 \
+    crate://crates.io/winapi-util/0.1.11 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-link/0.2.1 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-sys/0.52.0 \
     crate://crates.io/windows-sys/0.59.0 \
+    crate://crates.io/windows-sys/0.60.2 \
+    crate://crates.io/windows-sys/0.61.2 \
+    crate://crates.io/windows-targets/0.48.5 \
     crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows-targets/0.53.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
     crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
+    crate://crates.io/windows_aarch64_msvc/0.48.5 \
     crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.53.1 \
+    crate://crates.io/windows_i686_gnu/0.48.5 \
     crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.53.1 \
     crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.53.1 \
+    crate://crates.io/windows_i686_msvc/0.48.5 \
     crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.53.1 \
+    crate://crates.io/windows_x86_64_gnu/0.48.5 \
     crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.53.1 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
     crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
+    crate://crates.io/windows_x86_64_msvc/0.48.5 \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.53.1 \
     crate://crates.io/winsafe/0.0.19 \
     crate://crates.io/x509-parser/0.15.1 \
+    crate://crates.io/zerocopy/0.8.38 \
+    crate://crates.io/zerocopy-derive/0.8.38 \
 "

-SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
-SRC_URI[anstream-0.6.18.sha256sum] = "8acc5369981196006228e28809f761875c0327210a891e941f4c683b3a99529b"
-SRC_URI[anstyle-1.0.10.sha256sum] = "55cc3b69f167a1ef2e161439aa98aed94e6028e5f9a59be9a6ffb47aef1651f9"
-SRC_URI[anstyle-parse-0.2.6.sha256sum] = "3b2d16507662817a6a20a9ea92df6652ee4f94f914589377d69f3b21bc5798a9"
-SRC_URI[anstyle-query-1.1.2.sha256sum] = "79947af37f4177cfead1110013d678905c37501914fba0efea834c3fe9a8d60c"
-SRC_URI[anstyle-wincon-3.0.7.sha256sum] = "ca3534e77181a9cc07539ad51f2141fe32f6c3ffd4df76db8ad92346b003ae4e"
+SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
+SRC_URI[anstream-0.6.21.sha256sum] = "43d5b281e737544384e969a5ccad3f1cdd24b48086a0fc1b2a5262a26b8f4f4a"
+SRC_URI[anstyle-1.0.13.sha256sum] = "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78"
+SRC_URI[anstyle-parse-0.2.7.sha256sum] = "4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2"
+SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
+SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[asn1-rs-0.5.2.sha256sum] = "7f6fd5ddaf0351dff5b8da21b2fb4ff8e08ddd02857f0bf69c47639106c0fff0"
 SRC_URI[asn1-rs-0.6.2.sha256sum] = "5493c3bedbacf7fd7382c6346bbd66687d12bbaad3a89a2d2c303ee6cf20b048"
 SRC_URI[asn1-rs-derive-0.4.0.sha256sum] = "726535892e8eae7e70657b4c8ea93d26b8553afb1ce617caee529ef96d7dee6c"
 SRC_URI[asn1-rs-derive-0.5.1.sha256sum] = "965c2d33e53cb6b267e148a4cb0760bc01f4904c1cd4bb4002a085bb016d1490"
 SRC_URI[asn1-rs-impl-0.1.0.sha256sum] = "2777730b2039ac0f95f093556e61b6d26cebed5393ca6f152717777cec3a42ed"
 SRC_URI[asn1-rs-impl-0.2.0.sha256sum] = "7b18050c2cd6fe86c3a76584ef5e0baf286d038cda203eb6223df2cc413565f7"
-SRC_URI[async-attributes-1.1.2.sha256sum] = "a3203e79f4dd9bdda415ed03cf14dae5a2bf775c683a00f94e9cd1faf0f596e5"
-SRC_URI[async-channel-1.9.0.sha256sum] = "81953c529336010edd6d8e358f886d9581267795c61b19475b71314bffa46d35"
-SRC_URI[async-channel-2.3.1.sha256sum] = "89b47800b0be77592da0afd425cc03468052844aff33b84e33cc696f64e77b6a"
-SRC_URI[async-executor-1.13.1.sha256sum] = "30ca9a001c1e8ba5149f91a74362376cc6bc5b919d92d988668657bd570bdcec"
-SRC_URI[async-global-executor-2.4.1.sha256sum] = "05b1b633a2115cd122d73b955eadd9916c18c8f510ec9cd1686404c60ad1c29c"
-SRC_URI[async-io-2.4.0.sha256sum] = "43a2b323ccce0a1d90b449fd71f2a06ca7faa7c54c2751f06c9bd851fc061059"
-SRC_URI[async-lock-3.4.0.sha256sum] = "ff6e472cdea888a4bd64f342f09b3f50e1886d32afe8df3d663c01140b811b18"
-SRC_URI[async-std-1.13.0.sha256sum] = "c634475f29802fde2b8f0b505b1bd00dfe4df7d4a000f0b36f7671197d5c3615"
-SRC_URI[async-task-4.7.1.sha256sum] = "8b75356056920673b02621b35afd0f7dda9306d03c79a30f5c56c44cf256e3de"
-SRC_URI[atomic-waker-1.1.2.sha256sum] = "1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0"
-SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
-SRC_URI[bindgen-0.71.1.sha256sum] = "5f58bf3d7db68cfbac37cfc485a8d711e87e064c3d0fe0435b92f7a407f9d6b3"
+SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
+SRC_URI[bindgen-0.72.1.sha256sum] = "993776b509cfb49c750f11b8f07a46fa23e0a1386ffc01fb1e7d343efc387895"
 SRC_URI[bitfield-0.14.0.sha256sum] = "2d7e60934ceec538daadb9d8432424ed043a904d8e0243f3c6446bce549a46ac"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.8.0.sha256sum] = "8f68f53c83ab957f72c32642f3868eec03eb974d1fb82e453128456482613d36"
+SRC_URI[bitflags-2.10.0.sha256sum] = "812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
-SRC_URI[blocking-1.6.1.sha256sum] = "703f41c54fc768e63e091340b424302bb1c29ef4aa0c7f10fe849dfb114d29ea"
-SRC_URI[bumpalo-3.16.0.sha256sum] = "79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28adb49162e012c"
+SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
+SRC_URI[bytes-1.11.1.sha256sum] = "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
 SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
 SRC_URI[clang-sys-1.8.1.sha256sum] = "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
-SRC_URI[clap-4.5.27.sha256sum] = "769b0145982b4b48713e01ec42d61614425f27b7058bda7180a3a41f30104796"
-SRC_URI[clap_builder-4.5.27.sha256sum] = "1b26884eb4b57140e4d2d93652abfa49498b938b3c9179f9fc487b0acc3edad7"
-SRC_URI[clap_derive-4.5.24.sha256sum] = "54b755194d6389280185988721fffba69495eed5ee9feeee9a599b53db80318c"
-SRC_URI[clap_lex-0.7.4.sha256sum] = "f46ad14479a25103f283c0f10005961cf086d8dc42205bb44c46ac563475dca6"
-SRC_URI[colorchoice-1.0.3.sha256sum] = "5b63caa9aa9397e2d9480a9b13673856c78d8ac123288526c37d7839f2a86990"
+SRC_URI[clap-4.5.57.sha256sum] = "6899ea499e3fb9305a65d5ebf6e3d2248c5fab291f300ad0a704fbe142eae31a"
+SRC_URI[clap_builder-4.5.57.sha256sum] = "7b12c8b680195a62a8364d16b8447b01b6c2c8f9aaf68bee653be34d4245e238"
+SRC_URI[clap_derive-4.5.55.sha256sum] = "a92793da1a46a5f2a02a6f4c46c6496b28c43638adea8306fcb0caa1634f24e5"
+SRC_URI[clap_lex-0.7.7.sha256sum] = "c3e64b0cc0439b12df2fa678eae89a1c56a529fd067a9115f7827f1fffd22b32"
+SRC_URI[colorchoice-1.0.4.sha256sum] = "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
 SRC_URI[colored-2.2.0.sha256sum] = "117725a109d387c937a1533ce01b450cbde6b88abceea8473c4d7a85853cda3c"
-SRC_URI[concurrent-queue-2.5.0.sha256sum] = "4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973"
 SRC_URI[core-foundation-0.10.0.sha256sum] = "b55271e5c8c478ad3f38ad24ef34923091e0548492a266d19b3c0b4d82574c63"
 SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
-SRC_URI[crossbeam-utils-0.8.21.sha256sum] = "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
-SRC_URI[crunchy-0.2.3.sha256sum] = "43da5946c66ffcc7745f48db692ffbb10a83bfe0afd96235c5c2a4fb23994929"
-SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
-SRC_URI[data-encoding-2.7.0.sha256sum] = "0e60eed09d8c01d3cee5b7d30acb059b76614c918fa0f992e0dd6eeb10daad6f"
+SRC_URI[crossterm-0.25.0.sha256sum] = "e64e6c0fbe2c17357405f7c758c1ef960fce08bdfb2c03d88d2a18d7e09c4b67"
+SRC_URI[crossterm_winapi-0.9.1.sha256sum] = "acdd7c62a3665c7f6830a51635d9ac9b23ed385797f70a83bb8bafe9c572ab2b"
+SRC_URI[crunchy-0.2.4.sha256sum] = "460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5"
+SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
+SRC_URI[data-encoding-2.10.0.sha256sum] = "d7a1e2f27636f116493b8b860f5546edb47c8d8f8ea73e1d2a20be88e28d1fea"
 SRC_URI[der-parser-8.2.0.sha256sum] = "dbd676fbbab537128ef0278adb5576cf363cff6aa22a7b24effe97347cfab61e"
-SRC_URI[deranged-0.3.11.sha256sum] = "b42b6fa04a440b495c8b04d0e71b707c585f83cb9cb28cf8cd0d976c315e31b4"
+SRC_URI[deranged-0.5.5.sha256sum] = "ececcb659e7ba858fb4f10388c250a7252eb0a27373f1a72b8748afdd248e587"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
-SRC_URI[either-1.13.0.sha256sum] = "60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0"
+SRC_URI[dyn-clone-1.0.20.sha256sum] = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555"
+SRC_URI[either-1.15.0.sha256sum] = "48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719"
 SRC_URI[embedded-crc-macros-1.0.0.sha256sum] = "4f1c75747a43b086df1a87fb2a889590bc0725e0abf54bba6d0c4bf7bd9e762c"
 SRC_URI[env_logger-0.10.2.sha256sum] = "4cd405aab171cb85d6735e5c8d9db038c17d3ca007a4d2c25f337935c3d90580"
-SRC_URI[errno-0.3.10.sha256sum] = "33d852cb9b869c2a9b3df2f71a3074817f01e1844f839a144f5fcef059a4eb5d"
-SRC_URI[event-listener-2.5.3.sha256sum] = "0206175f82b8d6bf6652ff7d71a1e27fd2e4efde587fd368662814d6ec1d9ce0"
-SRC_URI[event-listener-5.4.0.sha256sum] = "3492acde4c3fc54c845eaab3eed8bd00c7a7d881f78bfc801e43a93dec1331ae"
-SRC_URI[event-listener-strategy-0.5.3.sha256sum] = "3c3e4e0dd3673c1139bf041f3008816d9cf2946bbfac2945c09e523b8d7b05b2"
-SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
+SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
 SRC_URI[futures-0.3.31.sha256sum] = "65bc07b1a8bc7c85c5f2e110c476c7389b4554ba72af57d8445ea63a576b0876"
 SRC_URI[futures-channel-0.3.31.sha256sum] = "2dff15bf788c671c1934e366d07e30c1814a8ef514e1af724a602e8a2fbe1b10"
 SRC_URI[futures-core-0.3.31.sha256sum] = "05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e"
 SRC_URI[futures-executor-0.3.31.sha256sum] = "1e28d1d997f585e54aebc3f97d39e72338912123a67330d723fdbb564d646c9f"
 SRC_URI[futures-io-0.3.31.sha256sum] = "9e5c1b78ca4aae1ac06c48a526a655760685149f0d465d21f37abfe57ce075c6"
-SRC_URI[futures-lite-2.6.0.sha256sum] = "f5edaec856126859abb19ed65f39e90fea3a9574b9707f13539acf4abf7eb532"
 SRC_URI[futures-macro-0.3.31.sha256sum] = "162ee34ebcb7c64a8abebc059ce0fee27c2262618d7b60ed8faf72fef13c3650"
 SRC_URI[futures-sink-0.3.31.sha256sum] = "e575fab7d1e0dcb8d0c7bcf9a63ee213816ab51902e6d244a95819acacf1d4f7"
 SRC_URI[futures-task-0.3.31.sha256sum] = "f90f7dce0722e95104fcb095585910c0977252f286e354b5e3bd38902cd99988"
 SRC_URI[futures-util-0.3.31.sha256sum] = "9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81"
+SRC_URI[fuzzy-matcher-0.3.7.sha256sum] = "54614a3312934d066701a80f20f15fa3b56d67ac7722b39eea5b4c9dd1d66c94"
+SRC_URI[fxhash-0.2.1.sha256sum] = "c31b6d751ae2c7f11320402d34e41349dd1016f8d5d45e48c4312bc8625af50c"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[glob-0.3.2.sha256sum] = "a8d1add55171497b4705a648c6b583acafb01d58050a51727785f0b2c8e0a2b2"
-SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
-SRC_URI[half-2.4.1.sha256sum] = "6dd08c532ae367adf81c312a4580bc67f1d0fe8bc9c460520283f4c0ff277888"
+SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
+SRC_URI[half-2.7.1.sha256sum] = "6ea2d84b969582b4b1864a92dc5d27cd2b77b622a8d79306834f1be5ba20d84b"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[hermit-abi-0.4.0.sha256sum] = "fbf6a919d6cf397374f7dfeeea91d974c7c0a7221d0d0f4f20d859d329e53fcc"
-SRC_URI[home-0.5.11.sha256sum] = "589533453244b0995c858700322199b2becb13b627df2851f64a2775d024abcf"
-SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
+SRC_URI[hermit-abi-0.5.2.sha256sum] = "fc0fef456e4baa96da950455cd02c081ca953b141298e41db3fc7e36b1da849c"
+SRC_URI[home-0.5.12.sha256sum] = "cc627f471c528ff0c4a49e1d5e60450c8f6461dd6d10ba9dcd3a61d3dff7728d"
+SRC_URI[humantime-2.3.0.sha256sum] = "135b12329e5e3ce057a9f972339ea52bc954fe1e9358ef27f95e89716fbc5424"
+SRC_URI[inquire-0.7.5.sha256sum] = "0fddf93031af70e75410a2511ec04d49e758ed2f26dad3404a934e0fb45cc12a"
 SRC_URI[io-kit-sys-0.4.1.sha256sum] = "617ee6cf8e3f66f3b4ea67a4058564628cde41901316e19f559e14c7c72c5e7b"
-SRC_URI[is-terminal-0.4.15.sha256sum] = "e19b23d53f35ce9f56aebc7d1bb4e6ac1e9c0db7ac85c8d1760c04379edced37"
-SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] = "7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
+SRC_URI[is-terminal-0.4.17.sha256sum] = "3640c1c38b8e4e43584d8df18be5fc6b0aa314ce6ebf51b53313d4306cca8e46"
+SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
-SRC_URI[itoa-1.0.14.sha256sum] = "d75a2a4b1b190afb6f5425f10f6a8f959d2ea0b9c2b1d79553551850539e4674"
-SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
-SRC_URI[kv-log-macro-1.0.7.sha256sum] = "0de8b303297635ad57c9f5059fd9cee7a47f8e8daa09df0fcd07dd39fb22977f"
+SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[libc-0.2.169.sha256sum] = "b5aba8db14291edd000dfcc4d620c7ebfb122c613afb886ca8803fa4e128a20a"
-SRC_URI[libloading-0.8.6.sha256sum] = "fc2f4eb4bc735547cfed7c0a4922cbd04a4655978c09b54f1f7b228750664c34"
+SRC_URI[libc-0.2.180.sha256sum] = "bcc35a38544a891a5f7c865aca548a982ccb3b8650a5b06d0fd33a10283c56fc"
+SRC_URI[libloading-0.8.9.sha256sum] = "d7c4b02199fee7c5d21a5ae7d8cfa79a6ef5bb2fc834d6e9058e89c825efdc55"
 SRC_URI[libmctp-0.2.0.sha256sum] = "0d077261b65cfe16a3d490243354fbaec3f22e5bcad546d21394105ab836d1d0"
 SRC_URI[libudev-0.3.0.sha256sum] = "78b324152da65df7bb95acfcaab55e3097ceaab02fb19b228a9eb74d55f135e0"
 SRC_URI[libudev-sys-0.1.4.sha256sum] = "3c8469b4a23b962c1396b9b451dda50ef5b283e8dd309d69033475fa9b334324"
 SRC_URI[linux-raw-sys-0.4.15.sha256sum] = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
-SRC_URI[log-0.4.25.sha256sum] = "04cbf5b083de1c7e0222a7a51dbfdba1cbe1c6ab0b15e29fff3f6c077fd9cd9f"
-SRC_URI[mach2-0.4.2.sha256sum] = "19b955cdeb2a02b9117f121ce63aa52d08ade45de53e48fe6a38b39c10f6f709"
-SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
+SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
+SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
+SRC_URI[mach2-0.4.3.sha256sum] = "d640282b302c0bb0a2a8e0233ead9035e3bed871f0b7e81fe4a1ec829765db44"
+SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
 SRC_URI[memmap2-0.5.10.sha256sum] = "83faa42c0a078c393f6b29d5db232d8be22776a891f8f56e5284faee4a20b327"
 SRC_URI[minicbor-0.25.1.sha256sum] = "c0452a60c1863c1f50b5f77cd295e8d2786849f35883f0b9e18e7e6e1b5691b0"
 SRC_URI[minicbor-derive-0.15.3.sha256sum] = "bd2209fff77f705b00c737016a48e73733d7fbccb8b007194db148f03561fb70"
 SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
+SRC_URI[mio-0.8.11.sha256sum] = "a4a650543ca06a924e8b371db273b2756685faae30f8487da1b56505a8f78b0c"
+SRC_URI[mio-1.1.1.sha256sum] = "a69bcab0ad47271a0234d9422b131806bf3968021e5dc9328caf2d4cd58557fc"
+SRC_URI[newline-converter-0.3.0.sha256sum] = "47b6b097ecb1cbfed438542d16e84fd7ad9b0c76c8a65b7f9039212a3d14dc7f"
 SRC_URI[nix-0.26.4.sha256sum] = "598beaf3cc6fdd9a5dfb1630c2800c7acd31df7aaf0f565796fba2b53ca1af1b"
 SRC_URI[nix-0.29.0.sha256sum] = "71e2746dc3a24dd78b3cfcb7be93368c6de9963d30f43a6a73998a9cf4b17b46"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
-SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
+SRC_URI[num-conv-0.2.0.sha256sum] = "cf97ec579c3c42f953ef76dbf8d55ac91fb219dde70e49aa4a6b7d74e9919050"
 SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[oid-registry-0.6.1.sha256sum] = "9bedf36ffb6ba96c2eb7144ef6270557b52e54b20c0a8e1eb2ff99a6c6959bff"
-SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
-SRC_URI[parking-2.2.1.sha256sum] = "f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
+SRC_URI[parking_lot-0.12.5.sha256sum] = "93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a"
+SRC_URI[parking_lot_core-0.9.12.sha256sum] = "2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1"
 SRC_URI[pin-project-lite-0.2.16.sha256sum] = "3b3cff922bd51709b605d9ead9aa71031d81447142d828eb4a6eba76fe619f9b"
 SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
-SRC_URI[piper-0.2.4.sha256sum] = "96c8c490f422ef9a4efd2cb5b42b76c8613d7e7dfc1caf667b8a3350a5acc066"
-SRC_URI[pkg-config-0.3.31.sha256sum] = "953ec861398dccce10c670dfeaf3ec4911ca479e9c02154b3a215178c5f566f2"
-SRC_URI[polling-3.7.4.sha256sum] = "a604568c3202727d1507653cb121dbd627a58684eb09a820fd746bee38b4442f"
+SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
 SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
-SRC_URI[prettyplease-0.2.29.sha256sum] = "6924ced06e1f7dfe3fa48d57b9f74f55d8915f5036121bef647ef4b204895fac"
-SRC_URI[proc-macro2-1.0.93.sha256sum] = "60946a68e5f9d28b0dc1c21bb8a97ee7d018a8b322fa57838ba31cc878e22d99"
-SRC_URI[quote-1.0.38.sha256sum] = "0e4dccaaaf89514f546c693ddc140f729f958c247918a13380cccc6078391acc"
-SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
-SRC_URI[regex-automata-0.4.9.sha256sum] = "809e8dc61f6de73b46c85f4c96486310fe304c434cfa43669d7b40f711150908"
-SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
-SRC_URI[rustc-hash-2.1.0.sha256sum] = "c7fb8039b3032c191086b10f11f319a6e99e1e82889c5cc6046f515c9db1d497"
+SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
+SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
+SRC_URI[redox_syscall-0.5.18.sha256sum] = "ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d"
+SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
+SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
+SRC_URI[regex-syntax-0.8.9.sha256sum] = "a96887878f22d7bad8a3b6dc5b7440e0ada9a245242924394987b21cf2210a4c"
+SRC_URI[rustc-hash-2.1.1.sha256sum] = "357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d"
 SRC_URI[rusticata-macros-4.1.0.sha256sum] = "faf0c4a6ece9950b9abdb62b1cfcf2a68b3b67a10ba445b3bb85be2a293d0632"
 SRC_URI[rustix-0.38.44.sha256sum] = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
-SRC_URI[rustversion-1.0.19.sha256sum] = "f7c45b9784283f1b2e7fb61b42047c2fd678ef0960d4f6f1eba131594cc369d4"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
-SRC_URI[serde-1.0.217.sha256sum] = "02fc4265df13d6fa1d00ecff087228cc0a2b5f3c0e87e258d8b94a156e984c70"
-SRC_URI[serde_derive-1.0.217.sha256sum] = "5a9bf7cf98d04a2b28aead066b7496853d4779c9cc183c440dbac457641e19a0"
-SRC_URI[serialport-4.7.0.sha256sum] = "5ecfc4858c2266c7695d8b8460bbd612fa81bd2e250f5f0dd16195e4b4f8b3d8"
-SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
+SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
+SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
+SRC_URI[serialport-4.8.1.sha256sum] = "21f60a586160667241d7702c420fc223939fb3c0bb8d3fac84f78768e8970dee"
+SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
-SRC_URI[slab-0.4.9.sha256sum] = "8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4856390e3d3bb67"
+SRC_URI[signal-hook-0.3.18.sha256sum] = "d881a16cf4426aa584979d30bd82cb33429027e42122b169753d6ef1085ed6e2"
+SRC_URI[signal-hook-mio-0.2.5.sha256sum] = "b75a19a7a740b25bc7944bdee6172368f988763b744e3d4dfe753f6b4ece40cc"
+SRC_URI[signal-hook-registry-1.4.8.sha256sum] = "c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
+SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
+SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 SRC_URI[smbus-pec-1.0.1.sha256sum] = "ca0763a680cd5d72b28f7bfc8a054c117d8841380a6ad4f72f05bd2a34217d3e"
+SRC_URI[socket2-0.6.2.sha256sum] = "86f4aa3ad99f2088c990dfa82d367e19cb29268ed67c574d10d0a4bfe71f07e0"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.96.sha256sum] = "d5d0adab1ae378d7f53bdebc67a39f1f151407ef230f0ce2883572f5d8985c80"
+SRC_URI[syn-2.0.114.sha256sum] = "d4d107df263a3013ef9b1879b0df87d706ff80f65a86ea879bd9c31f9b307c2a"
 SRC_URI[synstructure-0.12.6.sha256sum] = "f36bdaa60a83aca3921b5259d5400cbf5e90fc51931376a9bd4a0eb79aa7210f"
-SRC_URI[synstructure-0.13.1.sha256sum] = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
+SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
 SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
+SRC_URI[thiserror-2.0.18.sha256sum] = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
 SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
-SRC_URI[time-0.3.37.sha256sum] = "35e7868883861bd0e56d9ac6efcaaca0d6d5d82a2a7ec8209ff492c07cf37b21"
-SRC_URI[time-core-0.1.2.sha256sum] = "ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3"
-SRC_URI[time-macros-0.2.19.sha256sum] = "2834e6017e3e5e4b9834939793b282bc03b37a3336245fa820e35e233e2a85de"
-SRC_URI[tracing-0.1.41.sha256sum] = "784e0ac535deb450455cbfa28a6f0df145ea1bb7ae51b821cf5e7927fdcfbdd0"
-SRC_URI[tracing-core-0.1.33.sha256sum] = "e672c95779cf947c5311f83787af4fa8fffd12fb27e4993211a84bdfd9610f9c"
-SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
-SRC_URI[unescaper-0.1.5.sha256sum] = "c878a167baa8afd137494101a688ef8c67125089ff2249284bd2b5f9bfedb815"
-SRC_URI[unicode-ident-1.0.15.sha256sum] = "11cd88e12b17c6494200a9c1b683a04fcac9573ed74cd1b62aeb2727c5592243"
+SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
+SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
+SRC_URI[time-0.3.47.sha256sum] = "743bd48c283afc0388f9b8827b976905fb217ad9e647fae3a379a9283c4def2c"
+SRC_URI[time-core-0.1.8.sha256sum] = "7694e1cfe791f8d31026952abf09c69ca6f6fa4e1a1229e18988f06a04a12dca"
+SRC_URI[time-macros-0.2.27.sha256sum] = "2e70e4c5a0e0a8a4823ad65dfe1a6930e4f4d756dcd9dd7939022b5e8c501215"
+SRC_URI[tokio-1.49.0.sha256sum] = "72a2903cd7736441aac9df9d7688bd0ce48edccaadf181c3b90be801e81d3d86"
+SRC_URI[tokio-macros-2.6.0.sha256sum] = "af407857209536a95c8e56f8231ef2c2e2aff839b22e07a1ffcbc617e9db9fa5"
+SRC_URI[typenum-1.19.0.sha256sum] = "562d481066bde0658276a35467c4af00bdc6ee726305698a55b86e61d7ad82bb"
+SRC_URI[unescaper-0.1.8.sha256sum] = "4064ed685c487dbc25bd3f0e9548f2e34bab9d18cefc700f9ec2dba74ba1138e"
+SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
+SRC_URI[unicode-segmentation-1.12.0.sha256sum] = "f6ccf251212114b54433ec949fd6a7841275f9ada20dddd2f29e9ceea4501493"
+SRC_URI[unicode-width-0.1.14.sha256sum] = "7dd6e30e90baa6f72411720665d41d89b9a3d039dc45b8faea1ddd07f617f6af"
 SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[value-bag-1.10.0.sha256sum] = "3ef4c4aa54d5d05a279399bfa921ec387b7aba77caf7a682ae8d86785b8fdad2"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
-SRC_URI[wasm-bindgen-0.2.100.sha256sum] = "1edc8929d7499fc4e8f0be2262a241556cfc54a0bea223790e71446f2aab1ef5"
-SRC_URI[wasm-bindgen-backend-0.2.100.sha256sum] = "2f0a0651a5c2bc21487bde11ee802ccaf4c51935d0d3d42a6101f98161700bc6"
-SRC_URI[wasm-bindgen-futures-0.4.50.sha256sum] = "555d470ec0bc3bb57890405e5d4322cc9ea83cebb085523ced7be4144dac1e61"
-SRC_URI[wasm-bindgen-macro-0.2.100.sha256sum] = "7fe63fc6d09ed3792bd0897b314f53de8e16568c2b3f7982f468c0bf9bd0b407"
-SRC_URI[wasm-bindgen-macro-support-0.2.100.sha256sum] = "8ae87ea40c9f689fc23f209965b6fb8a99ad69aeeb0231408be24920604395de"
-SRC_URI[wasm-bindgen-shared-0.2.100.sha256sum] = "1a05d73b933a847d6cccdda8f838a22ff101ad9bf93e33684f39c1f5f0eece3d"
-SRC_URI[web-sys-0.3.77.sha256sum] = "33b6dd2ef9186f1f2072e409e99cd22a975331a6b3591b12c764e0e55c60d5d2"
+SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
 SRC_URI[which-6.0.3.sha256sum] = "b4ee928febd44d98f2f459a4a79bd4d928591333a494a10a868418ac1b39cf1f"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.9.sha256sum] = "cf221c93e13a30d793f7645a0e7762c55d169dbb0a49671918a2319d289b10bb"
+SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
+SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
 SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
+SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
+SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
+SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
 SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
 SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
+SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
 SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
 SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
 SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
+SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
 SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
+SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
 SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
 SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
+SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 SRC_URI[winsafe-0.0.19.sha256sum] = "d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904"
 SRC_URI[x509-parser-0.15.1.sha256sum] = "7069fba5b66b9193bd2c5d3d4ff12b839118f6bcbef5328efafafb5395cf63da"
-# from tock-responder/Cargo.lock
-SRC_URI += " \
-    crate://crates.io/aho-corasick/1.1.3 \
-    crate://crates.io/atty/0.2.14 \
-    crate://crates.io/autocfg/1.4.0 \
-    crate://crates.io/bindgen/0.71.1 \
-    crate://crates.io/bitfield/0.14.0 \
-    crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.8.0 \
-    crate://crates.io/byteorder/0.5.3 \
-    crate://crates.io/cexpr/0.6.0 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/clang-sys/1.8.1 \
-    crate://crates.io/clap/3.2.25 \
-    crate://crates.io/clap_derive/3.2.25 \
-    crate://crates.io/clap_lex/0.2.4 \
-    crate://crates.io/critical-section/1.2.0 \
-    crate://crates.io/either/1.13.0 \
-    crate://crates.io/elf/0.0.10 \
-    crate://crates.io/embedded-alloc/0.5.1 \
-    crate://crates.io/embedded-crc-macros/1.0.0 \
-    crate://crates.io/errno/0.3.10 \
-    crate://crates.io/glob/0.3.2 \
-    crate://crates.io/hashbrown/0.12.3 \
-    crate://crates.io/heck/0.4.1 \
-    crate://crates.io/hermit-abi/0.1.19 \
-    crate://crates.io/home/0.5.11 \
-    crate://crates.io/indexmap/1.9.3 \
-    crate://crates.io/itertools/0.13.0 \
-    crate://crates.io/libc/0.2.169 \
-    crate://crates.io/libloading/0.8.6 \
-    crate://crates.io/libm/0.2.11 \
-    crate://crates.io/libmctp/0.2.0 \
-    crate://crates.io/linked_list_allocator/0.10.5 \
-    crate://crates.io/linux-raw-sys/0.4.15 \
-    crate://crates.io/log/0.4.25 \
-    crate://crates.io/memchr/2.7.4 \
-    crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/nom/7.1.3 \
-    crate://crates.io/numtoa/0.1.0 \
-    crate://crates.io/once_cell/1.20.2 \
-    crate://crates.io/os_str_bytes/6.6.1 \
-    crate://crates.io/portable-atomic/1.10.0 \
-    crate://crates.io/prettyplease/0.2.29 \
-    crate://crates.io/proc-macro-error/1.0.4 \
-    crate://crates.io/proc-macro-error-attr/1.0.4 \
-    crate://crates.io/proc-macro2/1.0.93 \
-    crate://crates.io/quote/1.0.38 \
-    crate://crates.io/redox_syscall/0.2.16 \
-    crate://crates.io/redox_termios/0.1.3 \
-    crate://crates.io/regex/1.11.1 \
-    crate://crates.io/regex-automata/0.4.9 \
-    crate://crates.io/regex-syntax/0.8.5 \
-    crate://crates.io/rustc-hash/2.1.0 \
-    crate://crates.io/rustix/0.38.44 \
-    crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/smbus-pec/1.0.1 \
-    crate://crates.io/strsim/0.10.0 \
-    crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.96 \
-    crate://crates.io/termcolor/1.4.1 \
-    crate://crates.io/termion/1.5.6 \
-    crate://crates.io/textwrap/0.16.1 \
-    crate://crates.io/unicode-ident/1.0.15 \
-    crate://crates.io/version_check/0.9.5 \
-    crate://crates.io/which/6.0.3 \
-    crate://crates.io/winapi/0.3.9 \
-    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.9 \
-    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/windows-sys/0.59.0 \
-    crate://crates.io/windows-targets/0.52.6 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
-    crate://crates.io/windows_aarch64_msvc/0.52.6 \
-    crate://crates.io/windows_i686_gnu/0.52.6 \
-    crate://crates.io/windows_i686_gnullvm/0.52.6 \
-    crate://crates.io/windows_i686_msvc/0.52.6 \
-    crate://crates.io/windows_x86_64_gnu/0.52.6 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
-    crate://crates.io/windows_x86_64_msvc/0.52.6 \
-    crate://crates.io/winsafe/0.0.19 \
-"
-
-SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
-SRC_URI[atty-0.2.14.sha256sum] = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
-SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
-SRC_URI[bindgen-0.71.1.sha256sum] = "5f58bf3d7db68cfbac37cfc485a8d711e87e064c3d0fe0435b92f7a407f9d6b3"
-SRC_URI[bitfield-0.14.0.sha256sum] = "2d7e60934ceec538daadb9d8432424ed043a904d8e0243f3c6446bce549a46ac"
-SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.8.0.sha256sum] = "8f68f53c83ab957f72c32642f3868eec03eb974d1fb82e453128456482613d36"
-SRC_URI[byteorder-0.5.3.sha256sum] = "0fc10e8cc6b2580fda3f36eb6dc5316657f812a3df879a44a66fc9f0fdbc4855"
-SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[clang-sys-1.8.1.sha256sum] = "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
-SRC_URI[clap-3.2.25.sha256sum] = "4ea181bf566f71cb9a5d17a59e1871af638180a18fb0035c92ae62b705207123"
-SRC_URI[clap_derive-3.2.25.sha256sum] = "ae6371b8bdc8b7d3959e9cf7b22d4435ef3e79e138688421ec654acf8c81b008"
-SRC_URI[clap_lex-0.2.4.sha256sum] = "2850f2f5a82cbf437dd5af4d49848fbdfc27c157c3d010345776f952765261c5"
-SRC_URI[critical-section-1.2.0.sha256sum] = "790eea4361631c5e7d22598ecd5723ff611904e3344ce8720784c93e3d83d40b"
-SRC_URI[either-1.13.0.sha256sum] = "60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0"
-SRC_URI[elf-0.0.10.sha256sum] = "4841de15dbe0e49b9b62a417589299e3be0d557e0900d36acb87e6dae47197f5"
-SRC_URI[embedded-alloc-0.5.1.sha256sum] = "ddae17915accbac2cfbc64ea0ae6e3b330e6ea124ba108dada63646fd3c6f815"
-SRC_URI[embedded-crc-macros-1.0.0.sha256sum] = "4f1c75747a43b086df1a87fb2a889590bc0725e0abf54bba6d0c4bf7bd9e762c"
-SRC_URI[errno-0.3.10.sha256sum] = "33d852cb9b869c2a9b3df2f71a3074817f01e1844f839a144f5fcef059a4eb5d"
-SRC_URI[glob-0.3.2.sha256sum] = "a8d1add55171497b4705a648c6b583acafb01d58050a51727785f0b2c8e0a2b2"
-SRC_URI[hashbrown-0.12.3.sha256sum] = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
-SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
-SRC_URI[hermit-abi-0.1.19.sha256sum] = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
-SRC_URI[home-0.5.11.sha256sum] = "589533453244b0995c858700322199b2becb13b627df2851f64a2775d024abcf"
-SRC_URI[indexmap-1.9.3.sha256sum] = "bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99"
-SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
-SRC_URI[libc-0.2.169.sha256sum] = "b5aba8db14291edd000dfcc4d620c7ebfb122c613afb886ca8803fa4e128a20a"
-SRC_URI[libloading-0.8.6.sha256sum] = "fc2f4eb4bc735547cfed7c0a4922cbd04a4655978c09b54f1f7b228750664c34"
-SRC_URI[libm-0.2.11.sha256sum] = "8355be11b20d696c8f18f6cc018c4e372165b1fa8126cef092399c9951984ffa"
-SRC_URI[libmctp-0.2.0.sha256sum] = "0d077261b65cfe16a3d490243354fbaec3f22e5bcad546d21394105ab836d1d0"
-SRC_URI[linked_list_allocator-0.10.5.sha256sum] = "9afa463f5405ee81cdb9cc2baf37e08ec7e4c8209442b5d72c04cfb2cd6e6286"
-SRC_URI[linux-raw-sys-0.4.15.sha256sum] = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
-SRC_URI[log-0.4.25.sha256sum] = "04cbf5b083de1c7e0222a7a51dbfdba1cbe1c6ab0b15e29fff3f6c077fd9cd9f"
-SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
-SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
-SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
-SRC_URI[numtoa-0.1.0.sha256sum] = "b8f8bdf33df195859076e54ab11ee78a1b208382d3a26ec40d142ffc1ecc49ef"
-SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
-SRC_URI[os_str_bytes-6.6.1.sha256sum] = "e2355d85b9a3786f481747ced0e0ff2ba35213a1f9bd406ed906554d7af805a1"
-SRC_URI[portable-atomic-1.10.0.sha256sum] = "280dc24453071f1b63954171985a0b0d30058d287960968b9b2aca264c8d4ee6"
-SRC_URI[prettyplease-0.2.29.sha256sum] = "6924ced06e1f7dfe3fa48d57b9f74f55d8915f5036121bef647ef4b204895fac"
-SRC_URI[proc-macro-error-1.0.4.sha256sum] = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
-SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
-SRC_URI[proc-macro2-1.0.93.sha256sum] = "60946a68e5f9d28b0dc1c21bb8a97ee7d018a8b322fa57838ba31cc878e22d99"
-SRC_URI[quote-1.0.38.sha256sum] = "0e4dccaaaf89514f546c693ddc140f729f958c247918a13380cccc6078391acc"
-SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
-SRC_URI[redox_termios-0.1.3.sha256sum] = "20145670ba436b55d91fc92d25e71160fbfbdd57831631c8d7d36377a476f1cb"
-SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
-SRC_URI[regex-automata-0.4.9.sha256sum] = "809e8dc61f6de73b46c85f4c96486310fe304c434cfa43669d7b40f711150908"
-SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
-SRC_URI[rustc-hash-2.1.0.sha256sum] = "c7fb8039b3032c191086b10f11f319a6e99e1e82889c5cc6046f515c9db1d497"
-SRC_URI[rustix-0.38.44.sha256sum] = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
-SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
-SRC_URI[smbus-pec-1.0.1.sha256sum] = "ca0763a680cd5d72b28f7bfc8a054c117d8841380a6ad4f72f05bd2a34217d3e"
-SRC_URI[strsim-0.10.0.sha256sum] = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
-SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.96.sha256sum] = "d5d0adab1ae378d7f53bdebc67a39f1f151407ef230f0ce2883572f5d8985c80"
-SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
-SRC_URI[termion-1.5.6.sha256sum] = "077185e2eac69c3f8379a4298e1e07cd36beb962290d4a51199acf0fdc10607e"
-SRC_URI[textwrap-0.16.1.sha256sum] = "23d434d3f8967a09480fb04132ebe0a3e088c173e6d0ee7897abbdf4eab0f8b9"
-SRC_URI[unicode-ident-1.0.15.sha256sum] = "11cd88e12b17c6494200a9c1b683a04fcac9573ed74cd1b62aeb2727c5592243"
-SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
-SRC_URI[which-6.0.3.sha256sum] = "b4ee928febd44d98f2f459a4a79bd4d928591333a494a10a868418ac1b39cf1f"
-SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
-SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.9.sha256sum] = "cf221c93e13a30d793f7645a0e7762c55d169dbb0a49671918a2319d289b10bb"
-SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
-SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
-SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
-SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
-SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
-SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
-SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
-SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
-SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
-SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
-SRC_URI[winsafe-0.0.19.sha256sum] = "d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904"
-SRC_URI[clap-4.5.26.sha256sum] = "a8eb5e908ef3a6efbe1ed62520fb7287959888c88485abe072543190ecc66783"
-SRC_URI[clap_builder-4.5.26.sha256sum] = "96b01801b5fc6a0a232407abc821660c9c6d25a1cafc0d4f85f29fb8d9afc121"
-SRC_URI[cpufeatures-0.2.16.sha256sum] = "16b80225097f2e5ae4e7179dd2266824648f3e2f49d9134d584b76389d31c4c3"
-SRC_URI[crunchy-0.2.2.sha256sum] = "7a81dae078cea95a014a339291cec439d2f232ebe854a9d672b796c6afafa9b7"
-SRC_URI[is-terminal-0.4.13.sha256sum] = "261f68e344040fbd0edea105bef17c66edf46f984ddb1115b775ce31be948f4b"
-SRC_URI[rustix-0.38.43.sha256sum] = "a78891ee6bf2340288408954ac787aa063d8e8817e9f53abb37c695c6d834ef6"
-SRC_URI[unicode-ident-1.0.14.sha256sum] = "adb9e6ca4f869e1180728b7950e35922a7fc6397f7b641499e8f3ef06e50dc83"
-SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
-SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
-SRC_URI[bindgen-0.63.0.sha256sum] = "36d860121800b2a9a94f9b5604b332d5cffb234ce17609ea479d723dbc9d3885"
-SRC_URI[bitflags-2.6.0.sha256sum] = "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
-SRC_URI[critical-section-1.1.2.sha256sum] = "7059fff8937831a9ae6f0fe4d658ffabf58f2ca96aa9dec1c889f936f705f216"
-SRC_URI[errno-0.3.9.sha256sum] = "534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba"
-SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
-SRC_URI[home-0.5.9.sha256sum] = "e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5"
-SRC_URI[lazycell-1.3.0.sha256sum] = "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
-SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
-SRC_URI[libloading-0.8.5.sha256sum] = "4979f22fdb869068da03c9f7528f8297c6fd2606bc3a4affe42e6a823fdb8da4"
-SRC_URI[libm-0.2.8.sha256sum] = "4ec2a862134d2a7d32d7983ddcdd1c4923530833c9f2ea1a44fc5fa473989058"
-SRC_URI[linux-raw-sys-0.4.14.sha256sum] = "78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89"
-SRC_URI[log-0.4.22.sha256sum] = "a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24"
-SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[peeking_take_while-0.1.2.sha256sum] = "19b17cddbe7ec3f8bc800887bab5e717348c95ea2ca0b1bf0837fb964dc67099"
-SRC_URI[portable-atomic-1.7.0.sha256sum] = "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
-SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
-SRC_URI[regex-1.10.5.sha256sum] = "b91213439dad192326a0d7c6ee3955910425f441d7038e0d6933b0aec5c4517f"
-SRC_URI[regex-automata-0.4.7.sha256sum] = "38caf58cc5ef2fed281f89292ef23f6365465ed9a41b7a7754eb4e26496c92df"
-SRC_URI[regex-syntax-0.8.4.sha256sum] = "7a66a03ae7c801facd77a29370b4faec201768915ac14a721ba36f20bc9c209b"
-SRC_URI[rustc-hash-1.1.0.sha256sum] = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
-SRC_URI[rustix-0.38.34.sha256sum] = "70dc5ec042f7a43c4a73241207cecc9873a06d45debb38b329f8541d85c2730f"
-SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
-SRC_URI[which-4.4.2.sha256sum] = "87ba24419a2078cd2b0f2ede2691b6c66d8e47836da3b6db8265ebad47afbfc7"
-SRC_URI[which-6.0.2.sha256sum] = "3d9c5ed668ee1f17edb3b627225343d210006a90bb1e3745ce1f30b1fb115075"
-SRC_URI[winapi-util-0.1.8.sha256sum] = "4d4cc384e1e73b93bafa6fb4f1df8c41695c8a91cf9c4c64358067d15a7b6c6b"
-SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[zerocopy-0.8.38.sha256sum] = "57cf3aa6855b23711ee9852dfc97dfaa51c45feaba5b645d0c777414d494a961"
+SRC_URI[zerocopy-derive-0.8.38.sha256sum] = "8a616990af1a287837c4fe6596ad77ef57948f787e46ce28e166facc0cc1cb75"
diff --git a/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb b/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
index 5c5022d9c0..6b7c46ed3a 100644
--- a/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
+++ b/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
@@ -15,7 +15,9 @@ SRC_URI += "git://github.com/westerndigitalcorporation/spdm-utils.git;protocol=h

 include spdm-utils-crates.inc

-SRCREV = "f67ac9e00b79f603ecbbd29928a4ecc3dec5abd5"
+SRCREV = "8805327c9ac0d354c6ef891ccdd0527bbecf80e0"
+
+PV .= "+git"

 DEPENDS += "libspdm udev clang-native bindgen-cli-native pciutils"


