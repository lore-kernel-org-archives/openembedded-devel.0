Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F3BD4661C
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:27:28 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2996.1768505244320628577
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 11:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c7Vmj6XE;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78f99901ed5so12500367b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 11:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768505243; x=1769110043; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F2s/0hD4ZZwAhnoqBoP14d0ab9VB4ACcyaXcSP+DjiQ=;
        b=c7Vmj6XE11OJY49beO7o9ChKqI01omHbyeBsnkskA51f3VgCusyNAnJCp/yYXkl0S/
         9u+jiMPGH133C6b7/MdfCPUKxssw9JY80+foS9nDBMG5Si7JMEQF3soTFECnCcze21EK
         CzKl+E05RYH2uubDGHj+LJX1gLwHo2v0KshprvEUIrRxqEARiCJGQfmZ3cKY484QA1+O
         jcDS7nkmc4ZhUeipv+qgqpOew08ELBB6+iDvv+zpdAR66Wv66Lyfaf8qCFY9q1yowEMI
         tSyb7QD+4qESkRDPdRuk21D38S0A9xoShoPqeNGlwnRNb7ckjPADqD7sjCo/AnpAG/X+
         yOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768505243; x=1769110043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2s/0hD4ZZwAhnoqBoP14d0ab9VB4ACcyaXcSP+DjiQ=;
        b=OfHlpmruCFbCEaLo0bwjHs78hYRIzB+kB4BCIE/OFaWVYtIdu1Hb7M2R/RlrZgCZca
         pwZykVx8FibbvS08Weqcmv4S6D8Q3zf1dbWuXtIQjxEQ8k88qeVJi2x0qyF7WdzHivHw
         PXH+0BdPEqUtaxJ9xSNwqgahcP3YtOxINsm1z1S7KQtAmfV14EssC3cq51FnhXVeBXQr
         PP3CiTTt8VoEZLSRx5JdBS/VJdFXuS0zgGzQSoCat26UUmYa1JprcCEc1yK3gd8jat4u
         P3+fmO5mxzGoLgwsKEReuddBbYqPQcsXNESGAns6IXmHNK8dA6ZLzQDcZigAcw9p8dbC
         vzxQ==
X-Gm-Message-State: AOJu0YwK3U9JuL7oGcEnw6cQixM7aw6MXODZBMq0fYElHD4oFvsgMmMm
	1RJqknlhaXP7eOO4Aek8udNPhY33/A2ZGD0cJdaQB9+oMdTLoID0JbcAl9U4wBjGzuYSnhgoBum
	4TrjRymzerN8CgE1BjE1Xvz09K/sClQ0=
X-Gm-Gg: AY/fxX7NGIIzB77gbjYIVXjXi0OlzYndyoUPOhSUtGQab7dc2xbxMdLoMJY4kTz9w7P
	NaYWnZazNSi+glWUbhe93YC4tZN2Xv0J5O4ylg9rNZP4tFxCrQNpCtvLmlUo0G7HMGJXy0G/qPJ
	h0tXVz/aBxGJuXrTlrm6/Rx5SwWr4L3qzLau1mpmrfXOKZUm2HYtQwQyeFmavPy4h3v5g6BfFgz
	YMJMiTGhuKo1nhdzM0A0B0AxPa3XXh4j1oR6mIUqa3TUw4K9zb7Y95u0RYf09ApTuWtcaks7h6r
	YUdLD8dpSZEPxYeLYy4EP6GSxt+5ua/CAzbinOf7E0TsXAu7ZFwHviUdmYbpg4LjsCyp05kX3C7
	P7WxCqcaQQJNaB92M0cYuxR1CQc6YKm57TNgLDUcHMbDJSVtXxIxC
X-Received: by 2002:a05:690c:89:b0:792:7338:6981 with SMTP id
 00721157ae682-793c52a4a0bmr7519007b3.22.1768505243380; Thu, 15 Jan 2026
 11:27:23 -0800 (PST)
MIME-Version: 1.0
References: <20260115095552.566834-1-f_l_k@t-online.de>
In-Reply-To: <20260115095552.566834-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jan 2026 11:26:57 -0800
X-Gm-Features: AZwV_QjdS-F3eiulgHmFp1XLP-lxdEUGUFLK4qMAhCvSUOTUbZXO9wAm_fDij50
Message-ID: <CAMKF1speCYXE26ppB41owBrvOxovYAx+Q8g2P1WKHjp1BzqMEA@mail.gmail.com>
Subject: Re: [oe] [RFC][meta-oe][PATCH] libtoml11: build with
 CMAKE_CXX_STANDARD 20
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d0adc10648723654"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 19:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123517

--000000000000d0adc10648723654
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 1:56=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> index 38786b79ed..973a39fc21 100644
> --- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> +++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> @@ -28,6 +28,7 @@ inherit cmake ptest
>
>  EXTRA_OECMAKE +=3D "-DTOML11_PRECOMPILE=3DON \
>
>  -DTOML11_BUILD_TESTS=3D${@bb.utils.contains("DISTRO_FEATURES", "ptest",
> "ON", "OFF", d)} \
> +                  -DCMAKE_CXX_STANDARD=3D20 \
>

Why is this needed ?


>  "
>
>  ALLOW_EMPTY:${PN} =3D "1"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123498):
> https://lists.openembedded.org/g/openembedded-devel/message/123498
> Mute This Topic: https://lists.openembedded.org/mt/117276714/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d0adc10648723654
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 15,=
 2026 at 1:56=E2=80=AFAM Markus Volk via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.d=
e@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: =
Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_=
k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/libtoml11/<a href=3D"http://libtoml11_4.4.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libtoml11_4.4.0.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-oe/recipes-devtools/libtoml11/<a href=3D"http://libtoml11=
_4.4.0.bb" rel=3D"noreferrer" target=3D"_blank">libtoml11_4.4.0.bb</a> b/me=
ta-oe/recipes-devtools/libtoml11/<a href=3D"http://libtoml11_4.4.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libtoml11_4.4.0.bb</a><br>
index 38786b79ed..973a39fc21 100644<br>
--- a/meta-oe/recipes-devtools/libtoml11/<a href=3D"http://libtoml11_4.4.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libtoml11_4.4.0.bb</a><br>
+++ b/meta-oe/recipes-devtools/libtoml11/<a href=3D"http://libtoml11_4.4.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libtoml11_4.4.0.bb</a><br>
@@ -28,6 +28,7 @@ inherit cmake ptest<br>
<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;-DTOML11_PRECOMPILE=3DON \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DTOML=
11_BUILD_TESTS=3D${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;pt=
est&quot;, &quot;ON&quot;, &quot;OFF&quot;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCMAKE_CXX=
_STANDARD=3D20 \<br></blockquote><div><br></div><div>Why is this needed ?</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0&quot;<br>
<br>
=C2=A0ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123498): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123498" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123498</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117276714/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117276714/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d0adc10648723654--

