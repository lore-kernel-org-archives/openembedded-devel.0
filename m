Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id B9D0C71A98
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:04:11 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 61635B81FA0; Wed, 30 Nov 2016 13:04:06 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:03:54 +0100
Message-Id: <1480507445-20746-6-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
Subject: [meta-networking][PATCH 06/17] samba: rename initscript from 'samba.sh' to more common 'samba'
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

This gets masked automatically by samba.service if systemd is running.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index af03086..a9e7ccf 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -33,7 +33,7 @@ DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libld
 SYSVINITTYPE_linuxstdbase = "lsb"
 SYSVINITTYPE = "sysv"
 
-INITSCRIPT_NAME = "samba.sh"
+INITSCRIPT_NAME = "samba"
 INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${SYSVINITTYPE}', '', d)} \
@@ -101,15 +101,15 @@ do_install_append() {
             >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
     elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
-        install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d
+        install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d/samba
     elif ${@bb.utils.contains('PACKAGECONFIG', 'sysv', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
-        install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba.sh
+        install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba
         sed -e 's,/opt/samba/bin,${sbindir},g' \
             -e 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \
             -e 's,/opt/samba/log,${localstatedir}/log/samba,g' \
-            -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba.sh,g' \
-            -i ${D}${sysconfdir}/init.d/samba.sh
+            -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba,g' \
+            -i ${D}${sysconfdir}/init.d/samba
     fi
 
     install -d ${D}${sysconfdir}/samba
-- 
2.7.4


