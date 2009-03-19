Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1Lk9nO-00040Z-N5
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 05:23:58 +0100
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.105]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1Lk9mH-00016v-Fn
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 12:22:57 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2009 22:22:36 -0600
Message-Id: <1237436556.13773.2.camel@think-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 59.124.115.149
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_20,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Allow openmoko2 to succeed on unsplitable sections
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
X-List-Received-Date: Thu, 19 Mar 2009 04:23:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


---
 classes/openmoko2.bbclass |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/classes/openmoko2.bbclass b/classes/openmoko2.bbclass
index ef734e4..3294026 100644
--- a/classes/openmoko2.bbclass
+++ b/classes/openmoko2.bbclass
@@ -6,12 +6,18 @@ OPENMOKO_MIRROR ?= "svn://svn.openmoko.org/trunk"

 def openmoko_two_get_license(d):
     import bb
-    openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
+    if bb.data.getVar('SECTION', d, 1).find("/") != -1 :
+        openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
+    else :
+       section = bb.data.getVar('SECTION', d, 1)
     return "LGPL GPL".split()[section != "libs"]

 def openmoko_two_get_subdir(d):
     import bb
-    openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
+    if bb.data.getVar('SECTION', d, 1).find("/") != -1 :
+       openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
+    else :
+       section = bb.data.getVar('SECTION', d, 1)
     if section == 'base': return ""
     elif section == 'libs': return "libraries"
     elif section in 'apps tools pim'.split(): return "applications"
--
1.5.6.3




