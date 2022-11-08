Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647D2C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 10:27:09 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.6339.1667903227421895852
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Nov 2022 02:27:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IzsWuOdM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1B4C120010;
	Tue,  8 Nov 2022 10:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667903225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hA4xHOmSIx3NHyZIeZUjy9qh9Gwpy3HggUyo5kacXZc=;
	b=IzsWuOdMNx5UdenQenJ40M0koTeE/DgnLRfbgk6RNkuo2dk9wc63f1uHT3DnK96AIQJHZ3
	rtEPpRDV2826dsxuITiLc9k7uMMKm+QxEzzewFqUc/i0mspwBF2XnyrxbxClAVDkqMvWE9
	KHlZ2RhREL8bIreLkP7KPe7MQZ9ed01f9VTeg/uYcUzf0NMDRiYCkwpB5MGg32s3b5RtZw
	RcrMZAhQw1FecjY1R8p4h41WT+KX5cRntMMqKvbTl76z6DvBL9XGNNG5+e4hCd3eKK5Ggk
	9uWZGxtQ6utvGeCc5MRqSOTWxWNodCLBDsY6UfzNE2Qxb+rhBAJ30ovwsv0FUg==
Message-ID: <1933ec7d-ea2c-0233-a64b-b61fa5dff045@bootlin.com>
Date: Tue, 8 Nov 2022 11:27:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.42 ->
 1.4.43
Content-Language: en-US
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
References: <1667877050-29047-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1667877050-29047-1-git-send-email-zhengrq.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Nov 2022 10:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99491

Hi Zengh

On 11/8/22 04:10, zhengruoqin wrote:
> Changelog:
> https://docs.sqlalchemy.org/en/20/changelog/changelog_14.html#change-1.4.43
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>


Thanks for the patches!
However, they are still sent with an incomplete identity.

Did you try running the following command?
git config --global sendemail.from "zhengrq.fnst@fujitsu.com"

Thanks in advance. This makes life easier for our very busy maintainers.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


