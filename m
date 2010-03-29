Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1NwIu2-0007pO-6E
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 19:37:36 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 4CBAA3D460; Mon, 29 Mar 2010 21:31:19 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Mar 2010 21:31:07 +0400
Message-Id: <1269883870-8204-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/4] poptop: remove version 1.3.0
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

Release dated 2005 and the recipe in unmaintained, 1.3.4 recipe is alsmost
completely different now. So, I see no point in keeping it around.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/poptop/poptop_1.3.0.bb |   35 -----------------------------------
 1 files changed, 0 insertions(+), 35 deletions(-)
 delete mode 100644 recipes/poptop/poptop_1.3.0.bb

diff --git a/recipes/poptop/poptop_1.3.0.bb b/recipes/poptop/poptop_1.3.0.bb
deleted file mode 100644
index da7ebe6..0000000
--- a/recipes/poptop/poptop_1.3.0.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Poptop is the PPTP server solution for Linux \
-Using Poptop, Linux servers can now function seamlessly in a PPTP VPN environment. \
-This enables administrators to leverage the considerable benefits of both Microsoft and Linux operating systems \
-The current release version supports Windows 95/98/Me/NT/2000/XP PPTP clients and Linux PPTP clients \
-For more info visit http://www.poptop.org/"
-
-HOMEPAGE    = "http://www.poptop.org/"
-LICENSE     = "GPL"
-SECTION = "network"
-PRIORITY    = "optional"
-DEPENDS     = "ppp"
-RDEPENDS    = "ppp"
-
-PR = "r0"
-
-inherit autotools
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/poptop/pptpd-${PV}.tar.gz"
-S = "${WORKDIR}/pptpd-${PV}"
-
-
-
-do_install() {
-	install -d ${D}${sbindir}
-	install -d ${D}/${sysconfdir}
-	install -d ${D}/${sysconfdir}/ppp/
-
-	install -m 0755  pptpd         ${D}${sbindir}/
-	install -m 0755  pptpctrl      ${D}${sbindir}/
-	install -m 0644 samples/options.pptpd ${D}/${sysconfdir}/ppp/
-	install -m 0644 samples/pptpd.conf    ${D}/${sysconfdir}/
-
-
-}
-
-- 
1.6.4.2



