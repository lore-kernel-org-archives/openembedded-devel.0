Return-Path: <ariel.dalessandro@collabora.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F461C369C2
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 12:58:24 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
 by mx.groups.io with SMTP id smtpd.web10.14399.1745499496458683458
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 05:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=ariel.dalessandro@collabora.com header.s=zohomail header.b=QojJ56a3;
 spf=pass (domain: collabora.com, ip: 136.143.188.12, mailfrom: ariel.dalessandro@collabora.com)
ARC-Seal: i=1; a=rsa-sha256; t=1745499494; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FqlsCuQ0u1u5EPm/nNPLjrc2CnmJq26lXHPjK5FqvP/ZDWkRilhYRK4nQ822lIDCUH3iyEwSSON/1z5uRgioEkYUzc0OxIj4cTwDAKq5pS0e2TyLV1eC3YtocJ5EtSkC9TjtjrNulytYn2S+A3Iwu1njo6MqUACGYzxRRWx2jEc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745499494; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jmk/2AsSpWM0a7rMImqeb+20SkyQkzLYJAnW1o5w33E=; 
	b=jlkVnt0wx9kI86Lfdy7/z1Xi/b8U5T9sofYyG/robRnINZ45Bi+OgEsQ3bdVMx+PRNqwt26lOTIejqHtDB10Zx3qSGgaSK31/TIJ/bHmcYjIut9gnV7f6iLi7U2Oyfgm448uy26Z8WGHYZDSSTA6ZQqVMoZH6pW+t8Jvz2tEZgs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745499494;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jmk/2AsSpWM0a7rMImqeb+20SkyQkzLYJAnW1o5w33E=;
	b=QojJ56a3R976unTQorTUFYaWnZ/qlw+ywO10VbMAmlv8WnC/JWrUhb+ZolKLRQei
	CGSDakf6796EWf1lkEW8V9Tl+QR0Jgotk07b5rBosd7sFrEvNB+GSIMFcAQIxAETVNJ
	VpqD7ool3gmQNaZZs36gZSE/D+CZaKVCkUrbqrQA=
Received: by mx.zohomail.com with SMTPS id 174549949205938.88458464681378;
	Thu, 24 Apr 2025 05:58:12 -0700 (PDT)
Message-ID: <c3828ecc-f52f-4eaa-93b1-45bac83f47dd@collabora.com>
Date: Thu, 24 Apr 2025 09:58:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-multimedia] pipewire: Install missing ALSA config
 files
To: Gyorgy Sarvari <skandigraun@gmail.com>,
 openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Cc: raj.khem@gmail.com, schnitzeltony@gmail.com
References: <1831E745EF300249.1841@lists.openembedded.org>
 <ad394b95-4f2d-46e9-9a09-fd8837f2fefc@collabora.com>
 <24d1fec7-7c32-494d-ba9f-cbe0ea6eca70@gmail.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <24d1fec7-7c32-494d-ba9f-cbe0ea6eca70@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 12:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117094

Hi Gyorgy,

On 4/22/25 5:35 AM, Gyorgy Sarvari wrote:
> 
> On 4/21/25 16:21, Ariel D'Alessandro via lists.openembedded.org wrote:
>> Armin,
>>
>> Could you take a look at this?
> 
> I'm not Armin - but I think there is some misunderstanding about the
> backporting process.
> 
> Backports are normally not requested, rather they are made when someone
> cares enough about the issue to make it happen: if you'd like a change
> from master to be present in a stable release, then you need to prepare
> the backported patch, and send it to this list.
Makes sense, sorry it's the first patch I send to this list and clearly 
misunderstood these guidelines.

I've just sent a proper patch 
https://lists.openembedded.org/g/openembedded-devel/message/117093

Thanks a lot for taking the time to explain.

Regards,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


