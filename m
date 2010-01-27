Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <baggerml@gmail.com>) id 1Na8Ga-0004Za-Vk
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 14:49:12 +0100
Received: by fxm4 with SMTP id 4so5847158fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2010 05:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=vUdJ969AeqwbXyF5X0auUgXEre/jPmqtWyY75f+G3p4=;
	b=gbx9AMOy7aMyOBjWE/3yCwXeh4VvlHANdfk0/Vgj0g6qldNLXa4QAFK4ErSBfE/u4m
	lk6AwjkYGT1OSAZ9ASOEhyH5mxrnFLoe7+zERCWU3KmY3C6xiNG7QMynLV6vZQj4bmJb
	Tk8qHfeZTlj86ZkCo9CFwQGzNz8XjcqsojMO4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=s6X61zxrHb2PKnkPU1HLlfvxpXTsTCIpveF9cDQIc4Wfrr2W9ZS2lOWuGAr/QGAQ4F
	T+R49iQDy7bseTP0MMn6QLVDEMUEgX6jAqkJHaTkxTI5k/j61IROIFuv7QYTlyq+z5yX
	ixx9mXblXKP3qsJQSqfKswjF3toqLT5r1Z8Ms=
Received: by 10.223.29.24 with SMTP id o24mr10035359fac.49.1264600007106;
	Wed, 27 Jan 2010 05:46:47 -0800 (PST)
Received: from ?10.10.10.170? (p128.cn.medi-a.ru [77.246.96.128])
	by mx.google.com with ESMTPS id 13sm3893498fxm.13.2010.01.27.05.46.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Jan 2010 05:46:46 -0800 (PST)
Message-ID: <4B6043C5.1050809@gmail.com>
Date: Wed, 27 Jan 2010 16:46:45 +0300
From: Alex <baggerml@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B60398C.4080605@gmail.com> <4B603A61.9020001@mlbassoc.com>
	<4B603B5F.8080009@gmail.com> <4B6040C6.2020501@mlbassoc.com>
In-Reply-To: <4B6040C6.2020501@mlbassoc.com>
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: baggerml@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: kernel booting and params
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jan 2010 13:49:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Gary Thomas wrote:
> On 01/27/2010 06:10 AM, Alex wrote:
>> Gary Thomas wrote:
>>> On 01/27/2010 06:03 AM, Alex wrote:
>>>> Hello everyone!
>>>>
>>>> Trying to find information about kernel booting gave me nothing so 
>>>> I decided to write here.
>>>>
>>>> The question is: how does linux kernel know where to get its 
>>>> parameters' string? To be more precise, what actions in general 
>>>> should a linux bootloader do to tell the kernel its
>>>> params and boot it?
>>>>
>>>> ...
>>>
>>> This process is different for every architecture (x86, arm, powerpc, 
>>> ...)
>>>
>>> What platform(s) are you trying to understand?
>>
>> It is an arm cpu. The platform is dm6446.
>
> n.b. replies should be on the mailing list so that all benefit.

Oh, sorry for that =(

>
> The information for ARM is passed in memory at a fixed block with
> pointers and tags describing the various data.  The Linux source
> file '.../arch/arm/include/asm/setup.h' describes how this works.
>
> Look at U-Boot to see how it handles this linkage.

Thanks a lot! I'll look!



