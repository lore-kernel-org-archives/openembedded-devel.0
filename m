Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 7A5076B07E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 08:59:58 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id xB58xwGw028028
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Dec 2019 09:59:58 +0100
Received: from dev.vm6.ccp.siemens.com ([139.22.45.206])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id xB58xwX4021292;
	Thu, 5 Dec 2019 09:59:58 +0100
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 2C005220E8D;
	Thu,  5 Dec 2019 09:59:57 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Dec 2019 09:59:51 +0100
Message-Id: <20191205085951.28302-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking][PATCH] ntp: split ntpdc into separate package
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
X-List-Received-Date: Thu, 05 Dec 2019 08:59:59 -0000

A ntpdc is a special NTP query program. It shouldn't be part of ntp-utils
which is depending on perl.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb
index 9b327ba2f..e950fabe3 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb
@@ -105,7 +105,7 @@ do_install_append() {
     rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
 }
 
-PACKAGES += "ntpdate sntp ntpq ${PN}-tickadj ${PN}-utils"
+PACKAGES += "ntpdate sntp ntpdc ntpq ${PN}-tickadj ${PN}-utils"
 # NOTE: you don't need ntpdate, use "ntpd -q -g -x"
 
 # ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
@@ -117,8 +117,8 @@ RDEPENDS_${PN} += "libgcc"
 RPROVIDES_${PN}-utils = "${PN}-bin"
 RREPLACES_${PN}-utils = "${PN}-bin"
 RCONFLICTS_${PN}-utils = "${PN}-bin"
-# ntpq was split out of ntp-utils
-RDEPENDS_${PN}-utils = "ntpq"
+# ntpdc and ntpq were split out of ntp-utils
+RDEPENDS_${PN}-utils = "ntpdc ntpq"
 
 SYSTEMD_PACKAGES = "${PN} ntpdate sntp"
 SYSTEMD_SERVICE_${PN} = "ntpd.service"
@@ -153,6 +153,7 @@ FILES_sntp = "${sbindir}/sntp \
               ${sysconfdir}/default/sntp \
               ${systemd_unitdir}/system/sntp.service \
              "
+FILES_ntpdc = "${sbindir}/ntpdc"
 FILES_ntpq = "${sbindir}/ntpq"
 
 CONFFILES_${PN} = "${sysconfdir}/ntp.conf"
-- 
2.11.0


