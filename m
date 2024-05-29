Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA4FC25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 15:51:00 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.18440.1716997854379453565
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 08:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IqxesOy/;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5b2d065559cso958284eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 08:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716997853; x=1717602653; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/zroOYeMrz+3/l18RrSpW+jEn6qisUGQmI08R6RklI=;
        b=IqxesOy/mInU31C8OINQK0H8USU7lpnBB+f0CFQNTzoAqeRKHJeaqOhhP7WcQ0I72T
         p9HNBna41pN6FSWsJc+vq5lAeibWFItLMItgribperT+S7MxDtjDDS3nfNWJc9jN/f5N
         HG6sMWuScOjyALe8wceerMlaIEjOhKP+xoE29+uoBioYyQ4VMPlkZnXbK11E5jgdAc+N
         9uwPoupU47nBDUGAKm6qwxRXouPNu6dROitnlQ1C08hERaSyauJAqfya/8r3aNDe1Vfc
         hh8Ha6hAm6lSdk/pYuorMf+WNkKe7AieT6XcniBYe8TzfwUTM1KJZRFvNZc1t6zvyzps
         HLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716997853; x=1717602653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/zroOYeMrz+3/l18RrSpW+jEn6qisUGQmI08R6RklI=;
        b=WKoF7q54fjnRaE8vnN9eh7dpm7aCRayvU2rUwEaG6BeTtzEPLz9MrLLp2ejfNkRGbS
         okVCbX3SOPo6x1lf7DP0wLkAdWvlfo9NuIrXTDq0Tt1/vYdGZmHkuKeUUijyRWUvIGjb
         KFI5hrRbHfuCKbUGzXumAifXrb1nXT/1p/PXAVwuQuxO4FxSFl7R212bv+g8WPzupLOh
         Po+TC4g6a/Wk3DGa+/Z9Fx/SOrxC61rpf/DPtni33OIteIIOnjGZYTnVQenMuBJkZtHM
         sdaM6fdEGh1rLEaEWILxt68fMw9n0hwyuAtXFbrYy6M9c237CcrXG07HIF/eJ9aeV2R1
         nnYA==
X-Forwarded-Encrypted: i=1; AJvYcCXRKyHZ8/PA0/ohIoNXCkotcJ2pJgR3wN/ty980EUocJSbzM7MGPxRccROQNRxpuzNMfqauNzmxZKLUsYlzw6CBs/rSZJHCm7RQKUzhDnUBtlHRwGuqIl1Bdg==
X-Gm-Message-State: AOJu0YwljgqunFugVlRjitL3y6vGFPQbYZ3VqDplCbwgFIP0pEZXh/CP
	2osM1YcRsk9bbtxPfA+nuXK4dJZvoZS3zdM03VquHd/RiZtMOUoupxRJ9gUVcOn2RThREmOVm1t
	iRGQw2eRPLmskdAnCc+mDHyW2qNoLQspLuPQ=
X-Google-Smtp-Source: AGHT+IErfftJyf/IrP9GzGwh4BnqJu7ySTAK9ArhXGWocfhtnnRA/X7+vGAk1sHABnDOZ+yOH3tERNtGX3iHbNDlH+Y=
X-Received: by 2002:a05:6870:1687:b0:24f:f413:3039 with SMTP id
 586e51a60fabf-24ff4135154mr10379686fac.2.1716997853402; Wed, 29 May 2024
 08:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
 <1716860901-863-9-git-send-email-wangmy@fujitsu.com> <DB5PR02MB10213DE423CD73656BEC16800EFF12@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213DE423CD73656BEC16800EFF12@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 May 2024 08:50:26 -0700
Message-ID: <CAMKF1sp78ZV-LeA=gLkAC2cJF90PL296L6O+pg8ZgEbNnxrOPQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 09/40] libdevmapper: upgrade 2.03.22 -> 2.03.24
To: peter.kjellerstedt@axis.com
Cc: "wangmy@fujitsu.com" <wangmy@fujitsu.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 15:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110616

On Mon, May 27, 2024 at 7:53=E2=80=AFPM Peter Kjellerstedt via
lists.openembedded.org
<peter.kjellerstedt=3Daxis.com@lists.openembedded.org> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-devel@lis=
ts.openembedded.org> On Behalf Of wangmy via
> > lists.openembedded.org
> > Sent: den 28 maj 2024 03:48
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Wang Mingyu <wangmy@fujitsu.com>
> > Subject: [oe] [meta-oe] [PATCH 09/40] libdevmapper: upgrade 2.03.22 -> =
2.03.24
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../lvm2/{libdevmapper_2.03.22.bb =3D> libdevmapper_2.03.24.bb}   | 0
> >  meta-oe/recipes-support/lvm2/lvm2.inc                           | 2 +-
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.22.bb =3D> libd=
evmapper_2.03.24.bb} (100%)
> >
> > diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb b/met=
a-oe/recipes-support/lvm2/libdevmapper_2.03.24.bb
> > similarity index 100%
> > rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> > rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.24.bb
> > diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-su=
pport/lvm2/lvm2.inc
> > index d95366f97..0351eb6b3 100644
> > --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> > +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> > @@ -19,7 +19,7 @@ SRC_URI =3D "git://sourceware.org/git/lvm2.git;branch=
=3Dmain \
> >             file://0001-include-libgen.h-for-basename.patch \
> >             "
> >
> > -SRCREV =3D "016e469caf856f1eb8dde39df0d1aa2e74225aed"
> > +SRCREV =3D "90ec2cd92f6367c431dd8dae55d0cbe7e196734f"
> >  S =3D "${WORKDIR}/git"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\_\d+)+)"
> > --
> > 2.34.1
>
> lvm2.inc is used by both lvm2 and libdevmapper so both recipes must be up=
dated
> at the same time.

Markus has provided a followup. Although it renames the recipes to
drop PV which is less than ideal
but perhaps its better than what we have today
>
> //Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110576): https://lists.openembedded.org/g/openembedde=
d-devel/message/110576
> Mute This Topic: https://lists.openembedded.org/mt/106342039/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

