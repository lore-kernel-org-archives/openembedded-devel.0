Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330C6C54E6E
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 02:59:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.10447.1710557965134924657
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 19:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=qxLIEwwT;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 124BB87D6C;
	Sat, 16 Mar 2024 03:59:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710557963;
	bh=y15wKVbxFS/8AOgvTzEGG9zuVhDKuAyyDkApG/Sxs9Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qxLIEwwT8ve3iHEVXn8Mm1UrVS4Kzj2dKXJQVTkSZhyMl6KWvzLRiGW1Ysyx6zG40
	 pGTe4+fWoRTSIaIllTrPFPWqCfrMG+F11ll6n4e8+K3nRwps5rCYp6zWaXXHk83ouu
	 inRg7XixBhu8rzP0Y9lOt+k1RWFz80xCgcO9LZK7ewSPUl0FTKDlWMwdrvPq+cpG/r
	 gfEOpH8vMpei+USgGa+weJ4hcTWltoADKWLPUqeM+wBVZ3ouOZnu7GissHjHzr9Xxi
	 F7XM+mD3FZutLUdAYjBHm7QnMAe2k/9meBm/GEoTeTmSW0dqRfLcC7hvcq4u2f2EoI
	 jE5MISFmkPrKA==
Message-ID: <aca655d4-4b0e-4157-9b87-4a2f4c5f529a@denx.de>
Date: Sat, 16 Mar 2024 03:53:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v3 3/5] lvgl: remove useless FILES include
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>,
 Martin Jansa <martin.jansa@gmail.com>
References: <20240315180314.9111-1-chris.chapuis@gmail.com>
 <20240315180314.9111-3-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240315180314.9111-3-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 02:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109349

On 3/15/24 7:03 PM, Christophe Chapuis wrote:
> As ${includedir}${PN} is already listed in FILES, there is no
> need to add one of its subdirectories.
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>

Reviewed-by: Marek Vasut <marex@denx.de>

