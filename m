Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5F33B71A26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:04:09 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 24F16B81F65; Wed, 30 Nov 2016 13:04:06 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:03:51 +0100
Message-Id: <1480507445-20746-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
Subject: [meta-networking][PATCH 03/17] samba: use systemd_system_unitdir variable
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
X-List-Received-Date: Wed, 30 Nov 2016 12:04:09 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 0e3da56..57eba0f 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -91,11 +91,11 @@ LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-g
 
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${systemd_unitdir}/system
+        install -d ${D}${systemd_system_unitdir}
         for i in nmb smb winbind; do
-            install -m 0644 packaging/systemd/$i.service ${D}${systemd_unitdir}/system
+            install -m 0644 packaging/systemd/$i.service ${D}${systemd_system_unitdir}
         done
-        sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_unitdir}/system/*.service
+        sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_system_unitdir}/*.service
 
         install -d ${D}${sysconfdir}/tmpfiles.d
         install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
@@ -137,8 +137,8 @@ FILES_${PN}-base = "${sbindir}/nmbd \
                     ${localstatedir}/lib/samba \
                     ${localstatedir}/nmbd \
                     ${localstatedir}/spool/samba \
-                    ${systemd_unitdir}/system/nmb.service \
-                    ${systemd_unitdir}/system/smb.service"
+                    ${systemd_system_unitdir}/nmb.service \
+                    ${systemd_system_unitdir}/smb.service"
 
 FILES_${PN}-ctdb-tests = "${bindir}/ctdb_run_tests \
                           ${libdir}/ctdb-tests \
@@ -251,8 +251,7 @@ FILES_winbind = "${sbindir}/winbindd \
                  ${bindir}/wbinfo \
                  ${bindir}/ntlm_auth \
                  ${sysconfdir}/init.d/winbind \
-                 ${systemd_unitdir}/system/winbind.service \
-"
+                 ${systemd_system_unitdir}/winbind.service"
 
 FILES_libnss-winbind = "${libdir}/libnss_*${SOLIBS} \
                         ${libdir}/nss_info \
@@ -262,7 +261,7 @@ FILES_${PN} += "${base_libdir}/security/pam_smbpass.so \
 "
 
 FILES_libwinbind = "${base_libdir}/security/pam_winbind.so \
-                    ${systemd_unitdir}/system/winbind.service"
+                    ${systemd_system_unitdir}/winbind.service"
 FILES_libwinbind-krb5-locator = "${libdir}/winbind_krb5_locator.so"
 
 FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.so \
-- 
2.7.4


