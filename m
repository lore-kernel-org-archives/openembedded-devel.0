Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FBFC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 14:55:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.52622.1739199335106628146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 06:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=HmLb+tCy;
 spf=pass (domain: snapchat.com, ip: 209.85.128.53, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43937cf2131so11445885e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 06:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1739199333; x=1739804133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTsIMehrrK3G0uv46Ulsmrtq9b4CB6C7rRt+Pky7TrM=;
        b=HmLb+tCyQLynwB+q/FjQjDaIdTCxs7cQr6RuE39cQ4J4mOzaf8UqcC9HAOgNcs7du+
         OSHOu5hM48hycwNo54PnK+kgA3V3JrCFf2yPvrGVx51PuJ3mijK4p0+QWyrqmgFNNt5U
         H0U8usa3RTJgl5Lf4bd25RYHZIBeQ4qUt9fk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199333; x=1739804133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTsIMehrrK3G0uv46Ulsmrtq9b4CB6C7rRt+Pky7TrM=;
        b=rz/gKLLcqFakaCjgiAnYIsVIJ4ZSG2fWN5s233AtU89POyxeiSymYHA30a4MuHubux
         Qdk1op7W6G2kG9fGZ2gcfoXj8saYlwGNO8j4hMgE1V4BJMo2dWBshIaysH8P8xCbjNMN
         9Fz2YHb1fl1jV+c8tFmr81jhEL4sG/+LGbdP96SdjKsT20bKclXnC1rQSepiKtvTNzLT
         LRpWpyEru7fskOTWak/rc37oV4gQqKNVyNgJyO2hAu/f6T/sZuFZhMPpMTJsbXCw51f7
         cKvgcsG0Y2wAKuJ470j1+QrSkDLsI+4qJ0gMn2l/ZwGzKjM/shgsGC10ycL0hlmft3TR
         rRIA==
X-Gm-Message-State: AOJu0Ywh8tFozANlVrDYiMRF8LqHyVyIUC8Cdyo4grMhgBwCYvQw5gjI
	ie5yBSv9tN10WgNT2qyIAdhYUJQGw5vKwAziqhQDKYeAwrxxiJy8dTby/8gGo90udw7YufVP7+5
	G
X-Gm-Gg: ASbGnctt1ytp14frgQ6uL5yg9L2/rsiNY/ArxhY2lpwBMIy1kCzwYaamdJ3nAmFquAy
	9L2oDM3UGW4R/cDRfqpPMVcyFZ8nEU0370OHqmAHPF3GgBmr6DQRxtH8vLEQuG6alIXH+iUVjCi
	O2FwTfc6UosT2hII6voIAZb6YB0+U84QdwxKz88ZcHZdUlofC7fR/eNLImRKO2RDDpoYGA6/bUy
	RYqqz93F0n1BI77xa2U2pBk6zbPTGNQ0vitoz4LeK0Ms75MrEvRA5wSu98GhRV1gWsjAcl01awp
	JF1o24OEbYBPylgVvX73SsTv+5E=
X-Google-Smtp-Source: AGHT+IFv6ya5FX9LWEip7ms5CQMncrAVaaWHFNXqL53i4e1KTujl0Aa+9qj+T46G6wCvqir67cE44A==
X-Received: by 2002:a5d:598f:0:b0:38d:e250:d960 with SMTP id ffacd0b85a97d-38de250dc0emr1893000f8f.8.1739199332752;
        Mon, 10 Feb 2025 06:55:32 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4c8ca52sm6836753f8f.89.2025.02.10.06.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 06:55:32 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][scarthgap][PATCH] uutils-coreutils: fix compilation with selinux
Date: Mon, 10 Feb 2025 15:55:13 +0100
Message-ID: <20250210145513.1049195-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 14:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115404

From: Etienne Cordonnier <ecordonnier@snap.com>

- The scarthgap branch of poky contains Rust 1.75.
- uutils-coreutils 0.0.28 requires rust 1.77 when selinux is enabled, even though the project's README.md
  of release 0.0.28 mistakenly indicates 1.70 as MSRV.
This fixes the build of uutils-coreutils 0.0.28 when meta-selinux is included.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 ...t-to-selinux-sys-0.6.9-and-fts-sys-0.patch | 178 ++++++++++++++++++
 .../uutils-coreutils-crates.inc               |  20 +-
 .../uutils-coreutils_0.0.28.bb                |   3 +-
 3 files changed, 194 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-core/uutils-coreutils/files/0001-Cargo.lock-revert-to-selinux-sys-0.6.9-and-fts-sys-0.patch

diff --git a/meta-oe/recipes-core/uutils-coreutils/files/0001-Cargo.lock-revert-to-selinux-sys-0.6.9-and-fts-sys-0.patch b/meta-oe/recipes-core/uutils-coreutils/files/0001-Cargo.lock-revert-to-selinux-sys-0.6.9-and-fts-sys-0.patch
new file mode 100644
index 0000000000..d91c368891
--- /dev/null
+++ b/meta-oe/recipes-core/uutils-coreutils/files/0001-Cargo.lock-revert-to-selinux-sys-0.6.9-and-fts-sys-0.patch
@@ -0,0 +1,178 @@
+From 2b578f1c2eee4e3552300d672eceea0804118896 Mon Sep 17 00:00:00 2001
+From: Etienne Cordonnier <ecordonnier@snap.com>
+Date: Mon, 10 Feb 2025 14:43:54 +0100
+Subject: [PATCH] Cargo.lock: revert to selinux-sys 0.6.9 and fts-sys 0.2.9
+
+selinux-sys 0.6.12 and fts-sys 0.2.11 uses offset_of which requires Rust 1.77.
+selinux 0.6.9 and fts-sys 0.2.9 compile with Rust 1.70.
+
+This fixes the compilation of uutils-coreutils when meta-selinux is included.
+
+This reverts https://github.com/uutils/coreutils/commit/10d3e98eda9342cf8d5f56d5082e38096743eb80
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
+---
+ Cargo.lock | 61 ++++++++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 50 insertions(+), 11 deletions(-)
+
+diff --git a/Cargo.lock b/Cargo.lock
+index b59405071..5f7b420fc 100644
+--- a/Cargo.lock
++++ b/Cargo.lock
+@@ -167,14 +167,16 @@ dependencies = [
+ 
+ [[package]]
+ name = "bindgen"
+-version = "0.70.1"
++version = "0.69.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "f49d8fed880d473ea71efb9bf597651e77201bdd4893efe54c9e5d65ae04ce6f"
++checksum = "271383c67ccabffb7381723dea0672a673f292304fcb45c01cc648c7a8d58088"
+ dependencies = [
+  "bitflags 2.6.0",
+  "cexpr",
+  "clang-sys",
+- "itertools",
++ "itertools 0.12.1",
++ "lazy_static",
++ "lazycell",
+  "log",
+  "prettyplease",
+  "proc-macro2",
+@@ -183,6 +185,7 @@ dependencies = [
+  "rustc-hash",
+  "shlex",
+  "syn 2.0.86",
++ "which",
+ ]
+ 
+ [[package]]
+@@ -961,9 +964,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "fts-sys"
+-version = "0.2.11"
++version = "0.2.9"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "28ab6a6dfd9184fe8a5097924dea6e7648f499121b3e933bb8486a17f817122e"
++checksum = "4e184d5f593d19793f26afb6f9a58d25f0bc755c4e48890ffcba6db416153ebb"
+ dependencies = [
+  "bindgen",
+  "libc",
+@@ -1156,6 +1159,15 @@ version = "0.4.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "6fe2267d4ed49bc07b63801559be28c718ea06c4738b7a03c94df7386d2cde46"
+ 
++[[package]]
++name = "home"
++version = "0.5.9"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5"
++dependencies = [
++ "windows-sys 0.52.0",
++]
++
+ [[package]]
+ name = "hostname"
+ version = "0.4.0"
+@@ -1244,6 +1256,15 @@ dependencies = [
+  "windows-sys 0.48.0",
+ ]
+ 
++[[package]]
++name = "itertools"
++version = "0.12.1"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569"
++dependencies = [
++ "either",
++]
++
+ [[package]]
+ name = "itertools"
+ version = "0.13.0"
+@@ -1303,6 +1324,12 @@ version = "1.4.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
+ 
++[[package]]
++name = "lazycell"
++version = "1.3.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
++
+ [[package]]
+ name = "libc"
+ version = "0.2.161"
+@@ -2120,9 +2147,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "selinux-sys"
+-version = "0.6.12"
++version = "0.6.9"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "8d557667087c5b4791e180b80979cd1a92fdb9bfd92cfd4b9ab199c4d7402423"
++checksum = "89d45498373dc17ec8ebb72e1fd320c015647b0157fc81dddf678e2e00205fec"
+ dependencies = [
+  "bindgen",
+  "cc",
+@@ -3100,7 +3127,7 @@ version = "0.0.28"
+ dependencies = [
+  "chrono",
+  "clap",
+- "itertools",
++ "itertools 0.13.0",
+  "quick-error 2.0.1",
+  "regex",
+  "uucore",
+@@ -3236,7 +3263,7 @@ dependencies = [
+  "compare",
+  "ctrlc",
+  "fnv",
+- "itertools",
++ "itertools 0.13.0",
+  "memchr",
+  "nix",
+  "rand",
+@@ -3520,7 +3547,7 @@ name = "uu_yes"
+ version = "0.0.28"
+ dependencies = [
+  "clap",
+- "itertools",
++ "itertools 0.13.0",
+  "nix",
+  "uucore",
+ ]
+@@ -3539,7 +3566,7 @@ dependencies = [
+  "dunce",
+  "glob",
+  "hex",
+- "itertools",
++ "itertools 0.13.0",
+  "libc",
+  "md-5",
+  "memchr",
+@@ -3687,6 +3714,18 @@ dependencies = [
+  "wasm-bindgen",
+ ]
+ 
++[[package]]
++name = "which"
++version = "4.4.2"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "87ba24419a2078cd2b0f2ede2691b6c66d8e47836da3b6db8265ebad47afbfc7"
++dependencies = [
++ "either",
++ "home",
++ "once_cell",
++ "rustix 0.38.37",
++]
++
+ [[package]]
+ name = "wild"
+ version = "2.2.1"
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
index 162b60182a..f2b00f27bd 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils-crates.inc
@@ -21,7 +21,7 @@ SRC_URI += " \
     crate://crates.io/bigdecimal/0.4.6 \
     crate://crates.io/binary-heap-plus/0.5.0 \
     crate://crates.io/bincode/1.3.3 \
-    crate://crates.io/bindgen/0.70.1 \
+    crate://crates.io/bindgen/0.69.5 \
     crate://crates.io/bit-set/0.5.3 \
     crate://crates.io/bit-vec/0.6.3 \
     crate://crates.io/bitflags/1.3.2 \
@@ -92,7 +92,7 @@ SRC_URI += " \
     crate://crates.io/fnv/1.0.7 \
     crate://crates.io/fs_extra/1.3.0 \
     crate://crates.io/fsevent-sys/4.1.0 \
-    crate://crates.io/fts-sys/0.2.11 \
+    crate://crates.io/fts-sys/0.2.9 \
     crate://crates.io/fundu/2.0.1 \
     crate://crates.io/fundu-core/0.3.1 \
     crate://crates.io/funty/2.0.0 \
@@ -115,6 +115,7 @@ SRC_URI += " \
     crate://crates.io/hermit-abi/0.3.2 \
     crate://crates.io/hex/0.4.3 \
     crate://crates.io/hex-literal/0.4.1 \
+    crate://crates.io/home/0.5.9 \
     crate://crates.io/hostname/0.4.0 \
     crate://crates.io/iana-time-zone/0.1.53 \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
@@ -123,6 +124,7 @@ SRC_URI += " \
     crate://crates.io/inotify/0.9.6 \
     crate://crates.io/inotify-sys/0.1.5 \
     crate://crates.io/io-lifetimes/1.0.11 \
+    crate://crates.io/itertools/0.12.1 \
     crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itoa/1.0.4 \
     crate://crates.io/js-sys/0.3.64 \
@@ -130,6 +132,7 @@ SRC_URI += " \
     crate://crates.io/kqueue/1.0.7 \
     crate://crates.io/kqueue-sys/1.0.3 \
     crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/lazycell/1.3.0 \
     crate://crates.io/libc/0.2.161 \
     crate://crates.io/libloading/0.7.4 \
     crate://crates.io/libm/0.2.7 \
@@ -217,7 +220,7 @@ SRC_URI += " \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/self_cell/1.0.4 \
     crate://crates.io/selinux/0.4.6 \
-    crate://crates.io/selinux-sys/0.6.12 \
+    crate://crates.io/selinux-sys/0.6.9 \
     crate://crates.io/semver/1.0.14 \
     crate://crates.io/serde/1.0.214 \
     crate://crates.io/serde-big-array/0.5.1 \
@@ -276,6 +279,7 @@ SRC_URI += " \
     crate://crates.io/wasm-bindgen-macro-support/0.2.87 \
     crate://crates.io/wasm-bindgen-shared/0.2.87 \
     crate://crates.io/web-time/1.1.0 \
+    crate://crates.io/which/4.4.2 \
     crate://crates.io/wild/2.2.1 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
@@ -341,7 +345,7 @@ SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f
 SRC_URI[bigdecimal-0.4.6.sha256sum] = "8f850665a0385e070b64c38d2354e6c104c8479c59868d1e48a0c13ee2c7a1c1"
 SRC_URI[binary-heap-plus-0.5.0.sha256sum] = "e4551d8382e911ecc0d0f0ffb602777988669be09447d536ff4388d1def11296"
 SRC_URI[bincode-1.3.3.sha256sum] = "b1f45e9417d87227c7a56d22e471c6206462cba514c7590c09aff4cf6d1ddcad"
-SRC_URI[bindgen-0.70.1.sha256sum] = "f49d8fed880d473ea71efb9bf597651e77201bdd4893efe54c9e5d65ae04ce6f"
+SRC_URI[bindgen-0.69.5.sha256sum] = "271383c67ccabffb7381723dea0672a673f292304fcb45c01cc648c7a8d58088"
 SRC_URI[bit-set-0.5.3.sha256sum] = "0700ddab506f33b20a03b13996eccd309a48e5ff77d0d95926aa0210fb4e95f1"
 SRC_URI[bit-vec-0.6.3.sha256sum] = "349f9b6a179ed607305526ca489b34ad0a41aed5f7980fa90eb03160b69598fb"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
@@ -412,7 +416,7 @@ SRC_URI[flate2-1.0.28.sha256sum] = "46303f565772937ffe1d394a4fac6f411c6013172fad
 SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
 SRC_URI[fs_extra-1.3.0.sha256sum] = "42703706b716c37f96a77aea830392ad231f44c9e9a67872fa5548707e11b11c"
 SRC_URI[fsevent-sys-4.1.0.sha256sum] = "76ee7a02da4d231650c7cea31349b889be2f45ddb3ef3032d2ec8185f6313fd2"
-SRC_URI[fts-sys-0.2.11.sha256sum] = "28ab6a6dfd9184fe8a5097924dea6e7648f499121b3e933bb8486a17f817122e"
+SRC_URI[fts-sys-0.2.9.sha256sum] = "4e184d5f593d19793f26afb6f9a58d25f0bc755c4e48890ffcba6db416153ebb"
 SRC_URI[fundu-2.0.1.sha256sum] = "2ce12752fc64f35be3d53e0a57017cd30970f0cffd73f62c791837d8845badbd"
 SRC_URI[fundu-core-0.3.1.sha256sum] = "e463452e2d8b7600d38dcea1ed819773a57f0d710691bfc78db3961bd3f4c3ba"
 SRC_URI[funty-2.0.0.sha256sum] = "e6d5a32815ae3f33302d95fdcb2ce17862f8c65363dcfd29360480ba1001fc9c"
@@ -435,6 +439,7 @@ SRC_URI[hashbrown-0.14.3.sha256sum] = "290f1a1d9242c78d09ce40a5e87e7554ee637af13
 SRC_URI[hermit-abi-0.3.2.sha256sum] = "443144c8cdadd93ebf52ddb4056d257f5b52c04d3c804e657d19eb73fc33668b"
 SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
 SRC_URI[hex-literal-0.4.1.sha256sum] = "6fe2267d4ed49bc07b63801559be28c718ea06c4738b7a03c94df7386d2cde46"
+SRC_URI[home-0.5.9.sha256sum] = "e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5"
 SRC_URI[hostname-0.4.0.sha256sum] = "f9c7c7c8ac16c798734b8a24560c1362120597c40d5e1459f09498f8f6c8f2ba"
 SRC_URI[iana-time-zone-0.1.53.sha256sum] = "64c122667b287044802d6ce17ee2ddf13207ed924c712de9a66a5814d5b64765"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
@@ -443,6 +448,7 @@ SRC_URI[indicatif-0.17.9.sha256sum] = "cbf675b85ed934d3c67b5c5469701eec7db22689d
 SRC_URI[inotify-0.9.6.sha256sum] = "f8069d3ec154eb856955c1c0fbffefbf5f3c40a104ec912d4797314c1801abff"
 SRC_URI[inotify-sys-0.1.5.sha256sum] = "e05c02b5e89bff3b946cedeca278abc628fe811e604f027c45a8aa3cf793d0eb"
 SRC_URI[io-lifetimes-1.0.11.sha256sum] = "eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2"
+SRC_URI[itertools-0.12.1.sha256sum] = "ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569"
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itoa-1.0.4.sha256sum] = "4217ad341ebadf8d8e724e264f13e593e0648f5b3e94b3896a5df283be015ecc"
 SRC_URI[js-sys-0.3.64.sha256sum] = "c5f195fe497f702db0f318b07fdd68edb16955aed830df8363d837542f8f935a"
@@ -450,6 +456,7 @@ SRC_URI[keccak-0.1.4.sha256sum] = "8f6d5ed8676d904364de097082f4e7d240b571b67989c
 SRC_URI[kqueue-1.0.7.sha256sum] = "2c8fc60ba15bf51257aa9807a48a61013db043fcf3a78cb0d916e8e396dcad98"
 SRC_URI[kqueue-sys-1.0.3.sha256sum] = "8367585489f01bc55dd27404dcf56b95e6da061a256a666ab23be9ba96a2e587"
 SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
+SRC_URI[lazycell-1.3.0.sha256sum] = "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
 SRC_URI[libc-0.2.161.sha256sum] = "8e9489c2807c139ffd9c1794f4af0ebe86a828db53ecdc7fea2111d0fed085d1"
 SRC_URI[libloading-0.7.4.sha256sum] = "b67380fd3b2fbe7527a606e18729d21c6f3951633d0500574c4dc22d2d638b9f"
 SRC_URI[libm-0.2.7.sha256sum] = "f7012b1bbb0719e1097c47611d3898568c546d597c2e74d66f6087edd5233ff4"
@@ -537,7 +544,7 @@ SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0b
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[self_cell-1.0.4.sha256sum] = "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
 SRC_URI[selinux-0.4.6.sha256sum] = "0139b2436c81305eb6bda33af151851f75bd62783817b25f44daa371119c30b5"
-SRC_URI[selinux-sys-0.6.12.sha256sum] = "8d557667087c5b4791e180b80979cd1a92fdb9bfd92cfd4b9ab199c4d7402423"
+SRC_URI[selinux-sys-0.6.9.sha256sum] = "89d45498373dc17ec8ebb72e1fd320c015647b0157fc81dddf678e2e00205fec"
 SRC_URI[semver-1.0.14.sha256sum] = "e25dfac463d778e353db5be2449d1cce89bd6fd23c9f1ea21310ce6e5a1b29c4"
 SRC_URI[serde-1.0.214.sha256sum] = "f55c3193aca71c12ad7890f1785d2b73e1b9f63a0bbc353c08ef26fe03fc56b5"
 SRC_URI[serde-big-array-0.5.1.sha256sum] = "11fc7cc2c76d73e0f27ee52abbd64eec84d46f370c88371120433196934e4b7f"
@@ -596,6 +603,7 @@ SRC_URI[wasm-bindgen-macro-0.2.87.sha256sum] = "dee495e55982a3bd48105a7b947fd2a9
 SRC_URI[wasm-bindgen-macro-support-0.2.87.sha256sum] = "54681b18a46765f095758388f2d0cf16eb8d4169b639ab575a8f5693af210c7b"
 SRC_URI[wasm-bindgen-shared-0.2.87.sha256sum] = "ca6ad05a4870b2bf5fe995117d3728437bd27d7cd5f06f13c17443ef369775a1"
 SRC_URI[web-time-1.1.0.sha256sum] = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
+SRC_URI[which-4.4.2.sha256sum] = "87ba24419a2078cd2b0f2ede2691b6c66d8e47836da3b6db8265ebad47afbfc7"
 SRC_URI[wild-2.2.1.sha256sum] = "a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
index 151ffedf08..76cecac5a6 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e74349878141b240070458d414ab3b64"
 
 inherit cargo cargo-update-recipe-crates
 
-SRC_URI += "git://github.com/uutils/coreutils.git;protocol=https;branch=main"
+SRC_URI += "git://github.com/uutils/coreutils.git;protocol=https;branch=main \
+    file://0001-Cargo.lock-revert-to-selinux-sys-0.6.9-and-fts-sys-0.patch"
 
 # musl not supported because the libc crate does not support functions like "endutxent" at the moment,
 # so src/uucore/src/lib/features.rs disables utmpx when targetting musl.
-- 
2.43.0


