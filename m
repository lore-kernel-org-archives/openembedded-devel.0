Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5023FE728D5
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 18:01:03 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.24564.1696010460494739121
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 11:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HCzaqmMX;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1dd2e65ed59so4613234fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 11:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696010460; x=1696615260; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeG4NgXfo4anBzkw08LgkXZBZu040A/Elc2S2pfQzJk=;
        b=HCzaqmMX/egxSv1YvtW0kEb9n3QDkuO6mHyTsiP0Didb1WzlIm0HKvvkBbQFYCCNgB
         t52fnhPTd/lCN9BJMOPIcCD7bo8ZLSaNBIDxTmBOMhatZAAMTdBGUP7aRwRHmmljgHul
         ZwhQ3zMlUvXeflVhKKS6f9EhNF4YjvqFqq0FRM4Bh5N9tUBuVbTreqXGp3weunhf5HdB
         6E0jLHCVFsbopsblTp0ijVxEXFUJwILfQJT00C8L+2f5Vz3pN1juIIETN4nkMLU4M9P/
         az25IXhkGIY8L/4NICinAcXVZUpz6YwffpD/wcJrLKMdrq845mcccocYw5QWyRWw8nYa
         hizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696010460; x=1696615260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeG4NgXfo4anBzkw08LgkXZBZu040A/Elc2S2pfQzJk=;
        b=uyP17CRHcj4fLyG9VaeIl3C5zobODIwQRRGKx2T/I/msQd+3S/PRIVxKOLjvp49YNS
         aTEJG8ziIdlNEVDxtYL4SZAppeS/yQzsmBdSCbXl5h8bcBbqumlR1+6yKIA1urj2GmZC
         q8Co2W0inpGhz+lEz5kzWT3fehg0U1h3FBXmEsjtwRjt5Ev4bfrOCiONFP0BgfmSWcGt
         qulk/zCH/mpBQ1WbJ3hBrHJcuMHJZ4tD+ga3xYy93iu9R7nmsoJ2diNTMNcf5Nt7xQ3Z
         fd1/LBVNzz3FYJtYz0J5dzlFAjvm9dULP0Olza1PpFqP4T7QUDnc2We6Ub1fICjH4Y8n
         UvCQ==
X-Gm-Message-State: AOJu0YzxV9fnFYeTjxBnX5biXSOX6wM4l+PY5qx0gEpacohFEYitaE8t
	Y1iKdfxQAcXxm++2UhYvve88TkioyKh95HmbWC3Swqx5K/w=
X-Google-Smtp-Source: AGHT+IFN+7fQADegH9iY8GISHQYroPD95RF4MA/cy5SmPZ6v32FqMQbS2IjPzrWC0Fura3aJp8JuSi4OLlSe/dnPih0=
X-Received: by 2002:a05:6870:470a:b0:1dd:7fa9:ebe9 with SMTP id
 b10-20020a056870470a00b001dd7fa9ebe9mr5053599oaq.12.1696010459556; Fri, 29
 Sep 2023 11:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230928233623.767530-1-f_l_k@t-online.de>
In-Reply-To: <20230928233623.767530-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Sep 2023 11:00:33 -0700
Message-ID: <CAMKF1soFUO1FRe803VTj-EQXZt7LX+=PgNwq8UgHzS=giqoyqA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libnfs: dont install libnfs-config.cmake
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 18:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105260

On Thu, Sep 28, 2023 at 4:36=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> kodi uses its own FindNFS.cmake to find libnfs and succeeds with pkgconfi=
g.
> If libnfs-config.cmake is found it will also be utilized (for win/mac?)
> which is generally bad for cross-compiling and causes the prefix to get h=
ardcoded
> to /usr thus libnfs.so.5.0.2 is taken from the host machine
>
> Removing this file fixes:
> | aarch64-poky-linux-ld.lld: error: /usr/lib/libnfs.so.5.0.2 is incompati=
ble with elf64-littleaarch64
> | aarch64-poky-linux-clang++: error: linker command failed with exit code=
 1 (use -v to see invocation)
> | ninja: build stopped: subcommand failed.
>
> Add CFLAG workaround to fix compiling with clang complaining about
> old coding style while gcc doesn't care.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb b/meta-o=
e/recipes-connectivity/libnfs/libnfs_5.0.2.bb
> index e0df18a50..a025189b8 100644
> --- a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
> +++ b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
> @@ -3,10 +3,18 @@ HOMEPAGE =3D "https://github.com/sahlberg/libnfs"
>  LICENSE =3D "LGPL-2.1-only & BSD-2-Clause & GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D825301ba17efc9d188ee0abd4b924=
ada"
>
> -SRC_URI =3D "git://github.com/sahlberg/libnfs.git;protocol=3Dhttps;branc=
h=3Dmaster \
> -    file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.pat=
ch \
> +SRC_URI =3D " \
> +       git://github.com/sahlberg/libnfs.git;protocol=3Dhttps;branch=3Dma=
ster \
> +       file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.=
patch \
>  "
>  SRCREV =3D "40348f45d6beb8a8f50b6b63414a98fc1a061b7d"
>  S =3D "${WORKDIR}/git"
>
>  inherit cmake
> +
> +do_install:append() {
> +       rm -f ${D}${libdir}/cmake/libnfs/libnfs-config.cmake
> +}
> +
> +# Workaround for clang
> +CFLAGS +=3D "-Wno-implicit-function-declaration"

I was curious what the real failure is underneath, so I removed it
locally with clang and it seems to work for couple of arches
arm64/x86_64
so I wonder how to reproduce the error this option suppresses.

> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105230): https://lists.openembedded.org/g/openembedde=
d-devel/message/105230
> Mute This Topic: https://lists.openembedded.org/mt/101648795/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

