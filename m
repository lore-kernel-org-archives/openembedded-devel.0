Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id B8AC671A65
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:04:11 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 7499CB81FA3; Wed, 30 Nov 2016 13:04:06 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:03:55 +0100
Message-Id: <1480507445-20746-7-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
Subject: [meta-networking][PATCH 07/17] samba: install systemd units and initscripts unconditionally
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
X-List-Received-Date: Wed, 30 Nov 2016 12:04:13 -0000

Fixes hybrid systemd/sysvinit setups.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../recipes-connectivity/samba/samba_4.4.5.bb       | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index a9e7ccf..f2b6447 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -90,19 +90,18 @@ DISABLE_STATIC = ""
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 do_install_append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${systemd_system_unitdir}
-        install -m 0644 packaging/systemd/*.service ${D}${systemd_system_unitdir}
-        sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_system_unitdir}/*.service
-
-        install -d ${D}${sysconfdir}/tmpfiles.d
-        install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
-        echo "d ${localstatedir}/log/samba 0755 root root -" \
-            >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
-    elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d)}; then
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 packaging/systemd/*.service ${D}${systemd_system_unitdir}
+    sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_system_unitdir}/*.service
+
+    install -d ${D}${sysconfdir}/tmpfiles.d
+    install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
+    echo "d ${localstatedir}/log/samba 0755 root root -" \
+        >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
+    if ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d/samba
-    elif ${@bb.utils.contains('PACKAGECONFIG', 'sysv', 'true', 'false', d)}; then
+    else
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba
         sed -e 's,/opt/samba/bin,${sbindir},g' \
-- 
2.7.4


