Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39971C54E66
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 00:44:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.326.1710377036125890608
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 17:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=ft2+ROvM;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 7FECF87B89;
	Thu, 14 Mar 2024 01:43:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710377034;
	bh=+0lESN1o83mMpaEYovtNflreVS32xK4U4QtZY1Jfc5M=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ft2+ROvM8bwZk51B0px8mw2L2CfePBtelljqrnmmUmTNY4/lpPqI9nWQ7Lem+xJWU
	 0Lmohiw2KVHfrVTa3SJp84LfC7smLO5+bQwOsRGJEfvKbDYK3bxP351FZ1g2IiALIv
	 /Pup6i4jEAsaQiHThapKDifGc3pospZP9WJVhUt09QA0MWki1nxGo0SGPApFlOBzzC
	 l9k/As5C5BWbuxfOTez+tVMCXNvm/pVh0EUTYPGLcd0BslsxmtpQUqBEniety8Xz6e
	 XSUQP8FFzrrlclOhLq3+alcVDkDsTDHtPzlWgvEDuMmj0mdyHuZma4VYjKkZvlQgxb
	 kTug2Ozn1h+EQ==
Message-ID: <efb8cb47-1352-4028-9bbe-520979201ab0@denx.de>
Date: Thu, 14 Mar 2024 01:43:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH] lvgl: Fix dev-elf build QA
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20240313171443.2947230-1-raj.khem@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240313171443.2947230-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 00:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109304

On 3/13/24 6:14 PM, Khem Raj wrote:
> lvgl does not produce versioned shared libraries
> 
> Fixes
> 
> ERROR: QA Issue: -dev package lvgl-dev contains non-symlink .so '/usr/lib/liblvgl_examples.so'
> -dev package lvgl-dev contains non-symlink .so '/usr/lib/liblvgl.so'
> -dev package lvgl-dev contains non-symlink .so '/usr/lib/liblvgl_thorvg.so'
> -dev package lvgl-dev contains non-symlink .so '/usr/lib/liblvgl_demos.so' [dev-elf]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Marek Vasut <marex@denx.de>

Tested-by: Marek Vasut <marex@denx.de>

Thank you !

