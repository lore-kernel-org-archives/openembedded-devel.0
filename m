Received: from compulab.co.il ([67.18.134.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NIGlx-0002bc-5k
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 08:15:44 +0100
Received: from [62.90.235.247] (helo=zimbra-mta.compulab.co.il)
	by compulab.site5.com with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NIGkI-0001ie-Su
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 01:14:00 -0600
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 06A2E9A034F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2009 09:13:56 +0200 (IST)
X-Virus-Scanned: amavisd-new at compulab.co.il
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
	by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id we7kN5On6BwL; Wed,  9 Dec 2009 09:13:50 +0200 (IST)
Received: from droid.compulab.local (droid.compulab.local [10.1.1.77])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 808669A0359;
	Wed,  9 Dec 2009 09:13:50 +0200 (IST)
Received: from droid.compulab.local (localhost [127.0.0.1])
	by droid.compulab.local (8.14.0/8.14.0) with ESMTP id nB97Djed011585;
	Wed, 9 Dec 2009 09:13:45 +0200
Received: (from mike@localhost)
	by droid.compulab.local (8.14.0/8.14.0/Submit) id nB97Dj5q011584;
	Wed, 9 Dec 2009 09:13:45 +0200
X-Authentication-Warning: droid.compulab.local: mike set sender to
	mike@compulab.co.il using -f
From: Mike Rapoport <mike@compulab.co.il>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Dec 2009 09:13:41 +0200
Message-Id: <c3f2222be0c2d362e362af53c29d624c4466b665.1260342678.git.mike@compulab.co.il>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <cover.1260342678.git.mike@compulab.co.il>
References: <cover.1260342678.git.mike@compulab.co.il>
X-ACL-Warn: {
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - compulab.site5.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 67.18.134.219
X-SA-Exim-Mail-From: mike@compulab.co.il
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 3/5] cm-t35: add machine configuration
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
X-List-Received-Date: Wed, 09 Dec 2009 07:15:45 -0000

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 conf/machine/cm-t35.conf |   46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/cm-t35.conf

diff --git a/conf/machine/cm-t35.conf b/conf/machine/cm-t35.conf
new file mode 100644
index 0000000..ccb9f95
--- /dev/null
+++ b/conf/machine/cm-t35.conf
@@ -0,0 +1,46 @@
+#@TYPE: Machine
+#@NAME: CM-T35 machine
+#@DESCRIPTION: Machine configuration for the CompuLab CM-T35 board (http://www.compulab.co.il/t3530/html/t3530-cm-datasheet.htm)
+
+TARGET_ARCH = "arm"
+
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+XSERVER = "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+	   xf86-input-evtouch \
+	   xf86-input-tslib \
+           xf86-video-omapfb \
+           xf86-input-keyboard"
+
+GUI_MACHINE_CLASS = "bigscreen"
+
+require conf/machine/include/omap3.inc
+
+IMAGE_FSTYPES += "tar.bz2 ubi"
+EXTRA_IMAGECMD_jffs2 = "-lnp "
+
+# Guesswork
+SERIAL_CONSOLE = "115200 ttyS2"
+
+UBOOT_MACHINE = "cm_t35_config"
+PREFERRED_VERSION_u-boot = "git"
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    126976 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 4039 LEBs
+MKUBIFS_ARGS = "-m 2048 -e 126976 -c 4039"
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              512
+UBINIZE_ARGS = "-O 2048 -m 2048 -p 128KiB"
+
+MACHINE_EXTRA_RRECOMMENDS = "marvell-sdio-fw"
+MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa wifi ext2"
+
-- 
1.6.4.4



