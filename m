Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B699370100
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 07:04:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6O74CpC021511
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 24 Jul 2017 00:04:12 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Jul 2017 00:04:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Jul 2017 03:04:04 -0400
Message-ID: <c99c9b0c4a69ac48cf672a364adc1781b659bf7e.1500878698.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500878698.git.hongxu.jia@windriver.com>
References: <cover.1500878698.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/5] libpwquality: add recipe 1.4.0
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
X-List-Received-Date: Mon, 24 Jul 2017 07:04:12 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../add-missing-python-include-dir-for-cross.patch | 48 ++++++++++++++++++++++
 .../libpwquality/libpwquality_1.4.0.bb             | 45 ++++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch
 create mode 100644 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb

diff --git a/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch b/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch
new file mode 100644
index 0000000..d12492f
--- /dev/null
+++ b/meta-oe/recipes-extended/libpwquality/files/add-missing-python-include-dir-for-cross.patch
@@ -0,0 +1,48 @@
+From 1ea09e09ab2387c326bb7170835361ece6e25477 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 3 Aug 2015 13:43:14 +0800
+Subject: [PATCH] setup.py.in: add missing python include dir for cross
+ compiling
+
+Upstream-Status: inappropriate [oe-core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ python/Makefile.am | 2 +-
+ python/setup.py.in | 3 ++-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/python/Makefile.am b/python/Makefile.am
+index abc5cd3..e35ba71 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -14,4 +14,4 @@ all-local:
+ 	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py build --build-lib=.
+ 
+ install-exec-local:
+-	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py install --prefix=${DESTDIR}${prefix}
++	CFLAGS="${CFLAGS} -fno-strict-aliasing" @PYTHONBINARY@ setup.py install --prefix=${DESTDIR}${prefix} --install-lib=${DESTDIR}/${PYTHONSITEDIR}
+diff --git a/python/setup.py.in b/python/setup.py.in
+index 6457595..d3db0e5 100755
+--- a/python/setup.py.in
++++ b/python/setup.py.in
+@@ -6,6 +6,7 @@
+ 
+ from distutils.core import setup, Extension
+ from distutils.command.build_ext import build_ext as _build_ext
++import os
+ 
+ class build_ext(_build_ext):
+     def genconstants(self, headerfile, outputfile):
+@@ -23,7 +24,7 @@ class build_ext(_build_ext):
+ 
+ pwqmodule = Extension('pwquality',
+             sources = ['pwquality.c'],
+-            include_dirs = ['../src'],
++            include_dirs = ['../src', os.path.join(os.environ['STAGING_INCDIR'], os.environ['PYTHON_DIR'])],
+             library_dirs = ['../src/.libs'],
+             libraries = ['pwquality'])
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
new file mode 100644
index 0000000..4f5ec14
--- /dev/null
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
@@ -0,0 +1,45 @@
+DESCRIPTION = "Library for password quality checking and generating random passwords"
+HOMEPAGE = "https://github.com/libpwquality/libpwquality"
+SECTION = "devel/lib"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bd2f1386df813a459a0c34fde676fc2"
+
+SRCNAME = "libpwquality"
+SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.bz2 \
+           file://add-missing-python-include-dir-for-cross.patch \
+"
+
+SRC_URI[md5sum] = "b8defcc7280a90e9400d6689c93a279c"
+SRC_URI[sha256sum] = "1de6ff046cf2172d265a2cb6f8da439d894f3e4e8157b056c515515232fade6b"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+DEPENDS = "cracklib virtual/gettext python3"
+RDEPENDS_python3-${PN} = "${PN}"
+
+inherit autotools python3native
+
+B = "${S}"
+
+export PYTHON_DIR
+export BUILD_SYS
+export HOST_SYS
+export STAGING_LIBDIR
+export STAGING_INCDIR
+
+EXTRA_OECONF += "--with-python-rev=${PYTHON_BASEVERSION} \
+                 --with-python-binary=${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
+                 --with-pythonsitedir=${PYTHON_SITEPACKAGES_DIR} \
+                 --libdir=${libdir} \
+"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG[pam] = "--enable-pam, --disable-pam, libpam"
+
+PACKAGES += "python3-${PN} python3-${PN}-dbg"
+FILES_${PN} += "${libdir}/security/pam_pwquality.so"
+FILES_${PN}-dbg += "${libdir}/security/.debug"
+FILES_${PN}-staticdev += "${libdir}/security/pam_pwquality.a"
+FILES_${PN}-dev += "${libdir}/security/pam_pwquality.la"
+FILES_python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
+FILES_python3-${PN}-dbg = "${PYTHON_SITEPACKAGES_DIR}/.debug"
-- 
2.8.1


