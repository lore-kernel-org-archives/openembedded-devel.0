Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 624577C419
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 01:11:03 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d18so15478513qtg.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cinxMoAb/LRIAkmUK0LLW6JBZuwGsaCT18vS5lzFcVQ=;
	b=ZQ7+vLUH4ueC+brT6BmjlxMn56WdevRtJjJi8+56tZgda3LgAtc8W/OjWiTePSnLzG
	ebZUw9OkadvdxzJtgLImT0CrT/SsFphDFI5bUwZ6eL6fxjraMJ07rpf/+BgZRSfA4KyL
	+kuLwUDf/0OPAnVb6/MXdvQDB/Gowg5By3q7MSGB2ZAb7M34p/nWfATlpgC5B3c8DFQv
	ug4qzbrsMZyjd1P602ucayyhFofcGb69tOyxqu5xD5tQrZdlA0nR/CJQoSA6ihC5Lyv2
	on1yfbb0JshJlZ/UsqcW9vDBJjzBYTj4ZAsGpms725x6Gv1E+Xfiw6cjDju/AlYbVrS2
	hRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cinxMoAb/LRIAkmUK0LLW6JBZuwGsaCT18vS5lzFcVQ=;
	b=NHwZJRe6uKX90KoX1IvwXvTuhpknajVMLf89wCdFQvSTLgh1PSs6eYMTajhlyPciBo
	UBDsswxdvPM8pi/DdW3jlmMVDaDgMgNZnA0wAP8UIqZFZzhNqvSMi1b+mCUjJbalQiej
	4L8e6fuRVE/fZMXlOt9Q56osZY97fI2abvJMDoUA2YrqmRXrRTgapWpfmJnpOXXjOcOo
	qfVVdNO/GKw0rhXHwLTGeWfff1LjKrIsT0lCBsTegO+O1K/QZkU4NSo6RepG6FTVTShi
	jht36Qt6RoK/X3KtGzkT6avoHYLAzL4+nUbHjgmyvHGq12sMNfKDNxE4SHRKxnIXP4TQ
	MdYg==
X-Gm-Message-State: AHQUAubC9IyX7X9DvgyKwNsjTJHU5TbeCfAJtiQxuGSjEa14u+nNmHkg
	wqlmGpjKelgQo/CDWYqpCZ3DbSkl142KaiOYVKD6gw==
X-Google-Smtp-Source: AHgI3IaWQ9gbewSHmicBxjJy5eI3uxjCIFt5RT2ntb+gkwVwFQwe7HMz7v0XayRXOwFDKKPyjFEk1DDzSFULSN2A58g=
X-Received: by 2002:a0c:8971:: with SMTP id 46mr23317965qvq.224.1550625063817; 
	Tue, 19 Feb 2019 17:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20190216170354.10645-1-zboszor@pr.hu>
	<20190218104704.14623-1-zboszor@pr.hu>
	<CAMKF1spwdGaXKr51oZM-g5Pmw8jNsUQLOs=DRsOfD3pYfAYRZg@mail.gmail.com>
	<CAMKF1spGuo6q450qviwopWk4LMpqDNzVAgAUrQbLQPBwc-zyNw@mail.gmail.com>
	<6bc2f073-19bf-85c4-0f0f-581700557c4e@pr.hu>
	<CAMKF1srzbagvGiRSAT2shAzgxD19qLeN2tZbnHaPA-vOrAJtig@mail.gmail.com>
	<38db22d0-840f-1759-206b-43a28efd106c@pr.hu>
In-Reply-To: <38db22d0-840f-1759-206b-43a28efd106c@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Feb 2019 17:10:37 -0800
Message-ID: <CAMKF1sp4+XSB=oV56s=PJc8BW8UqWq-TsOXHMGhRn82MRt4U_w@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 0/6 v2] Run dracut from rootfs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2019 01:11:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 19, 2019 at 10:46 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zb=
oszor@pr.hu> wrote:
>
> 2019. 02. 19. 17:51 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> > On Tue, Feb 19, 2019 at 12:43 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n=
 <zboszor@pr.hu> wrote:
> >>
> >> 2019. 02. 19. 8:14 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> >>> more here
> >>>
> >>> NOTE: Started PRServer with DBfile: /mnt/a/yoe/cache/prserv.sqlite3,
> >>> IP: 127.0.0.1, PORT: 45089, PID: 43331
> >>> Parsing recipes...done.
> >>> Parsing of 3233 .bb files complete (0 cached, 3233 parsed). 4441
> >>> targets, 574 skipped, 0 masked, 0 errors.
> >>> NOTE: Resolving any missing task queue dependencies
> >>> ERROR: Nothing RPROVIDES 'plymouth-initrd' (but
> >>> /mnt/a/yoe/sources/meta-openembedded/meta-initramfs/recipes-devtools/=
dracut/dracut_git.bb
> >>> RDEPENDS on or otherwise requires it)
> >>> NOTE: Runtime target 'plymouth-initrd' is unbuildable, removing...
> >>
> >> Questions:
> >>
> >> 1. What removes "initrd" from the plymouth PACKAGECONFIG for this setu=
p?
> >>
> >
> >
> >
> >> 2. Can a PACKAGECONFIG string of one recipe queried from another recip=
e?
> >>      E.g. would bb.utils.contains("PACKAGECONFIG_pn-plymouth", ...) wo=
rk
> >>      from the dracut recipe if the variable does not exit at a layer l=
evel
> >>      but only in a plymouth bbappend?
> >
> > I dont think so, but you can tie it into a DISTRO_CONFIG
>
> You mean, instead of checking for PACKAGECONFIG, plymouth and dracut
> should both test for "dracut" in DISTRO_FEATURES, right?
>
> Or should they check for the other one?
>
> Or both should check for both strings?
>
> Which one is preferred?

just a DISTRO_FEATURE should be enough.

>
> >
> >>
> >> 3. Would moving plymouth-initrd from RDEPENDS to RRECOMMENDS in the dr=
acut
> >>      recipe solve this problem? If not, why? intel-microcode is also i=
n
> >>      RRECOMMENDS, but it's mentioned in the errors below. Why?
> >
> > recommendations still have to be built, for feeds.
>
> Okay, so I need a function to check for an x86(_64) target
> and conditionally include intel-microcode.

I guess that would work, you might use overrides to add conditional
dependency based on architecture.

>
> >
> >>
> >>> Missing or unbuildable dependency chain was: ['plymouth-initrd']
> >>> NOTE: Runtime target 'dracut' is unbuildable, removing...
> >>> Missing or unbuildable dependency chain was: ['dracut', 'plymouth-ini=
trd']
> >>> NOTE: Runtime target 'dracut-dev' is unbuildable, removing...
> >>> Missing or unbuildable dependency chain was: ['dracut-dev', 'plymouth=
-initrd']
> >>> ERROR: Nothing RPROVIDES 'intel-microcode' (but
> >>> /mnt/a/yoe/sources/meta-openembedded/meta-initramfs/recipes-devtools/=
dracut/dracut_git.bb
> >>> RDEPENDS on or otherwise requires it)
> >>> NOTE: Runtime target 'intel-microcode' is unbuildable, removing...
> >>> Missing or unbuildable dependency chain was: ['intel-microcode']
> >>>
> >>> Build Configuration:
> >>> BB_VERSION           =3D "1.40.0"
> >>> BUILD_SYS            =3D "x86_64-linux"
> >>> NATIVELSBSTRING      =3D "arch"
> >>> TARGET_SYS           =3D "arm-yoe-linux-musleabi"
> >>> MACHINE              =3D "sama5d27-som1-ek-sd"
> >>> DISTRO               =3D "yoe-musl-sysvinit-wayland"
> >>> DISTRO_VERSION       =3D "2.6"
> >>> TUNE_FEATURES        =3D "arm vfp cortexa5 neon vfpv4 thumb callconve=
ntion-hard"
> >>> TARGET_FPU           =3D "hard"
> >>> meta-yoe             =3D "yoe/mut:f14a20d6c6b23391aa0b8636d0b20752e07=
4830a"
> >>> meta-96boards        =3D "HEAD:6e8a11ea878698742e83832ef06df2c11604c3=
38"
> >>> meta-atmel           =3D "HEAD:ac803d348433d7755803f5429c7c40f4883a5a=
e4"
> >>> meta-freescale       =3D "HEAD:2e83203ebd8439a45bc7a931ace6871e6b2386=
58"
> >>> meta-freescale-3rdparty =3D "HEAD:8b38f230d4d7cd6c283d75c17eddfbe51ec=
a90a5"
> >>> meta-odroid
> >>> meta-odroid-extras   =3D "yoe/mut:688ff9c5f549f072af204ee64d5ad3ee18b=
9e47f"
> >>> meta-qcom            =3D "yoe/mut:f708a3a9b6a61cd4d83a32dec4532453a12=
7b54a"
> >>> meta-raspberrypi     =3D "HEAD:6305aa7b693fb3423bd40921144666dadd7185=
b8"
> >>> meta-riscv           =3D "yoe/mut:2ec848f8f37ea3c0d3538f32a59133294a9=
234cc"
> >>> meta-ti              =3D "yoe/mut:04c4fef39d62396ea855b5f086a969269d7=
40562"
> >>> meta-browser         =3D "yoe/mut:974e22e9ffcba92a1d7e7aab90a6cb88b9c=
3e77f"
> >>> meta-qt5             =3D "HEAD:fb71293f257c6fd02ccc06765a96dbf11d4569=
a0"
> >>> meta-rust            =3D "HEAD:f4517aaba8026b44576c6407adf0175663d5a7=
b4"
> >>> meta-filesystems
> >>> meta-gnome
> >>> meta-initramfs
> >>> meta-multimedia
> >>> meta-networking
> >>> meta-oe
> >>> meta-perl
> >>> meta-python
> >>> meta-webserver
> >>> meta-xfce            =3D "yoe/mut:6adca5007190518de21ff406a141944c9d6=
01588"
> >>> meta                 =3D "yoe/mut:36242003ab8ff7e5dd93206ff672d92f9db=
bd6e4"
> >>> meta-clang           =3D "master:e96a34778c238692769c488fbe0d7781f0b9=
29ce"
> >>> workspace            =3D "kraj/master:8a94ccf193a33feb1546455fd190ac8=
80ff66fb2"
> >>>
> >>> On Mon, Feb 18, 2019 at 11:01 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>>>
> >>>> https://errors.yoctoproject.org/Errors/Details/228793/
> >>>>
> >>>> On Mon, Feb 18, 2019 at 2:47 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@pr.hu> wrote:
> >>>>>
> >>>>> This patchset adds the necessary pieces to create the initramfs
> >>>>> with dracut during do_rootfs.
> >>>>>
> >>>>> The 6th patch references a GitHub branch for which a pull request
> >>>>> was made against dracut. See https://github.com/dracutdevs/dracut/p=
ull/535
> >>>>>
> >>>>> Best regards,
> >>>>> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
> >>>>>
> >>>>>
> >>>
> >>
> >
>

