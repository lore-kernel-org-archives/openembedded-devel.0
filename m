Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE33CC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 23:21:46 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.4139.1644276106137688374
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 15:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ponb6Noi;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id j12so13391152qtr.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 15:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q9sNvRz9Ud8vvo4dGZgRfHAZZk8QeN9kxnWd0BR+gIM=;
        b=ponb6Noin2FluKs0ZC1nh1oUtuEQcISOA7ZWz/rC4k+jCPPwOUPuTUTz3XYNbcKKH1
         C2oXKFPqtt5/hM+SVexbFQOBhQtdV/zFrVMIuFBcTdBEIOHcHfBcuREK6ra0WMJVD22N
         2gTf8cj0XBlRSYoQfPLdasklxGRUeNojePBnUapoKGeuh8tjO7PcC6jKW7/SaMb0Z3ps
         5U+lG3eppqf6UKutdbxOIaXk48n8L8WgjctmKGCWYCKBeaxto7Hhab3z5g0z0RyFPnIU
         K+6EK2GaaBv+4xOhaXQrmCt5svs4TynAdwq5FrSv4dKzWdAp4DT+m6GpGjCpjgQSXyh/
         Du2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q9sNvRz9Ud8vvo4dGZgRfHAZZk8QeN9kxnWd0BR+gIM=;
        b=KLl1LGKJczSon+qe6ErcMJXIATysz1gDe6iayL26iTVZSzWZIIKpUGRZKe7e/aUaQB
         ySQQKzk3CkmEoYyaDelGQa8qe2qiKVPI+034plsASmKkjN3XcFJZxxOTBd7hBNSmmUAT
         sFgNvHgtQ+nhrjAUFhwFK/xFb1pK5hnUy5dT831NKHelHCjb4JHOygFDmZqMtUujzOgq
         yzd3wtAGOo0YfG0JU2irW3xSiOrlnwsX1Fj1gnJPwZuLFVFoEufa//TPaQ0dbkovRBaf
         r5uket6Kep1mSX+f32llPtY0AMDJOXyKIsisDwzFU92owsfrHnie872VhbW7S/jDJgFe
         zS7w==
X-Gm-Message-State: AOAM532eg4EyXhyG1xN2SlfduLPVORE/8scRM8kbVdLbhmLeWvVncvy8
	jJ0d26ylDaK6M9VTEpp6apXz9wsitkBQYmYdZmU=
X-Google-Smtp-Source: 
 ABdhPJwB3vshqRt3o6fVKAd05nS1MNOHODCAY+tUhZ4o2fjKj1e+emwKRC6Pje3zo0Bt19PoewOtOXAixyHIkGCZ5Fo=
X-Received: by 2002:a05:622a:d:: with SMTP id
 x13mr1406987qtw.54.1644276105128;
 Mon, 07 Feb 2022 15:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20220128195459.216370-1-festevam@gmail.com>
 <CAP9ODKo=OPqMvbuP1p6zJSPFObxskdaBPjVW8M2LKLQ3rzwHgg@mail.gmail.com>
 <CAOMZO5BJfkfo0vecgy6bHBJCfd8vGHb34zpcqTs9WXZUVW2q-Q@mail.gmail.com>
In-Reply-To: 
 <CAOMZO5BJfkfo0vecgy6bHBJCfd8vGHb34zpcqTs9WXZUVW2q-Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Feb 2022 15:21:34 -0800
Message-ID: 
 <CAMKF1sotEuza4_SjKEHqGQXSN=Xq6mL2pJjJV66S9WsWCFjpfA@mail.gmail.com>
Subject: Re: [PATCH v4 meta-oe] rtc-tools: Add a recipe
To: Fabio Estevam <festevam@gmail.com>
Cc: Alexandre BELLONI <alexandre.belloni@bootlin.com>,
 Fabio Estevam <festevam@denx.de>,
	Heiko Schocher <hs@denx.de>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: multipart/alternative; boundary="00000000000028af7705d775ddd6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 23:21:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95249

--00000000000028af7705d775ddd6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 7, 2022 at 2:44 PM Fabio Estevam <festevam@gmail.com> wrote:

> Hi Khem and Peter,
>
> On Fri, Jan 28, 2022 at 8:57 PM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> >
> > Em sex., 28 de jan. de 2022 =C3=A0s 16:54, Fabio Estevam
> > <festevam@gmail.com> escreveu:
> > >
> > > From: Fabio Estevam <festevam@denx.de>
> > >
> > > rtc-tools is a useful utility developed by Alexandre Belloni
> > > for testing RTC kernel drivers, such as y2038 support.
> > >
> > > Based on the initial recipe from Heiko Schocher <hs@denx.de>.
> > >
> > > Signed-off-by: Fabio Estevam <festevam@denx.de>
> >
> > Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>



> Are you happy with this version


Yes it should be in master


>
> Thanks
>

--00000000000028af7705d775ddd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Feb 7, 2022 at 2:44 PM Fabio Estevam &lt;<a href=3D=
"mailto:festevam@gmail.com">festevam@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Hi Khem and Peter,<br>
<br>
On Fri, Jan 28, 2022 at 8:57 PM Otavio Salvador<br>
&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">o=
tavio.salvador@ossystems.com.br</a>&gt; wrote:<br>
&gt;<br>
&gt; Em sex., 28 de jan. de 2022 =C3=A0s 16:54, Fabio Estevam<br>
&gt; &lt;<a href=3D"mailto:festevam@gmail.com" target=3D"_blank">festevam@g=
mail.com</a>&gt; escreveu:<br>
&gt; &gt;<br>
&gt; &gt; From: Fabio Estevam &lt;<a href=3D"mailto:festevam@denx.de" targe=
t=3D"_blank">festevam@denx.de</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; rtc-tools is a useful utility developed by Alexandre Belloni<br>
&gt; &gt; for testing RTC kernel drivers, such as y2038 support.<br>
&gt; &gt;<br>
&gt; &gt; Based on the initial recipe from Heiko Schocher &lt;<a href=3D"ma=
ilto:hs@denx.de" target=3D"_blank">hs@denx.de</a>&gt;.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Fabio Estevam &lt;<a href=3D"mailto:festevam@denx.=
de" target=3D"_blank">festevam@denx.de</a>&gt;<br>
&gt;<br>
&gt; Acked-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex" dir=3D"auto"><br>
Are you happy with this version</blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Yes it should be in master</div><div dir=3D"auto"><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Thanks<br>
</blockquote></div></div>

--00000000000028af7705d775ddd6--

