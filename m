Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 386A27FE04
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 08:31:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0098VUtb003347
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 9 Jan 2020 00:31:30 -0800 (PST)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 9 Jan 2020 00:31:30 -0800
To: Adrian Bunk <bunk@stusta.de>
References: <1578463743-72832-1-git-send-email-liezhi.yang@windriver.com>
	<20200108092700.GA25926@localhost>
	<133f8cc7-2ef2-cee6-1642-251bd880cdc0@windriver.com>
	<20200109081406.GA6849@localhost>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <aae96c30-db44-b4ef-9c4c-ec44088e18ee@windriver.com>
Date: Thu, 9 Jan 2020 16:30:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200109081406.GA6849@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] rocksdb: Fix compile error for DEBUG_BUILD
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
X-List-Received-Date: Thu, 09 Jan 2020 08:31:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/9/20 4:14 PM, Adrian Bunk wrote:
> On Thu, Jan 09, 2020 at 03:13:57PM +0800, Robert Yang wrote:
>>
>>
>> On 1/8/20 5:27 PM, Adrian Bunk wrote:
>>> On Wed, Jan 08, 2020 at 02:09:03PM +0800, Robert Yang wrote:
>>>> Fixed do_compile error when DEBUG_BUILD = "1":
>>>> db/write_thread.cc:183:14: error: 'state' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>> ...
>>>
>>> -Og warnings are not 100% reliable, and in general -Werror is
>>> problematic for distributions.
>>>
>>> Does building with -DFAIL_ON_WARNINGS=OFF fix this problem?
>>
>> Yes, it works.
>>
>> I think that the correct way to fix it is initialize it rather than ignore
>> the error.
> 
> Is the error a bug in the code, or is it a bogus warning from the compiler?
> 
> When the warning happens only with -Og this is a known case of bogus
> warnings in gcc, and the correct way to fix it is to ignore the bogus
> warning.

I checked the code, it won't be used before uninitialized. But I still think
that assign it an initial value is better than ignore the warnings, there
  might be other vars really have this issue.

// Robert

> 
>> // Robert
> 
> cu
> Adrian
> 

