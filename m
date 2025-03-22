Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A7BC36001
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 03:29:01 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web10.3329.1742614129064759646
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 20:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=mx-20241105 header.b=bz1n5cqF;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24923101E9093;
	Sat, 22 Mar 2025 04:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742614126; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=KhvA2VIcYWNblxFEVdpg05yJbbaXCs6plEwvDdaJZ4c=;
	b=bz1n5cqFxTrPuP794Eu6PKvhwJ1RWupjmF4Bl0ynDV5EMEL4lyPj2GSlK5/V4ohpCf60tz
	xVR8AN0PPzd0mmIK5Eu9laxmk+Fay4H6JKww8pE1OATzsEUBERNC1J3lHJGxo36gyMsDKN
	/NOzNUh1nB770y4W87GIN7WudBbx2WBCQzJgENO5sX2/ob5D0n4niSsw3e1ZFiB/caGz87
	4TKzRzLpFoptAqoOZW/MLIyUBKZLV/mtuXewuUCefRkO6/1UOl0Yc7eJ+kbqhKBa4cLo1A
	rq4wUlbxHRCX4XlouSMwq5MtfFrRKtW27o0d0HG+d+n98V/24xHasBYyIPehzg==
Message-ID: <ab99b7e3-1a93-436c-b5a7-f1f8babe1ea4@denx.de>
Date: Sat, 22 Mar 2025 04:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lvgl: Upgrade to 9.2.2 release
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>, Martin Jansa <martin.jansa@gmail.com>
References: <20250322025925.1070828-1-raj.khem@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250322025925.1070828-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 03:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116194

On 3/22/25 3:59 AM, Khem Raj wrote:
> Drop backported patches
> Enable thorvg packageconfig, build fails without it now

Reviewed-by: Marek Vasut <marex@denx.de>

Thank you!

