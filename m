Received: from [131.111.8.135] (helo=ppsw-5.csi.cam.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1N5m1X-0004fF-5x
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 21:00:10 +0100
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:37180)
	by ppsw-5.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.155]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1N5m0O-0003po-Hk (Exim 4.70) for
	openembedded-devel@lists.openembedded.org
	(return-path <jic23@cam.ac.uk>); Wed, 04 Nov 2009 19:58:56 +0000
Message-ID: <4AF1DD1A.80005@cam.ac.uk>
Date: Wed, 04 Nov 2009 19:59:22 +0000
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Thunderbird 2.0.0.23 (X11/20091029)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 131.111.8.135
X-SA-Exim-Mail-From: jic23@cam.ac.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] IMote2 machine config
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
X-List-Received-Date: Wed, 04 Nov 2009 20:00:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
---
 conf/machine/imote2.conf |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/conf/machine/imote2.conf b/conf/machine/imote2.conf
new file mode 100644
index 0000000..278fd71
--- /dev/null
+++ b/conf/machine/imote2.conf
@@ -0,0 +1,15 @@
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
1.6.0.4



