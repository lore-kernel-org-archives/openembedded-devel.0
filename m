Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D85C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 00:11:40 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.9010.1724199096060531850
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 17:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jRGVnP/H;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-70941cb73e9so3053232a34.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 17:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724199095; x=1724803895; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RveooqeuY+eWEid55BoKTubwBRoUcG5y5+eGKHFGdSU=;
        b=jRGVnP/HZaUDZsGdOshJm8cAwIm4lkKBEAswqlkPbhormteLGD9LBs8NXhO1ZYVuE+
         ao2NyLzJk1n7WLMs8qPpsBfbqpIIOTz8jMtqCUySYxFSsuftr34qeMy2eYHNZfOvN8Er
         d6TeE+4Tr1k2l7GWmfU+6a8uRfnAAhczCrGA5xv31rwb/u8A+x/PYKsR/MJxzR+XUYMW
         0MRFS9TOYUWx4S8nGOGCy0efbH2JFgpVuPYfYdNvepuCjpgnK9M4dCiL1L8NnrzmpX6X
         vZE7jP8+t/QpBiE3YQy1Gfz/2L5jAmlFDErSYdZrgwzzA0+QwfIyQfpFSOTmHAcJWst4
         AbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724199095; x=1724803895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RveooqeuY+eWEid55BoKTubwBRoUcG5y5+eGKHFGdSU=;
        b=imVhwtofkEIFFk2jQlfGBxDzCND1C7YHGEmQRwJINjbYUVuUYcwbuOmQPnX+YYhzWk
         fUsSggAylMa1RvVBYYrqSNj6NhnWRetZ0Xc2Xq9avITAgHe/yt6F74f/+8QsIIJT+Rz2
         vZi2zd+tMRaeShQoPl7U5sGJsE5e7ddUCs4SuJS7xrYWtAjOjTPqZGOeP/elT6qgmDXD
         UHKqm+ZZC4kcrfhXCMxqMAwG8dueH0egk7YVC5ESmqbBX4KoE8HoiQpaDmypp+XsWkzn
         n/s0aSPpBrl4YBHLOGF9oiYsTYlmahPFSkOuwMtwJSrpQZXLqTIWapZEV7JFaVoU6WHe
         lEbQ==
X-Gm-Message-State: AOJu0YxXIzfXyHcZvTUPr4V9n2mvWHevYeqwij+MKV4VptVsd+NhehH2
	r8ixNfXY4oih3ARUvCxNiH/6ZknU8Mx1iW61UxnLl4AvTHwuj8uUcE2K5Zpz1UlX6s8mp51OnPM
	A13iLijC5SD6CubM7tk3pGa8yQ58=
X-Google-Smtp-Source: AGHT+IEdNRH4wPzxD74MDIC3Pj2Lc4u3WjXLRTZIoxt0xtuhr3IFo853B2BirzCdKXTIVkb7ZlvDzgka3D6ZxlHJ6YU=
X-Received: by 2002:a05:6871:a00d:b0:25e:bd07:4743 with SMTP id
 586e51a60fabf-27371c3c0admr657572fac.0.1724199095127; Tue, 20 Aug 2024
 17:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240820054044.1538795-1-jamin_lin@aspeedtech.com> <20240820054044.1538795-3-jamin_lin@aspeedtech.com>
In-Reply-To: <20240820054044.1538795-3-jamin_lin@aspeedtech.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Aug 2024 17:11:08 -0700
Message-ID: <CAMKF1spTFR5anMr8isUP+r1XJSj5xYe-c=CVSGv0nVwhJBcVAQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe:drgn: add new recipe
To: jamin_lin@aspeedtech.com
Cc: openembedded-devel@lists.openembedded.org, troy_lee@aspeedtech.com, 
	jaminlin1207@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 00:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111872

this seems to fail with clang and llvm provided libomp  see

https://errors.yoctoproject.org/Errors/Details/798433/

On Mon, Aug 19, 2024 at 10:40=E2=80=AFPM Jamin Lin via lists.openembedded.o=
rg
<jamin_lin=3Daspeedtech.com@lists.openembedded.org> wrote:
>
> drgn is a debugger with an emphasis on programmability
> drgn exposes the types and variables in a program
> for easy, expressive scripting in Python.
>
> Drgn depends on:
> 1. python3
> 2. elfutils
>
> The build requires:
> 1. setuptools
> 2. automake
> 3. autoconf
> 4. libtool
> 5. pkgconf
>
> Reference:
> https://drgn.readthedocs.io/en/latest/installation.html
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  .../drgn/python3-drgn_0.0.27.bb               | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb
>
> diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb b/meta-oe=
/recipes-kernel/drgn/python3-drgn_0.0.27.bb
> new file mode 100644
> index 000000000..5c0dbe963
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb
> @@ -0,0 +1,69 @@
> +SUMMARY =3D "drgn (pronounced dragon) is a debugger with an emphasis on =
 \
> +programmability. drgn exposes the types and variables in a program for e=
asy, \
> +expressive scripting in Python."
> +HOMEPAGE =3D "https://github.com/osandov/drgn"
> +LICENSE =3D " LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7c83d30e99508d6b790eacdd3abab=
846"
> +
> +SRC_URI =3D "git://github.com/osandov/drgn.git;protocol=3Dhttps;branch=
=3Dmain"
> +SRCREV =3D "a8dfc9e31f551d4b3c3d4307fa19ab6b3bfafb1c"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS =3D "\
> +    autoconf-native \
> +    automake-native \
> +    libtool-native \
> +    elfutils \
> +    "
> +
> +RDEPENDS:${PN} =3D "\
> +    python3-crypt \
> +    python3-io \
> +    python3-logging \
> +    python3-math \
> +    python3-pickle \
> +    python3-stringold \
> +    python3-compression \
> +    "
> +
> +RDEPENDS:${PN}:append:class-target =3D "\
> +    libdw \
> +    libelf \
> +    libgomp \
> +    "
> +
> +RDEPENDS:${PN}:append:class-native =3D "\
> +    elfutils-native \
> +    "
> +
> +RDEPENDS:${PN}:append:class-nativesdk =3D "\
> +    nativesdk-elfutils \
> +    "
> +
> +export CONFIGURE_FLAGS =3D "\
> +    --build=3D${BUILD_SYS}, \
> +    --host=3D${HOST_SYS}, \
> +    --target=3D${TARGET_SYS}, \
> +    --prefix=3D${prefix}, \
> +    --exec_prefix=3D${exec_prefix}, \
> +    --bindir=3D${bindir}, \
> +    --sbindir=3D${sbindir}, \
> +    --libexecdir=3D${libexecdir}, \
> +    --datadir=3D${datadir}, \
> +    --sysconfdir=3D${sysconfdir}, \
> +    --sharedstatedir=3D${sharedstatedir}, \
> +    --localstatedir=3D${localstatedir}, \
> +    --libdir=3D${libdir}, \
> +    --includedir=3D${includedir}, \
> +    --oldincludedir=3D${includedir}, \
> +    --infodir=3D${infodir}, \
> +    --mandir=3D${mandir}, \
> +    --with-libtool-sysroot=3D${STAGING_DIR_HOST} \
> +    "
> +
> +export PYTHON_CPPFLAGS =3D "-I${STAGING_INCDIR}/${PYTHON_DIR}"
> +
> +inherit python3native pkgconfig setuptools3
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111862): https://lists.openembedded.org/g/openembedde=
d-devel/message/111862
> Mute This Topic: https://lists.openembedded.org/mt/107995862/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

