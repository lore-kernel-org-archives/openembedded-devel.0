Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QhTxJ-0006sF-JG
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 00:00:27 +0200
Received: by gyd12 with SMTP id 12so326745gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 14:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=G4hoTurD4t+hDDd/Oq3j16zLA5Kk9Jn6/By5YBbfjm4=;
	b=Vphb7Vs7j75JbKbW2d0o1TujdqrHE+qwSgPcqJzwYrXSeG1sxOXeyGq2y+jaOoB4o/
	wzkhIPoqktaDJ0QY1w+zuzw2k1FkRMBoe5ytOayMNU1pwlxnzoQAVT72uH6D1edDqvqQ
	CJjlh/Hw0rzaKh95Hr/ULzxiD68G+BMeoB0g8=
Received: by 10.101.131.36 with SMTP id i36mr2679979ann.103.1310680585155;
	Thu, 14 Jul 2011 14:56:25 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id v9sm640922anv.30.2011.07.14.14.56.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jul 2011 14:56:24 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jul 2011 16:52:33 -0500
Message-Id: <1310680353-1980-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: s-kipisz2@ti.com, joelagnel@ti.com, Joel A Fernandes <agnel.joel@gmail.com>,
	jdk@ti.com, k-kooi@ti.com
Subject: [PATCHi v2] linux-omap-psp: Added patch by Steve Sakoman to fix timeout errors
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
X-List-Received-Date: Thu, 14 Jul 2011 22:00:27 -0000

This fixes MMC errors due to timeouts, and is borrowed from linux-omap-2.6.39 recipe (as noticed by Jason Kridner)

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
Changes since earlier patch:
 * Fixed commit summary

Some useful links shared by Jason:
http://www.mail-archive.com/linux-omap@vger.kernel.org/msg42214.html
http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/linux/linux-omap-2.6.39/sakoman/0024-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patchRelevant links:

The link to the patch in org.openembedded.dev:
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux-omap-2.6.39/sakoman/0024-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch?h=org.openembedded.dev

 ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   22 ++++++++++++++++++++
 recipes/linux/linux-omap_2.6.32.bb                 |    1 +
 2 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-omap-2.6.32/0010-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch

diff --git a/recipes/linux/linux-omap-2.6.32/0010-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch b/recipes/linux/linux-omap-2.6.32/0010-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
new file mode 100644
index 0000000..ae5a7aa
--- /dev/null
+++ b/recipes/linux/linux-omap-2.6.32/0010-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
@@ -0,0 +1,22 @@
+From 26a79f408bd41ad7b4a47f2683909d3fc1575eab Mon Sep 17 00:00:00 2001
+From: Steve Sakoman <steve@sakoman.com>
+Date: Wed, 12 Jan 2011 05:54:55 -0800
+Subject: [PATCH 24/31] omap: mmc: Adjust dto to eliminate timeout errors
+
+A number of SD card types were experiencing timeout errors.  This
+could also lead to data corruption in some cases.
+
+This fix proposed by Sukumar Ghoral of TI.
+---
+diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
+index 9646a75..ef458d6 100644
+--- a/drivers/mmc/host/omap_hsmmc.c
++++ b/drivers/mmc/host/omap_hsmmc.c
+@@ -1032,6 +1032,7 @@ static void set_data_timeout(struct omap_hsmmc_host *host,
+ 	cycle_ns = 1000000000 / (clk_get_rate(host->fclk) / clkd);
+ 	timeout = timeout_ns / cycle_ns;
+ 	timeout += timeout_clks;
++	timeout *= 2;
+ 	if (timeout) {
+ 		while ((timeout & 0x80000000) == 0) {
+ 			dto += 1;
diff --git a/recipes/linux/linux-omap_2.6.32.bb b/recipes/linux/linux-omap_2.6.32.bb
index 348ec96..404387f 100644
--- a/recipes/linux/linux-omap_2.6.32.bb
+++ b/recipes/linux/linux-omap_2.6.32.bb
@@ -33,6 +33,7 @@ file://0005-ARM-OMAP-add-support-for-TCT-Zippy-to-Beagle-board.patch \
 file://0006-ARM-OMAP-Make-beagle-u-boot-partition-writable.patch \
 file://0007-ASoC-enable-audio-capture-by-default-for-twl4030.patch \
 file://0009-MTD-NAND-omap2-proper-fix-for-subpage-read-ECC-error.patch \
+file://0010-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch \
 file://madc/0009-drivers-mfd-add-twl4030-madc-driver.patch \
 file://madc/0010-ARM-OMAP-Add-twl4030-madc-support-to-Overo.patch \
 file://madc/0011-ARM-OMAP-Add-twl4030-madc-support-to-Beagle.patch \
-- 
1.7.0.4



