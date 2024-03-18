Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60914C54E68
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 22:37:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.1300.1710801473212091601
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 15:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=DYBkUpih;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4917C87150;
	Mon, 18 Mar 2024 23:37:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710801471;
	bh=gRZTpNxcE3yv0YmR72XOD4T0n4RNsGg+MrigN4i2MYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DYBkUpihTge5q5T0CL85r5atOyyQgpyhgmVUvJXHKHJ7nkmZNXZ7gF+QHh8OkCzhm
	 jKNDA2GVmntjdtfisdKdzWcrGjoSLnnWPiIGNasvajmM5AD98nqYyhy0S1IRSxmY5E
	 5OqkEDQzGLM6asXR9gWZKlDro0r9uRs3oL6959M5A6QHEdBUUFDhZMAwUJYy7Rv1pe
	 XR5siXnf19ppkbMqQ6+ZiVj4wdig0K9Jddoy8tsPYI2KXSuw4Vmdc14tvoiz8yFacH
	 DyGzbOx9TCSXNbnrePfCN3fN6GAxUeIwR1jwUl41FQeM5916QgGYfEwcEOy+xqKH7O
	 1A2JkB+JDQLkg==
Message-ID: <4c569791-d2c6-4656-ad1b-c38aa1ed0c87@denx.de>
Date: Mon, 18 Mar 2024 22:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 2/2] lvgl: cleanup sed expression
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
References: <20240318182551.16648-1-chris.chapuis@gmail.com>
 <20240318182551.16648-2-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240318182551.16648-2-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 22:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109415

On 3/18/24 7:25 PM, Christophe Chapuis wrote:
> * use [[:space:]] instead of [ \t]
> * remove global replace, as there is only one instance to replace for
>    each expression
> * use extended regular expressions and remove escape characters
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>

Reviewed-by: Marek Vasut <marex@denx.de>

