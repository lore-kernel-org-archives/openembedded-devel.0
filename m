Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34336.1794851723273393375
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HUk7o1ES;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so4891691eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851723; x=1795456523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHHzQIFzDVDBkEl5wZrBUVm2nNUuJjKNIt2QriI8Afk=;
        b=HUk7o1ESPIEHatGI95TiyKnl5y/utLMMXj7wI8mcWZnMcQBY5U3fhVvMSOh/h4NAtZ
         YSZ1x0kmtFssog/uWTLRiLslTyjF/kQpn1BCR1uiq6635ve8sPltaTQrSLdMltWN0Yb9
         xZIaxgsaYZrX034NdE59gZDY0+/a+femAZ0gqms5fTix1I7IQi81B1as+yKQqAVbVaq9
         uahqRH2aCFvjAx+JSebNO3tUMcs6ogWXBwp+wFRGEYShWFSR3PniTzAwUKjmgHeDyHKT
         +4Nli/ZSh+VdpnDNSyVYeEd0EeqwFJsVQ/weFuiqBByPq9t+JXGNSLs9Si8x3wjlYrC2
         OvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851723; x=1795456523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UHHzQIFzDVDBkEl5wZrBUVm2nNUuJjKNIt2QriI8Afk=;
        b=rs5rrn9kxT7KWY06gInDukSw0RF5yzZyDbnMklTSalvZCx1EYBCloCD6QOhK+yGWec
         KogjtJZHnSQhBCjGkTH3D+fzjNk+n5juNXqfMUy9tDqSPlvxKdFg9MRT9208lhewdnLi
         sUuJIx6zptbYoCqPzwJH96iaJbxvER2tx2IevuR+rJrQhTDwDMpW3qD/vOco8I6oZAmy
         6U8E9ymlA0y5xWryHhaH6zUFhCTiA8c5ckZAYb4IdvuUIwkKwbax6ohbal0eDX2df4iq
         ZUU9aA8UU7S1zva5zUqU+Yg/0n0bNgD32JStgSC5qUnfIJVCJQ/dnmHcUyCYiJkfukqJ
         5SaQ==
X-Gm-Message-State: APuU4Z/ehuFzUFHCz1y/je2tvgZQwE3bVD0ex77aU1toQQXxwxGElaPR
	jPfU1O9DimCej90GakT39Z2OH1c4nlHJEM3CpFANTYDxY5XLNEGMJnv3SuKISH/M
X-Gm-Gg: AZFdTZc+smr+09zqzi+F2Wv0ThjXp6XqkRu0Adv5S6PZRJFl6gnd96mmUr522vKLVvW
	XXyIBWj/2FPWvQtI4qZqQtrCgF6gdKkwMkwfn/BVvyrcOuM1cBNYZhESCqT1+cJX/pCWGJhZUrI
	UTdDb55EsV7LEuUsvhp32BFVBBlNQpbVR4SZrMgRjIfEFgXbJkz7EHY3S0fGAr9aLm2eFo348ix
	vr5P2zkJ2LC0+RZl56KeD+IslAnHMugyF7/5gmnRPO8HoaTU8HqbtJfu78V6AOtc//lYKTx7yiF
	aIvmDbCSl2+/GTlgSbGWLTRcdWv+XN4QUo31CUKOepPJit3gmK9JBIqJ/Bn0m42YRDtBf1a9M1N
	53BeHX4VC2/ZkhsvXwZyUh8SyxQXFvVTZF7x2mSF7TbTwAY6UzbMhb5uIQlV+ITW6kwa0awPHx8
	N19QKh4I8WdJtK/0L1xKExDCYSek380M/ZIAlL3d0SSF7eudGC9s9b30jxSVHCNGc1WGCugOSVq
	CkwhD5owtjuADh3wiCXvrvT7rf62s9pdrRQnHBbgVlo0V4WlqjvE0OUIsGzGjj22GVMMHuIq+rw
	rW+3YrHyCnMn7oO4NEaGen9uQlwuF8V32ov586/mVI0Fy/W/5HhMsAFq7Rlu2+QG6l9++j9qW2K
	ZvQcY1hYhym2SMmu/uRm5WdJRjRhiguDZzImbvkRaaxnvf9WCNJgS76iSVcWJ8b2lzH+F6nmc1m
	05VyPz++0TzJr99on9ktkbioE+3j0r7lzkamBzuFkXddUeE0rajV4RSMIvjp1wNa/VpzPVkW7T9
	vCfsKlOBVaLbEmhTifQVEgFScPL/ZK3CGzSD4nF3glu8Pq9+ZVhpOOM+Mam8rplgirC66f4jxCP
	YTAT
X-Received: by 2002:a05:7300:4faf:b0:369:f961:ccf8 with SMTP id 5a478bee46e88-37967ad9432mr11448953eec.19.1794851722556;
        Mon, 16 Nov 2026 09:55:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 055/105] python3-pendulum: upgrade 3.2.0 -> 3.3.0
Date: Mon, 16 Nov 2026 09:53:07 -0800
Message-ID: <20261116175359.342679-55-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132511
Content-Type: text/plain; charset="utf-8"

Regenerate the crates. Deselect
test_instance_with_aware_datetime_any_tzinfo: dateutil 4 tzfile objects
carry a zoneinfo-style "key", so pendulum now keeps the "Europe/Paris"
name the test expects to be "+02:00".

Changes:
- BREAKING: drop support for Python 3.9; add Python 3.15 and PEP 703
  free-threaded Python support.
- parse() now raises ParserError for an empty string; Timezone and
  FixedTimezone are hashable; time-machine requirement updated to v3.
- Fix diff_for_humans crash for the zh locale, weekday modifiers after
  global calendar layout changes, and DateTime pickling with a
  copied /etc/localtime; replace deprecated utcnow()/utcfromtimestamp().
- Rust extension bumped to PyO3 0.29; add Gujarati locale, fix Japanese,
  Ukrainian and Hindi locales.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-pendulum-crates.inc        | 70 +++++++------------
 ...lum_3.2.0.bb => python3-pendulum_3.3.0.bb} |  6 +-
 2 files changed, 31 insertions(+), 45 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pendulum_3.2.0.bb => python3-pendulum_3.3.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pendulum-crates.inc b/meta-python/recipes-devtools/python/python3-pendulum-crates.inc
index 71a7de9d05..3fff02056c 100644
--- a/meta-python/recipes-devtools/python/python3-pendulum-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pendulum-crates.inc
@@ -2,51 +2,33 @@
 
 # from rust/Cargo.lock
 SRC_URI += " \
-    crate://crates.io/autocfg/1.5.0 \
-    crate://crates.io/cc/1.2.55 \
-    crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/indoc/2.0.7 \
-    crate://crates.io/libc/0.2.180 \
-    crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.21.3 \
-    crate://crates.io/portable-atomic/1.13.0 \
-    crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3/0.27.2 \
-    crate://crates.io/pyo3-build-config/0.27.2 \
-    crate://crates.io/pyo3-ffi/0.27.2 \
-    crate://crates.io/pyo3-macros/0.27.2 \
-    crate://crates.io/pyo3-macros-backend/0.27.2 \
-    crate://crates.io/python3-dll-a/0.2.14 \
-    crate://crates.io/quote/1.0.44 \
-    crate://crates.io/rustversion/1.0.22 \
-    crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/syn/2.0.114 \
-    crate://crates.io/target-lexicon/0.13.4 \
-    crate://crates.io/unicode-ident/1.0.22 \
-    crate://crates.io/unindent/0.2.4 \
+    crate://crates.io/libc/0.2.190 \
+    crate://crates.io/once_cell/1.21.4 \
+    crate://crates.io/portable-atomic/1.15.0 \
+    crate://crates.io/proc-macro2/1.0.107 \
+    crate://crates.io/pyo3/0.29.3 \
+    crate://crates.io/pyo3-build-config/0.29.3 \
+    crate://crates.io/pyo3-ffi/0.29.3 \
+    crate://crates.io/pyo3-macros/0.29.3 \
+    crate://crates.io/pyo3-macros-backend/0.29.3 \
+    crate://crates.io/quote/1.0.47 \
+    crate://crates.io/syn/2.0.119 \
+    crate://crates.io/target-lexicon/0.13.5 \
+    crate://crates.io/unicode-ident/1.0.26 \
 "
 
-SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
-SRC_URI[cc-1.2.55.sha256sum] = "47b26a0954ae34af09b50f0de26458fa95369a0d478d8236d3f93082b219bd29"
-SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
-SRC_URI[libc-0.2.180.sha256sum] = "bcc35a38544a891a5f7c865aca548a982ccb3b8650a5b06d0fd33a10283c56fc"
-SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
-SRC_URI[portable-atomic-1.13.0.sha256sum] = "f89776e4d69bb58bc6993e99ffa1d11f228b839984854c7daeb5d37f87cbe950"
-SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-0.27.2.sha256sum] = "ab53c047fcd1a1d2a8820fe84f05d6be69e9526be40cb03b73f86b6b03e6d87d"
-SRC_URI[pyo3-build-config-0.27.2.sha256sum] = "b455933107de8642b4487ed26d912c2d899dec6114884214a0b3bb3be9261ea6"
-SRC_URI[pyo3-ffi-0.27.2.sha256sum] = "1c85c9cbfaddf651b1221594209aed57e9e5cff63c4d11d1feead529b872a089"
-SRC_URI[pyo3-macros-0.27.2.sha256sum] = "0a5b10c9bf9888125d917fb4d2ca2d25c8df94c7ab5a52e13313a07e050a3b02"
-SRC_URI[pyo3-macros-backend-0.27.2.sha256sum] = "03b51720d314836e53327f5871d4c0cfb4fb37cc2c4a11cc71907a86342c40f9"
-SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
-SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
-SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
-SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
-SRC_URI[syn-2.0.114.sha256sum] = "d4d107df263a3013ef9b1879b0df87d706ff80f65a86ea879bd9c31f9b307c2a"
-SRC_URI[target-lexicon-0.13.4.sha256sum] = "b1dd07eb858a2067e2f3c7155d54e929265c264e6f37efe3ee7a8d1b5a1dd0ba"
-SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
-SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
+SRC_URI[libc-0.2.190.sha256sum] = "ce5d3ddc6d3fa000eb1536d85e147bfe31aacaba692ed6a876f95cb7c855be78"
+SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
+SRC_URI[portable-atomic-1.15.0.sha256sum] = "05c8b63e8d9609db387f0324918f81d68fe27748f084ef092fb35954d0539a85"
+SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
+SRC_URI[pyo3-0.29.3.sha256sum] = "700d18fa267b73b9b521fd7e13580e2f446916f176cacee1ab63fcc8191f1655"
+SRC_URI[pyo3-build-config-0.29.3.sha256sum] = "7b3fc0c4d08f6bb10e71fe39dfb9e2f59c6eb6854e22ec8092f50c69a4499adb"
+SRC_URI[pyo3-ffi-0.29.3.sha256sum] = "dfc0b8e19df29aad7086cf977bb0c2a2f143e30567eb113e9cf72b62ca698330"
+SRC_URI[pyo3-macros-0.29.3.sha256sum] = "6100e8a4b5eba53afaa5ed078364851a0b2499c553a44c31026b929049b49dc6"
+SRC_URI[pyo3-macros-backend-0.29.3.sha256sum] = "6143877a16e82b5a727b7127ff4cd86858a24a28d745d72f43e6f227c7b1bdb3"
+SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
+SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
+SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
+SRC_URI[unicode-ident-1.0.26.sha256sum] = "d245f478577f809a851594d02313b640fb437e0bb33866753cff937863096954"
diff --git a/meta-python/recipes-devtools/python/python3-pendulum_3.2.0.bb b/meta-python/recipes-devtools/python/python3-pendulum_3.3.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pendulum_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pendulum_3.3.0.bb
index a2dc7e7d9e..e7ede83c3f 100644
--- a/meta-python/recipes-devtools/python/python3-pendulum_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pendulum_3.3.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=869e1c364438f234f09673c4039ed114"
 
 DEPENDS = "python3-maturin-native"
 
-SRCREV = "aea611d7a1c15ed0da56505c3f370fe4446ba733"
+SRCREV = "e06dacedc4cdea90fa1286b3965d180ab94cf251"
 PYPI_SRC_URI = "git://github.com/python-pendulum/pendulum;protocol=https;branch=master;tag=${PV};destsuffix=pendulum-${PV}"
 
 SRC_URI += "file://0001-rust-Cargo.toml-inhibit-strip.patch"
@@ -25,6 +25,10 @@ inherit pypi python_maturin cargo-update-recipe-crates ptest-python-pytest
 do_install_ptest:append() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    # dateutil 4 tzfile objects carry a zoneinfo-style "key", so pendulum now
+    # keeps the "Europe/Paris" name instead of the "+02:00" offset the test expects
+    sed -i -e "/--automake/ s|\$| --deselect tests/test_main.py::test_instance_with_aware_datetime_any_tzinfo|" \
+        ${D}${PTEST_PATH}/run-ptest
 }
 
 RDEPENDS:${PN} += "python3-dateutil python3-tzdata"
