Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77584C54E69
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 09:23:39 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.17390.1710494615118691445
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 02:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=YvbUYulT;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A29EB87C78;
	Fri, 15 Mar 2024 10:23:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710494613;
	bh=kGz6L+tFHJAr0DX0mrlQOnG+JZXFjPZAUDYB7dEyQqg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YvbUYulT/fIwl0QZOB9+zZgMKzlvqSRCarLNHVAM1rpiXVymdxFYaeCu3Kt9eSIIr
	 9uV2uKgNWCb7kskMWHzA6xVJBZREfHiROghAEYVrUgosT0cmFSZG2lksyRx2JjEFdq
	 E1PdVe+MtxLqBDXd/mKfnnDI6PLaP/De7a+iLTzi/NEUZ0ti+sXClt2bNIxlAixfmU
	 nbN6P4i7tlVrPLW5lTjT6k0jgG4dKTaOcohpJRJeBnFZCurWQymtwpohRrhZbNNn3S
	 mnZY1tn6K1sfj1Hjf+HO7h0+0bj+qzGngMrF+PNjSwtWSEKvAvu5ig1RcFnje6OzNB
	 +z9mCjibnlCtQ==
Message-ID: <b8fbb0cc-30b9-48e7-9e27-8f594c4a71fa@denx.de>
Date: Fri, 15 Mar 2024 10:08:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCHv2 3/3] lvgl: add more variables to lv-conf.inc
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240314192153.202513-1-chris.chapuis@gmail.com>
 <20240314192153.202513-3-chris.chapuis@gmail.com>
 <e4c5e13d-be2c-4738-9d66-890f1cebaedc@denx.de>
 <CACA7eUQK6AZVnQDZteosHVmx1hHHsF=V9syg=+12iUYM_bHHaA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CACA7eUQK6AZVnQDZteosHVmx1hHHsF=V9syg=+12iUYM_bHHaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 09:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109336

On 3/15/24 9:16 AM, Christophe Chapuis wrote:
> Sure, I agree with your comments; I'll propose a patch v3 tonight or during
> the week-end, taking all this into consideration.

Thank you !

I'll CC you on the LVGL 9.1 update once that is available too.

