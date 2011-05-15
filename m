Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QLWV4-0001lP-TM
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 10:16:31 +0200
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 5BE6CEAAEB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 09:42:54 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aj1YAOqCz01T4zkqPGdsb2JhbACJH5x1CwEBAQE3MshHhhkEkBGOdw
X-IronPort-AV: E=Sophos;i="4.64,368,1301868000"; d="scan'208";a="189784838"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.42])
	by ipb1.telenor.se with ESMTP; 15 May 2011 09:42:54 +0200
From: ulf.samuelsson@atmel.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 09:42:48 +0200
Message-Id: <1305445368-4177-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] at91bootstrap: workaround for compile problem
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
X-List-Received-Date: Sun, 15 May 2011 08:16:31 -0000

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 ...ap-fix-build-error-in-openembedded-due-to.patch |   49 ++++++++++++++
 ...ch-statements-to-if-statements-to-avoid-b.patch |   70 ++++++++++++++++++++
 recipes/at91bootstrap/at91bootstrap_3.0.bb         |    2 +
 3 files changed, 121 insertions(+), 0 deletions(-)
 create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0017-at91bootstrap-fix-build-error-in-openembedded-due-to.patch
 create mode 100644 recipes/at91bootstrap/at91bootstrap-3.0/0018-Change-switch-statements-to-if-statements-to-avoid-b.patch

diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0017-at91bootstrap-fix-build-error-in-openembedded-due-to.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0017-at91bootstrap-fix-build-error-in-openembedded-due-to.patch
new file mode 100644
index 0000000..8a60c61
--- /dev/null
+++ b/recipes/at91bootstrap/at91bootstrap-3.0/0017-at91bootstrap-fix-build-error-in-openembedded-due-to.patch
@@ -0,0 +1,49 @@
+From 7487f5e8836f27806ca734e856cdced8a9edc2c3 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf@bulwark.(none)>
+Date: Sat, 16 Apr 2011 12:57:26 +0200
+Subject: [PATCH 1/2] at91bootstrap: fix build error in openembedded due to compiler error
+
+undefined reference to `__gnu_thumb1_case_uqi'
+when using unsigned char in a switch statement
+
+Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
+---
+ driver/dma.c |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/driver/dma.c b/driver/dma.c
+index 1373525..33e8466 100644
+--- a/driver/dma.c
++++ b/driver/dma.c
+@@ -257,11 +257,11 @@ void DMA_SetSourceBufferMode(unsigned char channel,
+                              unsigned char addressingType)
+ {
+     unsigned int value;
+-
++    unsigned int mode = transferMode;
+     value = (*(volatile unsigned int *)
+              (AT91C_BASE_HDMA_CH_0 + channel * 40 + HDMA_CTRLB));
+     value &= ~(AT91C_SRC_DSCR | AT91C_SRC_INCR | 1 << 31);
+-    switch (transferMode) {
++    switch (mode) {
+     case DMA_TRANSFER_SINGLE:
+         value |= AT91C_SRC_DSCR | addressingType << 24;
+         break;
+@@ -308,12 +308,12 @@ void DMA_SetDestBufferMode(unsigned char channel,
+                            unsigned char addressingType)
+ {
+     unsigned int value;
+-
++    unsigned int mode = transferMode;
+     value = (*(volatile unsigned int *)
+              (AT91C_BASE_HDMA_CH_0 + channel * 40 + HDMA_CTRLB));
+     value &= ~(unsigned int)(AT91C_DST_DSCR | AT91C_DST_INCR);
+ 
+-    switch (transferMode) {
++    switch (mode) {
+     case DMA_TRANSFER_SINGLE:
+     case DMA_TRANSFER_RELOAD:
+     case DMA_TRANSFER_CONTIGUOUS:
+-- 
+1.6.3.3
+
diff --git a/recipes/at91bootstrap/at91bootstrap-3.0/0018-Change-switch-statements-to-if-statements-to-avoid-b.patch b/recipes/at91bootstrap/at91bootstrap-3.0/0018-Change-switch-statements-to-if-statements-to-avoid-b.patch
new file mode 100644
index 0000000..430f7d1
--- /dev/null
+++ b/recipes/at91bootstrap/at91bootstrap-3.0/0018-Change-switch-statements-to-if-statements-to-avoid-b.patch
@@ -0,0 +1,70 @@
+From 6c1b7e91de44526d97ee99fa98ca8514aaf84be7 Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf@bulwark.(none)>
+Date: Sat, 16 Apr 2011 13:31:00 +0200
+Subject: [PATCH 2/2] Change switch statements to if statements to avoid build bug
+
+OE generates
+undefined reference to `__gnu_thumb1_case_uqi'
+when compiling.
+This is a routine which optimizes switch statements in thumb mode
+when only a few casew statements are present.
+---
+ driver/dma.c |   24 ++++++------------------
+ 1 files changed, 6 insertions(+), 18 deletions(-)
+
+diff --git a/driver/dma.c b/driver/dma.c
+index 33e8466..036f39d 100644
+--- a/driver/dma.c
++++ b/driver/dma.c
+@@ -257,21 +257,15 @@ void DMA_SetSourceBufferMode(unsigned char channel,
+                              unsigned char addressingType)
+ {
+     unsigned int value;
+-    unsigned int mode = transferMode;
+     value = (*(volatile unsigned int *)
+              (AT91C_BASE_HDMA_CH_0 + channel * 40 + HDMA_CTRLB));
+     value &= ~(AT91C_SRC_DSCR | AT91C_SRC_INCR | 1 << 31);
+-    switch (mode) {
+-    case DMA_TRANSFER_SINGLE:
++    if (transferMode == DMA_TRANSFER_SINGLE) {
+         value |= AT91C_SRC_DSCR | addressingType << 24;
+-        break;
+-    case DMA_TRANSFER_LLI:
++    } else if(transferMode == DMA_TRANSFER_LLI)  {
+         value |= addressingType << 24;
+-        break;
+-    case DMA_TRANSFER_RELOAD:
+-    case DMA_TRANSFER_CONTIGUOUS:
++    } else if((transferMode == DMA_TRANSFER_RELOAD) || (transferMode == DMA_TRANSFER_CONTIGUOUS)) {
+         value |= AT91C_SRC_DSCR | addressingType << 24 | 1 << 31;
+-        break;
+     }
+     (*(volatile unsigned int *)
+      (AT91C_BASE_HDMA_CH_0 + channel * 40 + HDMA_CTRLB)) = value;
+@@ -308,20 +302,14 @@ void DMA_SetDestBufferMode(unsigned char channel,
+                            unsigned char addressingType)
+ {
+     unsigned int value;
+-    unsigned int mode = transferMode;
+     value = (*(volatile unsigned int *)
+              (AT91C_BASE_HDMA_CH_0 + channel * 40 + HDMA_CTRLB));
+     value &= ~(unsigned int)(AT91C_DST_DSCR | AT91C_DST_INCR);
+ 
+-    switch (mode) {
+-    case DMA_TRANSFER_SINGLE:
+-    case DMA_TRANSFER_RELOAD:
+-    case DMA_TRANSFER_CONTIGUOUS:
+-        value |= AT91C_DST_DSCR | addressingType << 28;
+-        break;
+-    case DMA_TRANSFER_LLI:
++    if(transferMode == DMA_TRANSFER_LLI) {
+         value |= addressingType << 28;
+-        break;
++    } else {	/* DMA_TRANSFER_SINGLE,DMA_TRANSFER_RELOAD,DMA_TRANSFER_CONTIGUOUS */
++        value |= AT91C_DST_DSCR | addressingType << 28;
+     }
+     (*(volatile unsigned int *)
+      (AT91C_BASE_HDMA_CH_0 + channel * 40 + HDMA_CTRLB)) = value;
+-- 
+1.6.3.3
+
diff --git a/recipes/at91bootstrap/at91bootstrap_3.0.bb b/recipes/at91bootstrap/at91bootstrap_3.0.bb
index 82a91c6..6d16134 100644
--- a/recipes/at91bootstrap/at91bootstrap_3.0.bb
+++ b/recipes/at91bootstrap/at91bootstrap_3.0.bb
@@ -25,6 +25,8 @@ SRC_URI_append = " \
 	file://0014-Add-support-for-alternate-jump-address.patch;apply=yes \
 	file://0015-Make-MAKENEW-useful.patch;apply=yes \
 	file://0016-Update-configs.patch;apply=yes \
+	file://0017-at91bootstrap-fix-build-error-in-openembedded-due-to.patch;apply=yes \
+	file://0018-Change-switch-statements-to-if-statements-to-avoid-b.patch;apply=yes \
 	"
 
 # S = "${WORKDIR}/${PN}-${PV}"
-- 
1.7.4.1



