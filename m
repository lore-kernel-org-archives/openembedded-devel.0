Received: from smtprelay-b22.telenor.se ([195.54.99.213])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QLW1o-0000f4-Bp
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 09:46:16 +0200
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id 92F90E90B2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 09:43:14 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ak5wAOqCz01T4zkqPGdsb2JhbACJH45xjgQLAQEBATcyyEeGGQSQEY53
X-IronPort-AV: E=Sophos;i="4.64,368,1301868000"; d="scan'208";a="189784883"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.42])
	by ipb1.telenor.se with ESMTP; 15 May 2011 09:43:14 +0200
From: ulf.samuelsson@atmel.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 09:43:10 +0200
Message-Id: <1305445390-4253-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] at91: Add support for at91cap9stk
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
X-List-Received-Date: Sun, 15 May 2011 07:46:16 -0000

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 conf/machine/at91cap9stk.conf |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/at91cap9stk.conf

diff --git a/conf/machine/at91cap9stk.conf b/conf/machine/at91cap9stk.conf
new file mode 100644
index 0000000..5a6385f
--- /dev/null
+++ b/conf/machine/at91cap9stk.conf
@@ -0,0 +1,21 @@
+#@TYPE: Machine
+#@Name: Atmel AT91CAP9STK Development Platform
+#@DESCRIPTION: Machine configuration for the at91cap9stk board with a at91cap9 processor
+
+include conf/machine/include/at91-2.6.38.inc
+include conf/machine/include/at91-lcd.inc
+
+# Has linux config file in OpenEmbedded
+#
+# LINUX26_DEFCONFIG = "at91cap9stk_defconfig"
+
+
+# Supported u-boot machines
+UBOOT_MACHINE = "at91cap9adk_config"
+
+UBOOT_MACHINES = " at91cap9adk "
+
+AT91BOOTSTRAP_BOARD = " at91cap9stk at91cap9stkdf at91cap9stkf "
+
+MACHINE_FEATURES += " usbhost "
+
-- 
1.7.4.1



