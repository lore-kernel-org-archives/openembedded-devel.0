Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 81FFE7CED3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 02:41:49 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w10so8266703pgj.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 19:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=0Cg/Wdq5Zf7aEzMfJ5QTd6vzQaPMLy+uS0ZagtiWwCk=;
	b=t0s4U9RVJ3Bt8amAnXNR5M/LPxlj7DHw/ADpVs70WBRgi9w4ZTSR6H3XcSaVZkQ30g
	Z8fp30GUhvZ2Fq594wZWvG/JNA4DkWmxQww06UaChvtXxHXzSiKC8g85CX4vbi5J2y2G
	Yz6LtF7zVZ4ap8cWvqZJpa5GZUk5G7gxzbvRr4jOn/y63esmhbTdv4ACAn1snzU8fJBz
	usDtmRVJgOG/NaCxTnBEv571ElEhx6lnwkZkOGszI9EGkK+H5DLv4V03h6Dj/I5xGTWe
	9xr5a28WNmU2Hdk/Zr/gKA+s0OPPyVdiqNBxrquO5q2caEhDyx8EPjMPaQNA4Irmo2v9
	Q1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=0Cg/Wdq5Zf7aEzMfJ5QTd6vzQaPMLy+uS0ZagtiWwCk=;
	b=q2Yo/YXN5U24KqbyH3Cn4vT7dvmPzbxjScNeM1tNkrEus2rjHRjdHKURYZdwkNYKMa
	m6Pg5NK+XXefU/HifijUz55Zc4BGRy8ow/ijqa2uDBDUNBpnF39kb9t9LAcq5m4kOZUD
	5xLG0qdyyLpj+8XL2P7GcILAzcpEwk2qQboDQFOVx7XH0Bod+4pwKEOLV3qHmkX+Bf/p
	h61BaL19uCgGGCG2220ddZG0B6QtTD9qMcYa0R1rjvdraPEd8zqYCIYxQKu4RPamDawZ
	fOwSB29CdstV7YC8xrDoV/w/vATcU+T4DmtCSFqqWYZ6/nyF/LaBUU39Oac7glqmRh72
	b1Nw==
X-Gm-Message-State: APjAAAUeXBYbOGFTOgGpSjiKaPPcWfmEeIC8ljndKdPlj2u4TiCjDmMR
	3SSmfyqdGue9kxz00QNDgD/jM9p5
X-Google-Smtp-Source: APXvYqzk+vhbrj/lK8WLIwx0ygm728NFwC3hUJUbyBGOZqujEr+O86qEmvOFNb6hNaCS/v+dcpmj8w==
X-Received: by 2002:aa7:9085:: with SMTP id i5mr10256971pfa.136.1567478510737; 
	Mon, 02 Sep 2019 19:41:50 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8d1e:9a6d:fc3a:2e51?
	([2601:202:4180:c33:8d1e:9a6d:fc3a:2e51])
	by smtp.gmail.com with ESMTPSA id
	u1sm13572083pgi.28.2019.09.02.19.41.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Sep 2019 19:41:50 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, Khem Raj <raj.khem@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
	<6404de28dbc2189edeae0045bd619b91de54198d.1567286967.git.akuster808@gmail.com>
	<20190901063232.GA22307@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <b1225829-5a75-9ed0-1db3-8f8e7df74df2@gmail.com>
Date: Mon, 2 Sep 2019 19:41:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190901063232.GA22307@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior 14/23] libopus: Limit forcing ARM mode ISA to v5 only
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
X-List-Received-Date: Tue, 03 Sep 2019 02:41:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/31/19 11:32 PM, Adrian Bunk wrote:
> On Sat, Aug 31, 2019 at 02:31:35PM -0700, Armin Kuster wrote:
>> From: Khem Raj <raj.khem@gmail.com>
>>
>> This lets newer armv7+ still use thumb2 ISA
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
>> index fb9bdc7..1512a1d 100644
>> --- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
>> +++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
>> @@ -50,6 +50,6 @@ python () {
>>  #| {standard input}:761: Error: selected processor does not support Thumb mode `smull fp,r2,r3,r9'
>>  #| {standard input}:773: Error: selected processor does not support Thumb mode `smull fp,r3,r5,r8'
>>  #| make[2]: *** [celt/celt.lo] Error 1
>> -ARM_INSTRUCTION_SET = "arm"
>> +ARM_INSTRUCTION_SET_armv5 = "arm"
>> ...
> This is an optimization, not something that should go into stable.
>
> It also looks buggy, as if it would break the build for armv4t
> and some armv6.
removed from list

-armin
>
> cu
> Adrian
>


