Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABBAC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 15:59:30 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.8878.1646236768658000324
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 07:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k2FmlC66;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id n185so1616398qke.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 07:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GBwHXGcOkiz3e8ps7pmr5TvcLGhWiZLSQloKcTKsn3s=;
        b=k2FmlC66HUBRfu79zx1HeP0irQGbpfIcJm5E83wqwikME4kBfrKeXIzcqf0T9itAnf
         zlMwFbxDXkF45GBRMbMoni3l57GqEvV9hAnfmFYj/1/k+daCi2IMCGb+UCzhuZEy8Pbv
         jCp0Mt7Ra4GkgJSfsj36XAGLU4XUZYatKJxFFV68Ip8B05rWyCMMsI9Sh6K+0xcZmsm/
         9vM6HnFDSDoc93fn2gb1Q8rOjkJKU9dwPjJehdB2VUKNy9p5qbZBA1w8uDwWUAerMbdB
         5i0ybyfINNJ+5/8KgORgIhbj5e26kw2iTtmD4dlQHp4tEIbFnrJS+9BLRL4klctMoSrF
         lwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GBwHXGcOkiz3e8ps7pmr5TvcLGhWiZLSQloKcTKsn3s=;
        b=594j0IgEOYJK3exprdarJzLd1w5J47LnxdUvAbtBzGbhYwVAG9MQTFzMwVGjsabeWo
         n6x8DdyEltRPoXwVomZBuRRS8c2jy0jaL8g1MoRvz7FZeq/Xk7u3ZdXoj/ijvlJvk96x
         wLkC48KWGfnI01/oRivpXGvkJBD1Nt6Tetuuua55imybyK4bEgA71UtwHK/4XsNwLOzH
         bg7iKg6rwXgcCvPKfO4XamjfmfC2Q/prNEoYNH1eif1ma2shKC9cB2AAuoziUwhTRSz7
         wTgk2VR5p7qCdC7M+9iYEO4RpsBFxn86tStT8Fc1bnHsPmZneb/2m7L7EwDuFV0GoJbR
         qsMQ==
X-Gm-Message-State: AOAM531Hqa63aMQKlov/qHszasRxJnDv2k1RdxI4l6KzOCQe8/0xpm4J
	y3c3jH+vaDKuRypDwYNwe3Cg+bYq36QvwmbNsaXEgFgAXZg=
X-Google-Smtp-Source: 
 ABdhPJxA06K+sSSWLxUJXrhitDrlssxbIM/KEdKKsEZDcOr5w7fKovdPOA0JdxRM4tew4HyZhkpklkWKD+HlY8S4Sp0=
X-Received: by 2002:a05:620a:12ba:b0:663:6779:beeb with SMTP id
 x26-20020a05620a12ba00b006636779beebmr1261495qki.227.1646236767577; Wed, 02
 Mar 2022 07:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20211020225246.659813-1-raj.khem@gmail.com>
 <5a6ea84f-a5cc-25cf-a917-db3cd3c810f2@pr.hu>
 <25148490-0b41-de90-c014-2d2856de8950@gmail.com>
 <6b1ef880-a75b-80b1-63f9-f91f88353200@pr.hu>
In-Reply-To: <6b1ef880-a75b-80b1-63f9-f91f88353200@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2022 07:59:16 -0800
Message-ID: 
 <CAMKF1srf1707vBB_SnmTUcK4JUAmJOD7QYDq4D+A6XQZur5LVg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: Upgrade to 16.11.1
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bf69fe05d93e5d2c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 15:59:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95693

--000000000000bf69fe05d93e5d2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2022 at 11:13 PM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:

> 2022. 03. 01. 18:12 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> >
> >
> > On 3/1/22 5:35 AM, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n wrote:
> >> 2021. 10. 21. 0:52 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> >>> * This is new LTS release
> >>
> >> 16.14.0 is released since then, and 16.x is the LTS series.
> >> Can you please upgrade the recipe?
> >
> > Currently, drowned in making meta-oe layers build. Perhaps it will
> happen after that,
> > unless someone beats me to it.
>
> Would you accept a patch to add into Kirkstone?


Kirkstone is not branch yet so yes

>
>
> >
> >>
> >> Thanks in advance.
>
>

--000000000000bf69fe05d93e5d2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Mar 1, 2022 at 11:13 PM B=C3=B6sz=C3=B6rm=C3=A9nyi =
Zolt=C3=A1n &lt;<a href=3D"mailto:zboszor@pr.hu">zboszor@pr.hu</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">2022. 03. 01. 18:12 keltez=C3=A9=
ssel, Khem Raj =C3=ADrta:<br>
&gt; <br>
&gt; <br>
&gt; On 3/1/22 5:35 AM, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n wrote:<br>
&gt;&gt; 2021. 10. 21. 0:52 keltez=C3=A9ssel, Khem Raj =C3=ADrta:<br>
&gt;&gt;&gt; * This is new LTS release<br>
&gt;&gt;<br>
&gt;&gt; 16.14.0 is released since then, and 16.x is the LTS series.<br>
&gt;&gt; Can you please upgrade the recipe?<br>
&gt; <br>
&gt; Currently, drowned in making meta-oe layers build. Perhaps it will hap=
pen after that, <br>
&gt; unless someone beats me to it.<br>
<br>
Would you accept a patch to add into Kirkstone?</blockquote><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Kirkstone is not branch yet so yes=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Thanks in advance.<br>
<br>
</blockquote></div></div>

--000000000000bf69fe05d93e5d2c--

