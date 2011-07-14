Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QhUcn-0007kO-Oo
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 00:43:18 +0200
Received: by gxk3 with SMTP id 3so335509gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=k2SOzDNUS0Eclm8Hw8ytDBUlmqdKkorLLr3fuEdDP+c=;
	b=HAnIeJYdGUA16sbMkU0ozvuBUiPK47/7oXHub90LkIFqkwO99qskGbpCkWSqQZxVzX
	IbwikZ9PnQwwzrUv3hhAZJvto38I5k8st6b0o+azimVQuYiZ/1PwJvhpl3zzNHBNC6d/
	OAj32SRH/QgjoeO1GIJaMLjp9QabAfbQhK5hs=
Received: by 10.150.32.13 with SMTP id f13mr2984978ybf.112.1310683157511;
	Thu, 14 Jul 2011 15:39:17 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id i12sm352473ybo.25.2011.07.14.15.39.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jul 2011 15:39:16 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jul 2011 17:35:24 -0500
Message-Id: <1310682924-2629-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: s-kipisz2@ti.com, joelagnel@ti.com, Joel A Fernandes <agnel.joel@gmail.com>,
	jdk@ti.com, k-kooi@ti.com
Subject: [PATCH v3] linux-omap-psp: Added patch to fix MMC timeout errors
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
X-List-Received-Date: Thu, 14 Jul 2011 22:43:19 -0000

This fixes MMC errors due to timeouts, and is borrowed from Steve Sakoman's patch for the
linux-omap-2.6.39 recipe (as noticed by Jason Kridner)

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
Changes since v2:
 * Applied the patch to the correct recipe (linux-omap-psp-2.6.32 instead of linux-omap-2.6.32) (Sorry!)
 * Moved author name to commit message

A link shared by Jason discussing the issue:
http://www.mail-archive.com/linux-omap@vger.kernel.org/msg42214.html

Paul,
This is an actual problem that we experience and this patch seems to fix it.

Patch:
http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/linux/linux-omap-2.6.39/sakoman/0024-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
---
 ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   22 ++++++++++++++++++++
 recipes/linux/linux-omap-psp_2.6.32.bb             |    1 +
 2 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch

diff --git a/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch b/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
new file mode 100644
index 0000000..4867d3f
--- /dev/null
+++ b/recipes/linux/linux-omap-psp-2.6.32/0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch
@@ -0,0 +1,22 @@
+From 26a79f408bd41ad7b4a47f2683909d3fc1575eab Mon Sep 17 00:00:00 2001
+From: Steve Sakoman <steve@sakoman.com>
+Date: Wed, 12 Jan 2011 05:54:55 -0800
+Subject: [PATCH] omap: mmc: Adjust dto to eliminate timeout errors
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
diff --git a/recipes/linux/linux-omap-psp_2.6.32.bb b/recipes/linux/linux-omap-psp_2.6.32.bb
index a076bf1..e6c97ed 100644
--- a/recipes/linux/linux-omap-psp_2.6.32.bb
+++ b/recipes/linux/linux-omap-psp_2.6.32.bb
@@ -59,6 +59,7 @@ SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=http;br
            file://0044-ARM-OMAP-beagle-every-known-beagle-except-revB-uses-.patch \
            file://0045-ARM-OMAP-beagle-add-support-for-beagleFPGA-expansion.patch \
            file://0046-ARM-OMAP-beagle-disable-uart-timeout.patch \
+           file://0047-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch \
            file://cam/0001-mt9t111-first-stab-at-merging-sensor-driver-based-on.patch \
            file://cam/0002-mt9t111-Fix-all-checkpatch-errors.patch \
            file://cam/0003-mt9t111-Pass-v4l2_int_device-data.patch \
-- 
1.7.0.4



