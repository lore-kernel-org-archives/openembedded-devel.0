Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2BAC7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 02:02:39 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.3835.1683597757296843006
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 19:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=HvvlQJHH;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 99A2885FA5;
	Tue,  9 May 2023 04:02:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1683597755;
	bh=9swQl9gpoyY/QIjhsgfVH7CltV+03eucSKiewqZPc2A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HvvlQJHHQY541Ks0D0ITUf1PMNe7pEnkHpWJIso1GeN6ZsHSNXUg+4ebiYEJ0x+hB
	 UV2rz3PdyHTJdtbH3VmS2col1wmT6zF3+DyzKUP1NQ09FjgaXh3rIH+Aqp975DPqyN
	 GdR02RicnqJP9S98SfC3jH0gsjpKvwbVTx5fes/DbxlPjpuAIUAEjo/CEVL3x8MZKP
	 AVZCT+YMjOYB3wT6MkswsfSdL6IorV1mqX6oBr/9XWR8gZq6ILlRgSlvS/sJZS+rg/
	 dRgqcmFEYxX457AaycH9KjOUdrYKcxBlLP39YAdg3p4OlIDMK1HN3BP9WC6GawVIzC
	 VApbj/sHjCq0A==
Message-ID: <f9c17730-5aed-461e-a59d-de1caaf9f1f3@denx.de>
Date: Tue, 9 May 2023 04:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-oe][PATCH 5/5] lvgl: Upgrade lvgl-demo-fb to 8.3 and
 decouple from submodules
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 Fabio Estevam <festevam@denx.de>, Martin Jansa <martin.jansa@gmail.com>,
 Philippe Coval <philippe.coval.ext@huawei.com>,
 Philippe Coval <philippe.coval@huawei.com>
References: <20230507132349.10674-1-marex@denx.de>
 <20230507132349.10674-5-marex@denx.de>
 <CAMKF1spAwPFozjiiVV2ZXKsMqQ6VaGr2t-k2A6mOSXQjc7fxPw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMKF1spAwPFozjiiVV2ZXKsMqQ6VaGr2t-k2A6mOSXQjc7fxPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 02:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102449

On 5/8/23 18:13, Khem Raj wrote:
> there is license mismatch perhaps as seen in this build
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2727

I just sent a bunch of additional patches, sorry for the mess.

I managed to fix the dialog-lvgl , but that code seems unmaintained, so 
maybe we should drop it.

I partly rolled back the lvgl-demo-fb switch away from submodules, as I 
don't really know how to deal with this one quickly. It basically 
requires custom configuration of LVGL only for the sake of pulling in 
example widgets, which used to be in (now unmaintained) repo, but now 
are in LVGL proper, except they need to be enabled and built in, which 
for regular LVGL applications seem like the wrong default.

