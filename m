Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id D33817FD8E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 11:37:59 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id w1so2138091ljh.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 03:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jXf8EsSW5wlrndYDhCqJRbj+hacso033CelSXH/pw1c=;
	b=WfrROi0yJbyA+AfQ2W3CB1i5C5nrTTtYCoS5AUfmJMb2t/5Keevf8hTXTcxpQ9j47m
	1RBHV226d4JjlqLCusbnHNhW+NKFjcwsRvN9es7mQ1fxgJpWwHyzuCRxcI5T9gs4ZoLC
	JyYhndNrApzDVShN3oDyKEP5wfoy3UNbdtAy9JxP0eVCtDgKVSWMvERpT3qwljSXzTW8
	d4pOiy1vkLZHzDdDexite8BPKI5375Nu7gYmgaQ0yYYunJge3WgvvMe72IH+xvjHwtBX
	DH0fpSGHHfuSBxsl5M8NZNcA+5/mZ+Nn6UrDqQ8L1HU7hm+ISrsUt6rcJq6+SPsSss+y
	uUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jXf8EsSW5wlrndYDhCqJRbj+hacso033CelSXH/pw1c=;
	b=XxuaLJst+LqT8mx/E2I1WF0Ncf+hKcqhHZmD0i/aVE1pUhKonep3DyTRzYuwgQzjKj
	zJ2Y5GJpwXE7ujzAFisgfVBlN4RRhu1X/r3c2fefR0iCZuC/x2Q05XK3hwL0QG0e9ne3
	QE9cujIxZNrPmcgxwvGGDEfRaxCphrrK34Wyjsr+1J1uRzk3SjwhbB/Qer0g1Dnns+mr
	41pECEMPmzFLMC6xNV9Y/7ciuxuxwqUoiq37C5DDL+q/Zp3BFCfsxbOUykp6XR+vhP9o
	9qs33t8kIBi9VAsL/nUtHshqq2GxwQKI/MxOTYErsCHmVoKbwejtrp63E0lNaS88mkyI
	kwBw==
X-Gm-Message-State: APjAAAUxCz9QCbqu/sxETvATFiSN3pRd8WrmJ7U+3qokPtMHr/yOm+iy
	hdzixbiCOEheg4081Bw8Lh2FQJ8A
X-Google-Smtp-Source: APXvYqwYpb4QqbTK/0rt22rsb2e3TeMdDZTT4pPHFDjba5e9nahCGNO8b8OY1Epx3bUBQAoJWKMurQ==
X-Received: by 2002:a2e:8119:: with SMTP id d25mr2079659ljg.76.1579865880074; 
	Fri, 24 Jan 2020 03:38:00 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	c22sm2536648lfc.93.2020.01.24.03.37.58
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 24 Jan 2020 03:37:59 -0800 (PST)
To: Richard Leitner <richard.leitner@skidata.com>
References: <04a167ee-e63d-c4a3-7808-26ef5e9ed884@gmail.com>
	<965c6ca2-e7c7-5cfc-36bd-482bd7d49202@gmail.com>
	<20200121071238.GB1567918@pcleri>
	<9067ccd9-2961-217d-15b0-5093a0583972@gmail.com>
	<20200124103621.GA10765@brokenbit>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <538daee7-cba4-8b54-6264-dce44ebcf34c@gmail.com>
Date: Fri, 24 Jan 2020 12:37:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200124103621.GA10765@brokenbit>
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
X-List-Received-Date: Fri, 24 Jan 2020 11:38:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Richard,

On 1/24/20 11:37 AM, Richard Leitner wrote:
> Hi Jacob,
> 
> On Tue, Jan 21, 2020 at 09:01:01AM +0100, Jacob Kroon wrote:
>> On 1/21/20 8:12 AM, Richard Leitner wrote:
>>> On Tue, Jan 21, 2020 at 08:00:48AM +0100, Jacob Kroon wrote:
>>>> Hi Richard,
>>>>
>>>> I still can't use openjre-8 in either warrior, zeus or master builds, due to
>>>> the crash below. I wonder, is anyone successfully using openjre-8 in either
>>>> of these releases ?
>>>
>>> I'm doing tests for the machine/distro combinations stated in the README
>>> before pushing to master. Therefore it should have worked back then.
>>>
>>> Nonetheless I'm currently working on updating openjdk-8 to the latest ga
>>> and implementing continous (e.g. nightly/weekly) builds/tests on qemu to
>>> make sure nothing broke over time.
>>>
>>> So maybe I could get something out of this.
>>>
>>
>> Thanks for doing this work.
> 
> I've just pushed a temporary branch named "g0hl1n/wip-jdk8u242ga" to
> the meta-java repository [1]. It contains (as you might have guessed)
> the update to openjdk 8u242ga.
> 
> Can you please give it a try if it works for you?
> 

I tried but I get a linker error during openjre-8_242.bb:do_compile:

Making adlc
...
/tmp/ramdisk/build/hosttools/ld: cannot find -lstdc++
collect2: error: ld returned 1 exit status

This is using MACHINE=qemux86-64.

Gonna try and fix and get the build going.

Cheers,
Jacob

