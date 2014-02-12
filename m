Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4096EE3F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 12:43:08 +0000 (UTC)
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.5])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 72FEB40083;
	Wed, 12 Feb 2014 12:07:30 +0100 (CET)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Feb 2014 13:43:00 +0100
Message-Id: <1392208980-13798-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] python-m2crypto: adding patch for x86-64 architectures
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
X-List-Received-Date: Wed, 12 Feb 2014 12:43:08 -0000

After python-m2crypto was reported as failed task in bitbake world
on 2014-02-08 by Martin Jansa, I investigate python-m2crypto with
MACHINE = "qemux86-64" setting. When compiling python-m2crypto for
qemux86-64, the setup.py aborts in the swig call with:

  | swig -python -I[...]/tmp-eglibc/sysroots/qemux86-64/usr/include/python2.7 -I[...]/tmp-eglibc/sysroots/qemux86-64/usr/include -includeall -o SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i
  | [...]/tmp-eglibc/sysroots/qemux86-64/usr/include/openssl/opensslconf.h:41: Error: Unable to find 'openssl/opensslconf-32.h'
  | error: command 'swig' failed with exit status 1
  | ERROR: python setup.py build_ext execution failed.
  | WARNING: exit code 1 from a shell command.

To compile for x86-64 architecture, opensslconf.h shall include
opensslconf-64.h, not opensslconf-32.h. Properly including
opensslconf-64.h can be configured through the bits/wordsize.h
header and setting the __x86_64__ directive in the swig call. To
set the directive, setup.py is patched for x86-64 architectures.

Compiling python-m2crypto for qemumips still fails and needs
further adjustments.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 ...6_64__-directive-to-cross-compile-to-x86-.patch | 27 ++++++++++++++++++++++
 .../python/python-m2crypto_0.21.1.bb               |  2 ++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-m2crypto/0001-adding-__x86_64__-directive-to-cross-compile-to-x86-.patch

diff --git a/meta-oe/recipes-devtools/python/python-m2crypto/0001-adding-__x86_64__-directive-to-cross-compile-to-x86-.patch b/meta-oe/recipes-devtools/python/python-m2crypto/0001-adding-__x86_64__-directive-to-cross-compile-to-x86-.patch
new file mode 100644
index 0000000..e6eb102
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-m2crypto/0001-adding-__x86_64__-directive-to-cross-compile-to-x86-.patch
@@ -0,0 +1,27 @@
+From e5b6224d8bb17b7e30af7866ca1769268e8d862a Mon Sep 17 00:00:00 2001
+From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
+Date: Wed, 12 Feb 2014 10:40:43 +0100
+Subject: [PATCH] adding __x86_64__ directive to cross-compile to x86-64
+
+Update-Status: Inappropriate [configuration]
+
+Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
+---
+ setup.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/setup.py b/setup.py
+index 8deaa34..ecf2a12 100644
+--- a/setup.py
++++ b/setup.py
+@@ -55,6 +55,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+         self.swig_opts = ['-I%s' % i for i in self.include_dirs + \
+                           [opensslIncludeDir]]
+         self.swig_opts.append('-includeall')
++        self.swig_opts.append('-D__x86_64__')
+         #self.swig_opts.append('-D__i386__') # Uncomment for early OpenSSL 0.9.7 versions, or on Fedora Core if build fails
+         #self.swig_opts.append('-DOPENSSL_NO_EC') # Try uncommenting if you can't build with EC disabled
+         
+-- 
+1.8.3.2
+
diff --git a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
index 9babc04..ca9ee99 100644
--- a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
+++ b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz \
            file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch"
 
+SRC_URI_append_x86-64 = " file://0001-adding-__x86_64__-directive-to-cross-compile-to-x86-.patch"
+
 SRC_URI[md5sum] = "f93d8462ff7646397a9f77a2fe602d17"
 SRC_URI[sha256sum] = "25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
 
-- 
1.8.3.2


