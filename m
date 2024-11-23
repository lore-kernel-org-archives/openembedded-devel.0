Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC88E66886
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 20:48:15 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.54935.1732394889175720536
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Nov 2024 12:48:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VDd2Czcg;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3e5f86e59f1so1884710b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 12:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732394888; x=1732999688; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLkLG2MNHkvsAO6HAiyAqrAqQwG5YudOG2AAySBW7BQ=;
        b=VDd2CzcgWubaIS0YD4q18xz5LyrdHXl2BwP5y4sJT9ah2/5tPecvB5XvpfSpFMydpB
         itcrZVAhrPNwPJNfGiN0T3P6orKcQd1k5CwlKfFp4IVK2uP1S+4CUPsnXlGd6N8tCmgD
         7DxTh/V6XXXJ8H1bpOY+I77EchY0Ps5RvLCELuCZQjOGIc6WNeRRmM2wE3uciZaCWpQm
         2fAzWeCaH6ON81zGIbVxBE3bFX2nvyqDwYPj0H54ZBRUC1OjCHgwonXpPohjY9La5e7f
         XD1UMj2h2ajzdvVqm8kCWgkz1sWQsfdcR1K6w8PvO4nhqNOYR6Gv2iWUrGYEwsaJutyA
         hzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732394888; x=1732999688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLkLG2MNHkvsAO6HAiyAqrAqQwG5YudOG2AAySBW7BQ=;
        b=oAouPssMJ3xSn4Zdt0WrY73Ch8QA9WHksQxwLRXeYdsNtLuaLNqCbQEaXFoa6LMVFX
         PO7IBIQM7jaXUiUVuVf2QUKXPclpKcQgRH/vEd091XlhKh9X1Prw0nwQMbQ7eWu9s2BH
         5vdZ1Hr8XkqLzZCPuWbBib7BmXnfjY8DEO91zfH7OeLo8icys+IjVsEguht8zc5X8KuM
         mMBWFYVUjv5zmEWrUiu7jMCX8I+kbcanosENOsgAFNoYsz66MxHdCxHZa4mRoXEqFmsM
         d9KTwh9WJ5Gnv2D7yipBb03WE3PEvnyBoIRJ4W99Nwh5L+QFDmie0OVh0XFhjf0Nbuvj
         txig==
X-Gm-Message-State: AOJu0YwFe1x0LoxpO1NVcFlZnVWDJ8AvD09LmgKzf0yuj85vCIUOf0pr
	DsXc7dhpabcmRccdf1ZH6jNDUbo7ZiZfL0PP4KWuI5T7vD2f/SM74t7Yy72xMdlak2cMxQPNr+N
	RcmnYOUDb6ehng9VAuelS9joQa3A=
X-Gm-Gg: ASbGncs031letW5ITllKIKttMFZmE65rhQSTSp0+HKtRLwNmY+3E92ERCrPjHeo6Xw7
	spk2xFFMgWi29sePzPr67br2tEPpge2U=
X-Google-Smtp-Source: AGHT+IG88YuFTN3ySynGOZ1vbYuYL4x0ugfLHHjIwHa/w1blNHo+yURI6l3mVGAXem47HUGs+rLt54YvjEHdElKKV6Y=
X-Received: by 2002:a05:6808:148d:b0:3e7:b3ce:923 with SMTP id
 5614622812f47-3e915876887mr6869957b6e.23.1732394888257; Sat, 23 Nov 2024
 12:48:08 -0800 (PST)
MIME-Version: 1.0
References: <20241122-add-cryptopp-v2-1-19456062f791@bootlin.com> <CAMKF1sq=SUX2ZUxoduOc3QLgMk8_24KGsq481ABOXOv4558XWw@mail.gmail.com>
In-Reply-To: <CAMKF1sq=SUX2ZUxoduOc3QLgMk8_24KGsq481ABOXOv4558XWw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Nov 2024 12:47:42 -0800
Message-ID: <CAMKF1sreBnjjX0GW-G9+15Y+EgFQUmKUPX_cqYE7J3WaZ9=94g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] cryptopp: add a recipe for version 8.9.0
To: antonin.godard@bootlin.com
Cc: openembedded-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 20:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114023

also fails on qemux86-64/musl

https://0x0.st/X5_h.do_compi

On Fri, Nov 22, 2024 at 8:32=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Fri, Nov 22, 2024 at 6:11=E2=80=AFAM Antonin Godard via
> lists.openembedded.org
> <antonin.godard=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > Cryptopp is a library of cryptographic schemes written in C++.
> >
> > Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> > ---
> > I had issues compiling for qemuarm64, which are close to
> > https://github.com/weidai11/cryptopp/issues/565. One of the solution is
> > to disable ASM, so do that for aarch64. I don't observe the issue with
> > qemuarm.
> > ---
> > Changes in v2:
> > - WORKDIR -> UNPACKDIR in S
> > - remove bb.utils.contains in CXXFLAGS:append:aarch64 (forgot to remove
> >   after adding aarch64 override)
> > - Link to v1: https://lore.kernel.org/r/20241121-add-cryptopp-v1-1-3638=
2a60cecb@bootlin.com
> > ---
> >  meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb | 45 +++++++++++++++=
++++++++
> >  1 file changed, 45 insertions(+)
> >
> > diff --git a/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb b/meta-o=
e/recipes-crypto/cryptopp/cryptopp_8.9.0.bb
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a3d4fedb2f67c0111dcd262=
081b622cfbdd40b57
> > --- /dev/null
> > +++ b/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb
> > @@ -0,0 +1,45 @@
> > +SUMMARY =3D "A C++ class library of cryptographic schemes"
> > +DESCRIPTION =3D "Crypto++ Library is a C++ class library of cryptograp=
hic schemes"
> > +CVE_PRODUCT =3D "cryptopp"
> > +HOMEPAGE =3D "http://www.cryptopp.com/"
> > +SECTION =3D "libs"
> > +LICENSE =3D "BSL-1.0"
> > +LIC_FILES_CHKSUM =3D "file://License.txt;md5=3Dca6dacb7ef68b1ab5dfa3be=
d24c12003"
> > +
> > +SRC_URI =3D "git://github.com/weidai11/cryptopp.git;protocol=3Dhttps;b=
ranch=3Dmaster"
> > +SRCREV =3D "843d74c7c97f9e19a615b8ff3c0ca06599ca501b"
> > +
> > +S =3D "${UNPACKDIR}/git"
>
> This should be WORKDIR/git here.
>
> > +
> > +inherit pkgconfig
> > +
> > +CXXFLAGS:append =3D " -fPIC"
>
> maybe use +=3D here.
>
> > +# Avoid target mismatch error
> > +CXXFLAGS:append:aarch64 =3D " -DCRYPTOPP_DISABLE_ASM=3D1"
>
> This will build suboptimally. It would be better to fix the issue in
> Makefile to use compatible options.
>
> > +EXTRA_OEMAKE +=3D "HAS_SOLIB_VERSION=3D1"
> > +
> > +do_compile () {
> > +    oe_runmake -f GNUmakefile-cross libcryptopp.a libcryptopp.so crypt=
est.exe
> > +}
> > +
> > +do_install () {
> > +    DESTDIR=3D"${D}" \
> > +        BINDIR=3D"${bindir}" \
> > +        DATADIR=3D"${datadir}" \
> > +        INCLUDEDIR=3D"${includedir}" \
> > +        LIBDIR=3D"${libdir}" \
> > +        oe_runmake install
> > +
> > +    # Rename cryptest.exe to cryptest
> > +    if [ -f "${D}${bindir}/cryptest.exe" ]; then
> > +        mv "${D}${bindir}/cryptest.exe" "${D}${bindir}/cryptest"
> > +    fi
> > +}
> > +
> > +PACKAGE_BEFORE_PN +=3D "${PN}-cryptest ${PN}-testdata ${PN}-testvector=
s"
> > +
> > +FILES:${PN}-cryptest =3D "${bindir}/cryptest"
> > +FILES:${PN}-testdata =3D "${datadir}/cryptopp/TestData"
> > +FILES:${PN}-testvectors =3D "${datadir}/cryptopp/TestVectors"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> >
> > ---
> > base-commit: 71ffb63f60b233722ec9d8b50bfe0488997fbcfa
> > change-id: 20241121-add-cryptopp-f78794be963c
> >
> > Best regards,
> > --
> > Antonin Godard <antonin.godard@bootlin.com>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#114001): https://lists.openembedded.org/g/openembed=
ded-devel/message/114001
> > Mute This Topic: https://lists.openembedded.org/mt/109722638/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

