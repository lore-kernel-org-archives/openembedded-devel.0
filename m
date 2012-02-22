Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vita.preskovsky@gmail.com>) id 1S0CuK-0002S9-BH
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 15:11:00 +0100
Received: by ghbf19 with SMTP id f19so33074ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 06:02:39 -0800 (PST)
Received-SPF: pass (google.com: domain of vita.preskovsky@gmail.com designates
	10.101.179.28 as permitted sender) client-ip=10.101.179.28; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	vita.preskovsky@gmail.com designates 10.101.179.28 as permitted
	sender) smtp.mail=vita.preskovsky@gmail.com;
	dkim=pass header.i=vita.preskovsky@gmail.com
Received: from mr.google.com ([10.101.179.28])
	by 10.101.179.28 with SMTP id g28mr12938956anp.61.1329919359735
	(num_hops = 1); Wed, 22 Feb 2012 06:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=s+u5/jv+tWgJjIq2Jg6BuMryJmXc8Rtx6SHX9ue5J50=;
	b=LPGenIrEIrQz0AV3RjSzWRaSv0Ds5BsIFpHhxDD/9BMogZ2nI58ni3lIl0edE70mEi
	F2gEWUNYBv2k2+QXhGQpUEpa/Fcjypo3pRiB+9fw7YdKEJqpwWdVdjO+aD+gY/HPxrs5
	fE3qsTUPHgN4j9zeH7R2IZoT6Maj7a8HVLPD4=
Received: by 10.101.179.28 with SMTP id g28mr10060774anp.61.1329919359621;
	Wed, 22 Feb 2012 06:02:39 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id w44sm62957483yhk.17.2012.02.22.06.02.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 06:02:38 -0800 (PST)
From: Vita Preskovsky <vita.preskovsky@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2012 16:02:07 +0200
Message-Id: <1329919327-30523-1-git-send-email-vitap@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] bluez4: two patches for 4.98
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
X-List-Received-Date: Wed, 22 Feb 2012 14:11:00 -0000

* Adding two patches fixing functionality
of bluez-4.98. The first fixes
the synchronization between bluetoothd
and driver. And the second is necessary
for A2DP to work.


Signed-off-by: Vita Preskovsky <vitap@ti.com>
---
 recipes/bluez/bluez4_4.98.bb                       |    2 +
 .../files/0001-socket-enable-for-bluez-4_98.patch  |   25 ++++++++++
 ...synchronization-between-bluetoothd-and-dr.patch |   50 ++++++++++++++++++++
 3 files changed, 77 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bluez/files/0001-socket-enable-for-bluez-4_98.patch
 create mode 100755 recipes/bluez/files/0002-bluez4-fix-synchronization-between-bluetoothd-and-dr.patch

diff --git a/recipes/bluez/bluez4_4.98.bb b/recipes/bluez/bluez4_4.98.bb
index 2303994..1a5fd21 100644
--- a/recipes/bluez/bluez4_4.98.bb
+++ b/recipes/bluez/bluez4_4.98.bb
@@ -3,6 +3,8 @@ require bluez4.inc
 SRC_URI = "\
  ${KERNELORG_MIRROR}/pub/linux/bluetooth/bluez-${PV}.tar.gz \
  file://bluetooth.conf \
+ file://0001-socket-enable-for-bluez-4_98.patch \
+ file://0002-bluez4-fix-synchronization-between-bluetoothd-and-dr.patch \
 "
 SRC_URI[md5sum] = "362864b716950baa04797de735fc237b"
 SRC_URI[sha256sum] = "9a5b655bada7c7a1921cb3bac83b8a32bbe49893e4c7a1377cdc1b0d35f7d233"
diff --git a/recipes/bluez/files/0001-socket-enable-for-bluez-4_98.patch b/recipes/bluez/files/0001-socket-enable-for-bluez-4_98.patch
new file mode 100644
index 0000000..05cb2ee
--- /dev/null
+++ b/recipes/bluez/files/0001-socket-enable-for-bluez-4_98.patch
@@ -0,0 +1,25 @@
+From e142a28897c0b0fe9e61259a96dad6fb9f818ecd Mon Sep 17 00:00:00 2001
+From: Moosa <moosa.baransi@babcomsoftware.com>
+Date: Wed, 22 Feb 2012 10:06:37 +0200
+Subject: [PATCH] socket enable for bluez 0_98
+
+* This is necessary for working with A2DP
+---
+ audio/audio.conf |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/audio/audio.conf b/audio/audio.conf
+index 302e046..9533ada 100644
+--- a/audio/audio.conf
++++ b/audio/audio.conf
+@@ -3,6 +3,7 @@
+ # This section contains options which are not specific to any
+ # particular interface
+ [General]
++Enable=Socket
+ 
+ # Switch to master role for incoming connections (defaults to true)
+ #Master=true
+-- 
+1.7.1
+
diff --git a/recipes/bluez/files/0002-bluez4-fix-synchronization-between-bluetoothd-and-dr.patch b/recipes/bluez/files/0002-bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
new file mode 100755
index 0000000..4897647
--- /dev/null
+++ b/recipes/bluez/files/0002-bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
@@ -0,0 +1,50 @@
+From ddca351e504dc3cb8d91ea10a1863949699c6e50 Mon Sep 17 00:00:00 2001
+From: Vita Preskovsky <vitap@ti.com>
+Date: Tue, 13 Dec 2011 22:54:47 +0200
+Subject: [PATCH] bluez4: fix synchronization between bluetoothd and driver
+  * To fix situation when bluetoothd doesn't get messages
+    it expects to receive from the kernel. Therefore the
+    the required requests are sent again at the stage when device
+    is up. The mismatch caused to the list of adapters to be
+    empty.
+
+Signed-off-by: Vita Preskovsky <vitap@ti.com>
+---
+ plugins/hciops.c |   21 +++++++++++++++++++++
+ 1 files changed, 21 insertions(+), 0 deletions(-)
+
+diff --git a/plugins/hciops.c b/plugins/hciops.c
+index ecc0e86..e2198ee 100644
+--- a/plugins/hciops.c
++++ b/plugins/hciops.c
+@@ -2512,6 +2512,27 @@ static void device_devup_setup(int index)
+ 	hci_send_cmd(dev->sk, OGF_HOST_CTL, OCF_READ_STORED_LINK_KEY,
+ 					READ_STORED_LINK_KEY_CP_SIZE, &cp);
+ 
++	/* Even though it shouldn't happen it seems like we might miss 
++	 * initialization commands that kernel sends. So we check it here
++	 * to avoid situation when we have device but it is not in the list
++	 * of adapters. */
++       if (hci_test_bit(PENDING_FEATURES, &dev->pending))
++               hci_send_cmd(dev->sk, OGF_INFO_PARAM,
++                                       OCF_READ_LOCAL_FEATURES, 0, NULL);
++
++       if (hci_test_bit(PENDING_VERSION, &dev->pending))
++               hci_send_cmd(dev->sk, OGF_INFO_PARAM,
++                                       OCF_READ_LOCAL_VERSION, 0, NULL);
++
++       if (hci_test_bit(PENDING_NAME, &dev->pending))
++               hci_send_cmd(dev->sk, OGF_HOST_CTL,
++                                       OCF_READ_LOCAL_NAME, 0, NULL);
++
++       if (hci_test_bit(PENDING_BDADDR, &dev->pending))
++               hci_send_cmd(dev->sk, OGF_INFO_PARAM,
++                                       OCF_READ_BD_ADDR, 0, NULL);
++
++
+ 	if (!dev->pending)
+ 		init_adapter(index);
+ }
+-- 
+1.7.0.4
+
-- 
1.7.0.4



