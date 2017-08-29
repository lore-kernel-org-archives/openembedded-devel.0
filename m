Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8373B78227
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 02:46:18 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id z87so6412221pfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 19:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZuJSVp8w1+MM7v9UJ5GBFC8/J2Y1V40qPWC9as4118Q=;
	b=lexf9yg2lnZODvKZUwW/fA2B1NKd+ChkA4gcAuJUmQVcT5jfqSTs31zFGH6UXIgHfK
	GM8BAYkVdyLtQmX87fGnMj3bCm3uDi5U/NTvdliudIZjlIKRHKZDzW6sIgOJpDlz9Bsr
	QfJE6/VUYO+cVFPVkuuBY/8O6uZb977ZrDiKtvYTFHjZp6MM0eZevlEHOCav8gLsoQ2d
	8ueQSBSyjB2sdDzQ8EUon6c5/dsRiTbJb+ycvY1OdUZ/abMWr3hjLPmHMxdueuPOwGw4
	6r78XfVP5LKZqqVfIJTogy/CWRm4sQOFxOMxRNq/I/D19huXD48JIs3h8o2kuJtGk+5l
	4sqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZuJSVp8w1+MM7v9UJ5GBFC8/J2Y1V40qPWC9as4118Q=;
	b=ImdZBXswt/AjyV0ioYgC6E6kB4IE9ulGr+2nThmvMIGof50/WWXgVreWCG1XxVjSYN
	dfE59NYqSsrT+KesSV8ac+oTQo8STw/0J3Rr+YSRb7rL3uXsSXkJEdahuHL43qN1XGd7
	veo/qohw7ROSXG1+0r96vPdPMmBw0/2qcfY1K6kouZ/M/mOfDI1VDJUVZpHPQoZvx21S
	LnjTIJ6QnPuCkx6YNxg7LUE114Nx5fKwE81eclkPHdMmM5qN9L+1tOyUjcEE5C2VDfUU
	p6USyj/n/P5GWWf7ZgGnZWHhNZgU9n2ZzVxSXGnRZTPIrP/RLqXl38zQn6jxM1aOpleA
	puIQ==
X-Gm-Message-State: AHYfb5h/ghiAq7dDgSWNvXJLZMSjUuEQI6hpKUjr8zfQ8OPbMfZqKPuc
	0vOUxHgN9VpdobZu
X-Received: by 10.99.185.22 with SMTP id z22mr2426846pge.361.1503974779423;
	Mon, 28 Aug 2017 19:46:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	l14sm2398967pgu.46.2017.08.28.19.46.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Aug 2017 19:46:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Aug 2017 19:46:06 -0700
Message-Id: <20170829024606.8475-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-python][PATCH V3] python-m2crypto: Upgrade to 0.26.0
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
X-List-Received-Date: Tue, 29 Aug 2017 02:46:18 -0000

Use proper LICENCE file for LIC_FILES_CHKSUM
Update homepage to point to gitlab
Fix cross-build arch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2->v3:
- Fix cross builds

 .../python-m2crypto/cross-compile-platform.patch   | 30 ++++++++++++++++++++++
 ...2crypto_0.25.1.bb => python-m2crypto_0.26.0.bb} | 21 +++++++--------
 2 files changed, 41 insertions(+), 10 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
 rename meta-python/recipes-devtools/python/{python-m2crypto_0.25.1.bb => python-m2crypto_0.26.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch b/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
new file mode 100644
index 000000000..c6654e540
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
@@ -0,0 +1,30 @@
+Do not compute platform, this does not work in cross compile environment
+since it pokes at the system for getting architecture values
+
+Upstream-Status: Inappropriate
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: M2Crypto-0.26.0/setup.py
+===================================================================
+--- M2Crypto-0.26.0.orig/setup.py
++++ M2Crypto-0.26.0/setup.py
+@@ -141,19 +141,6 @@ class _M2CryptoBuildExt(build_ext.build_
+                 self.include_dirs.append(
+                     os.path.join(self.openssl, 'include', 'openssl'))
+ 
+-            # For RedHat-based distros, the '-D__{arch}__' option for
+-            # Swig needs to be normalized, particularly on i386.
+-            mach = platform.machine().lower()
+-            if mach in ('i386', 'i486', 'i586', 'i686'):
+-                arch = '__i386__'
+-            elif mach in ('ppc64', 'powerpc64'):
+-                arch = '__powerpc64__'
+-            elif mach in ('ppc', 'powerpc'):
+-                arch = '__powerpc__'
+-            else:
+-                arch = '__%s__' % mach
+-            self.swig_opts.append('-D%s' % arch)
+-
+         self.swig_opts.extend(['-I%s' % i for i in self.include_dirs])
+         self.swig_opts.append('-includeall')
+         self.swig_opts.append('-modern')
diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
rename to meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
index 72523bd7f..4b4fbbb7c 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
@@ -1,13 +1,14 @@
 SUMMARY = "A Python crypto and SSL toolkit"
-HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
+HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95295693f047bb8f76928251a6154a60"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
-SRC_URI[md5sum] = "040234289fbef5bed4029f0f7d1dae35"
-SRC_URI[sha256sum] = "ac303a1881307a51c85ee8b1d87844d9866ee823b4fdbc52f7e79187c2d9acef"
-
-SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch "
+SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
+            file://cross-compile-platform.patch \
+           "
+SRC_URI[md5sum] = "9f02f0b88fbe225cc6ea8680945cafa0"
+SRC_URI[sha256sum] = "05d94fd9b2dae2fb8e072819a795f0e05d3611b09ea185f68e1630530ec09ae8"
 
 PYPI_PACKAGE = "M2Crypto"
 inherit pypi setuptools siteinfo
@@ -18,16 +19,16 @@ RDEPENDS_${PN} += "python-typing"
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST} -I${STAGING_INCDIR}"
 DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
 
-inherit setuptools
-
-SWIG_FEATURES_x86-64 = "-D__x86_64__"
-SWIG_FEATURES ?= ""
+SWIG_FEATURES_x86 = "-D__i386__"
+SWIG_FEATURES ?= "-D__${HOST_ARCH}__"
 export SWIG_FEATURES
 
 # Get around a problem with swig, but only if the
 # multilib header file exists.
 #
 do_compile_prepend() {
+    ${CPP} -dM - < /dev/null | grep -v __STDC__ | grep -v __REGISTER_PREFIX__ | grep -v __GNUC__ \
+	| sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' > SWIG/gcc_macros.h
     if [ "${SITEINFO_BITS}" = "64" ];then
         bit="64"
     else
-- 
2.14.1


