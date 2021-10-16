Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5321C433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 12:35:19 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.10147.1634387718538976950
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ag48c9xm;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id z40so11020306qko.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ew1H5ZfaYb2xLNxXxmuDjnfpe5lZWLc0mlFiNGiXUH0=;
        b=ag48c9xmgNIL6dL2PWERHLuaXlXZgyTR4oVWoGvJVFLWS7Br7n+HCi8X2N1213Tyjk
         +il2apdB14luVN9UfgiMVOXl+bJjo6mI2HmhIqWE3mu8PZxOvunkKss8SIa66PYh3A1N
         qYzgYbaZFJ+3jV6qmHbW8Jk5ggY6SICQUGJyYqqsI8S1vxFeHov2zHfl9NONfsRZJNJ2
         R+CmYLWMm+Zb8UXoZr6wHjVYsgxhZSbGUZtTJvtbcalNAEa366To1x3sEjk/6p0GgFRf
         Ndjr9+9SOAbY5K8itDzUqwkmofgJz+YMxhoUvE7TltU1skd31ke95XV/fDBboQ2G7xqi
         TRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ew1H5ZfaYb2xLNxXxmuDjnfpe5lZWLc0mlFiNGiXUH0=;
        b=vNyJOyncavRK+T5MeQNbE+WL+FIEpvs2/ww4KYAzwwPHgNE9nJLhZsJlqGqgHtAlwi
         6wgWWDop/jt4RTd5P7kcZIcdXYUWmRqZrVklj/RIMq7TdZCuIIgaLEYcxMWuGmeG3Z7X
         bOMzIsEQS0wlvLueC39HeWimoJS5te8YMLrN7lFcxUEuUj5de3XXFcQY1GI8T5qBN2Hy
         NZ05KcXXp2W8sQ9dM2wUQ61kwYLYaQJSSPDctkU+4xLsyI/IJdFoGg+aPN52UgnZzG30
         I3AVlWjKSJ34//k0vuBV4xYsr8nkxrzyWRmPlp+YCU/tCXFHfn/digQJEnbQSlV7uzBH
         rBuA==
X-Gm-Message-State: AOAM5320PN4uduTd3DX/x34DM4Z6HRF/WjV4an4o1LmtvP/JaPRXMEAJ
	dQUWS7UObkgQrnfmSijz82N7Io9W4l8RfkaA67euCzTahYxaUw==
X-Google-Smtp-Source: 
 ABdhPJz/tFh+crVEoM1OBoOlP2jzy0xvlU0sS8Q/Mub/6Q5HGWQHJZFg2HJcFm8xMzr7xRA2u0QUWV/dRfSWAjkqySc=
X-Received: by 2002:a37:6744:: with SMTP id b65mr14149506qkc.98.1634387717706;
 Sat, 16 Oct 2021 05:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211015225631.4163041-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211015225631.4163041-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Oct 2021 05:34:51 -0700
Message-ID: 
 <CAMKF1soKgY4SufjaheiGQjNJMe0=YmvRPN6c4zHu_+Pn6w4zZA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-msm: update to 0.9.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 12:35:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93398

fails to build

https://errors.yoctoproject.org/Errors/Details/612592/

On Fri, Oct 15, 2021 at 3:56 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../python/{python3-msm_0.8.8.bb => python3-msm_0.9.0.bb}      | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-msm_0.8.8.bb => python3-msm_0.9.0.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb b/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
> rename to meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
> index 848b25dae..c0ac9e0dc 100644
> --- a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-manager"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
>
> -SRC_URI[md5sum] = "cf1fc0d1d86af68003cae53c71ec6288"
> -SRC_URI[sha256sum] = "a502aee54917cd394217b31c977a1ba3d9541a0120e0a045c49fd77b328e4a29"
> +SRC_URI[sha256sum] = "3fbed593800aa669f0af2f01edfc3b54de46e995e0bdf03c5ea3693bdeab8735"
>
>  inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93361): https://lists.openembedded.org/g/openembedded-devel/message/93361
> Mute This Topic: https://lists.openembedded.org/mt/86361679/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

