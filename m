Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USChB-0002Uu-MM
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 22:41:50 +0200
Received: by mail-pa0-f44.google.com with SMTP id bi5so535706pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 13:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=guYnOr8IDeVc9PcxgQKCLzco+uCwMTXP1UZ7oiJDVYE=;
	b=qNYtm5OzERHE51+jvGPc3GqUrl+3OeaUPpTwpfKpkYHZLbGicD60AOGMoWrxF75C11
	htY4zqvDChOr1Z7TEzUSttlonQ6015WW3HmV2oK1Bz+Zwcx5OfAaWUQFqhU6WirI5atg
	+4ymuHyebgW9FvW7Gv8iT5ZvMwFuc2ce/AjXV+ngNt8VFt5k8hMx974JyELrZQMHPpTQ
	cG0DFCeaRTmbFs2RmTvlTHJizW8VU8w5Bp+pHKI78zM4LT43pSAz7zBq1D2w+tolw0PV
	z1wXs0+uCLoNoRUdrvC6AI6o5tTuuWQ4zpvFt8Fj8jvlO3w9AwsUAsZX3jkE2pWiZBZb
	D9PQ==
X-Received: by 10.66.88.105 with SMTP id bf9mr5038445pab.175.1366143849993;
	Tue, 16 Apr 2013 13:24:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id mm9sm3226898pbc.43.2013.04.16.13.24.07
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 13:24:08 -0700 (PDT)
Date: Tue, 16 Apr 2013 22:24:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130416202406.GB29302@jama.dyndns-home.com>
References: <1366065578-27056-1-git-send-email-andrea.adami@gmail.com>
	<20130416200516.GA29302@jama.dyndns-home.com>
MIME-Version: 1.0
In-Reply-To: <20130416200516.GA29302@jama.dyndns-home.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld][PATCH] linux-yocto_3.8: pxamci: Refactor regulator support
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
X-List-Received-Date: Tue, 16 Apr 2013 20:41:58 -0000
X-Groupsio-MsgNum: 44262
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Content-Disposition: inline

--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2013 at 10:05:16PM +0200, Martin Jansa wrote:
> On Tue, Apr 16, 2013 at 12:39:38AM +0200, Andrea Adami wrote:
> > * fix boot from MMC/SD
> > * as seen on https://patchwork.kernel.org/patch/1875561/
>=20
> This time it booted, thanks!

One more request

45M /boot/modules--3.8.4+git0+27b63fdbd25ad1a37bacc05f49a205c150d21779_1199=
8bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1.2-spitz-20130416163203.tgz
and still it doesn't contain any wireless modules

could you enable at least hostap and tkip so that wpa2 works again with
CF wifi? I know I can modify it locally but it sounds useful for
everybody, so I'm not sure why it was disabled (I don't mind if it's not
in spitz's EXTRA_RRECOMMENDS... installing them from feed is easy if you
do it before loosing connectivity)

SHRZ root@zjama ~ $ find /lib/modules/3.4.0/kernel/drivers/net/wireless/
/lib/modules/3.4.0/kernel/drivers/net/wireless/
/lib/modules/3.4.0/kernel/drivers/net/wireless/airo.ko
/lib/modules/3.4.0/kernel/drivers/net/wireless/hostap
/lib/modules/3.4.0/kernel/drivers/net/wireless/hostap/hostap.ko
/lib/modules/3.4.0/kernel/drivers/net/wireless/hostap/hostap_cs.ko
/lib/modules/3.4.0/kernel/drivers/net/wireless/airo_cs.ko
SHRZ root@zjama ~ $ find /lib/modules/3.4.0/kernel/net/wireless/       =20
/lib/modules/3.4.0/kernel/net/wireless/
/lib/modules/3.4.0/kernel/net/wireless/lib80211_crypt_tkip.ko
/lib/modules/3.4.0/kernel/net/wireless/cfg80211.ko
/lib/modules/3.4.0/kernel/net/wireless/lib80211_crypt_wep.ko
/lib/modules/3.4.0/kernel/net/wireless/lib80211.ko
/lib/modules/3.4.0/kernel/net/wireless/lib80211_crypt_ccmp.ko

>=20
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  .../linux/linux-yocto-3.8/akita/akita.scc          |   1 +
> >  recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc |   2 +-
> >  .../linux/linux-yocto-3.8/poodle/poodle.scc        |   1 +
> >  .../linux/linux-yocto-3.8/pxamci-regulator.patch   | 135 +++++++++++++=
++++++++
> >  .../linux/linux-yocto-3.8/spitz/spitz.scc          |   1 +
> >  recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc |   1 +
> >  6 files changed, 140 insertions(+), 1 deletion(-)
> >  create mode 100644 recipes-kernel/linux/linux-yocto-3.8/pxamci-regulat=
or.patch
> >=20
> > diff --git a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc b/rec=
ipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
> > index bad38c4..b40cb7e 100644
> > --- a/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
> > +++ b/recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
> > @@ -8,3 +8,4 @@ include ../zaurus-usb-host.scc
> >  patch sharpsl_param.patch
> >  patch pxa27x-sa1100-rtc.patch
> >  patch spi-pxa2xx-fix-mem.patch
> > +patch pxamci-regulator.patch
> > diff --git a/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc b/recip=
es-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
> > index 99b1d12..a732d5e 100644
> > --- a/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
> > +++ b/recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
> > @@ -5,4 +5,4 @@ include ../zaurus-common.scc
> > =20
> >  patch sharpsl_param.patch
> >  patch spi-pxa2xx-fix-mem.patch
> > -
> > +patch pxamci-regulator.patch
> > diff --git a/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc b/r=
ecipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
> > index 1dd2144..cfe97be 100644
> > --- a/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
> > +++ b/recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
> > @@ -6,3 +6,4 @@ include ../zaurus-common.scc
> >  patch locomo_kbd_tweak-r2.patch
> >  patch sharpsl_param.patch
> >  patch spi-pxa2xx-fix-mem.patch
> > +patch pxamci-regulator.patch
> > diff --git a/recipes-kernel/linux/linux-yocto-3.8/pxamci-regulator.patc=
h b/recipes-kernel/linux/linux-yocto-3.8/pxamci-regulator.patch
> > new file mode 100644
> > index 0000000..8e7c521
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-yocto-3.8/pxamci-regulator.patch
> > @@ -0,0 +1,135 @@
> > +From: Marko Katic <dromede.gmail.com>
> > +
> > +Here's an interesting scenario. The spitz machine has an
> > +Intersil 6271A voltage regulator and an ADS7846 touchscreen
> > +controller.
> > +
> > +The ADS7846 driver _requires_ the use of a voltage regulator
> > +or if not present, CONFIG_REGULATOR_DUMMY should be used for proper op=
eration.
> > +This was made mandatory by the following commit:
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +91143379b01b2020d8878d627ebe9dfb9d6eb4c8
> > +Input: ads7846 - add regulator support
> > +
> > +The ADS7846/TSC2046 touchscreen controllers can (and usually are)
> > +connected to various regulators for power, so add regulator support.
> > +
> > +Valid regulator will now be required, so boards without complete
> > +regulator setup should either disable regulator framework or enable
> > +CONFIG_REGULATOR_DUMMY.
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The ADS7846 in spitz machines is not connected to
> > +any power regulator so it needs CONFIG_REGULATOR_DUMMY enabled.
> > +So to support both the Intersil 6271A regulator and
> > +the ADS7846 controller, CONFIG_REGULATOR and CONFIG_REGULATOR_DUMMY ha=
ve
> > +to be defined.
> > +
> > +However, enabling CONFIG_REGULATOR and CONFIG_REGULATOR_DUMMY
> > +will break pxamci driver and cause the following error output:
> > +
> > +pxa2xx-mci.0 supply vmmc not found, using dummy regulator
> > +pxa2xx-mci pxa2xx-mci.0: ocr_mask/setpower will not be used
> > +pxa2xx-mci pxa2xx-mci.0: could not set regulator OCR (-22)
> > +pxa2xx-mci pxa2xx-mci.0: unable to set power
> > +pxa2xx-mci pxa2xx-mci.0: could not set regulator OCR (-22)
> > +pxa2xx-mci pxa2xx-mci.0: unable to set power
> > +
> > +Above failures occur in two functions;
> > +pxamci_init_ocr() and pxamci_set_power().
> > +
> > +Regulator support in pxamci_init_ocr() is not
> > +written with the existence of the dummy regulator driver in
> > +mind. It does not check the return value of mmc_regulator_get_ocrmask()
> > +and it will only fall back to platform data if no regulator was found.
> > +
> > +pxamci_set_power() fails because it does not even try to fall back
> > +to platform data if mmc_regulator_set_ocr() fails. It
> > +expects a proper regulator or no regulator at all. It will
> > +only fall back to platform data if no regulator was found. It does
> > +not properly handle the possible existence of the dummy regulator.
> > +
> > +This patch refactors pxamci_init_ocr() and  pxamci_set_power() regulat=
or
> > +support to be more modular, to do more checks and to always fall back
> > +to platform data.
> > +
> > +Signed-off-by: Marko Katic <dromede@gmail.com>
> > +---
> > + drivers/mmc/host/pxamci.c |   37 ++++++++++++++++++++++++-------------
> > + 1 file changed, 24 insertions(+), 13 deletions(-)
> > +
> > +diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
> > +index 2b2f65a..6ec1566 100644
> > +--- a/drivers/mmc/host/pxamci.c
> > ++++ b/drivers/mmc/host/pxamci.c
> > +@@ -83,18 +83,24 @@ struct pxamci_host {
> > + static inline void pxamci_init_ocr(struct pxamci_host *host)
> > + {
> > + #ifdef CONFIG_REGULATOR
> > ++	int ocr_mask;
> > + 	host->vcc =3D regulator_get(mmc_dev(host->mmc), "vmmc");
> > +=20
> > + 	if (IS_ERR(host->vcc))
> > + 		host->vcc =3D NULL;
> > + 	else {
> > +-		host->mmc->ocr_avail =3D mmc_regulator_get_ocrmask(host->vcc);
> > +-		if (host->pdata && host->pdata->ocr_mask)
> > ++		ocr_mask =3D mmc_regulator_get_ocrmask(host->vcc);
> > ++		if (ocr_mask <=3D 0)
> > ++			host->mmc->ocr_avail =3D 0;
> > ++		else
> > ++			host->mmc->ocr_avail =3D ocr_mask;
> > ++
> > ++		if (host->pdata && host->pdata->ocr_mask && host->mmc->ocr_avail)
> > + 			dev_warn(mmc_dev(host->mmc),
> > + 				"ocr_mask/setpower will not be used\n");
> > + 	}
> > + #endif
> > +-	if (host->vcc =3D=3D NULL) {
> > ++	if (host->vcc =3D=3D NULL || host->mmc->ocr_avail =3D=3D 0) {
> > + 		/* fall-back to platform data */
> > + 		host->mmc->ocr_avail =3D host->pdata ?
> > + 			host->pdata->ocr_mask :
> > +@@ -108,26 +114,31 @@ static inline int pxamci_set_power(struct pxamci=
_host *host,
> > + {
> > + 	int on;
> > +=20
> > ++#ifdef CONFIG_REGULATOR
> > + 	if (host->vcc) {
> > +-		int ret;
> > ++		int ret =3D 0;
> > +=20
> > +-		if (power_mode =3D=3D MMC_POWER_UP) {
> > ++		if (power_mode =3D=3D MMC_POWER_UP)
> > + 			ret =3D mmc_regulator_set_ocr(host->mmc, host->vcc, vdd);
> > +-			if (ret)
> > +-				return ret;
> > +-		} else if (power_mode =3D=3D MMC_POWER_OFF) {
> > ++
> > ++		if (power_mode =3D=3D MMC_POWER_OFF)
> > + 			ret =3D mmc_regulator_set_ocr(host->mmc, host->vcc, 0);
> > +-			if (ret)
> > +-				return ret;
> > +-		}
> > ++
> > ++		if (ret =3D=3D 0)
> > ++			return 0;
> > ++		else
> > ++			dev_warn(mmc_dev(host->mmc),
> > ++			 "mmc_regulator_set_ocr failed, falling back to platform data\n");
> > + 	}
> > +-	if (!host->vcc && host->pdata &&
> > ++#endif
> > ++
> > ++	if (host->pdata &&
> > + 	    gpio_is_valid(host->pdata->gpio_power)) {
> > + 		on =3D ((1 << vdd) & host->pdata->ocr_mask);
> > + 		gpio_set_value(host->pdata->gpio_power,
> > + 			       !!on ^ host->pdata->gpio_power_invert);
> > + 	}
> > +-	if (!host->vcc && host->pdata && host->pdata->setpower)
> > ++	if (host->pdata && host->pdata->setpower)
> > + 		host->pdata->setpower(mmc_dev(host->mmc), vdd);
> > +=20
> > + 	return 0;
> > diff --git a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc b/rec=
ipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
> > index f9f9381..be8c470 100644
> > --- a/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
> > +++ b/recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
> > @@ -7,3 +7,4 @@ include ../zaurus-usb-host.scc
> >  patch sharpsl_param.patch
> >  patch pxa27x-sa1100-rtc.patch
> >  patch spi-pxa2xx-fix-mem.patch
> > +patch pxamci-regulator.patch
> > diff --git a/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc b/recip=
es-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
> > index d1f0dbd..b4d6e8e 100644
> > --- a/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
> > +++ b/recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
> > @@ -6,3 +6,4 @@ include ../zaurus-usb-host.scc
> > =20
> >  patch sharpsl_param.patch
> >  patch spi-pxa2xx-fix-mem.patch
> > +patch pxamci-regulator.patch
> > --=20
> > 1.8.1.5
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

> Uncompressing Linux... done, booting the kernel.
> Booting Linux on physical CPU 0x0
> Initializing cgroup subsys cpuset
> Initializing cgroup subsys cpu
> Linux version 3.8.4-yocto-standard (bitbake@jama) (gcc version 4.7.2 (GCC=
) ) #1 PREEMPT Tue Apr 16 18:41:39 CEST 2013
> CPU: XScale-PXA270 [69054114] revision 4 (ARMv5TE), cr=3D0000397f
> CPU: VIVT data cache, VIVT instruction cache
> Machine: SHARP Spitz
> Memory policy: ECC disabled, Data cache writeback
> BUG: mapping for 0x00000000 at 0xff000000 out of vmalloc space
> Run Mode clock: 208.00MHz (*16)
> Turbo Mode clock: 416.00MHz (*2.0, active)
> Memory clock: 208.00MHz (/2)
> System bus clock: 208.00MHz
> On node 0 totalpages: 16384
> free_area_init_node: node 0, pgdat c08bdbd8, node_mem_map c0952000
>   Normal zone: 128 pages used for memmap
>   Normal zone: 0 pages reserved
>   Normal zone: 16256 pages, LIFO batch:3
> pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
> pcpu-alloc: [0] 0
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
> Kernel command line: root=3D/dev/mmcblk0p1 rootfstype=3Dext2 rootwait mtd=
parts=3Dsharpsl-nand:7168k(smf),5120k(root),-(home) fbcon=3Drotate:1 consol=
e=3DttyS0,115200n8 console=3Dtty1 fbcon=3Drotate:1 debug
> PID hash table entries: 256 (order: -2, 1024 bytes)
> Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
> Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
> __ex_table already sorted, skipping sort
> allocated 131072 bytes of page_cgroup
> please try 'cgroup_disable=3Dmemory' option if you don't want memory cgro=
ups
> Memory: 64MB =3D 64MB total
> Memory: 55260k/55260k available, 10276k reserved, 0K highmem
> Virtual kernel memory layout:
>     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
>     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
>     vmalloc : 0xc4800000 - 0xff000000   ( 936 MB)
>     lowmem  : 0xc0000000 - 0xc4000000   (  64 MB)
>     modules : 0xbf000000 - 0xc0000000   (  16 MB)
>       .text : 0xc0008000 - 0xc07dd498   (8022 kB)
>       .init : 0xc07de000 - 0xc086fefc   ( 584 kB)
>       .data : 0xc0870000 - 0xc08c0168   ( 321 kB)
>        .bss : 0xc08c0168 - 0xc095131c   ( 581 kB)
> NR_IRQS:16 nr_irqs:288 288
> sched_clock: 32 bits at 3250kHz, resolution 307ns, wraps every 1321528ms
> Console: colour dummy device 80x30
> console [tty1] enabled
> Calibrating delay loop... 415.33 BogoMIPS (lpj=3D2076672)
> pid_max: default: 32768 minimum: 301
> Security Framework initialized
> Mount-cache hash table entries: 512
> Initializing cgroup subsys debug
> Initializing cgroup subsys cpuacct
> Initializing cgroup subsys memory
> Initializing cgroup subsys devices
> Initializing cgroup subsys freezer
> Initializing cgroup subsys net_cls
> Initializing cgroup subsys blkio
> CPU: Testing write buffer coherency: ok
> ftrace: allocating 21198 entries in 63 pages
> Setting up static identity map for 0xa05d2660 - 0xa05d26cc
> devtmpfs: initialized
> regulator-dummy: no parameters
> NET: Registered protocol family 16
> DMA: preallocated 256 KiB pool for atomic coherent allocations
> Sharp Scoop Device found at 0x10800000 -> 0xc4846000
> Sharp Scoop Device found at 0x08800040 -> 0xc4848040
> bio: create slab <bio-0> at 0
> SCSI subsystem initialized
> libata version 3.00 loaded.
> pxa2xx-spi pxa2xx-spi.2: master is unqueued, this is deprecated
> usbcore: registered new interface driver usbfs
> usbcore: registered new interface driver hub
> usbcore: registered new device driver usb
> I2C: i2c-0: PXA I2C adapter
> I2C: i2c-1: PXA I2C adapter
> Switching to clocksource oscr0
> NET: Registered protocol family 2
> TCP established hash table entries: 512 (order: 0, 4096 bytes)
> TCP bind hash table entries: 512 (order: -1, 2048 bytes)
> TCP: Hash tables configured (established 512 bind 512)
> TCP: reno registered
> UDP hash table entries: 256 (order: 0, 4096 bytes)
> UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
> NET: Registered protocol family 1
> RPC: Registered named UNIX socket transport module.
> RPC: Registered udp transport module.
> RPC: Registered tcp transport module.
> RPC: Registered tcp NFSv4.1 backchannel transport module.
> CPU PMU: probing PMU on CPU 0
> hw perfevents: enabled with xscale2 PMU driver, 5 counters available
> NFS: Registering the id_resolver key type
> Key type id_resolver registered
> Key type id_legacy registered
> jffs2: version 2.2. (NAND) (SUMMARY)  =A9 2001-2006 Red Hat, Inc.
> Btrfs loaded
> yaffs: yaffs built Apr 16 2013 18:39:47 Installing.
> msgmni has been set to 107
> Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
> io scheduler noop registered
> io scheduler deadline registered
> io scheduler cfq registered (default)
> Console: switching to colour frame buffer device 80x30
> PXA Overlay driver loaded successfully!
> pxa2xx-uart.0: ttyS0 at MMIO 0x40100000 (irq =3D 22) is a UART1
> pcmcia_socket pcmcia_socket1: pccard: PCMCIA card inserted into slot 1
> pcmcia 1.0: pcmcia: registering new device pcmcia1.0 (IRQ: 202)
> pcmcia_socket pcmcia_socket0: pccard: PCMCIA card inserted into slot 0
> pcmcia 0.0: pcmcia: registering new device pcmcia0.0 (IRQ: 201)
> console [ttyS0] enabled
> pxa2xx-uart.1: ttyS1 at MMIO 0x40200000 (irq =3D 21) is a UART2
> pxa2xx-uart.2: ttyS2 at MMIO 0x40700000 (irq =3D 20) is a UART3
> brd: module loaded
> scsi0 : pata_pcmcia
> ata1: PATA max PIO0 cmd 0xc4880000 ctl 0xc488000e irq 202
> physmap platform flash device: 00800000 at 00000000
> Creating 1 MTD partitions on "physmap-flash":
> 0x000000140000-0x000000800000 : "Boot PROM Filesystem"
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x73 (Samsung NAND 16MiB 3,3=
V 8-bit), 16MiB, page size: 512, OOB size: 16
> Scanning device for bad blocks
> 3 cmdlinepart partitions found on MTD device sharpsl-nand
> Creating 3 MTD partitions on "sharpsl-nand":
> 0x000000000000-0x000000700000 : "smf"
> 0x000000700000-0x000000c00000 : "root"
> 0x000000c00000-0x000001000000 : "home"
> usbcore: registered new interface driver kaweth
> pegasus: v0.6.14 (2006/09/27), Pegasus/Pegasus II USB Ethernet driver
> usbcore: registered new interface driver pegasus
> usbcore: registered new interface driver asix
> usbcore: registered new interface driver cdc_ether
> usbcore: registered new interface driver dm9601
> usbcore: registered new interface driver smsc75xx
> usbcore: registered new interface driver smsc95xx
> usbcore: registered new interface driver net1080
> usbcore: registered new interface driver cdc_subset
> usbcore: registered new interface driver zaurus
> usbcore: registered new interface driver MOSCHIP usb-ethernet driver
> usbcore: registered new interface driver int51x1
> ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> ata1.00: CFA: HMS360404D5CF00, DN4SCA2A, max PIO4
> ata1.00: 7999488 sectors, multi 0: LBA
> ohci_hcd: block sizes: ed 64 td 64
> In ohci_hcd_pxa27x_drv_probe
> pxa27x-ohci pxa27x-ohci: PXA27x OHCI
> pxa27x-ohci pxa27x-ohci: new USB bus registered, assigned bus number 1
> pxa27x-ohci pxa27x-ohci: irq 3, io mem 0x4c000000
> pxa27x-ohci pxa27x-ohci: ohci_pxa27x_start, ohci:c3aa38d8
> pxa27x-ohci pxa27x-ohci: created debug files
> pxa27x-ohci pxa27x-ohci: OHCI controller state
> pxa27x-ohci pxa27x-ohci: OHCI 1.0, NO legacy support registers, rh state =
running
> pxa27x-ohci pxa27x-ohci: control 0x083 HCFS=3Doperational CBSR=3D3
> pxa27x-ohci pxa27x-ohci: cmdstatus 0x00000 SOC=3D0
> pxa27x-ohci pxa27x-ohci: intrstatus 0x00000004 SF
> pxa27x-ohci pxa27x-ohci: intrenable 0x8000005a MIE RHSC UE RD WDH
> pxa27x-ohci pxa27x-ohci: hcca frame #002b
> pxa27x-ohci pxa27x-ohci: roothub.a 04001202 POTPGT=3D4 NOCP NPS NDP=3D2(3)
> pxa27x-ohci pxa27x-ohci: roothub.b 00000000 PPCM=3D0000 DR=3D0000
> pxa27x-ohci pxa27x-ohci: roothub.status 00008000 DRWE
> pxa27x-ohci pxa27x-ohci: roothub.portstatus [0] 0x00000100 PPS
> pxa27x-ohci pxa27x-ohci: roothub.portstatus [1] 0x00000100 PPS
> pxa27x-ohci pxa27x-ohci: roothub.portstatus [2] 0x00000100 PPS
> usb usb1: default language 0x0409
> usb usb1: udev 1, busnum 1, minor =3D 0
> usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0001
> usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
> usb usb1: Product: PXA27x OHCI
> usb usb1: Manufacturer: Linux 3.8.4-yocto-standard ohci_hcd
> usb usb1: SerialNumber: pxa27x
> usb usb1: usb_probe_device
> usb usb1: configuration #1 chosen from 1 choice
> usb usb1: adding 1-0:1.0 (config #1, interface 0)
> hub 1-0:1.0: usb_probe_interface
> hub 1-0:1.0: usb_probe_interface - got id
> hub 1-0:1.0: USB hub found
> hub 1-0:1.0: 3 ports detected
> hub 1-0:1.0: standalone hub
> hub 1-0:1.0: no power switching (usb 1.0)
> hub 1-0:1.0: no over-current protection
> hub 1-0:1.0: power on to power good time: 8ms
> hub 1-0:1.0: 150mA bus power budget for each child
> hub 1-0:1.0: local power source is good
> hub 1-0:1.0: trying to enable port power on non-switchable hub
> mousedev: PS/2 mouse device common for all mice
> input: matrix-keypad as /devices/platform/matrix-keypad/input/input0
> spi2.0 supply vcc not found, using dummy regulator
> ads7846 spi2.0: touchscreen, irq 107
> input: ADS7846 Touchscreen as /devices/platform/pxa2xx-spi.2/spi_master/s=
pi2/spi2.0/input/input1
> sa1100-rtc sa1100-rtc: rtc core: registered sa1100-rtc as rtc0
> APM Battery Driver
> md: linear personality registered for level -1
> md: raid0 personality registered for level 0
> md: raid1 personality registered for level 1
> md: raid10 personality registered for level 10
> md: multipath personality registered for level -4
> md: faulty personality registered for level -5
> device-mapper: ioctl: 4.23.1-ioctl (2012-12-18) initialised: dm-devel@red=
hat.com
> pxa2xx-mci.0 supply vmmc not found, using dummy regulator
> hub 1-0:1.0: state 7 ports 3 chg 0000 evt 0000
> pxa2xx-mci pxa2xx-mci.0: could not set regulator OCR (-22)
> pxa2xx-mci pxa2xx-mci.0: mmc_regulator_set_ocr failed, falling back to pl=
atform data
> TCP: cubic registered
> NET: Registered protocol family 10
> sit: IPv6 over IPv4 tunneling driver
> NET: Registered protocol family 17
> Key type dns_resolver registered
> XScale iWMMXt coprocessor detected.
> console [netcon0] enabled
> netconsole: network logging started
> input: gpio-keys as /devices/platform/gpio-keys/input/input2
> sa1100-rtc sa1100-rtc: setting system clock to 1970-01-05 09:54:27 UTC (3=
81267)
> mmc0: new SD card at address 1234
> mmcblk0: mmc0:1234 SA01G 972 MiB
>  mmcblk0: p1
> ata1.00: configured for PIO0
> scsi 0:0:0:0: Direct-Access     ATA      HMS360404D5CF00  DN4S PQ: 0 ANSI=
: 5
> sd 0:0:0:0: [sda] 7999488 512-byte logical blocks: (4.09 GB/3.81 GiB)
> sd 0:0:0:0: [sda] Write Protect is off
> sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
> sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't sup=
port DPO or FUA
>  sda: sda1 sda2 sda3
> sd 0:0:0:0: [sda] Attached SCSI disk
> md: Waiting for all devices to be available before autodetect
> md: If you don't use raid, use raid=3Dnoautodetect
> md: Autodetecting RAID arrays.
> md: Scanned 0 and added 0 devices.
> md: autorun ...
> md: ... autorun DONE.
> VFS: Mounted root (ext2 filesystem) readonly on device 179:1.
> devtmpfs: mounted
> Freeing init memory: 580K
> systemd[1]: systemd 199 running in system mode. (+PAM -LIBWRAP -AUDIT -SE=
LINUX +IMA +SYSVINIT -LIBCRYPTSETUP -GCRYPT +ACL +XZ)
> systemd[1]: Set hostname to <zjama>.
> systemd[1]: Initializing machine ID from D-Bus machine ID.
> systemd[1]: Installed transient /etc/machine-id file.
> systemd[1]: Cannot add dependency job for unit fsosystemd.service, ignori=
ng: Unit fsosystemd.service failed to load: No such file or directory. See =
system logs and 'systemctl status fsosystemd.service' for details.
> systemd[1]: Cannot add dependency job for unit fso-gpsd.service, ignoring=
: Unit fso-gpsd.service failed to load: No such file or directory. See syst=
em logs and 'systemctl status fso-gpsd.service' for details.
> systemd[1]: Expecting device dev-ttyS0.device...
> systemd[1]: Starting Forward Password Requests to Wall Directory Watch.
> systemd[1]: Started Forward Password Requests to Wall Directory Watch.
> systemd[1]: Starting Syslog Socket.
> systemd[1]: Listening on Syslog Socket.
> systemd[1]: Starting Remote File Systems.
> systemd[1]: Reached target Remote File Systems.
> systemd[1]: Starting /dev/initctl Compatibility Named Pipe.
> systemd[1]: Listening on /dev/initctl Compatibility Named Pipe.
> systemd[1]: Starting Delayed Shutdown Socket.
> systemd[1]: Listening on Delayed Shutdown Socket.
> systemd[1]: Starting udev Kernel Socket.
> systemd[1]: Listening on udev Kernel Socket.
> systemd[1]: Starting udev Control Socket.
> systemd[1]: Listening on udev Control Socket.
> systemd[1]: Starting Dispatch Password Requests to Console Directory Watc=
h.
> systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
> systemd[1]: Starting Paths.
> systemd[1]: Reached target Paths.
> systemd[1]: Starting Journal Socket.
> systemd[1]: Listening on Journal Socket.
> systemd[1]: Starting Apply Kernel Variables...
> systemd[1]: Starting Load Kernel Modules...
> systemd[1]: Mounting POSIX Message Queue File System...
> systemd[1]: Mounted Huge Pages File System.
> systemd[1]: Started Machine ID first boot configure.
> systemd[1]: Mounting Debug File System...
> systemd[1]: Starting udev Kernel Device Manager...
> systemd[1]: Starting udev Coldplug all Devices...
> systemd[1]: Starting Journal Service...
> systemd[1]: Started Journal Service.
> systemd[1]: Starting Arbitrary Executable File Formats File System Automo=
unt Point.
> systemd[1]: Set up automount Arbitrary Executable File Formats File Syste=
m Automount Point.
> systemd[1]: Started Set Up Additional Binary Formats.
> systemd[1]: Expecting device dev-sda2.device...
> systemd[1]: Starting File System Check on Root Device...
> systemd[1]: Mounting Temporary Directory...
> systemd[1]: tmp.mount: Directory /tmp to mount over is not empty, mountin=
g anyway.
> systemd[1]: Expecting device dev-sda3.device...
> systemd[1]: Started Apply Kernel Variables.
> systemd[1]: Started Load Kernel Modules.
> systemd[1]: Mounted Configuration File System.
> systemd[1]: Mounted FUSE Control File System.
> systemd-udevd[67]: starting version 199
> EXT4-fs (sda): VFS: Can't find ext4 filesystem
> EXT3-fs (sda): error: can't find ext3 filesystem on dev sda.
> EXT2-fs (sda): error: can't find an ext2 filesystem on dev sda.
> cramfs: wrong magic
> yaffs: dev is 8388608 name is "sda" rw
> yaffs: passed flags ""
> yaffs: yaffs: Attempting MTD mount of 8.0,"sda"
> yaffs: MTD device does not support have the right page sizes
> yaffs: dev is 8388608 name is "sda" rw
> yaffs: passed flags ""
> yaffs: yaffs: Attempting MTD mount of 8.0,"sda"
> yaffs: MTD device does not have the right page sizes
> kjournald starting.  Commit interval 5 seconds
> EXT3-fs (sda3): warning: mounting unchecked fs, running e2fsck is recomme=
nded
> EXT3-fs (sda3): using internal journal
> EXT3-fs (sda3): mounted filesystem with ordered data mode
> systemd-journald[70]: File /var/log/journal/cd7935a1120c614ccc9869e500000=
4b2/system.journal corrupted or uncleanly shut down, renaming and replacing.
> kjournald starting.  Commit interval 5 seconds
> EXT3-fs (sda1): warning: maximal mount count reached, running e2fsck is r=
ecommended
> EXT3-fs (sda1): using internal journal
> EXT3-fs (sda1): mounted filesystem with ordered data mode
> Adding 125492k swap on /dev/sda2.  Priority:-1 extents:1 across:125492k
>=20
> shr 20130412 zjama ttyS0
>=20
> zjama login: root
> Password:
> Last login: Mon Apr 15 18:50:56 UTC 2013 on ttyS0
>  ____  _  _  ____        ___  __  ____  ____
> / ___)/ )( \(  _ \ ___  / __)/  \(  _ \(  __)
> \___ \) __ ( )   /(___)( (__(  O ))   / ) _)
> (____/\_)(_/(__\_)      \___)\__/(__\_)(____)
> uname SHRZ root@zjama ~ $ uname -a
> Linux zjama 3.8.4-yocto-standard #1 PREEMPT Tue Apr 16 18:41:39 CEST 2013=
 armv5tel GNU/Linux
> SHRZ root@zjama ~ $




--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFts2YACgkQN1Ujt2V2gBzROACeMYKpdNNmclKOwbokjABfEK4i
rOkAnAyihsKBoXkHdOyf16QoV9JjkwYG
=NM/7
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
