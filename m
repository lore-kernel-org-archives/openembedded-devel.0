Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Qy1DS-0007vs-JX
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 14:45:26 +0200
Received: by fxg11 with SMTP id 11so4525307fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2011 05:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=lTJ+I4hAMDd3gbjd3vA3WHNhmjZuaTxfrBJeV0KBeWw=;
	b=jSnK2CGeu68Q5sHXEEE3FH+tZcMtGuxU050Eb2ClAjM0BBxKFsYY06pxMlxSoB5MLO
	0wonzyaGocMKTHL7Yca1XhJ2hDW+fJZaQLw1a7iY+opevYyUvu0SxMOlsQit0sPCZeBO
	/AXsgJ74LAxf1H7fSpWp+j9IyxbjKU282vbEo=
Received: by 10.223.21.141 with SMTP id j13mr219041fab.79.1314621634623;
	Mon, 29 Aug 2011 05:40:34 -0700 (PDT)
Received: from localhost.localdomain (mx2.promwad.com [195.222.87.218])
	by mx.google.com with ESMTPS id n7sm3735984faa.2.2011.08.29.05.40.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Aug 2011 05:40:34 -0700 (PDT)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.76)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1Qy18j-0006yf-3X; Mon, 29 Aug 2011 15:40:33 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Aug 2011 15:40:21 +0300
Message-Id: <1314621621-26512-4-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1314621621-26512-1-git-send-email-yauhen.kharuzhy@promwad.com>
References: <1314621621-26512-1-git-send-email-yauhen.kharuzhy@promwad.com>
Cc: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
Subject: [PATCH 3/3] Add machine configuration for mycable's Jade Evaluation Board
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
X-List-Received-Date: Mon, 29 Aug 2011 12:45:26 -0000

mycable's Jade Evaluation Board is evaluation kit for
Fujitsu MB86R01 'Jade' SoC.

1. http://www.fujitsu.com/emea/services/microelectronics/gdc/evalbds/jade-evalboard.html

Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
---
 conf/machine/jade-sk-86r01.conf |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/jade-sk-86r01.conf

diff --git a/conf/machine/jade-sk-86r01.conf b/conf/machine/jade-sk-86r01.conf
new file mode 100644
index 0000000..2c40a68
--- /dev/null
+++ b/conf/machine/jade-sk-86r01.conf
@@ -0,0 +1,30 @@
+#@TYPE: Machine
+#@Name: mycable's Fujitsu SK-86R01 'Jade' Evaluation Board
+#@DESCRIPTION: Machine configuration for the Jade Evaluation Board
+
+TARGET_ARCH = "arm"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-jade"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-jade"
+PREFERRED_VERSION_linux-jade = "2.6.27"
+PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+
+KERNEL_IMAGETYPE = "uImage"
+
+
+UBOOT_MACHINE = "jadeevalkit_config"
+UBOOT_ENTRYPOINT = 40008000
+
+#don't try to access tty1
+USE_VT = "0"
+
+MACHINE_FEATURES = "kernel26 alsa ext2 usbgadget screen touchscreen"
+EXTRA_IMAGEDEPENDS += "u-boot-jade"
+
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttyS0"
+IMAGE_FSTYPES ?= "jffs2"
+EXTRA_IMAGECMD_jffs2 = "--pad --little-endian --eraseblock=0x20000 -n"
+
+require conf/machine/include/tune-arm926ejs.inc
+
-- 
1.7.5.4



