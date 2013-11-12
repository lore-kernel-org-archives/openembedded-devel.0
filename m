Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 899736D357
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 21:41:26 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so3897101eaj.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 13:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dvdnJ7AQMWahntEimBNSG45P+/v7pIjL/sV/Z8GHNFM=;
	b=hR5GC1uEv+1WdRtj/0Oy9tAM4dKHjNmEZIBscAmfQ21bZBSsBYeaVmr5H0IwJ/49Xu
	G5R+IMt8PkOC55O9Ml/b7q2fjR44AQFUyyt/SxsOe3xJ+FA8GKnB/kiMvUhmGnJhAtRX
	lBsu20CxiGGcG5FiGPS8PgPGnTkFvLcVCNmdEJLWIeu7GPl2xgPe91LFFvKhINNwSB2W
	U5R/KrNG76uEmUFdNIrlru5DpLp+FxWNZYYFxPHk50l7yGZ2GuzxaZGo/FIf+8K3fQ+I
	SN+sdDESmdEa4i0R1XYBY5pRrW0/Fi1ALpJtVLoPhPFhTpu+aeIG3Hh68bhtt4R8a1i1
	/V9Q==
X-Received: by 10.14.4.1 with SMTP id 1mr44852309eei.21.1384292488032;
	Tue, 12 Nov 2013 13:41:28 -0800 (PST)
Received: from mizar.localdomain ([95.232.250.41])
	by mx.google.com with ESMTPSA id 8sm80503340eem.15.2013.11.12.13.41.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Nov 2013 13:41:27 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2013 22:41:17 +0100
Message-Id: <1384292479-15815-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-handheld][PATCH] linux-yocto: collie: add pcmcia clock fixes for sa11xx
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Nov 2013 21:41:27 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.10/collie/collie.scc       |   5 +-
 .../patches-sa1100/pcmcia-clock-alias-sa1111.patch |  31 +++++++
 .../pcmcia-sa1100-device-clock.patch               | 100 +++++++++++++++++++++
 .../pcmcia-sa1111-device-clock.patch               |  44 +++++++++
 4 files changed, 179 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/pcmcia-clock-alias-sa1111.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/pcmcia-sa1111-device-clock.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
index fc8acab..45d296f 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
@@ -12,8 +12,11 @@ patch ../patches/patches-mtd/collie-eraseinfo.patch
 patch ../patches/patches-mtd/collie-force-cfi.patch
 patch ../patches/patches-mtd/collie-mtd-resize.patch
 patch ../patches/patches-mtd/collie-force-unlock.patch
+patch ../patches/patches-mtd/collie-fixup-strataflash.patch
 patch ../patches/patches-sa1100/collie-irda.patch
 patch ../patches/patches-sa1100/collie-add-bootblock.patch
-patch ../patches/patches-mtd/collie-fixup-strataflash.patch
 patch ../patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
 patch ../patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
+patch ../patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
+patch ../patches/patches-sa1100/pcmcia-clock-alias-sa1111.patch
+patch ../patches/patches-sa1100/pcmcia-sa1111-device-clock.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/pcmcia-clock-alias-sa1111.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/pcmcia-clock-alias-sa1111.patch
new file mode 100644
index 0000000..7005577
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/pcmcia-clock-alias-sa1111.patch
@@ -0,0 +1,31 @@
+From patchwork Tue Nov 12 03:32:11 2013
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [4/5] arm: sa1100: add a clock alias for sa1111 pcmcia device
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+X-Patchwork-Id: 3170631
+Message-Id: <1384227132-10501-4-git-send-email-dbaryshkov@gmail.com>
+To: linux-arm-kernel@lists.infradead.org
+Cc: linux-fbdev@vger.kernel.org, linux-pcmcia@lists.infradead.org,
+	Russell King <linux@arm.linux.org.uk>
+Date: Tue, 12 Nov 2013 07:32:11 +0400
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+---
+arch/arm/mach-sa1100/clock.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm/mach-sa1100/clock.c b/arch/arm/mach-sa1100/clock.c
+index abf1dc1..cd4762d 100644
+--- a/arch/arm/mach-sa1100/clock.c
++++ b/arch/arm/mach-sa1100/clock.c
+@@ -124,6 +124,7 @@ static struct clk_lookup sa11xx_clkregs[] = {
+ 	CLKDEV_INIT("sa1100-rtc", NULL, NULL),
+ 	CLKDEV_INIT("sa11x0-fb", NULL, &clk_cpu),
+ 	CLKDEV_INIT("sa11x0-pcmcia", NULL, &clk_cpu),
++	CLKDEV_INIT("1600", NULL, &clk_cpu), /* sa1111 pcmcia */
+ };
+ 
+ static int __init sa11xx_clk_init(void)
diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
new file mode 100644
index 0000000..1d12fc8
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/pcmcia-sa1100-device-clock.patch
@@ -0,0 +1,100 @@
+From patchwork Tue Nov 12 03:32:10 2013
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [3/5] pcmcia: sa1100: make use of device clock
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+X-Patchwork-Id: 3170611
+Message-Id: <1384227132-10501-3-git-send-email-dbaryshkov@gmail.com>
+To: linux-arm-kernel@lists.infradead.org
+Cc: linux-fbdev@vger.kernel.org, linux-pcmcia@lists.infradead.org,
+	Russell King <linux@arm.linux.org.uk>
+Date: Tue, 12 Nov 2013 07:32:10 +0400
+
+Use per-device clock (instead of calling cpufreq_get(0), which can
+return 0 if no cpu frequency driver is selected) to program timings.
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+---
+drivers/pcmcia/sa1100_generic.c |  1 +
+ drivers/pcmcia/sa11xx_base.c    | 14 ++++++++++++--
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/pcmcia/sa1100_generic.c b/drivers/pcmcia/sa1100_generic.c
+index ff8a027..d2ab060 100644
+--- a/drivers/pcmcia/sa1100_generic.c
++++ b/drivers/pcmcia/sa1100_generic.c
+@@ -93,6 +93,7 @@ static int sa11x0_drv_pcmcia_remove(struct platform_device *dev)
+ 	for (i = 0; i < sinfo->nskt; i++)
+ 		soc_pcmcia_remove_one(&sinfo->skt[i]);
+ 
++	clk_put(sinfo->clk);
+ 	kfree(sinfo);
+ 	return 0;
+ }
+diff --git a/drivers/pcmcia/sa11xx_base.c b/drivers/pcmcia/sa11xx_base.c
+index 6eecd7c..aef0e69 100644
+--- a/drivers/pcmcia/sa11xx_base.c
++++ b/drivers/pcmcia/sa11xx_base.c
+@@ -38,6 +38,7 @@
+ #include <linux/spinlock.h>
+ #include <linux/io.h>
+ #include <linux/slab.h>
++#include <linux/clk.h>
+ 
+ #include <mach/hardware.h>
+ #include <asm/irq.h>
+@@ -138,14 +139,15 @@ sa1100_pcmcia_frequency_change(struct soc_pcmcia_socket *skt,
+ static int
+ sa1100_pcmcia_set_timing(struct soc_pcmcia_socket *skt)
+ {
+-	return sa1100_pcmcia_set_mecr(skt, cpufreq_get(0));
++	unsigned long clk = clk_get_rate(skt->clk);
++	return sa1100_pcmcia_set_mecr(skt, clk / 1000);
+ }
+ 
+ static int
+ sa1100_pcmcia_show_timing(struct soc_pcmcia_socket *skt, char *buf)
+ {
+ 	struct soc_pcmcia_timing timing;
+-	unsigned int clock = cpufreq_get(0);
++	unsigned int clock = clk_get_rate(skt->clk);
+ 	unsigned long mecr = MECR;
+ 	char *p = buf;
+ 
+@@ -221,6 +223,11 @@ int sa11xx_drv_pcmcia_probe(struct device *dev, struct pcmcia_low_level *ops,
+ 	struct skt_dev_info *sinfo;
+ 	struct soc_pcmcia_socket *skt;
+ 	int i, ret = 0;
++	struct clk *clk;
++
++	clk = clk_get(dev, NULL);
++	if (IS_ERR(clk))
++		return -ENODEV;
+ 
+ 	sa11xx_drv_pcmcia_ops(ops);
+ 
+@@ -229,12 +236,14 @@ int sa11xx_drv_pcmcia_probe(struct device *dev, struct pcmcia_low_level *ops,
+ 		return -ENOMEM;
+ 
+ 	sinfo->nskt = nr;
++	sinfo->clk = clk;
+ 
+ 	/* Initialize processor specific parameters */
+ 	for (i = 0; i < nr; i++) {
+ 		skt = &sinfo->skt[i];
+ 
+ 		skt->nr = first + i;
++		skt->clk = clk;
+ 		soc_pcmcia_init_one(skt, ops, dev);
+ 
+ 		ret = sa11xx_drv_pcmcia_add_one(skt);
+@@ -245,6 +254,7 @@ int sa11xx_drv_pcmcia_probe(struct device *dev, struct pcmcia_low_level *ops,
+ 	if (ret) {
+ 		while (--i >= 0)
+ 			soc_pcmcia_remove_one(&sinfo->skt[i]);
++		clk_put(clk);
+ 		kfree(sinfo);
+ 	} else {
+ 		dev_set_drvdata(dev, sinfo);
diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/pcmcia-sa1111-device-clock.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/pcmcia-sa1111-device-clock.patch
new file mode 100644
index 0000000..57468fc
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/pcmcia-sa1111-device-clock.patch
@@ -0,0 +1,44 @@
+From patchwork Tue Nov 12 03:32:12 2013
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [5/5] pcmcia: sa1111: make use of device clock
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+X-Patchwork-Id: 3170621
+Message-Id: <1384227132-10501-5-git-send-email-dbaryshkov@gmail.com>
+To: linux-arm-kernel@lists.infradead.org
+Cc: linux-fbdev@vger.kernel.org, linux-pcmcia@lists.infradead.org,
+	Russell King <linux@arm.linux.org.uk>
+Date: Tue, 12 Nov 2013 07:32:12 +0400
+
+Use per-device clock (instead of calling cpufreq_get(0), which can
+return 0 if no cpu frequency driver is selected) to program timings.
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+---
+drivers/pcmcia/sa1111_generic.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/drivers/pcmcia/sa1111_generic.c b/drivers/pcmcia/sa1111_generic.c
+index 65b02c3..c5988be 100644
+--- a/drivers/pcmcia/sa1111_generic.c
++++ b/drivers/pcmcia/sa1111_generic.c
+@@ -145,6 +145,9 @@ int sa1111_pcmcia_add(struct sa1111_dev *dev, struct pcmcia_low_level *ops,
+ 			return -ENOMEM;
+ 
+ 		s->soc.nr = ops->first + i;
++		s->soc.clk = clk_get(&dev->dev, NULL);
++		if (IS_ERR(s->soc.clk))
++			return -ENODEV;
+ 		soc_pcmcia_init_one(&s->soc, ops, &dev->dev);
+ 		s->dev = dev;
+ 		if (s->soc.nr) {
+@@ -220,6 +223,7 @@ static int pcmcia_remove(struct sa1111_dev *dev)
+ 	for (; s; s = next) {
+ 		next = s->next;
+ 		soc_pcmcia_remove_one(&s->soc);
++		clk_put(s->soc.clk);
+ 		kfree(s);
+ 	}
+ 
-- 
1.8.1.5


