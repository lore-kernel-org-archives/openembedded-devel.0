Received: from [213.4.138.5] (helo=IMPaqm5.telefonica.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enric.balletbo@telefonica.net>) id 1MnDQt-0006Ht-Ea
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Sep 2009 17:25:38 +0200
Received: from IMPmailhost6.adm.correo ([10.20.102.127])
	by IMPaqm5.telefonica.net with bizsmtp
	id gdey1c00u2kvMAa3RfR6ap; Mon, 14 Sep 2009 17:25:06 +0200
Received: from localhost.localdomain ([213.97.239.248])
	by IMPmailhost6.adm.correo with BIZ IMP
	id gfQk1c00S5NFMbH1mfQlgL; Mon, 14 Sep 2009 17:24:45 +0200
X-TE-authinfo: authemail="enric.balletbo$telefonica.net"
	|auth_email="enric.balletbo@telefonica.net"
X-TE-AcuTerraCos: auth_cuTerraCos="cosuitnetc01"
From: enric.balletbo@telefonica.net
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Sep 2009 17:25:02 +0200
Message-Id: <1252941903-6186-2-git-send-email-enric.balletbo@telefonica.net>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <1252941903-6186-1-git-send-email-enric.balletbo@telefonica.net>
References: <> <1252941903-6186-1-git-send-email-enric.balletbo@telefonica.net>
X-SA-Exim-Connect-IP: 213.4.138.5
X-SA-Exim-Mail-From: enric.balletbo@telefonica.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Subject: [PATCH] igep0020: Add IGEP v2 support to OE
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
X-List-Received-Date: Mon, 14 Sep 2009 15:25:38 -0000

From: Enric Balletbo i Serra <eballetbo@iseebcn.com>


Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 conf/machine/igep0020.conf |   46 ++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/igep0020.conf

diff --git a/conf/machine/igep0020.conf b/conf/machine/igep0020.conf
new file mode 100644
index 0000000..f3cdcba
--- /dev/null
+++ b/conf/machine/igep0020.conf
@@ -0,0 +1,46 @@
+#@TYPE: Machine
+#@NAME: IGEP0020 machine
+#@DESCRIPTION: Machine configuration for the http://www.myigep.com/ IGEP v2.x boards
+TARGET_ARCH = "arm"
+
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+XSERVER = "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-video-omapfb \
+           xf86-input-keyboard"
+
+# Only has DVI connector for external screen
+GUI_MACHINE_CLASS = "bigscreen"
+
+require conf/machine/include/tune-cortexa8.inc
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-igep2"
+
+# Increase this everytime you change something in the kernel
+MACHINE_KERNEL_PR = "r0" 
+
+KERNEL_IMAGETYPE = "uImage"
+
+IMAGE_FSTYPES += "tar.bz2 ubi"
+
+# Guesswork
+SERIAL_CONSOLE = "115200 ttyS2"
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    129024 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 1996 LEBs
+MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1996"
+
+# do ubiattach /dev/ubi_ctrl -m 4
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              512
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
+
+# MACHINE_EXTRA_RRECOMMENDS = " omap3-sgx-modules "
+MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
-- 
1.5.4.3



