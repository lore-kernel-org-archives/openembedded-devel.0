Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1NwIu3-0007pQ-OU
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 19:37:37 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id C3FC03D45D; Mon, 29 Mar 2010 21:31:20 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Mar 2010 21:31:10 +0400
Message-Id: <1269883870-8204-4-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1269883870-8204-3-git-send-email-khimov@altell.ru>
References: <1269883870-8204-1-git-send-email-khimov@altell.ru>
	<1269883870-8204-2-git-send-email-khimov@altell.ru>
	<1269883870-8204-3-git-send-email-khimov@altell.ru>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/4] poptop: don't expose open port by default, listen on 127.0.0.1
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
X-List-Received-Date: Mon, 29 Mar 2010 17:37:37 -0000

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/poptop/poptop_1.3.4.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/poptop/poptop_1.3.4.bb b/recipes/poptop/poptop_1.3.4.bb
index be1379a..8d9b60d 100644
--- a/recipes/poptop/poptop_1.3.4.bb
+++ b/recipes/poptop/poptop_1.3.4.bb
@@ -8,7 +8,7 @@ SECTION = "network"
 LICENSE = "GPL"
 RDEPENDS_${PN} = "ppp"
 RDEPENDS_${PN}-logwtmp-plugin = "${PN}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/poptop/pptpd-${PV}.tar.gz \
            file://fix-plugins-install.patch;patch=1 \
@@ -32,6 +32,8 @@ do_install_append() {
         rm -f ${D}${libdir}/pptpd/pptpd-logwtmp.so
 	# Use mppe option in OE style
 	sed -ri "s,^[[:space:]]*require-mppe-128[[:space:]]*$,mppe required,no40,no56," ${D}/${sysconfdir}/ppp/options.pptpd
+	echo "# don't expose open port by default" >> ${D}/${sysconfdir}/pptpd.conf
+	echo "listen  127.0.0.1" >> ${D}/${sysconfdir}/pptpd.conf
 }
 
 PACKAGES = "${PN}-dbg ${PN}-bcrelay ${PN} ${PN}-doc"
-- 
1.6.4.2



