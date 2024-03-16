Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177D6C54E67
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 02:59:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.10482.1710557966255367215
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 19:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=z5lSaiCj;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 64A8487F64;
	Sat, 16 Mar 2024 03:59:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710557964;
	bh=M9XsRifTR5mMlNIScDPY1OKoJzwIyo06qVbtNvcDFfA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=z5lSaiCj9nNXidQirp4amlFAd0zuR19TV00TAZnRQEt15TR6vdwmnPWoqUthPUg11
	 0DAOjnTOG40470S80G0vDKTG+yDeeh8bOFcG4emyeDP2xZuqnBSVtu9AeW2SgJSCRy
	 w94Vfrso1rD/LZX1r08dseRWsabYni4dGZ/8M8DGrEXVVrGP2RuqdLb8SQgad025aq
	 i7gQo0dDfT44DEQKz0QoVcdcGv6ji5fax27WAXB3qWlyuxyHsyWccX3bu3W/QS+SuW
	 urKeZnGKw2GLDbYS4ME7QjhpVsRY5EtATEV/Ob/yLm30OhytPnWe/0hXRmPMSzR6Y9
	 HMO7J4qJPgagw==
Message-ID: <97584cfb-6398-45ef-a524-7304d495a550@denx.de>
Date: Sat, 16 Mar 2024 03:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v3 5/5] lvgl: add more variables to lv-conf.inc
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>,
 Martin Jansa <martin.jansa@gmail.com>
References: <20240315180314.9111-1-chris.chapuis@gmail.com>
 <20240315180314.9111-5-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240315180314.9111-5-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 02:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109351

On 3/15/24 7:03 PM, Christophe Chapuis wrote:
> As it can be usefull to customize these other variables, let's
> add them in lv-conf.inc.
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> ---
>   meta-oe/recipes-graphics/lvgl/lv-conf.inc | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> index f5a93dcae..088842490 100644
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
> @@ -37,6 +46,7 @@ do_configure:append() {
>           \
>           -e "s|\(^#define LV_COLOR_DEPTH \).*|\1${LVGL_CONFIG_LV_COLOR_DEPTH}|g" \
>           -e "s|\(#define LV_MEM_CUSTOM .*\).*|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g" \
> +        -e "s|\(^ \+#define LV_MEM_SIZE \).*|\1${LVGL_CONFIG_LV_MEM_SIZE}|g" \
>           \
>           -e "s|\(#define LV_TICK_CUSTOM \).*|\1 1|g" \
>           -e "s|\(#define LV_TICK_CUSTOM_INCLUDE \).*|\1 <stdint.h>|g" \
> @@ -50,6 +60,13 @@ do_configure:append() {
>           -e "s|\(^#define LV_USE_ASSERT_MEM_INTEGRITY \).*|\1${DEBUG_BUILD}|g" \
>           -e "s|\(^#define LV_USE_ASSERT_OBJ \).*|\1${DEBUG_BUILD}|g" \
>           \
> +        -e "s|\(^#define LV_USE_LOG \).*|\1${LVGL_CONFIG_LV_USE_LOG}|g" \
> +        -e "s|\(^ \+#define LV_LOG_LEVEL \).*|\1${LVGL_CONFIG_LV_LOG_LEVEL}|g" \
> +        -e "s|\(^ \+#define LV_LOG_PRINTF \).*|\1${LVGL_CONFIG_LV_LOG_PRINTF}|g" \
> +        \
> +        -e "s|\(^#define LV_USE_FONT_COMPRESSED \).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|g" \
> +        -e "s|\(^ \+#define LV_THEME_DEFAULT_DARK \).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|g" \

Similar concerns as in 4/5 , but aside from that:

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !

