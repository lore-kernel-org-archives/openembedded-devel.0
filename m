Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Olv2b-0001zZ-6x
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 04:39:46 +0200
Received: by qyk8 with SMTP id 8so770553qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 19:39:13 -0700 (PDT)
Received: by 10.229.232.6 with SMTP id js6mr6769644qcb.7.1282185552933;
	Wed, 18 Aug 2010 19:39:12 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id q8sm1134077qcs.0.2010.08.18.19.39.11
	(version=SSLv3 cipher=RC4-MD5); Wed, 18 Aug 2010 19:39:12 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Aug 2010 21:39:10 -0500
Message-Id: <1282185550-3423-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] angstrom-version: install not mkdir
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
X-List-Received-Date: Thu, 19 Aug 2010 02:39:48 -0000

Thanks Steve Sakoman for finding this.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/angstrom/angstrom-version.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/angstrom/angstrom-version.bb b/recipes/angstrom/angstrom-version.bb
index a2f1335..7b167f1 100644
--- a/recipes/angstrom/angstrom-version.bb
+++ b/recipes/angstrom/angstrom-version.bb
@@ -1,7 +1,7 @@
 LICENSE = "MIT"
 
 PV = "${DISTRO_VERSION}"
-PR = "r4"
+PR = "r5"
 PE = "1"
 
 SRC_URI = "file://lsb_release"
@@ -14,7 +14,7 @@ export METADATA_BRANCH
 export TARGET_SYS
 
 do_install() {
-	mkdir -p ${D}${sysconfdir}
+	install -d ${D}${sysconfdir}
 	echo "Angstrom ${DISTRO_VERSION}" > ${D}${sysconfdir}/angstrom-version
 	echo "Built from branch: ${METADATA_BRANCH}" >> ${D}${sysconfdir}/angstrom-version
 	echo "Revision: ${METADATA_REVISION}" >> ${D}${sysconfdir}/angstrom-version
-- 
1.5.6.4



