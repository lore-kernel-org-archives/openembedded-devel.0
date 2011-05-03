Received: from mail.kernelconcepts.de ([212.60.202.196])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <fuchs@case>)
	id 1QHI7z-0008Nm-Sl for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 18:07:11 +0200
Received: from [192.168.2.131] (helo=case)
	by mail.kernelconcepts.de with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <fuchs@case>)
	id 1QHILU-0001KW-0E; Tue, 03 May 2011 18:21:08 +0200
Received: from fuchs by case with local (Exim 4.71)
	(envelope-from <fuchs@case.kc.loc>)
	id 1QHI5X-00036Q-6m; Tue, 03 May 2011 18:04:39 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 May 2011 18:04:33 +0200
Message-Id: <1304438673-11897-1-git-send-email-florian.boor@kernelconcepts.de>
X-Mailer: git-send-email 1.7.0.4
Cc: Florian Boor <florian@kernelconcepts.de>
Subject: [PATCH] initscripts: Improve parsing of mount parameters in order to fix remounting of rw jffs2.
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
X-List-Received-Date: Tue, 03 May 2011 16:07:12 -0000

From: Florian Boor <florian@kernelconcepts.de>

This change filters additional mount parameters which can cause jffs2 filesystems to
get remounted even if mounted rw already.

Signed-off-by: Florian Boor <florian.boor@kernelconcepts.de>
---
 recipes/initscripts/initscripts-1.0/checkroot |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/initscripts/initscripts-1.0/checkroot b/recipes/initscripts/initscripts-1.0/checkroot
index 7ad00d0..576f051 100755
--- a/recipes/initscripts/initscripts-1.0/checkroot
+++ b/recipes/initscripts/initscripts-1.0/checkroot
@@ -186,7 +186,7 @@ ROOTFSDEV="/dev/root"
 if ! grep -q "^$ROOTFSDEV\>" /proc/mounts; then
   ROOTFSDEV="rootfs"
 fi
-if [ x$(grep "^$ROOTFSDEV\>" /proc/mounts | awk '{print $4}') = "x$rootmode" ]; then
+if [ x$(grep "^$ROOTFSDEV\>" /proc/mounts | awk '{print $4}' | awk -F, '{print $1}') = "x$rootmode" ]; then
 	echo "Root filesystem already $rootmode, not remounting"
 	exit 0
 fi
-- 
1.7.0.4



