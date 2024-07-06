Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C722C2BD09
	for <webhook@archiver.kernel.org>; Sat,  6 Jul 2024 18:08:26 +0000 (UTC)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
 by mx.groups.io with SMTP id smtpd.web10.43798.1720289300498675570
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jul 2024 11:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=tURemfmg;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.181, mailfrom: dev@g0hl1n.net)
X-Envelope-To: openembedded-devel@lists.openembedded.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1720289297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gu9EfIET87PEv0wkT9WUT2EhhHro77EiKXcU93UzVRo=;
	b=tURemfmgyypWMFHhND+oRt8pHcuI0zlafOqdIAPUhj0l5DKFnY3eU+THiOpwbJn1pF8ttK
	d5GDAMXwkkGVHhroXYc4+G+N3S18FAI4KRxp+1kQL/xH9i3iu1DE1ulqRSL9evcBS+f1Jj
	CHaactV98guI0tWqrdiNJZizRTBpsw0=
X-Envelope-To: dev@g0hl1n.net
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][scarthgap][PATCH] python3-pydantic-core: upgrade 2.16.3 -> 2.18.1
Date: Sat,  6 Jul 2024 20:08:10 +0200
Message-ID: <20240706180810.1707296-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Jul 2024 18:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111261

The currently available python-3-pydantic v2.7.0 requires
python3-pydantic-core to be updated to v2.18.1.

Removed patch: 0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to:
 The pyo3 version bump patch is dropped as the pyo3 version in
 python3-pydantic-core was updated to a newer one.

Added patch: 0001-Lower-MSRV-to-1.75-1316:
 This patch for lowering the MSRV to 1.75 (from 1.76) is backported to
 fix the build (as scarthgap provides rust 1.75).

Added patch: 0001-Fix-generate_self_schema-for-Python-3.12-1299:
 This patch fixes following build error for python 3.12+ (which we have):
 TypeError: ForwardRef._evaluate() missing 1 required keyword-only argume=
nt: 'recursive_guard'

Updated crate dependencies:
 ahash: 0.8.7 -> 0.8.10
 enum_dispatch: 0.3.12 -> 0.3.13
 indexmap: 2.0.0 -> 2.2.2
 jiter: 0.0.6 -> 0.2.1
 pyo3: 0.20.3 -> 0.21.1
 regex: 1.10.2 -> 1.10.3
 regex-automata: 0.4.3 -> 0.4.5
 serde: 1.0.195 -> 1.0.197
 serde_derive: 1.0.195 -> 1.0.197
 serde_json: 1.0.109 -> 1.0.114
 smallvec: 1.11.2 -> 1.13.2
 speedate: 0.13.0 -> 0.14.0
 uuid: 1.6.1 -> 1.7.0

Added new crate dependencies:
 strum_macros: 0.26.1

Removed crate dependencies:
 allocator-api2
 lexical-core
 lexical-write-float
 lexical-write-integer

Changelog:
 https://github.com/pydantic/pydantic-core/releases

Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 .../python/python3-pydantic-core-crates.inc   |  78 +++++------
 ...-github.com-pyo3-pyo3-from-0.20.2-to.patch | 126 ------------------
 ...ate_self_schema-for-Python-3.12-1299.patch |  32 +++++
 .../0001-Lower-MSRV-to-1.75-1316.patch        |  25 ++++
 ...6.3.bb =3D> python3-pydantic-core_2.18.1.bb} |   7 +-
 5 files changed, 98 insertions(+), 170 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic-=
core/0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-=
core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-=
core/0001-Lower-MSRV-to-1.75-1316.patch
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.16.3=
.bb =3D> python3-pydantic-core_2.18.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-cr=
ates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crat=
es.inc
index dd2027948..866cd9cf0 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.in=
c
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.in=
c
@@ -2,31 +2,27 @@
=20
 # from Cargo.lock
 SRC_URI +=3D " \
-    crate://crates.io/ahash/0.8.7 \
+    crate://crates.io/ahash/0.8.10 \
     crate://crates.io/aho-corasick/1.0.2 \
-    crate://crates.io/allocator-api2/0.2.16 \
     crate://crates.io/autocfg/1.1.0 \
     crate://crates.io/base64/0.21.7 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/cc/1.0.79 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/enum_dispatch/0.3.12 \
+    crate://crates.io/enum_dispatch/0.3.13 \
     crate://crates.io/equivalent/1.0.1 \
     crate://crates.io/form_urlencoded/1.2.1 \
     crate://crates.io/getrandom/0.2.10 \
     crate://crates.io/hashbrown/0.14.3 \
     crate://crates.io/heck/0.4.1 \
     crate://crates.io/idna/0.5.0 \
-    crate://crates.io/indexmap/2.0.0 \
+    crate://crates.io/indexmap/2.2.2 \
     crate://crates.io/indoc/2.0.4 \
     crate://crates.io/itoa/1.0.8 \
-    crate://crates.io/jiter/0.0.6 \
-    crate://crates.io/lexical-core/0.8.5 \
+    crate://crates.io/jiter/0.2.1 \
     crate://crates.io/lexical-parse-float/0.8.5 \
     crate://crates.io/lexical-parse-integer/0.8.6 \
     crate://crates.io/lexical-util/0.8.5 \
-    crate://crates.io/lexical-write-float/0.8.5 \
-    crate://crates.io/lexical-write-integer/0.8.5 \
     crate://crates.io/libc/0.2.147 \
     crate://crates.io/lock_api/0.4.10 \
     crate://crates.io/memchr/2.6.3 \
@@ -40,28 +36,29 @@ SRC_URI +=3D " \
     crate://crates.io/percent-encoding/2.3.1 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.76 \
-    crate://crates.io/pyo3/0.20.3 \
-    crate://crates.io/pyo3-build-config/0.20.3 \
-    crate://crates.io/pyo3-ffi/0.20.3 \
-    crate://crates.io/pyo3-macros/0.20.3 \
-    crate://crates.io/pyo3-macros-backend/0.20.3 \
+    crate://crates.io/pyo3/0.21.1 \
+    crate://crates.io/pyo3-build-config/0.21.1 \
+    crate://crates.io/pyo3-ffi/0.21.1 \
+    crate://crates.io/pyo3-macros/0.21.1 \
+    crate://crates.io/pyo3-macros-backend/0.21.1 \
     crate://crates.io/python3-dll-a/0.2.9 \
     crate://crates.io/quote/1.0.35 \
     crate://crates.io/redox_syscall/0.3.5 \
-    crate://crates.io/regex/1.10.2 \
-    crate://crates.io/regex-automata/0.4.3 \
+    crate://crates.io/regex/1.10.3 \
+    crate://crates.io/regex-automata/0.4.5 \
     crate://crates.io/regex-syntax/0.8.2 \
     crate://crates.io/rustversion/1.0.13 \
     crate://crates.io/ryu/1.0.14 \
     crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/serde/1.0.195 \
-    crate://crates.io/serde_derive/1.0.195 \
-    crate://crates.io/serde_json/1.0.109 \
-    crate://crates.io/smallvec/1.11.2 \
-    crate://crates.io/speedate/0.13.0 \
+    crate://crates.io/serde/1.0.197 \
+    crate://crates.io/serde_derive/1.0.197 \
+    crate://crates.io/serde_json/1.0.114 \
+    crate://crates.io/smallvec/1.13.2 \
+    crate://crates.io/speedate/0.14.0 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/strum/0.25.0 \
     crate://crates.io/strum_macros/0.25.3 \
+    crate://crates.io/strum_macros/0.26.1 \
     crate://crates.io/syn/2.0.48 \
     crate://crates.io/target-lexicon/0.12.9 \
     crate://crates.io/tinyvec/1.6.0 \
@@ -71,7 +68,7 @@ SRC_URI +=3D " \
     crate://crates.io/unicode-normalization/0.1.22 \
     crate://crates.io/unindent/0.2.3 \
     crate://crates.io/url/2.5.0 \
-    crate://crates.io/uuid/1.6.1 \
+    crate://crates.io/uuid/1.7.0 \
     crate://crates.io/version_check/0.9.4 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/windows-targets/0.48.1 \
@@ -86,31 +83,27 @@ SRC_URI +=3D " \
     crate://crates.io/zerocopy-derive/0.7.32 \
 "
=20
-SRC_URI[ahash-0.8.7.sha256sum] =3D "77c3a9648d43b9cd48db467b3f87fdd6e146=
bcc88ab0180006cef2179fe11d01"
+SRC_URI[ahash-0.8.10.sha256sum] =3D "8b79b82693f705137f8fb9b37871d99e4f9=
a7df12b917eed79c3d3954830a60b"
 SRC_URI[aho-corasick-1.0.2.sha256sum] =3D "43f6cb1bf222025340178f382c426=
f13757b2960e89779dfcb319c32542a5a41"
-SRC_URI[allocator-api2-0.2.16.sha256sum] =3D "0942ffc6dcaadf03badf6e6a2d=
0228460359d5e34b57ccdc720b7382dfbd5ec5"
 SRC_URI[autocfg-1.1.0.sha256sum] =3D "d468802bab17cbc0cc575e9b053f41e72a=
a36bfa6b7f55e3529ffa43161b97fa"
 SRC_URI[base64-0.21.7.sha256sum] =3D "9d297deb1925b89f2ccc13d7635fa0714f=
12c87adce1c75356b39ca9b7178567"
 SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[cc-1.0.79.sha256sum] =3D "50d30906286121d95be3d479533b458f87493b=
30a4b5f79a607db8f5d11aa91f"
 SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[enum_dispatch-0.3.12.sha256sum] =3D "8f33313078bb8d4d05a2733a94a=
c4c2d8a0df9a2b84424ebf4f33bfc224a890e"
+SRC_URI[enum_dispatch-0.3.13.sha256sum] =3D "aa18ce2bc66555b3218614519ac=
839ddb759a7d6720732f979ef8d13be147ecd"
 SRC_URI[equivalent-1.0.1.sha256sum] =3D "5443807d6dff69373d433ab9ef5378a=
d8df50ca6298caf15de6e52e24aaf54d5"
 SRC_URI[form_urlencoded-1.2.1.sha256sum] =3D "e13624c2627564efccf4934284=
bdd98cbaa14e79b0b5a141218e507b3a823456"
 SRC_URI[getrandom-0.2.10.sha256sum] =3D "be4136b2a15dd319360be1c07d99335=
17ccf0be8f16bf62a3bee4f0d618df427"
 SRC_URI[hashbrown-0.14.3.sha256sum] =3D "290f1a1d9242c78d09ce40a5e87e755=
4ee637af1351968159f4952f028f75604"
 SRC_URI[heck-0.4.1.sha256sum] =3D "95505c38b4572b2d910cecb0281560f54b440=
a19336cbbcb27bf6ce6adc6f5a8"
 SRC_URI[idna-0.5.0.sha256sum] =3D "634d9b1461af396cad843f47fdba5597a4f9e=
6ddd4bfb6ff5d85028c25cb12f6"
-SRC_URI[indexmap-2.0.0.sha256sum] =3D "d5477fe2230a79769d8dc68e0eabf5437=
907c0457a5614a9e8dddb67f65eb65d"
+SRC_URI[indexmap-2.2.2.sha256sum] =3D "824b2ae422412366ba479e8111fd301f7=
b5faece8149317bb81925979a53f520"
 SRC_URI[indoc-2.0.4.sha256sum] =3D "1e186cfbae8084e513daff4240b4797e342f=
988cecda4fb6c939150f96315fd8"
 SRC_URI[itoa-1.0.8.sha256sum] =3D "62b02a5381cc465bd3041d84623d0fa3b6673=
8b52b8e2fc3bab8ad63ab032f4a"
-SRC_URI[jiter-0.0.6.sha256sum] =3D "87db066a99f69382be06d02313f8ce989996=
b53a04a8a70cfd1a6483a56227f7"
-SRC_URI[lexical-core-0.8.5.sha256sum] =3D "2cde5de06e8d4c2faabc400238f9a=
e1c74d5412d03a7bd067645ccbc47070e46"
+SRC_URI[jiter-0.2.1.sha256sum] =3D "8e1177860adcf80c1ae7d7c1d41561f008c7=
530664caebbfa5ddd8a7f7316b98"
 SRC_URI[lexical-parse-float-0.8.5.sha256sum] =3D "683b3a5ebd0130b8fb52ba=
0bdc718cc56815b6a097e28ae5a6997d0ad17dc05f"
 SRC_URI[lexical-parse-integer-0.8.6.sha256sum] =3D "6d0994485ed0c312f6d9=
65766754ea177d07f9c00c9b82a5ee62ed5b47945ee9"
 SRC_URI[lexical-util-0.8.5.sha256sum] =3D "5255b9ff16ff898710eb9eb63cb39=
248ea8a5bb036bea8085b1a767ff6c4e3fc"
-SRC_URI[lexical-write-float-0.8.5.sha256sum] =3D "accabaa1c4581f05a3923d=
1b4cfd124c329352288b7b9da09e766b0668116862"
-SRC_URI[lexical-write-integer-0.8.5.sha256sum] =3D "e1b6f3d1f4422866b681=
92d62f77bc5c700bee84f3069f2469d7bc8c77852446"
 SRC_URI[libc-0.2.147.sha256sum] =3D "b4668fb0ea861c1df094127ac5f1da3409a=
82116a4ba74fca2e58ef927159bb3"
 SRC_URI[lock_api-0.4.10.sha256sum] =3D "c1cc9717a20b1bb222f333e6a92fd32f=
7d8a18ddc5a3191a11af45dcbf4dcd16"
 SRC_URI[memchr-2.6.3.sha256sum] =3D "8f232d6ef707e1956a43342693d2a31e729=
89554d58299d7a88738cc95b0d35c"
@@ -124,28 +117,29 @@ SRC_URI[parking_lot_core-0.9.8.sha256sum] =3D "93f0=
0c865fe7cabf650081affecd3871070
 SRC_URI[percent-encoding-2.3.1.sha256sum] =3D "e3148f5046208a5d56bcfc030=
53e3ca6334e51da8dfb19b6cdc8b306fae3283e"
 SRC_URI[portable-atomic-1.6.0.sha256sum] =3D "7170ef9988bc169ba16dd36a7f=
a041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.76.sha256sum] =3D "95fc56cda0b5c3325f5fbbd7ff9fd=
a9e02bb00bb3dac51252d2f1bfa1cb8cc8c"
-SRC_URI[pyo3-0.20.3.sha256sum] =3D "53bdbb96d49157e65d45cc287af5f32ffadd=
5f4761438b527b055fb0d4bb8233"
-SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D "deaa5745de3f5231ce10517=
a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
-SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D "62b42531d03e08d4ef1f6e85a2ed422e=
b678b8cd62b762e53891c05faf0d4afa"
-SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D "7305c720fa01b8055ec95e484a6ec=
a7a83c841267f0dd5280f0c8b8551d2c158"
-SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D "7c7e9b68bb9c3149c5b0c=
ade5d07f953d6d125eb4337723c4ccdb665f1f96185"
+SRC_URI[pyo3-0.21.1.sha256sum] =3D "a7a8b1990bd018761768d5e608a13df8bd1a=
c5f678456e0f301bb93e5f3ea16b"
+SRC_URI[pyo3-build-config-0.21.1.sha256sum] =3D "650dca34d463b6cdbdb02b1=
d71bfd6eb6b6816afc708faebb3bac1380ff4aef7"
+SRC_URI[pyo3-ffi-0.21.1.sha256sum] =3D "09a7da8fc04a8a2084909b59f29e1b84=
74decac98b951d77b80b26dc45f046ad"
+SRC_URI[pyo3-macros-0.21.1.sha256sum] =3D "4b8a199fce11ebb28e35693872288=
36ea98110e43a804a530a9fd83ade36d513"
+SRC_URI[pyo3-macros-backend-0.21.1.sha256sum] =3D "93fbbfd7eb553d1003651=
3cb122b888dcd362a945a00b06c165f2ab480d4cc3b"
 SRC_URI[python3-dll-a-0.2.9.sha256sum] =3D "d5f07cd4412be8fa09a721d40007=
c483981bbe072cd6a21f2e83e04ec8f8343f"
 SRC_URI[quote-1.0.35.sha256sum] =3D "291ec9ab5efd934aaf503a6466c5d525153=
5d108ee747472c3977cc5acc868ef"
 SRC_URI[redox_syscall-0.3.5.sha256sum] =3D "567664f262709473930a4bf9e51b=
f2ebf3348f2e748ccc50dea20646858f8f29"
-SRC_URI[regex-1.10.2.sha256sum] =3D "380b951a9c5e80ddfd6136919eef3231072=
1aa4aacd4889a8d39124b026ab343"
-SRC_URI[regex-automata-0.4.3.sha256sum] =3D "5f804c7828047e88b2d32e2d7fe=
5a105da8ee3264f01902f796c8e067dc2483f"
+SRC_URI[regex-1.10.3.sha256sum] =3D "b62dbe01f0b06f9d8dc7d49e05a0785f153=
b00b2c227856282f671e0318c9b15"
+SRC_URI[regex-automata-0.4.5.sha256sum] =3D "5bb987efffd3c6d0d8f5f89510b=
b458559eab11e4f869acb20bf845e016259cd"
 SRC_URI[regex-syntax-0.8.2.sha256sum] =3D "c08c74e62047bb2de4ff487b251e4=
a92e24f48745648451635cec7d591162d9f"
 SRC_URI[rustversion-1.0.13.sha256sum] =3D "dc31bd9b61a32c31f9650d18add92=
aa83a49ba979c143eefd27fe7177b05bd5f"
 SRC_URI[ryu-1.0.14.sha256sum] =3D "fe232bdf6be8c8de797b22184ee71118d6378=
0ea42ac85b61d1baa6d3b782ae9"
 SRC_URI[scopeguard-1.1.0.sha256sum] =3D "d29ab0c6d3fc0ee92fe66e2d99f700e=
ab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[serde-1.0.195.sha256sum] =3D "63261df402c67811e9ac6def069e478614=
8c4563f4b50fd4bf30aa370d626b02"
-SRC_URI[serde_derive-1.0.195.sha256sum] =3D "46fe8f8603d81ba86327b23a2e9=
cdf49e1255fb94a4c5f297f6ee0547178ea2c"
-SRC_URI[serde_json-1.0.109.sha256sum] =3D "cb0652c533506ad7a2e353cce2693=
30d6afd8bdfb6d75e0ace5b35aacbd7b9e9"
-SRC_URI[smallvec-1.11.2.sha256sum] =3D "4dccd0940a2dcdf68d092b8cbab7dc0a=
d8fa938bf95787e1b916b0e3d0e8e970"
-SRC_URI[speedate-0.13.0.sha256sum] =3D "242f76c50fd18cbf098607090ade73a0=
8d39cfd84ea835f3796a2c855223b19b"
+SRC_URI[serde-1.0.197.sha256sum] =3D "3fb1c873e1b9b056a4dc4c0c198b24c3ff=
a059243875552b2bd0933b1aee4ce2"
+SRC_URI[serde_derive-1.0.197.sha256sum] =3D "7eb0b34b42edc17f6b7cac84a52=
a1c5f0e1bb2227e997ca9011ea3dd34e8610b"
+SRC_URI[serde_json-1.0.114.sha256sum] =3D "c5f09b1bd632ef549eaa9f60a1f8d=
e742bdbc698e6cee2095fc84dde5f549ae0"
+SRC_URI[smallvec-1.13.2.sha256sum] =3D "3c5e1a9a646d36c3599cd173a41282da=
f47c44583ad367b8e6837255952e5c67"
+SRC_URI[speedate-0.14.0.sha256sum] =3D "c323c4e6fece5a5a1a2a7f726d243144=
cce9fbcfe3ce4d9f3c6ede726a2bc780"
 SRC_URI[static_assertions-1.1.0.sha256sum] =3D "a2eb9349b6444b326872e140=
eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[strum-0.25.0.sha256sum] =3D "290d54ea6f91c969195bdbcd7442c8c2a2b=
a87da8bf60a7ee86a235d4bc1e125"
 SRC_URI[strum_macros-0.25.3.sha256sum] =3D "23dc1fa9ac9c169a78ba62f0b841=
814b7abae11bdd047b9c58f893439e309ea0"
+SRC_URI[strum_macros-0.26.1.sha256sum] =3D "7a3417fc93d76740d974a01654a0=
9777cb500428cc874ca9f45edfe0c4d4cd18"
 SRC_URI[syn-2.0.48.sha256sum] =3D "0f3531638e407dfc0814761abb7c00a5b5499=
2b849452a0646b7f65c9f770f3f"
 SRC_URI[target-lexicon-0.12.9.sha256sum] =3D "df8e77cb757a61f51b947ec4a7=
e3646efd825b73561db1c232a8ccb639e611a0"
 SRC_URI[tinyvec-1.6.0.sha256sum] =3D "87cc5ceb3875bb20c2890005a4e226a465=
1264a5c75edb2421b52861a0a0cb50"
@@ -155,7 +149,7 @@ SRC_URI[unicode-ident-1.0.10.sha256sum] =3D "22049a19=
f4a68748a168c0fc439f9516686aa
 SRC_URI[unicode-normalization-0.1.22.sha256sum] =3D "5c5713f0fc4b5db668a=
2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
 SRC_URI[unindent-0.2.3.sha256sum] =3D "c7de7d73e1754487cb58364ee906a4999=
37a0dfabd86bcb980fa99ec8c8fa2ce"
 SRC_URI[url-2.5.0.sha256sum] =3D "31e6302e3bb753d46e83516cae55ae196fc0c3=
09407cf11ab35cc51a4c2a4633"
-SRC_URI[uuid-1.6.1.sha256sum] =3D "5e395fcf16a7a3d8127ec99782007af141946=
b4795001f876d54fb0d55978560"
+SRC_URI[uuid-1.7.0.sha256sum] =3D "f00cc9702ca12d3c81455259621e676d0f725=
1cec66a21e98fe2e9a37db93b2a"
 SRC_URI[version_check-0.9.4.sha256sum] =3D "49874b5167b65d7193b8aba1567f=
5c7d93d001cafc34600cee003eda787e483f"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D "9c8d87e72b64a=
3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[windows-targets-0.48.1.sha256sum] =3D "05d4b17490f70499f20b9e791=
dcf6a299785ce8af4d709018206dc5b4953e95f"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/00=
01-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch b/meta-pyth=
on/recipes-devtools/python/python3-pydantic-core/0001-Bumps-pyo3-https-gi=
thub.com-pyo3-pyo3-from-0.20.2-to.patch
deleted file mode 100644
index 32777e1d0..000000000
--- a/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Bump=
s-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From a5690f973384bf8cbf4deb3b83d822b7aaefbdd8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 27 Feb 2024 11:00:46 -0800
-Subject: [PATCH] Bumps [pyo3](https://github.com/pyo3/pyo3) from 0.20.2 =
to
- 0.20.3.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Cargo.lock | 26 +++++++++++++++++---------
- Cargo.toml |  2 +-
- 2 files changed, 18 insertions(+), 10 deletions(-)
-
---- a/Cargo.lock
-+++ b/Cargo.lock
-@@ -322,6 +322,12 @@ source =3D "registry+https://github.com/ru
- checksum =3D "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306f=
ae3283e"
-=20
- [[package]]
-+name =3D "portable-atomic"
-+version =3D "1.6.0"
-+source =3D "registry+https://github.com/rust-lang/crates.io-index"
-+checksum =3D "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded37=
1eae7c0"
-+
-+[[package]]
- name =3D "proc-macro2"
- version =3D "1.0.76"
- source =3D "registry+https://github.com/rust-lang/crates.io-index"
-@@ -357,9 +363,9 @@ dependencies =3D [
-=20
- [[package]]
- name =3D "pyo3"
--version =3D "0.20.2"
-+version =3D "0.20.3"
- source =3D "registry+https://github.com/rust-lang/crates.io-index"
--checksum =3D "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1e=
e3d6fe0"
-+checksum =3D "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d=
4bb8233"
- dependencies =3D [
-  "cfg-if",
-  "indoc",
-@@ -367,6 +373,7 @@ dependencies =3D [
-  "memoffset",
-  "num-bigint",
-  "parking_lot",
-+ "portable-atomic",
-  "pyo3-build-config",
-  "pyo3-ffi",
-  "pyo3-macros",
-@@ -375,9 +382,9 @@ dependencies =3D [
-=20
- [[package]]
- name =3D "pyo3-build-config"
--version =3D "0.20.2"
-+version =3D "0.20.3"
- source =3D "registry+https://github.com/rust-lang/crates.io-index"
--checksum =3D "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893=
c5163be"
-+checksum =3D "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b58422920858=
31d48d7"
- dependencies =3D [
-  "once_cell",
-  "python3-dll-a",
-@@ -386,9 +393,9 @@ dependencies =3D [
-=20
- [[package]]
- name =3D "pyo3-ffi"
--version =3D "0.20.2"
-+version =3D "0.20.3"
- source =3D "registry+https://github.com/rust-lang/crates.io-index"
--checksum =3D "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd05=
8da6cf1"
-+checksum =3D "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05fa=
f0d4afa"
- dependencies =3D [
-  "libc",
-  "pyo3-build-config",
-@@ -396,9 +403,9 @@ dependencies =3D [
-=20
- [[package]]
- name =3D "pyo3-macros"
--version =3D "0.20.2"
-+version =3D "0.20.3"
- source =3D "registry+https://github.com/rust-lang/crates.io-index"
--checksum =3D "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a84=
3f74ed3"
-+checksum =3D "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b855=
1d2c158"
- dependencies =3D [
-  "proc-macro2",
-  "pyo3-macros-backend",
-@@ -408,12 +415,13 @@ dependencies =3D [
-=20
- [[package]]
- name =3D "pyo3-macros-backend"
--version =3D "0.20.2"
-+version =3D "0.20.3"
- source =3D "registry+https://github.com/rust-lang/crates.io-index"
--checksum =3D "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da7=
9e8881f"
-+checksum =3D "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f=
1f96185"
- dependencies =3D [
-  "heck",
-  "proc-macro2",
-+ "pyo3-build-config",
-  "quote",
-  "syn",
- ]
---- a/Cargo.toml
-+++ b/Cargo.toml
-@@ -26,7 +26,7 @@ include =3D [
- ]
-=20
- [dependencies]
--pyo3 =3D { version =3D "0.20.2", features =3D ["generate-import-lib", "=
num-bigint"] }
-+pyo3 =3D { version =3D "0.20.3", features =3D ["generate-import-lib", "=
num-bigint"] }
- regex =3D "1.10.2"
- strum =3D { version =3D "0.25.0", features =3D ["derive"] }
- strum_macros =3D "0.25.3"
-@@ -70,12 +70,12 @@ debug =3D true
- strip =3D false
-=20
- [dev-dependencies]
--pyo3 =3D { version =3D "0.20.2", features =3D ["auto-initialize"] }
-+pyo3 =3D { version =3D "0.20.3", features =3D ["auto-initialize"] }
-=20
- [build-dependencies]
- version_check =3D "0.9.4"
- # used where logic has to be version/distribution specific, e.g. pypy
--pyo3-build-config =3D { version =3D "0.20.2" }
-+pyo3-build-config =3D { version =3D "0.20.3" }
-=20
- [lints.clippy]
- dbg_macro =3D "warn"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/00=
01-Fix-generate_self_schema-for-Python-3.12-1299.patch b/meta-python/reci=
pes-devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-f=
or-Python-3.12-1299.patch
new file mode 100644
index 000000000..e795c8bfb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-=
generate_self_schema-for-Python-3.12-1299.patch
@@ -0,0 +1,32 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jelle Zijlstra <jelle.zijlstra@gmail.com>
+Date: Wed, 22 May 2024 07:44:10 -0700
+Subject: [PATCH] Fix generate_self_schema for Python 3.12+ (#1299)
+
+Upstream-Status: Backport [https://github.com/pydantic/pydantic-core/com=
mit/a7620419383a69bd2b28ab953c9a17f6ed35bb9a]
+
+---
+ generate_self_schema.py | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/generate_self_schema.py b/generate_self_schema.py
+index 3aef99b..acecf19 100644
+--- a/generate_self_schema.py
++++ b/generate_self_schema.py
+@@ -190,7 +190,12 @@ def all_literal_values(type_: type[core_schema.Lite=
ral]) -> list[any]:
+=20
+ def eval_forward_ref(type_: Any) -> Any:
+     try:
+-        return type_._evaluate(core_schema.__dict__, None, set())
++        try:
++            # Python 3.12+
++            return type_._evaluate(core_schema.__dict__, None, type_par=
ams=3Dset(), recursive_guard=3Dset())
++        except TypeError:
++            # Python 3.9+
++            return type_._evaluate(core_schema.__dict__, None, set())
+     except TypeError:
+         # for Python 3.8
+         return type_._evaluate(core_schema.__dict__, None)
+--=20
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/00=
01-Lower-MSRV-to-1.75-1316.patch b/meta-python/recipes-devtools/python/py=
thon3-pydantic-core/0001-Lower-MSRV-to-1.75-1316.patch
new file mode 100644
index 000000000..29d14fd05
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/0001-Lowe=
r-MSRV-to-1.75-1316.patch
@@ -0,0 +1,25 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Christian Heimes <christian@python.org>
+Date: Wed, 5 Jun 2024 11:34:52 +0200
+Subject: [PATCH] Lower MSRV to 1.75 (#1316)
+
+Upstream-Status: Backport [https://github.com/pydantic/pydantic-core/com=
mit/ebef5bdf92707f5e1739931150893ae6c7ccc531]
+
+Signed-off-by: Christian Heimes <christian@python.org>
+---
+ Cargo.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Cargo.toml b/Cargo.toml
+index 88470c5..f8170a2 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -24,7 +24,7 @@ include =3D [
+     "!tests/.pytest_cache",
+     "!*.so",
+ ]
+-rust-version =3D "1.76"
++rust-version =3D "1.75"
+=20
+ [dependencies]
+ pyo3 =3D { version =3D "0.21.1", features =3D ["generate-import-lib", "=
num-bigint"] }
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.=
16.3.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.=
1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.1=
6.3.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.18.=
1.bb
index faa291ea6..fca40b5c8 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.1.bb
@@ -8,14 +8,17 @@ HOMEPAGE =3D "https://github.com/pydantic/pydantic-core=
"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dab599c188b4a314d2856b3a55030c=
75c"
=20
-SRC_URI +=3D "file://0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.2=
0.2-to.patch"
-SRC_URI[sha256sum] =3D "1cac689f80a3abab2d3c0048b29eea5751114054f032a941=
a32de4c852c59cad"
+SRC_URI[sha256sum] =3D "de9d3e8717560eb05e28739d1b35e4eac2e458553a52a301=
e51352a7ffc86a35"
=20
 DEPENDS =3D "python3-maturin-native python3-typing-extensions"
=20
 require ${BPN}-crates.inc
=20
 inherit pypi cargo-update-recipe-crates python_maturin
+SRC_URI +=3D "\
+    file://0001-Lower-MSRV-to-1.75-1316.patch \
+    file://0001-Fix-generate_self_schema-for-Python-3.12-1299.patch \
+"
=20
 PYPI_PACKAGE =3D "pydantic_core"
=20
--=20
2.43.0


