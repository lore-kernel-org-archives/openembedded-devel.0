Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id B2A1F71A26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:04:07 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 0D4F3B80910; Wed, 30 Nov 2016 13:04:05 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:03:50 +0100
Message-Id: <1480507445-20746-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
Subject: [meta-networking][PATCH 02/17] samba: remove unneeded conditionals for sysvinit and systemd
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

systemd.bbclass takes care of deleting unused startup scripts.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index fd57505..0e3da56 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -137,7 +137,8 @@ FILES_${PN}-base = "${sbindir}/nmbd \
                     ${localstatedir}/lib/samba \
                     ${localstatedir}/nmbd \
                     ${localstatedir}/spool/samba \
-"
+                    ${systemd_unitdir}/system/nmb.service \
+                    ${systemd_unitdir}/system/smb.service"
 
 FILES_${PN}-ctdb-tests = "${bindir}/ctdb_run_tests \
                           ${libdir}/ctdb-tests \
@@ -260,13 +261,8 @@ FILES_libnss-winbind = "${libdir}/libnss_*${SOLIBS} \
 FILES_${PN} += "${base_libdir}/security/pam_smbpass.so \
 "
 
-SMB_SERVICE="${systemd_unitdir}/system/nmb.service ${systemd_unitdir}/system/smb.service"
-SMB_SYSV="${sysconfdir}/init.d ${sysconfdir}/rc?.d"
-FILES_${PN}-base +="${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${SMB_SERVICE}', '', d)}"
-FILES_${PN}-base +="${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${SMB_SYSV}', '', d)}"
-
-FILES_libwinbind = "${base_libdir}/security/pam_winbind.so"
-FILES_libwinbind += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_unitdir}/system/winbind.service', '', d)}"
+FILES_libwinbind = "${base_libdir}/security/pam_winbind.so \
+                    ${systemd_unitdir}/system/winbind.service"
 FILES_libwinbind-krb5-locator = "${libdir}/winbind_krb5_locator.so"
 
 FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.so \
-- 
2.7.4


