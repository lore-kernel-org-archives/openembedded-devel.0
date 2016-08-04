Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 73769760AD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Aug 2016 07:54:31 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id u747sUQo014325
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Aug 2016 09:54:30 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.77.234])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id u747sUlX030798;
	Thu, 4 Aug 2016 09:54:30 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Aug 2016 09:54:19 +0200
Message-Id: <1470297259-25322-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-networking][PATCH] ntp: make ntp and alternative for ntpd
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
X-List-Received-Date: Thu, 04 Aug 2016 07:54:32 -0000

This way ntp can be used as an alternative to ntpd from busybox

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
index ff4ba64..63e7d60 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
@@ -125,7 +125,7 @@ RCONFLICTS_ntpdate += "ntpdate-systemd"
 
 RSUGGESTS_${PN} = "iana-etc"
 
-FILES_${PN} = "${sbindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${libdir} \
+FILES_${PN} = "${sbindir}/ntpd.ntp ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${libdir} \
     ${NTP_USER_HOME} \
     ${systemd_unitdir}/ntp-units.d/60-ntpd.list ${libexecdir}\
 "
@@ -158,3 +158,9 @@ pkg_postinst_ntpdate() {
     fi
 }
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "ntpd"
+ALTERNATIVE_LINK_NAME[ntpd] = "${sbindir}/ntpd"
-- 
2.1.4


