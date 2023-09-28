Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F8ECE7B19
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 10:21:45 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.10581.1695896495162641002
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 03:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mMY3Rv/o;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-503397ee920so20241423e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 03:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695896493; x=1696501293; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkvu62bx2qyEc4yIjrSlI3MBXyfcxYhYugYc+FVy+8U=;
        b=mMY3Rv/oHbbhltoBKckbGQ8Dc9dedJFGpXonl2/Yqjig9QGovaMN7NOizHGJ8D0Jf/
         iX3faUNug2LmJHaONVmt6svKMq4vFmpO4ihzUrMZUGabRke7sbcfynRCbyM8BFx7MWVI
         Q/TOsMqqYzGBGwx5pu3twSxCEyVFYiTbpPTbKlhsDchI5eBQuu6I78wrGQLledcmKDzL
         vs+YlhPFtQ+Oae6tEoDxhz+Lyrbg8PPFKrE23Q8JnPBFgwj3wtQNm+5QNpwn409k77K0
         SPZWlttqhRrdGOKMQehi4vpTnt+6Bs//SrU3DUC1ZPrz6Iq8I/bkBICbIPhQzPGZvHao
         SFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695896493; x=1696501293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkvu62bx2qyEc4yIjrSlI3MBXyfcxYhYugYc+FVy+8U=;
        b=iIvzRuU+H48V9Glvx6ZNl5qp0wGlMK5CGq1Rv3uRhZwC+ktAfdlLs4Lh0rSlxIIXgn
         BMQL+QSm96TngK+itphts5wRHCbazj2fQc8oM7cRj+4v/Ib45tOrBI6BoyADSWdhsWMv
         7XSkuOMm9F3vunGtrfeMDPWCMMJFNgqR/cvC0jwA34TP0VVt1tMfyOqIpb9rjWJS91Lj
         OyT/SW67Qu3L5KqWU36bEpDGyAbAvQ1S6q5VCGWQvH/MKMMNcQgM2ZmF3eqsiBMElWMa
         WDdia6Cx+xDxIq3jOaA2yLLqzMlbibrvQgeVv9gFBk5r8sAWJ0ivxyN2cEkXeegpXIXE
         xGag==
X-Gm-Message-State: AOJu0Yxujyo22T4HgovLAGi7V5+/9fyI/o2fBDWhZ5I2vCT+7YkhllPt
	S7l1HIAnc7dt0z0PiX/PW4FdGUd9W0OG0GfIdhw=
X-Google-Smtp-Source: AGHT+IH/1m6rFMTtRPK/HBDZdnmix2njOQ8+gSuJID6xJDgAQOBAoHA9+3VlTspYwX1ZsswdVLTXSlQLOI+04O9a60Y=
X-Received: by 2002:a05:6512:3e01:b0:503:3453:ea7a with SMTP id
 i1-20020a0565123e0100b005033453ea7amr897332lfv.66.1695896492942; Thu, 28 Sep
 2023 03:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <1788A95F04E8B4F0.25618@lists.openembedded.org>
 <CABXoSoW=xU3fvq6EcaMxopw8e3FhEOLmYG59O1Fiyu8DKcT6Zg@mail.gmail.com>
 <1788D9362EA9D761.25332@lists.openembedded.org> <CAJiuCcdKu1x9iD_mMWEUdTdWQGRmBbfpdNya4D5nWjyYNE5yig@mail.gmail.com>
 <CAMKF1spv0_8_BzCWnwk6x=xPh3SD62MEQFS1OqOJDkbwN9STWg@mail.gmail.com>
In-Reply-To: <CAMKF1spv0_8_BzCWnwk6x=xPh3SD62MEQFS1OqOJDkbwN9STWg@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 28 Sep 2023 12:21:21 +0200
Message-ID: <CAJiuCcdeZ1tn4wn-rNRMEQDpgAVtSSDH0kk61Bq0x=5=yPpxXA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] protobuf: stage protoc binary to sysroot
To: Khem Raj <raj.khem@gmail.com>
Cc: Samuli Piippo <samuli.piippo@gmail.com>, Ross Burton <Ross.Burton@arm.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 10:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105221

Hi,

On Wed, 27 Sept 2023 at 22:47, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Sep 27, 2023 at 12:49=E2=80=AFPM Cl=C3=A9ment P=C3=A9ron <peron.c=
lem@gmail.com> wrote:
> >
> > On Wed, 27 Sept 2023 at 21:48, Cl=C3=A9ment P=C3=A9ron via
> > lists.openembedded.org <peron.clem=3Dgmail.com@lists.openembedded.org>
> > wrote:
> > >
> > > Hi Samuli,
> > >
> > > On Wed, 27 Sept 2023 at 07:20, Samuli Piippo <samuli.piippo@gmail.com=
> wrote:
> > > >
> > > > Re-applying this patch as it got removed in https://patchwork.yocto=
project.org/project/oe/patch/20230904161230.377450-1-ross.burton@arm.com/
> > > >
> > > > On Wed, 27 Sept 2023 at 08:11, Samuli Piippo via lists.openembedded=
.org <samuli.piippo=3Dgmail.com@lists.openembedded.org> wrote:
> > > >>
> > > >> From: Samuli Piippo <samuli.piippo@gmail.com>
> > > >>
> > > >> If protoc is enabled for the build, recipes using protobuf will
> > > >> fail when protoc is not available in the recipe sysroot:
> > > >>
> > > >> |   The imported target "protobuf::protoc" references the file
> > > >> |
> > > >> |      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sy=
sroots/x86_64-pokysdk-linux/usr/bin/protoc-3.21.5.0"
> > > >> |
> > > >> |   but this file does not exist.  Possible reasons include:
> > > >> |
> > > >> |   * The file was deleted, renamed, or moved to another location.
> > > >> |
> > > >> |   * An install or uninstall procedure did not complete successfu=
lly.
> > > >> |
> > > >> |   * The installation package was faulty and contained
> > > >> |
> > > >> |      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sy=
sroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake"
> > > >> |
> > > >> |   but not all the files it references.
> > > >>
> > > >> Use SYSROOT_DIRS to stage the binary to sysroot so it's always
> > > >> available for other recipes.
> > >
> > > +Ross Burton
> > >
> > > You will have the same issue with gRPC binaries and I think the best =
solution
> > > is to fix the QT CMake instead of contaminating the rootfs, no?
> > >
> > > You should update to have something like this:
> > > https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/blob/master/CMakeLis=
ts.txt
> >
> > This patch in particular
> > https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/47f0d9e0326f3cc=
31c801a0ecf7312d1049ece3e
>
> yeah, this to me looks a better fix since its scoped at recipe level
> and makes is cross compile friendly.
> I hope it will keep working with older versions of protobuffers

Also I don't see the recipe "qtgrpc" in meta-oe nor other layers.

https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dqtgrp=
c

I would be in favor of reverting this patch if there is no answer from Samu=
li.

Samuli, could you point to a bitbake recipe to build qtgrpc ?

Regards,

>
> >
> >
> > >
> > > Regards,
> > > Clement
> > >
> > >
> > > >>
> > > >> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > >> ---
> > > >>  meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb | 3 +++
> > > >>  1 file changed, 3 insertions(+)
> > > >>
> > > >> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb=
 b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> > > >> index d95e1c20f..06b21a0d6 100644
> > > >> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> > > >> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> > > >> @@ -92,6 +92,9 @@ PACKAGE_BEFORE_PN =3D "${PN}-compiler ${PN}-lite=
"
> > > >>  FILES:${PN}-compiler =3D "${bindir} ${libdir}/libprotoc${SOLIBS}"
> > > >>  FILES:${PN}-lite =3D "${libdir}/libprotobuf-lite${SOLIBS}"
> > > >>
> > > >> +# CMake requires binaries to exist in sysroot, even if they have =
wrong architecture.
> > > >> +SYSROOT_DIRS +=3D "${bindir}"
> > > >> +
> > > >>  RDEPENDS:${PN}-compiler =3D "${PN}"
> > > >>  RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
> > > >>  RDEPENDS:${PN}-ptest =3D "bash ${@bb.utils.contains('PACKAGECONFI=
G', 'python', 'python3-protobuf', '', d)}"
> > > >> --
> > > >> 2.25.1
> > > >>
> > > >>
> > > >>
> > > >>
> > > >
> > > >
> > > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#105199): https://lists.openembedded.org/g/openemb=
edded-devel/message/105199
> > > Mute This Topic: https://lists.openembedded.org/mt/101612304/4240582
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [peron.clem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

