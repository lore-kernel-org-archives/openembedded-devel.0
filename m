Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E6CE82CD9
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 20:47:18 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.28268.1695847633614403370
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 13:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PZMZQlVT;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1bba7717d3bso6126552fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 13:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695847633; x=1696452433; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KI9+UlUy17jeGCMzuA5pfqMbdVkWJ8ldPUYNk40lsxc=;
        b=PZMZQlVTTrql45RpKrSEZOskn7GfNYOIPiJe7EQ21wgBp6LubKLAHis7wpJlZmbD/H
         ihe7IiN4miqzRPWbSV0WeTXi5ak/9R0Q1BQd1jFMxRz5dJIW99JqhVD69nt2FHxE0zpa
         qVF7YY1jaWcLif5FDpcf/p4+6J9hYuMs98ff9SbgVGmrKZ5wt7yB8VmAOoAAwx/3bX/v
         UmSIFfbbBTAdeGBb6ajaXObnYE4j/M8VrVmaeCuyFsmWo9fjr48xtlZLm8JPFUayv0df
         R/Gdg2s27TuMEUqVHlQum/reQc/iv6e+AGmRbDEqBWF09nUpWiHw5Y9jnxWO8eFiRqrH
         oLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695847633; x=1696452433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KI9+UlUy17jeGCMzuA5pfqMbdVkWJ8ldPUYNk40lsxc=;
        b=piGX8l1AFt2mIuLVWHnIrSPWgKc4XCGu6JEvpLAHcSgQnzBLWhopu2puE7d6YNYc++
         8U2PIixeJLShVqAZ2JH3BSvrCkUpVftWaATPcFNTpifDLX2UB/p/lJuf02PYjmwaKHZM
         VWsMfqrDxZetkWNkC/xB786u5aCosd0jgpsdVx22pfpTcgP1NmUQYpiJPMiIsT6wU38e
         iYlhHLgJWoXTahILq/np7AaWFUtS+ZMPtbEcEeAGO74QSjzZqUVfe6zhdSDJ76l2nTZQ
         8A6L66V+9oe1zYIKU1F21ldn6QEGBlkTlZVZNabHp53mPYWAZ6vkToelRVdzalSjX3IC
         53wA==
X-Gm-Message-State: AOJu0Yw9bQyCaQEWLvXVRABh+OTVJzDMQ4mTuQG2O0lWRZnMMPDv3+ZT
	NRvQa/OerkfSuIhwBfgveMdMUUsiK+Dln8fRgb0=
X-Google-Smtp-Source: AGHT+IFygCUS72usu8yjGy3gHyKee2WIXa4RDxrAO0svuVAILz6biQLNYoKn7IF0RqCRFBgBKL4lJwGF5ahQCqtyfDs=
X-Received: by 2002:a05:6870:c22a:b0:1d5:bb9e:a30e with SMTP id
 z42-20020a056870c22a00b001d5bb9ea30emr3699015oae.34.1695847632823; Wed, 27
 Sep 2023 13:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <1788A95F04E8B4F0.25618@lists.openembedded.org>
 <CABXoSoW=xU3fvq6EcaMxopw8e3FhEOLmYG59O1Fiyu8DKcT6Zg@mail.gmail.com>
 <1788D9362EA9D761.25332@lists.openembedded.org> <CAJiuCcdKu1x9iD_mMWEUdTdWQGRmBbfpdNya4D5nWjyYNE5yig@mail.gmail.com>
In-Reply-To: <CAJiuCcdKu1x9iD_mMWEUdTdWQGRmBbfpdNya4D5nWjyYNE5yig@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Sep 2023 13:46:46 -0700
Message-ID: <CAMKF1spv0_8_BzCWnwk6x=xPh3SD62MEQFS1OqOJDkbwN9STWg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] protobuf: stage protoc binary to sysroot
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Samuli Piippo <samuli.piippo@gmail.com>, Ross Burton <Ross.Burton@arm.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 20:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105210

On Wed, Sep 27, 2023 at 12:49=E2=80=AFPM Cl=C3=A9ment P=C3=A9ron <peron.cle=
m@gmail.com> wrote:
>
> On Wed, 27 Sept 2023 at 21:48, Cl=C3=A9ment P=C3=A9ron via
> lists.openembedded.org <peron.clem=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Hi Samuli,
> >
> > On Wed, 27 Sept 2023 at 07:20, Samuli Piippo <samuli.piippo@gmail.com> =
wrote:
> > >
> > > Re-applying this patch as it got removed in https://patchwork.yoctopr=
oject.org/project/oe/patch/20230904161230.377450-1-ross.burton@arm.com/
> > >
> > > On Wed, 27 Sept 2023 at 08:11, Samuli Piippo via lists.openembedded.o=
rg <samuli.piippo=3Dgmail.com@lists.openembedded.org> wrote:
> > >>
> > >> From: Samuli Piippo <samuli.piippo@gmail.com>
> > >>
> > >> If protoc is enabled for the build, recipes using protobuf will
> > >> fail when protoc is not available in the recipe sysroot:
> > >>
> > >> |   The imported target "protobuf::protoc" references the file
> > >> |
> > >> |      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysr=
oots/x86_64-pokysdk-linux/usr/bin/protoc-3.21.5.0"
> > >> |
> > >> |   but this file does not exist.  Possible reasons include:
> > >> |
> > >> |   * The file was deleted, renamed, or moved to another location.
> > >> |
> > >> |   * An install or uninstall procedure did not complete successfull=
y.
> > >> |
> > >> |   * The installation package was faulty and contained
> > >> |
> > >> |      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysr=
oots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake"
> > >> |
> > >> |   but not all the files it references.
> > >>
> > >> Use SYSROOT_DIRS to stage the binary to sysroot so it's always
> > >> available for other recipes.
> >
> > +Ross Burton
> >
> > You will have the same issue with gRPC binaries and I think the best so=
lution
> > is to fix the QT CMake instead of contaminating the rootfs, no?
> >
> > You should update to have something like this:
> > https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/blob/master/CMakeLists=
.txt
>
> This patch in particular
> https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/47f0d9e0326f3cc31=
c801a0ecf7312d1049ece3e

yeah, this to me looks a better fix since its scoped at recipe level
and makes is cross compile friendly.
I hope it will keep working with older versions of protobuffers

>
>
> >
> > Regards,
> > Clement
> >
> >
> > >>
> > >> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >> ---
> > >>  meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb | 3 +++
> > >>  1 file changed, 3 insertions(+)
> > >>
> > >> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb b=
/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> > >> index d95e1c20f..06b21a0d6 100644
> > >> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> > >> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> > >> @@ -92,6 +92,9 @@ PACKAGE_BEFORE_PN =3D "${PN}-compiler ${PN}-lite"
> > >>  FILES:${PN}-compiler =3D "${bindir} ${libdir}/libprotoc${SOLIBS}"
> > >>  FILES:${PN}-lite =3D "${libdir}/libprotobuf-lite${SOLIBS}"
> > >>
> > >> +# CMake requires binaries to exist in sysroot, even if they have wr=
ong architecture.
> > >> +SYSROOT_DIRS +=3D "${bindir}"
> > >> +
> > >>  RDEPENDS:${PN}-compiler =3D "${PN}"
> > >>  RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
> > >>  RDEPENDS:${PN}-ptest =3D "bash ${@bb.utils.contains('PACKAGECONFIG'=
, 'python', 'python3-protobuf', '', d)}"
> > >> --
> > >> 2.25.1
> > >>
> > >>
> > >>
> > >>
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105199): https://lists.openembedded.org/g/openembed=
ded-devel/message/105199
> > Mute This Topic: https://lists.openembedded.org/mt/101612304/4240582
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[peron.clem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

