Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BB0CE7A8B
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 21:35:05 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.48408.1695591299214552599
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 14:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JSdb6dHQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1dc863efb61so3065053fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 14:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695591298; x=1696196098; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nwuYAYZE/XGCNOetkuFJzD6lNblvOz9olw/NnB7Ts9Q=;
        b=JSdb6dHQ2GQKAa0cWTF2RlfKuVJZx92D0flKwKA8IE5b52gJ5FzOkskyBjhF9+VXDM
         bQ7z5HfA8pGMeGipmqKyNnXo2bx3iw5HSpt7FdhvwngtsGmZpo6e3fI6g843a4gcLf8C
         lpJxUjzBqx4qwZEU6LS1QKMX/ylgUySxWhAbQkt7e9lP3Jc+yJRl4a5odC/teDwjRPN6
         6EZLvbf5leLVnw93PsV+xtslGSPQeUGsD7TocenRvqZy6ROEFqbhLbpw9RCLsu52nhr9
         VAJlrUY7RfjpH6Aep7mBSmGjepiv8V52KYWUix+yNckJtx0gb79D7PpNHgnaNOqt2R7t
         KhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695591298; x=1696196098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwuYAYZE/XGCNOetkuFJzD6lNblvOz9olw/NnB7Ts9Q=;
        b=nz3Y/DWuPUcYsYayJZqS8iK8S+Dg7cVnJuVVYcncquw/6Xh4wGcj1Tmo6wHwEsCGAB
         6E1ZyvDzFcR3a4RG8sLd71y2wamhM/VcEx/iojGxyQCFM4uYzpZe/4JOs3ycRBq3jh78
         O4Y9PjkFIaGnksn5BPDp3RdQvwts9JuSnQo/v5RH5In+f/wwo6USdNGBvbLNBs1adxYL
         oqABbxSa+yoMtfdyCEdkZMQ8imoyk/Wh21GYl7VDJhA31gB+dn8FwpNYHep+WQwuc/yT
         AwRfqpZTQXH/uUTqkRb+rgkiIdoSzybIEgJbdhW6P6RF3FiL1pN+rtQwmN5lwB3wJDW6
         NifA==
X-Gm-Message-State: AOJu0Yz+BvWQVAdmtGd/rbZWNIavtljbb9f0G7ALV2SqaBc3moUV/YOz
	aDAgvMrYzuLb0nBCBmHzl/IiMgHKimMkaNeEheV9fPXW
X-Google-Smtp-Source: AGHT+IFIqGpK2hMB6SQzRF0HkoCFTjyuQR195646WOY4GlbLc+0JTPbQX1E1oY5KST1FWlLWD1pFP/GgNUmWvUW76dw=
X-Received: by 2002:a05:6870:8a2c:b0:1d6:cbcd:80f8 with SMTP id
 p44-20020a0568708a2c00b001d6cbcd80f8mr7497404oaq.54.1695591298428; Sun, 24
 Sep 2023 14:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230924204711.3073-1-f_l_k@t-online.de> <20230924204711.3073-2-f_l_k@t-online.de>
 <CAMKF1speG8B1=YdbzUvfu_cN83XDLH1kYEkJRc0vb-bLRXQrgQ@mail.gmail.com> <4DEI1S.RGXZVSAXE3I31@t-online.de>
In-Reply-To: <4DEI1S.RGXZVSAXE3I31@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Sep 2023 14:34:47 -0700
Message-ID: <CAMKF1spaytbE+v1ufsosqbr8FNy=aTsSzL=3JVDCSeWY7xsG-A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] udisks2: Upgrade 2.9.4 -> 2.10.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000006f2030606219d9c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 21:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105114

--00000000000006f2030606219d9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 24, 2023 at 2:29 PM Markus Volk <f_l_k@t-online.de> wrote:

> On Sun, Sep 24 2023 at 02:25:50 PM -07:00:00, Khem Raj <raj.khem@gmail.co=
m>
> wrote:
>
> How does this end up in shared object perhaps that needs to be looked at
> as such specifying build dir in a makefile should be fine I guess
>
>
>
> https://github.com/storaged-project/udisks/blob/c7027d888c00381851d918f33=
a13102e7b86e188/src/udisksmodulemanager.c#L192
>
> i guess its this place
>

Right so it=E2=80=99s seems it=E2=80=99s trying to load stuff from build ar=
ea when it=E2=80=99s not
installed. May be for developer testing or something

So maybe we can remove that unless we need these parts during ptest then
encode a path accordingly

>

--00000000000006f2030606219d9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Sep 24, 2023 at 2:29 PM Markus Volk &lt;<a href=3D"=
mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div id=3D"m_-8971041486460837286geary-body" dir=3D=
"auto">On Sun, Sep 24 2023 at 02:25:50 PM -07:00:00, Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
 wrote:<br><blockquote type=3D"cite">How does this end up in shared object =
perhaps that needs to be looked at as such specifying build dir in a makefi=
le should be fine I guess=C2=A0</blockquote><div><br></div><div><a href=3D"=
https://github.com/storaged-project/udisks/blob/c7027d888c00381851d918f33a1=
3102e7b86e188/src/udisksmodulemanager.c#L192" target=3D"_blank">https://git=
hub.com/storaged-project/udisks/blob/c7027d888c00381851d918f33a13102e7b86e1=
88/src/udisksmodulemanager.c#L192</a></div><div><br></div><div>i guess its =
this place</div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">Right so it=E2=80=99s seems it=E2=80=99s trying to load stuff from bu=
ild area when it=E2=80=99s not installed. May be for developer testing or s=
omething=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">So maybe =
we can remove that unless we need these parts during ptest then encode a pa=
th accordingly=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_-8971=
041486460837286geary-body" dir=3D"auto"><div dir=3D"auto"></div></div></blo=
ckquote></div></div>

--00000000000006f2030606219d9c--

