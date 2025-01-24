Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510ABC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 18:31:25 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.20010.1737743483902113935
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 10:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hTUx+pvE;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2a3939a758dso814550fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 10:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737743483; x=1738348283; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HH314DDq72IDnjyegS6iWh9aVq8K7dV9tWh0kvng/0=;
        b=hTUx+pvEeZMgBAqB1lIF9v6jMCJWtcWaAyOu8LD2YK1+h1M0OAs35OGE8Q4JbOhkFr
         8rj+wO7rzJVvQLwK1bEB/9KjR82BvcLenS3lkmLyBbJS7wNY8jbEW+oFnMVuS0HA0Ge4
         h5NrMSfGc+ey/rmGuMKriKzaCZYTC6Ioy79omf/VcHml/dHWhEvPgjKcFFaGwiIvI+nm
         28RJJ/+rTPN9AqjSIRWCpXnBtwc6zgmh5X9ZTN7NJLD9gjtE1rFHdUlDkbIhMxho3drC
         mbfP20LTJXcFxUvVFX/dkNjfHg7ujEwwm3XpeHiH05oMN2Ee43CdWq4RMmFMeYIYMBqX
         npoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737743483; x=1738348283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HH314DDq72IDnjyegS6iWh9aVq8K7dV9tWh0kvng/0=;
        b=Pzxr60CKCdqnDMP6KJnTaXSWnWgUf4ORgf0ThZU+zk77Y1IL+AkWpu5O/3fCqeSE6K
         Jgeha/tQQZ06gMZMp5hLJ90TPV/qjfaGOrOItYRsJNygpmromiZF6yjJLri14lHnSt13
         AdmIZIExRZ/0U8d+LZEKc5GavuA78/K6W6U56rC/aOrCwJzW14JenEYMnLUBsA9eZ/qO
         Q+N6bwt12ZzkmrQ1W1MTxiUgTTHXnMwJ74GHb5Rd9oZkT3uQdao3f61zthwf38nmiz+e
         KBfRT5jCegvY8vUfXr195B0chhigqlMWNUHTLx2PF/y8GtRoEFWt8520w2o6tQrL4JlF
         PWfw==
X-Gm-Message-State: AOJu0YyB/7wTXYqwenkXj0tw/m3oT7KuIJnCRUu2ufrryIkLcLCUs8yP
	AuVCJrxeCF/gxNBUMmbOHY6Uw4NnpxPVBAsi8AWY+xFisW9kk79Kiv5pebrIAOZ678934EoTTDA
	8rm4o+zi6dC2clcFEmFMApp1sMLE=
X-Gm-Gg: ASbGncvMM7b55qY91AkZ8WqmciKInN3l3VeblJYgeeBBkUrOruxuvwjDivVhpQ+uRgj
	6GEY8PpHG6zWy8vOSr5VMBN4PAlO8bmOt0aXReZKfEaDwlAlNhw998q7+1hS6
X-Google-Smtp-Source: AGHT+IGWdMYq0nw3dqj0dyu+DC0eFEya2yXlyp4FOX9jHeebYGf2+O/XCE6jVzupSZcguxAcac69yAuunF9bSLxUulE=
X-Received: by 2002:a05:6870:6f17:b0:29e:20c4:2217 with SMTP id
 586e51a60fabf-2b1c0c83509mr19481212fac.33.1737743483043; Fri, 24 Jan 2025
 10:31:23 -0800 (PST)
MIME-Version: 1.0
References: <c36f58fb-8afd-4540-983a-d54e19fbe324@gmail.com>
In-Reply-To: <c36f58fb-8afd-4540-983a-d54e19fbe324@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Jan 2025 10:30:56 -0800
X-Gm-Features: AWEUYZnGXgWRiKMroz1_mL3t-3LMsZdpNwqOfg9FFfoRWDUsteHPiNmK5ZNk_tA
Message-ID: <CAMKF1sqnMhvwc3OY=EF8_=xNOS7AtpSzuPu=ZkvT8_-NDjJPLQ@mail.gmail.com>
Subject: Re: kirkstone merge request: Jan 24th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 18:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115068

merged now thanks Armin

On Fri, Jan 24, 2025 at 8:24=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 66ec16850573a7ec69248b81f9904cdfba79b9=
30:
>
>    packagegroup-meta-multimedia: Remove library only packages from rdeps
> (2025-01-01 09:13:52 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to de8681b4a2a101b99dd2c48d89a7de2ccd9a961f:
>
>    python3-sqlparse: Fix CVE-2024-4340 (2025-01-22 19:29:37 -0500)
>
> ----------------------------------------------------------------
> Soumya Sambu (11):
>        python3-django: Fix CVE-2024-38875
>        python3-django: upgrade 4.2.15 -> 4.2.17
>        python3-django: Fix CVE-2023-23969
>        python3-django: Fix CVE-2024-39614
>        python3-django: Fix CVE-2024-41989
>        python3-django: Fix CVE-2024-41990
>        python3-django: Fix CVE-2024-41991
>        python3-django: Fix CVE-2024-45230
>        python3-django: Fix CVE-2024-45231
>        python3-django: Fix CVE-2024-53907
>        python3-sqlparse: Fix CVE-2024-4340
>
> Wang Mingyu (1):
>        libsass: upgrade 3.6.5 -> 3.6.6
>
> Yogita Urade (2):
>        poppler: fix CVE-2024-6239
>        poppler: fix CVE-2024-56378
>
> Zhang Peng (11):
>        glade: fix CVE-2020-36774
>        openjpeg: fix CVE-2024-56826
>        openjpeg: fix CVE-2024-56827
>        opensc: fix CVE-2024-1454
>        opensc: fix CVE-2024-8443
>        opensc: fix CVE-2024-45615
>        opensc: fix CVE-2024-45616
>        opensc: fix CVE-2024-45617
>        opensc: fix CVE-2024-45618
>        opensc: fix CVE-2024-45619
>        opensc: fix CVE-2024-45620
>
> akash hadke (1):
>        meta-oe: Remove True option to getVar calls
>
>   meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch       | 54 ++
>   meta-oe/recipes-devtools/glade/glade_3.22.2.bb |    1 +
>   meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb |    2 +-
>   meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb      | 12 +-
>   ...1-opj_j2k_add_tlmarker-validate-that-current-tile-part.patch | 33 +
>   ...1-sycc422_to_rgb-fix-out-of-bounds-read-accesses-when-.patch | 130 +=
++
>   meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb |    2 +
>   meta-oe/recipes-kernel/spidev-test/spidev-test.bb |    2 +-
>   meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb |    2 +-
>   meta-oe/recipes-support/opensc/files/CVE-2024-1454.patch        | 37 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45615-0001.patch  | 67 ++
>   meta-oe/recipes-support/opensc/files/CVE-2024-45615-0002.patch  | 36 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45615-0003.patch  | 35 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45615-0004.patch  | 36 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45615-0005.patch  | 34 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45616-0001.patch  | 52 ++
>   meta-oe/recipes-support/opensc/files/CVE-2024-45616-0002.patch  | 48 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45616-0003.patch  | 42 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45616-0004.patch  | 43 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45616-0005.patch  | 34 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45616-0006.patch  | 50 ++
>   meta-oe/recipes-support/opensc/files/CVE-2024-45616-0007.patch  | 56 ++
>   meta-oe/recipes-support/opensc/files/CVE-2024-45616-0008.patch  | 74 ++
>   meta-oe/recipes-support/opensc/files/CVE-2024-45616-0009.patch  | 68 ++
>   meta-oe/recipes-support/opensc/files/CVE-2024-45616-0010.patch  | 33 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45617-0001.patch  | 38 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45617-0002.patch  | 33 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45617-0003.patch  | 33 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45618-0001.patch  | 42 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45618-0002.patch  | 42 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45619-0001.patch  | 34 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45619-0002.patch  | 91 ++
>   meta-oe/recipes-support/opensc/files/CVE-2024-45619-0003.patch  | 83 ++
>   meta-oe/recipes-support/opensc/files/CVE-2024-45619-0004.patch  | 49 ++
>   meta-oe/recipes-support/opensc/files/CVE-2024-45619-0005.patch  | 33 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45619-0006.patch  | 63 ++
>   meta-oe/recipes-support/opensc/files/CVE-2024-45620-0001.patch  | 42 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45620-0002.patch  | 34 +
>   meta-oe/recipes-support/opensc/files/CVE-2024-45620-0003.patch  | 50 ++
>   meta-oe/recipes-support/opensc/files/CVE-2024-8443-0001.patch   | 60 ++
>   meta-oe/recipes-support/opensc/files/CVE-2024-8443-0002.patch   | 55 ++
>   meta-oe/recipes-support/opensc/opensc_0.22.0.bb                 | 32 +
>   meta-oe/recipes-support/poppler/poppler/CVE-2024-56378.patch    | 78 ++
>   .../recipes-support/poppler/poppler/CVE-2024-6239-0001.patch    | 1255
> +++++++++++++++++++++++++++
>   .../recipes-support/poppler/poppler/CVE-2024-6239-0002.patch    | 112 +=
++
>   meta-oe/recipes-support/poppler/poppler_22.04.0.bb |    5 +-
>   meta-oe/recipes-support/sass/libsass_git.bb |    4 +-
>   .../recipes-devtools/python/python3-django/CVE-2023-23969.patch | 108 +=
++
>   .../recipes-devtools/python/python3-django/CVE-2024-38875.patch | 161 +=
+++
>   .../recipes-devtools/python/python3-django/CVE-2024-39614.patch | 138 +=
++
>   .../python/python3-django/CVE-2024-41989-0001.patch             | 48 +
>   .../python/python3-django/CVE-2024-41989-0002.patch             | 48 +
>   .../python/python3-django/CVE-2024-41989-0003.patch             | 57 ++
>   .../python/python3-django/CVE-2024-41989-0004.patch             | 81 ++
>   .../recipes-devtools/python/python3-django/CVE-2024-41990.patch | 69 ++
>   .../recipes-devtools/python/python3-django/CVE-2024-41991.patch | 122 +=
++
>   .../recipes-devtools/python/python3-django/CVE-2024-45230.patch | 137 +=
++
>   .../recipes-devtools/python/python3-django/CVE-2024-45231.patch | 120 +=
++
>   .../recipes-devtools/python/python3-django/CVE-2024-53907.patch | 92 ++
>   meta-python/recipes-devtools/python/python3-django_2.2.28.bb    | 12 +
>   .../{python3-django_4.2.15.bb =3D> python3-django_4.2.17.bb} |    4 +-
>   .../python/python3-sqlparse/CVE-2024-4340.patch                 | 48 +
>   meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb |    1 +
>   63 files changed, 4483 insertions(+), 14 deletions(-)
>   create mode 100644
> meta-oe/recipes-devtools/glade/glade/CVE-2020-36774.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/0001-opj_j2k_add_tlmarker-vali=
date-that-current-tile-part.patch
>   create mode 100644
> meta-oe/recipes-graphics/openjpeg/openjpeg/0001-sycc422_to_rgb-fix-out-of=
-bounds-read-accesses-when-.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-1454.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45615-0001.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45615-0002.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45615-0003.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45615-0004.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45615-0005.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45616-0001.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45616-0002.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45616-0003.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45616-0004.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45616-0005.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45616-0006.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45616-0007.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45616-0008.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45616-0009.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45616-0010.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45617-0001.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45617-0002.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45617-0003.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45618-0001.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45618-0002.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45619-0001.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45619-0002.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45619-0003.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45619-0004.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45619-0005.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45619-0006.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45620-0001.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45620-0002.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-45620-0003.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-8443-0001.patch
>   create mode 100644
> meta-oe/recipes-support/opensc/files/CVE-2024-8443-0002.patch
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2024-56378.patch
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2024-6239-0001.patch
>   create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2024-6239-0002.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2023-23969.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-38875.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-39614.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-41989-0001.pa=
tch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-41989-0002.pa=
tch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-41989-0003.pa=
tch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-41989-0004.pa=
tch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-41990.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-41991.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-45230.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-45231.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-53907.patch
>   rename meta-python/recipes-devtools/python/{python3-django_4.2.15.bb
> =3D> python3-django_4.2.17.bb} (61%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-sqlparse/CVE-2024-4340.patch
>

