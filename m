Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id E9100799F1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2018 19:25:20 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d4-v6so3877074pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2018 12:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=+GyNUO4V3xr8oWLBLFWEreFg46A1ZA3SI2vU84/52Tg=;
	b=N1g0AVJ5V+2zsJDYwWSrKJPvcsPEBidQ3wLSPrmNGQxBLVVeWMMelWu/jeWZMITb2C
	dnWfnkFaeYZ3CkixBmSmXorFnbUhK9m8OzMfsiRoNU1iN4IyUduzzFn8O20fzHRcEotv
	s8JE42/CRsELSy1ERZavh++tl/m5DjGZlAxtQl/puhb3QeIyvod419rzXdQm7fI1Dihn
	6IuoBFlLOG8+RUdg/S3FK855sT1krV1He88Hvd1zcDDRpGhwkfwh8wzG0kY7/4ivrIxN
	ZQEI7mMFKDFW5pVvHyo8CRmAw815yuRpzvI1phzbfb5zAeZgrA6zMikPVZzfCDNj+FPU
	tXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=+GyNUO4V3xr8oWLBLFWEreFg46A1ZA3SI2vU84/52Tg=;
	b=U9kW0Arae5JsDiEWH+9LeO7Zh3Xgg12HtC4vPDmY4qYAcICI2Hn1Sw77ShlsRaiidE
	jdDuiuBhFPtFlhuQycx/iiE9VCDCUZJzaKkOOPhH2lSCQI8I74q6h9UBC8AcexBYRK4M
	ooVJnRNe59keVh2iVL26YS3YFwmrLYkc4hCDY69pvH40l2BnR8tcCEptMjX3rEmCNXku
	6oiPOxiSAZsqjlxQoT0xFTlkFJozJ6NhqasYz2US7eEB2K74w64pDo+5iM9A3z+PUpYZ
	WwPPRboN73rz0p1ASPoeGYYNFZR5q9H/sxCWzDsweA3hlieHJF6SX28SPxpKcQ4VaXck
	XZgw==
X-Gm-Message-State: ABuFfoi1LYE9esoYjqjn5VsGcUPlDKydZJ2t7vRuP84t22X+WVtV3z/6
	/P6lZWF+dbKT1q9xCM35Z2FbEmEu
X-Google-Smtp-Source: ACcGV60fRwkQ5O/Nfd1gBmd+SE9u6Vj3hoIj1+6pnpSQ4PoAizIBPLBsDjuRjvlBK6aVLgOp86q5jg==
X-Received: by 2002:a63:991a:: with SMTP id
	d26-v6mr7043194pge.434.1538681121782; 
	Thu, 04 Oct 2018 12:25:21 -0700 (PDT)
Received: from [10.43.100.234] (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	s13-v6sm8924620pfj.105.2018.10.04.12.25.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Oct 2018 12:25:20 -0700 (PDT)
To: Giordon Stark <kratsg@gmail.com>
References: <CAFzUWGmFaHwccznqTA_ppKA5SNjcB2+SqwYgP1yvtACMrKiLLQ@mail.gmail.com>
	<d9590764-7090-4740-32d1-51efdfb0711e@gmail.com>
	<CAFzUWGmt1hNAtJtSoVkE-1HJjS9aQKrTgykZOjqHQNxmZC77XA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c325e297-1cdd-468b-ba64-f8305f396e8d@gmail.com>
Date: Thu, 4 Oct 2018 12:25:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFzUWGmt1hNAtJtSoVkE-1HJjS9aQKrTgykZOjqHQNxmZC77XA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Emily Smith <easmith5@uchicago.edu>,
	openembedded-devel@lists.openembedded.org
Subject: Re: devmem2 64b patch missing in rocko?
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
X-List-Received-Date: Thu, 04 Oct 2018 19:25:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 10/04/2018 11:02 AM, Giordon Stark wrote:
> Hi all,
>
> I noticed that this fix in master
> (https://github.com/openembedded/meta-openembedded/commit/1bcd15ed5b31bdec492af99f671718d7a6eb887b)
> still hasn't been backported to rocko?
It had to land in sumo first, which is did.
http://cgit.openembedded.org/meta-openembedded/commit/?h=sumo&id=4504d2e78d544ef649dede6148675cef3ca500e3


>
> Is this still in the works or have I missed something?
working on Rocky changes shortly.

- armin
>
> Giordon
>
> On Tue, Jun 26, 2018 at 1:15 PM akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>
>
>     On 06/26/2018 12:37 PM, Giordon Stark wrote:
>>     Hi all,
>     Wrong mailing list. Meta-openembedded questions should be directed
>     to openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>
>
>>
>>     I noticed on a 64b board, devmem2 isn't able to write 32b. I
>>     noticed, surprisingly, that there's now a patch for this fix in
>>     master
>>     (https://github.com/openembedded/meta-openembedded/commit/1bcd15ed5b31bdec492af99f671718d7a6eb887b).
>>
>>     I'm currently on rocko, which doesn't have this additional
>>     change. Can I just cherry-pick this commit onto
>>     meta-openembedded, or should I apply these changes into my custom
>>     layer, and leave the meta-openembedded layer untouched?
>
>     I am running through master changes and this changes is a
>     candidate for backport to both sumo and then rocko.
>
>     - armin
>
>>
>>     Thanks,
>>
>>     Giordon
>>     -- 
>>     Giordon Stark
>>
>>
>
> -- 
> Giordon Stark


