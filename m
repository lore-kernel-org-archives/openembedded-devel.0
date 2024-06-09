Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E415BC27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 20:36:36 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.4994.1717965396507755925
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jun 2024 13:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DNjtnumj;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-24c9f73ccaaso2035204fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Jun 2024 13:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717965096; x=1718569896; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XTkGACAcw+qAxkEXrHTYrhq8ql55vraM18N77r7Vt0=;
        b=DNjtnumj/FvB7xurMhDkfW7Fh5jUSTEB/wYnF7eVtQDe1NFnAV+ZMgXlBc75LoIG8U
         aiHPd9Ekw6rA2nrM1mSHn/3Xw14YpuauwW2B+S4PuKvAILdN0cO6LmFdO4fCJVd0ba3z
         ixQzQXukotWpvaUaIbJgXsvrKHvFAvQMxSXKS0Og+blHZzdkRx6CV+5V3BjQmbCOL/hm
         gWMmvX64ZdDWAqoqp0X6KkV5+PnZ46sgSYgZPFj3Q5VsevDDXuB3dyK8EuWbFOABfQfq
         x73MAPZvS5rUnFGX2p0BGQxf5Byo2srzXucOXJNGf+YuscHS/9tfTtaxW8So2DbCcQwS
         BjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717965096; x=1718569896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XTkGACAcw+qAxkEXrHTYrhq8ql55vraM18N77r7Vt0=;
        b=Atfyd067+ld5dTK7PUjWlYQwzmJV5njqvldJVsSOBbNGp/1zuaM6parb5zEyxpBN6v
         ZPVVsd+Uzuh8eit8CiXEp4IiNuVfN5w1C5CnBet2zv8169mpPb+2fC0iApjLYpTsXB8y
         ANpjy1iQeRi832bkevTXeVJraziY/0b/8mOLnymB7kbkTfKvhK3lykYkrNfF0RFdHKZr
         5jiiEE6cz0T1yZpq4L+4gOXwKZOLaJ7uqlYajJV8u+rkeXf+SbLV1ifkqvfKP1HYCpu2
         hRHtAy5qiKblcs2/4+XNvEZLuGblkgneTzyIWEkiRvlKi42QjNLar2oRYTlEgfbAYu2K
         iiMg==
X-Gm-Message-State: AOJu0YypNaff4mp0otks7d5s9LrqdfFF/3aZeo/LCoRKMbMPV2Ot3S1o
	S4hlEz+H00tL7ucFHjnmBVOM8anesKd0x9EETLkFeQsYt4LTjwH7o7Dbsp2rOYky7rs4XHXqXif
	gxKj15u4LJLJuRClFrpmCm6VyOcmiFA==
X-Google-Smtp-Source: AGHT+IGlX1UZK91yR8CJP2PjHgjk2zkmvUKkKd1grcdp3zQc/4bFePDq+B/tkM1nzXeDBzU5rwhC+BCPu+7gGnGRwiw=
X-Received: by 2002:a05:6870:548c:b0:254:9570:e5aa with SMTP id
 586e51a60fabf-2549570eec4mr4932362fac.57.1717965095528; Sun, 09 Jun 2024
 13:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240609184503.3742334-1-f_l_k@t-online.de> <CAMKF1so+PK9g1Jr5vmbOM2tm0Ond2-ioP_mZZ2MH+0UpHkXv_g@mail.gmail.com>
 <UCUTES.9SF6P67CS8Y93@t-online.de>
In-Reply-To: <UCUTES.9SF6P67CS8Y93@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Jun 2024 13:31:09 -0700
Message-ID: <CAMKF1spKnB0hgtAKXgW_z5Nnq=JEjQ==jOe3gD_1Nz5fmvgenA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgee: downgrade incompatible-pointer-types
 back to warning
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Jun 2024 20:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110788

On Sun, Jun 9, 2024 at 12:04=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> On Sun, Jun 9 2024 at 11:57:03 AM -07:00:00, Khem Raj <raj.khem@gmail.com=
> wrote:
>
> Is this in works upstream ? if not it will be good to atleast report it
>
>
> I had a look here and to me it seems like it needs to be to be fixed most=
ly in vala
> https://gitlab.com/fweimer-rh/fedora-modernc/-/blob/main/pkg/l/libgee.md?=
ref_type=3Dheads
>
>
> But that has been reported for various distributions, so I guess people a=
re aware of the issue
> https://lists.opensuse.org/archives/list/bugs@lists.opensuse.org/message/=
7GKXU2QW6DCH6AJQ62PLFWDMRNTEM5FD/
> https://bugs.gentoo.org/920315
>

OK cool. Would you mind sending a v2 with this info added as comment
perhaps in recipe
so someone working on it in future can try to remove it when fixed.

