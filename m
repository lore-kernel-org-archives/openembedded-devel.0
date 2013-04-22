Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UUESb-0006dL-Kb
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Apr 2013 12:59:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2013 03:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,525,1363158000"; d="scan'208";a="322213366"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.204])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2013 03:41:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Apr 2013 11:40:42 +0100
Message-Id: <1366627242-26105-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: "Song.Li" <Song.Li@windriver.com>,
	Randy MacLeod <Randy.MacLeod@windriver.com>
Subject: [meta-webserver][PATCH] apache2: fix multilib builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Apr 2013 10:59:22 -0000

Change PN -> BPN in a number of places so that files are stored in the
correct location and packaged correctly.

Based on a patch by Song.Li <Song.Li@windriver.com> with additional
PN -> BPN replacements.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-httpd/apache2/apache2_2.4.3.bb         |   67 ++++++++++----------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb
index a7f3586..5589f1f 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb
@@ -38,13 +38,13 @@ EXTRA_OECONF = "--enable-ssl \
     --enable-rewrite \
     --with-dbm=sdbm \
     --with-berkeley-db=no \
-    --localstatedir=/var/${PN} \
+    --localstatedir=/var/${BPN} \
     --with-gdbm=no \
     --with-ndbm=no \
-    --includedir=${includedir}/${PN} \
-    --datadir=${datadir}/${PN} \
-    --sysconfdir=${sysconfdir}/${PN} \
-    --libexecdir=${libdir}/${PN}/modules \
+    --includedir=${includedir}/${BPN} \
+    --datadir=${datadir}/${BPN} \
+    --sysconfdir=${sysconfdir}/${BPN} \
+    --libexecdir=${libdir}/${BPN}/modules \
     ap_cv_void_ptr_lt_long=no \
     --enable-mpms-shared \
     ac_cv_have_threadsafe_pollset=no"
@@ -65,19 +65,19 @@ do_install_append() {
             -e 's,/usr/bin/,${bindir}/,g' \
             -e 's,/usr/lib,${libdir}/,g' \
             -e 's,/etc/,${sysconfdir}/,g' \
-            -e 's,/usr/,${prefix}/,g' > ${D}/${sysconfdir}/init.d/${PN}
-    chmod 755 ${D}/${sysconfdir}/init.d/${PN}
+            -e 's,/usr/,${prefix}/,g' > ${D}/${sysconfdir}/init.d/${BPN}
+    chmod 755 ${D}/${sysconfdir}/init.d/${BPN}
     # remove the goofy original files...
-    rm -rf ${D}/${sysconfdir}/${PN}/original
+    rm -rf ${D}/${sysconfdir}/${BPN}/original
     # Expat should be found in the staging area via DEPENDS...
     rm -f ${D}/${libdir}/libexpat.*
 
-    install -d ${D}${sysconfdir}/${PN}/conf.d
-    install -d ${D}${sysconfdir}/${PN}/modules.d
+    install -d ${D}${sysconfdir}/${BPN}/conf.d
+    install -d ${D}${sysconfdir}/${BPN}/modules.d
 
     # Ensure configuration file pulls in conf.d and modules.d
-    printf "\nIncludeOptional ${sysconfdir}/${PN}/conf.d/*.conf" >> ${D}/${sysconfdir}/${PN}/httpd.conf
-    printf "\nIncludeOptional ${sysconfdir}/${PN}/modules.d/*.conf\n\n" >> ${D}/${sysconfdir}/${PN}/httpd.conf
+    printf "\nIncludeOptional ${sysconfdir}/${BPN}/conf.d/*.conf" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
+    printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.conf\n\n" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
 }
 
 SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
@@ -85,12 +85,12 @@ SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
 apache_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
     install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    sed -i 's!my $installbuilddir = .*!my $installbuilddir = "${STAGING_DIR_HOST}/${datadir}/${PN}/build";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
+    sed -i 's!my $installbuilddir = .*!my $installbuilddir = "${STAGING_DIR_HOST}/${datadir}/${BPN}/build";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
     sed -i 's!my $libtool = .*!my $libtool = "${STAGING_BINDIR_CROSS}/${TARGET_PREFIX}libtool";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
 
-    sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
-    sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
-    sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
+    sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
+    sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
+    sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
 }
 
 #
@@ -102,40 +102,39 @@ LEAD_SONAME = "libapr-1.so.0"
 
 PACKAGES = "${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
 
-CONFFILES_${PN} = "${sysconfdir}/${PN}/httpd.conf \
-    ${sysconfdir}/${PN}/magic \
-    ${sysconfdir}/${PN}/mime.types \
-    ${sysconfdir}/init.d/${PN} "
+CONFFILES_${PN} = "${sysconfdir}/${BPN}/httpd.conf \
+                   ${sysconfdir}/${BPN}/magic \
+                   ${sysconfdir}/${BPN}/mime.types \
+                   ${sysconfdir}/init.d/${BPN} "
 
 # we override here rather than append so that .so links are
 # included in the runtime package rather than here (-dev)
 # and to get build, icons, error into the -dev package
-FILES_${PN}-dev = "${datadir}/${PN}/build \
-    ${datadir}/${PN}/icons \
-    ${datadir}/${PN}/error \
-    ${bindir}/apr-config ${bindir}/apu-config \
-    ${libdir}/apr*.exp \
-    ${includedir}/${PN} \
-    ${libdir}/*.la \
-    ${libdir}/*.a"
+FILES_${PN}-dev = "${datadir}/${BPN}/build \
+                   ${datadir}/${BPN}/icons \
+                   ${datadir}/${BPN}/error \
+                   ${bindir}/apr-config ${bindir}/apu-config \
+                   ${libdir}/apr*.exp \
+                   ${includedir}/${BPN} \
+                   ${libdir}/*.la \
+                   ${libdir}/*.a"
 
 # manual to manual
-FILES_${PN}-doc += " ${datadir}/${PN}/manual"
+FILES_${PN}-doc += " ${datadir}/${BPN}/manual"
 
 #
 # override this too - here is the default, less datadir
 #
 FILES_${PN} =  "${bindir} ${sbindir} ${libexecdir} ${libdir}/lib*.so.* ${sysconfdir} \
-    ${sharedstatedir} ${localstatedir} /bin /sbin /lib/*.so* \
-    ${libdir}/${PN}"
+                ${sharedstatedir} ${localstatedir} /bin /sbin /lib/*.so* \
+                ${libdir}/${BPN}"
 
 # we want htdocs and cgi-bin to go with the binary
-FILES_${PN} += "${datadir}/${PN}/htdocs ${datadir}/${PN}/cgi-bin"
+FILES_${PN} += "${datadir}/${BPN}/htdocs ${datadir}/${BPN}/cgi-bin"
 
 #make sure the lone .so links also get wrapped in the base package
 FILES_${PN} += "${libdir}/lib*.so ${libdir}/pkgconfig/*"
 
-FILES_${PN}-dbg += "${libdir}/${PN}/modules/.debug"
+FILES_${PN}-dbg += "${libdir}/${BPN}/modules/.debug"
 
 RDEPENDS_${PN} += "openssl libgcc"
-
-- 
1.7.10.4



