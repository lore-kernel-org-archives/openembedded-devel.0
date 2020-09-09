Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.1623.1599671567826229761
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 10:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BLIG6CnD;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id p65so2558069qtd.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2020 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=acIYthd4xKG7P5DXobkwbeu95Zv94S53kmONNNY6JRk=;
        b=BLIG6CnDgF6Z+kEbjY/UVdewbixfkx/QBgW7wc57IUMq5YVgL3DnpUC6fgpzYpZkvX
         TY3lj4VTZ0FwdBzMGIlfdyKt4OOznNqPArAV76gaZnQxEqlcry2g1c8LlkM07P15jyGT
         cwK+gR8Wa6FaI7GuR5sZWHX0NMOtEDEBlndvZkAC2EGoUbig+CXehCKIf7UdgFKvDnaR
         dV11xuRFbwZTTDANNM0Btn8FDcD86aDsza1a1unxuDHH9FS8NDbcSOue2zwuMgSN/G3A
         LX0MTPJR43LBULHNcc6QWbJy6PpQCnuNNhNdpQxbPICufIrHPj+hAImfhSd5uDUa/QSb
         zZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=acIYthd4xKG7P5DXobkwbeu95Zv94S53kmONNNY6JRk=;
        b=R9SeDi/053AIEX8xaCdHBZkrWcpal1SaQtlIcydQXnRsd8ve+mVdHlPgOx8UoduVRx
         UuBLIlygijPk2KqMOo4o3llfSH11GY2Ji67RY8ZfyLqvtVxYiwPdfjGR9bEpI5qE6vCx
         316PTrA3dS7HPDGkWs29/Xz2BoxDjcNFkHT/vCMNQc2Sxk8wGpZgMrgkGFKKoksGU6eF
         x5mnCzD2Z8g2bJ9fnAx9myFBRZ6FtHmkDlFncDUv0aJaatAwOowrZV6JzZniQltwZmBo
         /OTKWX4mstFFw2gzRFvbBSpznr5Vj3ex0SSwl8RYC5lw+OGJpwyZ+NtZD0MFbwCZfYFl
         AM3g==
X-Gm-Message-State: AOAM5303HvmQw2vMEtigJs50dve7a4/l1WeGB03NZaTrDNnO8Xxm18rY
	AvCtC4bs6BxMUONkRfaO7TBYxak3mF+YkGBkK2suL849YvficQ==
X-Google-Smtp-Source: ABdhPJzowzSo6A5Dp3ccpw/6tjM3ydDWJf2sBJ+WZcxwgJRrliaIxqsy8ozdsJksAwpHcwd8tbnrj6ZMtCK6QyKvwjs=
X-Received: by 2002:ac8:3fcb:: with SMTP id v11mr4174781qtk.80.1599671566654;
 Wed, 09 Sep 2020 10:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200909084218.802654-1-m.tretter@pengutronix.de>
In-Reply-To: <20200909084218.802654-1-m.tretter@pengutronix.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 9 Sep 2020 10:12:20 -0700
Message-ID: <CAMKF1so-Zfiv+vbFf1J1-bSkBMSTN4gx548YJ5=cUK42YS--cg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] apitrace: add new recipe
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 9, 2020 at 2:54 AM Michael Tretter <m.tretter@pengutronix.de> wrote:
>
> apitrace consists of a set of tools to:
>
>  - trace OpenGL, OpenGL ES, Direct3D, and DirectDraw APIs calls to a file;
>
>  - replay OpenGL and OpenGL ES calls from a file;
>
>  - inspect OpenGL state at any call while retracing;
>
>  - visualize and edit trace files.
>

Thanks for contributing new recipe, they also need to go into
appropriate packagegroup in packagegroup-meta-oe.bb
so it can be built in testing images.

> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  .../recipes-devtools/apitrace/apitrace_9.0.bb | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
>
> diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
> new file mode 100644
> index 000000000000..6e61683cde92
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "Tools for tracing OpenGL, Direct3D, and other graphics APIs"
> +HOMEPAGE = "http://apitrace.github.io/"
> +SECTION = "console/tools"
> +LICENSE = "MIT & BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
> +                    file://thirdparty/snappy/COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
> +
> +SRCREV = "cae55f54c53449fd07f8a917dcd0874db2c15032"
> +SRC_URI = "git://github.com/${BPN}/${BPN}.git"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS += "zlib libpng python3-native"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE += "\
> +    -DENABLE_GUI=OFF \
> +    -DENABLE_X11=OFF \
> +    -DENABLE_STATIC_LIBGCC=OFF \
> +    -DENABLE_STATIC_LIBSTDCXX=OFF \
> +    -DPython3_ROOT_DIR=/usr/bin/python3-native \
> +"
> +
> +# Use the bundled snappy library
> +EXTRA_OECMAKE += "\
> +    -DENABLE_STATIC_SNAPPY=ON \
> +"
> --
> 2.20.1
>
> 
