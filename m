Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14537C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 22:38:04 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.1303.1710801478321891846
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 15:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=gENB/02w;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 288F58802E;
	Mon, 18 Mar 2024 23:37:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710801476;
	bh=qdZROilFwLmQ6YL0t1qMaj5gYADX01Qbprgrc2/9rUE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gENB/02wYEv9WWIl3FgQT5YXvrqqO2eFRr6iDPxfOBU8WM0Mnqe7QEif1xY/BKoyP
	 ZwSKvRFaaVE+b/iGODpgZT8jaW4BXDgDQjeMIlWxqvz8CzIm2g4tfOELK/yLjq6ukt
	 x0rtVJzUFPFpV2u7H/sgCJ5B03yfMIA+wy7ClFs3kVVgqQ9KNBXYsZehn7KCqfqX7U
	 Em3/V67ZEm3ppQHBUSdGlVwHLFcYau6EuES/SkAWZs54WJWgARO4tVImm0vtkFOsLe
	 0B2+PMpfxLqtUf+iFJQZDpmHveFliIqfTuSetgwplyk3RZqU9hThqxcbDYtH5rmKoi
	 Fn3QSdi2dFstg==
Message-ID: <d66f8293-89ac-4d6c-80e6-94457b4cdbb7@denx.de>
Date: Mon, 18 Mar 2024 22:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v4 7/7] lvgl: lv-conf.inc: generalize sed
 instructions
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
 Fabio Estevam <festevam@denx.de>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-7-chris.chapuis@gmail.com>
 <DB5PR02MB102132F3CAC801E36E7B462A7EF2D2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <868000cd-9113-4615-89ac-e7d35a564937@denx.de>
 <CACA7eUT_5948nd+rHtieSTrGmm1J6tjqQ8s8z7g0g5E+xAfkJA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CACA7eUT_5948nd+rHtieSTrGmm1J6tjqQ8s8z7g0g5E+xAfkJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 22:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109416

On 3/18/24 4:42 PM, Christophe Chapuis wrote:
> I avoided \s because it's not well known, and I would also prefer using
> [[:space:]] as it is POSIX compliant.
> 
> I can propose a patch for this, taking Peter's remarks into account.

Yes please, already reviewed too.

btw please stop top-posting .

