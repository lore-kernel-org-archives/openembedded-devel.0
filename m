Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0D1C77B60
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 11:17:08 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.16755.1682680618682243970
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 28 Apr 2023 04:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kfJH2qHz;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-b99efd7c335so7091498276.0
        for <Openembedded-devel@lists.openembedded.org>; Fri, 28 Apr 2023 04:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682680618; x=1685272618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XEs1w1R0Yu8TB7IJi9sm7RsyMSueZYdGvPIfvl/+dSs=;
        b=kfJH2qHzfMN6lPpOIUje9IOyoV8O4Se8Sv+3uDhchA1wfMHmRGZMaS0HrxbIDPdpVE
         oH683g48aWdIlsZuTHuVVQ57nspZS2/lD8IS2WACpeoAtmRr0N/84LMN54WP0HnA82yY
         lJdIHqel8qsIvh+4O9wMLcyN1KFH9C9DZQqYSaju1FeBg3GkDmtP0RZLkfTqOncJehnf
         bobbJ63QGoS+u3fq9KRMn6cCMN3LQaqGXeF5vxVOkHUbgs57mb5tX+kraPBmm8s5L9sE
         6VuD4KIZCWBdX0+6xepWAl12eM3CJ2FqUvaQocTBIpH+2O/akOr/QVy9P653+EG/RlNn
         BnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682680618; x=1685272618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEs1w1R0Yu8TB7IJi9sm7RsyMSueZYdGvPIfvl/+dSs=;
        b=O+5WPdgCLbyEUQAbIHfhhXWspMVOhEWu3BsA/rx2qisK75kW0aOs19wtOsukHZHksG
         JahbpafGKebhJVosJygCofOGRC8ag2KWmef5X1WDwOQ81fFxqjqF//vTC1/oj8Y4GN8R
         cdjPHp/mMPh8E+U9SgYbPb3lMCW2LmxJodoF0sJVCTOa1OydCluht1eW7+K1JX+QkqtV
         NMlSvU84Fd6AUW2cGyQk2RENuOwczQZAy/RLbCY4Y71M4f8kj3S666rGh3qb5ro3NNGq
         r9EwnyCs075IvS9g7EuNwxkNuVAAUgxFkHdbqQ2IYRMc9g2ldefzd7HGJsp52HKGQwW7
         5jIQ==
X-Gm-Message-State: AC+VfDywvw5E6iwCA/MMn74CXk4JACwnlucYmyWX1tfhDEzaLbCl2pKq
	i11o5ade2yLs6JLipz3H6p8=
X-Google-Smtp-Source: ACHHUZ7SynEgNciXBtpOS1p9a+50EPkYLL6klMTe4hi0vu7kfJbcbIahE9BvLXo5BIi5IzAPekWVGA==
X-Received: by 2002:a0d:d712:0:b0:544:9cfb:72bb with SMTP id z18-20020a0dd712000000b005449cfb72bbmr3507335ywd.52.1682680617406;
        Fri, 28 Apr 2023 04:16:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:8746:fc43:c0f0:c757? ([2600:1700:9190:ba10:8746:fc43:c0f0:c757])
        by smtp.gmail.com with ESMTPSA id j65-20020a816e44000000b00559be540b56sm230399ywc.134.2023.04.28.04.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 04:16:56 -0700 (PDT)
Message-ID: <36d695de-8152-c528-4b17-f85ff1e4c4ff@gmail.com>
Date: Fri, 28 Apr 2023 07:16:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-oe][kirkstone][PATCHv2] glfw: add packageconfig and wayland
 dependencies
Content-Language: en-US
To: rs@ti.com, raj.khem@gmail.com, afd@ti.com, detheridge@ti.com,
 reatmon@ti.com, denis@denix.org
Cc: Openembedded-devel@lists.openembedded.org
References: <20230427164723.863197-1-rs@ti.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230427164723.863197-1-rs@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Apr 2023 11:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102223

Doesn't this need to land it Master first? Kirkstone is in the subject

- armin

On 4/27/23 12:47 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
>
> GLFW has the ability to use a wayland backend. This patch adds a config
> for it, but does not enable it by default because it has a dependency on
> extra-cmake-modules which is provided (most commonly) by meta-qt5-extra.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   meta-oe/recipes-core/glfw/glfw_3.3.bb | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core/glfw/glfw_3.3.bb
> index b31bba6b6b..5b0d61241e 100644
> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
> @@ -20,7 +20,17 @@ EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DGLFW_BUILD_DOCS=OFF"
>   
>   CFLAGS += "-fPIC"
>   
> -DEPENDS = "libpng libglu zlib libxrandr libxinerama libxi libxcursor"
> -REQUIRED_DISTRO_FEATURES = "x11 opengl"
> +DEPENDS = "libpng libglu zlib"
> +REQUIRED_DISTRO_FEATURES = "opengl"
> +ANY_OF_DISTRO_FEATURES = "wayland x11"
> +
> +# upstream considers x11 and wayland backends mutually exclusive and will
> +# prioritize wayland if it is enabled, but wayland has dependencies that cannot
> +# be satisfied by this layer so it is disabled by default
> +
> +PACKAGECONFIG ??= "x11"
> +
> +PACKAGECONFIG[wayland] = "-DGLFW_USE_WAYLAND=ON,,wayland wayland-native wayland-protocols extra-cmake-modules libxkbcommon"
> +PACKAGECONFIG[x11] = ",,libxrandr libxinerama libxi libxcursor"
>   
>   COMPATIBLE_HOST:libc-musl = "null"


