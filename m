Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pk0Rc-0007A5-1Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 21:33:52 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id 9F063EB02E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 21:32:58 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aqw+ANOqRk1T4zjzPGdsb2JhbACIXo16jiAMAQEBATUvvhqFTgSMIQ
X-IronPort-AV: E=Sophos;i="4.60,405,1291590000"; d="scan'208";a="169036402"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb2.telenor.se with ESMTP; 31 Jan 2011 21:32:58 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 21:32:55 +0100
Message-Id: <1296505975-4503-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] Make at91bootstrap-3.0 and u-boot-2009.11 preferred versions for at91
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
X-List-Received-Date: Mon, 31 Jan 2011 20:33:52 -0000

---
 conf/machine/include/at91-2.6.30.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
1.6.3.3



