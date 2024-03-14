Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A08AC54E5D
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 00:34:27 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.9091.1710462858685154839
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 17:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=QLAwjmuQ;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0216487F64;
	Fri, 15 Mar 2024 01:34:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710462857;
	bh=T1IVS37OmqcqApnneGaJt8nqCzxgeiXXqzcuVXPWge4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=QLAwjmuQoN9pIjl/eJnBwf4HKiQXu/EPynB7qh5RXynPb9jM/oxOaaPGOuSdvSXck
	 +xNcpj2JUvNRIwrVyVWdjd8qe/0CTrUYHnrLPfy67vQKHhHhcIF5Q15qRwrYm+Qekw
	 kTQGfUdcR43kpdU6TKzVSGJNdvYGcMnriJoHHd8wWGuEx3A6QdUfh6KDeglu5yYkYO
	 G66rVP8FffueERVle4cp1RTX8yOY2sCC/WF7oklvmWCx3BCXPeRoYHtX2W5ICL+U8m
	 8KeIkGllKy1QnuVyAFP4pFFzQJyzZoYwjj4gRNjWDTGXf+glvSI5Ls2/MR3UKkUPDi
	 NRuRRJFDEfVLQ==
Message-ID: <e4c5e13d-be2c-4738-9d66-890f1cebaedc@denx.de>
Date: Fri, 15 Mar 2024 00:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCHv2 3/3] lvgl: add more variables to lv-conf.inc
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20240314192153.202513-1-chris.chapuis@gmail.com>
 <20240314192153.202513-3-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240314192153.202513-3-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 00:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109324

On 3/14/24 8:21 PM, Christophe Chapuis wrote:
> As it can be usefull to customize these other variables, let's
> add them in lv-conf.inc.
> 
> Also, fix the install path to use ${PN} instead of "lvgl".

Separate commit would be nice.

btw when sending V3, please CC Khem and co. if you didn't yet.

Also, I'll likely be sending LVGL 9.1 update next week, it should be out 
then.

> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> ---
>   meta-oe/recipes-graphics/lvgl/lv-conf.inc | 49 +++++++++++++++--------
>   1 file changed, 33 insertions(+), 16 deletions(-)
> 
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> index cd14412e1..088842490 100644
> --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> @@ -12,8 +12,17 @@ LVGL_CONFIG_USE_SDL = "${@bb.utils.contains('PACKAGECONFIG', 'sdl', '1', '0', d)
>   LVGL_CONFIG_SDL_FULLSCREEN ?= "0"
>   
>   LVGL_CONFIG_LV_MEM_CUSTOM ?= "0"
> +LVGL_CONFIG_LV_MEM_SIZE ?= "(64 * 1024U)"
>   LVGL_CONFIG_LV_COLOR_DEPTH ?= "32"
>   
> +LVGL_CONFIG_LV_USE_LOG    ?= "0"
> +LVGL_CONFIG_LV_LOG_LEVEL  ?= "LV_LOG_LEVEL_WARN"
> +LVGL_CONFIG_LV_LOG_PRINTF ?= "0"
> +
> +LVGL_CONFIG_LV_USE_FONT_COMPRESSED ?= "0"
> +
> +LVGL_CONFIG_LV_THEME_DEFAULT_DARK ?= "0"
> +
>   DEBUG_BUILD ??= "0"
>   
>   ALLOW_EMPTY:${PN} = "1"
> @@ -26,34 +35,42 @@ do_configure:append() {
>   
>       sed -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 // Enabled by ${PN}|g" \
>           \
> -        -e "s|\(^#define LV_USE_LINUX_DRM \).*|#define LV_USE_LINUX_DRM ${LVGL_CONFIG_USE_DRM}|g" \
> +        -e "s|\(^#define LV_USE_LINUX_DRM \).*|\1${LVGL_CONFIG_USE_DRM}|g" \

I'd say, make this clean up a separate patch, otherwise this is 
difficult to review.

Then, add the extra features on top.

Thanks !

