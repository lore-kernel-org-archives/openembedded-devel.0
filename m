Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D06C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 23:36:19 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.73604.1718667374514453756
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jun 2024 16:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d5DNpFbY;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-632bcf111ffso32748037b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jun 2024 16:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718667373; x=1719272173; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/m5odR2HmUhQthsHvGVqLn3CHyKH1y/Nd67i4hOF6Y4=;
        b=d5DNpFbY4gu3AfO/VqXG0xCwg9wDYPmk/NOFCQEOL8aca+M1Ya17fa7zl5/Z+VYGLf
         FKdENqf1SOgD2w8Rz5NgyjmCoJTWFymDgCRWXdxy7597EccSGSm7L1iW/Mps5w9ntEO7
         +mmKgzwVoXfHcFJa4T+P1GAvt+blZlP2H4SNbp5teUQjPkZRcuSlPmdR34lXMNvGDO7N
         PAptI6xUFwRXAqHs1PwHU1avDI+n5FgpENZnFnJ6nBm809N/N6yBT3VGwzUthsdnY6F8
         njUa7OJok7d8WFGfjkmf92StsWytKu9H3dJI3J+75t5aIQZ9qVTIzlV63ertEYb9icI5
         1iuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718667373; x=1719272173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/m5odR2HmUhQthsHvGVqLn3CHyKH1y/Nd67i4hOF6Y4=;
        b=eMCgVMRxBI7sSRAz1coC5+E088eGjPTPy582Bf5GdAtslytdPn6HDMAxQR5K5fEexQ
         7SPChCFP5SPwO+u0N7lzzQ27BhrBvl/HYd675UK8MDvXM6gAF5wQYCaukm7335JbkX0e
         U1KBixRl0Cbp45yO5xbCWRTFCIDUhRVVGykLcLZR5Dfp76qQETka33tVLJbMUpmbsAkZ
         IwpitCHcQuggSARezZO6EBYVh3klmqsNumZqQvLg+72Da6M4R5UoYB/fvF8Bp25v54ag
         X7AFj/YR5OzyRfHtEf2wMRDLhBEGmbuHRjixPFOtTH1vU+nDtRZFyjmVJc7I4ETBulRi
         YqEg==
X-Forwarded-Encrypted: i=1; AJvYcCWSxAmPIoLs4WKQFs3G65/5Fs2jzf/isKI0+dggg9tMatKY8Hc9gYiKQVnbq0Wh1nE6Zaz8kXRnXkKAWH1OJVIFc8JE5OSZWNGRtavYapVImBWrGXQXG/d8kw==
X-Gm-Message-State: AOJu0YycnF2amlALQ1xOQwPDFJk/nWk+Deiy1o18E7I1GjqrtTPsoRtO
	DB9DW6civUOFALmcLi8ZYPaz/bVPrGSliRwuNdAqfNK8jwGx3eV7Dj1xd9iLP6tciWscMvmABJA
	1Hi+GQytH/Djle7VPhL9mxiUoFlQ=
X-Google-Smtp-Source: AGHT+IEH9212eveQC+xbimq6w6pUiEVf8D6gp8YcBZ4N3d8zBG2NW8+Cunz4HEU+P5AR77qzAaj7s+dG1pgLJIVEscs=
X-Received: by 2002:a0d:e612:0:b0:632:ca12:8af with SMTP id
 00721157ae682-6355f1a8952mr42217387b3.32.1718667373594; Mon, 17 Jun 2024
 16:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240617191342.2360052-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20240617191342.2360052-1-Randy.MacLeod@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 17 Jun 2024 16:36:02 -0700
Message-ID: <CANx9H-DUPrkCGV9neBKQL+f-SkVyLzdooQnC2zt7BLPFA7bxwg@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pyyaml-include:
 support native and nativesdk build
To: randy.macleod@windriver.com
Cc: akuster808@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004a4fb8061b1e6e1a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jun 2024 23:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110945

--0000000000004a4fb8061b1e6e1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Master already has this, so it is a backport request.

Randy, I assume you verified both targets build without issue.


On Mon, Jun 17, 2024 at 12:13=E2=80=AFPM Randy MacLeod via lists.openembedd=
ed.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-devtools/python/python3-pyyaml-include_1.3.2.bb     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pyyaml-include_1.3.2.bb b/meta-python/recipes-devtools/python/
> python3-pyyaml-include_1.3.2.bb
> index 3a5bd99a7..309d0ac59 100644
> --- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
> @@ -26,4 +26,4 @@ RDEPENDS:${PN}-ptest +=3D " \
>      python3-pytest \
>      python3-unittest-automake-output \
>  "
> -
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110943):
> https://lists.openembedded.org/g/openembedded-devel/message/110943
> Mute This Topic: https://lists.openembedded.org/mt/106727475/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004a4fb8061b1e6e1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Master already has this, so it is a backport request.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Randy, I assume you verifie=
d both targets build without issue.</div><div dir=3D"auto"><br></div><div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Jun 17, 2024 at 12:13=E2=80=AFPM Randy MacLeod via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;randy.macleod=3D<a href=
=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)">From: Randy MacLeod &l=
t;<a href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Randy.Ma=
cLeod@windriver.com</a>&gt;<br>
<br>
Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.=
com" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pyyaml-include_=
1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml-include_1.3.2=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pyyaml-include_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyyam=
l-include_1.3.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pyyaml-include_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pyyaml-include_1.3.2.bb</a><br>
index 3a5bd99a7..309d0ac59 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyyaml-=
include_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml-inclu=
de_1.3.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pyyaml-=
include_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml-inclu=
de_1.3.2.bb</a><br>
@@ -26,4 +26,4 @@ RDEPENDS:${PN}-ptest +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest \<br>
=C2=A0 =C2=A0 =C2=A0python3-unittest-automake-output \<br>
=C2=A0&quot;<br>
-<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110943): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110943" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110943</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106727475/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/106727475/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004a4fb8061b1e6e1a--

