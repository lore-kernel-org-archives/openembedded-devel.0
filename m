Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1965AC25B74
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 03:28:44 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.4888.1716607714826395923
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 20:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GmJbm4b7;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-248f7fdc323so3980829fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 20:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716607714; x=1717212514; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVTPBRkzpvG6xTOuN8unRxuveiCMYn22Wkbnxl2rRBg=;
        b=GmJbm4b74xM9KAAR3r3MGvymGqAmbEMNIdZBF9jQ/H/fmiLXHS4Qd8Yc1N4RdS9Yzg
         vs80B3Sc4ZswwRb6TtwjdGCvvnFET48BZRjvy1dHgEkyvQQgojFh1oMVuB0sDXqfJyQY
         eeXtwc7zBL2FnUBQHcX4gjVT2QNG5e/IKpyU0yqPgvcwb+vdVIU4/UB5YYmmfjpqla67
         ymn+C1gGZX/AtECawZWba4p8kQ/z6zwQUD2kcegF4Jr5I7n+oImXv3ksXcUQ1g471fdX
         I1WNGOko1nJ6htNThbXSbdmp3E0TWJNpr8VhZLpF/LjFnENmhLBNETuZPVrKcTATX5zb
         khNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716607714; x=1717212514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVTPBRkzpvG6xTOuN8unRxuveiCMYn22Wkbnxl2rRBg=;
        b=O783xvVNQc2yheilKSRRwypqh8qFJU17YP4zjCFiNUqAqpozj6uCGmxexSWg6kTqAD
         83wK19cHp+aQ8eNbKtfPqtFzTFQOrqWn4umxpmTREmq/llibWqwCc/b2rl9HwOb9H8pV
         Ot7lRMPrhjR1hE5o+8Iw6VgzGKnDS585kFnUKnF5Kgs0Z/VXVKn2SBZqB8saPTRtVFc1
         +xtcZNxgcxiwVkgl4Mi8yNN5KuheWJ7jfP0GM4AFoluFM2je9iNc2D4rFa7bQR2tukQY
         lXTTDjXwZ+pG685WKk9pvTbYdxHYm4IZKPMThYVAjbLa99CkdTF7oXOUwm2+9z7/WeYg
         13vQ==
X-Gm-Message-State: AOJu0YxJNJ7QO1PnxnwmeKdUx4Yt4+UnEsEqIZ2NsBlKp2xEw/bXZWtJ
	unNmkpZG7ie/wvgBQgK0S95iRzv0NDBlduniV4fwBy5XStOld8nsI720krp49pmzVKSJQ6Vh9S/
	OKKNmodKsl8+C/PkeR56io764jV0=
X-Google-Smtp-Source: AGHT+IEX8AQM3WjkD7tORLHng5+InSyAr5VjZS4KBlSUx+lNT3dmOKEnRHRs2eOaF1doMasPgbzoJKHq+IXr/uOzOjE=
X-Received: by 2002:a05:6870:2193:b0:23d:417c:675 with SMTP id
 586e51a60fabf-24ca1380b4emr5114896fac.41.1716607713962; Fri, 24 May 2024
 20:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240524115815.2501861-1-dmitry.baryshkov@linaro.org> <CAMKF1srvShwtLG00xDdUdaRiY5+qukSFOyNbqPmWU8fH4cvnjA@mail.gmail.com>
In-Reply-To: <CAMKF1srvShwtLG00xDdUdaRiY5+qukSFOyNbqPmWU8fH4cvnjA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 May 2024 20:28:07 -0700
Message-ID: <CAMKF1spUQuSrWcXo4Gy-yBari2pUdVrQaj7_-nLx8=AWEsDESw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] lmsensors: fix building with GCC 14
To: dbaryshkov@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 May 2024 03:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110526

On Fri, May 24, 2024 at 7:10=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Fri, May 24, 2024 at 4:58=E2=80=AFAM Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > GCC 14 is more strict regarding const pointers conversion. Fix
> > conversion to let lmsensors build with GCC 14.

Well it now fails with GCC14 itself so I wonder

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3879/step=
s/14/logs/stdio

> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../0001-Fix-building-with-GCC-14.patch       | 36 +++++++++++++++++++
> >  .../recipes-bsp/lm_sensors/lmsensors_3.6.0.bb |  1 +
> >  2 files changed, 37 insertions(+)
> >  create mode 100644 meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-b=
uilding-with-GCC-14.patch
> >
> > diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building=
-with-GCC-14.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-buil=
ding-with-GCC-14.patch
> > new file mode 100644
> > index 000000000000..73938e257708
> > --- /dev/null
> > +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-with-G=
CC-14.patch
> > @@ -0,0 +1,36 @@
> > +From fd49cbcb7f3402e1a4a99b71b901a564060039b4 Mon Sep 17 00:00:00 2001
> > +From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > +Date: Fri, 24 May 2024 14:16:21 +0300
> > +Subject: [PATCH] Fix building with GCC 14
> > +
> > +Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > +Upstream-Status: Pending
>
> This is a good patch to submit upstream as well please open a PR at
> https://github.com/lm-sensors/lm-sensors/pulls
>
> > +---
> > + prog/sensord/rrd.c | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/prog/sensord/rrd.c b/prog/sensord/rrd.c
> > +index a531362bddd5..36d685fce514 100644
> > +--- a/prog/sensord/rrd.c
> > ++++ b/prog/sensord/rrd.c
> > +@@ -299,7 +299,7 @@ int rrdInit(void)
> > +               argv[argc++] =3D rraBuff;
> > +               argv[argc] =3D NULL;
> > +
> > +-              ret =3D rrd_create(argc, (char**) argv);
> > ++              ret =3D rrd_create(argc, (const char**) argv);
> > +               if (ret =3D=3D -1) {
> > +                       sensorLog(LOG_ERR, "Error creating RRD file: %s=
: %s",
> > +                                 sensord_args.rrdFile, rrd_get_error()=
);
> > +@@ -455,7 +455,7 @@ int rrdUpdate(void)
> > +               const char *argv[] =3D {
> > +                       "sensord", sensord_args.rrdFile, rrdBuff, NULL
> > +               };
> > +-              if ((ret =3D rrd_update(3, (char **) /* WEAK */ argv)))=
 {
> > ++              if ((ret =3D rrd_update(3, (const char **) /* WEAK */ a=
rgv))) {
> > +                       sensorLog(LOG_ERR, "Error updating RRD file: %s=
: %s",
> > +                                 sensord_args.rrdFile, rrd_get_error()=
);
> > +               }
> > +--
> > +2.39.2
> > +
> > diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-o=
e/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> > index f956224e1820..07027225c58b 100644
> > --- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> > +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> > @@ -14,6 +14,7 @@ SRC_URI =3D "git://github.com/lm-sensors/lm-sensors.g=
it;protocol=3Dhttps;branch=3Dmast
> >             file://fancontrol.init \
> >             file://sensord.init \
> >             file://0001-Change-PIDFile-path-from-var-run-to-run.patch \
> > +           file://0001-Fix-building-with-GCC-14.patch \
> >  "
> >  SRCREV =3D "1667b850a1ce38151dae17156276f981be6fb557"
> >
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#110512): https://lists.openembedded.org/g/openembed=
ded-devel/message/110512
> > Mute This Topic: https://lists.openembedded.org/mt/106279990/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

