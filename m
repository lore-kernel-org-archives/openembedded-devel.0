Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98699C0218F
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 08:49:56 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.111587.1738658989569260207
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 04 Feb 2025 00:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=o6V+CwEF;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.41, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so4596840e87.3
        for <Openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 00:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738658987; x=1739263787; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJgTbzgXLQQM2WPjy2cgmYFy+8vn9/zKsy7KV/C9L/U=;
        b=o6V+CwEF9PlGEroqFuzPAq4z3f1Mt7NMHb6aTQuUrlC4QIUA47UV1kV3XeVLvyahK6
         7KKy5847Z8opXVTDxK3m1Gei6BVrrGhsNb9VYpGKUnLtWbdml8dG/f6s9GpCVLNh2oDJ
         weUwAPpSLOyfhoQQH+K8gONeaDDmjeLOYDvCiQF0yzJTpUezboCbGdeuTLDNJGirdCAd
         BbPI4Rwkl0jhDIAhRj0A1EKRdScZHXRtwU85Vmjx6DHPsBaS/WmDBEjP5DCXb1/QYZwl
         D7BcmAg6sq1947FGcTnap9gVV6JJW53xWyb3H3zDQDQJFE75Rd3CAu8ZxRTU20fez3oZ
         sgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738658987; x=1739263787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJgTbzgXLQQM2WPjy2cgmYFy+8vn9/zKsy7KV/C9L/U=;
        b=L6/HkE/Z4JpDVGtdYvW6HQfbzfvkYZhyys7n8LnghXlOC2b6rTiLmzdvJB+OfChPrs
         op6CW+Seb5ZYeyn2TEhr94Tp8uWJiRQFfcQqJySI30l4opHYAa9gs9OKH/AOcsgD1WBG
         fpkPUEoRxhCN0o/V+AM7qgdP23uTBRWMQnSmZzgwe3kn5Zlqit0uCC22W7gqQe0L0KLG
         Q1gC0BnJ9U4blkzoI7tXPJtr0KOfBPatbisNPH+rhl5Rj8XXMup1hF5vo+U8nqPRN+d0
         uiXiGAZORa8G7Y9NC3/eATW7HXAknUPipVvzM5wVEmfO2oNyAjIkGRyqw7ct7SrbhbxA
         3uLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2zTZvXf3nDooiqaXCYDL1OjALQma0OHX03rQ0UB8Wwrs7Po4vzPqx9pGy9zxoj4bNEVLbv6qMuuyi0NMtrMmPCYY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzpzMBUnl5iFdxUp7VB60KsIsCd2nu73aPN52ono1aXWouYFsrR
	hQ4WbmVGLJY6n/xJ8AwMCF+Zce1uHnif2/OoUIoRjhavNRGM+b3q2gfCIlvjx5rxNStMjzWuZua
	mNlaQDBwMWuAu8UUW47yMNfl705pAn8DKzRTejQ==
X-Gm-Gg: ASbGncuK+yuxuzbu0+dU73yrgoVmdKdSAIfXg3Tq3xsT+anUG9t/7Bbxq1hHvTJ/aQ4
	r2BegXPGP7HG63k/m+sZHm0C2R3utUkho1+X9zjFJjL4t8Dmr3j1GFgAoAbcHVbEoSTxPtSVA7G
	aucps4AcMLcKm5JHYtIiT0RpFWulkG
X-Google-Smtp-Source: AGHT+IFEQRuRbI5A1A/dSnqzzU5lAcFMj9oYNCFhrVxY71uNle0mPLpHed3D/xsJ327wEqr9hJ7tpped4fwR08/itAg=
X-Received: by 2002:a05:6512:10d6:b0:540:20f5:be77 with SMTP id
 2adb3069b0e04-543e4be00e6mr8674698e87.3.1738658987007; Tue, 04 Feb 2025
 00:49:47 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1soU+KeFrAxhanq=ysnHkg5v8ZBCGY8i6AenE52dD8jeaw@mail.gmail.com>
In-Reply-To: <CAMKF1soU+KeFrAxhanq=ysnHkg5v8ZBCGY8i6AenE52dD8jeaw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Feb 2025 09:49:36 +0100
X-Gm-Features: AWEUYZk3fLZEi51ijCrJK11uuauQv2ZXjAMkpg4Mqx58TQQFcysISVm3HWqBTMA
Message-ID: <CAMRc=Mdn436ofF=LfsOxqU_rDsLHjryPZWPNXcSzeuW8AOfN6w@mail.gmail.com>
Subject: Re: [oe] python3-gpiod ptest failures
To: raj.khem@gmail.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Feb 2025 08:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115268

On Tue, Feb 4, 2025 at 5:36=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hi Bartosz
>
> I have been observing ptest failing on qemux86-64 lately. Here is log out=
put
>
> https://0x0.st/8K2Y.out
>
> enable ptest in distro features and then for MACHINE=3Dqemux86-64
> bitbake meta-python-image-ptest-python3-gpiod
>
> will show the problem.
>
> Do you have some insights into this?
>

Hi Khem!

I just sent out two fixes (for this and C++ bindings which also fail).
It's a correct fix in the kernel for the gpio-sim module that
uncovered bugs in libgpiod.

The patches will be part of the next libgpiod release.

Bart

