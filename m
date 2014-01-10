Return-Path: <stefan@herbrechtsmeier.net>
Received: from smarthost.TechFak.Uni-Bielefeld.DE
	(smarthost.TechFak.Uni-Bielefeld.DE [129.70.137.17])
	by mail.openembedded.org (Postfix) with ESMTP id 997876B5B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2014 12:45:54 +0000 (UTC)
Received: from astra.TechFak.Uni-Bielefeld.DE (astra.TechFak.Uni-Bielefeld.DE
	[129.70.144.65])
	(using TLSv1.1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: sherbrec)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id
	78FDC80011; Fri, 10 Jan 2014 13:45:48 +0100 (CET)
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jan 2014 13:45:43 +0100
Message-Id: <1389357943-16674-1-git-send-email-stefan@herbrechtsmeier.net>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] ntp: Fix the installed but not shipped issue of a systemd units file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jan 2014 12:45:55 -0000

We will get the following ERROR/WARN if we enable systemd and
the installed-vs-shipped check in QA:

ERROR: QA Issue: ntp: Files/directories were installed but not shipped
  /lib/systemd/ntp-units.d
  /lib/systemd/ntp-units.d/60-ntpd.list

Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
---
 meta-networking/recipes-support/ntp/ntp.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 9ea24e9..8381b9e 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -97,7 +97,9 @@ RCONFLICTS_ntpdate += "ntpdate-systemd"
 
 RSUGGESTS_${PN} = "iana-etc"
 
-FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${sbindir} ${libdir}"
+FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${sbindir} ${libdir} \
+    ${systemd_unitdir}/ntp-units.d/60-ntpd.list \
+"
 FILES_${PN}-tickadj = "${bindir}/tickadj"
 FILES_${PN}-utils = "${bindir}"
 FILES_ntpdate = "${bindir}/ntpdate \
-- 
1.7.9.5


