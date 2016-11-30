Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 244BE71AA6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:04:18 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 2FA3AB81FA0; Wed, 30 Nov 2016 13:04:07 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:04:02 +0100
Message-Id: <1480507445-20746-14-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
Subject: [meta-networking][PATCH 14/17] samba: move /etc/sysconfig to more common /etc/default, package tmpfiles.d in samba-common
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
X-List-Received-Date: Wed, 30 Nov 2016 12:04:18 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 3f7d9ce..c2bbb97 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -100,7 +100,9 @@ do_install_append() {
 
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 packaging/systemd/*.service ${D}${systemd_system_unitdir}
-    sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_system_unitdir}/*.service
+    sed -e 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' \
+        -e 's,/etc/sysconfig/samba,${sysconfdir}/default/samba,' \
+        -i ${D}${systemd_system_unitdir}/*.service
 
     install -d ${D}${sysconfdir}/tmpfiles.d
     install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
@@ -124,8 +126,8 @@ do_install_append() {
     install -m644 packaging/LSB/smb.conf ${D}${sysconfdir}/samba/smb.conf
     install -D -m 644 ${WORKDIR}/volatiles.03_samba ${D}${sysconfdir}/default/volatiles/03_samba
 
-    install -d ${D}${sysconfdir}/sysconfig/
-    install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/sysconfig/samba
+    install -d ${D}${sysconfdir}/default
+    install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/default/samba
 
     rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
 }
@@ -177,7 +179,8 @@ FILES_${PN}-ctdb-tests = "${bindir}/ctdb_run_tests \
                          "
 
 FILES_${PN}-common = "${sysconfdir}/default \
-                      ${sysconfdir}/samba"
+                      ${sysconfdir}/samba \
+                      ${sysconfdir}/tmpfiles.d"
 
 FILES_${PN} += "${libdir}/vfs/*.so \
                 ${libdir}/charset/*.so \
-- 
2.7.4


