Received: from dent.vctlabs.com (dent.vctlabs.com [207.154.65.135])
 by mx.groups.io with SMTP id smtpd.web10.7541.1611914399417614776
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 01:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: vctlabs.com, ip: 207.154.65.135, mailfrom: sjl@vctlabs.com)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id A29DD28039C; Fri, 29 Jan 2021 02:03:59 -0800 (PST)
Date: Fri, 29 Jan 2021 02:03:59 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] sip3: simplify recipe
Message-ID: <20210129100359.vwoop7ksfrvfpmlb@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The custom configure block can be shared between target
and native if you just configure the sysroot option accordingly
and use STAGING_INCDIR to locate the python headers to build
against.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
index 320755b84..ae8df5055 100644
--- a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
+++ b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
@@ -19,24 +19,17 @@ PACKAGES += "python3-sip3"
 
 BBCLASSEXTEND = "native"
 
-do_configure_prepend_class-target() {
-    echo "py_platform = linux" > sip.cfg
-    echo "py_inc_dir = %(sysroot)/${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
-    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
-    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
-    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
-    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
-}
+CONFIGURE_SYSROOT = "${STAGING_DIR_HOST}"
+CONFIGURE_SYSROOT_class-native = "${STAGING_DIR_NATIVE}"
 
-do_configure_prepend_class-native() {
+do_configure_prepend() {
     echo "py_platform = linux" > sip.cfg
-    echo "py_inc_dir = ${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
+    echo "py_inc_dir = ${STAGING_INCDIR}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
     echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
     echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
     echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
     echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot=${STAGING_DIR_NATIVE}
+    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${CONFIGURE_SYSROOT} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
 }
 
 do_install() {
-- 
2.20.1
