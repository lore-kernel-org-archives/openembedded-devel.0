Received: from mail-bk0-f50.google.com ([209.85.214.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UW804-0000LC-4S
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 18:29:25 +0200
Received: by mail-bk0-f50.google.com with SMTP id ik5so2171266bkc.37
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2013 09:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=gD1BJ9bSbOZMmgZ9uJ9yPmr+LeRzP1Lk/qRKm3fEHPk=;
	b=t79RBAn81uQXfuOgsEJMyTwrYJCjEXhE3VhPuoYMB/HAn/rt0ZG1CDIA0ZwC8aWUdC
	MUG29BPzbLO59vmwFVImJsjGxJfEIfXZvhDu3CVbzRMCTo66Ampdf0SXNTZRIx2TlhJh
	iUG9hNNAVD7ZyCDipT0KnkqsB0Dn0zd/CT2M7X2QKHH0kQeoiFcUhINDvKJVvqRdldWS
	2oQQ1Q9tq+kLE6MvCF1AJjWYjAnp/NjwOETtRzOhwSYdPX3bmkLA3xY4+SvDAUVP6O20
	4kTBhjPvd/N0DkB8a5R0LHA1yJ4/bkMx80KAQzauTvRaq6L2c2CxHGbxnglbCDxxWN9/
	6qtg==
X-Received: by 10.205.108.72 with SMTP id eb8mr19889681bkc.111.1367079097602; 
	Sat, 27 Apr 2013 09:11:37 -0700 (PDT)
Received: from mizar.localdomain
	(host200-253-dynamic.30-79-r.retail.telecomitalia.it.
	[79.30.253.200])
	by mx.google.com with ESMTPSA id x18sm4659389bkw.4.2013.04.27.09.11.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 09:11:36 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Apr 2013 18:11:28 +0200
Message-Id: <1367079088-16530-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux-yocto_3.8: remove spi-pxa2xx-fix-mem.patch
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
X-List-Received-Date: Sat, 27 Apr 2013 16:29:34 -0000

* some similar patch is merged upstream
* so it seeems unnecessary

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.8/akita/akita.scc          |  1 -
 .../patches/patches-pxa/spi-pxa2xx-fix-mem.patch   | 47 ----------------------
 .../linux/linux-yocto-3.8/spitz/spitz.scc          |  1 -
 3 files changed, 49 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
index 001b11b..77a45e3 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
@@ -7,5 +7,4 @@ include ../zaurus-usb-host.scc
 
 patch ../patches/patches-pxa/sharpsl_param.patch
 patch ../patches/patches-pxa/pxa27x-sa1100-rtc.patch
-patch ../patches/patches-pxa/spi-pxa2xx-fix-mem.patch
 patch ../patches/patches-pxa/pxamci-regulator.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch b/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch
deleted file mode 100644
index 7fbc14c..0000000
--- a/recipes-kernel/linux/linux-yocto-3.8/patches/patches-pxa/spi-pxa2xx-fix-mem.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-pxa2xx_spi_probe allocates struct driver_data and null_dma_buf
-at same time via spi_alloc_master(), but then calculates
-null_dma_buf pointer incorrectly, and it causes memory corruption
-later if DMA usage is enabled.
-
-Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
-
-Upstream-Status: Submitted
-https://patchwork.kernel.org/patch/1657911/
----
- drivers/spi/spi-pxa2xx.c | 9 +++++----
-  1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
-index dc25bee..b25fe27 100644
---- a/drivers/spi/spi-pxa2xx.c
-+++ b/drivers/spi/spi-pxa2xx.c
-@@ -106,6 +106,7 @@ struct driver_data {
- 	int rx_channel;
- 	int tx_channel;
- 	u32 *null_dma_buf;
-+	u8 null_dma_buf_unaligned[16];
- 
- 	/* SSP register addresses */
- 	void __iomem *ioaddr;
-@@ -1543,8 +1544,8 @@ static int __devinit pxa2xx_spi_probe(struct platform_device *pdev)
- 		return -ENODEV;
- 	}
- 
--	/* Allocate master with space for drv_data and null dma buffer */
--	master = spi_alloc_master(dev, sizeof(struct driver_data) + 16);
-+	/* Allocate master with space for drv_data */
-+	master = spi_alloc_master(dev, sizeof(struct driver_data));
- 	if (!master) {
- 		dev_err(&pdev->dev, "cannot alloc spi_master\n");
- 		pxa_ssp_free(ssp);
-@@ -1569,8 +1570,8 @@ static int __devinit pxa2xx_spi_probe(struct platform_device *pdev)
- 	master->transfer = transfer;
- 
- 	drv_data->ssp_type = ssp->type;
--	drv_data->null_dma_buf = (u32 *)ALIGN((u32)(drv_data +
--						sizeof(struct driver_data)), 8);
-+	drv_data->null_dma_buf =
-+		(u32 *)PTR_ALIGN(&drv_data->null_dma_buf_unaligned, 8);
- 
- 	drv_data->ioaddr = ssp->mmio_base;
- 	drv_data->ssdr_physical = ssp->phys_base + SSDR;
diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
index c47a0c5..8cf32bd 100644
--- a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
+++ b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
@@ -6,5 +6,4 @@ include ../zaurus-usb-host.scc
 
 patch ../patches/patches-pxa/sharpsl_param.patch
 patch ../patches/patches-pxa/pxa27x-sa1100-rtc.patch
-patch ../patches/patches-pxa/spi-pxa2xx-fix-mem.patch
 patch ../patches/patches-pxa/pxamci-regulator.patch
-- 
1.8.1.5



