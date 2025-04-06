Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A47DC36010
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 02:14:58 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.18122.1743905694420040616
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Apr 2025 19:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PzW3CsuW;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7376dd56f60so2322872b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 19:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743905693; x=1744510493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMSUFH5nOa72Kuw1rbqSdjdQemtr1grSl5IE3jFfSrg=;
        b=PzW3CsuWaHrjuJCfcjnbRN5jme7B3wU0/pVlOOJErL6FUhGlF7vfWSepX5i/mqTYsZ
         7bXO96JZc6F+QSCAuqJcTgbE976KEDG+9Vrwdl/rX6yyiWXFjTbg/smPTDXzStSSBeWO
         Da8vjUq3CqHgCwUgWTyKiGfdxeUedWeQSxftROm6N6CHIUGUorpj5Q2mX+kiKjSrfyTv
         aGiiQAIaG4m0MoWvVQRkgm7G7fIHtCh3UvS9725T3jdNl/aQ/yE56Oq//E9LW8JJ2tbH
         Fe5cYE6psZc9OzfR4vFjaWOG+q2kbIiCQc74B5TdKwJggdGFnHfsOYc5jypRJrt9Kfi2
         Z5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743905693; x=1744510493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMSUFH5nOa72Kuw1rbqSdjdQemtr1grSl5IE3jFfSrg=;
        b=LSlHcAYAAPAj9Em0s0gQaJmWcXiwjPYbvDXxjsxgJ0PNZ7rj0mZFFcccrOw0ejHzQB
         d5ussJogejuHQDFjsjC9YJ/XoFCWJd1j6wHa2hhaDSbqnskRnm0SdEn8kGd7EmD4Ak1y
         NKTtIEw3F1+75zzF63bKQpwJR4yE+YIxrInhfV/WLctJjtLDK2/+Gs/VclJZrLkwIGv6
         NkmsJz5BWwvSXr2MXS+rL9LSvl21aUkbqCY2bVLHSO7UYy2NTsDmm0NWFtJErxeUYvwI
         Bvu5me33OH0hQxozFjt+sus9eu5OuvV0Ar4uQbeUVejOneU4jyE/lQrILnrPvYmbbwiv
         Ggpw==
X-Gm-Message-State: AOJu0YxBcshLK7LMLZ/ZjmKF5g84Fsb8tI1gvcZYCVtY8t5qIAllWVG6
	tGTZCu6rWVSBDzwk/w+UnLKnxi2eNAoPXfffKVEginQaGBcm5FnTVhiATRCW
X-Gm-Gg: ASbGnctXmOXXUHXQHWapJRh0gwuVE6zCug2cVnbGHapmpKtJQlC5UKjzZpbLUzaNUm7
	QkbKPMwEgjo4OyhBBOnwBNOddUU20ZfhR5ryOafzA/YPuy0s1v/SU6qm75lkQs4buyk6ZUssJSK
	u6HzOuqFPwIRl2xDcolwsU+FKhAVA+v7J39SgB0LCPAZzF0X7Jg+mWJ1XYTDHhVdzkpBXcCKdgF
	cRXnpY+i4bnnbZ7OiKWVX9U3NEJEju0YtGKGuGRjps+TigMlT2Zu0c2Nv1tY67RbEHU3c8fd6yR
	sisH0cnaAtLDv0U03S4S8xMzDdLn73JzsH4x
X-Google-Smtp-Source: AGHT+IGIEJ5lxcvJnbXeyRXipSWM/FK6ZrWkgTNuRZ1KZ1XhqDcML7Ubf+XcDZC4V82FI7CJ6xB1Nw==
X-Received: by 2002:a05:6a20:ce4d:b0:1f5:5b77:3811 with SMTP id adf61e73a8af0-2010801c07cmr11894647637.22.1743905692996;
        Sat, 05 Apr 2025 19:14:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41c6desm5036749a12.77.2025.04.05.19.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 19:14:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] thin-provisioning-tools-crates: Fix build on 32-bit hosts without 64bit atomics
Date: Sat,  5 Apr 2025 19:14:45 -0700
Message-ID: <20250406021446.183928-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250406021446.183928-1-raj.khem@gmail.com>
References: <20250406021446.183928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 02:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116604

Use portable-atomic crate for 64bit atomics, helps 32bit arches without
64bit atomic intrinsics.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../thin-provisioning-tools-crates.inc        |  4 +-
 .../0001-Use-portable-atomics-crate.patch     | 86 +++++++++++++++++++
 .../thin-provisioning-tools_1.1.0.bb          |  1 +
 3 files changed, 89 insertions(+), 2 deletions(-)
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
index 5f685f3749..60322300ef 100644
--- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
+++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
@@ -10,6 +10,7 @@ S = "${WORKDIR}/git"
 SRC_URI = " \
     git://github.com/jthornber/thin-provisioning-tools;branch=main;protocol=https \
     file://0001-Fix-cargo-build-on-riscv32.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/rustix-0.38.34 \
+    file://0001-Use-portable-atomics-crate.patch \
     "
 
 # v1.1.0

