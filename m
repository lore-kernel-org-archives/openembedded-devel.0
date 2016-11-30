Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id CC19071A87
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 11:59:06 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 111C6B81614; Wed, 30 Nov 2016 12:59:04 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 12:59:04 +0100
Message-Id: <1480507144-19034-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] krb5: create Debian-like package structure
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
X-List-Received-Date: Wed, 30 Nov 2016 11:59:08 -0000

Split libraries and plugins into their own packages. Create packages
for admin-server, kdc, user and examples. Remove some unneeded binaries.

Enable daemons on boot.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb | 101 ++++++++++++++++++++---
 1 file changed, 89 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
index 06f7f90..656a02f 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
@@ -17,7 +17,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=c6f37efad53b098e420f45e7ab6807dc"
 DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native"
 
-inherit autotools-brokensep binconfig perlnative systemd
+inherit autotools-brokensep binconfig perlnative systemd update-rc.d
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
@@ -36,9 +36,6 @@ SRC_URI[sha256sum] = "9c0a46b8918237a53916370d2e02298c2b294f55f0351f9404e18930bc
 
 S = "${WORKDIR}/${BP}/src"
 
-SYSTEMD_SERVICE_${PN} = "krb5-admin-server.service krb5-kdc.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-
 PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[openssl] = "--with-pkinit-crypto-impl=openssl,,openssl"
@@ -54,13 +51,6 @@ CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regc
 CFLAGS_append = " -fPIC -DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
 LDFLAGS_append = " -pthread"
 
-FILES_${PN} += "${datadir}/gnats"
-FILES_${PN}-doc += "${datadir}/examples"
-FILES_${PN}-dbg += "${libdir}/krb5/plugins/*/.debug"
-
-# As this recipe doesn't inherit update-rc.d, we need to add this dependency here
-RDEPENDS_${PN}_class-target += "initscripts-functions"
-
 do_configure() {
     gnu-configize --force
     autoreconf
@@ -69,6 +59,13 @@ do_configure() {
 
 do_install_append() {
     rm -rf ${D}/${localstatedir}/run
+    rm -f ${D}${bindir}/sclient
+    rm -f ${D}${bindir}/sim_client
+    rm -f ${D}${bindir}/uuclient
+    rm -f ${D}${sbindir}/krb5-send-pr
+    rm -f ${D}${sbindir}/sim_server
+    rm -f ${D}${sbindir}/sserver
+    rm -f ${D}${sbindir}/uuserver
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         mkdir -p ${D}/${sysconfdir}/init.d ${D}/${sysconfdir}/default
@@ -90,7 +87,87 @@ do_install_append() {
     fi
 }
 
-pkg_postinst_${PN} () {
+PACKAGES =+ "${PN}-admin-server \
+             ${PN}-gss-samples \
+             ${PN}-k5tls \
+             ${PN}-kdc \
+             ${PN}-kdc-ldap \
+             ${PN}-kpropd \
+             ${PN}-otp \
+             ${PN}-pkinit \
+             ${PN}-user \
+             libgssapi-krb5 \
+             libgssrpc \
+             libk5crypto \
+             libkadm5clnt-mit \
+             libkadm5srv-mit \
+             libkdb5 \
+             libkrad \
+             libkrb5 \
+             libkrb5support \
+             libverto"
+
+FILES_${PN} = ""
+FILES_${PN}-doc += "${datadir}/examples"
+FILES_${PN}-dbg += "${libdir}/krb5/plugins/*/.debug"
+
+FILES_${PN}-admin-server = "${sbindir}/kadmin.local \
+                            ${sbindir}/kadmind \
+                            ${sbindir}/kprop \
+                            ${sysconfdir}/default/krb5-admin-server \
+                            ${sysconfdir}/init.d/krb5-admin-server \
+                            ${systemd_system_unitdir}/krb5-admin-server.service"
+
+FILES_${PN}-gss-samples = "${bindir}/gss-client \
+                           ${sbindir}/gss-server"
+
+FILES_${PN}-k5tls = "${libdir}/krb5/plugins/tls/k5tls.so"
+
+FILES_${PN}-kdc = "${libdir}/krb5/plugins/kdb/db2.so \
+                   ${localstatedir}/krb5kdc \
+                   ${sbindir}/kdb5_util \
+                   ${sbindir}/kproplog \
+                   ${sbindir}/krb5kdc \
+                   ${sysconfdir}/default/krb5-kdc \
+                   ${sysconfdir}/default/volatiles/87_krb5 \
+                   ${sysconfdir}/init.d/krb5-kdc \
+                   ${sysconfdir}/tmpfiles.d/krb5.conf \
+                   ${systemd_system_unitdir}/krb5-kdc.service"
+
+FILES_${PN}-kdc-ldap = "${libdir}/krb5/libkdb_ldap${SOLIBS} \
+                        ${libdir}/krb5/plugins/kdb/kldap.so \
+                        ${sbindir}/kdb5_ldap_util"
+
+FILES_${PN}-kpropd = "${sbindir}/kpropd"
+FILES_${PN}-otp = "${libdir}/krb5/plugins/preauth/otp.so"
+FILES_${PN}-pkinit = "${libdir}/krb5/plugins/preauth/pkinit.so"
+FILES_${PN}-user = "${bindir}/k*"
+
+FILES_libgssapi-krb5 = "${libdir}/libgssapi_krb5${SOLIBS}"
+FILES_libgssrpc = "${libdir}/libgssrpc${SOLIBS}"
+FILES_libk5crypto = "${libdir}/libk5crypto${SOLIBS}"
+FILES_libkadm5clnt-mit = "${libdir}/libkadm5clnt_mit${SOLIBS}"
+FILES_libkadm5srv-mit = "${libdir}/libkadm5srv_mit${SOLIBS}"
+FILES_libkdb5 = "${libdir}/libkdb5${SOLIBS}"
+FILES_libkrad = "${libdir}/libkrad${SOLIBS}"
+FILES_libkrb5 = "${libdir}/libkrb5${SOLIBS} \
+                 ${libdir}/krb5/plugins/authdata \
+                 ${libdir}/krb5/plugins/libkrb5"
+FILES_libkrb5support = "${libdir}/libkrb5support${SOLIBS}"
+FILES_libverto = "${libdir}/libverto${SOLIBS}"
+
+RDEPENDS_${PN}-kadmin-server = "${PN}-kdc"
+RDEPENDS_${PN}-kpropd = "${PN}-kdc"
+
+INITSCRIPT_PACKAGES = "${PN}-admin-server ${PN}-kdc"
+INITSCRIPT_NAME_${PN}-admin-server = "krb5-admin-server"
+INITSCRIPT_NAME_${PN}-kdc = "krb5-kdc"
+
+SYSTEMD_PACKAGES = "${PN}-admin-server ${PN}-kdc"
+SYSTEMD_SERVICE_${PN}-admin-server = "krb5-admin-server.service"
+SYSTEMD_SERVICE_${PN}-kdc = "krb5-kdc.service"
+
+pkg_postinst_${PN}-kdc () {
     if [ -z "$D" ]; then
         if command -v systemd-tmpfiles >/dev/null; then
             systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/krb5.conf
-- 
2.7.4


