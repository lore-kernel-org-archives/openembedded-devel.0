Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1FFCFB43F
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 15:15:26 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.32798.1728227716026353442
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 08:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TD4epdEX;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8d446adf6eso611155366b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728227714; x=1728832514; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vb7xRch4WyD/a0VhVEMKq64HwOxgiPq5gyyxRcejT04=;
        b=TD4epdEXnpA8+so68SNIr3RIcO+zC1AN4SZmRgP8GwEtsJgGquhbTtQZJmVarGsatT
         GfzphXLmBpmqOM8vWadp0pHoougxqFK45QEtB6XUG6PEc01aTF4vAZsu3ucfoetorv+z
         NvO8tjJjtp4JjYHrcAzUcMwgQGIKcrawq3PZByXORmqswxFXn0YCSidV6pGi3DvxY162
         oncRo2o0yp+F8m2gwBCezwzKaIprZ1aJKShGDl7HWmlwcm9pcMag3MZUtC4GmO6SQ2gY
         UI0yZOqEWrg06EcCtFzsiffns+YKKNMUojyehrtGZgfA8HWxJAVWiBpcmf8bkkuEbjvn
         BAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728227714; x=1728832514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vb7xRch4WyD/a0VhVEMKq64HwOxgiPq5gyyxRcejT04=;
        b=Crv2bU1ByGC59IOnH5qF37azceXNXDLvYMepK7e3eIETYHSCIyQF3yjsbsRkmwMx21
         3ZB0BYYWcJ86c9XEGifpBCGN5/qWkQv9FcnRCqxj+jVq90peYa9GsasjpcfoJHUzvzsa
         pHv3DVgkzMvYGFJVAMoOfh3RfvXl21AOoAY/JMEUCyvX1UVxknbdOZz1i9VgtHKvRMil
         BBOGqyOyC+3wImkNNxQpcH5dRU5Sfwqp0FsDV9a+Ac8UpN0qs46WDESXnnxgIwnYPfE9
         Hy1DGEn0O0umjbw0he6daes25XfTW8kXViLyIo9wdskTPaemHCFlx3FLvmeVA9g4LW38
         Wj5g==
X-Forwarded-Encrypted: i=1; AJvYcCWxm5uwvSBR0rCe+g6eb7f1c4zEJSqww6LyF7NTuk+qfNDArpgUEXpQIaLbTRcp3eRlg+mrzvx1r5uElwzoRSS7Rv0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwYEVIBViAiw6FCspqr13OPtl5QOm2eYG98OS3rsqgXqGRCydnD
	4PoL/CDw0QTsargDZvyycDpCtSEqnJo68NU4yaWwoNMvPFE2Od7w7pcbraR6fwihhclXLDcKmVl
	1i9A//dCWi9eHIyp2ba8b++csd/A=
X-Google-Smtp-Source: AGHT+IEhm02uRCIuUeOk0F628qEXoFtAugKumzDkBBo5rF906ja8LbhR0krnpsVa6w+r0mlUR6asPzgVd+hS0JZ2djo=
X-Received: by 2002:a17:907:7b8f:b0:a7a:9144:e23b with SMTP id
 a640c23a62f3a-a991bd490b4mr1075281266b.19.1728227714081; Sun, 06 Oct 2024
 08:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240925144556.1451584-1-dmitry.baryshkov@linaro.org>
 <CAB2nKc_d33JRj7kLQju6SdB9OnnE37E82baQoj2nVPirsqnFOQ@mail.gmail.com> <CANPvuR=PVPxLbXD13WQ3YDxEFCtMGrEZv0ng1JkHS=FK5FPT_Q@mail.gmail.com>
In-Reply-To: <CANPvuR=PVPxLbXD13WQ3YDxEFCtMGrEZv0ng1JkHS=FK5FPT_Q@mail.gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Sun, 6 Oct 2024 17:15:02 +0200
Message-ID: <CALT56yOAdVUp-kfK2-sy=4-x2zeKk1D9qyeO++5qJfWOw5Zcng@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] libdevmapper: Inherit nopackages
To: Jose Quaresma <quaresma.jose@gmail.com>, Armin Kuster <akuster808@gmail.com>
Cc: vincent.prince.fr@gmail.com, openembedded-devel@lists.openembedded.org, 
	Peter Kjellerstedt <pkj@axis.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 15:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112680

Hello,

On Thu, 26 Sept 2024 at 12:13, Jose Quaresma <quaresma.jose@gmail.com> wrot=
e:
>
>
>
> Vincent Prince via lists.openembedded.org <vincent.prince.fr=3Dgmail.com@=
lists.openembedded.org> escreveu (quinta, 26/09/2024 =C3=A0(s) 10:49):
>>
>> Hello all,
>>
>> Any update on this backport patch? :)
>
>
> The patch is not yet on the staging tree but I believe it will be there s=
oon.
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/sc=
arthgap-nut
>
> but yes, this should be a priority given that the scarthgap recipe is bro=
ken.

And it still hasn't been merged. Armin, Khem, is there anything
delaying the patch from being applied?

>
> Jose
>
>>
>>
>> Best regards,
>> Vincent
>>
>> Le mer. 25 sept. 2024 =C3=A0 16:46, Dmitry Baryshkov via
>> lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org> a
>> =C3=A9crit :
>> >
>> > From: Peter Kjellerstedt <pkj@axis.com>
>> >
>> > This fixes errors from buildhistory changes where packages-split would
>> > be empty.
>> >
>> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > (cherry picked from commit 90f96e053ad3eefa7693d9748efdfbfa72d7dcfd)
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > ---
>> >
>> > The oe-core got commit c9e2a8fa2f03 ("buildhistory: Simplify intercept
>> > call sites and drop SSTATEPOSTINSTFUNC usage") backported to the
>> > scarthgap branch. Backport the fix for libdevmapper too.
>> >
>> > ---
>> >  meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb b/me=
ta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
>> > index be558ce1d218..3b4439c3ae06 100644
>> > --- a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
>> > +++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
>> > @@ -5,6 +5,8 @@ require lvm2.inc
>> >
>> >  DEPENDS +=3D "autoconf-archive-native"
>> >
>> > +inherit nopackages
>> > +
>> >  TARGET_CC_ARCH +=3D "${LDFLAGS}"
>> >
>> >  do_install() {
>> > --
>> > 2.39.5
>> >
>> >
>> >
>> >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#112515): https://lists.openembedded.org/g/openembedd=
ed-devel/message/112515
>> Mute This Topic: https://lists.openembedded.org/mt/108648856/5052612
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
quaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma



--=20
With best wishes
Dmitry

