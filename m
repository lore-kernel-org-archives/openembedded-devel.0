Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QlUVy-0006dC-IE
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 01:24:46 +0200
Received: by gyd12 with SMTP id 12so2598037gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2011 16:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hFuZsmY3mz7llosd8IIomZaS9n2xOI+Is9mvUJKA1TA=;
	b=qCg68SYkom50Jk0L7wdMxmkA2RqDHtW2OH4WuTiawVQ4lyc1s2gR5gcF1N/BTE62Lj
	UFY7HbEb/3dVSrC5EP3/ju/QoRPSxKRcY05LrLUTW1YCbLyr91cH5Ig60dOSNeWpZUZw
	TxMDVgmQDv2WPiQEnzZffqEydmNy7Gv5gvih8=
Received: by 10.150.175.20 with SMTP id x20mr1657736ybe.352.1311636033413;
	Mon, 25 Jul 2011 16:20:33 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id x11sm1249633ybg.28.2011.07.25.16.20.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 16:20:32 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Jul 2011 18:15:18 -0500
Message-Id: <1311635718-13579-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: jdk@ti.com, k-kooi@ti.com
Subject: [meta-texasinstruments] [PATCH] linux-omap: Fix MMC timeout Errors
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
X-List-Received-Date: Mon, 25 Jul 2011 23:24:46 -0000

This fixes MMC errors due to timeouts on certain SD Cards following suggestions
to set dto to 14 by Jason Kridner and Steven Kipisz

Details of the issue:
http://talk.maemo.org/showthread.php?p=1000707#post1000707

This fix proposed by Sukumar Ghoral of TI.
---
Changes:
Generated a patch that applies to meta-texasinstruments as suggested by Koen in the post at [1]

[1] http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg19995.html

 ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   33 ++++++++++++++++++++
 recipes-kernel/linux/linux-omap_2.6.39.bb          |    1 +
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-omap-2.6.39/beagle/0007-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch

diff --git a/recipes-kernel/linux/linux-omap-2.6.39/beagle/0007-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch b/recipes-kernel/linux/linux-omap-2.6.39/beagle/0007-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
new file mode 100644
index 0000000..8cd314c
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap-2.6.39/beagle/0007-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
@@ -0,0 +1,33 @@
+From bd0b2f97c48aa6aac0c6a494f1c6ba5af5de486b Mon Sep 17 00:00:00 2001
+From: Steve Sakoman <steve@sakoman.com>
+Date: Mon, 18 Jul 2011 23:13:41 -0500
+Subject: [PATCH] omap_hsmmc: Set dto to max value of 14 to avoid SD Card timeouts
+
+This fixes MMC errors due to timeouts on certain SD Cards following suggestions
+to set dto to 14 by Jason Kridner and Steven Kipisz
+
+Details of the issue:
+http://talk.maemo.org/showthread.php?p=1000707#post1000707
+
+This fix was originally proposed by Sukumar Ghoral of TI.
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
diff --git a/recipes-kernel/linux/linux-omap_2.6.39.bb b/recipes-kernel/linux/linux-omap_2.6.39.bb
index c92846d..e3b6f3c 100644
--- a/recipes-kernel/linux/linux-omap_2.6.39.bb
+++ b/recipes-kernel/linux/linux-omap_2.6.39.bb
@@ -54,6 +54,7 @@ SRC_URI_append = " \
            file://beagle/0004-OMAP3-beagle-add-regulators-for-camera-interface.patch \
            file://beagle/0005-OMAP3-beagle-HACK-add-in-1GHz-OPP.patch \
            file://beagle/0006-OMAP3-BEAGLE-fix-RTC.patch \
+           file://beagle/0007-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch \
            \
            file://camera/0001-Add-driver-for-Aptina-Micron-mt9p031-sensor.patch \
            file://camera/0002-v4l-Add-mt9v032-sensor-driver.patch \
-- 
1.7.0.4



