Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8235E75F23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 10:31:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99076345"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jul 2015 18:35:07 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6UATft1019961
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 18:29:41 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 30 Jul 2015 18:31:32 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Jul 2015 18:31:25 +0800
Message-ID: <1438252285-2036-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20150729145954.GC12478@jama>
References: <20150729145954.GC12478@jama>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-python][PATCH] python-m2crypto: Error fix for swig >= 3.0.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jul 2015 10:31:39 -0000
Content-Type: text/plain

After swig upgrade to 3.0.6, build the recipes which
depends on python-m2crypto will occur errors like this:
"SALT_LEN = m2.PKCS5_SALT_LEN
AttributeError: 'module' object has no attribute 'PKCS5_SALT_LEN'"

Reference
https://github.com/martinpaljak/M2Crypto/issues/60#issuecomment-75735489

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../python-m2crypto/0001-M2Crypto-Error-fix.patch  | 162 +++++++++++++++++++++
 .../python/python-m2crypto_0.21.1.bb               |   3 +-
 2 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python-m2crypto/0001-M2Crypto-Error-fix.patch

diff --git a/meta-python/recipes-devtools/python/python-m2crypto/0001-M2Crypto-Error-fix.patch b/meta-python/recipes-devtools/python/python-m2crypto/0001-M2Crypto-Error-fix.patch
new file mode 100644
index 0000000..2a74b68
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-m2crypto/0001-M2Crypto-Error-fix.patch
@@ -0,0 +1,162 @@
+From 02a24ac541df68033d4efd7e2f8a1b92dc49328d Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Mon, 27 Jul 2015 05:06:20 +0900
+Subject: [PATCH] M2Crypto: Error fix.
+
+After swig upgrade from 3.0.2 to 3.0.6,build the recipes which
+depends on python-m2crypto will occur errors like this:
+SALT_LEN = m2.PKCS5_SALT_LEN
+AttributeError: 'module' object has no attribute 'PKCS5_SALT_LEN'
+since python-m2crypto depends on swig-native
+
+Ref:
+https://github.com/martinpaljak/M2Crypto/issues/60#issuecomment-75735489
+
+This patch is from:
+http://pkgs.fedoraproject.org/cgit/m2crypto.git/tree/m2crypto-0.21.1-swig-3.0.5.patch
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ M2Crypto/__init__.py |  4 ++--
+ M2Crypto/m2.py       |  2 +-
+ SWIG/_lib.i          |  4 ++++
+ SWIG/_pkcs7.i        |  1 +
+ setup.py             | 26 +++++++++++++++++++++++++-
+ 5 files changed, 33 insertions(+), 4 deletions(-)
+
+diff --git a/M2Crypto/__init__.py b/M2Crypto/__init__.py
+index e7acfe7..02f4d28 100644
+--- a/M2Crypto/__init__.py
++++ b/M2Crypto/__init__.py
+@@ -19,7 +19,7 @@ Copyright 2008-2011 Heikki Toivonen. All rights reserved.
+ version_info = (0, 21, 1)
+ version = '.'.join([str(_v) for _v in version_info])
+ 
+-import __m2crypto
++import _m2crypto
+ import m2
+ import ASN1
+ import AuthCookie
+@@ -57,4 +57,4 @@ import util
+ encrypt=1
+ decrypt=0
+ 
+-__m2crypto.lib_init()
++_m2crypto.lib_init()
+diff --git a/M2Crypto/m2.py b/M2Crypto/m2.py
+index e4bb695..822143f 100644
+--- a/M2Crypto/m2.py
++++ b/M2Crypto/m2.py
+@@ -25,7 +25,7 @@ Portions created by Open Source Applications Foundation (OSAF) are
+ Copyright (C) 2004 OSAF. All Rights Reserved.
+ """
+ 
+-from __m2crypto import *
++from _m2crypto import *
+ lib_init()
+ 
+ 
+diff --git a/SWIG/_lib.i b/SWIG/_lib.i
+index 42dc180..47a53b8 100644
+--- a/SWIG/_lib.i
++++ b/SWIG/_lib.i
+@@ -100,6 +100,7 @@ int ssl_verify_callback(int ok, X509_STORE_CTX *ctx) {
+     int cret;
+     int new_style_callback = 0, warning_raised_exception=0;
+     PyGILState_STATE gilstate;
++    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
+ 
+     ssl = (SSL *)X509_STORE_CTX_get_app_data(ctx);
+ 
+@@ -185,6 +186,7 @@ int ssl_verify_callback(int ok, X509_STORE_CTX *ctx) {
+ void ssl_info_callback(const SSL *s, int where, int ret) {
+     PyObject *argv, *retval, *_SSL;
+     PyGILState_STATE gilstate;
++    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
+ 
+     gilstate = PyGILState_Ensure();
+ 
+@@ -204,6 +206,7 @@ DH *ssl_set_tmp_dh_callback(SSL *ssl, int is_export, int keylength) {
+     PyObject *argv, *ret, *_ssl;
+     DH *dh;
+     PyGILState_STATE gilstate;
++    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
+ 
+     gilstate = PyGILState_Ensure();
+ 
+@@ -227,6 +230,7 @@ RSA *ssl_set_tmp_rsa_callback(SSL *ssl, int is_export, int keylength) {
+     PyObject *argv, *ret, *_ssl;
+     RSA *rsa;
+     PyGILState_STATE gilstate;
++    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
+ 
+     gilstate = PyGILState_Ensure();
+ 
+diff --git a/SWIG/_pkcs7.i b/SWIG/_pkcs7.i
+index 174f40a..7bffbfc 100644
+--- a/SWIG/_pkcs7.i
++++ b/SWIG/_pkcs7.i
+@@ -157,6 +157,7 @@ PyObject *smime_read_pkcs7(BIO *bio) {
+     BIO *bcont = NULL;
+     PKCS7 *p7;
+     PyObject *tuple, *_p7, *_BIO;
++    PyObject *self = NULL; /* bug in SWIG_NewPointerObj as of 3.0.5 */
+ 
+     if (BIO_method_type(bio) == BIO_TYPE_MEM) {
+         /* OpenSSL FAQ explains that this is needed for mem BIO to return EOF,
+diff --git a/setup.py b/setup.py
+index e7c49eb..b98abe0 100644
+--- a/setup.py
++++ b/setup.py
+@@ -20,6 +20,7 @@ except ImportError:
+     from distutils.command import build_ext
+ 
+ from distutils.core import Extension
++from distutils.file_util import copy_file
+ 
+ 
+ class _M2CryptoBuildExt(build_ext.build_ext):
+@@ -57,7 +58,17 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+         self.swig_opts.append('-includeall')
+         #self.swig_opts.append('-D__i386__') # Uncomment for early OpenSSL 0.9.7 versions, or on Fedora Core if build fails
+         #self.swig_opts.append('-DOPENSSL_NO_EC') # Try uncommenting if you can't build with EC disabled
+-        
++        self.swig_opts.append('-modern')
++        self.swig_opts.append('-builtin')
++
++        # These two lines are a workaround for
++        # http://bugs.python.org/issue2624 , hard-coding that we are only
++        # building a single extension with a known path; a proper patch to
++        # distutils would be in the run phase, when extension name and path are
++        # known.
++        self.swig_opts.append('-outdir')
++        self.swig_opts.append(os.path.join(self.build_lib, 'M2Crypto'))
++
+         self.include_dirs += [os.path.join(self.openssl, opensslIncludeDir),
+                               os.path.join(os.getcwd(), 'SWIG')]        
+             
+@@ -71,6 +82,19 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+                
+         self.library_dirs += [os.path.join(self.openssl, opensslLibraryDir)]
+ 
++    def run(self):
++        '''Overloaded build_ext implementation to allow inplace=1 to work,
++        which is needed for (python setup.py test).'''
++        # This is another workaround for http://bugs.python.org/issue2624 + the
++        # corresponding lack of support in setuptools' test command. Note that
++        # just using self.inplace in finalize_options() above does not work
++        # because swig is not rerun if the __m2crypto.so extension exists.
++        # Again, hard-coding our extension name and location.
++        build_ext.build_ext.run(self)
++        if self.inplace:
++            copy_file(os.path.join(self.build_lib, 'M2Crypto', '_m2crypto.py'),
++                      os.path.join('M2Crypto', '_m2crypto.py'),
++                      verbose=self.verbose, dry_run=self.dry_run)
+ 
+ if sys.version_info < (2,4):
+ 
+-- 
+1.8.4.2
+
diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
index 67ec921..ff6203f 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
@@ -7,7 +7,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
 SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz \
-           file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch"
+           file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
+           file://0001-M2Crypto-Error-fix.patch"
 
 SRC_URI[md5sum] = "f93d8462ff7646397a9f77a2fe602d17"
 SRC_URI[sha256sum] = "25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
-- 
1.8.4.2


