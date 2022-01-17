Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE7BC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 22:21:33 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.4592.1642458087624225867
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 14:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=m9uwFL9a;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C8212830C0;
	Mon, 17 Jan 2022 23:21:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1642458084;
	bh=AuMndinVOPENlzarG2VQUQKRyicZiKk37uQ8ODlFmls=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m9uwFL9absVtA3mJWWR5KXKjJ7SivrRCpwqTIgTteCAVHPQLHA2KFpg0dWwGU5Fs6
	 djnQbem9doTriYJnbhYVJ0M5AHtY51cW84lqe7hVQO9vKNlevDl56lfVH1f+Zs90L2
	 HDIoHrN6NkFdskIsPTyW9v7YXyhZihiHuM5f5A+i9MRXTKhPL/JV2BcskRx6ha42Wr
	 TWAcjGaXFEppGJB+9D3dB0evdmdt+k99kHSnMLbz8i783s/A49UMCskVpLg9uEOQ8/
	 lqGLNnhdlHdmDFNWLEJHCTYF7KdSh8NTZGeECLzkNE8m1hBY6PTEkEczOPvEGNwk/m
	 xAq+nwWQZn4kA==
Message-ID: <c001289b-219a-f9bf-64f4-1c09917b2809@denx.de>
Date: Mon, 17 Jan 2022 23:21:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [oe] [meta-oe][dunfell][PATCH 1/5] freerdp: Upgrade to 2.2.0
Content-Language: en-US
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: akuster808 <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
References: <20220111224714.1289840-1-marex@denx.de>
 <4d1f655b-23c4-7f6a-c4bd-259a890738f5@gmail.com>
 <c020d0e7-8702-c169-5812-5a8c06f19b7c@denx.de>
 <d2d5d5dc-c1db-700d-470c-42126bc394dc@gmail.com>
 <5e27977c-15aa-42ca-463a-744d1b36d306@denx.de>
 <47b66e62-0682-38c7-6c03-a53427fdf4d9@gmail.com>
 <e8bb6f21-5d2f-635f-ed8a-7977e4a32656@denx.de>
 <CAApg2=QC-VnA3brVeOya4Yps+PLthVMQK7sZY8OKAh9WctH7LA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: 
 <CAApg2=QC-VnA3brVeOya4Yps+PLthVMQK7sZY8OKAh9WctH7LA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 22:21:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94905

On 1/17/22 18:34, Marta Rybczynska wrote:
> On Sun, Jan 16, 2022 at 7:22 PM Marek Vasut <marex@denx.de> wrote:
> 
>> On 1/16/22 19:05, akuster808 wrote:
>>>
>>>
>>> On 1/15/22 7:45 AM, Marek Vasut wrote:
>>>> On 1/15/22 14:43, akuster808 wrote:
>>>>>
>>>>>
>>>>> On 1/11/22 8:57 PM, Marek Vasut wrote:
>>>>>> On 1/12/22 05:42, akuster808 wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 1/11/22 2:47 PM, Marek Vasut wrote:
>>>>>>>> From: Khem Raj <raj.khem@gmail.com>
>>>>>>>>
>>>>>>>> (cherry picked from commit f751dcf81a18fe817b40e755a2ba3f54a74d1e02)
>>>>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>>>
>>>>>>> And why should I allow this?
>>>>>>
>>>>>> This ... what ? The SoB line or the update ?
>>>>>
>>>>> What is in the update from 2.2.0 to 2.4.1?
>>>>
>>>> This patch updates freerdp from 2.0.0 to 2.2.0 , not from 2.2.0 to
>>>> 2.4.1 , that's a later patch.
>>> I still see new features being added in 2.2.0 so the same statements
>>> apply.  Until the process changes to allow package updates that include
>>> new features and functionality for a LTS branch, I am going to decline
>>> taking this patch series.
>>
>> What about the large amount of CVE fixes and the fact that this is still
>> a stable-2.0 branch update, not upgrade to 3.x , as explained below ?
>>
>>
> Marek,
> Are you able to backport needed fixes to 2.2.x series? This would be
> something
> Armin would likely accept.

I'm not really confident at sifting through the 550 or so patches 
between freerdp 2.0.0 and 2.4.1 and picking out what ought to be CVE 
fixes correctly, so that might end up with even worse result.

We can likely pick the fixes from debian oldstable freerdp, but those 
are also last updated in June 2020, and debian stable is on freerdp 
2.3.0 now.

Also, June 2020 is where freerdp no longer has CVE information in the 
commit messages, for whatever reason.

That's why I think rolling the freerdp forward to latest stable-2.x 
series is the easiest, the CVEs get reliably closed and there shouldn't 
be any API/ABI incompatibility.

