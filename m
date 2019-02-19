Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id DB3237C99D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 16:51:52 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id z25so2137077qti.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 08:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TDTT9/qFJ/6Uu/p6koU5LGt134gQrE1XvrnorAWFcYA=;
	b=AxkfuOdsFQ0oFVLU0OIj0apv+DYQgJocHUmv1EoYG+esWejBqzvoQ6hrlnOk0hxjB5
	Ne/+JiqnTY/XlfzHARX9+2Q20FHhQ1syElWfbcxR0SjWWLobDr/4X5QYMy6OX5dA/p0R
	pdS8FaddGDj6w0M63R+Z7uTTDfF44riBZlzfssQHdIrFAEGb+WREhWUO0r7bDV6w0ncJ
	FVOuquD+zVvCka6mtHeJuP3eiwbq3+xWo18rGdoJlTAHAwMb+hDvYA5RLFVwXB0rpyyw
	thjuf25Gc/Jpd/DZEJA7yPnlS/J1mMjhVNtMRihuy3Ga4L+xi0fUHj3uopsFwRYHkLex
	F95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TDTT9/qFJ/6Uu/p6koU5LGt134gQrE1XvrnorAWFcYA=;
	b=p6zdb62WSvIlIJGqz6g9DLygw2JUTP8J7d2wyCyDB4TsGgjYis6A3bQDznlPz0/KpA
	0A23u2KnVYYbVoLmmr2Bbiyj61TxZIqSesHPECvqeVOfsX1etHhnsfnznGOuW7AQW2qD
	xmCnIsvdGWDBR4r2jW0aMRfsb6qsdHv0rUoVfBBHv4ucEorWYxeTxdjc4pFH08dGqY3V
	rFcbjkxaHqglobyM2tb9U1vIS6xSJN7j5p+ZpeuZqhzVI8vZgHGbAE9q2YINElK0XXh1
	RX3w5Ga6P1+mgB1N/Xu/fcj9Wwx0FtNNCtqLO6wy+t62rTnWVN402mpnl07EmHrkkS6k
	SxEg==
X-Gm-Message-State: AHQUAubf+hGLjm83YgKt04+B9gP0Ol7ndcX2iRmfzcv9uihTF8jcX+NR
	iUWNhJ9+4w0QHoQYWtdlwKmq7lP4PhsGbkkBFHcf/Q==
X-Google-Smtp-Source: AHgI3IZItUwcwtNZm3OKnVtI6D7BPpO6LKkdHGZbASYf2oTbGXqKjRc86Hs5tOugLGeWbuST8iqpPVb6JOvqRf5nbEc=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr23691762qtn.253.1550595113511; 
	Tue, 19 Feb 2019 08:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20190216170354.10645-1-zboszor@pr.hu>
	<20190218104704.14623-1-zboszor@pr.hu>
	<CAMKF1spwdGaXKr51oZM-g5Pmw8jNsUQLOs=DRsOfD3pYfAYRZg@mail.gmail.com>
	<CAMKF1spGuo6q450qviwopWk4LMpqDNzVAgAUrQbLQPBwc-zyNw@mail.gmail.com>
	<6bc2f073-19bf-85c4-0f0f-581700557c4e@pr.hu>
In-Reply-To: <6bc2f073-19bf-85c4-0f0f-581700557c4e@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Feb 2019 08:51:27 -0800
Message-ID: <CAMKF1srzbagvGiRSAT2shAzgxD19qLeN2tZbnHaPA-vOrAJtig@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Feb 2019 16:51:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 19, 2019 at 12:43 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zb=
oszor@pr.hu> wrote:
>
> 2019. 02. 19. 8:14 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> > more here
> >
> > NOTE: Started PRServer with DBfile: /mnt/a/yoe/cache/prserv.sqlite3,
> > IP: 127.0.0.1, PORT: 45089, PID: 43331
> > Parsing recipes...done.
> > Parsing of 3233 .bb files complete (0 cached, 3233 parsed). 4441
> > targets, 574 skipped, 0 masked, 0 errors.
> > NOTE: Resolving any missing task queue dependencies
> > ERROR: Nothing RPROVIDES 'plymouth-initrd' (but
> > /mnt/a/yoe/sources/meta-openembedded/meta-initramfs/recipes-devtools/dr=
acut/dracut_git.bb
> > RDEPENDS on or otherwise requires it)
> > NOTE: Runtime target 'plymouth-initrd' is unbuildable, removing...
>
> Questions:
>
> 1. What removes "initrd" from the plymouth PACKAGECONFIG for this setup?
>



> 2. Can a PACKAGECONFIG string of one recipe queried from another recipe?
>     E.g. would bb.utils.contains("PACKAGECONFIG_pn-plymouth", ...) work
>     from the dracut recipe if the variable does not exit at a layer level
>     but only in a plymouth bbappend?

I dont think so, but you can tie it into a DISTRO_CONFIG

>
> 3. Would moving plymouth-initrd from RDEPENDS to RRECOMMENDS in the dracu=
t
>     recipe solve this problem? If not, why? intel-microcode is also in
>     RRECOMMENDS, but it's mentioned in the errors below. Why?

recommendations still have to be built, for feeds.

>
> > Missing or unbuildable dependency chain was: ['plymouth-initrd']
> > NOTE: Runtime target 'dracut' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['dracut', 'plymouth-initr=
d']
> > NOTE: Runtime target 'dracut-dev' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['dracut-dev', 'plymouth-i=
nitrd']
> > ERROR: Nothing RPROVIDES 'intel-microcode' (but
> > /mnt/a/yoe/sources/meta-openembedded/meta-initramfs/recipes-devtools/dr=
acut/dracut_git.bb
> > RDEPENDS on or otherwise requires it)
> > NOTE: Runtime target 'intel-microcode' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['intel-microcode']
> >
> > Build Configuration:
> > BB_VERSION           =3D "1.40.0"
> > BUILD_SYS            =3D "x86_64-linux"
> > NATIVELSBSTRING      =3D "arch"
> > TARGET_SYS           =3D "arm-yoe-linux-musleabi"
> > MACHINE              =3D "sama5d27-som1-ek-sd"
> > DISTRO               =3D "yoe-musl-sysvinit-wayland"
> > DISTRO_VERSION       =3D "2.6"
> > TUNE_FEATURES        =3D "arm vfp cortexa5 neon vfpv4 thumb callconvent=
ion-hard"
> > TARGET_FPU           =3D "hard"
> > meta-yoe             =3D "yoe/mut:f14a20d6c6b23391aa0b8636d0b20752e0748=
30a"
> > meta-96boards        =3D "HEAD:6e8a11ea878698742e83832ef06df2c11604c338=
"
> > meta-atmel           =3D "HEAD:ac803d348433d7755803f5429c7c40f4883a5ae4=
"
> > meta-freescale       =3D "HEAD:2e83203ebd8439a45bc7a931ace6871e6b238658=
"
> > meta-freescale-3rdparty =3D "HEAD:8b38f230d4d7cd6c283d75c17eddfbe51eca9=
0a5"
> > meta-odroid
> > meta-odroid-extras   =3D "yoe/mut:688ff9c5f549f072af204ee64d5ad3ee18b9e=
47f"
> > meta-qcom            =3D "yoe/mut:f708a3a9b6a61cd4d83a32dec4532453a127b=
54a"
> > meta-raspberrypi     =3D "HEAD:6305aa7b693fb3423bd40921144666dadd7185b8=
"
> > meta-riscv           =3D "yoe/mut:2ec848f8f37ea3c0d3538f32a59133294a923=
4cc"
> > meta-ti              =3D "yoe/mut:04c4fef39d62396ea855b5f086a969269d740=
562"
> > meta-browser         =3D "yoe/mut:974e22e9ffcba92a1d7e7aab90a6cb88b9c3e=
77f"
> > meta-qt5             =3D "HEAD:fb71293f257c6fd02ccc06765a96dbf11d4569a0=
"
> > meta-rust            =3D "HEAD:f4517aaba8026b44576c6407adf0175663d5a7b4=
"
> > meta-filesystems
> > meta-gnome
> > meta-initramfs
> > meta-multimedia
> > meta-networking
> > meta-oe
> > meta-perl
> > meta-python
> > meta-webserver
> > meta-xfce            =3D "yoe/mut:6adca5007190518de21ff406a141944c9d601=
588"
> > meta                 =3D "yoe/mut:36242003ab8ff7e5dd93206ff672d92f9dbbd=
6e4"
> > meta-clang           =3D "master:e96a34778c238692769c488fbe0d7781f0b929=
ce"
> > workspace            =3D "kraj/master:8a94ccf193a33feb1546455fd190ac880=
ff66fb2"
> >
> > On Mon, Feb 18, 2019 at 11:01 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> https://errors.yoctoproject.org/Errors/Details/228793/
> >>
> >> On Mon, Feb 18, 2019 at 2:47 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n=
 <zboszor@pr.hu> wrote:
> >>>
> >>> This patchset adds the necessary pieces to create the initramfs
> >>> with dracut during do_rootfs.
> >>>
> >>> The 6th patch references a GitHub branch for which a pull request
> >>> was made against dracut. See https://github.com/dracutdevs/dracut/pul=
l/535
> >>>
> >>> Best regards,
> >>> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
> >>>
> >>>
> >
>

