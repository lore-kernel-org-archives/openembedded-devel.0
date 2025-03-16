Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6A0C28B2F
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 23:34:25 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.40599.1742168061044310421
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 16:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E1MkMQ6U;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2bcceee7b41so1302017fac.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 16:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742168060; x=1742772860; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8MpzcmsYEPfl/w9ZR4rpxaqen3q8c049CpmRBPCSB0=;
        b=E1MkMQ6UXnqwynk+lipiKxQhzsDllAc59CCyaygqHo8dpn2B2BFo0Ajn7DE2/RPf/J
         1mBDfV8f2RihRfMPgpGdFKt87fCGnjWFw57INLxiTNii7gm54qoDBfCNQ0bcTWllAw/+
         +hX8LJ/60+d8RpPaFEHfdyWxWR4JxSI6PVMmllmewRz67/mosUjP3GOI0v4sYKPrbWCH
         pbqCjoUQ7UQD2fiEgp9dD9VlB1R5XJWZV+TQj7SCjzeARQJMYkA1augG8fEraQClvLJU
         4z08tN365O2EXZzlUW3QKi1RWQY1IJ13k7L91OTqWTw7W/ALuPkyszNYyrr2kB02M6Jc
         tcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742168060; x=1742772860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8MpzcmsYEPfl/w9ZR4rpxaqen3q8c049CpmRBPCSB0=;
        b=uoswjwZZzH29qy7E3JwUNTs88C3UbeJBVusEXvBJwjnPMM9UTNDhlA2ANaw/rZ5nuF
         czKB/VR4Hdw+jyccyvzCuN/vcdY7sXFIaNfHYR7QL1X8I2B61K/61idJyxaCTpNLnaP3
         V8UNfyP8UQ6BdMaSXYZnzuubNVLXevazsS0dnfflcWwF8fRxDTJ9bXd2LvZPfRjvayCy
         fKH+Sjj+EaorqeipHMeFzEiaQ3tTRZqRoeVFzyz8/Jcs/oAFnlwWp3TtREWnU20waiYc
         0VTS3POUF0O6tFVzYpGolSgd/QQVMT4YOhx+Hy/sF/Hd5LwNAAYASYJFhxd/sSoQXGaY
         EWPg==
X-Forwarded-Encrypted: i=1; AJvYcCUIPc7BBpsHVSpX2eaP8atDzpl0pAcSk6ISM9y4Z9lJoteEPwVkQRW6ybNKww5dpPpXyAKoTHiYgpLP5DU2/nqY2SY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YziI9c77u/eni4RRn7AOgoOlvaYBkawJ99mj3CA8VDQQl2nDUio
	ZiT/9xH+reyG8U+Fc5g4ibupqyxOHQJCFSoz2AKINtsK74KEFr+jSmmFtUuw/rXqEcAVoggE3pf
	duSkudRCX5S8N3QfhnfJ9A5u4Fg0=
X-Gm-Gg: ASbGncvszr6DqR0xkWe6kUnzkwCVRQFz/veITS/IkAomykmzIrCRzlHk+3G0zpFN1vj
	vsEyPm8gSI5MkmB7VudsyDK54O5Kf2cVHQcZPlm9DpehMo0DEz0qDZdnJ/oMsDvBOZ7u+yqNFML
	X+JEOkpHaypLT53hqMCox+YNjm
X-Google-Smtp-Source: AGHT+IH9BPzFLugYaOyFwEIfyMC4pHLeYFtbkWcr7YEYBYKBS8VWRvnHtSvplvgRFbX/H2IIt0o9+wH/SduGskcOpJw=
X-Received: by 2002:a05:6808:398a:b0:3f8:b73b:683c with SMTP id
 5614622812f47-3fdee181db8mr6436787b6e.2.1742168060126; Sun, 16 Mar 2025
 16:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250123002818.2770480-1-schonm@gmail.com> <Z9dc6ONKShAo3V3j@smile.fr>
In-Reply-To: <Z9dc6ONKShAo3V3j@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Mar 2025 16:33:54 -0700
X-Gm-Features: AQ5f1JoWvB40a_hf3YXelVbwr4yTlPK-r1F_twgbT33zQy_9dtcvi-F0uU7SgmE
Message-ID: <CAMKF1so1M_nMJtdygux5UFt1JWShb6gHp838cwJsa=dNAJAOMA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: upgrade 22.12.0 -> 22.13.1 (build
 failure on Ubuntu 20.04)
To: yoann.congal@smile.fr
Cc: schonm@gmail.com, openembedded-devel@lists.openembedded.org, 
	martin.jansa@gmail.com, changqing.li@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 23:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116019

On Sun, Mar 16, 2025 at 4:21=E2=80=AFPM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
> Hello,
>
> Le Wed, Jan 22, 2025 at 07:28:18PM -0500, J. S. via lists.openembedded.or=
g a =C3=A9crit :
> > Changelog for 22.13.0 : https://github.com/nodejs/node/blob/main/doc/ch=
angelogs/CHANGELOG_V22.md#22.13.0
> > Changelog for 22.13.1 : https://github.com/nodejs/node/blob/main/doc/ch=
angelogs/CHANGELOG_V22.md#22.13.1
> >
> > The 22.13.1 release is a security fix addressing four CVEs.
> >
> >     CVE-2025-23083 - src,loader,permission: throw on InternalWorker use=
 when permission model is enabled (High)
> >     CVE-2025-23085 - src: fix HTTP2 mem leak on premature close and ERR=
_PROTO (Medium)
> >     CVE-2025-23084 - path: fix path traversal in normalize() on Windows=
 (Medium)
> >     CVE-2025-22150 - Use of Insufficiently Random Values in undici fetc=
h() (Medium)
> >
> > I introduce a new patch with this recipe 0001-Do-not-use-glob-in-deps.p=
atch to revert https://github.com/nodejs/node/commit/77e2869ca6
> >
> > I restored 0001-deps-disable-io_uring-support-in-libuv.patch as suggest=
ed here : https://lore.kernel.org/all/20241207140642.181134-1-martin.jansa@=
gmail.com/
> >
> > Signed-off-by: Jason Schonberg <schonm@gmail.com>
>
> nodejs_22.13.1 has now been merged for a long time but it appears that
> it fails to build on Ubuntu 20.04:
>     g++  -o $TOPDIR/tmp/work/core2-64-poky-linux/nodejs/22.13.1/node-v22.=
13.1/out/Release/obj.host/simdutf/deps/simdutf/simdutf.o ../deps/simdutf/si=
mdutf.cpp '-D_GLIBCXX_USE_CXX11_ABI=3D1' '-DNODE_OPENSSL_CONF_NAME=3Dnodejs=
_conf' '-DICU_NO_USER_DATA_OVERRIDE' '-D__STDC_FORMAT_MACROS' -I../deps/sim=
dutf  -pthread -Wall -Wextra -Wno-unused-parameter -m64 -O3 -fno-omit-frame=
-pointer -fno-rtti -fno-exceptions -fno-strict-aliasing -std=3Dgnu++20 -MMD=
 -MF $TOPDIR/tmp/work/core2-64-poky-linux/nodejs/22.13.1/node-v22.13.1/out/=
Release/.deps/$TOPDIR/tmp/work/core2-64-poky-linux/nodejs/22.13.1/node-v22.=
13.1/out/Release/obj.host/simdutf/deps/simdutf/simdutf.o.d.raw  -isystem$TO=
PDIR/tmp/work/core2-64-poky-linux/nodejs/22.13.1/recipe-sysroot-native/usr/=
include -O2 -pipe -c
>   g++: error: unrecognized command line option =E2=80=98-std=3Dgnu++20=E2=
=80=99; did you mean =E2=80=98-std=3Dgnu++2a=E2=80=99?
>   make[1]: *** [deps/simdutf/simdutf.host.mk:80: /home/yocon/Documents/pr=
ojets/yocto/contribution-yocto/builds/build-qemux86-64/tmp/work/core2-64-po=
ky-linux/nodejs/22.13.1/node-v22.13.1/out/Release/obj.host/simdutf/deps/sim=
dutf/simdutf.o] Error 1
>   make: *** [Makefile:135: node] Error 2
>   ERROR: oe_runmake failed
>   WARNING: ./tmp/work/core2-64-poky-linux/nodejs/22.13.1/temp/run.do_comp=
ile:182 exit 1 from 'exit 1'
>
> I interpret this as "nodejs wants to build a native binary using g++ but
> with the wrong std=3Dgnu++20 option for the Ubuntu 20.04 g++ (which is 9.=
4
> and only has --std=3Dgnu++2a)"
>
> This has been seen on autobuilder each time the meta-oe reproducibility
> test happens on a ubuntu 20.04 worker :
>  * https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/36/=
steps/32/logs/stdio
>  * https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/33/=
steps/32/logs/stdio
>
> I've tried to look around but the nodejs build system does not look
> trivial... I've tried to patch the generated Makefiles to use std=3Dgnu++=
2a
> but it broke on a syntax error. So, in the end, I doubt that Ubuntu 20.04
> can build this nodejs.
>
> Does anyone has any idea on how to approach this?

yeah it came up before as well, you have two options, there is a gcc10
available for ubuntu 20.04

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y build-essential
sudo apt install -y gcc-10 g++-10 cpp-10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10
100 --slave /usr/bin/g++ g++ /usr/bin/g++-10 --slave /usr/bin/gcov
gcov /usr/bin/gcov-10

another approach is to use buildtools tarball.

I would recommend to use buildtools tarball,  packages like protobuf,
grpc are now expecting c++ compiler to support C++17 std by default
and it will
only get worse.
>
> Regards,
>
> --
> Yoann Congal
> Smile ECS
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116018): https://lists.openembedded.org/g/openembedde=
d-devel/message/116018
> Mute This Topic: https://lists.openembedded.org/mt/111740469/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

