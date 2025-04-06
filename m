Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD65C3601A
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 18:09:53 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.29950.1743962984490380223
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 11:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zv3zIrG2;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7370a2d1981so2914832b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 11:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743962983; x=1744567783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgDRC3+GXdGLSt+8QwFIWPCR0XTyqF7zInq42RQE6Jw=;
        b=Zv3zIrG287ms8/Ke4N6ZrUi/sDj9aSRdA2vefo5IP6te2KZwxtFnWwXQTp/8E/Ro8f
         RBJ5kAlUJN3XB0akuska9OVqeLTeYOBSZti0G1TGnPto5G01lxsORhxlJ81uH84inIMO
         NBcNCUE23XIiRsyZUMCx2AK/zGwP3YQI4J0v8eoOxqhuAAANzyhaIoAAxOIWMLUGADkJ
         KWlZsrNfM4gXhXpouVfe5K9Cx7wN/gvmlAje2T/20QyE8wEYdliSa24nNWOePK4jzesU
         CEDMzphuvWaylAbpbTzo3FwPkigSziF8oo8R5+2nvXI+oHzWby9H5rfpNLYmDSHmoUSO
         LP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743962983; x=1744567783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgDRC3+GXdGLSt+8QwFIWPCR0XTyqF7zInq42RQE6Jw=;
        b=veo6giOEjd763F3vhvH8VZN0zL99nMeMNS+YKSDd50ACIzHVV+XYxx/pqWGdkQVtJ4
         7xZkrqhTv5cri46R+d3vYzEn37ozSKhblJvLZOa23mS/SxDOCdWdZoc6R3N7HLX3XluZ
         cAGP5eq83aTI6K1qwJP+3vfsxhYi6ftgoyp5OfOoh3Qo1aPYgS3cag3s4l9FHq6Va9gE
         9uOKa7i9y5BXsQH637VlKN+0YwkkEsDcLKRP7vLwMi5p5Ez5lJWeqBteGkSZxHGy5Dr+
         U5LQXgSatreJa04LTQSTlaHzZOAA2va27hrEtR5yPXs5powhI5HuIxLuDNbdGQ6ob/JO
         0YpQ==
X-Gm-Message-State: AOJu0YwUlXikKiH0abFN4YcHCovcbNSQoOGaM1jxOWLH4zvRmPVOUJQe
	dkd4LR+zsXb3T5Ung7vKdK3PQa8tx+lUfQ/rEfDAQJrtazPn++KtQ03dOskB
X-Gm-Gg: ASbGncshTNztP64K9cSOjMcGUw4lLJePWShw/aS3xq/0xjRMZLV/n6wdTaYsru9+qJI
	bsPUx8ma8NT2Ixnfe5im7xnhX70MB2chWktmCVyMnLBjBW0iRVkPVzpFiKYF/5KlMRyROORX9aB
	vIw+afie8ljPKlrKMRAsoQkjDm/OL9cm4UP2hVoB62+1e49yhfYMqRY+lmprNdPjsYrlV7wms5U
	HRAO5KT27pEbPGmzQOcW1UxX9sJ1icwO/YhHM17bh7NYxq/AAYy9mHZtmS0BMAw2CvwkTSGZKHH
	vBRhKJYfFaOQUlfKob0gMwWmm2kgmxxt8N3mcjDVKwxAZJY=
X-Google-Smtp-Source: AGHT+IElfVZbb3OMGMOrcDhtpj8TGq9VGzswWcAkahBFDDSkyWw018LFr0apuqHw9yEyzq3Vef35/g==
X-Received: by 2002:a17:90a:d646:b0:2fe:ba7f:8032 with SMTP id 98e67ed59e1d1-306a485e486mr15196656a91.9.1743962983023;
        Sun, 06 Apr 2025 11:09:43 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca1eb96sm7453354a91.9.2025.04.06.11.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 11:09:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] thin-provisioning-tools: Fix build on riscv32
Date: Sun,  6 Apr 2025 11:09:37 -0700
Message-ID: <20250406180938.2326040-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250406180938.2326040-1-raj.khem@gmail.com>
References: <20250406180938.2326040-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 18:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116612

Rustix crate needs libc crate to be patched

Fix build on 32-bit hosts without 64bit atomics

Use portable-atomic crate for 64bit atomics, helps 32bit arches without
64bit atomic intrinsics.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Patch libc instead of rustix

 .../thin-provisioning-tools-crates.inc        |  4 +-
 ...l-codes-on-riscv32gc-unknown-linux-g.patch | 38 ++++++++
 .../0001-Use-portable-atomics-crate.patch     | 86 +++++++++++++++++++
 .../thin-provisioning-tools_1.1.0.bb          |  2 +
 4 files changed, 128 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
 create mode 100644 meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Use-portable-atomics-crate.patch

diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
index 65dda50739..e06fc31905 100644
--- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
@@ -78,7 +78,7 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/os_pipe/1.2.1 \
     crate://crates.io/pkg-config/0.3.30 \
-    crate://crates.io/portable-atomic/1.7.0 \
+    crate://crates.io/portable-atomic/1.11.0 \
     crate://crates.io/ppv-lite86/0.2.20 \
     crate://crates.io/predicates/3.1.2 \
     crate://crates.io/predicates-core/1.0.8 \
@@ -218,7 +218,7 @@ SRC_URI[numtoa-0.1.0.sha256sum] = "b8f8bdf33df195859076e54ab11ee78a1b208382d3a26
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[os_pipe-1.2.1.sha256sum] = "5ffd2b0a5634335b135d5728d84c5e0fd726954b87111f7506a61c502280d982"
 SRC_URI[pkg-config-0.3.30.sha256sum] = "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
-SRC_URI[portable-atomic-1.7.0.sha256sum] = "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
+SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
 SRC_URI[ppv-lite86-0.2.20.sha256sum] = "77957b295656769bb8ad2b6a6b09d897d94f05c41b069aede1fcdaa675eaea04"
 SRC_URI[predicates-3.1.2.sha256sum] = "7e9086cc7640c29a356d1a29fd134380bee9d8f79a17410aa76e7ad295f42c97"
 SRC_URI[predicates-core-1.0.8.sha256sum] = "ae8177bee8e75d6846599c6b9ff679ed51e882816914eec639944d7c9aa11931"
diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
new file mode 100644
index 0000000000..ed5f40a881
--- /dev/null
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
@@ -0,0 +1,38 @@
+From 11c494b418570a3fbdfbbbdfbbc4db0108743cc7 Mon Sep 17 00:00:00 2001
+From: Dan Gohman <dev@sunfishcode.online>
+Date: Sun, 6 Apr 2025 05:22:49 -0700
+Subject: [PATCH] Define more ioctl codes on riscv32gc-unknown-linux-gnu
+
+Define ioctl codes including `FICLONE` and `FS_IOC32_GETVERSION` on
+riscv32gc-unknown-linux-gnu.
+
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/4382]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/unix/linux_like/linux/arch/generic/mod.rs | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/unix/linux_like/linux/arch/generic/mod.rs b/src/unix/linux_like/linux/arch/generic/mod.rs
+index 2f437e1..db1f1e7 100644
+--- a/src/unix/linux_like/linux/arch/generic/mod.rs
++++ b/src/unix/linux_like/linux/arch/generic/mod.rs
+@@ -114,6 +114,7 @@ cfg_if! {
+                  target_arch = "x86_64",
+                  target_arch = "arm",
+                  target_arch = "aarch64",
++                 target_arch = "riscv32",
+                  target_arch = "riscv64",
+                  target_arch = "s390x",
+                  target_arch = "csky",
+@@ -218,7 +219,10 @@ cfg_if! {
+     // where S stands for size (int, long, struct...)
+     // where T stands for type ('f','v','X'...)
+     // where N stands for NR (NumbeR)
+-    if #[cfg(any(target_arch = "x86", target_arch = "arm", target_arch = "csky"))] {
++    if #[cfg(any(target_arch = "x86",
++                 target_arch = "arm",
++                 target_arch = "riscv32",
++                 target_arch = "csky"))] {
+         pub const FS_IOC_GETFLAGS: ::Ioctl = 0x80046601;
+         pub const FS_IOC_SETFLAGS: ::Ioctl = 0x40046602;
+         pub const FS_IOC_GETVERSION: ::Ioctl = 0x80047601;
diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Use-portable-atomics-crate.patch b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Use-portable-atomics-crate.patch
new file mode 100644
index 0000000000..54d4fb4ae3
--- /dev/null
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Use-portable-atomics-crate.patch
@@ -0,0 +1,86 @@
+From aa7186a69f8fb46cdb736e03682deb77f993103b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 5 Apr 2025 18:53:03 -0700
+Subject: [PATCH] Use portable atomics crate
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This extends building thing-provisioning-tools for
+32bit architectures without 64bit atomics support e.g.
+armv5, mips, ppc32 and riscv32. More info on portable-atomics [1]
+
+Fixes
+
+error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
+│  232    --> src/cache/writeback.rs:6:25
+│  234    | use std::sync::atomic::{AtomicU64, Ordering};
+│  235    |                         ^^^^^^^^^
+
+[1] https://crates.io/crates/portable-atomic
+
+Upstream-Status: Submitted [https://github.com/jthornber/thin-provisioning-tools/pull/321]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Cargo.lock             | 5 +++--
+ Cargo.toml             | 1 +
+ src/cache/writeback.rs | 2 +-
+ src/thin/stat.rs       | 2 +-
+ 4 files changed, 6 insertions(+), 4 deletions(-)
+
+--- a/Cargo.lock
++++ b/Cargo.lock
+@@ -649,9 +649,9 @@ checksum = "d231b230927b5e4ad203db57bbcb
+ 
+ [[package]]
+ name = "portable-atomic"
+-version = "1.7.0"
++version = "1.11.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
++checksum = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
+ 
+ [[package]]
+ name = "ppv-lite86"
+@@ -1000,6 +1000,7 @@ dependencies = [
+  "num-derive",
+  "num-traits",
+  "num_cpus",
++ "portable-atomic",
+  "quick-xml",
+  "quickcheck",
+  "quickcheck_macros",
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -30,6 +30,7 @@ nom = "7.1"
+ num_cpus = "1.16"
+ num-derive = "0.4"
+ num-traits = "0.2"
++portable-atomic = "1.11"
+ quick-xml = "0.36"
+ rand = "0.8"
+ rangemap = "1.5"
+--- a/src/cache/writeback.rs
++++ b/src/cache/writeback.rs
+@@ -1,9 +1,9 @@
+ use anyhow::anyhow;
++use portable_atomic::{AtomicU64, Ordering};
+ use roaring::RoaringBitmap;
+ use std::fs::File;
+ use std::io::Cursor;
+ use std::path::Path;
+-use std::sync::atomic::{AtomicU64, Ordering};
+ use std::sync::mpsc::{self, SyncSender};
+ use std::sync::{Arc, Mutex};
+ use std::thread;
+--- a/src/thin/stat.rs
++++ b/src/thin/stat.rs
+@@ -1,7 +1,7 @@
+ use anyhow::{anyhow, Result};
++use portable_atomic::{AtomicU64, Ordering};
+ use std::collections::BTreeMap;
+ use std::path::Path;
+-use std::sync::atomic::{AtomicU64, Ordering};
+ use std::sync::{Arc, Mutex};
+ use std::vec::Vec;
+ 
diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
index 1981a35934..a60ca11244 100644
--- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
@@ -9,6 +9,8 @@ S = "${WORKDIR}/git"
 
 SRC_URI = " \
     git://github.com/jthornber/thin-provisioning-tools;branch=main;protocol=https \
+    file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/libc-0.2.155 \
+    file://0001-Use-portable-atomics-crate.patch \
     "
 
 # v1.1.0

