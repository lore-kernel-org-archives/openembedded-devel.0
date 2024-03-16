Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45903C54E71
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 02:59:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.10448.1710557965767705826
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 19:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=S5Ol81dd;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CF3CE87E3F;
	Sat, 16 Mar 2024 03:59:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710557964;
	bh=+A1jLb2rNdS8g26lnF3iG9xgvZiejyjLT4GFHPrV3cM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S5Ol81ddXHB6PWquBY39B5b2W90GBHWSI4QIOJ2qBsiYv6QOggAyQyKyLVYfzWyeD
	 djfLBjYnwQLiJl+19pHrZmjULbJQrkCuyW2DgjcC4/yDhLcj1G6Qodd6BYBwBzh9TB
	 aOgDy74+E5iZJsZrTQbuCbG63R7GoXetsGFEO6q1/dUVFoOLYS9nxxKVCQzQYiqG46
	 1E8o3f+WN3pNzbEfUESUgReqG4NzwJjZrMivBQkrpyzod3866J/h/023oskHrTliZh
	 Xn4pVwSTq964umMbT/q9FNd54cCA8/+Wv4xC+OUhUNE5xEYJkLeg6qvG+HQRhSHTli
	 GNFH1Q8QSdvPw==
Message-ID: <0e432655-1d08-468f-aeea-26478dc9612e@denx.de>
Date: Sat, 16 Mar 2024 03:57:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v3 4/5] lvgl: cleanup sed instructions in
 lv-conf.inc
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>,
 Martin Jansa <martin.jansa@gmail.com>
References: <20240315180314.9111-1-chris.chapuis@gmail.com>
 <20240315180314.9111-4-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240315180314.9111-4-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 02:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109350

On 3/15/24 7:03 PM, Christophe Chapuis wrote:
> Use back reference instead of repeating the search pattern. Later on
> this could lead to a more generic way of replacing values in the .h file.
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> ---
>   meta-oe/recipes-graphics/lvgl/lv-conf.inc | 28 +++++++++++------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> index 6bcead628..f5a93dcae 100644
> --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> @@ -26,29 +26,29 @@ do_configure:append() {
>   
>       sed -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 // Enabled by ${PN}|g" \
>           \
> -        -e "s|\(^#define LV_USE_LINUX_DRM \).*|#define LV_USE_LINUX_DRM ${LVGL_CONFIG_USE_DRM}|g" \
> +        -e "s|\(^#define LV_USE_LINUX_DRM \).*|\1${LVGL_CONFIG_USE_DRM}|g" \
>           \
> -        -e "s|\(^#define LV_USE_LINUX_FBDEV \).*|#define LV_USE_LINUX_FBDEV ${LVGL_CONFIG_USE_FBDEV}|g" \
> +        -e "s|\(^#define LV_USE_LINUX_FBDEV \).*|\1${LVGL_CONFIG_USE_FBDEV}|g" \
>           \
> -        -e "s|\(^#define LV_USE_SDL \).*|#define LV_USE_SDL ${LVGL_CONFIG_USE_SDL}|g" \
> -        -e "s|\(^#define LV_USE_DRAW_SDL \).*|#define LV_USE_DRAW_SDL ${LVGL_CONFIG_USE_SDL}|g" \
> -        -e "s|\(^    #define LV_SDL_BUF_COUNT \).*|    #define LV_SDL_BUF_COUNT 2|g" \
> -        -e "s|\(^    #define LV_SDL_FULLSCREEN \).*|    #define LV_SDL_FULLSCREEN ${LVGL_CONFIG_SDL_FULLSCREEN}|g" \
> +        -e "s|\(^#define LV_USE_SDL \).*|\1${LVGL_CONFIG_USE_SDL}|g" \
> +        -e "s|\(^#define LV_USE_DRAW_SDL \).*|\1${LVGL_CONFIG_USE_SDL}|g" \
> +        -e "s|\(^ \+#define LV_SDL_BUF_COUNT \).*|\1 2|g" \
> +        -e "s|\(^ \+#define LV_SDL_FULLSCREEN \).*|\1${LVGL_CONFIG_SDL_FULLSCREEN}|g" \

Wouldn't it be better to use '^ *#define...' here to catch the case 
where there are no spaces between start of line and #define ?

> -        -e "s|\(^#define LV_COLOR_DEPTH \).*|#define LV_COLOR_DEPTH ${LVGL_CONFIG_LV_COLOR_DEPTH}|g" \
> -        -e "s|\(#define LV_MEM_CUSTOM .*\)0|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g" \
> +        -e "s|\(^#define LV_COLOR_DEPTH \).*|\1${LVGL_CONFIG_LV_COLOR_DEPTH}|g" \
> +        -e "s|\(#define LV_MEM_CUSTOM .*\).*|\1${LVGL_CONFIG_LV_MEM_CUSTOM}|g" \
>           \
>           -e "s|\(#define LV_TICK_CUSTOM \).*|\1 1|g" \
>           -e "s|\(#define LV_TICK_CUSTOM_INCLUDE \).*|\1 <stdint.h>|g" \
>           -e "s|\(#define LV_TICK_CUSTOM_SYS_TIME_EXPR \).*|extern uint32_t custom_tick_get(void);\n\1 (custom_tick_get())|g" \
>           \
> -        -e "s|\(^#define LV_USE_EVDEV \).*|#define LV_USE_EVDEV ${LVGL_CONFIG_USE_EVDEV}|g" \
> +        -e "s|\(^#define LV_USE_EVDEV \).*|\1${LVGL_CONFIG_USE_EVDEV}|g" \
>           \
> -        -e "s|\(^#define LV_USE_ASSERT_NULL \).*|#define LV_USE_ASSERT_NULL ${DEBUG_BUILD}|g" \
> -        -e "s|\(^#define LV_USE_ASSERT_MALLOC \).*|#define LV_USE_ASSERT_MALLOC ${DEBUG_BUILD}|g" \
> -        -e "s|\(^#define LV_USE_ASSERT_STYLE \).*|#define LV_USE_ASSERT_STYLE ${DEBUG_BUILD}|g" \
> -        -e "s|\(^#define LV_USE_ASSERT_MEM_INTEGRITY \).*|#define LV_USE_ASSERT_MEM_INTEGRITY ${DEBUG_BUILD}|g" \
> -        -e "s|\(^#define LV_USE_ASSERT_OBJ \).*|#define LV_USE_ASSERT_OBJ ${DEBUG_BUILD}|g" \
> +        -e "s|\(^#define LV_USE_ASSERT_NULL \).*|\1${DEBUG_BUILD}|g" \
> +        -e "s|\(^#define LV_USE_ASSERT_MALLOC \).*|\1${DEBUG_BUILD}|g" \
> +        -e "s|\(^#define LV_USE_ASSERT_STYLE \).*|\1${DEBUG_BUILD}|g" \
> +        -e "s|\(^#define LV_USE_ASSERT_MEM_INTEGRITY \).*|\1${DEBUG_BUILD}|g" \
> +        -e "s|\(^#define LV_USE_ASSERT_OBJ \).*|\1${DEBUG_BUILD}|g" \

btw if you want this to be extra accurate, you could do also:

"s|\(^#define \<LV_USE_ASSERT_OBJ\>\).*|\1 ${DEBUG_BUILD}|g"

which would handle '#define LV_USE_ASSERT_OBJ<TAB>' as well .

