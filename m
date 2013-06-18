Return-Path: <philip.balister@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 820F7601AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 14:09:50 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id k14so2330229qcv.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 07:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=H3Voe48AAo+pfOjYVuyBepWaG8T3ibt9v3CDZCi90Kk=;
	b=AMAZOBNpbiAD0gL16IjIGkITo+Jpe2O/43CbDbgUZnSGwwCiDYRQeEJvFDDgjDjYwj
	l6US+ST5LJdBpirC3Qtmm3msUrYJSwETwJ6EH+lBg2v2FSj7og9YsSZ1dL9YzaosRmd3
	BhfA9teZzQ3hXkgaG9idKCfLWc0P2lzXcvGDmr2KXP5mG8OgpO0CjLHmVDxVw6lIIv03
	AZC6ZOogr8KO2xQhG2ExLk5BntQW7yTfnZ+OFTeUqtH4p5dMW4cRQVYInMgaSj+38+LZ
	PE1ABZ7hqn6HNL06ovvwGLH0LhlR6kne0HZ9n6a8DN6/8HIy6hoAwAU7DYCtYYX1qhBM
	+ymw==
X-Received: by 10.224.161.145 with SMTP id r17mr23572906qax.72.1371564590679; 
	Tue, 18 Jun 2013 07:09:50 -0700 (PDT)
Received: from localhost.localdomain
	(pool-96-240-171-202.ronkva.east.verizon.net. [96.240.171.202])
	by mx.google.com with ESMTPSA id j9sm28110551qas.3.2013.06.18.07.09.49
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 07:09:49 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2013 10:09:45 -0400
Message-Id: <1371564585-12373-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-oe][PATCH] gnuradio : Update to 3.6.5. Also fix for docs, packaging, and grc RDEPENDS.
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
X-List-Received-Date: Tue, 18 Jun 2013 14:09:50 -0000

 * Fix packaging so grc and examples packages are not empty.
 * Account for addition of gr-modtool.
 * Update to version 3.6.5 of GNU Radio.
 * Update RDEPENDS for grc to add python-netserver.
 * Try even harder to stop docs from getting built.
---
 .../gnuradio/0001-gr-trellis-Kill-docs-hard.patch  | 38 ++++++++++++++++++++++
 .../recipes-connectivity/gnuradio/gnuradio_git.bb  | 17 +++++-----
 2 files changed, 47 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-gr-trellis-Kill-docs-hard.patch

diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-gr-trellis-Kill-docs-hard.patch b/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-gr-trellis-Kill-docs-hard.patch
new file mode 100644
index 0000000..38c3a10
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-gr-trellis-Kill-docs-hard.patch
@@ -0,0 +1,38 @@
+From 473342055e423384e2b17cc0957613299382fb79 Mon Sep 17 00:00:00 2001
+From: Philip Balister <philip@balister.org>
+Date: Mon, 17 Jun 2013 10:58:29 -0400
+Subject: [PATCH] gr-trellis : Kill docs hard.
+
+Signed-off-by: Philip Balister <philip@balister.org>
+---
+ gr-trellis/CMakeLists.txt | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/gr-trellis/CMakeLists.txt b/gr-trellis/CMakeLists.txt
+index 16a3e7c..95e1420 100644
+--- a/gr-trellis/CMakeLists.txt
++++ b/gr-trellis/CMakeLists.txt
+@@ -50,12 +50,6 @@ if(ENABLE_GR_TRELLIS)
+ include(GrPackage)
+ CPACK_SET(CPACK_COMPONENT_GROUP_TRELLIS_DESCRIPTION "GNU Radio Trellis Blocks")
+ 
+-CPACK_COMPONENT("trellis_docs"
+-    GROUP        "Trellis"
+-    DISPLAY_NAME "Documentation"
+-    DESCRIPTION  "Doxygen HTML and XML"
+-)
+-
+ CPACK_COMPONENT("trellis_runtime"
+     GROUP        "Trellis"
+     DISPLAY_NAME "Runtime"
+@@ -95,7 +89,6 @@ CPACK_COMPONENT("trellis_swig"
+ # Add subdirectories
+ ########################################################################
+ add_subdirectory(src/lib)
+-add_subdirectory(doc)
+ if(ENABLE_PYTHON)
+     add_subdirectory(grc)
+     add_subdirectory(src/python)
+-- 
+1.7.11.7
+
diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
index 45f4c77..b0fc630 100644
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
+++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
@@ -27,7 +27,7 @@ RDEPENDS_${PN} = "python-core python-audio python-threading python-codecs \
                   python-netclient python-difflib \
                   python-pprint python-numpy  \
 "
-RDEPENDS_${PN}-grc = "python-pygtk python-lxml python-cheetah"
+RDEPENDS_${PN}-grc = "python-pygtk python-lxml python-cheetah python-netserver"
 
 C_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
@@ -43,34 +43,35 @@ do_compile_prepend() {
 }
 
 PACKAGES += " \
-    ${PN}-examples \
     ${PN}-grc \
+    ${PN}-examples \
 "
 
 FILES_${PN}-grc = "${datadir}/gnuradio/grc"
+FILES_${PN}-examples = "${datadir}/gnuradio/examples"
 
-FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/gnuradio/*"
-FILES_${PN} += "${datadir}/gnuradio/*"
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/gnuradio"
+FILES_${PN} += "${datadir}/gnuradio/modtool"
 # The following needs fixing upstream
-FILES_${PN} += "${prefix}/etc/gnuradio/*"
+FILES_${PN} += "${prefix}/etc/gnuradio"
 
 FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/gnuradio/.debug \
                     ${PYTHON_SITEPACKAGES_DIR}/gnuradio/*/.debug \
                     ${datadir}/gnuradio/examples/*/.debug \
 "
-FILES_${PN}-examples = "${datadir}/gnuradio/examples"
 
-PV = "3.6.4.1"
+PV = "3.6.5"
 
 FILESPATHPKG_prepend = "gnuradio-git:"
 
-SRCREV = "5f69899e059e9bea58f92af61f70fc3f63825087"
+SRCREV = "a7b3a9339106aaba72195b693dfeaa98f194e0d5"
 
 # Make it easy to test against developer repos and branches
 GIT_REPO = "gnuradio.git"
 GIT_BRANCH = "master"
 
 SRC_URI = "git://git.gnuradio.org/${GIT_REPO};branch=${GIT_BRANCH};protocol=git \
+           file://0001-gr-trellis-Kill-docs-hard.patch \
 "
 
 S="${WORKDIR}/git"
-- 
1.7.11.7


