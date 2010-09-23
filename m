Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OyppU-0002eW-H2
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 19:43:36 +0200
Received: (qmail 26627 invoked by uid 503); 23 Sep 2010 17:57:06 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 23 Sep 2010 17:57:06 -0000
Received: (qmail 29674 invoked by uid 503); 23 Sep 2010 17:25:59 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 23 Sep 2010 17:25:59 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Sep 2010 19:43:23 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 23 Sep 2010 19:43:21 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Sep 2010 19:42:37 +0200
Message-Id: <1285263757-14049-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10500424007288073545
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] busybox's mdev: add script to populate /dev/bus/usb
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
X-List-Received-Date: Thu, 23 Sep 2010 17:43:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* needed for libusb on kernel without CONFIG_USB_DEVICEFS

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox_1.13.2.bb |    4 +++-
 recipes/busybox/files/mdev.conf   |    2 +-
 recipes/busybox/files/usb.sh      |   34 ++++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 recipes/busybox/files/usb.sh

diff --git a/recipes/busybox/busybox_1.13.2.bb b/recipes/busybox/busybox_1.13.2.bb
index a3acceb..fce7504 100644
--- a/recipes/busybox/busybox_1.13.2.bb
+++ b/recipes/busybox/busybox_1.13.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 SRC_URI = "\
   http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
@@ -39,6 +39,7 @@ SRC_URI = "\
   file://defconfig \
   file://mdev \
   file://mdev.conf \
+  file://usb.sh \
 "
 SRC_URI[tarball.md5sum] = "9e2a604d18bef219a5a6bf3acf78b9e1"
 SRC_URI[tarball.sha256sum] = "927774408bd982dd246fb716bb2e646ab0708ce321b42c5e271dc98c1f5d1dc8"
@@ -56,5 +57,6 @@ do_install_append() {
     install -d ${D}${sysconfdir}/init.d/
     install -d ${D}${sysconfdir}/mdev
     install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev/
+    install -m 0755 ${WORKDIR}/usb.sh ${D}${sysconfdir}/mdev/
     install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
 }
diff --git a/recipes/busybox/files/mdev.conf b/recipes/busybox/files/mdev.conf
index 8f57b0a..2aa8f26 100644
--- a/recipes/busybox/files/mdev.conf
+++ b/recipes/busybox/files/mdev.conf
@@ -20,7 +20,7 @@ sda 0:6 0640
 tty 0:5 0666 
 tty.* 0:0 0620 
 urandom 0:0 0666 
-usbdev.* 0:0 0660 
+usbdev.* 0:0 0660  */etc/mdev/usb.sh
 vcs.* 0:5 0660 
 zero 0:0 0666 
  
diff --git a/recipes/busybox/files/usb.sh b/recipes/busybox/files/usb.sh
new file mode 100644
index 0000000..cf776e7
--- /dev/null
+++ b/recipes/busybox/files/usb.sh
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+case "$ACTION" in
+  add|"")
+    for uevent in /sys/class/usb_device/usbdev?.*/*/uevent; do
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
+      for uevent in /sys/class/usb_device/usbdev?.*/*/uevent; do
+        . $uevent
+        echo $dev $DEVNUM $bus $BUSNUM >> /tmp/rem.txt
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
-- 
1.6.3.3



