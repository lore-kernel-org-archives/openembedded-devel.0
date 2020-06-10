Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.1866.1591753547309080118
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 18:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lgX8RQn1;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id y13so742869eju.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2020 18:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DAKUEj+s9D2BKuANtyiZtLsoQ25LwlJ63lAIhxm8jEk=;
        b=lgX8RQn1kd9V+6OWZn1jF1M1wsZ7PB840s4/NDzirD7lZD3sUbH/35j4X8ZF1oi7zJ
         xq8YzS8VJJqc+oiNozqxWHkfsKl8ackqOfTdxwkgJ/ou6AM/0R3sl4R/Ry9E3swLORFH
         XUcasY+6wqHpAUmYTSBskM/9S9LfIY9VVHmHYD2/jgWl8Sx9w5ZA9hQqTgoyZed4gyOG
         3BTosPh+/unnfQjdFq0wCFDb3cjAVtKIoKGvJcTdjP5wkHPl7DLhe/B7mAidA1HQrqQN
         HLF2wN1UXbRWyY36ovE3w4PJsh5tZxcd02tu0o6PBD3Cs4tYOQWUEOSQB04eWcprWFvK
         lH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DAKUEj+s9D2BKuANtyiZtLsoQ25LwlJ63lAIhxm8jEk=;
        b=gAXH14SvXfxSJTsXgYM1BkpkYAHza5HC1I08AsCQfhfMPLNMDGy/p7+jedMBZc+dFf
         rMi6W3ZX5QDeqjZxq0gwLWen/M2Y3zRX1jJP0LeSQXK+1Bcg/CIF94TxZMVIzG6jMLM5
         Pp0VIlI2AhTHZCGCgrLghriqPHUM3zZRU4mQNM86mQYqIHcVo3FWdT2+3qM7vze2ncRG
         fzE0mMGWx2FRoOLBuWL+9pq4i36vzG0ZB8yLdpyFO17VFjZNLBwZDT4Sc8fIXXvom8f5
         E2ZIpDPus6FG5cJ+87KUqPucpRG+cF1veodaPn1+IUXtVkRTwkQqjyPSzQ8vpjYv5fnA
         tOSg==
X-Gm-Message-State: AOAM531ZlfrPsy5HnGRire42H6HocqWQHgbPwTMUuzUpAX0I7xsNT/Kg
	lcMNamvR2haqhmUr3EMEK19VRA6Bdtamg2oygYo=
X-Google-Smtp-Source: ABdhPJznY4Gvec2A5fdAnmwg586LlGQuHnOjXePY7+WEJSW0z7ASGAPURZDE+U7pgI8hq1gRylmFb7M4EuT2MOTBIUY=
X-Received: by 2002:a17:906:b89a:: with SMTP id hb26mr1145009ejb.137.1591753545782;
 Tue, 09 Jun 2020 18:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200610012650.381662-1-raj.khem@gmail.com>
In-Reply-To: <20200610012650.381662-1-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 10 Jun 2020 03:45:34 +0200
Message-ID: <CA+chaQfvUhGv7aPMz7VSTNwHmryRX7-s_OobqDWX45gnCRV4sw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] toybox-inittab: Get rid of bashism
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Adam Miartus <adam.miartus@softhows.eu>
Content-Type: multipart/alternative; boundary="000000000000aa9a4405a7b100ff"

--000000000000aa9a4405a7b100ff
Content-Type: text/plain; charset="UTF-8"

Thanks, my world builds will be green again! .. maybe.. :)

On Wed, Jun 10, 2020 at 3:26 AM Khem Raj <raj.khem@gmail.com> wrote:

> Be explicit about copying the files, makes it simpler for dash to handle
> it
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> Cc: Adam Miartus <adam.miartus@softhows.eu>
> ---
>  meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
> b/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
> index 8d7ff61e86..9af1e3f149 100644
> --- a/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
> +++ b/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
> @@ -26,8 +26,8 @@ do_patch[noexec] = "1"
>
>  do_configure() {
>         # copy over files now to have a fresh start on each config
> -       for file in ${SRC_URI}; do
> -               cp ${WORKDIR}/${file/file:\/\//} ${S}
> +       for f in inittab rcK rcS; do
> +               cp ${WORKDIR}/$f ${S}
>         done
>
>         for config in ${PACKAGECONFIG_CONFARGS}; do
> --
> 2.27.0
>
>

--000000000000aa9a4405a7b100ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, my world builds will be green again! .. maybe.. :)=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Jun 10, 2020 at 3:26 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Be explicit about copying the files, makes it sim=
pler for dash to handle<br>
it<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_b=
lank">Martin.Jansa@gmail.com</a>&gt;<br>
Cc: Adam Miartus &lt;<a href=3D"mailto:adam.miartus@softhows.eu" target=3D"=
_blank">adam.miartus@softhows.eu</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-core/toybox/<a href=3D"http://toybox-inittab_0.8.2.bb=
" rel=3D"noreferrer" target=3D"_blank">toybox-inittab_0.8.2.bb</a> | 4 ++--=
<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-core/toybox/<a href=3D"http://toybox-inittab_0=
.8.2.bb" rel=3D"noreferrer" target=3D"_blank">toybox-inittab_0.8.2.bb</a> b=
/meta-oe/recipes-core/toybox/<a href=3D"http://toybox-inittab_0.8.2.bb" rel=
=3D"noreferrer" target=3D"_blank">toybox-inittab_0.8.2.bb</a><br>
index 8d7ff61e86..9af1e3f149 100644<br>
--- a/meta-oe/recipes-core/toybox/<a href=3D"http://toybox-inittab_0.8.2.bb=
" rel=3D"noreferrer" target=3D"_blank">toybox-inittab_0.8.2.bb</a><br>
+++ b/meta-oe/recipes-core/toybox/<a href=3D"http://toybox-inittab_0.8.2.bb=
" rel=3D"noreferrer" target=3D"_blank">toybox-inittab_0.8.2.bb</a><br>
@@ -26,8 +26,8 @@ do_patch[noexec] =3D &quot;1&quot;<br>
<br>
=C2=A0do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # copy over files now to have a fresh start on =
each config<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for file in ${SRC_URI}; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/${fil=
e/file:\/\//} ${S}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in inittab rcK rcS; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/$f ${=
S}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for config in ${PACKAGECONFIG_CONFARGS}; do<br>
-- <br>
2.27.0<br>
<br>
</blockquote></div>

--000000000000aa9a4405a7b100ff--
