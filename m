Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.16692.1608947036022979020
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 17:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X04yTz7Y;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ga15so7639747ejb.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 17:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1rLJ5Z6WJJ+t02Xb5vM8N3uAEECZ6vab1THW06/MMIA=;
        b=X04yTz7Y+LLRciXuaWXadwIy9TtgZgheTfChMGqPtJu1mH5xqOEuolSJZIZ6tSC056
         IlCKPl5dR3F70a9zkmI+jBAiwvlGr6TrIxwR8u+z8azKMOPqaGNx5Yt6KZ6bYxadJVFL
         ZPdU5vQ7H6Sr+gAzA1pBLpbwsSj/nLV0lx1twxJBJTCdQFGBxGKb1A02pNZ+BzJAhmNS
         2UjcpxnAuBHnRPgfh96zKaDTb+XjS25w+jnfdmzy7MoRTlCH1V+TusKE3MEE7zH9jz3d
         2q7KPUzHHtsJAK76fU6XfDkOoSWltI+BdIGH72nshbBJojd6pqcsJjt+kT6UhlZuHN/d
         Jrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1rLJ5Z6WJJ+t02Xb5vM8N3uAEECZ6vab1THW06/MMIA=;
        b=D2u3j5NhHSU3xVrBA0SRIusuiL6jXH+Pje17vwMN0VoB+pnNGvg9RYP1fVeygz9Elz
         46Cieib4ZQwGzEk0/IfzNL8TGAH0EIhpdKShpy6U9R6fy/AH2ZFVy7SmZJwIbtfaV7x3
         ERMQaoz20lz7bcRbHsTUB9VHWXcTNCNQZqTELZF7W0O/lnH+HmXY7TVZNqAPqD1yFB2E
         Pr3EzQaEwXZRw6SMlCyTiy6EfmBg8TjfCfWbkKKC1Ha7ozOg/ymCRMrhlgLdWsa0tEGK
         4TSm1fEKQTzPh+dtMSPUwwdiD7NAyFr+E5kz/ZmpdFEaXkUq6eLk+WycIY3qQxkhgM6k
         R0Xg==
X-Gm-Message-State: AOAM533RcY3AjoqTWVSBv4sIIlLdRH37p0b4UZoDHZuyMyO08vbKYgI+
	Q8cBeJKy4oIdnUmhWB+LfLvHqC4GItqXuGgwpXE=
X-Google-Smtp-Source: ABdhPJwA8u5QEOxFqqbv5KnnrQs4ia5OhzsbUK+FW2Ya2TWiyoadauFlQN5h4iGkVCnB/uqs6d/gdwPi5Fh2BdLiYxc=
X-Received: by 2002:a17:906:168f:: with SMTP id s15mr32668143ejd.180.1608947034319;
 Fri, 25 Dec 2020 17:43:54 -0800 (PST)
MIME-Version: 1.0
References: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org> <d66d930a-63ca-8f57-9e4d-d3d107cf8d4b@gmail.com>
In-Reply-To: <d66d930a-63ca-8f57-9e4d-d3d107cf8d4b@gmail.com>
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
Date: Sat, 26 Dec 2020 04:43:43 +0300
Message-ID: <CALT56yOWTnf+A4HS6Mg+cDGz2UbAm89vXTh0Hi3P7OXw=SdknQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/7] imlib2: add image manipulation libray from englightenment project
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 26 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 04:41, Khem Raj <r=
aj.khem@gmail.com>:
>
> Please add new recipes to test packagegroups in
> meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb

OK, I will send a followup patch, if you don't mind.

>
> On 12/25/20 5:20 PM, Dmitry Baryshkov wrote:
> > Restore and update old imlib2 recipe from meta-efl.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 39 +++++++++++++++++=
++
> >   1 file changed, 39 insertions(+)
> >   create mode 100644 meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> >
> > diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/r=
ecipes-graphics/imlib2/imlib2_git.bb
> > new file mode 100644
> > index 000000000000..b44b03ce8e78
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> > @@ -0,0 +1,39 @@
> > +SUMMARY =3D "A graphic library for file loading, saving, rendering, a=
nd manipulation"
> > +
> > +HOMEPAGE =3D "https://sourceforge.net/projects/enlightenment/"
> > +SECTION =3D "libs"
> > +LICENSE =3D "MIT & BSD"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D344895f253c32f38e182dcaf30=
fe8a35"
> > +
> > +DEPENDS =3D "freetype "
> > +PROVIDES =3D "virtual/imlib2"
> > +PV =3D "1.7.1"
> > +SRCREV =3D "v1.7.1"
> > +
> > +inherit autotools pkgconfig lib_package
> > +
> > +AUTO_LIBNAME_PKGS =3D ""
> > +
> > +SRC_URI =3D "git://git.enlightenment.org/legacy/${BPN}.git;protocol=
=3Dhttps"
> > +S =3D "${WORKDIR}/git"
> > +
> > +PACKAGECONFIG ??=3D "jpeg png zlib ${@bb.utils.filter('DISTRO_FEATURE=
S', 'x11', d)}"
> > +
> > +X11_DEPS =3D "virtual/libx11 libxext libice"
> > +PACKAGECONFIG[x11] =3D "--with-x,--without-x,${X11_DEPS}"
> > +
> > +PACKAGECONFIG[gif] =3D "--with-gif,--without-gif,giflib"
> > +PACKAGECONFIG[jpeg] =3D "--with-jpeg,--without-jpeg,jpeg"
> > +PACKAGECONFIG[png] =3D "--with-png,--without-png,libpng"
> > +PACKAGECONFIG[tiff] =3D "--with-tiff,--without-tiff,tiff"
> > +PACKAGECONFIG[webp] =3D "--with-webp,--without-webp,libwebp"
> > +
> > +PACKAGECONFIG[bzip2] =3D "--with-bzip2,--without-bzip2,bzip2"
> > +PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
> > +
> > +PACKAGECONFIG[id3] =3D "--with-id3,--without-id3,libid3tag"
> > +
> > +PACKAGES =3D+ "${BPN}-loaders ${BPN}-filters ${BPN}-data"
> > +FILES_${PN}-data =3D "${datadir}"
> > +FILES_imlib2-loaders =3D "${libdir}/imlib2/loaders/*.so"
> > +FILES_imlib2-filters =3D "${libdir}/imlib2/filters/*.so"
> >
> >
> >
> >=20
> >



--=20
With best wishes
Dmitry
