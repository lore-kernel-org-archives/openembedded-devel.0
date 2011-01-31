Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pk0qi-000845-3m
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 21:59:48 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id E25E6EB912
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 21:58:54 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aqw+ALmwRk1T4zjzPGdsb2JhbACIXo16jiAMAQEBATUvvgyFTgSMIQ
X-IronPort-AV: E=Sophos;i="4.60,405,1291590000"; d="scan'208";a="170547323"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb1.telenor.se with ESMTP; 31 Jan 2011 21:58:54 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 21:58:52 +0100
Message-Id: <1296507532-5364-2-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1296507532-5364-1-git-send-email-ulf.samuelsson@atmel.com>
References: <1296507532-5364-1-git-send-email-ulf.samuelsson@atmel.com>
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH v2 2/2] Indicate availability of sd-boot for at91sam9g45/m10
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
X-List-Received-Date: Mon, 31 Jan 2011 20:59:48 -0000


Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 conf/machine/at91sam9g45ek.conf    |    1 +
 conf/machine/at91sam9g45ekes.conf  |    1 +
 conf/machine/at91sam9m10g45ek.conf |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/machine/at91sam9g45ek.conf b/conf/machine/at91sam9g45ek.conf
index 406cc52..46ed8ad 100644
--- a/conf/machine/at91sam9g45ek.conf
+++ b/conf/machine/at91sam9g45ek.conf
@@ -15,6 +15,7 @@ include conf/machine/include/at91-lcd.inc
 #UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
 UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
 #UBOOT_MACHINE = "at91sam9m10g45ek_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_sd_config"
 #UBOOT_MACHINE = "at91sam9g45ekes_nandflash_config"
 #UBOOT_MACHINE = "at91sam9g45ekes_dataflash_config"
 #UBOOT_MACHINE = "at91sam9g45ekes_dataflash_cs0_config"
diff --git a/conf/machine/at91sam9g45ekes.conf b/conf/machine/at91sam9g45ekes.conf
index a736b5c..6120987 100644
--- a/conf/machine/at91sam9g45ekes.conf
+++ b/conf/machine/at91sam9g45ekes.conf
@@ -15,6 +15,7 @@ include conf/machine/include/at91-lcd.inc
 #UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
 UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
 #UBOOT_MACHINE = "at91sam9m10g45ek_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_sd_config"
 #UBOOT_MACHINE = "at91sam9g45ekes_nandflash_config"
 #UBOOT_MACHINE = "at91sam9g45ekes_dataflash_config"
 #UBOOT_MACHINE = "at91sam9g45ekes_dataflash_cs0_config"
diff --git a/conf/machine/at91sam9m10g45ek.conf b/conf/machine/at91sam9m10g45ek.conf
index f3be65d..979d58a 100644
--- a/conf/machine/at91sam9m10g45ek.conf
+++ b/conf/machine/at91sam9m10g45ek.conf
@@ -15,6 +15,7 @@ include conf/machine/include/at91-lcd.inc
 #UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_config"
 UBOOT_MACHINE = "at91sam9m10g45ek_dataflash_cs0_config"
 #UBOOT_MACHINE = "at91sam9m10g45ek_config"
+#UBOOT_MACHINE = "at91sam9m10g45ek_sd_config"
 
 AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"
 
-- 
1.6.3.3



