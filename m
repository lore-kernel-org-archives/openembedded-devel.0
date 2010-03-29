Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1NwIu2-0007pR-68
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 19:37:36 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id B3E973D45E; Mon, 29 Mar 2010 21:31:19 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Mar 2010 21:31:08 +0400
Message-Id: <1269883870-8204-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1269883870-8204-1-git-send-email-khimov@altell.ru>
References: <1269883870-8204-1-git-send-email-khimov@altell.ru>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] poptop: disable logwtmp in config
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
X-List-Received-Date: Mon, 29 Mar 2010 17:37:36 -0000

Poptop tries to use that and we have it removed since it's broken, no good.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/poptop/poptop_1.3.4.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/poptop/poptop_1.3.4.bb b/recipes/poptop/poptop_1.3.4.bb
index 370f6a3..a4508c4 100644
--- a/recipes/poptop/poptop_1.3.4.bb
+++ b/recipes/poptop/poptop_1.3.4.bb
@@ -8,7 +8,7 @@ SECTION = "network"
 LICENSE = "GPL"
 RDEPENDS_${PN} = "ppp"
 RDEPENDS_${PN}-logwtmp-plugin = "${PN}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/poptop/pptpd-${PV}.tar.gz \
            file://fix-plugins-install.patch;patch=1 \
@@ -26,7 +26,9 @@ do_install_append() {
         install -d ${D}${sbindir} ${D}/${sysconfdir} ${D}/${sysconfdir}/ppp
         install -m 0644 samples/options.pptpd ${D}/${sysconfdir}/ppp/
         install -m 0644 samples/pptpd.conf ${D}/${sysconfdir}/
+
         # broken
+	sed -ri "s,^[:space:]*logwtmp[:space:]*,# logwtmp," ${D}/${sysconfdir}/pptpd.conf
         rm -f ${D}${libdir}/pptpd/pptpd-logwtmp.so
 }
 
-- 
1.6.4.2



