Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.169.1612991845880062599
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 13:17:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=co0uyVr5;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id b24so2631244qtp.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 13:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ll0u+OPT7C8YuyuhLdyKEGItkHKpbhMPiNZX5Fzye8Y=;
        b=co0uyVr5e2EZieO0WvZWzzZx0swt8zrK94ln8mTvXf/LX+lo12GXwHNMRrJA495k6k
         1GQUhUCX/WvUMkNlK6PBH0/tVwRw1vTSSfZwazeCjlKZei3P4t6zv+kAOEn1q6/io9xv
         WBhFOsGHu6REjefwpzCnsTLNXkQuVv/fqp36w86IzWFO/3wZaprseBdsjl8AhWo5b6OR
         iJIb8A5ycJ3ElO1DOxIw8Qz/0M2MdaB/ycZ71NKD2iWLVpKFQGGl6cAkT1JoR2oLUQ+Q
         GIZn2RFWpncxVMOVq3cJG4VUfNk6fWvz0sEgEs0e50Z/IS0NYnMpUGnXwRSm9Mx5oN8O
         I4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ll0u+OPT7C8YuyuhLdyKEGItkHKpbhMPiNZX5Fzye8Y=;
        b=heyBbRYJvmkE2iEUH887082BJ78tiiVQ16cEuLVOtYES/DEdUUj6IIbkFaq0Y3ddb8
         BTy9Uy7d5/TlsUbR7eyMiVmm5XPBfmdwR2/BNalFlViTP5JvGLdSHIe6Kcf5Uow5D4nf
         9eaT6XPWLB5iMJuAcEA4Y+2sjG23LEbUW6vK7YZCIyEXsUrcNkgSWyiufkVQZ7X89qTm
         U19fOl/m7DiEqlWbVpOl81gKqIYFZ+bum7uO7TT46B8Wjdq0R6ErzspKZSs4gcCB3tRw
         VC3ILwy6vXUVFzZI0jYWef4e58Rl2usHecsFA1bXT4hEOOmwjhNegnFaaiVdyH7j61+H
         ZeDQ==
X-Gm-Message-State: AOAM532ct9bAsD3gDUqSW1KRLwOze3Sijdw/OOErCVwKrDk6MXZIXQ93
	I/CGbvqTXJKzp+7p09cQwFfEo3nLH9x1X0tfrMc=
X-Google-Smtp-Source: ABdhPJxoUDskiNn/jizZj2tFNtvYXR2NlOSB5Ok66n1umiduxIQS1ecOLx40qjUURUoQryW9bD2BO7jyqJo6E12jONE=
X-Received: by 2002:ac8:4b49:: with SMTP id e9mr4645559qts.80.1612991844955;
 Wed, 10 Feb 2021 13:17:24 -0800 (PST)
MIME-Version: 1.0
References: <20210210205538.690009-1-schnitzeltony@gmail.com> <20210210205538.690009-9-schnitzeltony@gmail.com>
In-Reply-To: <20210210205538.690009-9-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 10 Feb 2021 13:16:58 -0800
Message-ID: <CAMKF1sphEKtJVdO7Ns7FDsniK6mDzKojjpFcTVmA_C4-AEzKJA@mail.gmail.com>
Subject: Re: [oe] [PATCH 09/13] glibmm4: Initial add 2.68.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you add the newly added recipes to testing packagegroup as well ?

On Wed, Feb 10, 2021 at 12:56 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../recipes-core/glib-2.0/glibmm4_2.68.0.bb   | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-core/glib-2.0/glibmm4_2.68.0.bb
>
> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm4_2.68.0.bb b/meta-oe/r=
ecipes-core/glib-2.0/glibmm4_2.68.0.bb
> new file mode 100644
> index 000000000..33f0645b7
> --- /dev/null
> +++ b/meta-oe/recipes-core/glib-2.0/glibmm4_2.68.0.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "C++ bindings for the glib library"
> +HOMEPAGE =3D "http://www.gtkmm.org/"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPLv2.1 & GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D42dfffebc56fec7527aac53b7a89=
d1d8 \
> +                    file://COPYING.tools;md5=3D751419260aa954499f7abaab=
aa882bbe"
> +
> +DEPENDS =3D "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
> +
> +GNOMEBASEBUILDCLASS =3D "meson"
> +
> +BPN =3D "glibmm"
> +
> +inherit gnomebase
> +
> +SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split(=
'.')[1]}"
> +
> +SRC_URI +=3D "file://remove-examples.patch"
> +SRC_URI[archive.sha256sum] =3D "c1f38573191dceed85a05600888cf4cf4695941=
f339715bd67d51c2416f4f375"
> +
> +FILES_${PN} =3D "${libdir}/lib*.so.*"
> +FILES_${PN}-dev +=3D "${datadir}/glibmm-* ${libdir}/glibmm-2.68/include=
/ ${libdir}/glibmm-2.68/proc/ ${libdir}/giomm-2.68/include/"
> +
> +RDEPENDS_${PN}-dev =3D "perl"
> --
> 2.26.2
>
>
>=20
>
