Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMOlx-0004ht-5k
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 18:41:19 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 509A91B421;
	Sat, 27 Nov 2010 18:41:19 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 18:40:01 +0100
Message-Id: <1290879601-21676-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] mb-applet-tasks: fixed SRC_URI
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
X-List-Received-Date: Sat, 27 Nov 2010 17:41:19 -0000

---
 .../matchbox-applet-tasks/mb-applet-tasks_1.0.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/matchbox-applet-tasks/mb-applet-tasks_1.0.0.bb b/recipes/matchbox-applet-tasks/mb-applet-tasks_1.0.0.bb
index c995a7c..e25ad9f 100644
--- a/recipes/matchbox-applet-tasks/mb-applet-tasks_1.0.0.bb
+++ b/recipes/matchbox-applet-tasks/mb-applet-tasks_1.0.0.bb
@@ -14,7 +14,7 @@ CFLAGS += "-I${STAGING_INCDIR} \
 	   -I${STAGING_INCDIR}/cairo \
 	   -DWNCK_I_KNOW_THIS_IS_UNSTABLE"
 
-SRC_URI = "http://www.pdaxrom.org/download/1.1.0beta4/src/${P}.tar.bz2"
+SRC_URI = "http://distro.ibiblio.org/pub/linux/distributions/pdaxrom/download/1.1.0beta4/src/${P}.tar.bz2"
 
 do_install() {
 install -d ${D}/${datadir}/applications
-- 
1.7.0.4



