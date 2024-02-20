Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CC6C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 16:43:07 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.17764.1708447385816455168
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 08:43:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hhLdFwDB;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2183afd4103so2491748fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708447385; x=1709052185; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+zkI3CpVd5dzNTSr8X/JUrh9Q21ZnxcALoP9qOiPMs=;
        b=hhLdFwDB5MSGG/MvtDK8RCi5YkoVyhGWdCriBZDvMIa5Q42rxnEkRWxKGpN+/3PVGx
         gGpx8ku+ntU4rZI7+FuP7tSpYECuTX/25Noa7lnIRzYkxjEUHVVG5tRGblHUnzqC83sx
         m/02IvobUTojomJpyEZCsOvGqqdO3zwa6CaFzGEqSUxz4RsDAdY/1xvDqXZeqyVw08od
         1iiRqIry+Z/iTz5e/CM/zbbClds+ElmiByhJWfrvnIy2nyRzR7WRWSsu0eVv2853PHJr
         gFrv980iqTvHMylEb2SpXS1ic0qkzcr2gyzyi2xFum8JWMa0CDWS3q0AEVIay5p4/tRK
         Xn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708447385; x=1709052185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+zkI3CpVd5dzNTSr8X/JUrh9Q21ZnxcALoP9qOiPMs=;
        b=HtzaAA+OK/S4zEKtRK8roCYp0mRs+GbpwrWLTx13vHGOdWyw7khPgweAnN3lV7NA+o
         nbVpk5R8nz36iLvcBwWH7VGBONS4xPYIiW8+ZWFLvvhUcovjBrmtug0Gh8GdRoWGpFPE
         UpvsjmF6sTX63NnFqGfqYTfUk1g/nuqFQi9Q+yCklhmpvD77gBIvi+eLeDHtkuosJs6w
         gIcR2NSjurYg9qJe4SrjE4MDyNIVhIimOWi5dPcT/x6n4juh5pZC+BL1w9p6btB/Qo3q
         y7vD4pmVuBI5xoeHiFFCFw5tRLT4xBndVcoSQfZgW3GUOYoXPLtP+xjElOipnD0YlUWf
         l4Gg==
X-Gm-Message-State: AOJu0YytjJTPsrHSP8O5cxnXuTUEKRoWBtt+8+ggogMidsAVCcWb/NXO
	Pe37jr5VnmSQ5jXryV6/eOv+vRYSJGp96W0XpeWvgmZSbCFkr0jjH/qb9RJmNSWYhmGSv/J7Une
	tDAxv7MdsfYD19e5fVoYDYGB+9RI=
X-Google-Smtp-Source: AGHT+IFYFPCa/tJIIoeS6AyJXCG8fGZn6VzJgYuaobrSMVkvbDgU6wKcjwhuqfeDT31DffpIxw5di/rzzbzViKxmfts=
X-Received: by 2002:a05:6870:40d0:b0:21e:c9eb:e19f with SMTP id
 l16-20020a05687040d000b0021ec9ebe19fmr3091485oal.19.1708447384960; Tue, 20
 Feb 2024 08:43:04 -0800 (PST)
MIME-Version: 1.0
References: <20240220072937.2337129-1-raj.khem@gmail.com> <3a7ea6dacab9b5922698fc2fa356ea564ab1bdb7.camel@intel.com>
In-Reply-To: <3a7ea6dacab9b5922698fc2fa356ea564ab1bdb7.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Feb 2024 08:42:38 -0800
Message-ID: <CAMKF1sofj+yoFCH0jhY_NrPM=spJWi_+d3R1vy4eb3qieJ1RZQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pocketsphinx: Upgrade to 5.0.3
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 16:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108949

On Tue, Feb 20, 2024 at 12:25=E2=80=AFAM Mittal, Anuj <anuj.mittal@intel.co=
m> wrote:
>
> Hi Khem
>
> On Mon, 2024-02-19 at 23:29 -0800, Khem Raj wrote:
> > License-Update: New licenses added for WebRTC json parser, and json
> > escaping
> >
> > [1]
> > https://github.com/cmusphinx/pocketsphinx/commit/4cb5845898c7d9e53688ab=
a370ea3c00c0ef7db2
> > [2]
> > https://github.com/cmusphinx/pocketsphinx/commit/6b9a923832a1fd77c5304e=
ba18e63d8b0e2ef0b8
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...1-cython-Use-cythyon3-in-cmake-check.patch | 29
> > +++++++++++++++++++
> >  .../python/python3-pocketsphinx_0.1.15.bb     | 14 ---------
> >  .../python/python3-pocketsphinx_5.0.3.bb      | 20 +++++++++++++
> >  3 files changed, 49 insertions(+), 14 deletions(-)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-
> > pocketsphinx/0001-cython-Use-cythyon3-in-cmake-check.patch
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-
> > pocketsphinx_0.1.15.bb
> >  create mode 100644 meta-python/recipes-devtools/python/python3-
> > pocketsphinx_5.0.3.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-
> > pocketsphinx/0001-cython-Use-cythyon3-in-cmake-check.patch b/meta-
> > python/recipes-devtools/python/python3-pocketsphinx/0001-cython-Use-
> > cythyon3-in-cmake-check.patch
> > new file mode 100644
> > index 0000000000..40b2544d55
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pocketsphinx/0001-
> > cython-Use-cythyon3-in-cmake-check.patch
> > @@ -0,0 +1,29 @@
> > +From 5e6eb640f54a0d716d62ab4db8d96d3b6f3aa7bc Mon Sep 17 00:00:00
> > 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 19 Feb 2024 22:11:41 -0800
> > +Subject: [PATCH] cython: Use cythyon3 in cmake check
> > +
> > +OE does not install cython anymore, it only has cython3
> > +therefore point the build system to find cython3
> > +
> > +Upstream-Status: Inappropriate [ OE-Specific ]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + cython/CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/cython/CMakeLists.txt b/cython/CMakeLists.txt
> > +index daa4f76..93dd030 100644
> > +--- a/cython/CMakeLists.txt
> > ++++ b/cython/CMakeLists.txt
> > +@@ -1,5 +1,5 @@
> > + find_package(Python COMPONENTS Interpreter Development.Module
> > REQUIRED)
> > +-find_program(CYTHON "cython")
> > ++find_program(CYTHON "cython3")
> > +
> > + if(NOT USE_INSTALLED_POCKETSPHINX)
> > +   set_property(TARGET pocketsphinx PROPERTY
> > POSITION_INDEPENDENT_CODE on)
> > +--
> > +2.43.2
> > +
> > diff --git a/meta-python/recipes-devtools/python/python3-
> > pocketsphinx_0.1.15.bb b/meta-python/recipes-devtools/python/python3-
> > pocketsphinx_0.1.15.bb
> > deleted file mode 100644
> > index f7ffd9d268..0000000000
> > --- a/meta-python/recipes-devtools/python/python3-
> > pocketsphinx_0.1.15.bb
> > +++ /dev/null
> > @@ -1,14 +0,0 @@
> > -SUMMARY =3D "This package provides a python interface to CMU
> > Sphinxbase and Pocketsphinx libraries created with SWIG and
> > Setuptools."
> > -DESCRIPTION =3D "Python interface to CMU Sphinxbase and Pocketsphinx
> > libraries"
> > -HOMEPAGE =3D "https://github.com/bambocher/pocketsphinx-python"
> > -SECTION =3D "devel/python"
> > -LICENSE =3D "BSD-2-Clause"
> > -LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D826ebda787eb48e78aec2624f9faba72"
> > -
> > -SRC_URI[md5sum] =3D "94d008eebea16acb60a9ffe614575dee"
> > -SRC_URI[sha256sum] =3D
> > "34d290745c7dbe6fa2cac9815b5c19d10f393e528ecd70e779c21ebc448f9b63"
> > -
> > -inherit pypi setuptools3 features_check
> > -
> > -DEPENDS +=3D "swig-native pulseaudio"
> > -REQUIRED_DISTRO_FEATURES +=3D "pulseaudio"
> > diff --git a/meta-python/recipes-devtools/python/python3-
> > pocketsphinx_5.0.3.bb b/meta-python/recipes-devtools/python/python3-
> > pocketsphinx_5.0.3.bb
> > new file mode 100644
> > index 0000000000..fad8f5ba42
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-
> > pocketsphinx_5.0.3.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY =3D "This package provides a python interface to CMU
> > Sphinxbase and Pocketsphinx libraries created with SWIG and
> > Setuptools."
> > +DESCRIPTION =3D "Python interface to CMU Sphinxbase and Pocketsphinx
> > libraries"
> > +HOMEPAGE =3D "https://github.com/bambocher/pocketsphinx-python"
>
> Thank you for helping with this. I was working on this upgrade as well
> but yours seems better except I think this HOMEPAGE and DESCRIPTION
> should also change. Perhaps:
>
> SUMMARY =3D "Python interface to Pocketsphinx libraries."
> DESCRIPTION =3D "Pythonsphinx is an Open source large vocabulary,
> speaker-independent continuous speech recognition engines."
> HOMEPAGE =3D "https://github.com/cmusphinx/pocketsphinx"
>

sounds ok. I have added this locally.
>
> > +SECTION =3D "devel/python"
> > +LICENSE =3D "BSD-2-Clause"
>
> Should this be BSD-2-Clause | MIT since one of the links in commit
> message points to a MIT license?

On closer look there is BSD-3 also, so I have added both

>
> > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3Dc4d720cdc9c6953091f65e8b01524bb4"
> > +
> > +SRC_URI +=3D "file://0001-cython-Use-cythyon3-in-cmake-check.patch"
> > +SRC_URI[sha256sum] =3D
> > "27f4de0ca2d2bce391ce87eaab84fe6f0bc059b306fd1702d5fe6549b66e1586"
> > +
> > +inherit cmake pkgconfig pypi python3native
> > +
> > +DEPENDS +=3D "swig-native python3-cython-native python3-scikit-build-
> > native gstreamer1.0 gstreamer1.0-plugins-base"
> > +
> > +EXTRA_OECMAKE +=3D "-DBUILD_GSTREAMER=3DON"
> > +
> > +PACKAGES +=3D "${PN}-models ${MLPREFIX}gstreamer1.0-pocketsphinx"
> > +
> > +FILES:${MLPREFIX}gstreamer1.0-pocketsphinx =3D "${libdir}/gstreamer-
> > 1.0/"
> > +FILES:${PN}-models =3D "${datadir}/pocketsphinx/model"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#108918):
> > https://lists.openembedded.org/g/openembedded-devel/message/108918
> > Mute This Topic: https://lists.openembedded.org/mt/104463679/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-devel/unsub [
> > anuj.mittal@intel.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

