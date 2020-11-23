Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.40071.1606157180069669886
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 10:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=THvJn1df;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from [192.168.0.113] (75-58-59-55.lightspeed.rlghnc.sbcglobal.net [75.58.59.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E170A20702;
	Mon, 23 Nov 2020 18:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606157179;
	bh=IIq5clYFyIxzr+Pzc/139NJhItNYvQruwWICWdNH6Dc=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=THvJn1dfr+g//K7aS47jIGlpF2qWwUibS+DXbG5UvDQSOfQ32a92Mcc8Y5ipXN9jJ
	 JD8knZj07ooBMm0uRgIkAeCu6RBB+YH7ZGsjjxlLwPoER/wv7A1guVwomjQARGRHbd
	 957aiemF6h52OA+S9zznNcL9pB8Z4KYS3/aL9OOg=
Subject: Re: [oe] [meta-oe][PATCH] cpp-netlib: add bitbake recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20201121032832.21540-1-okaya@kernel.org>
 <CAMKF1sqydOH5teADQ8f3iDsR-2K96DT4dELN63kD_u7A8rfB9A@mail.gmail.com>
 <be3645d4-58a7-f330-dbf1-d8ae04121f2c@kernel.org>
 <CAMKF1sqTutrLGcha+2raFvLSkrHSf1zbgsf+DgwavBqxABu7+Q@mail.gmail.com>
 <c48bd8dc-44fa-cb2e-3ce3-89e2d12206e3@gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <08ee7340-4bf3-7390-cb96-c49161359785@kernel.org>
Date: Mon, 23 Nov 2020 13:46:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <c48bd8dc-44fa-cb2e-3ce3-89e2d12206e3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/23/2020 1:14 PM, Khem Raj wrote:
>> I guess, I should have been a bit more clear. So question is/was if
>> this package
>> should be packages into packagegroup-meta-oe as well, since this helps in
>> ensuring that we can find any packaging issues etc. which normal world
>> builds dont.
>>
> 
> So I added the needed comment in packagegroup as this is a libs+header
> only package and accepted the change

thanks
