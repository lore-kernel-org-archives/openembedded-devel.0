Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MbDHE-000857-RP
	for openembedded-devel@openembedded.org; Wed, 12 Aug 2009 14:50:00 +0200
Received: (qmail 28009 invoked by uid 813007); 12 Aug 2009 12:33:33 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 Aug 2009 12:33:33 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Aug 2009 14:33:30 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc5-00256-g8e6bcae; KDE/4.3.0; x86_64; ;
	)
References: <4A81BE84.6010607@atmel.com>
In-Reply-To: <4A81BE84.6010607@atmel.com>
MIME-Version: 1.0
Message-Id: <200908121433.31479.marcin@juszkiewicz.com.pl>
Subject: Re: Contents of the "origin/ulf/linux-2.6.30.2" branch. Help with testing wanted.
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
X-List-Received-Date: Wed, 12 Aug 2009 12:50:01 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 11 sierpnia 2009 o 20:55:00 Ulf Samuelsson napisa=C5=82(a):
> The goal of this branch is to update the AT91 support.
>
> 1) Fix AT91bootstrap, which is currently non-functional
> 2) Update to the latest u-boot (2009.08-rc2)
> 3) Update the kernel (2.6.30.2)
>    with many AT91 patches not yet in mainstream kernel.
>    MCI patches still lacking...

Cool! I will check your changes and then rebase and merge them into .dev=20
tree. I am also planning to push it later to stable/2009 branch.

> I have so far managed to build everything and load
> on an AT91SAM9263EK which has a dataflash
> containing at91bootstrap, u-boot and linux.
>
> 0x0     at91bootstrap
> 0x8400  u-boot
> 0x84000 linux
>
> The NAND flash is programmed with a root file system
>
> 0x400000 JFFS2 root file system.

Similar setup is used on at91sam9263-ek here so I will test your branch.

> AT91BOOTSTRAP
> v2.10 was completely wrong due to bad linkaddr.
> v2.12 and v2.13 boots properly from dataflash.

Can we just drop all older versions?

I had to add patch to 2.12 to get rid of -fno-dwarf2-cfi-asm parametr=20
passed to GCC. Did not tested with 2.13-rc1 as at91.com is not=20
reachable.

> All boards compile, but only the SAM9263EK has been tested on H/W.
> Only dataflashcard boot that is...
> Boot from NAND flash not tested.

Thats what I will not test either - my board has Rev A cpu so only dfc=20
booting possible.

> The updated at91bootstrap changes the recipe
> so that the normal way to configure is to do
>
> oe_runmake <board>_defconfig
>
> instead of copying a defconfig file to the toplevel .config

Thats good - especially as at91bootstrap configs in OE are basically the=20
same which are in sources.

> U-BOOT
> Updated to 2009.08-rc2 with patches.

[..]

> The last time I bitbaked this, U-Boot did not build
> for some reason.
> When I bitbaked u-boot directly, it built.
> Will rebuild again and see if problem repeats.

Will check it.

> LINUX
> A kernel is generated, with the defconfig taken
> from Marcin's 2.6.30, slightly updated.
>
> Added a lot of patches from the ARM mailing list,
> but the MCI is missing.
> Hope to get that later.

I will merge it with linux_2.6.30.bb recipe. Will add also latest=20
2.6.30.x patch to this.

=46or future: do not use linux-2.6.30.2.tar.bz2 but linux-2.6.30.bz2 +=20
patch-2.6.30.2.bz2 - this will save download time for those who have=20
linux-2.6.30.tar.bz2 tarball already.

> linux boots and you can communicate with the console,
> but gpe is not started properly.

Interesting problem, will check but later as now I have other type of=20
image as default.

> I introduced the possibility to build linux using
> make <board>_defconfig, instead of using a
> defconfig in a board directory under linux.
> LINUX26_DEFCONFIG needs to be defined.

Interesting, will check. I see a problem anyway because linux_*.bb=20
recipes by default use defconfig as part of SRC_URI. But we can use=20
empty file to satisfy it.

> BOARD SUPPORT
> Since there are plenty of AT91 chips with more coming,
> I decided to make two include files.
> conf/machine/include/AT91.inc
> conf/machine/include/AT91-LCD.inc

Thanks a lot - I had that in todolist ;)

> I will spend some time testing this, but
> I hope I will get some help from interested parties.

As always you can count on me when it comes to AT91 stuff.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




