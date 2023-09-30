Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FC7E77375
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 14:32:32 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.41649.1696084344825358963
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Sep 2023 07:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ASQNmTrY;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1d544a4a2f2so8252005fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696084344; x=1696689144; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZtDouSyYrqJX5bsFURaGZyQQDgU0ZUpBMGvakzwWF8=;
        b=ASQNmTrYMJiK2/1fTQrHKu9HIAjZcMHbMWz3E1/tQwEO/Z+Y7CH78hq7STU7EF8Ttj
         pS5wNywAcPvKHjtCsB+Chl9C4Ho6wGVrlcA4iN+uQi9TWupsYHmLCi0HkyTjCbi9D7HJ
         tg8w9w3bcjj8cJT+Os/MObVhOy8V2fg/fClR48PkzUO0Vi/ZQoQ5EiBVU63PvKLQFtkd
         uYvLxav4VhV+l9yTMOpkeiZpxtCwG/INos+tzlQ++nVv1232zxJ6ugyDX2nxcI8/+knu
         oKi/EkrYN0QjgCDRBO6IPNOQbeRlW+s4au/xybIHCf7MM7I4dTTo7wXgITkLWvz0RGT5
         saZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696084344; x=1696689144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZtDouSyYrqJX5bsFURaGZyQQDgU0ZUpBMGvakzwWF8=;
        b=X563tkVceFE1zRnAZsUr5hry9ZN2cswEJuNbqa96fAl1raZpBn5avmxGL1t6ETc0/R
         91MTApdAZ8xqfl0GtTn6wRnGYmcs2/WmMy3Pgp2HuPjAQg+APRxBTkqgMBQ3TI0tdmAI
         w3dDg1+jPnhWncbsjb3bcdEKFl/s0ucNURPfvN9IGmJZExxzNGf/bnHdnKpAYJrFJKto
         XgSaULEalfIBxr6qXix7eC0AMAJZa+9jgyWy1uCs74noQuMrDz8ot3Y/iwo+15Hv1G9A
         oopNaGKNCYU6CFkms0JNCEA8eWVR2tzqNu+xvz67PZh7RW1TQxQPZgF45P7CToyDWwfe
         JGLg==
X-Gm-Message-State: AOJu0YzPW3bPnF8lCiOJhYPRkhMakM3B16nuDCr3Rs0YNaFIdfKoBTc0
	AULIHzmDA0kb7zxWbV2mcAuo1xxWbS5OcBC7a9Y=
X-Google-Smtp-Source: AGHT+IHr2CKyF7Wekktk0m0DzyzsJhQYErMdemp5z+Vqhxj5D4y/4tVVhQyyn7gmRxQ1GsHbMTVx2NYZlhbjOHHh3Kk=
X-Received: by 2002:a05:6870:3049:b0:1d5:9451:d4da with SMTP id
 u9-20020a056870304900b001d59451d4damr8216648oau.17.1696084343814; Sat, 30 Sep
 2023 07:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <75ff44f4-5540-ed6f-c293-641cba5c4a05@gmail.com>
In-Reply-To: <75ff44f4-5540-ed6f-c293-641cba5c4a05@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Sep 2023 07:31:57 -0700
Message-ID: <CAMKF1sr3rs5uN5oURzjU+Y672shyC=fHiK0GmZAinA5+dG23mQ@mail.gmail.com>
Subject: Re: kirkstone merge request: Sept 30th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 14:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105283

merged thanks Armin

On Sat, Sep 30, 2023 at 4:53=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit a88cb922f91fda95e8a584cee3092083d5ad3e=
98:
>
>    hwloc: fix CVE-2022-47022 (2023-09-06 09:13:26 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff:
>
>    python3-django: upgrade 4.2.3 -> 4.2.5 (2023-09-27 10:23:28 -0400)
>
> ----------------------------------------------------------------
> Armin Kuster (2):
>        frr: Fix CVE-2023-41909
>        openldap: update to 2.5.16
>
> Hitendra Prajapati (1):
>        wireshark: Fix CVE-2023-2906
>
> Jose Quaresma (1):
>        opensc: ignore CVE-2021-34193
>
> Khem Raj (1):
>        freeglut: Add packageconfigs for x11/wayland/gles
>
> Mingli Yu (1):
>        hdf5: Fix CVE-2021-37501
>
> Narpat Mali (3):
>        python3-django: fix CVE-2023-41164
>        python3-django: upgrade 3.2.20 -> 3.2.21
>        python3-django: upgrade 4.2.3 -> 4.2.5
>
> Polampalli, Archana (1):
>        redis: upgrade 7.0.12 -> 7.0.13
>
> Shinu Chandran (1):
>        c-ares: CVE-ID correction for CVE-2022-4904
>
> Soumya Sambu (1):
>        rabbitmq-c: Fix CVE-2023-35789
>
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch  | 42
> +++++++++
>   meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
>   .../recipes-support/wireshark/files/CVE-2023-2906.patch         | 38
> ++++++++
>   meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb   | 1 +
>   .../recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch  | 135
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb    | 4 +-
>   .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
>   .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
>   .../redis/{redis-7.0.12 =3D> redis-7.0.13}/GNU_SOURCE-7.patch |   0
>   .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
>   .../redis/{redis-7.0.12 =3D> redis-7.0.13}/init-redis-server |   0
>   .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
>   .../{redis-7.0.12 =3D> redis-7.0.13}/oe-use-libc-malloc.patch |   0
>   .../redis/{redis-7.0.12 =3D> redis-7.0.13}/redis.conf |   0
>   .../redis/{redis-7.0.12 =3D> redis-7.0.13}/redis.service |   0
>   .../recipes-extended/redis/{redis_7.0.12.bb =3D> redis_7.0.13.bb} |   2=
 +-
>   meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb             | 18 ++=
+-
>   meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch       | 2 +-
>   meta-oe/recipes-support/hdf5/files/CVE-2021-37501.patch         | 37
> ++++++++
>   meta-oe/recipes-support/hdf5/hdf5_1.8.21.bb                     | 1 +
>   .../openldap/0001-ldif-filter-fix-parallel-build-failure.patch  | 32
> -------
>   .../0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch    | 33
> -------
>   ...1-librewrite-include-ldap_pvt_thread.h-before-redefini.patch | 54
> -----------
>   meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch | 30
> -------
>   meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch | 76
> ----------------
>   .../openldap/{openldap_2.5.12.bb =3D> openldap_2.5.16.bb} |   7 +-
>   meta-oe/recipes-support/opensc/opensc_0.22.0.bb                 | 5 ++
>   .../recipes-devtools/python/python3-django/CVE-2023-41164.patch | 105
> ++++++++++++++++++++++
>   meta-python/recipes-devtools/python/python3-django_2.2.28.bb    | 1 +
>   .../{python3-django_3.2.20.bb =3D> python3-django_3.2.21.bb} |   4 +-
>   .../python/{python3-django_4.2.3.bb =3D> python3-django_4.2.5.bb} |   4=
 +-
>   31 files changed, 390 insertions(+), 242 deletions(-)
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch
>   create mode 100644
> meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch
>   rename meta-oe/recipes-extended/redis/{redis-7.0.12 =3D>
> redis-7.0.13}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.12 =3D>
> redis-7.0.13}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.12 =3D>
> redis-7.0.13}/GNU_SOURCE-7.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.12 =3D>
> redis-7.0.13}/hiredis-use-default-CC-if-it-is-set.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.12 =3D>
> redis-7.0.13}/init-redis-server (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.12 =3D>
> redis-7.0.13}/lua-update-Makefile-to-use-environment-build-setting.patch
> (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.12 =3D>
> redis-7.0.13}/oe-use-libc-malloc.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.12 =3D>
> redis-7.0.13}/redis.conf (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.12 =3D>
> redis-7.0.13}/redis.service (100%)
>   rename meta-oe/recipes-extended/redis/{redis_7.0.12.bb =3D>
> redis_7.0.13.bb} (96%)
>   create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2021-37501.pa=
tch
>   delete mode 100644
> meta-oe/recipes-support/openldap/openldap/0001-ldif-filter-fix-parallel-b=
uild-failure.patch
>   delete mode 100644
> meta-oe/recipes-support/openldap/openldap/0001-libraries-Makefile.in-igno=
re-the-mkdir-errors.patch
>   delete mode 100644
> meta-oe/recipes-support/openldap/openldap/0001-librewrite-include-ldap_pv=
t_thread.h-before-redefini.patch
>   delete mode 100644
> meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
>   delete mode 100644
> meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
>   rename meta-oe/recipes-support/openldap/{openldap_2.5.12.bb =3D>
> openldap_2.5.16.bb} (96%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2023-41164.patch
>   rename meta-python/recipes-devtools/python/{python3-django_3.2.20.bb
> =3D> python3-django_3.2.21.bb} (61%)
>   rename meta-python/recipes-devtools/python/{python3-django_4.2.3.bb =3D=
>
> python3-django_4.2.5.bb} (61%)
>

