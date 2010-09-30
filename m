Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P1NpF-0001pB-8Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 20:25:50 +0200
Received: by gyg8 with SMTP id 8so928120gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 11:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=2G3MplvoipRJwxuFRT/0OWcqqsGh22GmAenqz22qVE4=;
	b=VNVNtUevws7pxUMJfpaopxLqBTr/UnTTBEZ2GN6NOaak5lhDRS8+CwO1rK7Nlhl0P3
	ZTYtg09vFDdwx4kk8IlcX4iMZcR5+VwOlReeDjtFnmCb1GDSPUnk3RUAHgmJeaR9ScSu
	X2GFtXUHFLvIHfuspdd+9h3ylwXxzlgnWLEG0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=V14KGTWIwx2d4udFKj4XqZt73odd5RMdTJh0m62/8VMbiZstd14SgNE/qoNOYyuOUS
	uCY3rlRXyJLmM3jL6IzB7oiXJZa6/PUCpxXt3UPt21lklli6rIdV4ErgzJfKxhr4y3Fb
	m+HeH6vO5MC+XSIlITpUA0h+M3fTFj1NJDuwc=
Received: by 10.220.129.15 with SMTP id m15mr120223vcs.94.1285871133941;
	Thu, 30 Sep 2010 11:25:33 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r15sm173572vbp.0.2010.09.30.11.25.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 30 Sep 2010 11:25:32 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Sep 2010 13:12:02 -0500
Message-Id: <1285870326-27944-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/5] ti816x: add support for ti816x family of devices
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
X-List-Received-Date: Thu, 30 Sep 2010 18:25:50 -0000

* Add support for the TI816x family of devices.  This includes
  the c6a816x and am389x devices.
* Separate machine types are used because not all packages
  are valid for each machine.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 conf/machine/am389x-evm.conf    |    5 +++++
 conf/machine/c6a816x-evm.conf   |    5 +++++
 conf/machine/include/ti816x.inc |   26 ++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/am389x-evm.conf
 create mode 100644 conf/machine/c6a816x-evm.conf
 create mode 100644 conf/machine/include/ti816x.inc

diff --git a/conf/machine/am389x-evm.conf b/conf/machine/am389x-evm.conf
new file mode 100644
index 0000000..9bfe7a7
--- /dev/null
+++ b/conf/machine/am389x-evm.conf
@@ -0,0 +1,5 @@
+#@TYPE: Machine
+#@NAME: am389x evm
+#@DESCRIPTION: Machine configuration for the am389x evm
+
+require conf/machine/include/ti816x.inc
diff --git a/conf/machine/c6a816x-evm.conf b/conf/machine/c6a816x-evm.conf
new file mode 100644
index 0000000..a7ab9b0
--- /dev/null
+++ b/conf/machine/c6a816x-evm.conf
@@ -0,0 +1,5 @@
+#@TYPE: Machine
+#@NAME: c6a816x evm
+#@DESCRIPTION: Machine configuration for the c6a816x evm
+
+require conf/machine/include/ti816x.inc
diff --git a/conf/machine/include/ti816x.inc b/conf/machine/include/ti816x.inc
new file mode 100644
index 0000000..e5205f7
--- /dev/null
+++ b/conf/machine/include/ti816x.inc
@@ -0,0 +1,26 @@
+TARGET_ARCH = "arm"
+SOC_FAMILY = "ti816x"
+
+require conf/machine/include/tune-cortexa8.inc
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-omap3"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+
+# Increase this everytime you change something in the kernel
+MACHINE_KERNEL_PR = "r1"
+
+KERNEL_IMAGETYPE = "uImage"
+
+UBOOT_ARCH = "arm"
+UBOOT_MACHINE = "ti8168_evm_config"
+UBOOT_ENTRYPOINT = "0x80008000"
+UBOOT_LOADADDRESS = "0x80008000"
+
+# Only build u-boot
+EXTRA_IMAGEDEPENDS += "u-boot"
+
+# Ship all kernel modules
+IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
+SERIAL_CONSOLE = "115200 ttyS2"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 ethernet"
-- 
1.7.0.4



