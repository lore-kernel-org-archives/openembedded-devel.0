Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1731FC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 09:07:55 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.8706.1738141666001024648
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 01:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B7rvAi87;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2aa17010cbcso2700860fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 01:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738141665; x=1738746465; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+KaGD2SelQ3vAyjOi1Cy6/rzVtDG1fUN7zryiFxNgs=;
        b=B7rvAi87/NEH39MU79I9tipwKs8WG3gD4iPVFS9ie7oUxiUe0hpBqd7RQQQttHYCJT
         lJywA34AQ7MidYffY1G927zTXEkIBeFHMAxGJXMagS3FgWXWkSR7NdpaLDWtkWnGJN/v
         cYTt38IJRnXNslfXfJ/3orVIxA39nc+3axOcXn6lByRWEzATKtF8pG38KbNO8wQVQ63B
         lP9/SRWyjojHhRippzE9WpYr55xkwLW7nDqFFR6e9cO7iICgoCEL8NaDFxErR5JNOLyK
         oZy0Ti/5B2wlrDz2bYx6LVCdpBcRp7knxTsrToPEKHX+WR/kCCqc8v3mDqQP9d82H0jI
         E9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738141665; x=1738746465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+KaGD2SelQ3vAyjOi1Cy6/rzVtDG1fUN7zryiFxNgs=;
        b=rJZ4yH/prFJ2NTWTILYQQ9osLv+L6PdCmBnZB1bhzNPHtBBjcXcz9JSwOaQlgHOKR/
         16L0lBwuBh3cLCCjLk+vBEL08eaOE6bSHPAxSLKpUScdg/up1pJC7sw71OUUDsA0UN6c
         EpZRPZ+8635vUGEFlZEJrf07Q/ziVbu/uf77P0xOeW/19uENInvdez/nTKjc0eSqFwi9
         AoKiunQePnk5fszqt3O22lPb5f7YTMdkVxWyRIZHG35IYPJJ2b6H5TVN495qQdHdB/PJ
         ovtS+jNLbSIkBwNmZm/UmgA+lklZ5Hr36azk7uTq6A4RfWBjS89tJXolNcD5rv458kBm
         xAXQ==
X-Gm-Message-State: AOJu0YzAeWlxe1qdkRZIS6+ie2pLe9zOExnWvZIPLFTcoALV5EJwtoBx
	2Dr0ylKEUkmQOAScYZNfNNlQrnch0yIErkTy3u5z9f4RJvm5E65cm2zrABbN2g+ojMncIRhfrRQ
	bKZ1MRPjzBhrMMZypDILWWtkm4TE=
X-Gm-Gg: ASbGncu68MZDtZhR4CyW6AayoWvMzccXFDPEi++aeHK1L+gyEjC31nQI+vjVOfJ3cKb
	K8bEO/eCHTZhblpnblueEU7iKJz8DIGd47JrRIZ+0Yhy018Fdht3WaiRPIg4phh9sX/b5K+m4JI
	7so+2Epqa35pM=
X-Google-Smtp-Source: AGHT+IEz6fXX4G6+1buvX7bg9Z3A8s+yISAoJAwDzfQyxfVNTH+1g6PcBGmXHT/dyQp7Ot2aj3FEfJw3YALUuzwpKjA=
X-Received: by 2002:a05:6871:4109:b0:29e:1e77:71a2 with SMTP id
 586e51a60fabf-2b32ef53e41mr1216196fac.3.1738141665012; Wed, 29 Jan 2025
 01:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20250129033605.1635908-1-alistair.francis@wdc.com>
In-Reply-To: <20250129033605.1635908-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Jan 2025 01:07:18 -0800
X-Gm-Features: AWEUYZkwOkQn57hlbHXklmP39oE8t4RhD5dllpsxli9dFqmaqALQXPRXRs2aBIk
Message-ID: <CAMKF1srNeP+A-ZQT0=3sVDUrCQpsQ2t3JX7SjzZbv=cng=ug-Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: libspdm: Initial support for libspdm
To: alistair23@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 09:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115130

fails to build

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/330/step=
s/14/logs/stdio

On Tue, Jan 28, 2025 at 7:36=E2=80=AFPM Alistair Francis via
lists.openembedded.org <alistair23=3Dgmail.com@lists.openembedded.org>
wrote:
>
> libspdm is DMTF's Reference Implementation of SPDM, it's a library that
> can be used to implement a SPDM requester or responder in userspace.
>
> This patch adds support for building libspdm, which can then be used to
> build applications depending on libspdm.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../recipes-support/libspdm/libspdm_3.6.0.bb  | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
>
> diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-oe/r=
ecipes-support/libspdm/libspdm_3.6.0.bb
> new file mode 100644
> index 0000000000..316cccebfc
> --- /dev/null
> +++ b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> @@ -0,0 +1,63 @@
> +SUMMARY =3D "DMTF's Reference Implementation of SPDM"
> +DESCRIPTION =3D "libspdm is a reference implementation of the DMTF=E2=80=
=99s Security Protocols and \
> +Data Models (SPDM). This is used to enable authentication, attestation a=
nd key exchange to \
> +assist in providing infrastructure security enablement"
> +HOMEPAGE =3D "https://github.com/DMTF/libspdm"
> +BUGTRACKER =3D "https://github.com/DMTF/libspdm/issues"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8f9b59a81a88da8e812af43728=
b72dd7"
> +
> +DEPENDS =3D "openssl"
> +
> +SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Dmain;protocol=3D=
https"
> +SRCREV =3D "5ebe5e3946b9439928fa3a7548268c29cccc1b16"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +LIBSPDM_CFLAGS =3D "\
> +       ${TARGET_CFLAGS} \
> +       -DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=3D0 \
> +       -DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=3D0 \
> +       -DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=3D0 \
> +       -DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=3D0 \
> +       -DLIBSPDM_HAL_PASS_SPDM_CONTEXT=3D1 \
> +       "
> +
> +EXTRA_OECMAKE =3D "\
> +    -DARCH=3D${TARGET_ARCH} \
> +       -DTOOLCHAIN=3DNONE \
> +       -DTARGET=3DRelease \
> +       -DCRYPTO=3Dopenssl \
> +       -DENABLE_BINARY_BUILD=3D1 \
> +       -DCOMPILED_LIBCRYPTO_PATH=3D${libdir} \
> +       -DCOMPILED_LIBSSL_PATH=3D${libdir} \
> +       -DDISABLE_TESTS=3D1 \
> +       -DDISABLE_EDDSA=3D1 \
> +       -DLINK_FLAGS=3D${STAGING_DIR} \
> +       -DCMAKE_C_FLAGS=3D'${LIBSPDM_CFLAGS}' \
> +       "
> +
> +# PACKAGECONFIG ??=3D ""
> +# PACKAGECONFIG[brotli] =3D "-Dbrotli=3Denabled,-Dbrotli=3Ddisabled,brot=
li"
> +# PACKAGECONFIG[gssapi] =3D "-Dgssapi=3Denabled,-Dgssapi=3Ddisabled,krb5=
"
> +# PACKAGECONFIG[ntlm] =3D "-Dntlm=3Denabled,-Dntlm=3Ddisabled"
> +# PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Denabled,-Dsysprof=3Ddisabled,s=
ysprof"
> +
> +do_install () {
> +    install -d ${D}/${libdir}
> +    install -m 0644 lib/* ${D}/${libdir}/
> +
> +    install -d ${D}/${includedir}/${BPN}/
> +    cp -rf ${S}/include/* ${D}/${includedir}/${BPN}/
> +
> +    install -d ${D}/${includedir}/${BPN}/os_stub/spdm_crypt_ext_lib
> +    cp -rf ${S}/os_stub/spdm_crypt_ext_lib/*.h ${D}/${includedir}/${BPN}=
/os_stub/spdm_crypt_ext_lib/
> +}
> +
> +FILES:${PN} +=3D "${libdir}/*.a"
> +FILES:${PN} +=3D "${includedir}/${BPN}/*.h"
> +FILES:${PN} +=3D "${includedir}/${BPN}/os_stub/spdm_crypt_ext_lib/*.h"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115126): https://lists.openembedded.org/g/openembedde=
d-devel/message/115126
> Mute This Topic: https://lists.openembedded.org/mt/110872806/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

