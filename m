Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Om5Lj-0006yR-6c
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 15:40:10 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Om5LN-0000ll-UC from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 06:39:46 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 19 Aug 2010 15:39:43 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Aug 2010 19:37:34 +0600
Message-Id: <1282225054-23762-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 19 Aug 2010 13:39:43.0930 (UTC)
	FILETIME=[FB58A1A0:01CB3FA3]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] tzcode-native.inc: Converted new style staging, remove do_datge()
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Aug 2010 13:40:10 -0000

* Converted do_stage to do_install
* Converted ${STAGING_BINDIR_NATIVE} to ${D}${bindir}
* Set NATIVE_INSTALL_WORKS = "1"
* Bumped PR to "r4"
* Removed tab with 8 spaces in SRC_URI

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/tzcode/tzcode-native.inc |   20 +++++++++-----------
 1 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/recipes/tzcode/tzcode-native.inc b/recipes/tzcode/tzcode-native.inc
index a3a16da..78ddec5 100644
--- a/recipes/tzcode/tzcode-native.inc
+++ b/recipes/tzcode/tzcode-native.inc
@@ -1,22 +1,20 @@
 DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-INC_PR = "r3"
+INC_PR = "r4"
 
 SRC_URI = " \
-	ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode-${PV} \
-	ftp://elsie.nci.nih.gov/pub/tzdata${TZDATA_PV}.tar.gz;name=tzdata-${TZDATA_PV} \
+        ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode-${PV} \
+        ftp://elsie.nci.nih.gov/pub/tzdata${TZDATA_PV}.tar.gz;name=tzdata-${TZDATA_PV} \
 	"
 
 S = "${WORKDIR}"
 
 inherit native
 
-do_stage () {
-        install -d ${STAGING_BINDIR_NATIVE}
-        install -m 755 zic ${STAGING_BINDIR_NATIVE}/
-        install -m 755 zdump ${STAGING_BINDIR_NATIVE}/
-        install -m 755 tzselect ${STAGING_BINDIR_NATIVE}/
-}
-
 do_install () {
-        :
+        install -d ${D}${bindir}
+        install -m 755 zic ${D}${bindir}/
+        install -m 755 zdump ${D}${bindir}/
+        install -m 755 tzselect ${D}${bindir}/
 }
+
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



