Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PPI2R-0007v1-FS
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 18:06:17 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 9DA8F1B40D;
	Sun,  5 Dec 2010 18:06:12 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 18:04:50 +0100
Message-Id: <1291568690-10148-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] murasaki_0.8.8: fixed SRC_URI
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
X-List-Received-Date: Sun, 05 Dec 2010 17:06:17 -0000


Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 recipes/murasaki/murasaki_0.8.8.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/murasaki/murasaki_0.8.8.bb b/recipes/murasaki/murasaki_0.8.8.bb
index f098bfa..2b68c2b 100644
--- a/recipes/murasaki/murasaki_0.8.8.bb
+++ b/recipes/murasaki/murasaki_0.8.8.bb
@@ -3,7 +3,8 @@ DESCRIPTION = "Murasaki automatically loads and unloads modules for \
 USB, Cardbus, and other hot-pluggable devices using the new Hotplug \
 feature in Linux 2.4."
 LICENSE = "GPL"
-SRC_URI = "http://www.dotaster.com/~shuu/linux/murasaki/0.8/8/murasaki-${PV}.tar.gz \
+HOMEPAGE = "http://zuckin.com/old/linux/murasaki/index_ja.html"
+SRC_URI = "http://www.openzaurus.org/download/3.5.4/sources/murasaki-${PV}.tar.gz \
 	   file://fix-compile.patch"
 
 EXTRA_OEMAKE = 'OPT="-DPATH_MAX" DEBUG= INC="-I ../inc ${CFLAGS}"'
-- 
1.7.0.4



