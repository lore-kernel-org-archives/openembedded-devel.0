Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E38BC36019
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.47781.1743412322115473336
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b1QsAbDj;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412325; x=1774948325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vFkoaw9eBIRF4TsQNARpDy508S3Nsou4TVwnIpFb3OQ=;
  b=b1QsAbDj5W2FvuPyKwFzPjwGqG8xZqSBnU+Ce8f51QsvULBbLj3wdwLd
   O6QF629kI6LP5RlehAcHA7bxXrnaBIpoPnwWOGVGXmu0IniTEyc9LDKag
   h6KqpAgPktW262hdEXBzkHg0zc/Ho5/mTn8dj6B1S2JDwujpAwfiBBNUl
   HK4npoeA1nD3KZ/01kk5diIcsSmsTsH06yT/C/R+h3JmF6uWyixo8ZTrO
   JZ2/sIxWxFoX5wWCWG4osLBq3Gwea7P3qcM/GygocaPcIce+l7Gu2DZ5/
   bwdkCqEjhcWIbm8glF7VF2dB/AGkEgrHxcmsyiHfim48XsZUwxGD88LTu
   g==;
X-CSE-ConnectionGUID: oPFhfA5vSFS1rBouNPHHOg==
X-CSE-MsgGUID: NJepbzYPR82RuqiLL7J53w==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194984819"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194984819"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:04 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D4910D6EA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 963ADF310
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 566521A0078;
	Mon, 31 Mar 2025 17:11:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/26] python3-pyasn1-modules: upgrade 0.4.1 -> 0.4.2
Date: Mon, 31 Mar 2025 17:11:41 +0800
Message-Id: <1743412308-21887-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116417

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Stop-using-pyasn1.compat.octets.patch
removed since it's included in 0.4.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...0001-Stop-using-pyasn1.compat.octets.patch | 171 ------------------
 ...4.1.bb => python3-pyasn1-modules_0.4.2.bb} |   3 +-
 2 files changed, 1 insertion(+), 173 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyasn1-modules/0001-Stop-using-pyasn1.compat.octets.patch
 rename meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.4.1.bb => python3-pyasn1-modules_0.4.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules/0001-Stop-using-pyasn1.compat.octets.patch b/meta-python/recipes-devtools/python/python3-pyasn1-modules/0001-Stop-using-pyasn1.compat.octets.patch
deleted file mode 100644
index d9751b7187..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules/0001-Stop-using-pyasn1.compat.octets.patch
+++ /dev/null
@@ -1,171 +0,0 @@
-From d20c89d017a572755484b1bc41eac20285e68550 Mon Sep 17 00:00:00 2001
-From: Heiko Becker <mail@heiko-becker.de>
-Date: Wed, 25 Sep 2024 22:38:42 +0200
-Subject: [PATCH] Stop using pyasn1.compat.octets
-
-It was removed from pyasn1 in
-https://github.com/pyasn1/pyasn1/commit/6f770ba886a8931c35cb090a5c3a6d67f5a41bd9
-
-Fixes #19.
-
-Upstream-Status: Submitted [https://github.com/pyasn1/pyasn1-modules/pull/22]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/test_pem.py     | 3 +--
- tests/test_rfc3770.py | 3 +--
- tests/test_rfc4073.py | 3 +--
- tests/test_rfc4334.py | 3 +--
- tests/test_rfc5755.py | 3 +--
- tests/test_rfc6032.py | 7 +++----
- tests/test_rfc6120.py | 1 -
- 7 files changed, 8 insertions(+), 15 deletions(-)
-
-diff --git a/tests/test_pem.py b/tests/test_pem.py
-index dbcca5a..e0fe334 100644
---- a/tests/test_pem.py
-+++ b/tests/test_pem.py
-@@ -7,7 +7,6 @@
- import sys
- import unittest
- 
--from pyasn1.compat.octets import ints2octs
- from pyasn1_modules import pem
- 
- 
-@@ -93,7 +92,7 @@ GGbx7DI=
-             24, 102, 241, 236, 50
-         ]
- 
--        self.assertEqual(ints2octs(expected), binary)
-+        self.assertEqual(bytes(expected), binary)
- 
- 
- suite = unittest.TestLoader().loadTestsFromModule(sys.modules[__name__])
-diff --git a/tests/test_rfc3770.py b/tests/test_rfc3770.py
-index 667ab24..93d4093 100644
---- a/tests/test_rfc3770.py
-+++ b/tests/test_rfc3770.py
-@@ -10,7 +10,6 @@ import unittest
- 
- from pyasn1.codec.der.decoder import decode as der_decoder
- from pyasn1.codec.der.encoder import encode as der_encoder
--from pyasn1.compat.octets import str2octs
- 
- from pyasn1_modules import pem
- from pyasn1_modules import rfc5480
-@@ -79,7 +78,7 @@ DAlVlhox680Jxy5J8Pkx
-                 self.assertEqual(extn['extnValue'], der_encoder(extnValue))
- 
-                 if extn['extnID'] == rfc3770.id_pe_wlanSSID:
--                    self.assertIn(str2octs('Example'), extnValue)
-+                    self.assertIn(b'Example', extnValue)
- 
-                 if extn['extnID'] == rfc5280.id_ce_extKeyUsage:
-                     self.assertIn(rfc3770.id_kp_eapOverLAN, extnValue)
-diff --git a/tests/test_rfc4073.py b/tests/test_rfc4073.py
-index 4bd5e5f..3b516cc 100644
---- a/tests/test_rfc4073.py
-+++ b/tests/test_rfc4073.py
-@@ -10,7 +10,6 @@ import unittest
- 
- from pyasn1.codec.der.decoder import decode as der_decoder
- from pyasn1.codec.der.encoder import encode as der_encoder
--from pyasn1.compat.octets import str2octs
- 
- from pyasn1_modules import pem
- from pyasn1_modules import rfc2634
-@@ -131,7 +130,7 @@ buWO3egPDL8Kf7tBhzjIKLw=
- 
-             self.assertIn(next_ci['contentType'], rfc5652.cmsContentTypesMap)
-             self.assertEqual(rfc5652.id_data, next_ci['contentType'])
--            self.assertIn(str2octs('Content-Type: text'), next_ci['content'])
-+            self.assertIn(b'Content-Type: text', next_ci['content'])
- 
-             for attr in ci['content']['attrs']:
-                 self.assertIn(attr['attrType'], rfc5652.cmsAttributesMap)
-diff --git a/tests/test_rfc4334.py b/tests/test_rfc4334.py
-index 9ba5fdf..e180d67 100644
---- a/tests/test_rfc4334.py
-+++ b/tests/test_rfc4334.py
-@@ -10,7 +10,6 @@ import unittest
- 
- from pyasn1.codec.der.decoder import decode as der_decoder
- from pyasn1.codec.der.encoder import encode as der_encoder
--from pyasn1.compat.octets import str2octs
- 
- from pyasn1_modules import pem
- from pyasn1_modules import rfc5280
-@@ -67,7 +66,7 @@ DAlVlhox680Jxy5J8Pkx
-                 self.assertEqual(extn['extnValue'], der_encoder(extnValue))
- 
-                 if extn['extnID'] == rfc4334.id_pe_wlanSSID:
--                    self.assertIn( str2octs('Example'), extnValue)
-+                    self.assertIn(b'Example', extnValue)
-             
-                 if extn['extnID'] == rfc5280.id_ce_extKeyUsage:
-                     self.assertIn(rfc4334.id_kp_eapOverLAN, extnValue)
-diff --git a/tests/test_rfc5755.py b/tests/test_rfc5755.py
-index cf4a05f..46908e2 100644
---- a/tests/test_rfc5755.py
-+++ b/tests/test_rfc5755.py
-@@ -10,7 +10,6 @@ import unittest
- 
- from pyasn1.codec.der.decoder import decode as der_decoder
- from pyasn1.codec.der.encoder import encode as der_encoder
--from pyasn1.compat.octets import str2octs
- 
- from pyasn1_modules import pem
- from pyasn1_modules import rfc5280
-@@ -85,7 +84,7 @@ Q4eikPk4LQey
-             count += 1
-             if attr['type'] == rfc5755.id_aca_authenticationInfo:
-                 self.assertEqual(
--                    str2octs('password'), attr['values'][0]['authInfo'])
-+                    b'password', attr['values'][0]['authInfo'])
- 
-         self.assertEqual(5, count)
- 
-diff --git a/tests/test_rfc6032.py b/tests/test_rfc6032.py
-index 287bad8..2327416 100644
---- a/tests/test_rfc6032.py
-+++ b/tests/test_rfc6032.py
-@@ -10,7 +10,6 @@ import unittest
- 
- from pyasn1.codec.der.decoder import decode as der_decoder
- from pyasn1.codec.der.encoder import encode as der_encoder
--from pyasn1.compat.octets import str2octs
- 
- from pyasn1_modules import pem
- from pyasn1_modules import rfc5652
-@@ -64,7 +63,7 @@ YIZIAWUCAQVCMRAEDnB0Zi1rZGMtODEyMzc0
-         self.assertFalse(rest)
-         self.assertTrue(keyid.prettyPrint())
-         self.assertEqual(attrVal0, der_encoder(keyid))
--        self.assertEqual(str2octs('ptf-kdc-812374'), keyid)
-+        self.assertEqual(b'ptf-kdc-812374', keyid)
- 
-     def testOpenTypes(self):
-         substrate = pem.readBase64fromText(self.encrypted_key_pkg_pem_text)
-@@ -86,8 +85,8 @@ YIZIAWUCAQVCMRAEDnB0Zi1rZGMtODEyMzc0
-             self.assertNotEqual('0x', attr['attrValues'][0].prettyPrint()[:2])
- 
-             if attr['attrType'] == rfc6032.id_aa_KP_contentDecryptKeyID:
--                self.assertEqual(str2octs(
--                    'ptf-kdc-812374'), attr['attrValues'][0])
-+                self.assertEqual(
-+                    b'ptf-kdc-812374', attr['attrValues'][0])
- 
- 
- suite = unittest.TestLoader().loadTestsFromModule(sys.modules[__name__])
-diff --git a/tests/test_rfc6120.py b/tests/test_rfc6120.py
-index bdedab8..a621745 100644
---- a/tests/test_rfc6120.py
-+++ b/tests/test_rfc6120.py
-@@ -10,7 +10,6 @@ import unittest
- 
- from pyasn1.codec.der.decoder import decode as der_decoder
- from pyasn1.codec.der.encoder import encode as der_encoder
--from pyasn1.compat.octets import str2octs
- 
- from pyasn1_modules import pem
- from pyasn1_modules import rfc5280
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.2.bb
index 0ef2eaa1da..e21bf4427f 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.2.bb
@@ -6,8 +6,7 @@ HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI += "file://0001-Stop-using-pyasn1.compat.octets.patch"
-SRC_URI[sha256sum] = "c28e2dbf9c06ad61c71a075c7e0f9fd0f1b0bb2d2ad4377f240d33ac2ab60a7c"
+SRC_URI[sha256sum] = "677091de870a80aae844b1ca6134f54652fa2c8c5a52aa396440ac3106e941e6"
 
 PYPI_PACKAGE = "pyasn1_modules"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


