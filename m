Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDA3C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 18:14:13 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.4111.1719857645061915458
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 11:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XzRmJo+J;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-700d29bb4e2so1527383a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 11:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719857642; x=1720462442; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3uNF2ym7nN+ScieeyZ97L7qSItFJFoQ8URwZ8yafDlY=;
        b=XzRmJo+J7nMpzdrOci+FCGWuTmPKp4rS/5lLOwfpcTXVzfPL8H+7UUaCx1ocsXuBkH
         ryTLMAiG2QahB3HqsVjvtEYF5Hp+Xnl/2Knu1gRBLgDE/tZDqq4FjDpmlz8sqJ2ziBnK
         QlYAnRHiyPv77wqPhW38bB5MoVQbids/e4iGXGeXlWANWEwJXTEaXhWRYwEDKHSOCRAL
         /49VMyeOw76yKU88CujheeAIli5zC4dZdojhPBQLGIM8ru0arefyBqAw/8ADlYEtmQmN
         pKhF6MCtRuSOOwPnjrME5qKgzXNsEf3Vwb9PYI4iNbj5qqmdxwzYraoZAzNwd4LUg2Fd
         lbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719857642; x=1720462442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uNF2ym7nN+ScieeyZ97L7qSItFJFoQ8URwZ8yafDlY=;
        b=EvX/v0vuWhrXtYsL1kLRDWL/9TDdgRwx36PaNBsjE87/0lndDD0Oe9lifnwShIDF9b
         LDMgEcPxGLB0VYA7rA7pYLDZKM1FxRZu9PlpRSp0vLvrx7MAzGSbMoehuoDel66bF06h
         JEBmiKa4Cmv0W2nsz4txArtGR6Wo5ZsE2rGywoUIKorPKbxjHqqWUqRCKcareh7W6wZW
         UWyLibGCsguVKm+wojv9asHZI3NYmswu4cXfGEaAp4bCcNU55KvCenYLh3Z+Mp/LRb6I
         1dngpmBaWpgUaxxOKYdNV3HRhpcEJcUtyHVZPBYADXt2QGGQkdxxtuswT/pNlA2zc2ce
         eekA==
X-Gm-Message-State: AOJu0YwQk4+gHM/duvrTlAOggMF4NWmRdWfG2tJ5oSzb1N9qqr6c95Ww
	Y7rKh23EafNq/ef4Uo4NtQ+PKmtcDw7GepoV5IGKchCEDsWsYJQp1oVemdhNpfIiU6pwUivrR/V
	4qyp9wIIo0DX9bAV0BAXK891SxmU=
X-Google-Smtp-Source: AGHT+IHcTiY2vqXFwoee6mdiA7CXtx0XxbjU/CawcpKhIB12ApgSJbEXbY2sef3bnI1dVr0Qb8m0032ugfkBaut2tyI=
X-Received: by 2002:a05:6870:2195:b0:24f:d202:8ba3 with SMTP id
 586e51a60fabf-25db34a937emr4159940fac.11.1719857642212; Mon, 01 Jul 2024
 11:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240630124721.64234-1-f_l_k@t-online.de> <CAMKF1srwPHUtw3sAOtu80dx8FYGLODTwMwGzH4z-L0+-70hfyw@mail.gmail.com>
 <SJ0YFS.8BMPV3P7F4SC@t-online.de> <CAMKF1spH=h0FudqGDMfVkbVOOz3tggv5VWJMEgSAqsTL+J2MJw@mail.gmail.com>
 <HQGYFS.OCZ5W8J5KO0Q1@t-online.de>
In-Reply-To: <HQGYFS.OCZ5W8J5KO0Q1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Jul 2024 11:13:51 -0700
Message-ID: <CAMKF1sqHQCUHNBYJVbYx-0rfgzbyRZyC+BdKP1CyGVaRtsQX_Q@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: update 1.0.7 -> 1.2.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d412bc061c338fdb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 18:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111204

--000000000000d412bc061c338fdb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 10:31=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:

> On Mon, Jul 1 2024 at 07:58:28 AM -07:00:00, Khem Raj <raj.khem@gmail.com=
>
> wrote:
>
> riscv32/armv5/mips/ppc32 perhaps is all we care.
>
>
> # Specify linking with -latomic on architectures missing 64bit atomics.
> LDFLAGS +=3D "${@bb.utils.contains_any('TUNE_FEATURES', 'riscv32 armv5 mi=
ps
> ppc32 m32', '-latomic', '', d)}"
>
> Would that be enough for now? According to my tests, it fixes the problem
> for clang i686-poky-linux-musl.
>

Yeah but maybe using arch overrides would be more familiar

>

--000000000000d412bc061c338fdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 1, 2024 at 10:31=E2=80=AFAM Markus Volk &lt;<a =
href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div id=3D"m_8490853544772660701geary-body"=
 dir=3D"auto">On Mon, Jul 1 2024 at 07:58:28 AM -07:00:00, Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt; wrote:<br><blockquote type=3D"cite"><div style=3D"white-space:break-sp=
aces">riscv32/armv5/mips/ppc32 perhaps is all we care.</div></blockquote><d=
iv><br></div><div><div># Specify linking with -latomic on architectures mis=
sing 64bit atomics.</div><div>LDFLAGS +=3D &quot;${@bb.utils.contains_any(&=
#39;TUNE_FEATURES&#39;, &#39;riscv32 armv5 mips ppc32 m32&#39;, &#39;-latom=
ic&#39;, &#39;&#39;, d)}&quot;</div></div><div><br></div><div>Would that be=
 enough for now? According to my tests, it fixes the problem for clang i686=
-poky-linux-musl.</div></div></blockquote><div dir=3D"auto"><br></div><div =
dir=3D"auto">Yeah but maybe using arch overrides would be more familiar=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_8490853544772660701gea=
ry-body" dir=3D"auto"><div dir=3D"auto"></div></div></blockquote></div></di=
v>

--000000000000d412bc061c338fdb--

