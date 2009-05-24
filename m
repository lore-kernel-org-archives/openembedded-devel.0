Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8KpX-0004iz-45
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 23:02:03 +0200
Received: by bwz19 with SMTP id 19so2733395bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 May 2009 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=uBC6EWKgr7hbcBmOmgvqjlPqo1rFnUSZoyMZieyv77k=;
	b=oDa5k2dJ2Zmh9Jl4q5iQy6/l94Y7XGxo6pNZRbkj3UGI6Frraq8+tRZ1Vi72qkbR4g
	w32HJXbRUmwot4a5zcvJSeha/C+R83txvfpdhsQPAWjyy76lFIQBtBgdMR9rVriPTVm+
	C3vAoZk0PNsdxxn+QVkioEA4Vp2EWY7voqkjA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xCZnh0KBgAUfR1NKYKqnFCEEAmSJcltWGTDnx0WUlUQDsE5gCryvC4uK4A0xEWaOOq
	TlJ1oJD9mkFOXi+MHPyPDrG5phF/4+kGZ4Hhu1nC4K9MEP0ToUaGCxVligbshFOk0O7R
	WWS+1aIy6tPFwaBlELEz4zfoHN7lQ3PeLTe88=
Received: by 10.103.222.1 with SMTP id z1mr3267017muq.44.1243198445240;
	Sun, 24 May 2009 13:54:05 -0700 (PDT)
Received: from localhost ([80.249.91.57])
	by mx.google.com with ESMTPS id y37sm8695913mug.49.2009.05.24.13.54.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 24 May 2009 13:54:04 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 May 2009 23:54:00 +0300
Message-Id: <1243198440-8833-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 1/4] udev: fixed obsolete udevadm syntax for udev init.d script.
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
X-List-Received-Date: Sun, 24 May 2009 21:02:03 -0000

Fixed the following warning message when executing udev init script:
"udevadm control commands requires the --<command> format, this will
stop working in a future release."

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/udev/udev-141/init |    4 ++--
 recipes/udev/udev_141.bb   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

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



