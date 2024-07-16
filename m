Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235D4C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 15:43:01 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.14191.1721144580189331465
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jul 2024 08:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Imnv6zuH;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-25cba5eea69so2853392fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 08:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721144579; x=1721749379; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80RSOOhislMH6XZKYOqrOS1mvCEee08mL8vKFzEMJIU=;
        b=Imnv6zuHUhLOBLfwBz1APGd+OmPlzNGvnTzlel+L4wKUFh8d8FDy3rx9eU8L9a0K3U
         en6kiuxILL+m61Vwohu3c4HA0U5TxX3oLkxa34o/YJfoqEgM5Z74ZWb6rayE2J/aY0z0
         HO0v/kc4zBYLm2SzyODbzlTiHcuzjcQQGleULyGtTxh9r/A0If0WQr7zEliFSTTzcOFU
         FzhYAcMfoxwjlq7CStcvUR9fXUZ4cF0tJZSeouFP30z1HrDAw7kaDLwDmjOfAWXkoL9x
         hvonz6FFndk9/Qh6rHccaIHbphKJ24aHijPx8qNLdrtVkyGz4ahiloBcwa9jSnYFXeKb
         qXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721144579; x=1721749379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80RSOOhislMH6XZKYOqrOS1mvCEee08mL8vKFzEMJIU=;
        b=kv4j7DxF3+Ihs+am83A3t3xeKJlFd5XldlidNFJ4UnVHT/p8BwI5vDwelYEpyPZHXD
         A7Wa7gJJsGEZHK4issQCIpBySzLxQtXF77b5Vfezbslp5bX94uGx3PslvFnAA6QjVejq
         9adqgFiNqlE7vDeegqF8RdpfK1HI6l9p639QEIN+rxVs7Zs5iqDp8mVtwuRFSNEURpCh
         VqnjXXDUNo5P+TCt6/auNFT8JxMKAUXCIrkrBBlq7bI/xY0fLIZkbD02rvpHuD9wOSCD
         RRMxcxEJoRqp8ccXo2NlVcbeHC3Zwm1XxQ7rKZwsLpailuyvw57Bd8ovPKIC6SisfLMV
         c9yg==
X-Gm-Message-State: AOJu0YxBToC69tP31+Waz2ZWzm3agesCSpjYr33pVW8rRYiYnm/mE6sZ
	1p+sF2y+C2n5+xX1FM2KkOpgCyKiIrldoXNvJyezbl5BT5PKr7/x7ttCwbzHfhTScPDrAA5mTQk
	xxSjn9dDF8uMKzD+++hcp+R25/FnBz0HNrzs=
X-Google-Smtp-Source: AGHT+IEgjH+T3cS3Tk1gJ/eKHmEYdvSlGi3UZ3XMoKIlgW/wvoHK7TSrUfOcuy4yWo1Uv1GalFcqoiRrIDnIpOIQZdY=
X-Received: by 2002:a05:6870:316:b0:254:8d79:d7b7 with SMTP id
 586e51a60fabf-260bde26f4dmr2085043fac.26.1721144579255; Tue, 16 Jul 2024
 08:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240715121744.18888-1-ceggers@arri.de> <2532679.XAFRqVoOGU@n9w6sw14>
 <CAMKF1spu4fha8UzWVVU-dFQ84TsXHKKCfJxsQGHFnJgnxXAQPw@mail.gmail.com> <4907407.OV4Wx5bFTl@n9w6sw14>
In-Reply-To: <4907407.OV4Wx5bFTl@n9w6sw14>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jul 2024 08:42:33 -0700
Message-ID: <CAMKF1srofvxUUgGQqXBCxvLpTSkbK2puFamrL_U7Vmvb+BC6Dw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][RFC PATCH] include-what-you-use: new recipe
To: Christian Eggers <ceggers@arri.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 15:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111377

On Tue, Jul 16, 2024 at 7:57=E2=80=AFAM Christian Eggers <ceggers@arri.de> =
wrote:
>
> Hi Khem,
>
>
> On Tuesday, 16 July 2024, 15:45:54 CEST, Khem Raj wrote:
> > On Tue, Jul 16, 2024 at 1:08=E2=80=AFAM Christian Eggers <ceggers@arri.=
de> wrote:
> >
> > > On Monday, 15 July 2024, 16:18:14 CEST, Khem Raj wrote:
> > > > On Mon, Jul 15, 2024 at 5:18=E2=80=AFAM Christian Eggers via
> > > lists.openembedded.org
> > > > <ceggers=3Darri.de@lists.openembedded.org> wrote:
> > > >
> > > > > Based on proposal send previously here:
> > > > > https://lists.yoctoproject.org/g/yocto/topic/recipe_for/83279588
> > > > >
> > > > > This recipe depends on meta-clang, so should it be added to that =
layer?
> > > > >
> > > > > Unfortunately the 'include-what-you-use' (iwyu) tool doesn't work=
 yet.
> > > > > Although I have installed nativesdk-clang (via CLANGSDK =3D "1") =
and
> > > > > nativesdk-include-what-you-use packages, the C++ standard headers=
 are
> > > > > not found:
> > > > >
> > > > > include-what-you-use
> > > > >
> > > --sysroot=3D/opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-lin=
ux-musleabi
> > > > > impl/Fdt.cpp
> > > > > impl/Fdt.cpp:9:10: fatal error: 'cerrno' file not found
> > > > >     9 | #include <cerrno>
> > > > >       |          ^~~~~~~~
> > > > >
> > > > > As iwyu uses Clang and I have no experience working with it, this=
 is
> > > > > probably only a beginner mistake. Can Clang use the C++ headers
> > > provided
> > > > > by libstdc++, or do I need to install further packages?
> > > > >
> > > >
> > > > It can but it seems your SDK install might be missing any c++ runti=
me so
> > > > check a simple program that includes say <iostream> header and try
> > > > compiling it
> > > My SDK definitely contains std:: C++ headers for target and nativesdk=
. But
> > > the
> > > libstdc++ C++ headers are installed in GCC specific locations:
> > >
> > > /opt/poky/5.0.2/sysroots/x86_64-pokysdk-linux/usr/include/c++/13.3.0/
> > >
> > > /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux-musleabi/=
usr/include/c++/13.3.0
> > >
> > > How can Clang know that the C++ headers are located in the (GCC speci=
fic)
> > > c++/13.3.0
> > > sub directory?
> >
> >
> > Try adding -stdlib=3Dlibstdc++ on clang cmdline
>
> The following seems to work:
> include-what-you-use \
>     -target arm-poky-linux-musleabi \
>     --sysroot /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-poky-linux=
-musleabi \
>     -stdlib++-isystem /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-po=
ky-linux-musleabi/usr/include/c++/13.3.0/arm-poky-linux-musleabi \
>     -stdlib++-isystem /opt/poky/5.0.2/sysroots/cortexa7t2hf-neon-vfpv4-po=
ky-linux-musleabi/usr/include/c++/13.3.0  \
>     File.cpp
>
> Is there a way to make this a little bit handier? I would like to avoid h=
ard coding this into my CMake toolchain file.
>

Hmm so -stdlib=3Dlibstdc++ does not work ?

> regards,
> Christian
>
>
>

