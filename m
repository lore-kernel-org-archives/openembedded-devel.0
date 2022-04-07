Return-Path: <stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E2AC4167E
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web10.3224.1649361404995853006
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 12:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@datenfreihafen.org header.s=2021 header.b=o+9KpkS6;
 spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185,
 mailfrom: stefan@datenfreihafen.org)
Received: from [IPV6:2003:e9:d723:f1e7:895e:5a8b:8fb3:9d19]
 (p200300e9d723f1e7895e5a8b8fb39d19.dip0.t-ipconnect.de
 [IPv6:2003:e9:d723:f1e7:895e:5a8b:8fb3:9d19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: stefan@datenfreihafen.org)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 432A0C0387;
	Thu,  7 Apr 2022 21:56:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
	s=2021; t=1649361402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n+AhKAyfpNZZvwstCR7wfN6hKW8QwVr4jwqS7OxiROI=;
	b=o+9KpkS6ID6rAtfQ+7pw4S4FobCq422cHFItKtY026VdEReASYo2bLYVfP+8DjDJ9tkBIE
	JhpB22VBU8flU7meqL5nogKArtiVi15u312zdF11gxyM8ykPJ8mFnP5hYWz48UkGhFdJlF
	9dd4kubxTxLDT9GRZ39ta5+91N8tFw5BWL6iXrxmqmt5mcj4za+AXV7jc3cuZs+1KhYEhr
	Y+gp/nsvMTUUr0UdQ6xSkHs3rAL0CrZad4iI3RlhSpFeSypd//aXK0x5r64/d1S0GKJh3p
	oIsMdMr5nGjnCFDHKUA23xECyWfIgqSqzmIBrk9GVnkJHr+PzP6ZjN2mvcIGmg==
Message-ID: <826caed7-6b93-dfc4-193d-d70ecf5ddb9a@datenfreihafen.org>
Date: Thu, 7 Apr 2022 21:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-networking][PATCH 2/4] ot-daemon: add recipe for
 OpenThread daemon
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: Stefan Schmidt <stefan.schmidt@huawei.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220404130354.2131131-1-stefan@datenfreihafen.org>
 <20220404130354.2131131-2-stefan@datenfreihafen.org>
 <CAMKF1soas80msGDvw7zB7S=8rXuz2ni4L2FwbffXw=BJ1xNygA@mail.gmail.com>
 <0dffc397-22be-a6b1-0fb2-8792c6c93dd8@datenfreihafen.org>
 <CAMKF1spYaFswwHyzmQ+FoqU1AWmgDWqiaywpm6THWOcT8-k52A@mail.gmail.com>
 <435051a8-ece0-2072-0504-0387ed282b93@datenfreihafen.org>
 <CAMKF1spKjhzHyB_3x+TXXjcmV0Gt6E_3gVy8k4LNKXZ2DWF9GA@mail.gmail.com>
From: Stefan Schmidt <stefan@datenfreihafen.org>
In-Reply-To: 
 <CAMKF1spKjhzHyB_3x+TXXjcmV0Gt6E_3gVy8k4LNKXZ2DWF9GA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96462

Hello.

On 07.04.22 21:36, Khem Raj wrote:
> On Thu, Apr 7, 2022 at 3:28 PM Stefan Schmidt <stefan@datenfreihafen.org> wrote:
>>
>>
>> Hello Khem.
>>
>> On 05.04.22 20:08, Khem Raj wrote:
>>>
>>>
>>> On Tue, Apr 5, 2022 at 4:39 AM Stefan Schmidt <stefan@datenfreihafen.org
>>> <mailto:stefan@datenfreihafen.org>> wrote:
>>>
>>>
>>>      Hello Khem.
>>>
>>>      On 05.04.22 05:16, Khem Raj wrote:
>>>       > fails on x86_64/glibc see
>>>       >
>>>      https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1610
>>>      <https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1610>
>>>
>>>      Ah, its not x86_64/glibc (I tested this) but the fact that the
>>>      autobuilder uses poky and I tested here without DISTRO in
>>>      openembedded core.
>>>
>>>      Seems the code base it not happy about the gcc changes to warn on the
>>>      combination of _FORTIFY_SOURCE and non-optimized code:
>>>
>>>      error: #warning _FORTIFY_SOURCE requires compiling with optimization
>>>      (-O) [-Werror=cpp]
>>>
>>>
>>> Hmm so you are not using security flags ?
>>
>> You mean Oniro is not using them? Not sure I can follow you train of
>> thoughts here. :-)
> 
> poky defaults now a days include security_flags.inc which enables
> fortify and other
> good security stuff from compiler's point of view. So it seems your
> distro is not inheriting
> all the default distro policies was what I was trying to point at.

We actually included security_flags.inc from the very beginning. :-)
First in oniro-linux only and since March also in oniro-zephyr.

regards
Stefan Schmidt

