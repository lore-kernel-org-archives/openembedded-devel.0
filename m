Received: from [81.228.11.98] (helo=pne-smtpout1-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MbECb-0007Ih-UW
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 15:49:19 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A683C78001A28F1 for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 15:32:51 +0200
Message-ID: <4A82C482.6060008@atmel.com>
Date: Wed, 12 Aug 2009 15:32:50 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A81BE84.6010607@atmel.com>
	<200908121433.31479.marcin@juszkiewicz.com.pl>
In-Reply-To: <200908121433.31479.marcin@juszkiewicz.com.pl>
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
X-List-Received-Date: Wed, 12 Aug 2009 13:49:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: Quoted-Printable

Marcin Juszkiewicz skrev:
> Dnia wtorek, 11 sierpnia 2009 o 20:55:00 Ulf Samuelsson napisa=C5=82(a)=
:
>> The goal of this branch is to update the AT91 support.
>>
>> 1) Fix AT91bootstrap, which is currently non-functional
>> 2) Update to the latest u-boot (2009.08-rc2)
>> 3) Update the kernel (2.6.30.2)
>>    with many AT91 patches not yet in mainstream kernel.
>>    MCI patches still lacking...
>=20
> Cool! I will check your changes and then rebase and merge them into .de=
v=20
> tree. I am also planning to push it later to stable/2009 branch.
>=20
>> I have so far managed to build everything and load
>> on an AT91SAM9263EK which has a dataflash
>> containing at91bootstrap, u-boot and linux.
>>
>> 0x0     at91bootstrap
>> 0x8400  u-boot
>> 0x84000 linux
>>
>> The NAND flash is programmed with a root file system
>>
>> 0x400000 JFFS2 root file system.
>=20
> Similar setup is used on at91sam9263-ek here so I will test your branch=
=2E
>=20
>> AT91BOOTSTRAP
>> v2.10 was completely wrong due to bad linkaddr.
>> v2.12 and v2.13 boots properly from dataflash.
>=20
> Can we just drop all older versions?

The guys responsible for afeb9260 might want to test.

>=20
> I had to add patch to 2.12 to get rid of -fno-dwarf2-cfi-asm parametr=20
> passed to GCC. Did not tested with 2.13-rc1 as at91.com is not=20
> reachable.

Yes, fixed in 2.13-rc1
Will send you the source file.

>=20
>> All boards compile, but only the SAM9263EK has been tested on H/W.
>> Only dataflashcard boot that is...
>> Boot from NAND flash not tested.
>=20
> Thats what I will not test either - my board has Rev A cpu so only dfc=20
> booting possible.
>=20
>> The updated at91bootstrap changes the recipe
>> so that the normal way to configure is to do
>>
>> oe_runmake <board>_defconfig
>>
>> instead of copying a defconfig file to the toplevel .config
>=20
> Thats good - especially as at91bootstrap configs in OE are basically th=
e=20
> same which are in sources.
>=20
>> U-BOOT
>> Updated to 2009.08-rc2 with patches.
>=20
> [..]
>=20
>> The last time I bitbaked this, U-Boot did not build
>> for some reason.
>> When I bitbaked u-boot directly, it built.
>> Will rebuild again and see if problem repeats.
>=20
> Will check it.

Someone found the same problem.

>=20
>> LINUX
>> A kernel is generated, with the defconfig taken
>> from Marcin's 2.6.30, slightly updated.
>>
>> Added a lot of patches from the ARM mailing list,
>> but the MCI is missing.
>> Hope to get that later.
>=20
> I will merge it with linux_2.6.30.bb recipe. Will add also latest=20
> 2.6.30.x patch to this.
>=20
> For future: do not use linux-2.6.30.2.tar.bz2 but linux-2.6.30.bz2 +=20
> patch-2.6.30.2.bz2 - this will save download time for those who have=20
> linux-2.6.30.tar.bz2 tarball already.

OK.

>> linux boots and you can communicate with the console,
>> but gpe is not started properly.
>=20
> Interesting problem, will check but later as now I have other type of=20
> image as default.
>=20
>> I introduced the possibility to build linux using
>> make <board>_defconfig, instead of using a
>> defconfig in a board directory under linux.
>> LINUX26_DEFCONFIG needs to be defined.
>=20
> Interesting, will check. I see a problem anyway because linux_*.bb=20
> recipes by default use defconfig as part of SRC_URI. But we can use=20
> empty file to satisfy it.

The fix will test if $(LINUX_DEFCONFIG) is defined,
and if so, it will copy $(LINUX_DEFCONFIG)
to defconfig to avoid problems with recipes

Had a bug, but I got it running today.
Will push soon.


>=20
>> BOARD SUPPORT
>> Since there are plenty of AT91 chips with more coming,
>> I decided to make two include files.
>> conf/machine/include/AT91.inc
>> conf/machine/include/AT91-LCD.inc
>=20
> Thanks a lot - I had that in todolist ;)
>=20
>> I will spend some time testing this, but
>> I hope I will get some help from interested parties.
>=20
> As always you can count on me when it comes to AT91 stuff.
>=20
> Regards,=20


--=20
Best Regards
Ulf Samuelsson



