Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FF2C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 16:46:50 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.24383.1678466805959026507
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 08:46:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g2uTCRh8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1B18CC0008;
	Fri, 10 Mar 2023 16:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678466803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NSP4ECyf5d3AqlepJnf7g0aif0yV2zrQL84T/XIxYbI=;
	b=g2uTCRh8mJp/QoyEvUdwwUQcWEKw1YFZijUDXrLGcnKcuq9kfbO0iWpqkPmiibSrd/Y9op
	FYFSmRN2i5ZFcbHrI0PImzHgpZbJyk+LVdFCS+0+WOBZBEVJd3asEKP5Zh6ZEHHkNlYtlG
	tbF/7Zun1JIBEbyYK0hc+1T5M/9l4/Dd+U8zZXP1o3f152Z1GuuR7GAqqEs0F7FbABKOqK
	fyWxL/BpPRfjZ2SCH/UVB1KDWgANo1nZ4Ak/lNy+18IOxIPrfSgr1foE7M9BFxztSBHZyE
	Z87ytluS5dEo78h0gbrgZNDrU1CChu42dCBhBEK8Ycurw+wRkBZVKzGdycVKng==
Date: Fri, 10 Mar 2023 17:46:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH 2/2] netplan: add missing runtime
 dependencies
Message-ID: <2023031016464269dcfd97@mail.local>
References: <20230308135705.796596-1-yi.zhao@windriver.com>
 <20230308135705.796596-2-yi.zhao@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308135705.796596-2-yi.zhao@windriver.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 16:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101494

Hello,

This broke check-layer-nightly on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1227/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1227/steps/21/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1227/steps/23/logs/stdio

I'm not completely sure why yet.

On 08/03/2023 21:57:05+0800, Yi Zhao wrote:
> Add python3-dbus and python3-rich[1] to RDEPENDS.
> 
> [1] https://github.com/canonical/netplan/pull/290
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../meta-python/recipes-connectivity/netplan/netplan_0.106.bb   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
> index b7fe7ae3e..8c1eaa550 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
> @@ -26,7 +26,7 @@ PACKAGECONFIG ?= ""
>  
>  PACKAGECONFIG[tests] = ",,,python3-nose python3-coverage python3-netifaces python3-pycodestyle python3-pyflakes python3-pyyaml"
>  
> -RDEPENDS:${PN} = "python3 python3-core python3-netifaces python3-pyyaml util-linux-libuuid libnetplan"
> +RDEPENDS:${PN} = "python3 python3-core python3-netifaces python3-pyyaml util-linux-libuuid libnetplan python3-dbus python3-rich"
>  
>  inherit pkgconfig systemd
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101425): https://lists.openembedded.org/g/openembedded-devel/message/101425
> Mute This Topic: https://lists.openembedded.org/mt/97472579/3617179
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

