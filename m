Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id F127A6D745
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 01:11:09 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id q10so2559190eaj.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2013 17:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LKJjjeB6t7j5K2cuQekj8pap+9wPU9N0GRScClzmMhU=;
	b=o7lA+cc4XNsHfGSC6tOoXx5EzAhzYTlw2Rm8Xmq1MBXZG1mJvFkefS1xxAOjUyNmtF
	MEeVhOda9u+nbvO/p5RluumolOK789srF1cexn0FY7DpsRop3UW3QMFmDeC1qKRdaXAn
	ik3WSpkWy/y3dPCX4jPwOdBBRTt95tyPXegl/IY2gYN7Z4AibHdfvI0tEsQtdnq8/8oO
	dBJHLCARBg/0jPzoDPY383GbiAy4McKKa1V6g00sZBJc+hDEromRzCSwv7KKqTBi2YPv
	EIVgNGJy5ij84TKSh2SfkJfQhXpa0QvhNazWV1caOwpRIzM8Kffn0zfTOmqfEQeq5h7z
	JUtQ==
X-Received: by 10.14.199.1 with SMTP id w1mr27363212een.13.1384218670844;
	Mon, 11 Nov 2013 17:11:10 -0800 (PST)
Received: from mizar.localdomain ([95.232.250.41])
	by mx.google.com with ESMTPSA id 1sm8671402eeg.4.2013.11.11.17.11.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Nov 2013 17:11:10 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2013 02:11:03 +0100
Message-Id: <1384218664-17687-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-handheld][PATCH 1/2] linux-yocto: collie: add sa1100 framebuffer clock fixup
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
X-List-Received-Date: Tue, 12 Nov 2013 01:11:10 -0000

Fix framebuffer b0rked since 2.6.32

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.10/collie/collie.scc       |   4 +
 .../patches-sa1100/arm-sa1100-add-cpu-clock.patch  |  95 +++++++++++++++++
 .../fbdev-sa1100fb-make-use-of-device-clock.patch  | 115 +++++++++++++++++++++
 3 files changed, 214 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
index bc64e29..097dcbd 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
@@ -8,8 +8,12 @@ patch ../patches/patches-mfd/mcp-device.patch
 patch ../patches/patches-mfd/ucb1x00-device.patch
 //patch ../patches/patches-mtd/collie-jedec-probe.patch
 patch ../patches/patches-mtd/collie-eraseinfo.patch
+// for 3.12
 patch ../patches/patches-mtd/collie-force-cfi.patch
 patch ../patches/patches-mtd/collie-mtd-resize.patch
 patch ../patches/patches-mtd/collie-force-unlock.patch
 patch ../patches/patches-sa1100/collie-irda.patch
 patch ../patches/patches-sa1100/collie-add-bootblock.patch
+
+patch ../patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
+patch ../patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
new file mode 100644
index 0000000..cf3e23b
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/arm-sa1100-add-cpu-clock.patch
@@ -0,0 +1,95 @@
+From 6abd8c6c642b7f5da4a8065fa6b29c4c90df308d Mon Sep 17 00:00:00 2001
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Date: Mon, 11 Nov 2013 22:53:36 +0400
+Subject: [PATCH 1/2] arm: sa1100: add cpu clock
+
+Both SA1100 framebuffer and PCMCIA drivers require knowledge of cpu
+frequency to correctly program timings.  Currently they receive timing
+information by calling cpufreq_get(0).  However if cpu frequency driver
+is not enabled (e.g. due to unsupported DRAM chip/board on sa1110)
+cpufreq_get(0) returns 0, causing incorrect timings to be programmed.
+
+Add cpu clock returning cpu frequency, to be used by sa11x0 fb and
+pcmcia drivers.
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+---
+ arch/arm/mach-sa1100/clock.c | 34 ++++++++++++++++++++++++++++++++++
+ 1 file changed, 34 insertions(+)
+
+diff --git a/arch/arm/mach-sa1100/clock.c b/arch/arm/mach-sa1100/clock.c
+index 172ebd0..abf1dc1 100644
+--- a/arch/arm/mach-sa1100/clock.c
++++ b/arch/arm/mach-sa1100/clock.c
+@@ -15,10 +15,12 @@
+ #include <linux/clkdev.h>
+ 
+ #include <mach/hardware.h>
++#include <mach/generic.h>
+ 
+ struct clkops {
+ 	void			(*enable)(struct clk *);
+ 	void			(*disable)(struct clk *);
++	unsigned long		(*get_rate)(struct clk *);
+ };
+ 
+ struct clk {
+@@ -51,6 +53,19 @@ static void clk_gpio27_disable(struct clk *clk)
+ 	GAFR &= ~GPIO_32_768kHz;
+ }
+ 
++static void clk_cpu_enable(struct clk *clk)
++{
++}
++
++static void clk_cpu_disable(struct clk *clk)
++{
++}
++
++static unsigned long clk_cpu_get_rate(struct clk *clk)
++{
++	return sa11x0_getspeed(0) * 1000;
++}
++
+ int clk_enable(struct clk *clk)
+ {
+ 	unsigned long flags;
+@@ -80,16 +95,35 @@ void clk_disable(struct clk *clk)
+ }
+ EXPORT_SYMBOL(clk_disable);
+ 
++unsigned long clk_get_rate(struct clk *clk)
++{
++	if (clk && clk->ops && clk->ops->get_rate)
++		return clk->ops->get_rate(clk);
++	else
++		return 0;
++}
++EXPORT_SYMBOL(clk_get_rate);
++
+ const struct clkops clk_gpio27_ops = {
+ 	.enable		= clk_gpio27_enable,
+ 	.disable	= clk_gpio27_disable,
+ };
+ 
++const struct clkops clk_cpu_ops = {
++	.enable		= clk_cpu_enable,
++	.disable	= clk_cpu_disable,
++	.get_rate	= clk_cpu_get_rate,
++};
++
+ static DEFINE_CLK(gpio27, &clk_gpio27_ops);
+ 
++static DEFINE_CLK(cpu, &clk_cpu_ops);
++
+ static struct clk_lookup sa11xx_clkregs[] = {
+ 	CLKDEV_INIT("sa1111.0", NULL, &clk_gpio27),
+ 	CLKDEV_INIT("sa1100-rtc", NULL, NULL),
++	CLKDEV_INIT("sa11x0-fb", NULL, &clk_cpu),
++	CLKDEV_INIT("sa11x0-pcmcia", NULL, &clk_cpu),
+ };
+ 
+ static int __init sa11xx_clk_init(void)
+-- 
+1.8.4.2
+
diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
new file mode 100644
index 0000000..7460692
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-sa1100/fbdev-sa1100fb-make-use-of-device-clock.patch
@@ -0,0 +1,115 @@
+From 14edf9123f62bbfbfbffe38e2837b51b3a6065b5 Mon Sep 17 00:00:00 2001
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Date: Mon, 11 Nov 2013 22:58:02 +0400
+Subject: [PATCH 2/2] fbdev: sa1100fb: make use of device clock
+
+Use per-device clock (instead of calling cpufreq_get(0), which can
+return 0 if no cpu frequency driver is selected) to program timings.
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+---
+ drivers/video/sa1100fb.c | 24 +++++++++++++++++-------
+ drivers/video/sa1100fb.h |  1 +
+ 2 files changed, 18 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/video/sa1100fb.c b/drivers/video/sa1100fb.c
+index de76da0..13d2c99 100644
+--- a/drivers/video/sa1100fb.c
++++ b/drivers/video/sa1100fb.c
+@@ -178,6 +178,7 @@
+ #include <linux/dma-mapping.h>
+ #include <linux/mutex.h>
+ #include <linux/io.h>
++#include <linux/clk.h>
+ 
+ #include <video/sa1100fb.h>
+ 
+@@ -413,9 +414,9 @@ sa1100fb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
+ 		var->transp.offset);
+ 
+ #ifdef CONFIG_CPU_FREQ
+-	dev_dbg(fbi->dev, "dma period = %d ps, clock = %d kHz\n",
++	dev_dbg(fbi->dev, "dma period = %d ps, clock = %ld kHz\n",
+ 		sa1100fb_display_dma_period(var),
+-		cpufreq_get(smp_processor_id()));
++		clk_get_rate(fbi->clk)/1000);
+ #endif
+ 
+ 	return 0;
+@@ -586,9 +587,10 @@ static struct fb_ops sa1100fb_ops = {
+  * Calculate the PCD value from the clock rate (in picoseconds).
+  * We take account of the PPCR clock setting.
+  */
+-static inline unsigned int get_pcd(unsigned int pixclock, unsigned int cpuclock)
++static inline unsigned int get_pcd(struct sa1100fb_info *fbi,
++		unsigned int pixclock)
+ {
+-	unsigned int pcd = cpuclock / 100;
++	unsigned int pcd = clk_get_rate(fbi->clk)/ 100 / 1000;
+ 
+ 	pcd *= pixclock;
+ 	pcd /= 10000000;
+@@ -667,7 +669,7 @@ static int sa1100fb_activate_var(struct fb_var_screeninfo *var, struct sa1100fb_
+ 		LCCR2_BegFrmDel(var->upper_margin) +
+ 		LCCR2_EndFrmDel(var->lower_margin);
+ 
+-	pcd = get_pcd(var->pixclock, cpufreq_get(0));
++	pcd = get_pcd(fbi, var->pixclock);
+ 	new_regs.lccr3 = LCCR3_PixClkDiv(pcd) | fbi->inf->lccr3 |
+ 		(var->sync & FB_SYNC_HOR_HIGH_ACT ? LCCR3_HorSnchH : LCCR3_HorSnchL) |
+ 		(var->sync & FB_SYNC_VERT_HIGH_ACT ? LCCR3_VrtSnchH : LCCR3_VrtSnchL);
+@@ -1003,7 +1005,6 @@ sa1100fb_freq_transition(struct notifier_block *nb, unsigned long val,
+ 			 void *data)
+ {
+ 	struct sa1100fb_info *fbi = TO_INF(nb, freq_transition);
+-	struct cpufreq_freqs *f = data;
+ 	u_int pcd;
+ 
+ 	switch (val) {
+@@ -1012,7 +1013,7 @@ sa1100fb_freq_transition(struct notifier_block *nb, unsigned long val,
+ 		break;
+ 
+ 	case CPUFREQ_POSTCHANGE:
+-		pcd = get_pcd(fbi->fb.var.pixclock, f->new);
++		pcd = get_pcd(fbi, fbi->fb.var.pixclock);
+ 		fbi->reg_lccr3 = (fbi->reg_lccr3 & ~0xff) | LCCR3_PixClkDiv(pcd);
+ 		set_ctrlr_state(fbi, C_ENABLE_CLKCHANGE);
+ 		break;
+@@ -1219,6 +1220,13 @@ static int sa1100fb_probe(struct platform_device *pdev)
+ 	if (!fbi)
+ 		goto failed;
+ 
++	fbi->clk = clk_get(&pdev->dev, NULL);
++	if (IS_ERR(fbi->clk)) {
++		ret = PTR_ERR(fbi->clk);
++		fbi->clk = NULL;
++		goto failed;
++	}
++
+ 	fbi->base = ioremap(res->start, resource_size(res));
+ 	if (!fbi->base)
+ 		goto failed;
+@@ -1271,6 +1279,8 @@ static int sa1100fb_probe(struct platform_device *pdev)
+  failed:
+ 	if (fbi)
+ 		iounmap(fbi->base);
++	if (fbi->clk)
++		clk_put(fbi->clk);
+ 	platform_set_drvdata(pdev, NULL);
+ 	kfree(fbi);
+ 	release_mem_region(res->start, resource_size(res));
+diff --git a/drivers/video/sa1100fb.h b/drivers/video/sa1100fb.h
+index fc5d429..0139d13 100644
+--- a/drivers/video/sa1100fb.h
++++ b/drivers/video/sa1100fb.h
+@@ -68,6 +68,7 @@ struct sa1100fb_info {
+ #endif
+ 
+ 	const struct sa1100fb_mach_info *inf;
++	struct clk *clk;
+ };
+ 
+ #define TO_INF(ptr,member)	container_of(ptr,struct sa1100fb_info,member)
+-- 
+1.8.4.2
+
-- 
1.8.1.5


