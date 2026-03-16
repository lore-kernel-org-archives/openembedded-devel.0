Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E87EF013D2
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 08:37:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46037.1773650164869395313
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 01:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fRpUv6P4;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0743A60008
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3CFC19424
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773649635;
	bh=LxVB52LWYPR3JjlsXJhOCVdhfgjOZLNNGwKXa9l2258=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fRpUv6P4hpBNo8thekIALMrnQka5hEyoqH8RHd5zJIu1ig/5QKJX79paQgqiLE0GB
	 6s1U48SG9In+eLgGjawPlNKC7rtR19D7MXfkFiVlxrDQT11ps84jx+DtYQ3BrNi+oP
	 48pBcZWFexvqWkYFPMnssW4CZlQ0ATw79V16KAhSaXVQwsKVqRtzP7jywhPhAhVv7G
	 RgJItnnywxkWss6TOHZDKmdpXN8teq06qM9ogu+rOIYFt03o3UilH6eYl8PLTWWVy2
	 ceqW5kiRS2w071zduuYnEuXLtuHpawh2K5Rh1pRXS+xX9zSFweCzu1dUw2dWvbOtKk
	 6w5xIpF7ys9PA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a1282bc6aaso4627518e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 01:27:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUUh3I1zzRmlOd7wlzv1AwLv+2VFIX1UCIeVBz0W9S8gui9/aXIpigWANnaAPM1qPC2yqnGaPYr50HUgHpgtr2yA8=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz5Q+t846VAfv+KB3mH7yAcY3yfVEldYX1i4qSBgin9GCSUaGvV
	B5oS3TQWwzaWkL2BLfqu0+HvX2siL5sl5pCXaHSucXQxV2iqU+O+uLTdWTqWm1f62njLPbZKiz9
	ZbX1dd13V1qYbq3QnY8vE2Q2bWfhlqmPMI7XBsChrhA==
X-Received: by 2002:ac2:50a5:0:b0:5a1:1496:920 with SMTP id
 2adb3069b0e04-5a162b124bamr3227193e87.26.1773649634349; Mon, 16 Mar 2026
 01:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260311122452.6142-1-bartosz.golaszewski@oss.qualcomm.com> <8c602fe5-db78-44ee-ba39-2866808f3e00@gmail.com>
In-Reply-To: <8c602fe5-db78-44ee-ba39-2866808f3e00@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 16 Mar 2026 09:27:01 +0100
X-Gmail-Original-Message-ID: <CAMRc=McvwkBbNfbPv2YDTT0eYQ9aA2A7n5uJeb8-QwJcXhwZDg@mail.gmail.com>
X-Gm-Features: AaiRm53d9JklNo4olckrtjH8boVT2O3SC_6lt-hL9zMjElOWZtFG_zpidPo_FpY
Message-ID: <CAMRc=McvwkBbNfbPv2YDTT0eYQ9aA2A7n5uJeb8-QwJcXhwZDg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-gpiod: update to v2.4.1
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: bartosz.golaszewski@oss.qualcomm.com, Khem Raj <raj.khem@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125257

On Sat, Mar 14, 2026 at 9:14=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> On 3/11/26 13:24, Bartosz Golaszewski via lists.openembedded.org wrote:
> > Bug-fix release addressing a memory leak and a couple minor issues.
> >
> > We now ship the license file with the dist tarball so update the recipe
> > for that as well.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >  .../python/{python3-gpiod_2.4.0.bb =3D> python3-gpiod_2.4.1.bb} | 4 ++=
--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python3-gpiod_2.4.0.bb =3D=
> python3-gpiod_2.4.1.bb} (86%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb=
 b/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
> > similarity index 86%
> > rename from meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
> > rename to meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
> > index 405951fe0c..986146dd5c 100644
> > --- a/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
> > +++ b/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
> > @@ -3,11 +3,11 @@ SUMMARY =3D "Python bindings for libgpiod."
> >  LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
> >  # The actual license files live in the upstream libgpiod from which th=
e pypi
> >  # package is spun out.
>
>
> Nitpick: I guess the above comment became outdated with this update, and
> can be removed.
>

Yes and also I think we can limit LICENSE to only list LGPL-2.1 as the
other two cover tests, examples and text files so the core module is
covered by LGPL-2.1 exclusively.

Bart

