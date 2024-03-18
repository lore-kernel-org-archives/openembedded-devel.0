Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F215C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 22:37:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.1262.1710801473069853189
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 15:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=tSHQ/6Iu;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 7FCF686DBD;
	Mon, 18 Mar 2024 23:37:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710801471;
	bh=i3MXfBsXiBtvAjKU16loYRqMQaCTVG2913QI7VwatGU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tSHQ/6IuzdIBDhVbxbQI1ng7eYTgLB1Oekeyg1LnWnAuvT1O6xeJ0Nbk9YVfYZjHV
	 2KK7/R/wFjJwqhyIdU2Y1vyVcpsyUOxh7IsCqqQnF5zEAsMPwA3RgT34hg2p1FM1Mr
	 pXy5FWmKlh5wJX/Ex8i+2DbkxvNvnmDpJ1TbUPnp4Ssuhmlv4XpcBHUpSBqciigXOn
	 Ts6kWeIXK/sFj45dWaJzcwqCTn/p+QMPn3FGZ7T1xCWaG+r+2MoQj58rsKHerPK46T
	 CwoNO2XQC+eIQSfhkSV4gYWeCQi+4gCoxrMAD9m3iao6QUmhg6Mxt9TrofjoYdWKDT
	 a8nw8gmVXgYpQ==
Message-ID: <97a7e65f-1c40-42c0-a27c-d33dfa58ecf0@denx.de>
Date: Mon, 18 Mar 2024 22:45:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 1/2] lvgl: make libdrm include conditional
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
References: <20240318182551.16648-1-chris.chapuis@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240318182551.16648-1-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 22:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109414

On 3/18/24 7:25 PM, Christophe Chapuis wrote:
> The libdrm include is only needed when "drm" is selected in
> PACKAGECONFIG.
> 
> In addition, move the TARGET_CFLAG addition to lv-conf.inc, where the
> DRM configuration is actually selected for LVGL.
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !

