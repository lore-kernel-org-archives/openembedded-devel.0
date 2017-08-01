Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 707C178226
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Aug 2017 23:37:28 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id d67so13780876pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Aug 2017 16:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=UIy4CIidILIMMRijroK1QM1VhgsAmo5LMKpO0G7nekA=;
	b=nWNO5QguMreG0+8egbHADP/HGldKzCcCsZnO/P8mITQV59Rwhck1NVlO15Kw6OqEqa
	oG3gRjZEMdrf585AfeOCjcKNFpE1y5nW0wwl7tdU50TWlmDYbs/2gNXd3tzSco5YQA2r
	4UyyKi21Cy40ieVf7V4A0F/3GqcKul1Niux9wYrfrGmw2tR7No72GzjKFYAA7GwLleUv
	baA9qV0aKfajkMssL7PsBJxrD//zqQanryzrGBYr4OtTXualP7SEGl4sP8y1dU2zbkhz
	w4NnKzCWcm8ap+txJ47NHYsEcgUHPFlWh93I1lMMyEY+1OUlVtAwiY4AhfWidrMig3jF
	hU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=UIy4CIidILIMMRijroK1QM1VhgsAmo5LMKpO0G7nekA=;
	b=H5BA+863olW1Jh/Q2+f39aLw+KpPZ7kEU0qhmjSIGZQ1LW/OpxjF5urCB8hlEL0JeD
	PQM0/f149H1i1GjLIFSBxH0EB8mJYqPPzOnRNtCC605GisMXjB5+gQVisA2ch/SOXe0o
	Hfi4YaAu5T3EYL1I8Y9M4BbhhECflG8VVWt/08wxZ7RojlzAle72Vxj4KWCUZCZdMBgf
	PyfUlG+U8XZWG+7M/p4M+Pshw0CGXLL9Fy0g5//16KCaVBOHJUf25QPFWSCE5y/O7Z5l
	1re6rXe6VrdWQHqIQzNxKjMxLewEcEZKnsfO4LtY59emkIorWS6NR1taWSCWCAS+2zWW
	HJTA==
X-Gm-Message-State: AIVw110zDk9w3uvyQlrJd++92FvxO7XxHom+Ko6+XX7CGQAT2IyNowvw
	/onUNGYQf0Bue8s9
X-Received: by 10.84.209.165 with SMTP id y34mr22753773plh.396.1501630649540; 
	Tue, 01 Aug 2017 16:37:29 -0700 (PDT)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	r64sm62012869pfj.62.2017.08.01.16.37.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 16:37:29 -0700 (PDT)
To: Alejandro Mery <amery@hanoverdisplays.com>
References: <20170623202324.69194-1-amery@hanoverdisplays.com>
	<20170623203729.GY28053@denix.org>
	<793b1001-788f-7a2a-f8f3-83b31d234ee5@gmail.com>
	<CF323D845261FD4F9B1E997381250334E33AFBF1@maildb.hanover.local>
	<CF323D845261FD4F9B1E997381250334E33BC480@maildb.hanover.local>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1182bbff-48d2-ed9b-f09d-69dbbee90632@gmail.com>
Date: Tue, 1 Aug 2017 16:37:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CF323D845261FD4F9B1E997381250334E33BC480@maildb.hanover.local>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][morty][PATCH 0/6] merge devmem2 and gitver fixes from master
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
X-List-Received-Date: Tue, 01 Aug 2017 23:37:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/27/2017 09:44 AM, Alejandro Mery wrote:
> On 13/07/17 18:03, Alejandro Mery wrote:
>> On 26/06/17 19:38, akuster808 wrote:
>>> On 06/23/2017 01:37 PM, Denys Dmytriyenko wrote:
>>>> Wasn't there already a submission for devmem2 backport on the list?
>>> yes. running a bit behind. pulling in today.
>> ping :)
> Hi Armin,
>
> if you don't have time at the moment to take care of morty/pyro maybe
> you could appoint someone to temporarily take over... or no?

I believe they are in pyro:
http://cgit.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/devmem2?h=pyro&id=fc801961457fe2fbb24973bb43b302ad46044cb8
http://cgit.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/devmem2?h=pyro&id=6c584374a599f6f8d3607f20ecfc13a67ccf1da1

so what is missing from Pyro?


Morty pull request sent.

- armin

>
>
> Cheers,
> Alejandro Mery


