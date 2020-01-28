Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 158F27F352
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 05:43:51 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v17so13385138ljg.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 21:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=x6yiSz64DGnjxvuqzVu+flTkUhqdEMgB4TXNe/woxGE=;
	b=RXpAamZuKKt9fgd8WBl3IWu0slTIvraIhED00MIDSHsnf7csMQqPuNsosaDbdyI6Wk
	kZIhob+56wc5KZRqBycNY4RNkwJcvOEzpbNW5AjdgATrWW3y2FF0UxyCPCTcPRIdPKen
	8V27CNr6FyHnaLGcQGzUCLdJ1SqySk2HOnkiQ9ozq7RuCzx6vNs6G7y+WbJaiZHS2mPN
	YcH1GzXG7oP6geXBsjL+rgilEQevMccCzQgU0vHZrWjZqqGboHmn3gg/SGrAI4fNAEex
	WjwPgMU0YvLZJIkPgZSA3w9I9UVhRe9p7L7tTPPRw6mA1MGB16Z9J1/wQW7EBTdOtmPJ
	NVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=x6yiSz64DGnjxvuqzVu+flTkUhqdEMgB4TXNe/woxGE=;
	b=WXpo54QHVxt3CtiSDl2fCDd7l0ripdLRrR/JTN24z0Z1lCrNcBDREnfuQVnW92E/fv
	nwhGSnaZQebTYuaJKX+15NCV/qZbwei8tc4OxstzlanJjfW8jxZMyrNX92Fn51JtlpyS
	TxPHt6hxC6CAQ8SqUvQ5T63W3BkPgRUOy2ta281JPN9XETaoPkCIUcUoWc+WTD+8E8qu
	cc6Vw+t7aL+FGTHdxaoXvjvWhP1ZBJascVdICaACIlwibHqUdLP+yqUbZ2RtS27tQxkc
	2VNxQH4u8NBUBUEVAl5laud2Th3fuwXfFCZRqCFjvsIALIrBWp5dZRpGuu4l/4gAQ3Uo
	FBCw==
X-Gm-Message-State: APjAAAW5RSqtcMzxBPSisDed+NZ+K9azahfnGwOs5GKuayBK+TrP71gN
	PKNGrVFc71YwvsxBsrXbC+fb5zxR
X-Google-Smtp-Source: APXvYqzGcRcxlAjnc613ei28vsmFlj1ysYQ1q88+7ZVhfK1a7U8gwDjyPSxkEjJxCwka+OPoy9YYBw==
X-Received: by 2002:a2e:8907:: with SMTP id d7mr9122291lji.71.1580190232185;
	Mon, 27 Jan 2020 21:43:52 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	n23sm9136341lfa.41.2020.01.27.21.43.51
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Jan 2020 21:43:51 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
References: <20200127112451.165555-1-richard.leitner@skidata.com>
	<c43cf573-d876-8a4a-d978-fc4b2303e747@gmail.com>
	<20200127145758.GA603314@pcleri>
	<6c208020-0b53-4701-1173-6e59c0f2b5c2@gmail.com>
Message-ID: <0dad623b-f095-3170-26c9-5a554b509469@gmail.com>
Date: Tue, 28 Jan 2020 06:43:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6c208020-0b53-4701-1173-6e59c0f2b5c2@gmail.com>
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
X-List-Received-Date: Tue, 28 Jan 2020 05:43:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/27/20 5:05 PM, Jacob Kroon wrote:
> On 1/27/20 3:57 PM, Richard Leitner wrote:
>> On Mon, Jan 27, 2020 at 03:10:04PM +0100, Jacob Kroon wrote:
>>> On 1/27/20 12:24 PM, Richard Leitner wrote:
>>>> This series updates Openjdk 8 to the latest "ga" release 242.
>>>>
>>>> Successful testing has been done on a fedora-31 build host for
>>>> qemuarm64, qemux86-64, qemuarm32 and armv7a.
>>>>
>>>
>>> <cut>
>>>
>>> I don't know if it is related to my setup, but "bitbake openjre-8" 
>>> insists
>>> on rebuilding itself every time I run it, and I don't see any sstate 
>>> cache
>>> being generated for it.
>>
>> I just tried to reproduce it, but neither for armv7a nor for aarch64
>> openjre-8 is rebuiled on the latest poky/oe-core master when nothing was
>> changed in meta-java.
>>
>> So in your case it also rebuilds if you call "bitbake openjre-8"
>> directly one-after-another without any change to the layers?
>>
> 
> Yes, precisely.
> 
> But.. I think you can ignore this. I suspect I have confused bitbake's 
> hashequiv database by pruning old cache-files using the 
> sstate-cache-management.sh script.
> 
> Joshua, do you know if that script is supported when using hashequiv ?
> 
> Gonna try and remove cache/ aswell, and see if that helps.
> 

I just retried on a clean build, I wiped everything, and openjre-8 still 
insists on rebuilding on the second run. I don't know whats going on here..

