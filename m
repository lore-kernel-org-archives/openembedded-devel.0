Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F043AC54E60
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 05:45:34 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.13560.1710654325055160256
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 22:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=iu8+aDv8;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 87E56878E9;
	Sun, 17 Mar 2024 06:45:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710654322;
	bh=q1u+0hQH3Mi/1u+pwOKn+ekp9riQwOOnkwjtKhWu15A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iu8+aDv8/hURwxnxuyq/BSNJg2WoWXrESQUtqwu86pWxn7nyOwUg3yHhINTlrfApH
	 D3PyY9sXHJmpbNu2Qz270GE4jrde8H/UWX2aiXjb6AqUHUnh4r+DbLIXbqqTGz2h+r
	 4ecAXVMhqlb0BvpYDkHWDF3m5DUCBNCxep4Nt4k0Tid31kW/AUKpwQbb5TlPdAp9IA
	 u/EgnookvxNkcZB52d/9ihSJxPkUZmdQpZB5kD7FjUfAQgkK3XQ/Yid861wo9bvy7K
	 /QjsWasr04+T6HWFRwvgswaHt6rPhwPDP7JfNsdMMvxKw/mRaE3TwUTwcnHExbXcBh
	 wLQKk4VdjE5Rg==
Message-ID: <0bd7c695-e03d-4845-9172-54a574630705@denx.de>
Date: Sun, 17 Mar 2024 06:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v4 6/7] lvgl: fix libdrm include
To: Christophe Chapuis <chris.chapuis@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
 Fabio Estevam <festevam@denx.de>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-6-chris.chapuis@gmail.com>
 <6a591af2-3a00-468d-b9d7-1ff0368b5065@denx.de>
 <CACA7eUS-t+wCoW2Pv8P4CFAhp3LzZnRNU7ytQAGN7=xuTwmAxg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CACA7eUS-t+wCoW2Pv8P4CFAhp3LzZnRNU7ytQAGN7=xuTwmAxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 05:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109376

On 3/16/24 10:55 PM, Christophe Chapuis wrote:
> It could be conditional eventually; I just took the line from lvgl-demo-fb,
> where it wasn't.
> 
> Ideally, both should be moved in lv-conf.inc, where the lvgl drm setting is
> activated. But I didn't want to expand again the scope of this patchset,
> initially focused simply on adding some variables to lv-conf.inc.

I think I will just defer that decision to Khem.

My concern is that a system with SDL or fbdev backend may not have 
libdrm available, so I think it should be conditional.

I think this will handle that concern:

TARGET_CFLAGS += "${@bb.utils.contains('PACKAGECONFIG', 'drm', 
'-I${STAGING_INCDIR}/libdrm', '', d)}"

