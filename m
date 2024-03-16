Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25913C54E58
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 02:59:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.10446.1710557964460678512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Mar 2024 19:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=pMzTAL9p;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6FDF687CDB;
	Sat, 16 Mar 2024 03:59:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710557962;
	bh=k+7yN+Y5zBvPP2NDTo8zCPdV3vG/Se3uXSosHZhaw84=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pMzTAL9pUyyfra1nHVoBQPOysm6CUXq7GPLKCfK0pf3WYkCExY2LQXRSOthtxklFn
	 aOVK0Xu6nfUN4RKFuXxoriL4OiWcjqkGbWj6JslYnB4jl1z3cETxgkjzr9H1YXawHq
	 NGdJi1Nwu4ZfPNtbI7ZUFQOc6Zm0KL67egR2ABzCxqJiL3YAw2S+kpuy2jHVHRdzgQ
	 5Aw5Pp2No2DRkozCfG7wNfoeotL1VVP5sewnEIwSTvUynGRKNa8Bzu0RogOthkje9u
	 /eINmeKB8jbknd6ri2Pp4odmjFtnuNya7BkQdW4WFZLWKpC06Z9rRvzyYy3TP9ZkKp
	 5/hzCjudnkPhA==
Message-ID: <d19eebe8-435c-4f5b-8507-e15c8f2844a2@denx.de>
Date: Sat, 16 Mar 2024 03:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v3 2/5] lvgl: install lv_conf.h
Content-Language: en-US
To: Christophe Chapuis <chris.chapuis@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>,
 Martin Jansa <martin.jansa@gmail.com>
References: <20240315180314.9111-1-chris.chapuis@gmail.com>
 <20240315180314.9111-2-chris.chapuis@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240315180314.9111-2-chris.chapuis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 02:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109348

On 3/15/24 7:03 PM, Christophe Chapuis wrote:
> Add an install append to copy the generated lv_conf.h as part of the
> lvgl package, so that it will be found and used by the recipes that
> want to use lvgl.
> 
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>

Reviewed-by: Marek Vasut <marex@denx.de>

