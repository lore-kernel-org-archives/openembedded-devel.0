Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96949C02199
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 04:32:47 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.23759.1739075561740848939
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Feb 2025 20:32:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W9izi4AA;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2a9ef75a20dso3493950fac.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Feb 2025 20:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739075561; x=1739680361; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jQlpmhUiK59hks+vNRt7/7fvPADL1UQAoeIxVaKN6Q=;
        b=W9izi4AAyGFFP7gnjJHK5wctrrwaiftuEIpIZjU9Jdc9ATqEewoIMm7rNFnsWK4EXz
         4Aj+jaqB2g6yRN25oewAj0T1ToCdIjoxcaSPgaJ2Ev4zrHks9DWVzU9EFL3w01Eb1EYO
         trEXbsCDLZtG9jOV33MX2qLTr+iI8vFuUc+2R5aXCrrUGndl80tFTpz1lAW19IcCOQnl
         kAjKBq6UwkuG6EzRHqnLqA9pJ5uy25b7ZiNT96ko8y69G0mTixCiDKY9ZHzTsVajduMS
         V24FNnMrvh5NViphUJJGvEpCsxEypt3UGB2OYVC4YRpkDZYPNByvGOfJReMewTKGDOMk
         5cXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739075561; x=1739680361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jQlpmhUiK59hks+vNRt7/7fvPADL1UQAoeIxVaKN6Q=;
        b=W5n5ydQuNbxSDmBQg8v+3eV91N3dxadZCvKGpesMi82tkem0t3wSLJr1kp+il9BBSt
         4oaspX0o6RpuiCYw35Cg2HK7Ctp3j4rtP/t2wRCn2Pou1byPl1Hr32L39v2yBsTl/817
         zfjfNlkk+qIgrCnkGlcLCXca+1e4tyUow2Da9WaB+bQaqL3ShSe+X80glGQKL5hkZ5Vc
         y6huVGa/juXrX7BiQy/QvLkydYEJ3AeBL8iNHeCV65jJ2jEJ5nRsH0BQbidPo3wQT2xL
         pjk8sC8nYmTlzpBlHNVVCGlEqXyZfBNdw+H2QACvY/MMIAcWJ7i/jSqZu1FX25HY1Q1t
         imdg==
X-Forwarded-Encrypted: i=1; AJvYcCVmDdylvgNBXSl5/kYahMhEBlPUd5cXXuah0q+TA4qN5rwdM0O8GEbamcgZ1FBMvYDi8az6gtWsJnY03+mveKpgGP8=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz+39H5d0iCouyqI/Y52bcjJkkQOPuX71W/FycLdZ5JQZTr2P4U
	DSAKkb8SrL+Z9WAGkgxYwfL01Q/ql5PUUyjCAkrAacAKy4A3M11gaxwtgBHRJRpcg9Tc/p9XH6V
	t1I40+zbCrSRsnh3qCqTndoNUrqY=
X-Gm-Gg: ASbGncv0GaYJaMNZCZfJtsGl+6tZfClQnRxZFMFul+WmV+9YbZ4KVoAVnm+hjhVFyAY
	nGpdRQKFOfzrlPL0d7gU6MmnTqTx8NQBHAvM5Ut47nQoNoo+n+cjMVSCLfuqLPM9TOLe+sBh4vY
	ZL3tjf60mCqJ4=
X-Google-Smtp-Source: AGHT+IExgs/bz29Q0vlM92fDEnTe3vOUfjuECkJNWW5F4TXcMV1aviMEEk9REEpSkoyK/SmCZZtHotAVawonCgy4WxA=
X-Received: by 2002:a05:6870:82aa:b0:29e:509c:3711 with SMTP id
 586e51a60fabf-2b83ec22ce7mr5023713fac.15.1739075560984; Sat, 08 Feb 2025
 20:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20250208150308.2451484-1-peter.marko@siemens.com>
 <20250208150308.2451484-3-peter.marko@siemens.com> <8abe2241-03de-405c-a862-d4c4c5e754c7@gmail.com>
 <AS1PR10MB569711835D42CC78E89BC505FDF02@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569711835D42CC78E89BC505FDF02@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Feb 2025 20:32:15 -0800
X-Gm-Features: AWEUYZlBVOO0hJ4-HKcMVxW2XX-wxNviBEdy8ahxMKTNIv9XDs4-I4H8oYqX7x8
Message-ID: <CAMKF1soseB8dBa1gKeteKBZAWySCDQBrEEs3uJP3PyeMkkxZqw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/4] grpc: fix protobuf-lite package config
To: peter.marko@siemens.com
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Feb 2025 04:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115316

On Sat, Feb 8, 2025 at 10:04=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
>
>
> > -----Original Message-----
> > From: Gyorgy Sarvari <skandigraun@gmail.com>
> > Sent: Saturday, February 8, 2025 18:42
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH 3/4] grpc: fix protobuf-lite package =
config
> >
> > > Note: for native, this packageconfig does not even compile and for
> > > target it fails to link.
> > Since it couldn't be more broken even if it tried, what do you think
> > about dropping this conf altogether and simply hard-disabling it in
> > EXTRA_OECMAKE (if it's not off by default)?
>
> Since I'm not using it, I don't have strong opinion on this.
> Removing broken features is good, but maybe this works
> in all other releases and it's broken only temporarily?
>
> I'd defer this question to Khem.
>
> In general, this is a problem with most of non-default
> packageconfig options - not tested things are slowly rotting.
> Ideally there would be autobuilder test with alternative configuration fo=
r all recipes...
>

since its not enable in default set of packageconfig, so it wont break
common usecase
but if someone wants to use it, then they will have to fix it before
using it. So in a way
its a bad taste on one end but perhaps an opportunity to fix it on the
other. So I am
ambivalent, this change makes things better syntactically so I will
accept this patch
but if you send me another one to remove the packageconfig that can be
considered too.

> Peter
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115315): https://lists.openembedded.org/g/openembedde=
d-devel/message/115315
> Mute This Topic: https://lists.openembedded.org/mt/111070545/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

