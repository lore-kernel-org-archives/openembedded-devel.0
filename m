Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDBFC433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:28:01 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.66889.1638883679553031093
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=MhNIWC5U;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id F3D1D81294;
	Tue,  7 Dec 2021 14:27:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1638883677;
	bh=sfoHxOnFjTn3nyM/4W18iX/s39U9NlaEWzb3J/mgEiM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MhNIWC5UU4YSXoCTgxNIo9ck2zKv5Z3HO0wWDR9G1LB7uFLaiTE18OXJ4Q6Ofn1yR
	 sEdn5Cys72NyJ+XyNi/ea5y+5TPvGtJscEgoPEcPtiE6IU9hW4297MIBMZTyg0MfAb
	 WxlUps84jZdGQzW0vwSLkTrMbBQLEi5LCqyIXmYAc94svI/f9u1POJs42g4SvcnlOU
	 TFAsGKEBtiP3yiCSgWY/UM2s3vPaI1jKNjYKnruk3n7N57CJ167UuhLQOJ4gjfAfWf
	 FGaCITxw7dBg3sFTc/Dn5TQLZl4TXJx4xsz4bQg7I4hkm1Br5O56SF2jCaPMzvbiNq
	 yggziDnSHoC/g==
Message-ID: <d2604e80-3f82-d955-f0d0-620bea1ecbb0@denx.de>
Date: Tue, 7 Dec 2021 14:27:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [oe] [meta-oe][PATCH] freerdp: Use DEPENDS:append
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Konrad Weihmann <kweihmann@outlook.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
References: <20211207113954.8959-1-marex@denx.de>
 <CA+chaQdiPbPXXOdw7PBfivuvw-fXZYeBAvDQM2NGL7h_Gr0ULQ@mail.gmail.com>
 <4a4bd8ca-9fae-c03a-acf1-d25fc44a84dd@denx.de>
 <CANNYZj-w7xB2r-FvXKbj88CNO5ibxnF1MfmN2z+p-j+_-HNLvg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: 
 <CANNYZj-w7xB2r-FvXKbj88CNO5ibxnF1MfmN2z+p-j+_-HNLvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 13:28:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94233

On 12/7/21 14:23, Alexander Kanavin wrote:
> Perhaps this issue should be addressed to Konrad first before rushing to
> write a patch?
> 
> Alex
> 
> On Tue, 7 Dec 2021 at 14:22, Marek Vasut <marex@denx.de> wrote:
> 
>> On 12/7/21 13:35, Martin Jansa wrote:
>>>> The build system might have put something into DEPENDS already
>>>
>>> There is only copyright notice before this chunk, so this doesn't make
>> much
>>> sense to me (and no other recipe does this).
>>
>> At least oelint-adv warns about it here:
>>
>> https://github.com/priv-kweihmann/oelint-adv/blob/master/oelint_adv/rule_base/rule_var_depends_append.py
>>
>> And as far as I can tell, bitbake can stick something into DEPENDS
>> before it parses this recipe, so the :append is valid.
>>
>> Furthermore, git grep through oe-core already indicates a few recipes
>> which use DEPENDS:append.

I believe the warning is valid, see above ?

