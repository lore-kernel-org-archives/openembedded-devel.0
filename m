Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A45105A56D
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:54:08 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18541.1773312839916779117
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ipgebFGl;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312840; x=1804848840;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZpnD5w7T4wiifhSgr9GV6MWFoFpClhpHhHDNN5tKOzg=;
  b=ipgebFGlWt3G9AOJpTfaNh1Wopw5obHi9Nvin2yKMWE/cyd+FCAXClM8
   e4VqXBgiUAfZ1tO8WJbPgcBWtpQHly8aHOy9nkotQkPl/dSH0eVLU/e7h
   Z1yGwidm7S7qzw7LK/wmC6SiPPYrgXYxHwr+a1gc9J1df4p6KdSI+XkBP
   H0zE9Ux51WeiMnPKCckeFuHnmrRdl1qIuGfSkXhXPo/pM7R0FGszQhQLo
   sTA28U6+GrYfTis5I5eyov9J85R8MH4uEUA9+xCpoFIcJ530TvKiyjoVG
   TUMU7887fUzySouViwW4vKhu8mzgVrJ9JTpvSasI1IDm/C7NOIdYdCtlQ
   w==;
X-CSE-ConnectionGUID: Prq8lrcQTHOI/Ezo151i+w==
X-CSE-MsgGUID: vYqXooZ+QUWvK3EKWZmCRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="211824401"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="211824401"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:58 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4D0F41002B93
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:58 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id F08151809C28
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 08E0218029A2;
	Thu, 12 Mar 2026 10:53:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/64] python3-orjson: upgrade 3.11.6 -> 3.11.7
Date: Thu, 12 Mar 2026 18:51:59 +0800
Message-ID: <20260312105220.1856-43-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125143

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- Use a faster library to serialize float. Users with byte-exact regression
  tests should note positive exponents are now written using a +, e.g.,
  1.2e+30 instead of 1.2e30. Both formats are spec-compliant.
- ABI compatibility with CPython 3.15 alpha 5 free-threading.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-orjson-crates.inc          | 40 +++++++++----------
 ...son_3.11.6.bb => python3-orjson_3.11.7.bb} |  2 +-
 2 files changed, 21 insertions(+), 21 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-orjson_3.11.6.bb => python3-orjson_3.11.7.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-orjson-crates.inc b/meta-python/recipes-devtools/python/python3-orjson-crates.inc
index 43434fa690..5e3aa8592b 100644
--- a/meta-python/recipes-devtools/python/python3-orjson-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-orjson-crates.inc
@@ -5,11 +5,11 @@ SRC_URI += " \
     crate://crates.io/associative-cache/2.0.0 \
     crate://crates.io/bytecount/0.6.9 \
     crate://crates.io/bytes/1.11.0 \
-    crate://crates.io/cc/1.2.54 \
+    crate://crates.io/cc/1.2.55 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/crunchy/0.2.4 \
     crate://crates.io/encoding_rs/0.8.35 \
-    crate://crates.io/find-msvc-tools/0.1.8 \
+    crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/gimli/0.32.3 \
     crate://crates.io/half/2.7.1 \
     crate://crates.io/itoa/1.0.17 \
@@ -18,14 +18,14 @@ SRC_URI += " \
     crate://crates.io/jiff-static/0.2.18 \
     crate://crates.io/libc/0.2.180 \
     crate://crates.io/memchr/2.7.6 \
+    crate://crates.io/no-panic/0.1.36 \
     crate://crates.io/once_cell/1.21.3 \
-    crate://crates.io/portable-atomic/1.13.0 \
-    crate://crates.io/portable-atomic-util/0.2.4 \
+    crate://crates.io/portable-atomic/1.13.1 \
+    crate://crates.io/portable-atomic-util/0.2.5 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3-build-config/0.27.2 \
-    crate://crates.io/pyo3-ffi/0.27.2 \
+    crate://crates.io/pyo3-build-config/0.28.0 \
+    crate://crates.io/pyo3-ffi/0.28.0 \
     crate://crates.io/quote/1.0.44 \
-    crate://crates.io/ryu/1.0.22 \
     crate://crates.io/serde/1.0.228 \
     crate://crates.io/serde_core/1.0.228 \
     crate://crates.io/serde_derive/1.0.228 \
@@ -40,19 +40,19 @@ SRC_URI += " \
     crate://crates.io/uuid/1.20.0 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/xxhash-rust/0.8.15 \
-    crate://crates.io/zerocopy/0.8.35 \
-    crate://crates.io/zerocopy-derive/0.8.35 \
-    crate://crates.io/zmij/1.0.17 \
+    crate://crates.io/zerocopy/0.8.37 \
+    crate://crates.io/zerocopy-derive/0.8.37 \
+    crate://crates.io/zmij/1.0.19 \
 "
 
 SRC_URI[associative-cache-2.0.0.sha256sum] = "b993cd767a2bc7307dd87622311ca22c44329cc7a21366206bfa0896827b2bad"
 SRC_URI[bytecount-0.6.9.sha256sum] = "175812e0be2bccb6abe50bb8d566126198344f707e304f45c648fd8f2cc0365e"
 SRC_URI[bytes-1.11.0.sha256sum] = "b35204fbdc0b3f4446b89fc1ac2cf84a8a68971995d0bf2e925ec7cd960f9cb3"
-SRC_URI[cc-1.2.54.sha256sum] = "6354c81bbfd62d9cfa9cb3c773c2b7b2a3a482d569de977fd0e961f6e7c00583"
+SRC_URI[cc-1.2.55.sha256sum] = "47b26a0954ae34af09b50f0de26458fa95369a0d478d8236d3f93082b219bd29"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[crunchy-0.2.4.sha256sum] = "460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
-SRC_URI[find-msvc-tools-0.1.8.sha256sum] = "8591b0bcc8a98a64310a2fae1bb3e9b8564dd10e381e6e28010fde8e8e8568db"
+SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[gimli-0.32.3.sha256sum] = "e629b9b98ef3dd8afe6ca2bd0f89306cec16d43d907889945bc5d6687f2f13c7"
 SRC_URI[half-2.7.1.sha256sum] = "6ea2d84b969582b4b1864a92dc5d27cd2b77b622a8d79306834f1be5ba20d84b"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
@@ -61,14 +61,14 @@ SRC_URI[jiff-0.2.18.sha256sum] = "e67e8da4c49d6d9909fe03361f9b620f58898859f5c7ad
 SRC_URI[jiff-static-0.2.18.sha256sum] = "e0c84ee7f197eca9a86c6fd6cb771e55eb991632f15f2bc3ca6ec838929e6e78"
 SRC_URI[libc-0.2.180.sha256sum] = "bcc35a38544a891a5f7c865aca548a982ccb3b8650a5b06d0fd33a10283c56fc"
 SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
+SRC_URI[no-panic-0.1.36.sha256sum] = "f967505aabc8af5752d098c34146544a43684817cdba8f9725b292530cabbf53"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
-SRC_URI[portable-atomic-1.13.0.sha256sum] = "f89776e4d69bb58bc6993e99ffa1d11f228b839984854c7daeb5d37f87cbe950"
-SRC_URI[portable-atomic-util-0.2.4.sha256sum] = "d8a2f0d8d040d7848a709caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
+SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
+SRC_URI[portable-atomic-util-0.2.5.sha256sum] = "7a9db96d7fa8782dd8c15ce32ffe8680bbd1e978a43bf51a34d39483540495f5"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-build-config-0.27.2.sha256sum] = "b455933107de8642b4487ed26d912c2d899dec6114884214a0b3bb3be9261ea6"
-SRC_URI[pyo3-ffi-0.27.2.sha256sum] = "1c85c9cbfaddf651b1221594209aed57e9e5cff63c4d11d1feead529b872a089"
+SRC_URI[pyo3-build-config-0.28.0.sha256sum] = "972720a441c91fd9c49f212a1d2d74c6e3803b231ebc8d66c51efbd7ccab11c8"
+SRC_URI[pyo3-ffi-0.28.0.sha256sum] = "5994456d9dab8934d600d3867571b6410f24fbd6002570ad56356733eb54859b"
 SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
-SRC_URI[ryu-1.0.22.sha256sum] = "a50f4cf475b65d88e057964e0e9bb1f0aa9bbb2036dc65c64596b42932536984"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
 SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
 SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
@@ -83,6 +83,6 @@ SRC_URI[unwinding-0.2.8.sha256sum] = "60612c845ef41699f39dc8c5391f252942c0a88b7d
 SRC_URI[uuid-1.20.0.sha256sum] = "ee48d38b119b0cd71fe4141b30f5ba9c7c5d9f4e7a3a8b4a674e4b6ef789976f"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[xxhash-rust-0.8.15.sha256sum] = "fdd20c5420375476fbd4394763288da7eb0cc0b8c11deed431a91562af7335d3"
-SRC_URI[zerocopy-0.8.35.sha256sum] = "fdea86ddd5568519879b8187e1cf04e24fce28f7fe046ceecbce472ff19a2572"
-SRC_URI[zerocopy-derive-0.8.35.sha256sum] = "0c15e1b46eff7c6c91195752e0eeed8ef040e391cdece7c25376957d5f15df22"
-SRC_URI[zmij-1.0.17.sha256sum] = "02aae0f83f69aafc94776e879363e9771d7ecbffe2c7fbb6c14c5e00dfe88439"
+SRC_URI[zerocopy-0.8.37.sha256sum] = "7456cf00f0685ad319c5b1693f291a650eaf345e941d082fc4e03df8a03996ac"
+SRC_URI[zerocopy-derive-0.8.37.sha256sum] = "1328722bbf2115db7e19d69ebcc15e795719e2d66b60827c6a69a117365e37a0"
+SRC_URI[zmij-1.0.19.sha256sum] = "3ff05f8caa9038894637571ae6b9e29466c1f4f829d26c9b28f869a29cbe3445"
diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb b/meta-python/recipes-devtools/python/python3-orjson_3.11.7.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb
rename to meta-python/recipes-devtools/python/python3-orjson_3.11.7.bb
index 121b1c1964..63e2e089e1 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.11.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/orjson/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
 
-SRCREV = "ec02024c3837255064f248c0d2d331319b75e9ad"
+SRCREV = "ec2b066cae79ae4a90ed126ac5723335dd99e408"
 PYPI_SRC_URI = "git://github.com/ijl/orjson;protocol=https;branch=master;tag=${PV};destsuffix=orjson-${PV}"
 
 CVE_PRODUCT = "orjson"
-- 
2.43.0


