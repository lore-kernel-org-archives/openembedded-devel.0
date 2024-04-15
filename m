Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B52EC00A94
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 13:59:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.21760.1713189579118582988
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 06:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=HghWQYmO;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E62FA881FE;
	Mon, 15 Apr 2024 15:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1713189577;
	bh=HwpNF1BNuyYUdBeWP/j4StIB5mF0cnztZiejqOxVpKc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HghWQYmOt5bg5xDYynM7RC5a0QYNo7wJ1wD3CD/6iN45cInmE2sC86yDSXY8s9oru
	 9egnhqWp+JWVR2Js59IwcFZIk5CqLr2r8GhXgiAU4VXxiZYXuS52/UbC/pQhXnD1tV
	 zR9M7h72AA9ChVyeo1zJIRfvw9Up/YAxfcIl5xlf4vmB5kRxCqYjrQuAorJTxzFRNU
	 jBs3LN4AZ6I7lvGZWkQDD89MDdBPBcl4ruo099w9PDTZ7MtcDAmO9ZG+oJ+xPP6Pm9
	 iMhO4BCt3IDwkjGYTSZ1aIQBCrsY/7jcejzosjytB6481TsEgtyXvrmdHJlbCdC2u0
	 x1Hxm/sBqpksw==
Message-ID: <6153557a-8b52-4080-87c5-a427df64ba96@denx.de>
Date: Mon, 15 Apr 2024 15:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT
 for scarthgap
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com
References: <20240415131443.7295-1-marex@denx.de>
 <CANPvuR=KbhHUzs33CHSNut2Nx=fFLLu1NpMxYcJBM652DQ8bdQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CANPvuR=KbhHUzs33CHSNut2Nx=fFLLu1NpMxYcJBM652DQ8bdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 13:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109963

On 4/15/24 3:49 PM, Jose Quaresma wrote:
> Hi Marek,

Hi,

> Last commit on this layer was done 2 years ago and it was at the time to
> add Kirkstone compatibility, nothing more since then.
> Python 2 is dead since 1/1/2020. That means that we (python dev) will not
> improve it anymore after that day,
> even if someone finds a security problem in it. You should upgrade to
> Python 3 as soon as you can.
> 
> https://www.python.org/doc/sunset-python-2
> 
> In my opinion the OE community should no longer promote its use.

I am aware of this, for me this is just a band-aid to keep meta-qt5 
building for a while longer. I can work around this in bblayers.conf or 
local.conf too, I would like to avoid that however.

