Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PYfot-00036Y-Pt
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 15:19:04 +0100
Received: by iyj18 with SMTP id 18so11073187iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dtCu7jBzAxnfydHlUULdCfIRhovyKmRqNlWiDW9NEIY=;
	b=UNCcwiu1dWiUxBzO5ivSqH5dHkuOSU2a6I3RA2/XP0ui6/4gGcAcCmtwwtK02xnK/5
	qPSYsruXvUecu0RhgIVNqeiCWkohgkibEr9pFxWesTqrNN4eY4Uz7FLKzaWELHd7CbXd
	U00CCQ31vUNhIiah+l2VLMxN9884Z0wEjI3B4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Pl8nNGK3IAkq9gAReiRgNK858k6VVw69UacDjOtQKvWdGH/6xyboJ+pWoma6aOSoAN
	x5vivaAs19mD9GEj1UHb5Sep0tQzPp2Shu1SOdmNttlgvwaUXPEq7wIvZVF+/iR+KWkc
	ax7LS2HzrX4Jx1hSCdUNVgUzq+oSJnZvo3LJk=
MIME-Version: 1.0
Received: by 10.231.36.12 with SMTP id r12mr1999174ibd.69.1293805121267; Fri,
	31 Dec 2010 06:18:41 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Fri, 31 Dec 2010 06:18:41 -0800 (PST)
In-Reply-To: <AANLkTiky2FtGaE6rUvK6Zj7mmTo=sMvJFjLXUvBt_iF2@mail.gmail.com>
References: <AANLkTikxUP2WpUeaX19vu8wMecM4MHDQHh0wKArdQ_o+@mail.gmail.com>
	<AANLkTinPxtGJCLRD8JgyPdjotigU_UMH4D-tduv04Kxo@mail.gmail.com>
	<AANLkTiky2FtGaE6rUvK6Zj7mmTo=sMvJFjLXUvBt_iF2@mail.gmail.com>
Date: Fri, 31 Dec 2010 15:18:41 +0100
Message-ID: <AANLkTi=gBYzYGXJw2OUZPNUcbf9G4f=N3kyorCweA-cg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake oddity, wong kernel
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
X-List-Received-Date: Fri, 31 Dec 2010 14:19:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/31 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/12/31 Khem Raj <raj.khem@gmail.com>:
>> On Thu, Dec 30, 2010 at 10:29 AM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> Got this today with OE git head of today and bitbake git head of today.
>>> Note that I am building for haowkboard, still somehow it wants to
>>> remove the linux-nios2 recipe.
>>> However virtual kernel is not using the nios2 kernel.
>>> from the conf/machine/include/davinci.inc =A0file:
>>> PREFERRED_PROVIDER_virtual/kernel =3D "linux-davinci"
>>>
>>> removing $TMPDIR/cache did not help.
>>> host is opensuse 11.3 (i686)
>>>
>>> Puzzled, Frans
>>>
>>
>> hmmm I would say do a clean build for both the machines again
>> and retry this and see if it is reproducable
>>
>
> I tried a clean build for hawkboard in a clean environment (empty
> TMPDIR), still it pulls in the linux-nios2 kernel.
> I'll try to do a bitbake -v -DDD later
>

Some further analysis:

bitbake -v -DDD -cclean virtual/kernel gives:

Build Configuration:
BB_VERSION        =3D "1.11.0"
METADATA_BRANCH   =3D "org.openembedded.dev"
METADATA_REVISION =3D "b04d637"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "hawkboard"
DISTRO            =3D "minimal"
DISTRO_VERSION    =3D "dev-snapshot-20101231"
TARGET_FPU        =3D "soft"

Level 8: providers for virtual/kernel are: ['linux-nios2', 'linux',
'linux-davinci', 'linux-bast', 'linux-palmpre', 'linux-rt',
'linux-omap-2.6', 'gumstix-kernel']
NOTE: selecting linux-davinci to satisfy virtual/kernel due to
PREFERRED_PROVIDERS
Level 8: sorted providers for virtual/kernel are:
['/home/frans/oe/openembedded/recipes/linux/linux-davinci_git.bb',
'/home/frans/oe/openembedded/recipes/linux/linux-nios2_2.6.34.bb',
'/home/frans/oe/openembedded/recipes/linux/linux-omap-2.6_2.6.9-omap1.bb',
'/home/frans/oe/openembedded/recipes/linux/linux-bast_2.4.25-vrs1-bast1.bb'=
,
'/home/frans/oe/openembedded/recipes/linux/linux-palmpre_git.bb',
'/home/frans/oe/openembedded/recipes/linux/linux-rt_2.6.29.bb',
'/home/frans/oe/openembedded/recipes/linux/linux_2.6.36.bb',
'/home/frans/oe/openembedded/recipes/linux/gumstix-kernel_2.6.21.bb']


Which looks good to me.

Furher on I see

Level 8: providers for kernel-base are: ['linux-nios2', 'linux',
'linux-davinci', 'linux-bast', 'linux-palmpre', 'linux-rt',
'linux-omap-2.6', 'gumstix-kernel']
NOTE: checking PREFERRED_PROVIDER_linux-nios2
NOTE: checking PREFERRED_PROVIDER_linux-nios2-2.6.34
NOTE: checking PREFERRED_PROVIDER_linux-nios2-2.6.34-r50
NOTE: checking PREFERRED_PROVIDER_virtual/kernel
NOTE: checking PREFERRED_PROVIDER_linux-omap-2.6
NOTE: checking PREFERRED_PROVIDER_linux-omap-2.6-2.6.9-omap1
NOTE: checking PREFERRED_PROVIDER_linux-omap-2.6-2.6.9-omap1-r50
NOTE: checking PREFERRED_PROVIDER_virtual/kernel
NOTE: checking PREFERRED_PROVIDER_linux-davinci
NOTE: checking PREFERRED_PROVIDER_linux-davinci-git
NOTE: checking PREFERRED_PROVIDER_linux-davinci-git-r50
NOTE: checking PREFERRED_PROVIDER_virtual/kernel
NOTE: selecting linux-davinci to satisfy runtime kernel-base due to
PREFERRED_PROVIDER_virtual/kernel =3D linux-davinci
NOTE: checking PREFERRED_PROVIDER_linux-palmpre
NOTE: checking PREFERRED_PROVIDER_linux-palmpre-2.6.24
NOTE: checking PREFERRED_PROVIDER_linux-palmpre-2.6.24-r50
NOTE: checking PREFERRED_PROVIDER_virtual/kernel
NOTE: checking PREFERRED_PROVIDER_linux-palmpre-2.6.24+gitr0+33239e4074f471=
6a674b450a443b64add201bf39
NOTE: checking PREFERRED_PROVIDER_linux-palmpre-2.6.24+gitr0+33239e4074f471=
6a674b450a443b64add201bf39-r50
NOTE: checking PREFERRED_PROVIDER_linux-rt
NOTE: checking PREFERRED_PROVIDER_linux-rt-2.6.25
NOTE: checking PREFERRED_PROVIDER_linux-rt-2.6.25-r50
NOTE: checking PREFERRED_PROVIDER_virtual/kernel
NOTE: checking PREFERRED_PROVIDER_linux-rt-2.6.29
NOTE: checking PREFERRED_PROVIDER_linux-rt-2.6.29-r50
NOTE: checking PREFERRED_PROVIDER_linux-rt-2.6.24
NOTE: checking PREFERRED_PROVIDER_linux-rt-2.6.24-r50
NOTE: checking PREFERRED_PROVIDER_linux
NOTE: checking PREFERRED_PROVIDER_linux-2.6.35
NOTE: checking PREFERRED_PROVIDER_linux-2.6.35-r50
NOTE: checking PREFERRED_PROVIDER_virtual/kernel
NOTE: checking PREFERRED_PROVIDER_linux-2.6.29
NOTE: checking PREFERRED_PROVIDER_linux-2.6.29-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.36
NOTE: checking PREFERRED_PROVIDER_linux-2.6.36-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.23+2.6.24-rc6
NOTE: checking PREFERRED_PROVIDER_linux-2.6.23+2.6.24-rc6-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.22+2.6.23-rc3
NOTE: checking PREFERRED_PROVIDER_linux-2.6.22+2.6.23-rc3-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.30
NOTE: checking PREFERRED_PROVIDER_linux-2.6.30-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.22+2.6.23-rc5
NOTE: checking PREFERRED_PROVIDER_linux-2.6.22+2.6.23-rc5-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.29+2.6.30-rc5
NOTE: checking PREFERRED_PROVIDER_linux-2.6.29+2.6.30-rc5-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.14
NOTE: checking PREFERRED_PROVIDER_linux-2.6.14-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.18
NOTE: checking PREFERRED_PROVIDER_linux-2.6.18-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.22
NOTE: checking PREFERRED_PROVIDER_linux-2.6.22-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.27+2.6.28-rc6
NOTE: checking PREFERRED_PROVIDER_linux-2.6.27+2.6.28-rc6-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.33
NOTE: checking PREFERRED_PROVIDER_linux-2.6.33-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.29+2.6.30-rc4
NOTE: checking PREFERRED_PROVIDER_linux-2.6.29+2.6.30-rc4-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.23
NOTE: checking PREFERRED_PROVIDER_linux-2.6.23-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.27
NOTE: checking PREFERRED_PROVIDER_linux-2.6.27-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.23+2.6.24-rc5
NOTE: checking PREFERRED_PROVIDER_linux-2.6.23+2.6.24-rc5-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.32
NOTE: checking PREFERRED_PROVIDER_linux-2.6.32-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.34
NOTE: checking PREFERRED_PROVIDER_linux-2.6.34-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.24
NOTE: checking PREFERRED_PROVIDER_linux-2.6.24-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.20
NOTE: checking PREFERRED_PROVIDER_linux-2.6.20-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.28
NOTE: checking PREFERRED_PROVIDER_linux-2.6.28-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.21+2.6.22-rc1
NOTE: checking PREFERRED_PROVIDER_linux-2.6.21+2.6.22-rc1-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.31
NOTE: checking PREFERRED_PROVIDER_linux-2.6.31-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.25
NOTE: checking PREFERRED_PROVIDER_linux-2.6.25-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.21
NOTE: checking PREFERRED_PROVIDER_linux-2.6.21-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.26
NOTE: checking PREFERRED_PROVIDER_linux-2.6.26-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.36+2.6.37-rc8+gitr0+387c31c7e5c=
9805b0aef8833d1731a5fe7bdea14
NOTE: checking PREFERRED_PROVIDER_linux-2.6.36+2.6.37-rc8+gitr0+387c31c7e5c=
9805b0aef8833d1731a5fe7bdea14-r50
NOTE: checking PREFERRED_PROVIDER_gumstix-kernel
NOTE: checking PREFERRED_PROVIDER_gumstix-kernel-2.6.21
NOTE: checking PREFERRED_PROVIDER_gumstix-kernel-2.6.21-r50
NOTE: checking PREFERRED_PROVIDER_virtual/kernel
Level 8: sorted providers for kernel-base are:
['/home/frans/oe/openembedded/recipes/linux/linux-davinci_git.bb',
'/home/frans/oe/openembedded/recipes/linux/linux-nios2_2.6.34.bb',
'/home/frans/oe/openembedded/recipes/linux/linux-omap-2.6_2.6.9-omap1.bb',
'/home/frans/oe/openembedded/recipes/linux/linux-bast_2.4.25-vrs1-bast1.bb'=
,
'/home/frans/oe/openembedded/recipes/linux/linux-palmpre_git.bb',
'/home/frans/oe/openembedded/recipes/linux/linux-rt_2.6.29.bb',
'/home/frans/oe/openembedded/recipes/linux/linux_2.6.36.bb',
'/home/frans/oe/openembedded/recipes/linux/gumstix-kernel_2.6.21.bb']
Level 8: providers for kernel-image are: ['linux-nios2', 'linux',
'linux-davinci', 'linux-bast', 'linux-palmpre', 'linux-rt',
'linux-omap-2.6', 'gumstix-kernel']
NOTE: checking PREFERRED_PROVIDER_linux-nios2
NOTE: checking PREFERRED_PROVIDER_linux-nios2-2.6.34
NOTE: checking PREFERRED_PROVIDER_linux-nios2-2.6.34-r50
NOTE: checking PREFERRED_PROVIDER_virtual/kernel
NOTE: checking PREFERRED_PROVIDER_linux-omap-2.6
NOTE: checking PREFERRED_PROVIDER_linux-omap-2.6-2.6.9-omap1
NOTE: checking PREFERRED_PROVIDER_linux-omap-2.6-2.6.9-omap1-r50
NOTE: checking PREFERRED_PROVIDER_virtual/kernel
NOTE: checking PREFERRED_PROVIDER_linux-davinci
NOTE: checking PREFERRED_PROVIDER_linux-davinci-git
NOTE: checking PREFERRED_PROVIDER_linux-davinci-git-r50
NOTE: checking PREFERRED_PROVIDER_virtual/kernel
NOTE: selecting linux-davinci to satisfy runtime kernel-image due to
PREFERRED_PROVIDER_virtual/kernel =3D linux-davinci
NOTE: checking PREFERRED_PROVIDER_linux-palmpre
NOTE: checking PREFERRED_PROVIDER_linux-palmpre-2.6.24
NOTE: checking PREFERRED_PROVIDER_linux-palmpre-2.6.24-r50
NOTE: checking PREFERRED_PROVIDER_virtual/kernel
NOTE: checking PREFERRED_PROVIDER_linux-palmpre-2.6.24+gitr0+33239e4074f471=
6a674b450a443b64add201bf39
NOTE: checking PREFERRED_PROVIDER_linux-palmpre-2.6.24+gitr0+33239e4074f471=
6a674b450a443b64add201bf39-r50
NOTE: checking PREFERRED_PROVIDER_linux-rt
NOTE: checking PREFERRED_PROVIDER_linux-rt-2.6.25
NOTE: checking PREFERRED_PROVIDER_linux-rt-2.6.25-r50
NOTE: checking PREFERRED_PROVIDER_virtual/kernel
NOTE: checking PREFERRED_PROVIDER_linux-rt-2.6.29
NOTE: checking PREFERRED_PROVIDER_linux-rt-2.6.29-r50
NOTE: checking PREFERRED_PROVIDER_linux-rt-2.6.24
NOTE: checking PREFERRED_PROVIDER_linux-rt-2.6.24-r50
NOTE: checking PREFERRED_PROVIDER_linux
NOTE: checking PREFERRED_PROVIDER_linux-2.6.35
NOTE: checking PREFERRED_PROVIDER_linux-2.6.35-r50
NOTE: checking PREFERRED_PROVIDER_virtual/kernel
NOTE: checking PREFERRED_PROVIDER_linux-2.6.29
NOTE: checking PREFERRED_PROVIDER_linux-2.6.29-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.36
NOTE: checking PREFERRED_PROVIDER_linux-2.6.36-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.23+2.6.24-rc6
NOTE: checking PREFERRED_PROVIDER_linux-2.6.23+2.6.24-rc6-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.22+2.6.23-rc3
NOTE: checking PREFERRED_PROVIDER_linux-2.6.22+2.6.23-rc3-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.30
NOTE: checking PREFERRED_PROVIDER_linux-2.6.30-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.22+2.6.23-rc5
NOTE: checking PREFERRED_PROVIDER_linux-2.6.22+2.6.23-rc5-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.29+2.6.30-rc5
NOTE: checking PREFERRED_PROVIDER_linux-2.6.29+2.6.30-rc5-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.14
NOTE: checking PREFERRED_PROVIDER_linux-2.6.14-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.18
NOTE: checking PREFERRED_PROVIDER_linux-2.6.18-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.22
NOTE: checking PREFERRED_PROVIDER_linux-2.6.22-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.27+2.6.28-rc6
NOTE: checking PREFERRED_PROVIDER_linux-2.6.27+2.6.28-rc6-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.33
NOTE: checking PREFERRED_PROVIDER_linux-2.6.33-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.29+2.6.30-rc4
NOTE: checking PREFERRED_PROVIDER_linux-2.6.29+2.6.30-rc4-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.23
NOTE: checking PREFERRED_PROVIDER_linux-2.6.23-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.27
NOTE: checking PREFERRED_PROVIDER_linux-2.6.27-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.23+2.6.24-rc5
NOTE: checking PREFERRED_PROVIDER_linux-2.6.23+2.6.24-rc5-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.32
NOTE: checking PREFERRED_PROVIDER_linux-2.6.32-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.34
NOTE: checking PREFERRED_PROVIDER_linux-2.6.34-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.24
NOTE: checking PREFERRED_PROVIDER_linux-2.6.24-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.20
NOTE: checking PREFERRED_PROVIDER_linux-2.6.20-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.28
NOTE: checking PREFERRED_PROVIDER_linux-2.6.28-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.21+2.6.22-rc1
NOTE: checking PREFERRED_PROVIDER_linux-2.6.21+2.6.22-rc1-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.31
NOTE: checking PREFERRED_PROVIDER_linux-2.6.31-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.25
NOTE: checking PREFERRED_PROVIDER_linux-2.6.25-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.21
NOTE: checking PREFERRED_PROVIDER_linux-2.6.21-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.26
NOTE: checking PREFERRED_PROVIDER_linux-2.6.26-r50
NOTE: checking PREFERRED_PROVIDER_linux-2.6.36+2.6.37-rc8+gitr0+387c31c7e5c=
9805b0aef8833d1731a5fe7bdea14
NOTE: checking PREFERRED_PROVIDER_linux-2.6.36+2.6.37-rc8+gitr0+387c31c7e5c=
9805b0aef8833d1731a5fe7bdea14-r50
NOTE: checking PREFERRED_PROVIDER_gumstix-kernel
NOTE: checking PREFERRED_PROVIDER_gumstix-kernel-2.6.21
NOTE: checking PREFERRED_PROVIDER_gumstix-kernel-2.6.21-r50
NOTE: checking PREFERRED_PROVIDER_virtual/kernel
Level 8: sorted providers for kernel-image are:
['/home/frans/oe/openembedded/recipes/linux/linux-davinci_git.bb',
'/home/frans/oe/openembedded/recipes/linux/linux-nios2_2.6.34.bb',
'/home/frans/oe/openembedded/recipes/linux/linux-omap-2.6_2.6.9-omap1.bb',
'/home/frans/oe/openembedded/recipes/linux/linux-bast_2.4.25-vrs1-bast1.bb'=
,
'/home/frans/oe/openembedded/recipes/linux/linux-palmpre_git.bb',
'/home/frans/oe/openembedded/recipes/linux/linux-rt_2.6.29.bb',
'/home/frans/oe/openembedded/recipes/linux/linux_2.6.36.bb',
'/home/frans/oe/openembedded/recipes/linux/gumstix-kernel_2.6.21.bb']

Yet still I get

NOTE: Running task 1 of 1 (ID: 0,
/home/frans/oe/openembedded/recipes/linux/linux-nios2_2.6.34.bb,
do_clean)
Level 8: Parsing
/home/frans/oe/openembedded/recipes/linux/linux-nios2_2.6.34.bb (full)
Level 9: BB :0: inheriting classes/kernel.bbclass
Level 9: BB :0: inheriting classes/linux-kernel-base.bbclass
Level 9: BB :0: inheriting classes/module_strip.bbclass
Level 9: BB :0: inheriting classes/kernel-arch.bbclass
Level 9: BB :0: inheriting classes/cml1.bbclass
Level 9: BB :0: inheriting classes/siteinfo.bbclass
Level 8: Executing task do_clean
NOTE: package linux-nios2-2.6.34-r50: task do_clean: Started
Level 8: Manually removing any installed files from staging...
NOTE: removing tmp_minimal/work/hawkboard-oe-linux-gnueabi/linux-nios2-2.6.=
34-r50
NOTE: removing tmp_minimal/stamps/hawkboard-oe-linux-gnueabi/linux-nios2-2.=
6.34-r50.*
NOTE: package linux-nios2-2.6.34-r50: task do_clean: Succeeded

Why is it notr unning linux-davinci_git.bb as that is the one
appearing first in the list of sorted recipes??

Frans


