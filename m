Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBABFC46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 16:51:16 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.109395.1673369468654886474
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 08:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fFXdD6Vp;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id r132so10156oif.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 08:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hNFAa4owz8J8t0ffVr864HBHNNxf8zCjZUfVURxIBQ=;
        b=fFXdD6VpOsN0VHenCp7rI+D6PW1QoFSVbxv4pxanUmADofE1V7pKfDvkDfj9EcSq6y
         rgsAPDoZtOhhhFocmYDo70a5bwNteqMl1jsHbpiEky+7KkGWc+4IXNAoNISjJOu6ed99
         Z6SI1oAB85p7qpyR6vcL6Gf7khi823kVHF8D3Lzwha7FKISyL/Gy8CkJMWpjBYEHtLQO
         t0vx1ludR3Uuki5ZkQpOReFnx/3zG4gFiUzrL8Z+EPecJviq8MfezvT07iiZtGADmCPV
         NrJD4T+851VdULTFYJ1ZTvu7UrAElZZLmodKUCgPt2ukGuMgvofJ0Jt9Ptbw0buU3hnG
         y3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hNFAa4owz8J8t0ffVr864HBHNNxf8zCjZUfVURxIBQ=;
        b=QCTdik7a5REtJupCsvVDV/QGAia49rTSBz4AM98PoPF9rctH59FMUu5KO3sme+x3BB
         Mx7mmXIiKzjXHZmD6dTq8i5DRocPxa5g4/zbepSoAGy1Q3nPfluqAZXn9MXSWXGJtltl
         IykXOPpYzbkOjyjrkMoL6dRJ3/Kd8x54IKn/h76/+WXbyjuydze21vWAD5X+xIsEQS4/
         bB/LegWAA1bTi46yoqYsLnIA2tvGDfTSRVo+947hBp9yH5NnlUUGx/XZddE+b9U77Yhk
         KhUVkV6z974r2x6Moj85tF8V2ue07DGaOxPanVusxTHwEDpEt75HSrrOud2G9PKBY0U6
         wZPg==
X-Gm-Message-State: AFqh2kol5Ak2AjtqqPnwlIJyp+lJGtO0XZO0DuhUAuYXtDs/bZO28RBx
	KrloqKXx710xsiEo+6xUsuxxgRGqQQ7CtH9gu4M=
X-Google-Smtp-Source: AMrXdXuotPU5VkiM9rc4go1rYgoLJtYz7RC6jSkxy3TTrGXgrAnocdzBoq14SpxvrS5bF4n0gknGayNJuvHc3e2MSzw=
X-Received: by 2002:aca:6085:0:b0:363:240c:bdc7 with SMTP id
 u127-20020aca6085000000b00363240cbdc7mr3118843oib.55.1673369467825; Tue, 10
 Jan 2023 08:51:07 -0800 (PST)
MIME-Version: 1.0
References: <1673329158-5189-1-git-send-email-wangmy@fujitsu.com>
 <1673329158-5189-2-git-send-email-wangmy@fujitsu.com> <CAMKF1sqYpa5b3fMJGRJST776-LprzrebvEfo=yJQikw4o0QR4w@mail.gmail.com>
 <OSBPR01MB18454AD24C04392688A20EF5DCFF9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB18454AD24C04392688A20EF5DCFF9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Jan 2023 08:50:42 -0800
Message-ID: <CAMKF1spZ0WaTinzHOAcYtXcqmhqWfXqTghxmdLtOj26q6a_wZg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] flatbuffers: upgrade 22.12.06 -> 23.1.4
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 16:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100520

On Tue, Jan 10, 2023 at 12:07 AM wangmy@fujitsu.com <wangmy@fujitsu.com> wr=
ote:
>
> In September 2022, the suffix of bb file was removed from the following p=
atch:
>
> [oe] [oe-core][PATCH] flatbuffers: upgrade 2.0.6 -> 2.0.8
>
> The purpose of the patch is to update flatbuffers and python3-flatbuffers=
 together.
>
> Please confirm whether it is necessary to change back.

I think version recipes are easy to bbappend. For now lets keep it as it is=
.

>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road, N=
anjing, 210012, China
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org
> > <openembedded-devel@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: Tuesday, January 10, 2023 2:24 PM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe] [PATCH] flatbuffers: upgrade 22.12.06 -> 23=
.1.4
> >
> > On Mon, Jan 9, 2023 at 9:39 PM wangmy <wangmy@fujitsu.com> wrote:
> > >
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
> > b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
> > > index c87a449f0..a85c74c12 100644
> > > --- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
> > > +++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
> > > @@ -1,3 +1,3 @@
> > > -PV =3D "22.12.06"
> > > -SRCREV =3D "acf39ff056df8c9e5bfa32cf6f7b5e6b87a90544"
> > > +PV =3D "23.1.4"
> >
> > here also its good to rename the recipes to reflect PV.
> >
> > > +SRCREV =3D "af9ceabeef1a10c1004e2741f8c0c090ca59e5af"
> > >  SRC_URI =3D
> > "git://github.com/google/flatbuffers.git;branch=3Dmaster;protocol=3Dhtt=
ps"
> > > --
> > > 2.25.1
> > >
> > >
> > >
> > >

