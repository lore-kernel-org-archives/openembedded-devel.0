Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.4155.1601522444666037280
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 20:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VwtLqkE+;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id cy2so2204823qvb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 20:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/9sW2thUapvx5QBleBGSgVGmK5Lopp5/7Hq9BJUSnh8=;
        b=VwtLqkE+G4ZRmx+JPw7XrKfxvlG0zdBlHuvfDuWprTg3WImEI3Kh5SZOKyMNMoIUDw
         OTL+GIuX7cV/E5keD8vQyrVaUoCCngrPzqsvLDNk4aisXjnfbi34IsgZLOh62nEFqCcH
         mliOdB3P+mIRHGLOYnNE3Glsfwg3Xx4+JDG99hsD/+/VeePWEW1qAatv8wh1aXS5zINB
         sqZpE0CJu8/XbFs84fVGmX5Orj+vdpJtrGEd5uYgcj/gK4GzoVvPwIEiIM6KvcRm6uk0
         rX6xQhK1BPGNdoCy8IEifyie2mWFxYNTHh9vAbVz18Yi1xDzoKQHCBRZHuoE+3Y7h/R1
         9FRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/9sW2thUapvx5QBleBGSgVGmK5Lopp5/7Hq9BJUSnh8=;
        b=RTISd7YeoUvMz0lK9hTVlNPI2UUzrEZXRIN258J+bCmyc0BQLMfPTJk8ZA2ANlT7jB
         pCYw2stSfIiDtbhdw8DmyN/VuiYdskX56duGd+zqlz9cf5WLKHaIAGzVOoFT9FZ8wk+Z
         f8+80l07k0Z3DvCs5GGrKJ3DqJkaNPsPysGe5WGTbZBc61SjGkZO9gZJGncX5y79b5/0
         7aR+UF1abJK1JJp/R8XLiY0+DzPldrY/oVsANG2Z1j1OVNphY8/veznR2nqGPex8PSpE
         iLP2YjLCqYVycLYEVzYGolx298OSVHcTKtPsH/oos/mql8SwyjoA6Kog1ZMWj4xcoO6o
         TNNA==
X-Gm-Message-State: AOAM530CbuOmnm7mmEw8/J1VLTPQWww5oG4JM77dyQ6253ODGl72iAwJ
	rrtiQtY3RlxQpUoqrcYBdF1lbNsytBqCJkc3nEcs/xqPeCg=
X-Google-Smtp-Source: ABdhPJwBDKM0sVUYfm3r27cZgovdpl/f2SOYNGbxNpviLCjW9UCOiuPab3nBOO1/getvgAFqp0imH4NZvng2I2e7ZJ0=
X-Received: by 2002:a0c:e188:: with SMTP id p8mr5391572qvl.8.1601522443674;
 Wed, 30 Sep 2020 20:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200930232008.1342160-1-zig@zigsystem.com>
In-Reply-To: <20200930232008.1342160-1-zig@zigsystem.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 30 Sep 2020 20:20:30 -0700
Message-ID: <CAMKF1sqZMZVBh+E2e9-Zy6uY-bD_f2mG=JBO2bbupoMEgRvoGg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] libuvc: add recipe
To: Zig Globulin <zig@zigsystem.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005ae76c05b09380e2"

--0000000000005ae76c05b09380e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for submitting the patch please add it to relevant packagegroup as
well in packagegroup-meta-gnome.bb

On Wed, Sep 30, 2020 at 4:20 PM Zig Globulin <zig@zigsystem.com> wrote:

> Signed-off-by: Zig Globulin <zig@zigsystem.com>
>
> ---
>
>  meta-multimedia/recipes-multimedia/libuvc/libuvc.bb | 13 +++++++++++++
>
>  1 file changed, 13 insertions(+)
>
>  create mode 100644 meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
>
>
>
> diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
> b/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
>
> new file mode 100644
>
> index 000000000..27cc17bc6
>
> --- /dev/null
>
> +++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
>
> @@ -0,0 +1,13 @@
>
> +SUMMARY =3D "library for USB video devices built atop libusb"
>
> +HOMEPAGE =3D "https://github.com/libuvc/libuvc.git"
>
> +LICENSE =3D "BSD"


It would be better to state which variant of BSD

>
>
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D2f1963e0bb88c93463af750daf9ba0c2"
>
> +DEPENDS =3D "libusb jpeg"
>
> +
>
> +SRC_URI =3D "git://github.com/libuvc/libuvc.git"
>
> +SRCREV =3D "ad6c72a4e390367f0d2be81aac00cfc0b6680d74"
>
> +PV =3D "v0.0.6+git${SRCPV}"


It=E2=80=99s perhaps better to call the recipe libuvc_0.0.6.bb and remove =
setting
PV here provided you are building at the same commit as 0.0.6


>
> +
>
> +S =3D "${WORKDIR}/git"
>
> +
>
> +inherit cmake
>
> --
>
> 2.28.0
>
>
>
>
>
>
>
>=20
>
>
>
>

--0000000000005ae76c05b09380e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for submitting the patch please add it to relevant=
 packagegroup as well in <a href=3D"http://packagegroup-meta-gnome.bb">pack=
agegroup-meta-gnome.bb</a></div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, Sep 30, 2020 at 4:20 PM Zig Globulin=
 &lt;<a href=3D"mailto:zig@zigsystem.com">zig@zigsystem.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)">Signed-off-by: Zig Globulin &lt;<a href=3D"mailto=
:zig@zigsystem.com" target=3D"_blank">zig@zigsystem.com</a>&gt;<br><br>---<=
br><br>=C2=A0meta-multimedia/recipes-multimedia/libuvc/<a href=3D"http://li=
buvc.bb" rel=3D"noreferrer" target=3D"_blank">libuvc.bb</a> | 13 ++++++++++=
+++<br><br>=C2=A01 file changed, 13 insertions(+)<br><br>=C2=A0create mode =
100644 meta-multimedia/recipes-multimedia/libuvc/<a href=3D"http://libuvc.b=
b" rel=3D"noreferrer" target=3D"_blank">libuvc.bb</a><br><br><br><br>diff -=
-git a/meta-multimedia/recipes-multimedia/libuvc/<a href=3D"http://libuvc.b=
b" rel=3D"noreferrer" target=3D"_blank">libuvc.bb</a> b/meta-multimedia/rec=
ipes-multimedia/libuvc/<a href=3D"http://libuvc.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libuvc.bb</a><br><br>new file mode 100644<br><br>index 000000=
000..27cc17bc6<br><br>--- /dev/null<br><br>+++ b/meta-multimedia/recipes-mu=
ltimedia/libuvc/<a href=3D"http://libuvc.bb" rel=3D"noreferrer" target=3D"_=
blank">libuvc.bb</a><br><br>@@ -0,0 +1,13 @@<br><br>+SUMMARY =3D &quot;libr=
ary for USB video devices built atop libusb&quot;<br><br>+HOMEPAGE =3D &quo=
t;<a href=3D"https://github.com/libuvc/libuvc.git" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/libuvc/libuvc.git</a>&quot;<br><br>+LICENSE=
 =3D &quot;BSD&quot;</blockquote><div dir=3D"auto"><br></div><div dir=3D"au=
to">It would be better to state which variant of BSD</div><blockquote class=
=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"=
 dir=3D"auto"><br><br>+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D=
2f1963e0bb88c93463af750daf9ba0c2&quot;<br><br>+DEPENDS =3D &quot;libusb jpe=
g&quot;<br><br>+<br><br>+SRC_URI =3D &quot;git://<a href=3D"http://github.c=
om/libuvc/libuvc.git" rel=3D"noreferrer" target=3D"_blank">github.com/libuv=
c/libuvc.git</a>&quot;<br><br>+SRCREV =3D &quot;ad6c72a4e390367f0d2be81aac0=
0cfc0b6680d74&quot;<br><br>+PV =3D &quot;v0.0.6+git${SRCPV}&quot;</blockquo=
te><div dir=3D"auto"><br></div><div dir=3D"auto">It=E2=80=99s perhaps bette=
r to call the recipe <a href=3D"http://libuvc_0.0.6.bb">libuvc_0.0.6.bb</a>=
 and remove setting PV here provided you are building at the same commit as=
 0.0.6</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br><=
br>+<br><br>+S =3D &quot;${WORKDIR}/git&quot;<br><br>+<br><br>+inherit cmak=
e<br><br>-- <br><br>2.28.0<br><br><br><br><br><br><br><br><br><br><br><br><=
/blockquote></div></div>

--0000000000005ae76c05b09380e2--
