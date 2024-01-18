Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F95C47DAF
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 16:59:06 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.18324.1705597145027929630
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jan 2024 08:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=PvzWfkzI;
 spf=pass (domain: smile.fr, ip: 209.85.218.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a2d04888d3dso718608466b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 08:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705597143; x=1706201943; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MyEv9Nv8FJUkfnziEJiRMGYDOCCTBbLv1L1oN0YEUzo=;
        b=PvzWfkzIcMhLnPIlkiG4i80tK0cwglZQeGYmqTO+/JNDRf5S84PWmJndjFSuwnAX8Z
         NvNw9dQdAe/NGyZZhSQxOrwpi//zYxwHhv5x9YDdVyDsmuBtIrk6uxRgwKdNnTdI1adh
         ZIqqKHNr/a8NCcwzoHB3U5PdfnXxBlN3MncbpzurcVZT7D/RzHi8JJdAIHyBkeKM3+E6
         ypPZeShB9/Pq4s/z2wGzc3VtY8Uf4imt/9G5In3kDnFuIwKftTTvE8wT0Snl3s813FKG
         2Y9o0CdXKSr5ZNFJwdsag3OoDxj8vYMcWlJ2tUAMFeLS5CVs7qE5XGAKqjIu7fEquid9
         8Y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705597143; x=1706201943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyEv9Nv8FJUkfnziEJiRMGYDOCCTBbLv1L1oN0YEUzo=;
        b=enrZQqDJ3a290tVbCS5v6shFrweMn4CxYJUX2p+qcBA/c4LIcZO4j6J23Ximd3oz9l
         e00e9tt4WkT3dNoy8qae1DIT+1E4Grx7RGcPi8nzN/+aYhe8+QudcpEV08GKbkp2DR3V
         8AxZ8cbhaowI3qA9oiTYB0Er5FJdZDDnDOrscA5L1Z4h5O3t3ZUGokL6tVmrHgZ2lOkg
         L0KxIE6cd2d7cdMuwOO1yiONrBZIOKUKkDlmVemd2E2mVuP32oD/QZ98x+6um6oRklyQ
         yH8MPfJyNyQEWxa2JAnPqvr0R9DFYLhM36UAer30WC8wo/lqyGNMUAw64cgvl/oHJg7V
         L1BA==
X-Gm-Message-State: AOJu0YxAigi1Wc+Wq4YuOZsR1gKoDuEd5eTsHdjGZQbrhsR3aOrse0Kd
	W2sjpBV3mDhJzf1PqMHxjgSHqBkwZdmYM2jxT1Mlk4BgEIu9ecpW/lbrA7t/t2uzB+whMFF6rKh
	uMeZpwmtbrHCeTazuuERmlDBHyCJIwOW9OHTAJg==
X-Google-Smtp-Source: AGHT+IECf6SJilXKQwLpsUSzY4gqHkw7bWpYWewtsoykykQN0lYKSvOJfrkPl1TnbdrOhJgMrFPzafsc300PLgzxqS8=
X-Received: by 2002:a17:906:3da:b0:a2d:474e:8236 with SMTP id
 c26-20020a17090603da00b00a2d474e8236mr568715eja.134.1705597143381; Thu, 18
 Jan 2024 08:59:03 -0800 (PST)
MIME-Version: 1.0
References: <20240117082519.3037503-1-yoann.congal@smile.fr>
 <CAMKF1sqNjnpWcV8HTwnQiytkN5QJAufAgOv+zA1vvvh-+mF5MA@mail.gmail.com>
 <CAMSfU+5_3qkFXTAEMNvX3ewEKXcSto+xZcjqVMzHyuKwgD679Q@mail.gmail.com>
 <CAMKF1sog9N5XQyZoD3eEaDLyK8F20DbQkrBP82Eks3XtdZo55w@mail.gmail.com> <CAMSfU+7RASoD=buv3O1W0QseMKxXu2CSXZCWoPw-WyERW124NQ@mail.gmail.com>
In-Reply-To: <CAMSfU+7RASoD=buv3O1W0QseMKxXu2CSXZCWoPw-WyERW124NQ@mail.gmail.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Thu, 18 Jan 2024 17:58:37 +0100
Message-ID: <CAMSfU+4VxG4Da4Wdc0xL=puWZGTJ4mVptO-BNLR6hfeA0mwbgA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pytest-cov: Remove unbuildable BBCLASSEXTENDs
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Richard Leitner <dev@g0hl1n.net>
Content-Type: multipart/alternative; boundary="000000000000dc8c0a060f3b4713"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 16:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108349

--000000000000dc8c0a060f3b4713
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 17 janv. 2024 =C3=A0 17:44, Yoann CONGAL <yoann.congal@smile.fr> a
=C3=A9crit :

> Le mer. 17 janv. 2024 =C3=A0 17:31, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
>
>> On Wed, Jan 17, 2024 at 8:20=E2=80=AFAM Yoann CONGAL <yoann.congal@smile=
.fr>
>> wrote:
>>
>>> Le mer. 17 janv. 2024 =C3=A0 16:26, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
>>>
>>>> how about we add
>>>>
>>>> BBCLASSEXTEND =3D "native nativesdk"
>>>>
>>>> to meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb
>>>
>>>
>>> Sure! ... But I have no idea how to test it.
>>> Do we really care about pytest-cov in native environments? If yes, I'll
>>> look into it.
>>>
>>
>> Since the native extends existed before it gained the extra dependency o=
n
>> coverage package it=E2=80=99s possible that there is a use of it already=
 in place
>>
>
> Good point. I'll try test it before sending a patch.
>

Patches sent here:
[meta-python][PATCH 1/2] python3-coverage: add native and nativesdk
BBCLASSEXTEND
https://lists.openembedded.org/g/openembedded-devel/message/108346
[meta-python][PATCH 2/2] python3-pytest-cov: Add missing python3-pytest
RDEPENDS
https://lists.openembedded.org/g/openembedded-devel/message/108347

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000dc8c0a060f3b4713
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 17 janv. 2024 =C3=A0=C2=
=A017:44, Yoann CONGAL &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.c=
ongal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"auto"><div><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">Le mer. 17 janv. 2024 =C3=A0 17:31,=
 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.k=
hem@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jan 17, 2024 at 8:20=E2=80=AFAM Yoann CONGAL &=
lt;<a href=3D"mailto:yoann.congal@smile.fr" rel=3D"noreferrer" target=3D"_b=
lank">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto">Le mer. 17 j=
anv. 2024 =C3=A0 16:26, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
rel=3D"noreferrer" target=3D"_blank">raj.khem@gmail.com</a>&gt; a =C3=A9cri=
t=C2=A0:<br></div><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">how about we add<br>
<br>
BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
to meta-python/recipes-devtools/python/<a href=3D"http://python3-coverage_7=
.4.0.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">python3=
-coverage_7.4.0.bb</a></blockquote></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Sure! ... But I have no idea how to test it.=C2=A0</div><div di=
r=3D"auto">Do we really care about pytest-cov in native environments? If ye=
s, I&#39;ll look into it.<br></div></div><div dir=3D"auto"><div dir=3D"auto=
"></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Si=
nce the native extends existed before it gained the extra dependency on cov=
erage package it=E2=80=99s possible that there is a use of it already in pl=
ace</div></div></div></blockquote></div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Good point. I&#39;ll try test it before sending a patch.</=
div></div></blockquote><div><br></div><div>Patches sent here:<br></div><div=
>[meta-python][PATCH 1/2] python3-coverage: add native and nativesdk BBCLAS=
SEXTEND<br><a href=3D"https://lists.openembedded.org/g/openembedded-devel/m=
essage/108346">https://lists.openembedded.org/g/openembedded-devel/message/=
108346</a><br>[meta-python][PATCH 2/2] python3-pytest-cov: Add missing pyth=
on3-pytest RDEPENDS<br><a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/message/108347">https://lists.openembedded.org/g/openembedded-de=
vel/message/108347</a>=C2=A0</div><div><br></div></div><span class=3D"gmail=
_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"=
><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><=
font face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></di=
v></div></div>

--000000000000dc8c0a060f3b4713--

