Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87471C433FE
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 02:38:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.38747.1669343932906204850
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Nov 2022 18:38:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=N40NRCMk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8328dbcb4c=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AP2WtvO004100
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 02:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=8BmYct1Bgm2cO2wCIPvcTtXxNT93bgBjQ/V+VBA5gYk=;
 b=N40NRCMkUqkf8w90pUjujm5zZzNw2JvtvZG540BuMWQdCF1BnFUuERo5RCa1NPmzxCYl
 xq2O+85FvTuz1ZQu8Vyfuz/Y8B+TXZItstbhyFsvGnk7MhKV94HNbIgqZmaBFbEAdfCp
 MWh0vx5XRGY0KQwePm83Eo3VpcT//XUVn6iOHxFrHLNUE2rj1X8Q07UCt3eCJHUEQvEl
 NA+f7iwmKHlEvgjOBP2C+YdJL/YqDW3LmaEMh+ix07yAPwnriw4/5dGNaE80Zb+SyX0J
 2SJWkBWOImWckbJbXiohG8E2eiS8erHEW3PzuLmciFvXuUv5T22Dl6omoNk8OFjY6eP/ Qg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxnxj4nu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 02:38:51 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Nov 2022 18:38:50 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 24 Nov 2022 18:38:49 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-m2crypto: fix CVE-2020-25657 and buildpaths qa issue
Date: Fri, 25 Nov 2022 10:38:44 +0800
Message-ID: <20221125023844.40757-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: mZDBoNpmmX0htIP5WrVVbrX-9aVRSMbL
X-Proofpoint-ORIG-GUID: mZDBoNpmmX0htIP5WrVVbrX-9aVRSMbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_14,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 02:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99723

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2020-25657 for python3-m2crypto. Adjust indent
as well.

Remove duplicate 'Upstream-Status:' from avoid-host-contamination.patch.

Add swig option '-DOPENSSL_FILE' to fix buildpaths qa issues.

  WARNING: python3-m2crypto-0.38.0-r0 do_package_qa: QA Issue: File
  /usr/lib/python3.11/site-packages/M2Crypto/_m2crypto.cpython-311-x86_64-linux-gnu.so
  in package python3-m2crypto contains reference to TMPDIR [buildpaths]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../python3-m2crypto/CVE-2020-25657.patch     | 176 ++++++++++++++++++
 .../avoid-host-contamination.patch            |   2 +-
 .../python/python3-m2crypto_0.38.0.bb         |  11 +-
 3 files changed, 183 insertions(+), 6 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch b/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch
new file mode 100644
index 000000000..38ecd7a27
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch
@@ -0,0 +1,176 @@
+Backport patch to fix CVE-2020-25657.
+
+Upstream-Status: Backport [https://gitlab.com/m2crypto/m2crypto/-/commit/84c53958]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 84c53958def0f510e92119fca14d74f94215827a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mat=C4=9Bj=20Cepl?= <mcepl@cepl.eu>
+Date: Tue, 28 Jun 2022 21:17:01 +0200
+Subject: [PATCH] Mitigate the Bleichenbacher timing attacks in the RSA
+ decryption API (CVE-2020-25657)
+
+Fixes #282
+---
+ src/SWIG/_m2crypto_wrap.c | 20 ++++++++++++--------
+ src/SWIG/_rsa.i           | 20 ++++++++++++--------
+ tests/test_rsa.py         | 15 +++++++--------
+ 3 files changed, 31 insertions(+), 24 deletions(-)
+
+diff --git a/src/SWIG/_m2crypto_wrap.c b/src/SWIG/_m2crypto_wrap.c
+index aba9eb6d..a9f30da9 100644
+--- a/src/SWIG/_m2crypto_wrap.c
++++ b/src/SWIG/_m2crypto_wrap.c
+@@ -7040,9 +7040,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject *from, int padding) {
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
+@@ -7070,9 +7071,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *from, int padding) {
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
+@@ -7097,9 +7099,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *from, int padding) {
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
+@@ -7124,9 +7127,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject *from, int padding) {
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
+index bc714e01..1377b8be 100644
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
+index 7bb3af75..5e75d681 100644
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
+GitLab
+
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/avoid-host-contamination.patch b/meta-python/recipes-devtools/python/python3-m2crypto/avoid-host-contamination.patch
index 9d9b8449b..3cd6f7c27 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto/avoid-host-contamination.patch
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/avoid-host-contamination.patch
@@ -1,6 +1,6 @@
 Filter out '/usr/include' for swig to avoid host contamination issue.
 
-Upstream-Status: Upstream-Status: Inappropriate [cross compile specific]
+Upstream-Status: Inappropriate [cross compile specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
index 51a0dd676..40e3bfb31 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 FILESEXTRAPATHS:prepend := "${THISDIR}/python-m2crypto:"
 
 SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
-           file://cross-compile-platform.patch \
-           file://avoid-host-contamination.patch \
-           file://0001-setup.py-address-openssl-3.x-build-issue.patch \
-           "
+            file://cross-compile-platform.patch \
+            file://avoid-host-contamination.patch \
+            file://0001-setup.py-address-openssl-3.x-build-issue.patch \
+            file://CVE-2020-25657.patch \
+            "
 SRC_URI[sha256sum] = "99f2260a30901c949a8dc6d5f82cd5312ffb8abc92e76633baf231bbbcb2decb"
 
 PYPI_PACKAGE = "M2Crypto"
@@ -34,7 +35,7 @@ DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR}"
 SWIG_FEATURES:x86 = "-D__i386__"
 SWIG_FEATURES:x32 = "-D__ILP32__"
 
-SWIG_FEATURES ?= "-D__${HOST_ARCH}__ ${@['-D__ILP32__','-D__LP64__'][d.getVar('SITEINFO_BITS') != '32']}"
+SWIG_FEATURES ?= "-D__${HOST_ARCH}__ ${@['-D__ILP32__','-D__LP64__'][d.getVar('SITEINFO_BITS') != '32']} -DOPENSSL_FILE='openssl/macros.h'"
 
 SWIG_FEATURES:append:riscv64 = " -D__SIZEOF_POINTER__=${SITEINFO_BITS}/8 -D__riscv_xlen=${SITEINFO_BITS}"
 SWIG_FEATURES:append:riscv32 = " -D__SIZEOF_POINTER__=${SITEINFO_BITS}/8 -D__riscv_xlen=${SITEINFO_BITS}"
-- 
2.17.1


