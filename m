Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OR0U2-0006HV-D2
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 12:13:36 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 27122491278
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 12:09:01 +0200 (CEST)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 22 Jun 2010 12:09:01 +0200
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id C9B1072078; Tue, 22 Jun 2010 12:09:00 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jun 2010 12:08:49 +0200
Message-Id: <1277201329-1339-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
X-OriginalArrivalTime: 22 Jun 2010 10:09:01.0176 (UTC)
	FILETIME=[EFB7F780:01CB11F2]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] udev/mount.sh: try to kill active processes before umount
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
X-List-Received-Date: Tue, 22 Jun 2010 10:13:37 -0000

* umount will fail if there are processes accessing files at the
  device. Therefor try to kill these processes using fuser if
  available.

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/udev/files/mount.sh        |   21 ++++++++++++++++++++-
 recipes/udev/files/slugos/mount.sh |   21 ++++++++++++++++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/recipes/udev/files/mount.sh b/recipes/udev/files/mount.sh
index be8b3df..79c6891 100644
--- a/recipes/udev/files/mount.sh
+++ b/recipes/udev/files/mount.sh
@@ -8,6 +8,7 @@
 MOUNT="/bin/mount"
 PMOUNT="/usr/bin/pmount"
 UMOUNT="/bin/umount"
+FUSER="/usr/bin/fuser"
 name="`basename "$DEVNAME"`"
 
 for line in `cat /etc/udev/mount.blacklist | grep -v ^#`
@@ -64,7 +65,25 @@ fi
 if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
 	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
 	do
-		$UMOUNT $mnt
+		if [ -x "$FUSER" ]; then
+			$FUSER -k -KILL -m $mnt
+			for try in `seq 10`
+			do
+				$FUSER -m $mnt || break
+				sleep 1
+				logger "mount.sh/automount" "$try secs waited for processes active at $mnt to finish on SIGKILL"
+			done
+
+			if $FUSER -m $mnt 
+			then
+				logger "mount.sh/automount" "Could not kill all processes using files at $mnt, try forced umount"
+				$UMOUNT -f $mnt
+			else
+				$UMOUNT $mnt
+			fi
+		else
+			$UMOUNT $mnt
+		fi
 	done
 	
 	# Remove empty directories from auto-mounter
diff --git a/recipes/udev/files/slugos/mount.sh b/recipes/udev/files/slugos/mount.sh
index 0990a7e..f67c3ff 100644
--- a/recipes/udev/files/slugos/mount.sh
+++ b/recipes/udev/files/slugos/mount.sh
@@ -8,6 +8,7 @@
 MOUNT="/bin/mount"
 PMOUNT="/usr/bin/pmount"
 UMOUNT="/bin/umount"
+FUSER="/usr/bin/fuser"
 name="`basename "$DEVNAME"`"
 
 if ( blkid "$DEVNAME" | grep -q 'TYPE="mdraid"' )
@@ -75,7 +76,25 @@ fi
 if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
 	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
 	do
-		$UMOUNT $mnt
+		if [ -x "$FUSER" ]; then
+			$FUSER -k -KILL -m $mnt
+			for try in `seq 10`
+			do
+				$FUSER -m $mnt || break
+				sleep 1
+				logger "mount.sh/automount" "$try secs waited for processes active at $mnt to finish on SIGKILL"
+			done
+
+			if $FUSER -m $mnt 
+			then
+				logger "mount.sh/automount" "Could not kill all processes using files at $mnt, try forced umount"
+				$UMOUNT -f $mnt
+			else
+				$UMOUNT $mnt
+			fi
+		else
+			$UMOUNT $mnt
+		fi
 	done
 	
 	# Remove empty directories from auto-mounter
-- 
1.6.4.2



