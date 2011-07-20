Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QjKlH-0004mo-Rv
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 02:35:40 +0200
Received: by yxi19 with SMTP id 19so2088961yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2011 17:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=RuOfidCtXjKvwBJQHKuub1BHNuryJn66Sk04dK7AWkc=;
	b=ptLDWL9upCCtcO+oelkzYPHzQj3SE3zSJUE9bv3yjQ1aCU3Kwsm+qtUw0COO6eBlLt
	q0XDfNQIlw7zKKi/ZjvPWS6x7ZC5ThuW2I39pmSXOsrdkyEQUgIq16c4PO8peujt+tvU
	povK5UAlSnVbP2hA7VuUNwEylsal/wVAaHAwE=
Received: by 10.150.216.11 with SMTP id o11mr8210004ybg.247.1311121893492;
	Tue, 19 Jul 2011 17:31:33 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id k1sm313395ybd.15.2011.07.19.17.31.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jul 2011 17:31:32 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jul 2011 19:27:00 -0500
Message-Id: <1311121620-27630-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: s-kipisz2@ti.com, joelagnel@ti.com, jdk@ti.com, k-kooi@ti.com
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
X-List-Received-Date: Wed, 20 Jul 2011 00:35:40 -0000

This fixes MMC errors due to timeouts on certain SD Cards, following suggestions
to set dto to 14 by Jason Kridner and Steven Kipisz

Details of the issue:
http://talk.maemo.org/showthread.php?p=1000707#post1000707
---
Changes since earlier patch:
* Set dto to 14 instead of doubling timeout

Other notes:
* We have confirmation that this patch fixes the issue, so it is safe to apply to the maintentance tree

* Also please revert the earlier patch from the dev tree titled
"linux-omap-psp: Added patch to fix MMC timeout errors" (commit 93e91091c7e2864274207cc7c59e3f64e453f843)

Another thread discussing the issue:
http://www.mail-archive.com/linux-omap@vger.kernel.org/msg42214.html

Thanks!

 ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   27 ++++++++++++++++++++
 ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   27 ++++++++++++++++++++
 recipes/linux/linux-omap-psp_2.6.32.bb             |    3 +-
 recipes/linux/linux-omap_2.6.39.bb                 |    3 +-
 4 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 recipes/linux/linux-omap-2.6.39/beagle/0006-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
 create mode 100644 recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch

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
new file mode 100644
index 0000000..7a563b7
--- /dev/null
+++ b/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
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
diff --git a/recipes/linux/linux-omap-psp_2.6.32.bb b/recipes/linux/linux-omap-psp_2.6.32.bb
index ab9a04a..7a0797a 100644
--- a/recipes/linux/linux-omap-psp_2.6.32.bb
+++ b/recipes/linux/linux-omap-psp_2.6.32.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "am3517-crane|beagleboard|omap3evm|am3517-evm|dm37x-evm|am3
 SRCREV = "5fc29e7b2a76a64a739f857858ef0b98294aa155"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
 
 SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=http;branch=master \
            file://0001-Added-Crane-Board-support.patch \
@@ -59,6 +59,7 @@ SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=http;br
            file://0044-ARM-OMAP-beagle-every-known-beagle-except-revB-uses-.patch \
            file://0045-ARM-OMAP-beagle-add-support-for-beagleFPGA-expansion.patch \
            file://0046-ARM-OMAP-beagle-disable-uart-timeout.patch \
+           file://0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch \
            file://cam/0001-mt9t111-first-stab-at-merging-sensor-driver-based-on.patch \
            file://cam/0002-mt9t111-Fix-all-checkpatch-errors.patch \
            file://cam/0003-mt9t111-Pass-v4l2_int_device-data.patch \
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



