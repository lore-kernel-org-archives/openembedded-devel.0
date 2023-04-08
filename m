Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A06FC7619A
	for <webhook@archiver.kernel.org>; Sat,  8 Apr 2023 17:04:08 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.702.1680973442527585938
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Apr 2023 10:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LNvxLEWY;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id c10-20020a17090abf0a00b0023d1bbd9f9eso3856110pjs.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Apr 2023 10:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680973442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuOXAYLDrK7jH9ESNntpuRGHGqNkMA9ac5uB2kK5o9E=;
        b=LNvxLEWY978lCsEdheA6vytRWh1vYBXaKLWw3HRfnuBU+b0BZjw0nDt7feiMmHXxz1
         4j/5wcL/cGPEsYKiL6Yb4Em47NyvNDlhkZbtxf2NGFiINWJYMhGqmWxhbwK9a2shEsJ/
         2sMYzQOHsUITcUqRpMPRSLNPnHfEFtKGuEXkmS3lUj9EJ/wOpG866pQnAu2cVyTvKWqV
         ARQuzjDPbqZy+ffDemUkkhbl3cOZt9xjovxYKrT+VLmURO32yrXEmfCVSAjiGHLz9p7M
         aFvHufIcFWAV/gSKV70NZ8IuGF4BAmRmOxWgkowt7pWy/MKB5G6ND9szKmMtrtR1ExWP
         X83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680973442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuOXAYLDrK7jH9ESNntpuRGHGqNkMA9ac5uB2kK5o9E=;
        b=VUmqmnP1c/wXf5p3j6PgJheahaX6aD5kH8n4duqq+OwQvJvO4+hxOIpmGnw9Df1ITp
         ccAFtVlC05tZ7jn4vQoIlp5sZThemPH+FM4BaPdKK3tKHaoeAizxSUVzUBn/twa56b22
         sJEhKnBNu+KfahjLRMMZNiykUH2xvdcnnAT4uwekj3Wks4K5agDueiyhsp2mjFNscQ2O
         o+tSJ7pRO9ZqC/Hk+Mvr6phZUigjalq9yp9d87UHfaC5RUQiegMIqxolWuWd27J7Vk+r
         NAzKVxmivsCq3Lv77TI3quUVMU2se03OmcjIsJ9ZulWYGjwlYi18NwzpDxOxHskfxVMd
         26bw==
X-Gm-Message-State: AAQBX9f/ZDs1rDVZ8nnfATGfjd3NQWgQdhZRUtRmiBRZXKSHVCkU39sC
	UqQ5RPQzLDHdhbIGEYg5FlGvioCYs+qVtw==
X-Google-Smtp-Source: AKy350Z0K2QN/kuI4L+xq2vNlJnoinSJn9gr6t01QxtmjfSHIm41k6hFpHVFYin0hmKc/330/vcRLw==
X-Received: by 2002:a17:90b:4a06:b0:23d:3761:6087 with SMTP id kk6-20020a17090b4a0600b0023d37616087mr7074397pjb.1.1680973440830;
        Sat, 08 Apr 2023 10:04:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090b018f00b002408d3f76ebsm6502322pjs.45.2023.04.08.10.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 10:03:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pyruvate: Upgrade to 1.2.1
Date: Sat,  8 Apr 2023 10:03:57 -0700
Message-Id: <20230408170357.2181730-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Apr 2023 17:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101997

Add fixes to build with musl and riscv32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pyruvate-crates.inc        | 276 ++++++++++--------
 ...-targets-for-stat.st_dev-definitions.patch |   4 +-
 ...-musl-Define-O_LARGEFILE-for-riscv32.patch |  21 ++
 ...Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch |  99 +++++++
 ...efine-SOCK_SEQPACKET-in-common-place.patch |  92 ++++++
 ...GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch | 140 +++++++++
 ...ine-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch |  35 +++
 ...ate_1.1.2.bb => python3-pyruvate_1.2.1.bb} |  15 +-
 8 files changed, 553 insertions(+), 129 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Define-O_LARGEFILE-for-riscv32.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Move-F_OFD_GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-riscv32-Define-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch
 rename meta-python/recipes-devtools/python/{python3-pyruvate_1.1.2.bb => python3-pyruvate_1.2.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-pyruvate-crates.inc b/meta-python/recipes-devtools/python/python3-pyruvate-crates.inc
index 9d4a7272f7..b8a74e617f 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pyruvate-crates.inc
@@ -2,25 +2,22 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/aho-corasick/0.7.18 \
-    crate://crates.io/atty/0.2.14 \
-    crate://crates.io/autocfg/1.0.1 \
+    crate://crates.io/aho-corasick/0.7.20 \
+    crate://crates.io/autocfg/1.1.0 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/block-buffer/0.9.0 \
-    crate://crates.io/cc/1.0.72 \
+    crate://crates.io/block-buffer/0.10.3 \
+    crate://crates.io/cc/1.0.78 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/chrono/0.4.19 \
-    crate://crates.io/cpufeatures/0.2.1 \
-    crate://crates.io/cpython/0.7.0 \
-    crate://crates.io/crossbeam/0.8.1 \
-    crate://crates.io/crossbeam-channel/0.5.2 \
-    crate://crates.io/crossbeam-deque/0.8.1 \
-    crate://crates.io/crossbeam-epoch/0.9.6 \
-    crate://crates.io/crossbeam-queue/0.3.3 \
-    crate://crates.io/crossbeam-utils/0.8.6 \
-    crate://crates.io/crypto-mac/0.11.1 \
-    crate://crates.io/ctrlc/3.2.1 \
-    crate://crates.io/digest/0.9.0 \
+    crate://crates.io/cpufeatures/0.2.5 \
+    crate://crates.io/cpython/0.7.1 \
+    crate://crates.io/crossbeam/0.8.2 \
+    crate://crates.io/crossbeam-channel/0.5.6 \
+    crate://crates.io/crossbeam-deque/0.8.2 \
+    crate://crates.io/crossbeam-epoch/0.9.13 \
+    crate://crates.io/crossbeam-queue/0.3.8 \
+    crate://crates.io/crossbeam-utils/0.8.14 \
+    crate://crates.io/crypto-common/0.1.6 \
+    crate://crates.io/digest/0.10.6 \
     crate://crates.io/encoding/0.2.33 \
     crate://crates.io/encoding-index-japanese/1.20141219.5 \
     crate://crates.io/encoding-index-korean/1.20141219.5 \
@@ -28,90 +25,106 @@ SRC_URI += " \
     crate://crates.io/encoding-index-singlebyte/1.20141219.5 \
     crate://crates.io/encoding-index-tradchinese/1.20141219.5 \
     crate://crates.io/encoding_index_tests/0.1.4 \
-    crate://crates.io/env_logger/0.9.0 \
+    crate://crates.io/env_logger/0.10.0 \
     crate://crates.io/errno/0.2.8 \
     crate://crates.io/errno-dragonfly/0.1.2 \
-    crate://crates.io/fastrand/1.6.0 \
-    crate://crates.io/generic-array/0.14.5 \
-    crate://crates.io/getrandom/0.2.3 \
+    crate://crates.io/fastrand/1.8.0 \
+    crate://crates.io/generic-array/0.14.6 \
+    crate://crates.io/getrandom/0.2.8 \
     crate://crates.io/hermit-abi/0.1.19 \
-    crate://crates.io/hmac/0.11.0 \
-    crate://crates.io/httparse/1.5.1 \
+    crate://crates.io/hermit-abi/0.2.6 \
+    crate://crates.io/hmac/0.12.1 \
+    crate://crates.io/httparse/1.8.0 \
     crate://crates.io/humantime/2.1.0 \
     crate://crates.io/instant/0.1.12 \
-    crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/libc/0.2.112 \
-    crate://crates.io/libsystemd/0.4.1 \
-    crate://crates.io/log/0.4.14 \
-    crate://crates.io/memchr/2.4.1 \
+    crate://crates.io/io-lifetimes/1.0.3 \
+    crate://crates.io/is-terminal/0.4.1 \
+    crate://crates.io/itoa/1.0.5 \
+    crate://crates.io/libc/0.2.138 \
+    crate://crates.io/libsystemd/0.5.0 \
+    crate://crates.io/linux-raw-sys/0.1.4 \
+    crate://crates.io/log/0.4.17 \
+    crate://crates.io/memchr/2.5.0 \
     crate://crates.io/memoffset/0.6.5 \
-    crate://crates.io/mio/0.8.0 \
-    crate://crates.io/miow/0.3.7 \
-    crate://crates.io/nix/0.23.1 \
-    crate://crates.io/ntapi/0.3.6 \
-    crate://crates.io/num-integer/0.1.44 \
-    crate://crates.io/num-traits/0.2.14 \
-    crate://crates.io/num_cpus/1.13.1 \
-    crate://crates.io/once_cell/1.9.0 \
-    crate://crates.io/opaque-debug/0.3.0 \
-    crate://crates.io/paste/1.0.6 \
-    crate://crates.io/ppv-lite86/0.2.16 \
-    crate://crates.io/proc-macro2/1.0.36 \
-    crate://crates.io/python3-sys/0.7.0 \
-    crate://crates.io/quote/1.0.14 \
-    crate://crates.io/rand/0.8.4 \
+    crate://crates.io/memoffset/0.7.1 \
+    crate://crates.io/minimal-lexical/0.2.1 \
+    crate://crates.io/mio/0.8.5 \
+    crate://crates.io/nix/0.23.2 \
+    crate://crates.io/nix/0.26.1 \
+    crate://crates.io/nom/7.1.1 \
+    crate://crates.io/num-traits/0.2.15 \
+    crate://crates.io/num_cpus/1.14.0 \
+    crate://crates.io/num_threads/0.1.6 \
+    crate://crates.io/once_cell/1.16.0 \
+    crate://crates.io/paste/1.0.11 \
+    crate://crates.io/pin-utils/0.1.0 \
+    crate://crates.io/ppv-lite86/0.2.17 \
+    crate://crates.io/proc-macro2/1.0.49 \
+    crate://crates.io/python3-sys/0.7.1 \
+    crate://crates.io/quote/1.0.23 \
+    crate://crates.io/rand/0.8.5 \
     crate://crates.io/rand_chacha/0.3.1 \
-    crate://crates.io/rand_core/0.6.3 \
-    crate://crates.io/rand_hc/0.3.1 \
-    crate://crates.io/redox_syscall/0.2.10 \
-    crate://crates.io/regex/1.5.4 \
-    crate://crates.io/regex-syntax/0.6.25 \
+    crate://crates.io/rand_core/0.6.4 \
+    crate://crates.io/redox_syscall/0.2.16 \
+    crate://crates.io/regex/1.7.0 \
+    crate://crates.io/regex-syntax/0.6.28 \
     crate://crates.io/remove_dir_all/0.5.3 \
+    crate://crates.io/rustix/0.36.5 \
     crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/serde/1.0.133 \
-    crate://crates.io/serde_derive/1.0.133 \
-    crate://crates.io/sha2/0.9.9 \
-    crate://crates.io/simplelog/0.11.1 \
+    crate://crates.io/serde/1.0.151 \
+    crate://crates.io/serde_derive/1.0.151 \
+    crate://crates.io/sha2/0.10.6 \
+    crate://crates.io/signal-hook/0.3.14 \
+    crate://crates.io/signal-hook-registry/1.4.0 \
+    crate://crates.io/simplelog/0.12.0 \
     crate://crates.io/spmc/0.3.0 \
+    crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/subtle/2.4.1 \
-    crate://crates.io/syn/1.0.85 \
+    crate://crates.io/syn/1.0.107 \
     crate://crates.io/tempfile/3.3.0 \
-    crate://crates.io/termcolor/1.1.2 \
-    crate://crates.io/thiserror/1.0.30 \
-    crate://crates.io/thiserror-impl/1.0.30 \
+    crate://crates.io/termcolor/1.1.3 \
+    crate://crates.io/thiserror/1.0.38 \
+    crate://crates.io/thiserror-impl/1.0.38 \
     crate://crates.io/threadpool/1.8.1 \
-    crate://crates.io/time/0.1.44 \
-    crate://crates.io/typenum/1.15.0 \
-    crate://crates.io/unicode-xid/0.2.2 \
-    crate://crates.io/urlencoding/2.1.0 \
+    crate://crates.io/time/0.3.17 \
+    crate://crates.io/time-core/0.1.0 \
+    crate://crates.io/time-macros/0.2.6 \
+    crate://crates.io/typenum/1.16.0 \
+    crate://crates.io/unicode-ident/1.0.6 \
+    crate://crates.io/urlencoding/2.1.2 \
     crate://crates.io/uuid/0.8.2 \
     crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-util/0.1.5 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-sys/0.42.0 \
+    crate://crates.io/windows_aarch64_gnullvm/0.42.0 \
+    crate://crates.io/windows_aarch64_msvc/0.42.0 \
+    crate://crates.io/windows_i686_gnu/0.42.0 \
+    crate://crates.io/windows_i686_msvc/0.42.0 \
+    crate://crates.io/windows_x86_64_gnu/0.42.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.42.0 \
+    crate://crates.io/windows_x86_64_msvc/0.42.0 \
 "
 
-SRC_URI[aho-corasick-0.7.18.sha256sum] = "1e37cfd5e7657ada45f742d6e99ca5788580b5c529dc78faf11ece6dc702656f"
-SRC_URI[atty-0.2.14.sha256sum] = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
-SRC_URI[autocfg-1.0.1.sha256sum] = "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a"
+SRC_URI[aho-corasick-0.7.20.sha256sum] = "cc936419f96fa211c1b9166887b38e5e40b19958e5b895be7c1f93adec7071ac"
+SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[block-buffer-0.9.0.sha256sum] = "4152116fd6e9dadb291ae18fc1ec3575ed6d84c29642d97890f4b4a3417297e4"
-SRC_URI[cc-1.0.72.sha256sum] = "22a9137b95ea06864e018375b72adfb7db6e6f68cfc8df5a04d00288050485ee"
+SRC_URI[block-buffer-0.10.3.sha256sum] = "69cce20737498f97b993470a6e536b8523f0af7892a4f928cceb1ac5e52ebe7e"
+SRC_URI[cc-1.0.78.sha256sum] = "a20104e2335ce8a659d6dd92a51a767a0c062599c73b343fd152cb401e828c3d"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[chrono-0.4.19.sha256sum] = "670ad68c9088c2a963aaa298cb369688cf3f9465ce5e2d4ca10e6e0098a1ce73"
-SRC_URI[cpufeatures-0.2.1.sha256sum] = "95059428f66df56b63431fdb4e1947ed2190586af5c5a8a8b71122bdf5a7f469"
-SRC_URI[cpython-0.7.0.sha256sum] = "b7d46ba8ace7f3a1d204ac5060a706d0a68de6b42eafb6a586cc08bebcffe664"
-SRC_URI[crossbeam-0.8.1.sha256sum] = "4ae5588f6b3c3cb05239e90bd110f257254aecd01e4635400391aeae07497845"
-SRC_URI[crossbeam-channel-0.5.2.sha256sum] = "e54ea8bc3fb1ee042f5aace6e3c6e025d3874866da222930f70ce62aceba0bfa"
-SRC_URI[crossbeam-deque-0.8.1.sha256sum] = "6455c0ca19f0d2fbf751b908d5c55c1f5cbc65e03c4225427254b46890bdde1e"
-SRC_URI[crossbeam-epoch-0.9.6.sha256sum] = "97242a70df9b89a65d0b6df3c4bf5b9ce03c5b7309019777fbde37e7537f8762"
-SRC_URI[crossbeam-queue-0.3.3.sha256sum] = "b979d76c9fcb84dffc80a73f7290da0f83e4c95773494674cb44b76d13a7a110"
-SRC_URI[crossbeam-utils-0.8.6.sha256sum] = "cfcae03edb34f947e64acdb1c33ec169824e20657e9ecb61cef6c8c74dcb8120"
-SRC_URI[crypto-mac-0.11.1.sha256sum] = "b1d1a86f49236c215f271d40892d5fc950490551400b02ef360692c29815c714"
-SRC_URI[ctrlc-3.2.1.sha256sum] = "a19c6cedffdc8c03a3346d723eb20bd85a13362bb96dc2ac000842c6381ec7bf"
-SRC_URI[digest-0.9.0.sha256sum] = "d3dd60d1080a57a05ab032377049e0591415d2b31afd7028356dbf3cc6dcb066"
+SRC_URI[cpufeatures-0.2.5.sha256sum] = "28d997bd5e24a5928dd43e46dc529867e207907fe0b239c3477d924f7f2ca320"
+SRC_URI[cpython-0.7.1.sha256sum] = "3052106c29da7390237bc2310c1928335733b286287754ea85e6093d2495280e"
+SRC_URI[crossbeam-0.8.2.sha256sum] = "2801af0d36612ae591caa9568261fddce32ce6e08a7275ea334a06a4ad021a2c"
+SRC_URI[crossbeam-channel-0.5.6.sha256sum] = "c2dd04ddaf88237dc3b8d8f9a3c1004b506b54b3313403944054d23c0870c521"
+SRC_URI[crossbeam-deque-0.8.2.sha256sum] = "715e8152b692bba2d374b53d4875445368fdf21a94751410af607a5ac677d1fc"
+SRC_URI[crossbeam-epoch-0.9.13.sha256sum] = "01a9af1f4c2ef74bb8aa1f7e19706bc72d03598c8a570bb5de72243c7a9d9d5a"
+SRC_URI[crossbeam-queue-0.3.8.sha256sum] = "d1cfb3ea8a53f37c40dea2c7bedcbd88bdfae54f5e2175d6ecaff1c988353add"
+SRC_URI[crossbeam-utils-0.8.14.sha256sum] = "4fb766fa798726286dbbb842f174001dab8abc7b627a1dd86e0b7222a95d929f"
+SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
+SRC_URI[digest-0.10.6.sha256sum] = "8168378f4e5023e7218c89c891c0fd8ecdb5e5e4f18cb78f38cf245dd021e76f"
 SRC_URI[encoding-0.2.33.sha256sum] = "6b0d943856b990d12d3b55b359144ff341533e516d94098b1d3fc1ac666d36ec"
 SRC_URI[encoding-index-japanese-1.20141219.5.sha256sum] = "04e8b2ff42e9a05335dbf8b5c6f7567e5591d0d916ccef4e0b1710d32a0d0c91"
 SRC_URI[encoding-index-korean-1.20141219.5.sha256sum] = "4dc33fb8e6bcba213fe2f14275f0963fd16f0a02c878e3095ecfdf5bee529d81"
@@ -119,66 +132,85 @@ SRC_URI[encoding-index-simpchinese-1.20141219.5.sha256sum] = "d87a7194909b9118fc
 SRC_URI[encoding-index-singlebyte-1.20141219.5.sha256sum] = "3351d5acffb224af9ca265f435b859c7c01537c0849754d3db3fdf2bfe2ae84a"
 SRC_URI[encoding-index-tradchinese-1.20141219.5.sha256sum] = "fd0e20d5688ce3cab59eb3ef3a2083a5c77bf496cb798dc6fcdb75f323890c18"
 SRC_URI[encoding_index_tests-0.1.4.sha256sum] = "a246d82be1c9d791c5dfde9a2bd045fc3cbba3fa2b11ad558f27d01712f00569"
-SRC_URI[env_logger-0.9.0.sha256sum] = "0b2cf0344971ee6c64c31be0d530793fba457d322dfec2810c453d0ef228f9c3"
+SRC_URI[env_logger-0.10.0.sha256sum] = "85cdab6a89accf66733ad5a1693a4dcced6aeff64602b634530dd73c1f3ee9f0"
 SRC_URI[errno-0.2.8.sha256sum] = "f639046355ee4f37944e44f60642c6f3a7efa3cf6b78c78a0d989a8ce6c396a1"
 SRC_URI[errno-dragonfly-0.1.2.sha256sum] = "aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf"
-SRC_URI[fastrand-1.6.0.sha256sum] = "779d043b6a0b90cc4c0ed7ee380a6504394cee7efd7db050e3774eee387324b2"
-SRC_URI[generic-array-0.14.5.sha256sum] = "fd48d33ec7f05fbfa152300fdad764757cbded343c1aa1cff2fbaf4134851803"
-SRC_URI[getrandom-0.2.3.sha256sum] = "7fcd999463524c52659517fe2cea98493cfe485d10565e7b0fb07dbba7ad2753"
+SRC_URI[fastrand-1.8.0.sha256sum] = "a7a407cfaa3385c4ae6b23e84623d48c2798d06e3e6a1878f7f59f17b3f86499"
+SRC_URI[generic-array-0.14.6.sha256sum] = "bff49e947297f3312447abdca79f45f4738097cc82b06e72054d2223f601f1b9"
+SRC_URI[getrandom-0.2.8.sha256sum] = "c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31"
 SRC_URI[hermit-abi-0.1.19.sha256sum] = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
-SRC_URI[hmac-0.11.0.sha256sum] = "2a2a2320eb7ec0ebe8da8f744d7812d9fc4cb4d09344ac01898dbcb6a20ae69b"
-SRC_URI[httparse-1.5.1.sha256sum] = "acd94fdbe1d4ff688b67b04eee2e17bd50995534a61539e45adfefb45e5e5503"
+SRC_URI[hermit-abi-0.2.6.sha256sum] = "ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601ef3e3f47d1ae4c7"
+SRC_URI[hmac-0.12.1.sha256sum] = "6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e"
+SRC_URI[httparse-1.8.0.sha256sum] = "d897f394bad6a705d5f4104762e116a75639e470d80901eed05a860a95cb1904"
 SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
 SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
-SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
-SRC_URI[libc-0.2.112.sha256sum] = "1b03d17f364a3a042d5e5d46b053bbbf82c92c9430c592dd4c064dc6ee997125"
-SRC_URI[libsystemd-0.4.1.sha256sum] = "6f4f0b5b062ba67aa075e331de778082c09e66b5ef32970ea5a1e9c37c9555d1"
-SRC_URI[log-0.4.14.sha256sum] = "51b9bbe6c47d51fc3e1a9b945965946b4c44142ab8792c50835a980d362c2710"
-SRC_URI[memchr-2.4.1.sha256sum] = "308cc39be01b73d0d18f82a0e7b2a3df85245f84af96fdddc5d202d27e47b86a"
+SRC_URI[io-lifetimes-1.0.3.sha256sum] = "46112a93252b123d31a119a8d1a1ac19deac4fac6e0e8b0df58f0d4e5870e63c"
+SRC_URI[is-terminal-0.4.1.sha256sum] = "927609f78c2913a6f6ac3c27a4fe87f43e2a35367c0c4b0f8265e8f49a104330"
+SRC_URI[itoa-1.0.5.sha256sum] = "fad582f4b9e86b6caa621cabeb0963332d92eea04729ab12892c2533951e6440"
+SRC_URI[libc-0.2.138.sha256sum] = "db6d7e329c562c5dfab7a46a2afabc8b987ab9a4834c9d1ca04dc54c1546cef8"
+SRC_URI[libsystemd-0.5.0.sha256sum] = "8144587c71c16756b1055d3dcb0c75cb605a10ecd6523cc33702d5f90902bf6d"
+SRC_URI[linux-raw-sys-0.1.4.sha256sum] = "f051f77a7c8e6957c0696eac88f26b0117e54f52d3fc682ab19397a8812846a4"
+SRC_URI[log-0.4.17.sha256sum] = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"
+SRC_URI[memchr-2.5.0.sha256sum] = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
 SRC_URI[memoffset-0.6.5.sha256sum] = "5aa361d4faea93603064a027415f07bd8e1d5c88c9fbf68bf56a285428fd79ce"
-SRC_URI[mio-0.8.0.sha256sum] = "ba272f85fa0b41fc91872be579b3bbe0f56b792aa361a380eb669469f68dafb2"
-SRC_URI[miow-0.3.7.sha256sum] = "b9f1c5b025cda876f66ef43a113f91ebc9f4ccef34843000e0adf6ebbab84e21"
-SRC_URI[nix-0.23.1.sha256sum] = "9f866317acbd3a240710c63f065ffb1e4fd466259045ccb504130b7f668f35c6"
-SRC_URI[ntapi-0.3.6.sha256sum] = "3f6bb902e437b6d86e03cce10a7e2af662292c5dfef23b65899ea3ac9354ad44"
-SRC_URI[num-integer-0.1.44.sha256sum] = "d2cc698a63b549a70bc047073d2949cce27cd1c7b0a4a862d08a8031bc2801db"
-SRC_URI[num-traits-0.2.14.sha256sum] = "9a64b1ec5cda2586e284722486d802acf1f7dbdc623e2bfc57e65ca1cd099290"
-SRC_URI[num_cpus-1.13.1.sha256sum] = "19e64526ebdee182341572e50e9ad03965aa510cd94427a4549448f285e957a1"
-SRC_URI[once_cell-1.9.0.sha256sum] = "da32515d9f6e6e489d7bc9d84c71b060db7247dc035bbe44eac88cf87486d8d5"
-SRC_URI[opaque-debug-0.3.0.sha256sum] = "624a8340c38c1b80fd549087862da4ba43e08858af025b236e509b6649fc13d5"
-SRC_URI[paste-1.0.6.sha256sum] = "0744126afe1a6dd7f394cb50a716dbe086cb06e255e53d8d0185d82828358fb5"
-SRC_URI[ppv-lite86-0.2.16.sha256sum] = "eb9f9e6e233e5c4a35559a617bf40a4ec447db2e84c20b55a6f83167b7e57872"
-SRC_URI[proc-macro2-1.0.36.sha256sum] = "c7342d5883fbccae1cc37a2353b09c87c9b0f3afd73f5fb9bba687a1f733b029"
-SRC_URI[python3-sys-0.7.0.sha256sum] = "b18b32e64c103d5045f44644d7ddddd65336f7a0521f6fde673240a9ecceb77e"
-SRC_URI[quote-1.0.14.sha256sum] = "47aa80447ce4daf1717500037052af176af5d38cc3e571d9ec1c7353fc10c87d"
-SRC_URI[rand-0.8.4.sha256sum] = "2e7573632e6454cf6b99d7aac4ccca54be06da05aca2ef7423d22d27d4d4bcd8"
+SRC_URI[memoffset-0.7.1.sha256sum] = "5de893c32cde5f383baa4c04c5d6dbdd735cfd4a794b0debdb2bb1b421da5ff4"
+SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
+SRC_URI[mio-0.8.5.sha256sum] = "e5d732bc30207a6423068df043e3d02e0735b155ad7ce1a6f76fe2baa5b158de"
+SRC_URI[nix-0.23.2.sha256sum] = "8f3790c00a0150112de0f4cd161e3d7fc4b2d8a5542ffc35f099a2562aecb35c"
+SRC_URI[nix-0.26.1.sha256sum] = "46a58d1d356c6597d08cde02c2f09d785b09e28711837b1ed667dc652c08a694"
+SRC_URI[nom-7.1.1.sha256sum] = "a8903e5a29a317527874d0402f867152a3d21c908bb0b933e416c65e301d4c36"
+SRC_URI[num-traits-0.2.15.sha256sum] = "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd"
+SRC_URI[num_cpus-1.14.0.sha256sum] = "f6058e64324c71e02bc2b150e4f3bc8286db6c83092132ffa3f6b1eab0f9def5"
+SRC_URI[num_threads-0.1.6.sha256sum] = "2819ce041d2ee131036f4fc9d6ae7ae125a3a40e97ba64d04fe799ad9dabbb44"
+SRC_URI[once_cell-1.16.0.sha256sum] = "86f0b0d4bf799edbc74508c1e8bf170ff5f41238e5f8225603ca7caaae2b7860"
+SRC_URI[paste-1.0.11.sha256sum] = "d01a5bd0424d00070b0098dd17ebca6f961a959dead1dbcbbbc1d1cd8d3deeba"
+SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
+SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
+SRC_URI[proc-macro2-1.0.49.sha256sum] = "57a8eca9f9c4ffde41714334dee777596264c7825420f521abc92b5b5deb63a5"
+SRC_URI[python3-sys-0.7.1.sha256sum] = "49f8b50d72fb3015735aa403eebf19bbd72c093bfeeae24ee798be5f2f1aab52"
+SRC_URI[quote-1.0.23.sha256sum] = "8856d8364d252a14d474036ea1358d63c9e6965c8e5c1885c18f73d70bff9c7b"
+SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
-SRC_URI[rand_core-0.6.3.sha256sum] = "d34f1408f55294453790c48b2f1ebbb1c5b4b7563eb1f418bcfcfdbb06ebb4e7"
-SRC_URI[rand_hc-0.3.1.sha256sum] = "d51e9f596de227fda2ea6c84607f5558e196eeaf43c986b724ba4fb8fdf497e7"
-SRC_URI[redox_syscall-0.2.10.sha256sum] = "8383f39639269cde97d255a32bdb68c047337295414940c68bdd30c2e13203ff"
-SRC_URI[regex-1.5.4.sha256sum] = "d07a8629359eb56f1e2fb1652bb04212c072a87ba68546a04065d525673ac461"
-SRC_URI[regex-syntax-0.6.25.sha256sum] = "f497285884f3fcff424ffc933e56d7cbca511def0c9831a7f9b5f6153e3cc89b"
+SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
+SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
+SRC_URI[regex-1.7.0.sha256sum] = "e076559ef8e241f2ae3479e36f97bd5741c0330689e217ad51ce2c76808b868a"
+SRC_URI[regex-syntax-0.6.28.sha256sum] = "456c603be3e8d448b072f410900c09faf164fbce2d480456f50eea6e25f9c848"
 SRC_URI[remove_dir_all-0.5.3.sha256sum] = "3acd125665422973a33ac9d3dd2df85edad0f4ae9b00dafb1a05e43a9f5ef8e7"
+SRC_URI[rustix-0.36.5.sha256sum] = "a3807b5d10909833d3e9acd1eb5fb988f79376ff10fce42937de71a449c4c588"
 SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[serde-1.0.133.sha256sum] = "97565067517b60e2d1ea8b268e59ce036de907ac523ad83a0475da04e818989a"
-SRC_URI[serde_derive-1.0.133.sha256sum] = "ed201699328568d8d08208fdd080e3ff594e6c422e438b6705905da01005d537"
-SRC_URI[sha2-0.9.9.sha256sum] = "4d58a1e1bf39749807d89cf2d98ac2dfa0ff1cb3faa38fbb64dd88ac8013d800"
-SRC_URI[simplelog-0.11.1.sha256sum] = "ecabc0118918611790b8615670ab79296272cbe09496b6884b02b1e929c20886"
+SRC_URI[serde-1.0.151.sha256sum] = "97fed41fc1a24994d044e6db6935e69511a1153b52c15eb42493b26fa87feba0"
+SRC_URI[serde_derive-1.0.151.sha256sum] = "255abe9a125a985c05190d687b320c12f9b1f0b99445e608c21ba0782c719ad8"
+SRC_URI[sha2-0.10.6.sha256sum] = "82e6b795fe2e3b1e845bafcb27aa35405c4d47cdfc92af5fc8d3002f76cebdc0"
+SRC_URI[signal-hook-0.3.14.sha256sum] = "a253b5e89e2698464fc26b545c9edceb338e18a89effeeecfea192c3025be29d"
+SRC_URI[signal-hook-registry-1.4.0.sha256sum] = "e51e73328dc4ac0c7ccbda3a494dfa03df1de2f46018127f60c693f2648455b0"
+SRC_URI[simplelog-0.12.0.sha256sum] = "48dfff04aade74dd495b007c831cd6f4e0cee19c344dd9dc0884c0289b70a786"
 SRC_URI[spmc-0.3.0.sha256sum] = "02a8428da277a8e3a15271d79943e80ccc2ef254e78813a166a08d65e4c3ece5"
+SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[subtle-2.4.1.sha256sum] = "6bdef32e8150c2a081110b42772ffe7d7c9032b606bc226c8260fd97e0976601"
-SRC_URI[syn-1.0.85.sha256sum] = "a684ac3dcd8913827e18cd09a68384ee66c1de24157e3c556c9ab16d85695fb7"
+SRC_URI[syn-1.0.107.sha256sum] = "1f4064b5b16e03ae50984a5a8ed5d4f8803e6bc1fd170a3cda91a1be4b18e3f5"
 SRC_URI[tempfile-3.3.0.sha256sum] = "5cdb1ef4eaeeaddc8fbd371e5017057064af0911902ef36b39801f67cc6d79e4"
-SRC_URI[termcolor-1.1.2.sha256sum] = "2dfed899f0eb03f32ee8c6a0aabdb8a7949659e3466561fc0adf54e26d88c5f4"
-SRC_URI[thiserror-1.0.30.sha256sum] = "854babe52e4df1653706b98fcfc05843010039b406875930a70e4d9644e5c417"
-SRC_URI[thiserror-impl-1.0.30.sha256sum] = "aa32fd3f627f367fe16f893e2597ae3c05020f8bba2666a4e6ea73d377e5714b"
+SRC_URI[termcolor-1.1.3.sha256sum] = "bab24d30b911b2376f3a13cc2cd443142f0c81dda04c118693e35b3835757755"
+SRC_URI[thiserror-1.0.38.sha256sum] = "6a9cd18aa97d5c45c6603caea1da6628790b37f7a34b6ca89522331c5180fed0"
+SRC_URI[thiserror-impl-1.0.38.sha256sum] = "1fb327af4685e4d03fa8cbcf1716380da910eeb2bb8be417e7f9fd3fb164f36f"
 SRC_URI[threadpool-1.8.1.sha256sum] = "d050e60b33d41c19108b32cea32164033a9013fe3b46cbd4457559bfbf77afaa"
-SRC_URI[time-0.1.44.sha256sum] = "6db9e6914ab8b1ae1c260a4ae7a49b6c5611b40328a735b21862567685e73255"
-SRC_URI[typenum-1.15.0.sha256sum] = "dcf81ac59edc17cc8697ff311e8f5ef2d99fcbd9817b34cec66f90b6c3dfd987"
-SRC_URI[unicode-xid-0.2.2.sha256sum] = "8ccb82d61f80a663efe1f787a51b16b5a51e3314d6ac365b08639f52387b33f3"
-SRC_URI[urlencoding-2.1.0.sha256sum] = "68b90931029ab9b034b300b797048cf23723400aa757e8a2bfb9d748102f9821"
+SRC_URI[time-0.3.17.sha256sum] = "a561bf4617eebd33bca6434b988f39ed798e527f51a1e797d0ee4f61c0a38376"
+SRC_URI[time-core-0.1.0.sha256sum] = "2e153e1f1acaef8acc537e68b44906d2db6436e2b35ac2c6b42640fff91f00fd"
+SRC_URI[time-macros-0.2.6.sha256sum] = "d967f99f534ca7e495c575c62638eebc2898a8c84c119b89e250477bc4ba16b2"
+SRC_URI[typenum-1.16.0.sha256sum] = "497961ef93d974e23eb6f433eb5fe1b7930b659f06d12dec6fc44a8f554c0bba"
+SRC_URI[unicode-ident-1.0.6.sha256sum] = "84a22b9f218b40614adcb3f4ff08b703773ad44fa9423e4e0d346d5db86e4ebc"
+SRC_URI[urlencoding-2.1.2.sha256sum] = "e8db7427f936968176eaa7cdf81b7f98b980b18495ec28f1b5791ac3bfe3eea9"
 SRC_URI[uuid-0.8.2.sha256sum] = "bc5cf98d8186244414c848017f0e2676b3fcb46807f6668a97dfe67359a3c4b7"
 SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
-SRC_URI[wasi-0.10.0+wasi-snapshot-preview1.sha256sum] = "1a143597ca7c7793eff794def352d41792a93c481eb1042423ff7ff72ba2c31f"
+SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 SRC_URI[winapi-util-0.1.5.sha256sum] = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-sys-0.42.0.sha256sum] = "5a3e1820f08b8513f676f7ab6c1f99ff312fb97b553d30ff4dd86f9f15728aa7"
+SRC_URI[windows_aarch64_gnullvm-0.42.0.sha256sum] = "41d2aa71f6f0cbe00ae5167d90ef3cfe66527d6f613ca78ac8024c3ccab9a19e"
+SRC_URI[windows_aarch64_msvc-0.42.0.sha256sum] = "dd0f252f5a35cac83d6311b2e795981f5ee6e67eb1f9a7f64eb4500fbc4dcdb4"
+SRC_URI[windows_i686_gnu-0.42.0.sha256sum] = "fbeae19f6716841636c28d695375df17562ca208b2b7d0dc47635a50ae6c5de7"
+SRC_URI[windows_i686_msvc-0.42.0.sha256sum] = "84c12f65daa39dd2babe6e442988fc329d6243fdce47d7d2d155b8d874862246"
+SRC_URI[windows_x86_64_gnu-0.42.0.sha256sum] = "bf7b1b21b5362cbc318f686150e5bcea75ecedc74dd157d874d754a2ca44b0ed"
+SRC_URI[windows_x86_64_gnullvm-0.42.0.sha256sum] = "09d525d2ba30eeb3297665bd434a54297e4170c7f1a44cad4ef58095b4cd2028"
+SRC_URI[windows_x86_64_msvc-0.42.0.sha256sum] = "f40009d85759725a34da6d89a94e63d7bdc50a862acf0dbc7c8e488f1edcb6f5"
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch
index f41e6cf116..3f8256b027 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch
+++ b/meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch
@@ -19,7 +19,9 @@ currently the build fails on mips archirecture with type mismatches
       296 |                 device: stat.st_dev,
           |                         ^^^^^^^^^^^ expected `u64`, found `u32`
 
-Upstream-Status: Submitted [https://github.com/lucab/libsystemd-rs/pull/103]
+Drop this patch when libsystemd-rs crate bumps to 0.6.0+
+
+Upstream-Status: Backport [https://github.com/lucab/libsystemd-rs/pull/104]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/logging.rs | 3 +++
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Define-O_LARGEFILE-for-riscv32.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Define-O_LARGEFILE-for-riscv32.patch
new file mode 100644
index 0000000000..621249c483
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Define-O_LARGEFILE-for-riscv32.patch
@@ -0,0 +1,21 @@
+From fdf98602ad20d06ebf65574541caac68ca421ac4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Apr 2023 09:19:53 -0700
+Subject: [PATCH] musl: Define O_LARGEFILE for riscv32
+
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/3191]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/unix/linux_like/linux/musl/b32/riscv32/mod.rs | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/src/unix/linux_like/linux/musl/b32/riscv32/mod.rs
++++ b/src/unix/linux_like/linux/musl/b32/riscv32/mod.rs
+@@ -370,6 +370,7 @@ pub const __SIZEOF_PTHREAD_CONDATTR_T: u
+ pub const __SIZEOF_PTHREAD_MUTEXATTR_T: usize = 4;
+ pub const O_DIRECT: ::c_int = 16384;
+ pub const O_DIRECTORY: ::c_int = 65536;
++pub const O_LARGEFILE: ::c_int = 0o0100000;
+ pub const O_NOFOLLOW: ::c_int = 131072;
+ pub const MAP_HUGETLB: ::c_int = 262144;
+ pub const MAP_LOCKED: ::c_int = 8192;
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch
new file mode 100644
index 0000000000..e19b50d30d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch
@@ -0,0 +1,99 @@
+From f2b06fa4ea6ec9a33f8b269f0a1730a26276c5b0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Apr 2023 08:25:46 -0700
+Subject: [PATCH] musl: Define SOCK_NONBLOCK with O_NONBLOCK
+
+Much like glibc, these defines are same on musl [1] [2]
+therefore consolidate the definition in one place
+for SOCK_NONBLOCK
+
+[1] https://github.com/search?q=repo%3Abminor%2Fmusl++%22%23define+SOCK_NONBLOCK%22&type=code
+[2] https://github.com/search?q=repo%3Abminor%2Fmusl++%22%23define+O_NONBLOCK%22&type=code
+
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/3191]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/unix/linux_like/linux/musl/b32/arm/mod.rs  | 2 --
+ src/unix/linux_like/linux/musl/b32/hexagon.rs  | 1 -
+ src/unix/linux_like/linux/musl/b32/mips/mod.rs | 2 --
+ src/unix/linux_like/linux/musl/b32/powerpc.rs  | 2 --
+ src/unix/linux_like/linux/musl/b32/x86/mod.rs  | 2 --
+ src/unix/linux_like/linux/musl/b64/mod.rs      | 2 --
+ src/unix/linux_like/linux/musl/mod.rs          | 1 +
+ 7 files changed, 1 insertion(+), 11 deletions(-)
+
+--- a/src/unix/linux_like/linux/musl/b32/arm/mod.rs
++++ b/src/unix/linux_like/linux/musl/b32/arm/mod.rs
+@@ -311,8 +311,6 @@ pub const O_SYNC: ::c_int = 1052672;
+ pub const O_RSYNC: ::c_int = 1052672;
+ pub const O_DSYNC: ::c_int = 4096;
+ 
+-pub const SOCK_NONBLOCK: ::c_int = 2048;
+-
+ pub const MAP_ANON: ::c_int = 0x0020;
+ pub const MAP_GROWSDOWN: ::c_int = 0x0100;
+ pub const MAP_DENYWRITE: ::c_int = 0x0800;
+--- a/src/unix/linux_like/linux/musl/b32/hexagon.rs
++++ b/src/unix/linux_like/linux/musl/b32/hexagon.rs
+@@ -295,7 +295,6 @@ pub const SIG_SETMASK: ::c_int = 2; // F
+ pub const SIG_BLOCK: ::c_int = 0x000000;
+ pub const SIG_UNBLOCK: ::c_int = 0x01;
+ pub const SOCK_DGRAM: ::c_int = 2;
+-pub const SOCK_NONBLOCK: ::c_int = 2048;
+ pub const SOCK_SEQPACKET: ::c_int = 5;
+ pub const SOCK_STREAM: ::c_int = 1;
+ pub const SOL_CAIF: ::c_int = 278;
+--- a/src/unix/linux_like/linux/musl/b32/mips/mod.rs
++++ b/src/unix/linux_like/linux/musl/b32/mips/mod.rs
+@@ -250,8 +250,6 @@ pub const O_SYNC: ::c_int = 0o40020;
+ pub const O_RSYNC: ::c_int = 0o40020;
+ pub const O_DSYNC: ::c_int = 0o020;
+ 
+-pub const SOCK_NONBLOCK: ::c_int = 0o200;
+-
+ pub const MAP_ANON: ::c_int = 0x800;
+ pub const MAP_GROWSDOWN: ::c_int = 0x1000;
+ pub const MAP_DENYWRITE: ::c_int = 0x2000;
+--- a/src/unix/linux_like/linux/musl/b32/powerpc.rs
++++ b/src/unix/linux_like/linux/musl/b32/powerpc.rs
+@@ -243,8 +243,6 @@ pub const O_SYNC: ::c_int = 1052672;
+ pub const O_RSYNC: ::c_int = 1052672;
+ pub const O_DSYNC: ::c_int = 4096;
+ 
+-pub const SOCK_NONBLOCK: ::c_int = 2048;
+-
+ pub const MAP_ANON: ::c_int = 0x0020;
+ pub const MAP_GROWSDOWN: ::c_int = 0x0100;
+ pub const MAP_DENYWRITE: ::c_int = 0x0800;
+--- a/src/unix/linux_like/linux/musl/b32/x86/mod.rs
++++ b/src/unix/linux_like/linux/musl/b32/x86/mod.rs
+@@ -300,8 +300,6 @@ pub const O_SYNC: ::c_int = 1052672;
+ pub const O_RSYNC: ::c_int = 1052672;
+ pub const O_DSYNC: ::c_int = 4096;
+ 
+-pub const SOCK_NONBLOCK: ::c_int = 2048;
+-
+ pub const MAP_ANON: ::c_int = 0x0020;
+ pub const MAP_GROWSDOWN: ::c_int = 0x0100;
+ pub const MAP_DENYWRITE: ::c_int = 0x0800;
+--- a/src/unix/linux_like/linux/musl/b64/mod.rs
++++ b/src/unix/linux_like/linux/musl/b64/mod.rs
+@@ -133,8 +133,6 @@ s! {
+ pub const __SIZEOF_PTHREAD_RWLOCK_T: usize = 56;
+ pub const __SIZEOF_PTHREAD_MUTEX_T: usize = 40;
+ 
+-pub const SOCK_NONBLOCK: ::c_int = 2048;
+-
+ pub const SOCK_SEQPACKET: ::c_int = 5;
+ 
+ extern "C" {
+--- a/src/unix/linux_like/linux/musl/mod.rs
++++ b/src/unix/linux_like/linux/musl/mod.rs
+@@ -527,6 +527,7 @@ pub const POSIX_MADV_DONTNEED: ::c_int =
+ pub const MAP_ANONYMOUS: ::c_int = MAP_ANON;
+ 
+ pub const SOCK_DCCP: ::c_int = 6;
++pub const SOCK_NONBLOCK: ::c_int = O_NONBLOCK;
+ pub const SOCK_PACKET: ::c_int = 10;
+ 
+ pub const SOMAXCONN: ::c_int = 128;
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch
new file mode 100644
index 0000000000..2da3a43154
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch
@@ -0,0 +1,92 @@
+From e00da82cd46221bfb650895c9cea65082da66b4e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Apr 2023 09:25:31 -0700
+Subject: [PATCH] musl: Define SOCK_SEQPACKET in common place
+
+This define is not architecture specific in musl [1]
+
+[1] https://git.musl-libc.org/cgit/musl/tree/include/sys/socket.h#n90
+
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/3191]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/unix/linux_like/linux/musl/b32/arm/mod.rs  | 1 -
+ src/unix/linux_like/linux/musl/b32/hexagon.rs  | 1 -
+ src/unix/linux_like/linux/musl/b32/mips/mod.rs | 1 -
+ src/unix/linux_like/linux/musl/b32/powerpc.rs  | 1 -
+ src/unix/linux_like/linux/musl/b32/x86/mod.rs  | 1 -
+ src/unix/linux_like/linux/musl/b64/mod.rs      | 2 --
+ src/unix/linux_like/linux/musl/mod.rs          | 1 +
+ 7 files changed, 1 insertion(+), 7 deletions(-)
+
+--- a/src/unix/linux_like/linux/musl/b32/arm/mod.rs
++++ b/src/unix/linux_like/linux/musl/b32/arm/mod.rs
+@@ -324,7 +324,6 @@ pub const MAP_SYNC: ::c_int = 0x080000;
+ 
+ pub const SOCK_STREAM: ::c_int = 1;
+ pub const SOCK_DGRAM: ::c_int = 2;
+-pub const SOCK_SEQPACKET: ::c_int = 5;
+ 
+ pub const EDEADLK: ::c_int = 35;
+ pub const ENAMETOOLONG: ::c_int = 36;
+--- a/src/unix/linux_like/linux/musl/b32/hexagon.rs
++++ b/src/unix/linux_like/linux/musl/b32/hexagon.rs
+@@ -292,7 +292,6 @@ pub const SIG_SETMASK: ::c_int = 2; // F
+ pub const SIG_BLOCK: ::c_int = 0x000000;
+ pub const SIG_UNBLOCK: ::c_int = 0x01;
+ pub const SOCK_DGRAM: ::c_int = 2;
+-pub const SOCK_SEQPACKET: ::c_int = 5;
+ pub const SOCK_STREAM: ::c_int = 1;
+ pub const SOL_CAIF: ::c_int = 278;
+ pub const SOL_IUCV: ::c_int = 277;
+--- a/src/unix/linux_like/linux/musl/b32/mips/mod.rs
++++ b/src/unix/linux_like/linux/musl/b32/mips/mod.rs
+@@ -348,7 +348,6 @@ pub const ERFKILL: ::c_int = 167;
+ 
+ pub const SOCK_STREAM: ::c_int = 2;
+ pub const SOCK_DGRAM: ::c_int = 1;
+-pub const SOCK_SEQPACKET: ::c_int = 5;
+ 
+ pub const SA_ONSTACK: ::c_int = 0x08000000;
+ pub const SA_SIGINFO: ::c_int = 8;
+--- a/src/unix/linux_like/linux/musl/b32/powerpc.rs
++++ b/src/unix/linux_like/linux/musl/b32/powerpc.rs
+@@ -255,7 +255,6 @@ pub const MAP_STACK: ::c_int = 0x020000;
+ 
+ pub const SOCK_STREAM: ::c_int = 1;
+ pub const SOCK_DGRAM: ::c_int = 2;
+-pub const SOCK_SEQPACKET: ::c_int = 5;
+ 
+ pub const EDEADLK: ::c_int = 35;
+ pub const ENAMETOOLONG: ::c_int = 36;
+--- a/src/unix/linux_like/linux/musl/b32/x86/mod.rs
++++ b/src/unix/linux_like/linux/musl/b32/x86/mod.rs
+@@ -313,7 +313,6 @@ pub const MAP_SYNC: ::c_int = 0x080000;
+ 
+ pub const SOCK_STREAM: ::c_int = 1;
+ pub const SOCK_DGRAM: ::c_int = 2;
+-pub const SOCK_SEQPACKET: ::c_int = 5;
+ 
+ pub const EDEADLK: ::c_int = 35;
+ pub const ENAMETOOLONG: ::c_int = 36;
+--- a/src/unix/linux_like/linux/musl/b64/mod.rs
++++ b/src/unix/linux_like/linux/musl/b64/mod.rs
+@@ -133,8 +133,6 @@ s! {
+ pub const __SIZEOF_PTHREAD_RWLOCK_T: usize = 56;
+ pub const __SIZEOF_PTHREAD_MUTEX_T: usize = 40;
+ 
+-pub const SOCK_SEQPACKET: ::c_int = 5;
+-
+ extern "C" {
+     pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_uint) -> ::ssize_t;
+ }
+--- a/src/unix/linux_like/linux/musl/mod.rs
++++ b/src/unix/linux_like/linux/musl/mod.rs
+@@ -530,6 +530,7 @@ pub const POSIX_MADV_DONTNEED: ::c_int =
+ 
+ pub const MAP_ANONYMOUS: ::c_int = MAP_ANON;
+ 
++pub const SOCK_SEQPACKET: ::c_int = 5;
+ pub const SOCK_DCCP: ::c_int = 6;
+ pub const SOCK_NONBLOCK: ::c_int = O_NONBLOCK;
+ pub const SOCK_PACKET: ::c_int = 10;
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Move-F_OFD_GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Move-F_OFD_GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch
new file mode 100644
index 0000000000..9c93434e03
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-Move-F_OFD_GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch
@@ -0,0 +1,140 @@
+From e4f6d7b6d57e83633814c54d93dff292ed0e4609 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Apr 2023 09:01:54 -0700
+Subject: [PATCH] musl: Move F_OFD_GETLK, F_OFD_SETLK and F_OFD_SETLKW to
+ common location
+
+These defines are not architecture specific in musl [1] therefore move them
+to be common
+
+[1] https://git.musl-libc.org/cgit/musl/tree/include/fcntl.h#n48
+
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/3191]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/unix/linux_like/linux/musl/b32/arm/mod.rs     | 3 ---
+ src/unix/linux_like/linux/musl/b32/hexagon.rs     | 3 ---
+ src/unix/linux_like/linux/musl/b32/mips/mod.rs    | 3 ---
+ src/unix/linux_like/linux/musl/b32/powerpc.rs     | 3 ---
+ src/unix/linux_like/linux/musl/b32/x86/mod.rs     | 3 ---
+ src/unix/linux_like/linux/musl/b64/aarch64/mod.rs | 3 ---
+ src/unix/linux_like/linux/musl/b64/mips64.rs      | 3 ---
+ src/unix/linux_like/linux/musl/mod.rs             | 4 ++++
+ 8 files changed, 4 insertions(+), 21 deletions(-)
+
+diff --git a/src/unix/linux_like/linux/musl/b32/arm/mod.rs b/src/unix/linux_like/linux/musl/b32/arm/mod.rs
+index c47fa2c4c..3c8978e4f 100644
+--- a/src/unix/linux_like/linux/musl/b32/arm/mod.rs
++++ b/src/unix/linux_like/linux/musl/b32/arm/mod.rs
+@@ -451,9 +451,6 @@ pub const F_GETOWN: ::c_int = 9;
+ pub const F_SETLK: ::c_int = 13;
+ pub const F_SETLKW: ::c_int = 14;
+ pub const F_SETOWN: ::c_int = 8;
+-pub const F_OFD_GETLK: ::c_int = 36;
+-pub const F_OFD_SETLK: ::c_int = 37;
+-pub const F_OFD_SETLKW: ::c_int = 38;
+ 
+ pub const VEOF: usize = 4;
+ pub const VEOL: usize = 11;
+diff --git a/src/unix/linux_like/linux/musl/b32/hexagon.rs b/src/unix/linux_like/linux/musl/b32/hexagon.rs
+index f83d208d5..720c603da 100644
+--- a/src/unix/linux_like/linux/musl/b32/hexagon.rs
++++ b/src/unix/linux_like/linux/musl/b32/hexagon.rs
+@@ -225,9 +225,6 @@ pub const F_GETOWN_EX: ::c_int = 16;
+ pub const F_GETSIG: ::c_int = 11;
+ pub const F_LINUX_SPECIFIC_BASE: ::c_int = 1024;
+ pub const FLUSHO: ::c_int = 4096;
+-pub const F_OFD_GETLK: ::c_int = 36;
+-pub const F_OFD_SETLK: ::c_int = 37;
+-pub const F_OFD_SETLKW: ::c_int = 38;
+ pub const F_OWNER_PGRP: ::c_int = 2;
+ pub const F_OWNER_PID: ::c_int = 1;
+ pub const F_OWNER_TID: ::c_int = 0;
+diff --git a/src/unix/linux_like/linux/musl/b32/mips/mod.rs b/src/unix/linux_like/linux/musl/b32/mips/mod.rs
+index d09b8278e..69e20ce32 100644
+--- a/src/unix/linux_like/linux/musl/b32/mips/mod.rs
++++ b/src/unix/linux_like/linux/musl/b32/mips/mod.rs
+@@ -388,9 +388,6 @@ pub const F_GETOWN: ::c_int = 23;
+ pub const F_SETLK: ::c_int = 34;
+ pub const F_SETLKW: ::c_int = 35;
+ pub const F_SETOWN: ::c_int = 24;
+-pub const F_OFD_GETLK: ::c_int = 36;
+-pub const F_OFD_SETLK: ::c_int = 37;
+-pub const F_OFD_SETLKW: ::c_int = 38;
+ 
+ pub const VEOF: usize = 16;
+ pub const VEOL: usize = 17;
+diff --git a/src/unix/linux_like/linux/musl/b32/powerpc.rs b/src/unix/linux_like/linux/musl/b32/powerpc.rs
+index 3b998329b..63bc9163d 100644
+--- a/src/unix/linux_like/linux/musl/b32/powerpc.rs
++++ b/src/unix/linux_like/linux/musl/b32/powerpc.rs
+@@ -384,9 +384,6 @@ pub const F_GETOWN: ::c_int = 9;
+ pub const F_SETLK: ::c_int = 13;
+ pub const F_SETLKW: ::c_int = 14;
+ pub const F_SETOWN: ::c_int = 8;
+-pub const F_OFD_GETLK: ::c_int = 36;
+-pub const F_OFD_SETLK: ::c_int = 37;
+-pub const F_OFD_SETLKW: ::c_int = 38;
+ 
+ pub const VEOF: usize = 4;
+ pub const VEOL: usize = 6;
+diff --git a/src/unix/linux_like/linux/musl/b32/x86/mod.rs b/src/unix/linux_like/linux/musl/b32/x86/mod.rs
+index c319b91b6..52ecf3c7e 100644
+--- a/src/unix/linux_like/linux/musl/b32/x86/mod.rs
++++ b/src/unix/linux_like/linux/musl/b32/x86/mod.rs
+@@ -441,9 +441,6 @@ pub const F_GETOWN: ::c_int = 9;
+ pub const F_SETLK: ::c_int = 13;
+ pub const F_SETLKW: ::c_int = 14;
+ pub const F_SETOWN: ::c_int = 8;
+-pub const F_OFD_GETLK: ::c_int = 36;
+-pub const F_OFD_SETLK: ::c_int = 37;
+-pub const F_OFD_SETLKW: ::c_int = 38;
+ 
+ pub const VEOF: usize = 4;
+ pub const VEOL: usize = 11;
+diff --git a/src/unix/linux_like/linux/musl/b64/aarch64/mod.rs b/src/unix/linux_like/linux/musl/b64/aarch64/mod.rs
+index 14b4bc6d6..522493ff3 100644
+--- a/src/unix/linux_like/linux/musl/b64/aarch64/mod.rs
++++ b/src/unix/linux_like/linux/musl/b64/aarch64/mod.rs
+@@ -250,9 +250,6 @@ pub const F_GETOWN: ::c_int = 9;
+ pub const F_SETLK: ::c_int = 6;
+ pub const F_SETLKW: ::c_int = 7;
+ pub const F_SETOWN: ::c_int = 8;
+-pub const F_OFD_GETLK: ::c_int = 36;
+-pub const F_OFD_SETLK: ::c_int = 37;
+-pub const F_OFD_SETLKW: ::c_int = 38;
+ 
+ pub const VEOF: usize = 4;
+ 
+diff --git a/src/unix/linux_like/linux/musl/b64/mips64.rs b/src/unix/linux_like/linux/musl/b64/mips64.rs
+index 22ac91690..c7f041260 100644
+--- a/src/unix/linux_like/linux/musl/b64/mips64.rs
++++ b/src/unix/linux_like/linux/musl/b64/mips64.rs
+@@ -612,9 +612,6 @@ pub const F_GETOWN: ::c_int = 23;
+ pub const F_SETOWN: ::c_int = 24;
+ pub const F_SETLK: ::c_int = 6;
+ pub const F_SETLKW: ::c_int = 7;
+-pub const F_OFD_GETLK: ::c_int = 36;
+-pub const F_OFD_SETLK: ::c_int = 37;
+-pub const F_OFD_SETLKW: ::c_int = 38;
+ 
+ pub const MCL_CURRENT: ::c_int = 0x0001;
+ pub const MCL_FUTURE: ::c_int = 0x0002;
+diff --git a/src/unix/linux_like/linux/musl/mod.rs b/src/unix/linux_like/linux/musl/mod.rs
+index 37a8ca2af..9a4fa7ca7 100644
+--- a/src/unix/linux_like/linux/musl/mod.rs
++++ b/src/unix/linux_like/linux/musl/mod.rs
+@@ -506,6 +506,10 @@ pub const ECOMM: ::c_int = 70;
+ pub const EPROTO: ::c_int = 71;
+ pub const EDOTDOT: ::c_int = 73;
+ 
++pub const F_OFD_GETLK: ::c_int = 36;
++pub const F_OFD_SETLK: ::c_int = 37;
++pub const F_OFD_SETLKW: ::c_int = 38;
++
+ pub const F_RDLCK: ::c_int = 0;
+ pub const F_WRLCK: ::c_int = 1;
+ pub const F_UNLCK: ::c_int = 2;
+-- 
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-riscv32-Define-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-riscv32-Define-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch
new file mode 100644
index 0000000000..47969542c8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyruvate/0001-musl-riscv32-Define-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch
@@ -0,0 +1,35 @@
+From b87552c504b53a5e5df2438adfe24e35b0168aba Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Apr 2023 08:51:02 -0700
+Subject: [PATCH] musl/riscv32: Define F_SETLK, F_SETLKW and fix F_GETLK
+
+F_SETLK and F_SETLKW were not defined therefore define them
+and F_GETLK value was not matching the musl port hence fixed
+
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/3191]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/unix/linux_like/linux/musl/b32/riscv32/mod.rs | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/unix/linux_like/linux/musl/b32/riscv32/mod.rs b/src/unix/linux_like/linux/musl/b32/riscv32/mod.rs
+index 9ce6a9fd3..e56ff4853 100644
+--- a/src/unix/linux_like/linux/musl/b32/riscv32/mod.rs
++++ b/src/unix/linux_like/linux/musl/b32/riscv32/mod.rs
+@@ -339,9 +339,11 @@ pub const POLLWRBAND: ::c_short = 512;
+ pub const O_ASYNC: ::c_int = 8192;
+ pub const O_NDELAY: ::c_int = 2048;
+ pub const EFD_NONBLOCK: ::c_int = 2048;
+-pub const F_GETLK: ::c_int = 5;
+-pub const F_GETOWN: ::c_int = 9;
+ pub const F_SETOWN: ::c_int = 8;
++pub const F_GETOWN: ::c_int = 9;
++pub const F_GETLK: ::c_int = 12;
++pub const F_SETLK: ::c_int = 13;
++pub const F_SETLKW: ::c_int = 14;
+ pub const SFD_NONBLOCK: ::c_int = 2048;
+ pub const TCSANOW: ::c_int = 0;
+ pub const TCSADRAIN: ::c_int = 1;
+-- 
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
index db9a4cd511..7a96635144 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
@@ -5,17 +5,20 @@ HOMEPAGE = "https://gitlab.com/tschorr/pyruvate"
 BUGTRACKER = "https://gitlab.com/tschorr/pyruvate/-/issues"
 
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=051b48e640a6e2d795eac75542d9417c \
-                    file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI += "\
     git://gitlab.com/tschorr/pyruvate.git;protocol=https;branch=main \
-    file://0001-linux.rs-Define-consts-for-rv32-architecture.patch;patchdir=../cargo_home/bitbake/nix-0.23.1/ \
+    file://0001-linux.rs-Define-consts-for-rv32-architecture.patch;patchdir=../cargo_home/bitbake/nix-0.23.2/ \
+    file://0001-musl-Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch;patchdir=../cargo_home/bitbake/libc-0.2.138/ \
+    file://0001-musl-riscv32-Define-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch;patchdir=../cargo_home/bitbake/libc-0.2.138/ \
+    file://0001-musl-Move-F_OFD_GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch;patchdir=../cargo_home/bitbake/libc-0.2.138/ \
+    file://0001-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=../cargo_home/bitbake/libc-0.2.138/ \
+    file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=../cargo_home/bitbake/libc-0.2.138/ \
 "
-SRC_URI[sha256sum] = "10befedd97e73fc18b902d02aa3b24e8978aa162242c1b664849c886c0675899"
-SRCREV = "fcbe49cc1a06290e28a211022df759605bce980d"
+SRCREV = "57db64c9f65ced05c71b8d786c1cedfaa2991597"
 
-SRC_URI:append:mips = " file://0001-check-for-mips-targets-for-stat.st_dev-definitions.patch;patchdir=../cargo_home/bitbake/libsystemd-0.4.1/"
+SRC_URI:append:mips = " file://0001-check-for-mips-targets-for-stat.st_dev-definitions.patch;patchdir=../cargo_home/bitbake/libsystemd-0.5.0/"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


