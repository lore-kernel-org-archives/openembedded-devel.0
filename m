Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OKdLE-00081J-2X
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 22:18:09 +0200
Received: from gandalf.denix.org ([unknown] [71.255.238.44])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L3I007TKAUM4766@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	04 Jun 2010 15:13:40 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 63B4014AF5C; Fri,
	04 Jun 2010 16:13:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 04 Jun 2010 16:13:31 -0400
Message-id: <1275682411-2638-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] amend.bbclass: don't parse same amend.inc if FILESPATH references it multiple times
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
X-List-Received-Date: Fri, 04 Jun 2010 20:18:09 -0000

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 classes/amend.bbclass |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/classes/amend.bbclass b/classes/amend.bbclass
index cddd28c..fb67b4e 100644
--- a/classes/amend.bbclass
+++ b/classes/amend.bbclass
@@ -21,7 +21,13 @@ python () {
     depends = d.getVar("__depends", 0) or []
     d.setVar("__depends", depends + [(file, 0) for file in amendfiles if not os.path.exists(file)])
 
+    # Make sure we don't parse the same amend.inc file more than once, if
+    # there are duplicates in FILESPATH
+    seen = set()
+
     for file in amendfiles:
         if os.path.exists(file):
-            bb.parse.handle(file, d, 1)
+            if file not in seen:
+                bb.parse.handle(file, d, 1)
+                seen.add(file)
 }
-- 
1.6.3.3



