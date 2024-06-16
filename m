Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64952C27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 12:31:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.33011.1718541089205959836
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 05:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=vA5wjtQQ;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6C7BC80C58;
	Sun, 16 Jun 2024 14:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1718541087;
	bh=DdXEdX6PQ0OQmrZ5gksDt1UYwa/IQFy6MXlGS7NLBgc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vA5wjtQQKQwYFEILGnG2DARHCgkXT3zwNqGOyUycechv3eVZ6pTYjtqKD1kqNAqru
	 sFNoPqm++vZDbjRmtGl+YmBlgWkKy30eJSUDZI4XDcc/4Hyaxo/8LUH6MTOBCXLKqI
	 6OfSfzff/eza4FJ3rvdk31huX8xoq19k78PLYjPAzdxddey/zxqB6SXGGOrvRsOthl
	 3KojtbScNLmmFAOIj9FxY/pV5BFm/S1OEmgOpRFXZsEA7QUN3IulHSSB5UsWuFdfTR
	 GoFmmIkwvIvS1NQpZ7mDOcVj+kTKG6sZt96xlSumLeogKQHqZqbsmO+3pH3dfM+dNq
	 aDOmCrcXODf/g==
Message-ID: <cce987d8-1df5-4a53-832f-71c8d8a18118@denx.de>
Date: Sun, 16 Jun 2024 14:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lvgl: add gridnav to packageconfig
To: Stefano Babic <stefano.babic@swupdate.org>,
 openembedded-devel@lists.openembedded.org
Cc: Stefano Babic <sbabic@denx.de>,
 Christophe Chapuis <chris.chapuis@gmail.com>, Khem Raj <raj.khem@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>
References: <20240616102112.17463-1-stefano.babic@swupdate.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240616102112.17463-1-stefano.babic@swupdate.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 12:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110916

On 6/16/24 12:21 PM, Stefano Babic wrote:
> Some packages require to activate LVGL_CONFIG_LV_USE_GRIDNAV}

Extra } here, please drop.

> , so let
> configure it.
> 
> Signed-off-by: Stefano Babic <sbabic@denx.de>
> ---
> CC: Marek Vasut <marex@denx.de>
> CC: Christophe Chapuis <chris.chapuis@gmail.com>
> CC: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> ---
>   meta-oe/recipes-graphics/lvgl/lv-conf.inc | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> index 8fd3412c0..c24df1b01 100644
> --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> @@ -14,6 +14,9 @@ LVGL_CONFIG_USE_EVDEV = "${@bb.utils.contains_any('PACKAGECONFIG', 'drm fbdev',
>   LVGL_CONFIG_USE_FBDEV = "${@bb.utils.contains('PACKAGECONFIG', 'fbdev', '1', '0', d)}"
> 
>   LVGL_CONFIG_USE_SDL = "${@bb.utils.contains('PACKAGECONFIG', 'sdl', '1', '0', d)}"
> +
> +LVGL_CONFIG_LV_USE_GRIDNAV = "${@bb.utils.contains('PACKAGECONFIG', 'gridnav', '1', '0', d)}"

This hunk should be below LVGL_CONFIG_LV_USE_FONT_COMPRESSED to keep the 
list of config options sorted.

>   LVGL_CONFIG_SDL_FULLSCREEN ?= "0"
> 
>   LVGL_CONFIG_LV_MEM_CUSTOM ?= "0"
> @@ -71,6 +74,7 @@ do_configure:append() {
>           \
>           -e "s|^([[:space:]]*#define LV_USE_FONT_COMPRESSED[[:space:]]).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPRESSED}|" \

Move the change from below to here, to keep the list sorted.

>           -e "s|^([[:space:]]*#define LV_THEME_DEFAULT_DARK[[:space:]]).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_DARK}|" \
> +        -e "s|^([[:space:]]*#define LV_USE_GRIDNAV[[:space:]]).*|\1${LVGL_CONFIG_LV_USE_GRIDNAV}|" \
>           \
>           -i "${S}/lv_conf.h"
>   }

With that fixed, for V2:

Reviewed-by: Marek Vasut <marex@denx.de>

