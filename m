Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CD5C02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:20 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.32740.1737360855534740169
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RIPvCOj/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360855; x=1768896855;
  h=from:to:cc:subject:date:message-id;
  bh=OGh76Mrh81Z7tulqnfWg7ebI3dr0fVoVmz7R7AMnvJs=;
  b=RIPvCOj/rfHLcL0v/2R7RqSbNPEdJm7Jojlv4n2Ur1AklrQ6dx/tCofr
   15XEL+PNWfH/s6JKHBFdL/EHFVUNfo+e8kl8gso0bBYRxlQ8QzrFCrIAf
   kplAnaOfT0inysil0EatWMjzI2s7/ksQX7VZmHnTeI7FHDKSUcReiulJ3
   DmEkFZWbHmDy13tVkYliRdRWBgYgwH3yJ63ljHg5T6idJw2fpCpMT5zBm
   v3MNFhRJY2uA781uqiWRUBIlMMGMqqvVoB7LX4aBNfphFF1NfKBpdR1pW
   XMb2GcxIJXhFEVYw5vrwdnXd/oVkZeWdEet8OCBTM6usApo9SdcGutkaZ
   g==;
X-CSE-ConnectionGUID: n4VKcsxYTaedTj6hHGzbmg==
X-CSE-MsgGUID: asOwbonRTrCcaryqQn/4zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="166002969"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="166002969"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:12 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E5C8CD6EA5
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B79B0D504A
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4581C6BAD4
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:10 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BBDFD1A0071;
	Mon, 20 Jan 2025 16:14:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/32] cbindgen: update 0.27.0 -> 0.28.0
Date: Mon, 20 Jan 2025 16:13:35 +0800
Message-Id: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10--4.050800-10.000000
X-TMASE-MatchedRID: pJ3+GokX5XqvbHkumykHI4pEbqc+UneTTfK5j0EZbysyiBah22IzqMhm
	fp+W2l0Ls/JqxHYFyTw8wKkUVzBgPri9bJRkmG5wPKN38CLPK0HYjw1QqLfrRnl7KG7hOkird/0
	L1lIAQJrvAkvb7xTgscYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgBCE2NlBjIjctE8mz+ry/JT4uV
	KQ46IHT7Vw1kBoaYp+dwmhLLIxW2eR9GF2J2xqMxRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUsxDYD
	E8xUY8A4gJdQewNTMRjENp52SZQ1l4XYuzjpJk2hagUajSmZ3H2JRIOSecIDJIl5vO0o++eUO99
	5PeZBY8kjwdhnrRN94geppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114963

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Parse unsafe attributes
* Fix local override of enum prefix-with-name
* Add rename-all=prefix
* ir: add support for UnsafeCell and SyncUnsafeCell
* Implement mangling for arrays
* Fix: Ignore 'CARGO_BUILD_TARGET' in tests
* Newline for each field for constexpr field constants
* Fix clippy warnings
* Add aarch64/arm64 to CI
* Add `unstable_ir` feature flag that makes the ir pub
* Support generated a symbols file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cbindgen/{cbindgen_0.27.0.bb => cbindgen_0.28.0.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/cbindgen/{cbindgen_0.27.0.bb => cbindgen_0.28.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.27.0.bb b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/cbindgen/cbindgen_0.27.0.bb
rename to meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
index e395f667c2..40436ef035 100644
--- a/meta-oe/recipes-devtools/cbindgen/cbindgen_0.27.0.bb
+++ b/meta-oe/recipes-devtools/cbindgen/cbindgen_0.28.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
 
 SRC_URI += "git://github.com/mozilla/cbindgen.git;protocol=https;branch=master"
-SRCREV = "58c6156b0d91e82abb03c26187b8d18fa4345ce0"
+SRCREV = "bd78bbe59b10eda6ef1255e4acda95c56c6d0279"
 S = "${WORKDIR}/git"
 
 inherit cargo pkgconfig
@@ -56,7 +56,7 @@ SRC_URI += " \
     crate://crates.io/serial_test_derive/2.0.0 \
     crate://crates.io/smallvec/1.13.2 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/syn/2.0.72 \
+    crate://crates.io/syn/2.0.85 \
     crate://crates.io/tempfile/3.12.0 \
     crate://crates.io/toml/0.8.19 \
     crate://crates.io/toml_datetime/0.6.8 \
@@ -124,7 +124,7 @@ SRC_URI[serial_test-2.0.0.sha256sum] = "0e56dd856803e253c8f298af3f4d7eb0ae5e23a7
 SRC_URI[serial_test_derive-2.0.0.sha256sum] = "91d129178576168c589c9ec973feedf7d3126c01ac2bf08795109aa35b69fb8f"
 SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[syn-2.0.72.sha256sum] = "dc4b9b9bf2add8093d3f2c0204471e951b2285580335de42f9d2534f3ae7a8af"
+SRC_URI[syn-2.0.85.sha256sum] = "5023162dfcd14ef8f32034d8bcd4cc5ddc61ef7a247c024a33e24e1f24d21b56"
 SRC_URI[tempfile-3.12.0.sha256sum] = "04cbcdd0c794ebb0d4cf35e88edd2f7d2c4c3e9a5a6dab322839b321c6a87a64"
 SRC_URI[toml-0.8.19.sha256sum] = "a1ed1f98e3fdc28d6d910e6737ae6ab1a93bf1985935a1193e68f93eeb68d24e"
 SRC_URI[toml_datetime-0.6.8.sha256sum] = "0dd7358ecb8fc2f8d014bf86f6f638ce72ba252a2c3a2572f2a795f1d23efb41"
-- 
2.43.0


