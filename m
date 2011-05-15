Received: from smtprelay-b21.telenor.se ([195.54.99.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QLWWW-00020F-Vy
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 10:18:01 +0200
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id 9484EEAC0D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 09:42:42 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ak5wAOqCz01T4zkqPGdsb2JhbACJH45xjgQLAQEBATcyyEeGGQSQEY53
X-IronPort-AV: E=Sophos;i="4.64,368,1301868000"; d="scan'208";a="189784807"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.42])
	by ipb1.telenor.se with ESMTP; 15 May 2011 09:42:42 +0200
From: ulf.samuelsson@atmel.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 09:42:39 +0200
Message-Id: <1305445359-4139-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] Set defaults to at91bootstrap-3.0 and u-boot-2009.11
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
X-List-Received-Date: Sun, 15 May 2011 08:18:01 -0000

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 conf/machine/at91sam9m10ekes.conf    |    8 ++++++--
 conf/machine/include/at91-2.6.30.inc |    6 +++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/conf/machine/at91sam9m10ekes.conf b/conf/machine/at91sam9m10ekes.conf
index 63d97a8..9b00e64 100644
--- a/conf/machine/at91sam9m10ekes.conf
+++ b/conf/machine/at91sam9m10ekes.conf
@@ -13,10 +13,14 @@ include conf/machine/include/at91-lcd.inc
 # Supported u-boot machines
 #UBOOT_MACHINE = "at91sam9m10g45ek_nandflash_config"
 #UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
-UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
 #UBOOT_MACHINE = "at91sam9m10g45ek_config"
+UBOOT_MACHINE = "at91sam9m10g45ek_sd"
 
-AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"
+#UBOOT_MACHINES = "at91sam9m10g45ek_sd at91sam9m10g45ek_nandflash at91sam9m10g45ek_dataflash"
+UBOOT_MACHINES = "at91sam9m10g45ek_sd at91sam9m10g45ek_nandflash at91sam9m10g45ek_dataflash"
+
+AT91BOOTSTRAP_BOARD = "at91sam9m10dfes at91sam9m10ekes at91sam9m10nfes at91sam9m10sdu"
 
 MACHINE_FEATURES += "usbhost"
 
diff --git a/conf/machine/include/at91-2.6.30.inc b/conf/machine/include/at91-2.6.30.inc
index e245b15..37a7188 100644
--- a/conf/machine/include/at91-2.6.30.inc
+++ b/conf/machine/include/at91-2.6.30.inc
@@ -7,10 +7,10 @@ SOC_FAMILY = "at91"
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 PREFERRED_VERSION_linux = "2.6.30"
 
-PREFERRED_PROVIDER_at91bootstrap = "at91bootstrap_2.13"
-PREFERRED_VERSION_at91bootstrap = "2.13"
+PREFERRED_PROVIDER_at91bootstrap = "at91bootstrap"
+PREFERRED_VERSION_at91bootstrap = "3.0"
 
-PREFERRED_PROVIDER_u-boot = "u-boot_2009.11"
+PREFERRED_PROVIDER_u-boot = "u-boot"
 PREFERRED_VERSION_u-boot = "2009.11"
 
 KERNEL_IMAGETYPE = "uImage"
-- 
1.7.4.1



