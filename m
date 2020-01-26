Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id D9F067FA47
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:16:10 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id j26so7569222ljc.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Jan 2020 03:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=W7ZwsoodP2X/vDOxr5NsV2+nZBYbK91PPDd8nXU055M=;
	b=GeqeeP8EX/KorBlezs2Bm6eoTGFmRBMuWwjjboeC0HDsODijjYu7srRUEvrMkSadfk
	j8zusPJzZDu9eB5DXQ0qx5j1IsrrMeHpLy4wHc92ZN8D2FtDb9kBG8j6rhYhPUp6lODn
	hJzKxmDEloQGgQY6x+bX01NdS8cDn5jMc/SpScQy04tZt6ZfAE8WrG11y2B+QSQvAsph
	MVY9BGowKXPUnyxC6/Pn4ohnGkKkE6e8r5MJviAwIGMcjXARsM/qaK8HXSwFDqJdzEyz
	o0BfOaqQyOgLMeR2hL8EsGdDaL35jHzc8qKTE2C/rEfa7HaV1S+kb56xXUwhWMkOv4Zo
	5fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=W7ZwsoodP2X/vDOxr5NsV2+nZBYbK91PPDd8nXU055M=;
	b=fk+o0Lo3GppCEVLHqEtJOt4+JMUHkQhoDNYLHxix/O+aoEPWTPYppVCnn2Iv4ld1Yg
	srPXNaquaQqsuC2r6QvWXSuHCXl8Cmff0H79wa93M5mRIrv9c1A7+wUgQJANMwJ+tmCG
	DtrVkD/pmkNaTHWFk0nHUypIML2hu97ogLbL2MdFHaTEc4IKjW1P9MSsuB0W0Npxc0GT
	+N3aeBiVk1YSy0jgVpGKxyoKilFOD/Vv8T+Ajb1nanxMs3P/IvczV+iOnJ91k6Jxvm0R
	I31Y7TWqfDY8WMbDKZJDXkL+yP0YokDkMru9TWkeQNIy29zYkGUNPKyEKg9qZX0M6gNm
	TNNw==
X-Gm-Message-State: APjAAAXA2GEi74/GGePW3s2/V8SgxjywRe7J8SRhpI3LxXp+7N4NWjqX
	aG0H7eRjwtEVOodtOfi8cGIAr/me
X-Google-Smtp-Source: APXvYqxqPjWv0qiaWLKbi/A10vOzerdMMc5IBg+Q/gMidgTc6WVbG6PvYes8x/aLzFCudieS8tyZdg==
X-Received: by 2002:a2e:965a:: with SMTP id z26mr7760409ljh.104.1580037370659; 
	Sun, 26 Jan 2020 03:16:10 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	n13sm6358820lji.91.2020.01.26.03.16.09
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 26 Jan 2020 03:16:10 -0800 (PST)
To: Richard Leitner <richard.leitner@skidata.com>
References: <04a167ee-e63d-c4a3-7808-26ef5e9ed884@gmail.com>
	<965c6ca2-e7c7-5cfc-36bd-482bd7d49202@gmail.com>
	<20200121071238.GB1567918@pcleri>
	<9067ccd9-2961-217d-15b0-5093a0583972@gmail.com>
	<20200124103621.GA10765@brokenbit>
	<538daee7-cba4-8b54-6264-dce44ebcf34c@gmail.com>
	<20200124114446.GB10765@brokenbit>
	<95411b04-c9f2-ee4c-6004-110037325976@gmail.com>
	<20200126111129.GA2043417@pcleri>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <e3f92009-692b-774f-1785-d2cd363325d1@gmail.com>
Date: Sun, 26 Jan 2020 12:16:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200126111129.GA2043417@pcleri>
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
X-List-Received-Date: Sun, 26 Jan 2020 11:16:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/26/20 12:11 PM, Richard Leitner wrote:
> On Fri, Jan 24, 2020 at 01:28:52PM +0100, Jacob Kroon wrote:
>> On 1/24/20 12:44 PM, Richard Leitner wrote:
>>> On Fri, Jan 24, 2020 at 12:37:58PM +0100, Jacob Kroon wrote:
>>>> On 1/24/20 11:37 AM, Richard Leitner wrote:
>>>
>>> ...
>>>
>>>>> I've just pushed a temporary branch named "g0hl1n/wip-jdk8u242ga" to
>>>>> the meta-java repository [1]. It contains (as you might have guessed)
>>>>> the update to openjdk 8u242ga.
>>>>>
>>>>> Can you please give it a try if it works for you?
>>>>>
>>>>
>>>> I tried but I get a linker error during openjre-8_242.bb:do_compile:
>>>>
>>>> Making adlc
>>>> ...
>>>> /tmp/ramdisk/build/hosttools/ld: cannot find -lstdc++
>>>> collect2: error: ld returned 1 exit status
>>>>
>>>> This is using MACHINE=qemux86-64.
>>>>
>>>> Gonna try and fix and get the build going.
>>>
>>> Do you have "libstdc++ static" installed on your buildhost as stated in
>>> the README? ...the error let me suggest you don't have it ;-)
>>>
>>
>> Oops, yeah I missed that. That got me further, but I got a new linking
>> error:
> 
> As this happens in the "native" part of the openjre build:
> What distribution and gcc version are you using on your host?
> 
> For me (Fedora 31) the openjdk build and runtime tests for aarch32,
> aarch64 and x86_64 work.
> 

[cut]

Odd.. I'm on plain Fedora 31, with Fedora's regular gcc 9.2.1.
I sent a patch to the ml that fixes the build for me, forgot to CC you.

Maybe I have some extra headers installed that triggers something extra 
to build..

Cheers,
Jacob

