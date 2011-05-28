Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QQR76-0004Uf-G6
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2011 23:32:04 +0200
Received: (qmail invoked by alias); 28 May 2011 21:28:56 -0000
Received: from p5B0A2956.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.41.86]
	by mail.gmx.net (mp047) with SMTP; 28 May 2011 23:28:56 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19J4f541xVJkZmnVy7H1ScLTtQTMkPtnIGdsaKwMB
	Bt5/EXrm/TII0m
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 May 2011 23:29:51 +0200
Message-Id: <1306618191-3066-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [PATCH] mx28evk: correct settings to make machine work
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
X-List-Received-Date: Sat, 28 May 2011 21:32:05 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 conf/machine/include/imx28.inc |    4 ++--
 conf/machine/mx28evk.conf      |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

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
 
diff --git a/conf/machine/mx28evk.conf b/conf/machine/mx28evk.conf
index e093ffa..823b502 100644
--- a/conf/machine/mx28evk.conf
+++ b/conf/machine/mx28evk.conf
@@ -17,7 +17,7 @@ XSERVER = "xserver-kdrive-fbdev"
 require conf/machine/include/imx28.inc
 
 # used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttymxc0"
+SERIAL_CONSOLE = "115200 ttyAM0"
 
 ROOT_FLASH_SIZE = "128"
 
-- 
1.7.4.4



