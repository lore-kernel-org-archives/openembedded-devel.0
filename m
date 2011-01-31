Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pk0S2-0007An-O0
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 21:34:20 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 89848EB582
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 21:33:25 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aqw+ANOqRk1T4zjzPGdsb2JhbACIXo16jiAMAQEBATUvvhqFTgSMIQ
X-IronPort-AV: E=Sophos;i="4.60,405,1291590000"; d="scan'208";a="169036494"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb2.telenor.se with ESMTP; 31 Jan 2011 21:33:25 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 21:33:22 +0100
Message-Id: <1296506003-4540-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH 1/2] make sd-boot default for sam9m10ekes
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
X-List-Received-Date: Mon, 31 Jan 2011 20:34:20 -0000

---
 conf/machine/at91sam9m10ekes.conf |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/conf/machine/at91sam9m10ekes.conf b/conf/machine/at91sam9m10ekes.conf
index 63d97a8..8f52689 100644
--- a/conf/machine/at91sam9m10ekes.conf
+++ b/conf/machine/at91sam9m10ekes.conf
@@ -13,10 +13,12 @@ include conf/machine/include/at91-lcd.inc
 # Supported u-boot machines
 #UBOOT_MACHINE = "at91sam9m10g45ek_nandflash_config"
 #UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
-UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
 #UBOOT_MACHINE = "at91sam9m10g45ek_config"
+UBOOT_MACHINE = "at91sam9m10g45ek_sd_config"
+UBOOT_MACHINES = "at91sam9m10g45ek_sd at91sam9m10g45ek_nandflash at91sam9m10g45ek_dataflash"
 
-AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"
+AT91BOOTSTRAP_BOARD = "at91sam9m10dfes at91sam9m10ekes at91sam9m10nfes at91sam9m10sdu"
 
 MACHINE_FEATURES += "usbhost"
 
-- 
1.6.3.3



