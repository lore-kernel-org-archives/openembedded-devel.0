Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web12.5730.1625450163466174219
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jul 2021 18:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=D1bdmUrZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625450161; i=@fujitsu.com;
	bh=Nrp8qJAj7cFjOCPoF/i/0e/9NqvXe6z5DCf06UlnqZQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=D1bdmUrZwPzBzUxq27exIWHpDB1NVAbT8SR5ozo0XDI+nCU+NjVRLlJeyhUnjzCdJ
	 2RVbjNNJm2E9wFu6x9Py1oMK5vXMUIjySm+6fSat8G0BmCSp3ri2+n3KbHl42rAb+U
	 oTOKkJWbuIVpn130xrzCSoVwGaM8oCRm8RhRvdvb320qQIyJ2Q2UPE3qUKgmv4lhw0
	 JiTv+zUQFd2ABCKcw06Wcy/yzbeEckJTus6tj6vN1LapdW2s9/X6Rxsya7Qthzmp8s
	 6R+E2RW0NDdKJw4KgcJnxWYPr7ry5bZ5L5bmM9QvzSZSx2wc5wzs0DZX9b62l8GkbD
	 KlYZJt77qSA+w==
Received: from [100.112.198.210] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 6C/60-07373-0B662E06; Mon, 05 Jul 2021 01:56:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRWlGSWpSXmKPExsViZ8MRqrs+7VG
  CwbIvNhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aS9qUsBVdsKl7st21gvGvcxcjFISQwi0ni
  xp+f7BDOcUaJYxcXsHQxcnKwCehIdLzoBrNFBPQlls7ewwxiCwv4SfxfsZIVxGYRUJG4e+keW
  JxXwEPi7evJYLaEgILElIfvoeKCEidnPgGbwywgIXHwxQuoGkWJ7TvPsEDYFRIzZmxjm8DIMw
  tJyywkLQsYmVYxWiQVZaZnlOQmZuboGhoY6BoaGukaWlroGhma6iVW6SbppZbqlqcWl+ga6iW
  WF+sVV+Ym56To5aWWbGIEhlFKwbHrOxivvv6gd4hRkoNJSZR3k+ajBCG+pPyUyozE4oz4otKc
  1OJDjDIcHEoSvFXJQDnBotT01Iq0zBxgSMOkJTh4lER4k+OA0rzFBYm5xZnpEKlTjMYcl6/PW
  8TMserA9FXMQix5+XmpUuK8LKlApQIgpRmleXCDYLF2iVFWSpiXkYGBQYinILUoN7MEVf4Voz
  gHo5Iw712QKTyZeSVw+14BncIEdMrNcw9BTilJREhJNTBp9avVTz+01yw/61Fz5VftG3p7H5z
  jO6D+6OLiswqPY05EzwycIGM0VevIEWPFj4uilrmxaXbHz9uXM33l3iDrsliuIA7FQ9vUz0jv
  firzns36d4xyRNzls+YFosfbvA7cNFipr/HjhxBf73clhd2KCX+nrgxQODRVxOfRwohdyq1mf
  f/PWuyafeRTyKP0Tfdnaeo+inoed2Dr7RPBDekP3qptfBd5b/Lsv2GXHPe7vl9zIzC0ovuwXs
  mq52s8Mwp47//eF2my3aDLqm3B8x8+RXF5rdZPPGous1w+lWD7/mX5vvUVwX3T3ydNnLnwcmL
  RJLaqIvVft3VyoidI/NhuYefav/rwsuuMomwv1z+QUmIpzkg01GIuKk4EAJv5lEIwAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-291.messagelabs.com!1625450159!293186!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9234 invoked from network); 5 Jul 2021 01:55:59 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-11.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Jul 2021 01:55:59 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1651txg1006941
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jul 2021 02:55:59 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 5 Jul 2021 02:55:58 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-m2crypto: upgrade 0.37.1 -> 0.38.0
Date: Mon, 5 Jul 2021 09:55:53 +0800
Message-ID: <1625450153-114955-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0.38.0 - 2021-06-14
-------------------

- Remove the last use of setup.py test idiom.
- Use m2_PyObject_AsReadBuffer instead of PyObject_AsReadBuffer.
- Add support for arm64 big endian <Steev Klimaszewski>
- Make support of RSA_SSLV23_PADDING optional (it has been deprecated).
- Move project to src/ layout
- Allow verify_cb_* to be called with ok=True  <Casey Deccio>
- Be prepared if any of constants in x509_vfy.h is not available.
- But we do support 3.8
- We DO NOT support Python 2.6.

Refresh the following patch:
cross-compile-platform.patch

0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
Removed since these are included in 0.38.0

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...verify_cb_-to-be-called-with-ok-True.patch | 47 -------------------
 ...A_SSLV23_PADDING-has-been-deprecated.patch | 29 ------------
 .../cross-compile-platform.patch              |  4 +-
 ...o_0.37.1.bb => python3-m2crypto_0.38.0.bb} |  4 +-
 4 files changed, 4 insertions(+), 80 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
 rename meta-python/recipes-devtools/python/{python3-m2crypto_0.37.1.bb => python3-m2crypto_0.38.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
deleted file mode 100644
index 3c836635a1..0000000000
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 73fbd1e646f6bbf202d4418bae80eb9941fbf552 Mon Sep 17 00:00:00 2001
-From: Casey Deccio <casey@deccio.net>
-Date: Fri, 8 Jan 2021 12:43:09 -0700
-Subject: [PATCH] Allow verify_cb_* to be called with ok=True
-
-With https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
-OpenSSL allowed verificaton to continue on UNABLE_TO_VERIFY_LEAF_SIGNATURE
----
- tests/test_ssl.py | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/tests/test_ssl.py b/tests/test_ssl.py
-index 92b6942..7a3271a 100644
---- a/tests/test_ssl.py
-+++ b/tests/test_ssl.py
-@@ -59,8 +59,13 @@ def allocate_srv_port():
- 
- 
- def verify_cb_new_function(ok, store):
--    assert not ok
-     err = store.get_error()
-+    # If err is X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE, then instead of
-+    # aborting, this callback is called to retrieve additional error
-+    # information.  In this case, ok might not be False.
-+    # See https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
-+    if err != m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:
-+        assert not ok
-     assert err in [m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT,
-                    m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY,
-                    m2.X509_V_ERR_CERT_UNTRUSTED,
-@@ -618,7 +623,12 @@ class MiscSSLClientTestCase(BaseSSLClientTestCase):
- 
-     def verify_cb_old(self, ctx_ptr, x509_ptr, err, depth, ok):
-         try:
--            self.assertFalse(ok)
-+            # If err is X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE, then instead of
-+            # aborting, this callback is called to retrieve additional error
-+            # information.  In this case, ok might not be False.
-+            # See https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
-+            if err != m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:
-+                self.assertFalse(ok)
-             self.assertIn(err,
-                           [m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT,
-                            m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY,
--- 
-2.29.2
-
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
deleted file mode 100644
index 2313a324a0..0000000000
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From d06eaa88a5f491827733f32027c46de3557fbd05 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Mat=C4=9Bj=20Cepl?= <mcepl@cepl.eu>
-Date: Fri, 19 Feb 2021 15:53:02 +0100
-Subject: [PATCH] Use of RSA_SSLV23_PADDING has been deprecated.
-
-Fixes #293.
----
- tests/test_rsa.py | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/tests/test_rsa.py b/tests/test_rsa.py
-index 3de5016..7299785 100644
---- a/tests/test_rsa.py
-+++ b/tests/test_rsa.py
-@@ -124,11 +124,6 @@ class RSATestCase(unittest.TestCase):
-             ptxt = priv.private_decrypt(ctxt, p)
-             self.assertEqual(ptxt, self.data)
- 
--        # sslv23_padding
--        ctxt = priv.public_encrypt(self.data, RSA.sslv23_padding)
--        res = priv.private_decrypt(ctxt, RSA.sslv23_padding)
--        self.assertEqual(res, self.data)
--
-         # no_padding
-         with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
-             priv.public_encrypt(self.data, RSA.no_padding)
--- 
-2.29.2
-
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch b/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
index f039ae8665..77ef7e557e 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
@@ -6,7 +6,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/setup.py
 +++ b/setup.py
-@@ -169,22 +169,6 @@ class _M2CryptoBuildExt(build_ext.build_
+@@ -169,24 +169,6 @@ class _M2CryptoBuildExt(build_ext.build_
              log.debug('self.include_dirs = %s', self.include_dirs)
              log.debug('self.library_dirs = %s', self.library_dirs)
  
@@ -25,6 +25,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -            self.swig_opts.append('-D%s' % arch)
 -            if mach in ('ppc64le', 'ppc64el'):
 -                self.swig_opts.append('-D_CALL_ELF=2')
+-            if mach in ('arm64_be'):
+-                self.swig_opts.append('-D__AARCH64EB__')
 -
          self.swig_opts.extend(['-I%s' % i for i in self.include_dirs])
  
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
rename to meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
index b3da87fb7e..950de564f2 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
@@ -8,11 +8,9 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/python-m2crypto:"
 
 SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
             file://cross-compile-platform.patch \
-            file://0001-Allow-verify_cb_-to-be-called-with-ok-True.patch \
-            file://0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch \
             file://avoid-host-contamination.patch \
            "
-SRC_URI[sha256sum] = "e4e42f068b78ccbf113e5d0a72ae5f480f6c3ace4940b91e4fff5598cfff6fb3"
+SRC_URI[sha256sum] = "99f2260a30901c949a8dc6d5f82cd5312ffb8abc92e76633baf231bbbcb2decb"
 
 PYPI_PACKAGE = "M2Crypto"
 inherit pypi siteinfo setuptools3
-- 
2.25.1

