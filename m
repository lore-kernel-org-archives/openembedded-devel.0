Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8IdL-0004ju-UT
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 20:41:30 +0200
Received: by bwz19 with SMTP id 19so2682157bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 May 2009 11:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=WVzIMT90mdo8RN+bNLZchFlf7h3Y4O0e9P/988ajMDw=;
	b=KKJOjUq8NTzWgQeUFOOfWQ7DNKsQVc7X4b/zbis129CFj+afnAn34wB/0W4V7451dK
	0WpxqzYYmvpKBHdSK1J1VScYxu+j0QxCdBEggu5YHWkWwBh1T2NTUkFJ9L0jEHNBwtFz
	W64G/M3kLKySZYGlpb7fBoSmxQA/MkRj4Gw4U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=KJKwXQOqbkDbTF0e62O3MtJHI4+xxVnbw45O9UWWyc+HQ7gGoYFVi3+XT1EifZXYso
	dfhdbb28f7quFPikKaXw83teO90tNziWQb9qyS4T1/9lsR7/jMKNstwyaeSalkLfFn07
	sOkJpW5uZPbzyBg7oe7/pfgneeUzCpHz7gI54=
Received: by 10.103.249.19 with SMTP id b19mr3183703mus.86.1243190002873;
	Sun, 24 May 2009 11:33:22 -0700 (PDT)
Received: from localhost ([80.249.91.57])
	by mx.google.com with ESMTPS id 23sm943317mum.35.2009.05.24.11.33.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 24 May 2009 11:33:21 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 May 2009 21:33:04 +0300
Message-Id: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
Subject: [PATCH 1/2] udev: fixed obsolete udevadm syntax for udev init.d script.
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
X-List-Received-Date: Sun, 24 May 2009 18:41:51 -0000

Fixed the following warning message when executing udev init script:
"udevadm control commands requires the --<command> format, this will
stop working in a future release."

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/udev/udev-124/init |    4 ++--
 recipes/udev/udev-141/init |    4 ++--
 recipes/udev/udev_124.bb   |    2 +-
 recipes/udev/udev_141.bb   |    2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/udev/udev-124/init b/recipes/udev/udev-124/init
index efe4470..7188b5a 100644
--- a/recipes/udev/udev-124/init
+++ b/recipes/udev/udev-124/init
@@ -56,10 +56,10 @@ kill_udevd > "/dev/null" 2>&1
         echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
         /sbin/udevd -d
 
-        /sbin/udevadm control env STARTUP=1
+        /sbin/udevadm control --env STARTUP=1
 		if [ "$not_first_boot" != "" ];then
 			/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
-			(/sbin/udevadm settle --timeout=3; /sbin/udevadm control env STARTUP=)&
+			(/sbin/udevadm settle --timeout=3; /sbin/udevadm control --env STARTUP=)&
 			if [ "$DEVCACHE" != "" ]; then
 				rm -f /tmp/uname
 				rm -f /tmp/cmdline
diff --git a/recipes/udev/udev-141/init b/recipes/udev/udev-141/init
index efe4470..7188b5a 100644
--- a/recipes/udev/udev-141/init
+++ b/recipes/udev/udev-141/init
@@ -56,10 +56,10 @@ kill_udevd > "/dev/null" 2>&1
         echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
         /sbin/udevd -d
 
-        /sbin/udevadm control env STARTUP=1
+        /sbin/udevadm control --env STARTUP=1
 		if [ "$not_first_boot" != "" ];then
 			/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
-			(/sbin/udevadm settle --timeout=3; /sbin/udevadm control env STARTUP=)&
+			(/sbin/udevadm settle --timeout=3; /sbin/udevadm control --env STARTUP=)&
 			if [ "$DEVCACHE" != "" ]; then
 				rm -f /tmp/uname
 				rm -f /tmp/cmdline
diff --git a/recipes/udev/udev_124.bb b/recipes/udev/udev_124.bb
index 834a70a..be545f7 100644
--- a/recipes/udev/udev_124.bb
+++ b/recipes/udev/udev_124.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 /dev/, handles hotplug events and loads drivers at boot time. It replaces \
 the hotplug package and requires a kernel not older than 2.6.12."
 RPROVIDES_${PN} = "hotplug"
-PR = "r17"
+PR = "r18"
 
 SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://noasmlinkage.patch;patch=1 \
diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
index e7438fb..7e26798 100644
--- a/recipes/udev/udev_141.bb
+++ b/recipes/udev/udev_141.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL"
 # Untested
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://kernel.org/pub/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 	   file://mount.blacklist \
-- 
1.6.3.1



