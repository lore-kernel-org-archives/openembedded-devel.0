Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C86CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:22:30 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.229248.1697566949194614935
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Oct 2023 11:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zoo0A+Yz;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1dceb2b8823so3057917fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 11:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697566948; x=1698171748; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLmeup1lyVdYixJ1aNJSitcwsclqUjeTovRPtGX3D40=;
        b=Zoo0A+YzRB2njkM50VnzleJ/fyow0sekaVQkQffAeG2Kbh2X1gBc0FtsUz8o1DS6W+
         GcdVaypUNUGjwXJJtTt/ys1pxxd6oGdZisSeQRfpSgaxDEolzoPKY4VpwsClKoDwRlal
         BsZbAfCAVyfprG0hmblSMdgt+MkuyBVMkMhRX5fz5d1G55mul8cfy0dU5I5F3U1xcGuy
         n3/EfZw7cfbw76dMBrfJOvFL1dIis4OZIRkMDt6zkljUxkQc62A55ce35LGbQOnhGUas
         6p93qswnV4F7y7INahiRzyVsdGrTXiMkhHpW+3Y69mKBvIh8JN4fuVlEGAVoDGtrvzDp
         XbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697566948; x=1698171748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLmeup1lyVdYixJ1aNJSitcwsclqUjeTovRPtGX3D40=;
        b=pTHhC6OE7BnVGnsCVn/RvLRvBDD4s4uZkJPoi80NbsQyzDB3ENFeCbNHZnhDGMJ+dQ
         k8/00AcwjJFbFDITQkxrwRfMhM2SXP1BeLuQpG6lOv1h4NEWbUzi6/alnnngkR6B8Jf3
         esW3TlXjUHToV37E8KN7/nBA+4ExFOmXR/alNr+n3G7VOg4oYBaplOjuiTGK/xrHtl+4
         6HnTjx1t22T7bMivbpB5xZrGkNbXcGpZLD/xh720oCwIsBGg49MG0Jp45ZcFgYSVAEk1
         s2ZW04zdiE6o9i1pHzZZ6kZW55afcCrDNCYKi1sQpk3b9TUiXLZ7kLtp/hGKtu3SA9xI
         k24Q==
X-Gm-Message-State: AOJu0YzabJ4nz55WThODT+G0GPzbyvHQwlXimggKx7SwEGDAYvnw9XMD
	RaEMCQWz7oYHMVfDBq16m1hqWy/VovRJGVAiKrM=
X-Google-Smtp-Source: AGHT+IFNe5sIbUmd+Drj1emrajyPW6/jwH5OhA1Xx96g0K3RGb6k2wrYi1mt2JracQYZ8LH8AJmiqPieDmHprhEh5/Q=
X-Received: by 2002:a05:6870:1688:b0:1e9:97f2:501e with SMTP id
 j8-20020a056870168800b001e997f2501emr1565441oae.20.1697566948370; Tue, 17 Oct
 2023 11:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <51e74848-ab36-4dc2-97bb-760c2b26e40a@gmail.com>
In-Reply-To: <51e74848-ab36-4dc2-97bb-760c2b26e40a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Oct 2023 11:22:02 -0700
Message-ID: <CAMKF1sq95_f5kZ0e2M32MhV3FswkhbciY1CWVpdKk=imWdF7dQ@mail.gmail.com>
Subject: Re: mickledore merge request: Oct 17th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 18:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105558

merged thanks Armin

On Tue, Oct 17, 2023 at 5:21=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 922f41b39f364e5b6be596b4b51e0fb37ffe19=
71:
>
>    x11vnc: Fix CVE-2020-29074 (2023-09-27 07:40:56 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded mickledore-next
>
> for you to fetch changes up to 39968837196cb48209b71e8852dd04a2f8ccdca8:
>
>    nginx: add configure option (2023-10-15 19:09:42 -0400)
>
> ----------------------------------------------------------------
> Changqing Li (1):
>        redis: upgrade 7.0.12 -> 7.0.13
>
> Joe Slater (2):
>        python3-inotify: fix tests
>        nginx: add configure option
>
> Khem Raj (1):
>        kernel-selftest: Build headers before compiling tests
>
> Meenali Gupta (1):
>        lldpd: upgrade 1.0.16 -> 1.0.17
>
> Robert Yang (1):
>        frr: Fix CVE-2023-41358 and CVE-2023-41360
>
> Yi Zhao (1):
>        frr: Security fix CVE-2023-38802
>
>   .../recipes-daemons/lldpd/{lldpd_1.0.16.bb =3D> lldpd_1.0.17.bb} |   2 =
+-
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch  | 139
> +++++++
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch  | 106
> +++++
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-41360.patch  | 35 ++
>   meta-networking/recipes-protocols/frr/frr_8.4.4.bb              | 3 +
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
>   meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb       | 2 +-
>   .../python/python3-inotify/new-test-inotify.patch               | 620
> ++++++++++++++++++++++++++++
>   meta-python/recipes-devtools/python/python3-inotify_git.bb      | 1 +
>   .../recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch | 39 ++
>   meta-webserver/recipes-httpd/nginx/nginx.inc                    | 3 +
>   20 files changed, 949 insertions(+), 3 deletions(-)
>   rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.16.bb =3D>
> lldpd_1.0.17.bb} (96%)
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-38802.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-41360.patch
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
>   create mode 100644
> meta-python/recipes-devtools/python/python3-inotify/new-test-inotify.patc=
h
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-conf.patc=
h
>

