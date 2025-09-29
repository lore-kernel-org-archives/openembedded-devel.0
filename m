Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32B7CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 18:26:53 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.5775.1759170411459953466
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 11:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cbN8Yjk4;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d60150590so50335857b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759170410; x=1759775210; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyW4pZoCQyW4NlFuWb8u0B3fHAG7dKBR5rLJ7Vvckrc=;
        b=cbN8Yjk4rDhBBPkrCH54O4zQwgFZiH57+FRvz6aktiBHQYmSWuZBVhnePmBBL2zdAl
         dFqRrr+QDQc0E28ynYSSUApZq4h4NwAbebeCrpGtOt3wJcCSOfX8EH+yZ+cde2Ci7ufK
         osF+lDyCrLvMsNxX/DRZA4WhnAzLbCtau/sokbBMXJJvp3mtSvhMV88bCrSYz0i+yrgw
         7Wp4VuITMLfiq6NZnb15c8ALiVJsw/ZQqS/f7T5nFjRCPlkzzUiKEmbIOBhApclcFSUa
         BPpT65H/QdI+n2sSRnhCi+zcG78bV89VvJXmivGq5Zp09OsSo72YFQYdedMEZgVgIRqA
         X7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170410; x=1759775210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyW4pZoCQyW4NlFuWb8u0B3fHAG7dKBR5rLJ7Vvckrc=;
        b=ZgNd0WkvWXvGPUqZ5MmMzX1oRNbgoxZd7Y4WjV9gu9t2ogIaFfbYgV4V6T4yV7XuPc
         MR7LlCFPP8h3lsw1xKrCouaCinIjc9fXsehirVDC4o5P4nli/WSIe6eucBc8bbwWA+MQ
         WCbSzU0AY1IFRibTvpQjDWBe7CzZ3gsgewS4JL8Z/VQWxsTxz5itXqhUHC8Els5SSYxN
         IYnsl0Uc757L8mur71R7z1OTdKjcCofGhxC32raFrBdk5HNTk+ceuMQczz4bEKNikReV
         AqXJXYoZUpcTNbJGYf6RUhyp+/ME53pTzhitUP/GAUZjlHqhOhrxVqqYTlgSeACgnqin
         j7Rw==
X-Gm-Message-State: AOJu0YzU9qzk7r+wyFD50Y3kqCzaejZiAVsQMH68sXVfYfwxSD+5jBMs
	4FdfzSZQ3qMc61Yq/ugeqmNjQq8wDFRiCDmr/ZZx/SCuytJg4rWcoFmCqn7n4kxNJ9qYevsRVk/
	ilfGyQWekMs9Nas+zgrqAoM3r0hq+aYI=
X-Gm-Gg: ASbGncsWivg8/ZOCyqYpdU9q5WpZot2eQdRoJzIDDwzbiTo8CUKRZZgvOsAWHcdSLxU
	zoX7x4w4o91g6K1Nei7zdCAf+fO78a1yDeWUw0ZWqrOfnsicAA34Y8HOqSATEEE/3/fkZMrf7M+
	T3X0tpreX+3eVu3np99wNsh8HObOhWhaEyb6a/ktr6oCC71pvokjmk51Qw+ggIYa1CZ0DTDtKCy
	MWf4WRCDTT1jq/hvFoLkvAASOs3HEkqBDwVE1Dk9C7DexDeyQPVeUsrOhFoUViwXxIPh8a50FQt
	YQBzr60VnzuJF7Wg0Fc0jcr5IgxAusDpo7zaP3IJV68MHY49DUw3Ql6OFJX4E55ygp7JicJolEx
	HHzXCa8U=
X-Google-Smtp-Source: AGHT+IHHe0oyVS14nA+EmgA5ybf++rCae+RuI6A7gkMyw4d/bff3GiYOgZWwMlytRE3dwx4G0kcK1FnyNcvDP8Jw+fQ=
X-Received: by 2002:a05:690e:165c:b0:636:d3c3:67de with SMTP id
 956f58d0204a3-636d3c36f60mr11805810d50.34.1759170410292; Mon, 29 Sep 2025
 11:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250929130425.2912077-1-skandigraun@gmail.com>
 <20250929130425.2912077-3-skandigraun@gmail.com> <CAMKF1sqK_wGaW0P6uy1b+OQ24dU6nQWcYjP2DmWr_CSEtWzcAw@mail.gmail.com>
 <c4dabd3b-17c0-46ad-83ae-3cb62e57eaa2@gmail.com>
In-Reply-To: <c4dabd3b-17c0-46ad-83ae-3cb62e57eaa2@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Sep 2025 11:26:23 -0700
X-Gm-Features: AS18NWBGniU3NKqZcL4jJbukh1HyYpL71H3iHt5D8VKduOT3v5pRhOT4YL-iSSw
Message-ID: <CAMKF1sopE+arK=xKt1g-U2DcyAXdOYBcTh1dC6kO_HEcPk44iA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][kirkstone][PATCH 02/22] lksctp-tools:
 upgrade 1.0.19 -> 1.0.20
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 18:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120044

On Mon, Sep 29, 2025 at 11:11=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
> On 9/29/25 18:55, Khem Raj wrote:
> > On Mon, Sep 29, 2025 at 6:05=E2=80=AFAM Gyorgy Sarvari via
> > lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> > wrote:
> >> From: Yi Zhao <yi.zhao@windriver.com>
> >>
> >> ChangeLog:
> >> https://github.com/sctp/lksctp-tools/blob/v1.0.20/ChangeLog
> >>
> >> Drop redundant variables LK_REL, SOLIBVERSION and SOLIBMAJORVERSION in
> >> recipe.
> >>
> >> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> (cherry picked from commit 162039c327f065d87730565b18fdc3986844a065)
> >>
> >> Adapted to Kirkstone.
> >>
> >> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >> ---
> >>  ...lksctp-tools_1.0.19.bb =3D> lksctp-tools_1.0.20.bb} | 12 +++------=
---
> >>  1 file changed, 3 insertions(+), 9 deletions(-)
> >>  rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0=
.19.bb =3D> lksctp-tools_1.0.20.bb} (80%)
> >>
> >> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools=
_1.0.19.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.=
20.bb
> >> similarity index 80%
> >> rename from meta-networking/recipes-support/lksctp-tools/lksctp-tools_=
1.0.19.bb
> >> rename to meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.=
0.20.bb
> >> index 4a9d2f54d9..51d9605624 100644
> >> --- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.19=
.bb
> >> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.20=
.bb
> >> @@ -8,10 +8,9 @@ LIC_FILES_CHKSUM =3D " \
> >>      file://COPYING;md5=3D0c56db0143f4f80c369ee3af7425af6e \
> >>  "
> >>
> >> -SRCREV =3D "05b50d379ff0037de4957bb2a1befcce88b70225"
> >> +SRCREV =3D "311fcdeb5cb41612d4be66b16f0f2ad6675a6af8"
> >>
> >>  PV .=3D "+git${SRCPV}"
> >> -LK_REL =3D "1.0.19"
> >>
> >>  SRC_URI =3D " \
> >>      git://github.com/sctp/lksctp-tools.git;branch=3Dmaster;protocol=
=3Dhttps \
> >> @@ -34,19 +33,14 @@ do_install_ptest () {
> >>      done
> >>  }
> >>
> >> -SOLIBVERSION=3D"${LK_REL}"
> >> -SOLIBMAJORVERSION=3D"1"
> >> -
> >>  PACKAGES =3D+ "${PN}-withsctp ${PN}-utils"
> >>
> >>  FILES:${PN} =3D " \
> >> -    ${libdir}/libsctp.so.${SOLIBVERSION} \
> >> -    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
> >> +    ${libdir}/libsctp.so.* \
> > do the versioned shared libs still follow same conventions as prior rel=
ease ?
>
> Yes, all the installed files are the same, only the .so version changed.

OK that makes it fine.

> If you feel this is too invasive on the recipe, I won't argue.

>
> >>  "
> >>
> >>  FILES:${PN}-withsctp =3D " \
> >> -    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBVERSION} \
> >> -    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
> >> +    ${libdir}/lksctp-tools/libwithsctp.so.* \
> >>  "
> >>
> >>  FILES:${PN}-dev +=3D " \
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#120015): https://lists.openembedded.org/g/openembe=
dded-devel/message/120015
> >> Mute This Topic: https://lists.openembedded.org/mt/115494436/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

