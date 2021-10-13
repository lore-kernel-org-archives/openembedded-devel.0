Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486CEC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 02:20:43 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web09.2653.1634091641901881777
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 19:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cGsiO2rb;
 spf=pass (domain: gmail.com, ip: 209.85.166.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id i11so1015462ila.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 19:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RS5QMzIZhfEOZhNTsa2h9GCa3bs2jqdpaJz5Jt6cGO8=;
        b=cGsiO2rb9GFHfWg56OvcIdN2iZdDFuN6CR4H/yQs6FkJcDAvgCCYKnephGNpSjZsJ6
         J1jDph9sYTWHBVG5jp6eGbWwRUGtHeQkz1rUL8ZvxQuZRqs+XqvTRnUAO6GWbnO5e7EN
         UG1cMiIMua6tm56aOgYCo/sOOVGc+vpT2OfnbLcny5NTDXPdX86RKSclguww+VZzeOYn
         7gwgwUkMcxfC3Ha38fUU0NGlD6uv1GQLWt8axYsbZQPw2gT1iWP8PfW+Shic9QOjUKBU
         UO4JZs9mdYlOzl7Xd+LS0JOF7SMJZQKbXCpMKlKzHBitkR/w0KOfke8F3bvBz6ZmKoWR
         dSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RS5QMzIZhfEOZhNTsa2h9GCa3bs2jqdpaJz5Jt6cGO8=;
        b=VpKqoyfE/JJz7FfpVRwd5FIoHnlUz7IrMHkkTmnjbTQTl/FD9bewUDDtG6PQGfS042
         LL0uJ3XSdVaW7ylSebgGiZdQNbqK16pBYJ25H4tapzAAh4CvPhohx7kbQelGduJ2ZAkz
         P0SgOdGNVZQzmCHPpnsax3byuOUEOwlJG+TpWwVtdOCQ8yqmLCeqm9TRAupSsfT66xqG
         XkwV7PEwH+jtib1T5cuMsSi499XnMOJqDKrB8Q6KofZO1tT/QFW/rvfif9xiGTgDzefr
         K+xAzfQjffK78HcPShaI2zwW+E32N8V/i6G5HYKjMpKuT4rRZH51lGFCqWjE0lX0gG7A
         xEiA==
X-Gm-Message-State: AOAM533UbFadKH2PXKK43ghYH72sLY3OYKZPw97Fyy9ByvpXAaicx76I
	mMRKjIK1e/6EMkMTeVppry6Fx0t5y7H+ImgbAqc=
X-Google-Smtp-Source: 
 ABdhPJwA2EnBUMlwjeKflyo9jevqHt3ToVAO6u9KZD/IJj/Ab+LQnOBvE67YRlfXqPcnCKZ9mmxzqBc0aepLRYZ7SGo=
X-Received: by 2002:a05:6e02:c2e:: with SMTP id
 q14mr27141112ilg.109.1634091641060;
 Tue, 12 Oct 2021 19:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211012214827.3477092-1-raj.khem@gmail.com>
In-Reply-To: <20211012214827.3477092-1-raj.khem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 12 Oct 2021 19:20:30 -0700
Message-ID: 
 <CANx9H-AGt0Z+cR59_Gk2ZXLOSij17xctcbG1nKDGqgUF73B5Gg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 1/3] gjs: Inherit pkgconfig
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cbbfaf05ce329bea"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 02:20:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93263

--000000000000cbbfaf05ce329bea
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 12, 2021 at 2:48 PM Khem Raj <raj.khem@gmail.com> wrote:

> Fixes
> configure: error: Package requirements (glib-2.0 >= 2.58.0 gobject-2.0 >=
> 2.58.0 gio-2.0 >= 2.58.0 gobject-introspection-1.0 libffi gthread-2.0
> gio-2.0 >= 2.58.0 mozjs-60) were not met:
>
> No package 'mozjs-60' found
>

Thank you this. I caught it during a forthcoming upgrade to gjs that I have
in the works.


> Consider adjusting the PKG_CONFIG_PATH environment variable if you
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

---
>  meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
> b/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
> index ccac08d060..096e277bb4 100644
> --- a/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
> +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
> @@ -9,7 +9,7 @@ GNOMEBASEBUILDCLASS = "autotools"
>
>  DEPENDS = "mozjs gtk+3"
>
> -inherit gnomebase gsettings gobject-introspection vala gettext
> features_check upstream-version-is-even
> +inherit gnomebase gsettings gobject-introspection vala gettext
> features_check upstream-version-is-even pkgconfig
>
>  SRC_URI[archive.sha256sum] =
> "7fb3eb746c17363d9ee47f4a5d0bb048f0075611763eb0da11d85e0e57aff381"
>  SRC_URI += "file://0001-Disable-tests-on-host.patch \
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93257):
> https://lists.openembedded.org/g/openembedded-devel/message/93257
> Mute This Topic: https://lists.openembedded.org/mt/86274322/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000cbbfaf05ce329bea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Oct 12, 2021 at 2:48 PM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Fixes<br>
configure: error: Package requirements (glib-2.0 &gt;=3D 2.58.0 gobject-2.0=
 &gt;=3D 2.58.0 gio-2.0 &gt;=3D 2.58.0 gobject-introspection-1.0 libffi gth=
read-2.0 gio-2.0 &gt;=3D 2.58.0 mozjs-60) were not met:<br>
<br>
No package &#39;mozjs-60&#39; found<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you this. =
I caught it during a forthcoming upgrade to gjs that I have in the works.</=
div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Consider adjusting the PKG_CONFIG_PATH environment variable if you<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;</blockquote><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex" dir=3D"auto">---<br>
=C2=A0meta-gnome/recipes-gnome/gjs/<a href=3D"http://gjs_1.58.8.bb" rel=3D"=
noreferrer" target=3D"_blank">gjs_1.58.8.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-gnome/recipes-gnome/gjs/<a href=3D"http://gjs_1.58.8.bb" =
rel=3D"noreferrer" target=3D"_blank">gjs_1.58.8.bb</a> b/meta-gnome/recipes=
-gnome/gjs/<a href=3D"http://gjs_1.58.8.bb" rel=3D"noreferrer" target=3D"_b=
lank">gjs_1.58.8.bb</a><br>
index ccac08d060..096e277bb4 100644<br>
--- a/meta-gnome/recipes-gnome/gjs/<a href=3D"http://gjs_1.58.8.bb" rel=3D"=
noreferrer" target=3D"_blank">gjs_1.58.8.bb</a><br>
+++ b/meta-gnome/recipes-gnome/gjs/<a href=3D"http://gjs_1.58.8.bb" rel=3D"=
noreferrer" target=3D"_blank">gjs_1.58.8.bb</a><br>
@@ -9,7 +9,7 @@ GNOMEBASEBUILDCLASS =3D &quot;autotools&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;mozjs gtk+3&quot;<br>
<br>
-inherit gnomebase gsettings gobject-introspection vala gettext features_ch=
eck upstream-version-is-even<br>
+inherit gnomebase gsettings gobject-introspection vala gettext features_ch=
eck upstream-version-is-even pkgconfig<br>
<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;7fb3eb746c17363d9ee47f4a5d0bb048=
f0075611763eb0da11d85e0e57aff381&quot;<br>
=C2=A0SRC_URI +=3D &quot;file://0001-Disable-tests-on-host.patch \<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93257): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93257" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93257</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86274322/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
86274322/924729</a><br>
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

--000000000000cbbfaf05ce329bea--

