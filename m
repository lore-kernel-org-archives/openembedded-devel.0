Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3EBE478CEC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 21:41:21 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id q11-v6so11530873oic.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 14:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=VBfWwwCDa47i4MEOHvqta9GxHxTd26km6WHzTfj3Wxo=;
	b=HS6Y5YmU3znuowHetoU0O3TV8Ywgt2zkuBaT1sf/p4bSKL9+ejAVkK7ey3gipflGeL
	k83qwnsqzc4FDy50ZSokW0tVyDOp9iW6XVQFLi1Cp1BVaw9WPrKzUFu5xBTW6Q2LBC6B
	QwgjdLbynef5v7ey8pBEQwKABjapXJe+bm3n5H37U1fQB0TXO+sj9WQ59e5am2/w2kj5
	1/9a1fv/ii34F40WWnmHyL6navRLK090XRpolr0at3BCeLEOLDSlVNVpd1lUHE5MOKHr
	h8TnYWMUsthrUQd3RsPP7PczclrFihFaQ2z/cf4tx7btSd0ckI//MPbVqy76AboeqEXS
	r5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=VBfWwwCDa47i4MEOHvqta9GxHxTd26km6WHzTfj3Wxo=;
	b=oUwWjHsRGmbFKvqsVWAC1E6U+gArw++CAKO5aMp5uA5K4CXRrsRMnOd0Hm1vQFUuqT
	WMGiPL0lGeBBwBI1qRLRj4LEzm96JGLRR1F4Mew5SvV0QQzSeMXD/fT6keJ/vbu0Pj2G
	12rNiccauznxAIBc04iDeZUZdOIiBW3Yj6C1kVXGebAQcTHPcCTeElpLuDjgvY0Uxgez
	4LKiohyeJO93xo68hqPIjFw6c0nU8Ia+DYfxBkXn83xbnSpkzxu2mqP0ZepbmNclbBSb
	IenZbzFwKaXiZ+1YN53smqzUf0/cQ5DKGAUh3FA69pEB3WKXxTtZ8mV+KvfbDxUFJ8pT
	QNFw==
X-Gm-Message-State: AOUpUlF7MZRak+XBisGJmIxmjoESWgYfc8yhGdm99TvMxW0P7g2s7xUj
	TkWbGqRW8O6UfWRF7ytbRo3A3ORz
X-Google-Smtp-Source: AAOMgpfxR5wt6gYphs7+jAHMBeUVeOcJ6gwBs236SGpUE+XH0ASjoNx3ekj5cDG0eXwk4pr4pX5QKw==
X-Received: by 2002:aca:1d2:: with SMTP id
	201-v6mr7799308oib.296.1532727682308; 
	Fri, 27 Jul 2018 14:41:22 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:9e0:3a49:ede8:663?
	([2601:202:4180:c33:9e0:3a49:ede8:663])
	by smtp.gmail.com with ESMTPSA id
	e19-v6sm3091294oii.56.2018.07.27.14.41.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 14:41:21 -0700 (PDT)
To: Derek Straka <derek@asterius.io>, openembedded-devel@lists.openembedded.org
References: <1532722568-9134-1-git-send-email-derek@asterius.io>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c9fc0732-de4a-2691-240e-b3968156f76b@gmail.com>
Date: Fri, 27 Jul 2018 14:41:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1532722568-9134-1-git-send-email-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python-parse: update to version 1.8.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2018 21:41:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/27/2018 01:16 PM, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../python/{python-parse_1.8.2.bb => python-parse_1.8.4.bb}         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-parse_1.8.2.bb => python-parse_1.8.4.bb} (54%)
>
> diff --git a/meta-python/recipes-devtools/python/python-parse_1.8.2.bb b/meta-python/recipes-devtools/python/python-parse_1.8.4.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python-parse_1.8.2.bb
> rename to meta-python/recipes-devtools/python/python-parse_1.8.4.bb
> index 8e16372..c66d4c8 100644
> --- a/meta-python/recipes-devtools/python/python-parse_1.8.2.bb
> +++ b/meta-python/recipes-devtools/python/python-parse_1.8.4.bb
> @@ -1,9 +1,9 @@
>  SUMMARY = "Parse strings using a specification based on the Python format() syntax"
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://parse.py;beginline=1191;endline=1209;md5=5147afdd9b3615290ad8733f0137a1a1"
> +LIC_FILES_CHKSUM = "file://parse.py;beginline=1273;endline=1291;md5=5147afdd9b3615290ad8733f0137a1a1"

Why did the license checksum change? maybe add reason as part of commit
header

>  
> -SRC_URI[md5sum] = "42002338551bdfa0f01bbe4e679a17dd"
> -SRC_URI[sha256sum] = "8048dde3f5ca07ad7ac7350460952d83b63eaacecdac1b37f45fd74870d849d2"
> +SRC_URI[md5sum] = "fa69ab2fe846f9b183411391f7c6897b"
> +SRC_URI[sha256sum] = "c3cdf6206f22aeebfa00e5b954fcfea13d1b2dc271c75806b6025b94fb490939"
>  
>  inherit pypi setuptools
>  


