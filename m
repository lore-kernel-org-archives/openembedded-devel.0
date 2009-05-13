Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M4Fqk-0006ki-5L
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 16:54:26 +0200
Received: (qmail 25839 invoked by uid 813007); 13 May 2009 14:47:41 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 May 2009 14:47:40 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 16:46:58 +0200
Message-Id: <1242226019-10881-6-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [PATCH 5/6] linux: drop alix, move geodelx to 2.6.29
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
X-List-Received-Date: Wed, 13 May 2009 14:54:26 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>


Signed-off-by: Marcin Juszkiewicz <hrw@openembedded.org>
---
 .../geode-mfgpt-clock-event-device-support.patch   |  237 ---
 ...de-mfgpt-support-for-geode-class-machines.patch |  311 ----
 recipes/linux/linux/{alix => geodelx}/defconfig    | 1599 ++++++++++++++------
 recipes/linux/linux_2.6.25.bb                      |    1 -
 recipes/linux/linux_2.6.29.bb                      |    1 +
 5 files changed, 1115 insertions(+), 1034 deletions(-)
 delete mode 100644 recipes/linux/linux/alix/geode-mfgpt-clock-event-device-support.patch
 delete mode 100644 recipes/linux/linux/alix/geode-mfgpt-support-for-geode-class-machines.patch
 rename recipes/linux/linux/{alix => geodelx}/defconfig (57%)

diff --git a/recipes/linux/linux/alix/geode-mfgpt-clock-event-device-support.patch b/recipes/linux/linux/alix/geode-mfgpt-clock-event-device-support.patch
deleted file mode 100644
index 6f0b10a..0000000
--- a/recipes/linux/linux/alix/geode-mfgpt-clock-event-device-support.patch
+++ /dev/null
@@ -1,237 +0,0 @@
-From: Andres Salomon <dilinger@queued.net>
-
-Add support for an MFGPT clock event device; this allows us to use MFGPTs as
-the basis for high-resolution timers.
-
-Signed-off-by: Jordan Crouse <jordan.crouse@amd.com>
-Signed-off-by: Andres Salomon <dilinger@debian.org>
-Cc: Andi Kleen <ak@suse.de>
-Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>
-Cc: john stultz <johnstul@us.ibm.com>
-Cc: Thomas Gleixner <tglx@linutronix.de>
-Cc: Ingo Molnar <mingo@elte.hu>
-Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
----
-
- Documentation/kernel-parameters.txt |    4 
- arch/i386/Kconfig                   |   10 +
- arch/i386/kernel/mfgpt.c            |  165 ++++++++++++++++++++++++++
- 3 files changed, 179 insertions(+)
-
---- linux-2.6.22.orig/Documentation/kernel-parameters.txt
-+++ linux-2.6.22/Documentation/kernel-parameters.txt
-@@ -1012,6 +1012,10 @@
- 	meye.*=		[HW] Set MotionEye Camera parameters
- 			See Documentation/video4linux/meye.txt.
- 
-+	mfgpt_irq=	[IA-32] Specify the IRQ to use for the
-+			Multi-Function General Purpose Timers on AMD Geode
-+			platforms.
-+
- 	mga=		[HW,DRM]
- 
- 	migration_cost=
---- linux-2.6.22.orig/arch/i386/Kconfig
-+++ linux-2.6.22/arch/i386/Kconfig
-@@ -1190,6 +1190,16 @@
- 	  processor goes idle (as is done by the scheduler).  The
- 	  other workaround is idle=poll boot option.
- 
-+config GEODE_MFGPT_TIMER
-+	bool "Geode Multi-Function General Purpose Timer (MFGPT) events"
-+	depends on MGEODE_LX && GENERIC_TIME && GENERIC_CLOCKEVENTS
-+	default y
-+	help
-+	  This driver provides a clock event source based on the MFGPT
-+	  timer(s) in the CS5535 and CS5536 companion chip for the geode.
-+	  MFGPTs have a better resolution and max interval than the
-+	  generic PIT, and are suitable for use as high-res timers.
-+
- config K8_NB
- 	def_bool y
- 	depends on AGP_AMD64
---- linux-2.6.22.orig/arch/i386/kernel/mfgpt.c
-+++ linux-2.6.22/arch/i386/kernel/mfgpt.c
-@@ -48,6 +48,12 @@
- #define MFGPT_HZ  (32000 / MFGPT_DIVISOR)
- #define MFGPT_PERIODIC (MFGPT_HZ / HZ)
- 
-+#ifdef CONFIG_GEODE_MFGPT_TIMER
-+static int __init mfgpt_timer_setup(void);
-+#else
-+#define mfgpt_timer_setup() (0)
-+#endif
-+
- /* Allow for disabling of MFGPTs */
- static int disable;
- static int __init mfgpt_disable(char *s)
-@@ -82,6 +88,9 @@
- 		}
- 	}
- 
-+	/* set up clock event device, if desired */
-+	i = mfgpt_timer_setup();
-+
- 	return count;
- }
- 
-@@ -197,3 +206,159 @@
- 	return -1;
- }
- EXPORT_SYMBOL(geode_mfgpt_alloc_timer);
-+
-+#ifdef CONFIG_GEODE_MFGPT_TIMER
-+
-+/*
-+ * The MFPGT timers on the CS5536 provide us with suitable timers to use
-+ * as clock event sources - not as good as a HPET or APIC, but certainly
-+ * better then the PIT.  This isn't a general purpose MFGPT driver, but
-+ * a simplified one designed specifically to act as a clock event source.
-+ * For full details about the MFGPT, please consult the CS5536 data sheet.
-+ */
-+
-+#include <linux/clocksource.h>
-+#include <linux/clockchips.h>
-+
-+static unsigned int mfgpt_tick_mode = CLOCK_EVT_MODE_SHUTDOWN;
-+static u16 mfgpt_event_clock;
-+
-+static int irq = 7;
-+static int __init mfgpt_setup(char *str)
-+{
-+	get_option(&str, &irq);
-+	return 1;
-+}
-+__setup("mfgpt_irq=", mfgpt_setup);
-+
-+static inline void mfgpt_disable_timer(u16 clock)
-+{
-+	u16 val = geode_mfgpt_read(clock, MFGPT_REG_SETUP);
-+	geode_mfgpt_write(clock, MFGPT_REG_SETUP, val & ~MFGPT_SETUP_CNTEN);
-+}
-+
-+static int mfgpt_next_event(unsigned long, struct clock_event_device *);
-+static void mfgpt_set_mode(enum clock_event_mode, struct clock_event_device *);
-+
-+static struct clock_event_device mfgpt_clockevent = {
-+	.name = "mfgpt-timer",
-+	.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
-+	.set_mode = mfgpt_set_mode,
-+	.set_next_event = mfgpt_next_event,
-+	.rating = 250,
-+	.cpumask = CPU_MASK_ALL,
-+	.shift = 32
-+};
-+
-+static inline void mfgpt_start_timer(u16 clock, u16 delta)
-+{
-+	geode_mfgpt_write(mfgpt_event_clock, MFGPT_REG_CMP2, (u16) delta);
-+	geode_mfgpt_write(mfgpt_event_clock, MFGPT_REG_COUNTER, 0);
-+
-+	geode_mfgpt_write(mfgpt_event_clock, MFGPT_REG_SETUP,
-+			  MFGPT_SETUP_CNTEN | MFGPT_SETUP_CMP2);
-+}
-+
-+static void mfgpt_set_mode(enum clock_event_mode mode,
-+			   struct clock_event_device *evt)
-+{
-+	mfgpt_disable_timer(mfgpt_event_clock);
-+
-+	if (mode == CLOCK_EVT_MODE_PERIODIC)
-+		mfgpt_start_timer(mfgpt_event_clock, MFGPT_PERIODIC);
-+
-+	mfgpt_tick_mode = mode;
-+}
-+
-+static int mfgpt_next_event(unsigned long delta, struct clock_event_device *evt)
-+{
-+	mfgpt_start_timer(mfgpt_event_clock, delta);
-+	return 0;
-+}
-+
-+/* Assume (foolishly?), that this interrupt was due to our tick */
-+
-+static irqreturn_t mfgpt_tick(int irq, void *dev_id)
-+{
-+	if (mfgpt_tick_mode == CLOCK_EVT_MODE_SHUTDOWN)
-+		return IRQ_HANDLED;
-+
-+	/* Turn off the clock */
-+	mfgpt_disable_timer(mfgpt_event_clock);
-+
-+	/* Clear the counter */
-+	geode_mfgpt_write(mfgpt_event_clock, MFGPT_REG_COUNTER, 0);
-+
-+	/* Restart the clock in periodic mode */
-+
-+	if (mfgpt_tick_mode == CLOCK_EVT_MODE_PERIODIC) {
-+		geode_mfgpt_write(mfgpt_event_clock, MFGPT_REG_SETUP,
-+				  MFGPT_SETUP_CNTEN | MFGPT_SETUP_CMP2);
-+	}
-+
-+	mfgpt_clockevent.event_handler(&mfgpt_clockevent);
-+	return IRQ_HANDLED;
-+}
-+
-+static struct irqaction mfgptirq  = {
-+	.handler = mfgpt_tick,
-+	.flags = IRQF_DISABLED | IRQF_NOBALANCING,
-+	.mask = CPU_MASK_NONE,
-+	.name = "mfgpt-timer"
-+};
-+
-+static int __init mfgpt_timer_setup(void)
-+{
-+	int timer, ret;
-+	u16 val;
-+
-+	timer = geode_mfgpt_alloc_timer(MFGPT_TIMER_ANY, MFGPT_DOMAIN_WORKING,
-+			THIS_MODULE);
-+	if (timer < 0) {
-+		printk(KERN_ERR "mfgpt-timer:  Could not allocate a MFPGT "
-+				"timer\n");
-+		return -ENODEV;
-+	}
-+
-+	mfgpt_event_clock = timer;
-+	/* Set the clock scale and enable the event mode for CMP2 */
-+	val = MFGPT_SCALE | (3 << 8);
-+
-+	geode_mfgpt_write(mfgpt_event_clock, MFGPT_REG_SETUP, val);
-+
-+	/* Set up the IRQ on the MFGPT side */
-+	if (geode_mfgpt_setup_irq(mfgpt_event_clock, MFGPT_CMP2, irq)) {
-+		printk(KERN_ERR "mfgpt-timer:  Could not set up IRQ %d\n", irq);
-+		return -EIO;
-+	}
-+
-+	/* And register it with the kernel */
-+	ret = setup_irq(irq, &mfgptirq);
-+
-+	if (ret) {
-+		printk(KERN_ERR "mfgpt-timer:  Unable to set up the "
-+				"interrupt.\n");
-+		goto err;
-+	}
-+
-+	/* Set up the clock event */
-+	mfgpt_clockevent.mult = div_sc(MFGPT_HZ, NSEC_PER_SEC, 32);
-+	mfgpt_clockevent.min_delta_ns = clockevent_delta2ns(0xF,
-+			&mfgpt_clockevent);
-+	mfgpt_clockevent.max_delta_ns = clockevent_delta2ns(0xFFFE,
-+			&mfgpt_clockevent);
-+
-+	printk(KERN_INFO "mfgpt-timer:  registering the MFGT timer as a "
-+			"clock event.\n");
-+	clockevents_register_device(&mfgpt_clockevent);
-+
-+	return 0;
-+
-+err:
-+	geode_mfgpt_release_irq(mfgpt_event_clock, MFGPT_CMP2, irq);
-+	printk(KERN_ERR "mfgpt-timer:  Unable to set up the MFGPT clock "
-+			"source\n");
-+	return -EIO;
-+}
-+
-+#endif
diff --git a/recipes/linux/linux/alix/geode-mfgpt-support-for-geode-class-machines.patch b/recipes/linux/linux/alix/geode-mfgpt-support-for-geode-class-machines.patch
deleted file mode 100644
index 533412c..0000000
--- a/recipes/linux/linux/alix/geode-mfgpt-support-for-geode-class-machines.patch
+++ /dev/null
@@ -1,311 +0,0 @@
-From: Andres Salomon <dilinger@queued.net>
-
-This adds support for Multi-Function General Purpose Timers.  It detects the
-available timers during southbridge init, and provides an API for allocating
-and setting the timers.  They're higher resolution than the standard PIT, so
-the MFGPTs come in handy for quite a few things.
-
-Note that we never clobber the timers that the BIOS might have opted to use;
-we just check for unused timers.
-
-Signed-off-by: Jordan Crouse <jordan.crouse@amd.com>
-Signed-off-by: Andres Salomon <dilinger@debian.org>
-Cc: Andi Kleen <ak@suse.de>
-Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>
-Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
----
-
- Documentation/kernel-parameters.txt |    3 
- arch/i386/kernel/Makefile           |    2 
- arch/i386/kernel/geode.c            |    4 
- arch/i386/kernel/mfgpt.c            |  199 ++++++++++++++++++++++++++
- include/asm-i386/geode.h            |   50 ++++++
- 5 files changed, 257 insertions(+), 1 deletion(-)
-
---- linux-2.6.22.orig/arch/i386/kernel/Makefile
-+++ linux-2.6.22/arch/i386/kernel/Makefile
-@@ -40,7 +40,7 @@
- obj-$(CONFIG_EARLY_PRINTK)	+= early_printk.o
- obj-$(CONFIG_HPET_TIMER) 	+= hpet.o
- obj-$(CONFIG_K8_NB)		+= k8.o
--obj-$(CONFIG_MGEODE_LX)		+= geode.o
-+obj-$(CONFIG_MGEODE_LX)		+= geode.o mfgpt.o
- 
- obj-$(CONFIG_VMI)		+= vmi.o vmiclock.o
- obj-$(CONFIG_PARAVIRT)		+= paravirt.o
---- linux-2.6.22.orig/arch/i386/kernel/geode.c
-+++ linux-2.6.22/arch/i386/kernel/geode.c
-@@ -146,10 +146,14 @@
- 
- static int __init geode_southbridge_init(void)
- {
-+	int timers;
-+
- 	if (!is_geode())
- 		return -ENODEV;
- 
- 	init_lbars();
-+	timers = geode_mfgpt_detect();
-+	printk(KERN_INFO "geode:  %d MFGPT timers available.\n", timers);
- 	return 0;
- }
- 
---- /dev/null
-+++ linux-2.6.22/arch/i386/kernel/mfgpt.c
-@@ -0,0 +1,199 @@
-+/*
-+ * Driver/API for AMD Geode Multi-Function General Purpose Timers (MFGPT)
-+ *
-+ * Copyright (C) 2006, Advanced Micro Devices, Inc.
-+ * Copyright (C) 2007, Andres Salomon <dilinger@debian.org>
-+ *
-+ * This program is free software; you can redistribute it and/or
-+ * modify it under the terms of version 2 of the GNU General Public License
-+ * as published by the Free Software Foundation.
-+ *
-+ * The MFGPTs are documented in AMD Geode CS5536 Companion Device Data Book.
-+ */
-+
-+/*
-+ * We are using the 32Khz input clock - its the only one that has the
-+ * ranges we find desirable.  The following table lists the suitable
-+ * divisors and the associated hz, minimum interval
-+ * and the maximum interval:
-+ *
-+ *  Divisor   Hz      Min Delta (S) Max Delta (S)
-+ *   1        32000     .0005          2.048
-+ *   2        16000      .001          4.096
-+ *   4         8000      .002          8.192
-+ *   8         4000      .004         16.384
-+ *   16        2000      .008         32.768
-+ *   32        1000      .016         65.536
-+ *   64         500      .032        131.072
-+ *  128         250      .064        262.144
-+ *  256         125      .128        524.288
-+ */
-+
-+#include <linux/kernel.h>
-+#include <linux/interrupt.h>
-+#include <linux/module.h>
-+#include <asm/geode.h>
-+
-+#define F_AVAIL    0x01
-+
-+static struct mfgpt_timer_t {
-+	int flags;
-+	struct module *owner;
-+} mfgpt_timers[MFGPT_MAX_TIMERS];
-+
-+/* Selected from the table above */
-+
-+#define MFGPT_DIVISOR 16
-+#define MFGPT_SCALE  4     /* divisor = 2^(scale) */
-+#define MFGPT_HZ  (32000 / MFGPT_DIVISOR)
-+#define MFGPT_PERIODIC (MFGPT_HZ / HZ)
-+
-+/* Allow for disabling of MFGPTs */
-+static int disable;
-+static int __init mfgpt_disable(char *s)
-+{
-+	disable = 1;
-+	return 1;
-+}
-+__setup("nomfgpt", mfgpt_disable);
-+
-+/*
-+ * Check whether any MFGPTs are available for the kernel to use.  In most
-+ * cases, firmware that uses AMD's VSA code will claim all timers during
-+ * bootup; we certainly don't want to take them if they're already in use.
-+ * In other cases (such as with VSAless OpenFirmware), the system firmware
-+ * leaves timers available for us to use.
-+ */
-+int __init geode_mfgpt_detect(void)
-+{
-+	int count = 0, i;
-+	u16 val;
-+
-+	if (disable) {
-+		printk(KERN_INFO "geode-mfgpt:  Skipping MFGPT setup\n");
-+		return 0;
-+	}
-+
-+	for (i = 0; i < MFGPT_MAX_TIMERS; i++) {
-+		val = geode_mfgpt_read(i, MFGPT_REG_SETUP);
-+		if (!(val & MFGPT_SETUP_SETUP)) {
-+			mfgpt_timers[i].flags = F_AVAIL;
-+			count++;
-+		}
-+	}
-+
-+	return count;
-+}
-+
-+int geode_mfgpt_toggle_event(int timer, int cmp, int event, int enable)
-+{
-+	u32 msr, mask, value, dummy;
-+	int shift = (cmp == MFGPT_CMP1) ? 0 : 8;
-+
-+	if (timer < 0 || timer >= MFGPT_MAX_TIMERS)
-+		return -EIO;
-+
-+	/*
-+	 * The register maps for these are described in sections 6.17.1.x of
-+	 * the AMD Geode CS5536 Companion Device Data Book.
-+	 */
-+	switch (event) {
-+	case MFGPT_EVENT_RESET:
-+		/*
-+		 * XXX: According to the docs, we cannot reset timers above
-+		 * 6; that is, resets for 7 and 8 will be ignored.  Is this
-+		 * a problem?   -dilinger
-+		 */
-+		msr = MFGPT_NR_MSR;
-+		mask = 1 << (timer + 24);
-+		break;
-+
-+	case MFGPT_EVENT_NMI:
-+		msr = MFGPT_NR_MSR;
-+		mask = 1 << (timer + shift);
-+		break;
-+
-+	case MFGPT_EVENT_IRQ:
-+		msr = MFGPT_IRQ_MSR;
-+		mask = 1 << (timer + shift);
-+		break;
-+
-+	default:
-+		return -EIO;
-+	}
-+
-+	rdmsr(msr, value, dummy);
-+
-+	if (enable)
-+		value |= mask;
-+	else
-+		value &= ~mask;
-+
-+	wrmsr(msr, value, dummy);
-+	return 0;
-+}
-+EXPORT_SYMBOL(geode_mfgpt_toggle_event);
-+
-+int geode_mfgpt_set_irq(int timer, int cmp, int irq, int enable)
-+{
-+	u32 val, dummy;
-+	int offset;
-+
-+	if (timer < 0 || timer >= MFGPT_MAX_TIMERS)
-+		return -EIO;
-+
-+	if (geode_mfgpt_toggle_event(timer, cmp, MFGPT_EVENT_IRQ, enable))
-+		return -EIO;
-+
-+	rdmsr(0x51400022, val, dummy);
-+
-+	offset = (timer % 4) * 4;
-+
-+	val &= ~((0xF << offset) | (0xF << (offset + 16)));
-+
-+	if (enable) {
-+		val |= (irq & 0x0F) << (offset);
-+		val |= (irq & 0x0F) << (offset + 16);
-+	}
-+
-+	wrmsr(0x51400022, val, dummy);
-+	return 0;
-+}
-+EXPORT_SYMBOL(geode_mfgpt_set_irq);
-+
-+static int mfgpt_get(int timer, struct module *owner)
-+{
-+	mfgpt_timers[timer].flags &= ~F_AVAIL;
-+	mfgpt_timers[timer].owner = owner;
-+	printk(KERN_INFO "geode-mfgpt:  Registered timer %d\n", timer);
-+	return timer;
-+}
-+
-+int geode_mfgpt_alloc_timer(int timer, int domain, struct module *owner)
-+{
-+	int i;
-+
-+	if (!geode_get_dev_base(GEODE_DEV_MFGPT))
-+		return -ENODEV;
-+	if (timer >= MFGPT_MAX_TIMERS)
-+		return -EIO;
-+
-+	if (timer < 0) {
-+		/* Try to find an available timer */
-+		for (i = 0; i < MFGPT_MAX_TIMERS; i++) {
-+			if (mfgpt_timers[i].flags & F_AVAIL)
-+				return mfgpt_get(i, owner);
-+
-+			if (i == 5 && domain == MFGPT_DOMAIN_WORKING)
-+				break;
-+		}
-+	} else {
-+		/* If they requested a specific timer, try to honor that */
-+		if (mfgpt_timers[timer].flags & F_AVAIL)
-+			return mfgpt_get(timer, owner);
-+	}
-+
-+	/* No timers available - too bad */
-+	return -1;
-+}
-+EXPORT_SYMBOL(geode_mfgpt_alloc_timer);
---- linux-2.6.22.orig/include/asm-i386/geode.h
-+++ linux-2.6.22/include/asm-i386/geode.h
-@@ -156,4 +156,54 @@
- 	return (is_geode_gx() || is_geode_lx());
- }
- 
-+/* MFGPTs */
-+
-+#define MFGPT_MAX_TIMERS	8
-+#define MFGPT_TIMER_ANY		-1
-+
-+#define MFGPT_DOMAIN_WORKING	1
-+#define MFGPT_DOMAIN_STANDBY	2
-+#define MFGPT_DOMAIN_ANY	(MFGPT_DOMAIN_WORKING | MFGPT_DOMAIN_STANDBY)
-+
-+#define MFGPT_CMP1		0
-+#define MFGPT_CMP2		1
-+
-+#define MFGPT_EVENT_IRQ		0
-+#define MFGPT_EVENT_NMI		1
-+#define MFGPT_EVENT_RESET	3
-+
-+#define MFGPT_REG_CMP1		0
-+#define MFGPT_REG_CMP2		2
-+#define MFGPT_REG_COUNTER	4
-+#define MFGPT_REG_SETUP		6
-+
-+#define MFGPT_SETUP_CNTEN	(1 << 15)
-+#define MFGPT_SETUP_CMP2	(1 << 14)
-+#define MFGPT_SETUP_CMP1	(1 << 13)
-+#define MFGPT_SETUP_SETUP	(1 << 12)
-+#define MFGPT_SETUP_STOPEN	(1 << 11)
-+#define MFGPT_SETUP_EXTEN	(1 << 10)
-+#define MFGPT_SETUP_REVEN	(1 << 5)
-+#define MFGPT_SETUP_CLKSEL	(1 << 4)
-+
-+static inline void geode_mfgpt_write(int timer, u16 reg, u16 value)
-+{
-+	u32 base = geode_get_dev_base(GEODE_DEV_MFGPT);
-+	outw(value, base + reg + (timer * 8));
-+}
-+
-+static inline u16 geode_mfgpt_read(int timer, u16 reg)
-+{
-+	u32 base = geode_get_dev_base(GEODE_DEV_MFGPT);
-+	return inw(base + reg + (timer * 8));
-+}
-+
-+extern int __init geode_mfgpt_detect(void);
-+extern int geode_mfgpt_toggle_event(int timer, int cmp, int event, int enable);
-+extern int geode_mfgpt_set_irq(int timer, int cmp, int irq, int enable);
-+extern int geode_mfgpt_alloc_timer(int timer, int domain, struct module *owner);
-+
-+#define geode_mfgpt_setup_irq(t, c, i) geode_mfgpt_set_irq((t), (c), (i), 1)
-+#define geode_mfgpt_release_irq(t, c, i) geode_mfgpt_set_irq((t), (c), (i), 0)
-+
- #endif
diff --git a/recipes/linux/linux/alix/defconfig b/recipes/linux/linux/geodelx/defconfig
similarity index 57%
rename from recipes/linux/linux/alix/defconfig
rename to recipes/linux/linux/geodelx/defconfig
index 9cffb88..1749011 100644
--- a/recipes/linux/linux/alix/defconfig
+++ b/recipes/linux/linux/geodelx/defconfig
@@ -1,9 +1,13 @@
 #
 # Automatically generated make config: don't edit
-# Linux kernel version: 2.6.23-rc3
-# Mon Aug 27 14:49:39 2007
+# Linux kernel version: 2.6.29
+# Tue May  5 17:55:26 2009
 #
+# CONFIG_64BIT is not set
 CONFIG_X86_32=y
+# CONFIG_X86_64 is not set
+CONFIG_X86=y
+CONFIG_ARCH_DEFCONFIG="arch/x86/configs/i386_defconfig"
 CONFIG_GENERIC_TIME=y
 CONFIG_GENERIC_CMOS_UPDATE=y
 CONFIG_CLOCKSOURCE_WATCHDOG=y
@@ -11,17 +15,36 @@ CONFIG_GENERIC_CLOCKEVENTS=y
 CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
 CONFIG_LOCKDEP_SUPPORT=y
 CONFIG_STACKTRACE_SUPPORT=y
-CONFIG_SEMAPHORE_SLEEPERS=y
-CONFIG_X86=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_FAST_CMPXCHG_LOCAL=y
 CONFIG_MMU=y
 CONFIG_ZONE_DMA=y
-CONFIG_QUICKLIST=y
 CONFIG_GENERIC_ISA_DMA=y
 CONFIG_GENERIC_IOMAP=y
 CONFIG_GENERIC_BUG=y
 CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_GPIO=y
 CONFIG_ARCH_MAY_HAVE_PC_FDC=y
-CONFIG_DMI=y
+# CONFIG_RWSEM_GENERIC_SPINLOCK is not set
+CONFIG_RWSEM_XCHGADD_ALGORITHM=y
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+# CONFIG_GENERIC_TIME_VSYSCALL is not set
+CONFIG_ARCH_HAS_CPU_RELAX=y
+CONFIG_ARCH_HAS_DEFAULT_IDLE=y
+CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
+# CONFIG_HAVE_SETUP_PER_CPU_AREA is not set
+# CONFIG_HAVE_CPUMASK_OF_CPU_MAP is not set
+CONFIG_ARCH_HIBERNATION_POSSIBLE=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+# CONFIG_ZONE_DMA32 is not set
+CONFIG_ARCH_POPULATES_NODE_MAP=y
+# CONFIG_AUDIT_ARCH is not set
+CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=y
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_X86_BIOS_REBOOT=y
+CONFIG_KTIME_SCALAR=y
 CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
 
 #
@@ -40,16 +63,36 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 # CONFIG_BSD_PROCESS_ACCT_V3 is not set
 # CONFIG_TASKSTATS is not set
-# CONFIG_USER_NS is not set
 CONFIG_AUDIT=y
 # CONFIG_AUDITSYSCALL is not set
-# CONFIG_IKCONFIG is not set
+
+#
+# RCU Subsystem
+#
+# CONFIG_CLASSIC_RCU is not set
+# CONFIG_TREE_RCU is not set
+CONFIG_PREEMPT_RCU=y
+# CONFIG_RCU_TRACE is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_PREEMPT_RCU_TRACE is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
-# CONFIG_SYSFS_DEPRECATED is not set
+CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
+# CONFIG_GROUP_SCHED is not set
+# CONFIG_CGROUPS is not set
+# CONFIG_SYSFS_DEPRECATED_V2 is not set
 # CONFIG_RELAY is not set
+CONFIG_NAMESPACES=y
+# CONFIG_UTS_NS is not set
+# CONFIG_IPC_NS is not set
+# CONFIG_USER_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_NET_NS is not set
 # CONFIG_BLK_DEV_INITRD is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
 # CONFIG_EMBEDDED is not set
 CONFIG_UID16=y
 CONFIG_SYSCTL_SYSCALL=y
@@ -60,32 +103,47 @@ CONFIG_HOTPLUG=y
 CONFIG_PRINTK=y
 CONFIG_BUG=y
 CONFIG_ELF_CORE=y
+CONFIG_PCSPKR_PLATFORM=y
 CONFIG_BASE_FULL=y
 CONFIG_FUTEX=y
-CONFIG_ANON_INODES=y
 CONFIG_EPOLL=y
 CONFIG_SIGNALFD=y
 CONFIG_TIMERFD=y
 CONFIG_EVENTFD=y
 CONFIG_SHMEM=y
+CONFIG_AIO=y
 CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_PCI_QUIRKS=y
+# CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
 # CONFIG_SLUB is not set
 # CONFIG_SLOB is not set
+CONFIG_PROFILING=y
+CONFIG_TRACEPOINTS=y
+# CONFIG_MARKERS is not set
+CONFIG_OPROFILE=m
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
+CONFIG_HAVE_IOREMAP_PROT=y
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_ARCH_TRACEHOOK=y
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
 CONFIG_RT_MUTEXES=y
-# CONFIG_TINY_SHMEM is not set
 CONFIG_BASE_SMALL=0
 CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_MODULE_FORCE_UNLOAD is not set
 CONFIG_MODVERSIONS=y
 # CONFIG_MODULE_SRCVERSION_ALL is not set
-CONFIG_KMOD=y
 CONFIG_BLOCK=y
 # CONFIG_LBD is not set
 # CONFIG_BLK_DEV_IO_TRACE is not set
-# CONFIG_LSF is not set
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
 
 #
 # IO Schedulers
@@ -99,6 +157,7 @@ CONFIG_IOSCHED_CFQ=y
 CONFIG_DEFAULT_CFQ=y
 # CONFIG_DEFAULT_NOOP is not set
 CONFIG_DEFAULT_IOSCHED="cfq"
+CONFIG_FREEZER=y
 
 #
 # Processor type and features
@@ -106,17 +165,18 @@ CONFIG_DEFAULT_IOSCHED="cfq"
 CONFIG_TICK_ONESHOT=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
 # CONFIG_SMP is not set
+# CONFIG_X86_MPPARSE is not set
 CONFIG_X86_PC=y
 # CONFIG_X86_ELAN is not set
 # CONFIG_X86_VOYAGER is not set
-# CONFIG_X86_NUMAQ is not set
-# CONFIG_X86_SUMMIT is not set
-# CONFIG_X86_BIGSMP is not set
-# CONFIG_X86_VISWS is not set
 # CONFIG_X86_GENERICARCH is not set
-# CONFIG_X86_ES7000 is not set
-# CONFIG_PARAVIRT is not set
+# CONFIG_X86_VSMP is not set
+# CONFIG_X86_RDC321X is not set
+CONFIG_SCHED_OMIT_FRAME_POINTER=y
+# CONFIG_PARAVIRT_GUEST is not set
+# CONFIG_MEMTEST is not set
 # CONFIG_M386 is not set
 # CONFIG_M486 is not set
 # CONFIG_M586 is not set
@@ -126,7 +186,6 @@ CONFIG_X86_PC=y
 # CONFIG_MPENTIUMII is not set
 # CONFIG_MPENTIUMIII is not set
 # CONFIG_MPENTIUMM is not set
-# CONFIG_MCORE2 is not set
 # CONFIG_MPENTIUM4 is not set
 # CONFIG_MK6 is not set
 # CONFIG_MK7 is not set
@@ -134,21 +193,20 @@ CONFIG_X86_PC=y
 # CONFIG_MCRUSOE is not set
 # CONFIG_MEFFICEON is not set
 # CONFIG_MWINCHIPC6 is not set
-# CONFIG_MWINCHIP2 is not set
 # CONFIG_MWINCHIP3D is not set
 # CONFIG_MGEODEGX1 is not set
 CONFIG_MGEODE_LX=y
 # CONFIG_MCYRIXIII is not set
 # CONFIG_MVIAC3_2 is not set
 # CONFIG_MVIAC7 is not set
+# CONFIG_MPSC is not set
+# CONFIG_MCORE2 is not set
+# CONFIG_GENERIC_CPU is not set
 # CONFIG_X86_GENERIC is not set
+CONFIG_X86_CPU=y
 CONFIG_X86_CMPXCHG=y
 CONFIG_X86_L1_CACHE_SHIFT=5
 CONFIG_X86_XADD=y
-CONFIG_RWSEM_XCHGADD_ALGORITHM=y
-# CONFIG_ARCH_HAS_ILOG2_U32 is not set
-# CONFIG_ARCH_HAS_ILOG2_U64 is not set
-CONFIG_GENERIC_CALIBRATE_DELAY=y
 CONFIG_X86_WP_WORKS_OK=y
 CONFIG_X86_INVLPG=y
 CONFIG_X86_BSWAP=y
@@ -157,16 +215,29 @@ CONFIG_X86_USE_PPRO_CHECKSUM=y
 CONFIG_X86_USE_3DNOW=y
 CONFIG_X86_TSC=y
 CONFIG_X86_MINIMUM_CPU_FAMILY=4
+CONFIG_X86_DEBUGCTLMSR=y
+CONFIG_CPU_SUP_INTEL=y
+CONFIG_CPU_SUP_CYRIX_32=y
+CONFIG_CPU_SUP_AMD=y
+CONFIG_CPU_SUP_CENTAUR_32=y
+CONFIG_CPU_SUP_TRANSMETA_32=y
+CONFIG_CPU_SUP_UMC_32=y
+CONFIG_X86_DS=y
+CONFIG_X86_PTRACE_BTS=y
 CONFIG_HPET_TIMER=y
 CONFIG_HPET_EMULATE_RTC=y
+CONFIG_DMI=y
+# CONFIG_IOMMU_HELPER is not set
+# CONFIG_IOMMU_API is not set
+CONFIG_NR_CPUS=1
 # CONFIG_PREEMPT_NONE is not set
 # CONFIG_PREEMPT_VOLUNTARY is not set
 CONFIG_PREEMPT=y
-CONFIG_PREEMPT_BKL=y
 CONFIG_X86_UP_APIC=y
 CONFIG_X86_UP_IOAPIC=y
 CONFIG_X86_LOCAL_APIC=y
 CONFIG_X86_IO_APIC=y
+# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
 # CONFIG_X86_MCE is not set
 CONFIG_VM86=y
 # CONFIG_TOSHIBA is not set
@@ -175,23 +246,15 @@ CONFIG_X86_REBOOTFIXUPS=y
 # CONFIG_MICROCODE is not set
 CONFIG_X86_MSR=m
 # CONFIG_X86_CPUID is not set
-
-#
-# Firmware Drivers
-#
-# CONFIG_EDD is not set
-# CONFIG_DELL_RBU is not set
-# CONFIG_DCDBAS is not set
-# CONFIG_DMIID is not set
 CONFIG_NOHIGHMEM=y
 # CONFIG_HIGHMEM4G is not set
 # CONFIG_HIGHMEM64G is not set
 CONFIG_PAGE_OFFSET=0xC0000000
 # CONFIG_X86_PAE is not set
+# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
 CONFIG_ARCH_FLATMEM_ENABLE=y
 CONFIG_ARCH_SPARSEMEM_ENABLE=y
 CONFIG_ARCH_SELECT_MEMORY_MODEL=y
-CONFIG_ARCH_POPULATES_NODE_MAP=y
 CONFIG_SELECT_MEMORY_MODEL=y
 CONFIG_FLATMEM_MANUAL=y
 # CONFIG_DISCONTIGMEM_MANUAL is not set
@@ -199,12 +262,16 @@ CONFIG_FLATMEM_MANUAL=y
 CONFIG_FLATMEM=y
 CONFIG_FLAT_NODE_MEM_MAP=y
 CONFIG_SPARSEMEM_STATIC=y
+CONFIG_PAGEFLAGS_EXTENDED=y
 CONFIG_SPLIT_PTLOCK_CPUS=4
-# CONFIG_RESOURCES_64BIT is not set
+# CONFIG_PHYS_ADDR_T_64BIT is not set
 CONFIG_ZONE_DMA_FLAG=1
 CONFIG_BOUNCE=y
-CONFIG_NR_QUICK=1
 CONFIG_VIRT_TO_BUS=y
+CONFIG_UNEVICTABLE_LRU=y
+CONFIG_X86_CHECK_BIOS_CORRUPTION=y
+CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
+# CONFIG_X86_RESERVE_LOW_64K is not set
 # CONFIG_MATH_EMULATION is not set
 # CONFIG_MTRR is not set
 # CONFIG_EFI is not set
@@ -214,121 +281,191 @@ CONFIG_SECCOMP=y
 # CONFIG_HZ_300 is not set
 CONFIG_HZ_1000=y
 CONFIG_HZ=1000
+CONFIG_SCHED_HRTICK=y
 # CONFIG_KEXEC is not set
 CONFIG_PHYSICAL_START=0x100000
 # CONFIG_RELOCATABLE is not set
 CONFIG_PHYSICAL_ALIGN=0x100000
 # CONFIG_COMPAT_VDSO is not set
+# CONFIG_CMDLINE_BOOL is not set
 
 #
-# Power management options (ACPI, APM)
+# Power management and ACPI options
 #
 CONFIG_PM=y
-# CONFIG_PM_LEGACY is not set
 # CONFIG_PM_DEBUG is not set
-# CONFIG_SUSPEND is not set
-# CONFIG_HIBERNATION is not set
+CONFIG_PM_SLEEP=y
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+CONFIG_HIBERNATION=y
+CONFIG_PM_STD_PARTITION=""
 CONFIG_ACPI=y
+CONFIG_ACPI_SLEEP=y
 # CONFIG_ACPI_PROCFS is not set
-# CONFIG_ACPI_AC is not set
+# CONFIG_ACPI_PROCFS_POWER is not set
+CONFIG_ACPI_SYSFS_POWER=y
+# CONFIG_ACPI_PROC_EVENT is not set
+CONFIG_ACPI_AC=m
 # CONFIG_ACPI_BATTERY is not set
-# CONFIG_ACPI_BUTTON is not set
+CONFIG_ACPI_BUTTON=m
 # CONFIG_ACPI_FAN is not set
-# CONFIG_ACPI_DOCK is not set
-# CONFIG_ACPI_PROCESSOR is not set
-# CONFIG_ACPI_ASUS is not set
-# CONFIG_ACPI_TOSHIBA is not set
+CONFIG_ACPI_DOCK=y
+CONFIG_ACPI_PROCESSOR=m
+CONFIG_ACPI_THERMAL=m
+# CONFIG_ACPI_CUSTOM_DSDT is not set
 CONFIG_ACPI_BLACKLIST_YEAR=0
 # CONFIG_ACPI_DEBUG is not set
-CONFIG_ACPI_EC=y
-CONFIG_ACPI_POWER=y
-CONFIG_ACPI_SYSTEM=y
+# CONFIG_ACPI_PCI_SLOT is not set
 CONFIG_X86_PM_TIMER=y
 # CONFIG_ACPI_CONTAINER is not set
 # CONFIG_ACPI_SBS is not set
+# CONFIG_APM is not set
 
 #
 # CPU Frequency scaling
 #
 # CONFIG_CPU_FREQ is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
+CONFIG_CPU_IDLE=y
+CONFIG_CPU_IDLE_GOV_LADDER=y
+CONFIG_CPU_IDLE_GOV_MENU=y
 
 #
-# Bus options (PCI, PCMCIA, EISA, MCA, ISA)
+# Bus options (PCI etc.)
 #
 CONFIG_PCI=y
 # CONFIG_PCI_GOBIOS is not set
 # CONFIG_PCI_GOMMCONFIG is not set
 # CONFIG_PCI_GODIRECT is not set
+# CONFIG_PCI_GOOLPC is not set
 CONFIG_PCI_GOANY=y
 CONFIG_PCI_BIOS=y
 CONFIG_PCI_DIRECT=y
 CONFIG_PCI_MMCONFIG=y
+CONFIG_PCI_OLPC=y
+CONFIG_PCI_DOMAINS=y
 # CONFIG_PCIEPORTBUS is not set
 CONFIG_ARCH_SUPPORTS_MSI=y
 # CONFIG_PCI_MSI is not set
+# CONFIG_PCI_LEGACY is not set
 # CONFIG_PCI_DEBUG is not set
+# CONFIG_PCI_STUB is not set
 # CONFIG_HT_IRQ is not set
 CONFIG_ISA_DMA_API=y
 # CONFIG_ISA is not set
 # CONFIG_MCA is not set
-# CONFIG_SCx200 is not set
+CONFIG_SCx200=m
+CONFIG_SCx200HR_TIMER=m
 CONFIG_GEODE_MFGPT_TIMER=y
-
-#
-# PCCARD (PCMCIA/CardBus) support
-#
+CONFIG_OLPC=y
 # CONFIG_PCCARD is not set
 # CONFIG_HOTPLUG_PCI is not set
 
 #
-# Executable file formats
+# Executable file formats / Emulations
 #
 CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
 # CONFIG_BINFMT_AOUT is not set
 CONFIG_BINFMT_MISC=m
-
-#
-# Networking
-#
+CONFIG_HAVE_ATOMIC_IOMAP=y
 CONFIG_NET=y
 
 #
 # Networking options
 #
+CONFIG_COMPAT_NET_DEV_OPS=y
 CONFIG_PACKET=y
 CONFIG_PACKET_MMAP=y
 CONFIG_UNIX=y
+CONFIG_XFRM=y
+# CONFIG_XFRM_USER is not set
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_XFRM_IPCOMP=m
 # CONFIG_NET_KEY is not set
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
-# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_ASK_IP_FIB_HASH=y
+# CONFIG_IP_FIB_TRIE is not set
 CONFIG_IP_FIB_HASH=y
-# CONFIG_IP_PNP is not set
+# CONFIG_IP_MULTIPLE_TABLES is not set
+# CONFIG_IP_ROUTE_MULTIPATH is not set
+# CONFIG_IP_ROUTE_VERBOSE is not set
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
 # CONFIG_NET_IPIP is not set
 # CONFIG_NET_IPGRE is not set
 # CONFIG_IP_MROUTE is not set
 # CONFIG_ARPD is not set
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_AH is not set
-# CONFIG_INET_ESP is not set
-# CONFIG_INET_IPCOMP is not set
-# CONFIG_INET_XFRM_TUNNEL is not set
-# CONFIG_INET_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_TCP_CONG_ADVANCED is not set
-CONFIG_TCP_CONG_CUBIC=y
-CONFIG_DEFAULT_TCP_CONG="cubic"
-# CONFIG_TCP_MD5SIG is not set
-# CONFIG_IP_VS is not set
-# CONFIG_IPV6 is not set
-# CONFIG_INET6_XFRM_TUNNEL is not set
-# CONFIG_INET6_TUNNEL is not set
+CONFIG_INET_AH=m
+CONFIG_INET_ESP=m
+CONFIG_INET_IPCOMP=m
+CONFIG_INET_XFRM_TUNNEL=m
+CONFIG_INET_TUNNEL=m
+CONFIG_INET_XFRM_MODE_TRANSPORT=m
+CONFIG_INET_XFRM_MODE_TUNNEL=m
+CONFIG_INET_XFRM_MODE_BEET=m
+CONFIG_INET_LRO=m
+CONFIG_INET_DIAG=m
+CONFIG_INET_TCP_DIAG=m
+CONFIG_TCP_CONG_ADVANCED=y
+CONFIG_TCP_CONG_BIC=m
+CONFIG_TCP_CONG_CUBIC=m
+CONFIG_TCP_CONG_WESTWOOD=m
+CONFIG_TCP_CONG_HTCP=m
+CONFIG_TCP_CONG_HSTCP=m
+CONFIG_TCP_CONG_HYBLA=m
+CONFIG_TCP_CONG_VEGAS=m
+CONFIG_TCP_CONG_SCALABLE=m
+CONFIG_TCP_CONG_LP=m
+CONFIG_TCP_CONG_VENO=m
+CONFIG_TCP_CONG_YEAH=m
+CONFIG_TCP_CONG_ILLINOIS=m
+# CONFIG_DEFAULT_BIC is not set
+# CONFIG_DEFAULT_CUBIC is not set
+# CONFIG_DEFAULT_HTCP is not set
+# CONFIG_DEFAULT_VEGAS is not set
+# CONFIG_DEFAULT_WESTWOOD is not set
+CONFIG_DEFAULT_RENO=y
+CONFIG_DEFAULT_TCP_CONG="reno"
+CONFIG_TCP_MD5SIG=y
+CONFIG_IPV6=m
+CONFIG_IPV6_PRIVACY=y
+CONFIG_IPV6_ROUTER_PREF=y
+CONFIG_IPV6_ROUTE_INFO=y
+CONFIG_IPV6_OPTIMISTIC_DAD=y
+CONFIG_INET6_AH=m
+CONFIG_INET6_ESP=m
+CONFIG_INET6_IPCOMP=m
+CONFIG_IPV6_MIP6=m
+CONFIG_INET6_XFRM_TUNNEL=m
+CONFIG_INET6_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_TRANSPORT=m
+CONFIG_INET6_XFRM_MODE_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_BEET=m
+CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION=m
+CONFIG_IPV6_SIT=m
+CONFIG_IPV6_NDISC_NODETYPE=y
+CONFIG_IPV6_TUNNEL=m
+CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_IPV6_SUBTREES=y
+CONFIG_IPV6_MROUTE=y
+CONFIG_IPV6_PIMSM_V2=y
 # CONFIG_NETWORK_SECMARK is not set
 CONFIG_NETFILTER=y
 # CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=y
 CONFIG_BRIDGE_NETFILTER=y
 
 #
@@ -337,11 +474,11 @@ CONFIG_BRIDGE_NETFILTER=y
 CONFIG_NETFILTER_NETLINK=m
 CONFIG_NETFILTER_NETLINK_QUEUE=m
 CONFIG_NETFILTER_NETLINK_LOG=m
-CONFIG_NF_CONNTRACK_ENABLED=m
 CONFIG_NF_CONNTRACK=m
 CONFIG_NF_CT_ACCT=y
 CONFIG_NF_CONNTRACK_MARK=y
 CONFIG_NF_CONNTRACK_EVENTS=y
+CONFIG_NF_CT_PROTO_DCCP=m
 CONFIG_NF_CT_PROTO_GRE=m
 CONFIG_NF_CT_PROTO_SCTP=m
 CONFIG_NF_CT_PROTO_UDPLITE=m
@@ -355,16 +492,20 @@ CONFIG_NF_CONNTRACK_SANE=m
 CONFIG_NF_CONNTRACK_SIP=m
 CONFIG_NF_CONNTRACK_TFTP=m
 CONFIG_NF_CT_NETLINK=m
+CONFIG_NETFILTER_TPROXY=m
 CONFIG_NETFILTER_XTABLES=m
 CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
-# CONFIG_NETFILTER_XT_TARGET_CONNMARK is not set
-# CONFIG_NETFILTER_XT_TARGET_DSCP is not set
+CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
+CONFIG_NETFILTER_XT_TARGET_DSCP=m
 CONFIG_NETFILTER_XT_TARGET_MARK=m
-CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
 CONFIG_NETFILTER_XT_TARGET_NFLOG=m
-# CONFIG_NETFILTER_XT_TARGET_NOTRACK is not set
-# CONFIG_NETFILTER_XT_TARGET_TRACE is not set
+CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
+CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
+CONFIG_NETFILTER_XT_TARGET_RATEEST=m
+CONFIG_NETFILTER_XT_TARGET_TPROXY=m
+CONFIG_NETFILTER_XT_TARGET_TRACE=m
 CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
+CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m
 CONFIG_NETFILTER_XT_MATCH_COMMENT=m
 CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
 CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
@@ -373,39 +514,45 @@ CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
 CONFIG_NETFILTER_XT_MATCH_DCCP=m
 CONFIG_NETFILTER_XT_MATCH_DSCP=m
 CONFIG_NETFILTER_XT_MATCH_ESP=m
+CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
 CONFIG_NETFILTER_XT_MATCH_HELPER=m
+CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
 CONFIG_NETFILTER_XT_MATCH_LENGTH=m
 CONFIG_NETFILTER_XT_MATCH_LIMIT=m
 CONFIG_NETFILTER_XT_MATCH_MAC=m
 CONFIG_NETFILTER_XT_MATCH_MARK=m
 CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
-# CONFIG_NETFILTER_XT_MATCH_PHYSDEV is not set
+CONFIG_NETFILTER_XT_MATCH_OWNER=m
+CONFIG_NETFILTER_XT_MATCH_POLICY=m
+CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
 CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
 CONFIG_NETFILTER_XT_MATCH_QUOTA=m
+CONFIG_NETFILTER_XT_MATCH_RATEEST=m
 CONFIG_NETFILTER_XT_MATCH_REALM=m
+CONFIG_NETFILTER_XT_MATCH_RECENT=m
+# CONFIG_NETFILTER_XT_MATCH_RECENT_PROC_COMPAT is not set
 CONFIG_NETFILTER_XT_MATCH_SCTP=m
+CONFIG_NETFILTER_XT_MATCH_SOCKET=m
 CONFIG_NETFILTER_XT_MATCH_STATE=m
 CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
 CONFIG_NETFILTER_XT_MATCH_STRING=m
 CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
+CONFIG_NETFILTER_XT_MATCH_TIME=m
 CONFIG_NETFILTER_XT_MATCH_U32=m
-CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
+# CONFIG_IP_VS is not set
 
 #
 # IP: Netfilter Configuration
 #
+CONFIG_NF_DEFRAG_IPV4=m
 CONFIG_NF_CONNTRACK_IPV4=m
 CONFIG_NF_CONNTRACK_PROC_COMPAT=y
 CONFIG_IP_NF_QUEUE=m
 CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_MATCH_IPRANGE=m
-CONFIG_IP_NF_MATCH_TOS=m
-CONFIG_IP_NF_MATCH_RECENT=m
-CONFIG_IP_NF_MATCH_ECN=m
+CONFIG_IP_NF_MATCH_ADDRTYPE=m
 CONFIG_IP_NF_MATCH_AH=m
+CONFIG_IP_NF_MATCH_ECN=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_MATCH_OWNER=m
-CONFIG_IP_NF_MATCH_ADDRTYPE=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_TARGET_LOG=m
@@ -413,11 +560,13 @@ CONFIG_IP_NF_TARGET_ULOG=m
 CONFIG_NF_NAT=m
 CONFIG_NF_NAT_NEEDED=y
 CONFIG_IP_NF_TARGET_MASQUERADE=m
-CONFIG_IP_NF_TARGET_REDIRECT=m
 CONFIG_IP_NF_TARGET_NETMAP=m
-CONFIG_IP_NF_TARGET_SAME=m
+CONFIG_IP_NF_TARGET_REDIRECT=m
 CONFIG_NF_NAT_SNMP_BASIC=m
+CONFIG_NF_NAT_PROTO_DCCP=m
 CONFIG_NF_NAT_PROTO_GRE=m
+CONFIG_NF_NAT_PROTO_UDPLITE=m
+CONFIG_NF_NAT_PROTO_SCTP=m
 CONFIG_NF_NAT_FTP=m
 CONFIG_NF_NAT_IRC=m
 CONFIG_NF_NAT_TFTP=m
@@ -426,24 +575,63 @@ CONFIG_NF_NAT_PPTP=m
 CONFIG_NF_NAT_H323=m
 CONFIG_NF_NAT_SIP=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_TOS=m
+CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_RAW=m
 CONFIG_IP_NF_ARPTABLES=m
 CONFIG_IP_NF_ARPFILTER=m
 CONFIG_IP_NF_ARP_MANGLE=m
 
 #
-# Bridge: Netfilter Configuration
-#
-# CONFIG_BRIDGE_NF_EBTABLES is not set
+# IPv6: Netfilter Configuration
+#
+CONFIG_NF_CONNTRACK_IPV6=m
+CONFIG_IP6_NF_QUEUE=m
+CONFIG_IP6_NF_IPTABLES=m
+CONFIG_IP6_NF_MATCH_AH=m
+CONFIG_IP6_NF_MATCH_EUI64=m
+CONFIG_IP6_NF_MATCH_FRAG=m
+CONFIG_IP6_NF_MATCH_OPTS=m
+CONFIG_IP6_NF_MATCH_HL=m
+CONFIG_IP6_NF_MATCH_IPV6HEADER=m
+CONFIG_IP6_NF_MATCH_MH=m
+CONFIG_IP6_NF_MATCH_RT=m
+CONFIG_IP6_NF_TARGET_LOG=m
+CONFIG_IP6_NF_FILTER=m
+CONFIG_IP6_NF_TARGET_REJECT=m
+CONFIG_IP6_NF_MANGLE=m
+CONFIG_IP6_NF_TARGET_HL=m
+CONFIG_IP6_NF_RAW=m
+CONFIG_BRIDGE_NF_EBTABLES=m
+CONFIG_BRIDGE_EBT_BROUTE=m
+CONFIG_BRIDGE_EBT_T_FILTER=m
+CONFIG_BRIDGE_EBT_T_NAT=m
+CONFIG_BRIDGE_EBT_802_3=m
+CONFIG_BRIDGE_EBT_AMONG=m
+CONFIG_BRIDGE_EBT_ARP=m
+CONFIG_BRIDGE_EBT_IP=m
+CONFIG_BRIDGE_EBT_IP6=m
+CONFIG_BRIDGE_EBT_LIMIT=m
+CONFIG_BRIDGE_EBT_MARK=m
+CONFIG_BRIDGE_EBT_PKTTYPE=m
+CONFIG_BRIDGE_EBT_STP=m
+CONFIG_BRIDGE_EBT_VLAN=m
+CONFIG_BRIDGE_EBT_ARPREPLY=m
+CONFIG_BRIDGE_EBT_DNAT=m
+CONFIG_BRIDGE_EBT_MARK_T=m
+CONFIG_BRIDGE_EBT_REDIRECT=m
+CONFIG_BRIDGE_EBT_SNAT=m
+CONFIG_BRIDGE_EBT_LOG=m
+CONFIG_BRIDGE_EBT_ULOG=m
+CONFIG_BRIDGE_EBT_NFLOG=m
 # CONFIG_IP_DCCP is not set
 # CONFIG_IP_SCTP is not set
 # CONFIG_TIPC is not set
 # CONFIG_ATM is not set
+CONFIG_STP=m
 CONFIG_BRIDGE=m
+# CONFIG_NET_DSA is not set
 # CONFIG_VLAN_8021Q is not set
 # CONFIG_DECNET is not set
 CONFIG_LLC=m
@@ -454,19 +642,68 @@ CONFIG_LLC=m
 # CONFIG_LAPB is not set
 # CONFIG_ECONET is not set
 # CONFIG_WAN_ROUTER is not set
+CONFIG_NET_SCHED=y
 
 #
-# QoS and/or fair queueing
+# Queueing/Scheduling
 #
-# CONFIG_NET_SCHED is not set
-CONFIG_NET_SCH_FIFO=y
+CONFIG_NET_SCH_CBQ=m
+CONFIG_NET_SCH_HTB=m
+CONFIG_NET_SCH_HFSC=m
+CONFIG_NET_SCH_PRIO=m
+CONFIG_NET_SCH_MULTIQ=m
+CONFIG_NET_SCH_RED=m
+CONFIG_NET_SCH_SFQ=m
+CONFIG_NET_SCH_TEQL=m
+CONFIG_NET_SCH_TBF=m
+CONFIG_NET_SCH_GRED=m
+CONFIG_NET_SCH_DSMARK=m
+CONFIG_NET_SCH_NETEM=m
+CONFIG_NET_SCH_DRR=m
+# CONFIG_NET_SCH_INGRESS is not set
+
+#
+# Classification
+#
+CONFIG_NET_CLS=y
+CONFIG_NET_CLS_BASIC=m
+CONFIG_NET_CLS_TCINDEX=m
+CONFIG_NET_CLS_ROUTE4=m
 CONFIG_NET_CLS_ROUTE=y
+CONFIG_NET_CLS_FW=m
+CONFIG_NET_CLS_U32=m
+CONFIG_CLS_U32_PERF=y
+CONFIG_CLS_U32_MARK=y
+CONFIG_NET_CLS_RSVP=m
+CONFIG_NET_CLS_RSVP6=m
+CONFIG_NET_CLS_FLOW=m
+CONFIG_NET_EMATCH=y
+CONFIG_NET_EMATCH_STACK=32
+CONFIG_NET_EMATCH_CMP=m
+CONFIG_NET_EMATCH_NBYTE=m
+CONFIG_NET_EMATCH_U32=m
+CONFIG_NET_EMATCH_META=m
+CONFIG_NET_EMATCH_TEXT=m
+CONFIG_NET_CLS_ACT=y
+CONFIG_NET_ACT_POLICE=m
+CONFIG_NET_ACT_GACT=m
+CONFIG_GACT_PROB=y
+CONFIG_NET_ACT_MIRRED=m
+CONFIG_NET_ACT_IPT=m
+CONFIG_NET_ACT_NAT=m
+CONFIG_NET_ACT_PEDIT=m
+CONFIG_NET_ACT_SIMP=m
+CONFIG_NET_ACT_SKBEDIT=m
+CONFIG_NET_CLS_IND=y
+CONFIG_NET_SCH_FIFO=y
+# CONFIG_DCB is not set
 
 #
 # Network testing
 #
 # CONFIG_NET_PKTGEN is not set
 # CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
 # CONFIG_IRDA is not set
 CONFIG_BT=m
 CONFIG_BT_L2CAP=m
@@ -481,30 +718,47 @@ CONFIG_BT_HIDP=m
 #
 # Bluetooth device drivers
 #
-CONFIG_BT_HCIUSB=m
-CONFIG_BT_HCIUSB_SCO=y
-# CONFIG_BT_HCIUART is not set
-# CONFIG_BT_HCIBCM203X is not set
-# CONFIG_BT_HCIBPA10X is not set
-# CONFIG_BT_HCIBFUSB is not set
+CONFIG_BT_HCIBTUSB=m
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_H4=y
+CONFIG_BT_HCIUART_BCSP=y
+CONFIG_BT_HCIUART_LL=y
+CONFIG_BT_HCIBCM203X=m
+CONFIG_BT_HCIBPA10X=m
+CONFIG_BT_HCIBFUSB=m
 # CONFIG_BT_HCIVHCI is not set
 # CONFIG_AF_RXRPC is not set
-
-#
-# Wireless
-#
+# CONFIG_PHONET is not set
+CONFIG_FIB_RULES=y
+CONFIG_WIRELESS=y
 CONFIG_CFG80211=m
+# CONFIG_CFG80211_REG_DEBUG is not set
+CONFIG_NL80211=y
+CONFIG_WIRELESS_OLD_REGULATORY=y
 CONFIG_WIRELESS_EXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+CONFIG_LIB80211=m
+CONFIG_LIB80211_CRYPT_WEP=m
+CONFIG_LIB80211_CRYPT_CCMP=m
+CONFIG_LIB80211_CRYPT_TKIP=m
+# CONFIG_LIB80211_DEBUG is not set
 CONFIG_MAC80211=m
-# CONFIG_MAC80211_DEBUG is not set
-CONFIG_IEEE80211=m
-# CONFIG_IEEE80211_DEBUG is not set
-CONFIG_IEEE80211_CRYPT_WEP=m
-CONFIG_IEEE80211_CRYPT_CCMP=m
-CONFIG_IEEE80211_CRYPT_TKIP=m
-CONFIG_IEEE80211_SOFTMAC=m
-# CONFIG_IEEE80211_SOFTMAC_DEBUG is not set
-# CONFIG_RFKILL is not set
+
+#
+# Rate control algorithm selection
+#
+CONFIG_MAC80211_RC_MINSTREL=y
+# CONFIG_MAC80211_RC_DEFAULT_PID is not set
+CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
+CONFIG_MAC80211_RC_DEFAULT="minstrel"
+CONFIG_MAC80211_MESH=y
+CONFIG_MAC80211_LEDS=y
+# CONFIG_MAC80211_DEBUGFS is not set
+# CONFIG_MAC80211_DEBUG_MENU is not set
+# CONFIG_WIMAX is not set
+CONFIG_RFKILL=y
+CONFIG_RFKILL_INPUT=m
+CONFIG_RFKILL_LEDS=y
 # CONFIG_NET_9P is not set
 
 #
@@ -514,9 +768,12 @@ CONFIG_IEEE80211_SOFTMAC=m
 #
 # Generic Driver Options
 #
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_STANDALONE=y
 CONFIG_PREVENT_FIRMWARE_BUILD=y
-CONFIG_FW_LOADER=m
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
 # CONFIG_DEBUG_DRIVER is not set
 # CONFIG_DEBUG_DEVRES is not set
 # CONFIG_SYS_HYPERVISOR is not set
@@ -524,15 +781,14 @@ CONFIG_FW_LOADER=m
 # CONFIG_MTD is not set
 CONFIG_PARPORT=m
 CONFIG_PARPORT_PC=m
-# CONFIG_PARPORT_SERIAL is not set
-# CONFIG_PARPORT_PC_FIFO is not set
-# CONFIG_PARPORT_PC_SUPERIO is not set
+CONFIG_PARPORT_SERIAL=m
+CONFIG_PARPORT_PC_FIFO=y
+CONFIG_PARPORT_PC_SUPERIO=y
 # CONFIG_PARPORT_GSC is not set
-CONFIG_PARPORT_AX88796=m
+# CONFIG_PARPORT_AX88796 is not set
 CONFIG_PARPORT_1284=y
-CONFIG_PARPORT_NOT_PC=y
 CONFIG_PNP=y
-# CONFIG_PNP_DEBUG is not set
+# CONFIG_PNP_DEBUG_MESSAGES is not set
 
 #
 # Protocols
@@ -547,14 +803,17 @@ CONFIG_BLK_DEV=y
 # CONFIG_BLK_DEV_UMEM is not set
 # CONFIG_BLK_DEV_COW_COMMON is not set
 CONFIG_BLK_DEV_LOOP=m
-# CONFIG_BLK_DEV_CRYPTOLOOP is not set
-# CONFIG_BLK_DEV_NBD is not set
+CONFIG_BLK_DEV_CRYPTOLOOP=m
+CONFIG_BLK_DEV_NBD=m
 # CONFIG_BLK_DEV_SX8 is not set
 # CONFIG_BLK_DEV_UB is not set
 # CONFIG_BLK_DEV_RAM is not set
 # CONFIG_CDROM_PKTCDVD is not set
-# CONFIG_ATA_OVER_ETH is not set
+CONFIG_ATA_OVER_ETH=m
+# CONFIG_BLK_DEV_HD is not set
 # CONFIG_MISC_DEVICES is not set
+CONFIG_EEPROM_93CX6=m
+CONFIG_HAVE_IDE=y
 # CONFIG_IDE is not set
 
 #
@@ -571,20 +830,20 @@ CONFIG_SCSI_DMA=y
 # SCSI support type (disk, tape, CD-ROM)
 #
 CONFIG_BLK_DEV_SD=y
-# CONFIG_CHR_DEV_ST is not set
+CONFIG_CHR_DEV_ST=m
 # CONFIG_CHR_DEV_OSST is not set
 CONFIG_BLK_DEV_SR=m
 # CONFIG_BLK_DEV_SR_VENDOR is not set
 CONFIG_CHR_DEV_SG=m
-# CONFIG_CHR_DEV_SCH is not set
+CONFIG_CHR_DEV_SCH=m
 
 #
 # Some SCSI devices (e.g. CD jukebox) support multiple LUNs
 #
 CONFIG_SCSI_MULTI_LUN=y
-# CONFIG_SCSI_CONSTANTS is not set
+CONFIG_SCSI_CONSTANTS=y
 # CONFIG_SCSI_LOGGING is not set
-# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_SCAN_ASYNC=y
 CONFIG_SCSI_WAIT_SCAN=m
 
 #
@@ -594,11 +853,16 @@ CONFIG_SCSI_WAIT_SCAN=m
 # CONFIG_SCSI_FC_ATTRS is not set
 # CONFIG_SCSI_ISCSI_ATTRS is not set
 # CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
 # CONFIG_SCSI_LOWLEVEL is not set
+# CONFIG_SCSI_DH is not set
 CONFIG_ATA=y
 # CONFIG_ATA_NONSTANDARD is not set
 CONFIG_ATA_ACPI=y
+# CONFIG_SATA_PMP is not set
 # CONFIG_SATA_AHCI is not set
+# CONFIG_SATA_SIL24 is not set
+CONFIG_ATA_SFF=y
 # CONFIG_SATA_SVW is not set
 # CONFIG_ATA_PIIX is not set
 # CONFIG_SATA_MV is not set
@@ -608,21 +872,22 @@ CONFIG_ATA_ACPI=y
 # CONFIG_SATA_PROMISE is not set
 # CONFIG_SATA_SX4 is not set
 # CONFIG_SATA_SIL is not set
-# CONFIG_SATA_SIL24 is not set
 # CONFIG_SATA_SIS is not set
 # CONFIG_SATA_ULI is not set
 # CONFIG_SATA_VIA is not set
 # CONFIG_SATA_VITESSE is not set
 # CONFIG_SATA_INIC162X is not set
+# CONFIG_PATA_ACPI is not set
 # CONFIG_PATA_ALI is not set
-CONFIG_PATA_AMD=y
+# CONFIG_PATA_AMD is not set
 # CONFIG_PATA_ARTOP is not set
 # CONFIG_PATA_ATIIXP is not set
 # CONFIG_PATA_CMD640_PCI is not set
 # CONFIG_PATA_CMD64X is not set
 # CONFIG_PATA_CS5520 is not set
 # CONFIG_PATA_CS5530 is not set
-# CONFIG_PATA_CS5535 is not set
+CONFIG_PATA_CS5535=y
+CONFIG_PATA_CS5536=y
 # CONFIG_PATA_CYPRESS is not set
 # CONFIG_PATA_EFAR is not set
 # CONFIG_ATA_GENERIC is not set
@@ -638,7 +903,9 @@ CONFIG_PATA_AMD=y
 # CONFIG_PATA_MPIIX is not set
 # CONFIG_PATA_OLDPIIX is not set
 # CONFIG_PATA_NETCELL is not set
+# CONFIG_PATA_NINJA32 is not set
 # CONFIG_PATA_NS87410 is not set
+# CONFIG_PATA_NS87415 is not set
 # CONFIG_PATA_OPTI is not set
 # CONFIG_PATA_OPTIDMA is not set
 # CONFIG_PATA_PDC_OLD is not set
@@ -651,30 +918,47 @@ CONFIG_PATA_AMD=y
 # CONFIG_PATA_SIS is not set
 # CONFIG_PATA_VIA is not set
 # CONFIG_PATA_WINBOND is not set
-# CONFIG_MD is not set
+# CONFIG_PATA_SCH is not set
+CONFIG_MD=y
+CONFIG_BLK_DEV_MD=m
+CONFIG_MD_LINEAR=m
+CONFIG_MD_RAID0=m
+CONFIG_MD_RAID1=m
+CONFIG_MD_RAID10=m
+CONFIG_MD_RAID456=m
+CONFIG_MD_RAID5_RESHAPE=y
+CONFIG_MD_MULTIPATH=m
+CONFIG_MD_FAULTY=m
+CONFIG_BLK_DEV_DM=m
+# CONFIG_DM_DEBUG is not set
+CONFIG_DM_CRYPT=m
+CONFIG_DM_SNAPSHOT=m
+CONFIG_DM_MIRROR=m
+CONFIG_DM_ZERO=m
+CONFIG_DM_MULTIPATH=m
+CONFIG_DM_DELAY=m
+# CONFIG_DM_UEVENT is not set
+# CONFIG_FUSION is not set
 
 #
-# Fusion MPT device support
+# IEEE 1394 (FireWire) support
 #
-# CONFIG_FUSION is not set
-# CONFIG_FUSION_SPI is not set
-# CONFIG_FUSION_FC is not set
-# CONFIG_FUSION_SAS is not set
 
 #
-# IEEE 1394 (FireWire) support
+# Enable only one of the two stacks, unless you know what you are doing
 #
 # CONFIG_FIREWIRE is not set
 # CONFIG_IEEE1394 is not set
 # CONFIG_I2O is not set
 # CONFIG_MACINTOSH_DRIVERS is not set
 CONFIG_NETDEVICES=y
-# CONFIG_NETDEVICES_MULTIQUEUE is not set
+# CONFIG_IFB is not set
 # CONFIG_DUMMY is not set
 # CONFIG_BONDING is not set
 # CONFIG_MACVLAN is not set
 # CONFIG_EQUALIZER is not set
-# CONFIG_TUN is not set
+CONFIG_TUN=m
+# CONFIG_VETH is not set
 # CONFIG_NET_SB1000 is not set
 # CONFIG_ARCNET is not set
 # CONFIG_PHYLIB is not set
@@ -683,33 +967,79 @@ CONFIG_MII=y
 # CONFIG_HAPPYMEAL is not set
 # CONFIG_SUNGEM is not set
 # CONFIG_CASSINI is not set
-# CONFIG_NET_VENDOR_3COM is not set
-# CONFIG_NET_TULIP is not set
+CONFIG_NET_VENDOR_3COM=y
+CONFIG_VORTEX=m
+CONFIG_TYPHOON=m
+# CONFIG_ENC28J60 is not set
+# CONFIG_DNET is not set
+CONFIG_NET_TULIP=y
+CONFIG_DE2104X=m
+CONFIG_TULIP=m
+CONFIG_TULIP_MWI=y
+CONFIG_TULIP_MMIO=y
+CONFIG_TULIP_NAPI=y
+CONFIG_TULIP_NAPI_HW_MITIGATION=y
+CONFIG_DE4X5=m
+# CONFIG_WINBOND_840 is not set
+# CONFIG_DM9102 is not set
+# CONFIG_ULI526X is not set
 # CONFIG_HP100 is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
 CONFIG_NET_PCI=y
 # CONFIG_PCNET32 is not set
 # CONFIG_AMD8111_ETH is not set
 # CONFIG_ADAPTEC_STARFIRE is not set
 # CONFIG_B44 is not set
 # CONFIG_FORCEDETH is not set
-# CONFIG_DGRS is not set
-# CONFIG_EEPRO100 is not set
-# CONFIG_E100 is not set
+CONFIG_E100=m
 # CONFIG_FEALNX is not set
 # CONFIG_NATSEMI is not set
-# CONFIG_NE2K_PCI is not set
-# CONFIG_8139CP is not set
-# CONFIG_8139TOO is not set
+CONFIG_NE2K_PCI=m
+CONFIG_8139CP=m
+CONFIG_8139TOO=m
+CONFIG_8139TOO_PIO=y
+CONFIG_8139TOO_TUNE_TWISTER=y
+# CONFIG_8139TOO_8129 is not set
+# CONFIG_8139_OLD_RX_RESET is not set
+# CONFIG_R6040 is not set
 # CONFIG_SIS900 is not set
 # CONFIG_EPIC100 is not set
+# CONFIG_SMSC9420 is not set
 # CONFIG_SUNDANCE is not set
 # CONFIG_TLAN is not set
 CONFIG_VIA_RHINE=y
 CONFIG_VIA_RHINE_MMIO=y
-CONFIG_VIA_RHINE_NAPI=y
-# CONFIG_SC92031 is not set
+CONFIG_SC92031=m
 # CONFIG_NET_POCKET is not set
-# CONFIG_NETDEV_1000 is not set
+CONFIG_ATL2=m
+CONFIG_NETDEV_1000=y
+# CONFIG_ACENIC is not set
+# CONFIG_DL2K is not set
+CONFIG_E1000=m
+# CONFIG_E1000E is not set
+# CONFIG_IP1000 is not set
+# CONFIG_IGB is not set
+# CONFIG_NS83820 is not set
+# CONFIG_HAMACHI is not set
+# CONFIG_YELLOWFIN is not set
+CONFIG_R8169=m
+# CONFIG_SIS190 is not set
+# CONFIG_SKGE is not set
+# CONFIG_SKY2 is not set
+# CONFIG_VIA_VELOCITY is not set
+# CONFIG_TIGON3 is not set
+# CONFIG_BNX2 is not set
+# CONFIG_QLA3XXX is not set
+# CONFIG_ATL1 is not set
+# CONFIG_ATL1E is not set
+# CONFIG_ATL1C is not set
+# CONFIG_JME is not set
 # CONFIG_NETDEV_10000 is not set
 # CONFIG_TR is not set
 
@@ -718,43 +1048,108 @@ CONFIG_VIA_RHINE_NAPI=y
 #
 # CONFIG_WLAN_PRE80211 is not set
 CONFIG_WLAN_80211=y
-# CONFIG_IPW2100 is not set
-# CONFIG_IPW2200 is not set
-# CONFIG_LIBERTAS is not set
+CONFIG_LIBERTAS=m
+CONFIG_LIBERTAS_USB=m
+# CONFIG_LIBERTAS_DEBUG is not set
+CONFIG_LIBERTAS_THINFIRM=m
+CONFIG_LIBERTAS_THINFIRM_USB=m
 # CONFIG_AIRO is not set
 # CONFIG_HERMES is not set
 # CONFIG_ATMEL is not set
 # CONFIG_PRISM54 is not set
 CONFIG_USB_ZD1201=m
-# CONFIG_RTL8187 is not set
+CONFIG_USB_NET_RNDIS_WLAN=m
+CONFIG_RTL8180=m
+CONFIG_RTL8187=m
+# CONFIG_ADM8211 is not set
+# CONFIG_MAC80211_HWSIM is not set
+CONFIG_P54_COMMON=m
+CONFIG_P54_USB=m
+CONFIG_P54_PCI=m
+CONFIG_ATH5K=m
+# CONFIG_ATH5K_DEBUG is not set
+CONFIG_ATH9K=m
+# CONFIG_ATH9K_DEBUG is not set
+CONFIG_IPW2100=m
+CONFIG_IPW2100_MONITOR=y
+# CONFIG_IPW2100_DEBUG is not set
+CONFIG_IPW2200=m
+CONFIG_IPW2200_MONITOR=y
+CONFIG_IPW2200_RADIOTAP=y
+CONFIG_IPW2200_PROMISCUOUS=y
+CONFIG_IPW2200_QOS=y
+# CONFIG_IPW2200_DEBUG is not set
+CONFIG_LIBIPW=m
+# CONFIG_LIBIPW_DEBUG is not set
+CONFIG_IWLWIFI=m
+CONFIG_IWLCORE=m
+CONFIG_IWLWIFI_LEDS=y
+CONFIG_IWLWIFI_RFKILL=y
+# CONFIG_IWLWIFI_DEBUG is not set
+CONFIG_IWLAGN=m
+CONFIG_IWLAGN_SPECTRUM_MEASUREMENT=y
+CONFIG_IWLAGN_LEDS=y
+CONFIG_IWL4965=y
+CONFIG_IWL5000=y
+CONFIG_IWL3945=m
+CONFIG_IWL3945_RFKILL=y
+CONFIG_IWL3945_SPECTRUM_MEASUREMENT=y
+CONFIG_IWL3945_LEDS=y
+# CONFIG_IWL3945_DEBUG is not set
 # CONFIG_HOSTAP is not set
-CONFIG_BCM43XX=m
-CONFIG_BCM43XX_DEBUG=y
-CONFIG_BCM43XX_DMA=y
-CONFIG_BCM43XX_PIO=y
-CONFIG_BCM43XX_DMA_AND_PIO_MODE=y
-# CONFIG_BCM43XX_DMA_MODE is not set
-# CONFIG_BCM43XX_PIO_MODE is not set
+CONFIG_B43=m
+CONFIG_B43_PCI_AUTOSELECT=y
+CONFIG_B43_PCICORE_AUTOSELECT=y
+CONFIG_B43_LEDS=y
+# CONFIG_B43_DEBUG is not set
+CONFIG_B43LEGACY=m
+CONFIG_B43LEGACY_PCI_AUTOSELECT=y
+CONFIG_B43LEGACY_PCICORE_AUTOSELECT=y
+CONFIG_B43LEGACY_LEDS=y
+CONFIG_B43LEGACY_DEBUG=y
+CONFIG_B43LEGACY_DMA=y
+CONFIG_B43LEGACY_PIO=y
+CONFIG_B43LEGACY_DMA_AND_PIO_MODE=y
+# CONFIG_B43LEGACY_DMA_MODE is not set
+# CONFIG_B43LEGACY_PIO_MODE is not set
 CONFIG_ZD1211RW=m
 # CONFIG_ZD1211RW_DEBUG is not set
+CONFIG_RT2X00=m
+CONFIG_RT2400PCI=m
+CONFIG_RT2500PCI=m
+CONFIG_RT61PCI=m
+CONFIG_RT2500USB=m
+CONFIG_RT73USB=m
+CONFIG_RT2X00_LIB_PCI=m
+CONFIG_RT2X00_LIB_USB=m
+CONFIG_RT2X00_LIB=m
+CONFIG_RT2X00_LIB_FIRMWARE=y
+CONFIG_RT2X00_LIB_CRYPTO=y
+CONFIG_RT2X00_LIB_RFKILL=y
+CONFIG_RT2X00_LIB_LEDS=y
+# CONFIG_RT2X00_DEBUG is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
 
 #
 # USB Network Adapters
 #
-# CONFIG_USB_CATC is not set
+CONFIG_USB_CATC=m
 # CONFIG_USB_KAWETH is not set
-# CONFIG_USB_PEGASUS is not set
-# CONFIG_USB_RTL8150 is not set
-CONFIG_USB_USBNET_MII=m
+CONFIG_USB_PEGASUS=m
+CONFIG_USB_RTL8150=m
 CONFIG_USB_USBNET=m
-# CONFIG_USB_NET_AX8817X is not set
+CONFIG_USB_NET_AX8817X=m
 CONFIG_USB_NET_CDCETHER=m
 CONFIG_USB_NET_DM9601=m
-# CONFIG_USB_NET_GL620A is not set
-# CONFIG_USB_NET_NET1080 is not set
-# CONFIG_USB_NET_PLUSB is not set
-# CONFIG_USB_NET_MCS7830 is not set
-# CONFIG_USB_NET_RNDIS_HOST is not set
+CONFIG_USB_NET_SMSC95XX=m
+CONFIG_USB_NET_GL620A=m
+CONFIG_USB_NET_NET1080=m
+CONFIG_USB_NET_PLUSB=m
+CONFIG_USB_NET_MCS7830=m
+CONFIG_USB_NET_RNDIS_HOST=m
 CONFIG_USB_NET_CDC_SUBSET=m
 # CONFIG_USB_ALI_M5632 is not set
 # CONFIG_USB_AN2720 is not set
@@ -762,15 +1157,28 @@ CONFIG_USB_NET_CDC_SUBSET=m
 CONFIG_USB_ARMLINUX=y
 # CONFIG_USB_EPSON2888 is not set
 # CONFIG_USB_KC2190 is not set
-# CONFIG_USB_NET_ZAURUS is not set
+CONFIG_USB_NET_ZAURUS=m
+CONFIG_USB_HSO=m
 # CONFIG_WAN is not set
 # CONFIG_FDDI is not set
 # CONFIG_HIPPI is not set
-# CONFIG_PLIP is not set
-# CONFIG_PPP is not set
-# CONFIG_SLIP is not set
+CONFIG_PLIP=m
+CONFIG_PPP=m
+CONFIG_PPP_MULTILINK=y
+# CONFIG_PPP_FILTER is not set
+CONFIG_PPP_ASYNC=m
+# CONFIG_PPP_SYNC_TTY is not set
+CONFIG_PPP_DEFLATE=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_MPPE=m
+CONFIG_PPPOE=m
+CONFIG_PPPOL2TP=m
+CONFIG_SLIP=m
+CONFIG_SLIP_COMPRESSED=y
+CONFIG_SLHC=m
+CONFIG_SLIP_SMART=y
+CONFIG_SLIP_MODE_SLIP6=y
 # CONFIG_NET_FC is not set
-# CONFIG_SHAPER is not set
 # CONFIG_NETCONSOLE is not set
 # CONFIG_NETPOLL is not set
 # CONFIG_NET_POLL_CONTROLLER is not set
@@ -792,7 +1200,6 @@ CONFIG_INPUT_MOUSEDEV=y
 CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
 CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
 # CONFIG_INPUT_JOYDEV is not set
-# CONFIG_INPUT_TSDEV is not set
 CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_EVBUG is not set
 
@@ -806,16 +1213,20 @@ CONFIG_KEYBOARD_ATKBD=y
 # CONFIG_KEYBOARD_XTKBD is not set
 # CONFIG_KEYBOARD_NEWTON is not set
 # CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_GPIO is not set
 CONFIG_INPUT_MOUSE=y
 # CONFIG_MOUSE_PS2 is not set
 # CONFIG_MOUSE_SERIAL is not set
 # CONFIG_MOUSE_APPLETOUCH is not set
+# CONFIG_MOUSE_BCM5974 is not set
 # CONFIG_MOUSE_VSXXXAA is not set
+# CONFIG_MOUSE_GPIO is not set
 # CONFIG_INPUT_JOYSTICK is not set
 # CONFIG_INPUT_TABLET is not set
 # CONFIG_INPUT_TOUCHSCREEN is not set
 CONFIG_INPUT_MISC=y
-CONFIG_INPUT_PCSPKR=y
+CONFIG_INPUT_PCSPKR=m
+# CONFIG_INPUT_APANEL is not set
 # CONFIG_INPUT_WISTRON_BTNS is not set
 # CONFIG_INPUT_ATLAS_BTNS is not set
 # CONFIG_INPUT_ATI_REMOTE is not set
@@ -823,6 +1234,7 @@ CONFIG_INPUT_PCSPKR=y
 # CONFIG_INPUT_KEYSPAN_REMOTE is not set
 # CONFIG_INPUT_POWERMATE is not set
 # CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_CM109 is not set
 # CONFIG_INPUT_UINPUT is not set
 
 #
@@ -842,10 +1254,13 @@ CONFIG_SERIO_LIBPS2=y
 # Character devices
 #
 CONFIG_VT=y
+CONFIG_CONSOLE_TRANSLATIONS=y
 CONFIG_VT_CONSOLE=y
 CONFIG_HW_CONSOLE=y
 # CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_DEVKMEM=y
 # CONFIG_SERIAL_NONSTANDARD is not set
+CONFIG_NOZOMI=m
 
 #
 # Serial drivers
@@ -866,71 +1281,27 @@ CONFIG_SERIAL_CORE=y
 CONFIG_SERIAL_CORE_CONSOLE=y
 # CONFIG_SERIAL_JSM is not set
 CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_PRINTER is not set
 # CONFIG_PPDEV is not set
-# CONFIG_TIPAR is not set
 # CONFIG_IPMI_HANDLER is not set
-CONFIG_WATCHDOG=y
-# CONFIG_WATCHDOG_NOWAYOUT is not set
-
-#
-# Watchdog Device Drivers
-#
-# CONFIG_SOFT_WATCHDOG is not set
-# CONFIG_ACQUIRE_WDT is not set
-# CONFIG_ADVANTECH_WDT is not set
-# CONFIG_ALIM1535_WDT is not set
-# CONFIG_ALIM7101_WDT is not set
-# CONFIG_SC520_WDT is not set
-# CONFIG_EUROTECH_WDT is not set
-# CONFIG_IB700_WDT is not set
-# CONFIG_IBMASR is not set
-# CONFIG_WAFER_WDT is not set
-# CONFIG_I6300ESB_WDT is not set
-# CONFIG_ITCO_WDT is not set
-# CONFIG_SC1200_WDT is not set
-# CONFIG_PC87413_WDT is not set
-# CONFIG_60XX_WDT is not set
-# CONFIG_SBC8360_WDT is not set
-# CONFIG_CPU5_WDT is not set
-# CONFIG_SMSC37B787_WDT is not set
-# CONFIG_W83627HF_WDT is not set
-# CONFIG_W83697HF_WDT is not set
-# CONFIG_W83877F_WDT is not set
-# CONFIG_W83977F_WDT is not set
-# CONFIG_MACHZ_WDT is not set
-# CONFIG_SBC_EPX_C3_WATCHDOG is not set
-
-#
-# PCI-based Watchdog Cards
-#
-# CONFIG_PCIPCWATCHDOG is not set
-# CONFIG_WDTPCI is not set
-
-#
-# USB-based Watchdog Cards
-#
-# CONFIG_USBPCWATCHDOG is not set
 CONFIG_HW_RANDOM=y
 # CONFIG_HW_RANDOM_INTEL is not set
 # CONFIG_HW_RANDOM_AMD is not set
 CONFIG_HW_RANDOM_GEODE=y
 # CONFIG_HW_RANDOM_VIA is not set
 # CONFIG_NVRAM is not set
-CONFIG_RTC=y
 # CONFIG_R3964 is not set
 # CONFIG_APPLICOM is not set
 # CONFIG_SONYPI is not set
-# CONFIG_AGP is not set
-# CONFIG_DRM is not set
 # CONFIG_MWAVE is not set
+# CONFIG_SCx200_GPIO is not set
 # CONFIG_PC8736x_GPIO is not set
 CONFIG_NSC_GPIO=m
 CONFIG_CS5535_GPIO=m
 # CONFIG_RAW_DRIVER is not set
 CONFIG_HPET=y
-# CONFIG_HPET_RTC_IRQ is not set
 CONFIG_HPET_MMAP=y
 CONFIG_HANGCHECK_TIMER=m
 # CONFIG_TCG_TPM is not set
@@ -939,16 +1310,14 @@ CONFIG_DEVPORT=y
 CONFIG_I2C=y
 CONFIG_I2C_BOARDINFO=y
 CONFIG_I2C_CHARDEV=m
+CONFIG_I2C_HELPER_AUTO=y
 
 #
-# I2C Algorithms
+# I2C Hardware Bus support
 #
-CONFIG_I2C_ALGOBIT=y
-# CONFIG_I2C_ALGOPCF is not set
-# CONFIG_I2C_ALGOPCA is not set
 
 #
-# I2C Hardware Bus support
+# PC SMBus host controller drivers
 #
 # CONFIG_I2C_ALI1535 is not set
 # CONFIG_I2C_ALI1563 is not set
@@ -956,34 +1325,48 @@ CONFIG_I2C_ALGOBIT=y
 # CONFIG_I2C_AMD756 is not set
 # CONFIG_I2C_AMD8111 is not set
 # CONFIG_I2C_I801 is not set
-# CONFIG_I2C_I810 is not set
+# CONFIG_I2C_ISCH is not set
 # CONFIG_I2C_PIIX4 is not set
 # CONFIG_I2C_NFORCE2 is not set
-# CONFIG_I2C_OCORES is not set
-# CONFIG_I2C_PARPORT is not set
-# CONFIG_I2C_PARPORT_LIGHT is not set
-# CONFIG_I2C_PROSAVAGE is not set
-# CONFIG_I2C_SAVAGE4 is not set
-# CONFIG_I2C_SIMTEC is not set
-CONFIG_SCx200_ACB=m
 # CONFIG_I2C_SIS5595 is not set
 # CONFIG_I2C_SIS630 is not set
 # CONFIG_I2C_SIS96X is not set
-# CONFIG_I2C_TAOS_EVM is not set
-# CONFIG_I2C_STUB is not set
-# CONFIG_I2C_TINY_USB is not set
 # CONFIG_I2C_VIA is not set
 # CONFIG_I2C_VIAPRO is not set
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_GPIO is not set
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_SIMTEC is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT is not set
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Graphics adapter I2C/DDC channel drivers
+#
 # CONFIG_I2C_VOODOO3 is not set
 
 #
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_STUB is not set
+CONFIG_SCx200_ACB=m
+
+#
 # Miscellaneous I2C Chip support
 #
-# CONFIG_SENSORS_DS1337 is not set
-# CONFIG_SENSORS_DS1374 is not set
 # CONFIG_DS1682 is not set
-# CONFIG_SENSORS_EEPROM is not set
 # CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
 # CONFIG_SENSORS_PCA9539 is not set
 # CONFIG_SENSORS_PCF8591 is not set
 # CONFIG_SENSORS_MAX6875 is not set
@@ -992,105 +1375,173 @@ CONFIG_SCx200_ACB=m
 # CONFIG_I2C_DEBUG_ALGO is not set
 # CONFIG_I2C_DEBUG_BUS is not set
 # CONFIG_I2C_DEBUG_CHIP is not set
+CONFIG_SPI=y
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_BITBANG is not set
+# CONFIG_SPI_BUTTERFLY is not set
+# CONFIG_SPI_GPIO is not set
+# CONFIG_SPI_LM70_LLP is not set
 
 #
-# SPI support
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO expanders:
+#
+
+#
+# I2C GPIO expanders:
+#
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_GPIO_PCF857X is not set
+
+#
+# PCI GPIO expanders:
+#
+# CONFIG_GPIO_BT8XX is not set
+
 #
-# CONFIG_SPI is not set
-# CONFIG_SPI_MASTER is not set
+# SPI GPIO expanders:
+#
+# CONFIG_GPIO_MAX7301 is not set
+# CONFIG_GPIO_MCP23S08 is not set
 # CONFIG_W1 is not set
-# CONFIG_POWER_SUPPLY is not set
-CONFIG_HWMON=m
-CONFIG_HWMON_VID=m
-# CONFIG_SENSORS_ABITUGURU is not set
-# CONFIG_SENSORS_ABITUGURU3 is not set
-# CONFIG_SENSORS_AD7418 is not set
-# CONFIG_SENSORS_ADM1021 is not set
-# CONFIG_SENSORS_ADM1025 is not set
-# CONFIG_SENSORS_ADM1026 is not set
-# CONFIG_SENSORS_ADM1029 is not set
-# CONFIG_SENSORS_ADM1031 is not set
-# CONFIG_SENSORS_ADM9240 is not set
-# CONFIG_SENSORS_K8TEMP is not set
-# CONFIG_SENSORS_ASB100 is not set
-# CONFIG_SENSORS_ATXP1 is not set
-# CONFIG_SENSORS_DS1621 is not set
-# CONFIG_SENSORS_F71805F is not set
-# CONFIG_SENSORS_FSCHER is not set
-# CONFIG_SENSORS_FSCPOS is not set
-# CONFIG_SENSORS_GL518SM is not set
-# CONFIG_SENSORS_GL520SM is not set
-# CONFIG_SENSORS_CORETEMP is not set
-# CONFIG_SENSORS_IT87 is not set
-# CONFIG_SENSORS_LM63 is not set
-# CONFIG_SENSORS_LM75 is not set
-# CONFIG_SENSORS_LM77 is not set
-# CONFIG_SENSORS_LM78 is not set
-# CONFIG_SENSORS_LM80 is not set
-# CONFIG_SENSORS_LM83 is not set
-# CONFIG_SENSORS_LM85 is not set
-# CONFIG_SENSORS_LM87 is not set
-# CONFIG_SENSORS_LM90 is not set
-# CONFIG_SENSORS_LM92 is not set
-# CONFIG_SENSORS_LM93 is not set
-# CONFIG_SENSORS_MAX1619 is not set
-# CONFIG_SENSORS_MAX6650 is not set
-# CONFIG_SENSORS_PC87360 is not set
-# CONFIG_SENSORS_PC87427 is not set
-# CONFIG_SENSORS_SIS5595 is not set
-# CONFIG_SENSORS_DME1737 is not set
-# CONFIG_SENSORS_SMSC47M1 is not set
-# CONFIG_SENSORS_SMSC47M192 is not set
-# CONFIG_SENSORS_SMSC47B397 is not set
-# CONFIG_SENSORS_THMC50 is not set
-# CONFIG_SENSORS_VIA686A is not set
-# CONFIG_SENSORS_VT1211 is not set
-# CONFIG_SENSORS_VT8231 is not set
-# CONFIG_SENSORS_W83781D is not set
-# CONFIG_SENSORS_W83791D is not set
-# CONFIG_SENSORS_W83792D is not set
-# CONFIG_SENSORS_W83793 is not set
-# CONFIG_SENSORS_W83L785TS is not set
-CONFIG_SENSORS_W83627HF=m
-# CONFIG_SENSORS_W83627EHF is not set
-# CONFIG_SENSORS_HDAPS is not set
-# CONFIG_SENSORS_APPLESMC is not set
-# CONFIG_HWMON_DEBUG_CHIP is not set
+CONFIG_POWER_SUPPLY=y
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+# CONFIG_PDA_POWER is not set
+# CONFIG_BATTERY_DS2760 is not set
+CONFIG_BATTERY_OLPC=m
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_HWMON is not set
+CONFIG_THERMAL=m
+CONFIG_WATCHDOG=y
+# CONFIG_WATCHDOG_NOWAYOUT is not set
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+# CONFIG_ACQUIRE_WDT is not set
+# CONFIG_ADVANTECH_WDT is not set
+# CONFIG_ALIM1535_WDT is not set
+# CONFIG_ALIM7101_WDT is not set
+CONFIG_GEODE_WDT=m
+# CONFIG_SC520_WDT is not set
+# CONFIG_EUROTECH_WDT is not set
+# CONFIG_IB700_WDT is not set
+# CONFIG_IBMASR is not set
+# CONFIG_WAFER_WDT is not set
+# CONFIG_I6300ESB_WDT is not set
+# CONFIG_ITCO_WDT is not set
+# CONFIG_IT8712F_WDT is not set
+# CONFIG_IT87_WDT is not set
+# CONFIG_HP_WATCHDOG is not set
+# CONFIG_SC1200_WDT is not set
+# CONFIG_SCx200_WDT is not set
+# CONFIG_PC87413_WDT is not set
+# CONFIG_60XX_WDT is not set
+# CONFIG_SBC8360_WDT is not set
+# CONFIG_SBC7240_WDT is not set
+# CONFIG_CPU5_WDT is not set
+# CONFIG_SMSC_SCH311X_WDT is not set
+# CONFIG_SMSC37B787_WDT is not set
+# CONFIG_W83627HF_WDT is not set
+# CONFIG_W83697HF_WDT is not set
+# CONFIG_W83697UG_WDT is not set
+# CONFIG_W83877F_WDT is not set
+# CONFIG_W83977F_WDT is not set
+# CONFIG_MACHZ_WDT is not set
+# CONFIG_SBC_EPX_C3_WATCHDOG is not set
+
+#
+# PCI-based Watchdog Cards
+#
+# CONFIG_PCIPCWATCHDOG is not set
+# CONFIG_WDTPCI is not set
+
+#
+# USB-based Watchdog Cards
+#
+# CONFIG_USBPCWATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+CONFIG_SSB=m
+CONFIG_SSB_SPROM=y
+CONFIG_SSB_PCIHOST_POSSIBLE=y
+CONFIG_SSB_PCIHOST=y
+CONFIG_SSB_B43_PCI_BRIDGE=y
+# CONFIG_SSB_DEBUG is not set
+CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
+CONFIG_SSB_DRIVER_PCICORE=y
 
 #
 # Multifunction device drivers
 #
+# CONFIG_MFD_CORE is not set
 # CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_UCB1400_CORE is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_PCF50633 is not set
+# CONFIG_REGULATOR is not set
 
 #
 # Multimedia devices
 #
+
+#
+# Multimedia core support
+#
 # CONFIG_VIDEO_DEV is not set
 # CONFIG_DVB_CORE is not set
-# CONFIG_DAB is not set
+# CONFIG_VIDEO_MEDIA is not set
 
 #
-# Graphics support
+# Multimedia drivers
 #
-# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+# CONFIG_DAB is not set
 
 #
-# Display device support
+# Graphics support
 #
-# CONFIG_DISPLAY_SUPPORT is not set
+# CONFIG_AGP is not set
+# CONFIG_DRM is not set
 # CONFIG_VGASTATE is not set
 CONFIG_VIDEO_OUTPUT_CONTROL=m
 CONFIG_FB=y
 # CONFIG_FIRMWARE_EDID is not set
 # CONFIG_FB_DDC is not set
+# CONFIG_FB_BOOT_VESA_SUPPORT is not set
 CONFIG_FB_CFB_FILLRECT=y
 CONFIG_FB_CFB_COPYAREA=y
 CONFIG_FB_CFB_IMAGEBLIT=y
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
 # CONFIG_FB_SYS_FILLRECT is not set
 # CONFIG_FB_SYS_COPYAREA is not set
 # CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_FOREIGN_ENDIAN is not set
 # CONFIG_FB_SYS_FOPS is not set
-CONFIG_FB_DEFERRED_IO=y
 # CONFIG_FB_SVGALIB is not set
 # CONFIG_FB_MACMODES is not set
 # CONFIG_FB_BACKLIGHT is not set
@@ -1108,14 +1559,12 @@ CONFIG_FB_DEFERRED_IO=y
 # CONFIG_FB_IMSTT is not set
 # CONFIG_FB_VGA16 is not set
 # CONFIG_FB_VESA is not set
-# CONFIG_FB_HECUBA is not set
+# CONFIG_FB_N411 is not set
 # CONFIG_FB_HGA is not set
 # CONFIG_FB_S1D13XXX is not set
 # CONFIG_FB_NVIDIA is not set
 # CONFIG_FB_RIVA is not set
-# CONFIG_FB_I810 is not set
 # CONFIG_FB_LE80578 is not set
-# CONFIG_FB_INTEL is not set
 # CONFIG_FB_MATROX is not set
 # CONFIG_FB_RADEON is not set
 # CONFIG_FB_ATY128 is not set
@@ -1123,6 +1572,7 @@ CONFIG_FB_DEFERRED_IO=y
 # CONFIG_FB_S3 is not set
 # CONFIG_FB_SAVAGE is not set
 # CONFIG_FB_SIS is not set
+# CONFIG_FB_VIA is not set
 # CONFIG_FB_NEOMAGIC is not set
 # CONFIG_FB_KYRO is not set
 # CONFIG_FB_3DFX is not set
@@ -1132,46 +1582,39 @@ CONFIG_FB_DEFERRED_IO=y
 # CONFIG_FB_TRIDENT is not set
 # CONFIG_FB_ARK is not set
 # CONFIG_FB_PM3 is not set
+# CONFIG_FB_CARMINE is not set
 CONFIG_FB_GEODE=y
 CONFIG_FB_GEODE_LX=y
 # CONFIG_FB_GEODE_GX is not set
 # CONFIG_FB_GEODE_GX1 is not set
 # CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
 
 #
 # Console display driver support
 #
 CONFIG_VGA_CONSOLE=y
 # CONFIG_VGACON_SOFT_SCROLLBACK is not set
-CONFIG_VIDEO_SELECT=y
 CONFIG_DUMMY_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 # CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
 # CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
-CONFIG_FONTS=y
-# CONFIG_FONT_8x8 is not set
+# CONFIG_FONTS is not set
+CONFIG_FONT_8x8=y
 CONFIG_FONT_8x16=y
-# CONFIG_FONT_6x11 is not set
-# CONFIG_FONT_7x14 is not set
-# CONFIG_FONT_PEARL_8x8 is not set
-# CONFIG_FONT_ACORN_8x8 is not set
-# CONFIG_FONT_MINI_4x6 is not set
-# CONFIG_FONT_SUN8x16 is not set
-# CONFIG_FONT_SUN12x22 is not set
-# CONFIG_FONT_10x18 is not set
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
 CONFIG_LOGO_LINUX_CLUT224=y
-
-#
-# Sound
-#
 CONFIG_SOUND=m
-
-#
-# Advanced Linux Sound Architecture
-#
+CONFIG_SOUND_OSS_CORE=y
 CONFIG_SND=m
 CONFIG_SND_TIMER=m
 CONFIG_SND_PCM=m
@@ -1180,27 +1623,25 @@ CONFIG_SND_OSSEMUL=y
 CONFIG_SND_MIXER_OSS=m
 CONFIG_SND_PCM_OSS=m
 CONFIG_SND_PCM_OSS_PLUGINS=y
-CONFIG_SND_RTCTIMER=m
+# CONFIG_SND_HRTIMER is not set
 # CONFIG_SND_DYNAMIC_MINORS is not set
 # CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_VERBOSE_PROCFS is not set
 # CONFIG_SND_VERBOSE_PRINTK is not set
 # CONFIG_SND_DEBUG is not set
-
-#
-# Generic devices
-#
+CONFIG_SND_VMASTER=y
 CONFIG_SND_AC97_CODEC=m
+CONFIG_SND_DRIVERS=y
+# CONFIG_SND_PCSP is not set
 # CONFIG_SND_DUMMY is not set
 # CONFIG_SND_MTPAV is not set
 # CONFIG_SND_MTS64 is not set
 # CONFIG_SND_SERIAL_U16550 is not set
 # CONFIG_SND_MPU401 is not set
 # CONFIG_SND_PORTMAN2X4 is not set
-
-#
-# PCI devices
-#
+CONFIG_SND_AC97_POWER_SAVE=y
+CONFIG_SND_AC97_POWER_SAVE_DEFAULT=1
+CONFIG_SND_PCI=y
 # CONFIG_SND_AD1889 is not set
 # CONFIG_SND_ALS300 is not set
 # CONFIG_SND_ALS4000 is not set
@@ -1210,10 +1651,12 @@ CONFIG_SND_AC97_CODEC=m
 # CONFIG_SND_AU8810 is not set
 # CONFIG_SND_AU8820 is not set
 # CONFIG_SND_AU8830 is not set
+# CONFIG_SND_AW2 is not set
 # CONFIG_SND_AZT3328 is not set
 # CONFIG_SND_BT87X is not set
 # CONFIG_SND_CA0106 is not set
 # CONFIG_SND_CMIPCI is not set
+# CONFIG_SND_OXYGEN is not set
 # CONFIG_SND_CS4281 is not set
 # CONFIG_SND_CS46XX is not set
 # CONFIG_SND_CS5530 is not set
@@ -1240,6 +1683,7 @@ CONFIG_SND_CS5535AUDIO=m
 # CONFIG_SND_HDA_INTEL is not set
 # CONFIG_SND_HDSP is not set
 # CONFIG_SND_HDSPM is not set
+# CONFIG_SND_HIFIER is not set
 # CONFIG_SND_ICE1712 is not set
 # CONFIG_SND_ICE1724 is not set
 # CONFIG_SND_INTEL8X0 is not set
@@ -1253,71 +1697,89 @@ CONFIG_SND_CS5535AUDIO=m
 # CONFIG_SND_RME32 is not set
 # CONFIG_SND_RME96 is not set
 # CONFIG_SND_RME9652 is not set
+# CONFIG_SND_SIS7019 is not set
 # CONFIG_SND_SONICVIBES is not set
 # CONFIG_SND_TRIDENT is not set
 # CONFIG_SND_VIA82XX is not set
 # CONFIG_SND_VIA82XX_MODEM is not set
+# CONFIG_SND_VIRTUOSO is not set
 # CONFIG_SND_VX222 is not set
 # CONFIG_SND_YMFPCI is not set
-# CONFIG_SND_AC97_POWER_SAVE is not set
-
-#
-# USB devices
-#
-# CONFIG_SND_USB_AUDIO is not set
-# CONFIG_SND_USB_USX2Y is not set
-# CONFIG_SND_USB_CAIAQ is not set
-
-#
-# System on Chip audio support
-#
+# CONFIG_SND_SPI is not set
+# CONFIG_SND_USB is not set
 # CONFIG_SND_SOC is not set
-
-#
-# SoC Audio support for SuperH
-#
-
-#
-# Open Sound System
-#
 # CONFIG_SOUND_PRIME is not set
 CONFIG_AC97_BUS=m
 CONFIG_HID_SUPPORT=y
 CONFIG_HID=y
 # CONFIG_HID_DEBUG is not set
+# CONFIG_HIDRAW is not set
 
 #
 # USB Input Devices
 #
 CONFIG_USB_HID=y
-# CONFIG_USB_HIDINPUT_POWERBOOK is not set
-# CONFIG_HID_FF is not set
+# CONFIG_HID_PID is not set
 CONFIG_USB_HIDDEV=y
+
+#
+# Special HID drivers
+#
+CONFIG_HID_COMPAT=y
+CONFIG_HID_A4TECH=y
+CONFIG_HID_APPLE=y
+CONFIG_HID_BELKIN=y
+CONFIG_HID_CHERRY=y
+CONFIG_HID_CHICONY=y
+CONFIG_HID_CYPRESS=y
+CONFIG_HID_EZKEY=y
+CONFIG_HID_GYRATION=y
+CONFIG_HID_LOGITECH=y
+# CONFIG_LOGITECH_FF is not set
+# CONFIG_LOGIRUMBLEPAD2_FF is not set
+CONFIG_HID_MICROSOFT=y
+CONFIG_HID_MONTEREY=y
+CONFIG_HID_NTRIG=y
+CONFIG_HID_PANTHERLORD=y
+# CONFIG_PANTHERLORD_FF is not set
+CONFIG_HID_PETALYNX=y
+CONFIG_HID_SAMSUNG=y
+CONFIG_HID_SONY=y
+CONFIG_HID_SUNPLUS=y
+# CONFIG_GREENASIA_FF is not set
+CONFIG_HID_TOPSEED=y
+# CONFIG_THRUSTMASTER_FF is not set
+# CONFIG_ZEROPLUS_FF is not set
 CONFIG_USB_SUPPORT=y
 CONFIG_USB_ARCH_HAS_HCD=y
 CONFIG_USB_ARCH_HAS_OHCI=y
 CONFIG_USB_ARCH_HAS_EHCI=y
 CONFIG_USB=y
 # CONFIG_USB_DEBUG is not set
+# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
 
 #
 # Miscellaneous USB options
 #
 CONFIG_USB_DEVICEFS=y
-CONFIG_USB_DEVICE_CLASS=y
+# CONFIG_USB_DEVICE_CLASS is not set
 # CONFIG_USB_DYNAMIC_MINORS is not set
 CONFIG_USB_SUSPEND=y
-# CONFIG_USB_PERSIST is not set
 # CONFIG_USB_OTG is not set
+CONFIG_USB_MON=m
+# CONFIG_USB_WUSB is not set
+# CONFIG_USB_WUSB_CBAF is not set
 
 #
 # USB Host Controller Drivers
 #
+# CONFIG_USB_C67X00_HCD is not set
 CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_SPLIT_ISO=y
 CONFIG_USB_EHCI_ROOT_HUB_TT=y
 CONFIG_USB_EHCI_TT_NEWSCHED=y
+# CONFIG_USB_OXU210HP_HCD is not set
 # CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
 CONFIG_USB_OHCI_HCD=y
 # CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
 # CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
@@ -1325,31 +1787,37 @@ CONFIG_USB_OHCI_LITTLE_ENDIAN=y
 # CONFIG_USB_UHCI_HCD is not set
 # CONFIG_USB_SL811_HCD is not set
 # CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_WHCI_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
 
 #
 # USB Device Class drivers
 #
 CONFIG_USB_ACM=m
 CONFIG_USB_PRINTER=m
+CONFIG_USB_WDM=m
+# CONFIG_USB_TMC is not set
 
 #
-# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed;
 #
 
 #
-# may also be needed; see USB_STORAGE Help for more information
+# see USB_STORAGE Help for more information
 #
 CONFIG_USB_STORAGE=m
 # CONFIG_USB_STORAGE_DEBUG is not set
 # CONFIG_USB_STORAGE_DATAFAB is not set
 # CONFIG_USB_STORAGE_FREECOM is not set
-# CONFIG_USB_STORAGE_DPCM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
 # CONFIG_USB_STORAGE_USBAT is not set
 # CONFIG_USB_STORAGE_SDDR09 is not set
 # CONFIG_USB_STORAGE_SDDR55 is not set
 # CONFIG_USB_STORAGE_JUMPSHOT is not set
 # CONFIG_USB_STORAGE_ALAUDA is not set
+# CONFIG_USB_STORAGE_ONETOUCH is not set
 # CONFIG_USB_STORAGE_KARMA is not set
+# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
 # CONFIG_USB_LIBUSUAL is not set
 
 #
@@ -1357,16 +1825,11 @@ CONFIG_USB_STORAGE=m
 #
 # CONFIG_USB_MDC800 is not set
 # CONFIG_USB_MICROTEK is not set
-# CONFIG_USB_MON is not set
 
 #
 # USB port drivers
 #
 # CONFIG_USB_USS720 is not set
-
-#
-# USB Serial Converter support
-#
 # CONFIG_USB_SERIAL is not set
 
 #
@@ -1375,7 +1838,7 @@ CONFIG_USB_STORAGE=m
 # CONFIG_USB_EMI62 is not set
 # CONFIG_USB_EMI26 is not set
 # CONFIG_USB_ADUTUX is not set
-# CONFIG_USB_AUERSWALD is not set
+# CONFIG_USB_SEVSEG is not set
 # CONFIG_USB_RIO500 is not set
 # CONFIG_USB_LEGOTOWER is not set
 # CONFIG_USB_LCD is not set
@@ -1392,17 +1855,38 @@ CONFIG_USB_STORAGE=m
 # CONFIG_USB_TRANCEVIBRATOR is not set
 # CONFIG_USB_IOWARRIOR is not set
 # CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_VST is not set
+# CONFIG_USB_GADGET is not set
 
 #
-# USB DSL modem support
+# OTG and related infrastructure
 #
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_UWB is not set
+# CONFIG_MMC is not set
+# CONFIG_MEMSTICK is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=m
 
 #
-# USB Gadget Support
+# LED drivers
 #
-# CONFIG_USB_GADGET is not set
-# CONFIG_MMC is not set
-# CONFIG_NEW_LEDS is not set
+# CONFIG_LEDS_ALIX2 is not set
+# CONFIG_LEDS_PCA9532 is not set
+# CONFIG_LEDS_GPIO is not set
+# CONFIG_LEDS_CLEVO_MAIL is not set
+# CONFIG_LEDS_PCA955X is not set
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGERS=y
+# CONFIG_LEDS_TRIGGER_TIMER is not set
+# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+# CONFIG_ACCESSIBILITY is not set
 # CONFIG_INFINIBAND is not set
 # CONFIG_EDAC is not set
 CONFIG_RTC_LIB=y
@@ -1424,6 +1908,7 @@ CONFIG_RTC_INTF_DEV=y
 # I2C RTC drivers
 #
 # CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
 # CONFIG_RTC_DRV_DS1672 is not set
 # CONFIG_RTC_DRV_MAX6900 is not set
 # CONFIG_RTC_DRV_RS5C372 is not set
@@ -1432,75 +1917,102 @@ CONFIG_RTC_INTF_DEV=y
 # CONFIG_RTC_DRV_PCF8563 is not set
 # CONFIG_RTC_DRV_PCF8583 is not set
 # CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
 
 #
 # SPI RTC drivers
 #
+# CONFIG_RTC_DRV_M41T94 is not set
+# CONFIG_RTC_DRV_DS1305 is not set
+# CONFIG_RTC_DRV_DS1390 is not set
+# CONFIG_RTC_DRV_MAX6902 is not set
+# CONFIG_RTC_DRV_R9701 is not set
+# CONFIG_RTC_DRV_RS5C348 is not set
+# CONFIG_RTC_DRV_DS3234 is not set
 
 #
 # Platform RTC drivers
 #
 CONFIG_RTC_DRV_CMOS=y
+# CONFIG_RTC_DRV_DS1286 is not set
+# CONFIG_RTC_DRV_DS1511 is not set
 # CONFIG_RTC_DRV_DS1553 is not set
-# CONFIG_RTC_DRV_STK17TA8 is not set
 # CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
 # CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
 # CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
 # CONFIG_RTC_DRV_V3020 is not set
 
 #
 # on-CPU RTC drivers
 #
-
-#
-# DMA Engine support
-#
-# CONFIG_DMA_ENGINE is not set
-
-#
-# DMA Clients
-#
-
-#
-# DMA Devices
-#
+# CONFIG_DMADEVICES is not set
 # CONFIG_AUXDISPLAY is not set
-CONFIG_VIRTUALIZATION=y
-# CONFIG_KVM is not set
+CONFIG_UIO=m
+# CONFIG_UIO_CIF is not set
+# CONFIG_UIO_PDRV is not set
+CONFIG_UIO_PDRV_GENIRQ=m
+# CONFIG_UIO_SMX is not set
+# CONFIG_UIO_SERCOS3 is not set
+# CONFIG_STAGING is not set
+CONFIG_X86_PLATFORM_DEVICES=y
+# CONFIG_ASUS_LAPTOP is not set
+# CONFIG_TC1100_WMI is not set
+# CONFIG_SONY_LAPTOP is not set
+# CONFIG_THINKPAD_ACPI is not set
+# CONFIG_INTEL_MENLOW is not set
+# CONFIG_EEEPC_LAPTOP is not set
+# CONFIG_ACPI_WMI is not set
+# CONFIG_ACPI_ASUS is not set
+# CONFIG_ACPI_TOSHIBA is not set
 
 #
-# Userspace I/O
+# Firmware Drivers
 #
-# CONFIG_UIO is not set
+# CONFIG_EDD is not set
+CONFIG_FIRMWARE_MEMMAP=y
+# CONFIG_DELL_RBU is not set
+# CONFIG_DCDBAS is not set
+# CONFIG_DMIID is not set
+# CONFIG_ISCSI_IBFT_FIND is not set
 
 #
 # File systems
 #
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
-# CONFIG_EXT2_FS_POSIX_ACL is not set
+CONFIG_EXT2_FS_POSIX_ACL=y
 # CONFIG_EXT2_FS_SECURITY is not set
 # CONFIG_EXT2_FS_XIP is not set
 CONFIG_EXT3_FS=y
 CONFIG_EXT3_FS_XATTR=y
-# CONFIG_EXT3_FS_POSIX_ACL is not set
+CONFIG_EXT3_FS_POSIX_ACL=y
 # CONFIG_EXT3_FS_SECURITY is not set
-# CONFIG_EXT4DEV_FS is not set
+CONFIG_EXT4_FS=m
+# CONFIG_EXT4DEV_COMPAT is not set
+CONFIG_EXT4_FS_XATTR=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+# CONFIG_EXT4_FS_SECURITY is not set
 CONFIG_JBD=y
 # CONFIG_JBD_DEBUG is not set
+CONFIG_JBD2=m
+# CONFIG_JBD2_DEBUG is not set
 CONFIG_FS_MBCACHE=y
 # CONFIG_REISERFS_FS is not set
 # CONFIG_JFS_FS is not set
 CONFIG_FS_POSIX_ACL=y
+CONFIG_FILE_LOCKING=y
 # CONFIG_XFS_FS is not set
-# CONFIG_GFS2_FS is not set
 # CONFIG_OCFS2_FS is not set
-# CONFIG_MINIX_FS is not set
-# CONFIG_ROMFS_FS is not set
+# CONFIG_BTRFS_FS is not set
+CONFIG_DNOTIFY=y
 CONFIG_INOTIFY=y
 CONFIG_INOTIFY_USER=y
 # CONFIG_QUOTA is not set
-CONFIG_DNOTIFY=y
 # CONFIG_AUTOFS_FS is not set
 # CONFIG_AUTOFS4_FS is not set
 CONFIG_FUSE_FS=m
@@ -1524,7 +2036,7 @@ CONFIG_FAT_DEFAULT_CODEPAGE=437
 CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
 CONFIG_NTFS_FS=m
 # CONFIG_NTFS_DEBUG is not set
-# CONFIG_NTFS_RW is not set
+CONFIG_NTFS_RW=y
 
 #
 # Pseudo filesystems
@@ -1532,17 +2044,14 @@ CONFIG_NTFS_FS=m
 CONFIG_PROC_FS=y
 CONFIG_PROC_KCORE=y
 CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
 CONFIG_SYSFS=y
 CONFIG_TMPFS=y
 # CONFIG_TMPFS_POSIX_ACL is not set
 # CONFIG_HUGETLBFS is not set
 # CONFIG_HUGETLB_PAGE is not set
-CONFIG_RAMFS=y
 # CONFIG_CONFIGFS_FS is not set
-
-#
-# Miscellaneous filesystems
-#
+CONFIG_MISC_FILESYSTEMS=y
 # CONFIG_ADFS_FS is not set
 # CONFIG_AFFS_FS is not set
 # CONFIG_HFS_FS is not set
@@ -1551,35 +2060,37 @@ CONFIG_RAMFS=y
 # CONFIG_BFS_FS is not set
 # CONFIG_EFS_FS is not set
 CONFIG_CRAMFS=m
+CONFIG_SQUASHFS=m
+# CONFIG_SQUASHFS_EMBEDDED is not set
+CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
 # CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
 # CONFIG_HPFS_FS is not set
 # CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
 # CONFIG_SYSV_FS is not set
 # CONFIG_UFS_FS is not set
-
-#
-# Network File Systems
-#
-CONFIG_NFS_FS=m
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
 CONFIG_NFS_V3=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
-# CONFIG_NFS_DIRECTIO is not set
+CONFIG_ROOT_NFS=y
 CONFIG_NFSD=m
 CONFIG_NFSD_V2_ACL=y
 CONFIG_NFSD_V3=y
 CONFIG_NFSD_V3_ACL=y
 CONFIG_NFSD_V4=y
-CONFIG_NFSD_TCP=y
-CONFIG_LOCKD=m
+CONFIG_LOCKD=y
 CONFIG_LOCKD_V4=y
 CONFIG_EXPORTFS=m
-CONFIG_NFS_ACL_SUPPORT=m
+CONFIG_NFS_ACL_SUPPORT=y
 CONFIG_NFS_COMMON=y
-CONFIG_SUNRPC=m
-CONFIG_SUNRPC_GSS=m
-CONFIG_SUNRPC_BIND34=y
-CONFIG_RPCSEC_GSS_KRB5=m
+CONFIG_SUNRPC=y
+CONFIG_SUNRPC_GSS=y
+# CONFIG_SUNRPC_REGISTER_V4 is not set
+CONFIG_RPCSEC_GSS_KRB5=y
 # CONFIG_RPCSEC_GSS_SPKM3 is not set
 # CONFIG_SMB_FS is not set
 CONFIG_CIFS=m
@@ -1590,8 +2101,7 @@ CONFIG_CIFS_POSIX=y
 # CONFIG_CIFS_DEBUG2 is not set
 CONFIG_CIFS_EXPERIMENTAL=y
 # CONFIG_NCP_FS is not set
-CONFIG_CODA_FS=m
-# CONFIG_CODA_FS_OLD_API is not set
+# CONFIG_CODA_FS is not set
 # CONFIG_AFS_FS is not set
 
 #
@@ -1599,16 +2109,12 @@ CONFIG_CODA_FS=m
 #
 # CONFIG_PARTITION_ADVANCED is not set
 CONFIG_MSDOS_PARTITION=y
-
-#
-# Native Language Support
-#
 CONFIG_NLS=y
 CONFIG_NLS_DEFAULT="utf-8"
 CONFIG_NLS_CODEPAGE_437=m
 # CONFIG_NLS_CODEPAGE_737 is not set
 # CONFIG_NLS_CODEPAGE_775 is not set
-# CONFIG_NLS_CODEPAGE_850 is not set
+CONFIG_NLS_CODEPAGE_850=m
 CONFIG_NLS_CODEPAGE_852=m
 # CONFIG_NLS_CODEPAGE_855 is not set
 # CONFIG_NLS_CODEPAGE_857 is not set
@@ -1643,24 +2149,19 @@ CONFIG_NLS_ISO8859_2=m
 # CONFIG_NLS_KOI8_R is not set
 # CONFIG_NLS_KOI8_U is not set
 CONFIG_NLS_UTF8=y
-
-#
-# Distributed Lock Manager
-#
 # CONFIG_DLM is not set
-CONFIG_INSTRUMENTATION=y
-# CONFIG_PROFILING is not set
-# CONFIG_KPROBES is not set
 
 #
 # Kernel hacking
 #
 CONFIG_TRACE_IRQFLAGS_SUPPORT=y
 CONFIG_PRINTK_TIME=y
-CONFIG_ENABLE_MUST_CHECK=y
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=1024
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_UNUSED_SYMBOLS is not set
-# CONFIG_DEBUG_FS is not set
+CONFIG_DEBUG_FS=y
 # CONFIG_HEADERS_CHECK is not set
 CONFIG_DEBUG_KERNEL=y
 # CONFIG_DEBUG_SHIRQ is not set
@@ -1668,6 +2169,7 @@ CONFIG_DEBUG_KERNEL=y
 CONFIG_SCHED_DEBUG=y
 # CONFIG_SCHEDSTATS is not set
 CONFIG_TIMER_STATS=y
+# CONFIG_DEBUG_OBJECTS is not set
 # CONFIG_DEBUG_SLAB is not set
 # CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_DEBUG_RT_MUTEXES is not set
@@ -1679,89 +2181,220 @@ CONFIG_TIMER_STATS=y
 # CONFIG_LOCK_STAT is not set
 # CONFIG_DEBUG_SPINLOCK_SLEEP is not set
 # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+CONFIG_STACKTRACE=y
 # CONFIG_DEBUG_KOBJECT is not set
 CONFIG_DEBUG_BUGVERBOSE=y
 # CONFIG_DEBUG_INFO is not set
 # CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_VIRTUAL is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+CONFIG_DEBUG_MEMORY_INIT=y
 # CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+CONFIG_ARCH_WANT_FRAME_POINTERS=y
 # CONFIG_FRAME_POINTER is not set
-CONFIG_FORCED_INLINING=y
+# CONFIG_BOOT_PRINTK_DELAY is not set
 # CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
 # CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+CONFIG_USER_STACKTRACE_SUPPORT=y
+CONFIG_NOP_TRACER=y
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_FUNCTION_TRACE_MCOUNT_TEST=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_HW_BRANCH_TRACER=y
+CONFIG_RING_BUFFER=y
+CONFIG_TRACING=y
+
+#
+# Tracers
+#
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_PREEMPT_TRACER is not set
+# CONFIG_SYSPROF_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_CONTEXT_SWITCH_TRACER is not set
+# CONFIG_BOOT_TRACER is not set
+# CONFIG_TRACE_BRANCH_PROFILING is not set
+# CONFIG_POWER_TRACER is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_HW_BRANCH_TRACER is not set
+# CONFIG_FTRACE_STARTUP_TEST is not set
+# CONFIG_MMIOTRACE is not set
+# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
+# CONFIG_DYNAMIC_PRINTK_DEBUG is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_STRICT_DEVMEM is not set
+# CONFIG_X86_VERBOSE_BOOTUP is not set
 CONFIG_EARLY_PRINTK=y
+# CONFIG_EARLY_PRINTK_DBGP is not set
 # CONFIG_DEBUG_STACKOVERFLOW is not set
 # CONFIG_DEBUG_STACK_USAGE is not set
 # CONFIG_DEBUG_PAGEALLOC is not set
+# CONFIG_X86_PTDUMP is not set
 # CONFIG_DEBUG_RODATA is not set
+# CONFIG_DEBUG_NX_TEST is not set
 CONFIG_4KSTACKS=y
-CONFIG_X86_FIND_SMP_CONFIG=y
-CONFIG_X86_MPPARSE=y
 CONFIG_DOUBLEFAULT=y
+CONFIG_HAVE_MMIOTRACE_SUPPORT=y
+CONFIG_IO_DELAY_TYPE_0X80=0
+CONFIG_IO_DELAY_TYPE_0XED=1
+CONFIG_IO_DELAY_TYPE_UDELAY=2
+CONFIG_IO_DELAY_TYPE_NONE=3
+CONFIG_IO_DELAY_0X80=y
+# CONFIG_IO_DELAY_0XED is not set
+# CONFIG_IO_DELAY_UDELAY is not set
+# CONFIG_IO_DELAY_NONE is not set
+CONFIG_DEFAULT_IO_DELAY_TYPE=0
+# CONFIG_DEBUG_BOOT_PARAMS is not set
+# CONFIG_CPA_DEBUG is not set
+# CONFIG_OPTIMIZE_INLINING is not set
 
 #
 # Security options
 #
 # CONFIG_KEYS is not set
 # CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+CONFIG_XOR_BLOCKS=m
+CONFIG_ASYNC_CORE=m
+CONFIG_ASYNC_MEMCPY=m
+CONFIG_ASYNC_XOR=m
 CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_FIPS=y
 CONFIG_CRYPTO_ALGAPI=y
-CONFIG_CRYPTO_ABLKCIPHER=m
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_AEAD=m
+CONFIG_CRYPTO_AEAD2=y
 CONFIG_CRYPTO_BLKCIPHER=y
-CONFIG_CRYPTO_HASH=m
-CONFIG_CRYPTO_MANAGER=m
+CONFIG_CRYPTO_BLKCIPHER2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+CONFIG_CRYPTO_RNG=m
+CONFIG_CRYPTO_RNG2=y
+CONFIG_CRYPTO_MANAGER=y
+CONFIG_CRYPTO_MANAGER2=y
+CONFIG_CRYPTO_GF128MUL=m
+CONFIG_CRYPTO_NULL=m
+CONFIG_CRYPTO_CRYPTD=m
+CONFIG_CRYPTO_AUTHENC=m
+CONFIG_CRYPTO_TEST=m
+
+#
+# Authenticated Encryption with Associated Data
+#
+CONFIG_CRYPTO_CCM=m
+CONFIG_CRYPTO_GCM=m
+CONFIG_CRYPTO_SEQIV=m
+
+#
+# Block modes
+#
+CONFIG_CRYPTO_CBC=y
+CONFIG_CRYPTO_CTR=m
+CONFIG_CRYPTO_CTS=m
+CONFIG_CRYPTO_ECB=m
+CONFIG_CRYPTO_LRW=m
+CONFIG_CRYPTO_PCBC=m
+CONFIG_CRYPTO_XTS=m
+
+#
+# Hash modes
+#
 CONFIG_CRYPTO_HMAC=m
 CONFIG_CRYPTO_XCBC=m
-CONFIG_CRYPTO_NULL=m
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=m
+# CONFIG_CRYPTO_CRC32C_INTEL is not set
 CONFIG_CRYPTO_MD4=m
-CONFIG_CRYPTO_MD5=m
+CONFIG_CRYPTO_MD5=y
+CONFIG_CRYPTO_MICHAEL_MIC=m
+CONFIG_CRYPTO_RMD128=m
+CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_RMD256=m
+CONFIG_CRYPTO_RMD320=m
 CONFIG_CRYPTO_SHA1=m
 CONFIG_CRYPTO_SHA256=m
 CONFIG_CRYPTO_SHA512=m
-CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_TGR192=m
-CONFIG_CRYPTO_GF128MUL=m
-CONFIG_CRYPTO_ECB=m
-CONFIG_CRYPTO_CBC=m
-CONFIG_CRYPTO_PCBC=m
-CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_CRYPTD=m
-CONFIG_CRYPTO_DES=m
-CONFIG_CRYPTO_FCRYPT=m
-CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_TWOFISH=m
-CONFIG_CRYPTO_TWOFISH_COMMON=m
-CONFIG_CRYPTO_TWOFISH_586=m
-CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_WP512=m
+
+#
+# Ciphers
+#
 CONFIG_CRYPTO_AES=m
 CONFIG_CRYPTO_AES_586=m
+CONFIG_CRYPTO_ANUBIS=m
+CONFIG_CRYPTO_ARC4=m
+CONFIG_CRYPTO_BLOWFISH=m
+CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
-CONFIG_CRYPTO_TEA=m
-CONFIG_CRYPTO_ARC4=m
+CONFIG_CRYPTO_DES=y
+CONFIG_CRYPTO_FCRYPT=m
 CONFIG_CRYPTO_KHAZAD=m
-CONFIG_CRYPTO_ANUBIS=m
+CONFIG_CRYPTO_SALSA20=m
+CONFIG_CRYPTO_SALSA20_586=m
+CONFIG_CRYPTO_SEED=m
+CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_TEA=m
+CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_TWOFISH_COMMON=m
+CONFIG_CRYPTO_TWOFISH_586=m
+
+#
+# Compression
+#
 CONFIG_CRYPTO_DEFLATE=m
-CONFIG_CRYPTO_MICHAEL_MIC=m
-CONFIG_CRYPTO_CRC32C=m
-CONFIG_CRYPTO_CAMELLIA=m
-CONFIG_CRYPTO_TEST=m
+CONFIG_CRYPTO_LZO=m
+
+#
+# Random Number Generation
+#
+CONFIG_CRYPTO_ANSI_CPRNG=m
 CONFIG_CRYPTO_HW=y
 # CONFIG_CRYPTO_DEV_PADLOCK is not set
-CONFIG_CRYPTO_DEV_GEODE=y
+CONFIG_CRYPTO_DEV_GEODE=m
+# CONFIG_CRYPTO_DEV_HIFN_795X is not set
+CONFIG_HAVE_KVM=y
+# CONFIG_VIRTUALIZATION is not set
 
 #
 # Library routines
 #
 CONFIG_BITREVERSE=y
+CONFIG_GENERIC_FIND_FIRST_BIT=y
+CONFIG_GENERIC_FIND_NEXT_BIT=y
+CONFIG_GENERIC_FIND_LAST_BIT=y
 CONFIG_CRC_CCITT=m
-# CONFIG_CRC16 is not set
-# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC16=m
+# CONFIG_CRC_T10DIF is not set
+CONFIG_CRC_ITU_T=m
 CONFIG_CRC32=y
 # CONFIG_CRC7 is not set
 CONFIG_LIBCRC32C=m
 CONFIG_AUDIT_GENERIC=y
 CONFIG_ZLIB_INFLATE=m
 CONFIG_ZLIB_DEFLATE=m
+CONFIG_LZO_COMPRESS=m
+CONFIG_LZO_DECOMPRESS=m
 CONFIG_TEXTSEARCH=y
 CONFIG_TEXTSEARCH_KMP=m
 CONFIG_TEXTSEARCH_BM=m
@@ -1770,7 +2403,3 @@ CONFIG_PLIST=y
 CONFIG_HAS_IOMEM=y
 CONFIG_HAS_IOPORT=y
 CONFIG_HAS_DMA=y
-CONFIG_GENERIC_HARDIRQS=y
-CONFIG_GENERIC_IRQ_PROBE=y
-CONFIG_X86_BIOS_REBOOT=y
-CONFIG_KTIME_SCALAR=y
diff --git a/recipes/linux/linux_2.6.25.bb b/recipes/linux/linux_2.6.25.bb
index b529b75..fabba65 100644
--- a/recipes/linux/linux_2.6.25.bb
+++ b/recipes/linux/linux_2.6.25.bb
@@ -8,7 +8,6 @@ DEFAULT_PREFERENCE_mpc8313e-rdb = "1"
 DEFAULT_PREFERENCE_kilauea = "1"
 DEFAULT_PREFERENCE_sequoia = "1"
 DEFAULT_PREFERENCE_cm-x270 = "-1"
-DEFAULT_PREFERENCE_alix = "1"
 DEFAULT_PREFERENCE_at32stk1000 = "1"
 DEFAULT_PREFERENCE_at91-l9260 = "1"
 DEFAULT_PREFERENCE_db1200 = "1"
diff --git a/recipes/linux/linux_2.6.29.bb b/recipes/linux/linux_2.6.29.bb
index 4850fba..89767d6 100644
--- a/recipes/linux/linux_2.6.29.bb
+++ b/recipes/linux/linux_2.6.29.bb
@@ -14,6 +14,7 @@ DEFAULT_PREFERENCE_atngw100 = "1"
 DEFAULT_PREFERENCE_micro2440 = "1"
 DEFAULT_PREFERENCE_ep93xx = "1"
 DEFAULT_PREFERENCE_cm-x270 = "1"
+DEFAULT_PREFERENCE_geodelx = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.29.tar.bz2 \
            file://defconfig"
-- 
1.6.3





