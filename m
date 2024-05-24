Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7218C25B7A
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 14:10:51 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.16705.1716559848863852335
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 07:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PU3bwJWh;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5b96ae827d2so360107eaf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 07:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716559848; x=1717164648; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZyTGpepvC1JrFn5IGowergRRTgnpmNxHITQfYLmzyE=;
        b=PU3bwJWh8+TMrn8jt1KL3kI2/izMlIX0JURauSUJJVA+ndDkeilkwkYblt/vjAv1aL
         1bvhIMG5UjBz3W2Rx6BiVb2Khz/Aa+89Q9KyZ+xwscHKg+FcYwtQzrE/ghFCsXLYaLtL
         GYTkfUW5T5rh9INOum7dURh/Hj+dnlmyBxEGK/2br9k/KOd92h0E+5smdteu1f3RX+KJ
         bpLIzvoLRUWAr8hbmh40Dbr7YMt6Pzl3deGlL+K2KOBbsl//Q0MI/2TkGetOCHxiFuhF
         2mMKXIdQ3Unel/tpmDxP+rwkvcqbJkIk9DFJRqo91o1xcIn8GnmKph0l/BC9dFE5v4Za
         4a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716559848; x=1717164648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZyTGpepvC1JrFn5IGowergRRTgnpmNxHITQfYLmzyE=;
        b=MFrBIyt1wNBFrJuo1FfAywV71ApWRck53o3eZvjBWMcUJuBJ2zcpKEUWt9TR7lMoak
         cBDDBt+M2XHxbQdZHrgz5drnPGLHufBFiTmsI6Yl/G6f63itIrvFk+tnFtkR14zOknpY
         aQR2IU6ZuM1SnY4SA+i59gzh1B/sxrFT7H9NLzn6BI2mJYKBqINNZOZcyW2sUF0IjWU9
         I7ILsjGUuTAqxp0CSY78CCtWwBMLsTQ/YUBkieL/ZHqDfOt51Tfn3Q+P3EE74CepLWpZ
         3saOf879WZzZwvoff2mkTIDkoZxIVHu84glq3Ru6C2FOKdegxIs0r/jzBe8M7ofxEEit
         lEwA==
X-Gm-Message-State: AOJu0Ywihu9UluNN7ISW8a4qny3wpO3uBigxdagT8wy6VaWG3/1708ZH
	BmDsawEI73h3oPfwazkhEfeWUaNCogiBYY+R0KMbzB3IVCnDMgadPYywIAlXVC5SaurYBcIvzsc
	nilSVmM3r5G0NoD9sjSHAq+SLNj2eBSUgac8=
X-Google-Smtp-Source: AGHT+IHlJ0hGi6Y1zG08F1i0y/ZMTuLG7qt2KqAqy+lUg8ANwUNI8e9Gwa+HhjkMADDjWdvv3qWtXUWJ4Mj92Sltr4E=
X-Received: by 2002:a05:6871:203:b0:24c:bb41:4ed3 with SMTP id
 586e51a60fabf-24cbb414fc4mr389153fac.1.1716559847803; Fri, 24 May 2024
 07:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240524115815.2501861-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240524115815.2501861-1-dmitry.baryshkov@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 May 2024 07:10:21 -0700
Message-ID: <CAMKF1srvShwtLG00xDdUdaRiY5+qukSFOyNbqPmWU8fH4cvnjA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] lmsensors: fix building with GCC 14
To: dbaryshkov@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 14:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110514

On Fri, May 24, 2024 at 4:58=E2=80=AFAM Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
wrote:
>
> GCC 14 is more strict regarding const pointers conversion. Fix
> conversion to let lmsensors build with GCC 14.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../0001-Fix-building-with-GCC-14.patch       | 36 +++++++++++++++++++
>  .../recipes-bsp/lm_sensors/lmsensors_3.6.0.bb |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-bui=
lding-with-GCC-14.patch
>
> diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-w=
ith-GCC-14.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-buildi=
ng-with-GCC-14.patch
> new file mode 100644
> index 000000000000..73938e257708
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-with-GCC=
-14.patch
> @@ -0,0 +1,36 @@
> +From fd49cbcb7f3402e1a4a99b71b901a564060039b4 Mon Sep 17 00:00:00 2001
> +From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +Date: Fri, 24 May 2024 14:16:21 +0300
> +Subject: [PATCH] Fix building with GCC 14
> +
> +Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +Upstream-Status: Pending

This is a good patch to submit upstream as well please open a PR at
https://github.com/lm-sensors/lm-sensors/pulls

> +---
> + prog/sensord/rrd.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/prog/sensord/rrd.c b/prog/sensord/rrd.c
> +index a531362bddd5..36d685fce514 100644
> +--- a/prog/sensord/rrd.c
> ++++ b/prog/sensord/rrd.c
> +@@ -299,7 +299,7 @@ int rrdInit(void)
> +               argv[argc++] =3D rraBuff;
> +               argv[argc] =3D NULL;
> +
> +-              ret =3D rrd_create(argc, (char**) argv);
> ++              ret =3D rrd_create(argc, (const char**) argv);
> +               if (ret =3D=3D -1) {
> +                       sensorLog(LOG_ERR, "Error creating RRD file: %s: =
%s",
> +                                 sensord_args.rrdFile, rrd_get_error());
> +@@ -455,7 +455,7 @@ int rrdUpdate(void)
> +               const char *argv[] =3D {
> +                       "sensord", sensord_args.rrdFile, rrdBuff, NULL
> +               };
> +-              if ((ret =3D rrd_update(3, (char **) /* WEAK */ argv))) {
> ++              if ((ret =3D rrd_update(3, (const char **) /* WEAK */ arg=
v))) {
> +                       sensorLog(LOG_ERR, "Error updating RRD file: %s: =
%s",
> +                                 sensord_args.rrdFile, rrd_get_error());
> +               }
> +--
> +2.39.2
> +
> diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/=
recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> index f956224e1820..07027225c58b 100644
> --- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "git://github.com/lm-sensors/lm-sensors.git=
;protocol=3Dhttps;branch=3Dmast
>             file://fancontrol.init \
>             file://sensord.init \
>             file://0001-Change-PIDFile-path-from-var-run-to-run.patch \
> +           file://0001-Fix-building-with-GCC-14.patch \
>  "
>  SRCREV =3D "1667b850a1ce38151dae17156276f981be6fb557"
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110512): https://lists.openembedded.org/g/openembedde=
d-devel/message/110512
> Mute This Topic: https://lists.openembedded.org/mt/106279990/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

