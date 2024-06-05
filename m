Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A912C25B78
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 01:49:14 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.4860.1717552149259817683
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jun 2024 18:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XS/WQaZd;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5b9a35a0901so2266531eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 18:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717552148; x=1718156948; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBSTMlthVoyWNNe8y1zRpKxrDm7lBm/v6FdEvX42Wms=;
        b=XS/WQaZd0h5xAXQivMdU1bGZrFmjV3Rghc8USGPDj+NHd3Y7wQd39HtOEuo4Fop1PK
         wAiSa/E05jp0ri10UUbmh6WKjJrizEsaIorkjrKaombqHAIN7egT1sGhRreKBb6W/69W
         nSS9d1omcw/6PIKjI/I13WbVHZMQPSrna2++iCDYd2qbXyBJr8pgnKsCJm2d6mTHsZNg
         jbEaMa0C6g+UgJPz2iPeeKv+z+udH8eLDSEP9MFV/egqKtCKlFFmyRxMfXyeq3sHhERh
         XQWvAJRKWGWQBjmAfdKIoSI8UPiaRNBjKAivGfYWCdd+SbbE2jt7I8NzezHNklFIYDdr
         3ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717552148; x=1718156948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBSTMlthVoyWNNe8y1zRpKxrDm7lBm/v6FdEvX42Wms=;
        b=DKHZT3o/twwdzabbpLtinq2xTj2j6N0Okin4GFwxTZfzxulozA/hR8IA5qWn77QhCm
         B46fCQK7TSbvgiqK0HUxQmBG5cATIyAuSQmONhQltqVspsGITd7lbtu8kQhaZAm6aoYI
         oM+h6ByjjLOjU8Z4Vc3r5q8sheVe/jlSGcycLzl4/c2Raqlu1b+sk3xCzQBWZabPmmwP
         Q4SN7hRmjcutnQjgE3CANoAssP0q1HmZkWw+FK02aO8/XhWLr6x+EV8NnxF67+5kBg4/
         iz+QSD6DczpBrPIP4QeCGQC3ueK/rHjFkxHPchTGtzrJLUNlpuyHpOhXdQOBONZkIQCF
         EA5Q==
X-Gm-Message-State: AOJu0YyOtPEKFrwlWCBzDE70Hq3dHw10dCIj0WNqVYx/klqbJDAOqC70
	rq0V8Ila5NGb2qpcMIQGPGx8IYH6vwHuj3wbLZ4XMZxZ84fcMB+XLns664FSRUvU5TX1MJuBYN5
	pdzNc6khHtaPDAb5nCUVc0b2wLyA=
X-Google-Smtp-Source: AGHT+IHUYCG1F9ZCn+goopjq/U869cpvn6yb0RVt4RjAlev/wiEkdK9A3dy5U/44bweBQCAPOHy1bN4t+2gVlbp6uBo=
X-Received: by 2002:a05:6870:c6a1:b0:250:831b:49b1 with SMTP id
 586e51a60fabf-25122a66fc9mr1291044fac.56.1717552148421; Tue, 04 Jun 2024
 18:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240603230927.4164477-1-dmitry.baryshkov@linaro.org>
 <CAMKF1so0jzeWU3+9P_Sf_3reufN37yeeOapOKD4bQKZXu37MMw@mail.gmail.com> <CALT56yOuRxy0--fB8uHQftX=8eo0mhnzxiPgr=_8NhP84jjH8g@mail.gmail.com>
In-Reply-To: <CALT56yOuRxy0--fB8uHQftX=8eo0mhnzxiPgr=_8NhP84jjH8g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Jun 2024 18:48:42 -0700
Message-ID: <CAMKF1soxpE5_U0OxpVaf-VpypyzrD77nGh6EZSA7k7h--2ndJA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 1/2] rrdtool: fix compilation with GCC 14
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 01:49:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110691

On Tue, Jun 4, 2024 at 3:19=E2=80=AFPM Dmitry Baryshkov <dbaryshkov@gmail.c=
om> wrote:
>
> On Wed, 5 Jun 2024 at 00:12, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This patch in itself is ok however ntopng fails now with this patch app=
lied see
>
> Pretty much like lmsensors, as it seems. How should we proceed? Fix
> all existing uses?

I am afraid, yes.

>
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3899/=
steps/15/logs/stdio
> >
> >    | src/LuaEngineNtop.cpp: In function 'int ntop_rrd_tune(lua_State*)'=
:
> >    | src/LuaEngineNtop.cpp:5430:27: error: invalid conversion from
> > 'char**' to 'const char**' [-fpermissive]
> >    |  5430 |   status =3D rrd_tune(argc, (char**)argv);
> >    |       |                           ^~~~~~~~~~~~
> >    |       |                           |
> >    |       |                           char**
> >
> > On Mon, Jun 3, 2024 at 4:09=E2=80=AFPM Dmitry Baryshkov via
> > lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
> > wrote:
> > >
> > > Import patch from the rrdtool's git to fix building with GCC 14. Note=
,
> > > it also requires fixing other tools (like lmsensors) in a similar way=
.
>
>
> --
> With best wishes
> Dmitry

