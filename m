Return-Path: <jpuhlman@mvista.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id EBB05617DC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 18:43:44 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id w6so6782786otk.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 10:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=zNDNHhRPp5LLuNCdYnZOprlcWxDQ5zXDV3w90azwLFo=;
	b=d00ItIf+Vs0LMwR0kmAmBtjnWl1J2HPhxKdinmQu4pdsqrRohiP4Zv2/QvU1vT7WaK
	s0oPNXeTtQFV05/QaIFRChIwJpOTUVRC98eDW1pQ57R04kwXRks1krd43wkjykQRIqjP
	3shQmVF5Ei78W/Rx4q3NCQ8JGSeQFVoyCD79GPss5Eh5d3d0lcdVumcVhGt6jIU3uLSX
	mlXjdNaiKxSj8aWsXIz6vw45ub93LSWG6J2TCxLLb5livonaBTGCZ+NxR3p5Sw1dzHjs
	Wu4jw9LhzEpmsDtcb2Ss9hNfXjlyJwbmzhdy8hJoEyhrhl+2DOLyxRgDNKrTIqhkkDqN
	RGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=zNDNHhRPp5LLuNCdYnZOprlcWxDQ5zXDV3w90azwLFo=;
	b=LT48SXFoCoiLhbPjJ/pbIrNgx0dfMDyIGZM4Rz/ZLkoLuvNB9Hf2eLx0x+bcnNRaYd
	s2sZ+Am9XFY0H+D9Wf3vQ7wv2I7g5nz4nIRFv5ApsmzibXOkQ9/yrjJcGBBGizBFz1pc
	tp7nI0/kbqYUvZWaBPJgNaJb1F3PVUsioWWAq2Qs+W1E+kc3Fh9HmkiY7pRRjr7Jsw5n
	FuPAOqV4BCP41ewfHzaNcLm9rTNx38GyJiV9RDEbK7oGuzIoSf6AE4bNzwqhn056wuFl
	S+pYuSpGTpGRg8Ppg/pKOZw/z72dO8yv7dCT8SOEvvGvzTxIV3ILZCL4dsogs4EADeeG
	8j0A==
X-Gm-Message-State: APjAAAWMl/Pd2XOXYCmTK0c8yU6WW5Yjg8atMt1NhB/jqmIJ27DJhz96
	Gvgq0HPRjlRlGuj0zRRIfQ8sIhT+/Go=
X-Google-Smtp-Source: APXvYqzVmwI3pDEvB+cszzjKXTmHgoHp3FHnW+eTeR2ZK0iVVbndGvVjOud6bbErrHOKBeprFQ62FQ==
X-Received: by 2002:a9d:65da:: with SMTP id z26mr37893070oth.197.1582483425398;
	Sun, 23 Feb 2020 10:43:45 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:90ba:d6d6:a4f7:d5eb?
	([2600:1700:4c90:60a0:90ba:d6d6:a4f7:d5eb])
	by smtp.gmail.com with ESMTPSA id
	w197sm3228997oia.12.2020.02.23.10.43.44
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 23 Feb 2020 10:43:44 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>
References: <20200222052935.19762-1-jpuhlman@mvista.com>
	<55c135f4-f708-bacd-889f-23f7b1e7d889@gmail.com>
	<463ee6f2-787f-b536-229b-9ce4718df026@mvista.com>
	<20200223184052.GA3444@localhost>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <71618158-c5c7-991a-f0e5-96c085e959da@mvista.com>
Date: Sun, 23 Feb 2020 10:43:39 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200223184052.GA3444@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ipmiutil: gzip man pages with out timestamp
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
X-List-Received-Date: Sun, 23 Feb 2020 18:43:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/23/2020 10:40 AM, Adrian Bunk wrote:
> On Sun, Feb 23, 2020 at 10:23:48AM -0800, Jeremy A. Puhlman wrote:
>> On 2/23/2020 12:15 AM, Khem Raj wrote:
>>> fails with clang
>>>
>>> https://errors.yoctoproject.org/Errors/Details/392235/
>> Its a hosttools issue. I was using hosttools tarball that uses pigz
>> as its gzip. Just needs a depends on pigz-native. Ill respin it.
> Is there a reason why you aren't using -n instead?
Cause I was laser focused on timestamp. Yeah -n is the right way to go, and
I don't use the system gzip pretty much anywhere(all my builds are on top of
the buildtools).
>
> cu
> Adrian
>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


