Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web09.11490.1628705750890311424
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Aug 2021 11:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=saJxHtPd;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id az7so3392806qkb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Aug 2021 11:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r6CKBVhvRy/YtqCGTT21G5gzqd5dl5iaR8FCoVYOWg4=;
        b=saJxHtPdOFaQELxdxnE9ZyfQ/Sui0FxYcENlO10bL8kBYofNELajRQFy4SKUfxUmFA
         jJkHT5khB6/ZAZf2PknvmxjI5sLLOASZtH496Ua+gQe3u0eiH148pHPQD6QKe41o2DIe
         e6Xnek2BSM+a4Q4LofcXwzY1KVnToz/qkLnjUCoG+fsO8cCJXbq5lj6BIhoPsJYWG8pl
         rE7kihJwGJ0vFgQ6wczc8JQIBWwVI/hg1ZL0QPHX3IGQq232tRF5ri0RZwLj8SNo0cLd
         LQsXlyYqJar5XUtFaxwjka+6fWn2sylVARnNFGLtcAD6r5pTvfGJ4hMUpIOVKJ0bb0Yy
         uYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r6CKBVhvRy/YtqCGTT21G5gzqd5dl5iaR8FCoVYOWg4=;
        b=SHXZvaByq+d8NRiOe727hbVsDXZNZeK+V+hwjG1yv3GeNBRWA+Icu9a4AxR39uHEse
         hW0jsm5yZAkVpehZBeKePrVcpPB4IOGlgRHijI2ixvkT2KF5Ze+JflDsiesAJmT71kKE
         qjVm27UgAIAx2EFDasV3Wg864NTfk8wrN1MWPBy/Od5E9Xqw6QOWJf8JQ6ZFlIeyseHN
         xNvJdOvAP4pKkU9C5kEGSiXibMgjD+LYch/4GkOOuchS/PTJ7Y0tuO352pqzhTEpE4bT
         rxwok7PUfPuGEkO5ptrhPv9UApQDe7rL2EdGPMBC7GlHwlBUbQcmShQsI52hbaeQXQCg
         rbww==
X-Gm-Message-State: AOAM5329XyJ0bPLlrNhoD6U4uDxka0rd6sNkHH5IONRdetgdPi8wou5F
	BT1Win+QWtBawUVehF7WcCv68jf7L0zmV0NuZOU=
X-Google-Smtp-Source: ABdhPJxCcsfzkz6YJRgQvyzlNWERoU6N6RtO0/6meVTWds+Yg9BBr65Os0YiOZ57s4OBzEuA8XorARpshODUH/JLd+s=
X-Received: by 2002:a05:620a:88d:: with SMTP id b13mr299338qka.125.1628705749966;
 Wed, 11 Aug 2021 11:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210810131836.137934-1-michael.opdenacker@bootlin.com>
 <CAMKF1soq0fjOp8piavjppYcCOoAesQuyb+idC3NNX-yWBjOiFw@mail.gmail.com> <9abf72ba-5ace-a600-4f68-5e98e1ce19cf@bootlin.com>
In-Reply-To: <9abf72ba-5ace-a600-4f68-5e98e1ce19cf@bootlin.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 11 Aug 2021 11:15:24 -0700
Message-ID: <CAMKF1sqJrCpxccqJr4Dsmgow2R2S-e2C=crXFbmOGLU8ggPDug@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] opus-tools: update to 0.2 and fix license
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 11, 2021 at 11:12 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Khem,
>
> Thanks for the review and checking the test report!
>
> On 8/11/21 7:23 PM, Khem Raj wrote:
> > On Tue, Aug 10, 2021 at 6:18 AM Michael Opdenacker
> > <michael.opdenacker@bootlin.com> wrote:
> >> The license in version 0.1.8 was already BSD-2-Clause and GPLv2
> >> (for the "opusinfo" command).
> >>
> >> The license checksum change is due to trivial changes on the license
> >> text ("https" instead of "http" and whitespace changes).
> >>
> >> This new version now DEPENDs on "libopusenc" and "opusfile" too.
> >>
> > Thanks for this patch, it brings up a YP compatibility issue to front see
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1455
> >
> > I think it would be better to move this recipe to meta-multimedia
> > which should fix it.
>
>
> I'll be happy to.
> However, what's really the difference between meta-oe/recipes-multimedia
> and meta-multimedia/recipes-multimedia/? Why two different directories
> in the same repository?

these are two different layers, someone may not use meta-multimedia if
its not in bblayers.conf
and thusly not see the dir under meta-multimedia, so tools/packages
which are media related
but more or less generic go into meta-oe/recipe-multimedia, which this
upgrade now depends
on packages in meta-multimedia so its better to put it in meta-multimedia now

>
> Thanks again,
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
