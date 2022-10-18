Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D564C4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 08:45:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.4676.1666082726863382128
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Oct 2022 01:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fIzErgDB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 67C5E40004;
	Tue, 18 Oct 2022 08:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666082724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNSCXxwfj3WSoa3BBhOvFJHkzol1LMAh0dvDJGEg414=;
	b=fIzErgDBPstS5eNZbKmBqfV3T3ARC5O6XCuUXOBRrhiaqW2jUZt+JHTBmvK6TH4PcJgBFJ
	tFPxWdH8p1tML5y8n+MFfLylYPS9gUa44jCPypLiv24LoS1xpgJptL85jqde1afnHuORP3
	h8wdOT/8ZZrOJnu98pYV+FYj0xiXshfIftu23imB2TnEHvNe2+FvotugfpA7DzUaW/B96b
	UALii+fmB/RE+k0lMGYe+xBomFotKjbJntqt7y96iirNK3qXLp01EeTy7pluMoNXFkd97J
	ED5BIh9zUzCcbKCesIqPGlKiAmRr/yBuL4M1vtvHWvNb4Oqsx0OjD07qFdb+xw==
Message-ID: <a553f323-f3d4-5aca-bafd-eba7fdccc6a7@bootlin.com>
Date: Tue, 18 Oct 2022 10:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python] [PATCH] python3-stevedore: upgrade 4.0.0 ->
 4.0.1
Content-Language: en-US
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
References: <1666055730-2392-1-git-send-email-zhengrq.fnst@fujitsu.com>
 <8c5b5936-bd07-b42d-71d9-284ce47270fa@bootlin.com>
 <OS3PR01MB6241FFBAF7FD44E74DB522A78B289@OS3PR01MB6241.jpnprd01.prod.outlook.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <OS3PR01MB6241FFBAF7FD44E74DB522A78B289@OS3PR01MB6241.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 08:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99238

Hi Zheng,

On 10/18/22 10:02, zhengruoqin wrote:
> Hi Michael
>
> I have tried running git config --global sendemail.from and send you a new mail.
>
> Could help me to check it?


Weird, the patch in the e-mail you sent me didn't have a "From" field yet.
That's strange because the trick worked with Yang Mingyu a few minutes ago.

As I believe you are at the same location as he is, you may compare your 
$HOME/.gitconfig file.

Here's what I have in my case:

[sendemail]
         ...
         from = michael.opdenacker@bootlin.com

Don't hesitate to send me further test patches.

Thanks for your efforts. I'm sure we're close.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


