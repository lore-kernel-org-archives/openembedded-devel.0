Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RWZTv-0001xM-Id
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 21:13:16 +0100
Received: by wgbds11 with SMTP id ds11so1551555wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 12:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type;
	bh=aNvE8D6bZ9g+g7YOgl5BjvuHnsfm9J2f3bZVnBmM+N0=;
	b=KyrRxWiUb4s7Buesic//HBt4Di0NH1uqPfbFnRioQcYiPPtrVaq/YZtPGyer5evBZu
	pgeufSQmuuWMVvlZaVGszAtL+SEx2m/Pu9Q6jZxWdOFo1wEVOP3+YT5Wve3s1iWOckrM
	1M3jiXqGAeQ28Lryw3giBJPTGCYCtvGPcSFSc=
Received: by 10.227.203.147 with SMTP id fi19mr9130520wbb.14.1322856391959;
	Fri, 02 Dec 2011 12:06:31 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id fk3sm11832844wbb.10.2011.12.02.12.06.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 12:06:30 -0800 (PST)
Message-ID: <4ED92FC0.2050502@googlemail.com>
Date: Fri, 02 Dec 2011 20:06:24 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4ED8307F.2060306@googlemail.com>	<201112021120.17762.GNUtoo@no-log.org>	<4ED8DBC7.6080708@googlemail.com>
	<20111202145256.GD3770@jama.jama.net>
In-Reply-To: <20111202145256.GD3770@jama.jama.net>
Subject: Re: fso-console-image problems
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
X-List-Received-Date: Fri, 02 Dec 2011 20:13:16 -0000
Content-Type: multipart/mixed; boundary="------------050500080000050204070902"

--------------050500080000050204070902
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> I'm not familiar with htcdream, but this looks like some problem with kernel fb 
> driver, you can try to boot shr-image, setup ssh access and then
> shutdown xserver (with /etc/init.d/xserver-nodm stop) to see if you get
> console login (check inittab if it's starting getty there) and also try
> other vts with chvt.
>
> If it works you can prepare console-image with right
> /etc/network/interfaces to be able to ssh in as soon as it boots and
> then debug those stripes over ssh too.
>   
Some good news at last! As it turned out, everything on that 
console-image was running (including the getty!), but it is just not 
"displayed" properly on my smartphone's screen. Here is what I did:

Booted up the full shr-htc image and when I got to the GUI, I connected 
to my phone via usb0 (no need for a terminal as the 
/etc/network/interfaces was already setup, usb0 was up and sshd was 
running). I then tried "xserver-nodm stop" - the ssh console tells me 
that the service has stopped, but then my entire smartphone screen (the 
GUI) freezes completely - *no* terminal at all!

When I run "xserver-nodm start" from the ssh terminal again - all is 
well and I could move the "X" cursor and use it as normal. I am 
attaching dmesg-full.log (fetched from /var/log/dmesg) so that you may 
diagnose what is causing this. There is a kernel oops from gpiolib, I 
think - don't know how significant that is! Please note that at the end 
of that file there is output of "ps aux" I used to see what's running.

When I boot up the console-image things are almost exactly the same - 
even though I see the black-and-white stripes screen, in the background 
everything is configured and running (getty, sshd and usb0 - all 
properly configured) - I am able to instantly log in via the ssh and 
apart from the phone's screen which only shows the stripes, in the 
background all is well! I attach additional 3 files from this console 
image:
- dmesg-console.log containing my dmesg logs as well as "ps aux" of 
everything running when I logged in via the ssh;
- frameworkd.log as well as fsousaged.log (all fetched from /var/log/) 
showing some errors - I don't know what they are and I also don't know 
whether they are significant, thus preventing my console to show up on 
the phone's screen.

There was no /var/log/messages or any other log files in /var/log when I 
looked.
[    0.000000] Linux version 2.6.32.9 (bitbake@opmbuild) (gcc version 4.5.3 20110311 (prerelease) (GCC) ) #1 PREEMPT Tue Jul 19 01:17:11 CEST 2011
[    0.000000] CPU: ARMv6-compatible processor [4117b362] revision 2 (ARMv6TEJ), cr=00c5387f
[    0.000000] CPU: VIPT aliasing data cache, VIPT aliasing instruction cache
[    0.000000] Machine: trout
[    0.000000] find the smi tag
[    0.000000] parse_tag_smi: smi size = 64
[    0.000000] find the hwid tag
[    0.000000] parse_tag_hwid: hwid = 0x0
[    0.000000] find the skuid tag
[    0.000000] parse_tag_skuid: hwid = 0x1be01
[    0.000000] Ignoring unrecognised tag 0x4d534d74
[    0.000000] find the engineer tag
[    0.000000] parse_tag_engineerid: hwid = 0xffffffff
[    0.000000] AKM Data size = 1018 , 0x89768976, size = 4064
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] On node 0 totalpages: 28160
[    0.000000] free_area_init_node: node 0, pgdat c0424eb8, node_mem_map c046c000
[    0.000000]   Normal zone: 220 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 27940 pages, LIFO batch:7
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 27940
[    0.000000] Kernel command line: board_trout.disable_uart3=0 board_trout.usb_h2w_sw=0 board_trout.disable_sdcard=0 smisize=64  androidboot.baseband=2.22.19.26I androidboot.cid=T-MOB005 androidboot.carrier=TMUK androidboot.keycaps=qwerty androidboot.mode=normal androidboot.serialno=HT91PKV01748 androidboot.bootloader=1.33.2005 console=tty1 root=/dev/mmcblk0p1 rootdelay=8 fbcon=rotate:1 panic=30 mem=110M
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 110MB = 110MB total
[    0.000000] Memory: 106948KB available (3812K code, 458K data, 116K init, 0K highmem)
[    0.000000] SLUB: Genslabs=11, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000] NR_IRQS:250
[    0.000000] trout_init_irq()
[    0.000000] Console: colour dummy device 80x30
[    0.000000] console [tty1] enabled
[    0.000000] Calibrating delay loop... 383.38 BogoMIPS (lpj=1916928)
[    0.219299] Mount-cache hash table entries: 512
[    0.220153] CPU: Testing write buffer coherency: ok
[    0.221343] devtmpfs: initialized
[    0.224029] NET: Registered protocol family 16
[    0.224426] trout_init_gpio: cpld_usb_hw2_sw = 0
[    0.225402] trout_init() revision=128
[    5.861053] ------------[ cut here ]------------
[    5.861175] WARNING: at drivers/gpio/gpiolib.c:101 gpio_ensure_requested+0x50/0x11c()
[    5.861236] autorequest GPIO-1
[    5.861297] Modules linked in:
[    5.861389] [<c002a9b0>] (unwind_backtrace+0x0/0xe0) from [<c004dffc>] (warn_slowpath_common+0x48/0x60)
[    5.861511] [<c004dffc>] (warn_slowpath_common+0x48/0x60) from [<c004e050>] (warn_slowpath_fmt+0x28/0x38)
[    5.861633] [<c004e050>] (warn_slowpath_fmt+0x28/0x38) from [<c017c0a0>] (gpio_ensure_requested+0x50/0x11c)
[    5.861724] [<c017c0a0>] (gpio_ensure_requested+0x50/0x11c) from [<c017c220>] (gpio_direction_output+0xb4/0x15c)
[    5.861877] [<c017c220>] (gpio_direction_output+0xb4/0x15c) from [<c000d4cc>] (trout_init+0x54/0x1e8)
[    5.861999] [<c000d4cc>] (trout_init+0x54/0x1e8) from [<c000a468>] (customize_machine+0x18/0x24)
[    5.862121] [<c000a468>] (customize_machine+0x18/0x24) from [<c00254d4>] (do_one_initcall+0x30/0x1a0)
[    5.862243] [<c00254d4>] (do_one_initcall+0x30/0x1a0) from [<c00089a4>] (kernel_init+0x98/0x114)
[    5.862365] [<c00089a4>] (kernel_init+0x98/0x114) from [<c002692c>] (kernel_thread_exit+0x0/0x8)
[    5.862518] ---[ end trace 1b75b31a2719ed1c ]---
[    5.862579] acpu_clock_init()
[    5.862701] ACPU running at 384000 KHz
[    5.971588] bio: create slab <bio-0> at 0
[    5.973388] msm_i2c_probe
[    5.973724] msm_i2c_probe: clk_ctl 35d, 100000 Hz
[    5.976348] Bluetooth: Core ver 2.15
[    5.976806] NET: Registered protocol family 31
[    5.976898] Bluetooth: HCI device and connection manager initialized
[    5.976959] Bluetooth: HCI socket layer initialized
[    5.977447] Switching to clocksource gp_timer
[    5.979553] NET: Registered protocol family 2
[    5.979980] IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
[    5.980773] TCP established hash table entries: 4096 (order: 3, 32768 bytes)
[    5.981414] TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
[    5.981842] TCP: Hash tables configured (established 4096 bind 4096)
[    5.981903] TCP reno registered
[    5.982299] NET: Registered protocol family 1
[    5.982849] Unpacking initramfs...
[    5.983032] Initramfs unpacking failed: junk in compressed archive
[    5.983764] ------------[ cut here ]------------
[    5.983917] WARNING: at drivers/gpio/gpiolib.c:101 gpio_ensure_requested+0x50/0x11c()
[    5.983978] autorequest GPIO-101
[    5.984008] Modules linked in:
[    5.984100] [<c002a9b0>] (unwind_backtrace+0x0/0xe0) from [<c004dffc>] (warn_slowpath_common+0x48/0x60)
[    5.984222] [<c004dffc>] (warn_slowpath_common+0x48/0x60) from [<c004e050>] (warn_slowpath_fmt+0x28/0x38)
[    5.984344] [<c004e050>] (warn_slowpath_fmt+0x28/0x38) from [<c017c0a0>] (gpio_ensure_requested+0x50/0x11c)
[    5.984436] [<c017c0a0>] (gpio_ensure_requested+0x50/0x11c) from [<c017c220>] (gpio_direction_output+0xb4/0x15c)
[    5.984558] [<c017c220>] (gpio_direction_output+0xb4/0x15c) from [<c0032bdc>] (bluetooth_set_power+0x18/0x58)
[    5.984649] [<c0032bdc>] (bluetooth_set_power+0x18/0x58) from [<c0032c34>] (trout_rfkill_probe+0x18/0x88)
[    5.984802] [<c0032c34>] (trout_rfkill_probe+0x18/0x88) from [<c01ab8f8>] (platform_drv_probe+0x18/0x1c)
[    5.984893] [<c01ab8f8>] (platform_drv_probe+0x18/0x1c) from [<c01aaa68>] (driver_probe_device+0x78/0x164)
[    5.985015] [<c01aaa68>] (driver_probe_device+0x78/0x164) from [<c01aabe0>] (__driver_attach+0x8c/0x90)
[    5.985107] [<c01aabe0>] (__driver_attach+0x8c/0x90) from [<c01a9d3c>] (bus_for_each_dev+0x50/0x7c)
[    5.985229] [<c01a9d3c>] (bus_for_each_dev+0x50/0x7c) from [<c01aa3e4>] (bus_add_driver+0x98/0x240)
[    5.985321] [<c01aa3e4>] (bus_add_driver+0x98/0x240) from [<c01aae1c>] (driver_register+0x78/0x13c)
[    5.985443] [<c01aae1c>] (driver_register+0x78/0x13c) from [<c00254d4>] (do_one_initcall+0x30/0x1a0)
[    5.985565] [<c00254d4>] (do_one_initcall+0x30/0x1a0) from [<c00089a4>] (kernel_init+0x98/0x114)
[    5.985656] [<c00089a4>] (kernel_init+0x98/0x114) from [<c002692c>] (kernel_thread_exit+0x0/0x8)
[    5.985748] ---[ end trace 1b75b31a2719ed1d ]---
[    5.986328] smd_init()
[    5.986389] smd_core_init()
[    5.986541] smd_core_init() done
[    5.986633] msm_init_last_radio_log: could not retrieve SMEM_CLKREGIM_BSP
[    5.987457] smem_find(16, 40): wrong size 16424
[    5.987670] smd_alloc_channel() cid=02 size=08192 'SMD_RPCCALL'
[    5.988037] smem_find(25, 40): wrong size 16424
[    5.988098] smd_alloc_channel() cid=11 size=08192 'SMD_DATA5'
[    5.988372] smem_find(26, 40): wrong size 16424
[    5.988433] smd_alloc_channel() cid=12 size=08192 'SMD_DATA6'
[    5.988677] smem_find(27, 40): wrong size 16424
[    5.988739] smd_alloc_channel() cid=13 size=08192 'SMD_DATA7'
[    5.988983] smem_find(31, 40): wrong size 16424
[    5.989044] smd_alloc_channel() cid=17 size=08192 'SMD_DATA11'
[    5.989227] smem_find(47, 40): wrong size 16424
[    5.989288] smd_alloc_channel() cid=33 size=08192 'SMD_CS_A2M'
[    5.989501] smem_find(52, 40): wrong size 16424
[    5.989562] smd_alloc_channel() cid=38 size=08192 'SMD_DATA5_CNTL'
[    5.989746] smem_find(53, 40): wrong size 16424
[    5.989807] smd_alloc_channel() cid=39 size=08192 'SMD_DATA6_CNTL'
[    5.989990] smem_find(54, 40): wrong size 16424
[    5.990051] smd_alloc_channel() cid=40 size=08192 'SMD_DATA7_CNTL'
[    5.992095] SMD: ch 2 1 -> 2
[    5.996002] mdp_probe: initialized
[    5.998107] H2W: Registering H2W (headset) driver
[    6.012207] RPC_TIME_TOD_SET_APPS_BASES:
[    6.012237] 	tick = 2381366
[    6.012237] 	stamp = 859059045
[    6.013183] input: h2w headset as /devices/virtual/input/input0
[    6.021514] ashmem: initialized
[    6.036163] yaffs Jul 19 2011 01:11:10 Installing. 
[    6.036376] msgmni has been set to 209
[    6.046875] adsp: probe
[    6.054962] alg: No test for stdrng (krng)
[    6.055541] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[    6.055633] io scheduler noop registered
[    6.055664] io scheduler anticipatory registered (default)
[    6.056304] mddi: init() base=0xc70b8000 irq=16
[    6.118011] mddi cmd send rtd: int 3a000, stat 8063, rtd val d
[    6.118347] mddi: registering panel mddi_c_d263_0000
[    6.118499] mddi: publish: 
[    6.120727] vsync on gpio 97 now 0
[    6.170166] msmfb_probe() installing 320 x 480 panel
[    6.217407] msm_serial: detected port #0
[    6.218200] msm_serial.0: ttyMSM0 at MMIO 0xa9a00000 (irq = 9) is a MSM
[    6.219665] msm_serial: detected port #2
[    6.220092] msm_serial.2: ttyMSM2 at MMIO 0xa9c00000 (irq = 11) is a MSM
[    6.221832] msm_serial: driver initialized
[    6.223266] msm_serial_hs.0: ttyHS0 at MMIO 0xa0200000 (irq = 45) is a MSM HS UART
[    6.224182] msm_serial_hs module loaded
[    6.229248] loop: module loaded
[    6.229461] pmem: 1 init
[    6.230285] pmem_adsp: 0 init
[    6.231262] pmem_camera: 0 init
[    6.233093] msm_nand: allocated dma buffer at ffa0b000, dma_addr 16957000
[    6.233398] msm_nand: read CFG0 = aad400c0 CFG1 = 4745c
[    6.233459] msm_nand: CFG0 cw/page=3 ud_sz=512 ecc_sz=10 spare_sz=5
[    6.233734] msm_nand: NAND_READ_ID = 1500aaec
[    6.233947] msn_nand: nandid 1500aaec status c03120
[    6.234008] msm_nand: manuf Samsung (0xec) device 0xaa blocksz 20000 pagesz 800 size 10000000
[    6.234069] msm_nand: save CFG0 = e8d408c0 CFG1 = 4745c
[    6.234130] msm_nand: CFG0: cw/page=3 ud_sz=516 ecc_sz=10 spare_sz=1 num_addr_cycles=5
[    6.234924] msm_nand: DEV_CMD1: f00f3000
[    6.235076] msm_nand: NAND_EBI2_ECC_BUF_CFG: 1ff
[    6.235137] Creating 6 MTD partitions on "msm_nand":
[    6.235168] 0x0000024c0000-0x000002500000 : "misc"
[    6.237121] 0x0000026c0000-0x000002bc0000 : "recovery"
[    6.248504] 0x000002bc0000-0x000002e40000 : "boot"
[    6.256652] 0x000002e40000-0x000008840000 : "system"
[    6.452789] 0x000008840000-0x00000a640000 : "cache"
[    6.520385] 0x00000a640000-0x000010000000 : "userdata"
[    6.728271] tun: Universal TUN/TAP device driver, 1.6
[    6.728515] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[    6.737884] msm72k_udc: msm72k_probe
[    6.738403] msm72k_udc: msm72k_probe() io=c70c8000, irq=47, dma=ffa0c000(1699c000)
[    6.740386] g_ether gadget: using random self ethernet address
[    6.740631] g_ether gadget: using random host ethernet address
[    6.743011] usb0: MAC 82:b8:88:f9:8f:f9
[    6.743194] usb0: HOST MAC 6a:f5:6d:f1:70:64
[    6.744354] g_ether gadget: Ethernet Gadget, version: Memorial Day 2008
[    6.744598] g_ether gadget: g_ether ready
[    6.744781] msm72k_udc: msm72k_udc: registered gadget driver 'g_ether'
[    6.745971] mice: PS/2 mouse device common for all mice
[    6.748046] msm72k_udc: IDLE -> ONLINE
[    6.748352] hsusb: reset controller
[    6.788513] msm_hsusb_phy_reset: success
[    6.798309] msm_i2c msm_i2c.0: error, status 43c8
[    6.798461] msm_i2c msm_i2c.0: Error during data xfer (-5)
[    6.879974] trout_gpio_irq_handler: got masked interrupt: 0:80
[    6.908355] trout_gpio_irq_handler: got masked interrupt: 0:80
[    6.908630] synaptics_ts_probe: Product Major Version 1
[    6.909515] trout_gpio_irq_handler: got masked interrupt: 0:80
[    6.909729] synaptics_ts_probe: Product Minor Version c
[    6.910552] trout_gpio_irq_handler: got masked interrupt: 0:80
[    6.910797] synaptics_ts_probe: product property 2
[    6.911682] trout_gpio_irq_handler: got masked interrupt: 0:80
[    6.911895] synaptics_ts_probe: device control 81
[    6.912780] trout_gpio_irq_handler: got masked interrupt: 0:80
[    6.912963] synaptics_ts_probe: interrupt enable 3
[    6.915069] synaptics_ts_probe: 0xe0: 1 1 1 2 1 c 0 0
[    6.916351] synaptics_ts_probe: Sensor properties 601
[    6.920257] synaptics_ts_probe: max_x 3480, max_y 5368
[    6.920440] synaptics_ts_probe: inactive_x -80 -80, inactive_y -32 -32
[    6.920654] synaptics_ts_probe: snap_x 240-248 240-248, snap_y 80-88 80-88
[    6.921997] input: synaptics-rmi-touchscreen as /devices/virtual/input/input1
[    6.924652] synaptics_ts_probe: Start touchscreen synaptics-rmi-touchscreen in interrupt mode
[    6.926422] GPIO Input Driver: Start gpio inputs for trout-nav in interrupt mode
[    6.928192] input: trout-nav as /devices/virtual/input/input2
[    6.931213] GPIO Matrix Keypad Driver: Start keypad matrix for trout-keypad-v3 in interrupt mode
[    6.932067] GPIO Input Driver: Start gpio inputs for trout-keypad-v3 in interrupt mode
[    6.932708] GPIO Input Driver: Start gpio inputs for trout-keypad-v3 in interrupt mode
[    6.934600] input: trout-keypad-v3 as /devices/virtual/input/input3
[    6.938293] using input dev h2w headset for key reset
[    6.938629] using input dev trout-nav for key reset
[    6.938812] using input dev trout-keypad-v3 for key reset
[    6.940826] rs30000048:0da5b528 rs30000048:0da5b528: rtc core: registered msm_rtc as rtc0
[    6.941406] AKM8976A compass driver: init
[    6.942321] msm72k_udc: ulpi: write 0x40 to 0x31
[    6.942535] msm72k_udc: ulpi: write 0x1d to 0x0d
[    6.942687] msm72k_udc: ulpi: write 0x1d to 0x10
[    6.942871] msm72k_udc: ept #0 out max:64 head:ffa0c000 bit:0
[    6.943023] msm72k_udc: ept #1 out max:512 head:ffa0c080 bit:1
[    6.943206] msm72k_udc: ept #2 out max:512 head:ffa0c100 bit:2
[    6.943389] msm72k_udc: ept #3 out max:512 head:ffa0c180 bit:3
[    6.943572] msm72k_udc: ept #4 out max:512 head:ffa0c200 bit:4
[    6.943725] msm72k_udc: ept #5 out max:512 head:ffa0c280 bit:5
[    6.943908] msm72k_udc: ept #6 out max:512 head:ffa0c300 bit:6
[    6.944091] msm72k_udc: ept #7 out max:512 head:ffa0c380 bit:7
[    6.944244] msm72k_udc: ept #8 out max:512 head:ffa0c400 bit:8
[    6.944427] msm72k_udc: ept #9 out max:512 head:ffa0c480 bit:9
[    6.944610] msm72k_udc: ept #10 out max:512 head:ffa0c500 bit:10
[    6.944793] msm72k_udc: ept #11 out max:512 head:ffa0c580 bit:11
[    6.944946] msm72k_udc: ept #12 out max:512 head:ffa0c600 bit:12
[    6.945129] msm72k_udc: ept #13 out max:512 head:ffa0c680 bit:13
[    6.945312] msm72k_udc: ept #14 out max:512 head:ffa0c700 bit:14
[    6.945495] msm72k_udc: ept #15 out max:512 head:ffa0c780 bit:15
[    6.945678] msm72k_udc: ept #0 in max:64 head:ffa0c040 bit:16
[    6.945831] msm72k_udc: ept #1 in max:512 head:ffa0c0c0 bit:17
[    6.946014] msm72k_udc: ept #2 in max:512 head:ffa0c140 bit:18
[    6.946197] msm72k_udc: ept #3 in max:512 head:ffa0c1c0 bit:19
[    6.946380] msm72k_udc: ept #4 in max:512 head:ffa0c240 bit:20
[    6.946533] msm72k_udc: ept #5 in max:512 head:ffa0c2c0 bit:21
[    6.946716] msm72k_udc: ept #6 in max:512 head:ffa0c340 bit:22
[    6.946899] msm72k_udc: ept #7 in max:512 head:ffa0c3c0 bit:23
[    6.947052] msm72k_udc: ept #8 in max:512 head:ffa0c440 bit:24
[    6.947235] msm72k_udc: ept #9 in max:512 head:ffa0c4c0 bit:25
[    6.947418] msm72k_udc: ept #10 in max:512 head:ffa0c540 bit:26
[    6.947753] msm72k_udc: ept #11 in max:512 head:ffa0c5c0 bit:27
[    6.947967] msm72k_udc: ept #12 in max:512 head:ffa0c640 bit:28
[    6.948150] msm72k_udc: ept #13 in max:512 head:ffa0c6c0 bit:29
[    6.948303] msm72k_udc: ept #14 in max:512 head:ffa0c740 bit:30
[    6.948486] msm72k_udc: ept #15 in max:512 head:ffa0c7c0 bit:31
[    6.948699] usb: notify offline
[    6.948791] msm_hsusb: enable pullup
[    6.948913] msm72k_udc: ONLINE -> OFFLINE
[    6.949035] msm_hsusb: disable pullup
[    6.949188] usb: notify offline
[    6.969543] input: compass as /devices/virtual/input/input4
[    6.971923] msm_hsusb_phy_reset: success
[    6.972167] smem_find(41, 40): wrong size 16424
[    6.972198] smd_alloc_channel() cid=27 size=08192 'SMD_GPSNMEA'
[    6.976043] Registered led device: blue
[    6.976287] Registered led device: green
[    6.976470] Registered led device: red
[    6.978057] device-mapper: uevent: version 1.0.3
[    6.979644] device-mapper: ioctl: 4.15.0-ioctl (2009-04-01) initialised: dm-devel@redhat.com
[    6.980255] Bluetooth: HCI UART driver ver 2.2
[    6.980346] Bluetooth: HCI H4 protocol initialized
[    6.980377] Bluetooth: HCI BCSP protocol initialized
[    6.980407] Bluetooth: HCILL protocol initialized
[    6.981048] sdhci: Secure Digital Host Controller Interface driver
[    6.981109] sdhci: Copyright(c) Pierre Ossman
[    6.982482] mmc0: Qualcomm MSM SDCC at 0x00000000a0400000 irq 24,0 dma 8
[    6.982604] mmc0: 4 bit data mode enabled
[    6.982635] mmc0: MMC clock 144000 -> 50000000 Hz, PCLK 64000000 Hz
[    6.982666] mmc0: Slot eject status = 1
[    6.982696] mmc0: Power save feature enable = 1
[    6.982757] mmc0: DM non-cached buffer at ffa0e000, dma_addr 0x169b9000
[    6.982788] mmc0: DM cmd busaddr 0x169b9000, cmdptr busaddr 0x169b9300
[    6.983825] trout_sdslot_switchvdd: Disabling SD slot power
[    6.984222] mmc1: Qualcomm MSM SDCC at 0x00000000a0500000 irq 26,194 dma 8
[    6.984283] mmc1: 4 bit data mode enabled
[    6.984313] mmc1: MMC clock 144000 -> 50000000 Hz, PCLK 64000000 Hz
[    6.984375] mmc1: Slot eject status = 0
[    6.984405] mmc1: Power save feature enable = 1
[    6.984436] mmc1: DM non-cached buffer at ffa0f000, dma_addr 0x169bb000
[    6.984497] mmc1: DM cmd busaddr 0x169bb000, cmdptr busaddr 0x169bb300
[    6.985107] Registered led device: spotlight
[    6.985351] Registered led device: keyboard-backlight
[    6.985565] Registered led device: button-backlight
[    6.986816] wacom driver registered
[    6.987915] Advanced Linux Sound Architecture Driver Version 1.0.21.
[    6.989410] No device for DAI CODEC_DAI
[    6.989532] No device for DAI CPU_DAI
[    6.989562] msm_soc: create pcms
[    6.990112] asoc: CODEC_DAI <-> CPU_DAI mapping ok
[    6.990142] msm_soc:ALSA MSM Mixer Setting
[    6.993682] ALSA device list:
[    6.993804]   #0: msm-audio (MSM-CARD)
[    6.994567] TCP cubic registered
[    6.996398] NET: Registered protocol family 10
[    6.998016] lo: Disabled Privacy Extensions
[    7.000061] Mobile IPv6
[    7.000152] IPv6 over IPv4 tunneling driver
[    7.001220] sit0: Disabled Privacy Extensions
[    7.002563] ip6tnl0: Disabled Privacy Extensions
[    7.002960] NET: Registered protocol family 17
[    7.003112] NET: Registered protocol family 15
[    7.003204] Bluetooth: L2CAP ver 2.14
[    7.003265] Bluetooth: L2CAP socket layer initialized
[    7.003326] Bluetooth: SCO (Voice Link) ver 0.6
[    7.003356] Bluetooth: SCO socket layer initialized
[    7.003906] Bluetooth: RFCOMM TTY layer initialized
[    7.003997] Bluetooth: RFCOMM socket layer initialized
[    7.004058] Bluetooth: RFCOMM ver 1.11
[    7.004089] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    7.004150] Bluetooth: BNEP filters: protocol multicast
[    7.004180] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[    7.004852] clock_late_init() disabled 18 unused clocks
[    7.007843] rs30000048:0da5b528 rs30000048:0da5b528: setting system clock to 2011-12-02 18:48:08 UTC (1322851688)
[    7.008087] Waiting 8sec before mounting root device...
[    7.041076] trout_sdslot_switchvdd: Setting level to 2950
[    7.110015] smem_find(14, 40): wrong size 16424
[    7.110229] smd_alloc_channel() cid=00 size=08192 'SMD_DS'
[    7.111206] smem_find(21, 40): wrong size 16424
[    7.111389] smd_alloc_channel() cid=07 size=08192 'SMD_DATA1'
[    7.112121] smem_find(22, 40): wrong size 16424
[    7.112304] smd_alloc_channel() cid=08 size=08192 'SMD_DATA2'
[    7.113006] smem_find(23, 40): wrong size 16424
[    7.113159] smd_alloc_channel() cid=09 size=08192 'SMD_DATA3'
[    7.113861] smem_find(24, 40): wrong size 16424
[    7.114044] smd_alloc_channel() cid=10 size=08192 'SMD_DATA4'
[    7.116638] trout_sdslot_switchvdd: Setting level to 2750
[    7.277343] mmc1: host does not support reading read-only switch. assuming write-enable.
[    7.277862] mmc1: new high speed SDHC card at address b368
[    7.279327] mmcblk0: mmc1:b368 USD   3.75 GiB 
[    7.280517]  mmcblk0: p1
[   15.022979] EXT3-fs: INFO: recovery required on readonly filesystem.
[   15.023223] EXT3-fs: write access will be enabled during recovery.
[   16.491241] EXT3-fs: recovery complete.
[   16.491882] kjournald starting.  Commit interval 5 seconds
[   16.499267] EXT3-fs: mounted filesystem with writeback data mode.
[   16.499633] VFS: Mounted root (ext3 filesystem) readonly on device 179:1.
[   16.503143] devtmpfs: mounted
[   16.503509] Freeing init memory: 116K
[   17.287750] EXT3 FS on mmcblk0p1, internal journal
[   17.837890] cfg80211: Calling CRDA to update world regulatory domain
[   19.227142] ADDRCONF(NETDEV_UP): usb0: link is not ready
[   21.098266] msm72k_udc: OFFLINE -> ONLINE
[   21.098541] hsusb: reset controller
[   21.189758] msm_hsusb_phy_reset: success
[   21.337707] msm72k_udc: ulpi: write 0x40 to 0x31
[   21.337829] msm72k_udc: ulpi: write 0x1d to 0x0d
[   21.337860] msm72k_udc: ulpi: write 0x1d to 0x10
[   21.337890] msm72k_udc: ept #0 out max:64 head:ffa0c000 bit:0
[   21.337951] msm72k_udc: ept #1 out max:512 head:ffa0c080 bit:1
[   21.337982] msm72k_udc: ept #2 out max:512 head:ffa0c100 bit:2
[   21.338043] msm72k_udc: ept #3 out max:512 head:ffa0c180 bit:3
[   21.338073] msm72k_udc: ept #4 out max:512 head:ffa0c200 bit:4
[   21.338104] msm72k_udc: ept #5 out max:512 head:ffa0c280 bit:5
[   21.338165] msm72k_udc: ept #6 out max:512 head:ffa0c300 bit:6
[   21.338195] msm72k_udc: ept #7 out max:512 head:ffa0c380 bit:7
[   21.338226] msm72k_udc: ept #8 out max:512 head:ffa0c400 bit:8
[   21.338287] msm72k_udc: ept #9 out max:512 head:ffa0c480 bit:9
[   21.338317] msm72k_udc: ept #10 out max:512 head:ffa0c500 bit:10
[   21.338378] msm72k_udc: ept #11 out max:512 head:ffa0c580 bit:11
[   21.338409] msm72k_udc: ept #12 out max:512 head:ffa0c600 bit:12
[   21.338439] msm72k_udc: ept #13 out max:512 head:ffa0c680 bit:13
[   21.338500] msm72k_udc: ept #14 out max:512 head:ffa0c700 bit:14
[   21.338531] msm72k_udc: ept #15 out max:512 head:ffa0c780 bit:15
[   21.338592] msm72k_udc: ept #0 in max:64 head:ffa0c040 bit:16
[   21.338623] msm72k_udc: ept #1 in max:512 head:ffa0c0c0 bit:17
[   21.338653] msm72k_udc: ept #2 in max:512 head:ffa0c140 bit:18
[   21.338714] msm72k_udc: ept #3 in max:512 head:ffa0c1c0 bit:19
[   21.338745] msm72k_udc: ept #4 in max:512 head:ffa0c240 bit:20
[   21.338775] msm72k_udc: ept #5 in max:512 head:ffa0c2c0 bit:21
[   21.338836] msm72k_udc: ept #6 in max:512 head:ffa0c340 bit:22
[   21.338867] msm72k_udc: ept #7 in max:512 head:ffa0c3c0 bit:23
[   21.338928] msm72k_udc: ept #8 in max:512 head:ffa0c440 bit:24
[   21.338958] msm72k_udc: ept #9 in max:512 head:ffa0c4c0 bit:25
[   21.338989] msm72k_udc: ept #10 in max:512 head:ffa0c540 bit:26
[   21.339050] msm72k_udc: ept #11 in max:512 head:ffa0c5c0 bit:27
[   21.339080] msm72k_udc: ept #12 in max:512 head:ffa0c640 bit:28
[   21.339111] msm72k_udc: ept #13 in max:512 head:ffa0c6c0 bit:29
[   21.339172] msm72k_udc: ept #14 in max:512 head:ffa0c740 bit:30
[   21.339202] msm72k_udc: ept #15 in max:512 head:ffa0c7c0 bit:31
[   21.339263] usb: notify offline
[   21.339294] msm_hsusb: enable pullup
[   21.342376] msm72k_udc: msm72k_udc: suspend
[   21.444091] msm72k_udc: msm72k_udc: reset
[   21.446411] msm72k_udc: msm72k_udc: portchange USB_SPEED_HIGH
[   21.549102] msm72k_udc: msm72k_udc: reset
[   21.551422] msm72k_udc: msm72k_udc: portchange USB_SPEED_HIGH
[   21.675598] g_ether gadget: high speed config #1: CDC Ethernet (ECM)
[   21.675720] msm72k_udc: ept #2 in max:64 head:ffa0c140 bit:18
[   21.678527] msm72k_udc: ept #1 in max:512 head:ffa0c0c0 bit:17
[   21.678649] msm72k_udc: ept #1 out max:512 head:ffa0c080 bit:1
[   21.679107] ADDRCONF(NETDEV_CHANGE): usb0: link becomes ready
[   23.832183] request_suspend_state: wakeup (3->0) at 18194614343 (2011-12-02 18:48:25.324340851 UTC)
[   26.898376] init sharp panel
[   28.233245] qmi: smd closed
[   28.233306] SMD: ch 38 1 -> 2
[   28.233337] qmi: smd opened
[   28.234008] qmi: ctl: wds use client_id 0x01
[   29.623535] SMD: ch 0 1 -> 2
[   32.127685] usb0: no IPv6 routers present

root         1  0.0  0.5   1408   568 ?        Ss   18:48   0:00 init [5]  
root         2  0.0  0.0      0     0 ?        S    18:48   0:00 [kthreadd]
root         3  0.0  0.0      0     0 ?        S    18:48   0:00 [ksoftirqd/0]
root         4  0.0  0.0      0     0 ?        S    18:48   0:00 [events/0]
root         5  0.0  0.0      0     0 ?        S    18:48   0:00 [khelper]
root         6  0.0  0.0      0     0 ?        S    18:48   0:00 [async/mgr]
root         7  0.0  0.0      0     0 ?        S    18:48   0:00 [suspend]
root         8  0.0  0.0      0     0 ?        S    18:48   0:00 [sync_supers]
root         9  0.0  0.0      0     0 ?        S    18:48   0:00 [bdi-default]
root        10  0.0  0.0      0     0 ?        S    18:48   0:00 [kblockd/0]
root        11  0.0  0.0      0     0 ?        S    18:48   0:00 [kseriod]
root        12  0.0  0.0      0     0 ?        S    18:48   0:00 [kmmcd]
root        13  0.0  0.0      0     0 ?        S    18:48   0:00 [bluetooth]
root        14  0.0  0.0      0     0 ?        S    18:48   0:00 [kondemand/0]
root        15  0.0  0.0      0     0 ?        S    18:48   0:00 [qmi]
root        16  0.0  0.0      0     0 ?        D    18:48   0:00 [rpcrouter]
root        17  0.0  0.0      0     0 ?        S    18:48   0:00 [detection/0]
root        18  0.0  0.0      0     0 ?        S    18:48   0:00 [krpcserversd]
root        19  0.0  0.0      0     0 ?        S    18:48   0:00 [kswapd0]
root        20  0.0  0.0      0     0 ?        S    18:48   0:00 [aio/0]
root        21  0.0  0.0      0     0 ?        S    18:48   0:00 [crypto/0]
root        30  0.0  0.0      0     0 ?        S    18:48   0:00 [kadspd]
root        32  0.0  0.0      0     0 ?        S    18:48   0:00 [panel_on/0]
root        33  0.0  0.0      0     0 ?        D    18:48   0:00 [msmfb_refreshd]
root        34  0.0  0.0      0     0 ?        S    18:48   0:00 [msm_serial_hs]
root        35  0.0  0.0      0     0 ?        S    18:48   0:00 [mtdblockd]
root        36  0.0  0.0      0     0 ?        S    18:48   0:00 [rmnet/0]
root        37  0.0  0.0      0     0 ?        S    18:48   0:00 [synaptics_wq]
root        38  0.0  0.0      0     0 ?        S    18:48   0:00 [kstriped]
root        39  0.0  0.0      0     0 ?        S    18:48   0:00 [kconservative/0]
root        40  0.0  0.0      0     0 ?        S<   18:48   0:00 [krfcommd]
root        41  0.0  0.0      0     0 ?        S    18:48   0:00 [mmcqd]
root        42  0.0  0.0      0     0 ?        S    18:48   0:00 [flush-179:0]
root        43  0.0  0.0      0     0 ?        S    18:48   0:00 [kjournald]
100        141  0.4  1.1   2596  1180 ?        Ss   18:48   0:04 /usr/bin/dbus-daemon --system
root       144  0.0  3.6  18184  3928 ?        Ssl  18:48   0:00 /usr/sbin/connmand -I usb0,wlan0,dummy0,rmnet0,rmnet1,rmnet2 -r
root       152  0.0  0.7   3664   836 ?        Ss   18:48   0:00 /usr/sbin/sshd
root       155  0.0  0.4   1412   452 ?        Ss   18:48   0:00 /usr/sbin/cron
nobody     159  0.0  0.5   2104   640 ?        S    18:48   0:00 /usr/bin/dnsmasq -7 /etc/dnsmasq.d
root       162  0.0  0.6   2712   692 ?        Ss   18:48   0:00 /sbin/syslogd -n -C64 -m 20
root       164  0.0  0.5   2648   596 ?        Ss   18:48   0:00 /sbin/klogd -n
root       167  0.6  3.5  17904  3796 ?        Ssl  18:48   0:07 /usr/sbin/fsodeviced
root       172  0.3  3.0  16472  3236 ?        Sl   18:48   0:03 /usr/sbin/fsousaged
root       173  0.0  3.2  23988  3472 ?        Ssl  18:48   0:00 /usr/sbin/fsotdld
root       176  2.1 11.3  25740 12192 ?        Ss   18:48   0:24 python /usr/bin/frameworkd
root       179  0.0  2.9  16044  3136 ?        Ssl  18:48   0:00 /usr/sbin/fsoaudiod
root       182  0.0  1.4   3808  1540 ?        Ss   18:48   0:00 /usr/sbin/fso-gpsd -S localhost gpsd -P /var/run/fso-gpsd.pid
root       208  0.0  1.4   3216  1560 ?        S    18:48   0:00 /usr/sbin/atd /var/spool/at
root       210  0.0  0.5   2652   608 tty1     Ss+  18:48   0:00 /sbin/getty 38400 tty1
root       212  0.1  2.3  23172  2532 ?        Ssl  18:48   0:01 /usr/bin/phonefsod
root       235  0.5  3.9  25820  4268 ?        Sl   18:48   0:05 /usr/sbin/fsogsmd
root       243  0.4  4.8  18132  5240 ?        Sl   18:48   0:04 /usr/sbin/fsodatad
root       247  1.0 11.6  23304 12536 ?        S<L  18:48   0:11 /usr/bin/enlightenment
root       259  0.0  1.7   6452  1916 ?        SNs  18:48   0:00 /usr/lib/enlightenment/utils/enlightenment_fm
root       269  0.1  0.0      0     0 ?        ZNs  18:48   0:01 [shr_elm_softkey] <defunct>
root       270  1.0  0.0      0     0 ?        ZNs  18:48   0:11 [vala-terminal] <defunct>
root       314  0.1  1.6   3888  1812 ?        Ss   18:57   0:00 sshd: root@pts/1 
root       316  0.0  0.7   2824   848 pts/1    Ss   18:57   0:00 -sh
root       360  1.8 11.8  23520 12728 pts/1    S<L  19:00   0:07 /usr/bin/enlightenment
root       373  0.0  1.7   6452  1916 ?        SNs  19:00   0:00 /usr/lib/enlightenment/utils/enlightenment_fm
root       383  0.2  0.0      0     0 ?        ZNs  19:00   0:01 [shr_elm_softkey] <defunct>

[    0.000000] Linux version 2.6.32.9 (mr-4@test1.my.net) (gcc version 4.5.3 20110311 (prerelease) (GCC) ) #1 PREEMPT Wed Nov 30 05:28:22 GMT 2011
[    0.000000] CPU: ARMv6-compatible processor [4117b362] revision 2 (ARMv6TEJ), cr=00c5387f
[    0.000000] CPU: VIPT aliasing data cache, VIPT aliasing instruction cache
[    0.000000] Machine: trout
[    0.000000] find the smi tag
[    0.000000] parse_tag_smi: smi size = 64
[    0.000000] find the hwid tag
[    0.000000] parse_tag_hwid: hwid = 0x0
[    0.000000] find the skuid tag
[    0.000000] parse_tag_skuid: hwid = 0x1be01
[    0.000000] Ignoring unrecognised tag 0x4d534d74
[    0.000000] find the engineer tag
[    0.000000] parse_tag_engineerid: hwid = 0xffffffff
[    0.000000] AKM Data size = 1018 , 0x89768976, size = 4064
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] On node 0 totalpages: 28160
[    0.000000] free_area_init_node: node 0, pgdat c0424eb8, node_mem_map c046c000
[    0.000000]   Normal zone: 220 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 27940 pages, LIFO batch:7
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 27940
[    0.000000] Kernel command line: board_trout.disable_uart3=0 board_trout.usb_h2w_sw=0 board_trout.disable_sdcard=0 smisize=64  androidboot.baseband=2.22.19.26I androidboot.cid=T-MOB005 androidboot.carrier=TMUK androidboot.keycaps=qwerty androidboot.mode=normal androidboot.serialno=HT91PKV01748 androidboot.bootloader=1.33.2005 console=tty1 root=/dev/mmcblk0p1 rootdelay=8 fbcon=rotate:1 panic=30 mem=110M
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 110MB = 110MB total
[    0.000000] Memory: 106948KB available (3812K code, 458K data, 116K init, 0K highmem)
[    0.000000] SLUB: Genslabs=11, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000] NR_IRQS:250
[    0.000000] trout_init_irq()
[    0.000000] Console: colour dummy device 80x30
[    0.000000] console [tty1] enabled
[    0.000000] Calibrating delay loop... 383.38 BogoMIPS (lpj=1916928)
[    0.219268] Mount-cache hash table entries: 512
[    0.220123] CPU: Testing write buffer coherency: ok
[    0.221343] devtmpfs: initialized
[    0.224029] NET: Registered protocol family 16
[    0.224456] trout_init_gpio: cpld_usb_hw2_sw = 0
[    0.224609] trout_gpio_irq_handler: got masked interrupt: 0:10
[    0.224700] trout_gpio_irq_handler: got masked interrupt: 1:01
[    0.225616] trout_init() revision=128
[    5.648437] ------------[ cut here ]------------
[    5.648559] WARNING: at drivers/gpio/gpiolib.c:101 gpio_ensure_requested+0x50/0x11c()
[    5.648651] autorequest GPIO-1
[    5.648681] Modules linked in:
[    5.648803] [<c002a9b0>] (unwind_backtrace+0x0/0xe0) from [<c004dffc>] (warn_slowpath_common+0x48/0x60)
[    5.648925] [<c004dffc>] (warn_slowpath_common+0x48/0x60) from [<c004e050>] (warn_slowpath_fmt+0x28/0x38)
[    5.649017] [<c004e050>] (warn_slowpath_fmt+0x28/0x38) from [<c017c0a0>] (gpio_ensure_requested+0x50/0x11c)
[    5.649139] [<c017c0a0>] (gpio_ensure_requested+0x50/0x11c) from [<c017c220>] (gpio_direction_output+0xb4/0x15c)
[    5.649291] [<c017c220>] (gpio_direction_output+0xb4/0x15c) from [<c000d4cc>] (trout_init+0x54/0x1e8)
[    5.649414] [<c000d4cc>] (trout_init+0x54/0x1e8) from [<c000a468>] (customize_machine+0x18/0x24)
[    5.649536] [<c000a468>] (customize_machine+0x18/0x24) from [<c00254d4>] (do_one_initcall+0x30/0x1a0)
[    5.649658] [<c00254d4>] (do_one_initcall+0x30/0x1a0) from [<c00089a4>] (kernel_init+0x98/0x114)
[    5.649780] [<c00089a4>] (kernel_init+0x98/0x114) from [<c002692c>] (kernel_thread_exit+0x0/0x8)
[    5.649902] ---[ end trace 1b75b31a2719ed1c ]---
[    5.649963] acpu_clock_init()
[    5.650115] ACPU running at 384000 KHz
[    5.759033] bio: create slab <bio-0> at 0
[    5.760894] msm_i2c_probe
[    5.761230] msm_i2c_probe: clk_ctl 35d, 100000 Hz
[    5.763793] Bluetooth: Core ver 2.15
[    5.764282] NET: Registered protocol family 31
[    5.764343] Bluetooth: HCI device and connection manager initialized
[    5.764404] Bluetooth: HCI socket layer initialized
[    5.764923] Switching to clocksource gp_timer
[    5.766998] NET: Registered protocol family 2
[    5.767395] IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
[    5.768218] TCP established hash table entries: 4096 (order: 3, 32768 bytes)
[    5.768829] TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
[    5.769104] TCP: Hash tables configured (established 4096 bind 4096)
[    5.769165] TCP reno registered
[    5.769592] NET: Registered protocol family 1
[    5.770141] Unpacking initramfs...
[    5.770294] Initramfs unpacking failed: junk in compressed archive
[    5.771118] ------------[ cut here ]------------
[    5.771270] WARNING: at drivers/gpio/gpiolib.c:101 gpio_ensure_requested+0x50/0x11c()
[    5.771331] autorequest GPIO-101
[    5.771362] Modules linked in:
[    5.771453] [<c002a9b0>] (unwind_backtrace+0x0/0xe0) from [<c004dffc>] (warn_slowpath_common+0x48/0x60)
[    5.771575] [<c004dffc>] (warn_slowpath_common+0x48/0x60) from [<c004e050>] (warn_slowpath_fmt+0x28/0x38)
[    5.771667] [<c004e050>] (warn_slowpath_fmt+0x28/0x38) from [<c017c0a0>] (gpio_ensure_requested+0x50/0x11c)
[    5.771789] [<c017c0a0>] (gpio_ensure_requested+0x50/0x11c) from [<c017c220>] (gpio_direction_output+0xb4/0x15c)
[    5.771911] [<c017c220>] (gpio_direction_output+0xb4/0x15c) from [<c0032bdc>] (bluetooth_set_power+0x18/0x58)
[    5.772003] [<c0032bdc>] (bluetooth_set_power+0x18/0x58) from [<c0032c34>] (trout_rfkill_probe+0x18/0x88)
[    5.772125] [<c0032c34>] (trout_rfkill_probe+0x18/0x88) from [<c01ab8f8>] (platform_drv_probe+0x18/0x1c)
[    5.772247] [<c01ab8f8>] (platform_drv_probe+0x18/0x1c) from [<c01aaa68>] (driver_probe_device+0x78/0x164)
[    5.772369] [<c01aaa68>] (driver_probe_device+0x78/0x164) from [<c01aabe0>] (__driver_attach+0x8c/0x90)
[    5.772460] [<c01aabe0>] (__driver_attach+0x8c/0x90) from [<c01a9d3c>] (bus_for_each_dev+0x50/0x7c)
[    5.772583] [<c01a9d3c>] (bus_for_each_dev+0x50/0x7c) from [<c01aa3e4>] (bus_add_driver+0x98/0x240)
[    5.772674] [<c01aa3e4>] (bus_add_driver+0x98/0x240) from [<c01aae1c>] (driver_register+0x78/0x13c)
[    5.772796] [<c01aae1c>] (driver_register+0x78/0x13c) from [<c00254d4>] (do_one_initcall+0x30/0x1a0)
[    5.772918] [<c00254d4>] (do_one_initcall+0x30/0x1a0) from [<c00089a4>] (kernel_init+0x98/0x114)
[    5.773010] [<c00089a4>] (kernel_init+0x98/0x114) from [<c002692c>] (kernel_thread_exit+0x0/0x8)
[    5.773101] ---[ end trace 1b75b31a2719ed1d ]---
[    5.773681] smd_init()
[    5.773742] smd_core_init()
[    5.773895] smd_core_init() done
[    5.773956] msm_init_last_radio_log: could not retrieve SMEM_CLKREGIM_BSP
[    5.774810] smem_find(16, 40): wrong size 16424
[    5.774902] smd_alloc_channel() cid=02 size=08192 'SMD_RPCCALL'
[    5.775360] smem_find(25, 40): wrong size 16424
[    5.775421] smd_alloc_channel() cid=11 size=08192 'SMD_DATA5'
[    5.775665] smem_find(26, 40): wrong size 16424
[    5.775726] smd_alloc_channel() cid=12 size=08192 'SMD_DATA6'
[    5.775970] smem_find(27, 40): wrong size 16424
[    5.776031] smd_alloc_channel() cid=13 size=08192 'SMD_DATA7'
[    5.776306] smem_find(31, 40): wrong size 16424
[    5.776367] smd_alloc_channel() cid=17 size=08192 'SMD_DATA11'
[    5.776550] smem_find(47, 40): wrong size 16424
[    5.776611] smd_alloc_channel() cid=33 size=08192 'SMD_CS_A2M'
[    5.776824] smem_find(52, 40): wrong size 16424
[    5.776885] smd_alloc_channel() cid=38 size=08192 'SMD_DATA5_CNTL'
[    5.777069] smem_find(53, 40): wrong size 16424
[    5.777130] smd_alloc_channel() cid=39 size=08192 'SMD_DATA6_CNTL'
[    5.777313] smem_find(54, 40): wrong size 16424
[    5.777374] smd_alloc_channel() cid=40 size=08192 'SMD_DATA7_CNTL'
[    5.779418] SMD: ch 2 1 -> 2
[    5.783355] mdp_probe: initialized
[    5.785430] H2W: Registering H2W (headset) driver
[    5.799560] RPC_TIME_TOD_SET_APPS_BASES:
[    5.799560] 	tick = 12641626
[    5.799560] 	stamp = 859059045
[    5.800476] input: h2w headset as /devices/virtual/input/input0
[    5.808807] ashmem: initialized
[    5.823394] yaffs Nov 30 2011 05:25:41 Installing. 
[    5.823608] msgmni has been set to 209
[    5.834533] adsp: probe
[    5.842407] alg: No test for stdrng (krng)
[    5.842926] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[    5.843048] io scheduler noop registered
[    5.843078] io scheduler anticipatory registered (default)
[    5.843688] mddi: init() base=0xc70b8000 irq=16
[    5.905487] mddi cmd send rtd: int 3a000, stat 8063, rtd val e
[    5.905822] mddi: registering panel mddi_c_d263_0000
[    5.905975] mddi: publish: 
[    5.908264] vsync on gpio 97 now 0
[    5.957672] msmfb_probe() installing 320 x 480 panel
[    6.004882] msm_serial: detected port #0
[    6.005645] msm_serial.0: ttyMSM0 at MMIO 0xa9a00000 (irq = 9) is a MSM
[    6.007141] msm_serial: detected port #2
[    6.007568] msm_serial.2: ttyMSM2 at MMIO 0xa9c00000 (irq = 11) is a MSM
[    6.009338] msm_serial: driver initialized
[    6.010772] msm_serial_hs.0: ttyHS0 at MMIO 0xa0200000 (irq = 45) is a MSM HS UART
[    6.011718] msm_serial_hs module loaded
[    6.016784] loop: module loaded
[    6.016998] pmem: 1 init
[    6.017822] pmem_adsp: 0 init
[    6.018768] pmem_camera: 0 init
[    6.020629] msm_nand: allocated dma buffer at ffa0b000, dma_addr 16957000
[    6.021118] msm_nand: read CFG0 = aad400c0 CFG1 = 4745c
[    6.021179] msm_nand: CFG0 cw/page=3 ud_sz=512 ecc_sz=10 spare_sz=5
[    6.021362] msm_nand: NAND_READ_ID = 1500aaec
[    6.021545] msn_nand: nandid 1500aaec status c03120
[    6.021606] msm_nand: manuf Samsung (0xec) device 0xaa blocksz 20000 pagesz 800 size 10000000
[    6.021667] msm_nand: save CFG0 = e8d408c0 CFG1 = 4745c
[    6.021728] msm_nand: CFG0: cw/page=3 ud_sz=516 ecc_sz=10 spare_sz=1 num_addr_cycles=5
[    6.022521] msm_nand: DEV_CMD1: f00f3000
[    6.022735] msm_nand: NAND_EBI2_ECC_BUF_CFG: 1ff
[    6.022796] Creating 6 MTD partitions on "msm_nand":
[    6.022857] 0x0000024c0000-0x000002500000 : "misc"
[    6.024871] 0x0000026c0000-0x000002bc0000 : "recovery"
[    6.035705] 0x000002bc0000-0x000002e40000 : "boot"
[    6.043518] 0x000002e40000-0x000008840000 : "system"
[    6.243774] 0x000008840000-0x00000a640000 : "cache"
[    6.311767] 0x00000a640000-0x000010000000 : "userdata"
[    6.507385] tun: Universal TUN/TAP device driver, 1.6
[    6.507629] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[    6.517303] msm72k_udc: msm72k_probe
[    6.517852] msm72k_udc: msm72k_probe() io=c70c8000, irq=47, dma=ffa0c000(1699c000)
[    6.519836] g_ether gadget: using random self ethernet address
[    6.520111] g_ether gadget: using random host ethernet address
[    6.522460] usb0: MAC 86:6c:b4:32:17:48
[    6.522644] usb0: HOST MAC 1a:44:f9:7a:5a:80
[    6.523834] g_ether gadget: Ethernet Gadget, version: Memorial Day 2008
[    6.524078] g_ether gadget: g_ether ready
[    6.524261] msm72k_udc: msm72k_udc: registered gadget driver 'g_ether'
[    6.525726] mice: PS/2 mouse device common for all mice
[    6.527618] msm72k_udc: IDLE -> ONLINE
[    6.527893] hsusb: reset controller
[    6.566009] msm_hsusb_phy_reset: success
[    6.575836] msm_i2c msm_i2c.0: error, status 43c8
[    6.576019] msm_i2c msm_i2c.0: Error during data xfer (-5)
[    6.657501] trout_gpio_irq_handler: got masked interrupt: 0:80
[    6.685913] trout_gpio_irq_handler: got masked interrupt: 0:80
[    6.686157] synaptics_ts_probe: Product Major Version 1
[    6.687042] trout_gpio_irq_handler: got masked interrupt: 0:80
[    6.687255] synaptics_ts_probe: Product Minor Version c
[    6.688110] trout_gpio_irq_handler: got masked interrupt: 0:80
[    6.688385] synaptics_ts_probe: product property 2
[    6.689208] trout_gpio_irq_handler: got masked interrupt: 0:80
[    6.689422] synaptics_ts_probe: device control 81
[    6.690277] trout_gpio_irq_handler: got masked interrupt: 0:80
[    6.690490] synaptics_ts_probe: interrupt enable 3
[    6.692565] synaptics_ts_probe: 0xe0: 1 1 1 2 1 c 0 0
[    6.693847] synaptics_ts_probe: Sensor properties 601
[    6.697784] synaptics_ts_probe: max_x 3480, max_y 5368
[    6.697967] synaptics_ts_probe: inactive_x -80 -80, inactive_y -32 -32
[    6.698181] synaptics_ts_probe: snap_x 240-248 240-248, snap_y 80-88 80-88
[    6.699523] input: synaptics-rmi-touchscreen as /devices/virtual/input/input1
[    6.702148] synaptics_ts_probe: Start touchscreen synaptics-rmi-touchscreen in interrupt mode
[    6.703979] GPIO Input Driver: Start gpio inputs for trout-nav in interrupt mode
[    6.705780] input: trout-nav as /devices/virtual/input/input2
[    6.708801] GPIO Matrix Keypad Driver: Start keypad matrix for trout-keypad-v3 in interrupt mode
[    6.709655] GPIO Input Driver: Start gpio inputs for trout-keypad-v3 in interrupt mode
[    6.710266] GPIO Input Driver: Start gpio inputs for trout-keypad-v3 in interrupt mode
[    6.712066] input: trout-keypad-v3 as /devices/virtual/input/input3
[    6.715820] using input dev h2w headset for key reset
[    6.716156] using input dev trout-nav for key reset
[    6.716339] using input dev trout-keypad-v3 for key reset
[    6.718353] rs30000048:0da5b528 rs30000048:0da5b528: rtc core: registered msm_rtc as rtc0
[    6.718933] AKM8976A compass driver: init
[    6.719787] msm72k_udc: ulpi: write 0x40 to 0x31
[    6.720031] msm72k_udc: ulpi: write 0x1d to 0x0d
[    6.720153] msm72k_udc: ulpi: write 0x1d to 0x10
[    6.720336] msm72k_udc: ept #0 out max:64 head:ffa0c000 bit:0
[    6.720489] msm72k_udc: ept #1 out max:512 head:ffa0c080 bit:1
[    6.720672] msm72k_udc: ept #2 out max:512 head:ffa0c100 bit:2
[    6.720855] msm72k_udc: ept #3 out max:512 head:ffa0c180 bit:3
[    6.721038] msm72k_udc: ept #4 out max:512 head:ffa0c200 bit:4
[    6.721191] msm72k_udc: ept #5 out max:512 head:ffa0c280 bit:5
[    6.721374] msm72k_udc: ept #6 out max:512 head:ffa0c300 bit:6
[    6.721557] msm72k_udc: ept #7 out max:512 head:ffa0c380 bit:7
[    6.721740] msm72k_udc: ept #8 out max:512 head:ffa0c400 bit:8
[    6.721893] msm72k_udc: ept #9 out max:512 head:ffa0c480 bit:9
[    6.722076] msm72k_udc: ept #10 out max:512 head:ffa0c500 bit:10
[    6.722259] msm72k_udc: ept #11 out max:512 head:ffa0c580 bit:11
[    6.722442] msm72k_udc: ept #12 out max:512 head:ffa0c600 bit:12
[    6.722625] msm72k_udc: ept #13 out max:512 head:ffa0c680 bit:13
[    6.722778] msm72k_udc: ept #14 out max:512 head:ffa0c700 bit:14
[    6.722961] msm72k_udc: ept #15 out max:512 head:ffa0c780 bit:15
[    6.723144] msm72k_udc: ept #0 in max:64 head:ffa0c040 bit:16
[    6.723327] msm72k_udc: ept #1 in max:512 head:ffa0c0c0 bit:17
[    6.723480] msm72k_udc: ept #2 in max:512 head:ffa0c140 bit:18
[    6.723663] msm72k_udc: ept #3 in max:512 head:ffa0c1c0 bit:19
[    6.723846] msm72k_udc: ept #4 in max:512 head:ffa0c240 bit:20
[    6.724029] msm72k_udc: ept #5 in max:512 head:ffa0c2c0 bit:21
[    6.724182] msm72k_udc: ept #6 in max:512 head:ffa0c340 bit:22
[    6.724365] msm72k_udc: ept #7 in max:512 head:ffa0c3c0 bit:23
[    6.724548] msm72k_udc: ept #8 in max:512 head:ffa0c440 bit:24
[    6.724700] msm72k_udc: ept #9 in max:512 head:ffa0c4c0 bit:25
[    6.724884] msm72k_udc: ept #10 in max:512 head:ffa0c540 bit:26
[    6.725311] msm72k_udc: ept #11 in max:512 head:ffa0c5c0 bit:27
[    6.725524] msm72k_udc: ept #12 in max:512 head:ffa0c640 bit:28
[    6.725708] msm72k_udc: ept #13 in max:512 head:ffa0c6c0 bit:29
[    6.725860] msm72k_udc: ept #14 in max:512 head:ffa0c740 bit:30
[    6.726043] msm72k_udc: ept #15 in max:512 head:ffa0c7c0 bit:31
[    6.726257] usb: notify offline
[    6.726348] msm_hsusb: enable pullup
[    6.726470] msm72k_udc: ONLINE -> OFFLINE
[    6.726593] msm_hsusb: disable pullup
[    6.726745] usb: notify offline
[    6.747100] input: compass as /devices/virtual/input/input4
[    6.749572] msm_hsusb_phy_reset: success
[    6.749786] smem_find(41, 40): wrong size 16424
[    6.749847] smd_alloc_channel() cid=27 size=08192 'SMD_GPSNMEA'
[    6.753692] Registered led device: blue
[    6.753906] Registered led device: green
[    6.754089] Registered led device: red
[    6.755767] device-mapper: uevent: version 1.0.3
[    6.757324] device-mapper: ioctl: 4.15.0-ioctl (2009-04-01) initialised: dm-devel@redhat.com
[    6.757934] Bluetooth: HCI UART driver ver 2.2
[    6.758026] Bluetooth: HCI H4 protocol initialized
[    6.758056] Bluetooth: HCI BCSP protocol initialized
[    6.758117] Bluetooth: HCILL protocol initialized
[    6.758728] sdhci: Secure Digital Host Controller Interface driver
[    6.758819] sdhci: Copyright(c) Pierre Ossman
[    6.760162] mmc0: Qualcomm MSM SDCC at 0x00000000a0400000 irq 24,0 dma 8
[    6.760284] mmc0: 4 bit data mode enabled
[    6.760314] mmc0: MMC clock 144000 -> 50000000 Hz, PCLK 64000000 Hz
[    6.760375] mmc0: Slot eject status = 1
[    6.760406] mmc0: Power save feature enable = 1
[    6.760437] mmc0: DM non-cached buffer at ffa0e000, dma_addr 0x169b9000
[    6.760498] mmc0: DM cmd busaddr 0x169b9000, cmdptr busaddr 0x169b9300
[    6.761535] trout_sdslot_switchvdd: Disabling SD slot power
[    6.761932] mmc1: Qualcomm MSM SDCC at 0x00000000a0500000 irq 26,194 dma 8
[    6.761993] mmc1: 4 bit data mode enabled
[    6.762023] mmc1: MMC clock 144000 -> 50000000 Hz, PCLK 64000000 Hz
[    6.762054] mmc1: Slot eject status = 0
[    6.762084] mmc1: Power save feature enable = 1
[    6.762145] mmc1: DM non-cached buffer at ffa0f000, dma_addr 0x169bb000
[    6.762176] mmc1: DM cmd busaddr 0x169bb000, cmdptr busaddr 0x169bb300
[    6.762786] Registered led device: spotlight
[    6.763061] Registered led device: keyboard-backlight
[    6.763275] Registered led device: button-backlight
[    6.764495] wacom driver registered
[    6.765625] Advanced Linux Sound Architecture Driver Version 1.0.21.
[    6.767089] No device for DAI CODEC_DAI
[    6.767181] No device for DAI CPU_DAI
[    6.767242] msm_soc: create pcms
[    6.767700] asoc: CODEC_DAI <-> CPU_DAI mapping ok
[    6.767761] msm_soc:ALSA MSM Mixer Setting
[    6.771148] ALSA device list:
[    6.771270]   #0: msm-audio (MSM-CARD)
[    6.772003] TCP cubic registered
[    6.773803] NET: Registered protocol family 10
[    6.775238] lo: Disabled Privacy Extensions
[    6.777038] Mobile IPv6
[    6.777130] IPv6 over IPv4 tunneling driver
[    6.778167] sit0: Disabled Privacy Extensions
[    6.779418] ip6tnl0: Disabled Privacy Extensions
[    6.779785] NET: Registered protocol family 17
[    6.779937] NET: Registered protocol family 15
[    6.780029] Bluetooth: L2CAP ver 2.14
[    6.780090] Bluetooth: L2CAP socket layer initialized
[    6.780151] Bluetooth: SCO (Voice Link) ver 0.6
[    6.780181] Bluetooth: SCO socket layer initialized
[    6.780670] Bluetooth: RFCOMM TTY layer initialized
[    6.780761] Bluetooth: RFCOMM socket layer initialized
[    6.780822] Bluetooth: RFCOMM ver 1.11
[    6.780853] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    6.780883] Bluetooth: BNEP filters: protocol multicast
[    6.780944] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[    6.781616] clock_late_init() disabled 18 unused clocks
[    6.784393] rs30000048:0da5b528 rs30000048:0da5b528: setting system clock to 2011-12-02 19:16:07 UTC (1322853367)
[    6.784637] Waiting 8sec before mounting root device...
[    6.815216] smem_find(14, 40): wrong size 16424
[    6.815368] smd_alloc_channel() cid=00 size=08192 'SMD_DS'
[    6.816162] smem_find(21, 40): wrong size 16424
[    6.816314] smd_alloc_channel() cid=07 size=08192 'SMD_DATA1'
[    6.816864] smem_find(22, 40): wrong size 16424
[    6.816986] smd_alloc_channel() cid=08 size=08192 'SMD_DATA2'
[    6.817535] smem_find(23, 40): wrong size 16424
[    6.817657] smd_alloc_channel() cid=09 size=08192 'SMD_DATA3'
[    6.818115] smem_find(24, 40): wrong size 16424
[    6.818206] smd_alloc_channel() cid=10 size=08192 'SMD_DATA4'
[    6.822174] trout_sdslot_switchvdd: Setting level to 2950
[    6.865722] msmfb_start_dma 20.507 ms after vsync request
[    6.886077] trout_sdslot_switchvdd: Setting level to 2750
[    7.264617] mmc1: host does not support reading read-only switch. assuming write-enable.
[    7.264953] mmc1: new high speed SDHC card at address b368
[    7.266693] mmcblk0: mmc1:b368 USD   3.75 GiB 
[    7.267883]  mmcblk0: p1
[   14.794342] EXT3-fs: mounted filesystem with writeback data mode.
[   14.794738] VFS: Mounted root (ext3 filesystem) readonly on device 179:1.
[   14.795715] kjournald starting.  Commit interval 5 seconds
[   14.798522] devtmpfs: mounted
[   14.798919] Freeing init memory: 116K
[   15.465820] EXT3 FS on mmcblk0p1, internal journal
[   20.885742] msm72k_udc: OFFLINE -> ONLINE
[   20.886016] hsusb: reset controller
[   20.949157] msm_hsusb_phy_reset: success
[   21.095245] msm72k_udc: ulpi: write 0x40 to 0x31
[   21.095336] msm72k_udc: ulpi: write 0x1d to 0x0d
[   21.095397] msm72k_udc: ulpi: write 0x1d to 0x10
[   21.095428] msm72k_udc: ept #0 out max:64 head:ffa0c000 bit:0
[   21.095489] msm72k_udc: ept #1 out max:512 head:ffa0c080 bit:1
[   21.095550] msm72k_udc: ept #2 out max:512 head:ffa0c100 bit:2
[   21.095581] msm72k_udc: ept #3 out max:512 head:ffa0c180 bit:3
[   21.095642] msm72k_udc: ept #4 out max:512 head:ffa0c200 bit:4
[   21.095672] msm72k_udc: ept #5 out max:512 head:ffa0c280 bit:5
[   21.095733] msm72k_udc: ept #6 out max:512 head:ffa0c300 bit:6
[   21.095764] msm72k_udc: ept #7 out max:512 head:ffa0c380 bit:7
[   21.095794] msm72k_udc: ept #8 out max:512 head:ffa0c400 bit:8
[   21.095855] msm72k_udc: ept #9 out max:512 head:ffa0c480 bit:9
[   21.095886] msm72k_udc: ept #10 out max:512 head:ffa0c500 bit:10
[   21.095916] msm72k_udc: ept #11 out max:512 head:ffa0c580 bit:11
[   21.095977] msm72k_udc: ept #12 out max:512 head:ffa0c600 bit:12
[   21.096008] msm72k_udc: ept #13 out max:512 head:ffa0c680 bit:13
[   21.096069] msm72k_udc: ept #14 out max:512 head:ffa0c700 bit:14
[   21.096099] msm72k_udc: ept #15 out max:512 head:ffa0c780 bit:15
[   21.096130] msm72k_udc: ept #0 in max:64 head:ffa0c040 bit:16
[   21.096191] msm72k_udc: ept #1 in max:512 head:ffa0c0c0 bit:17
[   21.096221] msm72k_udc: ept #2 in max:512 head:ffa0c140 bit:18
[   21.096282] msm72k_udc: ept #3 in max:512 head:ffa0c1c0 bit:19
[   21.096313] msm72k_udc: ept #4 in max:512 head:ffa0c240 bit:20
[   21.096343] msm72k_udc: ept #5 in max:512 head:ffa0c2c0 bit:21
[   21.096405] msm72k_udc: ept #6 in max:512 head:ffa0c340 bit:22
[   21.096435] msm72k_udc: ept #7 in max:512 head:ffa0c3c0 bit:23
[   21.096466] msm72k_udc: ept #8 in max:512 head:ffa0c440 bit:24
[   21.096527] msm72k_udc: ept #9 in max:512 head:ffa0c4c0 bit:25
[   21.096557] msm72k_udc: ept #10 in max:512 head:ffa0c540 bit:26
[   21.096618] msm72k_udc: ept #11 in max:512 head:ffa0c5c0 bit:27
[   21.096649] msm72k_udc: ept #12 in max:512 head:ffa0c640 bit:28
[   21.096679] msm72k_udc: ept #13 in max:512 head:ffa0c6c0 bit:29
[   21.096740] msm72k_udc: ept #14 in max:512 head:ffa0c740 bit:30
[   21.096771] msm72k_udc: ept #15 in max:512 head:ffa0c7c0 bit:31
[   21.096832] usb: notify offline
[   21.096862] msm_hsusb: enable pullup
[   21.099945] msm72k_udc: msm72k_udc: suspend
[   21.201904] msm72k_udc: msm72k_udc: reset
[   21.204223] msm72k_udc: msm72k_udc: portchange USB_SPEED_HIGH
[   21.306976] msm72k_udc: msm72k_udc: reset
[   21.309295] msm72k_udc: msm72k_udc: portchange USB_SPEED_HIGH
[   21.437622] g_ether gadget: high speed config #1: CDC Ethernet (ECM)
[   21.437744] msm72k_udc: ept #2 in max:64 head:ffa0c140 bit:18
[   21.440521] msm72k_udc: ept #1 in max:512 head:ffa0c0c0 bit:17
[   21.440643] msm72k_udc: ept #1 out max:512 head:ffa0c080 bit:1
[   25.525268] cfg80211: Calling CRDA to update world regulatory domain
[   36.945068] usb0: no IPv6 routers present


USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.3  0.5   1408   568 ?        Ss   19:16   0:00 init [5]  
root         2  0.0  0.0      0     0 ?        S    19:16   0:00 [kthreadd]
root         3  0.0  0.0      0     0 ?        S    19:16   0:00 [ksoftirqd/0]
root         4  0.0  0.0      0     0 ?        S    19:16   0:00 [events/0]
root         5  0.0  0.0      0     0 ?        S    19:16   0:00 [khelper]
root         6  0.0  0.0      0     0 ?        S    19:16   0:00 [async/mgr]
root         7  0.0  0.0      0     0 ?        S    19:16   0:00 [suspend]
root         8  0.0  0.0      0     0 ?        S    19:16   0:00 [sync_supers]
root         9  0.0  0.0      0     0 ?        S    19:16   0:00 [bdi-default]
root        10  0.0  0.0      0     0 ?        S    19:16   0:00 [kblockd/0]
root        11  0.0  0.0      0     0 ?        S    19:16   0:00 [kseriod]
root        12  0.0  0.0      0     0 ?        S    19:16   0:00 [kmmcd]
root        13  0.0  0.0      0     0 ?        S    19:16   0:00 [bluetooth]
root        14  0.0  0.0      0     0 ?        S    19:16   0:00 [kondemand/0]
root        15  0.0  0.0      0     0 ?        S    19:16   0:00 [qmi]
root        16  0.0  0.0      0     0 ?        D    19:16   0:00 [rpcrouter]
root        17  0.0  0.0      0     0 ?        S    19:16   0:00 [detection/0]
root        18  0.0  0.0      0     0 ?        S    19:16   0:00 [krpcserversd]
root        19  0.0  0.0      0     0 ?        S    19:16   0:00 [kswapd0]
root        20  0.0  0.0      0     0 ?        S    19:16   0:00 [aio/0]
root        21  0.0  0.0      0     0 ?        S    19:16   0:00 [crypto/0]
root        30  0.0  0.0      0     0 ?        S    19:16   0:00 [kadspd]
root        32  0.0  0.0      0     0 ?        S    19:16   0:00 [panel_on/0]
root        33  0.0  0.0      0     0 ?        D    19:16   0:00 [msmfb_refreshd]
root        34  0.0  0.0      0     0 ?        S    19:16   0:00 [msm_serial_hs]
root        35  0.0  0.0      0     0 ?        S    19:16   0:00 [mtdblockd]
root        36  0.0  0.0      0     0 ?        S    19:16   0:00 [rmnet/0]
root        37  0.0  0.0      0     0 ?        S    19:16   0:00 [synaptics_wq]
root        38  0.0  0.0      0     0 ?        S    19:16   0:00 [kstriped]
root        39  0.0  0.0      0     0 ?        S    19:16   0:00 [kconservative/0]
root        40  0.0  0.0      0     0 ?        S<   19:16   0:00 [krfcommd]
root        41  2.5  0.0      0     0 ?        S    19:16   0:02 [mmcqd]
root        42  0.2  0.0      0     0 ?        S    19:16   0:00 [kjournald]
root        80  0.0  0.0      0     0 ?        S    19:16   0:00 [flush-179:0]
root        81  0.5  0.6   1812   676 ?        S<s  19:16   0:00 /sbin/udevd -d
root       156  0.0  0.6   1808   672 ?        S<   19:16   0:00 /sbin/udevd -d
root       159  0.0  0.5   1808   620 ?        S<   19:16   0:00 /sbin/udevd -d
44         593  0.3  0.8   2296   888 ?        Ss   19:16   0:00 /usr/bin/dbus-daemon --system
root       603  0.0  0.7   3664   836 ?        Ss   19:17   0:00 /usr/sbin/sshd
nobody     607  0.0  0.5   2104   640 ?        S    19:17   0:00 /usr/bin/dnsmasq -7 /etc/dnsmasq.d
root       610  0.1  0.6   2712   692 ?        Ss   19:17   0:00 /sbin/syslogd -n -C64 -m 20
root       612  0.1  0.5   2648   596 ?        Ss   19:17   0:00 /sbin/klogd -n
root       615 39.4 11.7  25812 12624 ?        Ss   19:17   0:21 python /usr/bin/frameworkd
root       618  0.1  1.4   3808  1540 ?        Ss   19:17   0:00 /usr/sbin/fso-gpsd -S localhost gpsd -P /var/run/fso-gpsd.pid
root       628  0.0  0.4   1660   528 tty1     Ss+  19:17   0:00 /sbin/getty 38400 tty1
root       631  2.5  2.9  15488  3204 ?        Sl   19:17   0:00 /usr/sbin/fsousaged
root       633  3.3  1.6   3748  1800 ?        Ss   19:17   0:00 sshd: root@pts/0 
root       635  1.4  0.7   2824   824 pts/0    Ss   19:17   0:00 -sh
root       637  0.0  0.8   2064   888 pts/0    R+   19:18   0:00 ps aux

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0 usb0
0.0.0.0         192.168.0.200   0.0.0.0         UG    8      0        0 usb0


2011.12.02 19:17:11.199 root                 INFO     Installprefix is /usr
2011.12.02 19:17:11.215 root                 INFO     Etc directory is /etc/freesmartphone
2011.12.02 19:17:14.006 frameworkd.subsystem INFO     subsystem frameworkd took 0.88 seconds to startup
2011.12.02 19:17:14.058 frameworkd.controller INFO     skipping subsystem ogsmd as requested via config file.
2011.12.02 19:17:14.066 frameworkd.controller INFO     skipping subsystem onetworkd as requested via config file.
2011.12.02 19:17:14.075 frameworkd.controller INFO     launching internal subsystem testing
2011.12.02 19:17:14.105 frameworkd.subsystem INFO     Scanned subsystem via method 'auto', result is ['__init__.py', 'testing.py', 'testing.pyo', '__init__.pyo']
2011.12.02 19:17:14.544 testing              INFO     Resource 0.0.0 at /org/freesmartphone/Testing initialized.
2011.12.02 19:17:14.552 frameworkd.subsystem INFO     subsystem testing took 0.47 seconds to startup
2011.12.02 19:17:14.560 frameworkd.controller INFO     skipping subsystem ophoned as requested via config file.
2011.12.02 19:17:14.568 frameworkd.controller INFO     skipping subsystem odeviced as requested via config file.
2011.12.02 19:17:14.578 frameworkd.controller INFO     launching internal subsystem opreferencesd
2011.12.02 19:17:14.608 frameworkd.subsystem INFO     Scanned subsystem via method 'auto', result is ['__init__.py', 'helpers.py', 'configuration.py', 'service.py', 'configuration.pyo', 'schema.pyo', 'opreferences.pyo', 'opreferences.py', 'service.pyo', 'helpers.pyo', '__init__.pyo', 'schema.py']
2011.12.02 19:17:21.363 opreferencesd        INFO     PreferencesManager 0.2.0 initialized. Serving org.freesmartphone.Preferences at /org/freesmartphone/Preferences
2011.12.02 19:17:21.369 opreferencesd        INFO      ::: using schema path : /etc/freesmartphone/opreferences/schema
2011.12.02 19:17:21.374 opreferencesd        INFO      ::: using conf path : /etc/freesmartphone/opreferences/conf
2011.12.02 19:17:21.387 opreferencesd        INFO      ::: services : ['phone', 'rules', 'profiles']
2011.12.02 19:17:21.399 frameworkd.subsystem INFO     subsystem opreferencesd took 6.81 seconds to startup
2011.12.02 19:17:21.408 frameworkd.controller INFO     launching internal subsystem oeventsd
2011.12.02 19:17:21.439 frameworkd.subsystem INFO     Scanned subsystem via method 'auto', result is ['fso_actions.py', '__init__.py', 'parser.pyo', 'leds_actions.pyo', 'filter.pyo', 'rule.pyo', 'action.py', 'fso_triggers.py', 'fso_triggers.pyo', 'oevents.py', 'trigger.py', 'leds_actions.py', 'action.pyo', 'filter.py', 'fso_actions.pyo', 'oevents.pyo', 'rule.py', 'parser.py', 'trigger.pyo', '__init__.pyo']
2011.12.02 19:17:25.335 oeventsd             INFO     EventsManager 0.3.1 initialized. Serving org.freesmartphone.Events at /org/freesmartphone/Events
2011.12.02 19:17:25.584 oeventsd             INFO     Created new rule : on IncomingMessage if And() then MessageToneAction()
2011.12.02 19:17:25.651 oeventsd             INFO     Created new rule : While CallListContains(INCOMING) if ~(CallListContains(ACTIVE)) then [RingToneAction(), CommandAction(xset -display localhost:0 s reset, {}), SetLed(green, blink), OccupyResource(Display)]
2011.12.02 19:17:25.693 oeventsd             INFO     Created new rule : While CallStatus if Or(status == OUTGOING,status == ACTIVE) then [OccupyResource(CPU)]
2011.12.02 19:17:25.772 oeventsd             INFO     Created new rule : While CallStatus if And(Or(Or(status == OUTGOING,status == ACTIVE),And(status == INCOMING,CallListContains(ACTIVE))),BTHeadsetIsConnected()) then [SetScenario(gsmbluetooth), BTHeadsetPlaying()]
2011.12.02 19:17:25.805 oeventsd             INFO     Created new rule : While PowerStatus if status == charging then SetLed(blue, light)
2011.12.02 19:17:25.833 oeventsd             INFO     Created new rule : While PowerStatus if ~(status == discharging) then OccupyResource(CPU)
2011.12.02 19:17:25.861 oeventsd             INFO     Created new rule : While PowerStatus if status == critical then SetLed(red, blink)
2011.12.02 19:17:25.888 oeventsd             INFO     Created new rule : While PowerStatus if status == full then SetLed(green, light)
2011.12.02 19:17:25.911 oeventsd             INFO     Created new rule : on PowerStatus if status == empty then CommandAction(poweroff, {})
2011.12.02 19:17:25.943 oeventsd             INFO     Created new rule : on InputTrigger if And(switch == HEADSET,event == pressed) then CommandAction(amixer -d sset "Amp Spk" mute, {})
2011.12.02 19:17:25.977 oeventsd             INFO     Created new rule : on InputTrigger if And(switch == HEADSET,event == released) then CommandAction(amixer -d sset "Amp Spk" unmute, {})
2011.12.02 19:17:26.029 oeventsd             INFO     Created new rule : While IdleState if status == busy then [SetLed(lcd_backlight, light), SetLed(button_backlight, light), SetLed(keyboard_backlight, light)]
2011.12.02 19:17:26.058 oeventsd             INFO     Created new rule : on IdleState if status == idle_dim then [CommandAction(xset -display localhost:0 s blank, {}), CommandAction(xset -display localhost:0 s activate, {})]
2011.12.02 19:17:26.078 oeventsd             INFO     Created new rule : on IdleState if status == suspend then Suspend(())
2011.12.02 19:17:26.138 oeventsd             INFO     Created new rule : on InputTrigger if And(switch == LID,event == pressed) then [SetLed(keyboard_backlight, light), SetLed(button_backlight, light), SetLed(lcd_backlight, light), Debug("Lid Opened")]
2011.12.02 19:17:26.167 frameworkd.subsystem INFO     subsystem oeventsd took 4.75 seconds to startup
2011.12.02 19:17:26.175 frameworkd.controller INFO     skipping subsystem ousaged as requested via config file.
2011.12.02 19:17:26.184 frameworkd.controller INFO     launching internal subsystem opimd
2011.12.02 19:17:26.215 frameworkd.subsystem INFO     Scanned subsystem via method 'auto', result is ['opimd.pyo', 'pimd_notes.pyo', '__init__.py', 'db_upgrade.pyo', 'query_manager.py', 'query_manager.pyo', 'helpers.py', 'domain_manager.py', 'pimd_messages.py', 'pimd_dates.py', 'pimd_dates.pyo', 'pimd_calls.py', 'type_manager.py', 'domain_manager.pyo', 'pimd_tasks.pyo', 'type_manager.pyo', 'pimd_messages.pyo', 'pimd_tasks.py', 'pimd_generic.py', 'pimd_contacts.pyo', 'pimd_calls.pyo', 'db_handler.py', 'helpers.pyo', 'pimd_notes.py', 'db', 'db_upgrade.py', 'opimd.py', 'pimd_generic.pyo', 'db_handler.pyo', 'pimd_contacts.py', '__init__.pyo']
2011.12.02 19:17:30.338 opimd                INFO     Registered domain Contacts
2011.12.02 19:17:32.182 opimd                INFO     Registered domain Calls
2011.12.02 19:17:33.302 opimd                INFO     Registered domain Dates
2011.12.02 19:17:34.484 opimd                INFO     Registered domain Notes
2011.12.02 19:17:35.580 opimd                INFO     Registered domain Tasks
2011.12.02 19:17:37.396 opimd                INFO     FSO-Messages-Handler: Installed signal handlers
2011.12.02 19:17:37.411 opimd                INFO     Registered domain Messages
2011.12.02 19:17:37.465 frameworkd.subsystem INFO     subsystem opimd took 11.27 seconds to startup
2011.12.02 19:17:37.475 frameworkd.controller INFO     launching internal subsystem ogpsd
2011.12.02 19:17:37.506 frameworkd.subsystem INFO     Scanned subsystem via method 'auto', result is ['__init__.py', 'eten.pyo', 'msm.py', 'gpschannel.pyo', 'helpers.py', 'gpsdevice.py', 'om.py', 'eten.py', 'ubx.py', 'om.pyo', 'msm.pyo', 'nmea.py', 'nmea.pyo', 'ubx.pyo', 'helpers.pyo', 'factory.py', 'gpschannel.py', 'factory.pyo', '__init__.pyo', 'gpsdevice.pyo']
2011.12.02 19:17:39.001 ogpsd.gpsdevice      INFO     MSMDevice initialized. Serving org.freedesktop.Gypsy at /org/freedesktop/Gypsy
2011.12.02 19:17:39.014 frameworkd.subsystem INFO     subsystem ogpsd took 1.53 seconds to startup
2011.12.02 19:17:39.023 frameworkd.controller INFO     skipping subsystem otimed as requested via config file.
2011.12.02 19:17:39.052 dbus.proxies         ERROR    Introspect error on org.freesmartphone.ogsmd:/org/freesmartphone/GSM/Device: dbus.exceptions.DBusException: org.freedesktop.DBus.Error.ServiceUnknown: The name org.freesmartphone.ogsmd was not provided by any .service files
2011.12.02 19:17:39.075 frameworkd.controller INFO     ================== mainloop   entered ===================
2011.12.02 19:17:39.081 frameworkd.controller INFO     startup time was 26.02 seconds
2011.12.02 19:17:39.842 oeventsd             INFO     Updating the rules
2011.12.02 19:17:39.848 opreferencesd        INFO     GetService rules
2011.12.02 19:17:40.045 oeventsd.rule        INFO     enable rule : on IncomingMessage if And() then MessageToneAction()
2011.12.02 19:17:40.059 oeventsd.rule        INFO     enable rule : While CallListContains(INCOMING) if ~(CallListContains(ACTIVE)) then [RingToneAction(), CommandAction(xset -display localhost:0 s reset, {}), SetLed(green, blink), OccupyResource(Display)]
2011.12.02 19:17:40.066 oeventsd.rule        INFO     enable rule : CallListContains(INCOMING)
2011.12.02 19:17:40.079 oeventsd.rule        INFO     enable rule : CallListContains(ACTIVE)
2011.12.02 19:17:40.091 oeventsd.rule        INFO     enable rule : While CallStatus if Or(status == OUTGOING,status == ACTIVE) then [OccupyResource(CPU)]
2011.12.02 19:17:40.106 oeventsd.rule        INFO     enable rule : While CallStatus if And(Or(Or(status == OUTGOING,status == ACTIVE),And(status == INCOMING,CallListContains(ACTIVE))),BTHeadsetIsConnected()) then [SetScenario(gsmbluetooth), BTHeadsetPlaying()]
2011.12.02 19:17:40.123 oeventsd.rule        INFO     enable rule : CallListContains(ACTIVE)
2011.12.02 19:17:40.135 oeventsd.rule        INFO     enable rule : BTHeadsetIsConnected()
2011.12.02 19:17:40.148 oeventsd.rule        INFO     enable rule : While PowerStatus if status == charging then SetLed(blue, light)
2011.12.02 19:17:40.161 oeventsd.rule        INFO     enable rule : While PowerStatus if ~(status == discharging) then OccupyResource(CPU)
2011.12.02 19:17:40.174 oeventsd.rule        INFO     enable rule : While PowerStatus if status == critical then SetLed(red, blink)
2011.12.02 19:17:40.188 oeventsd.rule        INFO     enable rule : While PowerStatus if status == full then SetLed(green, light)
2011.12.02 19:17:40.201 oeventsd.rule        INFO     enable rule : on PowerStatus if status == empty then CommandAction(poweroff, {})
2011.12.02 19:17:40.214 oeventsd.rule        INFO     enable rule : on InputTrigger if And(switch == HEADSET,event == pressed) then CommandAction(amixer -d sset "Amp Spk" mute, {})
2011.12.02 19:17:40.228 oeventsd.rule        INFO     enable rule : on InputTrigger if And(switch == HEADSET,event == released) then CommandAction(amixer -d sset "Amp Spk" unmute, {})
2011.12.02 19:17:40.243 oeventsd.rule        INFO     enable rule : While IdleState if status == busy then [SetLed(lcd_backlight, light), SetLed(button_backlight, light), SetLed(keyboard_backlight, light)]
2011.12.02 19:17:40.257 oeventsd.rule        INFO     enable rule : on IdleState if status == idle_dim then [CommandAction(xset -display localhost:0 s blank, {}), CommandAction(xset -display localhost:0 s activate, {})]
2011.12.02 19:17:40.270 oeventsd.rule        INFO     enable rule : on IdleState if status == suspend then Suspend(())
2011.12.02 19:17:40.283 oeventsd.rule        INFO     enable rule : on InputTrigger if And(switch == LID,event == pressed) then [SetLed(keyboard_backlight, light), SetLed(button_backlight, light), SetLed(lcd_backlight, light), Debug("Lid Opened")]
2011.12.02 19:17:40.441 opreferencesd        INFO     GetService phone
2011.12.02 19:17:41.614 opreferencesd        INFO     GetService phone
2011.12.02 19:17:42.428 opreferencesd        INFO     Service phone : can't find key message-length, using default
2011.12.02 19:17:42.441 opreferencesd        INFO     Service phone : can't find key ring-length, using default
2011.12.02 19:17:42.512 frameworkd.resource  INFO     setting resource status for TEST from unknown to disabling
2011.12.02 19:17:42.518 testing              INFO     disabling
2011.12.02 19:17:47.541 frameworkd.resource  INFO     setting resource status for TEST from disabling to disabled
2011.12.02 19:17:47.565 frameworkd.resource  INFO     setting resource status for GPS from unknown to disabling
2011.12.02 19:17:47.580 ogpsd.gpsdevice      INFO     disabling
2011.12.02 19:17:47.587 frameworkd.resource  INFO     setting resource status for GPS from disabling to disabled

2011-12-02T19:17:39.405975Z [INFO]  fsousaged : Binary launched successful (FsoFrameworkFileLogger created as theLogger)
2011-12-02T19:17:39.725036Z [INFO]  LowLevelKernel26 <>: Registering kernel26 low level suspend/resume handling
2011-12-02T19:17:39.726226Z [INFO]  UsageController <0 R>: Ready. Using lowlevel plugin kernel26 to handle suspend/resume
2011-12-02T19:17:39.727050Z [INFO]  fsousaged : loaded 3 plugins
2011-12-02T19:17:39.727294Z [INFO]  fsousaged : fsousaged => mainloop
2011-12-02T19:17:42.314209Z [ERROR] fsousaged : Can't sync dependencies of resource 'TEST': GDBus.Error:org.freedesktop.DBus.Error.UnknownMethod: Traceback (most recent call last):
  File "/usr/lib/python2.6/site-packages/dbus/service.py", line 649, in _message_cb
    (candidate_method, parent_method) = _method_lookup(self, method_name, interface_name)
  File "/usr/lib/python2.6/site-packages/dbus/service.py", line 244, in _method_lookup
    raise UnknownMethodException('%s is not a valid method of interface %s' % (method_name, dbus_interface))
UnknownMethodException: org.freedesktop.DBus.Error.UnknownMethod: Unknown method: GetDependencies is not a valid method of interface org.freesmartphone.Resource

2011-12-02T19:17:42.351532Z [ERROR] fsousaged : Can't sync dependencies of resource 'GPS': GDBus.Error:org.freedesktop.DBus.Error.UnknownMethod: Traceback (most recent call last):
  File "/usr/lib/python2.6/site-packages/dbus/service.py", line 649, in _message_cb
    (candidate_method, parent_method) = _method_lookup(self, method_name, interface_name)
  File "/usr/lib/python2.6/site-packages/dbus/service.py", line 244, in _method_lookup
    raise UnknownMethodException('%s is not a valid method of interface %s' % (method_name, dbus_interface))
UnknownMethodException: org.freedesktop.DBus.Error.UnknownMethod: Unknown method: GetDependencies is not a valid method of interface org.freesmartphone.Resource



--------------050500080000050204070902--
