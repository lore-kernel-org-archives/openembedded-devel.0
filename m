Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.1701.1592424780999177928
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 13:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34286 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jleQY-0003o3-A9; Wed, 17 Jun 2020 23:12:56 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 1/2] sip3: Consolidate in a single file
Date: Wed, 17 Jun 2020 23:12:46 +0300
Message-Id: <20200617201247.14206-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.7
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Consolidate inc and bb files into a single bb file.
Fix the broken link for HOMEPAGE.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-devtools/sip/sip.inc         | 36 -----------------
 meta-oe/recipes-devtools/sip/sip3_4.19.19.bb | 42 ++++++++++++++++++--
 2 files changed, 39 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/sip/sip.inc

diff --git a/meta-oe/recipes-devtools/sip/sip.inc b/meta-oe/recipes-devtools/sip/sip.inc
deleted file mode 100644
index d8e32a768..000000000
--- a/meta-oe/recipes-devtools/sip/sip.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "SIP is a C++/Python Wrapper Generator"
-HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
-SECTION = "devel"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
-
-SRC_URI = "https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz \
-"
-SRC_URI[md5sum] = "98111479309dc472410f26080d6d4a88"
-SRC_URI[sha256sum] = "5436b61a78f48c7e8078e93a6b59453ad33780f80c644e5f3af39f94be1ede44"
-
-S = "${WORKDIR}/sip-${PV}"
-
-BBCLASSEXTEND = "native"
-
-do_configure_prepend_class-target() {
-    echo "py_platform = linux" > sip.cfg
-    echo "py_inc_dir = %(sysroot)/${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
-    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
-    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
-    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
-    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
-}
-do_configure_prepend_class-native() {
-    echo "py_platform = linux" > sip.cfg
-    echo "py_inc_dir = ${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
-    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
-    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
-    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
-    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot=${STAGING_DIR_NATIVE}
-}
-do_install() {
-    oe_runmake install
-}
diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
index 010fa30fe..e6a4653b5 100644
--- a/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
+++ b/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
@@ -1,11 +1,47 @@
-require sip.inc
+SUMMARY = "SIP is a C++/Python Wrapper Generator"
+HOMEPAGE = "https://riverbankcomputing.com/software/sip/"
+SECTION = "devel"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 
-DEPENDS = "python3"
+SRC_URI = "https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz \
+"
+SRC_URI[md5sum] = "98111479309dc472410f26080d6d4a88"
+SRC_URI[sha256sum] = "5436b61a78f48c7e8078e93a6b59453ad33780f80c644e5f3af39f94be1ede44"
 
 inherit python3-dir python3native
 
+S = "${WORKDIR}/sip-${PV}"
+
+DEPENDS = "python3"
+
 PACKAGES += "python3-sip3"
 
+BBCLASSEXTEND = "native"
+
+do_configure_prepend_class-target() {
+    echo "py_platform = linux" > sip.cfg
+    echo "py_inc_dir = %(sysroot)/${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
+    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
+    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
+    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
+    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
+    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
+}
+
+do_configure_prepend_class-native() {
+    echo "py_platform = linux" > sip.cfg
+    echo "py_inc_dir = ${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
+    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
+    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
+    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
+    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
+    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot=${STAGING_DIR_NATIVE}
+}
+
+do_install() {
+    oe_runmake install
+}
+
 FILES_python3-sip3 = "${libdir}/${PYTHON_DIR}/site-packages/"
 FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
-
-- 
2.17.1

