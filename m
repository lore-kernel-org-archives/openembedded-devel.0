Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB6ACD1292
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 16:58:13 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.112653.1712595490106793873
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 09:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VpbOanjr;
 spf=pass (domain: linaro.org, ip: 209.85.208.51, mailfrom: fathi.boudra@linaro.org)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56e509baddaso1463504a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 09:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712595488; x=1713200288; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqC67nD2jl/uyM2q9V5z/YpmHoroclGsq1VurYaUKc4=;
        b=VpbOanjr16JhjW9DEPd1cOEQ35R1uKtxskelGdb8UtoWJ0Hm1Nu1UERvpivmYGC6Rd
         9lwInStb2xa19RBBj3DdhFjErCu7hGgVKH/OPplmSPGCCzTvOL5pT5mEXjv8fNnmW7R0
         8peOqsItqKh2tOmV5TXiAQ4vQdmvhPs0xftkJ5HPGxe4VJ1QBXc14MxQa8Cz80E5NVHx
         Q4xdXlD1J+G5z2JtAJb7ooovU8BCYx5k65/oZkvv2p4xpY+QqUYbXEvM0b7w/vQddCnW
         shDeydZTbU2cPW67eE8ma0LZLqOrbNR0M5cQI+c/4c/mUA5Tbt5lEXzaxOdszRDMip+C
         paUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712595488; x=1713200288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqC67nD2jl/uyM2q9V5z/YpmHoroclGsq1VurYaUKc4=;
        b=VUlXlmmKJCEQ05ee3XJSYCpYWYc6d9f55k/hmmGwcsUmXln0j7meYnXL9KKbZ3jGog
         ysTmUdbk7ktITaiwa6/wi3exgVm4sD0ACNd9Y+E6RIxarNcGer93Q+Y4BY3T4ZUPdDI7
         3FHylkX1jw0aw4OcUQ9W4fz8szfvRuj6iv2sHu1xn/5OM3IOXu+1ainABgOop72KPJVb
         ne33Dk3jfa1BNrBWPyes9PJE2Zp3uZnp3nok5yTf6a8EOS4+gEGZkgyhAWzodR+yutMs
         JqW73pGkcR0QHBBHdIxwXX2NCfDsdaztELtW8Kx9iXX3ONwNTNWoAf1g4d7QukBmPaBM
         vjPg==
X-Forwarded-Encrypted: i=1; AJvYcCV8ucJhNnFjJLKiiKQThzh9nkN9tV/wTc2Zm7T6NWPXRRID3wQ8rJ/75Bv8XCLJLiMOjmrjJAAk197HX30BT0tyin42FppSJyKRcrWRUhXcrSmJpXsvLdDvyg==
X-Gm-Message-State: AOJu0YyP079HizRK65b7YC4UJiQEPqI7FsAoUH5WiYg9V99ffhlHWR72
	DSc1Lla1i64nfjpGttY/kZSR/w6XgS1752W0N1zROeDAjg2cmKT85NOpT4dYW6kpqP55qvG3S4B
	cJAC8X2HsmZ/DST283T1mdF2IWzpunzGiBS9KkQ==
X-Google-Smtp-Source: AGHT+IGz2sRTJ8qlM+GZtwXRLny7ON3HKPGNFgvpyeU2QDxyyVxv+7sb+H1dc5OD75h2qIteI9QTT3D/CRmFPDMK1R0=
X-Received: by 2002:a50:c30c:0:b0:56c:5a49:736 with SMTP id
 a12-20020a50c30c000000b0056c5a490736mr6669741edb.9.1712595488395; Mon, 08 Apr
 2024 09:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240405162459.1286945-1-fathi.boudra@linaro.org>
 <CAMKF1soBViCDq1i8+ZS8k32U3rV5Hb4DbqPCXZy-+qeEgaMPtg@mail.gmail.com>
 <CAGNsrLBXGFP01o43JG8DKaLWhV9vr+cJUFaMYr=E9i5=010Cgw@mail.gmail.com>
 <CA+chaQeG4kwGjZOi4VNmk_sjQijwX_fq0s+vpZCWrqi9CXjv_g@mail.gmail.com>
 <CAGNsrLAdPdE+zqUHn-n9rjWLRMS5565EmCG3X2wkd6Ve+yF=Bg@mail.gmail.com>
 <CA+chaQfhknEQc+A9+BU7an1ywv-_F3Qd+jnX9ppvv0m3YYqg0g@mail.gmail.com> <CANPvuR=+3kp7AiyxQ8w=065eK4y0ULZcoo_zS0sTTVy_3XM_og@mail.gmail.com>
In-Reply-To: <CANPvuR=+3kp7AiyxQ8w=065eK4y0ULZcoo_zS0sTTVy_3XM_og@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Mon, 8 Apr 2024 18:57:56 +0200
Message-ID: <CAGNsrLCBCsDoo2=LU8BYstPbxgTiNPphbtS6a0AwbQqqbP88SQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] composefs: add a new recipe
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 16:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109871

Thanks Jos=C3=A9 for the pointer!

I'm retrying to reproduce with yoe/mut. Build is in progress:

Build Configuration:
BB_VERSION           =3D "2.7.3"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "debian"
TARGET_SYS           =3D "aarch64-yoe-linux-musl"
MACHINE              =3D "qemuarm64"
DISTRO               =3D "yoe"
DISTRO_VERSION       =3D "2024.04-rc.1"
TUNE_FEATURES        =3D "aarch64 crc cortexa57"
TARGET_FPU           =3D ""
meta-yoe             =3D "yoe/mut:3a9ae512457c59118b66f57a0db0b09cee6bd757"
meta-clang           =3D "HEAD:13dcab852c5bcd51fd75ae84ace9eddd99254653"
meta-qt6             =3D "HEAD:0de8ffa779c1400795f8ff3a768c2dd9fa41b579"
meta-filesystems
meta-gnome
meta-initramfs
meta-multimedia
meta-networking
meta-oe
meta-perl
meta-python
meta-webserver
meta-xfce            =3D "HEAD:9b51108d77419943c967ed1bebd734acc827568d"
meta                 =3D "HEAD:e602713fe6987d0512d368409946fee56c67caf7"


On Mon, 8 Apr 2024 at 16:56, Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> Hi Fathi,
>
> To reproduce the musl issue maybe you need to use the yoe/mut branch.
>
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dyoe/mut
>
> Jose
>
>
> Martin Jansa <martin.jansa@gmail.com> escreveu (segunda, 8/04/2024 =C3=A0=
(s) 15:40):
>>
>> > > >
>> > > > I couldn't reproduce the build failure. What am I missing?
>> > >
>> > > removing meta-filesystems from your bblayers.conf
>> >
>> > no, I'm asking about the musl basename() related build failure.
>> >
>> > The build failure about fuse3 dependency is quite obvious.
>> > In my local build, I moved the recipe to
>> > meta-filesystems/recipes-support/composefs/
>> > I'll submit a v2 for the latter but if I can reproduce the musl issue
>> > and get it fixed for v2 that would be great.
>>
>> Hi Fathi,
>>
>> I'm sorry, I've realized it just after sending the reply, gmail was
>> showing your mail as a reply to the one about meta-filesystem and I
>> didn't notice the musl issue before sending the reply, will fix that
>> with another (6th) coffee :).
>>
>> Cheers,
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#109867): https://lists.openembedded.org/g/openembedd=
ed-devel/message/109867
>> Mute This Topic: https://lists.openembedded.org/mt/105351850/5052612
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
quaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma

