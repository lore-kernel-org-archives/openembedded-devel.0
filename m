Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B38C7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 14:50:15 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.10904.1684939810889359125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 07:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=agbS7KFB;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6af6fe73f11so269133a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684939810; x=1687531810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPraXS8qi6+HJ0EBzuZGn5cyl/3kxTeUC9coC9hue24=;
        b=agbS7KFB1qVo0hvkeqSXmL/dRwnFEvsKkYX2OFKkNEcD8NCg4NcwZVBYOcc9xMEPpi
         NZKEuf4HU+q8bv9ZTFgMPenFEtqKob54aNV5SedWQEA4uDGpnsoK/D+ByObfg6tFiFWW
         mOE24FUU5UYRiJEdaJYmv9xPhckYH2b/h9UwpQKSsWgpZDVkADwf7+/RB8Xh3sQwgOhM
         rZ4FnVNtV5PnbHFG+TUKei3n08suQgdVT41hrHFG1cz8UreyVOGVubASW7teq1ZuSMjM
         Cl/tqkVU7EjpU2jZQtdXM5CPb6crkPoQpwgJAkkI0MPUlQnZHd0UITV++gAHNdZVzt6m
         ucLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684939810; x=1687531810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPraXS8qi6+HJ0EBzuZGn5cyl/3kxTeUC9coC9hue24=;
        b=hg46DvGsf/dMR0egLHzAAU49lt6IJwx8vKdIRCC9pLbQnTx6vosS2RUkX/YJHq9YDJ
         qsd3tqOnN0vZrl5598b0uXZF5e0W9sPOCUNpTspn9zpuNXZRwRbalE0bdliIHMmc9NiS
         DTIJJTjD0scYD+N+IsiZpcnG8ftThQNnc33YZ88kSxpSSVuVmgq0tCTdNAck4g08fbTF
         0hPkITvww30ixYYl4eOd8d7UmLRWt9+yWSId+86hfILujCV0FSa6jD6D+vqSVqO91YZa
         3sSY+fV27xNvS+vlZEsTJO9X5bwvV9W2b5mnMgpWYz/8zt/cYGLjXZZ2akZFMgLdd8hj
         kj7g==
X-Gm-Message-State: AC+VfDyobF1plAd7CS2Zeh1H2omy7hW8pawyO+qoQrC8TZZ1X1M0sfqd
	ohIEIO7qqehFd/pwm/UHF8GzHoWim//7n0KRvAc=
X-Google-Smtp-Source: ACHHUZ4rMCnP3fSfrFxU2nROzzXeS61srvZ2QY8tzY9M+WeQtv+h7WEqnmhNO3K95bGcOpw3mIi9LY6LRthl8nOpD3Y=
X-Received: by 2002:a05:6808:6142:b0:398:9fa:655e with SMTP id
 dl2-20020a056808614200b0039809fa655emr5464446oib.31.1684939809892; Wed, 24
 May 2023 07:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <e170e710-8558-0c1a-2ebb-6a09e8f3594c@gmail.com>
In-Reply-To: <e170e710-8558-0c1a-2ebb-6a09e8f3594c@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 May 2023 07:49:43 -0700
Message-ID: <CAMKF1sqQz7-Efgk=tEYuO_sN=QixPfrOhTmJhGGhNGs1YwA4zQ@mail.gmail.com>
Subject: Re: kirkstone merge request: May 24th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 14:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102782

merged thanks.

On Wed, May 24, 2023 at 7:43=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 9e539aaed608a03b1128a7361426703d8f9ba7=
05:
>
>    capnproto: upgrade to 0.9.2 (2023-05-09 06:51:22 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 5f120a926b0fcd55cfe7565bb7ddf23661cad498:
>
>    libbpf: installing uapi headers for native package (2023-05-23
> 23:12:51 -0400)
>
> ----------------------------------------------------------------
> Chee Yang Lee (1):
>        freerdp: fix CVE-2022-39316/39318/39319
>
> Khem Raj (1):
>        nodejs: Fix build with gcc13
>
> Martin Jansa (1):
>        abseil-cpp: backport a fix for build with gcc-13
>
> Xiangyu Chen (2):
>        Revert "pahole: fix native package build error"
>        libbpf: installing uapi headers for native package
>
>   ...1-absl-strings-internal-str_format-extension.h-add-mis.patch | 31
> ++++++++++++
>   meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb           | 1 +
>   meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch              | 75
> +++++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/nodejs/nodejs_16.19.1.bb               | 1 +
>   meta-oe/recipes-devtools/pahole/pahole_1.22.bb                  | 1 -
>   meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb                   | 5 ++
>   meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch    | 53
> ++++++++++++++++++++
>   .../recipes-support/freerdp/freerdp/CVE-2022-39318-39319.patch  | 41
> ++++++++++++++++
>   meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb                | 2 +
>   9 files changed, 209 insertions(+), 1 deletion(-)
>   create mode 100644
> meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-strings-internal=
-str_format-extension.h-add-mis.patch
>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
>   create mode 100644
> meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch
>   create mode 100644
> meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39318-39319.patch
>

