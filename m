Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.27494.1599589938282578935
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2020 11:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bj5Fstl7;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id d20so41708qka.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2020 11:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DNyNj4PqRQYbP1e5jvvashNVX/+vrmjBAbfsZf2XEPU=;
        b=Bj5Fstl7tfYsX1qze3aTZeBBPMpYqCYeCzB01kRdtAY1RJs0bm7Fz7186XFr/hOa9C
         ujI4OOGwvArnJP0jnA1ZpBIwsh3lF3R4BRMdZzci21tNSvU2rj9c7dvqZPu7N+MCee4B
         XuA609aVuuzEJRBCWdmF1OuMC6AXHoBSliNZCnn9ad4oKGKhqqN52/edyRcUKmh0h6qY
         J0AWxqYgacZmarCx4XSn/c189mSZdTj1IrL72o8XoFkpSjMvUA31JT3IssiUXt/CGzA4
         3oYpkUyl/o0AnnNJoEIqq6MUTJlqgAfeN0Wd6Z5qjuAXMaHq/asDuyBqYQdjYeYgoM3g
         a2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DNyNj4PqRQYbP1e5jvvashNVX/+vrmjBAbfsZf2XEPU=;
        b=oyRCSGREabUynGzeLOBU9EBwHb7XAJszb92+IEd0QVtQv7vs4qYiTXb/m/zaEUADfC
         db8zYU/PaRVFxzG8A3kW5BQYYwCz+DuEh6rE+oA60b1Sd39sf7NM+zgl+dk5WzeJGYQ1
         jhlFvImUSe27zrWBdto/gvm9sH9k4W+qOr5+J9KsgEF41vq1YLCLIpumvg8EnkiO9du1
         cJHz43Ejb+rmy9xm9wpA2EWU4Qi1qIXkIMKxQTfm10a3wScjyweU1jsENYoFfNEFuBqm
         klDthtTcMm/S8QSjR/oCYBjO1Dcwag588Qtw5/ZQuImpCXgwtdD1ZNRqhUpDCeOGcpgJ
         xG9w==
X-Gm-Message-State: AOAM532XIQAEsUTeRQxhGBwiqqtGW4K+OiEmqLWGtc0C3AV3MKizLw/s
	6kkAp4Eqlas5LWXJGP9g+GoUFgeNM9bdd4CzVO8YJyfWeA4=
X-Google-Smtp-Source: ABdhPJz3Yyq00MY5Fd47fksQzarKVqHpTIf++GRe3nmt6p3EksADO6Eq6NUHetk6042vdxF1PznoEmh7ra5nJ3VDNhE=
X-Received: by 2002:a37:6f43:: with SMTP id k64mr1353779qkc.212.1599589937129;
 Tue, 08 Sep 2020 11:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200907063751.13480-1-jakub.lecki@3mdeb.com>
In-Reply-To: <20200907063751.13480-1-jakub.lecki@3mdeb.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 8 Sep 2020 11:32:06 -0700
Message-ID: <CAMKF1sry=-RUJFQKVPYz7Q4wEWPbEW73RCEMvDvP8MZb5bQyhg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cukinia: new package
To: leckijakub <jakub.lecki@3mdeb.com>
Cc: maciej.pijanowski@3mdeb.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fd2c1a05aed18d7c"

--000000000000fd2c1a05aed18d7c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2020 at 11:38 PM leckijakub <jakub.lecki@3mdeb.com> wrote:

> Signed-off-by: leckijakub <jakub.lecki@3mdeb.com>
>
> ---
>
>  meta-oe/recipes-test/cukinia/cukinia_git.bb | 20 ++++++++++++++++++++
>
>  1 file changed, 20 insertions(+)
>
>  create mode 100644 meta-oe/recipes-test/cukinia/cukinia_git.bb
>
>
>
> diff --git a/meta-oe/recipes-test/cukinia/cukinia_git.bb
> b/meta-oe/recipes-test/cukinia/cukinia_git.bb
>
> new file mode 100644
>
> index 000000000000..fc723671d5f7
>
> --- /dev/null
>
> +++ b/meta-oe/recipes-test/cukinia/cukinia_git.bb
>
> @@ -0,0 +1,20 @@
>
> +SUMMARY =3D "Linux firmware validation framework"
>
> +DESCRIPTION =3D "Cukinia is designed to help Linux-based embedded firmw=
are \
>
> +developers run simple system-level validation tests on their firmware."
>
> +HOMEPAGE =3D "https://github.com/savoirfairelinux/cukinia"
>
> +LICENSE =3D "GPLv3 & Apache-2.0"
>
> +
>
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.GPLv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
>
> +                    file://LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c2=
9e"
>
> +
>
> +SRC_URI =3D "git://
> github.com/savoirfairelinux/cukinia.git;protocol=3Dhttps;branch=3Dmaster=
"
>
> +
>
> +PV =3D "0.5.1"


Let=E2=80=99s call the recipe cukinia_0.5.1.bb and remove this


>
> +SRCREV =3D "ea934c5393ad99c37bec3c621a364122720cce02"
>
> +
>
> +S =3D "${WORKDIR}/git"
>
> +
>
> +do_install () {
>
> +    install -d ${D}${sbindir}
>
> +    install -m 0744 ${S}/cukinia ${D}${sbindir}


Why not 0755 perms here

>
>
> +}
>
> --
>
> 2.17.1
>
>
>
>=20
>
>

--000000000000fd2c1a05aed18d7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Sep 6, 2020 at 11:38 PM leckijakub &lt;<a href=3D"=
mailto:jakub.lecki@3mdeb.com">jakub.lecki@3mdeb.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)">Signed-off-by: leckijakub &lt;<a href=3D"mailto:jakub.lec=
ki@3mdeb.com" target=3D"_blank">jakub.lecki@3mdeb.com</a>&gt;<br><br>---<br=
><br>=C2=A0meta-oe/recipes-test/cukinia/<a href=3D"http://cukinia_git.bb" r=
el=3D"noreferrer" target=3D"_blank">cukinia_git.bb</a> | 20 +++++++++++++++=
+++++<br><br>=C2=A01 file changed, 20 insertions(+)<br><br>=C2=A0create mod=
e 100644 meta-oe/recipes-test/cukinia/<a href=3D"http://cukinia_git.bb" rel=
=
=3D"noreferrer" target=3D"_blank">cukinia_git.bb</a><br><br><br><br>diff -=
-git a/meta-oe/recipes-test/cukinia/<a href=3D"http://cukinia_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cukinia_git.bb</a> b/meta-oe/recipes-tes=
t/cukinia/<a href=3D"http://cukinia_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">cukinia_git.bb</a><br><br>new file mode 100644<br><br>index 000000000=
000..fc723671d5f7<br><br>--- /dev/null<br><br>+++ b/meta-oe/recipes-test/cu=
kinia/<a href=3D"http://cukinia_git.bb" rel=3D"noreferrer" target=3D"_blank=
">cukinia_git.bb</a><br><br>@@ -0,0 +1,20 @@<br><br>+SUMMARY =3D &quot;Linu=
x firmware validation framework&quot; <br><br>+DESCRIPTION =3D &quot;Cukini=
a is designed to help Linux-based embedded firmware \<br><br>+developers ru=
n simple system-level validation tests on their firmware.&quot; <br><br>+HO=
MEPAGE =3D &quot;<a href=3D"https://github.com/savoirfairelinux/cukinia" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/savoirfairelinux/cuki=
nia</a>&quot;<br><br>+LICENSE =3D &quot;GPLv3 &amp; Apache-2.0&quot;<br><br=
>+<br><br>+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPLv3;md5=3Dd32239bcb6=
73463ab874e80d47fae504 \<br><br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://LICENSE;md5=3De3fc50a88d0a364313df4b21e=
f20c29e&quot;<br><br>+<br><br>+SRC_URI =3D &quot;git://<a href=3D"http://gi=
thub.com/savoirfairelinux/cukinia.git;protocol=3Dhttps;branch=3Dmaster" rel=
=
=3D"noreferrer" target=3D"_blank">github.com/savoirfairelinux/cukinia.git;=
protocol=3Dhttps;branch=3Dmaster</a>&quot;<br><br>+<br><br>+PV =3D &quot;0.=
5.1&quot;</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Let=E2=
=80=99s call the recipe <a href=3D"http://cukinia_0.5.1.bb">cukinia_0.5.1.=
bb</a> and remove this</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"=
 dir=3D"auto"><br><br>+SRCREV =3D &quot;ea934c5393ad99c37bec3c621a364122720=
cce02&quot;<br><br>+<br><br>+S =3D &quot;${WORKDIR}/git&quot;<br><br>+<br><=
br>+do_install () {<br><br>+=C2=A0 =C2=A0 install -d ${D}${sbindir}<br><br>=
+=C2=A0 =C2=A0 install -m 0744 ${S}/cukinia ${D}${sbindir}</blockquote><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Why not 0755 perms here=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color=
:rgb(204,204,204)" dir=3D"auto"><br><br>+}<br><br>-- <br><br>2.17.1<br><br>=
<br><br><br><br></blockquote></div></div>

--000000000000fd2c1a05aed18d7c--
