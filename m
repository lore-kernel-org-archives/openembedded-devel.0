Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.2964.1632196144562976365
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Sep 2021 20:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=r8RA5OIU;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E022D80735;
	Tue, 21 Sep 2021 05:49:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1632196141;
	bh=MYDcoCKmtq605dS5DSs/F5B0y3kon85XuTZezBE8Dtk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=r8RA5OIUCsWhaUhkoNKLKzJhA6i+zPC3SIl4ydrSVEegB5tPY0PkUKFgriXvdR1ab
	 uMhbKn9HDZ1hlGwVYiZQdtlZCvR2f4YOVpOsF1SJuD9q3XKJEApDnWji3Zavk1EU02
	 TEgQbXHgz9mzHmB+e8EKs6EydchEgsGkVGNoNiZIByxdcwRioEItc/53gjcFOxaS+k
	 b2+D7/dKq840P/qDsQFYHHXmeElU7gPf0OV1HOszZSzUJamHLNe2Y89Exk4u7QxvXm
	 TDYW5vX/ITTdYOsnUza9jYl6Kx2AIhUafnPNTer/rAyzZCLS81uNxNzu3/CQ9Ud32H
	 DkYPEvSXHbnTA==
Subject: Re: [meta-oe][dunfell][PATCH] dstat: Add missing python-six runtime dependency
To: akuster808 <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>
References: <20210920151226.8816-1-marex@denx.de>
 <5e695574-f64f-5501-e5f3-75ae0b6dea37@gmail.com>
From: "Marek Vasut" <marex@denx.de>
Message-ID: <3e99c234-680e-70b6-ec32-f9087d30cdb8@denx.de>
Date: Tue, 21 Sep 2021 05:49:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5e695574-f64f-5501-e5f3-75ae0b6dea37@gmail.com>
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/21/21 12:42 AM, akuster808 wrote:
> Merek,
> 
> 
> On 9/20/21 8:12 AM, Marek Vasut wrote:
>> The tool depends on the six module, add it, otherwise the following
>> traceback happens when running it on the target:
>>
>> Traceback (most recent call last):
>>    File "/usr/bin/dstat", line 32, in <module>
>>      import six
>> ModuleNotFoundError: No module named 'six'
> Thanks for the fix. I will backport to hardknott once in Master before
> Dunfell can take it.

Thanks

Does anyone still care about gatesgarth as well ?
