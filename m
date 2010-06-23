Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1ORJFe-0002fq-Tx
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 08:15:59 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id C1151491284
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 08:11:24 +0200 (CEST)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 23 Jun 2010 08:11:24 +0200
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id 8635772078; Wed, 23 Jun 2010 08:11:24 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Jun 2010 08:11:13 +0200
Message-Id: <1277273473-17376-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <111b01cb123eb0466e0MAN_POSIXLY_CORRECT=1Distant-earth.com>
References: <111b01cb123eb0466e0MAN_POSIXLY_CORRECT=1Distant-earth.com>
X-OriginalArrivalTime: 23 Jun 2010 06:11:24.0824 (UTC)
	FILETIME=[E8AF0980:01CB129A]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] udev/mount.sh: use lazy umount
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
X-List-Received-Date: Wed, 23 Jun 2010 06:15:59 -0000

* umount will fail if there are processes accessing files at the
  device, use lazy umount to avoid this problem

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/udev/files/mount.sh        |    2 +-
 recipes/udev/files/slugos/mount.sh |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/udev/files/mount.sh b/recipes/udev/files/mount.sh
index be8b3df..440dcee 100644
--- a/recipes/udev/files/mount.sh
+++ b/recipes/udev/files/mount.sh
@@ -64,7 +64,7 @@ fi
 if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
 	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
 	do
-		$UMOUNT $mnt
+		$UMOUNT -l $mnt
 	done
 	
 	# Remove empty directories from auto-mounter
diff --git a/recipes/udev/files/slugos/mount.sh b/recipes/udev/files/slugos/mount.sh
index 0990a7e..b5298e9 100644
--- a/recipes/udev/files/slugos/mount.sh
+++ b/recipes/udev/files/slugos/mount.sh
@@ -75,7 +75,7 @@ fi
 if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
 	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
 	do
-		$UMOUNT $mnt
+		$UMOUNT -l $mnt
 	done
 	
 	# Remove empty directories from auto-mounter
-- 
1.6.4.2



