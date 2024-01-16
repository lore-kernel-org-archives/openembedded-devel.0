Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FC7C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 14:22:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.9306.1705397062190160809
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 01:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NoAUFndQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E81D0E0005;
	Tue, 16 Jan 2024 09:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705397060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sIu/XBcf8OfsSu0fTgb1ChzB2nDtrvrkB5uTGDhIc7s=;
	b=NoAUFndQBUB89W4u5KZX7cvBGufs8jUnzzsdT7+kO8qdlde2ljguSNt3ujVC/3LtI3bUSz
	KF2lQJzXIoexdVRtbLuQ0Vl6pXuIw1+4768ei8ejb0CKV8LiRw9CSWDjd+RTLgRNYtk85z
	8O2Ts5eN1Ve+xpXs+flEYdDz1HGmNIGC8D3cp6OuGblYiYcM13pp4B1L0Phl1GPUCLiW87
	ZHvjqbfgxs/UgGv7R5iTLS/RjOSo2rD39sXL6T/7r0Qc+d1v1CiIEmf/FDBjeWLjkDkAMI
	29Upmi53VZXUZEatvC/+/4eyqX65wxXawiOuIfdkfPuh6KwL4wWBldtcY22f4w==
Message-ID: <e056ee1f-78b3-4f94-947a-c8b159717097@bootlin.com>
Date: Tue, 16 Jan 2024 10:24:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/23] mongodb: skip until python 3.12 fixes are available.
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, raj.khem@gmail.com
References: <20231231122329.405225-1-alex@linutronix.de>
 <20231231122329.405225-18-alex@linutronix.de>
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231231122329.405225-18-alex@linutronix.de>
X-GND-Sasl: joaomarcos.costa@bootlin.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 14:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108304

Hello Alexander,

On 12/31/23 13:23, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
> index 037d58cf1..ee5c77a85 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
> @@ -145,3 +145,5 @@ SYSTEMD_SERVICE:${PN} = "mongod.service"
>   FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"
>   
>   RDEPENDS:${PN} += "tzdata-core"
> +
> +SKIP_RECIPE[mongodb] ?= "Needs porting to python 3.12"


Would you have any updates on this porting?

As of now, skipping mongodb is raising some warnings in YP Autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/206/steps/12/logs/warnings

and 
https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/193/steps/12/logs/warnings


-- 
Best regards,
João Marcos Costa


