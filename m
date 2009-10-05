Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MuuoQ-0007Ss-Kl
	for openembedded-devel@openembedded.org; Mon, 05 Oct 2009 23:09:45 +0200
Received: (qmail 29375 invoked by uid 813007); 5 Oct 2009 21:08:56 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 Oct 2009 21:08:56 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Oct 2009 23:08:42 +0200
Message-Id: <1254776922-10892-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.4.3
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [STABLE][PATCH] java.bbclass: Use force (-f) for ln (suggested by Marcin).
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
X-List-Received-Date: Mon, 05 Oct 2009 21:09:45 -0000

From: Robert Schuster <rschus@entw2.(none)>

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

---
 classes/java.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/java.bbclass b/classes/java.bbclass
index 38256d7..cacd2ce 100644
--- a/classes/java.bbclass
+++ b/classes/java.bbclass
@@ -72,7 +72,7 @@ oe_jarinstall() {
       oewarn "file was in the way. removing:" $dir/$1
       rm $dir/$1
     fi
-    ln -s $destname $dir/$1
+    ln -sf $destname $dir/$1
     shift
   done
 }
-- 
1.6.4.3





