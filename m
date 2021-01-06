Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web10.4562.1609915227315902233
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 22:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=EAehVRI8;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from [IPv6:2a06:4004:10df:1:da27:a6d2:5305:fd0a] (_gateway [172.21.0.1])
	by first.geanix.com (Postfix) with ESMTPSA id A8C4C4E1070;
	Wed,  6 Jan 2021 06:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1609915217; bh=zQHKaiLCKP5twJMDDe8tTqHENTWEyRLKYLgdst+wiC8=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=EAehVRI8YEDLm5KTP9/lQtei23IxTSuxNtxY7SpJLhrFqA9VEvBz1BVIg19JtI18n
	 1kjRd0bU1haC3VTMENWH36Chp/BJ5d+APwb5+OKNmBHN47XUVBYrPGBr20tPMfVXiF
	 Qg24JhxpilbojsHIwdVfUAo6+NuA3E8/eyDpkzjzcQkXGRWNBuqtOy6RiLWihTFku2
	 ZsOf7zlYNYlI5U9p0L3eGPioZHggG0kCqel/Zv5AT9Baf6LO0v1rupX/FjBxeyWs6U
	 Slsi7AnFjBQ/H1Y9ea5tDfaz0dFvrfwGeoc1fI1cXKqLYGWls5yhAG8l9KoMkR0axa
	 8jmgql2YjBh1g==
Subject: Re: [oe] [meta-oe][PATCH 1/3] nodejs: 12.19.0 -> 12.19.1
To: openembedded-devel@lists.openembedded.org,
 Armin Kuster <akuster@mvista.com>
References: <20201216053013.1661310-1-raj.khem@gmail.com>
From: "Sean Nyekjaer" <sean@geanix.com>
Message-ID: <88ab18eb-725c-0e36-debc-ddd21fd36772@geanix.com>
Date: Wed, 6 Jan 2021 07:40:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201216053013.1661310-1-raj.khem@gmail.com>
X-Spam-Status: No, score=-3.3 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	URIBL_BLOCKED autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on ff3d05386fc5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 16/12/2020 06.30, Khem Raj wrote:
> From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
>
> Uprev nodejs in order to fix CVE-2020-8277.
> This CVE allows an attacker to trigger a DNS request for a host
> of their choice, which could trigger a Denial of Service in
> nodejs versions < 12.19.1.
>
> See https://nvd.nist.gov/vuln/detail/CVE-2020-8277 for details.
>
> CVE: CVE-2020-8277
> Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Hi Armin,

Will you please backport this to gatesgarth

/Sean
