Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2FDC54E69
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 00:34:27 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.9143.1710462858308972727
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 17:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=ybZfFlLL;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0A93387F4F;
	Fri, 15 Mar 2024 01:34:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710462856;
	bh=sJ1CTGkN78dh5KqYvA2jmuJocZKb0I+dpaMC1EItlJI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ybZfFlLLnpCZGD7uy0JvGfC0BbQe/O+bXHalkt63ShfFyFhe0QHm8hg00/5200+4X
	 uHF8sQ+28Pyo2X+FxEz43LolonpQYN7gpYD0I0J8KLWfwrnf3uxVqyk5UtVBLT3u3c
	 eTLv4BXT9FAyLdorMLci8HGoxDhycAQimrc5uN5fnoPpQWGZqm7usoLcfDQArvSs7F
	 Cagyx98s1ZivOzg6xzZGTYPFsvT+CAdPdpyVmId/BNv9+Od2d5UUX02I2su/mnnCfr
	 QV05IOgElqHrg2RQHRwVbZkfkHrpOS6yaORzh5//yPKlXgEJY97SITv+Jql7PBiebL
	 bcubW/EiQQj2g==
Message-ID: <3ca461d9-730c-430e-b98b-d5bfb2019a7a@denx.de>
Date: Fri, 15 Mar 2024 00:24:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCHv2 1/3] lvgl: fix typo and install lv_conf.h
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20240314192153.202513-1-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240314192153.202513-1-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 00:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109322

On 3/14/24 8:21 PM, Christophe Chapuis wrote:
> * Fix a typo in the first sed instruction,
>    and therefore the #if 0 is never changed
>    to #if 1 at the beginning of lv_conf.h.
> 
> * Add an install append to copy the generated
>    lv_conf.h as part of the lvgl package, so that
>    it will be found and used by the recipes that
>    want to use lvgl.

I'd probably split this in two patches.

> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> ---
>   meta-oe/recipes-graphics/lvgl/lv-conf.inc | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> index cb676ac62..cd14412e1 100644
> --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> @@ -24,7 +24,7 @@ do_configure:append() {
>       # If there is a configuration template, start from that
>       [ -r "${S}/lv_conf_template.h" ] && cp -Lv "${S}/lv_conf_template.h" "${S}/lv_conf.h"
>   
> -    sed -e "s|#if 0 .*Set it to \"1\" to enable the content.*|#if 1 // Enabled by ${PN}|g" \
> +    sed -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 // Enabled by ${PN}|g" \

Uh, the lv_demo_fb has this unconditionally enabled, so I never spotted 
this, thanks for finding and fixing it.

Reviewed-by: Marek Vasut <marex@denx.de>

