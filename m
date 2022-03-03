Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E34C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 06:51:13 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.8171.1646290273123611972
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 22:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bv3Xp7T7;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id f18so3846248qtb.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 22:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=94m/4o+c1Mbly6XafyZaRjev1BP7tCTxM5fWFZeRUFY=;
        b=Bv3Xp7T7jg7frsylncdhpavFB+hIgbsreLbTQNM2zIDbDYS7OHfLrlz/K/+VPELHJj
         szZEdAEODNrsa5KWDI7SMo3/q5shwKukZusB6WeAjeLMEmdRcQ86kThDcMk0kwgHoJ+l
         NVz8xGSNmGQY6W1W8RlFS2n5UPXLlDU/tgeFvnxJ5JmgCIe9mgAOFgrPsk7xmHhfd/6k
         NwQ9281wUp7qFLM+Mc/LkScLGjzy9PTJbBMTzs1iFdNM4xiL2cUAFovzS3an2G4MJPBf
         JsnrZ/lN2PGRb8g0UQrxOg7Y8bMh4GRIxoqOtbGRsqmYdx58GchHtJqQcdy9QNIi0CTZ
         KSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=94m/4o+c1Mbly6XafyZaRjev1BP7tCTxM5fWFZeRUFY=;
        b=sQ3NW+D+LcyIzKNZSRNoyOJSAFVBKei12NkSXpqivY1NNs3U1aIRcwPbNT5tuA1wFa
         suJOCPHgVX7DzyNMqt8GUxU7vX6AQEn3KnEXeD8iXqzCiS60iMiGDaXS9p/TfsxYHFc5
         sBuyJrnXw4HhZskDJ+WOCTUzC/V8r+iL3Y53FzOP4L7UEyA/Xto8meJ/oDPLhQiymZD+
         rPPu0iayn8Dc+vqD8ovTJlk/9xJz3XSYxmKFnUBWhijYJ3TuplKSiKl5Fn9r+bY22dss
         O7mEI/Z41Fqvn684s7PLMN8UMhNa2TiLU4WMFurV50B6b+UgljrtHf/f/rNN8QJ93or9
         +HMg==
X-Gm-Message-State: AOAM531/FzBGBsGDkrbzlvZgzFsKP8kbcuOSHMSlcR4ffoDrKg0UHGjV
	WnXVOsfU4WhRcqMBTT7YPXhcp+OLtVoY7wJ5o6LIu0aJRQ4=
X-Google-Smtp-Source: 
 ABdhPJwKOodsArIaMfkVNxCDGTWfbwCb2Fw5KrJtajelZmiEMeb27ytmJH2wMEa7D3Wg5QnRZUHs3C0+BuZI9BJTRs8=
X-Received: by 2002:ac8:5a86:0:b0:2de:29af:5658 with SMTP id
 c6-20020ac85a86000000b002de29af5658mr26359014qtc.54.1646290271997; Wed, 02
 Mar 2022 22:51:11 -0800 (PST)
MIME-Version: 1.0
References: <20211020225246.659813-1-raj.khem@gmail.com>
 <5a6ea84f-a5cc-25cf-a917-db3cd3c810f2@pr.hu>
 <25148490-0b41-de90-c014-2d2856de8950@gmail.com>
 <6b1ef880-a75b-80b1-63f9-f91f88353200@pr.hu>
 <CAMKF1srf1707vBB_SnmTUcK4JUAmJOD7QYDq4D+A6XQZur5LVg@mail.gmail.com>
 <9aa32d19-b412-472e-b02e-194397331b10@pr.hu>
In-Reply-To: <9aa32d19-b412-472e-b02e-194397331b10@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2022 22:51:01 -0800
Message-ID: 
 <CAMKF1spoNVrL9D74DfHRmyw6om21hKz5U94o+4N1mTgxjnmtHg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: Upgrade to 16.11.1
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dc12f605d94ad228"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 06:51:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95728

--000000000000dc12f605d94ad228
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 2, 2022 at 10:17 PM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:

> 2022. 03. 02. 16:59 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> >
> >
> > On Tue, Mar 1, 2022 at 11:13 PM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n =
<zboszor@pr.hu
> <mailto:zboszor@pr.hu>>
> > wrote:
> >
> >     2022. 03. 01. 18:12 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> >      >
> >      >
> >      > On 3/1/22 5:35 AM, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n wrote:
> >      >> 2021. 10. 21. 0:52 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> >      >>> * This is new LTS release
> >      >>
> >      >> 16.14.0 is released since then, and 16.x is the LTS series.
> >      >> Can you please upgrade the recipe?
> >      >
> >      > Currently, drowned in making meta-oe layers build. Perhaps it
> will happen after that,
> >      > unless someone beats me to it.
> >
> >     Would you accept a patch to add into Kirkstone?
> >
> >
> > Kirkstone is not branch yet so yes
>
> A question regarding branch policy:
>
> Kirkstone will be an LTS release. It will get further
> nodejs 16.x LTS updates during its lifetime, right?


Yes usually bug fix releases are up reved

>
>
> >
> >
> >
> >      >
> >      >>
> >      >> Thanks in advance.
> >
>
>

--000000000000dc12f605d94ad228
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 2, 2022 at 10:17 PM B=C3=B6sz=C3=B6rm=C3=A9nyi =
Zolt=C3=A1n &lt;<a href=3D"mailto:zboszor@pr.hu">zboszor@pr.hu</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)">2022. 03. 02. 16:59 keltez=C3=A9ssel, Khem Raj=
 =C3=ADrta:<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Mar 1, 2022 at 11:13 PM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n=
 &lt;<a href=3D"mailto:zboszor@pr.hu" target=3D"_blank">zboszor@pr.hu</a> &=
lt;mailto:<a href=3D"mailto:zboszor@pr.hu" target=3D"_blank">zboszor@pr.hu<=
/a>&gt;&gt; <br>
&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A02022. 03. 01. 18:12 keltez=C3=A9ssel, Khem Raj =C3=
=ADrta:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On 3/1/22 5:35 AM, B=C3=B6sz=C3=B6rm=C3=A9nyi=
 Zolt=C3=A1n wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; 2021. 10. 21. 0:52 keltez=C3=A9ssel, Khem=
 Raj =C3=ADrta:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; * This is new LTS release<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; 16.14.0 is released since then, and 16.x =
is the LTS series.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Can you please upgrade the recipe?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Currently, drowned in making meta-oe layers b=
uild. Perhaps it will happen after that,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; unless someone beats me to it.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Would you accept a patch to add into Kirkstone?<br>
&gt; <br>
&gt; <br>
&gt; Kirkstone is not branch yet so yes<br>
<br>
A question regarding branch policy:<br>
<br>
Kirkstone will be an LTS release. It will get further<br>
nodejs 16.x LTS updates during its lifetime, right?</blockquote><div dir=3D=
"auto"><br></div><div dir=3D"auto">Yes usually bug fix releases are up reve=
d =C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Thanks in advance.<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000dc12f605d94ad228--

