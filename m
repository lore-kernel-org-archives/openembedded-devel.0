Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15891C54E60
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 21:09:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.6116.1710623335964952697
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 14:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=fgpmxcCF;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2E33287D06;
	Sat, 16 Mar 2024 22:08:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710623332;
	bh=izMM+M3UNNCEBU6J0JPxIwHp6jzzfujQAMKjuAuGy78=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fgpmxcCFQ4TxAcke3q/QXA4lsvOyGIpcYUXEn1XlCK6gTMVKVsQSKExLb+yglHDSa
	 kLmvaGRIuQOd7Chk/exQDv0SwvHE3wZ4RTTkWljO0sQXLpUi2v/mb4eYucwUb3D8rL
	 F3NRhDnAb4a+jbZ3lCa249FSztNdZ7+FnhA3dECKTe5BLkhyEBGH1WN7gTAxDBZIp1
	 pvUBKxw+S/SThIppE5BEQrhe0wghq64jwtIjMXySLkWpOOgjB1rj+qEbGBFqewp/8C
	 BL54DVfFRehzOoEkselI+hQEHERaoNIQXWRykWU8+DLTtTEA/VKBPRjKiciM1DhXwk
	 pCnIG+Bpzm6zg==
Message-ID: <45896e1f-31db-4e3c-bd4d-1741eb6647e3@denx.de>
Date: Sat, 16 Mar 2024 21:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v4 2/7] lvgl: install lv_conf.h
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-2-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240316100056.409758-2-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 21:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109367

On 3/16/24 11:00 AM, Christophe Chapuis wrote:
> Add an install append to copy the generated lv_conf.h as part of the
> lvgl package, so that it will be found and used by the recipes that
> want to use lvgl.
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> ---
>   meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> index b84fc5a3d..58053d830 100644
> --- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> @@ -26,6 +26,11 @@ ALLOW_EMPTY:${PN} = "1"
>   PACKAGECONFIG ??= "drm"
>   require lv-conf.inc
>   
> +do_install:append() {
> +    install -d "${D}${includedir}/${PN}"
> +    install -m 0644 "${S}/lv_conf.h" "${D}${includedir}/${PN}/lv_conf.h"
> +}

Reviewed-by: Marek Vasut <marex@denx.de>

