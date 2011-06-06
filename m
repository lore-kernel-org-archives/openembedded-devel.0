Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QThKn-0000IZ-6A
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 23:27:41 +0200
Received: (qmail invoked by alias); 06 Jun 2011 21:24:24 -0000
Received: from p5B0A3086.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.48.134]
	by mail.gmx.net (mp013) with SMTP; 06 Jun 2011 23:24:24 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18+RmgGBzE+8mzcgBVHv1MpK3IY4urrw4AZIdDZpW
	UGsvNz8LiENmiL
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jun 2011 23:25:44 +0200
Message-Id: <1307395545-3738-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1307395545-3738-1-git-send-email-schnitzeltony@gmx.de>
References: <1307395545-3738-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [PATCH v2 1/2] mx28 SOC: set correct addresses for u-boot
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
X-List-Received-Date: Mon, 06 Jun 2011 21:27:41 -0000

The initial patch was build tested only because a hardware for tests was not
available at the time initial patches were sent. The modifications lead to the
following boot log (thanks to Christian Borutta for testing):

U-Boot 2009.08 (May 09 2011 - 16:42:53)

Freescale i.MX28 family
CPU:   454 MHz
BUS:   151 MHz
EMI:   205 MHz
GPMI:   24 MHz
DRAM:  128 MB
MMC:   IMX_SSP_MMC: 0, IMX_SSP_MMC: 1
In:    serial
Out:   serial
Err:   serial
Net:   got MAC address from IIM: 00:04:9f:01:4d:57
FEC0
Hit any key to stop autoboot:  0
reading uImage

2519812 bytes read
   Image Name:   Angstrom/2.6.35/mx28evk
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2519748 Bytes =  2.4 MB
   Load Address: 40008000
   Entry Point:  40008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
Linux version 2.6.35.3 (borutta@debian) (gcc version 4.5.3 20110311 (prerelease) (GCC) ) #1 PREEMPT Thu May 12 09:54:03 CEST 2011
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
CPU: VIVT data cache, VIVT instruction cache
Machine: Freescale MX28EVK board
...

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 conf/machine/include/imx28.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/imx28.inc b/conf/machine/include/imx28.inc
index 38248a8..b50f000 100644
--- a/conf/machine/include/imx28.inc
+++ b/conf/machine/include/imx28.inc
@@ -10,8 +10,8 @@ MACHINE_KERNEL_PR = "r0"
 
 KERNEL_IMAGETYPE = "uImage"
 
-UBOOT_ENTRYPOINT = "0x8000"
-UBOOT_LOADADDRESS = "0x8000"
+UBOOT_ENTRYPOINT = "0x40008000"
+UBOOT_LOADADDRESS = "0x40008000"
 
 EXTRA_IMAGEDEPENDS += "u-boot"
 
-- 
1.7.4.4



