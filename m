Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1F3E874A24;
	Mon,  9 Apr 2018 22:31:27 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id u86so6591263pfd.2;
	Mon, 09 Apr 2018 15:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tkwWqdrjrUoMoKc0HD+2dcgmKe5Y3q/vniopvkbzGs0=;
	b=XxcfXxQsSCKUeVuKBYagdjVT7Ayz0qHxksezJYqpY0grHUDJs4EQqjxD34InxYjxzy
	udFFOj22ixxCiuBJ6hdy7kUN8SCbMvI8dPJOzBbaZtpYrFwfodx29nJNs5g33z7azjAh
	OsgYYd9pZKSfnqV9lHaC4IDXBvsPtJD/scFVFXWGPxFlm6J5i8sLMxKeI+Dn0HqsAC+A
	FvKgVIlEvKxHPfkZ8xVPbmtJqdeOdRylzezAXQelZoT0/IuCKQ4TKX4pWGo819p/CKa/
	FEM3b0tzggNuxdCrPBuKV81bOXR0xdkc3gCJ8ZqvJkUKuk2mrAANORlE+uaKd4OYoj0Z
	0/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=tkwWqdrjrUoMoKc0HD+2dcgmKe5Y3q/vniopvkbzGs0=;
	b=kgatZ7vtEvg+GlaBlo6CqxlUrFLLydXgtwli7OKnMOSFk7NPtBFeavm5FhuBngLSxm
	3xwXSaLvNj1n8RfsFfKIenT/BIizPrau9Ee+V0UHj1KwTY4hnjQmj5uy1x8HxwEhXNul
	/RY2ZsVybDCSCGHymPWC/ylNLmUnfiedBVmQ2L2UZokGR0/M2FTUgPi6ZzBVpQFYFHDX
	VRfTn2etyo7NY5jrnfKF+DcNMR9mSGk0O2lr1FW7xZwFnatrE1HvcUj54WNBGCrj0cyO
	bMgcEmm8jEqXvpj+nKbYnTyOi7U9hModyfUAIXF9meQ99Bo4Ol0mmF75i3EECS1PfYaf
	BSjg==
X-Gm-Message-State: ALQs6tC6qahBjHbjO9uk6l9swiee2YhSG7hfImtPKtxP7J/lp2pIIq1s
	xutgKDhCgB6KiNv2wkdNnfiV4a/0
X-Google-Smtp-Source: AIpwx49suaSTCzkAD/MKG6/YcLvFdh+4hf0UZvPOezR6Y+KqMsIl1PBu8q4UZBMe3qRnd3zdEYXeyg==
X-Received: by 10.98.133.212 with SMTP id m81mr581888pfk.61.1523313088809;
	Mon, 09 Apr 2018 15:31:28 -0700 (PDT)
Received: from ?IPv6:2601:646:8880:466c:d8c2:1bee:5b5c:2c82?
	([2601:646:8880:466c:d8c2:1bee:5b5c:2c82])
	by smtp.gmail.com with ESMTPSA id
	k73sm2095882pgc.55.2018.04.09.15.31.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 15:31:28 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <152313690992.11940.6799878390820377002@git.openembedded.org>
	<20180407213510.474412329D5@git.openembedded.org>
	<CA+chaQeNd3F9oXBYFsj4YaxfJ+k3uvXDcdcHy-AP32MWaHT8aQ@mail.gmail.com>
	<CAMKF1sqJx2er+dqsuESsw_ooxh59pvx5547JyFseBdK0Fjycvw@mail.gmail.com>
	<CAJ86T=U4f6OXG88uHqwg4URov+icap8B0ZFWOw_2uWoAx6oHqQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <f36e699e-2d1e-821d-5641-4d9552c66d7e@gmail.com>
Date: Mon, 9 Apr 2018 15:31:27 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=U4f6OXG88uHqwg4URov+icap8B0ZFWOw_2uWoAx6oHqQ@mail.gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 02/02: nativesdk-glibc: Split glibc and libcrypt to use libxcrypt instead
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
X-List-Received-Date: Mon, 09 Apr 2018 22:31:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 4/9/18 3:23 PM, Andre McCurdy wrote:
> On Sun, Apr 8, 2018 at 5:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sun, Apr 8, 2018 at 10:00 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>>> On Ubuntu 14.04 this fails with:
>>>
>>> ../git/gen-des-tables.c: In function ‘write_table_u8’:
>>> ../git/gen-des-tables.c:307:3: error: ‘for’ loop initial declarations are
>>> only allowed in C99 mode
>>>    for (size_t i = 0; i < m; i++)
>>>    ^
>>
>> You can patch this to move declaration just above loop if that helps we
>> should apply such a patch for compatibility sake but I wonder if there are
>> more c99 assumptions at work here
> 
> It looks like the upstream intention is to be buildable with c99 + GNU
> extensions, so explicitly setting -std=gnu99 seems reasonable.

see this statement worries me from same document you quote below.

A few C2011 features are used; the intention is not to use any of them
without a fallback, but we do not currently test this.



> 
>   https://github.com/besser82/libxcrypt#portability-notes
> 
> There even seems to be a configure check for it, so not sure why
> Centos6 etc get through to a build failure?
> 
>   https://github.com/besser82/libxcrypt/blob/develop/configure.ac#L33
> 

thats not checking the defaults, its checking if c99 is supported or not
and that is true for a lot of older compilers.


