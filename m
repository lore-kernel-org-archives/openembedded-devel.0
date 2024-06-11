Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A00C27C5E
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 06:08:34 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.3210.1718086113741907237
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 23:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZqtnPp6N;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-24c9f892aeaso303303fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 23:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718086113; x=1718690913; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aVUZSHv+LYTcd53VPdGrK+q3OMs9SwT7C9axP2uhFI=;
        b=ZqtnPp6N3B8HsJoxpzOc0fd7D+S8HxU+borvgJCcExc9H5J4++ZlNXEgxauccNt4xp
         p1uVPk73FA4OdjGABLKaX+HR/7CpAJrYt77Uk3hJynk/tuthT4amEmNj8gWbicOz59tF
         O/41dcFKjiyk31mLfqFhvLTdRsEfY94SDwXoO/Ey1vJIGX6MEvdeTGk4y8mtLxdhjpM8
         hUKTdRe0c1Yohz3oAaEI6ZdU718csKEAY2pnw1LX7kA+ICyQp4nnTOYqR1iuWXMcU1Dm
         CsYA5ZglbzPkloj91kN89IQTJbDLmstvpmMCg1PCe+VC31B8uz1SMfzIFTKjn4cyVXId
         y3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718086113; x=1718690913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aVUZSHv+LYTcd53VPdGrK+q3OMs9SwT7C9axP2uhFI=;
        b=Nb6KSoqwuoFrAQPq0/eb2wBDTy732nhGKhEBmzB3BVg71w/V6dBzgIvLH/sGnXAqkY
         NVuB+pPgeO/BUjrR/kbTre/9QBbnYBmOBuNQ4kGFh4qzAiIp2kESBs5FgoZi4Uz0g9xa
         z2YBqhy4mY0SEtZr5Do+j/TH3M8EjWyr0R2ZFHKen5+lXYj6vko7EvMO6iLrmtphAIff
         yWE9/bqLTxTIZr5uzifoE+3goAPOsSpQm+VmaS8HalnPki/wMQ5r8xO7NZkb826EyKZ5
         SzUQijqReZRTCwMC78OcIlVJFb3grRrZ50kf9NU+vnNiN1DvFJ/knHiX7Ei2MOSJXEV7
         f1eQ==
X-Gm-Message-State: AOJu0YxHxYmzpcN1m69EG8yHr9HNkjivwqaDwCIW/htnegj7v8RvRTP9
	eGPAr5RL9e8wprufogy7s5xck23DfIVCVyG+8jMjjpARwtH09q1iJY9E9M74dvkltXcuEIIm4dq
	E4bKZxp6on7HVA5UTbCJp6YxnhNLApQ==
X-Google-Smtp-Source: AGHT+IGwnpgrOR53VOL1xi0+O5C7lX6ASAjdwnoBrqnE5KYxiB/kXkrzugS/8Skrtim4TKcTiGWe1xeVxmYoHw/3kTU=
X-Received: by 2002:a05:6870:b6a1:b0:254:c08d:cb54 with SMTP id
 586e51a60fabf-254c08df73cmr6554645fac.1.1718086112681; Mon, 10 Jun 2024
 23:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240610113822.3231543-1-kai.kang@windriver.com>
In-Reply-To: <20240610113822.3231543-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Jun 2024 23:08:06 -0700
Message-ID: <CAMKF1soPwSJAk7=+3c1p4hzb3yrCMYYXKHWoPiLQwJVUjxgRTQ@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH] xfwm4: fix gcc -Wincompatible-pointer-types
To: kai.kang@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 06:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110816

On Mon, Jun 10, 2024 at 4:38=E2=80=AFAM Kai Kang via lists.openembedded.org
<kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Fix xfwm4 incompatible pointer type error with gcc option -Wincompatible-=
pointer-types:
>
> | ../../xfwm4-4.18.0/src/startup_notification.c:139:57: error: passing ar=
gument
>       2 of 'sn_startup_sequence_get_last_active_time' from incompatible p=
ointer type
>       [-Wincompatible-pointer-types]
> |   139 |     sn_startup_sequence_get_last_active_time (sequence, &l_sec,=
 &l_usec);
> |       |                                                         ^~~~~~
> |       |                                                         |
> |       |                                                         long in=
t *
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  ...-fix-incompatible-pointer-type-error.patch | 34 +++++++++++++++++++
>  meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb  |  2 ++
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-incompat=
ible-pointer-type-error.patch
>
> diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-incompatible-po=
inter-type-error.patch b/meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-incom=
patible-pointer-type-error.patch
> new file mode 100644
> index 000000000..eb8fa7c43
> --- /dev/null
> +++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-incompatible-pointer-t=
ype-error.patch
> @@ -0,0 +1,34 @@
> +Fix xfwm4 incompatible pointer type error:
> +
> +| ../../xfwm4-4.18.0/src/startup_notification.c:139:57: error: passing a=
rgument 2 of 'sn_startup_sequence_get_last_active_time' from incompatible p=
ointer type [-Wincompatible-pointer-types]
> +|   139 |     sn_startup_sequence_get_last_active_time (sequence, &l_sec=
, &l_usec);
> +|       |                                                         ^~~~~~
> +|       |                                                         |
> +|       |                                                         long i=
nt *
> +| In file included from .../usr/include/startup-notification-1.0/libsn/s=
n.h:32,
> +|                  from ../../xfwm4-4.18.0/src/startup_notification.c:33=
:
> +| .../usr/include/startup-notification-1.0/libsn/sn-monitor.h:84:79: not=
e: expected 'time_t *' {aka 'long long int *'} but argument is of type 'lon=
g int *'
> +|    84 |                                                            tim=
e_t            *tv_sec,
> +|       |                                                            ~~~=
~~~~~~~~~~~~~~~~^~~~~~
> +
> +Upsteam-Status: Submitted [https://gitlab.xfce.org/xfce/xfwm4/-/issues/7=
90]
> +

there is a typo here it should be Upstream

> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +---
> + src/startup_notification.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/startup_notification.c b/src/startup_notification.c
> +index 2a08cad..05434ca 100644
> +--- a/src/startup_notification.c
> ++++ b/src/startup_notification.c
> +@@ -136,7 +136,7 @@ sn_collect_timed_out_foreach (void *element, void *d=
ata)
> +
> +     sequence =3D element;
> +     ctod =3D (CollectTimedOutData *) data;
> +-    sn_startup_sequence_get_last_active_time (sequence, &l_sec, &l_usec=
);
> ++    sn_startup_sequence_get_last_active_time (sequence, (time_t *)&l_se=
c, &l_usec);
> +     tv_sec =3D l_sec; tv_usec =3D l_usec;
> +
> +     elapsed =3D ((double) ctod->now - (tv_sec * G_USEC_PER_SEC) - tv_us=
ec)
> diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb b/meta-xfce/rec=
ipes-xfce/xfwm4/xfwm4_4.18.0.bb
> index 839f1c870..2770829e9 100644
> --- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
> +++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
> @@ -8,6 +8,8 @@ inherit xfce update-alternatives features_check
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> +SRC_URI +=3D "file://xfwm4-fix-incompatible-pointer-type-error.patch"
> +
>  SRC_URI[sha256sum] =3D "92cd1b889bb25cb4bc06c1c6736c238d96e79c1e706b9f77=
fad0a89d6e5fc13f"
>
>  PACKAGECONFIG ?=3D " \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110796): https://lists.openembedded.org/g/openembedde=
d-devel/message/110796
> Mute This Topic: https://lists.openembedded.org/mt/106590506/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

