Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MRlha-0002tX-Nh
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jul 2009 13:34:10 +0200
Received: from localhost.localdomain (unknown [192.168.1.187])
	by mail.altell.local (Postfix) with ESMTP id 65A04BBBBB;
	Fri, 17 Jul 2009 15:20:23 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jul 2009 15:20:12 +0400
Message-Id: <1247829612-9310-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3.3
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH] package.bbclass: introduce KEEP_GNU_DEBUGLINK
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
X-List-Received-Date: Fri, 17 Jul 2009 11:34:10 -0000

Currently we're keeping .gnu_debuglink section in files after stripping them.
It makes binaries from successive builds a bit different, which is not good
in situations where you want them to be exactly the same (identical checksums).

So, introducing KEEP_GNU_DEBUGLINK which can be set to zero to disable this
behavior and get identical result on successive builds for most of the
packages.
---
 classes/package.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index f6bd7c5..5425789 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -192,7 +192,9 @@ def runstrip(file, d):
 
     os.system("%s'%s' --only-keep-debug '%s' '%s'" % (pathprefix, objcopy, file, debugfile))
     ret = os.system("%s%s" % (pathprefix, stripcmd))
-    os.system("%s'%s' --add-gnu-debuglink='%s' '%s'" % (pathprefix, objcopy, debugfile, file))
+    debuglink = bb.data.getVar('KEEP_GNU_DEBUGLINK', d, 1) or '1'
+    if debuglink != '0':
+        os.system("%s'%s' --add-gnu-debuglink='%s' '%s'" % (pathprefix, objcopy, debugfile, file))
 
     if newmode:
         os.chmod(file, origmode)
-- 
1.6.3.3



