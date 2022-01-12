Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C9EC433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 04:59:24 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.19507.1641963562531577267
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 20:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=VDiCyu4t;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id ADC5B82F89;
	Wed, 12 Jan 2022 05:59:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1641963560;
	bh=DTGXkrx3e14Z1ZaL3wXnhWIPqc7ClsvXJeiiSknNPOE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VDiCyu4tj/obCfjLP4dG96D0CZywZSu458crurd7E2e2KOJyHtyImErU3yJeEFPXS
	 d82lrA8hQ+V8ZlfaoPxthUxEK8sFgvi0M+/yIUtpGNOVPpqnzP8vDyyhXnqtUpXIZD
	 hredJ76bP/sHqjLTzSq/mAhi7vqgKD9fqM1aqBf8usr+MqdSxjtRO4WcDTXo9VgFWm
	 VL+Kw2QAmy+bjvJQEwdv5ENv6E/7JQPCsXbMZTVdBHDvsS11ybnjdjfc9+mE6AtsXW
	 1rvSySpheXq4/zAPpWh4Dn6b06nLrI+ihZvSc88NJN+QbtEpWyGvtynzLwDMm2owst
	 Lspz95TsMcW/w==
Message-ID: <279c9b08-a08d-da78-e5c3-e95214345960@denx.de>
Date: Wed, 12 Jan 2022 05:59:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [oe] [meta-oe][dunfell][PATCH 3/5] freerdp: backport openssl 3.x
 patches
Content-Language: en-US
To: akuster808 <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, Alexander Kanavin <alex.kanavin@gmail.com>,
 Alexander Kanavin <alex@linutronix.de>
References: <20220111224714.1289840-1-marex@denx.de>
 <20220111224714.1289840-3-marex@denx.de>
 <5aee9cf3-0ba9-ae52-8fd6-1a4f54585681@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <5aee9cf3-0ba9-ae52-8fd6-1a4f54585681@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 04:59:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94775

On 1/12/22 05:43, akuster808 wrote:
> 
> 
> On 1/11/22 2:47 PM, Marek Vasut wrote:
>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>>
>> (cherry picked from commit 17ad891757f0a66fabcb7f224c4d36fe6d69ba3b)
>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>>   ...e-support-and-build-with-OpenSSL-3.0.patch | 43 +++++++++++++++++++
>>   ...d-calling-FIPS_mode-with-OpenSSL-3.0.patch | 28 ++++++++++++
>>   .../recipes-support/freerdp/freerdp_2.3.0.bb  |  2 +
> Dunfell done not support openssl3 so why should I take this patch?

The patches are dropped in 4/5 again since the openssl patches are part 
of freerdp 2.4.1 . I picked them as-is to avoid too many changes to the 
cherry-picked commits.

