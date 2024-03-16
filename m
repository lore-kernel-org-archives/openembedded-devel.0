Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1896BC54E6A
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 02:59:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.10445.1710557964267737977
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 19:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=HAjglgql;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9AFEF87B84;
	Sat, 16 Mar 2024 03:59:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710557962;
	bh=oY2H4fxsnZFihKRmTIU5M9xz126wkXQy5OiikFu6b9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HAjglgqlAHWh3dGDhQT/7Re3AVRemIBzUzKa6/KjOr2wc914HENZpCU3DsF+bACKp
	 JyGz0Ffw+vP3dMOUvKss7UFpASHX3EyZ0Tsd6I6QXhHiJaT+vdaUfSHKJK+pxE6FgG
	 2i7cx+sdBRu9j4R5jS1lCBr1cPcoX7hveRmbt/xqm4YB2RISN4Lv+Fz0Vh+pzD/x+N
	 Svzp9X3f7gKwk9q4h+Ai06T3exJX9iCIOch4rgRBbpNo4S03g93cLHZf1iZEXVyJtU
	 lt0X3Lohqipm7Mbs/9Q1SjPVu2Gr6U3STggPGxzvg06jDoH8S8tjuR2O+ruo5Xb2cx
	 sBGCxzk6Yf+hg==
Message-ID: <fa0889e8-cce7-46a0-8a27-41b807453bd5@denx.de>
Date: Sat, 16 Mar 2024 03:53:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v3 1/5] lvgl: fix typo in lv-conf.inc
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>,
 Martin Jansa <martin.jansa@gmail.com>
References: <20240315180314.9111-1-chris.chapuis@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240315180314.9111-1-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 02:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109347

On 3/15/24 7:03 PM, Christophe Chapuis wrote:
> Fix a typo in the first sed instruction, where the #if 0 is
> never changed to #if 1 at the beginning of lv_conf.h.
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> ---
>   meta-oe/recipes-graphics/lvgl/lv-conf.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> index cb676ac62..3dbdf769f 100644
> --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> @@ -24,7 +24,7 @@ do_configure:append() {
>       # If there is a configuration template, start from that
>       [ -r "${S}/lv_conf_template.h" ] && cp -Lv "${S}/lv_conf_template.h" "${S}/lv_conf.h"
>   
> -    sed -e "s|#if 0 .*Set it to \"1\" to enable the content.*|#if 1 // Enabled by ${PN}|g" \
> +    sed -e "s|#if 0 .*Set it to \"1\" to enable content.*|#if 1 // Enabled by ${PN}|g" \

Just to be on the safe side, can you please check if this also modifies 
the lv_conf.h in lvgl-demo-fb recipe correctly ? (I think it does not, 
but the fix is something like:

sed -e "s|#if 0 .*Set it to \"1\" to enable.*content.*|#if 1 // Enabled 
by ${PN}|g" \

