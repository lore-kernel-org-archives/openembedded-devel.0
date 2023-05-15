Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D2FC77B7F
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 00:27:39 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.77911.1684110450118220137
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 17:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=ZJFi26e+;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8359A847C5;
	Mon, 15 May 2023 02:27:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1684110446;
	bh=lU6Da9vKwL35Puwm/6HdvS9Kv9Pp8VSfuuUzgmeDCMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZJFi26e+ScWsNZO7GeylidS7SS/YDKqhiHa9fMU/KcTgwEYncss5q0TrUjCtsSlOw
	 9dW+Nn11SY77j04Q5QQ2G7R+rhXtpDJUzVDJq7Hkfh3PeJ7HSX9YMt2DoZ17qzNaIF
	 9DXRnUVMTT/mBf+ATCyz9XCNlx7PVyCLJa5eoFC6c+xzAHlnpW8suK2MbjgFAHPAMu
	 81pHVz7l5B7z8JwhZ6TzAq+0/88ni2XLmjmf19GW1I6TrToEgblxfAz+nxSRh2VFp/
	 Qyk0Bvp3GZC+Rrt7tasTLc8OMLUgK55f0e8wt+dHLasIK+GRMWkgNJLCIhrEt2XTIy
	 kFfhVUi5xPPWw==
Message-ID: <f6dbe6e3-5163-2d4d-cca7-befa02119739@denx.de>
Date: Mon, 15 May 2023 02:27:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] lvgl: lvgl-demo-fb: Inherit features_check
To: Fabio Estevam <festevam@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: martin.jansa@gmail.com, Fabio Estevam <festevam@denx.de>
References: <20230514233233.169181-1-festevam@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230514233233.169181-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 00:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102592

On 5/15/23 01:32, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Inherit features_check to fix the following QA error:
> 
> ERROR: QA Issue: lvgl-demo-fb: recipe doesn't inherit features_check [unhandled-features-check]
> 
> Reported-by: Martin Jansa <martin.jansa@gmail.com>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

You beat me to it, thank you.

Reviewed-by: Marek Vasut <marex@denx.de>

