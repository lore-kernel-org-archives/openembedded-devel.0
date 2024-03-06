Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9DDC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 17:22:58 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.563.1709745778164234074
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 09:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mrrWkq2F;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-220a0cacf9fso367212fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 09:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709745777; x=1710350577; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lFjF3Aw4/F/aSVUboh6MNzNtE5wrSeHQ3k4FFE6ogg=;
        b=mrrWkq2FLcZqZZJwZyedWqbJcYIc0bcskvvx3SgWajknN4CHwfa8BSSFbNlfFOvQhQ
         dDfOzyAS1Wr2dzqXgUgCvvUvmH4Xy5ILqe5VZPH3uF431ZMLtJfe2Po0wGT13s2ae1eJ
         C2PdpLMt/xbc1S551PnbKw4A6JFb28CQ9oVUL8Yc06O07VNRAcyfqfFLhGYwfuiyeTMb
         NZubOxnngvS2l6m7Id/ONdL42p+6RYB8uuLD/cEUc3UjJe3uS3PD1Bjvan9GIKTZ3Q6A
         k2htuhw0JEwzPIZWWY9F/tifzYwIbVKB3/rv6U7l0N7dWBAKshZrWG3do/ir1hhgIEa9
         KAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709745777; x=1710350577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lFjF3Aw4/F/aSVUboh6MNzNtE5wrSeHQ3k4FFE6ogg=;
        b=d0jlyx1brF9RjcNNBh7zCsEWd5/ZMbgUeTPJSirmbZ5CAmj6nKKiyDlmUkFWHI36w/
         FlAISjyccZ3b5IIIdhWXLl22c5P3L95dkO5TVl7Ch5zL51itez+JnU+qxZUtUgSFAC9w
         Za4cAYGtJVAXQIzLIN4IRufnEnWrUQtwkJIBPYsK+qeI6kz4dlQSd6xS0Hh7FYQrmwSV
         KnG9mIqh63473DzeO3O9AJyruQkX59R5HImVHofupNJg/dPGAJ2+/Q9cAu0tW0Bs7+vp
         n7p+pB0R2DuX3oOO0MdoygPR0XXu4NwusedhHBM10YhWHL8DIOZ9VhneaTFzxeWhbZJo
         N6wA==
X-Gm-Message-State: AOJu0YwXZPMuNY9JCUl5pzMdHEEWu0N0kmDVQV1xSL4qcBaZuSW7hWmY
	VXnCAMNQpr0p6UOQnEtoRA7GUBnpBbFurqN/+IQooNpd6xZ2818W5WUXh+YgXfWC0/vsMHVReGE
	sRTahqO5JOQrRhjwuvsiq+XicNagwq7oZ
X-Google-Smtp-Source: AGHT+IF9DdEo63dEJJoy/e8QzA5+YBeMl31ZPNN4Al+oV/v/L3ntovKulvMyOi9BNSEenjoYUYFq+RvUqdx1KkInMC0=
X-Received: by 2002:a05:6870:65a6:b0:21e:8897:33e5 with SMTP id
 fp38-20020a05687065a600b0021e889733e5mr6168729oab.12.1709745777430; Wed, 06
 Mar 2024 09:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20240306162737.1722284-1-pkj@axis.com> <CAMKF1sqZhEby8gOYZSukdMT4DoCGnNPsCAuCn2KqpVqTBqpnQw@mail.gmail.com>
 <DB5PR02MB10213D1EB1AE82DB0D9332DC5EF212@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213D1EB1AE82DB0D9332DC5EF212@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2024 09:22:31 -0800
Message-ID: <CAMKF1sr=dcscSHb=sCtu5zJBu63mPtoy2SddeSRWb64_WmQYJw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] abseil-cpp: A little clean-up
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 17:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109176

On Wed, Mar 6, 2024 at 9:05=E2=80=AFAM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 6 mars 2024 17:49
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH 1/2] abseil-cpp: A little clean-up
> >
> > Which branch is it intended for?, if it is master then always rebase
> > and test patches on latest master or master-next, otherwise add the
> > name of branch in subject prefix
> > makes it easy for maintainers to route the patch.
>
> It _is_ based on current master. I do not use master-next as I assume
> it to be a work in progress until it is merged to master.

Thanks, there is an upgrade for this recipe staged in master-next. perhaps
would be good to test it on top of that and see if this works as you
intend it to

>
> //Peter
>
> >
> > On Wed, Mar 6, 2024 at 8:27=E2=80=AFAM Peter Kjellerstedt <peter.kjelle=
rstedt@axis.com> wrote:
> > >
> > > * Remove ASNEEDED:class-native and ASNEEDED:class-nativesdk as they m=
ake
> > >   no difference since ${ASNEEDED} is only added to TARGET_LDFLAGS.
> > > * Remove additions to FILES:${PN}-dev since the added paths are alrea=
dy
> > >   added by default.
> > >
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >  .../recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb | 9 ++-----=
--
> > >  1 file changed, 2 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.=
1.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
> > > index 1ce6ff3fc..667693a4c 100644
> > > --- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
> > > +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20230802.1.bb
> > > @@ -1,7 +1,7 @@
> > >  SUMMARY =3D "Abseil is a cpp library like STL"
> > >  DESCRIPTION =3D "Abseil provides pieces missing from the C++ standar=
d. Contains \
> > >  additional useful libraries like algorithm, container, debugging, ha=
sh, memory, \
> > > -meta, numeric, strings, synchronization, time, types and utility"
> > > +meta, numeric, strings, synchronization, time, types and utility."
> > >  HOMEPAGE =3D "https://abseil.io/"
> > >  SECTION =3D "libs"
> > >  LICENSE =3D "Apache-2.0"
> > > @@ -19,9 +19,6 @@ SRC_URI =3D "git://github.com/abseil/abseil-cpp;bra=
nch=3D${BRANCH};protocol=3Dhttps \
> > >
> > >  S =3D "${WORKDIR}/git"
> > >
> > > -ASNEEDED:class-native =3D ""
> > > -ASNEEDED:class-nativesdk =3D ""
> > > -
> > >  inherit cmake
> > >
> > >  EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
> > > @@ -29,8 +26,6 @@ EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
> > >                   -DABSL_ENABLE_INSTALL=3DON \
> > >                  "
> > >
> > > -BBCLASSEXTEND =3D "native nativesdk"
> > > -
> > >  SYSROOT_DIRS:append:class-nativesdk:mingw32 =3D " ${bindir}"
> > >
> > > -FILES:${PN}-dev +=3D "${includedir} ${libdir}/cmake ${libdir}/pkgcon=
fig"
> > > +BBCLASSEXTEND =3D "native nativesdk"
> > >
> > >
> > >

