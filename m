Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B84BC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 23:33:03 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.2601.1634254382748555613
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 16:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TeqJk0CL;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id gn3so392755pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 16:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qfet5TmvdnJpzDuosoZjk9FuY6GvrhjdciLCvAKH71U=;
        b=TeqJk0CLmQSPmFz32sB0QlGjsUZnF35mPa2qw/m/uAGkg9rl30xRjLa4DeKz1I4RcQ
         x5AzyfMbqdnRx6ZGJcMHudJCVRhAA/76KFKZBQOsWvPDlXK7PhVMyZt9hDtBZqJi+6r2
         r48juYZcf/qqK5E+uafA/kZPJkd7kLRF1wTVVYuUg4NeNTdu+K4y8eVh8IFPKSAMl1Ir
         BTbRtVgiWlULEgAPPiT2T+dzw+hWGZFcgSQKZOsib1/5ovo4CO5MrmUl2a4mqUWYhW1B
         DJh9VLPWhhw8t9+A/8UMofcoWDWS1bRX61dXHcj6ETBBz3UVNHql7xOtrMZkARB9mJvR
         valg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qfet5TmvdnJpzDuosoZjk9FuY6GvrhjdciLCvAKH71U=;
        b=v4ksK137dyxpgWqfzlMDlJ2jNd9HaNiUDv+xyq6NkJBFSheSVFh8zMZ+Ul/i7ps/y3
         3gtR2JIV9iquNCm7ioESiVoTR4/SE5xqP6Zetqn3hjfUbjY7Zlkj74xBE/rAC/NbgOAA
         Y7kfWaYNH7YWdkHjfEnrMq0FU6+O0qX71A6mPZ2JvZGlXFy9nQ0zL8sS+i0ewghCIo42
         iRId/HMxwK50OgbMxZbNu56xlCbGHWaG1NiVztf2VfSMxUkQb+bbWloQjiScQHt87I/J
         MgwAWtjgIcB7oI1vysZyNXc2l+3cAm2wx35QRLWg/Odvu6IHi4tC+qTeqLxzV8ssysEe
         e/+A==
X-Gm-Message-State: AOAM530rq/iodA0k86KZ8TOgSFHpW2OSJdS/E1Dhj7DRMOaXcgon4wRx
	60p38nM3pi2a9Q2TunogdqUJaupymjEMDTJmrRo=
X-Google-Smtp-Source: 
 ABdhPJy0B0GKGfJkcIPta7wZIKztKcmpBIduJDVYI8tHk5L2q0heUCgxnCqqCG12fGQnReHDnnXMN8vcEOuZ7XqeqAw=
X-Received: by 2002:a17:902:e746:b0:13f:398e:a0e2 with SMTP id
 p6-20020a170902e74600b0013f398ea0e2mr7655760plf.48.1634254382275; Thu, 14 Oct
 2021 16:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211014224120.84927-1-marex@denx.de>
In-Reply-To: <20211014224120.84927-1-marex@denx.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Oct 2021 23:32:50 +0200
Message-ID: 
 <CA+chaQcH9R06Q4N5z021=dTdAKT35MgVKgcOP_U60smu6L=7wA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] apitrace: Conditionally enable X11 support
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ed9ed405ce587f7b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 23:33:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93313

--000000000000ed9ed405ce587f7b
Content-Type: text/plain; charset="UTF-8"

Why not use PACKAGECONFIG for this? It won't set the EXTRA_OECMAKE
automatically, but will handle the depends correctly (and will be easy to
switch of if someone with x1 and opengl in DISTRO_FEATURES still doesn't
wan to have X11 enabled here for whatever reason).

On Fri, Oct 15, 2021 at 12:41 AM Marek Vasut <marex@denx.de> wrote:

> In case DISTRO_FEATURES contain both x11 and opengl, enable X11 support
> in apitrace, because all the requirements are satisfied.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
> b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
> index 57ec1f8e0..f097f78a9 100644
> --- a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
> +++ b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
> @@ -13,12 +13,13 @@ SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git
> <http://github.com/$%7BBPN%7D/$%7BBPN%7D.git> \
>  S = "${WORKDIR}/git"
>
>  DEPENDS += "zlib libpng python3-native"
> +DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> 'libx11', '', d)} "
>
>  inherit cmake
>
>  EXTRA_OECMAKE += "\
>      -DENABLE_GUI=OFF \
> -    -DENABLE_X11=OFF \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> '-DENABLE_X11=ON', '-DENABLE_X11=OFF', d)} \
>      -DENABLE_STATIC_LIBGCC=OFF \
>      -DENABLE_STATIC_LIBSTDCXX=OFF \
>      -DPython3_ROOT_DIR=/usr/bin/python3-native \
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93312):
> https://lists.openembedded.org/g/openembedded-devel/message/93312
> Mute This Topic: https://lists.openembedded.org/mt/86326776/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ed9ed405ce587f7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why not use PACKAGECONFIG for this? It won&#39;t set the E=
XTRA_OECMAKE automatically, but will handle the depends correctly (and will=
 be easy to switch of if someone with x1 and opengl in DISTRO_FEATURES stil=
l doesn&#39;t wan to have X11 enabled here for whatever reason).</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct=
 15, 2021 at 12:41 AM Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">mare=
x@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">In case DISTRO_FEATURES contain both x11 and opengl, enable X11 =
support<br>
in apitrace, because all the requirements are satisfied.<br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_=
blank">marex@denx.de</a>&gt;<br>
Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/apitrace/<a href=3D"http://apitrace_10.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">apitrace_10.0.bb</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/apitrace/<a href=3D"http://apitrace_1=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">apitrace_10.0.bb</a> b/meta-oe=
/recipes-devtools/apitrace/<a href=3D"http://apitrace_10.0.bb" rel=3D"noref=
errer" target=3D"_blank">apitrace_10.0.bb</a><br>
index 57ec1f8e0..f097f78a9 100644<br>
--- a/meta-oe/recipes-devtools/apitrace/<a href=3D"http://apitrace_10.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">apitrace_10.0.bb</a><br>
+++ b/meta-oe/recipes-devtools/apitrace/<a href=3D"http://apitrace_10.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">apitrace_10.0.bb</a><br>
@@ -13,12 +13,13 @@ SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/=
$%7BBPN%7D/$%7BBPN%7D.git" rel=3D"noreferrer" target=3D"_blank">github.com/=
${BPN}/${BPN}.git</a> \<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;zlib libpng python3-native&quot;<br>
+DEPENDS +=3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x=
11 opengl&#39;, &#39;libx11&#39;, &#39;&#39;, d)} &quot;<br>
<br>
=C2=A0inherit cmake<br>
<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0-DENABLE_GUI=3DOFF \<br>
-=C2=A0 =C2=A0 -DENABLE_X11=3DOFF \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11 ope=
ngl&#39;, &#39;-DENABLE_X11=3DON&#39;, &#39;-DENABLE_X11=3DOFF&#39;, d)} \<=
br>
=C2=A0 =C2=A0 =C2=A0-DENABLE_STATIC_LIBGCC=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0-DENABLE_STATIC_LIBSTDCXX=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0-DPython3_ROOT_DIR=3D/usr/bin/python3-native \<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93312): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93312" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93312</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86326776/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86326776/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ed9ed405ce587f7b--

