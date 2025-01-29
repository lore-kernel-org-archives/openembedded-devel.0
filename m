Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A3FC0218D
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 00:00:25 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web10.4676.1738195219310453720
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 16:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rk0vzEk3;
 spf=pass (domain: gmail.com, ip: 209.85.221.169, mailfrom: alistair23@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5174f9c0d2aso73143e0c.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 16:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738195218; x=1738800018; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9wlTrlkNXiWvt0GycF1RbVRM7W24utI+RiMNhWu5QI=;
        b=Rk0vzEk376T1xCNLQsPGo3yt7grDN2qqRbwhiA3uB3H7TWQF1rqaccctZ72oUxK8t/
         43zlD/KiG/5iKmz63rEMH71/UVfUVldlkAOTz9vrDVkLzsXY/8cq69n67qP+g5sizWme
         yaRqJkzHpGdMe5TXyv1xDVysciNSuXtfwtZD395nuuxvR/r/y5k0kK6f5oaREnKiSTSr
         CEVV4T9fKacgyP5B4zz0r71rv2XsQkwoyvTQWawm4BMOSxoHV1aaWvtojzW0p3iTc6ZE
         FWNY+voBk5eCOo6cqu65LODlYSzWwJN80tHng8A5TtxKRF29UKDX2G49OTCogB1GT9Dp
         X3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738195218; x=1738800018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9wlTrlkNXiWvt0GycF1RbVRM7W24utI+RiMNhWu5QI=;
        b=uRrvo1qIFeQQd0nznelInpqzqxQX0UOf3JPJFIy9HU73XMzDIxUcsp+6tn/qDO+7tc
         /8mofv/4STsmBh606zW01/H6BwpX4qLNKkneb245kvjrGsx1MXuLHvJV5vZABRbJSjBd
         AqBzu6x49xBAodOORqv3Ut/OVFacsTOB4UAl2uUZIZJWg8/sjgE0HyJQcxoqIiW6QiPD
         smYn7fCdQltPd0VClIzqD4G7trZGBtXu3/PfIlKo183audW1p181Ig/VlJqXY3iwmeBN
         Hi5kpPSc5mJTfV51l2mo6O22P+4kCC9Fa2C6c49aQuCXiXSKnuXF8SFkcGdUH1AKS65T
         lydw==
X-Gm-Message-State: AOJu0YzFqdVrY4gQ53yzrnSwyhJ+fkaEUUQPiERZZoA9TEYWtkqmEg81
	kXY3Q7k9OIviuvEYPUBOeov86wBNiS5X61Bh4kP+JLTnP1wM3VBr8+JN9yRKK9YDfXx9EuAl0JZ
	RETwxCQdC3CkF5genTUycdOap5RU=
X-Gm-Gg: ASbGncvmfmvasywFEBXDKrtpWybVE6q4GDkuO4YE4Xq17TFQiHk05qhU3foILtyCuUS
	vwC5TOpJ3cqQWqb2Gt2yb5eAIiXup1hu52NW+65RQcGnqAcW1YAvIclKJFLiQwUya/St/G9lAuQ
	igkwZFcZmnpVbeQ4eqCoz9DsD9/Q==
X-Google-Smtp-Source: AGHT+IEnNf5qZeuBJ7aZwIfnMXBoH6d2U64Dum3WcZ/rsrwDAhYN7jHc7kejpyw8ZySzbPTq7dFN2ByxQDAEKwUtj7g=
X-Received: by 2002:a05:6122:4281:b0:518:773b:39f with SMTP id
 71dfb90a1353d-51e9e3fe69fmr6623844e0c.4.1738195218253; Wed, 29 Jan 2025
 16:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20250129033605.1635908-1-alistair.francis@wdc.com> <CAMKF1srNeP+A-ZQT0=3sVDUrCQpsQ2t3JX7SjzZbv=cng=ug-Q@mail.gmail.com>
In-Reply-To: <CAMKF1srNeP+A-ZQT0=3sVDUrCQpsQ2t3JX7SjzZbv=cng=ug-Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 30 Jan 2025 09:59:52 +1000
X-Gm-Features: AWEUYZmfRsPYMYM49nOlwXNRDpYeBQ0FImuPbkYlLTyaL4ASCPXo6lj9d7EF-7g
Message-ID: <CAKmqyKMEChnRdpOoggQwK+T-3yJJFi_W2M685DDue6tyPb=7ZA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: libspdm: Initial support for libspdm
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 00:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115140

On Wed, Jan 29, 2025 at 7:07=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> fails to build
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/330/st=
eps/14/logs/stdio

Is it possible to get the error logs? This builds fine for me locally

Alistair

>
> On Tue, Jan 28, 2025 at 7:36=E2=80=AFPM Alistair Francis via
> lists.openembedded.org <alistair23=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > libspdm is DMTF's Reference Implementation of SPDM, it's a library that
> > can be used to implement a SPDM requester or responder in userspace.
> >
> > This patch adds support for building libspdm, which can then be used to
> > build applications depending on libspdm.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  .../recipes-support/libspdm/libspdm_3.6.0.bb  | 63 +++++++++++++++++++
> >  1 file changed, 63 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> >
> > diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-oe=
/recipes-support/libspdm/libspdm_3.6.0.bb
> > new file mode 100644
> > index 0000000000..316cccebfc
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> > @@ -0,0 +1,63 @@
> > +SUMMARY =3D "DMTF's Reference Implementation of SPDM"
> > +DESCRIPTION =3D "libspdm is a reference implementation of the DMTF=E2=
=80=99s Security Protocols and \
> > +Data Models (SPDM). This is used to enable authentication, attestation=
 and key exchange to \
> > +assist in providing infrastructure security enablement"
> > +HOMEPAGE =3D "https://github.com/DMTF/libspdm"
> > +BUGTRACKER =3D "https://github.com/DMTF/libspdm/issues"
> > +LICENSE =3D "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8f9b59a81a88da8e812af437=
28b72dd7"
> > +
> > +DEPENDS =3D "openssl"
> > +
> > +SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Dmain;protocol=
=3Dhttps"
> > +SRCREV =3D "5ebe5e3946b9439928fa3a7548268c29cccc1b16"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit cmake
> > +
> > +LIBSPDM_CFLAGS =3D "\
> > +       ${TARGET_CFLAGS} \
> > +       -DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=3D0 \
> > +       -DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=3D0 \
> > +       -DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=3D0 \
> > +       -DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=3D0 \
> > +       -DLIBSPDM_HAL_PASS_SPDM_CONTEXT=3D1 \
> > +       "
> > +
> > +EXTRA_OECMAKE =3D "\
> > +    -DARCH=3D${TARGET_ARCH} \
> > +       -DTOOLCHAIN=3DNONE \
> > +       -DTARGET=3DRelease \
> > +       -DCRYPTO=3Dopenssl \
> > +       -DENABLE_BINARY_BUILD=3D1 \
> > +       -DCOMPILED_LIBCRYPTO_PATH=3D${libdir} \
> > +       -DCOMPILED_LIBSSL_PATH=3D${libdir} \
> > +       -DDISABLE_TESTS=3D1 \
> > +       -DDISABLE_EDDSA=3D1 \
> > +       -DLINK_FLAGS=3D${STAGING_DIR} \
> > +       -DCMAKE_C_FLAGS=3D'${LIBSPDM_CFLAGS}' \
> > +       "
> > +
> > +# PACKAGECONFIG ??=3D ""
> > +# PACKAGECONFIG[brotli] =3D "-Dbrotli=3Denabled,-Dbrotli=3Ddisabled,br=
otli"
> > +# PACKAGECONFIG[gssapi] =3D "-Dgssapi=3Denabled,-Dgssapi=3Ddisabled,kr=
b5"
> > +# PACKAGECONFIG[ntlm] =3D "-Dntlm=3Denabled,-Dntlm=3Ddisabled"
> > +# PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Denabled,-Dsysprof=3Ddisabled=
,sysprof"
> > +
> > +do_install () {
> > +    install -d ${D}/${libdir}
> > +    install -m 0644 lib/* ${D}/${libdir}/
> > +
> > +    install -d ${D}/${includedir}/${BPN}/
> > +    cp -rf ${S}/include/* ${D}/${includedir}/${BPN}/
> > +
> > +    install -d ${D}/${includedir}/${BPN}/os_stub/spdm_crypt_ext_lib
> > +    cp -rf ${S}/os_stub/spdm_crypt_ext_lib/*.h ${D}/${includedir}/${BP=
N}/os_stub/spdm_crypt_ext_lib/
> > +}
> > +
> > +FILES:${PN} +=3D "${libdir}/*.a"
> > +FILES:${PN} +=3D "${includedir}/${BPN}/*.h"
> > +FILES:${PN} +=3D "${includedir}/${BPN}/os_stub/spdm_crypt_ext_lib/*.h"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.47.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#115126): https://lists.openembedded.org/g/openembed=
ded-devel/message/115126
> > Mute This Topic: https://lists.openembedded.org/mt/110872806/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

