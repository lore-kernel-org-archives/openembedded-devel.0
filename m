Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N344I-0004uB-S5
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Oct 2009 09:39:49 +0100
Received: by mail-ew0-f209.google.com with SMTP id 5so489094ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2009 01:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=TX8eyZ5NqagGxJcr6eN7qkuaSmbtFKirROy5MJaaOFY=;
	b=PQOnZzdDuISp0CqqxlH+a5XOlCBdbpu8Zbu6HW/IYaFkWG0sg2abLqfLyKsrmY56S+
	2kyXxOgNkBHsfGVlVxwc52TzironxR9t7z6rIl6Y3YSsXqueVZGjuzqPxOiz1LXLFjuF
	J2xBHN9PMkYLDzT52kjJ8IAofPv/wTkyo2L+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lfVuBC5LN2S6pCr2LRNwdczNl1AqqRxbnobo6mORi2MjHJ3tYNuyA5SXPdyZF/B+pP
	hT3XB9iex/7bgcJTFk095GHRm4PzcBdgKtRvVzmnq97zbzrHDk8c0+yZvoN0jgI8unu8
	SehtGwIgANS6wpFfcd1wQ7nZECOpg7yUTDt7A=
Received: by 10.211.147.36 with SMTP id z36mr314777ebn.2.1256719115316;
	Wed, 28 Oct 2009 01:38:35 -0700 (PDT)
Received: from localhost.localdomain (248.Red-213-97-239.staticIP.rima-tde.net
	[213.97.239.248])
	by mx.google.com with ESMTPS id 10sm2203065eyz.19.2009.10.28.01.38.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 28 Oct 2009 01:38:34 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Oct 2009 09:38:36 +0100
Message-Id: <1256719119-2413-3-git-send-email-eballetbo@gmail.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1256719119-2413-2-git-send-email-eballetbo@gmail.com>
References: <1256719119-2413-1-git-send-email-eballetbo@gmail.com>
	<1256719119-2413-2-git-send-email-eballetbo@gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Subject: [STABLE][PATCH 2/5] igep0020: Add IGEP v2 support to OE
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
X-List-Received-Date: Wed, 28 Oct 2009 08:39:50 -0000

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



