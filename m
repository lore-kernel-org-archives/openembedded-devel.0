Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73D2C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 15:26:07 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.203372.1698333961493938838
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 08:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XZC6+Cwc;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3580c2fc393so1345685ab.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 08:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698333960; x=1698938760; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKXGKGd8OcDvRthdYoMTWHFN9BEUngwQP0Z5fSCexT8=;
        b=XZC6+Cwc8mJLhGAZftrIp1PGXg73yeh/X+A7xkG/3CgehQDNOrY8ZYQqQ73++khY9Z
         cr7MpE1tbt3HPA9VGlwH86aoagcnCycUN/n9eJThQXruRtNKWnpfnSFNrBKBB1Z9drVP
         s8RepQJTdDrW5mX6ctgXm7HgoDYwgz+tzLFvi1yX96FatJ01NYF8syjrV61PQ0TBQSzQ
         dnAust5m+LsGxeBf+/p1TtplvKtdE3BBJNQs6P9cVscIrMzJ9PZeyaaPs5Z8aevA6BFW
         0qmGxIFay0gjZfsmUfoyQR35QbL4kBLiFqu/F9bhVVuMwr6+MKzu65EbfZwkSVWhSVhT
         u2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698333960; x=1698938760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKXGKGd8OcDvRthdYoMTWHFN9BEUngwQP0Z5fSCexT8=;
        b=eQeKgm/V3PieDDOlud2PvE9OW0rmzdJi1qa665LaYJhjN0ZtHms7wm6Vtt70xuP8Yl
         +7Re5COlRN3iDBS3Zyy9/K/LQ/SdVurGhRYLhXQDYpHioZJVv2KgNBIIm+KGEnTkQYoq
         Wr5R9GbRJGt+YMi7Z3r3L2VnrLlaQZy6dGUG1+lGHWqaWexwtWjqFuDXySfCO8tP+s/O
         OfAnlOgNyBXYV+WiezcOUiFzgvE9oIdm3avsnXdJdcDaWpeC6/sIAdImXYTYiLUdxyfu
         lfle77Ql9YzHIe9MApr496bR0JJAhEnvDF4J+LYxrK7XEEG1HY4nyctX19usXeEtaIHH
         1ehw==
X-Gm-Message-State: AOJu0YzhXTXv3tKSB2p6oSgG3idImwfxnc2q+Dj49c3urRAvJ98cuQ54
	B1/1tWYzVkiTk5A+cD3r0Lo1fphs1PwetBzVuu4=
X-Google-Smtp-Source: AGHT+IEvmbNTFHlFw4ckkeNN40kw5geVp1td0rxT7oI4BQTO0E1N6vJhsxfsjs2RAx9ySlSSs4rqyyE5bi3FT9P0o+E=
X-Received: by 2002:a05:6e02:1c87:b0:357:f77e:6198 with SMTP id
 w7-20020a056e021c8700b00357f77e6198mr45234ill.24.1698333960567; Thu, 26 Oct
 2023 08:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <d9ff922b-383a-4cec-b206-84d86987f4f8@navimatix.de>
 <CANPvuRkMCLPXo9FWwU+gDn4=O51=7OGWMj=Z47NGEv6F-8uZTw@mail.gmail.com>
 <CADkTA4N-aH1jf3SAVykTQ+G+t-baWNEOBjH5O56u25QJmmqw5w@mail.gmail.com>
 <CAMKF1srD7oyOwy8-ycm=wqqnpC8fGT858pManMLS6QCWL9tXXA@mail.gmail.com>
 <CANPvuRmrKmZC65RqFkHV2-wTZnMmLwH0f_cQprmB3Boc5w7sNg@mail.gmail.com> <c89d8ff8-d3b1-40b7-bf07-3d8928c0fa48@navimatix.de>
In-Reply-To: <c89d8ff8-d3b1-40b7-bf07-3d8928c0fa48@navimatix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Oct 2023 11:25:49 -0400
Message-ID: <CADkTA4NK8=9su8PUSiLETUpe725fezrHqacneiKkjDz4iDP6Lw@mail.gmail.com>
Subject: Re: [oe] openssl-native.rm_work runs before kernel-module.install ->
 no signature
To: =?UTF-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 15:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105755

On Thu, Oct 26, 2023 at 7:16=E2=80=AFAM J=C3=B6rg Sommer <joerg.sommer@navi=
matix.de> wrote:
>
> On 26.10.23 10:34, Jose Quaresma wrote:
> >
> >
> > Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> escreveu no
> > dia quarta, 25/10/2023 =C3=A0(s) 18:18:
> >
> >     I wonder if something like below would help
> >
> >     diff --git
> >     a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> >     <http://make-mod-scripts_1.0.bb>
> >     b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> >     <http://make-mod-scripts_1.0.bb>
> >     index 2cff48c39c3..6133721334c 100644
> >     --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> >     <http://make-mod-scripts_1.0.bb>
> >     +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> >     <http://make-mod-scripts_1.0.bb>
> >     @@ -12,7 +12,7 @@ S =3D "${WORKDIR}"
> >
> >      do_configure[depends] +=3D "virtual/kernel:do_shared_workdir
> >     openssl-native:do_populate_sysroot"
> >      do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
> >     -
> >     +do_populate_sysroot[depends] +=3D "openssl-native:do_populate_sysr=
oot"
> >
> >
> > This doesn't solve the problem because at compile time the openssl is
> > already there on native sysroot
>
> How about a patch like this:
>

I proposed something similar in the earlier threads on this topic (it
has been around for quite some time, and is in bugzilla for oe-core)/

I ran into issues with some kernel versions, but we may have moved on
far enough that it is no longer an issue.

static linking is another option, but it runs into some autobuilder
issues with distros that don't have a static libc.

Bruce

> ```
> diff --git i/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb=
 w/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 0e420a25d9..182abd0233 100644
> --- i/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ w/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -18,6 +18,10 @@ RDEPENDS:${PN}-dev =3D ""
>  DEPENDS +=3D "bc-native bison-native"
>  DEPENDS +=3D "gmp-native"
>
> +BUILD_LDFLAGS =3D+ "-L /build/tmp/sysroots-components/x86_64/openssl-nat=
ive/usr/lib \
> +       -Wl,-rpath-link,/build/tmp/sysroots-components/x86_64/openssl-nat=
ive/usr/lib \
> +       -Wl,-rpath,/build/tmp/sysroots-components/x86_64/openssl-native/u=
sr/lib"
> +
>  EXTRA_OEMAKE =3D " HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS=
}" HOSTCPP=3D"${BUILD_CPP}""
>  EXTRA_OEMAKE +=3D " HOSTCXX=3D"${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LD=
FLAGS}" CROSS_COMPILE=3D${TARGET_PREFIX}"
>
> ```
>
> Regards
>
> J=C3=B6rg Sommer
> --
> Navimatix GmbH
> Tatzendpromenade 2
> D-07745 Jena
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

