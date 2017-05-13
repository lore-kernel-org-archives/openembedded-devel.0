Return-Path: <philip.balister@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1749F6B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 May 2017 19:24:55 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id 17so3473736ywk.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 May 2017 12:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GOmxU8ZSwRN54Bz3lB/cSTIEo1e24STPsbsAkPUTZio=;
	b=eGu6V9YZVpEM0WLCAmtqUB7Y26sYA+hI7ScApaVrOkfqSU2BpfTkBTXStkX6QJuOfy
	Sb9bTsupwvBc2ncufxAi1uHSt0g8qLzjWnwEz1oGPxO2kBMjS0I91PuidA8KJyAVRyRP
	IqPel+Ky9KTHLC1tGFj5j4mtoomTncCRh8cBUwfcPGCOeIBIfwTyZtdFl1II2+9g9Kwn
	wmOJQZ9DcnNBMNYUlUD8RlgkpF9LjBHfG1xqVhid9ZCKT3WjsirsJGlhSHFJDldPy9pW
	8sqQeKS42R5U7br+Pd7ZA8xIaQzdZiCsP8hzCgKQeWJ+dudozeevIS6DdYDq3XeFlFWw
	hZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=GOmxU8ZSwRN54Bz3lB/cSTIEo1e24STPsbsAkPUTZio=;
	b=Agi7YUhrd8An2aQsBhRqzbo/kd8KRjJz+Vgkjv85ZLJmf4INFyPCaZkRc1mCCbKirh
	nWnonxgqM8tRMXQyNA5JIwRl1IRvg5UdrLR0jLzX2p0ta+FQQMO2pqG14j+07bNpo7uw
	4GJ5nmvuAvA//TsSga0Osb5Kjdax49HX2e9/U/UeyrdgeUtidtaazHXtSOEDqw1Kc+RO
	MwE8gzV0bP2ZqgY2cFzdmREYsSgIwLN/r9gS3dc1ixz77WiSx+KmqHsH4dqPlD9/o6h2
	nPzUkdpxCAlR0Gklk2v89/Dks044OYSh1SRxYvrdAvl4WXrxbopgdRmuGPIhsoNAdHsk
	eDUw==
X-Gm-Message-State: AODbwcAVl6iGlGqLVlcV3BYK8Q3BcHgfE6F2QPPr1s3iZnWhOLUS+IVz
	zqbfeZEiAU6QpqVu
X-Received: by 10.129.156.76 with SMTP id t73mr8379366ywg.262.1494703496614;
	Sat, 13 May 2017 12:24:56 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-14-165.ronkva.east.verizon.net.
	[71.171.14.165]) by smtp.gmail.com with ESMTPSA id
	w192sm3321511yww.56.2017.05.13.12.24.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 May 2017 12:24:55 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 May 2017 15:24:49 -0400
Message-Id: <1494703489-23588-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494703489-23588-1-git-send-email-philip@balister.org>
References: <1494703489-23588-1-git-send-email-philip@balister.org>
Subject: [meta-qt5][PATCH 2/2] python-pyqt5: Add recipe.
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
X-List-Received-Date: Sat, 13 May 2017 19:24:56 -0000

 * Build tested on raspberrypi3
 * I promise to chase the patch upstream.

Signed-off-by: Philip Balister <philip@balister.org>
---
 recipes-python/pyqt5/files/fix-sm.patch    | 17 ++++++++
 recipes-python/pyqt5/python-pyqt5_5.8.2.bb | 68 ++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 recipes-python/pyqt5/files/fix-sm.patch
 create mode 100644 recipes-python/pyqt5/python-pyqt5_5.8.2.bb

diff --git a/recipes-python/pyqt5/files/fix-sm.patch b/recipes-python/pyqt5/files/fix-sm.patch
new file mode 100644
index 0000000..f2936a2
--- /dev/null
+++ b/recipes-python/pyqt5/files/fix-sm.patch
@@ -0,0 +1,17 @@
+--- PyQt5_gpl-5.8.2/sip/QtGui/qguiapplication.sip.orig	2017-05-13 13:28:42.523392315 -0400
++++ PyQt5_gpl-5.8.2/sip/QtGui/qguiapplication.sip	2017-05-13 13:30:08.081207211 -0400
+@@ -270,12 +270,14 @@
+ %End
+ 
+ public:
++%If (PyQt_SessionManager)
+ %If (Qt_5_6_0 -)
+     static bool isFallbackSessionManagementEnabled();
+ %End
+ %If (Qt_5_6_0 -)
+     static void setFallbackSessionManagementEnabled(bool);
+ %End
++%End
+ 
+ signals:
+ %If (Qt_5_6_0 -)
diff --git a/recipes-python/pyqt5/python-pyqt5_5.8.2.bb b/recipes-python/pyqt5/python-pyqt5_5.8.2.bb
new file mode 100644
index 0000000..b4c0a8d
--- /dev/null
+++ b/recipes-python/pyqt5/python-pyqt5_5.8.2.bb
@@ -0,0 +1,68 @@
+SUMMARY = "Python Qt5 Bindings"
+AUTHOR = "Phil Thomson @ riverbank.co.uk"
+HOMEPAGE = "http://riverbankcomputing.co.uk"
+SECTION = "devel/python"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "\
+    file://LICENSE;md5=d32239bcb673463ab874e80d47fae504 \
+"
+DEPENDS = "sip sip-native qtbase python"
+
+SRC_URI = "\
+    ${SOURCEFORGE_MIRROR}/pyqt/PyQt5_gpl-${PV}.tar.gz \
+    file://fix-sm.patch \
+"
+SRC_URI[md5sum] = "c3048e9d242f3e72fd393630da1d971a"
+SRC_URI[sha256sum] = "ebd70515b30bbd6098fee29e6271a6696b1183c5530ee30e6ba9aaab195536e8"
+
+S = "${WORKDIR}/PyQt5_gpl-${PV}"
+
+
+inherit qmake5 pythonnative python-dir distro_features_check
+# depends on qt4-x11-free
+REQUIRED_DISTRO_FEATURES = "x11"
+
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+DISABLED_FEATURES = "PyQt_Desktop_OpenGL PyQt_Accessibility PyQt_SessionManager"
+
+DISABLED_FEATURES_append_arm = " PyQt_qreal_double"
+
+PYQT_MODULES = "QtCore QtGui QtNetwork"
+PYQT_MODULES_aarch64 = "QtCore QtGui QtNetwork"
+
+do_configure_prepend() {
+    cd ${S}
+    echo "py_platform = linux" > pyqt.cfg
+    echo "py_inc_dir = %(sysroot)/$includedir/python%(py_major).%(py_minor)" >> pyqt.cfg
+    echo "py_pylib_dir = %(sysroot)/${libdir}/python%(py_major).%(py_minor)" >> pyqt.cfg
+    echo "py_pylib_lib = python%(py_major).%(py_minor)mu" >> pyqt.cfg
+    echo "pyqt_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> pyqt.cfg
+    echo "pyqt_bin_dir = ${D}/${bindir}" >> pyqt.cfg
+    echo "pyqt_sip_dir = ${D}/${datadir}/sip/PyQt5" >> pyqt.cfg
+    echo "pyuic_interpreter = ${D}/${bindir}/python%(py_major).%(py_minor)" >> pyqt.cfg
+    echo "pyqt_disabled_features = ${DISABLED_FEATURES}" >> pyqt.cfg
+    echo "qt_shared = True" >> pyqt.cfg
+    echo "[Qt 5.7]" >> pyqt.cfg
+    echo "pyqt_modules = ${PYQT_MODULES}" >> pyqt.cfg
+    echo yes | python configure.py --verbose --qmake  ${STAGING_BINDIR_NATIVE}/qt5/qmake --configuration pyqt.cfg --sysroot ${STAGING_DIR_HOST}
+}
+
+do_compile() {
+    cd ${S}
+    oe_runmake
+}
+
+do_install() {
+    cd ${S}
+    oe_runmake install
+}
+
+RDEPENDS_${PN} = "python-core python-sip"
+
+FILES_${PN} += "${libdir}/${PYTHON_DIR}/site-packages ${datadir}/sip/PyQt5/"
+FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/*/.debug/"
+
-- 
2.7.4


