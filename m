Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C6BC4708C
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:09 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.3148.1649360223769470670
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 12:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q2qYSmhv;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id t207so1673166qke.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 12:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i+Ov9Ec04HVAvChuKOo7Q6E6ZUgCs8h2RQZgJFgEWoM=;
        b=q2qYSmhv1l4MKOF+xknMyfpnK9lLqO3rPgPfA5rSntM2jw9VESZKNDKktUhadf0QOQ
         3jcvOxw13c9VdSsEU+oB6Nzzl/93qXD7xIsseyV2ZepMu4hesXdoVWEwtPvBsYZh3Mt5
         sr9n459FQt2tMFk7cTXOqQLIDnpbg91LffxEXiWVbA/15LEbkE6jfYRfJL7ShDbXOxbc
         Kucvip6nV6/8/5O4O64oPTNWMMjfSjh0tzrAtZ6Ns8NVbdsWkJFF3l8XTnQBXoVGz21s
         3MDoGym0CKubMtdoK+2UL58gfiRbeaVl5StAz6+jZQ+p4oYOV8bfo3MxhWhKDlMG9xEA
         O51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i+Ov9Ec04HVAvChuKOo7Q6E6ZUgCs8h2RQZgJFgEWoM=;
        b=POnLtUgysR522Cw6fobDYETs5YI9GITfzgf7swSVQuypQoxNzQgHAlCJghxqYSbhkW
         3iaiWsFlBnnzBhKytK/EQgB7a/3xkvgKDd3JCLnTujRTfxvg5YC9CJwxa453oMdkfUcq
         Dt1xIzG5sRkR7O6Czs+VH+lz3Ge1OcmPT+ib8JJNE/biVXLuXjnxsEZDYFxW3teBfoUe
         WRv0QaZt0GxInzoxAoQnRkeQRgkb/VycxDacEzkefhEUQCzVHxCLzqIeDZOEdE/hYcNO
         TcFff34qv5Ne8oHHFb2BDIqCF+bqbzTcGfIZaZ40eqdU5/7YAGhZupai3blwu0GEF9RG
         LyVA==
X-Gm-Message-State: AOAM531vqouSwuSROQlbzzQlsR33Y2oH6i6oUkx+a80ZaIc8G52mwXIr
	CIO5BeUHTG+wBr91OomYK7JKa0pgabcJ7SGlbb0=
X-Google-Smtp-Source: 
 ABdhPJw4Ijbk2KvYeH/v005N36oUpb0BQ/ZD18DRVtmuYjspwCQjLBT6jAWBMr8cJ8eD36tC1jJArlfgyRLuwWLPaEk=
X-Received: by 2002:a05:620a:29ce:b0:67e:d7be:3491 with SMTP id
 s14-20020a05620a29ce00b0067ed7be3491mr10526156qkp.463.1649360222850; Thu, 07
 Apr 2022 12:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220404130354.2131131-1-stefan@datenfreihafen.org>
 <20220404130354.2131131-2-stefan@datenfreihafen.org>
 <CAMKF1soas80msGDvw7zB7S=8rXuz2ni4L2FwbffXw=BJ1xNygA@mail.gmail.com>
 <0dffc397-22be-a6b1-0fb2-8792c6c93dd8@datenfreihafen.org>
 <CAMKF1spYaFswwHyzmQ+FoqU1AWmgDWqiaywpm6THWOcT8-k52A@mail.gmail.com>
 <435051a8-ece0-2072-0504-0387ed282b93@datenfreihafen.org>
In-Reply-To: <435051a8-ece0-2072-0504-0387ed282b93@datenfreihafen.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Apr 2022 15:36:37 -0400
Message-ID: 
 <CAMKF1spKjhzHyB_3x+TXXjcmV0Gt6E_3gVy8k4LNKXZ2DWF9GA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/4] ot-daemon: add recipe for
 OpenThread daemon
To: Stefan Schmidt <stefan@datenfreihafen.org>
Cc: Stefan Schmidt <stefan.schmidt@huawei.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96461

On Thu, Apr 7, 2022 at 3:28 PM Stefan Schmidt <stefan@datenfreihafen.org> w=
rote:
>
>
> Hello Khem.
>
> On 05.04.22 20:08, Khem Raj wrote:
> >
> >
> > On Tue, Apr 5, 2022 at 4:39 AM Stefan Schmidt <stefan@datenfreihafen.or=
g
> > <mailto:stefan@datenfreihafen.org>> wrote:
> >
> >
> >     Hello Khem.
> >
> >     On 05.04.22 05:16, Khem Raj wrote:
> >      > fails on x86_64/glibc see
> >      >
> >     https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1=
610
> >     <https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/=
1610>
> >
> >     Ah, its not x86_64/glibc (I tested this) but the fact that the
> >     autobuilder uses poky and I tested here without DISTRO in
> >     openembedded core.
> >
> >     Seems the code base it not happy about the gcc changes to warn on t=
he
> >     combination of _FORTIFY_SOURCE and non-optimized code:
> >
> >     error: #warning _FORTIFY_SOURCE requires compiling with optimizatio=
n
> >     (-O) [-Werror=3Dcpp]
> >
> >
> > Hmm so you are not using security flags ?
>
> You mean Oniro is not using them? Not sure I can follow you train of
> thoughts here. :-)

poky defaults now a days include security_flags.inc which enables
fortify and other
good security stuff from compiler's point of view. So it seems your
distro is not inheriting
all the default distro policies was what I was trying to point at.

>
> > That=E2=80=99s not good :) you should inherit good defaults
>
> The problem above was from the autobuilder error you pointed me to,
> building with Poky not Oniro.
>
> -O2 -D_FORTIFY_SOURCE=3D2 itself works on the upstream code base, but it
> needs optimization enabled (as the error message states). No idea why
> that went wrong on the autobuilder.

-O2 is also poky default via SELECTED_OPTIMIZATION. So unless recipe is doi=
ng
something exotic to ignore these flags then it might happen because
SECURITY_FLAGS
are passed via CC not CFLAGS unlike SELECTED_OPTIMIZATION which is passed v=
ia
CFLAGS.

>
> regards
> Stefan Schmidt

