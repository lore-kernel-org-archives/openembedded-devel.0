Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1NxQi8-0004qE-Ka
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 22:09:53 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 1B2C923C49; Fri,  2 Apr 2010 00:03:36 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Apr 2010 00:03:34 +0400
Message-Id: <1270152215-17642-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] gd: add gd-ft recipe
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
X-List-Received-Date: Thu, 01 Apr 2010 20:09:53 -0000

GD with Freetype support, this kind of setup is needed for some
packages like sarg. If needed, choose with

PREFERRED_PROVIDER_gd = "gd-ft"

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb

diff --git a/recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb b/recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb
new file mode 100644
index 0000000..174bbe6
--- /dev/null
+++ b/recipes/gd/gd-ft_2.0.35+2.0.36rc1.bb
@@ -0,0 +1,8 @@
+include gd_${PV}.bb
+
+DEPENDS += "freetype"
+
+PROVIDES = "gd"
+RPROVIDES_${PN} = "gd"
+
+EXTRA_OECONF += "--with-freetype"
\ No newline at end of file
-- 
1.6.4.2



