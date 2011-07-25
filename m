Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QlUq7-00073L-2h
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 01:45:35 +0200
Received: by yib18 with SMTP id 18so2609527yib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2011 16:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=MsKPj4x/KOBFvsx+vr1tfz+SAZSSwXyV2gau3sD7XfU=;
	b=mxi01poHRMs8vL0ATXv0/mYSZPifDOlJoUNMcTuQTZu+12qO0s3Vwho8/k8jkrLkyI
	/SUgKGbEvEiYkLYtSJrKw3+GV1D7vfCagNWzMGDyBUR5OYGR4dTQ+9YlLWsIDfhN/Zgu
	obCJv/y0zgoISiTQTFnB0W4TWq+PnCJ3TKmIU=
Received: by 10.150.14.2 with SMTP id 2mr1571733ybn.94.1311637281628;
	Mon, 25 Jul 2011 16:41:21 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id j9sm2430970yhn.39.2011.07.25.16.41.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 16:41:20 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Jul 2011 18:36:05 -0500
Message-Id: <1311636965-13736-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: jdk@ti.com, k-kooi@ti.com
Subject: [PATCH v3] linux-omap-psp: Fix MMC timeout errors
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
X-List-Received-Date: Mon, 25 Jul 2011 23:45:35 -0000

This fixes MMC errors due to timeouts on certain SD Cards following suggestions
to set dto to 14 by Jason Kridner and Steven Kipisz

Details of the issue:
http://talk.maemo.org/showthread.php?p=1000707#post1000707

This fix proposed by Sukumar Ghoral of TI.
---
Changes since v2:
Based on Suggestions by Koen [1], I split the patch into 2. This patch is only for the linux-omap-psp-2.6.32 recipe
The other part was submitted for linux-omap-2.6.39 recipe from the meta-texasinstruments branch [2]

* The pull request to Tom [3] contained the MMC timeout fix patch that was submitted but was not supposed to be
go into maintenance as we weren't sure about whether it fixed the issue (and turns out it didn't). This patch modifies
the earlier patch with a working fix

[1] http://article.gmane.org/gmane.comp.handhelds.openembedded/46689
[2] http://article.gmane.org/gmane.comp.handhelds.openembedded/46730
[3] http://article.gmane.org/gmane.comp.handhelds.openembedded/46721

 ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   41 ++++++++++++-------
 recipes/linux/linux-omap-psp_2.6.32.bb             |    2 +-
 2 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch b/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
index 4867d3f..8cd314c 100644
--- a/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
+++ b/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
@@ -1,22 +1,33 @@
-From 26a79f408bd41ad7b4a47f2683909d3fc1575eab Mon Sep 17 00:00:00 2001
+From bd0b2f97c48aa6aac0c6a494f1c6ba5af5de486b Mon Sep 17 00:00:00 2001
 From: Steve Sakoman <steve@sakoman.com>
-Date: Wed, 12 Jan 2011 05:54:55 -0800
-Subject: [PATCH] omap: mmc: Adjust dto to eliminate timeout errors
+Date: Mon, 18 Jul 2011 23:13:41 -0500
+Subject: [PATCH] omap_hsmmc: Set dto to max value of 14 to avoid SD Card timeouts
 
-A number of SD card types were experiencing timeout errors.  This
-could also lead to data corruption in some cases.
+This fixes MMC errors due to timeouts on certain SD Cards following suggestions
+to set dto to 14 by Jason Kridner and Steven Kipisz
 
-This fix proposed by Sukumar Ghoral of TI.
+Details of the issue:
+http://talk.maemo.org/showthread.php?p=1000707#post1000707
+
+This fix was originally proposed by Sukumar Ghoral of TI.
 ---
+ drivers/mmc/host/omap_hsmmc.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
 diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
-index 9646a75..ef458d6 100644
+index 9646a75..7443647 100644
 --- a/drivers/mmc/host/omap_hsmmc.c
 +++ b/drivers/mmc/host/omap_hsmmc.c
-@@ -1032,6 +1032,7 @@ static void set_data_timeout(struct omap_hsmmc_host *host,
- 	cycle_ns = 1000000000 / (clk_get_rate(host->fclk) / clkd);
- 	timeout = timeout_ns / cycle_ns;
- 	timeout += timeout_clks;
-+	timeout *= 2;
- 	if (timeout) {
- 		while ((timeout & 0x80000000) == 0) {
- 			dto += 1;
+@@ -1049,6 +1049,9 @@ static void set_data_timeout(struct omap_hsmmc_host *host,
+ 			dto = 14;
+ 	}
+ 
++	/* Set dto to max value of 14 to avoid SD Card timeouts */
++	dto = 14;
++
+ 	reg &= ~DTO_MASK;
+ 	reg |= dto << DTO_SHIFT;
+ 	OMAP_HSMMC_WRITE(host->base, SYSCTL, reg);
+-- 
+1.7.0.4
+
diff --git a/recipes/linux/linux-omap-psp_2.6.32.bb b/recipes/linux/linux-omap-psp_2.6.32.bb
index 7a0797a..06904a9 100644
--- a/recipes/linux/linux-omap-psp_2.6.32.bb
+++ b/recipes/linux/linux-omap-psp_2.6.32.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "am3517-crane|beagleboard|omap3evm|am3517-evm|dm37x-evm|am3
 SRCREV = "5fc29e7b2a76a64a739f857858ef0b98294aa155"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "g+gitr${SRCREV}"
 
 SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=http;branch=master \
            file://0001-Added-Crane-Board-support.patch \
-- 
1.7.0.4



