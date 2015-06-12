Return-Path: <picmaster@mail.bg>
Received: from mx3.mail.bg (mx3.mail.bg [193.201.172.119])
	by mail.openembedded.org (Postfix) with ESMTP id DDC6274051
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 12:52:48 +0000 (UTC)
Received: from [192.168.0.62] (unknown [93.152.143.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx3.mail.bg (Postfix) with ESMTPSA id 939BF202C646;
	Fri, 12 Jun 2015 15:52:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mail.bg; s=default;
	t=1434113567; bh=vNW4DD1GGmKrSt9uRjxTHBjCfQzDtoj51Wid+NM81E8=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=7KbUqb/WTDLbhP+Nc8eBcB+bXgAkt9a3C+PtaN9TEssAa5pFVcxS2FPvEMZ7sf66g
	NkuqftwMDzEo8U8gGcjxZyCkIe41+3eAabjrGRynrrSWEVgkTNTW8lvtUnyzMN4zfU
	npbE7OlNe/hjx3IL87Nxd0OhO/ux6mi3T0aIBhGI=
Message-ID: <557AD61D.3090600@mail.bg>
Date: Fri, 12 Jun 2015 15:52:45 +0300
From: Nikolay Dimitrov <picmaster@mail.bg>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Gary Thomas <gary@mlbassoc.com>
References: <5579F20D.5040900@mail.bg>	<557A817E.7070709@mail.bg>	<557AB88E.8020300@mail.bg>	<CAP9ODKruFjbNjXnQXzEgZLM+YW2NHnM+7CKd4f352iWLftD5+A@mail.gmail.com>
	<557AC595.7070402@mlbassoc.com> <557ACBCA.40709@mail.bg>
	<557ACF31.9090804@mlbassoc.com>
In-Reply-To: <557ACF31.9090804@mlbassoc.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-freescale] Chromium crashes on HTML5 video tag
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jun 2015 12:52:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Gary,

On 06/12/2015 03:23 PM, Gary Thomas wrote:
> On 2015-06-12 06:08, Nikolay Dimitrov wrote:
>> Hi Gary,
>>
>> On 06/12/2015 02:42 PM, Gary Thomas wrote:
>>> On 2015-06-12 05:31, Otavio Salvador wrote:
>>>> On Fri, Jun 12, 2015 at 7:46 AM, Nikolay Dimitrov <picmaster@mail.bg>
>>>> wrote:
>>>>> On 06/12/2015 09:51 AM, Nikolay Dimitrov wrote:
>>>>>>
>>>>>> Adding openembedded guys in the loop.
>>>>>>
>>>>>>
>>>>>> On 06/11/2015 11:39 PM, Nikolay Dimitrov wrote:
>>>>>>>
>>>>>>> Hi gang,
>>>>>>>
>>>>>>> Chromium tabs are crashing when they see an HTML5 <video> tag, like
>>>>>>> this one:
>>>>>>>
>>>>>>> <video width="320" height="240" controls>
>>>>>>>     <source src="movie.mp4" type="video/mp4">
>>>>>>> </video>
>>>>>>>
>>>>>>> (Code is from http://www.w3schools.com/html/html5_video.asp)
>>>>>>>
>>>>>>> I'm pretty sure that this worked fine some weeks ago, so it's a
>>>>>>> recent
>>>>>>> regression on Fido, 100% reproducible on imx6q sabresd. At this
>>>>>>> moment
>>>>>>> I still can't point to a specific commit in meta-fsl-arm or
>>>>>>> meta-browser.
>>>>>
>>>>>
>>>>> Commit 30b8d6b3d0d6501c56ef6967a2fa73a3d4bf5fe9 is the last known good
>>>>> commit. After it the component either doesn't compile, libs are
>>>>> missing
>>>>> or video tag isn't working.
>>>>>
>>>>> Looks like it's a "revert time" for the customer builds...
>>>>
>>>> Might be packaging splitting which can have changes. One way to easily
>>>> track this is using buildhistory and compare both packaged outputs.
>>>>
>>>
>>> It looks to me like that revision updated by 2 major versions of
>>> Chrome - more likely there are goblins in there than just a packaging
>>> issue.
>>
>> Not really. Commit 30b8d6b3d0d6501c56ef6967a2fa73a3d4bf5fe9 is working
>> OK, as I described. Issues start from the next commit,
>> 355f6d474462996c3bf07d7a72233b6c81cb2e8a.
>
> Ah, I should have read your comment more thoroughly.  Indeed the next
> commit (355f6d) is quite intrusive - it's easy to see that something
> might have been missed in that split of the recipes.
>
> Is this problem only on i.MX6?  Have you tried it on other ARM targets
> or even PC?

No, I haven't tried it elsewhere. My usual motivation to avoid that is
because there are tons of possible differences (toolchains, libs, cpu
architectures, kernels, patch sets to fix SoC issues) and it's next to
impossible to guarantee that the code and data have precisely the same
layout in memory, and that the code is executed precisely the same way.

But this is my perception, it's entirely OK if others see things in
different perspective :D.

Kind regards,
Nikolay

