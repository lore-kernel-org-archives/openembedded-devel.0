Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0354EC7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 16:26:21 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.161.1685636776501094682
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 09:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=g2FxUzEX;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-19f31d6b661so1263213fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 09:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685636776; x=1688228776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCNWUSmemzJSQyU1lxJIcE8frPrUfD8qXscbPJZUzqU=;
        b=g2FxUzEX6SetYrUi6gf9Jzwl9tTFbk4APumdeLJipzi/SEEJTDM77E4DOEuAJioJJW
         YZgdMeJmIoFeLOATy3ZQf8OSzaH7Q2XOlQTPFuULn+l4ezQ3uNpFdgyWj85MiyFhbFfK
         GPiqOmJtqTF3JK/9ZJ9xDF9TreZWrkxU5848g4bUyTMElXxyqcG52Rvo2p50eYt82g2C
         FLFrB8eF5/LDwRysQS9z9hs4OnmAvJ93mVOdALHBof41GIXkNiBEbZM3LVvrCBzWItkm
         MBjMXxfReEyR50mbxQYnblsmQ6+jIwu0XYIrTaKpkVIgquBahDNGB6RfPm+q7r2cPpJb
         fLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685636776; x=1688228776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCNWUSmemzJSQyU1lxJIcE8frPrUfD8qXscbPJZUzqU=;
        b=c1+hmSr7tJPYvA1x1hpXSy/VI2iS0hWLM/uMklDVNB+D/mTl/sag4HgJdzhjsl6FnO
         4ALyMsyMnDDCbjCC3aFMOMe0qRAQM8fugDglPCAQAwINb3LpusZGhQkXfWnHOzC2Hfks
         cnPvgIW7jofm6rEsTFHZkMPmKoeiUSISyayr6xHv3rKo5cfd3sCeTYuIjqlyqrBybK9C
         E2iYJmXaeox1p6n2yx9c/BQJWZrLX4UPEDPAkvHbJ0k0vvBDuycA9VH0h0GOnpo1Ycf7
         TcNlcRI37gUETvjgP/m+vAMDV4UR1iLR2rmDZnydvHE+OSvwtqRTdVSYxNrHLLbj+Lq4
         XNzA==
X-Gm-Message-State: AC+VfDxaLd295f11PmGW8UeLXqTfJrrLOv1b7iq/8F+4jtrbplvIp0pg
	jxzFRZcoKb9CDhdw+sSCxyT2Yv7tRWgr3SVCFl0=
X-Google-Smtp-Source: ACHHUZ6eL5uZOC7cUy+R5OIpx8X/t4EitFAkqlLydI7vyxBWWqhDGO6o2nBi+ZzUGfF/rY9tZ5PWh1BLJW0rEmi2cTU=
X-Received: by 2002:a05:6870:3a2e:b0:1a1:2939:3ece with SMTP id
 du46-20020a0568703a2e00b001a129393ecemr4512579oab.36.1685636775644; Thu, 01
 Jun 2023 09:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230531082437.10646-1-brgl@bgdev.pl> <20230531082437.10646-5-brgl@bgdev.pl>
In-Reply-To: <20230531082437.10646-5-brgl@bgdev.pl>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Jun 2023 09:25:49 -0700
Message-ID: <CAMKF1srh+B4se32-5DUA9o7_9bWU5s7xKN-jc_d5F+=WUocUfg@mail.gmail.com>
Subject: Re: [meta-python][PATCH 004/149] python3-pywbem: don't use PYTHON_PN
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 16:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103081

seeing this

13:23:45 NOTE: Resolving any missing task queue dependencies
13:23:54 ERROR: Nothing RPROVIDES 'python3-yamlloader-native' (but
virtual:native:/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembe=
dded/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
RDEPENDS on or otherwise requires it)
13:23:54 NOTE: Runtime target 'python3-yamlloader-native' is
unbuildable, removing...
13:23:54 Missing or unbuildable dependency chain was:
['python3-yamlloader-native']
13:23:54 NOTE: Runtime target 'python3-pywbemtools' is unbuildable, removin=
g...
13:23:54 Missing or unbuildable dependency chain was:
['python3-pywbemtools', 'python3-pywbem-native',
'python3-yamlloader-native']
13:23:54 NOTE: Runtime target 'python3-pywbemtools-dev' is
unbuildable, removing...
13:23:54 Missing or unbuildable dependency chain was:
['python3-pywbemtools-dev', 'python3-pywbem-native',
'python3-yamlloader-native']
13:23:59 ERROR: Nothing RPROVIDES 'python3-nocasedict-native' (but
virtual:native:/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembe=
dded/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
RDEPENDS on or otherwise requires it)
13:23:59 NOTE: Runtime target 'python3-nocasedict-native' is
unbuildable, removing...
13:23:59 Missing or unbuildable dependency chain was:
['python3-nocasedict-native']
13:24:04 ERROR: Nothing RPROVIDES 'python3-nocaselist-native' (but
virtual:native:/mnt/jenkins/workspace/Yocto-world-arm/sources/meta-openembe=
dded/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
RDEPENDS on or otherwise requires it)
13:24:04 NOTE: Runtime target 'python3-nocaselist-native' is
unbuildable, removing...
13:24:04 Missing or unbuildable dependency chain was:
['python3-nocaselist-native']

On Wed, May 31, 2023 at 1:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We no longer support python2. Drop PYTHON_PN and use python3 explicitly.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../pywbem/python3-pywbem_1.6.1.bb            | 34 +++++++++----------
>  1 file changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb =
b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> index 8b0383cf6..c84576382 100644
> --- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> +++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> @@ -21,26 +21,26 @@ SRC_URI[sha256sum] =3D "abdbd6ce08b6c597cdd6c7730e6b4=
9a842d913f2f6b3cc62b585c58ec3
>  inherit pypi setuptools3 update-alternatives
>
>  DEPENDS +=3D " \
> -    ${PYTHON_PN}-ply-native \
> -    ${PYTHON_PN}-pyyaml-native \
> -    ${PYTHON_PN}-six-native \
> -    ${PYTHON_PN}-wheel-native \
> +    python3-ply-native \
> +    python3-pyyaml-native \
> +    python3-six-native \
> +    python3-wheel-native \
>  "
>
>  RDEPENDS:${PN} +=3D "\
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-io \
> -    ${PYTHON_PN}-netclient \
> -    ${PYTHON_PN}-ply \
> -    ${PYTHON_PN}-pyyaml \
> -    ${PYTHON_PN}-six \
> -    ${PYTHON_PN}-stringold \
> -    ${PYTHON_PN}-threading \
> -    ${PYTHON_PN}-unixadmin \
> -    ${PYTHON_PN}-xml \
> -    ${PYTHON_PN}-nocasedict \
> -    ${PYTHON_PN}-nocaselist \
> -    ${PYTHON_PN}-yamlloader \
> +    python3-datetime \
> +    python3-io \
> +    python3-netclient \
> +    python3-ply \
> +    python3-pyyaml \
> +    python3-six \
> +    python3-stringold \
> +    python3-threading \
> +    python3-unixadmin \
> +    python3-xml \
> +    python3-nocasedict \
> +    python3-nocaselist \
> +    python3-yamlloader \
>  "
>
>  ALTERNATIVE:${PN} =3D "mof_compiler"
> --
> 2.39.2
>

