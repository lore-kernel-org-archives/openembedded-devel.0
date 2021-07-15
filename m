Received: from outbound.soverin.net (outbound.soverin.net [116.202.126.228])
 by mx.groups.io with SMTP id smtpd.web08.5148.1626338705104580721
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 01:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@embed.me.uk header.s=soverin header.b=RXcweuy5;
 spf=pass (domain: embed.me.uk, ip: 116.202.126.228, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 7F9C3331;
	Thu, 15 Jul 2021 08:45:02 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=embed.me.uk;
	s=soverin; t=1626338701;
	bh=nw/fPd6C73HvABV+DK3jP0aBq6pBTavIrRt+A74t2GM=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=RXcweuy5Uqz16FEN0PYORNKrS/n8e3oiujmFtDCFDYedKaelCcvYYKPB5bGyqfgmS
	 ub0Y9InHGm6WyHwvCtsoJPv8iYiyp0pAr9SbNM+I5/AfxPa+edp91oKvu9AlhJYoBh
	 rRHdj7oEUjCDFhkQc023Gb+U1Kp4lcqnsDGkGDvbua+nApvH2CV0HGsQwjuda6oviO
	 UP1w+/XBc9fNukoSqVTfU5oVqXEeK5MV39eow1x0F2SyoTQkgx6DGcdDXP5EB2Zbjp
	 tFf8XSkoY4GQObmty8gtdfpCFcdAC+qWAQlgnCNIWsKqSq0IPkJeXTuXPgjqVw8HGD
	 NHJ972bt/RZpw==
Subject: Re: [oe] Upstream scipy recipe to meta-openembedded
To: Gregory Anders <greg@gpanders.com>
Cc: zboszor@pr.hu, Khem Raj <raj.khem@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <YOxdaI1jQgdxKTQn@gpanders.com>
 <59d33c0b-fbf0-593c-a259-be23aac0de6a@gmail.com>
 <be74a5ac-d9d9-8efa-434b-504bc7663c19@pr.hu>
 <e025ca46-c030-978f-3ec0-499df2ba14a6@embed.me.uk>
 <YO2QfsrtVgrsw7YX@gpanders.com>
From: "Jack Mitchell" <ml@embed.me.uk>
Message-ID: <f0c2e1bc-0e24-1b7a-f9ff-ca85c9cd9856@embed.me.uk>
Date: Thu, 15 Jul 2021 09:44:57 +0100
MIME-Version: 1.0
In-Reply-To: <YO2QfsrtVgrsw7YX@gpanders.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit

On 13/07/2021 14:09, Gregory Anders wrote:
> On Tue, 13 Jul 2021 11:46 +0100, Jack Mitchell wrote:
>> On 13/07/2021 11:20, Zoltan Boszormenyi via lists.openembedded.org wrote:
>>>
>>> FYI, there's another layer
>>> (https://github.com/tuxable-ltd/meta-scikit-learn that
>>> I had to fork and make hardknott-compatible) that uses python3-scipy as
>>> a build
>>> and runtime dependency for python3-scikit-learn so import
>>> sklearn.linear_model"
>>> is possible. That layer also extends python3-scipy with a native build
>>> variant
>>> which doesn't exist in your layer AND patches lapack further to use
>>> openblas.
>>
>> Yes, that would be my layer. I had never intended to upstream the
>> scikit-learn portions as I don't believe it is maintainable in a generic
>> layer due to the niche use-cases and awkwardness of the build system
>> itself and it's dependencies, in addition to the very large build time
>> which would put strain on auto-builders.
>>
>> What I had intended to do though, which I haven't got round to yet is
>> try to provide a virtual provider for blas/cblas in meta-oe which would
>> allow openblas to be properly upstreamed and then packageconfigs and
>> preferred versions used for selection as distro policy.
>>
> 
> Thanks, I wasn't aware of this project. And it looks like you actually
> sent a PR to my meta-scipy layer at one point, so thank you!
> 
> Jack, would you mind if I simply directed people from my meta-scipy
> repository to your meta-scikit-learn layer? I am no longer using scipy
> in OE so maintaining this layer (e.g. testing contributions and updating
> for new versions) is falling behind.
> 
> If not then that is totally fine, I will just add a call for a new
> maintainer.
> 
> Thanks,
> 
> Greg

Hi Greg,

I should be able to take it over as I'll continue to be using it in the
future. How do you want to transfer ownership, shall I fork it and you
point to the new repo on the master branch, or can you get github to
re-direct to the new home?

Regards,
Jack.

-- 
Jack Mitchell, Consultant
https://www.tuxable.co.uk
