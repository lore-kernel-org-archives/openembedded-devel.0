Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE60D2A521
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 19:54:59 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53057.1764878095479049009
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 11:54:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mKfp8vEi;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4775ae77516so15269415e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 11:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764878094; x=1765482894; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bueAQHi4TsymY53QYgriLH4P7midKWsEW9B9CujDIYI=;
        b=mKfp8vEi5LaxMf3Vgns61cIQhmebJ2BEMwws2Rp0MgJ/71zrqOrSzEfAjHzimyztPF
         OHR+p8lt2urjl5G7DZpvNA71UZtwrdACE2G4sju/UIU9OY3kzyPy3elu6Y9H7F4BgofZ
         SVqnd67vitsRFwmmrgpqtlQk/6E3QQ4jgtsE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878094; x=1765482894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bueAQHi4TsymY53QYgriLH4P7midKWsEW9B9CujDIYI=;
        b=DSGcT/fFYbWgQNvCcFW4ounldvxowA6z99QamT+u7E9C5I3wgFBUVXaBF9fzLN/ItN
         ItSOLk/gU7SCquOAnPlzDK7Z3BrnujgqsrPeNjAcJOkayJqd7V+FgITJQZ+HrZCIv7wr
         8b3WZdWCMNdxT/mXIT3mhILP7ACTztBjrTcZ7WKDPfXMSLVy4yKytzNs9fHfmcnEbejk
         tFmb/9jnj/IZUbzFjhkXfPeEQaZr8+OouKjN+turi7wHY3Fq1wWXLOGYQD59nZa+6xRs
         p+S/LURMSVKgj3EGP1kElcTIFHQIgpMuuIUFz4oW7g+qikNqKOKHQDFcbA+B5Hc2v5Vl
         DXjQ==
X-Gm-Message-State: AOJu0YzirvBCqdCFyTImw3TW1dCPRPBsERtwbUrSprN6uEUdT9y5pD70
	9deI0bdwNEMrVmiiKO/f59yuyFc2IwP/OriZNX2iCZBDhalxPZexfulohNIlJkZZzC0X1KkEXeE
	Arj8jYQzEdvCWRshPqSdrvHdehLjg7wYEHBX4ffcXRQ==
X-Gm-Gg: ASbGnctBz/4sTwPD2PDA7nKEvztlIgL/SvZyCF3GLLBweSlBksOjXwfzi0+QVnoJ1hD
	a/gZa3eDvp3MmOo29PxBymsxRB6ORBFIFUWWT5EQee04AJRZOtL/Ngva+rxExjB4+eGEJ0I3o+S
	yrifx6Qrn5JBPbRhMiNAhrwE9pg7oK6RYz8KSIiXxFdfqcx7fIhnpijhXOx/PvVPXi2/DGUBrdH
	lR0HSGucGj8YNpLQif2vQo73TMgvlNItQGdta9WsEksVesbKNCg+fJKAXh2FkOaEcoQL+DdvGPM
	pWQKrWu93Av/UXNRtwkPtYZrkf83
X-Google-Smtp-Source: AGHT+IFQMdYU5nA4e9OZSnKVbAVbbKcIb2WOckvYTlwA7hhW1ST2w3qRtj9zN8btEA6nZEN0rMJYoRdLowAxy0xJxtk=
X-Received: by 2002:a05:600c:1c0c:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-4792aeeb9c4mr84157275e9.11.1764878093544; Thu, 04 Dec 2025
 11:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20251204191552.1203671-1-skandigraun@gmail.com>
In-Reply-To: <20251204191552.1203671-1-skandigraun@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 4 Dec 2025 20:54:42 +0100
X-Gm-Features: AWmQ_bl53rOwnTJywSbEceOvae1YGOZFsX0mQf52rriXFw36x_0OkoQbRZfVoPY
Message-ID: <CAMSfU+4b8Q9mccmoLqXWLDyDa_-YJUF_uDA8CR1TP6YUu3YoPw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] yasm: drop from packagegroup also
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d6801d064525b383"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 19:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122330

--000000000000d6801d064525b383
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 4 d=C3=A9c. 2025 =C3=A0 20:15, Gyorgy Sarvari via lists.openembedde=
d.org
<skandigraun=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> It should have been done when the recipe was dropped, but it was missed.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>

Thank you!

---
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index d7d6c08693..d873a7b817 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -294,7 +294,6 @@ RDEPENDS:packagegroup-meta-oe-devtools =3D "\
>      xerces-c-samples \
>      xmlrpc-c \
>      yajl \
> -    yasm \
>  "
>  RDEPENDS:packagegroup-meta-oe-devtools:append:x86 =3D " cpuid pahole"
>  RDEPENDS:packagegroup-meta-oe-devtools:append:x86-64 =3D " cpuid pahole
> pcimem"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122329):
> https://lists.openembedded.org/g/openembedded-devel/message/122329
> Mute This Topic: https://lists.openembedded.org/mt/116617941/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d6801d064525b383
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Le jeu. 4 d=C3=A9c. 2025 =C3=
=A0 20:15, Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org">lis=
ts.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists=
.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It should h=
ave been done when the recipe was dropped, but it was missed.<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">skandigraun@gmail.com</a>&gt;<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you=
!</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_qu=
ote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
---<br>
=C2=A0meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">packagegroup-meta-=
oe.bb</a> | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegr=
oup-meta-oe.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">packagegrou=
p-meta-oe.bb</a> b/meta-oe/recipes-core/packagegroups/<a href=3D"http://pac=
kagegroup-meta-oe.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">packa=
gegroup-meta-oe.bb</a><br>
index d7d6c08693..d873a7b817 100644<br>
--- a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">packagegroup-meta-=
oe.bb</a><br>
+++ b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">packagegroup-meta-=
oe.bb</a><br>
@@ -294,7 +294,6 @@ RDEPENDS:packagegroup-meta-oe-devtools =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0xerces-c-samples \<br>
=C2=A0 =C2=A0 =C2=A0xmlrpc-c \<br>
=C2=A0 =C2=A0 =C2=A0yajl \<br>
-=C2=A0 =C2=A0 yasm \<br>
=C2=A0&quot;<br>
=C2=A0RDEPENDS:packagegroup-meta-oe-devtools:append:x86 =3D &quot; cpuid pa=
hole&quot;<br>
=C2=A0RDEPENDS:packagegroup-meta-oe-devtools:append:x86-64 =3D &quot; cpuid=
 pahole pcimem&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122329): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122329" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/122329</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116617941/431=
6185" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/116617941/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@=
smile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>]<b=
r>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000d6801d064525b383--

