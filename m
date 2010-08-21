Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1OmqYE-0007xl-F0
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 18:04:11 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 0FF2223EFA; Sat, 21 Aug 2010 20:03:47 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Aug 2010 20:03:46 +0400
Message-Id: <1282406626-13837-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] clamav: allow clamav-data installation
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
X-List-Received-Date: Sat, 21 Aug 2010 16:04:11 -0000

It wasn't possible to install prepackaged clamav-data with the way it's
been packaged. And there are situations where you want to have at least
prepackaged AV databases before you could do any sort of update. Also,
logically freshclam doesn't substitute clamav-data, but rather complements
it.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/clamav/clamav.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/clamav/clamav.inc b/recipes/clamav/clamav.inc
index ade8491..2cd9fa8 100644
--- a/recipes/clamav/clamav.inc
+++ b/recipes/clamav/clamav.inc
@@ -16,9 +16,8 @@ RDEPENDS_${PN}-daemon = "${PN}-data ${PN}-conf"
 RDEPENDS_${PN}-freshclam = "${PN}-conf"
 RRECOMMENDS_${PN} = "${PN}-freshclam"
 RRECOMMENDS_${PN}-daemon = "${PN}-freshclam"
-RPROVIDES_${PN}-freshclam = "${PN}-data"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/clamav/clamav-${PV}.tar.gz;name=clamav-${PV} \
           file://clamav-daemon.init \
-- 
1.6.4.2



