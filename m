Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B31C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 09:56:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.71356.1669974991733157552
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Dec 2022 01:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LSWEPFzT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C9C5C20007;
	Fri,  2 Dec 2022 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669974989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwdTtQ7jg53wf1WGtbTnMZWdnfz/Qun2PVN/nLEFhcM=;
	b=LSWEPFzTR2x5/3/vtmRxb8NuJxLYbcZ3AU9KbSYN+psLWmircZDyCwY1zhfVGESbcSgfGX
	fCowrLv7cE9GGwzYj4WC98vbRIN8Dxi8KGQ7swtjcKwljf5CotOZdholo1rLwzM3a083XO
	Wo060Aj8OwzGtgs3un1vCvlAX+HGIas/iU78REYs1Gl4G3vahVGZJfIhTMjoi5bTOCa7lv
	5x3y0tht778ibXiLLrZdJ4bXJoUP/XW3i57ULADIPkOOylfXfDX3UgJdcbsxuzXXprmAXB
	X6KfLBCi49yLnH3Fsc1LBMBHlHsogIQbDmWWTaxoHRKQKlbGlCVpdMCFKWaEhg==
Message-ID: <e1f4faea-d440-c548-9fe5-529651d05fdc@bootlin.com>
Date: Fri, 2 Dec 2022 10:56:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: michal.kotyla@3mdeb.com, openembedded-devel@lists.openembedded.org
Subject: Re: [oe] ['meta-python][PATCH V2' 2/2] python3-uefi-firmware: add
 recipe for version 1.9
Content-Language: en-US
To: tomzy <tomasz.zyjewski@3mdeb.com>
References: <20221201082430.1569827-1-tomasz.zyjewski@3mdeb.com>
 <20221201082430.1569827-2-tomasz.zyjewski@3mdeb.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221201082430.1569827-2-tomasz.zyjewski@3mdeb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Dec 2022 09:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99912

Hi Tomasz

Thanks for the patches!

On 12/1/22 09:24, tomzy wrote:
> Install uefi-firmware-parser tool
>
> The UEFI firmware parseer is a simple module and set of scripts for
> parsing, extracting, and recreating UEFI firmware volumes.
>
> Signed-off-by: Tomasz Żyjewski <tomasz.zyjewski@3mdeb.com>
> ---
>   .../python/python3-uefi-firmware_1.9.bb         | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb

However, if I apply your patch through "git am", the author of the 
commit will be:
tomzy <tomasz.zyjewski@3mdeb.com>
instead of
Tomasz Żyjewski <tomasz.zyjewski@3mdeb.com>

Because of this issue, the maintainer has to manually fix this field 
when accepting your patch. Worse, if he doesn't catch this, that's 
harder to fix afterwards.

You should be able to fix this by running:
git config --global sendemail.from "tomasz.zyjewski@3mdeb.com"

This should add a "From" field to the sent patch which "git am" should 
be able to match with your name.
See 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email

Could you try to send an update (don't hesitate to send a private one to 
me first)?

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


