Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.4183.1626181763897070211
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jul 2021 06:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gpanders.com header.s=gm1 header.b=W0BzxqmP;
 spf=pass (domain: gpanders.com, ip: 217.70.178.231, mailfrom: greg@gpanders.com)
Received: (Authenticated sender: greg@gpanders.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0BD7D10000E;
	Tue, 13 Jul 2021 13:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gpanders.com;
	s=gm1; t=1626181762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sd5MR+VZQQ9vmq26NQo1A9CDsdNcUxJAPNSqhzxNiDI=;
	b=W0BzxqmPdyFgFwX6bp37hisJ9+8hONvTV3Xqtu+nK33AX+fmAzYlTSBCyCBp6ORG0u3WMG
	MtXgzMtH26Hcs5rsTbzdfCWLOpLiR/csRnOYTzE1spkrAp/OAq5uHlto3T7C2E/ZypG8nF
	TjGxYEbfLbIYBOfySEAgcz6Ww+xN2MmyJPOaXRsWw66AyUjXmLW6K+se3jXfHC6jrhpnvk
	/hMoZJDDaZOGJSw6OfkmooeZIaQCnzjWXsHEA/JaBLsybLzQm94/3bfydXLLiQQZP/sWPG
	v/3+ctXAn9UogBC7PnL6v8NJHh/UUhPkWFv7NdqaEKBKmMrRfk5+o7893gd3qg==
Date: Tue, 13 Jul 2021 13:09:18 +0000
From: "Gregory Anders" <greg@gpanders.com>
To: Jack Mitchell <ml@embed.me.uk>
Cc: zboszor@pr.hu, Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Upstream scipy recipe to meta-openembedded
Message-ID: <YO2QfsrtVgrsw7YX@gpanders.com>
References: <YOxdaI1jQgdxKTQn@gpanders.com>
 <59d33c0b-fbf0-593c-a259-be23aac0de6a@gmail.com>
 <be74a5ac-d9d9-8efa-434b-504bc7663c19@pr.hu>
 <e025ca46-c030-978f-3ec0-499df2ba14a6@embed.me.uk>
MIME-Version: 1.0
In-Reply-To: <e025ca46-c030-978f-3ec0-499df2ba14a6@embed.me.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On Tue, 13 Jul 2021 11:46 +0100, Jack Mitchell wrote:
>On 13/07/2021 11:20, Zoltan Boszormenyi via lists.openembedded.org wrote:
>>
>> FYI, there's another layer
>> (https://github.com/tuxable-ltd/meta-scikit-learn that
>> I had to fork and make hardknott-compatible) that uses python3-scipy as
>> a build
>> and runtime dependency for python3-scikit-learn so import
>> sklearn.linear_model"
>> is possible. That layer also extends python3-scipy with a native build
>> variant
>> which doesn't exist in your layer AND patches lapack further to use
>> openblas.
>
>Yes, that would be my layer. I had never intended to upstream the
>scikit-learn portions as I don't believe it is maintainable in a generic
>layer due to the niche use-cases and awkwardness of the build system
>itself and it's dependencies, in addition to the very large build time
>which would put strain on auto-builders.
>
>What I had intended to do though, which I haven't got round to yet is
>try to provide a virtual provider for blas/cblas in meta-oe which would
>allow openblas to be properly upstreamed and then packageconfigs and
>preferred versions used for selection as distro policy.
>

Thanks, I wasn't aware of this project. And it looks like you actually 
sent a PR to my meta-scipy layer at one point, so thank you!

Jack, would you mind if I simply directed people from my meta-scipy 
repository to your meta-scikit-learn layer? I am no longer using scipy 
in OE so maintaining this layer (e.g. testing contributions and updating 
for new versions) is falling behind.

If not then that is totally fine, I will just add a call for a new 
maintainer.

Thanks,

Greg
