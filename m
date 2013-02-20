Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U7zqY-0008Dy-F2
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 03:55:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1K2dco0000743
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2013 18:39:39 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 19 Feb 2013 18:39:38 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Feb 2013 21:09:34 -0600
Message-ID: <1361329774-27984-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH meta-webserver] apache2: correct header file location
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
X-List-Received-Date: Wed, 20 Feb 2013 02:55:57 -0000
Content-Type: text/plain

From: Pradeep Tumati <pradeep.tumati@windriver.com>

Apache header files are being placed in ../usr/include/lib32-apache2
under the sysroot where as lib32-modphp looks for ../usr/include/apache2
directory. This fix ensures that apache2 header files are placed
in the ../usr/include/apache2/ directory.

Signed-off-by: Pradeep Tumati <pradeep.tumati@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 recipes-httpd/apache2/apache2_2.4.2.bb | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/recipes-httpd/apache2/apache2_2.4.2.bb b/recipes-httpd/apache2/apache2_2.4.2.bb
index af7840d..af8c4ca 100644
--- a/recipes-httpd/apache2/apache2_2.4.2.bb
+++ b/recipes-httpd/apache2/apache2_2.4.2.bb
@@ -41,13 +41,13 @@ EXTRA_OECONF = "--enable-ssl \
 		--enable-rewrite \
 		--with-dbm=sdbm \
 		--with-berkeley-db=no \
-		--localstatedir=/var/${PN} \
+		--localstatedir=/var/${BPN} \
 		--with-gdbm=no \
 		--with-ndbm=no \
-		--includedir=${includedir}/${PN} \
-		--datadir=${datadir}/${PN} \
-		--sysconfdir=${sysconfdir}/${PN} \
-                --libexecdir=${libdir}/${PN}/modules \
+		--includedir=${includedir}/${BPN} \
+		--datadir=${datadir}/${BPN} \
+		--sysconfdir=${sysconfdir}/${BPN} \
+                --libexecdir=${libdir}/${BPN}/modules \
 		ap_cv_void_ptr_lt_long=no \
 		--enable-mpms-shared \
 		ac_cv_have_threadsafe_pollset=no"
@@ -68,19 +68,19 @@ do_install_append() {
 		    -e 's,/usr/bin/,${bindir}/,g' \
 		    -e 's,/usr/lib,${libdir}/,g' \
 		    -e 's,/etc/,${sysconfdir}/,g' \
-		    -e 's,/usr/,${prefix}/,g' > ${D}/${sysconfdir}/init.d/${PN}
-	chmod 755 ${D}/${sysconfdir}/init.d/${PN}
+		    -e 's,/usr/,${prefix}/,g' > ${D}/${sysconfdir}/init.d/${BPN}
+	chmod 755 ${D}/${sysconfdir}/init.d/${BPN}
 	# remove the goofy original files...
-	rm -rf ${D}/${sysconfdir}/${PN}/original
+	rm -rf ${D}/${sysconfdir}/${BPN}/original
 	# Expat should be found in the staging area via DEPENDS...
 	rm -f ${D}/${libdir}/libexpat.*
 
-	install -d ${D}${sysconfdir}/${PN}/conf.d
-	install -d ${D}${sysconfdir}/${PN}/modules.d
+	install -d ${D}${sysconfdir}/${BPN}/conf.d
+	install -d ${D}${sysconfdir}/${BPN}/modules.d
 
 	# Ensure configuration file pulls in conf.d and modules.d
-	printf "\nIncludeOptional ${sysconfdir}/${PN}/conf.d/*.conf" >> ${D}/${sysconfdir}/${PN}/httpd.conf
-	printf "\nIncludeOptional ${sysconfdir}/${PN}/modules.d/*.conf\n\n" >> ${D}/${sysconfdir}/${PN}/httpd.conf
+	printf "\nIncludeOptional ${sysconfdir}/${BPN}/conf.d/*.conf" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
+	printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.conf\n\n" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
 }
 
 SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
@@ -88,12 +88,12 @@ SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
 apache_sysroot_preprocess () {
 	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 	install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-	sed -i 's!my $installbuilddir = .*!my $installbuilddir = "${STAGING_DIR_HOST}/${datadir}/${PN}/build";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
+	sed -i 's!my $installbuilddir = .*!my $installbuilddir = "${STAGING_DIR_HOST}/${datadir}/${BPN}/build";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
 	sed -i 's!my $libtool = .*!my $libtool = "${STAGING_BINDIR_CROSS}/${TARGET_PREFIX}libtool";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
 
-	sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
-	sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
-	sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${datadir}/${PN}/build/config_vars.mk
+	sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
+	sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
+	sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
 }
 
 #
-- 
1.8.1.2.545.g2f19ada



