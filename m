Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1URsKv-0002al-R6
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 00:57:26 +0200
Received: by mail-ee0-f43.google.com with SMTP id e50so2532631eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 15:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=At1AR8sdew7BIVjjJoDqjNpLi6A7CZt5eL3Xr550la8=;
	b=dmP8+9cB5F75wBC/C+x2TCnYvFqRAJRqs1kYVvSm9bwGrB9hdktjMItiVbtvuAR1QZ
	ogwq3MuWPy+38xPB5S93jpCs8T60fkt6/cm+rSIH0q+c0UN0nQma5nS/PErLqzTG0ZUn
	EgRvW+tI8mX/YpkqdqQ9WsWHu7hZ0Qjh1ZRL7NvtP9HeaSzEcHEZwLAcwpiuV0n+z3tL
	XpV5raJmAKRG6WcQ3abG8sYnMhZHxwZPpxFKLSQMmJD6YyNjrHPGQVUvMX2sCnsnqGMY
	e/slS7+pvLDxzl8Njj0ZKYlBrxSHkXOYkYOTrbTtBIRnAKAxSWg7VgckAjPiug2O94nT
	eTbQ==
X-Received: by 10.14.204.71 with SMTP id g47mr2533828eeo.45.1366065592459;
	Mon, 15 Apr 2013 15:39:52 -0700 (PDT)
Received: from mizar.localdomain
	(host5-250-dynamic.0-87-r.retail.telecomitalia.it. [87.0.250.5])
	by mx.google.com with ESMTPS id u44sm29244207eel.7.2013.04.15.15.39.50
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 15:39:51 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 00:39:38 +0200
Message-Id: <1366065578-27056-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux-yocto_3.8: pxamci: Refactor regulator support
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
X-List-Received-Date: Mon, 15 Apr 2013 22:57:27 -0000

* fix boot from MMC/SD
* as seen on https://patchwork.kernel.org/patch/1875561/

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.8/akita/akita.scc          |   1 +
 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc |   2 +-
 .../linux/linux-yocto-3.8/poodle/poodle.scc        |   1 +
 .../linux/linux-yocto-3.8/pxamci-regulator.patch   | 135 +++++++++++++++++++++
 .../linux/linux-yocto-3.8/spitz/spitz.scc          |   1 +
 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc |   1 +
 6 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/pxamci-regulator.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
index bad38c4..b40cb7e 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
@@ -8,3 +8,4 @@ include ../zaurus-usb-host.scc
 patch sharpsl_param.patch
 patch pxa27x-sa1100-rtc.patch
 patch spi-pxa2xx-fix-mem.patch
+patch pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc b/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
index 99b1d12..a732d5e 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
@@ -5,4 +5,4 @@ include ../zaurus-common.scc
 
 patch sharpsl_param.patch
 patch spi-pxa2xx-fix-mem.patch
-
+patch pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc b/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
index 1dd2144..cfe97be 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
@@ -6,3 +6,4 @@ include ../zaurus-common.scc
 patch locomo_kbd_tweak-r2.patch
 patch sharpsl_param.patch
 patch spi-pxa2xx-fix-mem.patch
+patch pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/pxamci-regulator.patch b/recipes-kernel/linux/linux-yocto-3.8/pxamci-regulator.patch
new file mode 100644
index 0000000..8e7c521
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.8/pxamci-regulator.patch
@@ -0,0 +1,135 @@
+From: Marko Katic <dromede.gmail.com>
+
+Here's an interesting scenario. The spitz machine has an
+Intersil 6271A voltage regulator and an ADS7846 touchscreen
+controller.
+
+The ADS7846 driver _requires_ the use of a voltage regulator
+or if not present, CONFIG_REGULATOR_DUMMY should be used for proper operation.
+This was made mandatory by the following commit:
+
+========================================
+91143379b01b2020d8878d627ebe9dfb9d6eb4c8
+Input: ads7846 - add regulator support
+
+The ADS7846/TSC2046 touchscreen controllers can (and usually are)
+connected to various regulators for power, so add regulator support.
+
+Valid regulator will now be required, so boards without complete
+regulator setup should either disable regulator framework or enable
+CONFIG_REGULATOR_DUMMY.
+========================================
+
+The ADS7846 in spitz machines is not connected to
+any power regulator so it needs CONFIG_REGULATOR_DUMMY enabled.
+So to support both the Intersil 6271A regulator and
+the ADS7846 controller, CONFIG_REGULATOR and CONFIG_REGULATOR_DUMMY have
+to be defined.
+
+However, enabling CONFIG_REGULATOR and CONFIG_REGULATOR_DUMMY
+will break pxamci driver and cause the following error output:
+
+pxa2xx-mci.0 supply vmmc not found, using dummy regulator
+pxa2xx-mci pxa2xx-mci.0: ocr_mask/setpower will not be used
+pxa2xx-mci pxa2xx-mci.0: could not set regulator OCR (-22)
+pxa2xx-mci pxa2xx-mci.0: unable to set power
+pxa2xx-mci pxa2xx-mci.0: could not set regulator OCR (-22)
+pxa2xx-mci pxa2xx-mci.0: unable to set power
+
+Above failures occur in two functions;
+pxamci_init_ocr() and pxamci_set_power().
+
+Regulator support in pxamci_init_ocr() is not
+written with the existence of the dummy regulator driver in
+mind. It does not check the return value of mmc_regulator_get_ocrmask()
+and it will only fall back to platform data if no regulator was found.
+
+pxamci_set_power() fails because it does not even try to fall back
+to platform data if mmc_regulator_set_ocr() fails. It
+expects a proper regulator or no regulator at all. It will
+only fall back to platform data if no regulator was found. It does
+not properly handle the possible existence of the dummy regulator.
+
+This patch refactors pxamci_init_ocr() and  pxamci_set_power() regulator
+support to be more modular, to do more checks and to always fall back
+to platform data.
+
+Signed-off-by: Marko Katic <dromede@gmail.com>
+---
+ drivers/mmc/host/pxamci.c |   37 ++++++++++++++++++++++++-------------
+ 1 file changed, 24 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
+index 2b2f65a..6ec1566 100644
+--- a/drivers/mmc/host/pxamci.c
++++ b/drivers/mmc/host/pxamci.c
+@@ -83,18 +83,24 @@ struct pxamci_host {
+ static inline void pxamci_init_ocr(struct pxamci_host *host)
+ {
+ #ifdef CONFIG_REGULATOR
++	int ocr_mask;
+ 	host->vcc = regulator_get(mmc_dev(host->mmc), "vmmc");
+ 
+ 	if (IS_ERR(host->vcc))
+ 		host->vcc = NULL;
+ 	else {
+-		host->mmc->ocr_avail = mmc_regulator_get_ocrmask(host->vcc);
+-		if (host->pdata && host->pdata->ocr_mask)
++		ocr_mask = mmc_regulator_get_ocrmask(host->vcc);
++		if (ocr_mask <= 0)
++			host->mmc->ocr_avail = 0;
++		else
++			host->mmc->ocr_avail = ocr_mask;
++
++		if (host->pdata && host->pdata->ocr_mask && host->mmc->ocr_avail)
+ 			dev_warn(mmc_dev(host->mmc),
+ 				"ocr_mask/setpower will not be used\n");
+ 	}
+ #endif
+-	if (host->vcc == NULL) {
++	if (host->vcc == NULL || host->mmc->ocr_avail == 0) {
+ 		/* fall-back to platform data */
+ 		host->mmc->ocr_avail = host->pdata ?
+ 			host->pdata->ocr_mask :
+@@ -108,26 +114,31 @@ static inline int pxamci_set_power(struct pxamci_host *host,
+ {
+ 	int on;
+ 
++#ifdef CONFIG_REGULATOR
+ 	if (host->vcc) {
+-		int ret;
++		int ret = 0;
+ 
+-		if (power_mode == MMC_POWER_UP) {
++		if (power_mode == MMC_POWER_UP)
+ 			ret = mmc_regulator_set_ocr(host->mmc, host->vcc, vdd);
+-			if (ret)
+-				return ret;
+-		} else if (power_mode == MMC_POWER_OFF) {
++
++		if (power_mode == MMC_POWER_OFF)
+ 			ret = mmc_regulator_set_ocr(host->mmc, host->vcc, 0);
+-			if (ret)
+-				return ret;
+-		}
++
++		if (ret == 0)
++			return 0;
++		else
++			dev_warn(mmc_dev(host->mmc),
++			 "mmc_regulator_set_ocr failed, falling back to platform data\n");
+ 	}
+-	if (!host->vcc && host->pdata &&
++#endif
++
++	if (host->pdata &&
+ 	    gpio_is_valid(host->pdata->gpio_power)) {
+ 		on = ((1 << vdd) & host->pdata->ocr_mask);
+ 		gpio_set_value(host->pdata->gpio_power,
+ 			       !!on ^ host->pdata->gpio_power_invert);
+ 	}
+-	if (!host->vcc && host->pdata && host->pdata->setpower)
++	if (host->pdata && host->pdata->setpower)
+ 		host->pdata->setpower(mmc_dev(host->mmc), vdd);
+ 
+ 	return 0;
diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
index f9f9381..be8c470 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
@@ -7,3 +7,4 @@ include ../zaurus-usb-host.scc
 patch sharpsl_param.patch
 patch pxa27x-sa1100-rtc.patch
 patch spi-pxa2xx-fix-mem.patch
+patch pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc b/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
index d1f0dbd..b4d6e8e 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
@@ -6,3 +6,4 @@ include ../zaurus-usb-host.scc
 
 patch sharpsl_param.patch
 patch spi-pxa2xx-fix-mem.patch
+patch pxamci-regulator.patch
-- 
1.8.1.5



