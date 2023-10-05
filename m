Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB61E936ED
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 02:23:51 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.6835.1696472629650907957
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 19:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GZqPrAZQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1dd1714b9b6so301688fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 19:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696472629; x=1697077429; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upORyzQMIGC0L7zCL4e5gp5E1k1Dmei0dVHP5dGzMRk=;
        b=GZqPrAZQt7Xq32Hzn5uV+QU79FqcarI8yAqNS7/fBycPKptV7mLzMjBUc+GWym1EP+
         5U+jDwjH2n21DIFyWO3KU2rr2g6Vuk+XnVK09MiIwWsy02NfDYwihnnDcFx8RJvi+4g/
         FgXr3mJGS3jTf1+ApW7PLrZuWjG+fnf+RCGzxwzTrTGEjzQ9ngBMTTLBD04/Lh1hC1Av
         OxT8LtAf9RPtE8Kg9oE/G8Mge5DW5Htquf/1D0d+nAioiCWYt4/Wb6cglBhzqDSu2Nmt
         BL2Nk74kpxBezuBWPDK5i2Kvh9FkeYcootIIzmT1TD//P4CIotnIklBc6LkaI3Hnc29l
         02zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696472629; x=1697077429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upORyzQMIGC0L7zCL4e5gp5E1k1Dmei0dVHP5dGzMRk=;
        b=Tf5Rk0R1SjjIWP/pmeljV0QQi+bpklpCOga56juc237rSiKxVBtu2KTmhD2DD2mVsH
         YW4RBRUBACU6Pol20NPwoKZ1+JLw2gtDmTZ399qG7xV36Tu9oaBpD6tXyeMiUNfOPbad
         oqNKNuhZDzbwHkqpgMIcxAy1TnEgXBoLQtmMgTqHyfEz3QxqZAzBW0yLlHiKC/RE2MEr
         /kPDnkQk+7EYR9tKKuo1jp699Fp0bxLC1J43/VlEozmDtiSV3xHThP4mcU9Azamjb67C
         EoYTEgWO0LroSB5zpkO6QCK7KZ+TDRKz/8k7ARZcHMD9f8YfbLkc/GdcsQdH4+tTkouR
         9PEA==
X-Gm-Message-State: AOJu0YxL0v/hv5r3PZUhROp5FSCAgeEEepSaaRYi5JdQeXgQH9LJAQXy
	9YEr3XbthSuXs4MfAABDfpcdHiAoLr9y9MYnCE8=
X-Google-Smtp-Source: AGHT+IFTXOHxeHwKyV/2kxe12Pmvw1VqgcYAJEm0EXrjOkHrjojhe064cWhgoGRXo9QRjHxMbuprIL+JVXY1x2dCoLs=
X-Received: by 2002:a05:6870:a448:b0:1c8:baa5:a50f with SMTP id
 n8-20020a056870a44800b001c8baa5a50fmr4487429oal.27.1696472628509; Wed, 04 Oct
 2023 19:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231003205747.84389-1-marex@denx.de> <CAMKF1sq3B8kq+dT1WMobwya_eVWOi_BTjB2xs5SvVjYGU70iKQ@mail.gmail.com>
 <CAMKF1soGNbjnWqiZr9xT0YoWO3jj-kJE=sncUvgnxO0+Un=9wg@mail.gmail.com> <6dca63d7-cd19-42d9-a013-1d2642e60ad6@denx.de>
In-Reply-To: <6dca63d7-cd19-42d9-a013-1d2642e60ad6@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Oct 2023 19:23:21 -0700
Message-ID: <CAMKF1sox6LVJTrcjuDjDzP324qVgYpn6n2NE4vNd+viAUnTo4Q@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] faad2: Upgrade 2.10.0 -> 2.10.1
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 02:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105348

On Wed, Oct 4, 2023 at 7:22=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 10/5/23 00:36, Khem Raj wrote:
> > I looked at the changes in master since 2.10 and most of them are
> > bugfixes, but one big change is switch away from autotools to cmake
> > so it might be worth to get all fixes and switch to cmake in recipe
> > for master instead of trying to fix the dependency issues to generate
> > faad.h
> > since we run autoreconf this might be messing up with bootstrap code
> > of this package.
>
> I also noticed that 2.11 is about to be released, so I'll send 2.11 with
> cmake when its out.

sounds good. here is patch I was playing with :)
https://snips.sh/f/jbQFo4Oitx

