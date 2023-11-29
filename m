Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B9BC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 04:43:51 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.24484.1701233021814057103
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 20:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PtWxQ5m0;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5d28f5bbd6cso344757b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 20:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701233021; x=1701837821; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9/KflFOzhk55KOIecPPgGJzKzD7FPkDu5k03JM64+5w=;
        b=PtWxQ5m0IrLjua+ikgBxcfcYer4kcTzmCsa1n3IY4ieknH2LTbQnMhw8+3TV5XhbJ+
         xPHqpSz6BoqotJeZmp/zYpvTVp73ex4Kk7K8moUTm4bcKftygXZa7vp4ZKxtpeVEf7PC
         OOuoLN0KlznydGe2XwDP0Hw3e48Cki1LlHiuqzoDFXXPw+xXpqxK+TYNhLLsAsN2z5Ay
         dTQUgRyZHsSekfSmhC5xFE9LGfQvfp6V4a6+6JBf7Xnq7Jc8ua11jxQuJTK4tIThAEAF
         GYzZh9fm8+KmU9/CikLZu2TscBaFlOGWYtqhBcOwshNfBs7AYqjbBFoTRZ2Szn9RjYgf
         Ib7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701233021; x=1701837821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/KflFOzhk55KOIecPPgGJzKzD7FPkDu5k03JM64+5w=;
        b=iPmKhGl1Evr3b7Qac238UHklKsrjN5yhbLGSK7QTr8i+//J7H5RJGWHRQGHfW0Q9HF
         +Hxgbg159yBlQsMKvSQQ/2KZBDt7Rw7yCML8FLe8WRHwzwm7Eejdc8MB+H7w/zWdZRxk
         C4nNDbTnjpcjcsRYe8R3Dw/QCImu92YCWQI1cJjJIbKVm8fkX5Vib6eP/JJxc8cauwQp
         ZYuDE2NYjM4mBH+1xgTkgQEdBVzJ054B6ZXRmklV8yosqVTiRrTbTIB4gLsp0CL5tbir
         S9lC5fkHvLXHcY+KPWkOUouYTAPLCah52/idMbnIlGmoxMp1E0SQamgHYN8GcH3KsYVC
         /t7g==
X-Gm-Message-State: AOJu0YzuEmq6H5D7IXg4wDoRPitPuI7/+W9/t+Na7NYhCrqsafzF1bgc
	fQ6B3E5wQsgDfmvs/cGkcVioRVBOL+NdtsbF+rk=
X-Google-Smtp-Source: AGHT+IHuLV5M8N9TkERg0nonE8fZ72Koru1Wk3zwB+k2QwbKszS/fug5ytq5nFaQLICMsVgqIOs4+E7Uk5Cg39nOGsg=
X-Received: by 2002:a05:690c:4606:b0:5cf:5cc2:8e98 with SMTP id
 gw6-20020a05690c460600b005cf5cc28e98mr10275549ywb.38.1701233020861; Tue, 28
 Nov 2023 20:43:40 -0800 (PST)
MIME-Version: 1.0
References: <1701160714-28412-1-git-send-email-wangmy@fujitsu.com> <170121573096.1187527.4630232823668380798.b4-ty@gmail.com>
In-Reply-To: <170121573096.1187527.4630232823668380798.b4-ty@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 28 Nov 2023 20:43:29 -0800
Message-ID: <CANx9H-Cg6wAgafNMVRAWGMsH3NCoEr7x92cMmQ6DjO6Shdp95A@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 2.5.1 -> 2.5.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
Content-Type: multipart/alternative; boundary="000000000000e38161060b432d1d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 04:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107130

--000000000000e38161060b432d1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW, this is not run-time useful because of the missing
python3-pydantic-core dependency (which requires 'maturin' backend).
Since
https://github.com/pydantic/pydantic/commit/594effa279668bd955e98f1cd5c036b=
37d3bbd40

Sadly, the build does not report any issues and this has been lurking
quietly for quite some time. There is no reason to skip this
particular update. The issue crept in quite a while ago.

This will be corrected in the coming days as python3-maturin and a
python_maturin.bbclass are added to oe-core to enable
building the python3-pydantic-core package. Backporting will have to be
done in a mixin layer.

On Tue, Nov 28, 2023 at 3:55=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

>
> On Tue, 28 Nov 2023 16:38:34 +0800, wangmy@fujitsu.com wrote:
> > Changelog:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -uprev pydantic-core to 2.14.5
> > -Add ConfigDict.ser_json_inf_nan
> > -Fix validation of Literal from JSON keys when used as dict key
> > -Fix bug re custom_init on members of Union
> > -Fix JsonValue bool serialization
> > -Fix handling of unhashable inputs with Literal in Unions
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] python3-pydantic: upgrade 2.5.1 -> 2.5.2
>       commit: 0260e1498e475899d1c13c05f928c5a886d151c4
>
> Best regards,
> --
> Khem Raj <raj.khem@gmail.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107117):
> https://lists.openembedded.org/g/openembedded-devel/message/107117
> Mute This Topic: https://lists.openembedded.org/mt/102847338/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e38161060b432d1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW, this is not run-time useful because of the missing p=
ython3-pydantic-core=C2=A0dependency (which requires &#39;maturin&#39; back=
end).<div>Since=C2=A0<a href=3D"https://github.com/pydantic/pydantic/commit=
/594effa279668bd955e98f1cd5c036b37d3bbd40">https://github.com/pydantic/pyda=
ntic/commit/594effa279668bd955e98f1cd5c036b37d3bbd40</a></div><div><br></di=
v><div>Sadly, the build does not report any issues and this has been lurkin=
g quietly for quite some time. There is no reason to skip this</div><div>pa=
rticular update. The issue crept in quite a while ago.<br><br><div>This wil=
l be corrected in the coming days as python3-maturin and a python_maturin.b=
bclass are added to oe-core to enable</div><div>building the python3-pydant=
ic-core=C2=A0package. Backporting will have to be done in a mixin layer.</d=
iv></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, Nov 28, 2023 at 3:55=E2=80=AFPM Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><br>
On Tue, 28 Nov 2023 16:38:34 +0800, <a href=3D"mailto:wangmy@fujitsu.com" t=
arget=3D"_blank">wangmy@fujitsu.com</a> wrote:<br>
&gt; Changelog:<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; -uprev pydantic-core to 2.14.5<br>
&gt; -Add ConfigDict.ser_json_inf_nan<br>
&gt; -Fix validation of Literal from JSON keys when used as dict key<br>
&gt; -Fix bug re custom_init on members of Union<br>
&gt; -Fix JsonValue bool serialization<br>
&gt; -Fix handling of unhashable inputs with Literal in Unions<br>
&gt; <br>
&gt; [...]<br>
<br>
Applied, thanks!<br>
<br>
[1/1] python3-pydantic: upgrade 2.5.1 -&gt; 2.5.2<br>
=C2=A0 =C2=A0 =C2=A0 commit: 0260e1498e475899d1c13c05f928c5a886d151c4<br>
<br>
Best regards,<br>
-- <br>
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107117): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107117" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107117</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102847338/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/102847338/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e38161060b432d1d--

