Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074D7C3DA4A
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 07:33:41 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.3108.1745048012404020458
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Apr 2025 00:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gggg0sr4;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73c17c770a7so3331352b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 00:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745048011; x=1745652811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bi0spuJbqdYRxWmTQb0nI77eIiKf6jLb+YeIIuNs87o=;
        b=gggg0sr4ENDd/9bdAIr+HEM2Ns0mZjdhzFQ/nhWTcqbH/xd0YYCMN5DyC6TvSHBwyC
         Slng0ZHy1YU+1WVkulciNLcycf4887rdwwb8vyK/QKZnpdSh4Ld015jRY12UkV2U8HGW
         3+MScc1plZLpReNyfWnGApHrd2DctADQtUWd2uAEgCJtSGIEtkJINwwod0yplTrPnf7u
         buek15aYEKOxc4PlGPzli9XdandJnFxdZ2L1WSWpBXRb19wqA/TkJjf8iXxxEOAGO3Bj
         UkqItphkKk4YcO66F63utCAvD3mQdsOMogIwbp7/KYViQrLaBPCrXSHn694k2XGLRs59
         X2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745048011; x=1745652811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bi0spuJbqdYRxWmTQb0nI77eIiKf6jLb+YeIIuNs87o=;
        b=NA8qCcozj2+wdOuBJjuuGvmLiG3XXTFy6xnpdJDQ2jtnv7ueJnXna5nT75GMO9Jvod
         0bmfLBMy+cA6inVAHzLLQnTiPMfjdP88HQhFdj9vZXz4Uu8v4WVHMRbX11YO16AkEoPp
         LOZpNTMoUt/9sMkeEr28JJc6XBcSXihIKhLqDQexiAG3YjHpP5adhC+GeaZTw35NdBz7
         VlT/2Z9/Liw6Sw1t36ULu/VahnMjhm1QuVnJJyw9r1/EGo17g+mKDEMBy18l5i9K0LdG
         JL1zviWyMGZT4MYmq9PiCLoapk3r5R9Mrrx+aUF++5MCkRqo4Hv+XyFeU6gh/vskHGg7
         RnaA==
X-Gm-Message-State: AOJu0YyAlTkLu3s2g4Lep/7w2oJOV9eixsmOD1Ki2FzZ9AunHeZpMXcW
	KYqcIWc2WgnanAKFYqp5y/TdMhZlb1uvafZSXGgUkWPJrlQAZO4tfPbBAWG7
X-Gm-Gg: ASbGncvwVvpypfjiQVadMap+BaRX57+GvkGRvDt6wUmXQu3DAyt/q9Yjud2v83LvWHq
	kQdfYv6zqtZ+Sil2ngCGlfHZEiBV7GLBm7+6EekWx35VKjSwnXnATtqiSsPDYJn5LBDvtgfIX9l
	YZmu0RZgw1QjfG15fXprfNF0j5bj0gH5qDZt362NF+oiEY3MbzGGCsBL2k0avfw11sDeOj+eMZj
	Iz9/vAe+HNC/hhWbfTi76juZebVEm4X7FW6czoPwzG6qkCEBGmnJkGVKokSjDIhSI8vJeMmIXzZ
	PiDNClTAxaEtsCyyUSHNvP3RxQMUOBEA
X-Google-Smtp-Source: AGHT+IG5W3rQo9c6jtmY2J1vgbISENZ8j91WDMfY4PVJ1DfPpFk/mKCZpJKSQviWUSLmGyYwd7edUQ==
X-Received: by 2002:a05:6a20:d48b:b0:1f5:931d:ca6d with SMTP id adf61e73a8af0-203cbc28a3emr8656203637.1.1745048011248;
        Sat, 19 Apr 2025 00:33:31 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13ad7d5sm2429763a12.31.2025.04.19.00.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 00:33:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-pydantic-core: Upgrade to 2.34.1
Date: Sat, 19 Apr 2025 00:33:25 -0700
Message-ID: <20250419073327.2468160-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419073327.2468160-1-raj.khem@gmail.com>
References: <20250419073327.2468160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 07:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116977

Fix RISCV-32 builds while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pydantic-core-crates.inc   |  30 +-
 .../0001-Upgrade-radium-to-1.0.patch          | 540 ++++++++++++++++++
 ...toml-Update-bitvec-to-use-radium-1.x.patch |  82 +++
 ...3.1.bb => python3-pydantic-core_2.34.1.bb} |   7 +-
 4 files changed, 641 insertions(+), 18 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Upgrade-radium-to-1.0.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.33.1.bb => python3-pydantic-core_2.34.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index 8c2a25dd7a..86b72c0e9a 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -48,14 +48,15 @@ SRC_URI += " \
     crate://crates.io/percent-encoding/2.3.1 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.24.0 \
-    crate://crates.io/pyo3-build-config/0.24.0 \
-    crate://crates.io/pyo3-ffi/0.24.0 \
-    crate://crates.io/pyo3-macros/0.24.0 \
-    crate://crates.io/pyo3-macros-backend/0.24.0 \
+    crate://crates.io/pyo3/0.24.1 \
+    crate://crates.io/pyo3-build-config/0.24.1 \
+    crate://crates.io/pyo3-ffi/0.24.1 \
+    crate://crates.io/pyo3-macros/0.24.1 \
+    crate://crates.io/pyo3-macros-backend/0.24.1 \
     crate://crates.io/python3-dll-a/0.2.13 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/radium/0.7.0 \
+    crate://crates.io/radium/1.1.0 \
     crate://crates.io/regex/1.11.1 \
     crate://crates.io/regex-automata/0.4.8 \
     crate://crates.io/regex-syntax/0.8.5 \
@@ -63,7 +64,7 @@ SRC_URI += " \
     crate://crates.io/ryu/1.0.18 \
     crate://crates.io/serde/1.0.218 \
     crate://crates.io/serde_derive/1.0.218 \
-    crate://crates.io/serde_json/1.0.138 \
+    crate://crates.io/serde_json/1.0.140 \
     crate://crates.io/smallvec/1.14.0 \
     crate://crates.io/speedate/0.15.0 \
     crate://crates.io/stable_deref_trait/1.2.0 \
@@ -80,7 +81,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.4 \
     crate://crates.io/utf16_iter/1.0.5 \
     crate://crates.io/utf8_iter/1.0.4 \
-    crate://crates.io/uuid/1.15.1 \
+    crate://crates.io/uuid/1.16.0 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/write16/1.0.0 \
@@ -142,14 +143,15 @@ SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa
 SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.24.0.sha256sum] = "7f1c6c3591120564d64db2261bec5f910ae454f01def849b9c22835a84695e86"
-SRC_URI[pyo3-build-config-0.24.0.sha256sum] = "e9b6c2b34cf71427ea37c7001aefbaeb85886a074795e35f161f5aecc7620a7a"
-SRC_URI[pyo3-ffi-0.24.0.sha256sum] = "5507651906a46432cdda02cd02dd0319f6064f1374c9147c45b978621d2c3a9c"
-SRC_URI[pyo3-macros-0.24.0.sha256sum] = "b0d394b5b4fd8d97d48336bb0dd2aebabad39f1d294edd6bcd2cccf2eefe6f42"
-SRC_URI[pyo3-macros-backend-0.24.0.sha256sum] = "fd72da09cfa943b1080f621f024d2ef7e2773df7badd51aa30a2be1f8caa7c8e"
+SRC_URI[pyo3-0.24.1.sha256sum] = "17da310086b068fbdcefbba30aeb3721d5bb9af8db4987d6735b2183ca567229"
+SRC_URI[pyo3-build-config-0.24.1.sha256sum] = "e27165889bd793000a098bb966adc4300c312497ea25cf7a690a9f0ac5aa5fc1"
+SRC_URI[pyo3-ffi-0.24.1.sha256sum] = "05280526e1dbf6b420062f3ef228b78c0c54ba94e157f5cb724a609d0f2faabc"
+SRC_URI[pyo3-macros-0.24.1.sha256sum] = "5c3ce5686aa4d3f63359a5100c62a127c9f15e8398e5fdeb5deef1fed5cd5f44"
+SRC_URI[pyo3-macros-backend-0.24.1.sha256sum] = "f4cf6faa0cbfb0ed08e89beb8103ae9724eb4750e3a78084ba4017cbe94f3855"
 SRC_URI[python3-dll-a-0.2.13.sha256sum] = "49fe4227a288cf9493942ad0220ea3f185f4d1f2a14f197f7344d6d02f4ed4ed"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
+SRC_URI[radium-1.1.0.sha256sum] = "db0b76288902db304c864a12046b73d2d895cc34a4bb8137baaeebe9978a072c"
 SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
 SRC_URI[regex-automata-0.4.8.sha256sum] = "368758f23274712b504848e9d5a6f010445cc8b87a7cdb4d7cbee666c1288da3"
 SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
@@ -157,7 +159,7 @@ SRC_URI[rustversion-1.0.17.sha256sum] = "955d28af4278de8121b7ebeb796b6a45735dc01
 SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
 SRC_URI[serde-1.0.218.sha256sum] = "e8dfc9d19bdbf6d17e22319da49161d5d0108e4188e8b680aef6299eed22df60"
 SRC_URI[serde_derive-1.0.218.sha256sum] = "f09503e191f4e797cb8aac08e9a4a4695c5edf6a2e70e376d961ddd5c969f82b"
-SRC_URI[serde_json-1.0.138.sha256sum] = "d434192e7da787e94a6ea7e9670b26a036d0ca41e0b7efb2676dd32bae872949"
+SRC_URI[serde_json-1.0.140.sha256sum] = "20068b6e96dc6c9bd23e01df8827e6c7e1f2fddd43c21810382803c136b99373"
 SRC_URI[smallvec-1.14.0.sha256sum] = "7fcf8323ef1faaee30a44a340193b1ac6814fd9b7b4e88e9d4519a3e4abe1cfd"
 SRC_URI[speedate-0.15.0.sha256sum] = "9a5e7adf4e07e7de39a64d77962ca14a09165e592d42d0c9f9acadb679f4f937"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
@@ -174,7 +176,7 @@ SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd8
 SRC_URI[url-2.5.4.sha256sum] = "32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7fda60"
 SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
-SRC_URI[uuid-1.15.1.sha256sum] = "e0f540e3240398cce6128b64ba83fdbdd86129c16a3aa1a3a252efd66eb3d587"
+SRC_URI[uuid-1.16.0.sha256sum] = "458f7a779bf54acc9f347480ac654f68407d3aab21269a6e3c9f922acd9e2da9"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Upgrade-radium-to-1.0.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Upgrade-radium-to-1.0.patch
new file mode 100644
index 0000000000..00dcd634f2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Upgrade-radium-to-1.0.patch
@@ -0,0 +1,540 @@
+From 87753249fb9ac26acd1eb0135fefded871c24e6c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 18 Apr 2025 17:54:42 -0700
+Subject: [PATCH] Upgrade radium to 1.0
+
+Upstream-Status: Submitted [https://github.com/ferrilab/bitvec/pull/220]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Cargo.toml          |   2 +-
+ src/macros/tests.rs | 256 ++++++++++++++++++++++----------------------
+ src/mem.rs          |  28 ++---
+ src/serdes.rs       |  58 +++++-----
+ src/store.rs        |  61 +++++------
+ 5 files changed, 207 insertions(+), 198 deletions(-)
+
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -55,7 +55,7 @@ version = "^2.0"
+ default-features = false
+ 
+ [dependencies.radium]
+-version = "0.7"
++version = "1"
+ 
+ [dependencies.serde]
+ version = "1"
+--- a/src/macros/tests.rs
++++ b/src/macros/tests.rs
+@@ -231,50 +231,52 @@ fn compile_bits() {
+ 		let _: &BitSlice<u64, Msb0> = bits![u64, crate::order::Msb0; 1; 100];
+ 	}
+ 
+-	radium::if_atomic! {
+-		if atomic(8) {
+-			let _: &BitSlice<AtomicU8, LocalBits> = bits![AtomicU8, LocalBits; 0, 1];
+-			let _: &BitSlice<AtomicU8, Lsb0> = bits![AtomicU8, Lsb0; 0, 1];
+-			let _: &BitSlice<AtomicU8, Msb0> = bits![AtomicU8, Msb0; 0, 1];
+-			let _: &BitSlice<RadiumU8, LocalBits> = bits![RadiumU8, LocalBits; 1; 100];
+-			let _: &BitSlice<RadiumU8, Lsb0> = bits![RadiumU8, Lsb0; 1; 100];
+-			let _: &BitSlice<RadiumU8, Msb0> = bits![RadiumU8, Msb0; 1; 100];
+-		}
+-		if atomic(16) {
+-			let _: &BitSlice<AtomicU16, LocalBits> = bits![AtomicU16, LocalBits; 0, 1];
+-			let _: &BitSlice<AtomicU16, Lsb0> = bits![AtomicU16, Lsb0; 0, 1];
+-			let _: &BitSlice<AtomicU16, Msb0> = bits![AtomicU16, Msb0; 0, 1];
+-			let _: &BitSlice<RadiumU16, LocalBits> = bits![RadiumU16, LocalBits; 1; 100];
+-			let _: &BitSlice<RadiumU16, Lsb0> = bits![RadiumU16, Lsb0; 1; 100];
+-			let _: &BitSlice<RadiumU16, Msb0> = bits![RadiumU16, Msb0; 1; 100];
+-		}
+-		if atomic(32) {
+-			let _: &BitSlice<AtomicU32, LocalBits> = bits![AtomicU32, LocalBits; 0, 1];
+-			let _: &BitSlice<AtomicU32, Lsb0> = bits![AtomicU32, Lsb0; 0, 1];
+-			let _: &BitSlice<AtomicU32, Msb0> = bits![AtomicU32, Msb0; 0, 1];
+-			let _: &BitSlice<RadiumU32, LocalBits> = bits![RadiumU32, LocalBits; 1; 100];
+-			let _: &BitSlice<RadiumU32, Lsb0> = bits![RadiumU32, Lsb0; 1; 100];
+-			let _: &BitSlice<RadiumU32, Msb0> = bits![RadiumU32, Msb0; 1; 100];
+-		}
+-		if atomic(size) {
+-			let _: &BitSlice<AtomicUsize, LocalBits> = bits![AtomicUsize, LocalBits; 0, 1];
+-			let _: &BitSlice<AtomicUsize, Lsb0> = bits![AtomicUsize, Lsb0; 0, 1];
+-			let _: &BitSlice<AtomicUsize, Msb0> = bits![AtomicUsize, Msb0; 0, 1];
+-			let _: &BitSlice<RadiumUsize, LocalBits> = bits![RadiumUsize, LocalBits; 1; 100];
+-			let _: &BitSlice<RadiumUsize, Lsb0> = bits![RadiumUsize, Lsb0; 1; 100];
+-			let _: &BitSlice<RadiumUsize, Msb0> = bits![RadiumUsize, Msb0; 1; 100];
+-		}
++	#[cfg(target_has_atomic = "8")]
++	{
++		let _: &BitSlice<AtomicU8, LocalBits> = bits![AtomicU8, LocalBits; 0, 1];
++		let _: &BitSlice<AtomicU8, Lsb0> = bits![AtomicU8, Lsb0; 0, 1];
++		let _: &BitSlice<AtomicU8, Msb0> = bits![AtomicU8, Msb0; 0, 1];
++		let _: &BitSlice<RadiumU8, LocalBits> = bits![RadiumU8, LocalBits; 1; 100];
++		let _: &BitSlice<RadiumU8, Lsb0> = bits![RadiumU8, Lsb0; 1; 100];
++		let _: &BitSlice<RadiumU8, Msb0> = bits![RadiumU8, Msb0; 1; 100];
++	}
++	#[cfg(target_has_atomic = "16")]
++	{
++		let _: &BitSlice<AtomicU16, LocalBits> = bits![AtomicU16, LocalBits; 0, 1];
++		let _: &BitSlice<AtomicU16, Lsb0> = bits![AtomicU16, Lsb0; 0, 1];
++		let _: &BitSlice<AtomicU16, Msb0> = bits![AtomicU16, Msb0; 0, 1];
++		let _: &BitSlice<RadiumU16, LocalBits> = bits![RadiumU16, LocalBits; 1; 100];
++		let _: &BitSlice<RadiumU16, Lsb0> = bits![RadiumU16, Lsb0; 1; 100];
++		let _: &BitSlice<RadiumU16, Msb0> = bits![RadiumU16, Msb0; 1; 100];
++	}
++	#[cfg(target_has_atomic = "32")]
++	{
++		let _: &BitSlice<AtomicU32, LocalBits> = bits![AtomicU32, LocalBits; 0, 1];
++		let _: &BitSlice<AtomicU32, Lsb0> = bits![AtomicU32, Lsb0; 0, 1];
++		let _: &BitSlice<AtomicU32, Msb0> = bits![AtomicU32, Msb0; 0, 1];
++		let _: &BitSlice<RadiumU32, LocalBits> = bits![RadiumU32, LocalBits; 1; 100];
++		let _: &BitSlice<RadiumU32, Lsb0> = bits![RadiumU32, Lsb0; 1; 100];
++		let _: &BitSlice<RadiumU32, Msb0> = bits![RadiumU32, Msb0; 1; 100];
++	}
++	#[cfg(target_has_atomic = "ptr")]
++	{
++		let _: &BitSlice<AtomicUsize, LocalBits> = bits![AtomicUsize, LocalBits; 0, 1];
++		let _: &BitSlice<AtomicUsize, Lsb0> = bits![AtomicUsize, Lsb0; 0, 1];
++		let _: &BitSlice<AtomicUsize, Msb0> = bits![AtomicUsize, Msb0; 0, 1];
++		let _: &BitSlice<RadiumUsize, LocalBits> = bits![RadiumUsize, LocalBits; 1; 100];
++		let _: &BitSlice<RadiumUsize, Lsb0> = bits![RadiumUsize, Lsb0; 1; 100];
++		let _: &BitSlice<RadiumUsize, Msb0> = bits![RadiumUsize, Msb0; 1; 100];
+ 	}
++
+ 	#[cfg(target_pointer_width = "64")]
+-	radium::if_atomic! {
+-		if atomic(64) {
+-			let _: &BitSlice<AtomicU64, LocalBits> = bits![AtomicU64, LocalBits; 0, 1];
+-			let _: &BitSlice<AtomicU64, Lsb0> = bits![AtomicU64, Lsb0; 0, 1];
+-			let _: &BitSlice<AtomicU64, Msb0> = bits![AtomicU64, Msb0; 0, 1];
+-			let _: &BitSlice<RadiumU64, LocalBits> = bits![RadiumU64, LocalBits; 1; 100];
+-			let _: &BitSlice<RadiumU64, Lsb0> = bits![RadiumU64, Lsb0; 1; 100];
+-			let _: &BitSlice<RadiumU64, Msb0> = bits![RadiumU64, Msb0; 1; 100];
+-		}
++	#[cfg(target_has_atomic = "64")]
++	{
++		let _: &BitSlice<AtomicU64, LocalBits> = bits![AtomicU64, LocalBits; 0, 1];
++		let _: &BitSlice<AtomicU64, Lsb0> = bits![AtomicU64, Lsb0; 0, 1];
++		let _: &BitSlice<AtomicU64, Msb0> = bits![AtomicU64, Msb0; 0, 1];
++		let _: &BitSlice<RadiumU64, LocalBits> = bits![RadiumU64, LocalBits; 1; 100];
++		let _: &BitSlice<RadiumU64, Lsb0> = bits![RadiumU64, Lsb0; 1; 100];
++		let _: &BitSlice<RadiumU64, Msb0> = bits![RadiumU64, Msb0; 1; 100];
+ 	}
+ }
+ 
+@@ -346,50 +348,51 @@ fn compile_bitvec() {
+ 			bitvec![Cell<u64>, crate::order::Msb0; 1; 100];
+ 		let _: BitVec<u64, Msb0> = bitvec![u64, crate::order::Msb0; 1; 100];
+ 	}
+-	radium::if_atomic! {
+-		if atomic(8) {
+-			let _: BitVec<AtomicU8, LocalBits> =bitvec![AtomicU8, LocalBits; 0, 1];
+-			let _: BitVec<AtomicU8, Lsb0> =bitvec![AtomicU8, Lsb0; 0, 1];
+-			let _: BitVec<AtomicU8, Msb0> =bitvec![AtomicU8, Msb0; 0, 1];
+-			let _: BitVec<RadiumU8, LocalBits> =bitvec![RadiumU8, LocalBits; 1; 100];
+-			let _: BitVec<RadiumU8, Lsb0> =bitvec![RadiumU8, Lsb0; 1; 100];
+-			let _: BitVec<RadiumU8, Msb0> =bitvec![RadiumU8, Msb0; 1; 100];
+-		}
+-		if atomic(16) {
+-			let _: BitVec<AtomicU16, LocalBits> =bitvec![AtomicU16, LocalBits; 0, 1];
+-			let _: BitVec<AtomicU16, Lsb0> =bitvec![AtomicU16, Lsb0; 0, 1];
+-			let _: BitVec<AtomicU16, Msb0> =bitvec![AtomicU16, Msb0; 0, 1];
+-			let _: BitVec<RadiumU16, LocalBits> =bitvec![RadiumU16, LocalBits; 1; 100];
+-			let _: BitVec<RadiumU16, Lsb0> =bitvec![RadiumU16, Lsb0; 1; 100];
+-			let _: BitVec<RadiumU16, Msb0> =bitvec![RadiumU16, Msb0; 1; 100];
+-		}
+-		if atomic(32) {
+-			let _: BitVec<AtomicU32, LocalBits> =bitvec![AtomicU32, LocalBits; 0, 1];
+-			let _: BitVec<AtomicU32, Lsb0> =bitvec![AtomicU32, Lsb0; 0, 1];
+-			let _: BitVec<AtomicU32, Msb0> =bitvec![AtomicU32, Msb0; 0, 1];
+-			let _: BitVec<RadiumU32, LocalBits> =bitvec![RadiumU32, LocalBits; 1; 100];
+-			let _: BitVec<RadiumU32, Lsb0> =bitvec![RadiumU32, Lsb0; 1; 100];
+-			let _: BitVec<RadiumU32, Msb0> =bitvec![RadiumU32, Msb0; 1; 100];
+-		}
+-		if atomic(size) {
+-			let _: BitVec<AtomicUsize, LocalBits> =bitvec![AtomicUsize, LocalBits; 0, 1];
+-			let _: BitVec<AtomicUsize, Lsb0> =bitvec![AtomicUsize, Lsb0; 0, 1];
+-			let _: BitVec<AtomicUsize, Msb0> =bitvec![AtomicUsize, Msb0; 0, 1];
+-			let _: BitVec<RadiumUsize, LocalBits> =bitvec![RadiumUsize, LocalBits; 1; 100];
+-			let _: BitVec<RadiumUsize, Lsb0> =bitvec![RadiumUsize, Lsb0; 1; 100];
+-			let _: BitVec<RadiumUsize, Msb0> =bitvec![RadiumUsize, Msb0; 1; 100];
+-		}
++	#[cfg(target_has_atomic = "8")]
++	{
++		let _: BitVec<AtomicU8, LocalBits> =bitvec![AtomicU8, LocalBits; 0, 1];
++		let _: BitVec<AtomicU8, Lsb0> =bitvec![AtomicU8, Lsb0; 0, 1];
++		let _: BitVec<AtomicU8, Msb0> =bitvec![AtomicU8, Msb0; 0, 1];
++		let _: BitVec<RadiumU8, LocalBits> =bitvec![RadiumU8, LocalBits; 1; 100];
++		let _: BitVec<RadiumU8, Lsb0> =bitvec![RadiumU8, Lsb0; 1; 100];
++		let _: BitVec<RadiumU8, Msb0> =bitvec![RadiumU8, Msb0; 1; 100];
++	}
++	#[cfg(target_has_atomic = "16")]
++	{
++		let _: BitVec<AtomicU16, LocalBits> =bitvec![AtomicU16, LocalBits; 0, 1];
++		let _: BitVec<AtomicU16, Lsb0> =bitvec![AtomicU16, Lsb0; 0, 1];
++		let _: BitVec<AtomicU16, Msb0> =bitvec![AtomicU16, Msb0; 0, 1];
++		let _: BitVec<RadiumU16, LocalBits> =bitvec![RadiumU16, LocalBits; 1; 100];
++		let _: BitVec<RadiumU16, Lsb0> =bitvec![RadiumU16, Lsb0; 1; 100];
++		let _: BitVec<RadiumU16, Msb0> =bitvec![RadiumU16, Msb0; 1; 100];
++	}
++	#[cfg(target_has_atomic = "32")]
++	{
++		let _: BitVec<AtomicU32, LocalBits> =bitvec![AtomicU32, LocalBits; 0, 1];
++		let _: BitVec<AtomicU32, Lsb0> =bitvec![AtomicU32, Lsb0; 0, 1];
++		let _: BitVec<AtomicU32, Msb0> =bitvec![AtomicU32, Msb0; 0, 1];
++		let _: BitVec<RadiumU32, LocalBits> =bitvec![RadiumU32, LocalBits; 1; 100];
++		let _: BitVec<RadiumU32, Lsb0> =bitvec![RadiumU32, Lsb0; 1; 100];
++		let _: BitVec<RadiumU32, Msb0> =bitvec![RadiumU32, Msb0; 1; 100];
++	}
++	#[cfg(target_has_atomic = "ptr")]
++	{
++		let _: BitVec<AtomicUsize, LocalBits> =bitvec![AtomicUsize, LocalBits; 0, 1];
++		let _: BitVec<AtomicUsize, Lsb0> =bitvec![AtomicUsize, Lsb0; 0, 1];
++		let _: BitVec<AtomicUsize, Msb0> =bitvec![AtomicUsize, Msb0; 0, 1];
++		let _: BitVec<RadiumUsize, LocalBits> =bitvec![RadiumUsize, LocalBits; 1; 100];
++		let _: BitVec<RadiumUsize, Lsb0> =bitvec![RadiumUsize, Lsb0; 1; 100];
++		let _: BitVec<RadiumUsize, Msb0> =bitvec![RadiumUsize, Msb0; 1; 100];
+ 	}
+ 	#[cfg(target_pointer_width = "64")]
+-	radium::if_atomic! {
+-		if atomic(64) {
+-			let _: BitVec<AtomicU64, LocalBits> =bitvec![AtomicU64, LocalBits; 0, 1];
+-			let _: BitVec<AtomicU64, Lsb0> =bitvec![AtomicU64, Lsb0; 0, 1];
+-			let _: BitVec<AtomicU64, Msb0> =bitvec![AtomicU64, Msb0; 0, 1];
+-			let _: BitVec<RadiumU64, LocalBits> =bitvec![RadiumU64, LocalBits; 1; 100];
+-			let _: BitVec<RadiumU64, Lsb0> =bitvec![RadiumU64, Lsb0; 1; 100];
+-			let _: BitVec<RadiumU64, Msb0> =bitvec![RadiumU64, Msb0; 1; 100];
+-		}
++	#[cfg(target_has_atomic = "64")]
++	{
++		let _: BitVec<AtomicU64, LocalBits> =bitvec![AtomicU64, LocalBits; 0, 1];
++		let _: BitVec<AtomicU64, Lsb0> =bitvec![AtomicU64, Lsb0; 0, 1];
++		let _: BitVec<AtomicU64, Msb0> =bitvec![AtomicU64, Msb0; 0, 1];
++		let _: BitVec<RadiumU64, LocalBits> =bitvec![RadiumU64, LocalBits; 1; 100];
++		let _: BitVec<RadiumU64, Lsb0> =bitvec![RadiumU64, Lsb0; 1; 100];
++		let _: BitVec<RadiumU64, Msb0> =bitvec![RadiumU64, Msb0; 1; 100];
+ 	}
+ }
+ 
+@@ -461,50 +464,51 @@ fn compile_bitbox() {
+ 			bitbox![Cell<u64>, crate::order::Msb0; 1; 100];
+ 		let _: BitBox<u64, Msb0> = bitbox![u64, crate::order::Msb0; 1; 100];
+ 	}
+-	radium::if_atomic! {
+-		if atomic(8) {
+-			let _: BitBox<AtomicU8, LocalBits> =bitbox![AtomicU8, LocalBits; 0, 1];
+-			let _: BitBox<AtomicU8, Lsb0> =bitbox![AtomicU8, Lsb0; 0, 1];
+-			let _: BitBox<AtomicU8, Msb0> =bitbox![AtomicU8, Msb0; 0, 1];
+-			let _: BitBox<RadiumU8, LocalBits> =bitbox![RadiumU8, LocalBits; 1; 100];
+-			let _: BitBox<RadiumU8, Lsb0> =bitbox![RadiumU8, Lsb0; 1; 100];
+-			let _: BitBox<RadiumU8, Msb0> =bitbox![RadiumU8, Msb0; 1; 100];
+-		}
+-		if atomic(16) {
+-			let _: BitBox<AtomicU16, LocalBits> =bitbox![AtomicU16, LocalBits; 0, 1];
+-			let _: BitBox<AtomicU16, Lsb0> =bitbox![AtomicU16, Lsb0; 0, 1];
+-			let _: BitBox<AtomicU16, Msb0> =bitbox![AtomicU16, Msb0; 0, 1];
+-			let _: BitBox<RadiumU16, LocalBits> =bitbox![RadiumU16, LocalBits; 1; 100];
+-			let _: BitBox<RadiumU16, Lsb0> =bitbox![RadiumU16, Lsb0; 1; 100];
+-			let _: BitBox<RadiumU16, Msb0> =bitbox![RadiumU16, Msb0; 1; 100];
+-		}
+-		if atomic(32) {
+-			let _: BitBox<AtomicU32, LocalBits> =bitbox![AtomicU32, LocalBits; 0, 1];
+-			let _: BitBox<AtomicU32, Lsb0> =bitbox![AtomicU32, Lsb0; 0, 1];
+-			let _: BitBox<AtomicU32, Msb0> =bitbox![AtomicU32, Msb0; 0, 1];
+-			let _: BitBox<RadiumU32, LocalBits> =bitbox![RadiumU32, LocalBits; 1; 100];
+-			let _: BitBox<RadiumU32, Lsb0> =bitbox![RadiumU32, Lsb0; 1; 100];
+-			let _: BitBox<RadiumU32, Msb0> =bitbox![RadiumU32, Msb0; 1; 100];
+-		}
+-		if atomic(size) {
+-			let _: BitBox<AtomicUsize, LocalBits> =bitbox![AtomicUsize, LocalBits; 0, 1];
+-			let _: BitBox<AtomicUsize, Lsb0> =bitbox![AtomicUsize, Lsb0; 0, 1];
+-			let _: BitBox<AtomicUsize, Msb0> =bitbox![AtomicUsize, Msb0; 0, 1];
+-			let _: BitBox<RadiumUsize, LocalBits> =bitbox![RadiumUsize, LocalBits; 1; 100];
+-			let _: BitBox<RadiumUsize, Lsb0> =bitbox![RadiumUsize, Lsb0; 1; 100];
+-			let _: BitBox<RadiumUsize, Msb0> =bitbox![RadiumUsize, Msb0; 1; 100];
+-		}
++	#[cfg(target_has_atomic = "8")]
++	{
++		let _: BitBox<AtomicU8, LocalBits> =bitbox![AtomicU8, LocalBits; 0, 1];
++		let _: BitBox<AtomicU8, Lsb0> =bitbox![AtomicU8, Lsb0; 0, 1];
++		let _: BitBox<AtomicU8, Msb0> =bitbox![AtomicU8, Msb0; 0, 1];
++		let _: BitBox<RadiumU8, LocalBits> =bitbox![RadiumU8, LocalBits; 1; 100];
++		let _: BitBox<RadiumU8, Lsb0> =bitbox![RadiumU8, Lsb0; 1; 100];
++		let _: BitBox<RadiumU8, Msb0> =bitbox![RadiumU8, Msb0; 1; 100];
++	}
++	#[cfg(target_has_atomic = "16")]
++	{
++		let _: BitBox<AtomicU16, LocalBits> =bitbox![AtomicU16, LocalBits; 0, 1];
++		let _: BitBox<AtomicU16, Lsb0> =bitbox![AtomicU16, Lsb0; 0, 1];
++		let _: BitBox<AtomicU16, Msb0> =bitbox![AtomicU16, Msb0; 0, 1];
++		let _: BitBox<RadiumU16, LocalBits> =bitbox![RadiumU16, LocalBits; 1; 100];
++		let _: BitBox<RadiumU16, Lsb0> =bitbox![RadiumU16, Lsb0; 1; 100];
++		let _: BitBox<RadiumU16, Msb0> =bitbox![RadiumU16, Msb0; 1; 100];
++	}
++	#[cfg(target_has_atomic = "32")]
++	{
++		let _: BitBox<AtomicU32, LocalBits> =bitbox![AtomicU32, LocalBits; 0, 1];
++		let _: BitBox<AtomicU32, Lsb0> =bitbox![AtomicU32, Lsb0; 0, 1];
++		let _: BitBox<AtomicU32, Msb0> =bitbox![AtomicU32, Msb0; 0, 1];
++		let _: BitBox<RadiumU32, LocalBits> =bitbox![RadiumU32, LocalBits; 1; 100];
++		let _: BitBox<RadiumU32, Lsb0> =bitbox![RadiumU32, Lsb0; 1; 100];
++		let _: BitBox<RadiumU32, Msb0> =bitbox![RadiumU32, Msb0; 1; 100];
++	}
++	#[cfg(target_has_atomic = "ptr")]
++	{
++		let _: BitBox<AtomicUsize, LocalBits> =bitbox![AtomicUsize, LocalBits; 0, 1];
++		let _: BitBox<AtomicUsize, Lsb0> =bitbox![AtomicUsize, Lsb0; 0, 1];
++		let _: BitBox<AtomicUsize, Msb0> =bitbox![AtomicUsize, Msb0; 0, 1];
++		let _: BitBox<RadiumUsize, LocalBits> =bitbox![RadiumUsize, LocalBits; 1; 100];
++		let _: BitBox<RadiumUsize, Lsb0> =bitbox![RadiumUsize, Lsb0; 1; 100];
++		let _: BitBox<RadiumUsize, Msb0> =bitbox![RadiumUsize, Msb0; 1; 100];
+ 	}
+ 	#[cfg(target_pointer_width = "64")]
+-	radium::if_atomic! {
+-		if atomic(64) {
+-			let _: BitBox<AtomicU64, LocalBits> =bitbox![AtomicU64, LocalBits; 0, 1];
+-			let _: BitBox<AtomicU64, Lsb0> =bitbox![AtomicU64, Lsb0; 0, 1];
+-			let _: BitBox<AtomicU64, Msb0> =bitbox![AtomicU64, Msb0; 0, 1];
+-			let _: BitBox<RadiumU64, LocalBits> =bitbox![RadiumU64, LocalBits; 1; 100];
+-			let _: BitBox<RadiumU64, Lsb0> =bitbox![RadiumU64, Lsb0; 1; 100];
+-			let _: BitBox<RadiumU64, Msb0> =bitbox![RadiumU64, Msb0; 1; 100];
+-		}
++	#[cfg(target_has_atomic = "64")]
++	{
++		let _: BitBox<AtomicU64, LocalBits> =bitbox![AtomicU64, LocalBits; 0, 1];
++		let _: BitBox<AtomicU64, Lsb0> =bitbox![AtomicU64, Lsb0; 0, 1];
++		let _: BitBox<AtomicU64, Msb0> =bitbox![AtomicU64, Msb0; 0, 1];
++		let _: BitBox<RadiumU64, LocalBits> =bitbox![RadiumU64, LocalBits; 1; 100];
++		let _: BitBox<RadiumU64, Lsb0> =bitbox![RadiumU64, Lsb0; 1; 100];
++		let _: BitBox<RadiumU64, Msb0> =bitbox![RadiumU64, Msb0; 1; 100];
+ 	}
+ }
+ 
+--- a/src/mem.rs
++++ b/src/mem.rs
+@@ -101,30 +101,30 @@ macro_rules! element {
+ 			}
+ 		}
+ 
+-		radium::if_atomic!( if atomic($size) {
+-			use core::sync::atomic::$atom;
+-			impl BitElement<$atom> {
+-				/// Creates a new element wrapper from a raw integer.
+-				pub const fn new(elem: $bare) -> Self {
+-					Self {
+-						elem: <$atom>::new(elem),
+-					}
++		#[cfg(target_has_atomic = $size)]
++		use core::sync::atomic::$atom;
++		#[cfg(target_has_atomic = $size)]
++		impl BitElement<$atom> {
++			/// Creates a new element wrapper from a raw integer.
++			pub const fn new(elem: $bare) -> Self {
++				Self {
++					elem: <$atom>::new(elem),
+ 				}
+ 			}
+-		});
++		}
+ 	)+ };
+ }
+ 
+ element! {
+-	8, u8 => AtomicU8;
+-	16, u16 => AtomicU16;
+-	32, u32 => AtomicU32;
++	"8", u8 => AtomicU8;
++	"16", u16 => AtomicU16;
++	"32", u32 => AtomicU32;
+ }
+ 
+ #[cfg(target_pointer_width = "64")]
+-element!(64, u64 => AtomicU64);
++element!("64", u64 => AtomicU64);
+ 
+-element!(size, usize => AtomicUsize);
++element!("ptr", usize => AtomicUsize);
+ 
+ #[cfg(test)]
+ mod tests {
+--- a/src/serdes.rs
++++ b/src/serdes.rs
+@@ -112,36 +112,39 @@ mod tests {
+ 			Msb0 @ RadiumU8, RadiumU16, RadiumU32, RadiumUsize;
+ 			LocalBits @ RadiumU8, RadiumU16, RadiumU32, RadiumUsize;
+ 		}
+-		radium::if_atomic! {
+-			if atomic(8) {
+-				check_impl! {
+-					Lsb0 @ AtomicU8;
+-					Msb0 @ AtomicU8;
+-					LocalBits @ AtomicU8;
+-				}
++		#[cfg(target_has_atomic = "8")]
++		{
++			check_impl! {
++				Lsb0 @ AtomicU8;
++				Msb0 @ AtomicU8;
++				LocalBits @ AtomicU8;
+ 			}
+-			if atomic(16) {
+-				check_impl! {
+-					Lsb0 @ AtomicU16;
+-					Msb0 @ AtomicU16;
+-					LocalBits @ AtomicU16;
+-				}
++		}
++		#[cfg(target_has_atomic = "16")]
++		{
++			check_impl! {
++				Lsb0 @ AtomicU16;
++				Msb0 @ AtomicU16;
++				LocalBits @ AtomicU16;
+ 			}
+-			if atomic(32) {
+-				check_impl! {
+-					Lsb0 @ AtomicU32;
+-					Msb0 @ AtomicU32;
+-					LocalBits @ AtomicU32;
+-				}
++		}
++		#[cfg(target_has_atomic = "32")]
++		{
++			check_impl! {
++				Lsb0 @ AtomicU32;
++				Msb0 @ AtomicU32;
++				LocalBits @ AtomicU32;
+ 			}
+-			if atomic(ptr) {
+-				check_impl! {
+-					Lsb0 @ AtomicUsize;
+-					Msb0 @ AtomicUsize;
+-					LocalBits @ AtomicUsize;
+-				}
++		}
++		#[cfg(target_has_atomic = "ptr")]
++		{
++			check_impl! {
++				Lsb0 @ AtomicUsize;
++				Msb0 @ AtomicUsize;
++				LocalBits @ AtomicUsize;
+ 			}
+ 		}
++
+ 		#[cfg(target_pointer_width = "64")]
+ 		check_impl! {
+ 			Lsb0 @ u64, RadiumU64;
+@@ -149,12 +152,13 @@ mod tests {
+ 			LocalBits @ u64, RadiumU64;
+ 		}
+ 		#[cfg(target_pointer_width = "64")]
+-		radium::if_atomic!(if atomic(64) {
++		#[cfg(target_has_atomic = "64")]
++		{
+ 			check_impl! {
+ 				Lsb0 @ AtomicU64;
+ 				Msb0 @ AtomicU64;
+ 				LocalBits @ AtomicU64;
+ 			}
+-		});
++		}
+ 	}
+ }
+--- a/src/store.rs
++++ b/src/store.rs
+@@ -199,49 +199,49 @@ store!(usize => BitSafeUsize);
+ /// Generates `BitStore` implementations for atomic types.
+ macro_rules! atomic {
+ 	($($size:tt, $base:ty => $atom:ident);+ $(;)?) => { $(
+-		radium::if_atomic!(if atomic($size) {
+-			use core::sync::atomic::$atom;
++		#[cfg(target_has_atomic = $size)]
++		use core::sync::atomic::$atom;
+ 
+-			impl BitStore for $atom {
+-				type Mem = $base;
+-				type Access = Self;
+-				type Alias = Self;
+-				type Unalias = Self;
+-
+-				const ZERO: Self = <Self>::new(0);
+-
+-				#[inline]
+-				fn new(value: Self::Mem) -> Self { <Self>::new(value) }
+-
+-				#[inline]
+-				fn load_value(&self) -> Self::Mem {
+-					self.load(core::sync::atomic::Ordering::Relaxed)
+-				}
+-
+-				#[inline]
+-				fn store_value(&mut self, value: Self::Mem) {
+-					*self = Self::new(value);
+-				}
+-
+-				const ALIGNED_TO_SIZE: [(); 1]
+-					= [(); mem::aligned_to_size::<Self>() as usize];
++		#[cfg(target_has_atomic = $size)]
++		impl BitStore for $atom {
++			type Mem = $base;
++			type Access = Self;
++			type Alias = Self;
++			type Unalias = Self;
++
++			const ZERO: Self = <Self>::new(0);
++
++			#[inline]
++			fn new(value: Self::Mem) -> Self { <Self>::new(value) }
++
++			#[inline]
++			fn load_value(&self) -> Self::Mem {
++				self.load(core::sync::atomic::Ordering::Relaxed)
++			}
+ 
+-				const ALIAS_WIDTH: [(); 1] = [()];
++			#[inline]
++			fn store_value(&mut self, value: Self::Mem) {
++				*self = Self::new(value);
+ 			}
+-		});
++
++			const ALIGNED_TO_SIZE: [(); 1]
++				= [(); mem::aligned_to_size::<Self>() as usize];
++
++			const ALIAS_WIDTH: [(); 1] = [()];
++		}
+ 	)+ };
+ }
+ 
+ atomic! {
+-	8, u8 => AtomicU8;
+-	16, u16 => AtomicU16;
+-	32, u32 => AtomicU32;
++	"8", u8 => AtomicU8;
++	"16", u16 => AtomicU16;
++	"32", u32 => AtomicU32;
+ }
+ 
+ #[cfg(target_pointer_width = "64")]
+-atomic!(64, u64 => AtomicU64);
++atomic!("64", u64 => AtomicU64);
+ 
+-atomic!(size, usize => AtomicUsize);
++atomic!("ptr", usize => AtomicUsize);
+ 
+ #[cfg(test)]
+ mod tests {
+@@ -265,11 +265,12 @@ mod tests {
+ 		cell.store_value(39);
+ 		assert_eq!(cell.load_value(), 39);
+ 
+-		radium::if_atomic!(if atomic(size) {
++		#[cfg(target_has_atomic = "ptr")]
++		{
+ 			let mut atom = AtomicUsize::new(0);
+ 			atom.store_value(57);
+ 			assert_eq!(atom.load_value(), 57);
+-		});
++		}
+ 	}
+ 
+ 	/// Unaliased `BitSlice`s are universally threadsafe, because they satisfy
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
new file mode 100644
index 0000000000..fa0451a97c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
@@ -0,0 +1,82 @@
+From 560c73cffabc1c2e66552d7c248c0928211d3dea Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 19 Apr 2025 00:09:42 -0700
+Subject: [PATCH] cargo.toml: Update bitvec to use radium 1.x
+
+Upstream-Status: Submitted [https://github.com/ferrilab/bitvec/pull/220]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Cargo.lock | 25 +++++++++++++++++++++++--
+ Cargo.toml |  1 +
+ 2 files changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/Cargo.lock b/Cargo.lock
+index 3bbb1c0..49b2dbf 100644
+--- a/Cargo.lock
++++ b/Cargo.lock
+@@ -43,7 +43,18 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "1bc2832c24239b0141d5674bb9174f9d68a8b5b3f2753311927c172ca46f7e9c"
+ dependencies = [
+  "funty",
+- "radium",
++ "radium 0.7.0",
++ "tap",
++ "wyz",
++]
++
++[[package]]
++name = "bitvec"
++version = "1.1.0"
++source = "git+https://github.com/alexanderkjall/bitvec?branch=upgrade-radium-to-1#d75be941d6e12975f2b06c42535b06b4db91df3b"
++dependencies = [
++ "funty",
++ "radium 1.1.0",
+  "tap",
+  "wyz",
+ ]
+@@ -301,7 +312,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "c024ccb0ed468a474efa325edea34d4198fb601d290c4d1bc24fe31ed11902fc"
+ dependencies = [
+  "ahash",
+- "bitvec",
++ "bitvec 1.0.1",
+  "lexical-parse-float",
+  "num-bigint",
+  "num-traits",
+@@ -428,6 +439,7 @@ version = "2.34.1"
+ dependencies = [
+  "ahash",
+  "base64",
++ "bitvec 1.1.0",
+  "enum_dispatch",
+  "hex",
+  "idna",
+@@ -537,6 +549,15 @@ version = "0.7.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
+ 
++[[package]]
++name = "radium"
++version = "1.1.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "db0b76288902db304c864a12046b73d2d895cc34a4bb8137baaeebe9978a072c"
++dependencies = [
++ "cfg-if",
++]
++
+ [[package]]
+ name = "regex"
+ version = "1.11.1"
+diff --git a/Cargo.toml b/Cargo.toml
+index 40d1fe9..dc19ab6 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -29,6 +29,7 @@ rust-version = "1.75"
+ [dependencies]
+ # TODO it would be very nice to remove the "py-clone" feature as it can panic,
+ # but needs a bit of work to make sure it's not used in the codebase
++bitvec = { git = "https://github.com/alexanderkjall/bitvec", branch = "upgrade-radium-to-1" }
+ pyo3 = { version = "0.24", features = ["generate-import-lib", "num-bigint", "py-clone"] }
+ regex = "1.11.1"
+ strum = { version = "0.26.3", features = ["derive"] }
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.1.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.34.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.33.1.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.34.1.bb
index c7e57cff5b..0e2d065128 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.34.1.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 
 require ${BPN}-crates.inc
 
-SRC_URI[sha256sum] = "bcc9c6fdb0ced789245b02b7d6603e17d1563064ddcfc36f046b61c0c05dd9df"
+SRC_URI += "file://0001-Upgrade-radium-to-1.0.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/bitvec-1.0.1/"
+SRC_URI += "file://0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch"
+SRC_URI[sha256sum] = "6bf31628ab6d0e7c7c0372419898c52ef0a447b33ab47c7f62053bd013cc5b09"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
@@ -46,6 +48,3 @@ do_install_ptest:append () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
-
-# It needs bitvec to adopt radum 1.x see https://github.com/ferrilab/bitvec/pull/220
-COMPATIBLE_HOST:riscv32 = "null"

