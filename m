Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C7CC0218D
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 00:15:26 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.4875.1738196122503504147
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 16:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oic7oMLk;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5f321876499so89354eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 16:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738196122; x=1738800922; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kix0USCczolNWejQS1FEcnY8wlA5gdBlu7iz3ucsZfs=;
        b=Oic7oMLkAe2fxbLw+t9gMde97EEL1lxmKnyL65Ja5nFFR3SCnu+D8r+q2k5d8m+xM+
         iDwmdmzrbgFwPRinQXvBRqh32TA2v+MRVcV1E7tQ8fNoEQFsXvz3F9ddIRlytjHcjEth
         E3o88mHbsTdY2Uy/NxSi9uW0BIJr08KgcA5AemsKmUujHJW421+IVQMD5y4qUV67gbk4
         ZNHh/3vGdvgF56rpd4ZRrWBFA1BjkPmUVzmfQ5d7lH6XzYphypH494cilA33i8pomGOd
         Mg7HA5t/VsdQoE9IflyCMU02FF1qu1GRzVYyh4CQmiJA3LBOCwyfGjfQAn/wU/M2CxsA
         M4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738196122; x=1738800922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kix0USCczolNWejQS1FEcnY8wlA5gdBlu7iz3ucsZfs=;
        b=Fdiz4JOMc9G5QBzbkokJs9QgVy/LiM/P+fIG60aIfJeMrLIi/VGGKUhVAyRvjM/HzV
         9tN+A3bvuls1+wwOGWdDWoKWHAQhpXJ3t7IrEm9M0GQwy5wtsPcIMA9ISD9UX04UYhDV
         E2B70wQYTpU+utAFEGzVONf9vM47hTbfDYWbLEjP94qK8pR0ZH9G3Tjn9Yq+LlZHhtAk
         hIjxTQMUb2aUdgsEprhlx6ixHDT0C5f/jigA8Dy5R1exq3E9rNb+fS7jCeMoKht8IjOl
         ekdp/b75HaizcYVXalGFJAIBYz5r8grkfpkpD8KiMFxQYf7FgLmKRGHKHolkJUo6vNNx
         jLdA==
X-Gm-Message-State: AOJu0YyRVzwbPH7GGN05dnXBtccV6wF0hfLJQSTPuu6O6woAO0j0MftO
	sIHEKhvBYmeOOZOI5JaY2CgC8MCPWTmY4wInwAbaHBXvR+LtfQmeGnAVfnOOOgeHfIP+l0QCTjK
	lNLsUSu+sl6vyLHlWvK+RXKUCITM=
X-Gm-Gg: ASbGncsdsYfhlMQiAtgLaWZ/WXbaezZidf7wLGYcRWY6OI75QWeGo/pu8cTFdSBLDdd
	57bxYFlMJ1fh3IE93dPS6uLlYjCiYpQy0CoyN1GzzoYbrp6hCOdv6H6YZmf5aP/w6kF/Wiic=
X-Google-Smtp-Source: AGHT+IENGePx/q6WP3+HNxBpasu2egJaHlyZA838Ac7L7AhjQ0I2+xoHvhVYFUVYn6h3WGSRLyuwp1GBmyeRn4wZTqA=
X-Received: by 2002:a05:6870:a591:b0:29d:caa2:f0ef with SMTP id
 586e51a60fabf-2b34fe95286mr834015fac.6.1738196121606; Wed, 29 Jan 2025
 16:15:21 -0800 (PST)
MIME-Version: 1.0
References: <20250129033605.1635908-1-alistair.francis@wdc.com>
 <CAMKF1srNeP+A-ZQT0=3sVDUrCQpsQ2t3JX7SjzZbv=cng=ug-Q@mail.gmail.com> <CAKmqyKMEChnRdpOoggQwK+T-3yJJFi_W2M685DDue6tyPb=7ZA@mail.gmail.com>
In-Reply-To: <CAKmqyKMEChnRdpOoggQwK+T-3yJJFi_W2M685DDue6tyPb=7ZA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Jan 2025 16:14:55 -0800
X-Gm-Features: AWEUYZnK9xkME2wpWscd0sqBuXaiM34qkbtAncLQaPnrAQiyV1OckioNy7m0faM
Message-ID: <CAMKF1soZHPCRXiFj7OsoTPePzx7yVqSo9dD6frr27SRFx6mOfg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: libspdm: Initial support for libspdm
To: Alistair Francis <alistair23@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 00:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115141

On Wed, Jan 29, 2025 at 4:00=E2=80=AFPM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> On Wed, Jan 29, 2025 at 7:07=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > fails to build
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/330/=
steps/14/logs/stdio
>
> Is it possible to get the error logs? This builds fine for me locally
>

here is one for qemuarm + clang

https://errors.yoctoproject.org/Errors/Details/841733/

> Alistair
>
> >
> > On Tue, Jan 28, 2025 at 7:36=E2=80=AFPM Alistair Francis via
> > lists.openembedded.org <alistair23=3Dgmail.com@lists.openembedded.org>
> > wrote:
> > >
> > > libspdm is DMTF's Reference Implementation of SPDM, it's a library th=
at
> > > can be used to implement a SPDM requester or responder in userspace.
> > >
> > > This patch adds support for building libspdm, which can then be used =
to
> > > build applications depending on libspdm.
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  .../recipes-support/libspdm/libspdm_3.6.0.bb  | 63 +++++++++++++++++=
++
> > >  1 file changed, 63 insertions(+)
> > >  create mode 100644 meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> > >
> > > diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-=
oe/recipes-support/libspdm/libspdm_3.6.0.bb
> > > new file mode 100644
> > > index 0000000000..316cccebfc
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> > > @@ -0,0 +1,63 @@
> > > +SUMMARY =3D "DMTF's Reference Implementation of SPDM"
> > > +DESCRIPTION =3D "libspdm is a reference implementation of the DMTF=
=E2=80=99s Security Protocols and \
> > > +Data Models (SPDM). This is used to enable authentication, attestati=
on and key exchange to \
> > > +assist in providing infrastructure security enablement"
> > > +HOMEPAGE =3D "https://github.com/DMTF/libspdm"
> > > +BUGTRACKER =3D "https://github.com/DMTF/libspdm/issues"
> > > +LICENSE =3D "BSD-3-Clause"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8f9b59a81a88da8e812af4=
3728b72dd7"
> > > +
> > > +DEPENDS =3D "openssl"
> > > +
> > > +SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Dmain;protoco=
l=3Dhttps"
> > > +SRCREV =3D "5ebe5e3946b9439928fa3a7548268c29cccc1b16"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit cmake
> > > +
> > > +LIBSPDM_CFLAGS =3D "\
> > > +       ${TARGET_CFLAGS} \
> > > +       -DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=3D0 \
> > > +       -DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=3D0 \
> > > +       -DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=3D0 \
> > > +       -DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=3D0 \
> > > +       -DLIBSPDM_HAL_PASS_SPDM_CONTEXT=3D1 \
> > > +       "
> > > +
> > > +EXTRA_OECMAKE =3D "\
> > > +    -DARCH=3D${TARGET_ARCH} \
> > > +       -DTOOLCHAIN=3DNONE \
> > > +       -DTARGET=3DRelease \
> > > +       -DCRYPTO=3Dopenssl \
> > > +       -DENABLE_BINARY_BUILD=3D1 \
> > > +       -DCOMPILED_LIBCRYPTO_PATH=3D${libdir} \
> > > +       -DCOMPILED_LIBSSL_PATH=3D${libdir} \
> > > +       -DDISABLE_TESTS=3D1 \
> > > +       -DDISABLE_EDDSA=3D1 \
> > > +       -DLINK_FLAGS=3D${STAGING_DIR} \
> > > +       -DCMAKE_C_FLAGS=3D'${LIBSPDM_CFLAGS}' \
> > > +       "
> > > +
> > > +# PACKAGECONFIG ??=3D ""
> > > +# PACKAGECONFIG[brotli] =3D "-Dbrotli=3Denabled,-Dbrotli=3Ddisabled,=
brotli"
> > > +# PACKAGECONFIG[gssapi] =3D "-Dgssapi=3Denabled,-Dgssapi=3Ddisabled,=
krb5"
> > > +# PACKAGECONFIG[ntlm] =3D "-Dntlm=3Denabled,-Dntlm=3Ddisabled"
> > > +# PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Denabled,-Dsysprof=3Ddisabl=
ed,sysprof"
> > > +
> > > +do_install () {
> > > +    install -d ${D}/${libdir}
> > > +    install -m 0644 lib/* ${D}/${libdir}/
> > > +
> > > +    install -d ${D}/${includedir}/${BPN}/
> > > +    cp -rf ${S}/include/* ${D}/${includedir}/${BPN}/
> > > +
> > > +    install -d ${D}/${includedir}/${BPN}/os_stub/spdm_crypt_ext_lib
> > > +    cp -rf ${S}/os_stub/spdm_crypt_ext_lib/*.h ${D}/${includedir}/${=
BPN}/os_stub/spdm_crypt_ext_lib/
> > > +}
> > > +
> > > +FILES:${PN} +=3D "${libdir}/*.a"
> > > +FILES:${PN} +=3D "${includedir}/${BPN}/*.h"
> > > +FILES:${PN} +=3D "${includedir}/${BPN}/os_stub/spdm_crypt_ext_lib/*.=
h"
> > > +
> > > +BBCLASSEXTEND =3D "native nativesdk"
> > > --
> > > 2.47.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#115126): https://lists.openembedded.org/g/openemb=
edded-devel/message/115126
> > > Mute This Topic: https://lists.openembedded.org/mt/110872806/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

