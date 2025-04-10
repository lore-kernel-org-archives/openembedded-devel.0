Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03A1C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 07:09:38 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.28758.1744268971930191766
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 00:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lIF5E5eK;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-549963b5551so624143e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 00:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744268970; x=1744873770; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrOkq6ePB2wD00W8J4Hulf4dr0npgbzMNTpgiGd/68I=;
        b=lIF5E5eKoT7LVjtN+b6Vbsegkxoz8x73L0WP19jA+KqXUtxRIL1i122wWxbvi6H3HE
         SDOCX2jCI6WMajw0VhS+XgqLwBK03AjUBeFYwhXMnZwZiRAd0ZVKPU7hq2WajhG/zS27
         A2HvbjtMPG3rNaUU6WW15MLwQnJeA8iATN45FZB+K9rpfVYwmmv0Oy2qmnIY698hazUz
         zP/FYn9LOdW/bEcYsz9pMUXbr7/TCad11BM9DG0M8klGIWoUAgIJzHDdvE4ux70GDS00
         6Rbh6fycmWPqEikyEl0Fv6UNQH4NnZ8VBnVrYjH2cPv439ImTI3D3mCzVuBdVglzC+hQ
         wtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268970; x=1744873770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrOkq6ePB2wD00W8J4Hulf4dr0npgbzMNTpgiGd/68I=;
        b=iiHASgL6N/p1eQ4gXrr2efHK4EOVL+wZ0Fo+w0q3Ygjzf3j5ecU2EHC9WOhnFgBFQ/
         Ch+XbEyHc6dpxmrfM+Y+3KwXuXV6DqSQeMkWYNDNz1vRsIxaAeX4YWn79BNqtajBn0rm
         RvJuGMXkiFAQsLUaNihiOw/ue9q+bpIZixsQwAufdOw+Psz1xOLJscO/Oxnqw4ICcixn
         inzst0ShcKiE0AHn4pGRLBKPzbY6wea7EXbGF8r7rUQhJogMPP7j2opOJ3bmmErgkB7z
         foD8cpADa2Rmruq5M1LYY3ZDehfqP+XhjUklAhU9A6rj5xDV9wKJjc4pyocfVMFokzgv
         kkow==
X-Forwarded-Encrypted: i=1; AJvYcCXcu4tn2B4ID8+h1WCO7jSDh0KJIJs9oeZ27kbHQIJFejjDLTFdXqDibJtFp+ISr5sQa1AbylcKUfDv0+MWPs07uKo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwLa44olyfFwnb8K/EP0Y3gdeDQz6gWT0/wolPVzkLS2ul0wFbL
	CV54aV09UKqXyJONMTT8aJHV/HLyJmAhDR6xTyodxle0pDg4ktNj2ISwEOGmVvxTCE//LqdedEQ
	EcZJvzJBfRElAPlsHaR5I5Rb3qfI=
X-Gm-Gg: ASbGncssgLexx8dXA0HqA1qZgX6MUbug+6J/+OigQWvnRL4ANYPfgn0DCfQM/osgpqQ
	nM+K/te4nW+6Dqus+kGr0mMbSEJ7o8AlaCX5KYJjEwtP78QgXUeyYnRKW8Xz7/iLB5KUwZ7bkVz
	7w5J/Z+f8xsREr5WOEMnLTvAv5
X-Google-Smtp-Source: AGHT+IF234wNyy++GZF8kG0TEteFRI0Zjvzz5LOUtDHS5rl/s0GFk/42YPM92s7/sfT0akyjQLoVQTRzwIVgfXMvIT4=
X-Received: by 2002:a05:6512:230e:b0:549:4d78:2418 with SMTP id
 2adb3069b0e04-54cb0bbd06cmr494325e87.27.1744268969527; Thu, 10 Apr 2025
 00:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241122-add-cryptopp-v2-1-19456062f791@bootlin.com>
 <CAMKF1sq=SUX2ZUxoduOc3QLgMk8_24KGsq481ABOXOv4558XWw@mail.gmail.com> <CAMKF1sreBnjjX0GW-G9+15Y+EgFQUmKUPX_cqYE7J3WaZ9=94g@mail.gmail.com>
In-Reply-To: <CAMKF1sreBnjjX0GW-G9+15Y+EgFQUmKUPX_cqYE7J3WaZ9=94g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 10 Apr 2025 09:09:18 +0200
X-Gm-Features: ATxdqUG39Vw75wge5EKSYb2vbVhkO9gvuhkxxgCyq8GlfE3eFVPPBuC5fFDHsFc
Message-ID: <CA+chaQcyRBTjQ0sQxvv2APzYqjkCbDJhL6Y_jZ-Xy+QiSVO7pQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] cryptopp: add a recipe for version 8.9.0
To: raj.khem@gmail.com
Cc: antonin.godard@bootlin.com, openembedded-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 07:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116762

Hi Antonin,

are you going to address the failures reported by Khem? it would be
nice to get this merged.

Cheers,

On Sat, Nov 23, 2024 at 9:48=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> also fails on qemux86-64/musl
>
> https://0x0.st/X5_h.do_compi
>
> On Fri, Nov 22, 2024 at 8:32=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > On Fri, Nov 22, 2024 at 6:11=E2=80=AFAM Antonin Godard via
> > lists.openembedded.org
> > <antonin.godard=3Dbootlin.com@lists.openembedded.org> wrote:
> > >
> > > Cryptopp is a library of cryptographic schemes written in C++.
> > >
> > > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > > ---
> > > I had issues compiling for qemuarm64, which are close to
> > > https://github.com/weidai11/cryptopp/issues/565. One of the solution =
is
> > > to disable ASM, so do that for aarch64. I don't observe the issue wit=
h
> > > qemuarm.
> > > ---
> > > Changes in v2:
> > > - WORKDIR -> UNPACKDIR in S
> > > - remove bb.utils.contains in CXXFLAGS:append:aarch64 (forgot to remo=
ve
> > >   after adding aarch64 override)
> > > - Link to v1: https://lore.kernel.org/r/20241121-add-cryptopp-v1-1-36=
382a60cecb@bootlin.com
> > > ---
> > >  meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb | 45 +++++++++++++=
++++++++++
> > >  1 file changed, 45 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb b/meta=
-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..a3d4fedb2f67c0111dcd2=
62081b622cfbdd40b57
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb
> > > @@ -0,0 +1,45 @@
> > > +SUMMARY =3D "A C++ class library of cryptographic schemes"
> > > +DESCRIPTION =3D "Crypto++ Library is a C++ class library of cryptogr=
aphic schemes"
> > > +CVE_PRODUCT =3D "cryptopp"
> > > +HOMEPAGE =3D "http://www.cryptopp.com/"
> > > +SECTION =3D "libs"
> > > +LICENSE =3D "BSL-1.0"
> > > +LIC_FILES_CHKSUM =3D "file://License.txt;md5=3Dca6dacb7ef68b1ab5dfa3=
bed24c12003"
> > > +
> > > +SRC_URI =3D "git://github.com/weidai11/cryptopp.git;protocol=3Dhttps=
;branch=3Dmaster"
> > > +SRCREV =3D "843d74c7c97f9e19a615b8ff3c0ca06599ca501b"
> > > +
> > > +S =3D "${UNPACKDIR}/git"
> >
> > This should be WORKDIR/git here.
> >
> > > +
> > > +inherit pkgconfig
> > > +
> > > +CXXFLAGS:append =3D " -fPIC"
> >
> > maybe use +=3D here.
> >
> > > +# Avoid target mismatch error
> > > +CXXFLAGS:append:aarch64 =3D " -DCRYPTOPP_DISABLE_ASM=3D1"
> >
> > This will build suboptimally. It would be better to fix the issue in
> > Makefile to use compatible options.
> >
> > > +EXTRA_OEMAKE +=3D "HAS_SOLIB_VERSION=3D1"
> > > +
> > > +do_compile () {
> > > +    oe_runmake -f GNUmakefile-cross libcryptopp.a libcryptopp.so cry=
ptest.exe
> > > +}
> > > +
> > > +do_install () {
> > > +    DESTDIR=3D"${D}" \
> > > +        BINDIR=3D"${bindir}" \
> > > +        DATADIR=3D"${datadir}" \
> > > +        INCLUDEDIR=3D"${includedir}" \
> > > +        LIBDIR=3D"${libdir}" \
> > > +        oe_runmake install
> > > +
> > > +    # Rename cryptest.exe to cryptest
> > > +    if [ -f "${D}${bindir}/cryptest.exe" ]; then
> > > +        mv "${D}${bindir}/cryptest.exe" "${D}${bindir}/cryptest"
> > > +    fi
> > > +}
> > > +
> > > +PACKAGE_BEFORE_PN +=3D "${PN}-cryptest ${PN}-testdata ${PN}-testvect=
ors"
> > > +
> > > +FILES:${PN}-cryptest =3D "${bindir}/cryptest"
> > > +FILES:${PN}-testdata =3D "${datadir}/cryptopp/TestData"
> > > +FILES:${PN}-testvectors =3D "${datadir}/cryptopp/TestVectors"
> > > +
> > > +BBCLASSEXTEND =3D "native nativesdk"
> > >
> > > ---
> > > base-commit: 71ffb63f60b233722ec9d8b50bfe0488997fbcfa
> > > change-id: 20241121-add-cryptopp-f78794be963c
> > >
> > > Best regards,
> > > --
> > > Antonin Godard <antonin.godard@bootlin.com>
> > >
> > >
> > >
> > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114023): https://lists.openembedded.org/g/openembedde=
d-devel/message/114023
> Mute This Topic: https://lists.openembedded.org/mt/109722638/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

