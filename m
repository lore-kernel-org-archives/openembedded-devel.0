Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PDmb3-0003Nm-4S
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 00:18:26 +0100
Received: (qmail 10292 invoked by uid 503); 3 Nov 2010 22:56:08 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 3 Nov 2010 22:56:08 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 Nov 2010 01:17:35 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 4 Nov 2010 01:17:35 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Nov 2010 00:18:41 +0100
Message-Id: <1288826321-31337-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17117619235638783305
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH] Fix GraphViz .dot output for rdepends and rrecs
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
X-List-Received-Date: Wed, 03 Nov 2010 23:18:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

this patch fixes rdepends and rrecs GraphViz output
These two are put into the rdepends data structure differently
than the rest, and without this patch, each character gets its
own vertex, which is wrong and creates massive .dot files.
The fix is similar to a previous one documented in bug 5002
and fix bug 5471.

From: Matt Johnson <johnso87@crhc.illinois.edu>
Tested-by: Eric Bénard <eric@eukrea.com>
---
 lib/bb/cooker.py |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/bb/cooker.py b/lib/bb/cooker.py
index 2281600..732a014 100644
--- a/lib/bb/cooker.py
+++ b/lib/bb/cooker.py
@@ -387,11 +387,11 @@ class BBCooker:
             for depend in depgraph["depends"][pn]:
                 print('"%s" -> "%s"' % (package, depend), file=depends_file)
         for package in depgraph["rdepends-pkg"]:
-            for rdepend in depgraph["rdepends-pkg"][package]:
-                print('"%s" -> "%s" [style=dashed]' % (package, rdepend), file=depends_file)
+            for rdepend in re.findall("([\w.-]+)(\ \(.+\))?", ''.join(depgraph["rdepends-pkg"][package])):
+                print('"%s" -> "%s%s" [style=dashed]' % (package, rdepend[0], rdepend[1]), file=depends_file) 
         for package in depgraph["rrecs-pkg"]:
-            for rdepend in depgraph["rrecs-pkg"][package]:
-                print('"%s" -> "%s" [style=dashed]' % (package, rdepend), file=depends_file)
+            for rdepend in re.findall("([\w.-]+)(\ \(.+\))?", ''.join(depgraph["rrecs-pkg"][package])):
+                print('"%s" -> "%s%s" [style=dashed]' % (package, rdepend[0], rdepend[1]), file=depends_file)
         print("}", file=depends_file)
         logger.info("Package dependencies saved to 'package-depends.dot'")
 
-- 
1.6.3.3



