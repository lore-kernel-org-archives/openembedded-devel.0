Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF540C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:35:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.66952.1638884104264248191
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=I2MG8s4r;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 04A5D81294;
	Tue,  7 Dec 2021 14:35:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1638884102;
	bh=cjQs5XoHCl3vd9K7AoT+iFZpMGEO6ejJkkji/aY+8q0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I2MG8s4rMryRI4pjAbbt9dLZZ7S8ESSQf331D6SDeJBB8r4VpiasfI95+rhNzlKf6
	 jPzxPAjsyuirHeUh2vJ/Pb/SA0EfgS0v8+UDpnjsRG3ZnFDchryTteto55UMOGrIl3
	 6QfiIVZfmbbXF1353x86WXN0kDyxKz/mVVEjl5PTxdjPZNRf97eMtRRZdB76or0tw5
	 RepIhcUFf4fGADqss0/SSv4+3PF2YkO1KMjQW2/DFmjNbEEGl7hi0MumQ+H/gcjumP
	 iqxE6GOMwcxxd4x2EnJXjvBy7aMr51Gae7cuA8t1awL2rnvZ2gQEFluAU/KS9uwNbE
	 ck1XIHNEf+8YQ==
Message-ID: <c7ee5abb-cdd5-4286-3c2a-a0533a003af6@denx.de>
Date: Tue, 7 Dec 2021 14:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [oe] [meta-oe][PATCH] freerdp: Use DEPENDS:append
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
 Martin Jansa <martin.jansa@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
References: <20211207113954.8959-1-marex@denx.de>
 <CA+chaQdiPbPXXOdw7PBfivuvw-fXZYeBAvDQM2NGL7h_Gr0ULQ@mail.gmail.com>
 <4a4bd8ca-9fae-c03a-acf1-d25fc44a84dd@denx.de>
 <CANNYZj-w7xB2r-FvXKbj88CNO5ibxnF1MfmN2z+p-j+_-HNLvg@mail.gmail.com>
 <d2604e80-3f82-d955-f0d0-620bea1ecbb0@denx.de>
 <CANNYZj95pzj8Q85BfbFim=h+rvPW86-Wm=Bqh=+j+JKBmWnf3g@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: 
 <CANNYZj95pzj8Q85BfbFim=h+rvPW86-Wm=Bqh=+j+JKBmWnf3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 13:35:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94235

On 12/7/21 14:33, Alexander Kanavin wrote:
> On Tue, 7 Dec 2021 at 14:27, Marek Vasut <marex@denx.de> wrote:
> 
>>>> And as far as I can tell, bitbake can stick something into DEPENDS
>>>> before it parses this recipe, so the :append is valid.
>>>>
>>>> Furthermore, git grep through oe-core already indicates a few recipes
>>>> which use DEPENDS:append.
>>
>> I believe the warning is valid, see above ?
>>
> 
> The linter is an obsessive pedant, and is not actually always right, that's
> why I want its author to comment :)
> 'DEPENDS = ... ' is used throughout all layers, and doesn't seem to cause
> much grief, so why fix it here specifically, is there an actual issue?

I believe it would be a good idea to start fixing it all over the place. 
So yes, let's wait for Konrad.

