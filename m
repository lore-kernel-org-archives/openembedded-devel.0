Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93136C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 17:36:22 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web12.28412.1656610580564874977
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 10:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oN85PO00;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id n15so162983qvh.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 10:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bZ3UESU8SspdYlmlp9jyv06NzhAIFQEjO5SsBPsnZEU=;
        b=oN85PO008W76/OiBHLtHKA5iBf7dvkO/KgAOD8TFxMWVmS/5sldJBmmv2IKLyqBglW
         E4EVSUgGUKq0sxz3/w8pCFbpjzLRis2Ol2gBFLxAvhN797uFvLuWFwW8sRHYoSUo0o+b
         UWkSKffhIQDb3bjjfaD96LmmugRte9SoCQ/uI0cBLIrtlqTT3X6fiNWhf/Dew/WXVFQg
         5OBUq+y6Ks+6098tGYWF/xuoTti3/Zr8Mw6VB6x0AQurP3Li5IQjCpYjX5ew8SRnk4eR
         TBZgxwCnZ5KR6lu4LmP8OE/mtaXYNO65eDIWxELYx6n+Zc+20rmrzPJEPTiuKul0Gs8v
         G66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bZ3UESU8SspdYlmlp9jyv06NzhAIFQEjO5SsBPsnZEU=;
        b=H9CMCdlnkh/2ZC7E4eul9vmMAvAo9hxeiXwkGUegBON0bmEFEVGYWZRMjQI9A7FRIS
         hGpvP/veuIMs9vrKIForBSOkg47nwLQmfWgaXoDSE2jBYjn7oWkY1a0uKheBSfKDedkE
         2yAEj+6hgPwnAvBNm6qjLgOj99XUzfQAyq5WEQ5tORYODDLiz9nkEmBo9VzKxdjEXgA0
         fXd/gfkpYdx65j69DdYKr0shoaUMz8qgb0SJ+NALpiCOtm8HQHrG+TIoRitltl/5CDhZ
         0gmhgUeyEDs/MAHqZXz3I49/l6lFEEhFutJFJhGNch4H1aomz0xUSggxhnvjk/Sf4pyk
         MNSg==
X-Gm-Message-State: AJIora/vHxDs03Y16XlGCGFZ6o4Dt5unXlBodaUj51+tO2gXktZ+mefx
	HIDVvYbRstEI8pDn+Y7EvH/igAI2fGVTIFOLfA0=
X-Google-Smtp-Source: 
 AGRyM1t7eYy4gA6kjg12iDR1dOeWt0B8wlX6QOY68sEnYbhv0lN7ktYKr6WKKeo1FCB41yyYQPrjsogXTuPPhbin+ks=
X-Received: by 2002:a05:622a:1648:b0:31d:31d1:384f with SMTP id
 y8-20020a05622a164800b0031d31d1384fmr2913521qtj.532.1656610579408; Thu, 30
 Jun 2022 10:36:19 -0700 (PDT)
MIME-Version: 1.0
References: <1654758981-32219-1-git-send-email-xuhuan.fnst@fujitsu.com>
In-Reply-To: <1654758981-32219-1-git-send-email-xuhuan.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Jun 2022 13:35:53 -0400
Message-ID: 
 <CAMKF1srE6ydX2_7TckYaKDytTxQ0rKGjcSEKur47o4Jbzi3qDQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-hatchling: upgrade 1.3.0 ->
 1.3.1
To: "xuhuan.fnst@fujitsu.com" <xuhuan.fnst@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 17:36:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97641

Please send this to oe-core since this package is in oe-core now.

On Thu, Jun 9, 2022 at 3:16 AM xuhuan.fnst@fujitsu.com
<xuhuan.fnst@fujitsu.com> wrote:
>
> From: Xu Huan <xuhuan.fnst@fujitsu.com>
>
> Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
> ---
>  .../{python3-hatchling_1.3.0.bb => python3-hatchling_1.3.1.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-hatchling_1.3.0.bb => python3-hatchling_1.3.1.bb} (88%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb b/meta-python/recipes-devtools/python/python3-hatchling_1.3.1.bb
> similarity index 88%
> rename from meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-hatchling_1.3.1.bb
> index a6550a973..1c08bd60f 100644
> --- a/meta-python/recipes-devtools/python/python3-hatchling_1.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-hatchling_1.3.1.bb
> @@ -8,7 +8,7 @@ inherit pypi python_hatchling
>  DEPENDS += "python3-pluggy-native python3-tomli-native python3-pathspec-native python3-packaging-native python3-editables-native"
>  DEPENDS:remove:class-native = "python3-hatchling-native"
>
> -SRC_URI[sha256sum] = "1401d45d3dd6a5910f64d539acaa943486d5e8b7dda1a97f2b0040fdddc5b85e"
> +SRC_URI[sha256sum] = "aaa63019c9d666053d9ff318097335e766123844547c52940155c0401c3c142f"
>
>  # Until we have a proper tool to invoke PEP517 builds, hatchling can't
>  # bootstrap itself automatically.
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97449): https://lists.openembedded.org/g/openembedded-devel/message/97449
> Mute This Topic: https://lists.openembedded.org/mt/91640859/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

