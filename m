Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OlFiC-0006SX-2d
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 08:31:53 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OlFho-0002iu-Il from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 23:31:28 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 17 Aug 2010 08:31:27 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 12:29:41 +0600
Message-Id: <1282026581-14776-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 17 Aug 2010 06:31:27.0244 (UTC)
	FILETIME=[D21A04C0:01CB3DD5]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,URI_NOVOWEL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sgmlspl-native: convert to new style staging, remove do_stage()
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
X-List-Received-Date: Tue, 17 Aug 2010 06:31:53 -0000

* Remove do_stage() from the recipe. The cpan_do_install () replaces the do_stage () of the recipe.
* Bump PR to "r1"

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/sgmlspl/sgmlspl-native_1.03ii.bb |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/recipes/sgmlspl/sgmlspl-native_1.03ii.bb b/recipes/sgmlspl/sgmlspl-native_1.03ii.bb
index 36bb366..0a4cd12 100644
--- a/recipes/sgmlspl/sgmlspl-native_1.03ii.bb
+++ b/recipes/sgmlspl/sgmlspl-native_1.03ii.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "A simple post-processor for SGMLS and NSGMLS"
 HOMEPAGE = "http://search.cpan.org/src/DMEGG/SGMLSpm-1.03ii/DOC/HTML/SGMLSpm/sgmlspm.html"
 SECTION = "libs"
 LICENSE = "GPL"
+PR = "r1"
 
 SRC_URI = "http://www.cpan.org/authors/id/D/DM/DMEGG/SGMLSpm-${PV}.tar.gz \
           file://combined.patch"
@@ -10,14 +11,6 @@ S = "${WORKDIR}/SGMLSpm"
 
 inherit native cpan
 
-do_install() {
-  :
-}
-
-do_stage() {
-  oe_runmake install_vendor
-}
-
 PACKAGES = "${PN}-dbg  "
 
 SRC_URI[md5sum] = "5bcb197fd42e67d51c739b1414d514a7"
-- 
1.6.3.3



