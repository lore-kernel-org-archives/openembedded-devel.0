Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428B9C77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 17:53:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1302.1685642001550502851
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 10:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TF3mYWFt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55167b1693=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351BJPnV002678
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Jun 2023 17:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=MF49OgvT5f3lcJV7vrgV+C6qOPPjFjoHmX2GykLwG/M=;
 b=TF3mYWFtRoBrEWRCWgLEFnceT/sO+1lr8TaGASvkxB4Oa3HVtWueHOQSZs85+BdmKf2O
 EFk8+DPzacprdn3nGcQCmBQfd5HqEYXiE4ocD+hxkbwhrJ4akGFJq0EQZsAgxj6MqTDE
 Tz324vx7P3acOvYKwCJD/QVV86ydiPnUJpp/oQ3z3Uea84EDqbRhhevNjznz8Cy96m53
 4yS+JqFUnMfy29YlWgFHPI3JljhyKtlq5wyLYB7O4b/at0pe4Whb2n3cEvUMruYFrKPn
 8kt/yNJnkNtFAV9oxg4wSsxBzFoO98F2h4yfQKH2guQUfltzyuqkHb0c5W06kZL+pqF2 hg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qu8u8n5c7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 17:53:20 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 10:53:17 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [meta-python][kirkstone][PATCH 1/1] python3-m2crypto: fix for CVE-2020-25657
Date: Thu, 1 Jun 2023 17:52:55 +0000
Message-ID: <20230601175255.2250510-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: f1e0wOnR01tSGs8URIBNiLwnaHsKFCIt
X-Proofpoint-GUID: f1e0wOnR01tSGs8URIBNiLwnaHsKFCIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010154
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 17:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103083

From: Narpat Mali <narpat.mali@windriver.com>

A flaw was found in all released versions of m2crypto, where they are
vulnerable to Bleichenbacher timing attacks in the RSA decryption API
via the timed processing of valid PKCS#1 v1.5 Ciphertext. The highest
threat from this vulnerability is to confidentiality.

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python3-m2crypto/CVE-2020-25657.patch     | 175 ++++++++++++++++++
 .../python/python3-m2crypto_0.38.0.bb         |   1 +
 2 files changed, 176 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch b/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch
new file mode 100644
index 0000000000..cc915f1478
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch
@@ -0,0 +1,175 @@
+From 2fa92e048b76fcc7bf2d4f4443478c8292d17470 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mat=C4=9Bj=20Cepl?= <mcepl@cepl.eu>
+Date: Thu, 1 Jun 2023 14:56:34 +0000
+Subject: [PATCH] Mitigate the Bleichenbacher timing attacks in the RSA
+ decryption API (CVE-2020-25657)
+
+Fixes #282
+
+CVE: CVE-2020-25657
+
+Upstream-Status: Backport [https://gitlab.com/m2crypto/m2crypto/-/commit/84c53958def0f510e92119fca14d74f94215827a]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ src/SWIG/_m2crypto_wrap.c | 20 ++++++++++++--------
+ src/SWIG/_rsa.i           | 20 ++++++++++++--------
+ tests/test_rsa.py         | 15 +++++++--------
+ 3 files changed, 31 insertions(+), 24 deletions(-)
+
+diff --git a/src/SWIG/_m2crypto_wrap.c b/src/SWIG/_m2crypto_wrap.c
+index 3db88b9..6aafe1f 100644
+--- a/src/SWIG/_m2crypto_wrap.c
++++ b/src/SWIG/_m2crypto_wrap.c
+@@ -7129,9 +7129,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_private_encrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+@@ -7159,9 +7160,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_public_decrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+@@ -7186,9 +7188,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_public_encrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+@@ -7213,9 +7216,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_private_decrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+
+diff --git a/src/SWIG/_rsa.i b/src/SWIG/_rsa.i
+index bc714e0..1377b8b 100644
+--- a/src/SWIG/_rsa.i
++++ b/src/SWIG/_rsa.i
+@@ -239,9 +239,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_private_encrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+@@ -269,9 +270,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_public_decrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+@@ -296,9 +298,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_public_encrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+@@ -323,9 +326,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject *from, int padding) {
+     tlen = RSA_private_decrypt(flen, (unsigned char *)fbuf,
+         (unsigned char *)tbuf, rsa, padding);
+     if (tlen == -1) {
+-        m2_PyErr_Msg(_rsa_err);
++        ERR_clear_error();
++        PyErr_Clear();
+         PyMem_Free(tbuf);
+-        return NULL;
++        Py_RETURN_NONE;
+     }
+     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
+
+diff --git a/tests/test_rsa.py b/tests/test_rsa.py
+index 7bb3af7..5e75d68 100644
+--- a/tests/test_rsa.py
++++ b/tests/test_rsa.py
+@@ -109,8 +109,9 @@ class RSATestCase(unittest.TestCase):
+         # The other paddings.
+         for padding in self.s_padding_nok:
+             p = getattr(RSA, padding)
+-            with self.assertRaises(RSA.RSAError):
+-                priv.private_encrypt(self.data, p)
++            # Exception disabled as a part of mitigation against CVE-2020-25657
++            # with self.assertRaises(RSA.RSAError):
++            priv.private_encrypt(self.data, p)
+         # Type-check the data to be encrypted.
+         with self.assertRaises(TypeError):
+             priv.private_encrypt(self.gen_callback, RSA.pkcs1_padding)
+@@ -127,10 +128,12 @@ class RSATestCase(unittest.TestCase):
+             self.assertEqual(ptxt, self.data)
+
+         # no_padding
+-        with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
+-            priv.public_encrypt(self.data, RSA.no_padding)
++        # Exception disabled as a part of mitigation against CVE-2020-25657
++        # with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
++        priv.public_encrypt(self.data, RSA.no_padding)
+
+         # Type-check the data to be encrypted.
++        # Exception disabled as a part of mitigation against CVE-2020-25657
+         with self.assertRaises(TypeError):
+             priv.public_encrypt(self.gen_callback, RSA.pkcs1_padding)
+
+@@ -146,10 +149,6 @@ class RSATestCase(unittest.TestCase):
+                          b'\000\000\000\003\001\000\001')  # aka 65537 aka 0xf4
+         with self.assertRaises(RSA.RSAError):
+             setattr(rsa, 'e', '\000\000\000\003\001\000\001')
+-        with self.assertRaises(RSA.RSAError):
+-            rsa.private_encrypt(1)
+-        with self.assertRaises(RSA.RSAError):
+-            rsa.private_decrypt(1)
+         assert rsa.check_key()
+
+     def test_loadpub_bad(self):
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
index 51a0dd676e..155a9066ca 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
            file://cross-compile-platform.patch \
            file://avoid-host-contamination.patch \
            file://0001-setup.py-address-openssl-3.x-build-issue.patch \
+           file://CVE-2020-25657.patch \
            "
 SRC_URI[sha256sum] = "99f2260a30901c949a8dc6d5f82cd5312ffb8abc92e76633baf231bbbcb2decb"
 
-- 
2.40.0


