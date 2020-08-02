Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.16405.1596398597631014602
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2020 13:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RC6wRWqn;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id a14so8814601edx.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2020 13:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bBk7hsIKxgFTzzrUfcCFzFjo1gIWmqgDyn9bg2hDCAA=;
        b=RC6wRWqnNopaOsHPI1BBhkMiX+4iW65Upr8VtfEzLV9r/THcVAHqoeYrrTv/iSXYIa
         uDRmHBLpYkKlBzuSmTdRYkyoDFPUAoB3Yt9/tghVI5Abjq6pzGdTPxJHHuWvpFgj65JS
         F5Oo0QvR08oeW/T3WI28Dg0hcf/074wx5L13u7cTJe6VS/kd3jnXYM0BpkQwa+V1j3Yd
         7ftIkNvadPuMX3eqyawJzwt6FGp9DX/54+NEDWTmQQ1f7EKh5qOIeU/15rE1Dua7qluj
         gkbIFNcQUGaDjAAwGTOJXjjNTRmok1pJ6LLRjzSEQjZZzAUgFQueEP+pn1nKmu7X70zf
         5K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bBk7hsIKxgFTzzrUfcCFzFjo1gIWmqgDyn9bg2hDCAA=;
        b=GYj3KM+NB+vG1kDGoSrctld+23s8VvkF4N45Kj++TnovA8byOUMeLBI9dJuhUcFBNI
         q0ZeF9tuhdHEw69TFAsnM7aIiZIDOEkAniB8RYBgTwNmTkIrIrw1o9IgVSRK8pkjgsZ9
         TRQW6DW8lTyyeQiOFoq0n+ALgVEoKLhBfMkqat4DlappNA7PLUwJ6QQP0nQSLY/kn6h2
         6Iks82t85scxvB5CHjAod5FPCwmGQ8kajTeu8ji3/xB9X5hWvgLSz+TJhkvFF8tJ2n/R
         4oy5G/BGLrJEc7IXl1EvPkTg2K23rBDh761Op/vPIKtdobVUXY9+SpfTJkUE8GzOvQ7D
         1KRQ==
X-Gm-Message-State: AOAM533ZR4mE7P51CClsiMGSiqMZK74Wa2QyZJJ6u5DP5kSQ/dK2D7o8
	yI9Ulosu6nYnvrRiQ7ohHvjoLcVgVVdo2SJUNDw=
X-Google-Smtp-Source: ABdhPJz/gIC6E8Umr/9iccyH5BqYUoqYl3TsczIlqRsQjYRut1jv9VNrCQfAR6cjfELwrRDC684gjrFAoRN/E0E4Kzg=
X-Received: by 2002:aa7:ca54:: with SMTP id j20mr12856743edt.270.1596398596080;
 Sun, 02 Aug 2020 13:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200726130737.57830-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20200726130737.57830-1-open.source@oleksandr-kravchuk.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 2 Aug 2020 22:03:04 +0200
Message-ID: <CA+chaQfFzhLFHYX0BY9-HwBhnk8kmmv2cRULaONWqXzTtwh=rw@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-oe] valijson: update to 0.3
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003d476e05abea8319"

--0000000000003d476e05abea8319
Content-Type: text/plain; charset="UTF-8"

Hi,

new dependency curlpp is only available in meta-networking, so this recipe
in meta-oe cannot depend on it, either move it to meta-networking as well,
or make it optional with PACKAGECONFIG if possible.

Now it causes:
ERROR: Nothing PROVIDES 'curlpp' (but
meta-openembedded/meta-oe/recipes-devtools/valijson/valijson_0.3.bb DEPENDS
on or otherwise requires it). Close matches:

Regards,

On Sun, Jul 26, 2020 at 3:09 PM Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../recipes-devtools/valijson/valijson_0.3.bb | 36 +++++++++++++++++++
>  .../recipes-devtools/valijson/valijson_git.bb | 21 -----------
>  2 files changed, 36 insertions(+), 21 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/valijson/valijson_0.3.bb
>  delete mode 100644 meta-oe/recipes-devtools/valijson/valijson_git.bb
>
> diff --git a/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
> b/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
> new file mode 100644
> index 0000000000..049cdeffc0
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
> @@ -0,0 +1,36 @@
> +SUMMARY = "Header-only C++ library for JSON Schema validation"
> +HOMEPAGE = "https://github.com/tristanpenman/valijson"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
> +
> +SRC_URI = "git://github.com/tristanpenman/valijson.git"
> +SRCREV = "7a52fc88cdffd6678c009ca2fad700151f7363c6"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE = "-DINSTALL_HEADERS=1 -DBUILD_TESTS=0"
> +
> +DEPENDS = "curlpp"
> +
> +# valijson is a header only C++ library, so the main package will be
> empty.
> +RDEPENDS_${PN}-dev = ""
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +do_install() {
> +    install -d ${D}${includedir}/compat
> +    install -d ${D}${includedir}/valijson
> +    install -d ${D}${includedir}/valijson/adapters
> +    install -d ${D}${includedir}/valijson/constraints
> +    install -d ${D}${includedir}/valijson/internal
> +    install -d ${D}${includedir}/valijson/utils
> +
> +    install -m 0644 ${S}/include/compat/* ${D}${includedir}/compat
> +    install -D -m 0644 ${S}/include/valijson/*.hpp -t
> ${D}${includedir}/valijson
> +    install -D -m 0644 ${S}/include/valijson/adapters/*.hpp -t
> ${D}${includedir}/valijson/adapters
> +    install -D -m 0644 ${S}/include/valijson/constraints/*.hpp -t
> ${D}${includedir}/valijson/constraints
> +    install -D -m 0644 ${S}/include/valijson/internal/*.hpp -t
> ${D}${includedir}/valijson/internal
> +    install -D -m 0644 ${S}/include/valijson/utils/*.hpp -t
> ${D}${includedir}/valijson/utils
> +}
> diff --git a/meta-oe/recipes-devtools/valijson/valijson_git.bb
> b/meta-oe/recipes-devtools/valijson/valijson_git.bb
> deleted file mode 100644
> index c3254d16e7..0000000000
> --- a/meta-oe/recipes-devtools/valijson/valijson_git.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -SUMMARY = "Header-only C++ library for JSON Schema validation"
> -HOMEPAGE = "https://github.com/tristanpenman/valijson"
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
> -
> -SRC_URI = "git://github.com/tristanpenman/valijson.git"
> -PV = "0.1+git${SRCPV}"
> -
> -SRCREV = "c2f22fddf599d04dc33fcd7ed257c698a05345d9"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit cmake
> -
> -EXTRA_OECMAKE = "-DINSTALL_HEADERS=1 -DBUILD_TESTS=0"
> -
> -# valijson is a header only C++ library, so the main package will be
> empty.
> -RDEPENDS_${PN}-dev = ""
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> --
> 2.25.1
>
> 
>

--0000000000003d476e05abea8319
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>new dependency curlpp is only avail=
able in meta-networking, so this recipe in meta-oe cannot depend on it, eit=
her move it to meta-networking as well, or make it optional with PACKAGECON=
FIG if possible.</div><div><br></div><div>Now it causes:</div><div>ERROR: N=
othing PROVIDES &#39;curlpp&#39; (but meta-openembedded/meta-oe/recipes-dev=
tools/valijson/<a href=3D"http://valijson_0.3.bb">valijson_0.3.bb</a> DEPEN=
DS on or otherwise requires it). Close matches:<br></div><div><br></div><di=
v>Regards,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">On Sun, Jul 26, 2020 at 3:09 PM Oleksandr Kravchuk &lt;<a =
href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.s=
ource@oleksandr-kravchuk.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Signed-off-by: Oleksandr Kravchuk &lt;<a href=
=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.sour=
ce@oleksandr-kravchuk.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/valijson/<a href=3D"http://valijson_0.3.bb" rel=
=
=3D"noreferrer" target=3D"_blank">valijson_0.3.bb</a> | 36 +++++++++++++++=
++++<br>
=C2=A0.../recipes-devtools/valijson/<a href=3D"http://valijson_git.bb" rel=
=
=3D"noreferrer" target=3D"_blank">valijson_git.bb</a> | 21 -----------<br>
=C2=A02 files changed, 36 insertions(+), 21 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/valijson/<a href=3D"http=
://valijson_0.3.bb" rel=3D"noreferrer" target=3D"_blank">valijson_0.3.bb</a=
><br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/valijson/<a href=3D"http=
://valijson_git.bb" rel=3D"noreferrer" target=3D"_blank">valijson_git.bb</a=
><br>
<br>
diff --git a/meta-oe/recipes-devtools/valijson/<a href=3D"http://valijson_=
0.3.bb" rel=3D"noreferrer" target=3D"_blank">valijson_0.3.bb</a> b/meta-oe/=
recipes-devtools/valijson/<a href=3D"http://valijson_0.3.bb" rel=3D"norefer=
rer" target=3D"_blank">valijson_0.3.bb</a><br>
new file mode 100644<br>
index 0000000000..049cdeffc0<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/valijson/<a href=3D"http://valijson_0.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">valijson_0.3.bb</a><br>
@@ -0,0 +1,36 @@<br>
+SUMMARY =3D &quot;Header-only C++ library for JSON Schema validation&quot=
;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/tristanpenman/valijson" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/tristanpenman/valij=
son</a>&quot;<br>
+LICENSE =3D &quot;BSD-2-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D015106c62262b2383f6c72063=
f0998f2&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/tristanpenman/valijs=
on.git" rel=3D"noreferrer" target=3D"_blank">github.com/tristanpenman/valij=
son.git</a>&quot;<br>
+SRCREV =3D &quot;7a52fc88cdffd6678c009ca2fad700151f7363c6&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit cmake<br>
+<br>
+EXTRA_OECMAKE =3D &quot;-DINSTALL_HEADERS=3D1 -DBUILD_TESTS=3D0&quot;<br>
+<br>
+DEPENDS =3D &quot;curlpp&quot;<br>
+<br>
+# valijson is a header only C++ library, so the main package will be empt=
y.<br>
+RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 install -d ${D}${includedir}/compat<br>
+=C2=A0 =C2=A0 install -d ${D}${includedir}/valijson<br>
+=C2=A0 =C2=A0 install -d ${D}${includedir}/valijson/adapters<br>
+=C2=A0 =C2=A0 install -d ${D}${includedir}/valijson/constraints<br>
+=C2=A0 =C2=A0 install -d ${D}${includedir}/valijson/internal<br>
+=C2=A0 =C2=A0 install -d ${D}${includedir}/valijson/utils<br>
+<br>
+=C2=A0 =C2=A0 install -m 0644 ${S}/include/compat/* ${D}${includedir}/com=
pat<br>
+=C2=A0 =C2=A0 install -D -m 0644 ${S}/include/valijson/*.hpp -t ${D}${inc=
ludedir}/valijson<br>
+=C2=A0 =C2=A0 install -D -m 0644 ${S}/include/valijson/adapters/*.hpp -t =
${D}${includedir}/valijson/adapters<br>
+=C2=A0 =C2=A0 install -D -m 0644 ${S}/include/valijson/constraints/*.hpp =
-t ${D}${includedir}/valijson/constraints<br>
+=C2=A0 =C2=A0 install -D -m 0644 ${S}/include/valijson/internal/*.hpp -t =
${D}${includedir}/valijson/internal<br>
+=C2=A0 =C2=A0 install -D -m 0644 ${S}/include/valijson/utils/*.hpp -t ${D=
}${includedir}/valijson/utils<br>
+}<br>
diff --git a/meta-oe/recipes-devtools/valijson/<a href=3D"http://valijson_=
git.bb" rel=3D"noreferrer" target=3D"_blank">valijson_git.bb</a> b/meta-oe/=
recipes-devtools/valijson/<a href=3D"http://valijson_git.bb" rel=3D"norefer=
rer" target=3D"_blank">valijson_git.bb</a><br>
deleted file mode 100644<br>
index c3254d16e7..0000000000<br>
--- a/meta-oe/recipes-devtools/valijson/<a href=3D"http://valijson_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">valijson_git.bb</a><br>
+++ /dev/null<br>
@@ -1,21 +0,0 @@<br>
-SUMMARY =3D &quot;Header-only C++ library for JSON Schema validation&quot=
;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/tristanpenman/valijson" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/tristanpenman/valij=
son</a>&quot;<br>
-LICENSE =3D &quot;BSD-2-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D015106c62262b2383f6c72063=
f0998f2&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/tristanpenman/valijs=
on.git" rel=3D"noreferrer" target=3D"_blank">github.com/tristanpenman/valij=
son.git</a>&quot;<br>
-PV =3D &quot;0.1+git${SRCPV}&quot;<br>
-<br>
-SRCREV =3D &quot;c2f22fddf599d04dc33fcd7ed257c698a05345d9&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-inherit cmake<br>
-<br>
-EXTRA_OECMAKE =3D &quot;-DINSTALL_HEADERS=3D1 -DBUILD_TESTS=3D0&quot;<br>
-<br>
-# valijson is a header only C++ library, so the main package will be empt=
y.<br>
-RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div>

--0000000000003d476e05abea8319--
