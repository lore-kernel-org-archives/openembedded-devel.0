Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADC2C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 21:13:07 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.8090.1752095586023066590
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 14:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zl2nJUE5;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3121aed2435so386662a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 14:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752095585; x=1752700385; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsbcr1XjuCfiGhNd0R7tPBerEZLSDuR2W73trfhTCpE=;
        b=Zl2nJUE53XvdtrIB5/Jtj5ILjQD2esMuCZWVOooaI/Povfnc2SbEMQ8DsHBz6AafBh
         /M/9llVxkJphM8dMGTB/gb/u30lieijz6WeWV1/JBAcybIiw6X3/mJHARw9QRXjl5RWH
         V9QFe4ao5tRYejzifctYvYs8u+RODTQoPn2MPoZkfcMEn7/v3D9q2j7WSqWpJQ3KFkHT
         39KbBh56KBq4iJ76GwEScOweRObwc9e+m68Z+Q/iftzGAfzk6uH5i+9nc8QtUJbCgQ3S
         p67mcYyhcJfUflMeP7v/kHWIX8J5kYABdVOyG2sbG6ec1wRFTiDvTQk2ghp+GPBqNbPv
         83cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752095585; x=1752700385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsbcr1XjuCfiGhNd0R7tPBerEZLSDuR2W73trfhTCpE=;
        b=qMVwj2/en01YEJcmyzJlOUS0qrtjSniipyITt2Jw6cH9GkB4sFzYYdiBdcJVtLUXVK
         Lc0J8xCLroyCAJ1a+x9rCg5wRubjF4/o3Fr+lTGNKwBfMWDpfJ/H+cIeWn4hXkYYXRd4
         1K3fod/HzeXGi3tft0P3XrcW4NhcaPttygyfviLUzQll6d4iir94G9Py4+9PUQOSSRKi
         ryXSM1+YMcQ9tQsBeiIyxzd48nGQChrJ6bD7XU1SiACz5tLw4d78nmbSj8sun+rUl/51
         t7t4/iIJWdzExBrOMfQWrt/kYgc839n1WyNORV9WYPEqMTW/vwqQ6vD0an1B5vaZvt29
         pRRw==
X-Gm-Message-State: AOJu0Yx5ZtfsZsgpDlGl8yODG6FBnE0n3YY6g7x69SXPNzNKs1DNGmha
	Z2t2jpRueEAcmP6GXnh3wtI/fFDvkRQuG5Zza9c6hsSTp7PDv895Xm/5iBXeCRUkMgAEZpY7Rk+
	oYERTANA3/r3ORB/3372G1p0r9cpYFI4=
X-Gm-Gg: ASbGncsIcVLkj6CYTaDVAWz0S5iWqsiJXVRCOEqcyNj+tEytn7pVMNUZC4HErOEDxkn
	yGX7XltijbDkumCsrzrSbBRM/dbcwW0QHURxaA2GjtIsLT1HhGS50nOUSRJ/jSOAsnLIyL3IJU6
	BTvq4kgOFyVOBfumyrc+BiqV1qV6C5gCxDVFIR3qRkUxhWNUcvHUiuNQ==
X-Google-Smtp-Source: AGHT+IFpVqLPLpbAnMowf6EVByYoeTzau066LK7ydJrktsZcLzDG5+rctUzNaTfONQHk91q+K+FLvTYEyC84mc9CKTA=
X-Received: by 2002:a17:90b:3a10:b0:31c:15d9:8a5 with SMTP id
 98e67ed59e1d1-31c2fdb90e5mr5725458a91.19.1752095585452; Wed, 09 Jul 2025
 14:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
 <20250708195636.1678606-9-alperyasinak1@gmail.com> <b2bd24e4-8fb3-46bb-bab4-7cb1aa879939@gmail.com>
 <CAGpma=4KFF47kXbLoAxkG8ZWw1ppNw4Hz+pvb2zCbdP3fUFsvg@mail.gmail.com>
In-Reply-To: <CAGpma=4KFF47kXbLoAxkG8ZWw1ppNw4Hz+pvb2zCbdP3fUFsvg@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Thu, 10 Jul 2025 00:12:53 +0300
X-Gm-Features: Ac12FXwMhzdKmweHxPaW9DC42Dnzr6xcyhOeUaEIUr6FNb74VIiEVhMsE4jtgBM
Message-ID: <CAGpma=6En51-3akzWUyW6+90PtO0GWviz=s6ZXYw3zap28sH4w@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 09/20] yajl: Add patch for CMake
 4+ compatibility and fix build issue
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 21:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118387

Sent a v2 patch ->
https://lists.openembedded.org/g/openembedded-devel/message/118386

Alper Ak <alperyasinak1@gmail.com>, 9 Tem 2025 =C3=87ar, 13:52 tarihinde =
=C5=9Funu yazd=C4=B1:
>
> > ...this other patch is in the very same PR referenced in the first
> > patch, but the status is different. Shouldn't this be "Submitted" also,
> > like above?
>
> Yes, it should be as you say. It even makes more sense to do it with a
> single patch. I will send a fix.
>
>
> Gyorgy Sarvari <skandigraun@gmail.com>, 9 Tem 2025 =C3=87ar, 13:43
> tarihinde =C5=9Funu yazd=C4=B1:
> >
> > On 7/8/25 21:56, Alper Ak via lists.openembedded.org wrote:
> > > +++ b/meta-oe/recipes-devtools/yajl/yajl/0001-allow-build-with-cmake-=
4.patch
> > > +Upstream-Status: Submitted [https://github.com/lloyd/yajl/pull/256]
> >
> > Yes, okay, but...
> >
> > > +
> > > +++ b/meta-oe/recipes-devtools/yajl/yajl/0002-cmake-Use-TARGET_FILE-i=
nstead-of-LOCATION-property-f.patch
> > > +Upstream-Status: Pending
> > > +
> > ...this other patch is in the very same PR referenced in the first
> > patch, but the status is different. Shouldn't this be "Submitted" also,
> > like above?

