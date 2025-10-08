Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A67BCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 16:01:40 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.web10.1342.1759939291294621963
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 09:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PSLcQTJg;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6353f2937f3so57565d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 09:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759939290; x=1760544090; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SXG4RMxwREtknuBU1ZwExmk4PPseFl8hWRKd24F8JA=;
        b=PSLcQTJgcxkuTEEZtOMEzaE1WEL9rVxyVdcQ2OarCpVI/4dJxzrKorFt7+iuQsXuts
         uP8Yb+sHV7ESi/MhX+K57TTkx7dWZ3fAmqyAroGxI41lp7RdtG9qgNZsGZxSeGWPzdkz
         ua3UGfCMN/BHYbZLX/AZfmb2kFXxszQdq0L/SPmFpra3Z2tbHpW6iFj8C1KgJtoT37tS
         mCEcTDUAr1sfTrJwb6LZ/qthYtySu9MyHTJkhgiV3NSOuB01D9bd3/30yEZjbWxeI5Yp
         IAkl0edsDhkXtIqgvY+Ei4xsoMpjvdr2A60qDRUnqjYXcGN596Tm6JLepH8uI1F34eGp
         26wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759939290; x=1760544090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SXG4RMxwREtknuBU1ZwExmk4PPseFl8hWRKd24F8JA=;
        b=Ro8B41NvRhubLCtvwWIQWY8vOGtDcqMhhtixNJpsI8R4n/QSU+ZtPlU4ZQIDtyqBzi
         ut2V9JGzsSu+7V3CI/D6DT/UBL0bdDXv2icK4jgWJHP4S492tj0O4xi107t4iENTG30T
         Ejbxf6bHeqBndqKwAqEnwS7CzPR6x34kFkpthVf8xZ8iYDkxyYSvetII7hU0hDwS2LRN
         8PDmHP5X4Yn4OqiPMSTRZWkPZU0tsJMUmRSpPvAeSTei0//gggKmy4SWYU+UBDFrK1Vu
         I5od9qFXEkHloZkcOGK/g4+UFvQ9TJxndB0djcGZNGs3Xj/uSkZEP0A3nOeVGjms2I/T
         Tl0g==
X-Gm-Message-State: AOJu0YzYYE295hMqdurnYFzRaH+aVbuKQ8E8ET7v90/Uphudf5INNS++
	l34FfcVjwqBbKshx4g3kkiVcjhnoz6+M6GkFPV6cAadYsAha6gF3Y6MrWTgBRtLwTBX2/DmJhFp
	9Atxkzw198ozxcB/JAomrdUy6QG+mvaw=
X-Gm-Gg: ASbGncvrYY2dN4N1AZh3odwCzNsTR7Dt2DVK0K1fTYYLK2OhtiE7fiEd1fOy7TQAg+r
	9lumRtx8Ik1HoYHIhk+HxoyyeaQeazOVFdq1QYoTXxrPFYqk/iRtk/RjLXmYAjs1Hry0CfNH6vc
	8vM99IemStULhnzgJujqkNiqOklSRTZTFNruKwdpaRXR3suVXuGIIgQxxd6WvqYSEkOiN96rrWo
	wFiUYMlh5YjleDkz9p1GA5IK9z3Bj2x5xxv9I6iEAMXD1+sV1/prVCJC5QrerkYOzlMVvVaKvCg
	SM+hrYPowOx2in5CoeadIIbEGYVcXig+XQgd3JXPATqFUe68ZD603dh3UtSEWtC2KaNHUdZfKYb
	AsQ7XojU4vunwFk23
X-Google-Smtp-Source: AGHT+IFp8zUdptzIMmdbm2s7sqc0YU//30wVjatj6Yu2OgbI/ca+4uQYy/qPrA70C9piI4KrJy+pvje5TgXlJGmskj0=
X-Received: by 2002:a53:dac1:0:b0:636:5ea:a886 with SMTP id
 956f58d0204a3-63ccb93dbabmr2890552d50.47.1759939290235; Wed, 08 Oct 2025
 09:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251008093609.2094597-1-leon.anavi@konsulko.com>
 <20251008093609.2094597-2-leon.anavi@konsulko.com> <CAMKF1srk=4g3qn0dGcSoDe1KA-SqwZNPaZ7Z2NRsrHSm0Rn4+Q@mail.gmail.com>
In-Reply-To: <CAMKF1srk=4g3qn0dGcSoDe1KA-SqwZNPaZ7Z2NRsrHSm0Rn4+Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Oct 2025 09:01:03 -0700
X-Gm-Features: AS18NWAAnEICuuFhKApgczCKyCpTxNjSPk-gZLCX4lXKRMN5UCbV5PkItWscPls
Message-ID: <CAMKF1sr2jbDCgSFyEKiWHbKQoXqG+Q=AZfLhWCexDaa5j0rFPw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-xxhash: Upgrade 3.5.0 -> 3.6.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 16:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120373

On Wed, Oct 8, 2025 at 8:59=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Oct 8, 2025 at 2:36=E2=80=AFAM Leon Anavi via lists.openembedded.=
org
> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
> >
> > Upgrade to release 3.6.0:
> >
> > - Build wheels for Python 3.14
> > - Python free-threading support
> > - Typing: Use Buffer type stubs
> > - Deprecate xxhash.VERSION_TUPLE, it will be removed in the next
> >   major release
> >
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >  .../{python3-xxhash_3.5.0.bb =3D> python3-xxhash_3.6.0.bb}      | 4 ++=
--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python3-xxhash_3.5.0.bb =
=3D> python3-xxhash_3.6.0.bb} (74%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.5.0.b=
b b/meta-python/recipes-devtools/python/python3-xxhash_3.6.0.bb
> > similarity index 74%
> > rename from meta-python/recipes-devtools/python/python3-xxhash_3.5.0.bb
> > rename to meta-python/recipes-devtools/python/python3-xxhash_3.6.0.bb
> > index bfa14012d0..c62595c4d1 100644
> > --- a/meta-python/recipes-devtools/python/python3-xxhash_3.5.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-xxhash_3.6.0.bb
> > @@ -1,11 +1,11 @@
> >  SUMMARY =3D "xxhash is a Python binding for the xxHash library by Yann=
 Collet."
> >  SECTION =3D "devel/python"
> >  LICENSE =3D "BSD-2-Clause"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3a9dab7f159514231249aa3e108=
ab26b"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D82f3295151c5e61043a4a201c03=
1a5ee"
> >
>
> What caused it? Please document some details on commit message under
> License-Update tag

I do see v2 with this addressed nm.

>
> >  DEPENDS +=3D "python3-setuptools-scm-native"
> >
> > -SRC_URI[sha256sum] =3D "84f2caddf951c9cbf8dc2e22a89d4ccf5d86391ac6418f=
e81e3c67d0cf60b45f"
> > +SRC_URI[sha256sum] =3D "f0162a78b13a0d7617b2845b90c763339d1f1d82bb04a4=
b07f4ab535cc5e05d6"
> >
> >  SRC_URI +=3D " \
> >      file://run-ptest \
> > --
> > 2.47.3
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#120359): https://lists.openembedded.org/g/openembed=
ded-devel/message/120359
> > Mute This Topic: https://lists.openembedded.org/mt/115651203/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

