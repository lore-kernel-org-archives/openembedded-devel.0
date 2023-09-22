Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2591CD4F30
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 08:26:04 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.16610.1695371156804693787
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 01:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=27ZZzmsO;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.210.179, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68cbbff84f6so2259755b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 01:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1695371155; x=1695975955; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XZmp5Iv2jTK4dhc2vmJAJvhhw9lkjYUB/Y/Yuu6meA=;
        b=27ZZzmsOFgn9lCpV+NJx4UvLKIR0b9BnKuawcuAoa0bbB0Iy9yX18MUuNvIbaZtOyR
         odur7F+2eQ1Mo2K7qVrKMI+W9dZ8hiFAfifCoi3/1rJriEQXbaYXz5lwNQstqNU3WSnd
         i78o26492QUlQuEH02AW6dU6tYGfduirhcrkoU03lKfNz3XOnSErGvtATULR/7qxnV6v
         rzVwcakYLrkQJB195uMHGjJooNrLn7Ak9s0l4fQhBnri9TGKkwY5sAAqN1SdT1NOQttg
         XiENzMlp+R8uxODRQLEpBXWWP4j8GfsKj8WeRDDZLD07EVylXVXFgUmkHnJnrQiEGcXS
         jZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695371155; x=1695975955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XZmp5Iv2jTK4dhc2vmJAJvhhw9lkjYUB/Y/Yuu6meA=;
        b=GYRT5RyEO9948hclOqiUaLKn9Eh2RwuOXpPfz1f/O1bo9tmacRGJ3dqZ24+SYelUga
         3GKF1lDPr6r5iTLl3Xje2kAOCW32R7+qYfw8W5AMCrLY7DWptxX9Jxo5zPI1+rHqoV+j
         Vy3xtXhyOrgGKA1JD1FWvb1OyWFmGwguzrs4UEHuwp+8UNWcR74Ca+eyPYIHyk2G63MO
         yp7ckaPkUQoxEvfgfvtHwzVz95rGzXyMM5eRXNQPOyJYVCugsH48GYjOuYa+x+RqbmEl
         oW+DZH1tmclsgXJelq+HwV1x4wi+TWars2BAeVZWTDQhnVFW4DVH/4F0gdBmgHc6d+ON
         /Vew==
X-Gm-Message-State: AOJu0YxIkteYrTFrJEDkGmOMRp9ZXuvfpAftOrBGK/QzJu7ORaw0b9Fr
	qsCHa+YKZtvD2mcLQ5tNAvSb+MxKI93InIxlkeqSUXjzBpiGUMpg4va/0HvrEktgCrtdY9yrrwZ
	24L2zKfKx/ncX4a/6bjxrDDKkeW5sYhv1YrydbFLz08omzxUep1Y=
X-Google-Smtp-Source: AGHT+IGJjvRMiwQob1crWR7wjO8A0WK+9uB1HrTlEW/3knQgEvVVYc5UkrTW505WbKbQmOd9mLNXsbq2767yimMXq9w=
X-Received: by 2002:a17:90a:bc47:b0:274:751a:3f3 with SMTP id
 t7-20020a17090abc4700b00274751a03f3mr3051376pjv.7.1695371155405; Fri, 22 Sep
 2023 01:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230921091109.6998-1-jonas.gorski@bisdn.de> <CAMKF1so8xbfMejCfV_2O8LjX6PyGqHZ_1Ooso6=6PeChsPV9mw@mail.gmail.com>
In-Reply-To: <CAMKF1so8xbfMejCfV_2O8LjX6PyGqHZ_1Ooso6=6PeChsPV9mw@mail.gmail.com>
From: Jonas Gorski <jonas.gorski@bisdn.de>
Date: Fri, 22 Sep 2023 10:25:44 +0200
Message-ID: <CAJpXRYSt8ZFpMFZ0Luo14nr7cZjH6hvXu9ry_t-sGA4YAEiFpA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] frr: upgrade 8.4.4 -> 9.0.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 08:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105046

Hi,

Am Do., 21. Sept. 2023 um 23:34 Uhr schrieb Khem Raj <raj.khem@gmail.com>:
>
> seeing a build error on AB
>
>  | vtysh/vtysh_cmd.c:9:8: error: 'VTYSH_LIB' undeclared here (not in a
> function); did you mean 'VTYSH_RIPD'?
>   |     9 | DEFSH (VTYSH_LIB, accept_lifetime_day_month_day_month_cmd_vty=
sh,
>   |       |        ^~~~~~~~~
>   | ./lib/command.h:250:27: note: in definition of macro 'DEFUN_CMD_ELEME=
NT'
>   |   250 |                 .daemon =3D dnum,
>                     \
>   |       |                           ^~~~
>   | ./lib/command.h:320:9: note: in expansion of macro 'DEFSH_ATTR'
>   |   320 |         DEFSH_ATTR(daemon, cmdname, cmdstr, helpstr, 0)
>   |       |         ^~~~~~~~~~
>   | vtysh/vtysh_cmd.c:9:1: note: in expansion of macro 'DEFSH'
>   |     9 | DEFSH (VTYSH_LIB, accept_lifetime_day_month_day_month_cmd_vty=
sh,
>   |       | ^~~~~
>   | make[1]: *** [Makefile:10563: vtysh/vtysh_cmd.o] Error 1
>   | make[1]: Leaving directory
> '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-=
linux/frr/9.0.1/git'
>
>
> See
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3155/st=
eps/15/logs/stdio

Weird, didn't happen for me, though admittedly, I used kirkstone for
the (unmodified) recipe, since our distro is based on this.

That line looks like this in my build:

DEFSH (VTYSH_EIGRPD|VTYSH_OSPF6D|VTYSH_RIPD,
accept_lifetime_day_month_day_month_cmd_vtysh,

So it looks like something went wrong in generating that file.

I'll (temporarily) switch our layers to master and try to replicate it ther=
e.

Hooray for CI!

Best Regards,
Jonas

--=20
BISDN GmbH
K=C3=B6rnerstra=C3=9Fe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=C2=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=C3=B6psel


Commercial register:=C2=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=C2=A0DE283257294


