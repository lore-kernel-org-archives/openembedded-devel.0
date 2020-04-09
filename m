Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.4256.1586415210022631002
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2020 23:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YQTWj4xa;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id 130so2967176qke.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2020 23:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DZb8oiTII2rPOjQhm5VyWY/aw24HfMh6qmDHmNOySeA=;
        b=YQTWj4xaRa3qatbU4EkOEVYO5JTbTl+IN8cJwhBv3eF6WbXO+lR89ulfgdgKmIPbSN
         mx+MeJ8Ba8pNjbcG0cuW1B5ZmYsv1Uh8OA2Sn/DGPZM35eyJ1/mpeLcaT0G/Ld05jcYC
         vUfnfNQVJAfVkmyYvGfz6Cu3MvsNTFpG+b0uSUQEht/xbhDLnDAWVpupabBqcIZVbhaz
         I5bYPxj17FfPqIpGWQvOy3s8bqHvPO+zvwPR7z5nqJFjtD+pT627uGkuE4mIq/Rb9Ykw
         3BhV9nYkD9UzW5llbZjiBBU4o6+971qDqf5ZTI4w/yAH2ecu8xqJ8khxeGnY8VSPLr5H
         5sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DZb8oiTII2rPOjQhm5VyWY/aw24HfMh6qmDHmNOySeA=;
        b=Z1fvgqsK7d5ntysYtCdu43VIESWw7tw1pgNciE0A2Ut6DlN1rX0cqhFSNeh1BPHdN4
         0vuhqLqf3C6niTSem5NPCXsareEuRCuyAUe8sv2avfBXW1OLmVGNzN2Wh6VORm5EY9tx
         noC+/9uMn/iGH2ntk8KR28sLfugz+UQ2ICKT0j1nC0WsKlRAyzsajT5o13YsU7omot9W
         D/cqrFj7mvoEDeUHgskJT5i6hdv0fGFYZlrkyWb0rynpbodp1or2NoMT/GAvLAxZZhT4
         jrZ+WV/rd8+dhbXEzSG4Ja7x4Y+zruvQjnYjer0IaU54RU/dfb3KDWxULx65UAEMz3N1
         2g+Q==
X-Gm-Message-State: AGi0PuYLk0iwumqcoFq2T6RYITxq3f7Ngo7y+I+3ORxWQvSN0YjpVtFZ
	+tGmF6PLoPyPVf8G+0TXX4mhb1xQloF0xSoTWEw=
X-Google-Smtp-Source: APiQypKplkUSqN5KFLDSHU00RbK+8agLJO04hObnNb1ZPyyO4QHMyp6xfbraGorBvGyc69uE5xSh5WvsIa0iTq2K4O8=
X-Received: by 2002:a05:620a:1eb:: with SMTP id x11mr3589791qkn.225.1586415208659;
 Wed, 08 Apr 2020 23:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200408233913.6491-1-przemyslaw.hawrylewicz.czarnowski@intel.com>
In-Reply-To: <20200408233913.6491-1-przemyslaw.hawrylewicz.czarnowski@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 8 Apr 2020 23:53:01 -0700
Message-ID: <CAMKF1so7NBe8eLiJmeR0aWcf+A8+624qwRoR_RMHVGSQ94Hz4A@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] Add nbdkit to extend backend possibilities of nbd.
To: Przemyslaw Czarnowski <przemyslaw.hawrylewicz.czarnowski@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

clang find an interesting failure

22:42:57 | main.c:116:2: error: embedding a #include directive within
macro arguments is not supported
22:42:57 | #include "synopsis.c"
22:42:57 |  ^
22:42:57 | main.c:115:3: note: expansion of macro 'printf' requested here
22:42:57 |   printf (
22:42:57 |   ^
22:42:57 | main.c:115:3: error: expected expression
22:42:57 |   printf (
22:42:57 |   ^

On Wed, Apr 8, 2020 at 4:39 PM Przemyslaw Czarnowski
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
>  .../recipes-support/nbdkit/nbdkit_git.bb      | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit_git.bb
>
> diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_git.bb b/meta=
-networking/recipes-support/nbdkit/nbdkit_git.bb
> new file mode 100644
> index 000000000..5f03bf823
> --- /dev/null
> +++ b/meta-networking/recipes-support/nbdkit/nbdkit_git.bb
> @@ -0,0 +1,41 @@
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
> +inherit pkgconfig python3native perlnative autotools
> +# needed as nbdkit does not support build in external directory
> +inherit autotools-brokensep
> +
> +# Those are required to build standalone
> +EXTRA_OECONF =3D " --without-libvirt --without-libguestfs --disable-per=
l"
> +
> +# Disable some extended support (not desired for small embedded systems=
)
> +#EXTRA_OECONF +=3D " --disable-python"
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
