Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PPJNL-0003Cc-Eq
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 19:31:59 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 8DB671B40D;
	Sun,  5 Dec 2010 19:31:52 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 19:30:30 +0100
Message-Id: <1291573830-11505-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] pwlib_1.6.6.4: fixed SRC_URI
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
X-List-Received-Date: Sun, 05 Dec 2010 18:31:59 -0000


Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 recipes/pwlib/pwlib_1.6.6.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/pwlib/pwlib_1.6.6.4.bb b/recipes/pwlib/pwlib_1.6.6.4.bb
index f92cd60..40ce884 100644
--- a/recipes/pwlib/pwlib_1.6.6.4.bb
+++ b/recipes/pwlib/pwlib_1.6.6.4.bb
@@ -13,7 +13,7 @@ HOMEPAGE="http://www.openh323.org/docs/PWLib/"
 DESCRIPTION="Portable Text and GUI C/C++ Class Libarary."
 LICENSE = "GPL"
 
-SRC_URI="${DEBIAN_MIRROR}/main/p/${PN}/${PN}_${PV}.orig.tar.gz"
+SRC_URI="http://ftp.iinet.net.au/debian/debian-backports-woody/dists/woody/pwlib/source/pwlib_${PV}.orig.tar.gz"
 SRC_URI[md5sum] = "618f0ec3e816d7ff9d3bbe23ea5a3312"
 SRC_URI[sha256sum] = "c51e760ea1c143e2edbba5b6bfb4785b3b66805c4581d8517febb75cd52582da"
 
-- 
1.7.0.4



