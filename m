Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E33DC05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 16:56:36 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.14931.1676220991203628565
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 08:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n+BojO8Z;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-169ba826189so12800817fac.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 08:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dRB4FxQ5D+iBMF80WH2JjaNLgctLbHtRqRJBSWrdzp4=;
        b=n+BojO8ZSqx0Ke+ZqXOE8fGmOJ6DLWGz/fhrPk1q+NZHuXGzl+90RhLTrQnkuYP7nK
         3+6rwBbsmZOdqLQVgSb76OjgOzu7GQcl51CWuepw0CibEwg4pEMbW2Qcr5DmVjoDLDJk
         VBNHKGS7xjRdUiUGmyZZpXNKkFTfQ/+1M6dnIvLSr579qrVU6/Xp/3VEShsZQj+GEmCS
         Jd8PAn+Gk02PoBFNf+S0vnqbkRb4V0gotD32E3XL+UZzrFOqrJhMozWMmg+WaZ2qMpHp
         sJSIKVJHQhbeT853v2GY/Ft2L8u/UJOnzroCZl4sb3lJDegAazBi9Vzbb6oAQhzzBIgG
         Xi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRB4FxQ5D+iBMF80WH2JjaNLgctLbHtRqRJBSWrdzp4=;
        b=mLG7i6KinHqu8XgxwQrVzkqKZlJ+OqRVV/AsbXduoht/BKpAtB3ZZ2I2NYekLwUrWF
         9Hf5sfbxZSc5vRA3h6DkAyqn8+AFQrlenRMXqc2mAszOmjlR+HVVqgQjFbuT37zXK2qK
         URhaNMBzqeVJFMy8GzvlOddMS1sZNWb7QV74LnvsuRaW6sBJ/LzdJm4/3kSJ3mFNo1mY
         1M2AQAFCEApx5zWw18LiA+pK/rOY8n1EeCGwvhqySFMlZ3NRgHk+cfA7rnTCoVcRFYry
         9L/rrqn8lPR10Hu4NpatE/r9l7ie/QqKFj4aYkGBqi3hhOB+N0/wnZXzcGrfa+zl+yf4
         MT9w==
X-Gm-Message-State: AO0yUKWgNXLhcatfdwLLsePKae9Nh5mKT/D1js+ZN1NWAidgjejcDwwU
	hX2OFfJ0kBc6GKEONoY6SgA1zh1drxs0BICkf9s=
X-Google-Smtp-Source: AK7set+G6P+TbTxbaCL5D9peQbDrte1kyPf/3fYnxB4ed6EoYNCHq6RsFxE6xdhLoxGqpPFG8UhhDRFiNUsuadL89u4=
X-Received: by 2002:a05:6870:430a:b0:163:b85e:f1ca with SMTP id
 w10-20020a056870430a00b00163b85ef1camr2819447oah.262.1676220990302; Sun, 12
 Feb 2023 08:56:30 -0800 (PST)
MIME-Version: 1.0
References: <1676122405-5945-1-git-send-email-wangmy@fujitsu.com> <1676122405-5945-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1676122405-5945-3-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Feb 2023 08:56:04 -0800
Message-ID: <CAMKF1srZ1igTEGeO3bGvQK=REmaL95QT0DOYRVa6X0=wQwFVig@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pylint: upgrade 2.14.5 -> 2.16.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 16:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101053

This fails to build

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2457/steps/14/logs/stdio

On Sat, Feb 11, 2023 at 5:33 AM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =========
> -Fix a crash happening for python interpreter < 3.9 following a failed typing
>  update.
> -The accept-no-raise-doc option related to missing-raises-doc will now
>  be correctly taken into account all the time.
> -Add a keyword-only compare_constants argument to safe_infer.
> -Sort --generated-rcfile output.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-pylint_2.14.5.bb => python3-pylint_2.16.1.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pylint_2.14.5.bb => python3-pylint_2.16.1.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.14.5.bb b/meta-python/recipes-devtools/python/python3-pylint_2.16.1.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-pylint_2.14.5.bb
> rename to meta-python/recipes-devtools/python/python3-pylint_2.16.1.bb
> index 738b9250c..7096e3b36 100644
> --- a/meta-python/recipes-devtools/python/python3-pylint_2.14.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-pylint_2.16.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE= "http://www.pylint.org/"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
>
> -SRC_URI[sha256sum] = "487ce2192eee48211269a0e976421f334cf94de1806ca9d0a99449adcdf0285e"
> +SRC_URI[sha256sum] = "ffe7fa536bb38ba35006a7c8a6d2efbfdd3d95bbf21199cad31f76b1c50aaf30"
>
>  inherit pypi setuptools3
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101024): https://lists.openembedded.org/g/openembedded-devel/message/101024
> Mute This Topic: https://lists.openembedded.org/mt/96896324/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

