Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.11928.1599653056374198928
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 05:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=M6wZIwW3;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=884; q=dns/txt; s=axis-central1;
  t=1599653056; x=1631189056;
  h=from:to:subject:date:message-id:mime-version;
  bh=ZdeM20KILbe/L9xS5eDd02V9pc0UcfjozWGgXzMQXdM=;
  b=M6wZIwW3+3GUGnvaSZJvTqsKj/HPjA4haHaJ9rnwlWhXPOsENHXB0XjD
   MiM9Iorp1+S+/NyZbo4wFwOFXErSlzCyG58HgtSjPcixRxqTlaORv06KZ
   gzXx6gkC5ZBsc5yds7Uq/yqaugCQQ4DWm3Lu4b0StgVie7lBSaY/A319g
   GqIbiCe/tmZwGyVb8n7XblZAGsquL2oWlDDE9FBfPNcvg4lL0XXZklo6P
   o/C7EcjGvYqyg5SZbvTpDr5ZfXK0+cEa7r6NH0bqQ+XdAh6IJXm8f6fdf
   0TRH8r6gQiuefSIWaIkdBy7BFQPrKE2Bon2aqL57hDAEtmbLCy0PO/sk2
   A==;
IronPort-SDR: GgBEH20MR/zoQv6wGLQnhOtKRrdTw4DQ0Iek2JX4GbknBxXUuQdLdSMiXzxZnQvNbjYFSAYIVL
 jhJwwTMwRqC7rVSvmVKCISKC/2ir4gTdY5Zv6LgnjtKHesp0OEc1zUtrZb3HcFs7Li08oIx4Nv
 6eKq+tYyTGt8ieezazm2VPp0gaqvtR/CrepZcgag1zDSydLGRDgsCnvc9FyHUDvtYVpwbPiIec
 SPFt9R0qsEzvfYMBJobJgYN+FUfUUR478acpimG1yq4ttNsQVmVq4Ek/3b6Vi1x05cNXoDFBIH
 t9M=
X-IronPort-AV: E=Sophos;i="5.76,409,1592863200"; 
   d="scan'208";a="12715961"
From: "Ola x Nilsson" <ola.x.nilsson@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] syslog-ng: Drop obsolete variable ONLINE_PACKAGE_MANAGEMENT
Date: Wed, 9 Sep 2020 14:04:13 +0200
Message-ID: <20200909120413.1095-1-olani@axis.com>
X-Mailer: git-send-email 2.11.0
Return-Path: olani@axis.com
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index ff6d9d26a..2b38f4d69 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -131,10 +131,6 @@ RDEPENDS_${PN} += "${PN}-libs"
 
 CONFFILES_${PN} = "${sysconfdir}/${BPN}.conf ${sysconfdir}/scl.conf"
 
-# syslog initscript is handled explicitly because order of
-# update-rc.d and update-alternatives is important
-RDEPENDS_${PN} += " ${@oe.utils.conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
-
 RCONFLICTS_${PN} = "busybox-syslog sysklogd rsyslog"
 RCONFLICTS_${PN}-libs = "busybox-syslog sysklogd rsyslog"
 
-- 
2.11.0

