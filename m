Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2DBC433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 18:48:52 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.10763.1641581331345236829
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 10:48:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O7axp5As;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 r14-20020a17090b050e00b001b3548a4250so4280587pjz.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 10:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=RQ0gyFsnw9/Ro1ikZQJVh/UqnABtjbma2R86/Bljxx4=;
        b=O7axp5AsI3/56cv3SDFfGpbKapJo4mxAiK2o9hv+zpDpiprLWyLJAaSHVb3ZnF2jxn
         P313ugiS5aTodjRoQUH4r/35j1o8Jy95/MFkVYRgIgIRR2R+DLDGpojOFp7hf7+QIYRa
         NWaYuYrz40a6wDb+YqSAxWpu7DNoH0DX5Z/52rNxaiJvuiI/f7wrX5zUuhrdSHmN5vGM
         VpivLcHDUfQdFR4dCt+gwR49t57vJR/PWmg3SoaH48LoFcZoQZfCmWvgX0IEXNJnGJhg
         lHtzKnQe+qFrY2krBrFHvU8JujRDq+UDJBuwzpUhplImrsCE16O9eLEzYZIxGaS4np+n
         JsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=RQ0gyFsnw9/Ro1ikZQJVh/UqnABtjbma2R86/Bljxx4=;
        b=SyWpulis6WdNYkLqDj9ICEBPN+dtHWyu4GT0myFwQg82DVnD2LU0LeOdiOibvCfCMf
         xgakJprDj6NijatGDuVW/7Evk4ZOiNG72rS0abqpajD4kXs/Vm54N2ogHSYYJK1WOAoS
         Mn7rpwXpcXROclM+TbqnpcWimm6lfXx1ox6wmOGNLAuJtIZRhr2rMqdcOtUhQqqZKHgo
         NxCUMwGJVnJ+0Rd63BRPewvin9cWKWa5eSlDuRctsnOpanjuIeFoo5pmOCazjnqFLD5J
         Rh3/RAZIAZkOtVf34e/rkoDhxLCB2Umv3jBiBWMC4n46tk67RVftOQA6QsRhoMYtaX1e
         3yvg==
X-Gm-Message-State: AOAM532HFUnSleOp2BjjZm3h7FVJ6KR+86baN67ay40uh/f2y0yWYAwa
	TIrzeD1o2lX47Wq9I6lXdXU=
X-Google-Smtp-Source: 
 ABdhPJwihOhaBkwzfODYT2VGfM1sFNfbHtlhxBu3Xy+N6Qe+NBx0+XhrrA/Td/6Of8CM3ZYgGBIx/A==
X-Received: by 2002:a17:902:c443:b0:148:f689:d924 with SMTP id
 m3-20020a170902c44300b00148f689d924mr64093766plm.78.1641581330760;
        Fri, 07 Jan 2022 10:48:50 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:1b:f11:717:929e?
 ([2601:646:9200:a0f0:1b:f11:717:929e])
        by smtp.gmail.com with ESMTPSA id
 ob8sm10807528pjb.38.2022.01.07.10.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 10:48:50 -0800 (PST)
Message-ID: <526c12ba-e0c1-31be-6c68-df43b80d211e@gmail.com>
Date: Fri, 7 Jan 2022 10:48:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [oe] [meta-oe][PATCH] php: avoid textrel QA Issue warning
Content-Language: en-US
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20220107080821.16187-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220107080821.16187-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 18:48:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94697



On 1/7/22 12:08 AM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Fixes:
> WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php: ELF binary /usr/libexec/apache2/modules/libphp.so has relocations in .text [textrel]
> WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php-opcache: ELF binary /usr/lib/php8/extensions/no-debug-zts-20200930/opcache.so has relocations in .text [textrel]
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta-oe/recipes-devtools/php/php_8.1.0.bb | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta-oe/recipes-devtools/php/php_8.1.0.bb b/meta-oe/recipes-devtools/php/php_8.1.0.bb
> index 593eb3955..fd4a78786 100644
> --- a/meta-oe/recipes-devtools/php/php_8.1.0.bb
> +++ b/meta-oe/recipes-devtools/php/php_8.1.0.bb
> @@ -217,6 +217,11 @@ ALLOW_EMPTY:${PN} = "1"
>   INITSCRIPT_PACKAGES = "${PN}-fpm"
>   inherit update-rc.d
>   
> +# WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php: ELF binary /usr/libexec/apache2/modules/libphp.so has relocations in .text [textrel]
> +#WARNING: lib32-php-8.0.12-r0 do_package_qa: QA Issue: lib32-php-opcache: ELF binary /usr/lib/php8/extensions/no-debug-zts-20200930/opcache.so has relocations in .text [textrel]
> +INSANE_SKIP:${PN}:x86 += "textrel"
> +INSANE_SKIP:${PN}-opcache:x86 += "textrel"
> +

should this use :append instead of += ?

>   FILES:${PN}-dbg =+ "${bindir}/.debug \
>                       ${libexecdir}/apache2/modules/.debug"
>   FILES:${PN}-doc += "${PHP_LIBDIR}/php/doc"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94678): https://lists.openembedded.org/g/openembedded-devel/message/94678
> Mute This Topic: https://lists.openembedded.org/mt/88257182/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

