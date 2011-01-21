Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PgCO7-0007zl-7q
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 09:30:32 +0100
Received: by pwi8 with SMTP id 8so286005pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 00:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=KnN2+uvgLmq3c7FlkYU4VJJsEXdFAN0aApQf/eEeClw=;
	b=pt3nhekiZNE4wE95v1aFyB0Bhhy1VJpmn7+uOS7NtpFGUFApMXGVskWZhRCvezk1Bw
	HUlx8P6SN4PZ96JE+Emr2aM2ngya3GwElZMogJmwClAPGgI6VPt3WnMwITMbWGx2UAsK
	iesR86LXYzV6laPK+jCR9EwXrw7yBE33imJac=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=qxBsxkbFMVqy89sbv7V7H8L6PEZEjG/HkgTYo0gsebHA5ey9MLA3lknROu6qnYhhfA
	bdnvxjVDxNEtDmt9PaCEUEjWKMZZfV2wfy1P5SsPjuAGeP+TcKiCIlvPRlIZId8/t5PB
	c9swdmjTO5qFLu06Yb7ThL1jWZBzoj1ntBW7k=
Received: by 10.142.107.19 with SMTP id f19mr299098wfc.394.1295598587976;
	Fri, 21 Jan 2011 00:29:47 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y42sm12321755wfd.22.2011.01.21.00.29.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 21 Jan 2011 00:29:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jan 2011 00:29:41 -0800
Message-Id: <1295598581-12927-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH 3/3] busybox_1.18.2.bb: slugos needs a modified version of usb.sh script
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
X-List-Received-Date: Fri, 21 Jan 2011 08:30:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/busybox/busybox-1.18.2/slugos/usb.sh |   33 ++++++++++++++++++++++++++
 recipes/busybox/busybox_1.18.2.bb            |    2 +-
 2 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 recipes/busybox/busybox-1.18.2/slugos/usb.sh

diff --git a/recipes/busybox/busybox-1.18.2/slugos/usb.sh b/recipes/busybox/busybox-1.18.2/slugos/usb.sh
new file mode 100644
index 0000000..172fdc6
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.2/slugos/usb.sh
@@ -0,0 +1,33 @@
+#!/bin/sh
+
+case "$ACTION" in
+  add|"")
+    for uevent in /sys/class/usb_endpoint/usbdev?.*/*/uevent; do
+      . $uevent
+      if [ ! -e /dev/bus/usb/$BUSNUM/$DEVNUM ]; then
+        mkdir -p /dev/bus/usb/$BUSNUM
+        mknod /dev/bus/usb/$BUSNUM/$DEVNUM c 189 $MINOR
+      fi
+    done
+    ;;
+  remove)
+    for device in /dev/bus/usb/*/*; do
+      REMOVED=1
+      dev=`basename $device`
+      bus=`basename $(dirname $device)`
+      for uevent in /sys/class/usb_endpoint/usbdev?.*/*/uevent; do
+        . $uevent
+        if [ $dev -eq $DEVNUM ] && [ $bus -eq $BUSNUM ]; then
+          REMOVED=0
+          break;
+        fi
+      done
+      if [ $REMOVED -eq 1 ]; then
+        rm /dev/bus/usb/$bus/$dev
+        if [ -z $(ls /dev/bus/usb/$bus/) ]; then
+          rmdir /dev/bus/usb/$bus/
+        fi
+      fi
+    done
+    ;;
+esac
diff --git a/recipes/busybox/busybox_1.18.2.bb b/recipes/busybox/busybox_1.18.2.bb
index e6d17d3..7c47ab4 100644
--- a/recipes/busybox/busybox_1.18.2.bb
+++ b/recipes/busybox/busybox_1.18.2.bb
@@ -1,5 +1,5 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI += " \
 	http://busybox.net/downloads/fixes-1.18.2/busybox-1.18.2-modprobe-small.patch;name=patch01 \
-- 
1.7.2.3



