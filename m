Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FAEE74AD8
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 21:14:26 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web10.31013.1733260462045617111
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Dec 2024 13:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iwOeGC5/;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: martin.jansa@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5152831bddfso1314053e0c.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 13:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733260461; x=1733865261; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SjwIkEdhYyOfTEbd4ywrTU5B/8m51rxhhou01KI3aI=;
        b=iwOeGC5/FicO1u/TE/+u4MJZJ6BQQ1FSMCkQkjtmP1lgEcrZFltdKVmrUxx7Rd6cH2
         f0SW38jNXGpJt3m9PMwSezF9TrINEbpiz445l/ijrzc+JOfalOKaVdfSOVvh8BOFQXA2
         0LpdclsMzUmScCyeeF4grU0dJFiPjQMxTKQCJ3yVx6h5iHqSIk7ZxQi/X+9iZi1Rknvk
         7GZxZaJLdLrUyXncxxs+T6FQCsugTFMiK/kBirvZRjzihk968E+AMYR+ajKDdIH0/SOo
         lSvT/fMPRAUnMQnmXaVPFCeZgJZjRezo7S24K605QJAy/4kGh00JD/GNq3zbkpBOWSq/
         x8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733260461; x=1733865261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SjwIkEdhYyOfTEbd4ywrTU5B/8m51rxhhou01KI3aI=;
        b=AtI1+1f2GAA5DyBB4eR7JLme8acUuEl1DVIkip7Kl8mPy1TRoiyUySxxfpOsk5F0p0
         Dmud9VZzs8R5JLtEfAeRbaeL4e1miLiJhohYOls6XH+qsMWJONv/RsnvGTJMD08gfneZ
         AObE/a1UHpw4t40zSnQbe3lJN8eXrKEL7jO2KJW5S0utyHi5kwgPqM0dkMbL9O5HGpwl
         kVRZNgMGepAewS426YG/7bZfMM3/Ocl0qLvtNWEYXpPYDDGAwPzAtfozyUJMBI9sfIaP
         2Pl6vxHhQTM4QvMBU93Z3GZ60hghh0Qgglhpfh9NVyLGkF55YdZaCKNjGn6QEN6zQOsl
         EwaQ==
X-Gm-Message-State: AOJu0YyQwU6I/wupZEgukIBBBfEiqq8aSeP2CHdUYiSo62odaNxuPk1N
	oBaRK4HMD68Zdkz2WY+STM6zVoUAfI8kQD7DxaeO3pdbRbYRBtweci64pQEd2KmIP04uSOPIzmp
	0Reqe0HRMRcqThNBt4Xwvw/2ZQm0IuwBy
X-Gm-Gg: ASbGncurCwfcO9+o9AY73J9e6Qy90FtKWnw1z0SgGqES8qlOgTU+LXBlG9pI7c4SrKW
	ISOOU2lfqTGh/hEu2Ar/bZAKpmTSSIFMadg==
X-Google-Smtp-Source: AGHT+IFK5zDd9naL2QIGtoOG6F1vKEdt+vzd2w+vzSTXKE0afPLaLmAgwSXOcj9GFLV4QMZ7Sfwg5jw3sisZRBVPi0M=
X-Received: by 2002:a05:6122:2985:b0:50d:56ee:b9d1 with SMTP id
 71dfb90a1353d-515cf7c8272mr3708590e0c.12.1733260461026; Tue, 03 Dec 2024
 13:14:21 -0800 (PST)
MIME-Version: 1.0
References: <XRI4.1733253467930440892.8Clv@lists.openembedded.org>
In-Reply-To: <XRI4.1733253467930440892.8Clv@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 3 Dec 2024 22:14:05 +0100
Message-ID: <CA+chaQcVDDLLVe3+FwEp=2unYzRd=v-exN25A5+D1pdzH5Gimg@mail.gmail.com>
Subject: Re: [oe] Need Support: how to install Multilib in yocto: I am
 enabling Multilib ,lib32-gcc, lib32g++ and lib32fotran #error
To: kamalgmbh32@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 21:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114191

You're using wrong overrides syntax for DEFAULTTUNE, use : instead of _.

On Tue, Dec 3, 2024 at 10:00=E2=80=AFPM Kamal GMBH via lists.openembedded.o=
rg
<kamalgmbh32=3Dgmail.com@lists.openembedded.org> wrote:
>
> local.conf file:
>
> DISTRO_FEATURES:append =3D " multilib"
> # Enable multilib support
> MULTILIBS =3D "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
> # Include lib32 versions of GCC, G++, and Fortran
> IMAGE_INSTALL:append =3D " lib32-libgcc lib32-gcc-runtime lib32-libstdc++=
 lib32-gfortran"
>
> umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build$ bitbake-=
layers show-recipes | grep libgcc
> libgcc:
> libgcc-initial:
>
> umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build$
> Here lib32-gcc details is not showing ..
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> another try:
> require conf/multilib.conf  =3D> newly added
> local.conf file:
> DISTRO_FEATURES:append =3D " multilib"
> # Enable multilib support
> MULTILIBS =3D "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
> # Include lib32 versions of GCC, G++, and Fortran
> IMAGE_INSTALL:append =3D " lib32-libgcc lib32-gcc-runtime lib32-libstdc++=
 lib32-gfortran"
>
> umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build$ bitbake-=
layers show-recipes | grep libgcc
> ERROR:  OE-core's config sanity checker detected a potential misconfigura=
tion.
>     Either fix the cause of this error or at your own risk disable the ch=
ecker (see sanity.conf).
>     Following is the list of potential problems / advisories:
>     Toolchain tunings invalid:
> No tuning found for lib32 multilib.
> Traceback (most recent call last):
>   File "/media/nvme1/umesha/kamal-poky/poky/bitbake/bin/bitbake-layers", =
line 95, in <module>
>     ret =3D main()
>   File "/media/nvme1/umesha/kamal-poky/poky/bitbake/bin/bitbake-layers", =
line 85, in main
>     tinfoil.parse_recipes()
>   File "/media/nvme1/umesha/kamal-poky/poky/bitbake/lib/bb/tinfoil.py", l=
ine 448, in parse_recipes
>     self.run_actions(config_params)
>   File "/media/nvme1/umesha/kamal-poky/poky/bitbake/lib/bb/tinfoil.py", l=
ine 431, in run_actions
>     raise TinfoilUIException(ret)
> bb.tinfoil.TinfoilUIException: 1
> umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build$
> umesha@yocto-server-2:/media/nvme1/umesha/kamal-poky/poky/build$
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114189): https://lists.openembedded.org/g/openembedde=
d-devel/message/114189
> Mute This Topic: https://lists.openembedded.org/mt/109908401/3617156
> Mute #error:https://lists.openembedded.org/g/openembedded-devel/mutehasht=
ag/error
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

