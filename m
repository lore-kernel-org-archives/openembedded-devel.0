Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.1092.1586275827077204713
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 09:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RZz/aaZZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id 130so2211082qke.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2020 09:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ihnR+OdpaKteJ8xA5vKBOd4eH+diV8p8xXDCG8SQU7I=;
        b=RZz/aaZZa4945EhqlxuTQ9Mefq/15EE0cOZ11jcrj8BqMsIl8tixIZTxF2kQT4mfBK
         s59fCE+3waIOmXi7O70Is7PDqQ+yp0uJikME9lOjnkz0sc7fd7iGbF36oTVD+Y3YBUL+
         O9Fu9R9BcMkdk8NR07KsuQc/ApxHiWHZxiViX/ZDi7K1HDbShFwYRRJfERKA0ZngILGm
         hXKoGqQLiRI5Q4uSNh1r52tvKCMamxeUhdBxf5TwnfoH2nmifQOdQ0vTyF11UtcxabLk
         Lk4dhG0YinjjyE+47EQZ3LdG3CuDG4+ziziYiMDhHWv25Dua8ZCKII68BYd1jzp4x73L
         RmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ihnR+OdpaKteJ8xA5vKBOd4eH+diV8p8xXDCG8SQU7I=;
        b=E2B3UhJe2YaRIM9JvGcnpfQ4NzrvEJ6zPWTqLR4UFtwXJ0j/TdgCB5XdPG73+GtxRt
         4vziX3M+Tyqs8z9dFLlgs3xLy/70A8AsRe5UfZPrbf6PiZcOUugpAMFaEmCIYE5gTmwq
         7ivzigmB+eqDRUN85vZ9+7RvB+56VOuT9OGQb8jjVvlfBkntwZJpxuRDC2nwsyRFBoth
         XXjP2UCFhIAbrI1OQYYtmVLuUwQSHWAYUjrrFNiAztXmjA3yieYQwXqOh12x9AQxAkJL
         HG8BZM66c+yqEOSfI1zVcxt3JQJCAgQ7LDsEuvYDcccTlNu7Aqq6Ods/sd/26rNSpyET
         4zxg==
X-Gm-Message-State: AGi0Pua68mHGh22nYc7ZIm7fz1w6jPSU4FhePRNc4kt3zOkMYJzL23vt
	q/MNMA5NtsQe1STzsH6p14EmSoy5/JlnO9u1Iek=
X-Google-Smtp-Source: APiQypLTYRkPNhSzPzPl6Zqx1iNJ84iyPighZVZw0wHgxQwIOcqCZJOvS+6kKOgECJGuhDB/yMYANhdqKseR7PS12pU=
X-Received: by 2002:a05:620a:1eb:: with SMTP id x11mr3012835qkn.225.1586275825765;
 Tue, 07 Apr 2020 09:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200407092347.5634-1-przemyslaw.hawrylewicz.czarnowski@intel.com>
In-Reply-To: <20200407092347.5634-1-przemyslaw.hawrylewicz.czarnowski@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 7 Apr 2020 09:09:59 -0700
Message-ID: <CAMKF1sqGQeok=Aey2VNibP9TjNo1S2EC56fOZ=7rgPC1vGnvAA@mail.gmail.com>
Subject: Re: [oe] [PATCH] Add nbdkit to extend backend possibilities of nbd.
To: Przemyslaw Czarnowski <przemyslaw.hawrylewicz.czarnowski@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2020 at 2:24 AM Przemyslaw Czarnowski
<przemyslaw.hawrylewicz.czarnowski@intel.com> wrote:
>
> Nbdkit uses plugins to add more sources of data for nbd client.
> Nbdkit can also spawn nbd-client, uses unix or network socket to
> communicate with client, uses different plugins to serve data for nbd
> device eg. curl, file, custom plugins in many languages (perl, python)
> and some others.
>
> Signed-off-by: Przemyslaw Czarnowski <przemyslaw.hawrylewicz.czarnowski@=
intel.com>
> ---
>  .../recipes-support/nbdkit/nbdkit_git.bb      | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit_git.bb
>
> diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_git.bb b/meta=
-networking/recipes-support/nbdkit/nbdkit_git.bb
> new file mode 100644
> index 000000000..0f7653d9c
> --- /dev/null
> +++ b/meta-networking/recipes-support/nbdkit/nbdkit_git.bb
> @@ -0,0 +1,43 @@
> +SUMMARY =3D "nbdkit is a toolkit for creating NBD servers."
> +DESCRIPTION =3D "NBD =E2=80=94 Network Block Device =E2=80=94 is a prot=
ocol \
> +for accessing Block Devices (hard disks and disk-like things) \
> +over a Network. \
> +\
> +nbdkit is a toolkit for creating NBD servers."
> +
> +HOMEPAGE =3D "https://github.com/libguestfs/nbdkit"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4332a97808994cf2133a65b6c6f3=
3eaf"
> +
> +SRC_URI =3D "git://github.com/libguestfs/nbdkit.git;protocol=3Dhttps"
> +
> +PV =3D "1.19.6+git${SRCPV}"
> +SRCREV =3D "257561bc9f2f01eb9f21686bcec4b863d17a26c4"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS =3D "curl xz e2fsprogs zlib"
> +
> +inherit pkgconfig python3native perlnative pythonnative autotools

do we need to inherit pythonnative here ? this would need py2 and we do no=
t
have py2 anymore in core, so I would ask you to see if we can remove
this dependency
or keep it disabled by default.

> +# needed as nbdkit does not support build in external directory
> +inherit autotools-brokensep
> +
> +# Those are required to build standalone
> +EXTRA_OECONF =3D " --without-libvirt --without-libguestfs --disable-per=
l"
> +
> +# Old python2.x not suitable for nbdkit >=3D 1.16
> +EXTRA_OECONF +=3D " --disable-python"
> +
> +# Disable some extended support (not desired for small embedded systems=
)
> +#EXTRA_OECONF +=3D " --disable-ocaml"
> +#EXTRA_OECONF +=3D " --disable-rust"
> +#EXTRA_OECONF +=3D " --disable-ruby"
> +#EXTRA_OECONF +=3D " --disable-tcl"
> +#EXTRA_OECONF +=3D " --disable-lua"
> +#EXTRA_OECONF +=3D " --disable-vddk"
> +
> +do_install_append() {
> +    rm -f ${D}/usr/share/bash-completion/completions/nbdkit
> +    rmdir ${D}/usr/share/bash-completion/completions
> +    rmdir ${D}/usr/share/bash-completion
> +}
> --
> 2.20.1
>
>=20
