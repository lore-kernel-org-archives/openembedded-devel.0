Return-Path: <jpuhlman@mvista.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 72080744D2
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jun 2018 15:52:12 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id 188-v6so1043750oid.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jun 2018 08:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=sIQTl1NBXGw9AEPQeweRGuNt5GnWPgI/b/0kSXrBwE8=;
	b=l3xcdM7EBm0s7JUp4mPx6fLX/7n+wooymOagJA32NQyosNooB5N2SQ2b3KYC0tBC/g
	1Ep6+mCyDciWc46lGj2aGVVs1/kV8u+mjIrXTbBEH6n04vbyB/V7GSMQXo72+9nCYnGw
	bQyfVJbZO980G9NAY/p1vr0mDBIMFAxyKg1rbR9UlAlyGQDPMLyEGCRVkbm+ngnG5qx+
	/DdfUGx6h0ff8kRsVisWU4qdHofao8b4gRAXonAunpmmaigs4BjGCEPCbzDiPZmpjVyT
	iM6guwnpixqBgL+QbmIsxFMUd9CtAGhhPQ3s9VlgU/RFZT7g5GlWH/me9DMuwLjsW7dp
	Y6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=sIQTl1NBXGw9AEPQeweRGuNt5GnWPgI/b/0kSXrBwE8=;
	b=bMXZO+cjzuzUlgmZCpRSFxX/rpnENJaNYS2TyuCqAX2BqtpaEZVu0WZJnF+Ht3mBLm
	N+kqJyxDNjFYQihjdP+yx7PSdCBLjUo/xgo/hOPP+KAJcoZbdveQsSdFiuoDIzN74J8b
	JQOtnbPmivtfGCvxWWj4Z8ErD6iZ5kLPy7OcTsEnTBUnmS2oJTYUQ4ae+ZpAx7ESbPqI
	l0yS7/nvrViSjnR0KzKfY8PdU/QiLNn0gmzpdQq+0vgRUamTF0sxHc8l9UezHSecV93a
	3AJeU5b4Ji8mhzMmjXVQp1YBZqFkoOryPzAyiM1ykzCqV1D7o9TL6Si5H4c3ZpdncG68
	OloQ==
X-Gm-Message-State: APt69E2yoSXQqH8/Dsw2XaRDc+8DVZz/dFbLoVD3MDAdKoB7Ilxlbrpe
	sUxFtIAmm8YeesaJjCtY+hXYQ68HwB8=
X-Google-Smtp-Source: ADUXVKImHNL10w4hxKOquGGp9GHkQDVITzWheXxLC0NnypgwD5O5fKugk65HArH+LTJl5q6gci8DTQ==
X-Received: by 2002:aca:3c02:: with SMTP id j2-v6mr713455oia.238.1528559532943;
	Sat, 09 Jun 2018 08:52:12 -0700 (PDT)
Received: from ?IPv6:2600:1700:4c90:60a0:5566:b07f:3f47:4a0e?
	([2600:1700:4c90:60a0:5566:b07f:3f47:4a0e])
	by smtp.gmail.com with ESMTPSA id
	p3-v6sm36451096otp.2.2018.06.09.08.52.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jun 2018 08:52:12 -0700 (PDT)
To: akuster808 <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1528499179-8589-1-git-send-email-jpuhlman@mvista.com>
	<e0d37e88-7135-4bd8-2f0e-3b8faca30b79@gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <d1f1d05a-7bed-7bf2-9813-52c7f42e33ea@mvista.com>
Date: Sat, 9 Jun 2018 08:52:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <e0d37e88-7135-4bd8-2f0e-3b8faca30b79@gmail.com>
Subject: Re: [meta-networking][PATCH] spice: Update to git hash to pick up gcc8 fixes.
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
X-List-Received-Date: Sat, 09 Jun 2018 15:52:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/9/2018 7:39 AM, akuster808 wrote:
>
> On 06/08/2018 04:06 PM, Jeremy Puhlman wrote:
>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>> ---
>>   meta-networking/recipes-support/spice/spice_git.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
>> index 35482ca..508bb36 100644
>> --- a/meta-networking/recipes-support/spice/spice_git.bb
>> +++ b/meta-networking/recipes-support/spice/spice_git.bb
>> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>>   
>>   PV = "0.14.0+git${SRCPV}"
> Is it still at version "0.14.0" ?

There does not appear to be another release branch. So its 0.14.0+git 
additions.

>
>>   
>> -SRCREV_spice = "2a3d5624382ba49c4eb906e69697b92f79d06cf4"
>> +SRCREV_spice = "33d9c38554b41dab1390914ef79594b57218b06b"
>>   SRCREV_spice-common = "4c2d0e977272c5540634d24f485dd64c424f6748"
>>   
>>   SRCREV_FORMAT = "spice_spice-common"

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


