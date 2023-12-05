Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BD9C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 12:35:10 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.98218.1701779708273191327
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Dec 2023 04:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YCh7AMbs;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5c673b01eeeso1324133a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 04:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701779707; x=1702384507; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlWpAU2h0kBPh+P4YhfqwDB/bhKk6dZqbSYZcfGFLHE=;
        b=YCh7AMbsA5lnoBBkiO2EXAUlps8ScybsztIopWA9QzMZKRWvrkTPpgWmn7EKtZ2gWY
         BYYbsWzgKmV+Anvv/yxxdAi5LO5JQZ5QoCawQKP/pr3rlN9Ho4/kjX6qM/iWf1+ntPmG
         fPwEAiaADKZKwujXkivLjMeGDM6NudE2qnr0quIjuCjJ94Un6Dp+KKAow1bpKnliGYWN
         fV+mCWg5dDmkizqHMy4bvo3gKTMHCMRZJXIiKKrGJEHC1xK/88NfV+6/T5lKgqhisX45
         4ft9Tf91YMd5MrOA8KJztJpvg2quln1jBFdNZ4T8NRLMBikUG/6XOfq+EKOODJGPJEPh
         OTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701779707; x=1702384507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlWpAU2h0kBPh+P4YhfqwDB/bhKk6dZqbSYZcfGFLHE=;
        b=UvwN6ut0q0aBn6ZTlTHLvQU2R/9YQhupXv5Kibs3UTyQEK8XRqwnvHBMz1Ja06CPlu
         Z7t1k5U5QTjrztNap1t3jSGhzXZfUotmJHXpXVkv/oUKMUDk9PkMgop+4YaZEb/584vt
         sNJFgqtnfBrCWFjsgJ6A9UQbeHaFeVmzdnKCSBat/mugBhukYn8PGTb8cBQ5izU4NxVW
         GWJz3vf2ZmFyhyvgCw1ugm7mpcGv5B5ZnaGamAOsvCHXMRwWtThYAw55oVrcvM7AVRff
         HCmdHuoxHxdoAXaZFBTDBCQBv6muj2sm8uEUYj9uC/xVgq67Fz39/0b77w+YNQDpZ7gv
         2vtA==
X-Gm-Message-State: AOJu0YxnDRVzyhI1KHcjVEc+0Cxvd1THI9EsF3Uz7/UeWS/xsLHrHOnL
	rPxQkdqMfX9XlRofDVxmC67Q/08pYd/diQDeUVg=
X-Google-Smtp-Source: AGHT+IFLvnc8fyrd3M/XUiWBC5qze+o2s8NerML2JCi55JqS1b4IBtDMJcEAbYT1UEKNdYBEKRJyUk38jMrO6W+OzSQ=
X-Received: by 2002:a17:90b:4f90:b0:286:e5c7:c210 with SMTP id
 qe16-20020a17090b4f9000b00286e5c7c210mr426158pjb.10.1701779707153; Tue, 05
 Dec 2023 04:35:07 -0800 (PST)
MIME-Version: 1.0
References: <20231204195224.45946-1-alperyasinak1@gmail.com> <B6E6AE3E-3980-48FC-8E44-2863A20B1DEF@arm.com>
In-Reply-To: <B6E6AE3E-3980-48FC-8E44-2863A20B1DEF@arm.com>
From: alper ak <alperyasinak1@gmail.com>
Date: Tue, 5 Dec 2023 15:34:55 +0300
Message-ID: <CAGpma=6mvgaY9yBR8skAEAw2PJ-i-OQ9OMCw5oyaL7PSh05HhQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] jasper: upgrade 2.0.33 -> 4.1.1
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 12:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107222

> Why is this line deleted?  The CVE still doesn=E2=80=99t record versions,=
 so this will make the issue reappear in the report.

Deleted accidentally, my fault. I'll be more careful next time.

> Are these no longer needed? Or did they get deleted accidentally?  As it =
stands, I can=E2=80=99t tell.

The reason I deleted it is because there is a line in CMakeLists.txt
like "set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")" and that
sets the runpath. If "foo.so" is not present in the runpath, as far as
I know, every shared library is searched in the following locations:
rpath -> LD_LIBRARY_PATH -> runpath -> ld.so.conf -> /lib and /usr/lib
by default. I don't think there's any point in deleting the runpath.

CMakeLists.txt ->
https://github.com/jasper-software/jasper/blob/917f7708b755d8434f70618108c1=
a76f1b6a0a82/CMakeLists.txt#L809

> Just because there can be an option doesn't mean we should expose it.  We=
 should always build a shared library, we should always build PIC code, we =
should already support threads, etc.  Docs should be guarded on the api-doc=
umentation DISTRO_FEATURE. Arguably some of the format support options coul=
d remain (based on the prior art of JPEG) but notably that means dependenci=
es, which is why it was added in the first place. But on the whole we don=
=E2=80=99t want to expose _every_ option in the recipe, just the ones that =
make sense.  Remember users of the recipe can easily add their own if they =
need to control the recipe even further.
>
> Whilst I=E2=80=99m looking, if this is a library that ships with some too=
ls then the tools should always be built (that would be the programs config=
, I guess) but the recipe should inherit lib_package so that they=E2=80=99r=
e put into a separate package and only installed if needed.

I thought the user should know every option. "Docs should be guarded
on the api-documentation DISTRO_FEATURE", I don't understand exactly
what this means. Thank you for feedback.

Best regards


Ross Burton <Ross.Burton@arm.com>, 4 Ara 2023 Pzt, 23:21 tarihinde =C5=9Fun=
u yazd=C4=B1:
>
> > -do_install:append() {
> > -    chrpath -d ${D}${bindir}/jasper
> > -    chrpath -d ${D}${bindir}/imginfo
> > -    chrpath -d ${D}${bindir}/imgcmp
> > -    chrpath -d ${D}${libdir}/libjasper.so.*
> > -}
>
> Are these no longer needed? Or did they get deleted accidentally?  As it =
stands, I can=E2=80=99t tell.
>
> > +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl',=
 'opengl', '', d)} \
> > +   shared-lib PIC hidden jpeg heif opengl doc latex programs multithre=
ad pthread bmp jp2 jpc jpg pgx pnm ras \
> > +  "
> > +
> > +PACKAGECONFIG[shared-lib] =3D "-DJAS_ENABLE_SHARED=3DON,-DJAS_ENABLE_S=
HARED=3DOFF,,"
> > +PACKAGECONFIG[PIC] =3D "-DJAS_ENABLE_PIC=3DON,-DJAS_ENABLE_PIC=3DOFF,,=
"
> > +PACKAGECONFIG[hidden] =3D "-DJAS_ENABLE_HIDDEN=3DON,-DJAS_ENABLE_HIDDE=
N=3DOFF,,"
> > +PACKAGECONFIG[32bit] =3D "-DJAS_ENABLE_32BIT=3DON,-DJAS_ENABLE_32BIT=
=3DOFF,,"
> > +PACKAGECONFIG[jpeg] =3D "-DJAS_ENABLE_LIBJPEG=3DON,-DJAS_ENABLE_LIBJPE=
G=3DOFF,jpeg,"
> > +PACKAGECONFIG[heif] =3D "-DJAS_ENABLE_LIBHEIF=3DON,-DJAS_ENABLE_LIBHEI=
F=3DOFF,,"
> > +PACKAGECONFIG[opengl] =3D "-DJAS_ENABLE_OPENGL=3DON,-DJAS_ENABLE_OPENG=
L=3DOFF,freeglut,"
> > +PACKAGECONFIG[doc] =3D "-DJAS_ENABLE_DOC=3DON,-DJAS_ENABLE_DOC=3DOFF,d=
oxygen,"
> > +PACKAGECONFIG[latex] =3D "-DJAS_ENABLE_LATEX=3DON,-DJAS_ENABLE_LATEX=
=3DOFF,,"
> > +PACKAGECONFIG[programs] =3D "-DJAS_ENABLE_PROGRAMS=3DON,-DJAS_ENABLE_P=
ROGRAMS=3DOFF,,"
> > +PACKAGECONFIG[multithread] =3D "-DJAS_ENABLE_MULTITHREADING_SUPPORT=3D=
ON,-DJAS_ENABLE_MULTITHREADING_SUPPORT=3DOFF,,"
> > +PACKAGECONFIG[pthread] =3D "-DJAS_PREFER_PTHREAD=3DON,-DJAS_PREFER_PTH=
READ=3DOFF,,"
> > +PACKAGECONFIG[pthread-tss] =3D "-DJAS_PREFER_PTHREAD_TSS=3DON,-DJAS_PR=
EFER_PTHREAD_TSS=3DOFF,,"
> > +PACKAGECONFIG[strict] =3D "-DJAS_STRICT=3DON,-DJAS_STRICT=3DOFF,,"
> > +PACKAGECONFIG[bmp] =3D "-DJAS_ENABLE_BMP_CODEC=3DON,-DJAS_ENABLE_BMP_C=
ODEC=3DOFF,,"
> > +PACKAGECONFIG[jp2] =3D "-DJAS_ENABLE_JP2_CODEC=3DON,-DJAS_ENABLE_JP2_C=
ODEC=3DOFF,,"
> > +PACKAGECONFIG[jpc] =3D "-DJAS_ENABLE_JPC_CODEC=3DON,-DJAS_ENABLE_JPC_C=
ODEC=3DOFF,,"
> > +PACKAGECONFIG[jpg] =3D "-DJAS_ENABLE_JPG_CODEC=3DON,-DJAS_ENABLE_JPG_C=
ODEC=3DOFF,,"
> > +PACKAGECONFIG[heic] =3D "-DJAS_ENABLE_HEIC_CODEC=3DON,-DJAS_ENABLE_HEI=
C_CODEC=3DOFF,,"
> > +PACKAGECONFIG[mif] =3D "-DJAS_ENABLE_MIF_CODEC=3DON,-DJAS_ENABLE_MIF_C=
ODEC=3DOFF,,"
> > +PACKAGECONFIG[pgx] =3D "-DJAS_ENABLE_PGX_CODEC=3DON,-DJAS_ENABLE_PGX_C=
ODEC=3DOFF,,"
> > +PACKAGECONFIG[pnm] =3D "-DJAS_ENABLE_PNM_CODEC=3DON,-DJAS_ENABLE_PNM_C=
ODEC=3DOFF,,"
> > +PACKAGECONFIG[ras] =3D "-DJAS_ENABLE_RAS_CODEC=3DON,-DJAS_ENABLE_RAS_C=
ODEC=3DOFF,,=E2=80=9D
>
> Just because there can be an option doesn't mean we should expose it.  We=
 should always build a shared library, we should always build PIC code, we =
should already support threads, etc.  Docs should be guarded on the api-doc=
umentation DISTRO_FEATURE. Arguably some of the format support options coul=
d remain (based on the prior art of JPEG) but notably that means dependenci=
es, which is why it was added in the first place. But on the whole we don=
=E2=80=99t want to expose _every_ option in the recipe, just the ones that =
make sense.  Remember users of the recipe can easily add their own if they =
need to control the recipe even further.
>
> Whilst I=E2=80=99m looking, if this is a library that ships with some too=
ls then the tools should always be built (that would be the programs config=
, I guess) but the recipe should inherit lib_package so that they=E2=80=99r=
e put into a separate package and only installed if needed.
>
> Ross

