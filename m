Received: from [72.14.220.159] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N35ux-00083G-C6
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Oct 2009 11:38:18 +0100
Received: by fg-out-1718.google.com with SMTP id d23so352796fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2009 03:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Oeft//gLDEBY4wjpIi1uJ9tbLv9s9Df/EQiuTCEePsg=;
	b=gymxuZBOZolYEfkGVEZVzBrNde8MfhKilYObCzg+0cruUbbSWGduOX8v0r4Kw31p10
	IUsxP9FnHoFXS8CpB1h+BvJ5ccHUevgGB3tYP9CkkHA3Byhcx1w+u4WnRQd6TjLr1S0u
	l5Ebj38cii+TMXl94DcTAfAqvHEpvGiW22rE4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Y/eRrVuth6yEF+n7hzTnN57qDNEv8ncievv5prfT1Pmx1ZYb8q3meTR5hx/2MphCTZ
	LCcYF4IrkiOrl7NUvian2LGZeEyPn+w6iNDQnAjKb1WsznktjvLfOFPFufE4yqE9CQzl
	4ZxUeIx+WvmejSwidXsNQcrMUFKFn4iBmB39A=
Received: by 10.86.235.14 with SMTP id i14mr5526113fgh.52.1256726230764;
	Wed, 28 Oct 2009 03:37:10 -0700 (PDT)
Received: from localhost.localdomain (248.Red-213-97-239.staticIP.rima-tde.net
	[213.97.239.248])
	by mx.google.com with ESMTPS id 3sm2027513fge.29.2009.10.28.03.37.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 28 Oct 2009 03:37:10 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Oct 2009 11:37:18 +0100
Message-Id: <1256726238-2324-1-git-send-email-eballetbo@gmail.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Subject: [STABLE][PATCH-v2 2/2] igep0020: Add IGEP v2 support to OE
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
X-List-Received-Date: Wed, 28 Oct 2009 10:38:18 -0000

From: Enric Balletbo i Serra <eballetbo@iseebcn.com>


Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 conf/machine/igep0020.conf |   45 ++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/igep0020.conf

diff --git a/conf/machine/igep0020.conf b/conf/machine/igep0020.conf
new file mode 100644
index 0000000..deb1723
--- /dev/null
+++ b/conf/machine/igep0020.conf
@@ -0,0 +1,45 @@
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
+require conf/machine/include/omap3.inc
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-igep2"
+
+KERNEL_IMAGETYPE = "uImage"
+
+UBOOT_MACHINE = "omap3_igep0020b_config"
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



