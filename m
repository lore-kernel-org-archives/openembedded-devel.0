Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N63eI-0003wR-Id
	for openembedded-devel@openembedded.org; Thu, 05 Nov 2009 15:49:21 +0100
Received: (qmail 22149 invoked by uid 813007); 5 Nov 2009 14:41:25 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 Nov 2009 14:41:25 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2009 15:41:16 +0100
Message-Id: <1257432076-12239-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5.2
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH] java.bbclass: fixed oe_jarinstall for broken symlinks
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
X-List-Received-Date: Thu, 05 Nov 2009 14:49:22 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

Code checked for existance of JAR file and if it was present then it had
to be removed before symlinking to it. But it was not working sometimes
so we forced symlinking.

Proper fix is to check "does file exists or is a symlink" which we do
now.

Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>
---
 classes/java.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/java.bbclass b/classes/java.bbclass
index cacd2ce..b68035c 100644
--- a/classes/java.bbclass
+++ b/classes/java.bbclass
@@ -68,11 +68,11 @@ oe_jarinstall() {
 
   # Creates symlinks out of the remaining arguments.
   while [ "$#" -gt 0 ]; do
-    if [ -e $dir/$1 ]; then
+    if [ -e $dir/$1 -o -h $dir/$1 ]; then
       oewarn "file was in the way. removing:" $dir/$1
       rm $dir/$1
     fi
-    ln -sf $destname $dir/$1
+    ln -s $destname $dir/$1
     shift
   done
 }
-- 
1.6.5.2





