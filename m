Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qjeyh-0005Pv-13
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 00:10:51 +0200
Received: by yxi19 with SMTP id 19so335866yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qXS5wo5u3QnIS9AMeWSpAk+4O4CFIZBGZ63UQGz2uHM=;
	b=a6b8qo47DU+m7h9MYuI6qF7TFhqQwO5zwhaJ14MZV9UzevEmbY/cwqQ2sVlfYUp0XG
	dhAlyId5lS3b1wAifgkQcIcEkC0YG6EFaTGsZgrvt5Jf/DZXV76pPZZAoqzRMa047FKR
	gNyLOn1f3+WLbNxztI1RMXGLxCSdIhB6yTzT8=
Received: by 10.236.115.231 with SMTP id e67mr12795432yhh.222.1311199603265;
	Wed, 20 Jul 2011 15:06:43 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id j2sm610843yhe.33.2011.07.20.15.06.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 15:06:42 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2011 17:02:05 -0500
Message-Id: <1311199325-7532-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: joelagnel@ti.com, jdk@ti.com, k-kooi@ti.com
Subject: [PATCH v2] linux-omap-psp, linux-omap: Added patch to fix MMC timeout errors
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
X-List-Received-Date: Wed, 20 Jul 2011 22:10:51 -0000

This fixes MMC errors due to timeouts on certain SD Cards following suggestions
to set dto to 14 by Jason Kridner and Steven Kipisz

Details of the issue:
http://talk.maemo.org/showthread.php?p=1000707#post1000707
---
Changes since v1:
* Made patch to apply to org.openembedded.dev branch
* Bumped PR of respective recipes

 ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   27 ++++++++++++++
 ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   39 +++++++++++---------
 recipes/linux/linux-omap-psp_2.6.32.bb             |    2 +-
 recipes/linux/linux-omap_2.6.39.bb                 |    3 +-
 4 files changed, 52 insertions(+), 19 deletions(-)
 create mode 100644 recipes/linux/linux-omap-2.6.39/beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch

diff --git a/recipes/linux/linux-omap-2.6.39/beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch b/recipes/linux/linux-omap-2.6.39/beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
new file mode 100644
index 0000000..7a563b7
--- /dev/null
+++ b/recipes/linux/linux-omap-2.6.39/beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
@@ -0,0 +1,27 @@
+From bd0b2f97c48aa6aac0c6a494f1c6ba5af5de486b Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <agnel.joel@gmail.com>
+Date: Mon, 18 Jul 2011 23:13:41 -0500
+Subject: [PATCH] omap_hsmmc: Set dto to max value of 14 to avoid SD Card timeouts
+
+Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
+---
+ drivers/mmc/host/omap_hsmmc.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
+index 9646a75..7443647 100644
+--- a/drivers/mmc/host/omap_hsmmc.c
++++ b/drivers/mmc/host/omap_hsmmc.c
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
diff --git a/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch b/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
index 4867d3f..7a563b7 100644
--- a/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
+++ b/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
@@ -1,22 +1,27 @@
-From 26a79f408bd41ad7b4a47f2683909d3fc1575eab Mon Sep 17 00:00:00 2001
-From: Steve Sakoman <steve@sakoman.com>
-Date: Wed, 12 Jan 2011 05:54:55 -0800
-Subject: [PATCH] omap: mmc: Adjust dto to eliminate timeout errors
+From bd0b2f97c48aa6aac0c6a494f1c6ba5af5de486b Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <agnel.joel@gmail.com>
+Date: Mon, 18 Jul 2011 23:13:41 -0500
+Subject: [PATCH] omap_hsmmc: Set dto to max value of 14 to avoid SD Card timeouts
 
-A number of SD card types were experiencing timeout errors.  This
-could also lead to data corruption in some cases.
-
-This fix proposed by Sukumar Ghoral of TI.
+Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
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
index 91de194..31de659 100644
--- a/recipes/linux/linux-omap-psp_2.6.32.bb
+++ b/recipes/linux/linux-omap-psp_2.6.32.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "am3517-crane|beagleboard|omap3evm|am3517-evm|dm37x-evm|am3
 SRCREV = "5fc29e7b2a76a64a739f857858ef0b98294aa155"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "g+gitr${SRCREV}"
 
 SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=http;branch=master \
            file://0001-Added-Crane-Board-support.patch \
diff --git a/recipes/linux/linux-omap_2.6.39.bb b/recipes/linux/linux-omap_2.6.39.bb
index 5b1c797..5566c0d 100644
--- a/recipes/linux/linux-omap_2.6.39.bb
+++ b/recipes/linux/linux-omap_2.6.39.bb
@@ -7,7 +7,7 @@ COMPATIBLE_MACHINE = "(beagleboard)"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
 SRCREV_pn-${PN} = "v2.6.39"
-MACHINE_KERNEL_PR_append = "h"
+MACHINE_KERNEL_PR_append = "i"
 
 FILESPATHPKG_prepend = "linux-omap-2.6.39:"
 
@@ -52,6 +52,7 @@ SRC_URI_append = " \
            file://beagle/0003-OMAP3-beagle-add-MADC-support.patch \
            file://beagle/0004-OMAP3-beagle-add-regulators-for-camera-interface.patch \
            file://beagle/0005-OMAP3-beagle-HACK-add-in-1GHz-OPP.patch \
+           file://beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch \
            \
            file://camera/0001-Add-driver-for-Aptina-Micron-mt9p031-sensor.patch \
            file://camera/0002-v4l-Add-mt9v032-sensor-driver.patch \
-- 
1.7.0.4



