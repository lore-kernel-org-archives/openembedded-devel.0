Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7EB7841C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 06:51:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8E6psGV022236
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 23:51:54 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 13 Sep 2017 23:51:53 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Sep 2017 02:51:52 -0400
Message-ID: <1505371912-190862-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] apache2: add a configure file for sysvinit
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
X-List-Received-Date: Thu, 14 Sep 2017 06:51:53 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb | 18 +++++++++++++++++-
 .../recipes-httpd/apache2/files/volatiles.04_apache2   |  3 +++
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
index f053e37..333e2dc 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
@@ -20,6 +20,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://init \
            file://apache2-volatile.conf \
            file://apache2.service \
+           file://volatiles.04_apache2 \
           "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
@@ -58,9 +59,13 @@ EXTRA_OECONF = "--enable-ssl \
     ac_cv_have_threadsafe_pollset=no"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
+PACKAGECONFIG[selinux] = "--enable-selinux --enable-layout=Debian --prefix=${base_prefix}/,--disable-selinux,libselinux,libselinux"
 PACKAGECONFIG[openldap] = "--enable-ldap --enable-authnz-ldap,--disable-ldap --disable-authnz-ldap,openldap"
 
+do_configure_prepend() {
+        sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libdir}/cgi-bin:g' ${S}/config.layout
+}
+
 do_install_append() {
     install -d ${D}/${sysconfdir}/init.d
     cat ${WORKDIR}/init | \
@@ -90,6 +95,9 @@ do_install_append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d/
         install -m 0644 ${WORKDIR}/apache2-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        install -m 0644 ${WORKDIR}/volatiles.04_apache2 ${D}${sysconfdir}/default/volatiles/04_apache2
     fi
 
     install -d ${D}${systemd_unitdir}/system
@@ -107,6 +115,7 @@ do_install_append_class-target() {
 
     sed -i -e 's,${STAGING_DIR_HOST},,g' \
            -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/build/config.nice
+    rm -rf ${D}${localstatedir}/run
 }
 
 SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
@@ -180,3 +189,10 @@ FILES_${PN}-dbg += "${libdir}/${BPN}/modules/.debug"
 RDEPENDS_${PN} += "openssl libgcc"
 RDEPENDS_${PN}-scripts += "perl ${PN}"
 RDEPENDS_${PN}-dev = "perl"
+
+FILES_${PN} += "${libdir}/cgi-bin"
+
+#Disable parallel make install
+PARALLEL_MAKEINST = ""
+
+FILES_${PN} += "${datadir}/${BPN}/"
diff --git a/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2 b/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
new file mode 100644
index 0000000..922075b
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
@@ -0,0 +1,3 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d root root 0755 /var/run/apache2 none
+d root root 0755 /var/log/apache2 none
-- 
2.8.1


