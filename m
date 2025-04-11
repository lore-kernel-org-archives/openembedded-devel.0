Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A347DC36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 05:50:18 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.18816.1744350615237612343
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 22:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=llEVdHpR;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54954fa61c9so2065820e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 22:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744350613; x=1744955413; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8tNHfPgaJhFfyhtg/W6uEEgDkIGYxiq9G2Bk6T6ITc=;
        b=llEVdHpRDVw+nYPxAelczAZ4sliiQc6sUGB0MtrudF3nIgJVdgYJ+ve5ZroKpADb5h
         1hoYmoLINMluOrGm8ufMyLPDiRRdNYJckRraN2BeGbo4EyWywxOzWxpm/pJ+egP//uv5
         dgEfVxkNNJx4o0P68vbyNewi0iTmc2UrWEZO9VPFyvcaEWSzyTVC0zoZGUfk0/uPxg6y
         Dm8ToHWwN3FiUxFAGZ230iy4SF4wewcgZUc5dxE9BOMpV3qXd5EXDr+qcNpY6QWij7NN
         wYl61b9TeNjXI2usiRhzcOdyDJvfBHNtgllgziNdFgYKKNdQm4ePw3WdLvhauSx+dE1x
         D5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744350613; x=1744955413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8tNHfPgaJhFfyhtg/W6uEEgDkIGYxiq9G2Bk6T6ITc=;
        b=Od4/HHcuSf6P8CIqwcACnR2H21q/THFHSnko75KKtQT9zGyps0BQJ6dEtFkIdHqQbY
         UmT+9SGBhoT3yyDyqJzcmJ2obLGWBC57QXtI7UFdrG3/r9Et7Eui9tgab+ev73Pj9xdB
         BSnNwQNbsE7y5o8YlyRPFyOJy85a++4XKfDX92m2DmO78An3aN9sGe7Bts43mH9HJHZS
         LBr8rPDHfFhXkZYTR5wJuh8Vd41KK7HbQ9PYuglbUXh42fDn1TrCbJO/g4LVR7htd5W6
         iX63AcYewCAT6rcOgSTLVsJR3Am+62ypRkSk9IxKbI2IisHHocNGCHB1/MCWA8RhKS6+
         45XA==
X-Forwarded-Encrypted: i=1; AJvYcCWvrV/CZ229vvXXjOHHorvI1KkUzsiNl8awKHebL7dyQZCiqCnjur+fWiOBTwklza/oxED6gxSAQY4QZLrPBry5JqY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyud5/YbsdsNjuYV5cm1c6NScCe648qmOJeq1Zt69REnEVy3j18
	XF7kXFSs43ql/UBCnPrUDcWkkj49jmc1ZZngzDH8VbfuLafNEzPwgueZizGFuvASVVoebzb3D7a
	7TmnBUBb9P1bi6PrEE9ukuSzwR/k=
X-Gm-Gg: ASbGncuqPaCaPVlsC9QxGC2FiWxdzFV0rZQABzpjwvXbZ9UQ/pVEMbOhory/vNHvsHW
	8mZbLTRUd/ZFRaXKlgazeIp5PXshd8GcTOEt2QsYSdhKtfO8/qnkPsb1gcbvdPfEHQ5PplV2ua4
	euHFM+Zh5+azE4gxK5lmNorWrv
X-Google-Smtp-Source: AGHT+IH55cBDVz8R0GDpyu9ypti4+GDHbHMLSPjfPuT4AE/eObMH3Dw6WlJSBuc4V7PXLS4yd1E2uoNUF0RJ64oeNKU=
X-Received: by 2002:a2e:bccc:0:b0:308:e54d:61b1 with SMTP id
 38308e7fff4ca-31049aadff2mr4692261fa.34.1744350612653; Thu, 10 Apr 2025
 22:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <1744189624-6858-1-git-send-email-wangmy@fujitsu.com>
 <CAMKF1soQDwGmhh=uvuL1pCTm5aZZg4QYOTPx+VX1fAi9BvFcYw@mail.gmail.com> <CAMKF1soS0p0pNX1NNYAkBNJCBpTELboR_08H9657iFb1oEyz3Q@mail.gmail.com>
In-Reply-To: <CAMKF1soS0p0pNX1NNYAkBNJCBpTELboR_08H9657iFb1oEyz3Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 11 Apr 2025 07:50:00 +0200
X-Gm-Features: ATxdqUG7MEZtgAD8OoRyR5Lvh3YeZJdW0qFi7bv6r-izoBBl4N2oWQgPdM07YxA
Message-ID: <CA+chaQc+x7SAueERdfN8pEhJ+-BoznWaj-623L1WA=McqzdMmw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH v2] libspdm: upgrade 3.6.0 -> 3.7.0
To: raj.khem@gmail.com
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 05:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116794

I'm seeing this error as well.

https://github.com/openssl/openssl/issues/27344 looks related but was
closed as not reproducible, not sure what's going on.

On Fri, Apr 11, 2025 at 3:57=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> This seems likely due to openssl upgrade in core
>
> 92c32a6de92 openssl: upgrade 3.4.1 -> 3.5.0
>
> On Thu, Apr 10, 2025 at 6:51=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > it still fails for me.
> >
> >
> > build/tmp/work/core2-64-yoe-linux/libspdm/3.7.0/git/os_stub/cryptlib_op=
enssl/pem/pem.c
> >    In file included from
> > build/tmp/work/core2-64-yoe-linux/libspdm/3.7.0/git/os_stub/cryptlib_op=
enssl/pem/pem.c:12:
> >   build/tmp/work/core2-64-yoe-linux/libspdm/3.7.0/recipe-sysroot/usr/in=
clude/openssl/pem.h:399:28:
> > error: unknown type name '
> >    =E2=86=AA OSSL_i2d_of_void_ctx'
> >      399 | int PEM_ASN1_write_bio_ctx(OSSL_i2d_of_void_ctx *i2d, void *=
vctx,
> >          |                            ^
> >    1 error generated.
> >    [37/176] Building C object
> > os_stub/cryptlib_openssl/CMakeFiles/cryptlib_openssl.dir/pk/x509.c.o
> >    FAILED: os_stub/cryptlib_openssl/CMakeFiles/cryptlib_openssl.dir/pk/=
x509.c.o
> >
> > On Wed, Apr 9, 2025 at 2:07=E2=80=AFAM wangmy via lists.openembedded.or=
g
> > <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> > >
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  .../libspdm/{libspdm_3.6.0.bb =3D> libspdm_3.7.0.bb}             | 3=
 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >  rename meta-oe/recipes-support/libspdm/{libspdm_3.6.0.bb =3D> libspd=
m_3.7.0.bb} (95%)
> > >
> > > diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-=
oe/recipes-support/libspdm/libspdm_3.7.0.bb
> > > similarity index 95%
> > > rename from meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> > > rename to meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> > > index 4c0483ebac..a3012e10bd 100644
> > > --- a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> > > +++ b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
> > > @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8f9b5=
9a81a88da8e812af43728b72dd7"
> > >  DEPENDS =3D "openssl"
> > >
> > >  SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Dmain;protoco=
l=3Dhttps"
> > > -SRCREV =3D "5ebe5e3946b9439928fa3a7548268c29cccc1b16"
> > > +SRCREV =3D "1be116c7b7713fa9003e1bd53b53a34758549eb9"
> > >
> > >  S =3D "${WORKDIR}/git"
> > >
> > > @@ -23,6 +23,7 @@ LIBSPDM_CFLAGS =3D "\
> > >         -DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=3D0 \
> > >         -DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=3D0 \
> > >         -DLIBSPDM_HAL_PASS_SPDM_CONTEXT=3D1 \
> > > +        -DLIBSPDM_ENABLE_CAPABILITY_ENDPOINT_INFO_CAP=3D0 \
> > >         "
> > >
> > >  LIBSPDM_CFLAGS:append:toolchain-gcc =3D " -fPIE"
> > > --
> > > 2.43.0
> > >
> > >
> > >
> > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116790): https://lists.openembedded.org/g/openembedde=
d-devel/message/116790
> Mute This Topic: https://lists.openembedded.org/mt/112168951/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

