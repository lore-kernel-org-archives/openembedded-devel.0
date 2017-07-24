Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 70C1E78373
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 07:04:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6O74EJS006178
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Jul 2017 00:04:14 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Jul 2017 00:04:13 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Jul 2017 03:04:05 -0400
Message-ID: <1f13309ae5a2c49a4f927cbd3cda9a3bedba2cc3.1500878698.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500878698.git.hongxu.jia@windriver.com>
References: <cover.1500878698.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/5] libbytesize: add recipe 0.10
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
X-List-Received-Date: Mon, 24 Jul 2017 07:04:14 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/0001-remove-python2-support.patch        | 30 +++++++++++++++++++
 .../libbytesize/libbytesize_0.10.bb                | 34 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-support/libbytesize/files/0001-remove-python2-support.patch
 create mode 100644 meta-oe/recipes-support/libbytesize/libbytesize_0.10.bb

diff --git a/meta-oe/recipes-support/libbytesize/files/0001-remove-python2-support.patch b/meta-oe/recipes-support/libbytesize/files/0001-remove-python2-support.patch
new file mode 100644
index 0000000..b57e39f
--- /dev/null
+++ b/meta-oe/recipes-support/libbytesize/files/0001-remove-python2-support.patch
@@ -0,0 +1,30 @@
+From 2ddc97b30792817d162f51ec3818376aefbf184e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 3 May 2017 02:05:33 -0400
+Subject: [PATCH] remove python2 support
+
+We use python3 rather than python2 support
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/python/Makefile.am | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/src/python/Makefile.am b/src/python/Makefile.am
+index 567d0d7..8d9f446 100644
+--- a/src/python/Makefile.am
++++ b/src/python/Makefile.am
+@@ -1,8 +1,3 @@
+-pylibdir = $(shell python -c "import distutils.sysconfig; print(distutils.sysconfig.get_python_lib(1,0,prefix='${exec_prefix}'))")
+-
+-pybytesizedir     = $(pylibdir)/bytesize
+-dist_pybytesize_DATA = bytesize.py __init__.py
+-
+ if WITH_PYTHON3
+ py3libdir = $(shell python3 -c "import distutils.sysconfig; print(distutils.sysconfig.get_python_lib(1,0,prefix='${exec_prefix}'))")
+ py3bytesizedir    = $(py3libdir)/bytesize
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_0.10.bb b/meta-oe/recipes-support/libbytesize/libbytesize_0.10.bb
new file mode 100644
index 0000000..6903021
--- /dev/null
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_0.10.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "The goal of this project is to provide a tiny library that would \
+facilitate the common operations with sizes in bytes."
+HOMEPAGE = "https://github.com/rhinstaller/libbytesize"
+LICENSE = "LGPLv2+"
+SECTION = "devel/lib"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
+
+S = "${WORKDIR}/git"
+B = "${S}"
+
+SRCREV = "369127c0edbba7d1a4e2e02486375dd9d379524f"
+PV = "0.10+git${SRCPV}"
+SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master \
+           file://0001-remove-python2-support.patch \
+"
+
+inherit gettext autotools python3native
+
+DEPENDS += " \
+    libpcre \
+    gmp \
+    mpfr \
+"
+
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/bytesize"
+
+PACKAGECONFIG ??= "python3"
+PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
+PACKAGECONFIG[doc] = "--with-gtk-doc, --without-gtk-doc, gtk-doc-native"
+
+EXTRA_OEMAKE = "py3libdir=${PYTHON_SITEPACKAGES_DIR}"
+
+
-- 
2.8.1


