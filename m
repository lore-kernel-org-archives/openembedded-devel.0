Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1LtgXI-0001uy-EK
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 13:11:13 +0200
Received: by gxk18 with SMTP id 18so5203097gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2009 04:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mkrf9hMw2raOjLVE2okqjlncDW588lehSpgF0wFZhW0=;
	b=tGy8vEy99oT3y+rnmqY/wc1SeIhFQA16qZjXOSk0STdpo3Gc3POpCAr8xTNfjsQqVD
	fNEklHIgzkhMiDDXg8ak0CZFndv0BuGDbf2cElRMA057Cr9AaiMlQuQdSMSwiKicG7kd
	BJRZRrypjgwGS0X0Jeh5M/O6mTiMyH0LUAVvw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dQiL2CWe1Dfi+k4zYhrSdCnmOTk4ciBPIy74T7owCa4aLivTxfd334oI2gdNMUoLjA
	e2dY3eBmE3f5pzpi2E9ZUxWKJj3m39VKbrXkXq8mrUoRKqcezkWBkbPisZ4IVwS3hiC5
	yjGM7MF9keAMqIj3mYjm6ZrD1P0o7UoH5AUYM=
MIME-Version: 1.0
Received: by 10.231.19.70 with SMTP id z6mr1782381iba.24.1239707217947; Tue, 
	14 Apr 2009 04:06:57 -0700 (PDT)
In-Reply-To: <ade1bdc0904140355i708b5842w1335cdcc53ad9707@mail.gmail.com>
References: <ade1bdc0904140355i708b5842w1335cdcc53ad9707@mail.gmail.com>
Date: Tue, 14 Apr 2009 13:06:57 +0200
Message-ID: <ade1bdc0904140406y3fdb0e78g5b5a49638fb35606@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.170
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [STABLE] it is possible to add 600Mhz for kernel for beagleboard revB7 (OMAP3430 ES3.0) ?
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
X-List-Received-Date: Tue, 14 Apr 2009 11:11:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

openembedded commit 31c5753ea1a29750060a002b867362354ae42669

Looking at kernel 2.6.28-r25 messages I see:

Uncompressing Linux........................................................=
...........................................................................=
..........................................
done, booting the kernel.
Linux version 2.6.28-omap1 (recalcati@recalcati-laptop) (gcc version
4.3.1 (GCC) ) #1 Sat Apr 11 14:16:14 CEST 2009
CPU: ARMv7 Processor [411fc083] revision 3 (ARMv7), cr=3D10c5387f
CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
Machine: OMAP3 Beagle Board
Memory policy: ECC disabled, Data cache writeback
OMAP3430 ES3.0
SRAM: Mapped pa 0x40200000 to va 0xd7000000 size: 0x100000
Reserving 15728640 bytes SDRAM for VRAM
Built 1 zonelists in Zone order, mobility grouping on. =A0Total pages: 3251=
2
Kernel command line: console=3DttyS2,115200n8 root=3D/dev/mmcblk0p2
rootwait rw init=3D/init omapfb.video_mode=3Dhd720 omapfb.debug=3Dy
omap-dss.def_disp=3Dlcd omap-dss.debug=3Dy
Clocking rate (Crystal/DPLL/ARM core): 26.0/332/500 MHz
GPMC revision 5.0
IRQ: Found an INTC at 0xd8200000 (revision 4.0) with 96 interrupts
Total of 96 interrupts on 1 active controller
OMAP34xx GPIO hardware version 2.5
PID hash table entries: 512 (order: 9, 2048 bytes)
OMAP clockevent source: GPTIMER12 at 32768 Hz

It is possible to add 600Mhz rate?
I looked inside arch/arm/mach-omap2/clock34xx.c,
but there is something to do:

=A0 =A0 =A0 =A0/* REVISIT: Not yet ready for OMAP3 */
#if 0
=A0 =A0 =A0 =A0/* Check the MPU rate set by bootloader */
=A0 =A0 =A0 =A0clkrate =3D omap2_get_dpll_rate_24xx(&dpll_ck);
=A0 =A0 =A0 =A0for (prcm =3D rate_table; prcm->mpu_speed; prcm++) {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!(prcm->flags & cpu_mask))
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (prcm->xtal_speed !=3D sys_ck.rate)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (prcm->dpll_speed <=3D clkrate)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
=A0 =A0 =A0 =A0}
=A0 =A0 =A0 =A0curr_prcm_set =3D prcm;
#endif

=A0 =A0 =A0 =A0recalculate_root_clocks();

=A0 =A0 =A0 =A0printk(KERN_INFO "Clocking rate (Crystal/DPLL/ARM core): "
=A0 =A0 =A0 =A0 =A0 =A0 =A0 "%ld.%01ld/%ld/%ld MHz\n",
=A0 =A0 =A0 =A0 =A0 =A0 =A0 (osc_sys_ck.rate / 1000000), (osc_sys_ck.rate /=
 100000) % 10,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 (core_ck.rate / 1000000), (arm_fck.rate / 10000=
00));


Any help?


