Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id D91847F883
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 12:01:31 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id y6so14457893lji.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 04:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fm7IXFrcPQv/gduh928XwZYXHaLRxr0w8KF5fVAyBes=;
	b=Xa2cI2g1Y5jTdnxW5P2j+JX54vjnJg+rUGBW3kTftn44rKujbmTnAxy1zTaKBd2wvf
	DLRgW7HDvsU7TWBT2qKt38QPyyBFjdQUMcROFsQAcXXTPrTHVoLb9bgR7BP+3XbUuiau
	f3vyAq9nrjlCspBjY0jEMGk0ZFd1SYu/0YRMvui6Tx5L2cTbRuNYIIG0CeuFEFeCJ4I0
	pdq2nZlLYg0ABat/5haulPo3wfy0sHv9J3ctqHAoenRWItf1qmOxPO3UaVMKC0SL0UnK
	+5y+zWDQXm6Z8WafpFdamj9EejUNXgnQ0pHLtzli8N9mNSL2UmbWS0xuonynDTPHkr0Q
	0g3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fm7IXFrcPQv/gduh928XwZYXHaLRxr0w8KF5fVAyBes=;
	b=ZpTTzqaRo21dbu597deKlVYlQMvO3uWeyen/r/vmEaNenr2ul/gJc9cHzYbeBV6gOo
	vouiWsb17Dt/Ea0gdj0WVqjD29SN8xHkK0lktyye8/yLV1Qv8jtthXitJMiAnnHVHsfQ
	op1NYcvW5fsQbWeJQFW7DZYTgbXOvVwBGRQ7LRjfmirVOkU6/n96KQS1Fvlnwx4CeAS3
	hssRNugYfqXClToPAm6bLILK+jHrjaFz+rIHAWd/7riF2zEs+jTA9qG4Jnb4iH/xv7wp
	wETavUKbTlJwNiy+MH0ElSdUv9NsD1NnIapJ0lIsHLOLIFnnTLg2vmCTp6BKFBoo5T2S
	g5oA==
X-Gm-Message-State: APjAAAWwEchTrnQ0Nk9Wg3Y6O4jLLSWLVjx0Vlh6I3efie5WG/grK9r8
	keSJDwqEiR0suSKgN4ZpVi2RKCNA
X-Google-Smtp-Source: APXvYqy9IDh9iwtgsRtyL63840sSY25Vu/IJEUsaEVagnzS3n2sNWT60cpB6c4TvVGqIOSJfnKr+Ig==
X-Received: by 2002:a05:651c:149:: with SMTP id
	c9mr10765309ljd.80.1580212891661; 
	Tue, 28 Jan 2020 04:01:31 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	19sm11907800lft.81.2020.01.28.04.01.29
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 28 Jan 2020 04:01:30 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
References: <20200127112451.165555-1-richard.leitner@skidata.com>
	<c43cf573-d876-8a4a-d978-fc4b2303e747@gmail.com>
	<20200127145758.GA603314@pcleri>
	<6c208020-0b53-4701-1173-6e59c0f2b5c2@gmail.com>
	<0dad623b-f095-3170-26c9-5a554b509469@gmail.com>
Message-ID: <0a54c1f8-5c2c-9d2f-1e1e-757b32eaa0c5@gmail.com>
Date: Tue, 28 Jan 2020 13:01:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0dad623b-f095-3170-26c9-5a554b509469@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH 0/4] openjdk-8: update to jdk8u242ga
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
X-List-Received-Date: Tue, 28 Jan 2020 12:01:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/28/20 6:43 AM, Jacob Kroon wrote:
> On 1/27/20 5:05 PM, Jacob Kroon wrote:
>> On 1/27/20 3:57 PM, Richard Leitner wrote:
>>> On Mon, Jan 27, 2020 at 03:10:04PM +0100, Jacob Kroon wrote:
>>>> On 1/27/20 12:24 PM, Richard Leitner wrote:
>>>>> This series updates Openjdk 8 to the latest "ga" release 242.
>>>>>
>>>>> Successful testing has been done on a fedora-31 build host for
>>>>> qemuarm64, qemux86-64, qemuarm32 and armv7a.
>>>>>
>>>>
>>>> <cut>
>>>>
>>>> I don't know if it is related to my setup, but "bitbake openjre-8" 
>>>> insists
>>>> on rebuilding itself every time I run it, and I don't see any sstate 
>>>> cache
>>>> being generated for it.
>>>
>>> I just tried to reproduce it, but neither for armv7a nor for aarch64
>>> openjre-8 is rebuiled on the latest poky/oe-core master when nothing was
>>> changed in meta-java.
>>>
>>> So in your case it also rebuilds if you call "bitbake openjre-8"
>>> directly one-after-another without any change to the layers?
>>>
>>
>> Yes, precisely.
>>
>> But.. I think you can ignore this. I suspect I have confused bitbake's 
>> hashequiv database by pruning old cache-files using the 
>> sstate-cache-management.sh script.
>>
>> Joshua, do you know if that script is supported when using hashequiv ?
>>
>> Gonna try and remove cache/ aswell, and see if that helps.
>>
> 
> I just retried on a clean build, I wiped everything, and openjre-8 still 
> insists on rebuilding on the second run. I don't know whats going on here..

Looks like it is caused by me using rm_work.bbclass, it seems to wipe 
something that causes the rebuilds.

