Return-Path: <philip.balister@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4748F72F63
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 May 2017 13:33:19 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id e15so6171710vkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 May 2017 06:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Hl2y+77KF2rIXuDH9Uhp8Hfdshzkuwc7sSb/xXtDX0M=;
	b=jF41bKqr14gY60JuRfZtd4xQUtJ095pQWSFGh9gx/GLUP7tCPH7vyTe8JQ5zE2T5rC
	F5UhtjsEQET9L0q7cXIxjURTQNTpVBYoO4c+iyV//pYTFjKtEI1zNCEBEjktfsmjZBp6
	W/5oCHwFJJNKiuk/EBOKhAUvFO+iCZTLjjuznKNGn6aHiC1pXzG16d3awp7J6ohmeDgM
	5M+dOT+YoTN4eqVvIp11F/dmDItbYQLiFk87+f02yQ4DkQeo3WHNSnenT1weLqH/uUd+
	aWfr0J71MrXGCEbCstJMmEfZOiHAHNByN4AN6QKnsHf4DswQQHV+fyAIhcps/WKpb3CW
	U5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Hl2y+77KF2rIXuDH9Uhp8Hfdshzkuwc7sSb/xXtDX0M=;
	b=PPZnGtU9HaXGm9d9Of5mRTdu3ytdI5dTyKxxUX9tafWnfHoj1F0d6JwH1Km0dj/CQR
	2Xm0O+FpZupqJ8dFGLbuc7g3s/DBBM9vUgm2v3ocaSubaRQFlrddILju4SsK+qNErwUZ
	To6sWoGniFgEWZ1h1Cp4v+2Mfmo5KUAZn0EDQRq+X64HL902miqD5Az3YpsYHttiuQue
	T3KBggRvZuCcagbnL9QcizLPa462ljPy/iF3pTpplhdrKdpP76iu2wbxQQ23kXOssc26
	Se0NEANvbric7+1HwdqAHEVXMXyQM9jU7dPxGvJSelo05A+tYMJayeaK7TsQyfuCxVrO
	nehg==
X-Gm-Message-State: AODbwcBo0h7+4HQvrjN3aiSsF/sVmDh7EUaH7i+juZgekJQwDkKASo4J
	cyizkE5PnnwxNZ2K
X-Received: by 10.31.63.140 with SMTP id m134mr3064939vka.8.1494855200283;
	Mon, 15 May 2017 06:33:20 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-14-165.ronkva.east.verizon.net.
	[71.171.14.165]) by smtp.gmail.com with ESMTPSA id
	d16sm2940616vkf.16.2017.05.15.06.33.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 May 2017 06:33:18 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 May 2017 09:33:14 -0400
Message-Id: <1494855194-22282-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-qt5][PATCHv2] python-pyqt5: Add recipe.
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
X-List-Received-Date: Mon, 15 May 2017 13:33:20 -0000

 * Build tested on raspberrypi3
 * I promise to chase the patch upstream.
 * v2 auto detects QT_VERSION

Signed-off-by: Philip Balister <philip@balister.org>
---
 recipes-python/pyqt5/files/fix-sm.patch    | 17 ++++++++
 recipes-python/pyqt5/python-pyqt5_5.8.2.bb | 69 ++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)
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
index 0000000..3fa3d64
--- /dev/null
+++ b/recipes-python/pyqt5/python-pyqt5_5.8.2.bb
@@ -0,0 +1,69 @@
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
+    QT_VERSION=`${OE_QMAKE_QMAKE} -query QT_VERSION`
+    echo "[Qt $QT_VERSION]" >> pyqt.cfg
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


