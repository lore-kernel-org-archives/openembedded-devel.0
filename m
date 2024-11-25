Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E84F4D59D73
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 21:26:16 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.30484.1732569971662711414
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 13:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dY726T9N;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3ea462a98b9so822807b6e.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 13:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732569971; x=1733174771; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbOol14s8ZlctzoKFG49rdA18gzAeAltPXFegg3DpRQ=;
        b=dY726T9NH3Z7yP6CG6wCgw0MSU/tpqjTnofvo+/q2fXCqsQFQYi+ekjfO05YUOwLTa
         IA399/HuRT3OPwJdHILilhBTrHmC/D4cI6xPsuwAa0+JlUud0MwSyN6CKwwGnyszoAVx
         G9DI749pLYfMgyWPfb6y3Ct679TD5V0GpudmIxlRMS2ng0gAh6+L4ccHLY6t7g9Ej/OR
         UtzugcFEmmaC+kuQfhH9LUg76v6oe8F4Ihhv0HfNnJ40UmGNCKxDQ2RvApwQKxo7AZpH
         0nUIHFXLYve/aXOrNJgxyyPJezApYu5yO1u1JHvWFOh950JoXa9KGRCWyY3+NK7Qj92e
         T3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732569971; x=1733174771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbOol14s8ZlctzoKFG49rdA18gzAeAltPXFegg3DpRQ=;
        b=qHcUlNhQrYLCtc7kAUElDtqvispuXFSgTNpXidJMRUb/9rNu/2+XcPkpjrNE12bLb3
         aWnx03S/EG2xH+TK3GIzVbj/rcTc83IziIdYEx8YfmAnuTWTYZmPOh+jojztPW6AVFu7
         fktq5G9FbqKO3dlALR1hKsde8Pd7s7nEqmU3DNV8lihLXDpqGnpQZWo5mHHb6CDVFeXG
         R/mk6rSBcMcSqHthUleIrn48xt2XOT4g131uuFIGaADzCt4w8eVNz9A9FGZpsygFB7aa
         wZQraMX3XB0vtF+/2M/yRNq4a5gh29PW+OWPXd32+45GpUP25L56Fjvx6IvmAs7L9nGt
         3x2A==
X-Gm-Message-State: AOJu0YzrK+oa2UX5IhgqVm00rQU0mSQP9xYqbtkVqcjgJTjvtWKF0MSM
	6z4BG3GIAGykHGbhEzAOBgTW0qNBQpSnM8A5dB/lTsvZgOqmyncIBLN/kezQKSX3IjrLclZGBWP
	H5ocl+5tF91+sexbkNfeTNb0jpts=
X-Gm-Gg: ASbGncuHv+04XK9ffHgJshT6QBHYk8ikqd+TGClQIvr8sImQnOK27ureYAXHxCPYTXy
	o/hOx3/qGiHfcAFRq+XI7lcVRHzX5kqA=
X-Google-Smtp-Source: AGHT+IGUr5JNA1LAEaFnpwesHQnCXkTPfBiLdVDq7iGyDnnvvZhLmmTCQunWvmWHp8jQnNiXZlgkpIo7SYltaMWzHCw=
X-Received: by 2002:a05:6808:1490:b0:3e6:5816:543b with SMTP id
 5614622812f47-3e91580affamr12514214b6e.7.1732569970936; Mon, 25 Nov 2024
 13:26:10 -0800 (PST)
MIME-Version: 1.0
References: <a4b285f6-9655-4516-a027-78ab642368ce@gmail.com>
In-Reply-To: <a4b285f6-9655-4516-a027-78ab642368ce@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Nov 2024 13:25:45 -0800
Message-ID: <CAMKF1sqw-FLY7E6uR8L2b6n1AGUqMTv_bHxuN7DoDc82PtUEBQ@mail.gmail.com>
Subject: Re: stryhead merge request: Nov 25th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 21:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114054

Hi Armin,

This branch is in merge conflict with styhead. Would you mind rebasing
it on latest styhead ? this should resolve the unnecessary merge
conflict.

On Mon, Nov 25, 2024 at 12:38=E2=80=AFPM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit afbbe81df6425805392b62b6f153acf740782e=
8a:
>
>    nng: Rename default branch of github.com:nanomsg/nng.git (2024-11-09
> 14:07:27 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/git/meta-openembedded styhead-next
>
> for you to fetch changes up to 7cd38212e73e0e9f42f4d92defb16dd81f71221d:
>
>    lvm2: Remove the lvm2-udevrules package (2024-11-25 15:32:56 -0500)
>
> ----------------------------------------------------------------
> Fredrik Hugosson (1):
>        lvm2: Remove the lvm2-udevrules package
>
> Khem Raj (1):
>        python3-pdm-build-locked: Add recipe
>
> Wang Mingyu (1):
>        python3-alembic: upgrade 1.13.2 -> 1.13.3
>
>   meta-oe/recipes-support/lvm2/lvm2.bb | 16 +++++++++++-----
>   meta-python/recipes-devtools/python/{python3-alembic_1.13.2.bb =3D>
> python3-alembic_1.13.3.bb} |  2 +-
>   meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb
> | 13 +++++++++++++
>   3 files changed, 25 insertions(+), 6 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-alembic_1.13.2.bb
> =3D> python3-alembic_1.13.3.bb} (80%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb
>

