Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.193.1613066165563772988
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 09:56:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cc8rE0Mp;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id h8so6053018qkk.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Feb 2021 09:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SKG2HKXB00IoAGtUbZzq2+HkD5EsgHwHf/2wq2I95p4=;
        b=Cc8rE0Mp9MQVNLiiO9nQIGduF5T6Hys8Qryxpm+R+YsQVb1qFw2Nvgw1J/1oLtuAl8
         Ndv/eVpc3+8HsqJGjzveL7G5Si/8MopUHjbejO1gH/6UlFun5T0pvSQjF0MAL5dyD83g
         kw1jEaGX6vd9WmbMS5nJY2VVeLuipt2en7PK1gfGP1uKhOZ9gD/mwOZcACb/8eRm1xhP
         gks14zMb0paW6HlAMGiuAXgMo82nfMLrk9jbIOcCpWVleK5iGyIHKGfaEfXIUCueW4oC
         wOt6yvnuq1LO8T+Ze8JA+ydVn2/ryCNhhoyav+yOWOYaiqBT0yWPMwXyf4lfpEcXxiPZ
         DjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SKG2HKXB00IoAGtUbZzq2+HkD5EsgHwHf/2wq2I95p4=;
        b=f2uXaYKPj0AiNL68+huLF43JPvZQpV6Ti2Ezza0ugAfEYrFHU7pE3aaUrDVHtI9XLb
         v2QznD7GOTrdcI5rNhhWabxu9U+Q/gQReh2bWS16qY8v+5Fg4fSJLIhCgfW4D9gdFpWw
         V0UWggzfEfETzQBzppYlRwhsidsZuCSAFvzxds9cLzmlAlPfdeLagF/iqi9V/eUhkROw
         DvNTwEEk8bInc/tlQWud6+4uGt8nfIL7rHeajc5AVkV9JkCXrSsk/by/keJ8g7oGqgow
         xFgbHQdiyCaRMhBSLWRIL2+hgu/8phLo4CUA/h4Bg0TyHBxgnSUkLreB0ai1K/oCYoD6
         PlkA==
X-Gm-Message-State: AOAM532O2QYZlc0eLr5cGBDPY7zKDtb6+SsApumQzgORrmVcHOTbUbDY
	Zb3oCPTA7Z2kw2Frj9D29gEuoNBWfwjePtHZzfE=
X-Google-Smtp-Source: ABdhPJx7jU007FJ3ZzxX6I2yfNgeH8xIz2nDtru4ifBWQbYsrvbSf8CaTphQkaii1hHMq5diz7l11aU6W+gA/vJh5Us=
X-Received: by 2002:a37:7047:: with SMTP id l68mr9156579qkc.337.1613066164553;
 Thu, 11 Feb 2021 09:56:04 -0800 (PST)
MIME-Version: 1.0
References: <20210210205538.690009-1-schnitzeltony@gmail.com> <20210210205538.690009-11-schnitzeltony@gmail.com>
In-Reply-To: <20210210205538.690009-11-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Feb 2021 09:55:38 -0800
Message-ID: <CAMKF1sqGuHhzuro8mekwmJbEAjPMRUuYKcUVz6OPTN18xDsvFA@mail.gmail.com>
Subject: Re: [oe] [PATCH 11/13] pangomm4: initial add 2.48.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

seeing

ERROR: Nothing PROVIDES 'glibmm3' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-gnome/atk/atkm=
m4_2.36.0.bb,
/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-graphics/pango=
/pangomm4_2.48.0.bb
DEPENDS on or otherwise requires it). Close matches:
  glibmm
  glibmm4
  libmms
ERROR: Nothing PROVIDES 'cairomm3' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-graphics/pango=
/pangomm4_2.48.0.bb
DEPENDS on or otherwise requires it). Close matches:
  cairo
  cairomm
  cairomm4
ERROR: Nothing RPROVIDES 'atkmm4' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-gnome/atk/atkm=
m4_2.36.0.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'atkmm4'
NOTE: Runtime target 'atkmm4' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['atkmm4']
ERROR: Nothing RPROVIDES 'atkmm4-dev' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-gnome/atk/atkm=
m4_2.36.0.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'atkmm4-dev'
NOTE: Runtime target 'atkmm4-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['atkmm4-dev']
ERROR: Nothing RPROVIDES 'pangomm4' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-graphics/pango=
/pangomm4_2.48.0.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'pangomm4'
NOTE: Runtime target 'pangomm4' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['pangomm4']
ERROR: Nothing RPROVIDES 'pangomm4-dev' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-graphics/pango=
/pangomm4_2.48.0.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'pangomm4-dev'

On Wed, Feb 10, 2021 at 12:56 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../recipes-graphics/pango/pangomm4_2.48.0.bb | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/pango/pangomm4_2.48.0.bb
>
> diff --git a/meta-oe/recipes-graphics/pango/pangomm4_2.48.0.bb b/meta-oe=
/recipes-graphics/pango/pangomm4_2.48.0.bb
> new file mode 100644
> index 000000000..9ecbeb25b
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/pango/pangomm4_2.48.0.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "C++ bindings for the pango library"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPLv2.1 & GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737=
b499 \
> +                    file://COPYING.tools;md5=3D751419260aa954499f7abaab=
aa882bbe"
> +
> +DEPENDS =3D "mm-common cairomm3 glibmm3 pango"
> +
> +BPN =3D "pangomm"
> +
> +SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split(=
'.')[1]}"
> +
> +SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}=
/pangomm-${PV}.tar.xz"
> +SRC_URI[sha256sum] =3D "9e0ed474c33f8c2002ca9e2b61ca0d1f3d8e409e09e99f4=
d8c19eeafccf55b78"
> +
> +inherit features_check meson pkgconfig
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
> +EXTRA_OECONF =3D " --disable-documentation "
> +
> +FILES_${PN} =3D "${libdir}/lib*.so.*"
> +FILES_${PN}-dev +=3D "${libdir}/*/include/ ${libdir}/pangomm-*/"
> +
> --
> 2.26.2
>
>
>=20
>
