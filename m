Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F7ACD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 06:41:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19123.1780382461645796935
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2026 23:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bHW2Qt/l;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490a7876f8cso20024545e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2026 23:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780382460; x=1780987260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ncAc3N2UtYDX4hyMmfZSYDG6QBxeI2182MtIzFZoiFM=;
        b=bHW2Qt/lEn3nd8Xgvi5DvntGT/jLEARhoJV5fcsGzcT3KPaZkr7dyis13SsDjbNaQP
         xwOnWRgsRNR9yHueqS7hhkPK8xVskrX3e42Lz/L1SKhal5L0jnppZgKygnCYeh/DVaqe
         ZRy3hU7n1mPYwIBq3fXa4/ScZ9aHopD6shZyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780382460; x=1780987260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncAc3N2UtYDX4hyMmfZSYDG6QBxeI2182MtIzFZoiFM=;
        b=ftyV9Ab7WY5As/nIPVIkOmffKx8EapmEYthvPulllgY82rLPGDlUBnvO7XsbhYdHhr
         j3j4fOdj7fn1a5wwSQ5lb7Z2HpttGeS9wLyJa2dE+mArWrsuKpBcqbre5C/llqpo7UvU
         TzLaZ9mJna9qpJNnYC6a5Jyt1aVfeHq+dA0IQwXzNhCe6LNmfpyhsg1KRBizzGS9tsEx
         7UwzIb3+L2Lb/BJL6KbclDF1zt5CFwwRtnxSnrIfT+NDcNfPspyWN4GGY2wQM5Tw9OmY
         OlejbdfIDcTj0lcLEmAvPlvkV9lBwTJ/r5OFmYBbDGsybE39JLq7DqQvSHoM1jhRkW2S
         /cgQ==
X-Gm-Message-State: AOJu0Ywo2Ue/QT/289ia6moiCxxbTkQ15yIxR9SUl8OOoOizQEqiXmkm
	b/tC5R9goS99U/5uOFKwvpmsqXIz781CHjfLjhy7CAPWllbpivVtQVAJgjpK60N3+QiI7J+yKAF
	pOlEK
X-Gm-Gg: Acq92OEABn1bqEY2OnmDnMln9wF3o8QwWAz/H0fC11vUWYOl5jzNcWDfsanaivYR5Fc
	0luvOY+7ZGG7E5oatQdi8zxEH/hVMcFZB+25/rXa/QVFHFA1nmlSZFqQqL1G55njR5JKBNgjHT8
	6PXuSmsa8h+osIFaN8829jeyhdbaHK0/3KMUgq/3lz6xC7ZZ3DeW6zi9KVfuQi1hjiIT/05mwjX
	j+OUJL++/yuLZzpryc3judQuc0tnGTt5r8Y5l3wUWxfHiT2zuQt3R29gxW/IMn69RXemCHCMeAp
	sNHxUdkw9Po4Jyd/fbCLCghKmEk9ZnUbmVDS6rbm7XqFwFenU5aCnz0VH667ge+QTLKPTCunzHQ
	5GG3+0cdgCEIJfDku9p59s95uFcrSjUat3XMtzr1xSceibeNUt4/CLXAk9KsDDXzv2xLyHdbwAI
	RKiBKlvQmS6FPyGjCPsRr2Nqp+eEbuI/bN1EfvNXwiRzOa7LQ=
X-Received: by 2002:a05:600c:c0c3:10b0:490:b1ce:1cac with SMTP id 5b1f17b1804b1-490b1ce1e41mr19057585e9.14.1780382459508;
        Mon, 01 Jun 2026 23:40:59 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e2e25asm43020155e9.10.2026.06.01.23.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 23:40:58 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-cbor2: Upgrade 5.9.0 -> 6.1.1
Date: Tue,  2 Jun 2026 09:40:55 +0300
Message-ID: <20260602064055.2631419-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 06:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127321

Upgrade to release 6.1.1:

- Fixed cbor2.load() returning corrupted data for payloads exceeding
  4096 bytes

From 6.1.0:

- Added the allow_duplicate_keys parameter to CBORDecoder, load and
  loads (default: True). When set to False, a CBORDecodeError is raised
  upon encountering a duplicate key within the same map.
- Added support for decoding from any object supporting the buffer API
  (e.g. memoryview or bytearray) in addition to bytes
- Fixed compatibility issues with 32-bit systems

From 6.0.1:

- Fixed an error in the mutability logic during decoding, leading to
  values being decoded as immutable in unexpected places

From 6.0.0:

- MAJOR REWRITE: The Python and C implementations of the encoder and
  decoder were replaced with a single, Rust-based implementation in the
  interest of maintainability.
- BACKWARD INCOMPATIBLE Changed the signature of the tag_hook decoder
  callables to accept (CBORTag, immutable as arguments instead of
  CBORDecoder, CBORTag)
- BACKWARD INCOMPATIBLE Changed the signature of the object_hook decoder
  callables to accept (Mapping[Any, Any], bool) instead of (CBORDecoder,
  dict[Any, Any])
- BACKWARD INCOMPATIBLE Removed the break_marker singleton as no longer
  necessary
- BACKWARD INCOMPATIBLE Removed the CBORDecodeValueError exception,
  instead chaining ValueError or TypeError to a CBORDecodeError
- BACKWARD INCOMPATIBLE Changed the decoding of semantic tag 261 to
  yield an IPv4Interface or IPv6Interface if the address contains host
  bits
- BACKWARD INCOMPATIBLE Removed the individual decoding functions from
  the API as they were mistakenly called directly by users. Please open
  an issue if you need them back.
- BACKWARD INCOMPATIBLE Changed the encoding of IP addresses to use the
  semantic tags 52 and 54 instead of the deprecated 260 and 261
- BACKWARD INCOMPATIBLE Dropped the deprecated cbor2.decoder and
  cbor2.encoder modules - everything in the API is now importable
  directly from cbor2
- BACKWARD INCOMPATIBLE The cbor2.FrozenDict class has now been renamed
  frozendict and is not available on Python 3.15 where the built-in
  frozendict class must be used instead
- Added the semantic_decoders decoder option to add or override decoders
  for specific semantic tags
- Added the immutable decoder flag to always use immutable containers
  where possible when decoding a CBOR stream
- Added the allow_indefinite decoder option to optionally disallow
  indefinite-length strings and containers
- Dropped support for Python 3.9
- Fixed the decoder not rejecting invalid two-byte simple value
  sequences (0xF800 - 0xF81F)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-cbor2-crates.inc           | 56 +++++++++++++++++++
 ...-cbor2_5.9.0.bb => python3-cbor2_6.1.1.bb} |  8 ++-
 2 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2-crates.inc
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.9.0.bb => python3-cbor2_6.1.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2-crates.inc b/meta-python/recipes-devtools/python/python3-cbor2-crates.inc
new file mode 100644
index 0000000000..b7b94b8da1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cbor2-crates.inc
@@ -0,0 +1,56 @@
+# Autogenerated with 'bitbake -c update_crates python3-cbor2'
+
+# from rust/Cargo.lock
+SRC_URI += " \
+    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/bigdecimal/0.4.10 \
+    crate://crates.io/cfg-if/1.0.4 \
+    crate://crates.io/crunchy/0.2.4 \
+    crate://crates.io/half/2.7.1 \
+    crate://crates.io/heck/0.5.0 \
+    crate://crates.io/libc/0.2.182 \
+    crate://crates.io/libm/0.2.16 \
+    crate://crates.io/num-bigint/0.4.6 \
+    crate://crates.io/num-integer/0.1.46 \
+    crate://crates.io/num-traits/0.2.19 \
+    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/portable-atomic/1.13.1 \
+    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/pyo3/0.28.2 \
+    crate://crates.io/pyo3-build-config/0.28.2 \
+    crate://crates.io/pyo3-ffi/0.28.2 \
+    crate://crates.io/pyo3-macros/0.28.2 \
+    crate://crates.io/pyo3-macros-backend/0.28.2 \
+    crate://crates.io/quote/1.0.44 \
+    crate://crates.io/syn/2.0.117 \
+    crate://crates.io/target-lexicon/0.13.5 \
+    crate://crates.io/unicode-ident/1.0.24 \
+    crate://crates.io/zerocopy/0.8.40 \
+    crate://crates.io/zerocopy-derive/0.8.40 \
+"
+
+SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
+SRC_URI[bigdecimal-0.4.10.sha256sum] = "4d6867f1565b3aad85681f1015055b087fcfd840d6aeee6eee7f2da317603695"
+SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
+SRC_URI[crunchy-0.2.4.sha256sum] = "460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5"
+SRC_URI[half-2.7.1.sha256sum] = "6ea2d84b969582b4b1864a92dc5d27cd2b77b622a8d79306834f1be5ba20d84b"
+SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
+SRC_URI[libc-0.2.182.sha256sum] = "6800badb6cb2082ffd7b6a67e6125bb39f18782f793520caee8cb8846be06112"
+SRC_URI[libm-0.2.16.sha256sum] = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981"
+SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
+SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
+SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
+SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[pyo3-0.28.2.sha256sum] = "cf85e27e86080aafd5a22eae58a162e133a589551542b3e5cee4beb27e54f8e1"
+SRC_URI[pyo3-build-config-0.28.2.sha256sum] = "8bf94ee265674bf76c09fa430b0e99c26e319c945d96ca0d5a8215f31bf81cf7"
+SRC_URI[pyo3-ffi-0.28.2.sha256sum] = "491aa5fc66d8059dd44a75f4580a2962c1862a1c2945359db36f6c2818b748dc"
+SRC_URI[pyo3-macros-0.28.2.sha256sum] = "f5d671734e9d7a43449f8480f8b38115df67bef8d21f76837fa75ee7aaa5e52e"
+SRC_URI[pyo3-macros-backend-0.28.2.sha256sum] = "22faaa1ce6c430a1f71658760497291065e6450d7b5dc2bcf254d49f66ee700a"
+SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
+SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
+SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
+SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
+SRC_URI[zerocopy-0.8.40.sha256sum] = "a789c6e490b576db9f7e6b6d661bcc9799f7c0ac8352f56ea20193b2681532e5"
+SRC_URI[zerocopy-derive-0.8.40.sha256sum] = "f65c489a7071a749c849713807783f70672b28094011623e200cb86dcb835953"
diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.9.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_6.1.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.9.0.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_6.1.1.bb
index 42d661ead3..4b4406ffbf 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_6.1.1.bb
@@ -3,9 +3,13 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "85c7a46279ac8f226e1059275221e6b3d0e370d2bb6bd0500f9780781615bcea"
+SRC_URI[sha256sum] = "6f0644869e0fdcd6f3874330b8f1cebd009f33191de43acf609dc2409cd362c4"
 
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
+
+CARGO_SRC_DIR = "rust"
+
+require ${BPN}-crates.inc
 
 RDEPENDS:${PN}-ptest += " \
     python3-hypothesis \
-- 
2.47.3


