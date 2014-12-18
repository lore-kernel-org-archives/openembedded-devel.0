Return-Path: <philip.balister@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5637872865
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 18:40:51 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id z6so794518yhz.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 10:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=VTMM6B/aP1cMtUymAdoIIRxZ0cxcY/SScwFc0gTci+0=;
	b=VN6VVjLfofS5ynyHHBfHvlhD0k97BVvTkOKx3nrcUjhdJvRaSqZ+33fm6GhdaCj+x6
	Fr+oIFI41ypZx0kTth+WRgBinADcm5Ck2BaSWUJs4Cd/fdlZ0fWVYPd/CmvZ8W8vOa+z
	Zx1XtizxpA8YM+GW34CQ+efyCJ+ShLYB+YNzM+BuGJvwMDzXulsLu4gwvOyFwRB7tY5G
	sH/UL9MlXMjwAkaJlpGaQDg/mqq9jJxfLZTuD+O81VLClRjmXQ8nCn1DaUZdRaFqemt7
	/eMHGTmERAoRrTbk2PbUv2vYQKeHMr0FpxXpVQqbGlpbvL8HSSamhPyrHiz73un1RtVs
	jXyg==
X-Received: by 10.236.28.20 with SMTP id f20mr2877126yha.197.1418928052130;
	Thu, 18 Dec 2014 10:40:52 -0800 (PST)
Received: from thuvia.localdomain (pool-71-171-45-99.ronkva.east.verizon.net.
	[71.171.45.99])
	by mx.google.com with ESMTPSA id o30sm4395036yha.37.2014.12.18.10.40.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 10:40:51 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Dec 2014 13:40:44 -0500
Message-Id: <1418928046-29624-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCHv3 1/3] sip : Update to 4.14.2.
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
X-List-Received-Date: Thu, 18 Dec 2014 18:40:59 -0000

The sip configure.py script now has some support for cross compiling. This
allowed simplication of the existing OpenEmbedded sip support. The sip
recipe now produces support for builds via sip-native and target runtime
via sip.

This has been build and runtime tested on the zedboard and ettus-e300.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../recipes-devtools/python/python-sip_4.14.2.bb   | 46 -------------------
 meta-oe/recipes-extended/sip/sip-native_4.14.2.bb  | 35 ---------------
 meta-oe/recipes-extended/sip/sip_4.16.4.bb         | 52 ++++++++++++++++++++++
 3 files changed, 52 insertions(+), 81 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-sip_4.14.2.bb
 delete mode 100644 meta-oe/recipes-extended/sip/sip-native_4.14.2.bb
 create mode 100644 meta-oe/recipes-extended/sip/sip_4.16.4.bb

diff --git a/meta-oe/recipes-devtools/python/python-sip_4.14.2.bb b/meta-oe/recipes-devtools/python/python-sip_4.14.2.bb
deleted file mode 100644
index acabc97..0000000
--- a/meta-oe/recipes-devtools/python/python-sip_4.14.2.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY = "Runtime helper for sip-generated python wrapper libraries"
-SECTION = "devel/python"
-HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
-AUTHOR = "Phil Thompson"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://siplib.sbf.in;endline=15;md5=3d462bd8cb43db3e4be998fe155ae9cf"
-DEPENDS = "python"
-RDEPENDS_${PN} = "python-core"
-
-# riverbankcomputing is upstream, but keeps only latest version, sf usually have few older
-#SRC_URI = "http://www.riverbankcomputing.com/static/Downloads/sip4/sip-${PV}.tar.gz"
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz"
-SRC_URI[md5sum] = "b93442e745b3be2fad89de0686a76ce9"
-SRC_URI[sha256sum] = "1a9d3bf26c821f369c175f8e68946b79bc994da4f96e8f5ecff06e6ee7ac0528"
-
-S = "${WORKDIR}/sip-${PV}/siplib"
-
-inherit qt4x11 distutils-base
-
-EXTRA_QMAKEVARS_POST += " TEMPLATE=lib \
-                         CONFIG=console \
-                         DESTDIR= \
-                         VERSION=1.0.0 \
-                         TARGET=sip \
-                         DEFINES=SIP_QT_SUPPORT \
-                         INCLUDEPATH+=. \
-                         INCLUDEPATH+=${STAGING_INCDIR}/${PYTHON_DIR} \
-                         INCLUDEPATH+=${STAGING_INCDIR}"
-
-
-do_configure_prepend() {
-    cat siplib.sbf.in | sed s,target,TARGET, | sed s,sources,SOURCES, | sed s,headers,HEADERS, | sed s,@CFG_MODULE_BASENAME@,sip, > siplib.pro
-    cat siplib.c.in | sed s,@CFG_MODULE_BASENAME@,sip, > siplib.c
-    cat sip.h.in | sed -e s,@CFG_MODULE_NAME@,sip,g > sip.h
-}
-
-do_install() {
-    install -d ${D}${libdir}/${PYTHON_DIR}/site-packages/
-    install -m 0755 libsip.so.1.0.0 ${D}${libdir}/${PYTHON_DIR}/site-packages/sip.so
-    # sipconfig.py sipdistutils.py
-    install -d ${D}${includedir}
-    install -m 0644 ../siplib/sip.h ${D}${includedir}/sip.h
-}
-
-FILES_${PN} = "${libdir}/${PYTHON_DIR}/site-packages/sip.so"
-
diff --git a/meta-oe/recipes-extended/sip/sip-native_4.14.2.bb b/meta-oe/recipes-extended/sip/sip-native_4.14.2.bb
deleted file mode 100644
index 602dc25..0000000
--- a/meta-oe/recipes-extended/sip/sip-native_4.14.2.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "SIP is a C++/Python Wrapper Generator"
-AUTHOR = "Phil Thompson"
-HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
-SECTION = "devel"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://sipgen.sbf;endline=15;md5=61b2ce7ddd624968411804d2fa9d776c"
-
-# riverbankcomputing is upstream, but keeps only latest version, sf usually have few older
-#SRC_URI = "http://www.riverbankcomputing.com/static/Downloads/sip4/sip-${PV}.tar.gz"
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz"
-SRC_URI[md5sum] = "b93442e745b3be2fad89de0686a76ce9"
-SRC_URI[sha256sum] = "1a9d3bf26c821f369c175f8e68946b79bc994da4f96e8f5ecff06e6ee7ac0528"
-S = "${WORKDIR}/sip-${PV}/sipgen"
-
-inherit qmake2 native python-dir
-
-EXTRA_QMAKEVARS_POST += "DESTDIR=${S} CONFIG=console"
-
-export BUILD_SYS
-export HOST_SYS
-export STAGING_LIBDIR
-export STAGING_INCDIR
-
-do_configure_prepend() {
-    cat sipgen.sbf | sed s,target,TARGET, | sed s,sources,SOURCES, | sed s,headers,HEADERS, > sipgen.pro
-}
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 sip ${D}${bindir}/sip
-    # python-pyqt expects sip4
-    ln -sf sip ${D}${bindir}/sip4
-    cd ${WORKDIR}/sip-${PV} && python configure.py
-    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-    install -m 0755 sip*.py ${D}${PYTHON_SITEPACKAGES_DIR}
-}
diff --git a/meta-oe/recipes-extended/sip/sip_4.16.4.bb b/meta-oe/recipes-extended/sip/sip_4.16.4.bb
new file mode 100644
index 0000000..3f7d501
--- /dev/null
+++ b/meta-oe/recipes-extended/sip/sip_4.16.4.bb
@@ -0,0 +1,52 @@
+SUMMARY = "SIP is a C++/Python Wrapper Generator"
+AUTHOR = "Phil Thompson"
+HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
+SECTION = "devel"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
+DEPENDS_class-target = "qt4-x11-free"
+
+DEPENDS = "python"
+
+# riverbankcomputing is upstream, but keeps only latest version, sf usually have few older
+#SRC_URI = "http://www.riverbankcomputing.com/static/Downloads/sip4/sip-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz"
+SRC_URI[md5sum] = "a9840670a064dbf8f63a8f653776fec9"
+SRC_URI[sha256sum] = "ceda443fc5e129e67a067e2cd7b73ff037f8b10b50e407baa2b1d9f2199d57f5"
+
+BBCLASSEXTEND = "native"
+
+inherit qmake2 python-dir pythonnative
+
+EXTRA_QMAKEVARS_POST += "CONFIG=console"
+
+export BUILD_SYS
+export HOST_SYS
+export STAGING_LIBDIR
+export STAGING_INCDIR
+
+do_configure_prepend_class-target() {
+    echo "py_platform = linux" > sip.cfg
+    echo "py_inc_dir = %(sysroot)/${includedir}/python%(py_major).%(py_minor)" >> sip.cfg
+    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
+    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
+    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
+    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
+    python configure.py --use-qmake --configuration sip.cfg --sysroot ${STAGING_DIR_HOST}
+}
+do_configure_prepend_class-native() {
+    echo "py_platform = linux" > sip.cfg
+    echo "py_inc_dir = ${includedir}/python%(py_major).%(py_minor)" >> sip.cfg
+    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
+    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
+    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
+    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
+    python configure.py --use-qmake --configuration sip.cfg --sysroot ${STAGING_DIR_NATIVE}
+}
+do_install() {
+    oe_runmake install
+}
+
+FILES_${PN} += "${libdir}/${PYTHON_DIR}/site-packages/"
+FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
+
-- 
2.1.0


