Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE16C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 08:09:38 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.47122.1742198974788518318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 01:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0qCg6Tnc;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso3172444f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 01:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742198973; x=1742803773; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YUjyg+hG//W6cxn7+klEp7qM8QakuSn9qAVtVVpqqI=;
        b=0qCg6Tnc7KV+I3NkVbnDfEGV9EfWIhosaoG/zIymcZ6zVn0pUyXTs8JmwFIanQOdZA
         vvD6YIxZblxSVqxABrYV6ai7EYaa5C3+Ln0oeXr4VymEhjLK4jHBiGMT+1+mpTU2xPPW
         Kw6dBteXvMJ5MSLQH+YbMBSC8UvsiELCH2NGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742198973; x=1742803773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YUjyg+hG//W6cxn7+klEp7qM8QakuSn9qAVtVVpqqI=;
        b=RD5eiCAlTiyG97p2mQYqNyQi3bv+AVkWHdwBCQXmWdVl7EGfwajBU1UIQ5AWgvdFPl
         F1X94bCTIjrGVlAME58smcxrY3o768X4Uni4HoiMvi7xvbu3XoGP4vEpLOd7IysmwGWI
         8KIeBh6gsYDEy+nChv3Yy9KYViIqp2jLfKBWy5mTd9M7qW13iYf2H/XrM3u48ynDz1LC
         +tNb9dCNs7Jzk39HkJ5mgei1FVhodi4eXoJ0g5P5uelFIMKzsvoaebASuBCZGJvr/zSm
         PQOjKH51yKQ2k4tw9QCbXs7h3v1uHxyLQ6hLD44Fw/k8N/wPKs+vF5FfzdkzybOYC/0A
         rNhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjxsxwIC5HLOT6kIX/SE3NjS3pGjC0gq3E9UrIi1qb1/5D3jg+xhkHhRA/ACUuc775vYbnCmWDJ/rifmOX90Ws674=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyFEeT9b464NvwgOhnI9qriF1b/AR5fBwi8P0VLOW0WC/feDhA/
	lt9oybh6VNQCd+9BgchG1IEqCxktqW2ThfTKxHesrC5vFUzhN6NC/KiUTIaMgbuuVD3kxfL2fFq
	cpjNIz/0U8fmpECS0cLG84na+1yLwLC1pPB5ccg==
X-Gm-Gg: ASbGncvtAu6HK2ArpgVVBKTuEuaP1cpce7MusKWx91ZhJi33XVnnCQHGNU+/zhsU+Wg
	mUAxsyVR/d0CKOh66k/IkkhgoExIZS26HA1GfRIx/zuwAxK3U8N0GlQi8ys5Btp9HpLkuG08h53
	I+oiBhWeSlHUdlKoXR8Wph3i4c8AMEbG/flpe6C+4L4IhgT2rcNw3xKRSqbU/MFQXDd+arqw==
X-Google-Smtp-Source: AGHT+IFpS4394eO7zvtRmYm/dEFamEtTKW3f4T+Wuf7GFB6hXbKaOZ78t70Mczt+ocidZ7wkt5vMPlxEyZKmHVIkAAU=
X-Received: by 2002:a05:6000:2cf:b0:390:f116:d220 with SMTP id
 ffacd0b85a97d-3971c97ba0cmr10199743f8f.17.1742198973089; Mon, 17 Mar 2025
 01:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250123002818.2770480-1-schonm@gmail.com> <Z9dc6ONKShAo3V3j@smile.fr>
 <CAMKF1so1M_nMJtdygux5UFt1JWShb6gHp838cwJsa=dNAJAOMA@mail.gmail.com>
In-Reply-To: <CAMKF1so1M_nMJtdygux5UFt1JWShb6gHp838cwJsa=dNAJAOMA@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 17 Mar 2025 09:09:07 +0100
X-Gm-Features: AQ5f1Jqze9lHbuG7G3zksOVOPRkA0SB4iyxwKhBuYQFRS0LhehPgVLUHulr3tP4
Message-ID: <CAMSfU+459ZUrUCtMgM0nueTao6qsb+8ewm0nxvPMTkrZf+PcMA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: upgrade 22.12.0 -> 22.13.1 (build
 failure on Ubuntu 20.04)
To: Khem Raj <raj.khem@gmail.com>
Cc: schonm@gmail.com, openembedded-devel@lists.openembedded.org, 
	martin.jansa@gmail.com, changqing.li@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 08:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116021

Le lun. 17 mars 2025 =C3=A0 00:34, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :
>
> On Sun, Mar 16, 2025 at 4:21=E2=80=AFPM Yoann Congal via
> lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
> wrote:
> >
> > Hello,
> >
> > Le Wed, Jan 22, 2025 at 07:28:18PM -0500, J. S. via lists.openembedded.=
org a =C3=A9crit :
> > > Changelog for 22.13.0 : https://github.com/nodejs/node/blob/main/doc/=
changelogs/CHANGELOG_V22.md#22.13.0
> > > Changelog for 22.13.1 : https://github.com/nodejs/node/blob/main/doc/=
changelogs/CHANGELOG_V22.md#22.13.1
> > >
> > > The 22.13.1 release is a security fix addressing four CVEs.
> > >
> > >     CVE-2025-23083 - src,loader,permission: throw on InternalWorker u=
se when permission model is enabled (High)
> > >     CVE-2025-23085 - src: fix HTTP2 mem leak on premature close and E=
RR_PROTO (Medium)
> > >     CVE-2025-23084 - path: fix path traversal in normalize() on Windo=
ws (Medium)
> > >     CVE-2025-22150 - Use of Insufficiently Random Values in undici fe=
tch() (Medium)
> > >
> > > I introduce a new patch with this recipe 0001-Do-not-use-glob-in-deps=
.patch to revert https://github.com/nodejs/node/commit/77e2869ca6
> > >
> > > I restored 0001-deps-disable-io_uring-support-in-libuv.patch as sugge=
sted here : https://lore.kernel.org/all/20241207140642.181134-1-martin.jans=
a@gmail.com/
> > >
> > > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> >
> > nodejs_22.13.1 has now been merged for a long time but it appears that
> > it fails to build on Ubuntu 20.04:
> >     g++  -o $TOPDIR/tmp/work/core2-64-poky-linux/nodejs/22.13.1/node-v2=
2.13.1/out/Release/obj.host/simdutf/deps/simdutf/simdutf.o ../deps/simdutf/=
simdutf.cpp '-D_GLIBCXX_USE_CXX11_ABI=3D1' '-DNODE_OPENSSL_CONF_NAME=3Dnode=
js_conf' '-DICU_NO_USER_DATA_OVERRIDE' '-D__STDC_FORMAT_MACROS' -I../deps/s=
imdutf  -pthread -Wall -Wextra -Wno-unused-parameter -m64 -O3 -fno-omit-fra=
me-pointer -fno-rtti -fno-exceptions -fno-strict-aliasing -std=3Dgnu++20 -M=
MD -MF $TOPDIR/tmp/work/core2-64-poky-linux/nodejs/22.13.1/node-v22.13.1/ou=
t/Release/.deps/$TOPDIR/tmp/work/core2-64-poky-linux/nodejs/22.13.1/node-v2=
2.13.1/out/Release/obj.host/simdutf/deps/simdutf/simdutf.o.d.raw  -isystem$=
TOPDIR/tmp/work/core2-64-poky-linux/nodejs/22.13.1/recipe-sysroot-native/us=
r/include -O2 -pipe -c
> >   g++: error: unrecognized command line option =E2=80=98-std=3Dgnu++20=
=E2=80=99; did you mean =E2=80=98-std=3Dgnu++2a=E2=80=99?
> >   make[1]: *** [deps/simdutf/simdutf.host.mk:80: /home/yocon/Documents/=
projets/yocto/contribution-yocto/builds/build-qemux86-64/tmp/work/core2-64-=
poky-linux/nodejs/22.13.1/node-v22.13.1/out/Release/obj.host/simdutf/deps/s=
imdutf/simdutf.o] Error 1
> >   make: *** [Makefile:135: node] Error 2
> >   ERROR: oe_runmake failed
> >   WARNING: ./tmp/work/core2-64-poky-linux/nodejs/22.13.1/temp/run.do_co=
mpile:182 exit 1 from 'exit 1'
> >
> > I interpret this as "nodejs wants to build a native binary using g++ bu=
t
> > with the wrong std=3Dgnu++20 option for the Ubuntu 20.04 g++ (which is =
9.4
> > and only has --std=3Dgnu++2a)"
> >
> > This has been seen on autobuilder each time the meta-oe reproducibility
> > test happens on a ubuntu 20.04 worker :
> >  * https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/3=
6/steps/32/logs/stdio
> >  * https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/3=
3/steps/32/logs/stdio
> >
> > I've tried to look around but the nodejs build system does not look
> > trivial... I've tried to patch the generated Makefiles to use std=3Dgnu=
++2a
> > but it broke on a syntax error. So, in the end, I doubt that Ubuntu 20.=
04
> > can build this nodejs.
> >
> > Does anyone has any idea on how to approach this?

Hi Khem,

> yeah it came up before as well, you have two options, there is a gcc10
> available for ubuntu 20.04
>
> sudo apt update -y
> sudo apt upgrade -y
> sudo apt install -y build-essential
> sudo apt install -y gcc-10 g++-10 cpp-10
> sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10
> 100 --slave /usr/bin/g++ g++ /usr/bin/g++-10 --slave /usr/bin/gcov
> gcov /usr/bin/gcov-10
>
> another approach is to use buildtools tarball.
>
> I would recommend to use buildtools tarball,  packages like protobuf,
> grpc are now expecting c++ compiler to support C++17 std by default
> and it will
> only get worse.

Thanks!

Ok, so that is a known problem.

Should we try to avoid the Ubuntu 20.04 workers for the meta-oe
reproducibility test?
And maybe document somewhere that, while Ubunutu 20.04 is tested for
OE-Core, it does not work for meta-openembedded?

> >
> > Regards,
> >
> > --
> > Yoann Congal
> > Smile ECS
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#116018): https://lists.openembedded.org/g/openembed=
ded-devel/message/116018
> > Mute This Topic: https://lists.openembedded.org/mt/111740469/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Yoann Congal
Smile ECS - Tech expert

