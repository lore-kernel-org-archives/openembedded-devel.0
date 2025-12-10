Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0105D3C90B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:57:43 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16247.1765375062590815294
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=0tiOySqZ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.169, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37b96cbd875so51850751fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1765375061; x=1765979861; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRpbg2Q+RMOdgMRsY20i79toOUivBfEI3R3ncw2XDGo=;
        b=0tiOySqZFatqeWij+FvF2eD40IQNkgqfsGyYnCMNS0OBiOcWXr/+QJ5wehTBfQstab
         RN9warSkplBZ9d+7WDprFnH4+CeNEN5+XBoTAJ74skiWhbvFcVcz5sEwPknKxr61sE/d
         JKoWpH2EI8CyzZKSpNrLwUmNgaFwHPvmJGZw/0EL59FYPeCciZe6X267CLxtJPyhLCIr
         grESnTvWBdVX8YArWsuWkYFNLW+Kt4JrumGkDxlchVzFLwl7IuWi+5NeRuHyW+X1+Dx+
         JdxD5ATiLLaFV74+nc+PEornmGRzLSGLCuqYdPYLKxxhk6mDJC4Vmse0aIJLJxgf/DOE
         J/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765375061; x=1765979861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lRpbg2Q+RMOdgMRsY20i79toOUivBfEI3R3ncw2XDGo=;
        b=Kz+pLogKnPZPRx9I0z639shwPFC7W2aaGMwD90CREvbdYiqYMc32mv4Ikay7iWPUZO
         SEuRV5GtofSfFofa3pEMf7201UKAmBP85F8kDktUrq4PFBPFFYX5ppNU3V9l/xhrVy8a
         Kh/quvmPPigiRt1Wnufcd7FZXLLIMo0HmBOfmswA/4HGc4p7aWP14lKa+7+dskBmWtsd
         C1uWX9w/wlxwgH4FuIzEqXYFtbJfBm8vQDrlZBYQJp0nhlUaU1CNAjuLEweMm2ycjnWo
         A50i5ZqiDRRN90I9Xhd1oG1m/DiM4tdD0dCdG+++/XwjL0uWVvx6McwKuT7VbzWbLGoP
         BydA==
X-Gm-Message-State: AOJu0YzpUq/JOo/OP3AaA2odwITEXOtH5PbD8uq+3ZxK6lZFzmwQVusu
	oyRPulU0v8LuLPLmfwPO/+c6Vy7JeTY0UeRLTL2Ea09CdcLdb1vHttMy/GhjwLYC+Pxf/A1+g4g
	9Ztlf66Qruhv5U5zG/2tGKSkkVF+PlUcv9oqjiSklzw==
X-Gm-Gg: AY/fxX7UvCnVRTYZc8FDQNjs9a7ASzhLpli0N9tDU+rNmhQgEeUS2KV3VBqWMZA+ZMU
	2fjYdSMBQAyPLIkzkcg2pkK2/PG1JHNmaNhmDK6mqz5kP3qcEzo7vqAKNKkds5UFPc8gV0V1qLN
	0E7JNhohrydLc0zS5xchp//ci+qenFFJg3OECyLwCvdEJhxyC2Ifp1RF6y8kgKBo/SuHbERV6Q4
	hR8BeR1IUyJpmxfAwUgWtHkeozJ65ubJCiZhB1G1OQa/mQmNsplY2sRUS26ZPMb1cN/YL/o
X-Google-Smtp-Source: AGHT+IHuf5TAKH5/L7YDvCb/t3P7gBf6PwUXPiL84E8dgvvCagDCuvd5is0tDN1P3KBIxWWX1tOAR+7lUU5otakiPvM=
X-Received: by 2002:a2e:a991:0:b0:37f:aa88:83fb with SMTP id
 38308e7fff4ca-37fb217ac8fmr7882991fa.32.1765375060396; Wed, 10 Dec 2025
 05:57:40 -0800 (PST)
MIME-Version: 1.0
References: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com> <20251210104325.175100-2-pascal.weisser.ext@karlstorz.com>
In-Reply-To: <20251210104325.175100-2-pascal.weisser.ext@karlstorz.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Dec 2025 14:57:27 +0100
X-Gm-Features: AQt7F2r3JuxvazFCGPOcSnLvVwYrNOuz4Z0-9FNClRhyXBfJZnuC_daydjptvT8
Message-ID: <CAMRc=MfXu8A1hrkySbG29io_-V84fr7A_mzQEQAk2E9ij7gHfQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2 1/9] libgpiod: Add HOMEPAGE variable
To: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122548

On Wed, Dec 10, 2025 at 11:44=E2=80=AFAM Weisser, Pascal
<pascal.weisser.ext@karlstorz.com> wrote:
>
> Add HOMEPAGE variable to libgpiod recipe.
>
> Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/reci=
pes-support/libgpiod/libgpiod.inc
> index fb309c5644..63ffdc2466 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
> @@ -1,4 +1,5 @@
>  SUMMARY =3D "C library and tools for interacting with the linux GPIO cha=
racter device"
> +HOMEPAGE =3D "https://libgpiod.readthedocs.io/"
>  RECIPE_MAINTAINER =3D "Bartosz Golaszewski <brgl@bgdev.pl>"
>
>  inherit autotools pkgconfig ptest
> --
> 2.50.1
>

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>

