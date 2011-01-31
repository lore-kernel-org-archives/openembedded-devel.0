Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1Pjq1m-0003WL-BD
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 10:26:30 +0100
Received: by fxm17 with SMTP id 17so5446952fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 01:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=9QFE/CBeZACQjVe9/YCJLjwLJO6D4YsKDk3ceqiL8Kk=;
	b=pMCqmaWWCDYHft4cFP6ELtUyBhdbK+N0M2MO2aoCs8+jPfJehN4sFbOlGkz3beXDXO
	v83L8yLDw0c+0qhRUB7raC6s6PJrUnhCBFSH0Y409CLYbZjr16Z5BX6JwblqY/0AA2Io
	JKMzvZz/Edp78LGBt3mn0u9ZYqlje5mziOjU4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=xHU/rBgpenlVEOq9dRUkIuJBlfQLUtYL/kaGOsm0/W5tUa7x1PkhC62sZyEvtbcivc
	6RHkfgzkBRcq1STVeb4qAf9uivmnIMKSX/hi1de+Rz9JOSL1c7MQIczbUq7TtUcCwkRR
	IBmVJXw+nLQG5Nx/auACs8QF2Ze98Wlk9ziYQ=
Received: by 10.103.134.17 with SMTP id l17mr1964796mun.49.1296465936230;
	Mon, 31 Jan 2011 01:25:36 -0800 (PST)
Received: from localhost.localdomain (dial-92-52-20-198-orange.orange.sk
	[92.52.20.198])
	by mx.google.com with ESMTPS id l3sm653867fan.0.2011.01.31.01.25.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 31 Jan 2011 01:25:35 -0800 (PST)
From: Marek Sujak <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 10:25:26 +0100
Message-Id: <1296465926-19202-1-git-send-email-sujak.marek@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v3] VMX25: Add machine support for vmx25
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
X-List-Received-Date: Mon, 31 Jan 2011 09:26:30 -0000

* i.mx25 cpu based module
* removed PREFERRED_VERSION_linux line
* added correct UBI VOLNAME
* tested on angstom console, terminal, x11, qt4e image
* depends on vmx25 barebox 2010.10 patch, vmx25 kernel 2.5.35 patch

Signed-off-by: Marek Sujak <sujak.marek@gmail.com>
---
 conf/machine/vmx25.conf |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/vmx25.conf

diff --git a/conf/machine/vmx25.conf b/conf/machine/vmx25.conf
new file mode 100644
index 0000000..2d82dd2
--- /dev/null
+++ b/conf/machine/vmx25.conf
@@ -0,0 +1,33 @@
+#@TYPE: Machine
+#@Name: Voipac vmx25 module
+#@DESCRIPTION: Machine configuration for Voipac vmx25 module & baseboard
+#@Homepage: http://voipac.com/#X25-DKT-265
+
+TARGET_ARCH = "arm"
+
+PREFERRED_PROVIDER_virtual/bootloader = "barebox"
+PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+
+MACHINE_FEATURES = "kernel26 alsa ext2 usbhost usbgadget touchscreen keyboard"
+
+GUI_MACHINE_CLASS = "bigscreen"
+XSERVER ?= "xserver-xorg \
+           xf86-input-tslib \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-input-keyboard \
+           xf86-video-fbdev \
+"
+
+# ubi fs args
+UBI_VOLNAME = "rootfs-vmx25"
+MKUBIFS_ARGS = "-m 2KiB -e 126KiB -c 989"
+UBINIZE_ARGS = "-m 2KiB -p 128KiB -s 512"
+
+IMAGE_FSTYPES += "tar.gz ubi"
+
+require conf/machine/include/tune-arm926ejs.inc
+
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttymxc0"
-- 
1.7.0.4



