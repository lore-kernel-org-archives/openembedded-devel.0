Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FF5C43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:52 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4724.1783503943302703297
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LOZ7WJK3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503943; x=1815039943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yFByO+YYI4fkpPIAQ5DqB7iVWtKhPP2eOwvrVgLQlc4=;
  b=LOZ7WJK3IyNPIAFXQ/tUI/cuXLowEk0LnJ28/iAu5JfxEld3UxTqYOw3
   V7gVG/41AERPx53HM7UQhStNEIjwmhjJcK4HALj7EP5NPO1rBcmIN/Ltn
   iPpqBl3/NqAK9kof5pFGdxBxYIBx3R6fJQVBhnKSJUJlNTMv9s08Zk6nk
   Ju3/GSwEe4lXWlTNvGifGymFvBJc75+j+8wcF6Gdsdw4cJ2kRhnvjECYk
   MDecbZRYvzHuryqYxCYzsKDYQmYUNMeVRwpySG6cWirg4lD5zk7ODUlGA
   zqy530gRhYVPmAHUOFPr1VrUY1g23MfDOysQj8Mpo4eMc6HyRJ9QJazn7
   Q==;
X-CSE-ConnectionGUID: 12enowkvQoqSSZ2WqIKpBg==
X-CSE-MsgGUID: y+0jD88VTbij/btu1FnJJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246699891"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246699891"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:41 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8B3AFC00541
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:41 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 45BAD14042E4
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 73896180112F;
	Wed,  8 Jul 2026 09:45:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/37] python3-cbor2: upgrade 6.1.2 -> 6.1.3
Date: Wed,  8 Jul 2026 17:44:27 +0800
Message-ID: <20260708094508.2060-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128088

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fixed the decoder registering 6-byte strings in the string reference
  namespace at indices 65536–4294967295 where the encoder does not,
  desynchronising the namespace and resolving later string references to the
  wrong value
- Fixed the IPv4/IPv6 network decoders (tags 52 and 54) silently truncating an
  address byte string that is longer than the address size instead of rejecting
  it as malformed
- Fixed quadratic decoding time for indefinite-length and large definite-length
  byte and text strings, caused by concatenating each chunk onto the
  accumulated result with + instead of building the result once
- Fixed datetime_as_timestamp encoding whole-second datetimes before 1970 or
  after 2106 as floats instead of integers, because the timestamp was narrowed
  through an unsigned 32-bit integer
- Fixed the encoder measuring text strings by code point count instead of UTF-8
  byte length when deciding whether to add them to the string reference
  namespace, desynchronising it from the decoder (which counts bytes) and
  corrupting later string references for non-ASCII strings
- Fixed the decoder rejecting scoped IPv6 addresses (tag 54) with a
  CBORDecodeError reading invalid types in input array; the encoder emits them
  as [address, null, zone id] but the decoder only handled the network and
  interface array forms, so a scoped ~ipaddress.IPv6Address could not be decoded
  back

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-cbor2-crates.inc            | 18 ++++++++++--------
 ...3-cbor2_6.1.2.bb => python3-cbor2_6.1.3.bb} |  2 +-
 2 files changed, 11 insertions(+), 9 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_6.1.2.bb => python3-cbor2_6.1.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2-crates.inc b/meta-python/recipes-devtools/python/python3-cbor2-crates.inc
index b7b94b8da1..759cf1a928 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-cbor2-crates.inc
@@ -16,11 +16,12 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3/0.28.2 \
+    crate://crates.io/pyo3/0.29.0 \
     crate://crates.io/pyo3-build-config/0.28.2 \
-    crate://crates.io/pyo3-ffi/0.28.2 \
-    crate://crates.io/pyo3-macros/0.28.2 \
-    crate://crates.io/pyo3-macros-backend/0.28.2 \
+    crate://crates.io/pyo3-build-config/0.29.0 \
+    crate://crates.io/pyo3-ffi/0.29.0 \
+    crate://crates.io/pyo3-macros/0.29.0 \
+    crate://crates.io/pyo3-macros-backend/0.29.0 \
     crate://crates.io/quote/1.0.44 \
     crate://crates.io/syn/2.0.117 \
     crate://crates.io/target-lexicon/0.13.5 \
@@ -43,11 +44,12 @@ SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-0.28.2.sha256sum] = "cf85e27e86080aafd5a22eae58a162e133a589551542b3e5cee4beb27e54f8e1"
+SRC_URI[pyo3-0.29.0.sha256sum] = "cd274650b21d4bfc26a0a47587962c1edb425f69287324355cd040c3ea66071c"
 SRC_URI[pyo3-build-config-0.28.2.sha256sum] = "8bf94ee265674bf76c09fa430b0e99c26e319c945d96ca0d5a8215f31bf81cf7"
-SRC_URI[pyo3-ffi-0.28.2.sha256sum] = "491aa5fc66d8059dd44a75f4580a2962c1862a1c2945359db36f6c2818b748dc"
-SRC_URI[pyo3-macros-0.28.2.sha256sum] = "f5d671734e9d7a43449f8480f8b38115df67bef8d21f76837fa75ee7aaa5e52e"
-SRC_URI[pyo3-macros-backend-0.28.2.sha256sum] = "22faaa1ce6c430a1f71658760497291065e6450d7b5dc2bcf254d49f66ee700a"
+SRC_URI[pyo3-build-config-0.29.0.sha256sum] = "c5e2a7d2f0d013342f295c048ad19237add5154a55b1c5a254c0ec93d4109078"
+SRC_URI[pyo3-ffi-0.29.0.sha256sum] = "ca85c467da1bbc8d866eea5deff9cf29ea5f7785054a17da36e65bda9c05845b"
+SRC_URI[pyo3-macros-0.29.0.sha256sum] = "9ac53762fd065daa3194dd09337a38bd793a188100fd1a9304c4ab312d901771"
+SRC_URI[pyo3-macros-backend-0.29.0.sha256sum] = "4ca3a1557399783172dc5bf39cfca835157732532cba56b71d2292161e53b362"
 SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
 SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
 SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
diff --git a/meta-python/recipes-devtools/python/python3-cbor2_6.1.2.bb b/meta-python/recipes-devtools/python/python3-cbor2_6.1.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cbor2_6.1.2.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_6.1.3.bb
index b8e92ca361..9e6d7630f8 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_6.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_6.1.3.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "6b43037a66947dee5af0abb1a4c3a13b3abac5a4a3f32f9771efbbcd030fd909"
+SRC_URI[sha256sum] = "8d70680acb55c04ea5b5ad86da094f9612b53d5a8a65d0f5b3aafc3ce917ecbb"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
 
-- 
2.43.0


