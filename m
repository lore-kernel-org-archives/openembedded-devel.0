Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMK6I-0008Uo-Js
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 13:41:59 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id DE0D91B421;
	Sat, 27 Nov 2010 13:42:00 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 13:40:38 +0100
Message-Id: <1290861638-8851-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] dcetest: fixed download link
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
X-List-Received-Date: Sat, 27 Nov 2010 12:41:59 -0000

fixed download link and version
---
 recipes/dcetest/dcetest.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/dcetest/dcetest.bb b/recipes/dcetest/dcetest.bb
index 962add5..b6f5480 100644
--- a/recipes/dcetest/dcetest.bb
+++ b/recipes/dcetest/dcetest.bb
@@ -1,8 +1,9 @@
 SECTION = "network/misc"
 DESCRIPTION = "DCE Service enumerator for MS Windows systems"
-PV = "1.2"
+PV = "2.0"
+PR = "r0"
 
-SRC_URI = "http://packetstormsecurity.org/UNIX/scanners/dcetest-2.0.tar.gz"
+SRC_URI = "http://packetstorm.linuxsecurity.com/UNIX/scanners/dcetest-2.0.tar.gz"
 
 DEFAULT_PREFERENCE="-1"
 
-- 
1.7.0.4



