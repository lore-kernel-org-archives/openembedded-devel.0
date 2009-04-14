Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LtsRt-0001XS-N7
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 01:53:56 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI400DUN7JBW4X3@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	14 Apr 2009 18:49:59 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BE0E76B83B5; Tue,
	14 Apr 2009 19:49:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Apr 2009 19:49:58 -0400
Message-id: <1239752998-7677-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
In-reply-to: <20090414234609.GA27890@denix.org>
References: <20090414234609.GA27890@denix.org>
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=AWL,BAYES_40,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] udev 124: add cache invalidation logic on kernel change or its bootargs/cmdline
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
X-List-Received-Date: Tue, 14 Apr 2009 23:53:56 -0000


Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 recipes/udev/udev-124/init |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/recipes/udev/udev-124/init b/recipes/udev/udev-124/init
index 9e11f08..840cddd 100644
--- a/recipes/udev/udev-124/init
+++ b/recipes/udev/udev-124/init
@@ -34,7 +34,10 @@ LANG=C awk "\$2 == \"/dev\" && \$4 == \"tmpfs\" { exit 1 }" /proc/mounts && {
         mkdir -m 0755 /dev/shm
 }
 
-if [ -e /etc/dev.tar ]; then
+# Invalidate udev cache if the kernel or its bootargs/cmdline have changed
+[ -x /bin/uname ] && /bin/uname -mrspv > /tmp/uname || touch /tmp/uname
+[ -r /proc/cmdline ] && cat /proc/cmdline > /tmp/cmdline || touch /tmp/cmdline
+if [ -e /etc/dev.tar ] && cmp -s /tmp/uname /etc/uname && cmp -s /tmp/cmdline /etc/cmdline; then
 	(cd /; tar xf /etc/dev.tar)
 	not_first_boot=1
 fi
@@ -50,10 +53,15 @@ kill_udevd > "/dev/null" 2>&1
 		if [ "$not_first_boot" != "" ];then
 			/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
 			(/sbin/udevadm settle --timeout=3; /sbin/udevadm control env STARTUP=)&
+			rm -f /tmp/uname
+			rm -f /tmp/cmdline
 		else
 			/sbin/udevadm trigger
 			/sbin/udevadm settle
+			echo -n " and populating dev cache"
 			(cd /; tar cf /etc/dev.tar dev)
+			mv /tmp/uname /etc/uname
+			mv /tmp/cmdline /etc/cmdline
 		fi
 
 echo
-- 
1.6.0.6



