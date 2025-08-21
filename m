Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AC1CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 20:15:37 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.508.1755807334396886982
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 13:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GmkPoQMU;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e94f7232b30so1502228276.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 13:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755807333; x=1756412133; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbS0xg3gt5Zf/l31nTn8aAWgEQt6Fptr2515c3vsLgw=;
        b=GmkPoQMUrKYp6AMtdkLAeK8p2zbQBzxJ9CzDDRQDmL7/YILXFYLWaM4AKhhjrxbCCq
         elsLQoDHwZYN9wS2vFnmsAke35yva8quh8bPH435dVB0EZ5AiYlzIVsIOhZjlVu30f7W
         918IHuUAuwTLoizy8XPCMqkbUX07vZ+/9utFSxf3Tg/09UxOROa76lXBHraGiibi8OxF
         Ij8/9x473ioxVHtfNVSsuf+I6blcIDSUpfSQ44u87+PZGGlz6VQeRgDInL0Rw6bovAsG
         l5YaTWHGzoOCDuLaqm/5KEoey19/MSF6mbObLk0ttlMfdi/XX9Rff+CiZ71olgPVBvqK
         EM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755807333; x=1756412133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbS0xg3gt5Zf/l31nTn8aAWgEQt6Fptr2515c3vsLgw=;
        b=NEpVmm/slbWkAuYM26Tb/kFnJ9cWSiYBOMi2ltvy2uSNXp4zELb8r6W9ntOlxH+CNv
         ooq0PjjpUCPOEWKR20ZQIgct2qTOgZB+HF9ClkFCJ3uv47VoWLsYo/EmJ9ec6j+r3JIw
         Y0x8fUyKgicK+/ALOg6wmmgAOfXJQ3JAUHDQVkzfA0PQl5OovewtIIFxOHvaMHLIBTdg
         o46QdFT1Nk6vthvDeC2S9njZeUddMo+jap3KNeiCvLC9cbvQEz2qTgQqvpgAdLH4JKSf
         IKzohDzj/0hd3guRYGIveclPh6CxE7Pgbkev0iETWNfixGh83hKntKXIB1v5IhUCz91x
         KczA==
X-Gm-Message-State: AOJu0YwZMm3m/U/FSD2MAz5oiV5J6ACtIMEiqja5eDUZAVhPNaQR4Oae
	DWgsIxiK7lvE3vKw7LvpSLi4W9ASs/yI+St1PGQxjm32/5FJ8r1EHCXOEfwTtEG5Jozktk6BCuD
	CtWEwqyt71kCTX3xF+RNY2TnYbdGcOJU=
X-Gm-Gg: ASbGncuQ1sQ7HFX9HgnHXfFAyHB9+20q5qe+PGEpTi2jcvkxjBE+B+j8vAAZqnTp9u5
	XTKg2A9Nn2D5TLgNJqjS8OZq0z/X7c0lDFBiZXXU5U5f6tNLE72sd7Oxx5Gsvb0JYB9a3qSLRgT
	xTqiUEEExgzuLScy+cAfCfDdxn83S3NhvSsqtWWXk2m3G1ib9kTCdUZx3K8kGJod0qjsfcmL0rb
	mOOUcUypTj3Gki0cIkPW9mTQPDNufoLzz7RSqb0mwJMrJY=
X-Google-Smtp-Source: AGHT+IG5CjxNmd1sgBj4YI6xJb/uPTHmS2MtnfaDgMRYAht/FBjPXt6vwCJSgNk0IaohPyELa90RiAu2o0tDj4i07g4=
X-Received: by 2002:a05:6902:1506:b0:e87:b880:7dee with SMTP id
 3f1490d57ef6-e951c22463dmr1137824276.12.1755807333334; Thu, 21 Aug 2025
 13:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250821085954.2056-1-wangmy@fujitsu.com> <20250821085954.2056-7-wangmy@fujitsu.com>
 <CAMKF1spcbKy9N-gH9PP+YPLH6rU48pOvq1ewzLvfY0EpPKPRvg@mail.gmail.com>
In-Reply-To: <CAMKF1spcbKy9N-gH9PP+YPLH6rU48pOvq1ewzLvfY0EpPKPRvg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Aug 2025 13:15:07 -0700
X-Gm-Features: Ac12FXwvUPY06iYVLlYGcgB4AhAK4wNB3HqZezf_ialPt_EZecZrO0fLFFBpGz0
Message-ID: <CAMKF1sqMYP51t9TSBYQRfPKTZjCC=7LmtCm+onS66gQavV1mRg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 07/21] python3-multidict: upgrade 6.6.3
 -> 6.6.4
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 20:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119082

it also fails ptests

{'python3-multidict': ['tests/test_leaks.py:test_leak[multidict_pop.py]']}

On Thu, Aug 21, 2025 at 11:16=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> On Thu, Aug 21, 2025 at 2:00=E2=80=AFAM wangmy via lists.openembedded.org
> <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../{python3-multidict_6.6.3.bb =3D> python3-multidict_6.6.4.bb}  | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-python/recipes-devtools/python/{python3-multidict_6.6.3.bb=
 =3D> python3-multidict_6.6.4.bb} (91%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.6.=
3.bb b/meta-python/recipes-devtools/python/python3-multidict_6.6.4.bb
> > similarity index 91%
> > rename from meta-python/recipes-devtools/python/python3-multidict_6.6.3=
.bb
> > rename to meta-python/recipes-devtools/python/python3-multidict_6.6.4.b=
b
> > index 5b262ed933..dad669fd9c 100644
> > --- a/meta-python/recipes-devtools/python/python3-multidict_6.6.3.bb
> > +++ b/meta-python/recipes-devtools/python/python3-multidict_6.6.4.bb
> > @@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-=
pytest
> >
> >  PV .=3D "+git"
>
> do we still need to keep appending +git to PV ?
> >
> > -SRCREV =3D "dbd686f37c1bc14355dce9c16dbbfae82f11dc00"
> > +SRCREV =3D "e0e61c28e9f66efcdce01cde9d6772518f6e9224"
> >  PYPI_SRC_URI =3D "git://github.com/aio-libs/multidict;branch=3Dmaster;=
protocol=3Dhttps"
> >  S =3D "${UNPACKDIR}/python3-multidict-${PV}"
> >
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#119057): https://lists.openembedded.org/g/openembed=
ded-devel/message/119057
> > Mute This Topic: https://lists.openembedded.org/mt/114814437/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

