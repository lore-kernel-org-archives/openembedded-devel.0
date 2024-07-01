Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE1CC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 18:57:03 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.5498.1719860220403268949
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 11:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iGyzLJ0I;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-250c0555a63so1665099fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 11:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719860219; x=1720465019; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sw/bonwVYp+piBd8BooUiaRhTUJWvI0gIC3QGlP8o0g=;
        b=iGyzLJ0IhBhnhFO0LBCLv09kgKuAe7n2EGAfE8VIY4TI4SBItg1STFTg8RwLis380Z
         +RzZaa378wOUnZlzduxbKUftfLCjUQ8YnbUS4ywcG19xZWcr/YyuvUM3ipnY12QxdJ5v
         f+40GWhc3brbLRrHWShy5bT0aNyGaSV0BgcNSrpj2R9UYYmt+E0zoEzEQHtl6fGGQsP1
         gAk854xwTIFa0xQf5BLJ0O4gDYnKgGJk+XRXJLUf4JHHko6ciNykeO3lNe2361Fk3kyL
         Gtc7EOsziOP+lgr4Ht3WRE1mbcBoD+tjXw94mUPGkI8QfJyu+S6wrDhbiDuD2EMIwAIY
         aYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719860219; x=1720465019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sw/bonwVYp+piBd8BooUiaRhTUJWvI0gIC3QGlP8o0g=;
        b=OJ5JS5M10dTQ/s5pNWZadKXzhPfOMmKTONLzgFMKuzlomF9US/79zW9GsCl/bRRfHJ
         ZxEpWUgjZQvRNj4MJ1AS3NSCPecJPfdZwQ/xsvQ6aZIX3xsKThlirZvh1EWlaNmIrBss
         WUOFbAW6R3logsfZS5BGgvSIputaVCchGWXx1H+z4S9e4Zc9rtANrNjHK6IRUZWsrvlz
         DuGSwT0xA6Zqhb3inoRyc5X8Ve3fgTPw2M0wwuxlIyNka3I5DUAHccNwjWca8SOvRUcO
         MFqZS+3SYpghfqgeAYBMwliigciduaZHy9FGpTBAeeCctnBBuraZ/bRQoNZJPR0etZ5f
         wrQQ==
X-Gm-Message-State: AOJu0YxfXfUCUb/YgprZmlDqFCtWrb7r3j9Nz5ZBLlELxV41Fxx/FFuK
	LNb2p3UiormF/CAzX6xXcaSMQqHUoxHWAT05g2wNi1zqbXGdeCDicUndXLCm0W+xazbBONN7au8
	0VSk1/ESNThwx6JHRqcaIKG+E3Gk=
X-Google-Smtp-Source: AGHT+IEvX2XKYGoBF4bPFh3493d6BvPlFgMYMLefzGul+GD+upFK1HBb9xe8vyJfCLTgJTxNIHxLFdr7RSu3h8EyFZs=
X-Received: by 2002:a05:6870:b01e:b0:24f:f45e:5541 with SMTP id
 586e51a60fabf-25db340b1eemr6113767fac.24.1719860219623; Mon, 01 Jul 2024
 11:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240630124721.64234-1-f_l_k@t-online.de> <CAMKF1srwPHUtw3sAOtu80dx8FYGLODTwMwGzH4z-L0+-70hfyw@mail.gmail.com>
 <SJ0YFS.8BMPV3P7F4SC@t-online.de> <CAMKF1spH=h0FudqGDMfVkbVOOz3tggv5VWJMEgSAqsTL+J2MJw@mail.gmail.com>
 <HQGYFS.OCZ5W8J5KO0Q1@t-online.de> <CAMKF1sqHQCUHNBYJVbYx-0rfgzbyRZyC+BdKP1CyGVaRtsQX_Q@mail.gmail.com>
 <QLKYFS.017QT5RJAU1D1@t-online.de>
In-Reply-To: <QLKYFS.017QT5RJAU1D1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Jul 2024 11:56:48 -0700
Message-ID: <CAMKF1soGt8W_D9ns3OS4MCV7TUXTg0RtuV-2OoFWAyPBt1FBEA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: update 1.0.7 -> 1.2.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007440c5061c342930"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 18:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111208

--0000000000007440c5061c342930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 11:56=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:

> On Mon, Jul 1 2024 at 11:13:51 AM -07:00:00, Khem Raj <raj.khem@gmail.com=
>
> wrote:
>
> Yeah but maybe using arch overrides would be more familiar
>
>
> Can we do this without adding a new line for every architecture?
>

I will accept your v2

>

--0000000000007440c5061c342930
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 1, 2024 at 11:56=E2=80=AFAM Markus Volk &lt;<a =
href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div id=3D"m_903544971559221368geary-body" =
dir=3D"auto">On Mon, Jul 1 2024 at 11:13:51 AM -07:00:00, Khem Raj &lt;<a h=
ref=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&=
gt; wrote:<br><blockquote type=3D"cite">Yeah but maybe using arch overrides=
 would be more familiar=C2=A0</blockquote><div><br></div><div>Can we do thi=
s without adding a new line for every architecture?</div></div></blockquote=
><div dir=3D"auto"><br></div><div dir=3D"auto">I will accept your v2</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div id=3D"m_903544971559221368geary-body" di=
r=3D"auto"><div dir=3D"auto"></div></div></blockquote></div></div>

--0000000000007440c5061c342930--

