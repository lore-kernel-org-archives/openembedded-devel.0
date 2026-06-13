Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9049CD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 11:21:32 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89366.1781349691185998705
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 04:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gDcDKaii;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4865e953031so2291205b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 04:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781349690; cv=none;
        d=google.com; s=arc-20240605;
        b=Pli/7GBxJOhLsHGbedLgD6U3DIluj4gx9R/c1z6ojZJ2YZzi4nSNpwcNxeUVofHrmd
         SB7q9hNDSEG1ZW8YDW28Vycm7iKKKR+0v0NOb8Co4GlS6GfiVWb/5RyvNthlwcpi+95c
         NNI9e7rbYd8NxWBDR8bCpH2AFWCZSNDqhB77FDHM9xTwaMEskPUMJo4zo2V0UJNJgcDf
         2QinDiDff7IrtSwbgEBVJTnn3fmMOK2Y+lvukDQuOqQ8czoeydBgYrOiWVeaZ3ETl3wB
         lYLHVQ9FsUQj6WHa/TZl21qyyFd5tRwDHFKQz6UTOOTPYuKEgrHMdsK7cNXPmOa0IsWV
         wEXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qSILECE378wLhWxL1RJlFUQLaaar0/hj5LH7d4HnR54=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=kB+QZPC7BcImR+7p/lf2VDyHPmFfNwwqmgBFSXHQS1DfSmwP82iQTPJg5Ro9DCSQ7U
         b42csmgVasUY8kQMp0/MX2iTnVR1lbq2wA7uta5a2OLqrBAZvB9J3beIWDir43L90vQW
         Z1NVZJItj+VTahHvvUQHtb3bxC49tlABBbJY60/7AS0WyEjOGcH6FPTEddu6FkDcc13U
         s91vdgLoA73LuARlFfHtU73ZM1ss35HRqV5h046TeCTZy4ObHets5cPxDCv54+mJtMuQ
         vC/RFN3Rlm9cc/BEHT1D9X1PyqH70RpLcE5rDmpL6/kogZyptxFveaSAQ2NAkaOA/rhB
         H0mw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781349690; x=1781954490; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSILECE378wLhWxL1RJlFUQLaaar0/hj5LH7d4HnR54=;
        b=gDcDKaiipCP7qXLs9QO2PePpWWygQ7VKf7LLouq5Uh4/6s5p+t/QfZR+aThk66rB/G
         jRJgfreQFZNRNeKJYKIcxd+Pq8CSV0sqgyezwwk+mUTU6XhlkpR9Tesa7gIoVGiSY8Od
         y3FMyWhhHQtb5HA21LBhBeoTSTiqWpbsCeY5W7sb8heBYcAda7VTBhJ8f7DyZx+PpwoO
         vk6jpnY8Gk693VmMSSy+CyhUcyJ+sgLR7sIG7tTfNONaJux7JPhLircAnZxOtMDZcQOq
         4wr5Y5PNgXNEBQ65mEPvwGlKZ4mNYwl5aAWM3Gz3hHERLCWn29e+Y9ANlh4GF76vsTwJ
         tUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781349690; x=1781954490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qSILECE378wLhWxL1RJlFUQLaaar0/hj5LH7d4HnR54=;
        b=YI6KnCrKBM2K1LXTdUlCJWsIigOaZFJm14/4eu0MaoowfH8lvOoR0mU5McvfGUNGF/
         Y2eciW3ghdB6t7kR3ApbFwQmsBvq8jzZehuTC0a5U4ffkSD/pVgcNZontD6UHiXvWNs7
         bPXXo1nkfSWUm1F3jtuY2Ey6pwV+n/lY8mPV3CGM55q6fVeGr/FAgXxoNrMIrVJmIEXD
         D7ZyQjrTTXG5vJz+E7HQlsCUDwseOCUXCS8uz/ReYpJ/X5rCS2AoagVudxFLwZmcCTsN
         PFlEGPQu9OZAWovrxQ3ibmx/9UhRwnkc89xYBGWxsghJKPbQ6MVHOki8l/MDizAWJmXm
         vi8A==
X-Gm-Message-State: AOJu0YzYfseavYp9yuNqkZvg2HjlTmcjUhSQsuX+RYB6Uwa/LFb5sz2b
	FAgPhYH7Ps5HCVvA+TK7Nmaj5IUuiERjOP+PtLI+GWvrWPMaBaBjW2bjBBV6WA2ibXf9B1fbhHS
	a2mEv3jBuad/aYaugnlRuPHhgH7JuERc=
X-Gm-Gg: Acq92OE8iBWBlLs8P0Wj20zv3pBbP4D43LKvoEMAupo/9qfXdwWqbekTg2xDE2j4SST
	tt6qajKxEn39bL+YtCn6jpJQhsj3CbuNYE3xZIEl8DaBlS1U3PUojaMKVLPOBK+r759zqdhCGcd
	V/KTGFSywW4sEKfQA/yXsGgx2bJ49Jra2yvohIaQI4vLcDqeg59cGCBr0QhbGGm/maDMgrNXpwa
	wrAWosZxXKH8j8PQtIWOv2AAy5SS9f1rysucCXT3zvu1IoepA/KEKnrQguQXAicPBsWFIaNcQec
	My1XLWhSWQ==
X-Received: by 2002:a05:6808:2221:b0:485:29c3:3269 with SMTP id
 5614622812f47-48731451d8cmr3344879b6e.21.1781349690349; Sat, 13 Jun 2026
 04:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260603094207.218632-1-ankur.tyagi85@gmail.com>
 <20260603094207.218632-3-ankur.tyagi85@gmail.com> <CA+s=J=z5HK7CL31TbiLyGWzFtCXmyHUNA2JhsH=DXtG44gwSEQ@mail.gmail.com>
In-Reply-To: <CA+s=J=z5HK7CL31TbiLyGWzFtCXmyHUNA2JhsH=DXtG44gwSEQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 13 Jun 2026 23:21:19 +1200
X-Gm-Features: AVVi8CfvXX-2LFwPZxXDlu5OF1WRujxjaYlHsfnZBZpZL_hycUgS4hmtavtxFjo
Message-ID: <CADySD0EguJp0ry=jcswkFBRZEDDvj1Dkg5QKDWS8vniwrZsoUA@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 3/3] redis: upgrade 7.2.12 -> 7.2.14
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 11:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127569

On Tue, Jun 9, 2026 at 5:54=E2=80=AFPM Anuj Mittal <anuj.mittal@oss.qualcom=
m.com> wrote:
>
> On Wed, Jun 3, 2026 at 5:42=E2=80=AFPM Ankur Tyagi via lists.openembedded=
.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Bug and security fix release
> > https://github.com/redis/redis/releases/tag/7.2.13
> > https://github.com/redis/redis/releases/tag/7.2.14
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../0001-hiredis-use-default-CC-if-it-is-set.patch              | 0
> >  ...2-lua-update-Makefile-to-use-environment-build-setting.patch | 0
> >  .../0003-hack-to-force-use-of-libc-malloc.patch                 | 0
> >  .../0004-src-Do-not-reset-FINAL_LIBS.patch                      | 0
> >  ...05-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 0
> >  .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
> >  .../redis/{redis-7.2.12 =3D> redis-7.2.14}/init-redis-server      | 0
> >  .../redis/{redis-7.2.12 =3D> redis-7.2.14}/redis.conf             | 0
> >  .../redis/{redis-7.2.12 =3D> redis-7.2.14}/redis.service          | 0
> >  .../recipes-extended/redis/{redis_7.2.12.bb =3D> redis_7.2.14.bb} | 2 =
+-
>
> This fails with patch fuzz errors:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1546
>
Hi Anuj,

I am unable to reproduce this error.

> Thanks,
>
> Anuj

