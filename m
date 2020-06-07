Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.7307.1591536029142419926
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2020 06:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 057DKRN3024253
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 7 Jun 2020 06:20:28 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Sun, 7 Jun 2020 06:20:12 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] lvm2: remove service template from SYSTEMD_SERVICE
Date: Sun, 7 Jun 2020 21:20:08 +0800
Message-ID: <20200607132008.7829-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Remove systemd service template lvm2-pvscan@.service from
SYSTEMD_SERVICE. It should be started/stopped in udev rules file
69-dm-lvm-metad.rules.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb
index e2b551bbc..bc86810ec 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb
@@ -32,7 +32,7 @@ PACKAGE_BEFORE_PN = "${PN}-scripts ${PN}-udevrules"
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'dmeventd', 'lvm2-monitor.service dm-event.socket dm-event.service', '', d)} \
-                         blk-availability.service lvm2-pvscan@.service"
+                         blk-availability.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
@@ -52,7 +52,11 @@ FILES_libdevmapper = " \
     ${sbindir}/dmstats \
 "
 
-FILES_${PN} += "${libdir}/device-mapper/*.so"
+FILES_${PN} += " \
+    ${libdir}/device-mapper/*.so \
+    ${systemd_system_unitdir}/lvm2-pvscan@.service \
+"
+
 FILES_${PN}-scripts = " \
     ${sbindir}/blkdeactivate \
     ${sbindir}/fsadm \
-- 
2.17.1

