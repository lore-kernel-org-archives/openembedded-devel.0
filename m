Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5C9C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 04:57:45 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.19264.1641963456824110621
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 20:57:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=tJ0BK75u;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 62E3282F89;
	Wed, 12 Jan 2022 05:57:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1641963453;
	bh=SYzwyWf+mIoamu+6Fm2u7Gn41U7yprHMyKu8/MKSQJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tJ0BK75unwqwXTvnA286jR5Vma77YV2jO0/yReji6jjiS+3BnsXgw/moya53x+dgn
	 jpLFI33Gs1grGg4puvDsMwb9j8xlR3vZ+RIlXeSgJRH0csOaODwqja66qBVXMahgOQ
	 giVhpyj+Ge+KJNNCV6ubLDGg20wYA5TFFa+gjsDwdaoX+FcCuvoIu+wn23P5rJu3Jd
	 tdy1PnxLUAm8BAjBZ2caohp0ibMdzLr4Rb5XthCWUl5pmHEOVvQQY7HzGG24a18VQO
	 SXPWYJBgEXPWl5Vr7eZECEjuwX8VkE1RY0ltP7gkLH8URKx4iA/QAFxRVLdm7uERii
	 uzwU2izNavw3w==
Message-ID: <c020d0e7-8702-c169-5812-5a8c06f19b7c@denx.de>
Date: Wed, 12 Jan 2022 05:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [oe] [meta-oe][dunfell][PATCH 1/5] freerdp: Upgrade to 2.2.0
Content-Language: en-US
To: akuster808 <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20220111224714.1289840-1-marex@denx.de>
 <4d1f655b-23c4-7f6a-c4bd-259a890738f5@gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4d1f655b-23c4-7f6a-c4bd-259a890738f5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 04:57:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94774

On 1/12/22 05:42, akuster808 wrote:
> 
> 
> On 1/11/22 2:47 PM, Marek Vasut wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> (cherry picked from commit f751dcf81a18fe817b40e755a2ba3f54a74d1e02)
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> And why should I allow this?

This ... what ? The SoB line or the update ?

SoB line, well, aren't you supposed to add them to backported patches ? 
If not, then I can resend with them dropped, or drop them where applicable.

The update to 2.4.1, because of the CVE fixes.

