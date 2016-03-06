Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id CFCAB60746
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Mar 2016 22:56:57 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id 124so68707573pfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Mar 2016 14:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=vnvJx5ixLYipEhE4AolH4El+0rWB9Ws1MNFIMd2sQLc=;
	b=IyhUIeU8nZvUt+aGvyDFBcKOgdUr4sEf+PDBRdOyQcxxb5HtpwQthRDy9Irn/BThPX
	AKjqsfKFWf6FgraflM2yIvSduev+Jp3isv3XHhppxaNLg9aytSGslaJ7YczEdmBvSpDb
	QeXmvtCILIhVQrup9KxriKoSqiF10nBZFVeq02DAPLn+hbr3rtS7kSlYMlQHku0cB/NB
	kxoxNHL+4Qde1dlDqCScDw+M7mpZpC/LpLInJQxyocZjy/fcETqC417Yu8NCq4LlmcuF
	D+13ObMkOvSLj1ehkLiH/SW4KyEoILDSmPQDvN7zuyi4v+7rz4hsQQCMFXXm8kxBfmNM
	LMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vnvJx5ixLYipEhE4AolH4El+0rWB9Ws1MNFIMd2sQLc=;
	b=fVvV5MUeAN1Zvicl94JQmSvH9A4W4pox39Nnk3A+TURrNYhpvbLBxYR1oDmdGVXj86
	+du5XlrSRFXlkMnALRsnpePM5QDhT70nWt5r7qVxOFCOvzwPXet+owTmLuf4HD3TBurk
	6HMO8FVPJJt0Nit1NqVvLjnOP3U50A4gyYWe0PCXDRs2xKVHig+dZxHc+I3cM5gBibEq
	Sfi65T/2YPm5R/XPsbEeUGgdyi6OyFMNA/M21S92bBInKvqjJpuh/TfaSTKSL/BqxmnA
	Ng8bN7l2Jlxjfq871HaKalBOjgvxYkBQv8FZWhg7REoOK7fc1d4cF7wQxrWhsdO8+kOt
	BWYA==
X-Gm-Message-State: AD7BkJIWFFofPrraLmVnS6TUrJ16DQoLknvRq1SJT7AtwnG+dyEFg8ZApraiqOvyc66UyA==
X-Received: by 10.98.86.146 with SMTP id h18mr2775355pfj.9.1457305017889;
	Sun, 06 Mar 2016 14:56:57 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	yl1sm19708126pac.35.2016.03.06.14.56.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Mar 2016 14:56:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Mar 2016 14:56:42 -0800
Message-Id: <1457305002-718-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-python][PATCH] python-m2crypt: update package to 0.23.0
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
X-List-Received-Date: Sun, 06 Mar 2016 22:56:58 -0000

this happens to fix the cdra build issue related to the openssl 1.0.2g
update.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...y-link-in-sysroot-not-in-host-directories.patch | 35 ++++++++---------
 .../python/python-m2crypto_0.21.1.bb               | 44 ----------------------
 .../python/python-m2crypto_0.23.0.bb               | 30 +++++++++++++++
 3 files changed, 46 insertions(+), 63 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb

diff --git a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
index bcbdf24..819c8e5 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
+++ b/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
@@ -10,30 +10,27 @@ Upstream-status: Unknown
  setup.py | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/setup.py b/setup.py
-index e7c49eb..8deaa34 100644
---- a/setup.py
-+++ b/setup.py
-@@ -40,7 +40,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+Index: M2Crypto-0.23.0/setup.py
+===================================================================
+--- M2Crypto-0.23.0.orig/setup.py
++++ M2Crypto-0.23.0/setup.py
+@@ -62,7 +62,7 @@ class _M2CryptoBuildExt(build_ext.build_
              self.openssl = 'c:\\pkg'
          else:
              self.libraries = ['ssl', 'crypto']
 -            self.openssl = '/usr'
 +            self.openssl = os.environ.get( "STAGING_DIR" )
-        
-     
+ 
      def finalize_options(self):
-@@ -49,8 +49,8 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+         '''Overloaded build_ext implementation to append custom openssl
+@@ -75,8 +75,8 @@ class _M2CryptoBuildExt(build_ext.build_
+         if _openssl and os.path.isdir(_openssl):
+             self.openssl = _openssl
  
-         build_ext.build_ext.finalize_options(self)
+-        self.include_dirs.append(os.path.join(self.openssl, 'include'))
+-        openssl_library_dir = os.path.join(self.openssl, 'lib')
++        self.include_dirs.append(os.environ.get( "STAGING_INCDIR" ))
++        openssl_library_dir = os.environ.get( "STAGING_LIBDIR" )
  
--        opensslIncludeDir = os.path.join(self.openssl, 'include')
--        opensslLibraryDir = os.path.join(self.openssl, 'lib')
-+        opensslIncludeDir = os.environ.get( "STAGING_INCDIR" )
-+        opensslLibraryDir = os.environ.get( "STAGING_LIBDIR" )
-         
-         self.swig_opts = ['-I%s' % i for i in self.include_dirs + \
-                           [opensslIncludeDir]]
--- 
-1.8.1.4
-
+         if platform.system() == "Linux":
+             if _multiarch:  # on Fedora/RHEL it is an empty string
diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
deleted file mode 100644
index a3f9a09..0000000
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "A Python crypto and SSL toolkit"
-HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
-
-DEPENDS = "openssl swig-native python"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
-
-SRC_URI = " \
-           file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
-           file://0001-M2Crypto-Error-fix.patch"
-
-SRC_URI[md5sum] = "f93d8462ff7646397a9f77a2fe602d17"
-SRC_URI[sha256sum] = "25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
-
-PYPI_PACKAGE = "M2Crypto"
-inherit pypi setuptools
-
-SWIG_FEATURES_x86-64 = "-D__x86_64__"
-SWIG_FEATURES ?= ""
-export SWIG_FEATURES
-
-# Get around a problem with swig, but only if the
-# multilib header file exists.
-#
-do_compile_prepend() {
-    if [ "${SITEINFO_BITS}" = "64" ];then
-        bit="64"
-    else
-        bit="32"
-    fi
-
-    if [ -e ${STAGING_INCDIR}/openssl/opensslconf-${bit}.h ] ;then
-        for i in SWIG/_ec.i SWIG/_evp.i; do
-            sed -i -e "s/opensslconf.*\./opensslconf-${bit}\./" "$i"
-        done
-    elif [ -e ${STAGING_INCDIR}/openssl/opensslconf-n${bit}.h ] ;then
-        for i in SWIG/_ec.i SWIG/_evp.i; do
-            sed -i -e "s/opensslconf.*\./opensslconf-n${bit}\./" "$i"
-        done
-    fi
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb
new file mode 100644
index 0000000..af8ca09
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.23.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "A Python crypto and SSL toolkit"
+HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=68f7880de949412b2ea248932d97ed54"
+
+SRCNAME = "M2Crypto"
+SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "89557730e245294a6cab06de8ad4fb42"
+SRC_URI[sha256sum] = "1ac3b6eafa5ff7e2a0796675316d7569b28aada45a7ab74042ad089d15a9567f"
+
+SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch "
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += "openssl swig-native"
+
+DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST} -I${STAGING_INCDIR}"
+DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
+
+inherit setuptools
+
+SWIG_FEATURES_x86-64 = "-D__x86_64__"
+SWIG_FEATURES ?= ""
+export SWIG_FEATURES
+
+BBCLASSEXTEND = "native"
-- 
2.3.5


