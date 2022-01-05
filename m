Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE33C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 20:32:13 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web09.6347.1641414732344434748
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 12:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C2HRTnC1;
 spf=pass (domain: gmail.com, ip: 209.85.166.46,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id p65so578512iof.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 12:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QunF3nt3rDp2WmfxZ3ZDLycMY7QcSo+G9VdHhwAQIqo=;
        b=C2HRTnC1A5T0Y56GuT/OeRfgm0cBev0wRp/k2yWdVQjUEY7+qvFEJ5oKKNAIsm79tv
         v66Ygr8bymD2mnIxyz9Q+5DVxiz+Bk67G00aMyIddGK/gwlIO9FojEfKAIw4XtAHwMXs
         k33ccCgdz7JfKOFcGI0CgJaKDuF9whEI2TtTl2y1KXxVCX1JFHZ9ivbCZ4AGr9/4MgG8
         7NYGs0IuRCQT8kmEFKmDGcJE03J0B/kBOjCPkQAycb0/Of2aK6JNwWgWY4phOe+HtUsJ
         BfxAO3q4ikQGnFvwFfsjuVp5W6zab6WHSYjtKebkbK4/7+X/3gRxznPOP7tah1RNLYHG
         od1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QunF3nt3rDp2WmfxZ3ZDLycMY7QcSo+G9VdHhwAQIqo=;
        b=AzaLnHxIMtFsn/h+gJ5/vhIo8mVemsfMKDwW0Jg6VfANG1O/M4djG9ekAIdlZkwCbU
         NJT85GvmQXJKpdE8WfIxWbIbJKLXsbS/dFERm812iiiISt7cdwFo4QSFUW2dEXBIp6uv
         v6BVjS8cYQ5J7O3q82kjkcVVkYZZIwaaWjOeDevPCtZzqr3uR6eALYlEhaeOjdtuQofh
         OCpP0Xr7eubu/HfsZrKNcaAUBxbIrrcGm3vUzohR2Y4BRNkdRDqySFWHz6Lljq10co3j
         3/f7exvCCCBH2FUzYwx8geP558YNOCOOmB9FsiA/dFf6UKFAFj8A+OKkYlVlGqfRUl2e
         91Uw==
X-Gm-Message-State: AOAM5335FwsgXFxw0rB8/dT573VkXmYGqMVwOlBpqIoAOAaRUcbWqY/K
	7VqwgfjN9JLq9KR23jHyI8t+weSjA4I1CIGwKiY=
X-Google-Smtp-Source: 
 ABdhPJxsUp8kzDhy2WS/WRU6+4XH6EVIBW3yytNaRl9aOQRrFDj5RjUSfva2106YKomYmIQA+bTobwHn9ZpgKvvsAko=
X-Received: by 2002:a02:ba0e:: with SMTP id
 z14mr26495670jan.249.1641414731750;
 Wed, 05 Jan 2022 12:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20220103163754.32439-1-alexk@zuma.ai>
 <CAAnfSTvy_xKboMuVNqodt5PduOtdj+tNM+qPc84X-Z=vKtSRWw@mail.gmail.com>
 <CAP9ODKpSjs7_g-aHDf=WjNDbwLDrru8h8Xu9K2zAuDGAN=beRQ@mail.gmail.com>
 <CAO5Uq5TMppqwskcZOHPUE=5fDUN5Q1QP_vRPegfFoi4jmG8M=w@mail.gmail.com>
 <CAAnfSTu04cesHKxFYYA1DGDDHnXHXOEvs6tr9TzbhdBko0R1Vg@mail.gmail.com>
 <1097f292-fa38-e981-4d4e-b3f3c0f21a2e@gmail.com>
 <CAMKF1srr4Uc53Th+goMOMcJwC-1coG2TqcBaoSakeet8iFsD2Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srr4Uc53Th+goMOMcJwC-1coG2TqcBaoSakeet8iFsD2Q@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 5 Jan 2022 20:31:59 +0000
Message-ID: 
 <CAO5Uq5Ty_mPqmW_cLZWPuvi6K+smfWWMJ867q7i9qwKSSDAFOA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] ifupdown-ng: Add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Alex Kiernan <alexk@zuma.ai>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jan 2022 20:32:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94666

Yeah, I realised that w/ some more testing locally... will pick that
up along with RCONFLICTing on ifupdown

On Wed, Jan 5, 2022 at 7:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> btw. it fails to compile with musl
>
> https://errors.yoctoproject.org/Errors/Details/621451/
>
> On Wed, Jan 5, 2022 at 8:37 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On 1/5/22 8:36 AM, Ross Burton wrote:
> > > On Wed, 5 Jan 2022 at 12:51, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > >> Smaller if anything (though I've just realised I've not dealt the
> > >> ALTERNATIVES paths correctly):
> > >
> > > There's a case to be made for just conflicting with ifupdown and not
> > > bothering with alternatives.
> >
> > thats works for me.
> >
> > >
> > > Ross
> > >
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#94662): https://lists.openembedded.org/g/openembedded-devel/message/94662
> > > Mute This Topic: https://lists.openembedded.org/mt/88115930/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >



-- 
Alex Kiernan

