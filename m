Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.11077.1619895978687844292
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 May 2021 12:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QzKKW1BE;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id d29so73878pgd.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 May 2021 12:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WxLGfsdIsMFlCHt1FNH8S2KRLl8WPJbvoOy96tIggcM=;
        b=QzKKW1BEhzEMJeAEUt7nJCGNuZsOJGr1eZd+qE+mTHxXASzk55kAYxXrCjAiEOGjwG
         5/SV76Foee+T8vCRYmVv2cZyNpTm2JSmUZUw0/0kXo26c12wS1lUHUt/Fw+IOQVP9klo
         3NJp0lxr2YDlBE4NXkgtjs0fwGAHvUmOltRBaI9Mss2y0D8qsD9r98kkr+uGgjqF+Qwj
         tP41eaE40zxFvgKvooK4wTZyQcI6PCxy/9qY5tu4W5kEJ/JzeBAZNkGoKQWspVdkr6KT
         JWJtMBcVvWwwP+ZFCjlA3M6h6gQMTuLpbBUzQD6uKcR9P585Qa6fqOtXt4OyXX0EdB7n
         nNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WxLGfsdIsMFlCHt1FNH8S2KRLl8WPJbvoOy96tIggcM=;
        b=IRwa6GLiSk+IB4miNKX1pIHkbtsgrxSu0fuw1Tsjjni5IPq1BK5Mbt4XlOrWWB9CNY
         ZNDD4SXQzWlEyPFIoX864cdxdnZFRpcUCKqfGTEBPjujQWE//J/8znANkFrlXLTFO7V+
         2BGQ5ndbWk20xVSKgUenlOscfj4EB3p/HyJz1mnvy7ffMc/xRqzY+Emhr0TSyroJsjKs
         iE7hZcz4/Xk0NJD1X8hO8LQqvoO9WN1XMRSA69Z9XnORqdgitcOtxXF3kqBeHpOpBUJX
         hnfk2tvCTics5EC5IarDLGo6cLoHwYRWEcqZRl23dfTeuf2GX9fZvx7fkvDmxlOAWR3o
         HKHQ==
X-Gm-Message-State: AOAM532CYOLBYFkZmhh97r0BoNdHUEv0Q3GWsjQ9nAXwr/Sv1O0KVER+
	98a2GlzK00ox71L3ph4MRmpvigaRx5btHA==
X-Google-Smtp-Source: ABdhPJzo+Zzcjqp/tXgkRYLW4eawHK7xUQRLpTXpf1QPrAZVUwtzSc6eRtIHeZlxjqsuKjIH4WCedw==
X-Received: by 2002:aa7:93b1:0:b029:27f:6a80:6b73 with SMTP id x17-20020aa793b10000b029027f6a806b73mr10759627pff.56.1619895977606;
        Sat, 01 May 2021 12:06:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id e20sm13500687pjt.8.2021.05.01.12.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 12:06:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-m2crypto: Upgrade to 0.37.1
Date: Sat,  1 May 2021 12:06:15 -0700
Message-Id: <20210501190615.545087-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unifiy .inc into .bb
Add patches to fix issues with openssl 1.1.x
Remove m2crypto-0.26.4-gcc_macros patch, its no longer needed
Refresh existing patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../m2crypto-0.26.4-gcc_macros.patch          | 35 --------------
 ...verify_cb_-to-be-called-with-ok-True.patch | 47 +++++++++++++++++++
 ...A_SSLV23_PADDING-has-been-deprecated.patch | 29 ++++++++++++
 ...k-in-sysroot-not-in-host-directories.patch | 12 ++---
 .../cross-compile-platform.patch              |  8 ++--
 .../python/python3-m2crypto_0.30.1.bb         |  2 -
 ...2crypto.inc => python3-m2crypto_0.37.1.bb} |  8 ++--
 7 files changed, 88 insertions(+), 53 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
 rename meta-python/recipes-devtools/python/{python-m2crypto => python3-m2crypto}/0001-setup.py-link-in-sysroot-not-in-host-directories.patch (75%)
 rename meta-python/recipes-devtools/python/{python-m2crypto => python3-m2crypto}/cross-compile-platform.patch (84%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb
 rename meta-python/recipes-devtools/python/{python-m2crypto.inc => python3-m2crypto_0.37.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch b/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
deleted file mode 100644
index 7f6dd29f8a..0000000000
--- a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Imported from Fedora
-
-Index: M2Crypto-0.30.1/SWIG/_m2crypto.i
-===================================================================
---- M2Crypto-0.30.1.orig/SWIG/_m2crypto.i
-+++ M2Crypto-0.30.1/SWIG/_m2crypto.i
-@@ -8,6 +8,11 @@
-  *
-  */
- 
-+%import "gcc_macros.h"
-+
-+%ignore WCHAR_MAX;
-+%ignore WCHAR_MIN;
-+
- %module(threads=1) m2crypto
- /* We really don't need threadblock (PyGILState_Ensure() etc.) anywhere.
-    Disable threadallow as well, only enable it for operations likely to
-@@ -15,11 +20,6 @@
- %nothreadblock;
- %nothreadallow;
- 
--#if SWIG_VERSION >= 0x030000
--#define __WCHAR_MAX__ __WCHAR_MAX
--#define __WCHAR_MIN__ __WCHAR_MIN
--#endif
--
- %{
- #ifdef _WIN32
- #define _WINSOCKAPI_
-@@ -95,4 +95,3 @@ static PyObject *x509_store_verify_cb_fu
- %constant int encrypt = 1;
- %constant int decrypt = 0;
- #endif
--  
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
new file mode 100644
index 0000000000..3c836635a1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
@@ -0,0 +1,47 @@
+From 73fbd1e646f6bbf202d4418bae80eb9941fbf552 Mon Sep 17 00:00:00 2001
+From: Casey Deccio <casey@deccio.net>
+Date: Fri, 8 Jan 2021 12:43:09 -0700
+Subject: [PATCH] Allow verify_cb_* to be called with ok=True
+
+With https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
+OpenSSL allowed verificaton to continue on UNABLE_TO_VERIFY_LEAF_SIGNATURE
+---
+ tests/test_ssl.py | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/tests/test_ssl.py b/tests/test_ssl.py
+index 92b6942..7a3271a 100644
+--- a/tests/test_ssl.py
++++ b/tests/test_ssl.py
+@@ -59,8 +59,13 @@ def allocate_srv_port():
+ 
+ 
+ def verify_cb_new_function(ok, store):
+-    assert not ok
+     err = store.get_error()
++    # If err is X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE, then instead of
++    # aborting, this callback is called to retrieve additional error
++    # information.  In this case, ok might not be False.
++    # See https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
++    if err != m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:
++        assert not ok
+     assert err in [m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT,
+                    m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY,
+                    m2.X509_V_ERR_CERT_UNTRUSTED,
+@@ -618,7 +623,12 @@ class MiscSSLClientTestCase(BaseSSLClientTestCase):
+ 
+     def verify_cb_old(self, ctx_ptr, x509_ptr, err, depth, ok):
+         try:
+-            self.assertFalse(ok)
++            # If err is X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE, then instead of
++            # aborting, this callback is called to retrieve additional error
++            # information.  In this case, ok might not be False.
++            # See https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
++            if err != m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:
++                self.assertFalse(ok)
+             self.assertIn(err,
+                           [m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT,
+                            m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY,
+-- 
+2.29.2
+
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
new file mode 100644
index 0000000000..2313a324a0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
@@ -0,0 +1,29 @@
+From d06eaa88a5f491827733f32027c46de3557fbd05 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mat=C4=9Bj=20Cepl?= <mcepl@cepl.eu>
+Date: Fri, 19 Feb 2021 15:53:02 +0100
+Subject: [PATCH] Use of RSA_SSLV23_PADDING has been deprecated.
+
+Fixes #293.
+---
+ tests/test_rsa.py | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/tests/test_rsa.py b/tests/test_rsa.py
+index 3de5016..7299785 100644
+--- a/tests/test_rsa.py
++++ b/tests/test_rsa.py
+@@ -124,11 +124,6 @@ class RSATestCase(unittest.TestCase):
+             ptxt = priv.private_decrypt(ctxt, p)
+             self.assertEqual(ptxt, self.data)
+ 
+-        # sslv23_padding
+-        ctxt = priv.public_encrypt(self.data, RSA.sslv23_padding)
+-        res = priv.private_decrypt(ctxt, RSA.sslv23_padding)
+-        self.assertEqual(res, self.data)
+-
+         # no_padding
+         with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
+             priv.public_encrypt(self.data, RSA.no_padding)
+-- 
+2.29.2
+
diff --git a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
similarity index 75%
rename from meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
rename to meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
index b339d93f75..f4c74384f9 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
@@ -10,19 +10,17 @@ Upstream-status: Unknown
  setup.py | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
-Index: M2Crypto-0.30.1/setup.py
-===================================================================
---- M2Crypto-0.30.1.orig/setup.py
-+++ M2Crypto-0.30.1/setup.py
-@@ -130,6 +130,7 @@ class _M2CryptoBuildExt(build_ext.build_
+--- a/setup.py
++++ b/setup.py
+@@ -135,6 +135,7 @@ class _M2CryptoBuildExt(build_ext.build_
          self.set_undefined_options('build', ('bundledlls', 'bundledlls'))
  
          self.libraries = ['ssl', 'crypto']
 +        self.openssl = os.environ.get( "STAGING_DIR" )
          if sys.platform == 'win32':
              self.libraries = ['ssleay32', 'libeay32']
-             if self.openssl and openssl_version(self.openssl, 0x10100000, True):
-@@ -150,8 +151,8 @@ class _M2CryptoBuildExt(build_ext.build_
+             if self.openssl and openssl_version(self.openssl,
+@@ -159,8 +160,8 @@ class _M2CryptoBuildExt(build_ext.build_
  
          if self.openssl is not None:
              log.debug('self.openssl = %s', self.openssl)
diff --git a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch b/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
similarity index 84%
rename from meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
rename to meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
index 4b64f4613c..f039ae8665 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
@@ -4,11 +4,9 @@ since it pokes at the system for getting architecture values
 Upstream-Status: Inappropriate
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: M2Crypto-0.30.1/setup.py
-===================================================================
---- M2Crypto-0.30.1.orig/setup.py
-+++ M2Crypto-0.30.1/setup.py
-@@ -160,22 +160,6 @@ class _M2CryptoBuildExt(build_ext.build_
+--- a/setup.py
++++ b/setup.py
+@@ -169,22 +169,6 @@ class _M2CryptoBuildExt(build_ext.build_
              log.debug('self.include_dirs = %s', self.include_dirs)
              log.debug('self.library_dirs = %s', self.library_dirs)
  
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb
deleted file mode 100644
index 4d63d4bd3a..0000000000
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-m2crypto.inc
diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python-m2crypto.inc
rename to meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
index 797a0354bf..896d9d2cc4 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto.inc
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
@@ -8,13 +8,13 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/python-m2crypto:"
 
 SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
             file://cross-compile-platform.patch \
-            file://m2crypto-0.26.4-gcc_macros.patch \
+            file://0001-Allow-verify_cb_-to-be-called-with-ok-True.patch \
+            file://0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch \
            "
-SRC_URI[md5sum] = "7fce3cbf85eb84a669682892b935746b"
-SRC_URI[sha256sum] = "a1b2751cdadc6afac3df8a5799676b7b7c67a6ad144bb62d38563062e7cd3fc6"
+SRC_URI[sha256sum] = "e4e42f068b78ccbf113e5d0a72ae5f480f6c3ace4940b91e4fff5598cfff6fb3"
 
 PYPI_PACKAGE = "M2Crypto"
-inherit pypi siteinfo
+inherit pypi siteinfo setuptools3
 
 DEPENDS += "openssl swig-native"
 RDEPENDS_${PN} += "\
-- 
2.31.1

