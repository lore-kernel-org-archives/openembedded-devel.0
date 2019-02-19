Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4F77C7C8D6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 07:14:53 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id x9so11490156qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2019 23:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OJ0Fv/rVh11xG85AmUBtUcd6yFoCE1fkgkCGZ0zfTdU=;
	b=X9mS2cMOJLI3m19dbGG7xxRbQAr437d8rEOhLpoBWlT8g2cPMrIvqOL3ZyJpjUIMS0
	wEYDClj/eAA6JVt9xYHCvhgAM9OkuRw9Z0rTZOlLqweBdvti++gohaz7yA/p9/C7jkqn
	fG0Tx4ZYHCF+1lL4tNVfKDLhiG0RkJel0BxWM3U8qOBxDGzr2p4eDWpD+FC0ZjTlW7WE
	ABVmdVKjPmq6qn/KGzBh3CJYOz2TzuEtNMoyQNXbLhH2OjcdZyMRqGeObTFjnIChFdM+
	E0KS4m7sv2y4+5Ae6Dbhkg75mUDJm0q91Jm6LyACKddVOn1BcZiYZMjroxwKjcjt+wZl
	HZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OJ0Fv/rVh11xG85AmUBtUcd6yFoCE1fkgkCGZ0zfTdU=;
	b=tFvrW8jxX19BbkI4cCn9CNnPEZX3sk+m+hcbYfT1ENK+eQf74ixXdGUU+CsqOmuKu/
	mmeT3ZquUSGO2fvctpWYt9hbSp2JIiXXhg+SYSxKXFYHkis0ACea/B4xwXTeW2UsLb82
	q6GNunNGt1NXgxtESCx6R0aOhFsgq8FJauJtILRaZ3TaNjiKndHtpklFggb4VokdZtO1
	avjmgH3rZ4eciY2U8Ham4A3lHX2hl23/iGy9t+ErfVFQgVnx5TnGdPM1B+makwdi3YB6
	BGNwC9bze0sqz6y0po8hM3k/d9Mzl2Jk9SBor+36CmikhRHIyy5XQSOQn0feT0EYs44D
	AhIg==
X-Gm-Message-State: AHQUAuZ7Xsq+vfqPiUgeVwHzb1l+avsH/4jI+3JUx5om+XpRigSfgkGl
	PgobhjyrYRtmrpxCDEjqIOvIMZ97jyWvkqryA5tIgIlH
X-Google-Smtp-Source: AHgI3IaCf92PNxxL4vVWtSE0VjsdQtEvan2j6LDeVcxj9feoum4pI0NPFaaLVy4V9OOW2KanMs5gB0XIRW53BxrKOw0=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr19372720qka.206.1550560494057;
	Mon, 18 Feb 2019 23:14:54 -0800 (PST)
MIME-Version: 1.0
References: <20190216170354.10645-1-zboszor@pr.hu>
	<20190218104704.14623-1-zboszor@pr.hu>
	<CAMKF1spwdGaXKr51oZM-g5Pmw8jNsUQLOs=DRsOfD3pYfAYRZg@mail.gmail.com>
In-Reply-To: <CAMKF1spwdGaXKr51oZM-g5Pmw8jNsUQLOs=DRsOfD3pYfAYRZg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Feb 2019 23:14:28 -0800
Message-ID: <CAMKF1spGuo6q450qviwopWk4LMpqDNzVAgAUrQbLQPBwc-zyNw@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Feb 2019 07:14:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

more here

NOTE: Started PRServer with DBfile: /mnt/a/yoe/cache/prserv.sqlite3,
IP: 127.0.0.1, PORT: 45089, PID: 43331
Parsing recipes...done.
Parsing of 3233 .bb files complete (0 cached, 3233 parsed). 4441
targets, 574 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'plymouth-initrd' (but
/mnt/a/yoe/sources/meta-openembedded/meta-initramfs/recipes-devtools/dracut=
/dracut_git.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'plymouth-initrd' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['plymouth-initrd']
NOTE: Runtime target 'dracut' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dracut', 'plymouth-initrd']
NOTE: Runtime target 'dracut-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dracut-dev', 'plymouth-initr=
d']
ERROR: Nothing RPROVIDES 'intel-microcode' (but
/mnt/a/yoe/sources/meta-openembedded/meta-initramfs/recipes-devtools/dracut=
/dracut_git.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'intel-microcode' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['intel-microcode']

Build Configuration:
BB_VERSION           =3D "1.40.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "arch"
TARGET_SYS           =3D "arm-yoe-linux-musleabi"
MACHINE              =3D "sama5d27-som1-ek-sd"
DISTRO               =3D "yoe-musl-sysvinit-wayland"
DISTRO_VERSION       =3D "2.6"
TUNE_FEATURES        =3D "arm vfp cortexa5 neon vfpv4 thumb callconvention-=
hard"
TARGET_FPU           =3D "hard"
meta-yoe             =3D "yoe/mut:f14a20d6c6b23391aa0b8636d0b20752e074830a"
meta-96boards        =3D "HEAD:6e8a11ea878698742e83832ef06df2c11604c338"
meta-atmel           =3D "HEAD:ac803d348433d7755803f5429c7c40f4883a5ae4"
meta-freescale       =3D "HEAD:2e83203ebd8439a45bc7a931ace6871e6b238658"
meta-freescale-3rdparty =3D "HEAD:8b38f230d4d7cd6c283d75c17eddfbe51eca90a5"
meta-odroid
meta-odroid-extras   =3D "yoe/mut:688ff9c5f549f072af204ee64d5ad3ee18b9e47f"
meta-qcom            =3D "yoe/mut:f708a3a9b6a61cd4d83a32dec4532453a127b54a"
meta-raspberrypi     =3D "HEAD:6305aa7b693fb3423bd40921144666dadd7185b8"
meta-riscv           =3D "yoe/mut:2ec848f8f37ea3c0d3538f32a59133294a9234cc"
meta-ti              =3D "yoe/mut:04c4fef39d62396ea855b5f086a969269d740562"
meta-browser         =3D "yoe/mut:974e22e9ffcba92a1d7e7aab90a6cb88b9c3e77f"
meta-qt5             =3D "HEAD:fb71293f257c6fd02ccc06765a96dbf11d4569a0"
meta-rust            =3D "HEAD:f4517aaba8026b44576c6407adf0175663d5a7b4"
meta-filesystems
meta-gnome
meta-initramfs
meta-multimedia
meta-networking
meta-oe
meta-perl
meta-python
meta-webserver
meta-xfce            =3D "yoe/mut:6adca5007190518de21ff406a141944c9d601588"
meta                 =3D "yoe/mut:36242003ab8ff7e5dd93206ff672d92f9dbbd6e4"
meta-clang           =3D "master:e96a34778c238692769c488fbe0d7781f0b929ce"
workspace            =3D "kraj/master:8a94ccf193a33feb1546455fd190ac880ff66=
fb2"

On Mon, Feb 18, 2019 at 11:01 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> https://errors.yoctoproject.org/Errors/Details/228793/
>
> On Mon, Feb 18, 2019 at 2:47 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <z=
boszor@pr.hu> wrote:
> >
> > This patchset adds the necessary pieces to create the initramfs
> > with dracut during do_rootfs.
> >
> > The 6th patch references a GitHub branch for which a pull request
> > was made against dracut. See https://github.com/dracutdevs/dracut/pull/=
535
> >
> > Best regards,
> > Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
> >
> >

