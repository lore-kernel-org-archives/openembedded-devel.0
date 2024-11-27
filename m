Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96201D6D237
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 20:02:32 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.80687.1732737746077028564
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 12:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XWM6TET9;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3ea47651a10so122549b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 12:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732737745; x=1733342545; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwkkeNqvvrMhFn6td9TmjTvMpyswFU35ZCTFEbLfAIw=;
        b=XWM6TET9XgDjYuqv546LARXK8EGceTi8iiZfGOD7R0iCBGcwB/l5zYF7z0GirL/oIY
         hV79ZBJqrbiAts2Hs8kXPZ3EGAkZ6cESOPj4K1+/J+vPC38rI+I18ccTW+NO7S9iEOG8
         iSpPZkXDz6YJj9KUGNb55M1/TRIuvjhUAGE17S8SZTytuHIJSy0m81/O7oMAfkMQcBNd
         oZ4KXAli2R7IM6YQdermtM07hW1p7Zg4d1Xurc6uTM2HNwPQ6wiruyZuXo08FaVWjjij
         CYXlfFd1JgRMoEocehEwJJrGc5yLdopprOV7+7Fb10ljPA9ndmG8ZysCWU3Y0sE4PKfp
         5dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732737745; x=1733342545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwkkeNqvvrMhFn6td9TmjTvMpyswFU35ZCTFEbLfAIw=;
        b=BtrzrUcvTRIK9ZC1nL9eyMzfJ/fAC8e6kTToszyq0Bc3FBMBEUruhBqedEFHe0n0k+
         ChQEVChBjZ+Cw0IjD0hfaqg7aoNB2KvMrtYPwSqIDD3Cf1vRoBxQz409zr19eKA770Ak
         zQ/CWQaHfYoB5XMG//snah6rPz2aZ748ODwLMVPnzPXP1V+L48duZk40SUrvzAb14pXv
         3+eTunCjdrC562ngVYv7DrhfOZadaPciy3PfIwFEeMapQQ/VGeu8QSPqfFjGwLBROqZR
         gLgnZiQUgNErAA71PQzzgvXSeSEFnWr5PefYFhqY4Z/1csvJQmAIRIc29O0C+3uYG+3R
         Jmwg==
X-Gm-Message-State: AOJu0Yzwvhjib/r6a6d1mo5oeaKvVhikkXj1DabZu03ce84OePqY5Ala
	m2OM3R2YZnSfRELm1L6UD0uQHb36bjCpMuIJs2o7b9M8JJF1su6XTkTjv2w/WfGrIQKb4k7EQ59
	VfCVDGgKh9jxmi8C2t2cSqxY7rlc=
X-Gm-Gg: ASbGncvuv06vvir1A+N0MBg6Jz2dK22on8BN2JpY1MCRJIpGrtCeQ/PQQECR3nkCW3t
	2CS+IhtKo+MKTIgn4ZIaaxRSOKekSeQ==
X-Google-Smtp-Source: AGHT+IG6oipW69ocMM8dCFrcMeU3lAcYWlt00YjA1PbXEt0LJxjQlJCKa/EAuGen2OQjHymf7gPC2MK5JeoJGctOJC8=
X-Received: by 2002:a05:6808:2f07:b0:3e7:59ed:d7f8 with SMTP id
 5614622812f47-3ea6db8ed7amr5553579b6e.2.1732737745329; Wed, 27 Nov 2024
 12:02:25 -0800 (PST)
MIME-Version: 1.0
References: <20241127190841.137119-1-hiagofranco@gmail.com> <CAMKF1srjsW3gH6P7Yy1TRvxO=BPPj4NaRB4sRQZ1suOAi1w1HA@mail.gmail.com>
In-Reply-To: <CAMKF1srjsW3gH6P7Yy1TRvxO=BPPj4NaRB4sRQZ1suOAi1w1HA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Nov 2024 12:01:59 -0800
Message-ID: <CAMKF1sqgdr-nAyAVMajOUHhBCjECtxQ+HDzvsev0f_5mNuD8eg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] hwdata: drop recipe
To: hiagofranco@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 20:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114096

On Wed, Nov 27, 2024 at 11:38=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> On Wed, Nov 27, 2024 at 11:09=E2=80=AFAM Hiago De Franco via
> lists.openembedded.org <hiagofranco=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > This recipe has been added to openembedded-core layer, since hwdata is
> > now a requirement to build libdisplay-info, used by weston (see commit
> > 3e5d5ba74bea "hwdata: add recipe from meta-openembedded" from oe-core).
> >
> > Therefore, drop this recipe.
> >
>
> Thanks, this also needs to be dropped from
> meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb

Forgot to mention that I have addressed it this time. Usually its good
to look into the
packagegroups when adding/deleting recipes

>
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> >  .../recipes-support/hwdata/hwdata_0.389.bb    | 28 -------------------
> >  1 file changed, 28 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/hwdata/hwdata_0.389.bb
> >
> > diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.389.bb b/meta-oe/r=
ecipes-support/hwdata/hwdata_0.389.bb
> > deleted file mode 100644
> > index fffd491178b1..000000000000
> > --- a/meta-oe/recipes-support/hwdata/hwdata_0.389.bb
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -DESCRIPTION =3D "Hardware identification and configuration data"
> > -HOMEPAGE =3D "https://github.com/vcrhonek/hwdata"
> > -SECTION =3D "System/Base"
> > -
> > -LICENSE =3D "GPL-2.0-or-later | XFree86-1.0"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1556547711e8246992b999edd94=
45a57"
> > -
> > -SRCREV =3D "5313a12eb992a354c17fc895c1d69c8c42b09a06"
> > -SRC_URI =3D "git://github.com/vcrhonek/${BPN}.git;branch=3Dmaster;prot=
ocol=3Dhttps"
> > -
> > -S =3D "${WORKDIR}/git"
> > -
> > -inherit allarch
> > -
> > -do_configure() {
> > -    ${S}/configure --datadir=3D${datadir} --libdir=3D${libdir}
> > -}
> > -
> > -do_compile[noexec] =3D "1"
> > -
> > -do_install() {
> > -    oe_runmake install DESTDIR=3D${D}
> > -}
> > -
> > -FILES:${PN} =3D "${libdir}/* \
> > -               ${datadir}/* "
> > -
> > -BBCLASSEXTEND +=3D "native"
> > --
> > 2.39.5
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#114094): https://lists.openembedded.org/g/openembed=
ded-devel/message/114094
> > Mute This Topic: https://lists.openembedded.org/mt/109811489/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

