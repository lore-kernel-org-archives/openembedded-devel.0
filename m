Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178B5C7EE30
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 14:13:13 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.9187.1750947190145411199
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 07:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KOL4DUhq;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-710fe491842so10169087b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 07:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750947189; x=1751551989; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nE5yOSU5v2qSeEiBvEhY5P75yIEOL5fv0TzJCNebWA=;
        b=KOL4DUhq4htONzPYMvaYudC5DwWdTevRN/9ASIUjAbPe1gqEbv9PCH5h8RRhUIS/L0
         l1pUoQW08krYwA0p1ic7roMfo0yrOUcb9B08e+pg9pbs8s6A5XruDCU6m1BgIvWHYmKc
         CmCJTsE/bcO3u4jaT3PQAf7xd/mVFNxTHMcHfhJJFYKgfD14SYqpzQPhNXk6dBroZRJ+
         jKFsQ4i74tTUk/zGh+aviqhR0zpdjUw71171T2Ty6mt3/2qt8f21mePYIZqNGHzRTm4r
         CL+JAh6vso1T2AmfGITdmYxC54KsLjJxbS0uB339cueiBIVSbNt1ihDEO9XIbc+6r4iy
         h6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947189; x=1751551989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nE5yOSU5v2qSeEiBvEhY5P75yIEOL5fv0TzJCNebWA=;
        b=Z9+aG0EIiVy0jCXN6hdhkyUsqoDmh3B5jZIbhajyou/8YVMU2joVsqEbtCffTi/cwC
         emvt+UGlo2cPv5YHaGMitBnUK8a3KomO6KeBg/zh8F5gU2z2XYLYh/bmF0tLhT4WaGDq
         lOVZglXY4Q3M/CI/lDZHSJW5J7Zka0epEIcWJmluRyvrLsfeNdPmAIRapfRVG41wYRBV
         7evIvE06HV4NUaRlfb+q3xKgnUJmKETWeXkhCkO9QkyDaavsSI1LljupjpjG20ieGPxx
         QUxqetAyM0Evhc22sgaNgb7M9zCHLP5v47WTNzZHpRafG2ft0Hq9agqcOOEsNyI3oWjr
         ZWOg==
X-Gm-Message-State: AOJu0Yz5dhuV2qeDCrWS3ZDQnupJEnDvBaCtz/f7Kp4oC7uikLsVboBg
	g9yeLqZEcyewnt6OTEJLEy04hMceZybXGb1jtgaDnaI/+FJIQoFlpgLQwpupbyk0kjQZfcuuKXX
	M+EmkjQXd6XPO8ezuPoUDGX2wzsGP50k=
X-Gm-Gg: ASbGnct76rqCby779LXNSFwmrPuIXSpMPcgpRGo3i/qQM0yuX7pgnsU6EZjxrV6R6WQ
	/vBt71R54VmMao/YVeolcFKOJgl1TjF5y+BchDNpERas2pl3ZSPmcpVY/3z8AxpMjRXCKdjFUXu
	awbkWIvVD/RfqM6iWyLA+6uMi1WMJN67h3F+dpCgumbWg=
X-Google-Smtp-Source: AGHT+IFEBrFU3LcveCKWoGRycCTXAQUDqlhY2eMnbfnZcW+rZ+SIBvv7Kj+XP35o9Pqdih9uu4GuWX92PVbNbad8DpM=
X-Received: by 2002:a05:690c:6b0c:b0:70f:8913:ed66 with SMTP id
 00721157ae682-715087c70bdmr64348247b3.38.1750947189123; Thu, 26 Jun 2025
 07:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <ed4ee502-403b-423a-99c4-f41ad6d1fa06@gmail.com>
In-Reply-To: <ed4ee502-403b-423a-99c4-f41ad6d1fa06@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jun 2025 08:12:41 -0600
X-Gm-Features: Ac12FXx2KhaRNWOBasUOwCgjW7fA7sDjQ4ZP94XOcJACgWTI4B2cUN_w4skCZd4
Message-ID: <CAMKF1spfNPKnDp_gjpiJEWe2jvLo-1Srgv_9rpMC=aA3CtgBuw@mail.gmail.com>
Subject: Re: scarthgap merge request: June 26th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 14:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118124

merged now thanks Armin.

On Thu, Jun 26, 2025 at 7:37=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 491671faee11ea131feab5a3a451d1a01deb2a=
b1:
>
>    proftpd: Fix CVE-2024-57392 (2025-05-21 09:17:27 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to 727811eaf256b88fd135be99559f2cbf14c82fce:
>
>    imagemagick: guard sed operations in do_install for optional files
> (2025-06-23 17:03:24 -0400)
>
> ----------------------------------------------------------------
> Bastian Krause (2):
>        libsocketcan: use https instead of git protocol
>        canutils: use https instead of git protocol
>
> Clayton Casciato (1):
>        chrony: use inherit_defer for conditional inherit of useradd
>
> Leonard Anderweit (1):
>        lmsensors: Fix build without sensord
>
> Sana Kazi (1):
>        imagemagick: guard sed operations in do_install for optional files
>
> Vijay Anusuri (1):
>        redis: upgrade 7.2.7 -> 7.2.8
>
> Yogita Urade (1):
>        postgresql: upgrade 16.8 -> 16.9
>
>   meta-networking/recipes-support/chrony/chrony_4.5.bb |  2 +-
>   meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb |  5 +++--
>   .../files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
> |  4 ++--
>   .../recipes-dbs/postgresql/{postgresql_16.8.bb =3D> postgresql_16.9.bb}
> |  2 +-
>   .../0001-hiredis-use-default-CC-if-it-is-set.patch |  0
>   .../0002-lua-update-Makefile-to-use-environment-build-setting.patch |  =
0
>   .../0003-hack-to-force-use-of-libc-malloc.patch |  0
>   .../0004-src-Do-not-reset-FINAL_LIBS.patch |  0
>   .../0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |  0
>   .../0006-Define-correct-gregs-for-RISCV32.patch |  0
>   .../redis/{redis-7.2.7 =3D> redis-7.2.8}/init-redis-server             =
 |  0
>   .../recipes-extended/redis/{redis-7.2.7 =3D> redis-7.2.8}/redis.conf   =
 |  0
>   .../recipes-extended/redis/{redis-7.2.7 =3D> redis-7.2.8}/redis.service=
 |  0
>   meta-oe/recipes-extended/redis/{redis_7.2.7.bb =3D> redis_7.2.8.bb}
> |  2 +-
>   meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb |  2 +-
>   meta-oe/recipes-extended/socketcan/libsocketcan_0.0.12.bb |  2 +-
>   meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
> | 23 +++++++++++++++++------
>   17 files changed, 27 insertions(+), 15 deletions(-)
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_16.8.bb =3D>
> postgresql_16.9.bb} (86%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/0002-lua-update-Makefile-to-use-environment-build-setting.pa=
tch
> (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.pat=
ch
> (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/init-redis-server (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/redis.conf (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.2.7 =3D>
> redis-7.2.8}/redis.service (100%)
>   rename meta-oe/recipes-extended/redis/{redis_7.2.7.bb =3D>
> redis_7.2.8.bb} (96%)
>

