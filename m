Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93097E7C712
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 19:14:20 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1637.1770146058372095002
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 11:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=I9/V2ii0;
 spf=pass (domain: konsulko.com, ip: 209.85.214.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a7d98c1879so39235825ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 11:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1770146057; x=1770750857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcaorUKV0u0NvmoNi5ncAExB2Ic6HtRyuZ1hQZnBNEE=;
        b=I9/V2ii0fZJcFuT/c45oJV5R0C9JFiegrRW7NMQh0Huxcn3Mz/DUV2mwRwS3pYr+WY
         Wb790aw6H8QpdJCq2FCMZyOZ9gb7AJicMoT0EinTB2PRxx/FTr/+Mz8PguYEfry9C+yh
         qbJL0xofV3E3KSNvlxY8+U2euRvAyC9IC+aAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770146057; x=1770750857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZcaorUKV0u0NvmoNi5ncAExB2Ic6HtRyuZ1hQZnBNEE=;
        b=Tg/mEmGQNIoEzK5KgFaC/4DAmdxMQn5w/WRwGxPZy/A2vbyZzhCmhLKYQmWeacI2F1
         d1FqYMwbiLP0RUJi0UMwB2ktNKJX9+JSfgWo6FxBlO9poqHBmdsWVqrAHl0NrA4pWE5d
         Ky3ikFVJCG8vRWYkE/YCdUsjhpeVlBZYfrdIHZqUCERY5GXfeLrJDcJPSjxB/yNVYTZx
         N5mE6A0RgPHI1pR2jQGEd068uAo998tXO8sGrXJjr5wlZ2rmJxYkv6pc2N6NDl6u9GDS
         3luRTFNaagkMFDfQvy/WFGBPpnYg7Ekns6fL20uC4HH7m9mZ6eDmZ8adPr/DK3sn37J3
         gT8w==
X-Gm-Message-State: AOJu0YwiW8CRnMuhW1k+6wh/HaXr2LO6H+EYsMBrtqC2W+KO6nk1rjH8
	NR+rxBZiv4jJQRjxZgQLc9MhTFDe5/AeMT4lJT6RWOXUbXi/lp6VlOjGjlRAl5ypPXt31WTnXok
	YDh5A
X-Gm-Gg: AZuq6aJdi49cGzMdGE3IBJQ/4LN3Cy5psnpX1tBkfjQVF1q/tYJXJWkpGo9KmvxXC/P
	YYuoqqyTCpnhkRxnUubspBEJcvFWBjlKvEW7kDzHaB0lMWQlQaQAQVdZdMiMvwku62z+2YEu9eq
	6uip1WYkLAuILqgeVLubnw/gnEzWs2s2LrkJ1EYfJe5fwUQ+oWw3YCEj+an9O4hwCAgiNB4FBNo
	jHC878H/ZPD+m0tB2JJ0JtGFNHHd6LdTf0OURLiaa85tNPBd730sXfJ8A0pNrN+n7QsnjzMUGNC
	YZOZeclHHkPJ962kTdBr/xm4IzK3PFgaRVBwkvC+4J7PmZFlsDuus2YcgZ0ktH2VF8VOf9xQ9Mv
	Ei6paLDVou5BtlX3zUf3m4qa2N+od/cOeTUuoNJf12oWwaBMGOKJmFlBXvBLd9xt1YJ87TSOti0
	nCZDnIbemsDxBdj5+F6DTqUR0mVd94uPLNIR3yuA1eJStRHgBfrw==
X-Received: by 2002:a17:902:e842:b0:2a1:3ee7:cc75 with SMTP id d9443c01a7336-2a933ceaa38mr3462915ad.19.1770146057226;
        Tue, 03 Feb 2026 11:14:17 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93386e967sm2288375ad.22.2026.02.03.11.14.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 11:14:16 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 v2 5/6] python3-pendulum: add at v3.2.0
Date: Tue,  3 Feb 2026 11:13:54 -0800
Message-ID: <28b86daddafb3e57f8875a4d17975e50e2e9794d.1770145884.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770145884.git.tim.orling@konsulko.com>
References: <cover.1769715106.git.tim.orling@konsulko.com> <cover.1770145884.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 19:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124110

From: Tim Orling <tim.orling@konsulko.com>

Python datetimes made easy.

* Add patch to not strip .so
* Enable ptests
* Use git fetcher so we have tests/

Testsuite summary
TOTAL: 1835
PASS: 1832
SKIP: 3
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 102

Dependency for python3-orjson ptest.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-pendulum-crates.inc        | 52 +++++++++++++++++++
 .../0001-rust-Cargo.toml-inhibit-strip.patch  | 31 +++++++++++
 .../python/python3-pendulum_3.2.0.bb          | 35 +++++++++++++
 4 files changed, 119 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pendulum-crates.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pendulum/0001-rust-Cargo.toml-inhibit-strip.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pendulum_3.2.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 7f4c3cc48f..f647b3bab1 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -60,6 +60,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-parse \
     python3-parse-type \
     python3-parsimonious \
+    python3-pendulum \
     python3-platformdirs \
     python3-polyline \
     python3-portalocker \
diff --git a/meta-python/recipes-devtools/python/python3-pendulum-crates.inc b/meta-python/recipes-devtools/python/python3-pendulum-crates.inc
new file mode 100644
index 0000000000..71a7de9d05
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pendulum-crates.inc
@@ -0,0 +1,52 @@
+# Autogenerated with 'bitbake -c update_crates python3-pendulum'
+
+# from rust/Cargo.lock
+SRC_URI += " \
+    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/cc/1.2.55 \
+    crate://crates.io/find-msvc-tools/0.1.9 \
+    crate://crates.io/heck/0.5.0 \
+    crate://crates.io/indoc/2.0.7 \
+    crate://crates.io/libc/0.2.180 \
+    crate://crates.io/memoffset/0.9.1 \
+    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/portable-atomic/1.13.0 \
+    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/pyo3/0.27.2 \
+    crate://crates.io/pyo3-build-config/0.27.2 \
+    crate://crates.io/pyo3-ffi/0.27.2 \
+    crate://crates.io/pyo3-macros/0.27.2 \
+    crate://crates.io/pyo3-macros-backend/0.27.2 \
+    crate://crates.io/python3-dll-a/0.2.14 \
+    crate://crates.io/quote/1.0.44 \
+    crate://crates.io/rustversion/1.0.22 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/syn/2.0.114 \
+    crate://crates.io/target-lexicon/0.13.4 \
+    crate://crates.io/unicode-ident/1.0.22 \
+    crate://crates.io/unindent/0.2.4 \
+"
+
+SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
+SRC_URI[cc-1.2.55.sha256sum] = "47b26a0954ae34af09b50f0de26458fa95369a0d478d8236d3f93082b219bd29"
+SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
+SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
+SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
+SRC_URI[libc-0.2.180.sha256sum] = "bcc35a38544a891a5f7c865aca548a982ccb3b8650a5b06d0fd33a10283c56fc"
+SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[portable-atomic-1.13.0.sha256sum] = "f89776e4d69bb58bc6993e99ffa1d11f228b839984854c7daeb5d37f87cbe950"
+SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[pyo3-0.27.2.sha256sum] = "ab53c047fcd1a1d2a8820fe84f05d6be69e9526be40cb03b73f86b6b03e6d87d"
+SRC_URI[pyo3-build-config-0.27.2.sha256sum] = "b455933107de8642b4487ed26d912c2d899dec6114884214a0b3bb3be9261ea6"
+SRC_URI[pyo3-ffi-0.27.2.sha256sum] = "1c85c9cbfaddf651b1221594209aed57e9e5cff63c4d11d1feead529b872a089"
+SRC_URI[pyo3-macros-0.27.2.sha256sum] = "0a5b10c9bf9888125d917fb4d2ca2d25c8df94c7ab5a52e13313a07e050a3b02"
+SRC_URI[pyo3-macros-backend-0.27.2.sha256sum] = "03b51720d314836e53327f5871d4c0cfb4fb37cc2c4a11cc71907a86342c40f9"
+SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
+SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
+SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
+SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[syn-2.0.114.sha256sum] = "d4d107df263a3013ef9b1879b0df87d706ff80f65a86ea879bd9c31f9b307c2a"
+SRC_URI[target-lexicon-0.13.4.sha256sum] = "b1dd07eb858a2067e2f3c7155d54e929265c264e6f37efe3ee7a8d1b5a1dd0ba"
+SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
+SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
diff --git a/meta-python/recipes-devtools/python/python3-pendulum/0001-rust-Cargo.toml-inhibit-strip.patch b/meta-python/recipes-devtools/python/python3-pendulum/0001-rust-Cargo.toml-inhibit-strip.patch
new file mode 100644
index 0000000000..f721b9fe40
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pendulum/0001-rust-Cargo.toml-inhibit-strip.patch
@@ -0,0 +1,31 @@
+From 74db4bc77be0e02912975ea198e58addf97bc218 Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Fri, 30 Jan 2026 07:06:05 -0800
+Subject: [PATCH] rust/Cargo.toml: inhibit strip
+
+For OpenEmbedded builds, we want debug symbols which will be stripped
+later by us.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ rust/Cargo.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rust/Cargo.toml b/rust/Cargo.toml
+index 097321f..8bde1fd 100644
+--- a/rust/Cargo.toml
++++ b/rust/Cargo.toml
+@@ -10,7 +10,7 @@ crate-type = ["cdylib"]
+ [profile.release]
+ lto = "fat"
+ codegen-units = 1
+-strip = true
++strip = false
+ overflow-checks = false
+ 
+ [dependencies]
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pendulum_3.2.0.bb b/meta-python/recipes-devtools/python/python3-pendulum_3.2.0.bb
new file mode 100644
index 0000000000..a2dc7e7d9e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pendulum_3.2.0.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Python datetimes made easy"
+DESCRIPTION = "Pendulum is a Python package to ease datetimes manipulation. \
+It provides classes that are drop-in replacements for the native ones (they \
+inherit from them). \
+Special care has been taken to ensure timezones are handled correctly, and \
+are based on the underlying tzinfo implementation. For example, all \
+comparisons are done in UTC or in the timezone of the datetime being used. \
+The default timezone, except when using the now(), method will always be UTC. \
+"
+HOMEPAGE = "https://pendulum.eustace.io"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=869e1c364438f234f09673c4039ed114"
+
+DEPENDS = "python3-maturin-native"
+
+SRCREV = "aea611d7a1c15ed0da56505c3f370fe4446ba733"
+PYPI_SRC_URI = "git://github.com/python-pendulum/pendulum;protocol=https;branch=master;tag=${PV};destsuffix=pendulum-${PV}"
+
+SRC_URI += "file://0001-rust-Cargo.toml-inhibit-strip.patch"
+
+require ${BPN}-crates.inc
+
+inherit pypi python_maturin cargo-update-recipe-crates ptest-python-pytest
+
+do_install_ptest:append() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += "python3-dateutil python3-tzdata"
+
+RDEPENDS:${PN}-ptest += "\
+    python3-dateutil-zoneinfo \
+    python3-time-machine \
+    "
-- 
2.43.0


