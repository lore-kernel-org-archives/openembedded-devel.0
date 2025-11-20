Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2A1CF9C56
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 16:59:07 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1471.1763657940563934389
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 08:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HlQTtJ1U;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso11204135e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 08:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1763657939; x=1764262739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LkNPX0IdtrTS1vM7QJr2H5jj80W92cp8Kp5OPvAHBIA=;
        b=HlQTtJ1UfF9+Y69o+diwvyo3zRy45mQ4gSx6QSK04A+Yzej4Z5A6K033QV0Uz14XXh
         CbNAtkUn/vyT7NJjQmVPIhVg9dNzx+kTDBkKs4iZ01qFJC+n+38s3wA4ujSx2Xjen1ay
         y6A14z6XaXsB8/Dqx4FCNSSjukOEQl9StrfSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763657939; x=1764262739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkNPX0IdtrTS1vM7QJr2H5jj80W92cp8Kp5OPvAHBIA=;
        b=isvKvr5JIgKXPniJu4cVqxQ1ne2koTRQpsI5vxtrYticmXnSQOHwvgxx5lCoy0H3wc
         qeFIzfVOulfBvDzQ5rP9x4TYyftfKoOit56QaCO/fL8YX29aZMG2Yis3gtmmG0m/NqZc
         BcFevD5UhXP/DS7PXIe/qp9jCwHiWee5m34hWNiYHIafyo7C2Q8x17R1/UAcgn6wCvYq
         cULMF4qQsHBOHqK1RxdRTnckOPJ8zQXhdhcTDbP3VAY4onTns5xTd6qyco1WoCoGhIla
         xdwquE2y0pdkUkSHjnTdsuCMZ6O1iqmDf0GyYib/qenQTZLAFHgXvCQkCPxLnoO65Off
         +QFg==
X-Gm-Message-State: AOJu0YyhboQCkmZrymm5QNWZTJ6if97xAQGFVL7Lmrbl71rbqBn+1PkZ
	bM4lQTNw+LGgA0/TPc9lqkazWOCDmheve6YAxIST3euEC81Apraejkw8UxJNNaLBcEzP/Gub7S5
	yYSM5
X-Gm-Gg: ASbGncvi9hQg0qMb74BnP18IxVxqms4mNhuQSDdndvHwzR1g7UCJQ6MI9QdB/LWtQMW
	ysXTbn/7BMfQuFb4IgvrFdyiJ7XD+mnnJFuqLAXWULOgRf/oqxI3cG+oCazO1EvbH7Wd+ffGzi6
	X3UrzDxBe8w8bm6udO2mSTzky0zE6prbJsE7bknUntB/iCUxnKWkGnRsiOUinK8Wex8wQNYuE5w
	uEJGvvdztlnRAHK73auxyUbtQYdlzX21vrmAbx4yLpimLNBhHmNLApm2XDrNHBnt3toOBNVVqRP
	lWTeK8ytC7+6jBsuIKVdNFWEBjsZAlBpatxf9qTQV6ATSLbkwAxxCHdE0o1rNGS5SKQVmVwSKS7
	UCPb/ku2kErnBylNN4rosa3R8vZkyaG0DJOytmoWXoJyv28re5I6SHdjAFqyU8ZP3KS6jua3MpF
	QtTfr4nj86mkfrTwTlAsUe3JNW
X-Google-Smtp-Source: AGHT+IFvWeKsLXRtFgU23cE6gOfmquQ9D+r/YfZ233ezKEPe+vuLxHx9AMXD8wDC/ooDVb911u6IJA==
X-Received: by 2002:a05:600c:3547:b0:477:5aaa:57a3 with SMTP id 5b1f17b1804b1-477bf0ccd75mr1792725e9.2.1763657938451;
        Thu, 20 Nov 2025 08:58:58 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b106a9b0sm117946095e9.11.2025.11.20.08.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 08:58:58 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pydantic-core: Upgrade 2.41.1 -> 2.41.5
Date: Thu, 20 Nov 2025 18:58:52 +0200
Message-ID: <20251120165854.2763894-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 16:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121951

Upgrade to release 2.41.5:

- Correct invalid serialization of date/datetime/time/timedelta
  by pulling downcast checks up
- Avoid getting default values from defaultdict
- ci: add more 3.14t builds, delete duplicate linux aarch64 build
- JsonValue: Deduplicate keys before populating Dict
- Fix: only percent-encode characters in the userinfo encode set
- Bump jiter from 0.11.0 to 0.11.1
- Bump regex from 1.11.3 to 1.12.2
- Bump percent-encoding from 2.3.1 to 2.3.2
- Fix issue with field_serializers on nested typed dicts
- Clean up GC traversal for some top-level types
- Add type inference for serializing ip address types
- Revert url credential encoding (to be reintroduced as an option
  in future)
- optimizations in URL implementation

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pydantic-core-crates.inc   |  18 +-
 ...toml-Update-bitvec-to-use-radium-1.x.patch |  14 +-
 .../python/python3-pydantic-core_2.41.1.bb    |  53 ------
 .../python/python3-pydantic-core_2.41.5.bb    | 155 ++++++++++++++++++
 4 files changed, 170 insertions(+), 70 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core_2.41.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core_2.41.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index 1bee2b03ea..ba13535d1d 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -32,7 +32,7 @@ SRC_URI += " \
     crate://crates.io/idna_adapter/1.2.0 \
     crate://crates.io/indoc/2.0.5 \
     crate://crates.io/itoa/1.0.11 \
-    crate://crates.io/jiter/0.11.0 \
+    crate://crates.io/jiter/0.11.1 \
     crate://crates.io/js-sys/0.3.77 \
     crate://crates.io/lexical-parse-float/1.0.5 \
     crate://crates.io/lexical-parse-integer/1.0.5 \
@@ -46,7 +46,7 @@ SRC_URI += " \
     crate://crates.io/num-integer/0.1.46 \
     crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/once_cell/1.21.3 \
-    crate://crates.io/percent-encoding/2.3.1 \
+    crate://crates.io/percent-encoding/2.3.2 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
     crate://crates.io/pyo3/0.26.0 \
@@ -57,10 +57,9 @@ SRC_URI += " \
     crate://crates.io/python3-dll-a/0.2.14 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/r-efi/5.2.0 \
-    crate://crates.io/radium/0.7.0 \
     crate://crates.io/radium/1.1.0 \
-    crate://crates.io/regex/1.11.3 \
-    crate://crates.io/regex-automata/0.4.11 \
+    crate://crates.io/regex/1.12.2 \
+    crate://crates.io/regex-automata/0.4.13 \
     crate://crates.io/regex-syntax/0.8.5 \
     crate://crates.io/rustversion/1.0.17 \
     crate://crates.io/ryu/1.0.18 \
@@ -136,7 +135,7 @@ SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d
 SRC_URI[idna_adapter-1.2.0.sha256sum] = "daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
 SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
-SRC_URI[jiter-0.11.0.sha256sum] = "ed1be5dfeadf968b30fa03a012a2f161de8be6df2d91bd8085c62cfb5efca65a"
+SRC_URI[jiter-0.11.1.sha256sum] = "8e805fb15a8249d25213202b9098f7b9ad00f8042ccc6f0063d2ae7b33f3d7da"
 SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
 SRC_URI[lexical-parse-float-1.0.5.sha256sum] = "de6f9cb01fb0b08060209a057c048fcbab8717b4c1ecd2eac66ebfe39a65b0f2"
 SRC_URI[lexical-parse-integer-1.0.5.sha256sum] = "72207aae22fc0a121ba7b6d479e42cbfea549af1479c3f3a4f12c70dd66df12e"
@@ -150,7 +149,7 @@ SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e41
 SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
-SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
+SRC_URI[percent-encoding-2.3.2.sha256sum] = "9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
 SRC_URI[pyo3-0.26.0.sha256sum] = "7ba0117f4212101ee6544044dae45abe1083d30ce7b29c4b5cbdfa2354e07383"
@@ -161,10 +160,9 @@ SRC_URI[pyo3-macros-backend-0.26.0.sha256sum] = "100246c0ecf400b475341b8455a9213
 SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[r-efi-5.2.0.sha256sum] = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
-SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
 SRC_URI[radium-1.1.0.sha256sum] = "db0b76288902db304c864a12046b73d2d895cc34a4bb8137baaeebe9978a072c"
-SRC_URI[regex-1.11.3.sha256sum] = "8b5288124840bee7b386bc413c487869b360b2b4ec421ea56425128692f2a82c"
-SRC_URI[regex-automata-0.4.11.sha256sum] = "833eb9ce86d40ef33cb1306d8accf7bc8ec2bfea4355cbdebb3df68b40925cad"
+SRC_URI[regex-1.12.2.sha256sum] = "843bc0191f75f3e22651ae5f1e72939ab2f72a4bc30fa80a066bd66edefc24d4"
+SRC_URI[regex-automata-0.4.13.sha256sum] = "5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
 SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
 SRC_URI[rustversion-1.0.17.sha256sum] = "955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6"
 SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
index ccaae06b7b..e4f19a1e3a 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
@@ -1,4 +1,4 @@
-From c4ebe7d218f7415b7c0137c231a47455b237840b Mon Sep 17 00:00:00 2001
+From 1f0eaed9473f2a60f4a4e2dd95e376cebc0112d9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 19 Apr 2025 00:09:42 -0700
 Subject: [PATCH] cargo.toml: Update bitvec to use radium 1.x
@@ -13,7 +13,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  2 files changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/Cargo.lock b/Cargo.lock
-index c1d0e44..9fc5367 100644
+index 1a7c8ea..3d5eafe 100644
 --- a/Cargo.lock
 +++ b/Cargo.lock
 @@ -49,7 +49,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
@@ -25,15 +25,15 @@ index c1d0e44..9fc5367 100644
   "tap",
   "wyz",
  ]
-@@ -443,6 +443,7 @@ dependencies = [
-  "num-traits",
+@@ -444,6 +444,7 @@ dependencies = [
+  "percent-encoding",
   "pyo3",
   "pyo3-build-config",
 + "radium 1.1.0",
   "regex",
   "serde",
   "serde_json",
-@@ -548,6 +549,15 @@ version = "0.7.0"
+@@ -549,6 +550,15 @@ version = "0.7.0"
  source = "registry+https://github.com/rust-lang/crates.io-index"
  checksum = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
  
@@ -48,9 +48,9 @@ index c1d0e44..9fc5367 100644
 +
  [[package]]
  name = "regex"
- version = "1.11.3"
+ version = "1.12.2"
 diff --git a/Cargo.toml b/Cargo.toml
-index df90031..e671ade 100644
+index a7e86ab..09eaf64 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
 @@ -25,6 +25,8 @@ include = [
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.41.1.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.41.1.bb
deleted file mode 100644
index 611199890e..0000000000
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.41.1.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "Provides the core functionality for pydantic validation and serialization."
-DESCRIPTION = "This package provides the core functionality for \
-pydantic validation and serialization.\
-\
-Pydantic-core is currently around 17x faster than pydantic V1."
-HOMEPAGE = "https://github.com/pydantic/pydantic-core"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
-
-require ${BPN}-crates.inc
-
-SRC_URI += "file://0001-Upgrade-radium-to-1.0.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/bitvec-1.0.1/"
-SRC_URI += "file://atomic.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/radium-1.1.0/"
-SRC_URI += "file://0001-musl-enable-getrandom-on-all-musl-platforms.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/libc-0.2.155/"
-SRC_URI += "file://0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch"
-SRC_URI[sha256sum] = "1ad375859a6d8c356b7704ec0f547a58e82ee80bb41baa811ad710e124bc8f2f"
-
-DEPENDS = "python3-maturin-native python3-typing-extensions"
-
-inherit pypi cargo-update-recipe-crates python_maturin ptest-python-pytest
-
-PYPI_PACKAGE = "pydantic_core"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-
-RDEPENDS:${PN} += " \
-    python3-compression \
-    python3-typing-extensions \
-"
-
-INSANE_SKIP:${PN} = "already-stripped"
-
-# python3-misc is for Lib/timeit.py which is not split out elsewhere
-RDEPENDS:${PN}-ptest += "\
-	python3-dateutil \
-    python3-dirty-equals \
-    python3-hypothesis \
-    python3-inline-snapshot \
-    python3-misc \
-    python3-pytest-mock \
-    python3-pytest-timeout \
-    python3-pytest-benchmark \
-    python3-typing-inspection \
-	python3-tzdata \
-	python3-zoneinfo \
-"
-
-do_install_ptest:append () {
-    cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
-    sed -i -e "/--automake/ s/$/ -k 'not test_model_class_root_validator_wrap and not test_model_class_root_validator_before and not test_model_class_root_validator_after'/" ${D}${PTEST_PATH}/run-ptest
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.41.5.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.41.5.bb
new file mode 100644
index 0000000000..dbd4673734
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.41.5.bb
@@ -0,0 +1,155 @@
+SUMMARY = "Provides the core functionality for pydantic validation and serialization."
+DESCRIPTION = "This package provides the core functionality for \
+pydantic validation and serialization.\
+\
+Pydantic-core is currently around 17x faster than pydantic V1."
+HOMEPAGE = "https://github.com/pydantic/pydantic-core"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
+
+require ${BPN}-crates.inc
+
+SRC_URI += "file://0001-Upgrade-radium-to-1.0.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/bitvec-1.0.1/"
+SRC_URI += "file://atomic.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/radium-1.1.0/"
+SRC_URI += "file://0001-musl-enable-getrandom-on-all-musl-platforms.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/libc-0.2.155/"
+SRC_URI += "file://0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch"
+SRC_URI += "crate://crates.io/ahash/0.8.12 \
+           crate://crates.io/aho-corasick/1.1.3 \
+           crate://crates.io/autocfg/1.3.0 \
+           crate://crates.io/base64/0.22.1 \
+           crate://crates.io/bitflags/2.9.1 \
+           crate://crates.io/bitvec/1.0.1 \
+           crate://crates.io/bumpalo/3.19.0 \
+           crate://crates.io/cc/1.0.101 \
+           crate://crates.io/cfg-if/1.0.0 \
+           crate://crates.io/displaydoc/0.2.5 \
+           crate://crates.io/enum_dispatch/0.3.13 \
+           crate://crates.io/form_urlencoded/1.2.1 \
+           crate://crates.io/funty/2.0.0 \
+           crate://crates.io/getrandom/0.3.3 \
+           crate://crates.io/heck/0.5.0 \
+           crate://crates.io/hex/0.4.3 \
+           crate://crates.io/icu_collections/1.5.0 \
+           crate://crates.io/icu_locid/1.5.0 \
+           crate://crates.io/icu_locid_transform/1.5.0 \
+           crate://crates.io/icu_locid_transform_data/1.5.0 \
+           crate://crates.io/icu_normalizer/1.5.0 \
+           crate://crates.io/icu_normalizer_data/1.5.0 \
+           crate://crates.io/icu_properties/1.5.1 \
+           crate://crates.io/icu_properties_data/1.5.0 \
+           crate://crates.io/icu_provider/1.5.0 \
+           crate://crates.io/icu_provider_macros/1.5.0 \
+           crate://crates.io/idna/1.1.0 \
+           crate://crates.io/idna_adapter/1.2.0 \
+           crate://crates.io/indoc/2.0.5 \
+           crate://crates.io/itoa/1.0.11 \
+           crate://crates.io/jiter/0.11.1 \
+           crate://crates.io/js-sys/0.3.77 \
+           crate://crates.io/lexical-parse-float/1.0.5 \
+           crate://crates.io/lexical-parse-integer/1.0.5 \
+           crate://crates.io/lexical-util/1.0.6 \
+           crate://crates.io/libc/0.2.155 \
+           crate://crates.io/litemap/0.7.3 \
+           crate://crates.io/log/0.4.27 \
+           crate://crates.io/memchr/2.7.4 \
+           crate://crates.io/memoffset/0.9.1 \
+           crate://crates.io/num-bigint/0.4.6 \
+           crate://crates.io/num-integer/0.1.46 \
+           crate://crates.io/num-traits/0.2.19 \
+           crate://crates.io/once_cell/1.21.3 \
+           crate://crates.io/percent-encoding/2.3.2 \
+           crate://crates.io/portable-atomic/1.6.0 \
+           crate://crates.io/proc-macro2/1.0.86 \
+           crate://crates.io/pyo3/0.26.0 \
+           crate://crates.io/pyo3-build-config/0.26.0 \
+           crate://crates.io/pyo3-ffi/0.26.0 \
+           crate://crates.io/pyo3-macros/0.26.0 \
+           crate://crates.io/pyo3-macros-backend/0.26.0 \
+           crate://crates.io/python3-dll-a/0.2.14 \
+           crate://crates.io/quote/1.0.36 \
+           crate://crates.io/r-efi/5.2.0 \
+           crate://crates.io/radium/1.1.0 \
+           crate://crates.io/regex/1.12.2 \
+           crate://crates.io/regex-automata/0.4.13 \
+           crate://crates.io/regex-syntax/0.8.5 \
+           crate://crates.io/rustversion/1.0.17 \
+           crate://crates.io/ryu/1.0.18 \
+           crate://crates.io/serde/1.0.228 \
+           crate://crates.io/serde_core/1.0.228 \
+           crate://crates.io/serde_derive/1.0.228 \
+           crate://crates.io/serde_json/1.0.145 \
+           crate://crates.io/smallvec/1.15.1 \
+           crate://crates.io/speedate/0.17.0 \
+           crate://crates.io/stable_deref_trait/1.2.0 \
+           crate://crates.io/static_assertions/1.1.0 \
+           crate://crates.io/strum/0.27.2 \
+           crate://crates.io/strum_macros/0.27.2 \
+           crate://crates.io/syn/2.0.82 \
+           crate://crates.io/synstructure/0.13.1 \
+           crate://crates.io/tap/1.0.1 \
+           crate://crates.io/target-lexicon/0.13.2 \
+           crate://crates.io/tinystr/0.7.6 \
+           crate://crates.io/unicode-ident/1.0.12 \
+           crate://crates.io/unindent/0.2.3 \
+           crate://crates.io/url/2.5.4 \
+           crate://crates.io/utf16_iter/1.0.5 \
+           crate://crates.io/utf8_iter/1.0.4 \
+           crate://crates.io/uuid/1.18.1 \
+           crate://crates.io/version_check/0.9.5 \
+           crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
+           crate://crates.io/wasm-bindgen/0.2.100 \
+           crate://crates.io/wasm-bindgen-backend/0.2.100 \
+           crate://crates.io/wasm-bindgen-macro/0.2.100 \
+           crate://crates.io/wasm-bindgen-macro-support/0.2.100 \
+           crate://crates.io/wasm-bindgen-shared/0.2.100 \
+           crate://crates.io/wit-bindgen-rt/0.39.0 \
+           crate://crates.io/write16/1.0.0 \
+           crate://crates.io/writeable/0.5.5 \
+           crate://crates.io/wyz/0.5.1 \
+           crate://crates.io/yoke/0.7.4 \
+           crate://crates.io/yoke-derive/0.7.4 \
+           crate://crates.io/zerocopy/0.8.25 \
+           crate://crates.io/zerocopy-derive/0.8.25 \
+           crate://crates.io/zerofrom/0.1.4 \
+           crate://crates.io/zerofrom-derive/0.1.4 \
+           crate://crates.io/zerovec/0.10.4 \
+           crate://crates.io/zerovec-derive/0.10.3 \
+           "
+SRC_URI[sha256sum] = "08daa51ea16ad373ffd5e7606252cc32f07bc72b28284b6bc9c6df804816476e"
+
+DEPENDS = "python3-maturin-native python3-typing-extensions"
+
+inherit pypi cargo-update-recipe-crates python_maturin ptest-python-pytest
+
+PYPI_PACKAGE = "pydantic_core"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+RDEPENDS:${PN} += " \
+    python3-compression \
+    python3-typing-extensions \
+"
+
+INSANE_SKIP:${PN} = "already-stripped"
+
+# python3-misc is for Lib/timeit.py which is not split out elsewhere
+RDEPENDS:${PN}-ptest += "\
+	python3-dateutil \
+    python3-dirty-equals \
+    python3-hypothesis \
+    python3-inline-snapshot \
+    python3-misc \
+    python3-pytest-mock \
+    python3-pytest-timeout \
+    python3-pytest-benchmark \
+    python3-typing-inspection \
+	python3-tzdata \
+	python3-zoneinfo \
+"
+
+do_install_ptest:append () {
+    cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
+    sed -i -e "/--automake/ s/$/ -k 'not test_model_class_root_validator_wrap and not test_model_class_root_validator_before and not test_model_class_root_validator_after'/" ${D}${PTEST_PATH}/run-ptest
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


