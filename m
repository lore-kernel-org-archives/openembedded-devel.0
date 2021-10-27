Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F290C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 16:55:58 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.14535.1635353757494178720
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 09:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GXSCacJW;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 k2-20020a17090ac50200b001a218b956aaso2550123pjt.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 09:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Qn4XY3OdykZLQWVuJ21H9qb/xhexTTGXs6syEc9AoYQ=;
        b=GXSCacJW4puEOfqqokvCe4sh1rAoB0CsJ04PgfTRI+OxXVZhtbYQB6jnHEp6JD1coE
         k7v5qmoDGZ4/fDxxGpWJCrf1XTOmwDXq2Qw5eb+zz7jSjBVPvNM9O/847OwdE4t8DgV5
         X0vLk7NG+jKFbglZrjsGqMOzVbOWiwx5wQ4FdS0nme7DRgCuN/decFw2kh3Dtw1Zerij
         AxmKFGQLtyj72v+vd4HRWZ9VJCZ28q4P6ffwiTXEqAvFdmnm8B1jTlxZhBDLD7CyAPyu
         gEBr7vYg2+pXiATBorWGurT3ycWV9RvuM9QH6t0WJTYtsqSXz5cVqbjM+AmL6Oo3Xf1r
         bmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qn4XY3OdykZLQWVuJ21H9qb/xhexTTGXs6syEc9AoYQ=;
        b=UoAtsHuIrXpBbqQBCPzIPAGdBjicOmMY1Bwk1zR80jgKnjxFaPIH/tGqBHH8jGER5R
         yG5I2qDqZNYTII0C2UyqrtogU2r1GnsZ6RgAkxIQQ8W6SAuySPGO+avTmVHdVCJcIekD
         s+mo/r2XEZ5yOE5VUllRE+dlBw0Hap5iOry1W0+5VrvJ7qn2mwikqsSyoWMZZAdJvDer
         agj0iMb3il0nHgJGtDizzegigqHIVPclgQr2xZZ7I9b0r5KYHOqvQs3P6LKDVzYcYaf7
         mr5ujXGLmfw0KtECs0Tu1oF0eWILYJrhv+W+X089H3wZjLoIj99eplAhcANSfSpgtYdP
         dHHA==
X-Gm-Message-State: AOAM5328Pf2YcoRIEyKnIrr1oi1Uzpf2lJb3YHSvpokKywWKcfn8jQth
	RQlNmuKIu3bTW2aj5DU6DgsAbLVEVm+Tl95qarg=
X-Google-Smtp-Source: 
 ABdhPJxFPbp4df636hC3GszCmlVe2suIFwvh8SuxVRZOKnoO2ZVF8U4dFM2Ck6KXzc5YCzIekWQvIQKjuLKT17MybK0=
X-Received: by 2002:a17:90b:38c3:: with SMTP id
 nn3mr7138482pjb.110.1635353756964;
 Wed, 27 Oct 2021 09:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-6-alex@linutronix.de>
 <CALbNGRQKOSPK55jDHOVON3ct+dCgAN0j8D-EJ=Oayf0qHepJZQ@mail.gmail.com>
 <CAMKF1soHevhCSrKZM6qifuVHkAZ_CDmNkqpkDndRqB4GoygG_A@mail.gmail.com>
 <CANNYZj_j5Jm4GK8y-YB4J7Dgcwy10skHt1ba0v=XyBpLB-i09A@mail.gmail.com>
 <CAMKF1spN9551JXDzDdumeQzRovNVXTJ+w3Z1mW_G252we46zWQ@mail.gmail.com>
 <CALbNGRSE348L4+rGuMs+p_MVbWnWsbTt=yi2GTR4q8UNrV8poQ@mail.gmail.com>
 <CANNYZj8v=PBYb=mhaf+vcaiK0TZUksO1NtctdHkV-yixGQB00Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8v=PBYb=mhaf+vcaiK0TZUksO1NtctdHkV-yixGQB00Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 27 Oct 2021 18:55:44 +0200
Message-ID: 
 <CALbNGRTGQr3_fz+M3rK25kDbpD5tud+x14pNNag7aaWu5qVQVQ@mail.gmail.com>
Subject: Re: [PATCH 06/24] mozjs: update 60.9.0 -> 91.1.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Changqing Li <changqing.li@windriver.com>,
	Hongxu Jia <hongxu.jia@windriver.com>, Lei Maohui <leimaohui@cn.fujitsu.com>,
	Maciej Borzecki <maciej.borzecki@open-rnd.pl>,
 Mingli Yu <Mingli.Yu@windriver.com>,
	Ricardo Salveti <ricardo@foundries.io>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 16:55:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93635

On Tue, Oct 26, 2021 at 9:44 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 26 Oct 2021 at 07:37, Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>>
>> As long as nobody comes up with a solution, kick out meta-gnome from
>> world. In the long run I think we need multiple versions of mozjs as
>> others do. This was on my list but I am still not convinced that
>> efforts here are a just waste of time.
>
>
> There are efforts to replace sato with phosh in core, so keeping meta-gno=
me in reasonable shape would be much appreciated.
> https://github.com/moto-timo/meta-phosh/tree/timo/phosh-0.13.1
Good news:

1. mozjs-78 is building here. That is supposed to work with stable gjs
2. Have few days off - all work time accounts exceed limits:) So I
have some time to polish and get meta-gnome back to work.

Cheers,

Andreas
>
> Alex

