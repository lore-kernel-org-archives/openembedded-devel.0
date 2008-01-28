Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <utx@penguin.cz>) id 1JJVLW-000657-Rx
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2008 15:52:27 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 2085D6280CE;
	Mon, 28 Jan 2008 15:52:33 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Jan 2008 15:52:32 +0100
Message-Id: <1201531952.5882.32.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
Subject: [patch commit request] kernel fixes for Zaurus akita+spitz
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2008 14:52:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hallo.

Would be anybody with commit privileges to OE mtn so kind and review and
commit attached fixes regarding Akita and Spitz kernel for rp kernels?
Thanks.

These patches works well for me for several months, now I have
re-created mtn patch using the latest dev snapshot.

They were created in past for angstrom branch and sent to
angstrom-distro-devel (no response yet). Now I ported them for both rp
kernels currently existing in dev branch and trying it again.

Attached kernel patches are based on
http://bugs.openembedded.org/show_bug.cgi?id=3283
All these patches were submitted to the Bugzilla  several months ago.
They have even been discussed in the list and acked by Richard Purdie.


Fixes following issues:

- Fix broken Zaurus boot ROM access when MTD is compiled as module.
Status: Accepted to mm, pending for vanilla kernel

- Fix WM8750 ALSA mixer treble to use convenient treble scale (increase =
increase treble level). Needs proper fix of the default ALSA state (bug 2617
fixes this problem and I can send a patch to the list)
Status: Accepted to mm and ALSA project, pending for vanilla kernel

- Sharp CE-RH2 Remote support patch. Justin Patrin's work ported from
2.6.20 based on Richard Purdie's work.
Status: Works perfectly, not upstreamed yet. Maybe it would be good to
rewrite it to 1-D input device and move key identification probably to
user space using uinput.

Warning: The last patch needs to re-flash zImage - it needs access to
MAX1111 multiplexer, which is not provided by unpatched kernel.

They are useful for Spitz and Akita and valid for kernel 2.4.23 and
2.4.24. For 2.4.25 they will be probably upstreamed (with exception of
sharpsl-rc-r1.patch).

Attached patch is created for org.openembedded.angstrom-2007.12-stable
branch and linux-rp-2.6.23. I can create patch for 2.6.24 and dev as
well.


#
# old_revision [54d430eac081b6372e156d9c6d7b9a44d9c9422f]
#
# add_file "packages/linux/linux-rp-2.6.23/mtd-module.patch"
#  content [3336d389463dfeab12804b8b425c9451ac9ba8ea]
# 
# add_file "packages/linux/linux-rp-2.6.23/sharpsl-rc-r1.patch"
#  content [6fb750fdfb34ec9fb77ea05cf1226ffc210c8d83]
# 
# add_file "packages/linux/linux-rp-2.6.23/wm8750-treble.patch"
#  content [075d3018a7b6514bfd21550eb2cf93372b02ac02]
# 
# add_file "packages/linux/linux-rp-2.6.24/mtd-module.patch"
#  content [3336d389463dfeab12804b8b425c9451ac9ba8ea]
# 
# add_file "packages/linux/linux-rp-2.6.24/sharpsl-rc-r1.patch"
#  content [73fadc16c16d9a7a8e42c53e79e6eba467cdf59b]
# 
# add_file "packages/linux/linux-rp-2.6.24/wm8750-treble.patch"
#  content [075d3018a7b6514bfd21550eb2cf93372b02ac02]
# 
# patch "packages/linux/linux-rp-2.6.23/defconfig-spitz"
#  from [b7ae462871d969fb588349aa16c4991646c4ff65]
#    to [b071f674a2ac8b9b060cc5de413b281a6f19e5c6]
# 
# patch "packages/linux/linux-rp-2.6.24/defconfig-spitz"
#  from [f65cb0f276b3dc6b756efc00689ee05903f1c6d1]
#    to [1c089b38d34a93c68659ef90bec902bbbcf436ae]
# 
# patch "packages/linux/linux-rp_2.6.23.bb"
#  from [859f03b96da909344eeea42ccccd31eb657a0f26]
#    to [6586eaa5d600cdf73b9096535eb1f1f046f4d49d]
# 
# patch "packages/linux/linux-rp_2.6.24.bb"
#  from [26786b548ae1b68bc05de430837610e681a529e8]
#    to [a259a9e0a8d5d3aaf8f78bf8bc90a1c6a66bc303]
#
============================================================
--- packages/linux/linux-rp-2.6.23/mtd-module.patch	3336d389463dfeab12804b8b425c9451ac9ba8ea
+++ packages/linux/linux-rp-2.6.23/mtd-module.patch	3336d389463dfeab12804b8b425c9451ac9ba8ea
@@ -0,0 +1,13 @@
+Index: linux-2.6.23/drivers/mtd/maps/Kconfig
+===================================================================
+--- linux-2.6.23/drivers/mtd/maps/Kconfig
++++ linux-2.6.23/drivers/mtd/maps/Kconfig
+@@ -600,7 +600,7 @@
+ 	default "4"
+ 
+ config MTD_SHARP_SL
+-	bool "ROM mapped on Sharp SL Series"
++	tristate "ROM mapped on Sharp SL Series"
+ 	depends on ARCH_PXA
+ 	help
+ 	  This enables access to the flash chip on the Sharp SL Series of PDAs.
============================================================
--- packages/linux/linux-rp-2.6.23/sharpsl-rc-r1.patch	6fb750fdfb34ec9fb77ea05cf1226ffc210c8d83
+++ packages/linux/linux-rp-2.6.23/sharpsl-rc-r1.patch	6fb750fdfb34ec9fb77ea05cf1226ffc210c8d83
@@ -0,0 +1,519 @@
+Index: linux-2.6.23/arch/arm/mach-pxa/spitz.c
+===================================================================
+--- linux-2.6.23.orig/arch/arm/mach-pxa/spitz.c
++++ linux-2.6.23/arch/arm/mach-pxa/spitz.c
+@@ -245,6 +245,13 @@ static struct platform_device spitzkbd_d
+ 	.id		= -1,
+ };
+ 
++/*
++ * Spitz Remote Control Device
++ */
++static struct platform_device sharpsl_rc_device = {
++	.name		= "sharpsl-remote-control",
++	.id		= -1,
++};
+ 
+ /*
+  * Spitz LEDs
+@@ -477,6 +484,7 @@ static struct platform_device *devices[]
+ 	&spitzscoop_device,
+ 	&spitzssp_device,
+ 	&spitzkbd_device,
++	&sharpsl_rc_device,
+ 	&spitzts_device,
+ 	&spitzbl_device,
+ 	&spitzled_device,
+Index: linux-2.6.23/drivers/input/keyboard/Kconfig
+===================================================================
+--- linux-2.6.23.orig/drivers/input/keyboard/Kconfig
++++ linux-2.6.23/drivers/input/keyboard/Kconfig
+@@ -154,6 +154,17 @@ config KEYBOARD_SPITZ
+ 	  To compile this driver as a module, choose M here: the
+ 	  module will be called spitzkbd.
+ 
++config SHARPSL_RC
++	tristate "Sharp SL-Cxx00 Remote Control"
++	depends on PXA_SHARPSL
++	default y
++	help
++	  Say Y here to enable the remote on the Sharp Zaurus SL-Cxx00,
++	  SL-C1000, SL-C3000 and Sl-C3100 series of PDAs.
++
++	  To compile this driver as a module, choose M here: the
++	  module will be called sharpsl_rc.
++
+ config KEYBOARD_AMIGA
+ 	tristate "Amiga keyboard"
+ 	depends on AMIGA
+Index: linux-2.6.23/drivers/input/keyboard/Makefile
+===================================================================
+--- linux-2.6.23.orig/drivers/input/keyboard/Makefile
++++ linux-2.6.23/drivers/input/keyboard/Makefile
+@@ -15,6 +15,7 @@ obj-$(CONFIG_KEYBOARD_NEWTON)		+= newton
+ obj-$(CONFIG_KEYBOARD_STOWAWAY)		+= stowaway.o
+ obj-$(CONFIG_KEYBOARD_CORGI)		+= corgikbd.o
+ obj-$(CONFIG_KEYBOARD_SPITZ)		+= spitzkbd.o
++obj-$(CONFIG_SHARPSL_RC)			+= sharpsl_rc.o
+ obj-$(CONFIG_KEYBOARD_HIL)		+= hil_kbd.o
+ obj-$(CONFIG_KEYBOARD_HIL_OLD)		+= hilkbd.o
+ obj-$(CONFIG_KEYBOARD_OMAP)		+= omap-keypad.o
+Index: linux-2.6.23/drivers/input/keyboard/sharpsl_rc.c
+===================================================================
+--- /dev/null
++++ linux-2.6.23/drivers/input/keyboard/sharpsl_rc.c
+@@ -0,0 +1,291 @@
++/*
++ *  Keyboard driver for Sharp Clamshell Models (SL-Cxx00)
++ *
++ *  Copyright (c) 2004-2005 Richard Purdie
++ *
++ *  Based on corgikbd.c and Sharp's RC driver
++ *
++ *  This program is free software; you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License version 2 as
++ *  published by the Free Software Foundation.
++ *
++ */
++
++#define DEBUG 1
++#include <linux/delay.h>
++#include <linux/platform_device.h>
++#include <linux/init.h>
++#include <linux/input.h>
++#include <linux/interrupt.h>
++#include <linux/jiffies.h>
++#include <linux/module.h>
++#include <linux/slab.h>
++
++#ifdef CONFIG_MACH_SPITZ
++#include <asm/arch/spitz.h>
++#endif
++#ifdef CONFIG_MACH_CORGI
++#include <asm/arch/corgi.h>
++#endif
++
++#include <asm/arch/hardware.h>
++#include <asm/arch/pxa-regs.h>
++#include <asm/hardware/scoop.h>
++#include <asm/arch/sharpsl.h>
++#include <asm/hardware/sharpsl_pm.h>
++
++#define DPRINTK(fmt, args...) dev_dbg(data->dev, fmt "\n", ##args)
++
++struct remote_control_key {
++	unsigned char min;
++	unsigned char max;
++	unsigned char key;
++};
++
++#ifdef CONFIG_MACH_SPITZ
++#define REMOTE_AKIN_PULLUP SPITZ_SCP2_AKIN_PULLUP
++#define REMOTE_SCOOP_DEVICE spitzscoop2_device
++#define REMOTE_GPIO_INT SPITZ_GPIO_AK_INT
++#define REMOTE_IRQ_INT SPITZ_IRQ_GPIO_AK_INT
++static struct remote_control_key remote_keys[] = {
++	{ 25, 35, KEY_STOPCD},
++	{ 55, 65, KEY_PLAYPAUSE},
++	{ 85, 95, KEY_NEXTSONG},
++	{ 115, 125, KEY_VOLUMEUP},
++	{ 145, 155, KEY_PREVIOUSSONG},
++	{ 180, 190, KEY_MUTE},
++	{ 215, 225, KEY_VOLUMEDOWN},
++};
++#endif
++#ifdef CONFIG_MACH_CORGI
++#define REMOTE_AKIN_PULLUP CORGI_SCP_AKIN_PULLUP
++#define REMOTE_SCOOP_DEVICE corgiscoop_device
++#define REMOTE_GPIO_INT CORGI_GPIO_AK_INT
++#define REMOTE_IRQ_INT CORGI_IRQ_GPIO_AK_INT
++static struct remote_control_key remote_keys[] = {
++    //These need to be fixed for the CE-RH1's values
++	{ 25, 35, KEY_STOPCD},
++	{ 55, 65, KEY_PLAYPAUSE},
++	{ 85, 95, KEY_NEXTSONG},
++	{ 115, 125, KEY_VOLUMEUP},
++	{ 145, 155, KEY_PREVIOUSSONG},
++	{ 180, 190, KEY_MUTE},
++	{ 215, 225, KEY_VOLUMEDOWN},
++};
++#endif
++
++#define RELEASE_HI      230
++#define MAX_EARPHONE    6
++#define RC_POLL_MS      10
++#define RC_FINISH_MS    500
++#define WAIT_STATE      3
++#define NOISE_THRESHOLD 100
++
++struct sharpsl_rc {
++	struct input_dev *input;
++	struct device *dev;
++
++	spinlock_t lock;
++	struct timer_list rctimer;
++	struct timer_list rctimer_finish;
++
++	unsigned int handling_press;
++	unsigned int noise;
++	unsigned int state;
++	unsigned int last_key;
++};
++
++static int get_remocon_raw(void)
++{
++	int i, val;
++
++	val = sharpsl_pm_pxa_read_max1111(MAX1111_REMCOM);
++	for (i = 0; i < ARRAY_SIZE(remote_keys); ++i) {
++		if (val >= remote_keys[i].min
++			&& val <= remote_keys[i].max) {
++			printk("get_remocon_raw: VAL=%i, KEY=%i\n", val, remote_keys[i].key);
++			return remote_keys[i].key;
++		}
++	}
++	return 0;
++}
++
++static irqreturn_t sharpsl_rc_interrupt(int irq, void *dev_id, struct pt_regs *regs)
++{
++	struct sharpsl_rc *data = dev_id;
++	DPRINTK("sharpsl_rc_interrupt %d\n", irq);
++	if (!data->handling_press) {
++		DPRINTK("handling interrupt");
++		data->handling_press = 1;
++		data->noise = 0;
++		data->state = 0;
++		data->last_key = 0;
++
++		reset_scoop_gpio(&REMOTE_SCOOP_DEVICE.dev, REMOTE_AKIN_PULLUP);
++
++		mod_timer(&data->rctimer, jiffies + msecs_to_jiffies(RC_POLL_MS));
++	}
++	return IRQ_HANDLED;
++}
++
++static void sharpsl_rc_timer_callback(unsigned long dataPtr)
++{
++	struct sharpsl_rc *data = (struct sharpsl_rc *) dataPtr;
++	int timer = 1;
++	int key = get_remocon_raw();
++	DPRINTK("timer callback, key: %d", key);
++
++	//wait for value to stabilize
++	if (data->state < WAIT_STATE) {
++		if (data->last_key != key) {
++			++data->noise;
++			if (data->noise > NOISE_THRESHOLD) {
++				DPRINTK("too much noise, bailing");
++				timer = 0;
++			}
++			data->state = 0;
++		} else {
++			++data->state;
++		}
++		data->last_key = key;
++
++	//stable value, send event
++	} else if (data->state == WAIT_STATE) {
++		data->noise = 0;
++		//non-key returned, skip the rest of the states and bail now
++		if (data->last_key == 0) {
++			DPRINTK("non-key detected %d, noise: %d", data->last_key, data->noise);
++			timer = 0;
++		//send button press
++		} else {
++			DPRINTK("key press detected %d, noise %d", data->last_key, data->noise);
++			input_report_key(data->input, data->last_key, 1);
++		}
++		++data->state;
++
++	//wait until key is released
++	} else if (data->state < WAIT_STATE * 2) {
++		if (key == data->last_key
++			&& data->noise < NOISE_THRESHOLD) {
++			data->state = WAIT_STATE + 1;
++			++data->noise;
++		} else {
++			++data->state;
++		}
++	//key is released, send event
++	} else {
++		//send button release
++		DPRINTK("release key %d", data->last_key);
++		input_report_key(data->input, data->last_key, 0);
++		timer = 0;
++	}
++	if (timer) {
++		mod_timer(&data->rctimer, jiffies + msecs_to_jiffies(RC_POLL_MS));
++	} else {
++		set_scoop_gpio(&REMOTE_SCOOP_DEVICE.dev, REMOTE_AKIN_PULLUP);
++		data->handling_press = 0;
++	}
++}
++
++static int __init sharpsl_rc_probe(struct platform_device *pdev)
++{
++	struct sharpsl_rc *sharpsl_rc;
++	struct input_dev *input_dev;
++	int i, ret;
++
++	dev_dbg(&pdev->dev, "sharpsl_rc_probe\n");
++
++	sharpsl_rc = kzalloc(sizeof(struct sharpsl_rc), GFP_KERNEL);
++	input_dev = input_allocate_device();
++	if (!sharpsl_rc || !input_dev) {
++		kfree(sharpsl_rc);
++		input_free_device(input_dev);
++		return -ENOMEM;
++	}
++
++	platform_set_drvdata(pdev, sharpsl_rc);
++
++	sharpsl_rc->dev = &pdev->dev;
++	sharpsl_rc->input = input_dev;
++	spin_lock_init(&sharpsl_rc->lock);
++
++	/* Init Remote Control Timer */
++	init_timer(&sharpsl_rc->rctimer);
++	sharpsl_rc->rctimer.function = sharpsl_rc_timer_callback;
++	sharpsl_rc->rctimer.data = (unsigned long) sharpsl_rc;
++
++	input_dev->name = "Sharp Remote Control CE-RHX";
++	input_dev->phys = "sharpsl_rc/input0";
++	input_dev->id.bustype = BUS_HOST;
++	input_dev->id.vendor = 0x0001;
++	input_dev->id.product = 0x0001;
++	input_dev->id.version = 0x0100;
++	input_dev->cdev.dev = &pdev->dev;
++	input_dev->private = sharpsl_rc;
++
++	input_dev->evbit[0] = BIT(EV_KEY);
++
++	for (i = 0; i <= ARRAY_SIZE(remote_keys); i++)
++	  set_bit(remote_keys[i].key, input_dev->keybit);
++
++	input_register_device(sharpsl_rc->input);
++
++	pxa_gpio_mode(REMOTE_GPIO_INT | GPIO_IN);
++	ret = request_irq(REMOTE_IRQ_INT,
++					  sharpsl_rc_interrupt,
++					  IRQF_DISABLED | IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_SHARED,
++					  "sharpsl_rc",
++					  sharpsl_rc);
++	if (ret < 0) {
++		dev_dbg(&pdev->dev, "Can't get IRQ: %d!\n", i);
++		kfree(sharpsl_rc);
++		input_free_device(input_dev);
++		return ret;
++	}
++
++	return 0;
++}
++
++static int sharpsl_rc_remove(struct platform_device *pdev)
++{
++	struct sharpsl_rc *sharpsl_rc = platform_get_drvdata(pdev);
++
++	dev_dbg(&pdev->dev, "sharpsl_rc_remove\n");
++
++	free_irq(REMOTE_IRQ_INT, sharpsl_rc);
++	del_timer_sync(&sharpsl_rc->rctimer);
++	input_unregister_device(sharpsl_rc->input);
++	kfree(sharpsl_rc);
++
++	return 0;
++}
++
++static struct platform_driver sharpsl_rc_driver = {
++	.probe		= sharpsl_rc_probe,
++	.remove		= sharpsl_rc_remove,
++	.suspend	= NULL,
++	.resume		= NULL,
++	.driver		= {
++		.name	= "sharpsl-remote-control",
++	},
++};
++
++static int __devinit sharpsl_rc_init(void)
++{
++	printk("sharpsl_rc_init\n");
++	return platform_driver_register(&sharpsl_rc_driver);
++}
++
++static void __exit sharpsl_rc_exit(void)
++{
++	printk("sharpsl_rc_exit\n");
++	platform_driver_unregister(&sharpsl_rc_driver);
++}
++
++module_init(sharpsl_rc_init);
++module_exit(sharpsl_rc_exit);
++
++MODULE_AUTHOR("Justin Patrin <papercrane@reversefold.com>");
++MODULE_AUTHOR("Richard Purdie <rpurdie@rpsys.net>");
++MODULE_DESCRIPTION("SharpSL Remote Control Driver");
++MODULE_LICENSE("GPL");
+Index: linux-2.6.23/drivers/input/keyboard/spitzkbd.c
+===================================================================
+--- linux-2.6.23.orig/drivers/input/keyboard/spitzkbd.c
++++ linux-2.6.23/drivers/input/keyboard/spitzkbd.c
+@@ -19,6 +19,7 @@
+ #include <linux/jiffies.h>
+ #include <linux/module.h>
+ #include <linux/slab.h>
++#include <linux/kmod.h>
+ 
+ #include <asm/arch/spitz.h>
+ #include <asm/arch/hardware.h>
+@@ -279,13 +280,21 @@ static irqreturn_t spitzkbd_hinge_isr(in
+ static int sharpsl_hinge_state;
+ static int hinge_count;
+ 
++void spitzkbd_handle_sharpsl_rc(void *arg) {
++	request_module("sharpsl_rc");
++}
++
++DECLARE_WORK(spitzkbd_work, spitzkbd_handle_sharpsl_rc);
++
+ static void spitzkbd_hinge_timer(unsigned long data)
+ {
+ 	struct spitzkbd *spitzkbd_data = (struct spitzkbd *) data;
+ 	unsigned long state;
+ 	unsigned long flags;
++	unsigned int headphone, remote;
+ 
+ 	state = GPLR(SPITZ_GPIO_SWA) & (GPIO_bit(SPITZ_GPIO_SWA)|GPIO_bit(SPITZ_GPIO_SWB));
++	state |= (GPLR(SPITZ_GPIO_HP_IN) & GPIO_bit(SPITZ_GPIO_HP_IN));
+ 	state |= (GPLR(SPITZ_GPIO_AK_INT) & GPIO_bit(SPITZ_GPIO_AK_INT));
+ 	if (state != sharpsl_hinge_state) {
+ 		hinge_count = 0;
+@@ -299,9 +308,18 @@ static void spitzkbd_hinge_timer(unsigne
+ 
+ 		input_report_switch(spitzkbd_data->input, SW_LID, ((GPLR(SPITZ_GPIO_SWA) & GPIO_bit(SPITZ_GPIO_SWA)) != 0));
+ 		input_report_switch(spitzkbd_data->input, SW_TABLET_MODE, ((GPLR(SPITZ_GPIO_SWB) & GPIO_bit(SPITZ_GPIO_SWB)) != 0));
+-		input_report_switch(spitzkbd_data->input, SW_HEADPHONE_INSERT, ((GPLR(SPITZ_GPIO_AK_INT) & GPIO_bit(SPITZ_GPIO_AK_INT)) != 0));
++
++		headphone = ((GPLR(SPITZ_GPIO_HP_IN) & GPIO_bit(SPITZ_GPIO_HP_IN)) != 0);
++		input_report_switch(spitzkbd_data->input, SW_HEADPHONE_INSERT, headphone);
++
++		remote = headphone && ((GPLR(SPITZ_GPIO_AK_INT) & GPIO_bit(SPITZ_GPIO_AK_INT)) == 0);
++		input_report_switch(spitzkbd_data->input, SW_REMOTE_INSERT, remote);
+ 		input_sync(spitzkbd_data->input);
+ 
++		if (remote) {
++			schedule_work(&spitzkbd_work);
++		}
++
+ 		spin_unlock_irqrestore(&spitzkbd_data->lock, flags);
+ 	} else {
+ 		mod_timer(&spitzkbd_data->htimer, jiffies + msecs_to_jiffies(HINGE_SCAN_INTERVAL));
+@@ -393,6 +411,7 @@ static int __init spitzkbd_probe(struct 
+ 	set_bit(SW_LID, input_dev->swbit);
+ 	set_bit(SW_TABLET_MODE, input_dev->swbit);
+ 	set_bit(SW_HEADPHONE_INSERT, input_dev->swbit);
++	set_bit(SW_REMOTE_INSERT, input_dev->swbit);
+ 
+ 	err = input_register_device(input_dev);
+ 	if (err)
+@@ -430,9 +449,12 @@ static int __init spitzkbd_probe(struct 
+ 	request_irq(SPITZ_IRQ_GPIO_SWB, spitzkbd_hinge_isr,
+ 		    IRQF_DISABLED | IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+ 		    "Spitzkbd SWB", spitzkbd);
+-	request_irq(SPITZ_IRQ_GPIO_AK_INT, spitzkbd_hinge_isr,
++	request_irq(SPITZ_IRQ_GPIO_HP_IN, spitzkbd_hinge_isr,
+ 		    IRQF_DISABLED | IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+ 		    "Spitzkbd HP", spitzkbd);
++  	request_irq(SPITZ_IRQ_GPIO_AK_INT, spitzkbd_hinge_isr,
++ 		    IRQF_DISABLED | IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_SHARED,
++            "Spitzkbd HP Type", spitzkbd);
+ 
+ 	return 0;
+ 
+@@ -453,6 +475,7 @@ static int spitzkbd_remove(struct platfo
+ 	free_irq(SPITZ_IRQ_GPIO_ON_KEY, spitzkbd);
+ 	free_irq(SPITZ_IRQ_GPIO_SWA, spitzkbd);
+ 	free_irq(SPITZ_IRQ_GPIO_SWB, spitzkbd);
++	free_irq(SPITZ_IRQ_GPIO_HP_IN, spitzkbd);
+ 	free_irq(SPITZ_IRQ_GPIO_AK_INT, spitzkbd);
+ 
+ 	del_timer_sync(&spitzkbd->htimer);
+Index: linux-2.6.23/arch/arm/mach-pxa/sharpsl.h
+===================================================================
+--- linux-2.6.23.orig/arch/arm/mach-pxa/sharpsl.h
++++ linux-2.6.23/arch/arm/mach-pxa/sharpsl.h
+@@ -50,15 +50,10 @@ void spitz_wait_hsync(void);
+ 
+ #define READ_GPIO_BIT(x)    (GPLR(x) & GPIO_bit(x))
+ 
+-/* MAX1111 Channel Definitions */
+-#define MAX1111_BATT_VOLT   4u
+-#define MAX1111_BATT_TEMP   2u
+-#define MAX1111_ACIN_VOLT   6u
+-
+ extern struct battery_thresh spitz_battery_levels_acin[];
+ extern struct battery_thresh spitz_battery_levels_noac[];
+ void sharpsl_pm_pxa_init(void);
+ void sharpsl_pm_pxa_remove(void);
+-int sharpsl_pm_pxa_read_max1111(int channel);
++
+ 
+ 
+Index: linux-2.6.23/arch/arm/mach-pxa/sharpsl_pm.c
+===================================================================
+--- linux-2.6.23.orig/arch/arm/mach-pxa/sharpsl_pm.c
++++ linux-2.6.23/arch/arm/mach-pxa/sharpsl_pm.c
+@@ -135,6 +135,8 @@ int sharpsl_pm_pxa_read_max1111(int chan
+ 			| MAXCTRL_SGL | MAXCTRL_UNI | MAXCTRL_STR);
+ }
+ 
++EXPORT_SYMBOL(sharpsl_pm_pxa_read_max1111);
++
+ void sharpsl_pm_pxa_init(void)
+ {
+ 	pxa_gpio_mode(sharpsl_pm.machinfo->gpio_acin | GPIO_IN);
+Index: linux-2.6.23/include/asm-arm/hardware/sharpsl_pm.h
+===================================================================
+--- linux-2.6.23.orig/include/asm-arm/hardware/sharpsl_pm.h
++++ linux-2.6.23/include/asm-arm/hardware/sharpsl_pm.h
+@@ -104,3 +104,10 @@ irqreturn_t sharpsl_ac_isr(int irq, void
+ irqreturn_t sharpsl_chrg_full_isr(int irq, void *dev_id);
+ irqreturn_t sharpsl_fatal_isr(int irq, void *dev_id);
+ 
++/* MAX1111 Channel Definitions */
++#define MAX1111_REMCOM      0u
++#define MAX1111_BATT_VOLT   4u
++#define MAX1111_BATT_TEMP   2u
++#define MAX1111_ACIN_VOLT   6u
++
++int sharpsl_pm_pxa_read_max1111(int channel);
+Index: linux-2.6.23/include/linux/input.h
+===================================================================
+--- linux-2.6.23.orig/include/linux/input.h
++++ linux-2.6.23/include/linux/input.h
+@@ -621,6 +621,7 @@ struct input_absinfo {
+ #define SW_TABLET_MODE		0x01  /* set = tablet mode */
+ #define SW_HEADPHONE_INSERT	0x02  /* set = inserted */
+ #define SW_RADIO		0x03  /* set = radio enabled */
++#define SW_REMOTE_INSERT	0x04  /* set = remote */
+ #define SW_MAX			0x0f
+ 
+ /*
+Index: linux-2.6.23/arch/arm/mach-pxa/spitz_pm.c
+===================================================================
+--- linux-2.6.23.orig/arch/arm/mach-pxa/spitz_pm.c
++++ linux-2.6.23/arch/arm/mach-pxa/spitz_pm.c
+@@ -162,6 +162,13 @@ static int spitz_should_wakeup(unsigned 
+ 	if (resume_on_alarm && (PEDR & PWER_RTC))
+ 		is_resume |= PWER_RTC;
+ 
++	printk("wakeup: PEDR: %x, PKSR: %x, HP_IN: %x, AK_INT: %x\n", PEDR, PKSR, GPIO_bit(SPITZ_GPIO_HP_IN), GPIO_bit(SPITZ_GPIO_AK_INT));
++
++	//remote/headphone interrupt, wakeup
++	if (PEDR == 0 && (PKSR & 0xc0d01) != 0) {
++		is_resume |= PWER_RTC;
++	}
++
+ 	dev_dbg(sharpsl_pm.dev, "is_resume: %x\n",is_resume);
+ 	return is_resume;
+ }
============================================================
--- packages/linux/linux-rp-2.6.23/wm8750-treble.patch	075d3018a7b6514bfd21550eb2cf93372b02ac02
+++ packages/linux/linux-rp-2.6.23/wm8750-treble.patch	075d3018a7b6514bfd21550eb2cf93372b02ac02
@@ -0,0 +1,11 @@
+--- linux-2.6.23/sound/soc/codecs/wm8750.c	2007-10-09 22:31:38.000000000 +0200
++++ linux-2.6.23/sound/soc/codecs/wm8750.c	2007-11-02 16:47:35.000000000 +0100
+@@ -189,7 +189,7 @@
+ SOC_ENUM("Bass Filter", wm8750_enum[1]),
+ SOC_SINGLE("Bass Volume", WM8750_BASS, 0, 15, 1),
+ 
+-SOC_SINGLE("Treble Volume", WM8750_TREBLE, 0, 15, 0),
++SOC_SINGLE("Treble Volume", WM8750_TREBLE, 0, 15, 1),
+ SOC_ENUM("Treble Cut-off", wm8750_enum[2]),
+ 
+ SOC_SINGLE("3D Switch", WM8750_3D, 0, 1, 0),
============================================================
--- packages/linux/linux-rp-2.6.24/mtd-module.patch	3336d389463dfeab12804b8b425c9451ac9ba8ea
+++ packages/linux/linux-rp-2.6.24/mtd-module.patch	3336d389463dfeab12804b8b425c9451ac9ba8ea
@@ -0,0 +1,13 @@
+Index: linux-2.6.23/drivers/mtd/maps/Kconfig
+===================================================================
+--- linux-2.6.23/drivers/mtd/maps/Kconfig
++++ linux-2.6.23/drivers/mtd/maps/Kconfig
+@@ -600,7 +600,7 @@
+ 	default "4"
+ 
+ config MTD_SHARP_SL
+-	bool "ROM mapped on Sharp SL Series"
++	tristate "ROM mapped on Sharp SL Series"
+ 	depends on ARCH_PXA
+ 	help
+ 	  This enables access to the flash chip on the Sharp SL Series of PDAs.
============================================================
--- packages/linux/linux-rp-2.6.24/sharpsl-rc-r1.patch	73fadc16c16d9a7a8e42c53e79e6eba467cdf59b
+++ packages/linux/linux-rp-2.6.24/sharpsl-rc-r1.patch	73fadc16c16d9a7a8e42c53e79e6eba467cdf59b
@@ -0,0 +1,519 @@
+Index: linux-2.6.24/arch/arm/mach-pxa/spitz.c
+===================================================================
+--- linux-2.6.24.orig/arch/arm/mach-pxa/spitz.c	2008-01-27 02:10:17.000000000 +0000
++++ linux-2.6.24/arch/arm/mach-pxa/spitz.c	2008-01-27 02:10:52.000000000 +0000
+@@ -259,6 +259,13 @@
+ 	.id		= -1,
+ };
+ 
++/*
++ * Spitz Remote Control Device
++ */
++static struct platform_device sharpsl_rc_device = {
++	.name		= "sharpsl-remote-control",
++	.id		= -1,
++};
+ 
+ /*
+  * Spitz LEDs
+@@ -548,6 +555,7 @@
+ 	&spitzscoop_device,
+ 	&spitzssp_device,
+ 	&spitzkbd_device,
++	&sharpsl_rc_device,
+ 	&spitzts_device,
+ 	&spitzbl_device,
+ 	&spitzled_device,
+Index: linux-2.6.24/drivers/input/keyboard/Kconfig
+===================================================================
+--- linux-2.6.24.orig/drivers/input/keyboard/Kconfig	2008-01-27 02:10:20.000000000 +0000
++++ linux-2.6.24/drivers/input/keyboard/Kconfig	2008-01-27 02:10:52.000000000 +0000
+@@ -154,6 +154,17 @@
+ 	  To compile this driver as a module, choose M here: the
+ 	  module will be called spitzkbd.
+ 
++config SHARPSL_RC
++	tristate "Sharp SL-Cxx00 Remote Control"
++	depends on PXA_SHARPSL
++	default y
++	help
++	  Say Y here to enable the remote on the Sharp Zaurus SL-Cxx00,
++	  SL-C1000, SL-C3000 and Sl-C3100 series of PDAs.
++
++	  To compile this driver as a module, choose M here: the
++	  module will be called sharpsl_rc.
++
+ config KEYBOARD_AMIGA
+ 	tristate "Amiga keyboard"
+ 	depends on AMIGA
+Index: linux-2.6.24/drivers/input/keyboard/Makefile
+===================================================================
+--- linux-2.6.24.orig/drivers/input/keyboard/Makefile	2008-01-27 02:10:20.000000000 +0000
++++ linux-2.6.24/drivers/input/keyboard/Makefile	2008-01-27 02:11:43.000000000 +0000
+@@ -15,6 +15,7 @@
+ obj-$(CONFIG_KEYBOARD_STOWAWAY)		+= stowaway.o
+ obj-$(CONFIG_KEYBOARD_CORGI)		+= corgikbd.o
+ obj-$(CONFIG_KEYBOARD_SPITZ)		+= spitzkbd.o
++obj-$(CONFIG_SHARPSL_RC)		+= sharpsl_rc.o
+ obj-$(CONFIG_KEYBOARD_ASIC3)		+= asic3_keys.o
+ obj-$(CONFIG_KEYBOARD_HIL)		+= hil_kbd.o
+ obj-$(CONFIG_KEYBOARD_HIL_OLD)		+= hilkbd.o
+Index: linux-2.6.24/drivers/input/keyboard/sharpsl_rc.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ linux-2.6.24/drivers/input/keyboard/sharpsl_rc.c	2008-01-27 02:10:52.000000000 +0000
+@@ -0,0 +1,291 @@
++/*
++ *  Keyboard driver for Sharp Clamshell Models (SL-Cxx00)
++ *
++ *  Copyright (c) 2004-2005 Richard Purdie
++ *
++ *  Based on corgikbd.c and Sharp's RC driver
++ *
++ *  This program is free software; you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License version 2 as
++ *  published by the Free Software Foundation.
++ *
++ */
++
++#define DEBUG 1
++#include <linux/delay.h>
++#include <linux/platform_device.h>
++#include <linux/init.h>
++#include <linux/input.h>
++#include <linux/interrupt.h>
++#include <linux/jiffies.h>
++#include <linux/module.h>
++#include <linux/slab.h>
++
++#ifdef CONFIG_MACH_SPITZ
++#include <asm/arch/spitz.h>
++#endif
++#ifdef CONFIG_MACH_CORGI
++#include <asm/arch/corgi.h>
++#endif
++
++#include <asm/arch/hardware.h>
++#include <asm/arch/pxa-regs.h>
++#include <asm/hardware/scoop.h>
++#include <asm/arch/sharpsl.h>
++#include <asm/hardware/sharpsl_pm.h>
++
++#define DPRINTK(fmt, args...) dev_dbg(data->dev, fmt "\n", ##args)
++
++struct remote_control_key {
++	unsigned char min;
++	unsigned char max;
++	unsigned char key;
++};
++
++#ifdef CONFIG_MACH_SPITZ
++#define REMOTE_AKIN_PULLUP SPITZ_SCP2_AKIN_PULLUP
++#define REMOTE_SCOOP_DEVICE spitzscoop2_device
++#define REMOTE_GPIO_INT SPITZ_GPIO_AK_INT
++#define REMOTE_IRQ_INT SPITZ_IRQ_GPIO_AK_INT
++static struct remote_control_key remote_keys[] = {
++	{ 25, 35, KEY_STOPCD},
++	{ 55, 65, KEY_PLAYPAUSE},
++	{ 85, 95, KEY_NEXTSONG},
++	{ 115, 125, KEY_VOLUMEUP},
++	{ 145, 155, KEY_PREVIOUSSONG},
++	{ 180, 190, KEY_MUTE},
++	{ 215, 225, KEY_VOLUMEDOWN},
++};
++#endif
++#ifdef CONFIG_MACH_CORGI
++#define REMOTE_AKIN_PULLUP CORGI_SCP_AKIN_PULLUP
++#define REMOTE_SCOOP_DEVICE corgiscoop_device
++#define REMOTE_GPIO_INT CORGI_GPIO_AK_INT
++#define REMOTE_IRQ_INT CORGI_IRQ_GPIO_AK_INT
++static struct remote_control_key remote_keys[] = {
++    //These need to be fixed for the CE-RH1's values
++	{ 25, 35, KEY_STOPCD},
++	{ 55, 65, KEY_PLAYPAUSE},
++	{ 85, 95, KEY_NEXTSONG},
++	{ 115, 125, KEY_VOLUMEUP},
++	{ 145, 155, KEY_PREVIOUSSONG},
++	{ 180, 190, KEY_MUTE},
++	{ 215, 225, KEY_VOLUMEDOWN},
++};
++#endif
++
++#define RELEASE_HI      230
++#define MAX_EARPHONE    6
++#define RC_POLL_MS      10
++#define RC_FINISH_MS    500
++#define WAIT_STATE      3
++#define NOISE_THRESHOLD 100
++
++struct sharpsl_rc {
++	struct input_dev *input;
++	struct device *dev;
++
++	spinlock_t lock;
++	struct timer_list rctimer;
++	struct timer_list rctimer_finish;
++
++	unsigned int handling_press;
++	unsigned int noise;
++	unsigned int state;
++	unsigned int last_key;
++};
++
++static int get_remocon_raw(void)
++{
++	int i, val;
++
++	val = sharpsl_pm_pxa_read_max1111(MAX1111_REMCOM);
++	for (i = 0; i < ARRAY_SIZE(remote_keys); ++i) {
++		if (val >= remote_keys[i].min
++			&& val <= remote_keys[i].max) {
++			printk("get_remocon_raw: VAL=%i, KEY=%i\n", val, remote_keys[i].key);
++			return remote_keys[i].key;
++		}
++	}
++	return 0;
++}
++
++static irqreturn_t sharpsl_rc_interrupt(int irq, void *dev_id, struct pt_regs *regs)
++{
++	struct sharpsl_rc *data = dev_id;
++	DPRINTK("sharpsl_rc_interrupt %d\n", irq);
++	if (!data->handling_press) {
++		DPRINTK("handling interrupt");
++		data->handling_press = 1;
++		data->noise = 0;
++		data->state = 0;
++		data->last_key = 0;
++
++		reset_scoop_gpio(&REMOTE_SCOOP_DEVICE.dev, REMOTE_AKIN_PULLUP);
++
++		mod_timer(&data->rctimer, jiffies + msecs_to_jiffies(RC_POLL_MS));
++	}
++	return IRQ_HANDLED;
++}
++
++static void sharpsl_rc_timer_callback(unsigned long dataPtr)
++{
++	struct sharpsl_rc *data = (struct sharpsl_rc *) dataPtr;
++	int timer = 1;
++	int key = get_remocon_raw();
++	DPRINTK("timer callback, key: %d", key);
++
++	//wait for value to stabilize
++	if (data->state < WAIT_STATE) {
++		if (data->last_key != key) {
++			++data->noise;
++			if (data->noise > NOISE_THRESHOLD) {
++				DPRINTK("too much noise, bailing");
++				timer = 0;
++			}
++			data->state = 0;
++		} else {
++			++data->state;
++		}
++		data->last_key = key;
++
++	//stable value, send event
++	} else if (data->state == WAIT_STATE) {
++		data->noise = 0;
++		//non-key returned, skip the rest of the states and bail now
++		if (data->last_key == 0) {
++			DPRINTK("non-key detected %d, noise: %d", data->last_key, data->noise);
++			timer = 0;
++		//send button press
++		} else {
++			DPRINTK("key press detected %d, noise %d", data->last_key, data->noise);
++			input_report_key(data->input, data->last_key, 1);
++		}
++		++data->state;
++
++	//wait until key is released
++	} else if (data->state < WAIT_STATE * 2) {
++		if (key == data->last_key
++			&& data->noise < NOISE_THRESHOLD) {
++			data->state = WAIT_STATE + 1;
++			++data->noise;
++		} else {
++			++data->state;
++		}
++	//key is released, send event
++	} else {
++		//send button release
++		DPRINTK("release key %d", data->last_key);
++		input_report_key(data->input, data->last_key, 0);
++		timer = 0;
++	}
++	if (timer) {
++		mod_timer(&data->rctimer, jiffies + msecs_to_jiffies(RC_POLL_MS));
++	} else {
++		set_scoop_gpio(&REMOTE_SCOOP_DEVICE.dev, REMOTE_AKIN_PULLUP);
++		data->handling_press = 0;
++	}
++}
++
++static int __init sharpsl_rc_probe(struct platform_device *pdev)
++{
++	struct sharpsl_rc *sharpsl_rc;
++	struct input_dev *input_dev;
++	int i, ret;
++
++	dev_dbg(&pdev->dev, "sharpsl_rc_probe\n");
++
++	sharpsl_rc = kzalloc(sizeof(struct sharpsl_rc), GFP_KERNEL);
++	input_dev = input_allocate_device();
++	if (!sharpsl_rc || !input_dev) {
++		kfree(sharpsl_rc);
++		input_free_device(input_dev);
++		return -ENOMEM;
++	}
++
++	platform_set_drvdata(pdev, sharpsl_rc);
++
++	sharpsl_rc->dev = &pdev->dev;
++	sharpsl_rc->input = input_dev;
++	spin_lock_init(&sharpsl_rc->lock);
++
++	/* Init Remote Control Timer */
++	init_timer(&sharpsl_rc->rctimer);
++	sharpsl_rc->rctimer.function = sharpsl_rc_timer_callback;
++	sharpsl_rc->rctimer.data = (unsigned long) sharpsl_rc;
++
++	input_dev->name = "Sharp Remote Control CE-RHX";
++	input_dev->phys = "sharpsl_rc/input0";
++	input_dev->id.bustype = BUS_HOST;
++	input_dev->id.vendor = 0x0001;
++	input_dev->id.product = 0x0001;
++	input_dev->id.version = 0x0100;
++	input_dev->cdev.dev = &pdev->dev;
++	input_dev->private = sharpsl_rc;
++
++	input_dev->evbit[0] = BIT(EV_KEY);
++
++	for (i = 0; i <= ARRAY_SIZE(remote_keys); i++)
++	  set_bit(remote_keys[i].key, input_dev->keybit);
++
++	input_register_device(sharpsl_rc->input);
++
++	pxa_gpio_mode(REMOTE_GPIO_INT | GPIO_IN);
++	ret = request_irq(REMOTE_IRQ_INT,
++					  sharpsl_rc_interrupt,
++					  IRQF_DISABLED | IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_SHARED,
++					  "sharpsl_rc",
++					  sharpsl_rc);
++	if (ret < 0) {
++		dev_dbg(&pdev->dev, "Can't get IRQ: %d!\n", i);
++		kfree(sharpsl_rc);
++		input_free_device(input_dev);
++		return ret;
++	}
++
++	return 0;
++}
++
++static int sharpsl_rc_remove(struct platform_device *pdev)
++{
++	struct sharpsl_rc *sharpsl_rc = platform_get_drvdata(pdev);
++
++	dev_dbg(&pdev->dev, "sharpsl_rc_remove\n");
++
++	free_irq(REMOTE_IRQ_INT, sharpsl_rc);
++	del_timer_sync(&sharpsl_rc->rctimer);
++	input_unregister_device(sharpsl_rc->input);
++	kfree(sharpsl_rc);
++
++	return 0;
++}
++
++static struct platform_driver sharpsl_rc_driver = {
++	.probe		= sharpsl_rc_probe,
++	.remove		= sharpsl_rc_remove,
++	.suspend	= NULL,
++	.resume		= NULL,
++	.driver		= {
++		.name	= "sharpsl-remote-control",
++	},
++};
++
++static int __devinit sharpsl_rc_init(void)
++{
++	printk("sharpsl_rc_init\n");
++	return platform_driver_register(&sharpsl_rc_driver);
++}
++
++static void __exit sharpsl_rc_exit(void)
++{
++	printk("sharpsl_rc_exit\n");
++	platform_driver_unregister(&sharpsl_rc_driver);
++}
++
++module_init(sharpsl_rc_init);
++module_exit(sharpsl_rc_exit);
++
++MODULE_AUTHOR("Justin Patrin <papercrane@reversefold.com>");
++MODULE_AUTHOR("Richard Purdie <rpurdie@rpsys.net>");
++MODULE_DESCRIPTION("SharpSL Remote Control Driver");
++MODULE_LICENSE("GPL");
+Index: linux-2.6.24/drivers/input/keyboard/spitzkbd.c
+===================================================================
+--- linux-2.6.24.orig/drivers/input/keyboard/spitzkbd.c	2008-01-24 22:58:37.000000000 +0000
++++ linux-2.6.24/drivers/input/keyboard/spitzkbd.c	2008-01-27 02:10:52.000000000 +0000
+@@ -19,6 +19,7 @@
+ #include <linux/jiffies.h>
+ #include <linux/module.h>
+ #include <linux/slab.h>
++#include <linux/kmod.h>
+ 
+ #include <asm/arch/spitz.h>
+ #include <asm/arch/hardware.h>
+@@ -279,13 +280,21 @@
+ static int sharpsl_hinge_state;
+ static int hinge_count;
+ 
++void spitzkbd_handle_sharpsl_rc(void *arg) {
++	request_module("sharpsl_rc");
++}
++
++DECLARE_WORK(spitzkbd_work, spitzkbd_handle_sharpsl_rc);
++
+ static void spitzkbd_hinge_timer(unsigned long data)
+ {
+ 	struct spitzkbd *spitzkbd_data = (struct spitzkbd *) data;
+ 	unsigned long state;
+ 	unsigned long flags;
++	unsigned int headphone, remote;
+ 
+ 	state = GPLR(SPITZ_GPIO_SWA) & (GPIO_bit(SPITZ_GPIO_SWA)|GPIO_bit(SPITZ_GPIO_SWB));
++	state |= (GPLR(SPITZ_GPIO_HP_IN) & GPIO_bit(SPITZ_GPIO_HP_IN));
+ 	state |= (GPLR(SPITZ_GPIO_AK_INT) & GPIO_bit(SPITZ_GPIO_AK_INT));
+ 	if (state != sharpsl_hinge_state) {
+ 		hinge_count = 0;
+@@ -299,9 +308,18 @@
+ 
+ 		input_report_switch(spitzkbd_data->input, SW_LID, ((GPLR(SPITZ_GPIO_SWA) & GPIO_bit(SPITZ_GPIO_SWA)) != 0));
+ 		input_report_switch(spitzkbd_data->input, SW_TABLET_MODE, ((GPLR(SPITZ_GPIO_SWB) & GPIO_bit(SPITZ_GPIO_SWB)) != 0));
+-		input_report_switch(spitzkbd_data->input, SW_HEADPHONE_INSERT, ((GPLR(SPITZ_GPIO_AK_INT) & GPIO_bit(SPITZ_GPIO_AK_INT)) != 0));
++
++		headphone = ((GPLR(SPITZ_GPIO_HP_IN) & GPIO_bit(SPITZ_GPIO_HP_IN)) != 0);
++		input_report_switch(spitzkbd_data->input, SW_HEADPHONE_INSERT, headphone);
++
++		remote = headphone && ((GPLR(SPITZ_GPIO_AK_INT) & GPIO_bit(SPITZ_GPIO_AK_INT)) == 0);
++		input_report_switch(spitzkbd_data->input, SW_REMOTE_INSERT, remote);
+ 		input_sync(spitzkbd_data->input);
+ 
++		if (remote) {
++			schedule_work(&spitzkbd_work);
++		}
++
+ 		spin_unlock_irqrestore(&spitzkbd_data->lock, flags);
+ 	} else {
+ 		mod_timer(&spitzkbd_data->htimer, jiffies + msecs_to_jiffies(HINGE_SCAN_INTERVAL));
+@@ -395,6 +413,7 @@
+ 	set_bit(SW_LID, input_dev->swbit);
+ 	set_bit(SW_TABLET_MODE, input_dev->swbit);
+ 	set_bit(SW_HEADPHONE_INSERT, input_dev->swbit);
++	set_bit(SW_REMOTE_INSERT, input_dev->swbit);
+ 
+ 	err = input_register_device(input_dev);
+ 	if (err)
+@@ -432,9 +451,12 @@
+ 	request_irq(SPITZ_IRQ_GPIO_SWB, spitzkbd_hinge_isr,
+ 		    IRQF_DISABLED | IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+ 		    "Spitzkbd SWB", spitzkbd);
+-	request_irq(SPITZ_IRQ_GPIO_AK_INT, spitzkbd_hinge_isr,
++	request_irq(SPITZ_IRQ_GPIO_HP_IN, spitzkbd_hinge_isr,
+ 		    IRQF_DISABLED | IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+ 		    "Spitzkbd HP", spitzkbd);
++  	request_irq(SPITZ_IRQ_GPIO_AK_INT, spitzkbd_hinge_isr,
++ 		    IRQF_DISABLED | IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_SHARED,
++            "Spitzkbd HP Type", spitzkbd);
+ 
+ 	return 0;
+ 
+@@ -455,6 +477,7 @@
+ 	free_irq(SPITZ_IRQ_GPIO_ON_KEY, spitzkbd);
+ 	free_irq(SPITZ_IRQ_GPIO_SWA, spitzkbd);
+ 	free_irq(SPITZ_IRQ_GPIO_SWB, spitzkbd);
++	free_irq(SPITZ_IRQ_GPIO_HP_IN, spitzkbd);
+ 	free_irq(SPITZ_IRQ_GPIO_AK_INT, spitzkbd);
+ 
+ 	del_timer_sync(&spitzkbd->htimer);
+Index: linux-2.6.24/arch/arm/mach-pxa/sharpsl.h
+===================================================================
+--- linux-2.6.24.orig/arch/arm/mach-pxa/sharpsl.h	2008-01-27 02:10:15.000000000 +0000
++++ linux-2.6.24/arch/arm/mach-pxa/sharpsl.h	2008-01-27 02:10:52.000000000 +0000
+@@ -37,15 +37,10 @@
+  */
+ #define READ_GPIO_BIT(x)    (GPLR(x) & GPIO_bit(x))
+ 
+-/* MAX1111 Channel Definitions */
+-#define MAX1111_BATT_VOLT   4u
+-#define MAX1111_BATT_TEMP   2u
+-#define MAX1111_ACIN_VOLT   6u
+-
+ extern struct battery_thresh spitz_battery_levels_acin[];
+ extern struct battery_thresh spitz_battery_levels_noac[];
+ void sharpsl_pm_pxa_init(void);
+ void sharpsl_pm_pxa_remove(void);
+-int sharpsl_pm_pxa_read_max1111(int channel);
++
+ 
+ 
+Index: linux-2.6.24/arch/arm/mach-pxa/sharpsl_pm.c
+===================================================================
+--- linux-2.6.24.orig/arch/arm/mach-pxa/sharpsl_pm.c	2008-01-24 22:58:37.000000000 +0000
++++ linux-2.6.24/arch/arm/mach-pxa/sharpsl_pm.c	2008-01-27 02:10:52.000000000 +0000
+@@ -135,6 +135,8 @@
+ 			| MAXCTRL_SGL | MAXCTRL_UNI | MAXCTRL_STR);
+ }
+ 
++EXPORT_SYMBOL(sharpsl_pm_pxa_read_max1111);
++
+ void sharpsl_pm_pxa_init(void)
+ {
+ 	pxa_gpio_mode(sharpsl_pm.machinfo->gpio_acin | GPIO_IN);
+Index: linux-2.6.24/include/asm-arm/hardware/sharpsl_pm.h
+===================================================================
+--- linux-2.6.24.orig/include/asm-arm/hardware/sharpsl_pm.h	2008-01-24 22:58:37.000000000 +0000
++++ linux-2.6.24/include/asm-arm/hardware/sharpsl_pm.h	2008-01-27 02:10:52.000000000 +0000
+@@ -104,3 +104,10 @@
+ irqreturn_t sharpsl_chrg_full_isr(int irq, void *dev_id);
+ irqreturn_t sharpsl_fatal_isr(int irq, void *dev_id);
+ 
++/* MAX1111 Channel Definitions */
++#define MAX1111_REMCOM      0u
++#define MAX1111_BATT_VOLT   4u
++#define MAX1111_BATT_TEMP   2u
++#define MAX1111_ACIN_VOLT   6u
++
++int sharpsl_pm_pxa_read_max1111(int channel);
+Index: linux-2.6.24/include/linux/input.h
+===================================================================
+--- linux-2.6.24.orig/include/linux/input.h	2008-01-24 22:58:37.000000000 +0000
++++ linux-2.6.24/include/linux/input.h	2008-01-27 02:10:52.000000000 +0000
+@@ -636,6 +636,7 @@
+ #define SW_TABLET_MODE		0x01  /* set = tablet mode */
+ #define SW_HEADPHONE_INSERT	0x02  /* set = inserted */
+ #define SW_RADIO		0x03  /* set = radio enabled */
++#define SW_REMOTE_INSERT	0x04  /* set = remote */
+ #define SW_MAX			0x0f
+ #define SW_CNT			(SW_MAX+1)
+ 
+Index: linux-2.6.24/arch/arm/mach-pxa/spitz_pm.c
+===================================================================
+--- linux-2.6.24.orig/arch/arm/mach-pxa/spitz_pm.c	2008-01-24 22:58:37.000000000 +0000
++++ linux-2.6.24/arch/arm/mach-pxa/spitz_pm.c	2008-01-27 02:10:52.000000000 +0000
+@@ -162,6 +162,13 @@
+ 	if (resume_on_alarm && (PEDR & PWER_RTC))
+ 		is_resume |= PWER_RTC;
+ 
++	printk("wakeup: PEDR: %x, PKSR: %x, HP_IN: %x, AK_INT: %x\n", PEDR, PKSR, GPIO_bit(SPITZ_GPIO_HP_IN), GPIO_bit(SPITZ_GPIO_AK_INT));
++
++	//remote/headphone interrupt, wakeup
++	if (PEDR == 0 && (PKSR & 0xc0d01) != 0) {
++		is_resume |= PWER_RTC;
++	}
++
+ 	dev_dbg(sharpsl_pm.dev, "is_resume: %x\n",is_resume);
+ 	return is_resume;
+ }
============================================================
--- packages/linux/linux-rp-2.6.24/wm8750-treble.patch	075d3018a7b6514bfd21550eb2cf93372b02ac02
+++ packages/linux/linux-rp-2.6.24/wm8750-treble.patch	075d3018a7b6514bfd21550eb2cf93372b02ac02
@@ -0,0 +1,11 @@
+--- linux-2.6.23/sound/soc/codecs/wm8750.c	2007-10-09 22:31:38.000000000 +0200
++++ linux-2.6.23/sound/soc/codecs/wm8750.c	2007-11-02 16:47:35.000000000 +0100
+@@ -189,7 +189,7 @@
+ SOC_ENUM("Bass Filter", wm8750_enum[1]),
+ SOC_SINGLE("Bass Volume", WM8750_BASS, 0, 15, 1),
+ 
+-SOC_SINGLE("Treble Volume", WM8750_TREBLE, 0, 15, 0),
++SOC_SINGLE("Treble Volume", WM8750_TREBLE, 0, 15, 1),
+ SOC_ENUM("Treble Cut-off", wm8750_enum[2]),
+ 
+ SOC_SINGLE("3D Switch", WM8750_3D, 0, 1, 0),
============================================================
--- packages/linux/linux-rp-2.6.23/defconfig-spitz	b7ae462871d969fb588349aa16c4991646c4ff65
+++ packages/linux/linux-rp-2.6.23/defconfig-spitz	b071f674a2ac8b9b060cc5de413b281a6f19e5c6
@@ -579,7 +579,7 @@ CONFIG_MTD_COMPLEX_MAPPINGS=y
 #
 CONFIG_MTD_COMPLEX_MAPPINGS=y
 # CONFIG_MTD_PHYSMAP is not set
-CONFIG_MTD_SHARP_SL=y
+CONFIG_MTD_SHARP_SL=m
 # CONFIG_MTD_PLATRAM is not set
 
 #
@@ -821,6 +821,7 @@ CONFIG_KEYBOARD_SPITZ=y
 # CONFIG_KEYBOARD_STOWAWAY is not set
 # CONFIG_KEYBOARD_CORGI is not set
 CONFIG_KEYBOARD_SPITZ=y
+CONFIG_SHARPSL_RC=m
 # CONFIG_KEYBOARD_PXA27x is not set
 # CONFIG_KEYBOARD_GPIO is not set
 # CONFIG_INPUT_MOUSE is not set
============================================================
--- packages/linux/linux-rp-2.6.24/defconfig-spitz	f65cb0f276b3dc6b756efc00689ee05903f1c6d1
+++ packages/linux/linux-rp-2.6.24/defconfig-spitz	1c089b38d34a93c68659ef90bec902bbbcf436ae
@@ -589,7 +589,7 @@ CONFIG_MTD_COMPLEX_MAPPINGS=y
 #
 CONFIG_MTD_COMPLEX_MAPPINGS=y
 # CONFIG_MTD_PHYSMAP is not set
-CONFIG_MTD_SHARP_SL=y
+CONFIG_MTD_SHARP_SL=m
 # CONFIG_MTD_PLATRAM is not set
 
 #
@@ -839,6 +839,7 @@ CONFIG_KEYBOARD_SPITZ=y
 # CONFIG_KEYBOARD_STOWAWAY is not set
 # CONFIG_KEYBOARD_CORGI is not set
 CONFIG_KEYBOARD_SPITZ=y
+CONFIG_SHARPSL_RC=m
 # CONFIG_KEYBOARD_PXA27x is not set
 # CONFIG_KEYBOARD_GPIO is not set
 # CONFIG_INPUT_MOUSE is not set
============================================================
--- packages/linux/linux-rp_2.6.23.bb	859f03b96da909344eeea42ccccd31eb657a0f26
+++ packages/linux/linux-rp_2.6.23.bb	6586eaa5d600cdf73b9096535eb1f1f046f4d49d
@@ -44,6 +44,9 @@ SRC_URI = "${KERNELORG_MIRROR}pub/linux/
            ${RPSRC}/poodle_lcd_hack-r0.patch;patch=1 \
            ${RPSRC}/poodle_asoc_fix-r1.patch;patch=1 \
            file://squashfs3.0-2.6.15.patch;patch=1;status=external \
+           file://mtd-module.patch;patch=1;status=external \
+           file://wm8750-treble.patch;patch=1;status=external \
+           file://sharpsl-rc-r1.patch;patch=1 \
            ${RPSRC}/logo_oh-r1.patch.bz2;patch=1;status=unmergable \
            ${RPSRC}/pxa-linking-bug.patch;patch=1;status=unmergable \
            file://hostap-monitor-mode.patch;patch=1;status=unmergable \
============================================================
--- packages/linux/linux-rp_2.6.24.bb	26786b548ae1b68bc05de430837610e681a529e8
+++ packages/linux/linux-rp_2.6.24.bb	a259a9e0a8d5d3aaf8f78bf8bc90a1c6a66bc303
@@ -42,6 +42,8 @@ SRC_URI = "${KERNELORG_MIRROR}pub/linux/
            ${RPSRC}/poodle_lcd_hack-r0.patch;patch=1 \
            ${RPSRC}/poodle_asoc_fix-r1.patch;patch=1 \
            file://squashfs3.3.patch;patch=1;status=external \
+           file://mtd-module.patch;patch=1;status=external \
+           file://wm8750-treble.patch;patch=1;status=external \
            ${RPSRC}/logo_oh-r1.patch.bz2;patch=1;status=unmergable \
            ${RPSRC}/pxa-linking-bug.patch;patch=1;status=unmergable \
            file://hostap-monitor-mode.patch;patch=1;status=unmergable \
@@ -54,6 +56,7 @@ SRC_URI = "${KERNELORG_MIRROR}pub/linux/
            file://connectplus-remove-ide-HACK.patch;patch=1;status=hack \
            file://connectplus-prevent-oops-HACK.patch;patch=1;status=hack \
            file://htcuni.patch;patch=1 \
+           file://sharpsl-rc-r1.patch;patch=1 \
            file://binutils-buildid-arm.patch;patch=1 \
            file://versatile-armv6.patch;patch=1 \
            file://defconfig-c7x0 \

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



