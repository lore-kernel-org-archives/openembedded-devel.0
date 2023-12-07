Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F682C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 02:18:43 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.74145.1701915520011377635
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 18:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VvtY2iUe;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6d9d1962bbbso289943a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 18:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701915519; x=1702520319; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IW3BoLvcgydo8+vQe6JkS503gyTwHCUXAs0FFLKyrLQ=;
        b=VvtY2iUehCKHqsVo5p8kfZLvV5HKy6FjEr5ieLc4Yi/hWUuIaax2wI53tdMUYwtyYR
         F8ATY0TfnIp4bJdLXTclVJzQp+CEHmlx/+F+X+A9zKymCokK+rkQribyo7HVK2qwzEKw
         RNjufVRndp3pDRBdR2C0DNTvl31tHAAVLW2yhXCp+7AZKwVSOLjv5JEuTq8TLhhLx9LE
         DIJIWpdM0q8FhE+gjVnpvEoJzxe5F3yt4HEaSSwnP+sCxpIyQn4uCSVoPIQCST6cxlkb
         SvotKfelOWlaMntsVKCy6Z6Y4F+g4cL20SNlxcykQlgDFw8Vsm7tCtt8BluzCCqyWm/x
         6FWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701915519; x=1702520319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IW3BoLvcgydo8+vQe6JkS503gyTwHCUXAs0FFLKyrLQ=;
        b=L6npTDlkiHGl6fBrzq+FHiDIGutzzwcDiMYfPSWbCJJltOFDtvwVdrYs+ux5KjA7jt
         7lyX+2jEOAi4F6AXTo5+aF/7m99L5xaOAVCtcXVdlaAEDd80paaRIcFoxwAR+gyF1E4w
         UGpFH7j611rMeVvL6S+bWA6SEANkECZ5aNRyD9B2Bxi0ere7yfN1UsUdchPxVbMa2ERC
         94W7mGWqZEZvI+WLkmvOEX9rAy0xGTVIcZ6fM4uaNqJralM/y49PcKcyYEl+VqEHA5/b
         fNoO5Hh2xNw3naXYavBAt9noTcReRZDRqPl0ysoxuJ8Mkuh52WDo5eIQAMJhBkV7L+og
         obWA==
X-Gm-Message-State: AOJu0YyBj0PgK/cfQnrytF91LFuBtyIYMJuLR4BR9/L6Ygo7WBzeRowA
	ShiSHrTn/42mvnM1iVfHx6A4QZ5Ryc7eMldlHM1Tp/sR
X-Google-Smtp-Source: AGHT+IF/Jl4oIgzGqUnMVB/VAp1p8cIJODCU+AM4o1qBzrK4h6NZAXbLYOMRTN34s1CsANBofAJZdz7aWrtLUv2Tfcc=
X-Received: by 2002:a05:6870:2193:b0:1f5:ce81:c06 with SMTP id
 l19-20020a056870219300b001f5ce810c06mr1931862oae.46.1701915519034; Wed, 06
 Dec 2023 18:18:39 -0800 (PST)
MIME-Version: 1.0
References: <179DF70836C36579.24600@lists.openembedded.org> <d587fb36-527a-b31a-f412-8c296321bc67@windriver.com>
In-Reply-To: <d587fb36-527a-b31a-f412-8c296321bc67@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Dec 2023 18:18:12 -0800
Message-ID: <CAMKF1srz4O_kFTx-GiR6GucaG4dGvOomjrQn1qbfdzSbL5nGbA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-pyudev: provide native
To: Kai <kai.kang@windriver.com>
Cc: Kai Kang <kai.kang@eng.windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 02:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107269

On Wed, Dec 6, 2023 at 6:16=E2=80=AFPM Kai <kai.kang@windriver.com> wrote:
>
> On 12/5/23 22:50, Kai Kang wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > Add 'native' to BBCLASSEXTEND to provides python3-pyudev-native which i=
s
> > required by lvm2 when package config 'dbus' is enabled.
>
> Hi Khem,
>
> It seems this patch is still in branch master-next, but it has been
> dropped in the v2 review request.

yeah I know, but right now I can not access my machine, so it will be
dropped once I do.
Thanks for notifying me.

>
> Regards,
> Kai
>
>
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >   meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.=
bb b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
> > index 6fcf346bc..8bc3afdb5 100644
> > --- a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
> > @@ -20,3 +20,5 @@ RDEPENDS:${PN} =3D "\
> >       ${PYTHON_PN}-fcntl \
> >       libudev \
> >   "
> > +
> > +BBCLASSEXTEND =3D "native"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#107225): https://lists.openembedded.org/g/openembed=
ded-devel/message/107225
> > Mute This Topic: https://lists.openembedded.org/mt/102992734/3616933
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[kai.kang@eng.windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Kai Kang
> Wind River Linux
>

