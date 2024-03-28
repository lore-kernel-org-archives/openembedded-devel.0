Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E05CD11DF
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 20:15:42 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.2007.1711656935859896533
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 13:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PSinzMA3;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6e6b01c3dc3so763557a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 13:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711656935; x=1712261735; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXSE8+EgguDiGrJlyQ90TQqbWS6fmT1Cc/yNAt0SfTI=;
        b=PSinzMA3B3QfObkYVDyjcNQX36Z5d5VR4SgV8xsJZzaK76rUNl9AF+y8kUc3n1xpZo
         jbGP1MOTLpT3xKXquAtMzhH3i7z7kTU+JhbYeEZk/cQj8soNMtKrytkSyg9biPVDVPD2
         LcLFAIi4LL8z8f19zbgr/93grhpK1gluNjv1pIE4zefq1SOU4s1ivgBKKNW431EMxSj9
         C7A9w2x25t1AgNd+t1uM/VDXkKeOXZRjXpY1+kI6Fh4kenZc4jH1o7c76S/ZSMVFUW+5
         Fi5IJQMkn+myrBPQiHOEuC2WyYVXpEMPJV/oMioLtKW8Ha0GiCBYp8T6JFc90wTuIoAP
         4elg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711656935; x=1712261735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXSE8+EgguDiGrJlyQ90TQqbWS6fmT1Cc/yNAt0SfTI=;
        b=bFu2g833G9ivTcBYFCZn/KBTeNNs3LJ+0KPJjaGZfy9LjZt7bmPapWSTSM48qj6Gpj
         0G+8wAF2zrdPNhoihBM05aGSneoBOro4X3LzLOO9aa/NZwig61nfCN5GtHOMhVoFOfC1
         4MmPhccWYF33y9DMXfswzeOknVSLnTtL8KJF28lxvOLdMiyJOHIORZvhOux3J9Ru91ca
         2w0pMaLliYaIrodBedlUxnE8EgSsKhtPrCED0jnx4NEdcuWO08KjFqi4aHUJh6MMMYB8
         UgAl+TGiW1zkmq1lfr9yBCUPfU7bfYOa/VRkyajscuCVvUr9s/qFpq8ydxwoeMzqxc0V
         7YFQ==
X-Gm-Message-State: AOJu0YyT5FZTx5i7cby3c5kl0mmWVdT2gpkdeMLbkQXvQH3QynCKFKGz
	lHdWD1KIt1wdNC11cnFDiZxHHM6bxew/wWyDtpeqloIotki7h/CGU1R/twi/f9JMpNmLi/qN7fy
	+22IKT4WikxOhhydmV4DOEKJDdFY=
X-Google-Smtp-Source: AGHT+IF0Hu0Sp8aLkiFdAqhm61bOpUvd8WqDHodXVnstKYGoLSzgM9rH9W5TBza7TwpYIApaci7/yK/8q6SymtUOD+w=
X-Received: by 2002:a05:6871:a69e:b0:221:416:1df9 with SMTP id
 wh30-20020a056871a69e00b0022104161df9mr276471oab.23.1711656934943; Thu, 28
 Mar 2024 13:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1so8Zc4w9WuD94+H360HJtnYmG_Qt50cPh8BdB+LxdKN3Q@mail.gmail.com>
 <20240327230647.694952-1-peter.marko@siemens.com> <CAMKF1sq8PuRhJHV9=k_C5jtn7DZXYFD-ExX3M_2dP0DGCytT2w@mail.gmail.com>
 <AS1PR10MB56973F70AEF71312F08CA572FD3B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697007C6F526B1C3182134FFD3B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697007C6F526B1C3182134FFD3B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Mar 2024 13:15:09 -0700
Message-ID: <CAMKF1sqZr-Y7=jdkmBAvaTq39e2pFxMoxYoE6hLUhXQYJOSh7Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] microsoft-gsl: add new recipe including ptest
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 20:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109677

No worries, I have separated it into a separate addition which will be
effective for musl
based builds alone in master-next, let me know if you have further suggesti=
ons

On Thu, Mar 28, 2024 at 11:35=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.=
com> wrote:
>
> Due to easter holidays I won't have time to analyze this until mid of nex=
t week.
> If you want to merge your patch meanwhile, please add a new comment/line =
for it.
> My comment with googletest PR reference is only valid for switch-default =
flag.
>
> Peter
>
> -----Original Message-----
> From: Marko, Peter (ADV D EU SK BFS1)
> Sent: Thursday, March 28, 2024 10:49
> To: Khem Raj <raj.khem@gmail.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: RE: [oe] [meta-oe][PATCH v3] microsoft-gsl: add new recipe inclu=
ding ptest
>
> > I did not see this when building locally with poky defaults (using 5.0_=
M3), but from screenshot I see it's failing with musl.
> > I'll try to come up with a patch, but I have never worked with musl so =
far...
> >
> > Peter.
> >
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Thursday, March 28, 2024 5:32
> > To: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH v3] microsoft-gsl: add new recipe inc=
luding ptest
> >
> > > Thanks for reworking the patch, there however is still one error popp=
ing up when ptests distro feature is enabled
> > >
> > > https://snips.sh/f/bftvz4ANO6
> > >
> > > This patch fixes it, but I would like to see if this warning is alrea=
dy fixed or can be fixed.
> > >
> > > https://snips.sh/f/pRVar8hlif
> > >
> > > On Wed, Mar 27, 2024 at 4:07=E2=80=AFPM Peter Marko via lists.openemb=
edded.org <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> ...

