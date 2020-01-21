Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9618F7FD84
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 12:15:00 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id m26so2475881ljc.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 04:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Yo/LjdLX+fFg3PDLRj0zBfrWmA1TLYw0W9+1WbQFpKk=;
	b=CPBKdiLVwLGhIELpI92DxScpgZwz3YnNK74RTDCFmFTIgHtZoXKQn2bIBaC9QZRvuh
	9pOkqtV5rWvQr97dTahXvq7eMUyv4h4HsMfXXrK4yXFJz0BjmEM4E5RAhQH7ARbwIkys
	IBu5piCiyah1oaOgpQnXSDXZiP/3HAsNizPRKdfTZkLD0DirpTvv+/84lyIOa5hhYFd2
	qCSQgEttvjAcF2qc2sZ5n4m8HQvlX6ol89oOUgwl23N7sOgyBohe27N5QdQrXU7ZDW5g
	qlhC5d7Y+CmNzW7lE8RcLOYUOVlVKr3qDkJ2A4gUi6viW+XrcSO2t6Cew8xyreRXwbeT
	19Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Yo/LjdLX+fFg3PDLRj0zBfrWmA1TLYw0W9+1WbQFpKk=;
	b=CmDiJbffDEXYO+Q/WtWchnw95LpF4ni9OHa3iE6n1GmPZ26RSSs3Nlw73E3R1T828j
	5HrlpFMd80ybL0OiJLmAuZD9ZEj3CV1zF1FQ/Cbcbyj4ou93FT07TGQba39hshmMZFLI
	eUoPOQHYXF3LAciFs+F4+Tp7l8bfxzklCP02GqgTZBb4RUVxeFpI1cWcBTUjC0HrpkbB
	998zBC+kypA95QqWuSX2dgWROqRQ7lHBuxFDctCJJeOiqS1nFXjAveD3ftDa2gZSdW3L
	aGD/NcKo9w05XTV+jsDAFWDXvKn0T54EeZQl6twzgwMQvSDc9AO9V4yHhBBkubljm7Nq
	jPDg==
X-Gm-Message-State: APjAAAXthsXzMyTBOX0D0LuynCI3EnjS4d8kDtf0DjMUZkghvWflIEXT
	c4JjP2bUTkqJgw5eVD2YpZzJWdwW
X-Google-Smtp-Source: APXvYqxJX3JFOUlxYXvFaHOj0QZnXf0WyMmH95T8Zfvi3c4/m0GGtPAIXlpghVgzdnsOk0+ENmG1rQ==
X-Received: by 2002:a2e:9806:: with SMTP id a6mr15850131ljj.178.1579608900404; 
	Tue, 21 Jan 2020 04:15:00 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	z13sm18566616ljh.21.2020.01.21.04.14.59
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 21 Jan 2020 04:14:59 -0800 (PST)
To: Richard Leitner <richard.leitner@skidata.com>
References: <04a167ee-e63d-c4a3-7808-26ef5e9ed884@gmail.com>
	<965c6ca2-e7c7-5cfc-36bd-482bd7d49202@gmail.com>
	<20200121071238.GB1567918@pcleri>
	<9067ccd9-2961-217d-15b0-5093a0583972@gmail.com>
	<20200121113805.GC24847@pcleri>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <b30ca254-5e79-7610-3941-094f83196df0@gmail.com>
Date: Tue, 21 Jan 2020 13:14:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121113805.GC24847@pcleri>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] openjre-8: java from master/master-next crashes on startup
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
X-List-Received-Date: Tue, 21 Jan 2020 12:15:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/21/20 12:38 PM, Richard Leitner wrote:
> On Tue, Jan 21, 2020 at 09:01:01AM +0100, Jacob Kroon wrote:
>> On 1/21/20 8:12 AM, Richard Leitner wrote:
>>> On Tue, Jan 21, 2020 at 08:00:48AM +0100, Jacob Kroon wrote:
> 
> ...
> 
>>>> I see the crash both in my custom machine and in qemux86-64. If it makes a
>>>> difference, I'm using
>>>>
>>>> PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
>>>> PREFERRED_PROVIDER_virtual/java-native = "cacao-native"
>>>>
>>>> since building with jamvm has always been broken for me.
>>>>
>>>> Any hints ?
>>>
>>> Nothing that comes to my mind directly, but I'll take a look into this.
>>>
>>> So your "custom machine" is also x86-64?
>>
>> The custom machine .conf file is just:
>> ------------------------------------------
>> require conf/machine/include/tune-i686.inc
>> require conf/machine/include/x86-base.inc
>> ------------------------------------------
>>
>> So 32bit x86.
> 
> Is your JVM crashing in interpreted and mixed mode?
> 

It only crashes in mixed mode. If I pass -Xint I don't see any issues.

