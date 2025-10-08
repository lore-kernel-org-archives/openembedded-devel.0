Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B3DCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 03:32:41 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.web10.7876.1759894357957285293
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 20:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eukNqvML;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6348447d5easo7122994d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 20:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759894357; x=1760499157; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5OUfHSve4YMRb/QvY4oCQHfvvnvdiOxZVcwgOFSg70=;
        b=eukNqvMLEBy5oTOq+Ru5iZMD2m2JxdkgPrR53UGi5fdYl295rhBAEqOwo+LelytaL7
         wcpp4i71sD5Jdv9hTGcKZ/Jxc+egy+vAuYRR/ggEWLi/C16TZ24z3uw0LBl2+SdzCREV
         iHiDQhAdNkbr5BR1KOuqjPlUsn2E6DKTDolidjJ4GB9lrXftUuct4mDnhFaM9VRYQ/gR
         UuLRPX8/k7w2idZOgiGoQOnuI2b1Q9uB/ANbXR5hvcqIo5J5s+iqymgLuu4HxM5y7105
         MMElp9xb/yWEQ495fNA3fbxouLqqMr3L5NaJ5i5VUNoEkissQRMpqkJ2q+4Ik2f0Mi48
         7ITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759894357; x=1760499157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5OUfHSve4YMRb/QvY4oCQHfvvnvdiOxZVcwgOFSg70=;
        b=j+ASamHyog/D6A0/P7tITdaDtndlEJxkdB6lrUGl0e7djjMCwooCqPBjfJWa0pQkM/
         nKpy8UQG2AjYJaTBsTsysoD6L5KA/FWkkU6Ma1OcOaL4Q5tZX1gPvAR4P9HlY5gR8fmU
         dySwMlyrDu4SeNXtrI5dltzJwb72Vh3b6ZeKmE8ehX2NdboxozKBPFzK/5PdjyBZ42BT
         4+Duo7HFbBsTChr42zOOnhB1Hd8mfGt+89MMRTQdYOx8tgUUb+s47AhIuzqkIK1EgLOW
         SNYAnNYamHY9t/65e12adtJNrLevommbEk6e2FfzUxMa3DNxXp/QbBrvevfmpHetsNE7
         URpw==
X-Gm-Message-State: AOJu0YxyVBwtugXZzv3Sytma30uy2AyTGO8IYy1QG3DXwVN5lTnI8BqC
	ueUAySK8ZHNFwPkf1qjsVL3iF0j4XipdF8rceEAWkOXNq1Epu9ksPIkiIJPCD2UcEHxUiQo8Dsk
	P+IPXWZWxrp3eAjfxetEG1j8nTZva8CY=
X-Gm-Gg: ASbGncsuKP0/C4T7jaod+85Aaf4s6nYS71+nT/FmfKPjjX666EEy21bP682xXh6NN33
	gd2KRSOW91RZHY1rPvUNXJ51GDJzKNPbj+02MtUYKfj+xgyeSac5x8r7gmKp0S1YBzIfbFXSjhJ
	dq+/vspskDxWYOsjWZUVhjWjaLAL9+wX9UBIEqKE++yiIZ+1tojgGaZyFRjg7U8dxskCvVlSetq
	a7mRb8m9rtmdGBu2HVGo0UgwVOsFFEZZUsQpCfllzJxsPdKpHpgFuUOz3mkw4malOOQSoSkmacn
	6LAMggTU9x0VCraxSPkSiwupN+wYgfIUlYEQOeofLXQ4mBhubrE=
X-Google-Smtp-Source: AGHT+IHs8kffU9rA7mRMRJ6Ab3yYG8HJ7lEYaZaUrQmJ8dMhESgpN0IKTI2spn2W8Dk5F3+Lv1vj+qdQP5NcPA2GM9A=
X-Received: by 2002:a53:4209:0:b0:638:53e9:baaa with SMTP id
 956f58d0204a3-63ccb962cfcmr1489592d50.49.1759894357029; Tue, 07 Oct 2025
 20:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20251007105350.1237-1-joao.lima@hbkworld.com> <20251007105350.1237-2-joao.lima@hbkworld.com>
 <CAMKF1srm31ry7unszz67F=i7UhN-6a=xi+jP4DJ=3U-pFeLd_w@mail.gmail.com>
In-Reply-To: <CAMKF1srm31ry7unszz67F=i7UhN-6a=xi+jP4DJ=3U-pFeLd_w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Oct 2025 20:32:10 -0700
X-Gm-Features: AS18NWDL9BGFOzF3KMCrA8_LmzG8m9YSGvdu1NMTDxycHr8BY3pVvtLKqVox93w
Message-ID: <CAMKF1soHwesEkmQ8h+XsROBy6nqhVJ9d-ROyPfRLk_SAHk3JOw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2 1/3] openocd: bump the openocd, jimtcl versions
To: =?UTF-8?B?TGltYSwgSm/Do28=?= <joao.raul.434@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, joao.lima@hbkworld.com, 
	ivitro@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 03:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120355

Once I remove the patch it fails to configure thats next problem see -
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3764711/raw_inlin=
e

On Tue, Oct 7, 2025 at 2:57=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> How did you test it ?
> I am seeing patching errors
>
> NOTE: Applying patch
> '0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch'
> (sources/meta-openembedded/meta-oe/recipes-devtools/openocd/openocd/0001-=
Makefile.
>    =E2=86=AA am-Use-SOURCE_DATE_EPOCH-environment-variab.patch)
>    ERROR: Applying patch
> '0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch' on
> target directory
> '/home/kraj200/yoe/build/tmp/work/x86-64-v3-yoe-linux-musl/
>    =E2=86=AA openocd/0.12+git/sources/openocd-0.12+git'
>
>
> On Tue, Oct 7, 2025 at 3:54=E2=80=AFAM Lima, Jo=C3=A3o <joao.raul.434@gma=
il.com> wrote:
> >
> > From: Joao Lima <joao.lima@hbkworld.com>
> >
> > Version bumps:
> >    - openocd: 91bd431 -> 66ea461
> >    - jimtcl: fcbb449 -> f160866
> >    - libjaylink: 9aa7a59 -> 0d23921
> >
> > Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
> > ---
> >  meta-oe/recipes-devtools/openocd/openocd_git.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/=
recipes-devtools/openocd/openocd_git.bb
> > index 3bbe33ca1d..3b7705c41d 100644
> > --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> > +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> > @@ -13,10 +13,10 @@ SRC_URI =3D " \
> >  "
> >
> >  SRCREV_FORMAT =3D "openocd"
> > -SRCREV_openocd =3D "91bd4313444c5a949ce49d88ab487608df7d6c37"
> > +SRCREV_openocd =3D "66ea461846a3a4a96687c9287c3f61ae8ce0b775"
> >  SRCREV_git2cl =3D "8373c9f74993e218a08819cbcdbab3f3564bbeba"
> > -SRCREV_jimtcl =3D "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
> > -SRCREV_libjaylink =3D "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
> > +SRCREV_jimtcl =3D "f160866171457474f7c4d6ccda70f9b77524407e"
> > +SRCREV_libjaylink =3D "0d23921a05d5d427332a142d154c213d0c306eb1"
> >
> >  PV =3D "0.12+git"
> >

