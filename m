Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9348871A26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:04:10 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 4B96DB81F9D; Wed, 30 Nov 2016 13:04:06 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:03:53 +0100
Message-Id: <1480507445-20746-5-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
Subject: [meta-networking][PATCH 05/17] samba: install all systemd unit files
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

This includes samba.service, which other major distributions install, too.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index e9f082f..af03086 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -92,9 +92,7 @@ LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-g
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_system_unitdir}
-        for i in nmb smb winbind; do
-            install -m 0644 packaging/systemd/$i.service ${D}${systemd_system_unitdir}
-        done
+        install -m 0644 packaging/systemd/*.service ${D}${systemd_system_unitdir}
         sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_system_unitdir}/*.service
 
         install -d ${D}${sysconfdir}/tmpfiles.d
@@ -138,6 +136,7 @@ FILES_${PN}-base = "${sbindir}/nmbd \
                     ${localstatedir}/nmbd \
                     ${localstatedir}/spool/samba \
                     ${systemd_system_unitdir}/nmb.service \
+                    ${systemd_system_unitdir}/samba.service \
                     ${systemd_system_unitdir}/smb.service"
 
 FILES_${PN}-ctdb-tests = "${bindir}/ctdb_run_tests \
-- 
2.7.4


