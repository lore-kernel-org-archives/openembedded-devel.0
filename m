Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 585 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 23 Mar 2015 17:02:00 UTC
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8442A6AC36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2015 17:02:00 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Mar 2015 17:52:12 +0100
Message-Id: <1427129532-26245-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] samba: move daemons into their own package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Mar 2015 17:02:00 -0000

Create a package samba-base, which contains everything
needed to just run the daemons (nmbd, smbd).

Excerpt from buildhistory (mips32):

-87280  KiB samba
+13968  KiB samba-base

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-connectivity/samba/samba-basic.inc | 18 +++++++++++++++++-
 meta-oe/recipes-connectivity/samba/samba.inc       | 12 ++++++------
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe/recipes-connectivity/samba/samba-basic.inc
index e9f891f..9393c2c 100644
--- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
+++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
@@ -9,7 +9,22 @@ EXTRA_OECONF += "\
         --without-ldap \
         --without-krb5"
 
-PACKAGES =+ "libwbclient libwinbind libwinbind-dbg libnss-winbind winbind winbind-dbg libnetapi libtdb libsmbsharemodes libsmbclient libsmbclient-dev cifs cifs-doc swat"
+PACKAGES =+ "libwbclient libwinbind libwinbind-dbg libnss-winbind winbind winbind-dbg \
+             libnetapi libtdb libtevent libsmbsharemodes libsmbclient libsmbclient-dev \
+             cifs cifs-doc swat ${PN}-base"
+
+RDEPENDS_${PN} += "${PN}-base"
+
+FILES_${PN}-base = "${sbindir}/nmbd \
+                    ${sbindir}/smbd \
+                    ${sysconfdir}/default \
+                    ${sysconfdir}/samba \
+                    ${sysconfdir}/init.d/samba \
+                    ${localstatedir}/lib/samba \
+                    ${localstatedir}/log/samba \
+                    ${localstatedir}/nmbd \
+                    ${localstatedir}/spool/samba \
+"
 
 FILES_winbind-dbg = "${libdir}/idmap/.debug/*.so \
                      ${libdir}/security/.debug/pam_winbind.so \
@@ -32,6 +47,7 @@ FILES_libwbclient = "${libdir}/libwbclient.so.*"
 FILES_libnetapi = "${libdir}/libnetapi.so.*"
 FILES_libsmbsharemodes = "${libdir}/libsmbsharemodes.so.*"
 FILES_libtdb = "${libdir}/libtdb.so.*"
+FILES_libtevent = "${libdir}/libtevent.so.*"
 FILES_cifs = "${base_sbindir}/mount.cifs ${base_sbindir}/umount.cifs"
 FILES_cifs-doc = "${mandir}/man8/mount.cifs.8 ${mandir}/man8/umount.cifs.8"
 FILES_libsmbclient = "${libdir}/libsmbclient.so.*"
diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index abfd5ca..30acaf6 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -24,8 +24,8 @@ S = "${WORKDIR}/samba-${PV}/source"
 
 inherit autotools-brokensep update-rc.d systemd
 
-SYSTEMD_PACKAGES = "${PN} winbind"
-SYSTEMD_SERVICE_${PN} = "nmb.service smb.service"
+SYSTEMD_PACKAGES = "${PN}-base winbind"
+SYSTEMD_SERVICE_${PN}-base = "nmb.service smb.service"
 SYSTEMD_SERVICE_winbind = "winbind.service"
 SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 SYSTEMD_AUTO_ENABLE_winbind = "disable"
@@ -63,14 +63,14 @@ PACKAGECONFIG[talloc] = "--enable-external-libtalloc --with-libtalloc, --disable
 PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_valgrind_h=yes ac_cv_header_valgrind_memcheck_h=yes, \
                            ac_cv_header_valgrind_valgrind_h=no ac_cv_header_valgrind_memcheck_h=no, valgrind"
 
-INITSCRIPT_PACKAGES = "samba winbind"
-INITSCRIPT_NAME_samba = "samba"
+INITSCRIPT_PACKAGES = "${PN}-base winbind"
+INITSCRIPT_NAME_${PN}-base = "samba"
 INITSCRIPT_NAME_winbind = "winbind"
 # No dependencies, goes in at level 20 (NOTE: take care with the
 # level, later levels put the shutdown later too - see the links
 # in rc6.d, the shutdown must precede network shutdown).
 INITSCRIPT_PARAMS = "defaults"
-CONFFILES_${PN} = "${sysconfdir}/samba/smb.conf"
+CONFFILES_${PN}-base = "${sysconfdir}/samba/smb.conf"
 
 do_configure_prepend () {
     ./script/mkversion.sh
@@ -143,7 +143,7 @@ do_install_append() {
 }
 
 DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-systemctl-native', '', d)}"
-pkg_postinst_${PN} () {
+pkg_postinst_${PN}-base () {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd sysvinit', 'true', 'false', d)}; then
         if [ -n "$D" ]; then
             OPTS="--root=$D"
-- 
1.9.1


