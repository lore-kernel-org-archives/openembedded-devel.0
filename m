Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B0ECEACE5
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 16:20:00 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.85905.1727799594793923421
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Oct 2024 09:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N9pK2aeW;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7db174f9050so1380489a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 09:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727799594; x=1728404394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gaSpiyhW3KJ8QnraWErmWlMC/Q3OuVtCibUySVJ/KE=;
        b=N9pK2aeW66sWHuh5+YArJdC/djMEvOruP5E3ReWOsheSF0fSAXrX/8rt2f1Ej9mG3p
         3fey9LFArjF4j5DWgeVPdqJpEVlWQx/la9bn+nqPPsNhu8+SWnFNDh2QPrKXpNIoY7UM
         lqYL7tQfaKIZ79tmYKE0qCTdwJkFkh10iEC50W7u4wkbs83CvoGWBSMxa0HsTy2BZoEr
         ajIKGmA1Sh2TBH8XffNKf5F/BX5zvWdbx74mdVg94JJa7qeNrLPmNvfv/eBskKbdN/SU
         C0kLSvLjB5fs6ZzMQNXslXQxcAT/5a2Fh12R+C1kyH0DrIYWkoBFVOxjR3Twz2eaZUsO
         Ff6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727799594; x=1728404394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gaSpiyhW3KJ8QnraWErmWlMC/Q3OuVtCibUySVJ/KE=;
        b=PLGMu1KR27pJk1dnzR4B+b14/YcMQ+HLpmU6+Elv3xkpmOGmN69uzaBSRWnvxJMQOd
         eRQqnlkeDDBN08Dcg1YZ6RPLWLPb0E5NW6+c2slXjhIDe8VIzlVVE+Mmz6oRqjdRkF7u
         OdJBQIkQRn+H7O3ScF8VdwWVjpcdaTVwPZKFM/1kBDsk2yfsfbHLHuYX/7NxfCSLRnRN
         6DPYN4DnvTfgWINPCbLf6doUTRSvnOrNUClH24rSlAbX224rJrOyskNGyVLE48Odcl7n
         KkNq59mokc4d5iOpS+n9sBo97buExruWuyAFhtO+hU5PgOn4T3HKzYgGPrarW0Q7trRc
         abow==
X-Gm-Message-State: AOJu0YwyhJwy9m7mhUxfZg4pl5Fn2n0avFeBmVXw3kvrYDxh6AiW50wq
	6GiPjOG4R8QuvKlwtY9G6ZdfsFls4Byu3swiW8SG9xANFE/UCWMsCYBiC8Hw
X-Google-Smtp-Source: AGHT+IGK9LJ3fkhSGi3yMan/FD/fxeimoB1eTXvtzFCf80kAyQsYI0jpG1W5rkYE1tCgA5ZhQ3PcBA==
X-Received: by 2002:a17:90b:790:b0:2d3:c4d1:c95d with SMTP id 98e67ed59e1d1-2e1846ca4f4mr281073a91.21.1727799593898;
        Tue, 01 Oct 2024 09:19:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::caca])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e123e454dasm5131299a91.48.2024.10.01.09.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:19:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pyasn1-modules: Stop using pyasn1.compat.octets in tests
Date: Tue,  1 Oct 2024 09:19:51 -0700
Message-ID: <20241001161951.2723156-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 16:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112633

asn1 0.6.1 has dropped this module

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Stop-using-pyasn1.compat.octets.patch | 171 ++++++++++++++++++
 .../python/python3-pyasn1-modules_0.4.1.bb    |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyasn1-modules/0001-Stop-using-pyasn1.compat.octets.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules/0001-Stop-using-pyasn1.compat.octets.patch b/meta-python/recipes-devtools/python/python3-pyasn1-modules/0001-Stop-using-pyasn1.compat.octets.patch
new file mode 100644
index 0000000000..d9751b7187
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules/0001-Stop-using-pyasn1.compat.octets.patch
@@ -0,0 +1,171 @@
+From d20c89d017a572755484b1bc41eac20285e68550 Mon Sep 17 00:00:00 2001
+From: Heiko Becker <mail@heiko-becker.de>
+Date: Wed, 25 Sep 2024 22:38:42 +0200
+Subject: [PATCH] Stop using pyasn1.compat.octets
+
+It was removed from pyasn1 in
+https://github.com/pyasn1/pyasn1/commit/6f770ba886a8931c35cb090a5c3a6d67f5a41bd9
+
+Fixes #19.
+
+Upstream-Status: Submitted [https://github.com/pyasn1/pyasn1-modules/pull/22]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test_pem.py     | 3 +--
+ tests/test_rfc3770.py | 3 +--
+ tests/test_rfc4073.py | 3 +--
+ tests/test_rfc4334.py | 3 +--
+ tests/test_rfc5755.py | 3 +--
+ tests/test_rfc6032.py | 7 +++----
+ tests/test_rfc6120.py | 1 -
+ 7 files changed, 8 insertions(+), 15 deletions(-)
+
+diff --git a/tests/test_pem.py b/tests/test_pem.py
+index dbcca5a..e0fe334 100644
+--- a/tests/test_pem.py
++++ b/tests/test_pem.py
+@@ -7,7 +7,6 @@
+ import sys
+ import unittest
+ 
+-from pyasn1.compat.octets import ints2octs
+ from pyasn1_modules import pem
+ 
+ 
+@@ -93,7 +92,7 @@ GGbx7DI=
+             24, 102, 241, 236, 50
+         ]
+ 
+-        self.assertEqual(ints2octs(expected), binary)
++        self.assertEqual(bytes(expected), binary)
+ 
+ 
+ suite = unittest.TestLoader().loadTestsFromModule(sys.modules[__name__])
+diff --git a/tests/test_rfc3770.py b/tests/test_rfc3770.py
+index 667ab24..93d4093 100644
+--- a/tests/test_rfc3770.py
++++ b/tests/test_rfc3770.py
+@@ -10,7 +10,6 @@ import unittest
+ 
+ from pyasn1.codec.der.decoder import decode as der_decoder
+ from pyasn1.codec.der.encoder import encode as der_encoder
+-from pyasn1.compat.octets import str2octs
+ 
+ from pyasn1_modules import pem
+ from pyasn1_modules import rfc5480
+@@ -79,7 +78,7 @@ DAlVlhox680Jxy5J8Pkx
+                 self.assertEqual(extn['extnValue'], der_encoder(extnValue))
+ 
+                 if extn['extnID'] == rfc3770.id_pe_wlanSSID:
+-                    self.assertIn(str2octs('Example'), extnValue)
++                    self.assertIn(b'Example', extnValue)
+ 
+                 if extn['extnID'] == rfc5280.id_ce_extKeyUsage:
+                     self.assertIn(rfc3770.id_kp_eapOverLAN, extnValue)
+diff --git a/tests/test_rfc4073.py b/tests/test_rfc4073.py
+index 4bd5e5f..3b516cc 100644
+--- a/tests/test_rfc4073.py
++++ b/tests/test_rfc4073.py
+@@ -10,7 +10,6 @@ import unittest
+ 
+ from pyasn1.codec.der.decoder import decode as der_decoder
+ from pyasn1.codec.der.encoder import encode as der_encoder
+-from pyasn1.compat.octets import str2octs
+ 
+ from pyasn1_modules import pem
+ from pyasn1_modules import rfc2634
+@@ -131,7 +130,7 @@ buWO3egPDL8Kf7tBhzjIKLw=
+ 
+             self.assertIn(next_ci['contentType'], rfc5652.cmsContentTypesMap)
+             self.assertEqual(rfc5652.id_data, next_ci['contentType'])
+-            self.assertIn(str2octs('Content-Type: text'), next_ci['content'])
++            self.assertIn(b'Content-Type: text', next_ci['content'])
+ 
+             for attr in ci['content']['attrs']:
+                 self.assertIn(attr['attrType'], rfc5652.cmsAttributesMap)
+diff --git a/tests/test_rfc4334.py b/tests/test_rfc4334.py
+index 9ba5fdf..e180d67 100644
+--- a/tests/test_rfc4334.py
++++ b/tests/test_rfc4334.py
+@@ -10,7 +10,6 @@ import unittest
+ 
+ from pyasn1.codec.der.decoder import decode as der_decoder
+ from pyasn1.codec.der.encoder import encode as der_encoder
+-from pyasn1.compat.octets import str2octs
+ 
+ from pyasn1_modules import pem
+ from pyasn1_modules import rfc5280
+@@ -67,7 +66,7 @@ DAlVlhox680Jxy5J8Pkx
+                 self.assertEqual(extn['extnValue'], der_encoder(extnValue))
+ 
+                 if extn['extnID'] == rfc4334.id_pe_wlanSSID:
+-                    self.assertIn( str2octs('Example'), extnValue)
++                    self.assertIn(b'Example', extnValue)
+             
+                 if extn['extnID'] == rfc5280.id_ce_extKeyUsage:
+                     self.assertIn(rfc4334.id_kp_eapOverLAN, extnValue)
+diff --git a/tests/test_rfc5755.py b/tests/test_rfc5755.py
+index cf4a05f..46908e2 100644
+--- a/tests/test_rfc5755.py
++++ b/tests/test_rfc5755.py
+@@ -10,7 +10,6 @@ import unittest
+ 
+ from pyasn1.codec.der.decoder import decode as der_decoder
+ from pyasn1.codec.der.encoder import encode as der_encoder
+-from pyasn1.compat.octets import str2octs
+ 
+ from pyasn1_modules import pem
+ from pyasn1_modules import rfc5280
+@@ -85,7 +84,7 @@ Q4eikPk4LQey
+             count += 1
+             if attr['type'] == rfc5755.id_aca_authenticationInfo:
+                 self.assertEqual(
+-                    str2octs('password'), attr['values'][0]['authInfo'])
++                    b'password', attr['values'][0]['authInfo'])
+ 
+         self.assertEqual(5, count)
+ 
+diff --git a/tests/test_rfc6032.py b/tests/test_rfc6032.py
+index 287bad8..2327416 100644
+--- a/tests/test_rfc6032.py
++++ b/tests/test_rfc6032.py
+@@ -10,7 +10,6 @@ import unittest
+ 
+ from pyasn1.codec.der.decoder import decode as der_decoder
+ from pyasn1.codec.der.encoder import encode as der_encoder
+-from pyasn1.compat.octets import str2octs
+ 
+ from pyasn1_modules import pem
+ from pyasn1_modules import rfc5652
+@@ -64,7 +63,7 @@ YIZIAWUCAQVCMRAEDnB0Zi1rZGMtODEyMzc0
+         self.assertFalse(rest)
+         self.assertTrue(keyid.prettyPrint())
+         self.assertEqual(attrVal0, der_encoder(keyid))
+-        self.assertEqual(str2octs('ptf-kdc-812374'), keyid)
++        self.assertEqual(b'ptf-kdc-812374', keyid)
+ 
+     def testOpenTypes(self):
+         substrate = pem.readBase64fromText(self.encrypted_key_pkg_pem_text)
+@@ -86,8 +85,8 @@ YIZIAWUCAQVCMRAEDnB0Zi1rZGMtODEyMzc0
+             self.assertNotEqual('0x', attr['attrValues'][0].prettyPrint()[:2])
+ 
+             if attr['attrType'] == rfc6032.id_aa_KP_contentDecryptKeyID:
+-                self.assertEqual(str2octs(
+-                    'ptf-kdc-812374'), attr['attrValues'][0])
++                self.assertEqual(
++                    b'ptf-kdc-812374', attr['attrValues'][0])
+ 
+ 
+ suite = unittest.TestLoader().loadTestsFromModule(sys.modules[__name__])
+diff --git a/tests/test_rfc6120.py b/tests/test_rfc6120.py
+index bdedab8..a621745 100644
+--- a/tests/test_rfc6120.py
++++ b/tests/test_rfc6120.py
+@@ -10,7 +10,6 @@ import unittest
+ 
+ from pyasn1.codec.der.decoder import decode as der_decoder
+ from pyasn1.codec.der.encoder import encode as der_encoder
+-from pyasn1.compat.octets import str2octs
+ 
+ from pyasn1_modules import pem
+ from pyasn1_modules import rfc5280
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
index e8c0f960aa..03097801b8 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
@@ -6,6 +6,7 @@ HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=190f79253908c986e6cacf380c3a5f6d"
 
+SRC_URI += "file://0001-Stop-using-pyasn1.compat.octets.patch"
 SRC_URI[sha256sum] = "c28e2dbf9c06ad61c71a075c7e0f9fd0f1b0bb2d2ad4377f240d33ac2ab60a7c"
 
 PYPI_PACKAGE = "pyasn1_modules"

