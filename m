Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PBwS7-0007FB-QN
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 23:25:37 +0200
Received: (qmail 2177 invoked by uid 503); 29 Oct 2010 21:03:50 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 29 Oct 2010 21:03:49 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Oct 2010 23:24:47 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 29 Oct 2010 23:24:46 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Oct 2010 23:25:40 +0200
Message-Id: <1288387543-1277-4-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1288387543-1277-3-git-send-email-eric@eukrea.com>
References: <1288387543-1277-1-git-send-email-eric@eukrea.com>
	<1288387543-1277-2-git-send-email-eric@eukrea.com>
	<1288387543-1277-3-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4295871096254606668
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/7] busybox's mdev: add script to populate /dev/bus/usb
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
X-List-Received-Date: Fri, 29 Oct 2010 21:25:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

this patch allows libusb to work on kernel configured without
CONFIG_USB_DEVICEFS

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox_1.1x.inc |    2 ++
 recipes/busybox/files/mdev.conf  |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_1.1x.inc
index df536f6..079c784 100644
--- a/recipes/busybox/busybox_1.1x.inc
+++ b/recipes/busybox/busybox_1.1x.inc
@@ -23,6 +23,7 @@ SRC_URI = "\
   file://defconfig \
   file://mdev \
   file://mdev.conf \
+  file://usb.sh \
 "
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
@@ -38,6 +39,7 @@ do_install_append() {
     install -d ${D}${sysconfdir}/init.d/
     install -d ${D}${sysconfdir}/mdev
     install -m 0755 ${WORKDIR}/find-touchscreen.sh ${D}${sysconfdir}/mdev/
+    install -m 0755 ${WORKDIR}/usb.sh ${D}${sysconfdir}/mdev/
     install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
 
     if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
diff --git a/recipes/busybox/files/mdev.conf b/recipes/busybox/files/mdev.conf
index 8f57b0a..0e1d6bc 100644
--- a/recipes/busybox/files/mdev.conf
+++ b/recipes/busybox/files/mdev.conf
@@ -20,7 +20,7 @@ sda 0:6 0640
 tty 0:5 0666 
 tty.* 0:0 0620 
 urandom 0:0 0666 
-usbdev.* 0:0 0660 
+usbdev.* 0:0 0660 */etc/mdev/usb.sh
 vcs.* 0:5 0660 
 zero 0:0 0666 
  
-- 
1.6.3.3



