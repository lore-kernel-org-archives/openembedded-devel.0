Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QlUcH-0006oN-Bz
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 01:31:27 +0200
Received: by yib18 with SMTP id 18so2604413yib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2011 16:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Br8bmjMMqcw2uXcKqzxNVv4Ec0HivzdimDEevwmeijg=;
	b=pyQMXlSYzVw+S0fBX/4KNyN/yeAepS2cefEPaXrZ5hSku21ELE8ybjyGlW9n+sZxnj
	k17qpdXXRCi54s8dI5Vbb2tqJe007PKktKWJFVnfKb4/eyD2y01zgvdMtYXZlSCBero1
	VolfYs3MLECshxXHWIt7MO4B/HZ6mjkAqfRXA=
Received: by 10.236.138.169 with SMTP id a29mr5911010yhj.404.1311636389633;
	Mon, 25 Jul 2011 16:26:29 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id f4sm261685yhn.83.2011.07.25.16.26.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 16:26:28 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Jul 2011 18:21:10 -0500
Message-Id: <1311636070-13650-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: jdk@ti.com, k-kooi@ti.com
Subject: [meta-texasinstruments] [PATCH v2] linux-omap: Fix MMC timeout Errors
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
X-List-Received-Date: Mon, 25 Jul 2011 23:31:28 -0000

This fixes MMC errors due to timeouts on certain SD Cards following suggestions
to set dto to 14 by Jason Kridner and Steven Kipisz

Details of the issue:
http://talk.maemo.org/showthread.php?p=1000707#post1000707

This fix proposed by Sukumar Ghoral of TI.
---
Generated a patch that applies to meta-texasinstruments as suggested by Koen in the post at [1]

Changes since earlier patch:
* Bumped PR

[1] http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg19995.html

 ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   33 ++++++++++++++++++++
 recipes-kernel/linux/linux-omap_2.6.39.bb          |    3 +-
 2 files changed, 35 insertions(+), 1 deletions(-)
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
index c92846d..a22e81f 100644
--- a/recipes-kernel/linux/linux-omap_2.6.39.bb
+++ b/recipes-kernel/linux/linux-omap_2.6.39.bb
@@ -7,7 +7,7 @@ COMPATIBLE_MACHINE = "(beagleboard)"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
 SRCREV_pn-${PN} = "v2.6.39"
-MACHINE_KERNEL_PR_append = "n"
+MACHINE_KERNEL_PR_append = "o"
 
 FILESPATHPKG_prepend = "linux-omap-2.6.39:"
 
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



