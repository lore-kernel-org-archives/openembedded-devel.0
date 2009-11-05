Received: from [131.111.8.131] (helo=ppsw-1.csi.cam.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1N62Sd-0005Vx-3y
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 14:33:14 +0100
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:60607)
	by ppsw-1.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.151]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1N6288-000180-65 (Exim 4.70) for
	openembedded-devel@lists.openembedded.org
	(return-path <jic23@cam.ac.uk>); Thu, 05 Nov 2009 13:12:00 +0000
Message-ID: <4AF2CF3B.2060205@cam.ac.uk>
Date: Thu, 05 Nov 2009 13:12:27 +0000
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Thunderbird 2.0.0.23 (X11/20091029)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AF1DD1A.80005@cam.ac.uk>	<200911042110.58315.marcin@juszkiewicz.com.pl>
	<4AF2C807.9070600@cam.ac.uk>
In-Reply-To: <4AF2C807.9070600@cam.ac.uk>
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 131.111.8.131
X-SA-Exim-Mail-From: jic23@cam.ac.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH v2] IMote2 machine config
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
X-List-Received-Date: Thu, 05 Nov 2009 13:33:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
---
Only change is to provide some info about the board.
 conf/machine/imote2.conf |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/imote2.conf

diff --git a/conf/machine/imote2.conf b/conf/machine/imote2.conf
new file mode 100644
index 0000000..7f94f29
--- /dev/null
+++ b/conf/machine/imote2.conf
@@ -0,0 +1,23 @@
+#-----------------------------------------------------------------------------
+#@TYPE: Machine
+#@NAME: IMote2
+#@DESCRIPTION: Machine configuration for the IMote2
+#              http://imote2-linux.sourceforge.net
+#-----------------------------------------------------------------------------
+
+
+TARGET_ARCH= "arm"
+require conf/machine/include/tune-xscale.inc
+KERNEL_IMAGETYPE="zImage"
+IMAGE_FSTYPE="jffs2"
+EXTRA_IMAGECMD_jffs2 = "--little-endian -e 0x40000 --pad=0x01DC0000 --eraseblock=0x20000"
+MACHINE_FEATURES ="kernel26 usbgadget"
+CMDLINE="root=/dev/mtdblock2 rootfstype=jffs2 console=ttyS2,115200 mem=32M"
+
+# used by sysvinit_2
+SERIAL_CONSOLE = "115200 ttyS2"
+
+ROOT_FLASH_SIZE = "30"
+MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"
+
+RDEPENDS_kernel-base = ""
-- 
1.6.4.4



