Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DADC0218D
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 00:17:46 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.4938.1738196261504290685
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 16:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D5nvT3fY;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2a0206590a7so135978fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 16:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738196261; x=1738801061; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXGvNR1chy/UVJSPtMkcSBWsz3dd1eTH0hWNOL6n95E=;
        b=D5nvT3fYy6EkbfOzdrGd92HrHtiO4e+RuBhiiloO71q3iqdSmk08nQB9Rqb0f6xgKM
         nMLueTYmb1lLQ7ZPMP5yhFFerDCbzQ3H4mxZ5RRUCvruf8XNslCkdwXxFutXRCofphgT
         IRbvy61z7j13cSOhbfVUzcNqvVqZotUkZZQU0Tp87ePMKInz2W8ghQ4pWok+bOWQlnfD
         ahANVI5eRS0xmD5ovv72FEAQ2lHDr++tDiFYONVZNfFiGHmQdAxgsNpG0Jwxkltqf0Jt
         Gf/wPq9zscYGl0uVZ9rH41hL3D3a+8kAnf8CCGRKysbBTacIbTyazCZUfXjOz9gLVZqq
         uxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738196261; x=1738801061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXGvNR1chy/UVJSPtMkcSBWsz3dd1eTH0hWNOL6n95E=;
        b=WT2IlwFayxLJSHd4Oo7URY1qY1qZZTCH+KsIx/tMIeQDtvpHjtRPEBwrsFMA9+cvd1
         zno1PplHYuZKa001/ztBRhzNc0KTQ7lJ5kHHMgzUTuw9nYJcN5Z2+v8l/ZNfwOUXxd5y
         XEscqo1/ypm0znZA0+iRYb5qK8u7cSwb79pyhAoawenqoL3absMiYVREh2pwF/mfBh/w
         Fiklw+Wy5ybus/J8Giz9al810Zqy5WutpUqWULys9oTM9nVW7Pqox9Un/IgywG9WS9KL
         XLJjE7WByD/cDBSanbjZjF3eOfpyaNW+cjMdSYQ9+/8TdiUpEl+33ec7BfG4/cgLtIOC
         loLQ==
X-Gm-Message-State: AOJu0YwiR/No7aQ9SAXqAXuSLFGRmBDKng+TB8q6Ct+Tz3gOOcYglcCT
	zQxdeFPTLkKrxUszMBLJDaZLqe8fmntn2LxTI/xOFBo2qzlI1HvOQxqH0Qr9yTX9LFyW0ymNddY
	G6LX9EyJ2Ki5tAhhLc4YM1lyXF68=
X-Gm-Gg: ASbGncuCuVc1WitFAJJYeY875v8fkScO8QY+Jd+LytXTwn9N8JdSSKGVJefvU2m5GW6
	tmrWUnkeJXAkS9WMrE3fPIJrcUoUTMIXci2SzcUKMLU9EBVF98kANxDA8M7BBtrnTki2B3gM=
X-Google-Smtp-Source: AGHT+IG4RMkaC9E9y1YOEnhCKaq2Vze77VFczAIHWFOpJcLe3ClYRIgJczB+SRu3ZKTAu9/pRDRBKKKBWiwzD/6NVeY=
X-Received: by 2002:a05:6870:46a1:b0:29e:24c7:284f with SMTP id
 586e51a60fabf-2b32f1b5a9dmr2984131fac.15.1738196260709; Wed, 29 Jan 2025
 16:17:40 -0800 (PST)
MIME-Version: 1.0
References: <20250129033605.1635908-1-alistair.francis@wdc.com>
 <CAMKF1srNeP+A-ZQT0=3sVDUrCQpsQ2t3JX7SjzZbv=cng=ug-Q@mail.gmail.com>
 <CAKmqyKMEChnRdpOoggQwK+T-3yJJFi_W2M685DDue6tyPb=7ZA@mail.gmail.com> <CAMKF1soZHPCRXiFj7OsoTPePzx7yVqSo9dD6frr27SRFx6mOfg@mail.gmail.com>
In-Reply-To: <CAMKF1soZHPCRXiFj7OsoTPePzx7yVqSo9dD6frr27SRFx6mOfg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Jan 2025 16:17:14 -0800
X-Gm-Features: AWEUYZmIcEujDXkVKJM_tDs430on0AA0LtZmf62OxhroaYZtuGH07jpoou_jlg0
Message-ID: <CAMKF1soFm9O=voB7NM0Ltrmc6KGPpKgdLGSCkYx9puHOE4viog@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: libspdm: Initial support for libspdm
To: Alistair Francis <alistair23@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 00:17:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115142

On Wed, Jan 29, 2025 at 4:14=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Wed, Jan 29, 2025 at 4:00=E2=80=AFPM Alistair Francis <alistair23@gmai=
l.com> wrote:
> >
> > On Wed, Jan 29, 2025 at 7:07=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > fails to build
> > >
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/33=
0/steps/14/logs/stdio
> >
> > Is it possible to get the error logs? This builds fine for me locally
> >
>
> here is one for qemuarm + clang
>
> https://errors.yoctoproject.org/Errors/Details/841733/
>

x86 + clang
https://errors.yoctoproject.org/Errors/Details/841741/

> > Alistair
> >
> > >
> > > On Tue, Jan 28, 2025 at 7:36=E2=80=AFPM Alistair Francis via
> > > lists.openembedded.org <alistair23=3Dgmail.com@lists.openembedded.org=
>
> > > wrote:
> > > >
> > > > libspdm is DMTF's Reference Implementation of SPDM, it's a library =
that
> > > > can be used to implement a SPDM requester or responder in userspace=
.
> > > >
> > > > This patch adds support for building libspdm, which can then be use=
d to
> > > > build applications depending on libspdm.
> > > >
> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >  .../recipes-support/libspdm/libspdm_3.6.0.bb  | 63 +++++++++++++++=
++++
> > > >  1 file changed, 63 insertions(+)
> > > >  create mode 100644 meta-oe/recipes-support/libspdm/libspdm_3.6.0.b=
b
> > > >
> > > > diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/met=
a-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> > > > new file mode 100644
> > > > index 0000000000..316cccebfc
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> > > > @@ -0,0 +1,63 @@
> > > > +SUMMARY =3D "DMTF's Reference Implementation of SPDM"
> > > > +DESCRIPTION =3D "libspdm is a reference implementation of the DMTF=
=E2=80=99s Security Protocols and \
> > > > +Data Models (SPDM). This is used to enable authentication, attesta=
tion and key exchange to \
> > > > +assist in providing infrastructure security enablement"
> > > > +HOMEPAGE =3D "https://github.com/DMTF/libspdm"
> > > > +BUGTRACKER =3D "https://github.com/DMTF/libspdm/issues"
> > > > +LICENSE =3D "BSD-3-Clause"
> > > > +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8f9b59a81a88da8e812a=
f43728b72dd7"
> > > > +
> > > > +DEPENDS =3D "openssl"
> > > > +
> > > > +SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Dmain;proto=
col=3Dhttps"
> > > > +SRCREV =3D "5ebe5e3946b9439928fa3a7548268c29cccc1b16"
> > > > +
> > > > +S =3D "${WORKDIR}/git"
> > > > +
> > > > +inherit cmake
> > > > +
> > > > +LIBSPDM_CFLAGS =3D "\
> > > > +       ${TARGET_CFLAGS} \
> > > > +       -DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=3D0 \
> > > > +       -DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=3D0 \
> > > > +       -DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=3D0 \
> > > > +       -DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=3D0 \
> > > > +       -DLIBSPDM_HAL_PASS_SPDM_CONTEXT=3D1 \
> > > > +       "
> > > > +
> > > > +EXTRA_OECMAKE =3D "\
> > > > +    -DARCH=3D${TARGET_ARCH} \
> > > > +       -DTOOLCHAIN=3DNONE \
> > > > +       -DTARGET=3DRelease \
> > > > +       -DCRYPTO=3Dopenssl \
> > > > +       -DENABLE_BINARY_BUILD=3D1 \
> > > > +       -DCOMPILED_LIBCRYPTO_PATH=3D${libdir} \
> > > > +       -DCOMPILED_LIBSSL_PATH=3D${libdir} \
> > > > +       -DDISABLE_TESTS=3D1 \
> > > > +       -DDISABLE_EDDSA=3D1 \
> > > > +       -DLINK_FLAGS=3D${STAGING_DIR} \
> > > > +       -DCMAKE_C_FLAGS=3D'${LIBSPDM_CFLAGS}' \
> > > > +       "
> > > > +
> > > > +# PACKAGECONFIG ??=3D ""
> > > > +# PACKAGECONFIG[brotli] =3D "-Dbrotli=3Denabled,-Dbrotli=3Ddisable=
d,brotli"
> > > > +# PACKAGECONFIG[gssapi] =3D "-Dgssapi=3Denabled,-Dgssapi=3Ddisable=
d,krb5"
> > > > +# PACKAGECONFIG[ntlm] =3D "-Dntlm=3Denabled,-Dntlm=3Ddisabled"
> > > > +# PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Denabled,-Dsysprof=3Ddisa=
bled,sysprof"
> > > > +
> > > > +do_install () {
> > > > +    install -d ${D}/${libdir}
> > > > +    install -m 0644 lib/* ${D}/${libdir}/
> > > > +
> > > > +    install -d ${D}/${includedir}/${BPN}/
> > > > +    cp -rf ${S}/include/* ${D}/${includedir}/${BPN}/
> > > > +
> > > > +    install -d ${D}/${includedir}/${BPN}/os_stub/spdm_crypt_ext_li=
b
> > > > +    cp -rf ${S}/os_stub/spdm_crypt_ext_lib/*.h ${D}/${includedir}/=
${BPN}/os_stub/spdm_crypt_ext_lib/
> > > > +}
> > > > +
> > > > +FILES:${PN} +=3D "${libdir}/*.a"
> > > > +FILES:${PN} +=3D "${includedir}/${BPN}/*.h"
> > > > +FILES:${PN} +=3D "${includedir}/${BPN}/os_stub/spdm_crypt_ext_lib/=
*.h"
> > > > +
> > > > +BBCLASSEXTEND =3D "native nativesdk"
> > > > --
> > > > 2.47.1
> > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#115126): https://lists.openembedded.org/g/opene=
mbedded-devel/message/115126
> > > > Mute This Topic: https://lists.openembedded.org/mt/110872806/199791=
4
> > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [raj.khem@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >

