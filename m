Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <zlo@zlo.nu>)
	id 1NuQj5-0007IJ-0n for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 14:34:33 +0100
Received: from localhost.localdomain (seven.iphion.nl [80.255.245.169])
	by mzh.zlo.nu (Postfix) with ESMTP id AA828140A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 14:25:20 +0100 (CET)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Mar 2010 14:25:20 +0100
Message-Id: <1269437120-21774-1-git-send-email-zlo@zlo.nu>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: zlo@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] package.bbclass: Make sure that when "file" fails, a forced strip will still strip.
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
X-List-Received-Date: Wed, 24 Mar 2010 13:34:33 -0000

From: Marc Olzheim <marc@iphion.nl>

---
 classes/package.bbclass |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 062f782..97b2d9b 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -160,8 +160,7 @@ def runstrip(file, d):
 
     if ret:
         bb.error("runstrip: 'file %s' failed (forced strip)" % file)
-
-    if "not stripped" not in result:
+    elif "not stripped" not in result:
         bb.debug(1, "runstrip: skip %s" % file)
         return 0
 
-- 
1.6.3.3



