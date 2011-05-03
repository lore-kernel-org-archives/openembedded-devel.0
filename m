Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QHGoX-00053a-IP
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 16:43:26 +0200
Received: (qmail invoked by alias); 03 May 2011 14:40:21 -0000
Received: from p5B0A2372.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.35.114]
	by mail.gmx.net (mp010) with SMTP; 03 May 2011 16:40:21 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19jcRlJeJlj3dj297KyIQrlxDkkQGIY+5UgU85eIY
	m9I0lurOXkXPUm
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 May 2011 16:40:51 +0200
Message-Id: <1304433651-3278-4-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1304433651-3278-1-git-send-email-schnitzeltony@gmx.de>
References: <1304433651-3278-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [PATCH v2 4/4] mx28evk: Add new machine definition
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
X-List-Received-Date: Tue, 03 May 2011 14:43:26 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 conf/machine/include/imx28.inc |   19 +++++++++++++++++++
 conf/machine/mx28evk.conf      |   23 +++++++++++++++++++++++
 2 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/include/imx28.inc
 create mode 100644 conf/machine/mx28evk.conf

diff --git a/conf/machine/include/imx28.inc b/conf/machine/include/imx28.inc
new file mode 100644
index 0000000..38248a8
--- /dev/null
+++ b/conf/machine/include/imx28.inc
@@ -0,0 +1,19 @@
+SOC_FAMILY = "mx28"
+TARGET_ARCH = "arm"
+
+require conf/machine/include/tune-arm926ejs.inc
+
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+
+# Increase this everytime you change something in the kernel
+MACHINE_KERNEL_PR = "r0"
+
+KERNEL_IMAGETYPE = "uImage"
+
+UBOOT_ENTRYPOINT = "0x8000"
+UBOOT_LOADADDRESS = "0x8000"
+
+EXTRA_IMAGEDEPENDS += "u-boot"
+
+IMAGE_FSTYPES += "jffs2 tar.bz2"
+
diff --git a/conf/machine/mx28evk.conf b/conf/machine/mx28evk.conf
new file mode 100644
index 0000000..e093ffa
--- /dev/null
+++ b/conf/machine/mx28evk.conf
@@ -0,0 +1,23 @@
+#@Name: Freescale i.MX28 Evaluation Kit
+#@DESCRIPTION: Machine configuration for Freescale i.MX28 Evaluation Kit
+#@Homepage: http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=MCIMX28EVKJ&fr=g
+
+UBOOT_MACHINE = "mx28_evk_config"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-imx"
+
+MACHINE_FEATURES = "kernel26 apm alsa ext2 usbhost usbgadget screen"
+
+MACHINE_GUI_CLASS = "bigscreen"
+LOGO_SIZE = "vga"
+
+PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
+XSERVER = "xserver-kdrive-fbdev"
+
+require conf/machine/include/imx28.inc
+
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttymxc0"
+
+ROOT_FLASH_SIZE = "128"
+
-- 
1.7.4.4



