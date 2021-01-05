Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web08.5207.1609853533863369933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 05:32:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=SyEp/lv6;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from [IPv6:2a06:4004:10df:1:da27:a6d2:5305:fd0a] (_gateway [172.21.0.1])
	by first.geanix.com (Postfix) with ESMTPSA id 47B984E0B11;
	Tue,  5 Jan 2021 13:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1609853520; bh=QLeMpx8gqy5IqaHVT3qyNJx5XpDo26FjqwyWCr386fE=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=SyEp/lv6KT+GTMTpkfeg6KyYSYoNUcXDx814d6kNQ3cSpOumHqcsKIU2L+gdxrLLg
	 ZMyOUzZQL9Td7bHsHoQDNyAK9Qta7RLJKdHEp6IE8VHyXxx1Dh/kTAKrxuSF5w6uxG
	 jCCE5KAAUTSWm+RvYBpDUZSIw11wLSqpZA3Eckiyfnqnh/lQdVbnbLFz4Lws3kfFYF
	 ZUv9Ztbi1amxgmnv9xucMZDZX/sBe6X4vem5nl6Y89saqTVv9f9cy0FTyhMHvCOWPm
	 QLG/+zszuqc6xT1AXFzS5aQ4wn7So9V188l0auYdAkWhpqcvYCqnjmn+1IYgnELhej
	 scUJPQ2djpirw==
Subject: Re: [oe] [meta-oe][PATCH 1/3] nodejs: 12.19.0 -> 12.19.1
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
References: <20201216053013.1661310-1-raj.khem@gmail.com>
From: "Sean Nyekjaer" <sean@geanix.com>
Message-ID: <dce6c45a-90c6-c69b-3e61-41174892c91b@geanix.com>
Date: Tue, 5 Jan 2021 14:31:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201216053013.1661310-1-raj.khem@gmail.com>
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
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
>
Hi Khem,

Will you please backport this to gatesgarth :)

/Sean
