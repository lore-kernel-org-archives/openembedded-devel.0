Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2C4CF538B
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 13:45:32 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.9277.1729691129225909593
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 06:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KHm07fH6;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5ebc05007daso1896153eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729691128; x=1730295928; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZgqjJJe6evrwy1Cho4gjm/oq41Rpr5PHsL+VGu4kcI=;
        b=KHm07fH6npsXbdT0qNZ4krMML4YPvr+P+DZqReySmMdvGpzFVpeTg8LVaUSoyShdIz
         QaUE9mQ11IDsZJ+qRq6nEX/ybV1WU/OxYjYd0gfHwXDHKPa43+4h/KDnrl0v/fKoS6sa
         8V3Z95ypzSREUA5nIfXWdXJ7i2DRB9Km415R1NgSB4W3ZdcBZ/dbuyFhHc1yMYbEpmBH
         6iDtaOgHuukk9vJmQM5Ns8e9rFS035yWftXplTY5EzPpudZkE8rclr9GgeQCD94xnRVx
         r4yJ7c380k7RbZ1POYDPulZbwmBkd5zd5GnFbkHu/zOdhTokxRwNxsKw2WdSaTxIzBvq
         +QKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729691128; x=1730295928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZgqjJJe6evrwy1Cho4gjm/oq41Rpr5PHsL+VGu4kcI=;
        b=jo4qwUVyew1+nZ8HDIhbbTB4Ge7YM3gN8SLH3tfU+cwneCVW/XCa9uutjWHq3KyzxD
         yS48vYKl5rtwPCWisnD0hgj1PVeuw7rOfvb9ZvvFwdvLCdSkb8xwj+cFoLurB998IuaT
         H3YXtJYqRrOW7sJzeSNHC/6sPFdi7K+4/KqUoDj48EQIusU+59f6PfQuEfftlw7M5thp
         2MplNCTrz0a9Os0SI0upYv9WWxKY9QMCPbhM450Jxm2ygLELI3YpAGYuhv1JZmMLd46h
         rUKCHwdSOM4xh1AlRl2UwCIGrDFxZP1bes/RdZ5QYL5OkllXOVPMm3TStL33BK7XVl7R
         /b0w==
X-Forwarded-Encrypted: i=1; AJvYcCXXhqBaWtGjYZf13pE+DebZleZ1fWfw/cPe7ktkLuOPjaOWAYIUcRzdB4xLXCkeZHBGGuwM9AKtmVlGDL663TXp5WQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy9/5m1IkSM6kI1iyVc2Aq0PwIv2VN8MhGrXMpevYRjpX0eXlGK
	z1sFQEv3xmPF/cpJkcKgJa5bRrqUhgPJFNp6i6xy6HwrHpmqN1aMwsrQVf45qFi6uJwmq0VBQf4
	/qrsMbRGKid6q5JyGFIWK9MreQ0A=
X-Google-Smtp-Source: AGHT+IEc2UDY2qh/UFHtJODJv/rJG7WYVCmvqu+k58zaO2GKwLwgjfm6Jl1VmdEB1394d8gV2lsRJahrKuYKR/coeUg=
X-Received: by 2002:a05:6820:610:b0:5e7:cb2e:e01c with SMTP id
 006d021491bc7-5ebee96e08dmr2227906eaf.7.1729691128450; Wed, 23 Oct 2024
 06:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
 <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
 <64bbd9ab-d24b-4085-9e7b-abbfbc286264@amperemail.onmicrosoft.com>
 <CAMKF1sqr6WcQHBXietnNMmVqSFq2wenkMtfLSqyD5OCRxeirEQ@mail.gmail.com>
 <66ef3f0b-431c-4d4e-a3a4-9519503feeac@amperemail.onmicrosoft.com>
 <3047b261e2b8da8c814e5a33d6229a15523a2ecd.camel@codeconstruct.com.au>
 <f4956959-0c24-4f66-9048-f52b7c46a377@amperemail.onmicrosoft.com> <CAMKF1sq71MZCZZzW31kv5j6Rt68FfZkea4w-yPSZkEuykf0Dew@mail.gmail.com>
In-Reply-To: <CAMKF1sq71MZCZZzW31kv5j6Rt68FfZkea4w-yPSZkEuykf0Dew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Oct 2024 06:45:01 -0700
Message-ID: <CAMKF1soiY46pbuUF0tKYBdVh=NzP2BG0wp3+TssTwZ1LYa-jKA@mail.gmail.com>
Subject: Re: [oe] [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Chanh Nguyen <chanh@os.amperecomputing.com>, 
	openembedded-devel@lists.openembedded.org, 
	Phong Vo <phong@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, 
	Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, 
	Thu Nguyen <tbnguyen@amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 13:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113152

Hi Jeremy,

There is a new build failure seen with musl+clang

https://gist.github.com/kraj/cf85e1d301b557c791ecb410f58298ec


On Wed, Oct 23, 2024 at 6:41=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Wed, Oct 23, 2024 at 2:44=E2=80=AFAM Chanh Nguyen
> <chanh@amperemail.onmicrosoft.com> wrote:
> >
> >
> >
> > On 23/10/2024 16:38, Jeremy Kerr wrote:
> > > Hi Chanh,
> > >> I saw my patch v3 was merged to the master branch of meta-openembedd=
ed
> > >> https://github.com/openembedded/meta-openembedded/commit/b51e4288b93=
a97467b1d7dd77b4fab537bc311e3
> > >
> > > Ah, neat. Khem had just mentioned that he had merged v2, not v3.
> > >
> > > So, all looks good here? unless there are other build failures?
> >
> > Yes, Khem had merged v3
> > (https://patchwork.yoctoproject.org/project/oe/patch/20241018092326.215=
2223-1-chanh@os.amperecomputing.com/).
> > This patch is good for me.
> >
> > So, I think we don't need to do anything more.
>
> yes, I realized that the build was using an older version of patch
> since some of my CI builds run over 18 hrs,
> I lost track of patch versions. seems good for now.
>
> >
> > >
> > > Cheers,
> > >
> > >
> > > Jeremy
> >

