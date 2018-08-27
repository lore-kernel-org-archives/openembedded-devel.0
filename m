Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 41BAF792FD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 11:08:01 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id a108-v6so13204443wrc.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 04:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=85WeS243jwA5lYXdz9BgYgcHmmjhIbWU/WZI0Cs7cjA=;
	b=uAOpIOTh8jzquXcX1vCKtEnnITRSFOk7pQelMD3BPA24hOAaV3B1qbAYUJddkHKISV
	/ESeBnr4zEs6ImdGvemFrJxvmoWI1qHkjhY/to2FT4C8jb7mxlCIRCvIwJqSBP9yg2Vj
	3Y/BQ24ffPvxrxNe+liTZAxRjIqTPmG8309QFE84/jRx8XGM5ze/qPN5bQF4DKKi2B6q
	AEWDK0g7WXfNIK6wZcOzNJ4q3nyPSNT4gftcAYZ/jD+MG3lDsFnH9nI/rO6MlOEJAkre
	df8Vzkbcnm9GZE049zbqyTAJ+HWz+Cs88l9aV3yIkkyYCPxidhCPiXGfV/c12TkKVLbG
	W4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=85WeS243jwA5lYXdz9BgYgcHmmjhIbWU/WZI0Cs7cjA=;
	b=lqPdHwb6GyE/OfHyETitDwhU50QZVRm38SPKUl9q7hNDuK9qCkE1ERkgwMXzht09Y7
	bNekGfbCcxRwXL/h7BI44n8YYQKzO3K5njn+9yXZAy15GAioy6ra6szl5nsg3t/9rZAJ
	KKXte/2Wdn42bVn4WYRAKGgQMh4tmX4tYTLDLkUxO48hKsWgrm/s/SNMEymnVDcjWCF9
	hdWY9pSlELYMvFKHYedlsdw4H8bUqussrfqbTJZXuiVAhiV0Jkud2fJYVQhStSuiDhGQ
	AGd6slMla8Xsj0AIjMvYBgdiNoQ4U42ScBHdCVEISVWOOr2bvTzqwdQ18oOfd3GpsT6z
	2jAg==
X-Gm-Message-State: APzg51C7YbZl5VI/aW3w5KDFPXjntofAWW0jQ6oqYkL87Y8H6aGD6OIn
	f+t58RDfhUtYHwXpWDwnAET4CvYm
X-Google-Smtp-Source: ANB0VdY6MHPZ2Oj35p9SF3BUi/5bZ5LWKxF84J13/AQUt6Gcq2ARCa+8IJvKGVqaGIqfTLB2IuTuOw==
X-Received: by 2002:adf:c684:: with SMTP id
	j4-v6mr8055132wrg.243.1535368081795; 
	Mon, 27 Aug 2018 04:08:01 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	a11-v6sm19243016wrr.81.2018.08.27.04.08.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 04:08:00 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 13:07:35 +0200
Message-Id: <20180827110735.6396-6-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180827110735.6396-1-sno@netbsd.org>
References: <20180827110735.6396-1-sno@netbsd.org>
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-python][PATCH 6/6] python{, 3}-m2crypto: update from 0.26.4 -> 0.30.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2018 11:08:01 -0000

Updating recipe for crypto and SSL toolkit for python and support
python3 infrastructure of Yocto as well as the already supported
python2 line.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 ...m2crypto_0.26.4.bb => python-m2crypto.inc} | 10 +++---
 ...k-in-sysroot-not-in-host-directories.patch | 36 +++++++++----------
 .../cross-compile-platform.patch              | 23 ++++++------
 .../m2crypto-0.26.4-gcc_macros.patch          | 12 ++-----
 .../python/python-m2crypto_0.30.1.bb          |  2 ++
 .../python/python3-m2crypto_0.30.1.bb         |  2 ++
 6 files changed, 41 insertions(+), 44 deletions(-)
 rename meta-python/recipes-devtools/python/{python-m2crypto_0.26.4.bb => python-m2crypto.inc} (87%)
 create mode 100644 meta-python/recipes-devtools/python/python-m2crypto_0.30.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb

diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb b/meta-python/recipes-devtools/python/python-m2crypto.inc
similarity index 87%
rename from meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
rename to meta-python/recipes-devtools/python/python-m2crypto.inc
index 0da4274d9..d0eaa819b 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
@@ -1,18 +1,20 @@
 SUMMARY = "A Python crypto and SSL toolkit"
 HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
 
-LICENSE = "BSD"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-m2crypto:"
+
 SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
             file://cross-compile-platform.patch \
             file://m2crypto-0.26.4-gcc_macros.patch \
            "
-SRC_URI[md5sum] = "5c74c25ba8b45122318a165a3a2059ad"
-SRC_URI[sha256sum] = "5cae7acc0b34821f8c0ddf6665e482893fe1f198ad6379e61ffa9d8e65f5c199"
+SRC_URI[md5sum] = "7fce3cbf85eb84a669682892b935746b"
+SRC_URI[sha256sum] = "a1b2751cdadc6afac3df8a5799676b7b7c67a6ad144bb62d38563062e7cd3fc6"
 
 PYPI_PACKAGE = "M2Crypto"
-inherit pypi setuptools siteinfo
+inherit pypi siteinfo
 
 DEPENDS += "openssl swig-native"
 RDEPENDS_${PN} += "python-typing"
diff --git a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
index c71b16fec..fee1f3fb9 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
+++ b/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
@@ -14,26 +14,22 @@ diff --git a/setup.py b/setup.py
 index 3407c82..15ed7cd 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -127,7 +127,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
-                 self.openssl = os.path.join(self.openssl, 'OpenSSL')
-         else:
-             self.libraries = ['ssl', 'crypto']
--            self.openssl = '/usr'
-+            self.openssl = os.environ.get( "STAGING_DIR" )
+@@ -130,6 +130,7 @@
+         self.set_undefined_options('build', ('bundledlls', 'bundledlls'))
  
-     def finalize_options(self):
-         '''Overloaded build_ext implementation to append custom openssl
-@@ -143,8 +143,8 @@ class _M2CryptoBuildExt(build_ext.build_ext):
-         if _openssl and os.path.isdir(_openssl):
-             self.openssl = _openssl
+         self.libraries = ['ssl', 'crypto']
++        self.openssl = os.environ.get( "STAGING_DIR" )
+         if sys.platform == 'win32':
+             self.libraries = ['ssleay32', 'libeay32']
+             if self.openssl and openssl_version(self.openssl, 0x10100000, True):
+@@ -150,8 +151,8 @@
  
--        self.include_dirs.append(os.path.join(self.openssl, 'include'))
--        openssl_library_dir = os.path.join(self.openssl, 'lib')
-+        self.include_dirs.append(os.environ.get( "STAGING_INCDIR" ))
-+        openssl_library_dir = os.environ.get( "STAGING_LIBDIR" )
+         if self.openssl is not None:
+             log.debug('self.openssl = %s', self.openssl)
+-            openssl_library_dir = os.path.join(self.openssl, 'lib')
+-            openssl_include_dir = os.path.join(self.openssl, 'include')
++            openssl_library_dir = os.environ.get( "STAGING_LIBDIR" )
++            openssl_include_dir = os.environ.get( "STAGING_INCDIR" )
  
-         if platform.system() == "Linux":
-             if _multiarch:  # on Fedora/RHEL it is an empty string
--- 
-2.7.4
-
+             self.library_dirs.append(openssl_library_dir)
+             self.include_dirs.append(openssl_include_dir)
diff --git a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch b/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
index c6654e540..09a5b0f5a 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
+++ b/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
@@ -4,27 +4,30 @@ since it pokes at the system for getting architecture values
 Upstream-Status: Inappropriate
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: M2Crypto-0.26.0/setup.py
-===================================================================
---- M2Crypto-0.26.0.orig/setup.py
-+++ M2Crypto-0.26.0/setup.py
-@@ -141,19 +141,6 @@ class _M2CryptoBuildExt(build_ext.build_
-                 self.include_dirs.append(
-                     os.path.join(self.openssl, 'include', 'openssl'))
+diff --git a/setup.py b/setup.py
+index 3407c82..15ed7cd 100644
+--- a/setup.py
++++ b/setup.py
+@@ -160,22 +160,6 @@
+             log.debug('self.include_dirs = %s', self.include_dirs)
+             log.debug('self.library_dirs = %s', self.library_dirs)
  
+-        if platform.system() == "Linux":
 -            # For RedHat-based distros, the '-D__{arch}__' option for
 -            # Swig needs to be normalized, particularly on i386.
 -            mach = platform.machine().lower()
 -            if mach in ('i386', 'i486', 'i586', 'i686'):
 -                arch = '__i386__'
--            elif mach in ('ppc64', 'powerpc64'):
+-            elif mach in ('ppc64', 'powerpc64', 'ppc64le', 'ppc64el'):
 -                arch = '__powerpc64__'
 -            elif mach in ('ppc', 'powerpc'):
 -                arch = '__powerpc__'
 -            else:
 -                arch = '__%s__' % mach
 -            self.swig_opts.append('-D%s' % arch)
+-            if mach in ('ppc64le', 'ppc64el'):
+-                self.swig_opts.append('-D_CALL_ELF=2')
 -
          self.swig_opts.extend(['-I%s' % i for i in self.include_dirs])
-         self.swig_opts.append('-includeall')
-         self.swig_opts.append('-modern')
+ 
+         # Some Linux distributor has added the following line in
diff --git a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch b/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
index 2d738cc94..973cdbaec 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
+++ b/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
@@ -2,17 +2,9 @@ Imported from Fedora
 
 --- M2Crypto/SWIG/_m2crypto.i	2017-09-26 11:26:33.000000000 +0200
 +++ M2Crypto-0.26.4/SWIG/_m2crypto.i	2017-09-26 21:04:14.080330741 +0200
-@@ -7,6 +7,7 @@
-  * Copyright (c) 2009-2010 Heikki Toivonen. All rights reserved.
-  *
-  */
-+%import "gcc_macros.h"
- 
- %module(threads=1) m2crypto
- /* We really don't need threadblock (PyGILState_Ensure() etc.) anywhere.
 @@ -15,11 +16,6 @@
- %nothreadblock;
- %nothreadallow;
+ #endif
+ %}
  
 -#if SWIG_VERSION >= 0x030000
 -#define __WCHAR_MAX__ __WCHAR_MAX
diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.30.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.30.1.bb
new file mode 100644
index 000000000..c612fcdc5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.30.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-m2crypto.inc
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb
new file mode 100644
index 000000000..4d63d4bd3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-m2crypto.inc
-- 
2.17.1


