Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6181E8785D
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 19:14:10 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1602.1770146048902562074
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 11:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SBqtKqkP;
 spf=pass (domain: konsulko.com, ip: 209.85.214.180, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a7a23f5915so40428135ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 11:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1770146048; x=1770750848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duP/pbnnwz5ewvko6hTo1raHRh11Dfhyl46jnt6+lkk=;
        b=SBqtKqkPX55lEx8nHpm+HKUQayc+ADy9Yc8lEUwALfsDW9aMZy1q0eY7eXLOtxT37J
         1nc4ehuV8KMO+a546YgHbOvpRn47fOjgeu4FC/Nx/GIyiWpjUAPUYO89XVXsNk6afhyX
         T/bh7ZEBp8TXlTSNLg+Dv0/+sZTjNsMfaJx0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770146048; x=1770750848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=duP/pbnnwz5ewvko6hTo1raHRh11Dfhyl46jnt6+lkk=;
        b=OJzmjR/J6dZ5hNQZ5SDaMkRSnZCPnK1eEXnwxEORTMq9U/Vkgy5CSp9wuFrGtjUWWp
         qmgPTPYgGHAGIThmXwix8OFw+EhANCziLjGd+CnRumNfCdFWW/66bvi04z7PMDlTU/Tp
         Qrq263ptzmLTsVbu414WWKa5DduVuo2hhalpjDi6Sx1VbgoHft+1eRjFMlWkWrjjqFOA
         CXS4ZrSeVpNXi2EO9xEYweedQ8sdWHrnJq1g1IFTh6mrpkxZJnF351iDN467KlaPeQhC
         ZpB4EwZlW4qRFx9/1kxKh332BualArYSXoF2wfUCGgLyIVjJLVNomlzaKEq+dRBVRqJD
         UT7w==
X-Gm-Message-State: AOJu0YzrreyIEoABjMuKJ9SqiR0p12dzb7RrUlxoHsjx108zRQzp08hS
	qgNkznRp083xCY79S+CeHSUcvaTjLarhTqCrdrMucIi5UvnIHO96Ws0fD0taND/tTmoo2wzV3QK
	nmtKE
X-Gm-Gg: AZuq6aJgd2kY70OpCMAC7TeQXhC91oHOE7Dhe7vmQj8olhZmglcjVMdoV3ckmM7f/Zi
	Qpf6677jkZjIMk46709oOccakPUo+pruYT16RQD1YQe7Ibv2YlU0z/+6TG/EerNNlUNygDBddjK
	X6Od9xRUB1tJLpX8DUTmZqlHTqeevTMzvSRZsrnR9PrG0yqkSR6XOUbS+XzGYmirWTwqNJN20eD
	o6DT8Tk4532UrHJOjMbGRzhnN77nFv+XxUA6om7FHftf2YyWQ6gMHx/zlyJixkVtAmYIK7Hm8DV
	IKqeUHhggYAgFYd6fQcXvlQvZcZga6oUW3IoDFkMicmJR9j+CoF7UCV7BQznnjIuos+71TDo+Ib
	fZEYw8eD/dWJAGz6bdFSVmBejENxmPjGEQcjMnaTGdr9fTpzbqmpu5+uj/MmhAl3cUkFVeCjunr
	oDHyUkDJMXOuthVf+yOtiBVKW93/M4Ae2kMO4J/jxF5vBa9qqPxw==
X-Received: by 2002:a17:902:ea0e:b0:29f:e787:2b9b with SMTP id d9443c01a7336-2a933eada62mr2799375ad.41.1770146047732;
        Tue, 03 Feb 2026 11:14:07 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9335f9a3bsm2308155ad.0.2026.02.03.11.14.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 11:14:07 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 v2 1/6] python3-orjson: upgrade 3.10.17 -> 3.11.6
Date: Tue,  3 Feb 2026 11:13:50 -0800
Message-ID: <75e1e07d9d60a538d2a036ec6d98007e22639271.1770145884.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770145884.git.tim.orling@konsulko.com>
References: <cover.1769715106.git.tim.orling@konsulko.com> <cover.1770145884.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 19:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124106

From: Tim Orling <tim.orling@konsulko.com>

Update python3-orjson-crates.inc

Add patches to fix compilation for arm64/riscv64 by gating x86/x86_64 only
AVX512 feature(s). The approach has thus far been rejected by upstream:
https://github.com/ijl/orjson/pull/609.

Release Notes:
https://github.com/ijl/orjson/blob/master/CHANGELOG.md#3116---2026-01-29

* orjson now includes code licensed under the Mozilla Public License 2.0
  (MPL-2.0).
* Drop support for Python 3.9.
* ABI compatibility with CPython 3.15 alpha 5.
* Build now depends on Rust 1.89 or later instead of 1.85.
* Fix sporadic crash serializing deeply nested list of dict.
* Show simple error message instead of traceback when attempting to build
  on unsupported Python versions.
* ABI compatibility with CPython 3.15 alpha 1.
* Publish PyPI wheels for 3.14 and manylinux i686, manylinux arm7, manylinux
  ppc64le, manylinux s390x.
* Build now requires a C compiler.
* Fix PyPI project metadata when using maturin 1.9.2 or later.
* Fix build using Rust 1.89 on amd64.
* Build now depends on Rust 1.85 or later instead of 1.82.
* Publish PyPI wheels for CPython 3.14.
* Fix str on big-endian architectures. This was introduced in 3.11.0.
* Use a deserialization buffer allocated per request instead of a shared
  buffer allocated on import.
* ABI compatibility with CPython 3.14 beta 4.
* Fix incorrect escaping of the vertical tabulation character. This was
  introduced in 3.10.17.

Comparing changes:
https://github.com/ijl/orjson/compare/3.10.17...3.11.6

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-orjson-crates.inc          | 124 +++++++++---------
 ...rd-avx512-module-with-x86-target-cfg.patch |  37 ++++++
 ...e-detection-macro-in-pystrref-object.patch |  34 +++++
 ...on_3.10.17.bb => python3-orjson_3.11.6.bb} |   6 +-
 4 files changed, 140 insertions(+), 61 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-orjson/0001-Guard-avx512-module-with-x86-target-cfg.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-orjson/0002-Guard-x86-feature-detection-macro-in-pystrref-object.patch
 rename meta-python/recipes-devtools/python/{python3-orjson_3.10.17.bb => python3-orjson_3.11.6.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-orjson-crates.inc b/meta-python/recipes-devtools/python/python3-orjson-crates.inc
index 76ed174329..43434fa690 100644
--- a/meta-python/recipes-devtools/python/python3-orjson-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-orjson-crates.inc
@@ -3,82 +3,86 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/associative-cache/2.0.0 \
-    crate://crates.io/bytecount/0.6.8 \
-    crate://crates.io/castaway/0.2.3 \
-    crate://crates.io/cc/1.2.20 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/compact_str/0.9.0 \
-    crate://crates.io/crunchy/0.2.3 \
+    crate://crates.io/bytecount/0.6.9 \
+    crate://crates.io/bytes/1.11.0 \
+    crate://crates.io/cc/1.2.54 \
+    crate://crates.io/cfg-if/1.0.4 \
+    crate://crates.io/crunchy/0.2.4 \
     crate://crates.io/encoding_rs/0.8.35 \
-    crate://crates.io/gimli/0.31.1 \
-    crate://crates.io/half/2.6.0 \
-    crate://crates.io/itoa/1.0.15 \
+    crate://crates.io/find-msvc-tools/0.1.8 \
+    crate://crates.io/gimli/0.32.3 \
+    crate://crates.io/half/2.7.1 \
+    crate://crates.io/itoa/1.0.17 \
     crate://crates.io/itoap/1.0.1 \
-    crate://crates.io/jiff/0.2.10 \
-    crate://crates.io/jiff-static/0.2.10 \
-    crate://crates.io/libc/0.2.172 \
-    crate://crates.io/memchr/2.7.4 \
+    crate://crates.io/jiff/0.2.18 \
+    crate://crates.io/jiff-static/0.2.18 \
+    crate://crates.io/libc/0.2.180 \
+    crate://crates.io/memchr/2.7.6 \
     crate://crates.io/once_cell/1.21.3 \
-    crate://crates.io/portable-atomic/1.11.0 \
+    crate://crates.io/portable-atomic/1.13.0 \
     crate://crates.io/portable-atomic-util/0.2.4 \
-    crate://crates.io/proc-macro2/1.0.95 \
-    crate://crates.io/pyo3-build-config/0.23.3 \
-    crate://crates.io/pyo3-ffi/0.23.3 \
-    crate://crates.io/quote/1.0.40 \
-    crate://crates.io/rustversion/1.0.20 \
-    crate://crates.io/ryu/1.0.20 \
-    crate://crates.io/serde/1.0.219 \
-    crate://crates.io/serde_derive/1.0.219 \
-    crate://crates.io/serde_json/1.0.140 \
+    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/pyo3-build-config/0.27.2 \
+    crate://crates.io/pyo3-ffi/0.27.2 \
+    crate://crates.io/quote/1.0.44 \
+    crate://crates.io/ryu/1.0.22 \
+    crate://crates.io/serde/1.0.228 \
+    crate://crates.io/serde_core/1.0.228 \
+    crate://crates.io/serde_derive/1.0.228 \
+    crate://crates.io/serde_json/1.0.149 \
     crate://crates.io/shlex/1.3.0 \
     crate://crates.io/simdutf8/0.1.5 \
-    crate://crates.io/smallvec/1.15.0 \
-    crate://crates.io/static_assertions/1.1.0 \
-    crate://crates.io/syn/2.0.101 \
-    crate://crates.io/target-lexicon/0.13.2 \
-    crate://crates.io/unicode-ident/1.0.18 \
-    crate://crates.io/unwinding/0.2.5 \
-    crate://crates.io/uuid/1.16.0 \
+    crate://crates.io/smallvec/1.15.1 \
+    crate://crates.io/syn/2.0.114 \
+    crate://crates.io/target-lexicon/0.13.4 \
+    crate://crates.io/unicode-ident/1.0.22 \
+    crate://crates.io/unwinding/0.2.8 \
+    crate://crates.io/uuid/1.20.0 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/xxhash-rust/0.8.15 \
+    crate://crates.io/zerocopy/0.8.35 \
+    crate://crates.io/zerocopy-derive/0.8.35 \
+    crate://crates.io/zmij/1.0.17 \
 "
 
 SRC_URI[associative-cache-2.0.0.sha256sum] = "b993cd767a2bc7307dd87622311ca22c44329cc7a21366206bfa0896827b2bad"
-SRC_URI[bytecount-0.6.8.sha256sum] = "5ce89b21cab1437276d2650d57e971f9d548a2d9037cc231abdc0562b97498ce"
-SRC_URI[castaway-0.2.3.sha256sum] = "0abae9be0aaf9ea96a3b1b8b1b55c602ca751eba1b1500220cea4ecbafe7c0d5"
-SRC_URI[cc-1.2.20.sha256sum] = "04da6a0d40b948dfc4fa8f5bbf402b0fc1a64a28dbf7d12ffd683550f2c1b63a"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[compact_str-0.9.0.sha256sum] = "3fdb1325a1cece981e8a296ab8f0f9b63ae357bd0784a9faaf548cc7b480707a"
-SRC_URI[crunchy-0.2.3.sha256sum] = "43da5946c66ffcc7745f48db692ffbb10a83bfe0afd96235c5c2a4fb23994929"
+SRC_URI[bytecount-0.6.9.sha256sum] = "175812e0be2bccb6abe50bb8d566126198344f707e304f45c648fd8f2cc0365e"
+SRC_URI[bytes-1.11.0.sha256sum] = "b35204fbdc0b3f4446b89fc1ac2cf84a8a68971995d0bf2e925ec7cd960f9cb3"
+SRC_URI[cc-1.2.54.sha256sum] = "6354c81bbfd62d9cfa9cb3c773c2b7b2a3a482d569de977fd0e961f6e7c00583"
+SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
+SRC_URI[crunchy-0.2.4.sha256sum] = "460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
-SRC_URI[gimli-0.31.1.sha256sum] = "07e28edb80900c19c28f1072f2e8aeca7fa06b23cd4169cefe1af5aa3260783f"
-SRC_URI[half-2.6.0.sha256sum] = "459196ed295495a68f7d7fe1d84f6c4b7ff0e21fe3017b2f283c6fac3ad803c9"
-SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
+SRC_URI[find-msvc-tools-0.1.8.sha256sum] = "8591b0bcc8a98a64310a2fae1bb3e9b8564dd10e381e6e28010fde8e8e8568db"
+SRC_URI[gimli-0.32.3.sha256sum] = "e629b9b98ef3dd8afe6ca2bd0f89306cec16d43d907889945bc5d6687f2f13c7"
+SRC_URI[half-2.7.1.sha256sum] = "6ea2d84b969582b4b1864a92dc5d27cd2b77b622a8d79306834f1be5ba20d84b"
+SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
 SRC_URI[itoap-1.0.1.sha256sum] = "9028f49264629065d057f340a86acb84867925865f73bbf8d47b4d149a7e88b8"
-SRC_URI[jiff-0.2.10.sha256sum] = "5a064218214dc6a10fbae5ec5fa888d80c45d611aba169222fc272072bf7aef6"
-SRC_URI[jiff-static-0.2.10.sha256sum] = "199b7932d97e325aff3a7030e141eafe7f2c6268e1d1b24859b753a627f45254"
-SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
-SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
+SRC_URI[jiff-0.2.18.sha256sum] = "e67e8da4c49d6d9909fe03361f9b620f58898859f5c7aded68351e85e71ecf50"
+SRC_URI[jiff-static-0.2.18.sha256sum] = "e0c84ee7f197eca9a86c6fd6cb771e55eb991632f15f2bc3ca6ec838929e6e78"
+SRC_URI[libc-0.2.180.sha256sum] = "bcc35a38544a891a5f7c865aca548a982ccb3b8650a5b06d0fd33a10283c56fc"
+SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
-SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
+SRC_URI[portable-atomic-1.13.0.sha256sum] = "f89776e4d69bb58bc6993e99ffa1d11f228b839984854c7daeb5d37f87cbe950"
 SRC_URI[portable-atomic-util-0.2.4.sha256sum] = "d8a2f0d8d040d7848a709caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
-SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
-SRC_URI[pyo3-build-config-0.23.3.sha256sum] = "dc0e0469a84f208e20044b98965e1561028180219e35352a2afaf2b942beff3b"
-SRC_URI[pyo3-ffi-0.23.3.sha256sum] = "eb1547a7f9966f6f1a0f0227564a9945fe36b90da5a93b3933fc3dc03fae372d"
-SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
-SRC_URI[rustversion-1.0.20.sha256sum] = "eded382c5f5f786b989652c49544c4877d9f015cc22e145a5ea8ea66c2921cd2"
-SRC_URI[ryu-1.0.20.sha256sum] = "28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f"
-SRC_URI[serde-1.0.219.sha256sum] = "5f0e2c6ed6606019b4e29e69dbaba95b11854410e5347d525002456dbbb786b6"
-SRC_URI[serde_derive-1.0.219.sha256sum] = "5b0276cf7f2c73365f7157c8123c21cd9a50fbbd844757af28ca1f5925fc2a00"
-SRC_URI[serde_json-1.0.140.sha256sum] = "20068b6e96dc6c9bd23e01df8827e6c7e1f2fddd43c21810382803c136b99373"
+SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[pyo3-build-config-0.27.2.sha256sum] = "b455933107de8642b4487ed26d912c2d899dec6114884214a0b3bb3be9261ea6"
+SRC_URI[pyo3-ffi-0.27.2.sha256sum] = "1c85c9cbfaddf651b1221594209aed57e9e5cff63c4d11d1feead529b872a089"
+SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
+SRC_URI[ryu-1.0.22.sha256sum] = "a50f4cf475b65d88e057964e0e9bb1f0aa9bbb2036dc65c64596b42932536984"
+SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
+SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
+SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
-SRC_URI[smallvec-1.15.0.sha256sum] = "8917285742e9f3e1683f0a9c4e6b57960b7314d0b08d30d1ecd426713ee2eee9"
-SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
-SRC_URI[syn-2.0.101.sha256sum] = "8ce2b7fc941b3a24138a0a7cf8e858bfc6a992e7978a068a5c760deb0ed43caf"
-SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
-SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
-SRC_URI[unwinding-0.2.5.sha256sum] = "51f06a05848f650946acef3bf525fe96612226b61f74ae23ffa4e98bfbb8ab3c"
-SRC_URI[uuid-1.16.0.sha256sum] = "458f7a779bf54acc9f347480ac654f68407d3aab21269a6e3c9f922acd9e2da9"
+SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
+SRC_URI[syn-2.0.114.sha256sum] = "d4d107df263a3013ef9b1879b0df87d706ff80f65a86ea879bd9c31f9b307c2a"
+SRC_URI[target-lexicon-0.13.4.sha256sum] = "b1dd07eb858a2067e2f3c7155d54e929265c264e6f37efe3ee7a8d1b5a1dd0ba"
+SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
+SRC_URI[unwinding-0.2.8.sha256sum] = "60612c845ef41699f39dc8c5391f252942c0a88b7d15da672eff0d14101bbd6d"
+SRC_URI[uuid-1.20.0.sha256sum] = "ee48d38b119b0cd71fe4141b30f5ba9c7c5d9f4e7a3a8b4a674e4b6ef789976f"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[xxhash-rust-0.8.15.sha256sum] = "fdd20c5420375476fbd4394763288da7eb0cc0b8c11deed431a91562af7335d3"
+SRC_URI[zerocopy-0.8.35.sha256sum] = "fdea86ddd5568519879b8187e1cf04e24fce28f7fe046ceecbce472ff19a2572"
+SRC_URI[zerocopy-derive-0.8.35.sha256sum] = "0c15e1b46eff7c6c91195752e0eeed8ef040e391cdece7c25376957d5f15df22"
+SRC_URI[zmij-1.0.17.sha256sum] = "02aae0f83f69aafc94776e879363e9771d7ecbffe2c7fbb6c14c5e00dfe88439"
diff --git a/meta-python/recipes-devtools/python/python3-orjson/0001-Guard-avx512-module-with-x86-target-cfg.patch b/meta-python/recipes-devtools/python/python3-orjson/0001-Guard-avx512-module-with-x86-target-cfg.patch
new file mode 100644
index 0000000000..604030e062
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-orjson/0001-Guard-avx512-module-with-x86-target-cfg.patch
@@ -0,0 +1,37 @@
+From c5c46664a914d3a7f048c51c3b9c2ab13e21ed1b Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Thu, 29 Jan 2026 09:59:55 -0800
+Subject: [PATCH] Guard avx512 module with x86 target cfg
+
+The avx512.rs module contains x86_64-specific intrinsics and target
+features that are not valid on non-x86 architectures like RISC-V.
+
+Upstream-Status: Inappropriate [Rejected by upstream https://github.com/ijl/orjson/pull/609]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ src/ffi/pystrref/avx512.rs | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/ffi/pystrref/avx512.rs b/src/ffi/pystrref/avx512.rs
+index e4c7697..46450ac 100644
+--- a/src/ffi/pystrref/avx512.rs
++++ b/src/ffi/pystrref/avx512.rs
+@@ -3,12 +3,14 @@
+ 
+ use super::pyunicode_new::*;
+ 
++#[cfg(any(target_arch = "x86", target_arch = "x86_64"))]
+ use core::arch::x86_64::{
+     _mm512_and_si512, _mm512_cmpgt_epu8_mask, _mm512_cmpneq_epi8_mask, _mm512_loadu_epi8,
+     _mm512_mask_cmpneq_epi8_mask, _mm512_maskz_loadu_epi8, _mm512_max_epu8, _mm512_set1_epi8,
+ };
+ 
+ #[inline(never)]
++#[cfg(any(target_arch = "x86", target_arch = "x86_64"))]
+ #[target_feature(enable = "avx512f,avx512bw,avx512vl,bmi2")]
+ pub(crate) unsafe fn create_str_impl_avx512vl(buf: &str) -> *mut crate::ffi::PyObject {
+     unsafe {
+-- 
+2.39.5
+
diff --git a/meta-python/recipes-devtools/python/python3-orjson/0002-Guard-x86-feature-detection-macro-in-pystrref-object.patch b/meta-python/recipes-devtools/python/python3-orjson/0002-Guard-x86-feature-detection-macro-in-pystrref-object.patch
new file mode 100644
index 0000000000..59105e723c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-orjson/0002-Guard-x86-feature-detection-macro-in-pystrref-object.patch
@@ -0,0 +1,34 @@
+From 7ef16220caaa82f7a90047c8c9b5ff2eeb15b9ce Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Thu, 29 Jan 2026 10:22:31 -0800
+Subject: [PATCH 2/2] Guard x86 feature detection macro in pystrref/object.rs
+
+The std::is_x86_feature_detected! macro only works on x86/x86_64
+targets. This patch wraps the feature detection and AVX-512 code path
+with cfg guards to allow compilation on non-x86 architectures.
+
+On non-x86 targets, the code will fall through to the generic
+implementation instead of attempting AVX-512 optimizations.
+
+Upstream-Status: Inappropriate [Rejected by upstream https://github.com/ijl/orjson/pull/609]
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ src/ffi/pystrref/object.rs | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ffi/pystrref/object.rs b/src/ffi/pystrref/object.rs
+index 9ef12eb..7c2c046 100644
+--- a/src/ffi/pystrref/object.rs
++++ b/src/ffi/pystrref/object.rs
+@@ -29,6 +29,7 @@ static mut STR_CREATE_FN: StrDeserializer = super::scalar::str_impl_kind_scalar;
+ 
+ pub fn set_str_create_fn() {
+     unsafe {
++        #[cfg(any(target_arch = "x86", target_arch = "x86_64"))]
+         #[cfg(all(CPython, feature = "avx512"))]
+         if std::is_x86_feature_detected!("avx512vl") {
+             STR_CREATE_FN = super::avx512::create_str_impl_avx512vl;
+-- 
+2.39.5
+
diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb b/meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
rename to meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb
index 2209569aca..e26ca77d91 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/orjson/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
 
-SRC_URI[sha256sum] = "28eeae6a15243966962b658dfcf7bae9e7bb1f3260dfcf0370dbd41f5ff6058b"
+SRC_URI[sha256sum] = "0a54c72259f35299fd033042367df781c2f66d10252955ca1efb7db309b954cb"
 
 CVE_PRODUCT = "orjson"
 
@@ -11,6 +11,10 @@ require ${BPN}-crates.inc
 
 inherit pypi python_maturin cargo-update-recipe-crates
 
+SRC_URI += " \
+    file://0001-Guard-avx512-module-with-x86-target-cfg.patch \
+    file://0002-Guard-x86-feature-detection-macro-in-pystrref-object.patch \
+"
 DEPENDS = "python3-maturin-native"
 
 RDEPENDS:${PN} += "python3-maturin python3-mypy"
-- 
2.43.0


