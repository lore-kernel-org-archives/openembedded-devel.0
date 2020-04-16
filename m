Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.2837.1587005221778146091
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2020 19:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=fHrDAx4w;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3115; q=dns/txt; s=axis-central1;
  t=1587005222; x=1618541222;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GLmlHJKmWW/wBAOtZUReIR+61vRg29d5BQfaSICLr/U=;
  b=fHrDAx4wzkQ3XyJqLF+uhkO7zy7RDfX8HHr1Gfqw+7rei/mWU6bnXGZ1
   ZyUDinhUB1JQy7vUHfcVos/HYH02XBh5Man11cOz55d/d1e+ujQnS8YX6
   bNFzPW3eMVEsiYk1aKs70zLpsHEzj3BxzKwxgO0FSXytSinV4mMaOyAlG
   2CUM4PM1FXI5/swMw6u6y/WCUm5bijtPH39YccEbxyCj3cLXhYn26J9jd
   AoId0F3150ufczEhOROIVUwNRqNEC9wiBx8FlraaUPktOZFeuxRkvdDUx
   ERMp3bwHGYen+5Pxd3tWFABSkisFYl1A9fiKD3ukcXjdOwCUZ5cTZW+IL
   g==;
IronPort-SDR: aAVncXMZJ4zgLC9CuBId4cU2rPK3csVq5kRN/NACa7nSlcvAqzOkKC6LQFwttZzEodZezOv02u
 w5H5K9ahBVGZwuwMmAjUy5r1JQdHJEIr5Bw8A0M5aus7SYu8MeMbzKni8Xrodqu50K3IcWAERp
 GTyd84/cQBSj4iS0icb5Jm6+fhjFUXPG1L4mYoRirCgjnxKukKDabDOjHpMio5Awcq30V5vuPQ
 th77t7HNd4VbNGRAxIsSe98u4Go6FVrEPGvkcTFNKXAbJX3h4MkCPNJENEbVcvOXo4RPPQ+JYu
 SPE=
X-IronPort-AV: E=Sophos;i="5.72,388,1580770800"; 
   d="scan'208";a="7675419"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] syslog-ng: Don't install configuration files as executable
Date: Thu, 16 Apr 2020 04:46:56 +0200
Message-ID: <20200416024656.3797-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Also remove unnecessary slashes before ${sysconfdir} and
${localstatedir}.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-support/syslog-ng/syslog-ng.inc   | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 8e5368953..ff6d9d26a 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -73,26 +73,26 @@ do_configure_prepend() {
 }
 
 do_install_append() {
-    install -d ${D}/${sysconfdir}/${BPN}
-    install -d ${D}/${sysconfdir}/init.d
-    install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog
+    install -d ${D}${sysconfdir}/${BPN}
+    install -d ${D}${sysconfdir}/init.d
+    install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog
 
-    install -d ${D}/${sysconfdir}/default/volatiles/
-    install -m 755 ${WORKDIR}/volatiles.03_syslog-ng ${D}/${sysconfdir}/default/volatiles/03_syslog-ng
-    install -d ${D}/${sysconfdir}/tmpfiles.d/
-    install -m 755 ${WORKDIR}/syslog-ng-tmp.conf ${D}/${sysconfdir}/tmpfiles.d/syslog-ng.conf
+    install -d ${D}${sysconfdir}/default/volatiles/
+    install -m 644 ${WORKDIR}/volatiles.03_syslog-ng ${D}${sysconfdir}/default/volatiles/03_syslog-ng
+    install -d ${D}${sysconfdir}/tmpfiles.d/
+    install -m 644 ${WORKDIR}/syslog-ng-tmp.conf ${D}${sysconfdir}/tmpfiles.d/syslog-ng.conf
 
-    install -d ${D}/${localstatedir}/lib/${BPN}
+    install -d ${D}${localstatedir}/lib/${BPN}
     # Remove /var/run as it is created on startup
     rm -rf ${D}${localstatedir}/run
 
     # support for systemd
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install ${WORKDIR}/syslog-ng.conf.systemd ${D}${sysconfdir}/${BPN}/${BPN}.conf
+        install -m 644 ${WORKDIR}/syslog-ng.conf.systemd ${D}${sysconfdir}/${BPN}/${BPN}.conf
 
         install -d ${D}${systemd_unitdir}/system/
-        install -m 0644 ${S}/contrib/systemd/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@.service
-        install -m 0644 ${S}/contrib/systemd/${BPN}@default ${D}${sysconfdir}/default/${BPN}@default
+        install -m 644 ${S}/contrib/systemd/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@.service
+        install -m 644 ${S}/contrib/systemd/${BPN}@default ${D}${sysconfdir}/default/${BPN}@default
 
         sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
         sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
@@ -101,7 +101,7 @@ do_install_append() {
         install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
         ln -sf ../${BPN}@.service ${D}${systemd_unitdir}/system/multi-user.target.wants/${BPN}@default.service
     else
-        install ${WORKDIR}/syslog-ng.conf.sysvinit ${D}${sysconfdir}/${BPN}/${BPN}.conf
+        install -m 644 ${WORKDIR}/syslog-ng.conf.sysvinit ${D}${sysconfdir}/${BPN}/${BPN}.conf
     fi
 
     oe_multilib_header syslog-ng/syslog-ng-config.h
-- 
2.21.1

