Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06ABEB64CC
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 15:44:38 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.10235.1725723874333290300
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Sep 2024 08:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D3CX0aaf;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f75f116d11so2859711fa.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 08:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725723872; x=1726328672; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+t9TOjsyt2/UhE35yCKVOgehiBpFUZGxC16rrkedVI=;
        b=D3CX0aafU/6HjRRYjt4QP3URurQfuPuX+IYgDTTeRYUf5w3fBgbxivsrkvOr0cXxU7
         jOHwVNPXYfJNsN4UlnVFwZgGnFr+Vn6a6uKxApzcwPVsYpv2JC9sZq7WbaFVvC56vCMd
         mjU1IbJQYRz/uXJitRiykb08OmSDJ+t2eO333nTnw3UeT+dTXHrkyjYeLxGiU0NV38ME
         Jnofn0uITam9ut79G32c3A4t9rCc5TSj2U3/d/kNCKthUG/FCt+cD/7b851rD+kqM8BF
         zGnRxISKdTd78SFvtWu/vaKM9LSJr0L2I72ga8lOceSFvgF+U1cL/1AM51QM+9ibt7iO
         6yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725723872; x=1726328672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+t9TOjsyt2/UhE35yCKVOgehiBpFUZGxC16rrkedVI=;
        b=b1raJdMg34LjeJ+PRzgS/q0TzDuWWuk7IFFBlBLemzR27zpNrOQo/QfIy5BI9Cceyq
         Nmw8kKs+PNHKI6EhKtuVpyc7t3lrth+HVYyGuUbLy4iILZlrnzdxp0bQ/9Wsp+zEGxMR
         kOJ34swGfEK3OJ9kNDt39F2hhX6vMuEZ1S2N1lgV9jZPPi/DCx3OztRtP/Y2/Z2VQU2W
         vwc/UqBy6L4NR2O/v3KCctMsL+WCCaR1/CQ+gTtWWEYGGChHqZu/XcnuZ3+ItDU6h8Ta
         LwrK8QLmZgCVFocFjTMAgkFoqB+witSf/AyVthY0qRhzeBqEu1wKP2ctt7ATtJQJOrjj
         Vd4g==
X-Forwarded-Encrypted: i=1; AJvYcCXLLEjfnMkIdeZ0CtZidiETRBNhE9hnHQEgBb0APKDYSB2nb1fWRJrm06CYtkESwIpsfRhleNe4w15J1hTKkfQk8CI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzHHRlanudGpLyX+c2TF8tbUIzWhP9K2Er6cAUxu53qpkToEWwU
	UZxLp8apqA+xgWJuc5427vQr3DHvgF55z6PpUvfxjfi8qYnjAIdSn1RpQt8mJ0jOVM/F9rtTQh7
	s6Ku5ZeujHH1l1Ni4VLxwtiQd4dk=
X-Google-Smtp-Source: AGHT+IF4NXY8NMwrxzwttS+WxpNKBhLSZQ/gnUvd6juNgVcmGpXTINl0hOwWxu+ljaYI4B8BKOc8srG3MYnM6Sbo49Y=
X-Received: by 2002:a2e:a983:0:b0:2f4:f22c:53d5 with SMTP id
 38308e7fff4ca-2f751eaef5dmr47334961fa.8.1725723871462; Sat, 07 Sep 2024
 08:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240907083446.80928-1-f_l_k@t-online.de> <CAMKF1sqt1BZt_frP-rbPVFzKz4QCo9LrTFVxHsRR9Kp1MjE+qA@mail.gmail.com>
In-Reply-To: <CAMKF1sqt1BZt_frP-rbPVFzKz4QCo9LrTFVxHsRR9Kp1MjE+qA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 7 Sep 2024 17:44:19 +0200
Message-ID: <CA+chaQdHMh6W920EHbHvE4UfrfDAacWS6C_4X8gsU=mahrkFAQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] iwd: use internal ell
To: raj.khem@gmail.com
Cc: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 15:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112115

At least ofono in oe-core is using ell by default
https://git.openembedded.org/openembedded-core/tree/meta/recipes-connectivi=
ty/ofono/ofono_2.10.bb

explicitly the external on (from oe-core) since
https://git.openembedded.org/openembedded-core/commit/meta/recipes-connecti=
vity/ofono?id=3D3683f524dc60325b3f3b1bc3a32e70a41064ae03

On Sat, Sep 7, 2024 at 5:24=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Sat, Sep 7, 2024 at 1:33=E2=80=AFAM Markus Volk via lists.openembedded=
.org
> <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
> >
> > iwd and ell need to be updated in sync. This is regularly neglected.
> > Also the fact that they reside in different layers compicates the updat=
e process.
> >
>
> yes this has happened in past as well.
>
> > Beside iwd, there are not a lot of consumers for ell.
> >
>
> if this is the case then, I would like to suggest that either iwd moves t=
o core
> or ell moves out of core into meta-oe next to iwd. I think ideally it
> can be deleted
> but there might be other consumers of ell outside of meta-openembedded
> layers and core
>
> > Building with internal ell makes iwd updates easier
> >
>
> Building with internal ell is fine if its not generating duplicate
> copies of ell artifacts. Can you confirm what happens when
> switching between internal and external ell ?
>
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  meta-oe/recipes-connectivity/iwd/iwd_2.20.bb | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.20.bb b/meta-oe/rec=
ipes-connectivity/iwd/iwd_2.20.bb
> > index ffdab0260..16d900ddc 100644
> > --- a/meta-oe/recipes-connectivity/iwd/iwd_2.20.bb
> > +++ b/meta-oe/recipes-connectivity/iwd/iwd_2.20.bb
> > @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://iwd.wiki.kernel.org/"
> >  LICENSE =3D "LGPL-2.1-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb504b67c50331fc78734fed90f=
b0e09"
> >
> > -DEPENDS =3D "ell"
> > +DEPENDS =3D "dbus"
> >
> >  SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.t=
ar.xz \
> >             file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-=
for-e.patch \
> > @@ -24,8 +24,6 @@ PACKAGECONFIG[wired] =3D "--enable-wired,--disable-wi=
red"
> >  PACKAGECONFIG[ofono] =3D "--enable-ofono,--disable-ofono"
> >  PACKAGECONFIG[systemd] =3D "--with-systemd-unitdir=3D${systemd_system_=
unitdir},--disable-systemd-service,systemd"
> >
> > -EXTRA_OECONF =3D "--enable-external-ell"
> > -
> >  SYSTEMD_SERVICE:${PN} =3D " \
> >      iwd.service \
> >      ${@bb.utils.contains('PACKAGECONFIG', 'wired', 'ead.service', '', =
d)} \
> > --
> > 2.46.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112114): https://lists.openembedded.org/g/openembedde=
d-devel/message/112114
> Mute This Topic: https://lists.openembedded.org/mt/108319324/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

