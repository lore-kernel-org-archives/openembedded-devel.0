Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A1A87897C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 06:06:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6566rqC006887
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Jul 2018 23:06:53 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 4 Jul 2018 23:06:53 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Jul 2018 23:06:53 -0700
Message-ID: <20180705060653.69436-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libbytesize: Upgrade to 1.3
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
X-List-Received-Date: Thu, 05 Jul 2018 06:06:52 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Remove 0001-remove-python2-support.patch and use
  configure option to control the python2 support.
* Update PV to reflect the version change

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../files/0001-remove-python2-support.patch   | 30 -------------------
 ...libbytesize_0.10.bb => libbytesize_1.3.bb} |  6 ++--
 2 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libbytesize/files/0001-remove-python2-support.patch
 rename meta-oe/recipes-support/libbytesize/{libbytesize_0.10.bb => libbytesize_1.3.bb} (84%)

diff --git a/meta-oe/recipes-support/libbytesize/files/0001-remove-python2-support.patch b/meta-oe/recipes-support/libbytesize/files/0001-remove-python2-support.patch
deleted file mode 100644
index b57e39fbc..000000000
--- a/meta-oe/recipes-support/libbytesize/files/0001-remove-python2-support.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2ddc97b30792817d162f51ec3818376aefbf184e Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 3 May 2017 02:05:33 -0400
-Subject: [PATCH] remove python2 support
-
-We use python3 rather than python2 support
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/python/Makefile.am | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/src/python/Makefile.am b/src/python/Makefile.am
-index 567d0d7..8d9f446 100644
---- a/src/python/Makefile.am
-+++ b/src/python/Makefile.am
-@@ -1,8 +1,3 @@
--pylibdir = $(shell python -c "import distutils.sysconfig; print(distutils.sysconfig.get_python_lib(1,0,prefix='${exec_prefix}'))")
--
--pybytesizedir     = $(pylibdir)/bytesize
--dist_pybytesize_DATA = bytesize.py __init__.py
--
- if WITH_PYTHON3
- py3libdir = $(shell python3 -c "import distutils.sysconfig; print(distutils.sysconfig.get_python_lib(1,0,prefix='${exec_prefix}'))")
- py3bytesizedir    = $(py3libdir)/bytesize
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_0.10.bb b/meta-oe/recipes-support/libbytesize/libbytesize_1.3.bb
similarity index 84%
rename from meta-oe/recipes-support/libbytesize/libbytesize_0.10.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_1.3.bb
index 690302149..caf84de2c 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_0.10.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_1.3.bb
@@ -9,10 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "369127c0edbba7d1a4e2e02486375dd9d379524f"
-PV = "0.10+git${SRCPV}"
+SRCREV = "b0dcf6f457d700127b43c0e0a198253c266b78ae"
+PV = "1.3+git${SRCPV}"
 SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master \
-           file://0001-remove-python2-support.patch \
 "
 
 inherit gettext autotools python3native
@@ -27,6 +26,7 @@ FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/bytesize"
 
 PACKAGECONFIG ??= "python3"
 PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
+PACKAGECONFIG[python2] = "--with-python2, --without-python2,,python2"
 PACKAGECONFIG[doc] = "--with-gtk-doc, --without-gtk-doc, gtk-doc-native"
 
 EXTRA_OEMAKE = "py3libdir=${PYTHON_SITEPACKAGES_DIR}"
-- 
2.17.1


