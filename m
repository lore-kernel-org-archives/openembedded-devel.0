Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BF6EB64DB
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:05:28 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.13847.1687446327278110422
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IinCZMUs;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1a9a42edfc9so6434596fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 08:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687446326; x=1690038326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORVSautGzHnhlLVEfvG/TwCg0vASabyckD3b2ikB/IE=;
        b=IinCZMUsYQeJXLmbthhd09Mc1zT3bg2P0fm4zpvKUYW4JcVRDbDp4l8+5iJLgcKTYB
         2xWo2/nr2SHvdF92m7Um6P0MyCR1Faia7tBhIfwKbv/jgFo0fzPQhQ8krT7+A198fuAb
         qRji5aesEx7S9OXic4oOe9YU0tlQ0oyDL2osumECR5M7LUWJ299DksvUPYyO2K/QO45G
         DiXwkYZlOa+pmSSHTsM1uT/3fTCmeWqdzy/27vZ5GeHj/Jk4SBAuML23X1MM6GBFtEzN
         Dg0H0z8GPh+zp/+xENAXFVQ6ifowkS4SqoBsdhTZsBK0usCwioDO0ZsNWbMFjGAXJtxn
         AtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687446326; x=1690038326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORVSautGzHnhlLVEfvG/TwCg0vASabyckD3b2ikB/IE=;
        b=jqnJoRI62iiZgabJnLISrhjkgWeCCekcCeWSuVV64do/9sIzLo0obpj2TzJg0SKke5
         A2ckxHm15DnjEQjGTgQcqtVQmCpCHOPtCRiEe6iKu8kQcXENccrzPDNF7EYhSGRlhIVn
         t+B2GoAYI0W2BzX5AFeiGIkMIa0KRDo7d8aXKQxDW+e1DZdwjxLYt2bZgjC/L+KFt5sr
         MeM3jemlnYKsJsi0hhBclcPp0/pBB9stbiJfUQArdneRhhtMx3NEvkCJdMPosbJmnEOS
         zX4DEo/oUhEvcxwMmQx6Mp5YYS1tnQxafmXSP+AGdnJPj0uoasSyC11jykgwfr1PQtsT
         iepA==
X-Gm-Message-State: AC+VfDxcTOnLIcEoqAMF9rPk426any3hSHFuAWiko2l3qd8SWOgpDOTy
	fEMq8mOU7OR45VlcbxmJL+DNG46jpXgjnHb6gEez+kwt
X-Google-Smtp-Source: ACHHUZ5wEZ1wvu+HjN9h/KIC/u1Qw04IoqObNC7Quk2Nox8ZAmY5bh+3sWGgeQVuXX86UA/5lqM1L/OWa+o8hTGpffA=
X-Received: by 2002:a05:6870:5a9b:b0:193:8ac1:9025 with SMTP id
 dt27-20020a0568705a9b00b001938ac19025mr12541870oab.6.1687446326367; Thu, 22
 Jun 2023 08:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <5b6db4a5-9c0f-e83d-f6de-9ae7551aed56@gmail.com>
In-Reply-To: <5b6db4a5-9c0f-e83d-f6de-9ae7551aed56@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Jun 2023 08:05:00 -0700
Message-ID: <CAMKF1srj_DWGoG5NhLVB=5rd93UggGf9jqYDuh4GPf+wcXxjaA@mail.gmail.com>
Subject: Re: kirkstone merge request: June 22nd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 15:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103491

merged. thanks Armin.

On Thu, Jun 22, 2023 at 2:52=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit bdad2a789e30703a825b876279665720d06d55=
dc:
>
>    python3-werkzeug: fix for CVE-2023-23934 (2023-06-11 11:43:33 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to a82d92c8a6525da01524bf8f4a60bf6b35dcbb3d:
>
>    ExprTk: Update package to release/0.0.2 (2023-06-19 09:17:01 -0400)
>
> ----------------------------------------------------------------
> Adrian Zaharia (1):
>        lapack: add packageconfig for lapacke
>
> Arash Partow (1):
>        ExprTk: Update package to release/0.0.2
>
> Ashish Sharma (1):
>        openldap: Fix CVE-2023-2953
>
> Chen Qi (1):
>        redis: use the files path correctly
>
> Hitendra Prajapati (1):
>        wireshark: CVE-2023-2952 XRA dissector infinite loop
>
> Narpat Mali (3):
>        python3-django: fix for CVE-2023-31047
>        python3-django: upgrade 3.2.12 -> 3.2.19
>        python3-sqlparse: fix for CVE-2023-30608
>
> Peter Marko (1):
>        c-ares: ignore CVE-2023-31124
>
> Polampalli, Archana (2):
>        samba: fix CVE-2022-41916
>        samba: fix CVE-2021-44758
>
> Polampalli, Archana A (1):
>        samba: fix CVE-2022-3437
>
> Polampalli, Archana =C3=B1 (1):
>        samba: fix CVE-2022-45142
>
> Soumya (1):
>        opencv: Fix for CVE-2023-2617
>
> Xiangyu Chen (1):
>        meta-oe: add pahole to NON_MULTILIB_RECIPES
>
> sana kazi (1):
>        Googletest: Adapt googletest 1.11.0 with gcc11
>
>   .../recipes-connectivity/samba/samba/CVE-2021-44758.patch      | 72 +++=
+++
>   .../recipes-connectivity/samba/samba/CVE-2022-3437-0001.patch  | 77 +++=
+++
>   .../recipes-connectivity/samba/samba/CVE-2022-3437-0002.patch  | 35 +++
>   .../recipes-connectivity/samba/samba/CVE-2022-3437-0003.patch  | 50 +++=
+
>   .../recipes-connectivity/samba/samba/CVE-2022-3437-0004.patch  | 57 +++=
++
>   .../recipes-connectivity/samba/samba/CVE-2022-3437-0005.patch  | 37 +++
>   .../recipes-connectivity/samba/samba/CVE-2022-3437-0006.patch  | 65 +++=
++
>   .../recipes-connectivity/samba/samba/CVE-2022-3437-0007.patch  | 39 +++
>   .../recipes-connectivity/samba/samba/CVE-2022-3437-0008.patch  | 48 +++=
+
>   .../recipes-connectivity/samba/samba/CVE-2022-41916.patch      | 38 +++
>   .../recipes-connectivity/samba/samba/CVE-2022-45142.patch      | 51 +++=
+
>   meta-networking/recipes-connectivity/samba/samba_4.14.14.bb    | 11 +
>   .../recipes-support/wireshark/files/CVE-2023-2952.patch        | 98
> ++++++++
>   meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb  | 1 +
>   meta-oe/conf/layer.conf                                        | 2 +-
>   meta-oe/recipes-devtools/exprtk/exprtk_git.bb                  | 4 +-
>   meta-oe/recipes-devtools/lapack/lapack_3.10.0.bb               | 3 +
>   .../0001-src-Do-not-reset-FINAL_LIBS.patch                     | 0
>   .../0006-Define-correct-gregs-for-RISCV32.patch                | 0
>   .../redis/{redis-7 =3D> redis-7.0.11}/GNU_SOURCE-7.patch |   0
>   .../hiredis-use-default-CC-if-it-is-set.patch                  | 0
>   .../redis/{redis-7 =3D> redis-7.0.11}/init-redis-server |   0
>   .../lua-update-Makefile-to-use-environment-build-setting.patch | 0
>   .../redis/{redis-7 =3D> redis-7.0.11}/oe-use-libc-malloc.patch |   0
>   .../redis/{redis-7 =3D> redis-7.0.11}/redis.conf |   0
>   .../redis/{redis-7 =3D> redis-7.0.11}/redis.service |   0
>   meta-oe/recipes-extended/redis/redis_7.0.11.bb                 | 2 -
>   meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb                | 4 +
>   meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch      | 88
> +++++++
>   meta-oe/recipes-support/opencv/opencv_4.5.5.bb                 | 1 +
>   .../recipes-support/openldap/openldap/CVE-2023-2953-1.patch    | 30 +++
>   .../recipes-support/openldap/openldap/CVE-2023-2953-2.patch    | 76 +++=
+++
>   meta-oe/recipes-support/openldap/openldap_2.5.12.bb            | 2 +
>   .../googletest/files/0001-work-around-GCC-6-11-ADL-bug.patch   | 42 +++=
+
>   meta-oe/recipes-test/googletest/googletest_git.bb              | 3 +-
>   .../python/python3-django/CVE-2023-31047.patch                 | 352
> ++++++++++++++++++++++++++++
>   meta-python/recipes-devtools/python/python3-django_2.2.28.bb   | 2 +
>   .../{python3-django_3.2.12.bb =3D> python3-django_3.2.19.bb} |   2 +-
>   .../python/python3-sqlparse/CVE-2023-30608.patch               | 75 +++=
+++
>   meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb  | 1 +
>   40 files changed, 1361 insertions(+), 7 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2021-44758.patch
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0001.patch
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0002.patch
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0003.patch
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0004.patch
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0005.patch
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0006.patch
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0007.patch
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2022-3437-0008.patch
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2022-41916.patch
>   create mode 100644
> meta-networking/recipes-connectivity/samba/samba/CVE-2022-45142.patch
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2952.patch
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/GNU_SOURCE-7.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/hiredis-use-default-CC-if-it-is-set.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/init-redis-server (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/lua-update-Makefile-to-use-environment-build-setting.patch
> (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/oe-use-libc-malloc.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/redis.conf (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7 =3D>
> redis-7.0.11}/redis.service (100%)
>   create mode 100644
> meta-oe/recipes-support/opencv/opencv/CVE-2023-2617.patch
>   create mode 100644
> meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
>   create mode 100644
> meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
>   create mode 100644
> meta-oe/recipes-test/googletest/files/0001-work-around-GCC-6-11-ADL-bug.p=
atch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2023-31047.patch
>   rename meta-python/recipes-devtools/python/{python3-django_3.2.12.bb
> =3D> python3-django_3.2.19.bb} (77%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-sqlparse/CVE-2023-30608.patch

