Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B369E82CCB
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 19:49:28 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.27024.1695844167006877848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 12:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WvUERLmN;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5046bf37ec1so10006100e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 12:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695844165; x=1696448965; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqfhW+lQX2blsho8GoYcvVUWD9PPVUhbJQ8ovnpVQVc=;
        b=WvUERLmNspeFZ4vpmSAAlrOWaCii8nsmxvzsqvQloMPoIKhtUrS6HRbfFwSQuPJUw4
         036fMjaPyT83fD3MM71DZYPQqlWg9pJZhp1at0QJg7kHrUQEV53i7VPUi7mFpx1jzqb2
         DX8odWB6h2xD7ROoxr4sgGIBmkXZAo6ClMjAw/E9y5H8q6NMvn/rMvE29SvMZBZDvbyT
         mt2t3NMMqHebgZY9ak1TF/7TleR1S7f/OdwHGT38vtdCp6mAARQZxeNwmIuy7ZZModxy
         f86y1dZ9ABE/EGa1YHUXl+kgq6xLnpyAm1r5kwH+Cr4y0JXfWucSTdIxRTbCi8+dL7xe
         RYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695844165; x=1696448965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqfhW+lQX2blsho8GoYcvVUWD9PPVUhbJQ8ovnpVQVc=;
        b=qjtVXnvaVILSIoW3K57tfGb2MhDoKabBg5TWuxAXcHqZEzTvlbm/sNaHPyyokpT0KQ
         THYFDqIQsGE03NeEzMKKiYg1ch+SBxTLyJpw5DJzhc8H66gLC86C/7dL8F3b2q8d69PA
         +DQuaZghnx0Z6ZBgcsWOTIkF8vAn+V9N/R+JS2rdeyvtj4iw/M2OHjrjXhcjRBdvXTfe
         RCuh2TDA9L+NOffg7bwqaBFxqTPvJ7Cl5WtYT7Z9OeWMkNoWRtzz/dkRKH/+KPlskc7B
         n0Wc8+1zGOrC8eBHsyDP9WIM83wo2JSjHHcLNBGtlfXTRTyDBCg6Mc/uZg4z15BOEPVE
         PRdg==
X-Gm-Message-State: AOJu0YzARxvxwe6OPteLrGp23jSr/OBz78s885FVl9gMSIfjLCU7fnLu
	LiSt3KHUUf8K9MAf8CVJeOkBRanICcgxovbhh3I=
X-Google-Smtp-Source: AGHT+IE2xG/PTh4B/NID6MvBg5TlcP4R1tGQN5oTnyBSaHgm+jHZxhukFKkXGOSf9rQV96PRQZgwoOB0FBXNPBsdDtI=
X-Received: by 2002:a19:2d49:0:b0:503:ed9:58e3 with SMTP id
 t9-20020a192d49000000b005030ed958e3mr2563286lft.8.1695844164706; Wed, 27 Sep
 2023 12:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <1788A95F04E8B4F0.25618@lists.openembedded.org>
 <CABXoSoW=xU3fvq6EcaMxopw8e3FhEOLmYG59O1Fiyu8DKcT6Zg@mail.gmail.com> <1788D9362EA9D761.25332@lists.openembedded.org>
In-Reply-To: <1788D9362EA9D761.25332@lists.openembedded.org>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 27 Sep 2023 21:49:12 +0200
Message-ID: <CAJiuCcdKu1x9iD_mMWEUdTdWQGRmBbfpdNya4D5nWjyYNE5yig@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] protobuf: stage protoc binary to sysroot
To: peron.clem@gmail.com
Cc: Samuli Piippo <samuli.piippo@gmail.com>, Ross Burton <Ross.Burton@arm.com>, 
	openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 19:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105200

On Wed, 27 Sept 2023 at 21:48, Cl=C3=A9ment P=C3=A9ron via
lists.openembedded.org <peron.clem=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hi Samuli,
>
> On Wed, 27 Sept 2023 at 07:20, Samuli Piippo <samuli.piippo@gmail.com> wr=
ote:
> >
> > Re-applying this patch as it got removed in https://patchwork.yoctoproj=
ect.org/project/oe/patch/20230904161230.377450-1-ross.burton@arm.com/
> >
> > On Wed, 27 Sept 2023 at 08:11, Samuli Piippo via lists.openembedded.org=
 <samuli.piippo=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> From: Samuli Piippo <samuli.piippo@gmail.com>
> >>
> >> If protoc is enabled for the build, recipes using protobuf will
> >> fail when protoc is not available in the recipe sysroot:
> >>
> >> |   The imported target "protobuf::protoc" references the file
> >> |
> >> |      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroo=
ts/x86_64-pokysdk-linux/usr/bin/protoc-3.21.5.0"
> >> |
> >> |   but this file does not exist.  Possible reasons include:
> >> |
> >> |   * The file was deleted, renamed, or moved to another location.
> >> |
> >> |   * An install or uninstall procedure did not complete successfully.
> >> |
> >> |   * The installation package was faulty and contained
> >> |
> >> |      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroo=
ts/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake"
> >> |
> >> |   but not all the files it references.
> >>
> >> Use SYSROOT_DIRS to stage the binary to sysroot so it's always
> >> available for other recipes.
>
> +Ross Burton
>
> You will have the same issue with gRPC binaries and I think the best solu=
tion
> is to fix the QT CMake instead of contaminating the rootfs, no?
>
> You should update to have something like this:
> https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/blob/master/CMakeLists.t=
xt

This patch in particular
https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/47f0d9e0326f3cc31c8=
01a0ecf7312d1049ece3e


>
> Regards,
> Clement
>
>
> >>
> >> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb b/m=
eta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> >> index d95e1c20f..06b21a0d6 100644
> >> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> >> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
> >> @@ -92,6 +92,9 @@ PACKAGE_BEFORE_PN =3D "${PN}-compiler ${PN}-lite"
> >>  FILES:${PN}-compiler =3D "${bindir} ${libdir}/libprotoc${SOLIBS}"
> >>  FILES:${PN}-lite =3D "${libdir}/libprotobuf-lite${SOLIBS}"
> >>
> >> +# CMake requires binaries to exist in sysroot, even if they have wron=
g architecture.
> >> +SYSROOT_DIRS +=3D "${bindir}"
> >> +
> >>  RDEPENDS:${PN}-compiler =3D "${PN}"
> >>  RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
> >>  RDEPENDS:${PN}-ptest =3D "bash ${@bb.utils.contains('PACKAGECONFIG', =
'python', 'python3-protobuf', '', d)}"
> >> --
> >> 2.25.1
> >>
> >>
> >>
> >>
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105199): https://lists.openembedded.org/g/openembedde=
d-devel/message/105199
> Mute This Topic: https://lists.openembedded.org/mt/101612304/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [p=
eron.clem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

