Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QhTvF-0006Pq-Ty
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 23:58:18 +0200
Received: by yib18 with SMTP id 18so327918yib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 14:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Yr99x/+hxBZNXQkPREe3F1hRj7VyGj/ey5M4wZ6/NWE=;
	b=gmAp0XRQRckGeVqtP0Fp/p0MZxb8TE2q1mPRFnTMLl8U8flT3UfxAycowOyy/jMerV
	fQeHOYqi8BKb0qKj17BvL+rQ4NqrnZ8+qR1n1mvsM+LENq/w7rhxv9ci1W6dnJ4L5U2z
	tlO/rSLZzzAW7ST93Uq7cl6XRwqIFRnrlx1qM=
Received: by 10.150.208.15 with SMTP id f15mr2990841ybg.422.1310680457475;
	Thu, 14 Jul 2011 14:54:17 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id k21sm87971ybd.6.2011.07.14.14.54.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jul 2011 14:54:16 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jul 2011 16:50:24 -0500
Message-Id: <1310680224-1872-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: s-kipisz2@ti.com, joelagnel@ti.com, Joel A Fernandes <agnel.joel@gmail.com>,
	jdk@ti.com, k-kooi@ti.com
Subject: [PATCH] linux-omap-psp: Added patch by Steve Sakoman to fix timeout errors
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
X-List-Received-Date: Thu, 14 Jul 2011 21:58:18 -0000

This fixes MMC errors due to timeouts, out was noticed by Jason Kridner in in the linux-omap-2.6.39 recipe

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
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



