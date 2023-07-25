Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC067C00528
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 19:09:55 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.28962.1690312191990696181
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 12:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=f786Y7y3;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-76ae0784e0bso11413285a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 12:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690312191; x=1690916991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmPTglJyM6bQ/4y4SbWw9dJsKHFcOtEOqOKypFp32e4=;
        b=f786Y7y32O75+g6i5LqomU8qO5Z8Ph+vfphz82E6DKbHkMN5t6xSu/PWUlKsTOzJqt
         vUu5PFMpchQuJZcI9+YNPyAiGeCIm0zVICPyYdUSuLMWQPws3Ak7c1vzOe8o3m10FRKy
         H7CZyEB3+aJDygu0eaa9qFF7AW9ID2avmyA87BAWyPB5/4XGH3l3GKVdH3cKjcP/FK1s
         hBWb2MkzxWXlZ3gF2HxrZzMabzkNkAWaF9uUYvVB1JmGwKX9f1DI4ShPwKPlwD5WL0Z0
         ZRY5ZPMxDykOlzPlGvx2UbW0EiZpTtefXU+eaVd9wPHiTCoroyyxYkRjoXeyXQDhq/H+
         p/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690312191; x=1690916991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmPTglJyM6bQ/4y4SbWw9dJsKHFcOtEOqOKypFp32e4=;
        b=G4HFuRRfSlUXkGRVGKL4roXugluJVNixclzJo9h6qI0nQzx+Z/T5o/yvhKLiwLpG2X
         jQH8dYGPzmhMvaVu8LbyhRJOC5izqKvXPr/2vs+GKWPyxyL+RnQxpr92CRImuwKq71/8
         iaV8zydz+3nV1BjX6Y4c9ZhsNXzDkDl1SsdfXZq8b6HjS+JWu/GJkMGVNix5iToYXc4N
         XDnrmEajcLnlDs1IsQU8YAdYM+znmYApSvti5Ax9I2+md3aijJcsLQJThjPcObU6HWhb
         W33FMQspWPQhctC8a2vld+fCzXOzw1LTA49M9uExhARtt7LfKxhv5J9j/YhSZTenU7da
         f+yg==
X-Gm-Message-State: ABy/qLY3MRKukixMzpscMo52eZOuvNXKocV/WkEMGb5CMxJ8xK8Igquw
	kVNo0aAIZ1yknPLPPuoTcPZvKtUGBhKNHqyiams=
X-Google-Smtp-Source: APBJJlENLAsK5p+r+DAlQ7+V5/+17fGb30dlVHvtyB9yqlekqrxKaj37e5HBZYNTQMoaw7IY+FQ0nQ==
X-Received: by 2002:a05:620a:f10:b0:765:890b:7586 with SMTP id v16-20020a05620a0f1000b00765890b7586mr3492230qkl.29.1690312190757;
        Tue, 25 Jul 2023 12:09:50 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id z9-20020a0cf249000000b005ef81cc63ccsm4526109qvl.117.2023.07.25.12.09.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 12:09:50 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/7] python3-m2crypto: upgrade 0.38.0 -> 0.39.0
Date: Tue, 25 Jul 2023 15:09:39 -0400
Message-ID: <20230725190947.660933-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725190947.660933-1-tgamblin@baylibre.com>
References: <20230725190947.660933-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 19:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104020

Remove the CVE-2020-25657 patch, as it is fixed in 0.39.0:

[tgamblin@megalith m2crypto]$ git log --oneline --grep="CVE-2020-25657"
84c5395 Mitigate the Bleichenbacher timing attacks in the RSA decryption API (CVE-2020-25657)
[tgamblin@megalith m2crypto]$ git tag --contains 84c53958def0f510e92119fca14d74f94215827a
0.39.0

Changelog (https://gitlab.com/m2crypto/m2crypto/-/blob/master/CHANGES?ref_type=heads):

0.39.0 - 2023-01-31
-------------------

- SUPPORT FOR PYTHON 2 HAS BEEN DEPRECATED AND IT WILL BE
  COMPLETELY REMOVED IN THE NEXT RELEASE.
- Remove dependency on parameterized and use unittest.subTest
  instead.
- Upgrade embedded six.py module to 1.16.0 (really tiny
  inconsequential changes).
- Make tests working on MacOS again (test_bio_membuf: Use fork)
- Use OpenSSL_version_num() instead of unrealiable parsing of .h
  file.
- Mitigate the Bleichenbacher timing attacks in the RSA
  decryption API (CVE-2020-25657)
- Add functionality to extract EC key from public key + Update
  tests
- Worked around compatibility issues with OpenSSL 3.*
- Support for Twisted has been deprecated (they have their own
  SSL support anyway).
- Generate TAP while testing.
- Stop using GitHub for testing.
- Accept a small deviation from time in the testsuite (for
  systems with non-standard HZ kernel parameter).
- Use the default BIO.__del__ rather tha overriding in BIO.File
  (avoid a memleak).
- Resolve "X509_Name.as_der() method from X509.py -> class
  X509_Name caused segmentation fault"

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python3-m2crypto/CVE-2020-25657.patch     | 176 ------------------
 ...o_0.38.0.bb => python3-m2crypto_0.39.0.bb} |   3 +-
 2 files changed, 1 insertion(+), 178 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch
 rename meta-python/recipes-devtools/python/{python3-m2crypto_0.38.0.bb => python3-m2crypto_0.39.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch b/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch
deleted file mode 100644
index 38ecd7a276..0000000000
--- a/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch
+++ /dev/null
@@ -1,176 +0,0 @@
-Backport patch to fix CVE-2020-25657.
-
-Upstream-Status: Backport [https://gitlab.com/m2crypto/m2crypto/-/commit/84c53958]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 84c53958def0f510e92119fca14d74f94215827a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Mat=C4=9Bj=20Cepl?= <mcepl@cepl.eu>
-Date: Tue, 28 Jun 2022 21:17:01 +0200
-Subject: [PATCH] Mitigate the Bleichenbacher timing attacks in the RSA
- decryption API (CVE-2020-25657)
-
-Fixes #282
----
- src/SWIG/_m2crypto_wrap.c | 20 ++++++++++++--------
- src/SWIG/_rsa.i           | 20 ++++++++++++--------
- tests/test_rsa.py         | 15 +++++++--------
- 3 files changed, 31 insertions(+), 24 deletions(-)
-
-diff --git a/src/SWIG/_m2crypto_wrap.c b/src/SWIG/_m2crypto_wrap.c
-index aba9eb6d..a9f30da9 100644
---- a/src/SWIG/_m2crypto_wrap.c
-+++ b/src/SWIG/_m2crypto_wrap.c
-@@ -7040,9 +7040,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_private_encrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -7070,9 +7071,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_public_decrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -7097,9 +7099,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_public_encrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -7124,9 +7127,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_private_decrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
- 
-diff --git a/src/SWIG/_rsa.i b/src/SWIG/_rsa.i
-index bc714e01..1377b8be 100644
---- a/src/SWIG/_rsa.i
-+++ b/src/SWIG/_rsa.i
-@@ -239,9 +239,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_private_encrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -269,9 +270,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_public_decrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -296,9 +298,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_public_encrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
- 
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
-@@ -323,9 +326,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject *from, int padding) {
-     tlen = RSA_private_decrypt(flen, (unsigned char *)fbuf,
-         (unsigned char *)tbuf, rsa, padding);
-     if (tlen == -1) {
--        m2_PyErr_Msg(_rsa_err);
-+        ERR_clear_error();
-+        PyErr_Clear();
-         PyMem_Free(tbuf);
--        return NULL;
-+        Py_RETURN_NONE;
-     }
-     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
- 
-diff --git a/tests/test_rsa.py b/tests/test_rsa.py
-index 7bb3af75..5e75d681 100644
---- a/tests/test_rsa.py
-+++ b/tests/test_rsa.py
-@@ -109,8 +109,9 @@ class RSATestCase(unittest.TestCase):
-         # The other paddings.
-         for padding in self.s_padding_nok:
-             p = getattr(RSA, padding)
--            with self.assertRaises(RSA.RSAError):
--                priv.private_encrypt(self.data, p)
-+            # Exception disabled as a part of mitigation against CVE-2020-25657
-+            # with self.assertRaises(RSA.RSAError):
-+            priv.private_encrypt(self.data, p)
-         # Type-check the data to be encrypted.
-         with self.assertRaises(TypeError):
-             priv.private_encrypt(self.gen_callback, RSA.pkcs1_padding)
-@@ -127,10 +128,12 @@ class RSATestCase(unittest.TestCase):
-             self.assertEqual(ptxt, self.data)
- 
-         # no_padding
--        with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
--            priv.public_encrypt(self.data, RSA.no_padding)
-+        # Exception disabled as a part of mitigation against CVE-2020-25657
-+        # with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
-+        priv.public_encrypt(self.data, RSA.no_padding)
- 
-         # Type-check the data to be encrypted.
-+        # Exception disabled as a part of mitigation against CVE-2020-25657
-         with self.assertRaises(TypeError):
-             priv.public_encrypt(self.gen_callback, RSA.pkcs1_padding)
- 
-@@ -146,10 +149,6 @@ class RSATestCase(unittest.TestCase):
-                          b'\000\000\000\003\001\000\001')  # aka 65537 aka 0xf4
-         with self.assertRaises(RSA.RSAError):
-             setattr(rsa, 'e', '\000\000\000\003\001\000\001')
--        with self.assertRaises(RSA.RSAError):
--            rsa.private_encrypt(1)
--        with self.assertRaises(RSA.RSAError):
--            rsa.private_decrypt(1)
-         assert rsa.check_key()
- 
-     def test_loadpub_bad(self):
--- 
-GitLab
-
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
rename to meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
index 40e3bfb316..3a4a700bf7 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
@@ -10,9 +10,8 @@ SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
             file://cross-compile-platform.patch \
             file://avoid-host-contamination.patch \
             file://0001-setup.py-address-openssl-3.x-build-issue.patch \
-            file://CVE-2020-25657.patch \
             "
-SRC_URI[sha256sum] = "99f2260a30901c949a8dc6d5f82cd5312ffb8abc92e76633baf231bbbcb2decb"
+SRC_URI[sha256sum] = "24c0f471358b8b19ad4c8aa9da12e868030b65c1fdb3279d006df60c9501338a"
 
 PYPI_PACKAGE = "M2Crypto"
 inherit pypi siteinfo setuptools3
-- 
2.41.0


