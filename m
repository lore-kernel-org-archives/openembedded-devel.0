Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QlcD4-0001HL-Hu
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 09:37:46 +0200
Received: by gwb11 with SMTP id 11so73889gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 00:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=R6oQXLyFAoi3WdHFZCnx8uQogFgxtAX7Fk97/x3Rpl0=;
	b=pdoHXlC0CLTKI/mM9OlQrBojW+id3FKEi6rnNZZ4vzjqWS5EkdZWh5K57jGEcY4XuG
	N4dfunQ42hedGmwT35Mes2Yc4MqOKqw0Lzx9iPD++0LL7dP9oMPev1MqBYJCIutWE8O7
	YMg5oTbpQvOlDdg0fPhxyjQBJBImV+9gJnuMk=
Received: by 10.151.15.20 with SMTP id s20mr5470363ybi.81.1311665612788;
	Tue, 26 Jul 2011 00:33:32 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id e21sm192279ano.51.2011.07.26.00.33.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jul 2011 00:33:32 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jul 2011 02:27:41 -0500
Message-Id: <1311665261-11839-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: k-kooi@ti.com
Subject: [meta-texasinstruments] [PATCH v3] linux-omap: Fix MMC timeout Errors
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
X-List-Received-Date: Tue, 26 Jul 2011 07:37:46 -0000

This fixes MMC errors due to timeouts on certain SD Cards following suggestions
to set dto to 14 by Jason Kridner and Steven Kipisz

Details of the issue:
http://talk.maemo.org/showthread.php?p=1000707#post1000707

This fix proposed by Sukumar Ghoral of TI.

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
Generated a patch that applies to meta-texasinstruments as suggested by Koen in the post at [1]

Changes in v2:
* Bumped PR

Changes in v3:
* Added SOB line

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



