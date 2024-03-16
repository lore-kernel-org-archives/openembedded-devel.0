Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4DBC54E6E
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 21:09:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.6119.1710623337950664117
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 14:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=DUWZu6+n;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A904887BF1;
	Sat, 16 Mar 2024 22:08:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710623332;
	bh=YvNxuBjEHx4ISdSDb+VfqNE3aERhkaHP06fWk0r3RRI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DUWZu6+nIa9IbShqCpx5kbp2kZWRRQd8NYOklFrw7Z7RYHZ96rVqYF4X7yoC33jt/
	 sdhjcDOdP//V1IMZjk+bGaIJLm/oWR8banODF2crDoBiYj+v7EEI2lYnS3Ingk7G6o
	 +3v3Mj5anNt86B3B20yTT2UMy3Ch4db7I7RJdB8zepFzzuLFFASd8mNDrkgfarsEMH
	 9kroap0+qaOcyBwPhFVE3r6untAmtntyWN0nd0ALt9whc3O3ld8ByMeaQp7NUuvqsm
	 sAUKWj0DWzeudfcf/k//tKXLqEKxQAAFs+8HT2CmnniJfE5Ym8Cwwto5Jy61HDSpnj
	 x4o3iVGk7WrYA==
Message-ID: <17050a8e-29f7-473d-9abf-507243ff3136@denx.de>
Date: Sat, 16 Mar 2024 21:41:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v4 1/7] lvgl: fix typo in lv-conf.inc
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240316100056.409758-1-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 21:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109369

On 3/16/24 11:00 AM, Christophe Chapuis wrote:
> Fix a typo in the first sed instruction, where the #if 0 is
> never changed to #if 1 at the beginning of lv_conf.h.
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>

Reviewed-by: Marek Vasut <marex@denx.de>

Please retain the RB tags.

