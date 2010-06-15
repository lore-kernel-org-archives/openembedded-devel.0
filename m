Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OOakM-0002J8-4v
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 20:20:30 +0200
Received: from p5b035734.dip.t-dialin.net ([91.3.87.52] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OOafv-0004GT-L6 by authid <stefan@sostec.de> with cram_md5;
	Tue, 15 Jun 2010 20:15:59 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1OOafm-0001zW-Ro; Tue, 15 Jun 2010 20:15:42 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jun 2010 20:15:26 +0200
Message-Id: <1276625727-22991-4-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>
References: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH][STABLE 3/4] netcat_0.7.1: Gettext is needed
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
X-List-Received-Date: Tue, 15 Jun 2010 18:20:30 -0000

From: Stefan Schmidt <stefan@buglabs.net>


Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 recipes/netcat/netcat_0.7.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/netcat/netcat_0.7.1.bb b/recipes/netcat/netcat_0.7.1.bb
index 7c4dfc5..918460b 100644
--- a/recipes/netcat/netcat_0.7.1.bb
+++ b/recipes/netcat/netcat_0.7.1.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "GNU Netcat"
 HOMEPAGE = "http://netcat.sourceforge.net"
 SECTION = "console/network"
 LICENSE = "GPLv2"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
 
-inherit autotools update-alternatives
+inherit autotools update-alternatives gettext
 
 do_install_append() {
 	mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
-- 
1.7.1



