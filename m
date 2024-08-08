Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CFCC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 15:31:58 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.62916.1723131109350141664
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 08:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WzeZ7EIv;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3db1e4219f8so716196b6e.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723131108; x=1723735908; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlMcDW7xQbOPPISoTFZ+tBiX0ad25TH6Fbq41AseOi8=;
        b=WzeZ7EIvkkym5BEEyGbPuiYBikaeTYH8UV9ZHwWJ4KEExxWHyOk2fQnhweIOSLBVuD
         U9A4EpdyZOPTyhw1YPPKUWzBZ7OVhdUGMmzifPacveLT2jP1AdIowFga54ZWgSJRl5KP
         3N+rV+blldDTf6T7mJBG19AghldfUPgkyC/ClF63jRM+I8ksOead4Wq+4494e2uUGIH8
         YoxJyVy1k1vxLNmM/kkOz75KKDstr/TlpsiUMuFD/NJH6tEjCC02j/VATd815Ej9rKvu
         vKJ0nucD7KtOyyuV1sztjuBnPcEnH+jSVHHSU6lcv1Sf/gSJg3kkihDflD7Z1seL51QK
         CgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723131108; x=1723735908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlMcDW7xQbOPPISoTFZ+tBiX0ad25TH6Fbq41AseOi8=;
        b=jRUH3LK464joY3DSICKSQxpNizyyi9vNnBhB7irHO3HyusKsZs0QARgfPLUVDw3XGV
         eFYD4x0WBFj39IxiurYBhHWNayPHutS/FSNb/LQS6FPdpDB64511VN+/Swxv6XcLt45+
         aJhLWSEvBaU7gcRILWM4993LAm3oXNN8f+g1WEMJHg8Nad8y8XLZL9RueZJjDE7LJBrv
         bB9q5VwqSqn4RlzW9jwmZ/iG3bmUGur+H8VmoWIOMiSe238VimJabQDIBK3iw9390Mmp
         KmBS3Gc2btDW4dxg1o/JFDrRJQZFwbsx4Bjh2GgEhURYB8XydSC1Wl4o8qyffViaXIc3
         C2xw==
X-Forwarded-Encrypted: i=1; AJvYcCXSoQWKiZuaqXSGnUlPb7crtTjhq1I9P81ABWBJ/boQrPj7Og+sbcpm7tgd6Q/0vTUa+r2qWnBzKMSSMwZUbpu3EnPw/1c0khURqKOzeOYcUu2lPzoFE86roQ==
X-Gm-Message-State: AOJu0YypQPf6f7fHaX85tCg93bUUULk1nheqHdXdRDp7OsHSO0Lu0Y14
	+LPo/4cYBoLB7FEqOZRZELOqaZFTpK1lYDA5Y8znPDgHUaJIOeLXrgI9BzsFItWZ3dpo0+ySXTH
	ZEF5FGVFQDCKGFPVy2ePzFcJbGxM=
X-Google-Smtp-Source: AGHT+IEO3c760z1MG3ksJChZkakcLn2fJjBwNkzqvCWcgynqb6eJUNFq/KoQodT5knrQgWWhjbVTX53+hWCcMmCZ3UA=
X-Received: by 2002:a05:6808:f02:b0:3d6:32be:a8a5 with SMTP id
 5614622812f47-3dc3b409bfbmr2326031b6e.4.1723131108455; Thu, 08 Aug 2024
 08:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240808101402.24626-1-alperyasinak1@gmail.com> <CAMSfU+5QtYgjPCvN3M6AQm8PvNArEOFGZidq-yxxd+MNN-fmTg@mail.gmail.com>
In-Reply-To: <CAMSfU+5QtYgjPCvN3M6AQm8PvNArEOFGZidq-yxxd+MNN-fmTg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Aug 2024 08:31:22 -0700
Message-ID: <CAMKF1srOb7wA++o6pMrJn_YhJrp=dzf6pN1uro1vOMWckHu+2g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-reedsolo: fix versioning
To: yoann.congal@smile.fr
Cc: "alperyasinak1@gmail.com" <alperyasinak1@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 15:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111666

On Thu, Aug 8, 2024 at 7:39=E2=80=AFAM Yoann Congal via lists.openembedded.=
org
<yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>
>
>
> Le jeudi 8 ao=C3=BBt 2024, Alper Ak via lists.openembedded.org <alperyasi=
nak1=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
> > The latest release version 1.7.0.
> >
> > https://pypi.org/project/reedsolo/#description
> > https://github.com/tomerfiliba-org/reedsolomon/releases
> >
> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > ---
> >  .../{python3-reedsolo_2.0.13.bb =3D> python3-reedsolo_1.7.0.bb}   | 2 =
+-
>
> Hi,
>
> I haven't looked at what the correct PV should be, but don't we need to i=
ncrease PE when PV decrease like this?

yes thats the right thing for downgrades and its sad that 2.0.13 was
recalled. We should perhaps upgrade to 2.1 release
even though its in beta but that would be better imo.

>
> Thanks!
>
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-python/recipes-devtools/python3-reedsolo/{python3-reedsolo=
_2.0.13.bb =3D> python3-reedsolo_1.7.0.bb} (75%)
> >
> > diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reed=
solo_2.0.13.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reed=
solo_1.7.0.bb
> > similarity index 75%
> > rename from meta-python/recipes-devtools/python3-reedsolo/python3-reeds=
olo_2.0.13.bb
> > rename to meta-python/recipes-devtools/python3-reedsolo/python3-reedsol=
o_1.7.0.bb
> > index bb5b973d8..b6c40921c 100644
> > --- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.=
0.13.bb
> > +++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.=
7.0.bb
> > @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/tomerfiliba/reedsolomo=
n"
> >  LICENSE =3D "MIT-0 | Unlicense"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dffde61aeb8917e70e0257e0a4b6=
d103c"
> >
> > -SRC_URI[sha256sum] =3D "71b4121c6860a55899435c552051a19d5f023c50358be4=
b1c0fa0c6e2f4ac717"
> > +SRC_URI[sha256sum] =3D "c1359f02742751afe0f1c0de9f0772cc113835aa2855d2=
db420ea24393c87732"
> >
> >  inherit pypi setuptools3
> >
> > --
> > 2.25.1
> >
> >
>
> --
> Yoann Congal
> Smile ECS - Tech expert
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111665): https://lists.openembedded.org/g/openembedde=
d-devel/message/111665
> Mute This Topic: https://lists.openembedded.org/mt/107786892/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

