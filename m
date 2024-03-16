Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FE6C54E68
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 21:09:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.6055.1710623339387488355
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 14:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=cExoXzdd;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 838618800B;
	Sat, 16 Mar 2024 22:08:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710623336;
	bh=bQA7YZAyCCxZM0f/HXNYRtasFk2lM3/6SpS3NPny1B8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cExoXzdd7k9TAqqBaQoEAKLK2Nc3aMH37jDDtFEQ4eJX90nqu8jqoCYR94ywDkvqx
	 BHtdkjys1KTraNWp7kFRRqC6d9ZEzYd9IqyciIduJZAx8KLSIKB2utaV+6dMiYaMfg
	 ZO0xAOwDuVGJufDgg2eS8qMKfIQL+QcIZIcd6+F2FYwjydjX/hBkgIg2bHCcVL8iYz
	 8T9l6hfK+MG278LFizj08oRzTa9jfOaZAdFG4gyTnQlQHuAjbWbLU+lWpdoXHhSuEA
	 eTKfH1A2lHh5b8Zh2WzIIXwyok9aXrl8rLP2XMi9czOCNoN2BW/KI8K1SHhcyfBPlz
	 dGa7VQI054grQ==
Message-ID: <0efd0029-ec5a-4857-9935-5d28083a6885@denx.de>
Date: Sat, 16 Mar 2024 21:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v4 7/7] lvgl: lv-conf.inc: generalize sed
 instructions
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-7-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240316100056.409758-7-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 21:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109372

On 3/16/24 11:00 AM, Christophe Chapuis wrote:
> Use [ \t] to detect optionnal spaces at the beginning of each
> line, and after the define.
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>

You could've squashed this into 5/7, but either way is fine:

Reviewed-by: Marek Vasut <marex@denx.de>

