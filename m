Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1245DC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 19:22:48 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.2984.1709061765860555263
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Feb 2024 11:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A1N88ck1;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e45d0c9676so97675b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 11:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709061765; x=1709666565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkHq0fgyTww/ubnb1mb3zb9zaDVYJuLxDkBetv2WOac=;
        b=A1N88ck1vL6kPS0A4T79oBgW0x8brIfNQp55KV2ZwCo1E4Ahtd2yaT/4ayPVyRGg5p
         JfRLtnYuEere1mw4nnZAHa2Kwa4rXI0ncAPPe1HK5oRvBizGcr2NFRZaFNhZBf6ZfmM/
         Q1ZiZ/rtNO+5rh959nt622eTJnUCvev83fde8DwYuCUgNJpKJWGuKSNlsyC2i+nHBUct
         IDSxTyr/BMM5ycKAUKbTj1PDgVD/L2yzBkDMuhAdbrxtMSMZ1sU0v3GN33UlS45MhEHJ
         zUCBE+xBGqiLUtvjhr3e0RThuaXOIkWM0Yh6E2yxO8Onwuf0eZNwEVVYVClPItuXB0zO
         64Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709061765; x=1709666565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkHq0fgyTww/ubnb1mb3zb9zaDVYJuLxDkBetv2WOac=;
        b=WsFq2jNTIjhAbA+kCGBpm7wQf5+RtYHfqsNrliwtqcU512ZQkZQ9jgFCq8IqrUjtQG
         QSw/ZymEVAbb624qeMNO7hqeaLjaUuLGZCCgAEElxLS5Eb4k8k24lzlkrFtVrdJLzEJD
         58bzcYUjDzK7Akydk5cFTc5nysCOCYZYGo8raKq6LUPq0noEDgX/YRA/TvWSi28V/37z
         SKvKxUqXRPEe6CJBFkEjWc+VYXX2wTMB63T6Ib656kofPg5QIGXzEHCdiljkaR5LA0z4
         2GGgyD3FeiBQpKQ5FCl7t6mtcgfNDsW3VlwOq5XNpQhhjSgleW34H03wa8KC7xrra1g5
         qUDA==
X-Gm-Message-State: AOJu0YwCdBzWfT0Z9MOwmjyDJefmwwCvEqjwSyvFMM00IYWAv7jAl4Ip
	kWWefV+f3DAQsd3ESz0072SZmn28TdhTwZOuZniYQUc670ITJAEL/Nd5pm0PrxI=
X-Google-Smtp-Source: AGHT+IFC0GRHtTGMqkgWm1tuuaeVZ5lMSiMDb/jSNRSxbNPWZBDi02gYBVM940GbqQ3qFrA/BpEdqA==
X-Received: by 2002:a05:6a20:9c8e:b0:1a0:f3f4:3b1a with SMTP id mj14-20020a056a209c8e00b001a0f3f43b1amr395468pzb.10.1709061765011;
        Tue, 27 Feb 2024 11:22:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::95e0])
        by smtp.gmail.com with ESMTPSA id k62-20020a632441000000b005dc3fc53f19sm6223199pgk.7.2024.02.27.11.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 11:22:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pydantic-core: Fix build for arches without 64bit atomics
Date: Tue, 27 Feb 2024 11:22:42 -0800
Message-ID: <20240227192242.3844005-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227192242.3844005-1-raj.khem@gmail.com>
References: <20240227192242.3844005-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Feb 2024 19:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109047

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pydantic-core-crates.inc   |  20 +--
 ...-github.com-pyo3-pyo3-from-0.20.2-to.patch | 115 ++++++++++++++++++
 .../python/python3-pydantic-core_2.16.3.bb    |   1 +
 3 files changed, 127 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index 5518ff6ec9..e8e4ef23a8 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -38,11 +38,12 @@ SRC_URI += " \
     crate://crates.io/parking_lot/0.12.1 \
     crate://crates.io/parking_lot_core/0.9.8 \
     crate://crates.io/percent-encoding/2.3.1 \
+    crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.76 \
-    crate://crates.io/pyo3/0.20.2 \
-    crate://crates.io/pyo3-build-config/0.20.2 \
-    crate://crates.io/pyo3-ffi/0.20.2 \
-    crate://crates.io/pyo3-macros/0.20.2 \
+    crate://crates.io/pyo3/0.20.3 \
+    crate://crates.io/pyo3-build-config/0.20.3 \
+    crate://crates.io/pyo3-ffi/0.20.3 \
+    crate://crates.io/pyo3-macros/0.20.3 \
     crate://crates.io/pyo3-macros-backend/0.20.2 \
     crate://crates.io/python3-dll-a/0.2.9 \
     crate://crates.io/quote/1.0.35 \
@@ -121,12 +122,13 @@ SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7
 SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
 SRC_URI[parking_lot_core-0.9.8.sha256sum] = "93f00c865fe7cabf650081affecd3871070f26767e7b2070a3ffae14c654b447"
 SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
+SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.76.sha256sum] = "95fc56cda0b5c3325f5fbbd7ff9fda9e02bb00bb3dac51252d2f1bfa1cb8cc8c"
-SRC_URI[pyo3-0.20.2.sha256sum] = "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
-SRC_URI[pyo3-build-config-0.20.2.sha256sum] = "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
-SRC_URI[pyo3-ffi-0.20.2.sha256sum] = "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
-SRC_URI[pyo3-macros-0.20.2.sha256sum] = "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
-SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] = "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
+SRC_URI[pyo3-0.20.3.sha256sum] = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
+SRC_URI[pyo3-build-config-0.20.3.sha256sum] = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
+SRC_URI[pyo3-ffi-0.20.3.sha256sum] = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
+SRC_URI[pyo3-macros-0.20.3.sha256sum] = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
+SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
 SRC_URI[python3-dll-a-0.2.9.sha256sum] = "d5f07cd4412be8fa09a721d40007c483981bbe072cd6a21f2e83e04ec8f8343f"
 SRC_URI[quote-1.0.35.sha256sum] = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
 SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch
new file mode 100644
index 0000000000..ba9bd1c150
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch
@@ -0,0 +1,115 @@
+From a5690f973384bf8cbf4deb3b83d822b7aaefbdd8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Feb 2024 11:00:46 -0800
+Subject: [PATCH] Bumps [pyo3](https://github.com/pyo3/pyo3) from 0.20.2 to
+ 0.20.3.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Cargo.lock | 26 +++++++++++++++++---------
+ Cargo.toml |  2 +-
+ 2 files changed, 18 insertions(+), 10 deletions(-)
+
+diff --git a/Cargo.lock b/Cargo.lock
+index 62615dc..b0d4448 100644
+--- a/Cargo.lock
++++ b/Cargo.lock
+@@ -321,6 +321,12 @@ version = "2.3.1"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
+ 
++[[package]]
++name = "portable-atomic"
++version = "1.6.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
++
+ [[package]]
+ name = "proc-macro2"
+ version = "1.0.76"
+@@ -357,9 +363,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "pyo3"
+-version = "0.20.2"
++version = "0.20.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
++checksum = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
+ dependencies = [
+  "cfg-if",
+  "indoc",
+@@ -367,6 +373,7 @@ dependencies = [
+  "memoffset",
+  "num-bigint",
+  "parking_lot",
++ "portable-atomic",
+  "pyo3-build-config",
+  "pyo3-ffi",
+  "pyo3-macros",
+@@ -375,9 +382,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "pyo3-build-config"
+-version = "0.20.2"
++version = "0.20.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
++checksum = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
+ dependencies = [
+  "once_cell",
+  "python3-dll-a",
+@@ -386,9 +393,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "pyo3-ffi"
+-version = "0.20.2"
++version = "0.20.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
++checksum = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
+ dependencies = [
+  "libc",
+  "pyo3-build-config",
+@@ -396,9 +403,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "pyo3-macros"
+-version = "0.20.2"
++version = "0.20.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
++checksum = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
+ dependencies = [
+  "proc-macro2",
+  "pyo3-macros-backend",
+@@ -410,10 +417,11 @@ dependencies = [
+ name = "pyo3-macros-backend"
+ version = "0.20.2"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
++checksum = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
+ dependencies = [
+  "heck",
+  "proc-macro2",
++ "pyo3-build-config",
+  "quote",
+  "syn",
+ ]
+diff --git a/Cargo.toml b/Cargo.toml
+index 64861f8..27ed671 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -26,7 +26,7 @@ include = [
+ ]
+ 
+ [dependencies]
+-pyo3 = { version = "0.20.2", features = ["generate-import-lib", "num-bigint"] }
++pyo3 = { version = "0.20.3", features = ["generate-import-lib", "num-bigint"] }
+ regex = "1.10.2"
+ strum = { version = "0.25.0", features = ["derive"] }
+ strum_macros = "0.25.3"
+-- 
+2.44.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
index ef48c0020d..b26478451a 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
@@ -8,6 +8,7 @@ HOMEPAGE = "https://github.com/pydantic/pydantic-core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 
+SRC_URI += "file://0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch"
 SRC_URI[sha256sum] = "1cac689f80a3abab2d3c0048b29eea5751114054f032a941a32de4c852c59cad"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
-- 
2.44.0


