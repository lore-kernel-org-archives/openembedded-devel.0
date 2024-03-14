Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C162C54E60
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 00:34:27 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.9144.1710462858315519837
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 17:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=AgZjeDBt;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9EA3687F52;
	Fri, 15 Mar 2024 01:34:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710462856;
	bh=u0C07rUj1P97bPjPxRAFTYqBoh5WdBlx74/dohhUEng=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=AgZjeDBtRPWTtPJL3JaJs5mfGn678ZBfevjnNLISbN1Eff0sArtb7OVG7ZWNK3tgE
	 fLvGdRhb4P5pIxOfjsrw+70kvJ2lWW0dIga3blIU/OLLLKK/d66umOoFvlC7F7D3BR
	 MaUez7wSc6m83+7b3zyBcQ7lFIyxSnVP1ZJWSogtr/YVC371wAoZT+sSKU/med/GAS
	 c+w4BZx5wtCpr444BPEFKBZ4h0YRrF6k8PF7lu6JkltzvIGYMtmO1YD0nadC+rmcsC
	 FI3rbOctNCMUQtSlrLO0quNaaWgBxlxlzUKfKa2Jx6tr06mp2iH5j8QRoxkTFzFBeK
	 gR7JKlwWGm4ug==
Message-ID: <adea73a8-ee83-46ec-b5de-7c2cd07db04e@denx.de>
Date: Fri, 15 Mar 2024 00:24:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCHv2 2/3] lvgl: remove useless FILES include
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20240314192153.202513-1-chris.chapuis@gmail.com>
 <20240314192153.202513-2-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240314192153.202513-2-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 00:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109323

On 3/14/24 8:21 PM, Christophe Chapuis wrote:
> As ${includedir}${PN} is already listed in FILES, there is no
> need to add one of its subdirectories.
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !

