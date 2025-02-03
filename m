Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1ADBC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 19:28:42 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.97272.1738610919236706002
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 11:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nXdkTNp1;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-29fcbf3d709so1488997fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 11:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738610918; x=1739215718; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkPdxbGaL6wtUkQRkayl/gp9N5HMek14w+AT66XKr+o=;
        b=nXdkTNp16c9z3/oisMH5VvHQe4gSfrD9W3QFqQlmSzNcEgkUBy07C//GF3d6aMPqFK
         /gVP3v5rEbc+HBBJEz4x0OOXMgyyLzhSBoP06CLSTXLIPh04sXLl1fbD45KynpiOZaBu
         XPfNu2G3mRSJuGOeKnB2TbNtsBccANe62g3NQ9HAp5CVHpNuEVv9t88IOJqWSXtS4+Ga
         BQzA23/jMuXxo2fDWKtgOohcv5UxojBYrBe+en3CDYw9NgIbPiAm4cZRHrfLuXCfJZX8
         5/PCoiOFIwjt0ydHUWMFthCQ+7sLqnFABt3eSZNO9VJBQqq2vYFbMythFWkXogV+Z0Nh
         syBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738610918; x=1739215718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkPdxbGaL6wtUkQRkayl/gp9N5HMek14w+AT66XKr+o=;
        b=UNu5O4o/zf0QXe1DXKHC9ijJN7/a8oQLJ8KVgWG+VFWz+c6yiasgZFCjVKf/N3Uil2
         krByYSQUtWfOIPXM8v4FPJwGHwGsKkzsjXzAUdaLd1vVftQMIqNHQ+TFlTIH7ZfEBV0v
         N9Ci+yRqicfW3d+sCsI7ahMFHassta0cCaX6eim2h3oIp2uxSLbrxUj6of5gTukMu91v
         Ihi6txXQSvteGDX1Z56ow94r1tQSOfS43r3wWyuouUbbv91RSX5focv2T/NcTvkfWdO3
         rnCMAofd6AHktZ0QnhAcybolaIHgmGU9X0q6x4K/MaFTIQfrbteURZTCGThk0ElLX/Rl
         N3KQ==
X-Gm-Message-State: AOJu0YxgdTCdDgYZQWLpJ29KXQYH5QC9txLS0cOcBM/CbnucWPMIrRsI
	czUpoGWDWrAqkMkgH+3mAi3QvReuN+Ns+b9WT1npZge5XyX+PquSH6ZzsNQpO0hFKboKi8kSC9B
	3Nmhns9K8C6IZfaYofoohKRZsQbU=
X-Gm-Gg: ASbGnctCFZSpyeYCpKcXq0+5FjQxxaIxauFioRtizaWJi1cZRv0KJYxKZuzzFXP4Nzi
	0dXdKPPiswImnvD0LU8jFL0PIM5YlQAZhKjpsMfxE1e9boUx4MqifOsWEr7EKPUQjGCphMkELTE
	UkabJbbfc6r1Imy6saqxdaMJjD0g==
X-Google-Smtp-Source: AGHT+IHyPYny+ltVUQ4CRW3kGn3eg40FdT6q02Lg0I+Dww4QNWKNPdKe51QsjNnIKC874kUyXsvZGbhzYTjr43soreA=
X-Received: by 2002:a05:6870:1592:b0:29e:76d1:db3b with SMTP id
 586e51a60fabf-2b32efdc0f6mr15333852fac.5.1738610918370; Mon, 03 Feb 2025
 11:28:38 -0800 (PST)
MIME-Version: 1.0
References: <20250202213910.284312-1-peter.marko@siemens.com>
 <CAMKF1srD+9NqL9ntuMrGDa3ys_Gn3YnqazO_7KWb8cTnwk1CHQ@mail.gmail.com> <AS1PR10MB5697FF5346CE3E966DD5D32CFDF52@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697FF5346CE3E966DD5D32CFDF52@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Feb 2025 11:28:12 -0800
X-Gm-Features: AWEUYZnA694BBvikKTkknHwBeNFIAuqh3v8NGj5E3W4J2T6E9cE3DsVxtfjho60
Message-ID: <CAMKF1sopyF-z1Pvhm4dZo2A3-K9Zc_VG5OrU7SN-REcLWBdh5Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/8] protobuf: remove unneeded atomic linker flag
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 19:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115254

On Mon, Feb 3, 2025 at 10:14=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om> wrote:
>
> Test build with arm+clang was successful.
> I hope that helps and remaining archs will be checked on autobuilder.
>
> Note that build with ptest enabled fails with clang in do_compile_ptest d=
uring linking with absl, but the same happens without this patch, too.

Thanks for build testing, the CI builds are usually with ptest turned
on, so if it fails with ptest enabled without this patch we should
have been failing on CI

>
> Peter
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Monday, February 3, 2025 1:36
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH 1/8] protobuf: remove unneeded atomic=
 linker
> > flag
> >
> > On Sun, Feb 2, 2025 at 1:40=E2=80=AFPM Peter Marko via lists.openembedd=
ed.org
> > <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> > >
> > > From: Peter Marko <peter.marko@siemens.com>
> > >
> > > This is handled in protofuf cmake since 3.15:
> > >
> > https://github.com/protocolbuffers/protobuf/commit/55ed1d427ccc0d200927=
74
> > 6329ac9b811dee77b9
> > >
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > ---
> > >  meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb | 6 ------
> > >  1 file changed, 6 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/m=
eta-
> > oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> > > index 89e1071b59..efd70d6474 100644
> > > --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> > > +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
> > > @@ -115,9 +115,3 @@ RDEPENDS:${PN}-ptest =3D "bash
> > ${@bb.utils.contains('PACKAGECONFIG', 'python', 'py
> > >  MIPS_INSTRUCTION_SET =3D "mips"
> > >
> > >  BBCLASSEXTEND =3D "native nativesdk"
> > > -
> > > -LDFLAGS:append:arm =3D " -latomic"
> > > -LDFLAGS:append:mips =3D " -latomic"
> > > -LDFLAGS:append:powerpc =3D " -latomic"
> > > -LDFLAGS:append:mipsel =3D " -latomic"
> > > -LDFLAGS:append:riscv32 =3D " -latomic"
> >
> > They were needed with clang IIRC, does it work without it now ?
> >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#115220):
> > https://lists.openembedded.org/g/openembedded-devel/message/115220
> > > Mute This Topic: https://lists.openembedded.org/mt/110959917/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

