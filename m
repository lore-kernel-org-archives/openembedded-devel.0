Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABF3C87FD4
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:10 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.4281.1753153983351867204
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HChSqFoa;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153989; x=1784689989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iacTtPQ1O74U1PET3q6l/KBZ2RyKapotEHzUEyYwraQ=;
  b=HChSqFoavdJ0zFk7fFVw1tW9iQxhGUVXHfqznvm5J7hJVXQ1Req0drnn
   Q2RljCdI7sudKGw/Cn8OyUvpnA1JtwvjdqWaWQNPECv+8+U9F0Mq3J9tC
   h0lBZCZfe5Qoq/ZV1mWGZ7v/5lK2LOWD9rcKC0Yf4TOKOvV0c8W+4+bPr
   qWrz+nl/v/aeqfE6v2QYfSaXTs1K5G6+jMo8kXbm9+wVZFbtlf8+RPdlQ
   fxTGAL1ItUF0fSqBYemPDfv+75Or7nfg6HSFZVYu8WbbAmO2rT9TfbT2v
   MoQprsD+YWZ6K4xRRdVYVbCVyELd/481/5Z04GhBmbz0Num0h3Qboc0f+
   Q==;
X-CSE-ConnectionGUID: LoMYT17JQviOONDcKdoshA==
X-CSE-MsgGUID: eeqWIQtmTby+O6x9jMM1qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="194957512"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="194957512"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:08 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 0D6991847
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:09 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 27FDB1800333
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:08 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 28A591A0090;
	Tue, 22 Jul 2025 11:13:05 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-python] [PATCH 16/21] python3-pydantic-core: upgrade 2.34.1. -> 2.35.2
Date: Tue, 22 Jul 2025 11:12:24 +0800
Message-ID: <20250722031245.884-16-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118679

new version ptest needs module typing_inspection
| ImportError while importing test module '/usr/lib/python3-pydantic-core/ptest/tests/test_misc.py'.
| Hint: make sure your test modules/packages have valid Python names.
| Traceback:
| ../../python3.13/importlib/__init__.py:88: in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| tests/test_misc.py:10: in <module>
|     from typing_inspection import typing_objects
| E   ModuleNotFoundError: No module named 'typing_inspection'
| ERROR: tests/test_misc.py:tests/test_misc.py

Changelog:
==========
- update to speedate 0.16
- Better document SerializationInfo
- Fix generic issues with ValidationInfo and SerializationInfo
- Do not reuse validator and serializer when unpickling
- Remove unnecessary required fields count when exclude_none is set
- Update test dependencies after 3.8 dropped support
- Mark constructor parameters of exceptions as positional-only
- fix: submodel fields with wrap validator affect smart union selection
- use pypa/gh-action-pypi-publish
- add critical sections around bytearray reads
- simplify ser-as-any mechanism
- Coerce 'time' schema constraints
- drop serde-json preserve_order feature
- Remove core schema validation
- Improve uncaught PydanticUseDefault exception message
- Add support for Python 3.14
- drop pypy3.9 support, add pypy3.11 support
- Add ensure_ascii option
- Update repr of TzInfo
- Make ValidationInfo and SerializationInfo generic for context

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../python/python3-pydantic-core-crates.inc   | 84 +++++++++----------
 ...toml-Update-bitvec-to-use-radium-1.x.patch | 46 +++++-----
 ...4.1.bb => python3-pydantic-core_2.35.2.bb} |  3 +-
 3 files changed, 69 insertions(+), 64 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.34.1.bb => python3-pydantic-core_2.35.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index 86b72c0e9a..c76f69d4e0 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -2,20 +2,19 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/ahash/0.8.11 \
+    crate://crates.io/ahash/0.8.12 \
     crate://crates.io/aho-corasick/1.1.3 \
     crate://crates.io/autocfg/1.3.0 \
     crate://crates.io/base64/0.22.1 \
+    crate://crates.io/bitflags/2.9.1 \
     crate://crates.io/bitvec/1.0.1 \
     crate://crates.io/cc/1.0.101 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/enum_dispatch/0.3.13 \
-    crate://crates.io/equivalent/1.0.1 \
     crate://crates.io/form_urlencoded/1.2.1 \
     crate://crates.io/funty/2.0.0 \
-    crate://crates.io/getrandom/0.2.15 \
-    crate://crates.io/hashbrown/0.14.5 \
+    crate://crates.io/getrandom/0.3.3 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/hex/0.4.3 \
     crate://crates.io/icu_collections/1.5.0 \
@@ -30,10 +29,9 @@ SRC_URI += " \
     crate://crates.io/icu_provider_macros/1.5.0 \
     crate://crates.io/idna/1.0.3 \
     crate://crates.io/idna_adapter/1.2.0 \
-    crate://crates.io/indexmap/2.2.6 \
     crate://crates.io/indoc/2.0.5 \
     crate://crates.io/itoa/1.0.11 \
-    crate://crates.io/jiter/0.9.0 \
+    crate://crates.io/jiter/0.10.0 \
     crate://crates.io/lexical-parse-float/1.0.5 \
     crate://crates.io/lexical-parse-integer/1.0.5 \
     crate://crates.io/lexical-util/1.0.6 \
@@ -48,13 +46,14 @@ SRC_URI += " \
     crate://crates.io/percent-encoding/2.3.1 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.24.1 \
-    crate://crates.io/pyo3-build-config/0.24.1 \
-    crate://crates.io/pyo3-ffi/0.24.1 \
-    crate://crates.io/pyo3-macros/0.24.1 \
-    crate://crates.io/pyo3-macros-backend/0.24.1 \
-    crate://crates.io/python3-dll-a/0.2.13 \
+    crate://crates.io/pyo3/0.25.0 \
+    crate://crates.io/pyo3-build-config/0.25.0 \
+    crate://crates.io/pyo3-ffi/0.25.0 \
+    crate://crates.io/pyo3-macros/0.25.0 \
+    crate://crates.io/pyo3-macros-backend/0.25.0 \
+    crate://crates.io/python3-dll-a/0.2.14 \
     crate://crates.io/quote/1.0.36 \
+    crate://crates.io/r-efi/5.2.0 \
     crate://crates.io/radium/0.7.0 \
     crate://crates.io/radium/1.1.0 \
     crate://crates.io/regex/1.11.1 \
@@ -62,15 +61,15 @@ SRC_URI += " \
     crate://crates.io/regex-syntax/0.8.5 \
     crate://crates.io/rustversion/1.0.17 \
     crate://crates.io/ryu/1.0.18 \
-    crate://crates.io/serde/1.0.218 \
-    crate://crates.io/serde_derive/1.0.218 \
+    crate://crates.io/serde/1.0.219 \
+    crate://crates.io/serde_derive/1.0.219 \
     crate://crates.io/serde_json/1.0.140 \
-    crate://crates.io/smallvec/1.14.0 \
-    crate://crates.io/speedate/0.15.0 \
+    crate://crates.io/smallvec/1.15.0 \
+    crate://crates.io/speedate/0.16.0 \
     crate://crates.io/stable_deref_trait/1.2.0 \
     crate://crates.io/static_assertions/1.1.0 \
-    crate://crates.io/strum/0.26.3 \
-    crate://crates.io/strum_macros/0.26.4 \
+    crate://crates.io/strum/0.27.1 \
+    crate://crates.io/strum_macros/0.27.1 \
     crate://crates.io/syn/2.0.82 \
     crate://crates.io/synstructure/0.13.1 \
     crate://crates.io/tap/1.0.1 \
@@ -83,34 +82,34 @@ SRC_URI += " \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/uuid/1.16.0 \
     crate://crates.io/version_check/0.9.5 \
-    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
+    crate://crates.io/wit-bindgen-rt/0.39.0 \
     crate://crates.io/write16/1.0.0 \
     crate://crates.io/writeable/0.5.5 \
     crate://crates.io/wyz/0.5.1 \
     crate://crates.io/yoke/0.7.4 \
     crate://crates.io/yoke-derive/0.7.4 \
-    crate://crates.io/zerocopy/0.7.34 \
-    crate://crates.io/zerocopy-derive/0.7.34 \
+    crate://crates.io/zerocopy/0.8.25 \
+    crate://crates.io/zerocopy-derive/0.8.25 \
     crate://crates.io/zerofrom/0.1.4 \
     crate://crates.io/zerofrom-derive/0.1.4 \
     crate://crates.io/zerovec/0.10.4 \
     crate://crates.io/zerovec-derive/0.10.3 \
 "
 
-SRC_URI[ahash-0.8.11.sha256sum] = "e89da841a80418a9b391ebaea17f5c112ffaaa96f621d2c285b5174da76b9011"
+SRC_URI[ahash-0.8.12.sha256sum] = "5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75"
 SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
 SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
+SRC_URI[bitflags-2.9.1.sha256sum] = "1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967"
 SRC_URI[bitvec-1.0.1.sha256sum] = "1bc2832c24239b0141d5674bb9174f9d68a8b5b3f2753311927c172ca46f7e9c"
 SRC_URI[cc-1.0.101.sha256sum] = "ac367972e516d45567c7eafc73d24e1c193dcf200a8d94e9db7b3d38b349572d"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[enum_dispatch-0.3.13.sha256sum] = "aa18ce2bc66555b3218614519ac839ddb759a7d6720732f979ef8d13be147ecd"
-SRC_URI[equivalent-1.0.1.sha256sum] = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
 SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
 SRC_URI[funty-2.0.0.sha256sum] = "e6d5a32815ae3f33302d95fdcb2ce17862f8c65363dcfd29360480ba1001fc9c"
-SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
-SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
+SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
 SRC_URI[icu_collections-1.5.0.sha256sum] = "db2fa452206ebee18c4b5c2274dbf1de17008e874b4dc4f0aea9d01ca79e4526"
@@ -125,10 +124,9 @@ SRC_URI[icu_provider-1.5.0.sha256sum] = "6ed421c8a8ef78d3e2dbc98a973be2f3770cb42
 SRC_URI[icu_provider_macros-1.5.0.sha256sum] = "1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6"
 SRC_URI[idna-1.0.3.sha256sum] = "686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea968a7e"
 SRC_URI[idna_adapter-1.2.0.sha256sum] = "daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71"
-SRC_URI[indexmap-2.2.6.sha256sum] = "168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
 SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
-SRC_URI[jiter-0.9.0.sha256sum] = "c024ccb0ed468a474efa325edea34d4198fb601d290c4d1bc24fe31ed11902fc"
+SRC_URI[jiter-0.10.0.sha256sum] = "1bcfb1e43bda3ba59889499ff494c5f5b6b10864b74aa0bd4593ce4d16838aa6"
 SRC_URI[lexical-parse-float-1.0.5.sha256sum] = "de6f9cb01fb0b08060209a057c048fcbab8717b4c1ecd2eac66ebfe39a65b0f2"
 SRC_URI[lexical-parse-integer-1.0.5.sha256sum] = "72207aae22fc0a121ba7b6d479e42cbfea549af1479c3f3a4f12c70dd66df12e"
 SRC_URI[lexical-util-1.0.6.sha256sum] = "5a82e24bf537fd24c177ffbbdc6ebcc8d54732c35b50a3f28cc3f4e4c949a0b3"
@@ -143,13 +141,14 @@ SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa
 SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.24.1.sha256sum] = "17da310086b068fbdcefbba30aeb3721d5bb9af8db4987d6735b2183ca567229"
-SRC_URI[pyo3-build-config-0.24.1.sha256sum] = "e27165889bd793000a098bb966adc4300c312497ea25cf7a690a9f0ac5aa5fc1"
-SRC_URI[pyo3-ffi-0.24.1.sha256sum] = "05280526e1dbf6b420062f3ef228b78c0c54ba94e157f5cb724a609d0f2faabc"
-SRC_URI[pyo3-macros-0.24.1.sha256sum] = "5c3ce5686aa4d3f63359a5100c62a127c9f15e8398e5fdeb5deef1fed5cd5f44"
-SRC_URI[pyo3-macros-backend-0.24.1.sha256sum] = "f4cf6faa0cbfb0ed08e89beb8103ae9724eb4750e3a78084ba4017cbe94f3855"
-SRC_URI[python3-dll-a-0.2.13.sha256sum] = "49fe4227a288cf9493942ad0220ea3f185f4d1f2a14f197f7344d6d02f4ed4ed"
+SRC_URI[pyo3-0.25.0.sha256sum] = "f239d656363bcee73afef85277f1b281e8ac6212a1d42aa90e55b90ed43c47a4"
+SRC_URI[pyo3-build-config-0.25.0.sha256sum] = "755ea671a1c34044fa165247aaf6f419ca39caa6003aee791a0df2713d8f1b6d"
+SRC_URI[pyo3-ffi-0.25.0.sha256sum] = "fc95a2e67091e44791d4ea300ff744be5293f394f1bafd9f78c080814d35956e"
+SRC_URI[pyo3-macros-0.25.0.sha256sum] = "a179641d1b93920829a62f15e87c0ed791b6c8db2271ba0fd7c2686090510214"
+SRC_URI[pyo3-macros-backend-0.25.0.sha256sum] = "9dff85ebcaab8c441b0e3f7ae40a6963ecea8a9f5e74f647e33fcf5ec9a1e89e"
+SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[r-efi-5.2.0.sha256sum] = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
 SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
 SRC_URI[radium-1.1.0.sha256sum] = "db0b76288902db304c864a12046b73d2d895cc34a4bb8137baaeebe9978a072c"
 SRC_URI[regex-1.11.1.sha256sum] = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
@@ -157,15 +156,15 @@ SRC_URI[regex-automata-0.4.8.sha256sum] = "368758f23274712b504848e9d5a6f010445cc
 SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
 SRC_URI[rustversion-1.0.17.sha256sum] = "955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6"
 SRC_URI[ryu-1.0.18.sha256sum] = "f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f"
-SRC_URI[serde-1.0.218.sha256sum] = "e8dfc9d19bdbf6d17e22319da49161d5d0108e4188e8b680aef6299eed22df60"
-SRC_URI[serde_derive-1.0.218.sha256sum] = "f09503e191f4e797cb8aac08e9a4a4695c5edf6a2e70e376d961ddd5c969f82b"
+SRC_URI[serde-1.0.219.sha256sum] = "5f0e2c6ed6606019b4e29e69dbaba95b11854410e5347d525002456dbbb786b6"
+SRC_URI[serde_derive-1.0.219.sha256sum] = "5b0276cf7f2c73365f7157c8123c21cd9a50fbbd844757af28ca1f5925fc2a00"
 SRC_URI[serde_json-1.0.140.sha256sum] = "20068b6e96dc6c9bd23e01df8827e6c7e1f2fddd43c21810382803c136b99373"
-SRC_URI[smallvec-1.14.0.sha256sum] = "7fcf8323ef1faaee30a44a340193b1ac6814fd9b7b4e88e9d4519a3e4abe1cfd"
-SRC_URI[speedate-0.15.0.sha256sum] = "9a5e7adf4e07e7de39a64d77962ca14a09165e592d42d0c9f9acadb679f4f937"
+SRC_URI[smallvec-1.15.0.sha256sum] = "8917285742e9f3e1683f0a9c4e6b57960b7314d0b08d30d1ecd426713ee2eee9"
+SRC_URI[speedate-0.16.0.sha256sum] = "bc823f2eb39713ef0d286058af264ce0d8ddcf62b8a78a0aec02cd0105576d87"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
-SRC_URI[strum-0.26.3.sha256sum] = "8fec0f0aef304996cf250b31b5a10dee7980c85da9d759361292b8bca5a18f06"
-SRC_URI[strum_macros-0.26.4.sha256sum] = "4c6bee85a5a24955dc440386795aa378cd9cf82acd5f764469152d2270e581be"
+SRC_URI[strum-0.27.1.sha256sum] = "f64def088c51c9510a8579e3c5d67c65349dcf755e5479ad3d010aa6454e2c32"
+SRC_URI[strum_macros-0.27.1.sha256sum] = "c77a8c5abcaf0f9ce05d62342b7d298c346515365c36b673df4ebe3ced01fde8"
 SRC_URI[syn-2.0.82.sha256sum] = "83540f837a8afc019423a8edb95b52a8effe46957ee402287f4292fae35be021"
 SRC_URI[synstructure-0.13.1.sha256sum] = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
 SRC_URI[tap-1.0.1.sha256sum] = "55937e1799185b12863d447f42597ed69d9928686b8d88a1df17376a097d8369"
@@ -178,14 +177,15 @@ SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[uuid-1.16.0.sha256sum] = "458f7a779bf54acc9f347480ac654f68407d3aab21269a6e3c9f922acd9e2da9"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
-SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
+SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] = "6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1"
 SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
 SRC_URI[writeable-0.5.5.sha256sum] = "1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc95c51"
 SRC_URI[wyz-0.5.1.sha256sum] = "05f360fc0b24296329c78fda852a1e9ae82de9cf7b27dae4b7f62f118f77b9ed"
 SRC_URI[yoke-0.7.4.sha256sum] = "6c5b1314b079b0930c31e3af543d8ee1757b1951ae1e1565ec704403a7240ca5"
 SRC_URI[yoke-derive-0.7.4.sha256sum] = "28cc31741b18cb6f1d5ff12f5b7523e3d6eb0852bbbad19d73905511d9849b95"
-SRC_URI[zerocopy-0.7.34.sha256sum] = "ae87e3fcd617500e5d106f0380cf7b77f3c6092aae37191433159dda23cfb087"
-SRC_URI[zerocopy-derive-0.7.34.sha256sum] = "15e934569e47891f7d9411f1a451d947a60e000ab3bd24fbb970f000387d1b3b"
+SRC_URI[zerocopy-0.8.25.sha256sum] = "a1702d9583232ddb9174e01bb7c15a2ab8fb1bc6f227aa1233858c351a3ba0cb"
+SRC_URI[zerocopy-derive-0.8.25.sha256sum] = "28a6e20d751156648aa063f3800b706ee209a32c0b4d9f24be3d980b01be55ef"
 SRC_URI[zerofrom-0.1.4.sha256sum] = "91ec111ce797d0e0784a1116d0ddcdbea84322cd79e5d5ad173daeba4f93ab55"
 SRC_URI[zerofrom-derive-0.1.4.sha256sum] = "0ea7b4a3637ea8669cedf0f1fd5c286a17f3de97b8dd5a70a6c167a1730e63a5"
 SRC_URI[zerovec-0.10.4.sha256sum] = "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
index 4f2012e8a2..58f8514630 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch
@@ -1,4 +1,4 @@
-From 560c73cffabc1c2e66552d7c248c0928211d3dea Mon Sep 17 00:00:00 2001
+From 41fded05f38bdb8378b98be4f1dd5392a00f3d1b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 19 Apr 2025 00:09:42 -0700
 Subject: [PATCH] cargo.toml: Update bitvec to use radium 1.x
@@ -7,24 +7,15 @@ Upstream-Status: Submitted [https://github.com/ferrilab/bitvec/pull/220]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- Cargo.lock | 25 +++++++++++++++++++++++--
- Cargo.toml |  1 +
- 2 files changed, 24 insertions(+), 2 deletions(-)
+ Cargo.lock | 12 +++++++++++-
+ Cargo.toml |  2 ++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
 
---- a/Cargo.toml
-+++ b/Cargo.toml
-@@ -27,6 +27,8 @@ include = [
- rust-version = "1.75"
- 
- [dependencies]
-+#bitvec = { git = "https://github.com/alexanderkjall/bitvec", branch = "upgrade-radium-to-1" }
-+radium = "1"
- # TODO it would be very nice to remove the "py-clone" feature as it can panic,
- # but needs a bit of work to make sure it's not used in the codebase
- pyo3 = { version = "0.24", features = ["generate-import-lib", "num-bigint", "py-clone"] }
+diff --git a/Cargo.lock b/Cargo.lock
+index 44bdf4e..274b828 100644
 --- a/Cargo.lock
 +++ b/Cargo.lock
-@@ -43,7 +43,7 @@ source = "registry+https://github.com/ru
+@@ -49,7 +49,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
  checksum = "1bc2832c24239b0141d5674bb9174f9d68a8b5b3f2753311927c172ca46f7e9c"
  dependencies = [
   "funty",
@@ -33,7 +24,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
   "tap",
   "wyz",
  ]
-@@ -436,6 +436,7 @@ dependencies = [
+@@ -421,6 +421,7 @@ dependencies = [
   "num-traits",
   "pyo3",
   "pyo3-build-config",
@@ -41,10 +32,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
   "regex",
   "serde",
   "serde_json",
-@@ -538,6 +539,15 @@ source = "registry+https://github.com/ru
+@@ -527,6 +528,15 @@ version = "0.7.0"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
  checksum = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
  
- [[package]]
++[[package]]
 +name = "radium"
 +version = "1.1.0"
 +source = "registry+https://github.com/rust-lang/crates.io-index"
@@ -53,7 +45,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 + "cfg-if",
 +]
 +
-+[[package]]
+ [[package]]
  name = "regex"
  version = "1.11.1"
- source = "registry+https://github.com/rust-lang/crates.io-index"
+diff --git a/Cargo.toml b/Cargo.toml
+index 660e06a..7ee67d6 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -25,6 +25,8 @@ include = [
+ rust-version = "1.75"
+ 
+ [dependencies]
++#bitvec = { git = "https://github.com/alexanderkjall/bitvec", branch = "upgrade-radium-to-1" }
++radium = "1"
+ # TODO it would be very nice to remove the "py-clone" feature as it can panic,
+ # but needs a bit of work to make sure it's not used in the codebase
+ pyo3 = { version = "0.25", features = ["generate-import-lib", "num-bigint", "py-clone"] }
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.34.1.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.35.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.34.1.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.35.2.bb
index 0e2d065128..1d0d1f477b 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.34.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.35.2.bb
@@ -12,7 +12,7 @@ require ${BPN}-crates.inc
 
 SRC_URI += "file://0001-Upgrade-radium-to-1.0.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/bitvec-1.0.1/"
 SRC_URI += "file://0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch"
-SRC_URI[sha256sum] = "6bf31628ab6d0e7c7c0372419898c52ef0a447b33ab47c7f62053bd013cc5b09"
+SRC_URI[sha256sum] = "e010b13ff0d6375ee83f7478fbda42e1fbf55f1b2feef76b673c40861ffd31e6"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
@@ -38,6 +38,7 @@ RDEPENDS:${PN}-ptest += "\
     python3-pytest-mock \
     python3-pytest-timeout \
     python3-pytest-benchmark \
+    python3-typing-inspection \
 	python3-tzdata \
 	python3-zoneinfo \
 "
-- 
2.43.0


