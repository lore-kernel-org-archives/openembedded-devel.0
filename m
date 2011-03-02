Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1PumES-0008MQ-45
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 14:36:48 +0100
Received: by bwz10 with SMTP id 10so137508bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 05:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=4HyKlgkGVIwwBPIFrABK/Jag7RVLuw7DpME+WG9elz8=;
	b=IAGiCIpGGZrYgJrl4zas6uOiHWj1d35T6SexpHFfqOnpjD7WzeGiW6ycwaFyC+10L2
	0ai2NrAQ09X2c4jDGgjBm2wtyD5L4MqKa2dK1RRtyMWp0kClhVvdgCgs6Q7G5lMm0Dnb
	dSazHbqxPTPsMCgDi2J/HiTiSLM9jJYDJbTag=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=MKwphMG6pAlphJ+7JN860LyBDmKSseTAEt+/fYEjpN/eDpOtRlecpL/zEQzYLeeqLx
	9nTED2YmNH0QAckMOLNMJN6WLIN44i55po7gr7as2wlTlkc4hjhjhmfBGj1lEtxYoczw
	6Qs6+2Uq9m7fMEHhGK/XJ7D8qgPWq8RuWbXgU=
Received: by 10.204.36.88 with SMTP id s24mr7380449bkd.68.1299072920767;
	Wed, 02 Mar 2011 05:35:20 -0800 (PST)
Received: from localhost.localdomain ([90.163.57.54])
	by mx.google.com with ESMTPS id z18sm4163436bkf.20.2011.03.02.05.35.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 05:35:20 -0800 (PST)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2011 14:35:26 +0100
Message-Id: <1299072929-4465-1-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.2
Subject: [PATCH 1/4] exocpslate.conf: add support for exoPC Slate tablet machine.
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
X-List-Received-Date: Wed, 02 Mar 2011 13:36:48 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 conf/machine/exopcslate.conf |   42 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/exopcslate.conf

diff --git a/conf/machine/exopcslate.conf b/conf/machine/exopcslate.conf
new file mode 100644
index 0000000..d7eb86b
--- /dev/null
+++ b/conf/machine/exopcslate.conf
@@ -0,0 +1,42 @@
+#@TYPE: Machine
+#@NAME: exocpslate
+#@DESCRIPTION: Machine configuration for the ExoPC Slate machine
+
+
+TARGET_ARCH = "i686"
+
+PREFERRED_VERSION_linux = "2.6.37"
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+XSERVER = "xserver-xorg \
+        xserver-xorg-extension-glx \
+        xserver-xorg-extension-dri \
+        xf86-input-tslib \
+        xf86-input-evdev \
+        xf86-input-evtouch \
+        xf86-input-mouse \
+        xf86-input-keyboard \
+        xf86-video-fbdev \
+"
+
+
+KERNEL_IMAGETYPE = "bzImage"
+
+GLIBC_ADDONS = "nptl"
+GLIBC_EXTRA_OECONF = "--with-tls"
+
+IMAGE_FSTYPES ?= "tar.gz"
+IMAGE_DEVICE_TABLES = " \   
+  files/device_table-minimal.txt \
+  files/device_table_add-loop.txt \
+  files/device_table_add-scsi.txt \
+"
+
+MACHINE_FEATURES = "kernel26 apm alsa bluetooth wifi vfat phone screen touchscreen keyboard pci usbhost acpi ext2 ext3 ext4 x86"
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
+
+module_autoload_hci_usb = "hci_usb"
+module_autoload_g_ether = "g_ether"
+
+require conf/machine/include/tune-atom.inc
+
-- 
1.7.2



