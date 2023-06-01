Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C00C7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 19:16:58 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.1563.1685647016653225209
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 12:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=DPt1Lzt/;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.217.43, mailfrom: brgl@bgdev.pl)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-43b1c483c39so291367137.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 12:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685647015; x=1688239015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCvUw4AhxUsMAXLZNrMNNm49K9ZRbkxb5QZwQ8S7O4M=;
        b=DPt1Lzt/JJtm2TADIadqRygHikXn7Xu/zsQqZAuoOkGGxpANCXZ+SKKw0/zYM1sLvI
         OxwtMOeJ+veOw0v66nmBeY1zBnoSrm7yUsDHdoG0phvEDkLG/Z09hAJQPOG5O9z897YB
         mQw0YrcyFg6SRTl6b5M1+YdUtKcQ80t8/BtVK51MjiKG+0FBU6ea4A2mlMevri1CRkDY
         VE1LbfRb3QXDgpQzCwwWIdqShRfjcWKNVpajacA1PgvCMfqWSmoP2pTD0o8Qjynz/iBX
         Y8mDMI7ACjUVNnCnXVjaGnEfjecYoFLbym9h6rfcXApgpf2NutBkV6yIMwgx8MZ6f000
         thLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685647015; x=1688239015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCvUw4AhxUsMAXLZNrMNNm49K9ZRbkxb5QZwQ8S7O4M=;
        b=L2iFwn2laMEvI7mqx1wUx/ORwQXl5GbY4taKrNnEsp4tW9XHFOsXEQp4Dh7Bbvet1G
         rcGjPIf5dao3BdeDXko09U9pKzuY1dYciB74E3TBUbVGdW+xUvt6+q8y9xVYppuJPgs4
         Srls0X+Js69GkVn2JHR91+/Hvaw+CuHa6QGDB5xGlx01AM+GObwpiPfHvP2OeoKFGRyj
         iRBPqmnHlw2XQvazluaJvlxciY3Ku5fUpyY2urjNkdpihM1do1kDbPeRyO7hFrhaUazL
         iLmyMjoFXVJKWweuW+UIJ81b6Rm3/2lGmeGjFF0xu8nRXeAkCVjJcLGhpuU3Z/DoGyHz
         LC8w==
X-Gm-Message-State: AC+VfDz8xPqNYvasgOAm8sOOlNOyUDhnOwFmaV1rw3sCVXgkfgRWR8K9
	+IzW2EISMNwn+zFaPm5BEMH2B67c6igS6ygs2tmURQ==
X-Google-Smtp-Source: ACHHUZ6y8VSFr4KUU17kG8N3ICjrlv5BdrUjsxh5FVekXiwxHwPX64782l81+YAcsZTag1heB0N3iFH0wRzB7V9MIkI=
X-Received: by 2002:a67:e917:0:b0:436:c4a:bcc4 with SMTP id
 c23-20020a67e917000000b004360c4abcc4mr4847013vso.21.1685647015398; Thu, 01
 Jun 2023 12:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230531082437.10646-1-brgl@bgdev.pl> <20230531082437.10646-5-brgl@bgdev.pl>
 <CAMKF1srh+B4se32-5DUA9o7_9bWU5s7xKN-jc_d5F+=WUocUfg@mail.gmail.com>
In-Reply-To: <CAMKF1srh+B4se32-5DUA9o7_9bWU5s7xKN-jc_d5F+=WUocUfg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 1 Jun 2023 21:16:44 +0200
Message-ID: <CAMRc=Md0Hm2h+RE0dvtmVANQDsoSemRzWVv1GHAP=ncKsyE4+A@mail.gmail.com>
Subject: Re: [meta-python][PATCH 004/149] python3-pywbem: don't use PYTHON_PN
To: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 19:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103087

On Thu, Jun 1, 2023 at 6:26=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> seeing this
>
> 13:23:45 NOTE: Resolving any missing task queue dependencies
> 13:23:54 ERROR: Nothing RPROVIDES 'python3-yamlloader-native' (but
> virtual:native:/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openem=
bedded/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> RDEPENDS on or otherwise requires it)
> 13:23:54 NOTE: Runtime target 'python3-yamlloader-native' is
> unbuildable, removing...
> 13:23:54 Missing or unbuildable dependency chain was:
> ['python3-yamlloader-native']
> 13:23:54 NOTE: Runtime target 'python3-pywbemtools' is unbuildable, remov=
ing...
> 13:23:54 Missing or unbuildable dependency chain was:
> ['python3-pywbemtools', 'python3-pywbem-native',
> 'python3-yamlloader-native']
> 13:23:54 NOTE: Runtime target 'python3-pywbemtools-dev' is
> unbuildable, removing...
> 13:23:54 Missing or unbuildable dependency chain was:
> ['python3-pywbemtools-dev', 'python3-pywbem-native',
> 'python3-yamlloader-native']
> 13:23:59 ERROR: Nothing RPROVIDES 'python3-nocasedict-native' (but
> virtual:native:/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openem=
bedded/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> RDEPENDS on or otherwise requires it)
> 13:23:59 NOTE: Runtime target 'python3-nocasedict-native' is
> unbuildable, removing...
> 13:23:59 Missing or unbuildable dependency chain was:
> ['python3-nocasedict-native']
> 13:24:04 ERROR: Nothing RPROVIDES 'python3-nocaselist-native' (but
> virtual:native:/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openem=
bedded/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> RDEPENDS on or otherwise requires it)
> 13:24:04 NOTE: Runtime target 'python3-nocaselist-native' is
> unbuildable, removing...
> 13:24:04 Missing or unbuildable dependency chain was:
> ['python3-nocaselist-native']
>

This is caused by dependencies of python3-pywbem-native not having
BBCLASSEXTEND =3D "native" in their recipes. How did it even work
before? Clearly it wouldn't pull any of its run-time dependencies into
the native sysroot...

Bart

> On Wed, May 31, 2023 at 1:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We no longer support python2. Drop PYTHON_PN and use python3 explicitly=
.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  .../pywbem/python3-pywbem_1.6.1.bb            | 34 +++++++++----------
> >  1 file changed, 17 insertions(+), 17 deletions(-)
> >
> > diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.b=
b b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> > index 8b0383cf6..c84576382 100644
> > --- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> > +++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> > @@ -21,26 +21,26 @@ SRC_URI[sha256sum] =3D "abdbd6ce08b6c597cdd6c7730e6=
b49a842d913f2f6b3cc62b585c58ec3
> >  inherit pypi setuptools3 update-alternatives
> >
> >  DEPENDS +=3D " \
> > -    ${PYTHON_PN}-ply-native \
> > -    ${PYTHON_PN}-pyyaml-native \
> > -    ${PYTHON_PN}-six-native \
> > -    ${PYTHON_PN}-wheel-native \
> > +    python3-ply-native \
> > +    python3-pyyaml-native \
> > +    python3-six-native \
> > +    python3-wheel-native \
> >  "
> >
> >  RDEPENDS:${PN} +=3D "\
> > -    ${PYTHON_PN}-datetime \
> > -    ${PYTHON_PN}-io \
> > -    ${PYTHON_PN}-netclient \
> > -    ${PYTHON_PN}-ply \
> > -    ${PYTHON_PN}-pyyaml \
> > -    ${PYTHON_PN}-six \
> > -    ${PYTHON_PN}-stringold \
> > -    ${PYTHON_PN}-threading \
> > -    ${PYTHON_PN}-unixadmin \
> > -    ${PYTHON_PN}-xml \
> > -    ${PYTHON_PN}-nocasedict \
> > -    ${PYTHON_PN}-nocaselist \
> > -    ${PYTHON_PN}-yamlloader \
> > +    python3-datetime \
> > +    python3-io \
> > +    python3-netclient \
> > +    python3-ply \
> > +    python3-pyyaml \
> > +    python3-six \
> > +    python3-stringold \
> > +    python3-threading \
> > +    python3-unixadmin \
> > +    python3-xml \
> > +    python3-nocasedict \
> > +    python3-nocaselist \
> > +    python3-yamlloader \
> >  "
> >
> >  ALTERNATIVE:${PN} =3D "mof_compiler"
> > --
> > 2.39.2
> >

