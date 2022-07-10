Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74354C43334
	for <webhook@archiver.kernel.org>; Sun, 10 Jul 2022 15:21:54 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.17807.1657466510115232028
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Jul 2022 08:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RNzKOXSV;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a9so5039285ejf.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Jul 2022 08:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x/IUYnrBxKPYQ/IiZJ7kUkLFrkbnqWi9SdowfRWoiz4=;
        b=RNzKOXSVHRX8CTIufviMT0k6R590lI5RieQbzhXDzT98QaqG0peI6Lf/p8xdsTjJMa
         dpitknhqVoGwCIz2NTGeuTUIhqZ1of6jAMmkLW0Hq5SigzcwAOTFr1CbNw7ICrOLbHxD
         gaF2boOrkbRrujx6+VQeShTaM65slzlPM7duIIumnzgEHPkYSC5uZh9qxPQIOEe+vVfH
         NdvdGJZmIlZYdl6b74DJZizFGD+73sIORdIg3+GXMnBanpr4EoVGEp8d+HW63ft2z2yH
         XseH66bh1o0aE2PYM0LHHzD+zDfgVcVQC6yQ0yAYIub8iGAZL2L+syyU6Vq+/mL7IAR0
         pkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x/IUYnrBxKPYQ/IiZJ7kUkLFrkbnqWi9SdowfRWoiz4=;
        b=6mTxag7RWvwpIRQ/xkCXB6aK0a8Wd3cKYHiVczThGhV1w5WzR49nP6n/ATipaAniI6
         vWKoQN9yk15HsCtRrMWsfVH9vgDPzZa9yBDXIzFWHh609cSe84L+krP523wTEaMNhBno
         88CdGf954fip+/x3jNPOTqzrAqJVtvh35eV4c98l+pDdam6jyVYj3VQv9GjxaziDFxZl
         d5mAzkK4hpQot1UuvACWCUEUYyxDMLwz4uFAQNsgeuoVqADNJV/ZjfkOYJGJDDoaTOwH
         LYu1E9joWTH1wmJthA91PLcEZ5KWxU5VoXrpYzeH8szlEFkaMAR/nB0BVRSFiuCauyTn
         qo0g==
X-Gm-Message-State: AJIora/yX2o7ugGukvqhCV0JwIjtfEr/rwFenbRR0UuAINI3yV18jKzd
	mrTPooKt4bnjb/6xuo0mZXNze0MhDMYdLBpRuvs=
X-Google-Smtp-Source: 
 AGRyM1t+sL1/aVkOMyZro985bVKQF86YEjhUXgkVnO+COewEfpEL9jUa+Q9r/8xwKJ8C8U3tuMP5Vdb+OqmfnKIPLMQ=
X-Received: by 2002:a17:906:a10e:b0:6f3:e70b:b572 with SMTP id
 t14-20020a170906a10e00b006f3e70bb572mr14161438ejy.546.1657466508538; Sun, 10
 Jul 2022 08:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220708205048.11990-1-alex.kiernan@gmail.com>
 <20220708205048.11990-2-alex.kiernan@gmail.com>
 <CAO5Uq5QnbkKA9q9bk4xoJj2X4GT7+p3z5_QPLp2Zm1kUPRCVkg@mail.gmail.com>
 <CAMKF1srRvTF4cfxo=Mvqrd3pDRVYzz_hQFX5D52GCEfzQa17uw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srRvTF4cfxo=Mvqrd3pDRVYzz_hQFX5D52GCEfzQa17uw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 10 Jul 2022 16:21:36 +0100
Message-ID: 
 <CAO5Uq5QSDYF9jGs_SNhBU3DFjMeTuVA6G2_VEXFpp3a3ZFndGg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] nftables: Upgrade 1.0.2 -> 1.0.4
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Jul 2022 15:21:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97801

On Sat, Jul 9, 2022 at 2:48 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Jul 9, 2022 at 7:08 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > Ignore this, need to send a v2
> >
>
> do you want to rework the python packageconfig patch too ?
>

Yeah, I've had two or three goes at it and struggled to see how to
make it cooperate...

-- 
Alex Kiernan

