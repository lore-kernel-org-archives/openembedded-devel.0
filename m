Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4AEC54E71
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 21:09:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.6121.1710623340018812966
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 14:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=iu3qtNmn;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6883E8801D;
	Sat, 16 Mar 2024 22:08:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710623336;
	bh=nJWEZxydHTZM3a59kGcLwiCv3rUJpf4ZEhST53htDP4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iu3qtNmnC+wvBw3qw2OoZ9ZeOXhMSevGJYsXztnrrQc+EeYzVouEoTGMOJsnSNfNL
	 e5yCcsWQMMS+hPhiG23Xxx15wR81I0XSTc7firLg3DLsmUcPnMlv3aXpqqew83TPTG
	 aFBJBMeKRN4uZtrbuoqf4uJW31zBiQTB9eMuasMqzprA3GSJqj++SXo8PQGzndZ7B8
	 yNEauW4k4i/tOe721qO0hd4/8ShRnndzZJOgSAP6qrrAsUkr4hYGqhTZsjV9Kd/R6y
	 YzFZaHh0jaOt+z6U3SvKAQuKmWhG+k+/NxLngX/JFywJk+0osdkCW0qBCun63stCjg
	 3kg9R3GzVEm4g==
Message-ID: <d6cd2fcf-5913-4486-9dee-5bb0916e4776@denx.de>
Date: Sat, 16 Mar 2024 21:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v4 5/7] lvgl: add more variables to lv-conf.inc
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-5-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240316100056.409758-5-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 21:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109373

On 3/16/24 11:00 AM, Christophe Chapuis wrote:
> As it can be usefull to customize these other variables, let's
> add them in lv-conf.inc.
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>

Reviewed-by: Marek Vasut <marex@denx.de>

