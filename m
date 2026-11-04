Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2782.1793772338447062965
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 22:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0byOFpxq;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36c9a93a1abso252656eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 22:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793772338; x=1794377138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPsan/hsLzGWqyaXN2h5W+3vdPQEU52OSsh0WF2zNRo=;
        b=0byOFpxqwB0m1Ta05nUhXll4kNEXQms9jiDPLAf/wlwbvg8BglS4JzI+Gd7uxvVnex
         VUg/kdd2D/8OyAQun/LhC38hNzSCrvZRHekTxfmidwKqRfDySK1ngcsJ7qsbhQd73vsS
         pixBYsXIoPwPnvkIBIhNcn83CiDaUZ5SOrP2A30LBPz9TcicRKSbzL8YRmiYa1ISSiQu
         ToMynKeR982x1kf0AlyiQLkA4Og0b3kj5Pvzp6paCJIPv40pLICDI++WWhb3pcWGwVg7
         1K46CZlrdiflkPNap2MmB8J6vnzN3mkxQBBW8x3bYkx7S1Qsl0RnM6XXCmJF+SozHeR3
         DcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772338; x=1794377138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPsan/hsLzGWqyaXN2h5W+3vdPQEU52OSsh0WF2zNRo=;
        b=mo8E+gVGEZbErPzEiDvESSww7/2WOQHlYKUVq3GzaOME4sqvWenHfJeVwLMpd/O7M6
         P6f0OZU8Bulu/GLppzFRswCUi0Z63d2GE38F6UblR/Ow4dENpdne8Lmrl8CKCUuVOHWG
         HoyIy7kqQ1T/hS0idLecra6hU6cUax4F7C/L4RnBJXClHg5zJ76L8rZIA66tu72/ymva
         AN+AyRNw+fWLRGsvM3KOcVCih+I5Yyjb1VSO0ZTOF8caHBDblF1empsuG7yP36baDdmq
         z17PNvJ2+TgMYFWKlal2BCryFC0Ix8exE1CfWm7t8JInOfn6puiwV57dsxIJmcd+IYqq
         nXwQ==
X-Gm-Message-State: APuU4Z8xUVGa6pqyIpcDLt79L87CMrQSlrynJzQLNYXjXeFzk+SP4Fxz
	TE9/XMvPEVkJ8xXrVrTuD/xL6p6+5GIqU4qNUgKiGpwDjyrGAHS8Ui2hksCMMPFXP7uKPw==
X-Gm-Gg: AYBFou2cS32rXBXRjPpig+vojqiXQvBjKAnj06BW+NRLjpR639dHr/dXcx8i3tqHIKX
	hoQA+7oeDv5rpo9Z3W+aUBQ9o38xvR3/WXORImy6IPxTpwaEDBGzLeCDe9mEDlWVdQGI2JpHrXl
	Pmz/dS0svWMcrd2nMUimPzzaQvZFQg9BuL+VmHHrztY4vUdDVV3uEGBPwSz0tH8CZJMeYKbNTXH
	dHE5gYRR2yBojVsIODZkJ0DF7IYa3XOZYkuqdAgNNeSzLEY4Z1SrI5uH/VboBNiBHrLZOrp04Pl
	851hQszkq6+AJdJanD2ZbOVGolyYgylA2K5jNuGmxO1IjGLO1W+Mb1g/Y56VX/Z+vpmjIociKWz
	veSqB+d/U2Tq5O6lJ9qnhQeB2ghdPLMn4as1ZRqWNicxbNf1jOTj6AO0QOFu54IJQnaQ82evbbK
	1zGoD9M1JVum3F7q8CLI0fRGlyJYeS43dYFf4Wf5PVhcUNIpA3MXk3eF8kEnDmYzjbV4DLJAMYc
	uLi+SFvlHVLWk8QmOhiLwOy8rv03K94850ERf5JLpNasU3E57PP7c1yukxDRrOTdNNGtyDSANKz
	mN73/zRNJFEnpDZGObgNbvj4bIhZ688Dxlwb4GwrPVn70cArooOzTpvphmQdtH8x2pijh1IWnFo
	sM6IUOLdyg6aF7fH5wHU2LNYDRFsEEfP0YK20FsG181frSN9gh+bzmfTj69tMLaFyjW2SHnja4H
	5DMVYj411smUXATpZ9S2/uyz6Od4M+Uy5YTS/ryixR4bPMPD7Bg1ZJsj7pwIuZU7KS83FKEBOnR
	i2V1cLuPDHw55dOaYiHZ9EZAFgX02TGWDLj8dKSBCCLPMHkoYmy3fL66Ui0qYYQ/ZapT0l/uRKM
	UF5+bw==
X-Received: by 2002:a05:693c:8806:20b0:36a:15ba:43ea with SMTP id 5a478bee46e88-36a423407dbmr21888105eec.5.1793772337368;
        Tue, 03 Nov 2026 22:05:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3785430sm5973410eec.3.2026.11.03.22.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:05:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/3] python3-cbor2: Upgrade 6.2.0.post1 -> 6.2.0.post2
Date: Tue,  3 Nov 2026 22:05:32 -0800
Message-ID: <20261104060534.1875273-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 06:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131831
Content-Type: text/plain; charset="utf-8"

Regenerate python3-cbor2-crates.inc to match the bundled Cargo.lock.
The previous crates list was stale (bigdecimal 0.4.10 vs 0.4.11 locked),
which made cargo metadata fail in do_compile with:

  failed to select a version for the requirement `bigdecimal = "^0.4.10"`
  (locked to 0.4.11)

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-cbor2-crates.inc           | 80 +++++++++----------
 ....post1.bb => python3-cbor2_6.2.0.post2.bb} |  2 +-
 2 files changed, 41 insertions(+), 41 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_6.2.0.post1.bb => python3-cbor2_6.2.0.post2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2-crates.inc b/meta-python/recipes-devtools/python/python3-cbor2-crates.inc
index 759cf1a928..f78df6d9d4 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-cbor2-crates.inc
@@ -2,57 +2,57 @@

 # from rust/Cargo.lock
 SRC_URI += " \
-    crate://crates.io/autocfg/1.5.0 \
-    crate://crates.io/bigdecimal/0.4.10 \
-    crate://crates.io/cfg-if/1.0.4 \
+    crate://crates.io/autocfg/1.5.1 \
+    crate://crates.io/bigdecimal/0.4.11 \
+    crate://crates.io/cfg-if/1.0.5 \
     crate://crates.io/crunchy/0.2.4 \
     crate://crates.io/half/2.7.1 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/libc/0.2.182 \
+    crate://crates.io/libc/0.2.191 \
     crate://crates.io/libm/0.2.16 \
-    crate://crates.io/num-bigint/0.4.6 \
-    crate://crates.io/num-integer/0.1.46 \
+    crate://crates.io/num-bigint/0.4.8 \
+    crate://crates.io/num-integer/0.1.47 \
     crate://crates.io/num-traits/0.2.19 \
-    crate://crates.io/once_cell/1.21.3 \
-    crate://crates.io/portable-atomic/1.13.1 \
-    crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3/0.29.0 \
-    crate://crates.io/pyo3-build-config/0.28.2 \
-    crate://crates.io/pyo3-build-config/0.29.0 \
-    crate://crates.io/pyo3-ffi/0.29.0 \
-    crate://crates.io/pyo3-macros/0.29.0 \
-    crate://crates.io/pyo3-macros-backend/0.29.0 \
-    crate://crates.io/quote/1.0.44 \
-    crate://crates.io/syn/2.0.117 \
+    crate://crates.io/once_cell/1.21.4 \
+    crate://crates.io/portable-atomic/1.15.0 \
+    crate://crates.io/proc-macro2/1.0.107 \
+    crate://crates.io/pyo3/0.30.1 \
+    crate://crates.io/pyo3-build-config/0.30.1 \
+    crate://crates.io/pyo3-ffi/0.30.1 \
+    crate://crates.io/pyo3-macros/0.30.1 \
+    crate://crates.io/pyo3-macros-backend/0.30.1 \
+    crate://crates.io/quote/1.0.47 \
+    crate://crates.io/syn/2.0.119 \
+    crate://crates.io/syn/3.0.9 \
     crate://crates.io/target-lexicon/0.13.5 \
-    crate://crates.io/unicode-ident/1.0.24 \
-    crate://crates.io/zerocopy/0.8.40 \
-    crate://crates.io/zerocopy-derive/0.8.40 \
+    crate://crates.io/unicode-ident/1.0.27 \
+    crate://crates.io/zerocopy/0.8.63 \
+    crate://crates.io/zerocopy-derive/0.8.63 \
 "

-SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
-SRC_URI[bigdecimal-0.4.10.sha256sum] = "4d6867f1565b3aad85681f1015055b087fcfd840d6aeee6eee7f2da317603695"
-SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
+SRC_URI[autocfg-1.5.1.sha256sum] = "f2032f911046de80f0a198e0901378627c33f59ea0ac00e363d481118bd70a53"
+SRC_URI[bigdecimal-0.4.11.sha256sum] = "8fa3f3d8cbf4dffcfe4991de61d012bef509a409ecbe9dd41049bfe32b4d4653"
+SRC_URI[cfg-if-1.0.5.sha256sum] = "4e7648175b45a9a48536d676f68d918270699102aa8dab5496df06904c914600"
 SRC_URI[crunchy-0.2.4.sha256sum] = "460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5"
 SRC_URI[half-2.7.1.sha256sum] = "6ea2d84b969582b4b1864a92dc5d27cd2b77b622a8d79306834f1be5ba20d84b"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[libc-0.2.182.sha256sum] = "6800badb6cb2082ffd7b6a67e6125bb39f18782f793520caee8cb8846be06112"
+SRC_URI[libc-0.2.191.sha256sum] = "65cd87c9a6d60536580b316ad985726104730a5151c99845f2490428ef91240a"
 SRC_URI[libm-0.2.16.sha256sum] = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981"
-SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
-SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
+SRC_URI[num-bigint-0.4.8.sha256sum] = "c89e69e7e0f03bea5ef08013795c25018e101932225a656383bd384495ecc367"
+SRC_URI[num-integer-0.1.47.sha256sum] = "7ce2d95d4b3734dc35aa2f45e1aa22cd416814592a4f9d9205e11affd5b8e10b"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
-SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
-SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
-SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-0.29.0.sha256sum] = "cd274650b21d4bfc26a0a47587962c1edb425f69287324355cd040c3ea66071c"
-SRC_URI[pyo3-build-config-0.28.2.sha256sum] = "8bf94ee265674bf76c09fa430b0e99c26e319c945d96ca0d5a8215f31bf81cf7"
-SRC_URI[pyo3-build-config-0.29.0.sha256sum] = "c5e2a7d2f0d013342f295c048ad19237add5154a55b1c5a254c0ec93d4109078"
-SRC_URI[pyo3-ffi-0.29.0.sha256sum] = "ca85c467da1bbc8d866eea5deff9cf29ea5f7785054a17da36e65bda9c05845b"
-SRC_URI[pyo3-macros-0.29.0.sha256sum] = "9ac53762fd065daa3194dd09337a38bd793a188100fd1a9304c4ab312d901771"
-SRC_URI[pyo3-macros-backend-0.29.0.sha256sum] = "4ca3a1557399783172dc5bf39cfca835157732532cba56b71d2292161e53b362"
-SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
-SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
+SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
+SRC_URI[portable-atomic-1.15.0.sha256sum] = "05c8b63e8d9609db387f0324918f81d68fe27748f084ef092fb35954d0539a85"
+SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
+SRC_URI[pyo3-0.30.1.sha256sum] = "229ca13b8a15bb0d1487b81ab975bfcd97513416499a8312011b6036e42e0de4"
+SRC_URI[pyo3-build-config-0.30.1.sha256sum] = "70130e2b6dd1ee589a8788026a429561ca5c40fa7a2fa7914c2282eddae24700"
+SRC_URI[pyo3-ffi-0.30.1.sha256sum] = "5e7ff73c555c286d212d4ce7e5fbda845a973c4f61bd5f160f5f2c3c2a04d1c4"
+SRC_URI[pyo3-macros-0.30.1.sha256sum] = "c46d2e5862c7bb8207e3b639f713dda3c499933444784154c11d013c5a691b60"
+SRC_URI[pyo3-macros-backend-0.30.1.sha256sum] = "38b89f066f2ae72a2aef52d1537ca2fcd104440ebfadee06e97aa90738a25b9b"
+SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
+SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
+SRC_URI[syn-3.0.9.sha256sum] = "d78c8dee4c7bf0e14673097256fed6142ce9d3b85a408189d07482442145823b"
 SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
-SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
-SRC_URI[zerocopy-0.8.40.sha256sum] = "a789c6e490b576db9f7e6b6d661bcc9799f7c0ac8352f56ea20193b2681532e5"
-SRC_URI[zerocopy-derive-0.8.40.sha256sum] = "f65c489a7071a749c849713807783f70672b28094011623e200cb86dcb835953"
+SRC_URI[unicode-ident-1.0.27.sha256sum] = "a2c754d6c33795a1c324727428e5a7dedb5b06195f9890bdbcba760d3e246563"
+SRC_URI[zerocopy-0.8.63.sha256sum] = "e5fe1f8f1b06191a00962174c61aa5005e0bb391a6d80d07e24d115c01a92ed8"
+SRC_URI[zerocopy-derive-0.8.63.sha256sum] = "863ad3ac83293fb4d740aedbfdc9240dd8d1a50c1099acd76ce80ce7c7230c7f"
diff --git a/meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post1.bb b/meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post1.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post2.bb
index aa5839a932..10f8869943 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post1.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post2.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"

-SRC_URI[sha256sum] = "2465ecef686b61e9feee840f506ef1cc15fa568825344c7b0af504b8230b698c"
+SRC_URI[sha256sum] = "3b08ba9f3a556186515000949d478e47e6d55322f9d86bdaef5b4e3d27d48298"

 inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest

