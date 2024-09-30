Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDA3CF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 05:05:27 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.47518.1727672725342479480
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Sep 2024 22:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HpQE7W4l;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5e1b35030aeso2316575eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 22:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727672724; x=1728277524; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBw97+JgaDTw0uw34ixRrmv/5Vi0DujOYa8PqlzCSys=;
        b=HpQE7W4lqQANuzTFwWKp/AWtwz11cOspm0sE72FCfiI7LV42jyYicF+7gMMuC1I9Ft
         bDJzhug9qCY9JGbx5puVysq0ELlojly8spLxLAh4BgR26AMuU4dhTT0dZo9qeRv9/LrZ
         ZkDwHJtFZxG5MwDKMU7XjnkuD+xNgneW0ySpMDkdpYxVXxcmbhaQR7ZGSJBapGUWoYVF
         XVKPdqZd5XmuYENvxI03dNmpgAXCojg549kskmpVQaxJhMSaqMwNfJRTfAx9wTMR1+I8
         NiEVb7HVlFv2prQtpLH3tDjlZDDL+axajpfs1rSM3SA0SMfCADCm4YUnIzD+6rYJpo1Y
         z+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727672724; x=1728277524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBw97+JgaDTw0uw34ixRrmv/5Vi0DujOYa8PqlzCSys=;
        b=GHOT85a1hCwIbgoyPTpIRv8K84UQlaABf5yVtDep49/XeenvmwBwQ37SPqnChjLfyH
         TyW4HwlwHS0F3jcdTfPApapBndVf4c0SaJMCM4ftn9rVTLsiiHdJbLAvlfodwGWBrdNY
         6+1ffKV33zc1gO9utqqbvstiV59BsQ9IZj+LOhHSc8Tov0DSzXDzG+10ymf7htC2KDZ8
         OVB0EeGF5oHy5mzlXQsp1uXaaP57HxgTd7bBfGWY2nBJuC4VPBVOiJGMBMLIh7Pi4EHw
         wp1CCJ/pYicyDf/6gxpILoatmTz191evVgV4tTmZfgIvxEHVcNbjJ1zPEfbquFxi1uun
         Dr0A==
X-Gm-Message-State: AOJu0YyQIQLKTzspokwpyY97rZPROYGLmT2Yd6//v6G7IPs2WWH/ZB44
	e4MhJEZsqmYE2U1w1I5h9urKY0C8k0/UEJyd8lSIp88XBvqs+5Jn+TR2RC86f8IGPZxA6M/uIr+
	PWk0U/KGkijNoPSjIKam8OhGja+7IfQ==
X-Google-Smtp-Source: AGHT+IHPPZTWZntwUqmovZwggH6LTBFY7gA01rNZUqpgCNjnAzgHDRanD2m0lRduDgV4D/esrgD1v16b0hJt+Sz50oA=
X-Received: by 2002:a05:6870:7186:b0:261:b48:3c99 with SMTP id
 586e51a60fabf-28710a986b8mr5652780fac.23.1727672724368; Sun, 29 Sep 2024
 22:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240930050232.1702649-1-yi.zhao@windriver.com>
In-Reply-To: <20240930050232.1702649-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Sep 2024 22:04:57 -0700
Message-ID: <CAMKF1spmVDKUYSRYSakyHOhLafpoUzgS5Y8NFkLf0wqD9Q9wNg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pahole: upgrade 1.25 -> 1.27
To: yi.zhao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 05:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112559

On Sun, Sep 29, 2024 at 10:02=E2=80=AFPM Yi Zhao via lists.openembedded.org
<yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> ChangeLog:
> https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.26=
?h=3Dv1.27
> https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.27=
?h=3Dv1.27
>
> Add more architectures to COMPATIBLE_HOST, as libbpf is now allowed to
> be built on more architectures[1].
>
> [1] https://git.openembedded.org/meta-openembedded/commit/?id=3Dbb8049afe=
96db57707afc259743e288bec456117
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch} | 1 -
>  .../pahole/{pahole_1.25.bb =3D> pahole_1.27.bb}               | 6 +++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-devtools/pahole/files/{0002-Use-usr-bin-env-pytho=
n3-instead-of-just-usr-bin-pyth.patch =3D> 0001-Use-usr-bin-env-python3-ins=
tead-of-just-usr-bin-pyth.patch} (99%)
>  rename meta-oe/recipes-devtools/pahole/{pahole_1.25.bb =3D> pahole_1.27.=
bb} (81%)
>
> diff --git a/meta-oe/recipes-devtools/pahole/files/0002-Use-usr-bin-env-p=
ython3-instead-of-just-usr-bin-pyth.patch b/meta-oe/recipes-devtools/pahole=
/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
> similarity index 99%
> rename from meta-oe/recipes-devtools/pahole/files/0002-Use-usr-bin-env-py=
thon3-instead-of-just-usr-bin-pyth.patch
> rename to meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-pyth=
on3-instead-of-just-usr-bin-pyth.patch
> index 4f7dfd4cc..7dc18d7aa 100644
> --- a/meta-oe/recipes-devtools/pahole/files/0002-Use-usr-bin-env-python3-=
instead-of-just-usr-bin-pyth.patch
> +++ b/meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-=
instead-of-just-usr-bin-pyth.patch
> @@ -4,7 +4,6 @@ Date: Wed, 15 Sep 2021 17:54:01 +0200
>  Subject: [PATCH] Use /usr/bin/env python3 instead of just /usr/bin/pytho=
n3
>
>  Upstream-Status: Inappropriate [OE specific]
> -
>  ---
>   ostra/ostra-cg        | 2 +-
>   ostra/python/ostra.py | 2 +-
> diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.25.bb b/meta-oe/rec=
ipes-devtools/pahole/pahole_1.27.bb
> similarity index 81%
> rename from meta-oe/recipes-devtools/pahole/pahole_1.25.bb
> rename to meta-oe/recipes-devtools/pahole/pahole_1.27.bb
> index 1334c850e..902b0e61b 100644
> --- a/meta-oe/recipes-devtools/pahole/pahole_1.25.bb
> +++ b/meta-oe/recipes-devtools/pahole/pahole_1.27.bb
> @@ -7,11 +7,11 @@ DEPENDS =3D "elfutils zlib libbpf"
>
>  # Depends on MACHINE_ARCH libbpf
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> -COMPATIBLE_HOST =3D "(x86_64|i.86|aarch64).*-linux"
> +COMPATIBLE_HOST =3D "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|=
mips64).*-linux"

It might be time to reverse the check and add an exclusion check
instead here. So set something like

COMPATIBLE_HOST:mips =3D "null"
...


>
> -SRCREV =3D "81558a5a996005df0d607dd33f74ec5b7bdb619d"
> +SRCREV =3D "3e265dac5ec85b956c664464072196c37d2af4f3"
>  SRC_URI =3D "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=
=3Dmaster \
> -           file://0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-p=
yth.patch"
> +           file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-p=
yth.patch"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112558): https://lists.openembedded.org/g/openembedde=
d-devel/message/112558
> Mute This Topic: https://lists.openembedded.org/mt/108730689/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

