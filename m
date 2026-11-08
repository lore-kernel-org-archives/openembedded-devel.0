Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2960.1794165993070817968
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49318428d98so103347f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165991; x=1794770791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ln5D8fs1Z8MrxLq86Cg6jJ3iu3g2teFegf+VOmEx/0k=;
        b=fI3JSzqhyes9pgdKaXsxWsjVqdBy2MvNFa8BpAgkFblBBGJzv9FBDOIJ3k1fJf6FeI
         CX1Dch8iROhKKhE5sAdkIZrLgHkREBq9haZCcSvr0BVGNWIrLDkJz3KrjTdoQU4vx+aY
         75ip6Qznk6UEM64BxuQs5mOsaofapjzS21E9u+PcbA9qE931ZbiCWvEqkxO3xMzGfEDd
         NVvHYOFjVaaJsq5hxCq+pt60F7tfh0pVWfLNGwGgyh6btuVgaeaOTWqSPlvY9v5Lh9um
         K5P+NIX4tGbKr4T0L46yNiknm3I8DBON/ocMysRQHM2ZAHS0bViBZ3PbBpaoWXBSIsnh
         8xAA==
X-Gm-Message-State: APuU4Z8LHrGKMnSqrc8Ybc5wbU5C7afmN0dmLNFaPrwaOJzM8sngKogo
	j4kntSXMoGKOh6MWu8D2XmwuzF+HBNFR7k+4pUsVues6KL0URAUry5y+K3BF5w==
X-Gm-Gg: AYBFou080aXqvL8NSsvPDPh2GiDJKTfFDvWe14Wa4cry4Hxd7TaO7H6fyofaByVSAT1
	HRHKfuVR9T7/vWyOw8zWmHY25NYU2YFDsNc29Xwp7GyMKW+4VZCecTzmRmN/R4n7T5713tuKjP2
	wew5fJNUPCCRuDD3v8tpTqfkzRQ0NwdmvatoMquRAb+zgbsWmz5Y2tyEHZxS1GzMubhfkld4Mcv
	xqe55OCkKlL/I0UmtjY6+QTW7cZ2Eu6RF0bIc7p9jNj2Np9VJdMU3q6Dt58a0Jz687pQEbOswTz
	eZM2geqzuZ1dcrkAfNVZGu3bUcOPO7Tbupxb3mi1z83+4bjUWmqHOohw/sVfNcoI+PsPKbPzdnh
	VnaB5dUzjo3KHoaKmKoZZXFUFi/4ZjOwG4oOouBDSj1rpk3Mgm1G+RDH9PK7PJuKjDbaM6VbKUW
	XNdmhmrP9eUWv59T3tKcnn5kp7MidVYcwzW5+ndn2ENnPpY6ISsIg9/1MwoIFZ3eeQFYn1+wLlz
	YJgPaExFN7a82GRZN8uGcDZYEeXgx3EfBn5cu6kpLWVIN+E/38XB/Lb/3yHjb/d9pEtDr3BkUhs
	K0gKmxsjZAjtSKnD69kpFp24+HN9NZ1FjIswgyBYMa8czWAoiOaSFM9MXEoRTkEDZ4x1hXZ0M5R
	qnb0WDPGQBxZ/cEKlkudpA702rpmEvnHyb6c0nm8k0CY//6753Mye9obfrdg=
X-Received: by 2002:a5d:64c5:0:b0:48e:c0:9441 with SMTP id ffacd0b85a97d-49588ece973mr4733624f8f.29.1794165991176;
        Sun, 08 Nov 2026 11:26:31 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm5808729f8f.8.2026.11.08.11.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:30 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 08/13] python3-orjson: upgrade 3.12.0 -> 3.13.0
Date: Sun,  8 Nov 2026 20:26:13 +0100
Message-ID: <20261108192623.1082770-9-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192623.1082770-1-thomas@roosesweb.de>
References: <20261108192623.1082770-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132030
Content-Type: text/plain; charset="utf-8"

Home Assistant 2026.11 pins orjson 3.13.0.

Refresh the two x86 guard patches and regenerate
python3-orjson-crates.inc with bitbake -c update_crates.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 .../python/python3-orjson-crates.inc          | 40 +++++++++----------
 ...rd-avx512-module-with-x86-target-cfg.patch |  5 +--
 ...e-detection-macro-in-pystrref-object.patch | 11 ++---
 ...son_3.12.0.bb => python3-orjson_3.13.0.bb} |  2 +-
 4 files changed, 24 insertions(+), 34 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-orjson_3.12.0.bb => python3-orjson_3.13.0.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-orjson-crates.inc b/meta-python/recipes-devtools/python/python3-orjson-crates.inc
index 156e974218..cea1dff05a 100644
--- a/meta-python/recipes-devtools/python/python3-orjson-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-orjson-crates.inc
@@ -4,51 +4,47 @@
 SRC_URI += " \
     crate://crates.io/associative-cache/3.0.1 \
     crate://crates.io/bytecount/0.6.9 \
-    crate://crates.io/cc/1.4.3 \
-    crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/encoding_rs/0.8.35 \
-    crate://crates.io/find-msvc-tools/0.1.11 \
+    crate://crates.io/cc/1.6.0 \
+    crate://crates.io/find-msvc-tools/0.1.14 \
     crate://crates.io/gimli/0.34.0 \
     crate://crates.io/itoap/1.0.1 \
-    crate://crates.io/jiff-core/0.1.0 \
-    crate://crates.io/libc/0.2.189 \
+    crate://crates.io/jiff-core/0.1.1 \
+    crate://crates.io/libc/0.2.190 \
     crate://crates.io/no-panic/0.1.37 \
     crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/proc-macro2/1.0.107 \
-    crate://crates.io/pyo3-build-config/0.28.3 \
-    crate://crates.io/pyo3-ffi/0.28.3 \
+    crate://crates.io/pyo3-build-config/0.29.3 \
+    crate://crates.io/pyo3-ffi/0.29.3 \
     crate://crates.io/quote/1.0.47 \
     crate://crates.io/shlex/2.0.1 \
     crate://crates.io/simdutf8/0.1.5 \
-    crate://crates.io/syn/3.0.3 \
+    crate://crates.io/syn/3.0.6 \
     crate://crates.io/target-lexicon/0.13.5 \
-    crate://crates.io/unicode-ident/1.0.24 \
+    crate://crates.io/unicode-ident/1.0.26 \
     crate://crates.io/unwinding/0.2.10 \
-    crate://crates.io/xxhash-rust/0.8.18 \
+    crate://crates.io/xxhash-rust/0.8.19 \
     crate://crates.io/zmij/1.0.23 \
 "
 
 SRC_URI[associative-cache-3.0.1.sha256sum] = "138b4febdc7d0135523c55358c97361fd45089bc65fe859ef21a58d0892deb00"
 SRC_URI[bytecount-0.6.9.sha256sum] = "175812e0be2bccb6abe50bb8d566126198344f707e304f45c648fd8f2cc0365e"
-SRC_URI[cc-1.4.3.sha256sum] = "509591b7bcd67f4ef775afad7662703b4935daaa6ec0e5605cfb1090b32a2b6d"
-SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
-SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
-SRC_URI[find-msvc-tools-0.1.11.sha256sum] = "d45db016d36b838f563236e9193d0ee6ce38f3f68b6c94e914b4929c96bbb890"
+SRC_URI[cc-1.6.0.sha256sum] = "f74872d07caf508b30a21f6836e7d7016a2eaf7d9ff4f48deaa58cd8a0407630"
+SRC_URI[find-msvc-tools-0.1.14.sha256sum] = "aedcfb3409746eddb02b9e19ebda1c3394f759a152e48ee875a0844d1b955484"
 SRC_URI[gimli-0.34.0.sha256sum] = "1033caf0b349c518623b5396bfb2cf0bddf44f0306d543a250e5743297aafd10"
 SRC_URI[itoap-1.0.1.sha256sum] = "9028f49264629065d057f340a86acb84867925865f73bbf8d47b4d149a7e88b8"
-SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09"
-SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
+SRC_URI[jiff-core-0.1.1.sha256sum] = "5e52fe76043ccecc9005d2305ebaadf7d7fc0cc89ca6baa10a94d6bc68c7128c"
+SRC_URI[libc-0.2.190.sha256sum] = "ce5d3ddc6d3fa000eb1536d85e147bfe31aacaba692ed6a876f95cb7c855be78"
 SRC_URI[no-panic-0.1.37.sha256sum] = "fc80370b4544f28ffa317e3c3474ee3ecbfe269196c01ae657d9f837a7d944a1"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
-SRC_URI[pyo3-build-config-0.28.3.sha256sum] = "e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e"
-SRC_URI[pyo3-ffi-0.28.3.sha256sum] = "7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e"
+SRC_URI[pyo3-build-config-0.29.3.sha256sum] = "7b3fc0c4d08f6bb10e71fe39dfb9e2f59c6eb6854e22ec8092f50c69a4499adb"
+SRC_URI[pyo3-ffi-0.29.3.sha256sum] = "dfc0b8e19df29aad7086cf977bb0c2a2f143e30567eb113e9cf72b62ca698330"
 SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[shlex-2.0.1.sha256sum] = "f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba"
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
-SRC_URI[syn-3.0.3.sha256sum] = "53e9bae58849f64dfa4f5d5ae372c8341f7305f82a3868709269343628b659a3"
+SRC_URI[syn-3.0.6.sha256sum] = "8593e8e72159ed2257d083c7a454a85cbf854f37a0966d8d483aff8c8a3ebcee"
 SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
-SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
+SRC_URI[unicode-ident-1.0.26.sha256sum] = "d245f478577f809a851594d02313b640fb437e0bb33866753cff937863096954"
 SRC_URI[unwinding-0.2.10.sha256sum] = "4b134ada16dda9e435abe2a6d76a01d497bc60707357845a15f9b0ed42dc88ce"
-SRC_URI[xxhash-rust-0.8.18.sha256sum] = "aee1b19627c7c60102ab80d3a9cbe18de90bfe03bfa6c3715447681f0e8c8af6"
+SRC_URI[xxhash-rust-0.8.19.sha256sum] = "550a2b930b62486a393c52d5c3b84bff264b28aa437ed64694d31e93b1757af7"
 SRC_URI[zmij-1.0.23.sha256sum] = "29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b"
diff --git a/meta-python/recipes-devtools/python/python3-orjson/0001-Guard-avx512-module-with-x86-target-cfg.patch b/meta-python/recipes-devtools/python/python3-orjson/0001-Guard-avx512-module-with-x86-target-cfg.patch
index 604030e062..0dbb16322a 100644
--- a/meta-python/recipes-devtools/python/python3-orjson/0001-Guard-avx512-module-with-x86-target-cfg.patch
+++ b/meta-python/recipes-devtools/python/python3-orjson/0001-Guard-avx512-module-with-x86-target-cfg.patch
@@ -1,4 +1,4 @@
-From c5c46664a914d3a7f048c51c3b9c2ab13e21ed1b Mon Sep 17 00:00:00 2001
+From a2acfc8ab636148cc9a2ba81ee03698703154ff0 Mon Sep 17 00:00:00 2001
 From: Tim Orling <tim.orling@konsulko.com>
 Date: Thu, 29 Jan 2026 09:59:55 -0800
 Subject: [PATCH] Guard avx512 module with x86 target cfg
@@ -32,6 +32,3 @@ index e4c7697..46450ac 100644
  #[target_feature(enable = "avx512f,avx512bw,avx512vl,bmi2")]
  pub(crate) unsafe fn create_str_impl_avx512vl(buf: &str) -> *mut crate::ffi::PyObject {
      unsafe {
--- 
-2.39.5
-
diff --git a/meta-python/recipes-devtools/python/python3-orjson/0002-Guard-x86-feature-detection-macro-in-pystrref-object.patch b/meta-python/recipes-devtools/python/python3-orjson/0002-Guard-x86-feature-detection-macro-in-pystrref-object.patch
index 59105e723c..0a699addc7 100644
--- a/meta-python/recipes-devtools/python/python3-orjson/0002-Guard-x86-feature-detection-macro-in-pystrref-object.patch
+++ b/meta-python/recipes-devtools/python/python3-orjson/0002-Guard-x86-feature-detection-macro-in-pystrref-object.patch
@@ -1,7 +1,7 @@
-From 7ef16220caaa82f7a90047c8c9b5ff2eeb15b9ce Mon Sep 17 00:00:00 2001
+From 00ea35a6fa570e449f3023322f112b3e1f700fea Mon Sep 17 00:00:00 2001
 From: Tim Orling <tim.orling@konsulko.com>
 Date: Thu, 29 Jan 2026 10:22:31 -0800
-Subject: [PATCH 2/2] Guard x86 feature detection macro in pystrref/object.rs
+Subject: [PATCH] Guard x86 feature detection macro in pystrref/object.rs
 
 The std::is_x86_feature_detected! macro only works on x86/x86_64
 targets. This patch wraps the feature detection and AVX-512 code path
@@ -18,10 +18,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/ffi/pystrref/object.rs b/src/ffi/pystrref/object.rs
-index 9ef12eb..7c2c046 100644
+index 69069fa..ba0bbe1 100644
 --- a/src/ffi/pystrref/object.rs
 +++ b/src/ffi/pystrref/object.rs
-@@ -29,6 +29,7 @@ static mut STR_CREATE_FN: StrDeserializer = super::scalar::str_impl_kind_scalar;
+@@ -32,6 +32,7 @@ static mut STR_CREATE_FN: StrDeserializer = super::scalar::str_impl_kind_scalar;
  
  pub fn set_str_create_fn() {
      unsafe {
@@ -29,6 +29,3 @@ index 9ef12eb..7c2c046 100644
          #[cfg(all(CPython, feature = "avx512"))]
          if std::is_x86_feature_detected!("avx512vl") {
              STR_CREATE_FN = super::avx512::create_str_impl_avx512vl;
--- 
-2.39.5
-
diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.12.0.bb b/meta-python/recipes-devtools/python/python3-orjson_3.13.0.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-orjson_3.12.0.bb
rename to meta-python/recipes-devtools/python/python3-orjson_3.13.0.bb
index 0be63c6c8a..cad988c2f7 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/orjson/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
 
-SRCREV = "6737895a1a4e3e26df0569a40147893a786f9a58"
+SRCREV = "bd00937c5c46ab20eb5d7fe1cfc034b906c4578f"
 PYPI_SRC_URI = "git://github.com/ijl/orjson;protocol=https;branch=master;tag=${PV};destsuffix=orjson-${PV}"
 
 CVE_PRODUCT = "orjson"
-- 
2.56.0

