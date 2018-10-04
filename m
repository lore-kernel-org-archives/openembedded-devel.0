Return-Path: <philip.balister@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8892E79A02
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2018 16:43:35 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id q40-v6so10626820qte.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2018 09:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vpo6DQqnhYjzITjGKgYMrYvpLrxGxNQikP/ZEb5HGXQ=;
	b=mzVxBLGVIX5lJAvKOC87xgrN6VfBho9JPCS5BTWcbY+Y90jguXNJ9PGv0LF6//BHcp
	iLLYNEKm6fSUVtAmAVLA2IE0zgcHSBsR87J4oIfXO1xH1Jwuk9NEvjJjhphEGa2CQZIu
	JUZWkDI9QCAYJ9zsz++Pr6UJWqKlj+AMGFn7Ku+a1wdfeTUPkDWLxV0elEwRMoWHvo0R
	3V7j5AYupPbNgBXyxNo7wn4hl+O5Rvgctiw7ld1dzO/n/q8MLmDk/yEVS4uKu+ZKo/Q9
	6zY1WS0urC2wcdQeuL0qjJHpjdtF9fW34MbN1Q90cytcdRxJrjSFZbzhW6l7722K8nyl
	Gp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=vpo6DQqnhYjzITjGKgYMrYvpLrxGxNQikP/ZEb5HGXQ=;
	b=mg8NY/9M15WnHS4b0iBhFJcpSvYqZ3C60wRrP+A5RNiqzIr7URJfh4n+pnHp5H7VrN
	5l5kjxZFDqnlEy96323E4w9zFcpKV/ao/iuITqIw1WSpU/kq8iIF2ubBqE6J68dUDrIl
	8OE5KpZN6VQaORFJu8+29gL16WcFqVRYL4zxikX473q/FzA7GATpAAAKuWZQXiaHHFx1
	wsEsqcXqij+XhQWUYaQR/GLb2T6gAcR3UHX7XpFI9AutZ7rJHZyhEfaZslAyIXU1MO6A
	iJInCc/0bL38h6m0KDq/QKRATCIPaevAP1MCy3Nv7D+iYpr9y76F8NWnoeoFN/xKtC+L
	kCKw==
X-Gm-Message-State: ABuFfogsF5tJBNCQ95iYW1/JI3yvnb7HmwSgBaIIddanb0FOa2KqdIuv
	F0RN3LHLRUDccX9aDwmpeRHSp/L3
X-Google-Smtp-Source: ACcGV61zjZSZeBWUA5k5uD7eUezCwCA5WnYhOMm3KVXBJbAoyR4wuVYaEbetSDSSmcrBMsfSs293QQ==
X-Received: by 2002:a0c:9c42:: with SMTP id
	w2-v6mr6075432qve.194.1538671415702; 
	Thu, 04 Oct 2018 09:43:35 -0700 (PDT)
Received: from prague.hsd1.va.comcast.net
	([2601:5c0:c100:b84:c110:9e9e:8241:dfa])
	by smtp.gmail.com with ESMTPSA id
	28-v6sm2917277qtq.74.2018.10.04.09.43.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Oct 2018 09:43:34 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Oct 2018 12:43:23 -0400
Message-Id: <20181004164323.31079-2-philip@balister.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20181004164323.31079-1-philip@balister.org>
References: <20181004164323.31079-1-philip@balister.org>
Subject: [meta-oe][PATCH 2/2] sip: Add python3 version of the sip recipe.
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
X-List-Received-Date: Thu, 04 Oct 2018 16:43:35 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-devtools/sip/sip.inc         | 36 ++++++++++++++++++++++++++++
 meta-oe/recipes-devtools/sip/sip3_4.19.13.bb | 11 +++++++++
 meta-oe/recipes-devtools/sip/sip_4.19.13.bb  | 36 ++--------------------------
 3 files changed, 49 insertions(+), 34 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/sip/sip.inc
 create mode 100644 meta-oe/recipes-devtools/sip/sip3_4.19.13.bb

diff --git a/meta-oe/recipes-devtools/sip/sip.inc b/meta-oe/recipes-devtools/sip/sip.inc
new file mode 100644
index 000000000..d0795454e
--- /dev/null
+++ b/meta-oe/recipes-devtools/sip/sip.inc
@@ -0,0 +1,36 @@
+SUMMARY = "SIP is a C++/Python Wrapper Generator"
+HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
+SECTION = "devel"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz \
+          "
+SRC_URI[md5sum] = "9124cb8978742685747a5415179a9890"                           
+SRC_URI[sha256sum] = "e353a7056599bf5fbd5d3ff9842a6ab2ea3cf4e0304a0f925ec5862907c0d15e"
+
+S = "${WORKDIR}/sip-${PV}"
+
+BBCLASSEXTEND = "native"
+
+do_configure_prepend_class-target() {
+    echo "py_platform = linux" > sip.cfg
+    echo "py_inc_dir = %(sysroot)/${includedir}/python${PYTHON_BASEVERSION}${PYTHON_ABI}" >> sip.cfg
+    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
+    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
+    echo "sip_module_dir = ${D}/${libdir}/python${PYTHON_BASEVERSION}${PYTHON_ABI}/site-packages" >> sip.cfg
+    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
+    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
+}
+do_configure_prepend_class-native() {
+    echo "py_platform = linux" > sip.cfg
+    echo "py_inc_dir = ${includedir}/python${PYTHON_BASEVERSION}${PYTHON_ABI}" >> sip.cfg
+    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
+    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
+    echo "sip_module_dir = ${D}/${libdir}/python${PYTHON_BASEVERSION}${PYTHON_ABI}/site-packages" >> sip.cfg
+    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
+    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot=${STAGING_DIR_NATIVE}
+}
+do_install() {
+    oe_runmake install
+}
diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.13.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.13.bb
new file mode 100644
index 000000000..dc15bc2e2
--- /dev/null
+++ b/meta-oe/recipes-devtools/sip/sip3_4.19.13.bb
@@ -0,0 +1,11 @@
+require sip.inc
+
+DEPENDS = "python3"
+
+inherit python3-dir python3native
+
+PACKAGES += "python3-sip3"
+
+FILES_python3-sip3 = "${libdir}/${PYTHON_DIR}${PYTHON_ABI}/site-packages/"
+FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}${PYTHON_ABI}/site-packages/.debug"
+
diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.13.bb b/meta-oe/recipes-devtools/sip/sip_4.19.13.bb
index 09f15d421..3da15b842 100644
--- a/meta-oe/recipes-devtools/sip/sip_4.19.13.bb
+++ b/meta-oe/recipes-devtools/sip/sip_4.19.13.bb
@@ -1,43 +1,11 @@
-SUMMARY = "SIP is a C++/Python Wrapper Generator"
-HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
-SECTION = "devel"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
+require sip.inc
 
 DEPENDS = "python"
 
 inherit python-dir pythonnative
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz \
-          "
-SRC_URI[md5sum] = "9124cb8978742685747a5415179a9890"                           
-SRC_URI[sha256sum] = "e353a7056599bf5fbd5d3ff9842a6ab2ea3cf4e0304a0f925ec5862907c0d15e"
-
-BBCLASSEXTEND = "native"
-
 PACKAGES += "python-sip"
 
-do_configure_prepend_class-target() {
-    echo "py_platform = linux" > sip.cfg
-    echo "py_inc_dir = %(sysroot)/${includedir}/python%(py_major).%(py_minor)" >> sip.cfg
-    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
-    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
-    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
-    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    python configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
-}
-do_configure_prepend_class-native() {
-    echo "py_platform = linux" > sip.cfg
-    echo "py_inc_dir = ${includedir}/python%(py_major).%(py_minor)" >> sip.cfg
-    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
-    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
-    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
-    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    python configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot=${STAGING_DIR_NATIVE}
-}
-do_install() {
-    oe_runmake install
-}
-
 FILES_python-sip = "${libdir}/${PYTHON_DIR}/site-packages/"
 FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
+
-- 
2.13.6


