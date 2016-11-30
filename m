Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6AFB471A65
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:04:09 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id D90E2B80C33; Wed, 30 Nov 2016 13:04:05 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:03:49 +0100
Message-Id: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH 01/17] samba: use default packaging rules for -dbg and -dev packages
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
X-List-Received-Date: Wed, 30 Nov 2016 12:04:10 -0000

There's no need to create multiple packages.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../recipes-connectivity/samba/samba_4.4.5.bb      | 33 ++--------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index e9694d4..fd57505 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -125,9 +125,9 @@ do_install_append() {
     rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
 }
 
-PACKAGES =+ "${PN}-python ${PN}-python-dbg ${PN}-pidl libwinbind libwinbind-dbg libwinbind-krb5-locator"
-PACKAGES =+ "libwbclient libnss-winbind winbind winbind-dbg libnetapi libsmbsharemodes \
-             libsmbclient libsmbclient-dev lib${PN}-base ${PN}-base ${PN}-ctdb-tests"
+PACKAGES =+ "${PN}-python ${PN}-pidl libwinbind libwinbind-krb5-locator"
+PACKAGES =+ "libwbclient libnss-winbind winbind libnetapi libsmbsharemodes \
+             libsmbclient lib${PN}-base ${PN}-base ${PN}-ctdb-tests"
 
 RDEPENDS_${PN} += "${PN}-base"
 
@@ -235,10 +235,6 @@ FILES_lib${PN}-base = "\
                     ${libdir}/samba/pdb/wbc_sam.so \
 "
 
-FILES_winbind-dbg = "${libdir}/idmap/.debug/*.so \
-                     ${libdir}/security/.debug/pam_winbind.so \
-"
-
 FILES_${PN} += "${libdir}/vfs/*.so \
                 ${libdir}/charset/*.so \
                 ${libdir}/*.dat \
@@ -246,17 +242,10 @@ FILES_${PN} += "${libdir}/vfs/*.so \
                 ${libdir}/security/pam_smbpass.so \
 "
 
-FILES_${PN}-dbg += "${libdir}/vfs/.debug/*.so \
-                    ${libdir}/charset/.debug/*.so \
-                    ${libdir}/auth/.debug/*.so \
-                    ${libdir}/security/.debug/pam_smbpass.so \
-"
-
 FILES_libwbclient = "${libdir}/libwbclient.so.* ${libdir}/samba/libwinbind-client.so"
 FILES_libnetapi = "${libdir}/libnetapi.so.*"
 FILES_libsmbsharemodes = "${libdir}/libsmbsharemodes.so.*"
 FILES_libsmbclient = "${libdir}/libsmbclient.so.*"
-FILES_libsmbclient-dev = "${libdir}/libsmbclient.so ${includedir}"
 FILES_winbind = "${sbindir}/winbindd \
                  ${bindir}/wbinfo \
                  ${bindir}/ntlm_auth \
@@ -276,18 +265,8 @@ SMB_SYSV="${sysconfdir}/init.d ${sysconfdir}/rc?.d"
 FILES_${PN}-base +="${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${SMB_SERVICE}', '', d)}"
 FILES_${PN}-base +="${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${SMB_SYSV}', '', d)}"
 
-FILES_${PN}-dbg += "${libdir}/samba/idmap/.debug/* \
-                    ${libdir}/samba/pdb/.debug/* \
-                    ${libdir}/samba/auth/.debug/* \
-                    ${libdir}/samba/nss_info/.debug/* \
-                    ${libdir}/samba/ldb/.debug/* \
-                    ${libdir}/samba/vfs/.debug/* \
-                    ${base_libdir}/security/.debug/pam_smbpass.so \
-"
-
 FILES_libwinbind = "${base_libdir}/security/pam_winbind.so"
 FILES_libwinbind += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_unitdir}/system/winbind.service', '', d)}"
-FILES_libwinbind-dbg = "${base_libdir}/security/.debug/pam_winbind.so"
 FILES_libwinbind-krb5-locator = "${libdir}/winbind_krb5_locator.so"
 
 FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.so \
@@ -308,11 +287,5 @@ FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.so \
                       ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/web_server/* \
 "
 
-FILES_${PN}-python-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug/* \
-                          ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/.debug/* \
-                          ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/samba3/.debug/* \
-                          ${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/dcerpc/.debug/* \
-"
-
 RDEPENDS_${PN}-pidl_append = " perl"
 FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
-- 
2.7.4


