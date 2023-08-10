Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFFDC04E69
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 14:45:06 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.19023.1691678701155469401
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 07:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=oOxnMOwT;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5633b7e5f90so806237eaf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 07:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691678700; x=1692283500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SVzYRGFG5I/vQdkzS6ZZ3JWHmsqEWV4dJd00BdqIAE=;
        b=oOxnMOwTxge49Go/raZCABSXnGC58sZ2ZDbO22CDRlIGqViS01qi5DRB9WQHs4q/d/
         kwi+FFyUHeGgFZeD0lOGP3GcN+Kpj2w7jugRl6pGN2xtXiMP18KaIlDYdsp+JGvAtElx
         1+0C6tstn5p/0btKyuZyqcn7uBuumObgAOWFAHdkmN/fjowM3/1W3gw2X9ixlC+3YEmw
         uaMUxOenXx+TZtwmV2alWSpDSCQFwybkzXuzM+BuEHXz/Rn9qAcddC1lIFIenr2RXNrm
         2wml+cfJmrTwC5rck4RZen3es0Mo1KE8fy9nk3TsI2P4kSsZnOikmDWrKINKwdVKXtf+
         wINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691678700; x=1692283500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SVzYRGFG5I/vQdkzS6ZZ3JWHmsqEWV4dJd00BdqIAE=;
        b=SDkL9eGCS9QogPMRqcmT2EfVP77WP1MNhYcYhhebBSD9AhFgGjSJcYxwVpIGBZpAkO
         3XMGaj/TlhJI8pADZxpAgC5voIc95AhnAl07C/2L113QusMfxD88i3UkX3Z2eXrOspxa
         T9wt3TJ8qJLALK57CyZQv9kJrTJUHd6oxO/Nym7hDj6UqRIyvA7w8rc+HnAXvy4KHsIj
         otNsL5BJRmjl647SGK3kmxe9kHuZxY1/cqraFnEUCEcUdAFiPTsT80Ah8RVK4HGgA8Xc
         8WWhQVXxSZruCMwJvA9qqEWfIhQ6082UnpWHqsIWGi19yntSdJ1nVInWOKPHc5EoRfRh
         HApA==
X-Gm-Message-State: AOJu0YyzpnWpmL0zSFuVob89WhZaZcFjW2IK4pwddlcTZE19ptVFBOnD
	TgFAemj6TuS59Umt7K78IlbWgERjLKCPG6GwvGM=
X-Google-Smtp-Source: AGHT+IHryKB9CSvVFselHiO+Az6CCaLbBriBrqOsWpuKK8OOvdqpW/N93hOmASrIl0KGRdRI3wq1aVinjPxi17wWBzI=
X-Received: by 2002:a4a:868d:0:b0:56d:2d49:13c2 with SMTP id
 x13-20020a4a868d000000b0056d2d4913c2mr1925871ooh.4.1691678700326; Thu, 10 Aug
 2023 07:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <14bbe32a-ff58-e649-b436-266da366f927@gmail.com>
In-Reply-To: <14bbe32a-ff58-e649-b436-266da366f927@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Aug 2023 07:44:34 -0700
Message-ID: <CAMKF1sphmjS+iB0BX0TV+Ukywzrvkc=h36NoqG6jpq58hvNBdA@mail.gmail.com>
Subject: Re: kirkstone merge request: Aug 10th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 14:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104323

merged thanks Armin

On Thu, Aug 10, 2023 at 7:17=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 4da92ed9be41734f6ced46b981958e2e868cbf=
f2:
>
>    python3-gcovr: Fix parsing of gcc-11 gcov metadata (2023-07-25
> 07:24:25 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 594c9cf6d3205c8e40ff772383fd9ab7dd3ed2cc:
>
>    redis: upgrade 7.0.11 -> 7.0.12 (2023-08-03 16:50:52 -0400)
>
> ----------------------------------------------------------------
> J.D. Schroeder (1):
>        Fix groupname gid change warning
>
> Narpat Mali (2):
>        python3-django: upgrade 3.2.19 -> 3.2.20
>        python3-django: upgrade 4.2.1 -> 4.2.3
>
> Polampalli, Archana (2):
>        yasm: fix CVE-2023-31975
>        redis: upgrade 7.0.11 -> 7.0.12
>
> Urade, Yogita (1):
>        zabbix: fix CVE-2023-29450
>
> Urade, Yogitag (1):
>        zabbix: fix CVE-2023-29449
>
>   meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb | 1 +
>   meta-networking/recipes-daemons/radvd/radvd.inc                 | 1 +
>   meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29449.patch | 247
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29450.patch | 241
> +++++++++++++++++++++++++++
>   meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb            | 2 +
>   meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.patch         | 29 ++=
++
>   meta-oe/recipes-devtools/yasm/yasm_git.bb                       | 1 +
>   .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
>   .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
>   .../redis/{redis-7.0.11 =3D> redis-7.0.12}/GNU_SOURCE-7.patch |   0
>   .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
>   .../redis/{redis-7.0.11 =3D> redis-7.0.12}/init-redis-server |   0
>   .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
>   .../{redis-7.0.11 =3D> redis-7.0.12}/oe-use-libc-malloc.patch |   0
>   .../redis/{redis-7.0.11 =3D> redis-7.0.12}/redis.conf |   0
>   .../redis/{redis-7.0.11 =3D> redis-7.0.12}/redis.service |   0
>   .../recipes-extended/redis/{redis_7.0.11.bb =3D> redis_7.0.12.bb} |   2=
 +-
>   .../{python3-django_3.2.19.bb =3D> python3-django_3.2.20.bb} |   4 +-
>   .../python/{python3-django_4.2.1.bb =3D> python3-django_4.2.3.bb} |   4=
 +-
>   19 files changed, 527 insertions(+), 5 deletions(-)
>   create mode 100644
> meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29449.patch
>   create mode 100644
> meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2023-29450.patch
>   create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-31975.pa=
tch
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/GNU_SOURCE-7.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/hiredis-use-default-CC-if-it-is-set.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/init-redis-server (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/lua-update-Makefile-to-use-environment-build-setting.patch
> (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/oe-use-libc-malloc.patch (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/redis.conf (100%)
>   rename meta-oe/recipes-extended/redis/{redis-7.0.11 =3D>
> redis-7.0.12}/redis.service (100%)
>   rename meta-oe/recipes-extended/redis/{redis_7.0.11.bb =3D>
> redis_7.0.12.bb} (96%)
>   rename meta-python/recipes-devtools/python/{python3-django_3.2.19.bb
> =3D> python3-django_3.2.20.bb} (59%)
>   rename meta-python/recipes-devtools/python/{python3-django_4.2.1.bb =3D=
>
> python3-django_4.2.3.bb} (61%)
>

