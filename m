Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7751B79C92
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 08:18:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x628ILRu008321
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 01:18:21 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 2 Jul 2019 01:18:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 2 Jul 2019 16:16:18 +0800
Message-ID: <c016c68efc7aaba1fcff4d0c7a1b03e1a2931e5e.1562055251.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1562055251.git.hongxu.jia@windriver.com>
References: <cover.1562055251.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/8] libbytesize: 1.4 -> 2.0
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
X-List-Received-Date: Tue, 02 Jul 2019 08:18:20 -0000
Content-Type: text/plain

- Depends on libpcre2 since upstream commit [1c7e40a Port to pcre2]

- Remove PACKAGECONFIG python2 since upstream commit
  [895baa3 Remove Python 2 support]

- Fix out of tree build failure

- RDEPENDS on python3-core rather than python3

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/0001-fix-out-of-tree-build-failure.patch | 37 ++++++++++++++++++++++
 .../{libbytesize_1.4.bb => libbytesize_2.0.bb}     |  8 ++---
 2 files changed, 41 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/libbytesize/files/0001-fix-out-of-tree-build-failure.patch
 rename meta-oe/recipes-support/libbytesize/{libbytesize_1.4.bb => libbytesize_2.0.bb} (84%)

diff --git a/meta-oe/recipes-support/libbytesize/files/0001-fix-out-of-tree-build-failure.patch b/meta-oe/recipes-support/libbytesize/files/0001-fix-out-of-tree-build-failure.patch
new file mode 100644
index 0000000..3f42c25
--- /dev/null
+++ b/meta-oe/recipes-support/libbytesize/files/0001-fix-out-of-tree-build-failure.patch
@@ -0,0 +1,37 @@
+From 55802fd187b844f0c114c1657b18482bfc80ec51 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 2 Jul 2019 02:52:31 +0000
+Subject: [PATCH] fix out of tree build failure
+
+Since commit [116da95 Add the '--version' option to bs_calc.py] applied,
+while build out of tree, there is a install failure
+...
+|install -m0755 ../../git/tools/bs_calc.py /usr/bin/bscalc
+|install: cannot stat '../../git/tools/bs_calc.py': No such file or directory
+...
+
+The generated bs_calc.py locates in builddir rather than srcdir
+
+Upstream-Status: Submitted [https://github.com/storaged-project/libbytesize/pull/59]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ tools/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 08223a8..ae22fed 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -5,7 +5,7 @@ dist_man1_MANS = bscalc.man
+ 
+ install-exec-local:
+ 	install -d ${DESTDIR}${bindir}
+-	install -m0755 ${srcdir}/bs_calc.py ${DESTDIR}${bindir}/bscalc
++	install -m0755 ${builddir}/bs_calc.py ${DESTDIR}${bindir}/bscalc
+ 
+ uninstall-local:
+ 	rm ${DESTDIR}${bindir}/bscalc
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.0.bb
similarity index 84%
rename from meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_2.0.bb
index 863ce42..1beb677 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_1.4.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.0.bb
@@ -9,14 +9,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "ebbda2217d177d2a17f917d7a3e3d132a26db791"
+SRCREV = "92c00638a6f846df5c40dbb690f9fcf998ad6df2"
 SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master \
+           file://0001-fix-out-of-tree-build-failure.patch \
 "
 
 inherit gettext autotools python3native
 
 DEPENDS += " \
-    libpcre \
+    libpcre2 \
     gmp \
     mpfr \
 "
@@ -24,8 +25,7 @@ DEPENDS += " \
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/bytesize"
 
 PACKAGECONFIG ??= "python3"
-PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
-PACKAGECONFIG[python2] = "--with-python2, --without-python2,,python2"
+PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3-core"
 PACKAGECONFIG[doc] = "--with-gtk-doc, --without-gtk-doc, gtk-doc-native"
 
 EXTRA_OEMAKE = "py3libdir=${PYTHON_SITEPACKAGES_DIR}"
-- 
2.7.4


