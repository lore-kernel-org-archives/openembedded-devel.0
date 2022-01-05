Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE16C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 19:06:59 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.5097.1641409618094825206
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 11:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fbNC0cuL;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id q3so96007qvc.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 11:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kWx+F81upRJAI3Hpc+HZglkIchmvNPPoqrFUZH3V8UE=;
        b=fbNC0cuLdXpfcyylkKSTw5liPw2vJ32vRm6iheEvSlX6/yY50TS0rvO6JdgyJAiEum
         Gshd7U2P87xUeyWiVknLpJs/iLHsTZjbargVIgXwudo74NLLdoARiAp5XgidXsbbs1Pi
         pjdZG4Pg8C2aBbtT6PIBNaFv5EX7K8VArVhvsux32gOrhNALQOxf9qwfWqP4lGbswNTy
         yzLsKt/szQfmQhLlasefUDlmybyNtVX06pAf30PS44NWP2JNCPhUJns6PtABZXRLbxLU
         QxlOOcNrX3Oi/ZqUUO/FoG1CJSEThbKRWsS5x7nkfELrpRGTCyTNnP3tBkGCznkXrgg3
         Ef1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kWx+F81upRJAI3Hpc+HZglkIchmvNPPoqrFUZH3V8UE=;
        b=O7Zfha5JYdmoRFOAABQPyR+FOVmhsOzLvr+YZtsARqJwyX6u+l0yO4EwiOCIFHZ87x
         hFVZodr6EckB/lo+ogBEfK/nF4R/QXufCnp5jqho+jsIV5wVILL62OcqcC909ouV/7mt
         RPlpyAQ0vpNqAawyridUMEwTs2t7LfP7EUzuWzUVewl37HbI87DHqQ/RCzOcew5TJ1of
         lz+jK9YQ8RohkP9EBXF7IV+nhnG4mP6rN/qV3a9W3LxAbtyKc5U51ZF7vSKIfxUi1JI/
         cSTRfCmsYlWA2f150m4brDrXfU4ZdbTpK/Krj3JxKZX5hhH245jN1q9+8hkSgGjowkG3
         /dFg==
X-Gm-Message-State: AOAM531zBgPaICZokGAWUoIYcXDZS1hi70959Ld3D35qWjuYRjkfkHKO
	WzhGoUt27v/F66auMGQdqVyv3nHcssXZyJI4dMI=
X-Google-Smtp-Source: 
 ABdhPJxLxuVWPHdLgyrWU4Vl5zMR2htMCHYFvMhco5ysNRp5GfbBEOVBMeLj28PRVR/PKZSshOHPBBjk7Sra7KvDUMw=
X-Received: by 2002:a05:6214:268e:: with SMTP id
 gm14mr24270357qvb.24.1641409617143;
 Wed, 05 Jan 2022 11:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20220103163754.32439-1-alexk@zuma.ai>
 <CAAnfSTvy_xKboMuVNqodt5PduOtdj+tNM+qPc84X-Z=vKtSRWw@mail.gmail.com>
 <CAP9ODKpSjs7_g-aHDf=WjNDbwLDrru8h8Xu9K2zAuDGAN=beRQ@mail.gmail.com>
 <CAO5Uq5TMppqwskcZOHPUE=5fDUN5Q1QP_vRPegfFoi4jmG8M=w@mail.gmail.com>
 <CAAnfSTu04cesHKxFYYA1DGDDHnXHXOEvs6tr9TzbhdBko0R1Vg@mail.gmail.com>
 <1097f292-fa38-e981-4d4e-b3f3c0f21a2e@gmail.com>
In-Reply-To: <1097f292-fa38-e981-4d4e-b3f3c0f21a2e@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Jan 2022 11:06:30 -0800
Message-ID: 
 <CAMKF1srr4Uc53Th+goMOMcJwC-1coG2TqcBaoSakeet8iFsD2Q@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] ifupdown-ng: Add recipe
To: Ross Burton <ross@burtonini.com>, Alex Kiernan <alex.kiernan@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Alex Kiernan <alexk@zuma.ai>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jan 2022 19:06:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94665

btw. it fails to compile with musl

https://errors.yoctoproject.org/Errors/Details/621451/

On Wed, Jan 5, 2022 at 8:37 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 1/5/22 8:36 AM, Ross Burton wrote:
> > On Wed, 5 Jan 2022 at 12:51, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >> Smaller if anything (though I've just realised I've not dealt the
> >> ALTERNATIVES paths correctly):
> >
> > There's a case to be made for just conflicting with ifupdown and not
> > bothering with alternatives.
>
> thats works for me.
>
> >
> > Ross
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#94662): https://lists.openembedded.org/g/openembedded-devel/message/94662
> > Mute This Topic: https://lists.openembedded.org/mt/88115930/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

