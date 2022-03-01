Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2C7C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 23:07:50 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.1567.1646176069235171065
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 15:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e5OTbIOo;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id y11so213298pfa.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 15:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VFF+I3cINN1IBhyUOWHR3N0B80ymOBKclVJRyx03SEo=;
        b=e5OTbIOoSRVv8sBtEfTAX5Y2OxENWmg+UcUq7VnUliwrkV67xS491M458vmXi0yUwW
         lVb7DoDZDQebH9l1Ym4+L+p/3ejFINDUoiwzoM59DtB9Z+W1EYIl9AT15p2NZ90CzqMM
         iKtqXJNrDOPo6zxR525ww8ZhzwZln7GE7LJGzaeaOZ80txEVTd9Whpdsn/S0BoCsA1gF
         olQRCA1mDhQtdQ1oMRff6zoflLNAuGJE19dO8IXCleO7geCVI+96OvcJ1Jn8IUh0CAEF
         /jpSaLIkcLYahnPXXAyfSau9vp7kDMApYzr2/dLZUQagb31Llt9QKWJ3GFi0YOmQExJ8
         fkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VFF+I3cINN1IBhyUOWHR3N0B80ymOBKclVJRyx03SEo=;
        b=KbVoPnmakKQLwtAocd2NQARgemQc/cCRwisKY+eGOwwRr3320Aiz5k5wa5ixR8QYbM
         S7QCf/N/Fo8b/FHb6ZK50yZV+FsEFveoj4DnL7DHLFZWY7Edi/d32xd5/kEoIhdsVQda
         yraJBcBnkfjvzk17rlXora+jbssOpvq7QYfdpr5b+izvq8LXGsQAgGRwQMjArshtDsQU
         VF1yB3/c3fs+IQeL6BKm4rzt91NvgRm1tU84DIvtxzJMJmoVr4xSPuX8WvfMVdSH4WqG
         HjX9NCWwOlHeD9BbQKB/aafjqC5p63EjUFKTie/DRsuw3mwp6u9BklHm6GeGHNy7uC9X
         de5g==
X-Gm-Message-State: AOAM530CFSsIfQu93MZy09PpZwa2plMvzHlozbBwqmtKcLmOXaFzU/uB
	0SkwcUIGkvW3vgxGKze/0HTSzkbj8u9O8fTGV9o=
X-Google-Smtp-Source: 
 ABdhPJxgFmQz2DK2vuMt0mPIXqkBpXNsSOmoo+NW1nbot9dKhBdInWMiZYAbGhUUfvWeMdp0al+/H0QMqdunpvCcmmI=
X-Received: by 2002:a65:6050:0:b0:378:c9e5:b3ab with SMTP id
 a16-20020a656050000000b00378c9e5b3abmr7502505pgp.338.1646176068786; Tue, 01
 Mar 2022 15:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20220301161346.700028-1-adrian.freihofer@siemens.com>
 <20220301161346.700028-2-adrian.freihofer@siemens.com>
 <CALbNGRSwiKucj4zY6QM8tNyV50_G0kogj8Z19b2Bfpor1RDVOw@mail.gmail.com>
 <59062e31c64e9bcf77261a3e087888a64bd1ad95.camel@gmail.com>
In-Reply-To: <59062e31c64e9bcf77261a3e087888a64bd1ad95.camel@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 2 Mar 2022 00:07:33 +0100
Message-ID: 
 <CALbNGRSaqz13u0pYGvktUAfW25-iO3Q5YMfhLhv7Lte5AYnxnw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/2] networkmanager: new configure
 options
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 23:07:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95667

> > And you promise to maintain this on future updates?
>
> It should not be that hard since it is what NetworkManager maintainers
> do as well:
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/main/contrib/fedora/rpm/NetworkManager.spec
>
> The use case is about supporting different devices, some with wifi,
> some with wwan.... These additional packages provide the ability to
> build different images for different devices, which without this split
> would require different distros. Maintaining different distros to
> support different build variant of NetworkManager is much less elegant
> than splitting the plugins into separate packages and build just one
> generic NetworkManager.
>
I understood your use case. Consider your answer more a 'no'

Andreas

