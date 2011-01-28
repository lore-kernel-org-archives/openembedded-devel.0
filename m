Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1Pik8F-000127-D3
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 09:56:39 +0100
Received: by fxm17 with SMTP id 17so3140699fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 00:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=j08v/LHdlaMhK/ElPWHswzWDLL1Y7iuIyg+82lKuD1k=;
	b=efWuSWinhaIgqqeSHdbieS70hydVNwTlu9cxb5R0u/qnEHfWksvJlHT3JSvc116Nw7
	gZdbXjwUHGiALo9h9DXczunnH1pjNLh4BeCqjME+nULiBrU5qe+sttulo4dSnebjZga5
	JYuNnrtUmkVcqrd/F78+N07AB9OftFdiB/uLs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=PrTVswJI+sNED8w58wGoIzjHWHJ77OZC4itYm/i2EQFZQ53LppKghGoGoydO07yP9J
	BFbs0MzeTfvAXTRp3PDpTuhXZkmhcOtOUj3b6tuLHIm1t/QP2qd77bLykN2sdO3dmJLF
	2a+n5iWKv/XQi0X5jEaVek2yBwT1vHBS2MZBI=
Received: by 10.223.96.6 with SMTP id f6mr2117382fan.22.1296204946819;
	Fri, 28 Jan 2011 00:55:46 -0800 (PST)
Received: from localhost.localdomain (dial-92-52-20-198-orange.orange.sk
	[92.52.20.198])
	by mx.google.com with ESMTPS id f24sm6318615fak.24.2011.01.28.00.55.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 28 Jan 2011 00:55:45 -0800 (PST)
From: "sujak.marek" <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jan 2011 09:54:46 +0100
Message-Id: <1296204886-12146-1-git-send-email-sujak.marek@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] Added machine config file for vmx25 module. * http://voipac.com/#X25-DKT-265 Signed-off-by: sujak.marek <sujak.marek@gmail.com>
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
X-List-Received-Date: Fri, 28 Jan 2011 08:56:39 -0000

---
 conf/machine/vmx25.conf |   38 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/vmx25.conf

diff --git a/conf/machine/vmx25.conf b/conf/machine/vmx25.conf
new file mode 100644
index 0000000..8ba7197
--- /dev/null
+++ b/conf/machine/vmx25.conf
@@ -0,0 +1,38 @@
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
+PREFERRED_VERSION_linux = "2.6.35"
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
+# Data Image FG0700K6DSSWBG01 TFT lcd
+#MACHINE_DISPLAY_WIDTH_PIXELS = "800"
+#MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
+#MACHINE_DISPLAY_PPI = "133"
+
+# ubi fs args
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



