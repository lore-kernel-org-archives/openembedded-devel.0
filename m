Received: from moutng.kundenserver.de ([212.227.126.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@informatik.tu-chemnitz.de>)
	id 1NtUMO-0000Bk-TY for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 00:15:09 +0100
Received: from mail.bigo.ensc.de ([93.159.121.26])
	by mrelayeu.kundenserver.de (node=mreu1) with ESMTP (Nemesis)
	id 0MMamg-1NySYY1fAM-008SGh; Sun, 21 Mar 2010 23:48:00 +0100
Received: from sheridan.bigo.ensc.de (sheridan-wifi.bigo.ensc.de
	[192.168.46.11])
	by mail.bigo.ensc.de (8.14.3/8.14.3) with ESMTP id o2LMlvtY006590;
	Sun, 21 Mar 2010 23:47:58 +0100
Received: from ensc by sheridan.bigo.ensc.de with local (Exim 4.69)
	(envelope-from <ensc@sheridan.bigo.ensc.de>)
	id 1NtTw5-00048H-NL; Sun, 21 Mar 2010 23:47:57 +0100
From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Mar 2010 23:47:55 +0100
Message-Id: <1269211675-15854-1-git-send-email-enrico.scholz@informatik.tu-chemnitz.de>
X-Mailer: git-send-email 1.6.6.1
Sender: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
X-Provags-ID: V01U2FsdGVkX1+FmJQYQtAb5N22dqFxFwOqbVbScHgjVA5sfSY
	rN/7jni4VPLjZGT1PVP+P2VBvO7Mk0kOgB1tknWLv/BQVGT49o
	8EVaUUFE/zntPUUL7K2xg==
X-SA-Exim-Connect-IP: 212.227.126.187
X-SA-Exim-Mail-From: enrico.scholz@informatik.tu-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
Subject: [PATCH] rm_work.bbclass: reordered 'rm $dir -rf' arguments
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
X-List-Received-Date: Sun, 21 Mar 2010 23:15:10 -0000

Using an 'rm -rf $dir' ordering is more portable.

Signed-off-by: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
---
 classes/rm_work.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/rm_work.bbclass b/classes/rm_work.bbclass
index a53d12b..0857f49 100644
--- a/classes/rm_work.bbclass
+++ b/classes/rm_work.bbclass
@@ -20,7 +20,7 @@ do_rm_work () {
         if [ `basename ${dir}` = "temp" ]; then
             echo "Not removing temp"
         else 
-            echo "Removing $dir" ; rm $dir -rf		
+            echo "Removing $dir" ; rm -rf $dir
         fi
     done
 }
-- 
1.6.6.1



