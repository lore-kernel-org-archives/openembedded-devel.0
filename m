Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.4533.1621672578084804468
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 01:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ggg/NewN;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id s22so33649874ejv.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 01:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qgr6SGh6/mv1587/bcLfg0OgUNHq4okqikW6spQNuLo=;
        b=ggg/NewNNBaDClm1Sa6DNrQ/XrA7GtbatIgqz2ws0jjyqwYyFcoKbkQ1Yr7WPuy4Oe
         y0msPnVgzT1obEnDRcK0yS0YOI1lzySiP4ElDtRJ6ixUVi5wbbVgHVy1mgrMnhQAUGRY
         suDd7mF5gNCUgLhkNGKhSKfukyuUC/RcT7AHeraIXVkB5oyLQANP1tjAkOlmCIs7XTLG
         pRAM8g147Lm1LfRjSkqJkXkMyvINvyqq7k4rLoGXufCa0/eZ7PVdhBoox/BxTRHJtJJb
         fhqJnAVL2o91dad59nfU2x9LcFj0mqmygNpjJTgxfILS590b8dyjraVjiH2U7IUARfyv
         Vg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qgr6SGh6/mv1587/bcLfg0OgUNHq4okqikW6spQNuLo=;
        b=ImEJDrYr/6z7XhNq88IRS0NATXwRnKHIIKmsBlzMfY6YmwSQUh2DK5ZWtGPGZPvWmm
         5LI2uMuZYgmfooLs4YtAbAbcFr51dzZXSm5052uOaPoGYZWmJ0GoWChv7kvRCNQpi9lu
         Rklqk6Lk98t7SjZzsJwFF2pjl/RoHrmzOE8Z4n8+nAQJD8uL6hrPzzwSXOdYqdKU19g2
         V4eWFZKmHzvzd/o+uIFqo7tWr3WjdLcWSV+jxN01oXDUQsEAJdqvVIgZgTPoIwaNlDCd
         ec9rV+ojmAe1+YOZbEotSVxxiudqL//NxMQaGpdmVdzdcn4MQi8F5tXLxyhDfIB2Z2cV
         CsGw==
X-Gm-Message-State: AOAM531YDVJgq9tVv+s6FVPNV6V9MhdHGg/2qv3R0FHuTJ0KvRiVvjXL
	3GXBWqsF75klef9V13Xszj+Tbs2+Wq9Lpaz2Xck=
X-Google-Smtp-Source: ABdhPJyqEQKM5RbBFobgD3b/4dLg0ajmMtNZBXKLJXd91NeVffUM/OFM9WrxRnGehD+WEYoornaXj3VQKtPTq9XbDEE=
X-Received: by 2002:a17:906:7f8a:: with SMTP id f10mr13498093ejr.12.1621672576283;
 Sat, 22 May 2021 01:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210522013521.588774-1-schnitzeltony@gmail.com> <20210522013521.588774-16-schnitzeltony@gmail.com>
In-Reply-To: <20210522013521.588774-16-schnitzeltony@gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Sat, 22 May 2021 09:36:03 +0100
Message-ID: <CANPvuRniA5iXtmnuwpK5oJSrFZCV=gd3ZAszkPNKJT4JY0qajw@mail.gmail.com>
Subject: Re: [oe] [PATCH 16/17] libeigen: upgrade 3.3.7 -> 3.3.7
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d9f59905c2e7113f"

--000000000000d9f59905c2e7113f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Typo in commit  message, new version should be 3.3.9

A s=C3=A1bado, 22/05/2021, 02:35, Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
escreveu:

> Simplify packaging a bit
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../libeigen/{libeigen_3.3.7.bb =3D> libeigen_3.3.9.bb}        | 5 ++--=
-
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/libeigen/{libeigen_3.3.7.bb =3D>
> libeigen_3.3.9.bb} (77%)
>
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> b/meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
> similarity index 77%
> rename from meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> rename to meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
> index 6ce318d0b..d6ef98f94 100644
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.9.bb
> @@ -6,14 +6,13 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING.MPL2;md5=3D815ca599c9df247a0c7f619bab123dad"
>
>  SRC_URI =3D "git://gitlab.com/libeigen/eigen.git;protocol=3Dhttp;nobran=
ch=3D1"
>
> -SRCREV =3D "21ae2afd4edaa1b69782c67a54182d34efe43f9c"
> +SRCREV =3D "0fd6b4f71dd85b2009ee4d1aeb296e2c11fc9d68"
>
>  S =3D "${WORKDIR}/git"
>
>  inherit cmake
>
> -FILES_${PN} =3D "${libdir}"
> -FILES_${PN}-dev =3D "${includedir} ${datadir}/eigen3/cmake
> ${datadir}/cmake/Modules ${datadir}/pkgconfig"
> +FILES_${PN}-dev +=3D "${datadir}/eigen3/cmake"
>
>  # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
>  RDEPENDS_${PN}-dev =3D ""
> --
> 2.31.1
>
>
>=20
>
>

--000000000000d9f59905c2e7113f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Typo in commit=C2=A0 message, new version should be =
3.3.9<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">A s=C3=A1bado, 22/05/2021, 02:35, Andreas M=C3=BCller &lt;<a href=3D"mai=
lto:schnitzeltony@gmail.com" target=3D"_blank" rel=3D"noreferrer">schnitzel=
tony@gmail.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Si=
mplify packaging a bit<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gma=
il.com" rel=3D"noreferrer noreferrer" target=3D"_blank">schnitzeltony@gmail=
.com</a>&gt;<br>
---<br>
=C2=A0.../libeigen/{<a href=3D"http://libeigen_3.3.7.bb" rel=3D"noreferrer=
 noreferrer noreferrer" target=3D"_blank">libeigen_3.3.7.bb</a> =3D&gt; <a =
href=3D"http://libeigen_3.3.9.bb" rel=3D"noreferrer noreferrer noreferrer" =
target=3D"_blank">libeigen_3.3.9.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 ++-=
--<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-oe/recipes-support/libeigen/{<a href=3D"http://libeigen_=
3.3.7.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">libeig=
en_3.3.7.bb</a> =3D&gt; <a href=3D"http://libeigen_3.3.9.bb" rel=3D"norefer=
rer noreferrer noreferrer" target=3D"_blank">libeigen_3.3.9.bb</a>} (77%)<b=
r>
<br>
diff --git a/meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen_3=
.3.7.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">libeige=
n_3.3.7.bb</a> b/meta-oe/recipes-support/libeigen/<a href=3D"http://libeige=
n_3.3.9.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">libe=
igen_3.3.9.bb</a><br>
similarity index 77%<br>
rename from meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen_3.=
3.7.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">libeigen=
_3.3.7.bb</a><br>
rename to meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen_3.3.=
9.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">libeigen_3=
.3.9.bb</a><br>
index 6ce318d0b..d6ef98f94 100644<br>
--- a/meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen_3.3.7.bb=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">libeigen_3.3.7=
.bb</a><br>
+++ b/meta-oe/recipes-support/libeigen/<a href=3D"http://libeigen_3.3.9.bb=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">libeigen_3.3.9=
.bb</a><br>
@@ -6,14 +6,13 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING.MPL2;md5=3D815=
ca599c9df247a0c7f619bab123dad&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://gitlab.com/libeigen/eigen.=
git;protocol=3Dhttp;nobranch=3D1" rel=3D"noreferrer noreferrer noreferrer" =
target=3D"_blank">gitlab.com/libeigen/eigen.git;protocol=3Dhttp;nobranch=3D=
1</a>&quot;<br>
<br>
-SRCREV =3D &quot;21ae2afd4edaa1b69782c67a54182d34efe43f9c&quot;<br>
+SRCREV =3D &quot;0fd6b4f71dd85b2009ee4d1aeb296e2c11fc9d68&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit cmake<br>
<br>
-FILES_${PN} =3D &quot;${libdir}&quot;<br>
-FILES_${PN}-dev =3D &quot;${includedir} ${datadir}/eigen3/cmake ${datadir=
}/cmake/Modules ${datadir}/pkgconfig&quot;<br>
+FILES_${PN}-dev +=3D &quot;${datadir}/eigen3/cmake&quot;<br>
<br>
=C2=A0# ${PN} is empty so we need to tweak -dev and -dbg package dependenc=
ies<br>
=C2=A0RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>
</div></div>

--000000000000d9f59905c2e7113f--
