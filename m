Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.8265.1613572476929890663
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 06:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D6hKCQMQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id hs11so22574765ejc.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 06:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BIAv3vTVvK5KA8WbfaY/mJvvF9tMHWZM7osO4zsbbOc=;
        b=D6hKCQMQ/A3RMsRjbG/J6+ictNmFPmYJ9gpmwrBf1htkiPpg9lyQwo8mEXzqr22dYs
         6vkQeZBAlwn1Cxz7/+dRo20qp/jCnv9Jt52S0Wi8rjJVN1+8QAICI34f3z4KV6MeqMOH
         0pQ0tIFCq/ClT+VPnEspFYJ9uddNTbMZnpIzQu5vNChsVdJwWMg1JGZHsEuoEFvJJDeE
         kU4UVgRFgfePeJI2AizkuPJP7rBTObXu7X0LIJJlikikrmmBaDv+KSWRJdk6kdS2uUyg
         trtwUmIHc56WSZykKgZx/kzgpaqz5q+dgbEZQCPDQ4XoojgJfvE/biw9+LAFwHUBGZCG
         sa4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BIAv3vTVvK5KA8WbfaY/mJvvF9tMHWZM7osO4zsbbOc=;
        b=YoxvFdkUKkfuCCQBHr9Z7/88E7n7KONOHxmdxE5x1QHsfJJyyrhm/kfFdBmnjGKC+4
         8RWxJsINAPBJ47d/b64HKl+ZGnzcbe6IO3yis6iCQTTp2meozj+JstySUKN6mfPUcz4w
         QJpioKzGpOrmRavrpBDQNzD9cDsfNazVDVOWSDHmN/rnJLk5ynnRax71cViik1zLcWd/
         noKDEyfVmBXTE9eseI0Srs7t3cj9xGC+3VS9v2jmqZTMDPDO1IWxTC605EPj6aVMXZCR
         WGUUgGwKKgg0IYGNqDJbWleTKlyRzUNc+mD+LppgkpwOgsraJSt0JyYe/IgNePBD2rJG
         +SuA==
X-Gm-Message-State: AOAM532Jo+dag9rlZO5iyrnT+yRmf423ZlmLGoLkF0q1qOeoHtNgQpw4
	bmDrewCwrghGhsLEkUoSviNeTXpg3Gn65GaxVFU=
X-Google-Smtp-Source: ABdhPJwSjzUUPXrU4NJCuD+1gjWWwPAqvVxwsPypTq/CMhjfsXXM4jyPyiKiPbbPPnyOtYVKRSVmj5kpef9bD8AXDFE=
X-Received: by 2002:a17:906:3ad0:: with SMTP id z16mr25991028ejd.72.1613572475296;
 Wed, 17 Feb 2021 06:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20210217140929.987752-1-liu.ming50@gmail.com>
In-Reply-To: <20210217140929.987752-1-liu.ming50@gmail.com>
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
Date: Wed, 17 Feb 2021 17:34:24 +0300
Message-ID: <CALT56yMN64qqpOO6k8yrKYrMiLSiCoQd6teB+aJQkc8CgSj1Hw@mail.gmail.com>
Subject: Re: [yocto] [meta-security] [PATCH 0/5] Some fixes for IMA/EVM
To: Ming Liu <liu.ming50@gmail.com>
Cc: yocto@lists.yoctoproject.org, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>, sergio.prado@toradex.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I suppose, patch 3 can be split into logical chunks.
Other patches are:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

=D1=81=D1=80, 17 =D1=84=D0=B5=D0=B2=D1=80. 2021 =D0=B3. =D0=B2 17:09, Ming=
 Liu <liu.ming50@gmail.com>:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> Ming Liu (5):
>   ima-evm-utils: set native REQUIRED_DISTRO_FEATURES to empty
>   initramfs-framework-ima: fix a wrong path
>   meta: refactor IMA/EVM sign rootfs
>   initramfs-framework-ima: let ima_enabled return 0
>   ima-evm-rootfs.bbclass: avoid generating /etc/fstab for wic
>
>  meta-integrity/README.md                      |  4 ++-
>  meta-integrity/classes/ima-evm-rootfs.bbclass | 33 +++++++++----------
>  .../initrdscripts/initramfs-framework-ima.bb  |  2 +-
>  .../initrdscripts/initramfs-framework-ima/ima |  3 +-
>  .../ima-evm-keys/ima-evm-keys_1.0.bb          | 16 +++++++++
>  .../ima-evm-utils/ima-evm-utils_git.bb        |  1 +
>  6 files changed, 38 insertions(+), 21 deletions(-)
>  create mode 100644 meta-integrity/recipes-security/ima-evm-keys/ima-evm=
-keys_1.0.bb
>
> --
> 2.29.0
>
>
>=20
>


--=20
With best wishes
Dmitry
