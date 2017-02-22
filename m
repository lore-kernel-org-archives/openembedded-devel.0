Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 007D473159
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:15:10 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id b129so2800229pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=QrRL/mC8QdrdRJyzqhrwrlnMp7tEAIJvYMvpuVNzZOw=;
	b=uNdwqpLgWwlHvU6i24++h3tgAo0hs+SIzvLETs7uQxV0TxkczWqK+qe1RUyseMjyI8
	mM2eHfyYQXCRDnL6SVY+aT04sA8ZCangAjxmWw1/+U4UIZd82EGaaB0jitgjkN1rDGBN
	EkN1yXO4IWM92PN46d78ZPG2lz52gs7eGtS9EeIFsvi4lHQLF0YTx60jgqPtXxuu7Pfb
	hSFH5KoqzqZs8qo3/7sOuMJ4P5+QzRcB5zIBNzzF7R2YkU46zrniSUgy0JbAa2YQdlI2
	jkheH9OrrDpDJToo0vvGo9IpiOT0SGa0LlaEfqVin5mBPdzqo8CGRHgPq0st9KxscVTF
	Fl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=QrRL/mC8QdrdRJyzqhrwrlnMp7tEAIJvYMvpuVNzZOw=;
	b=oJ2mxZjiuv/VzNMwsJsJmFjngQwCYScyc4NztGloHGSpJRhYz0FbJdmPtIIfXvbQM0
	1UQ5R+iyCOohoeGYCVVmeUuBnde90JBjCTDuK59bByM/b2vmdKddfEJJ4GPacXgvxYik
	cR5Bs+5Pb1+gxkEO65WsUEZIuwBcYVVkFxSl96Q4n0lKGpwBPCwK4E851cYehKkUtViT
	Ji9aXYbEjZeXso1hpdbCcuXpEMAW8V6lDRuyOki6dLPYVmPxrMLUZEhen9UG+SeFWB1k
	OI/BpDagHKRSl9NQ/NTfxEgJJFPlmp71K2und79MpnWHpWkawfxUGg197gTa5FAIyuHz
	W/cQ==
X-Gm-Message-State: AMke39k7S9jbiz0hvC6PvjpLhpJVszHyLNXne4+EQ8/k8FzVsUY/4DZxwLJ475IK1WD2ag==
X-Received: by 10.99.168.76 with SMTP id i12mr42434495pgp.73.1487780111810;
	Wed, 22 Feb 2017 08:15:11 -0800 (PST)
Received: from [10.11.10.242] ([67.23.202.154])
	by smtp.gmail.com with ESMTPSA id
	c64sm4622912pfa.45.2017.02.22.08.15.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 08:15:11 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
	<CALbNGRSPZw+LL3JXv4+D+k2C3DAV=5_U=44M8fcSU50V_-7KEw@mail.gmail.com>
	<20170217180254.GA3276@jama> <20170217182816.GD8436@mentor.com>
	<3870658c-01ec-252b-9940-a6af3fb1f529@balister.org>
	<1487561463.17001.28.camel@linuxfoundation.org>
	<20170220111829.GA3266@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <b8c01430-ac67-1e28-9058-98ad07e91ef7@gmail.com>
Date: Wed, 22 Feb 2017 08:15:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170220111829.GA3266@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Wed, 22 Feb 2017 16:15:11 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 02/20/2017 03:18 AM, Martin Jansa wrote:
> On Sun, Feb 19, 2017 at 07:31:03PM -0800, Richard Purdie wrote:
>> On Fri, 2017-02-17 at 14:45 -0500, Philip Balister wrote:
>>> And I'm with these gyus. Splitting the git repository doesn't solve
>>> any underlying problems. The real problem from my point of view is
>>> very few of use are actually paid to maintain the layers we maintain.
>>>
>>> Employers want to pay things they profit from, and that is not paying
>>> someone to maintain "core infrastructure".
>>>
>>> Layer maintainers interests change over time, and you burn out
>>> supporting people who get to do all the cool stuff with the layers
>>> you maintain. In the end, you get all the crap and non of the glory.
>>> Within this list, most people appreciate your work. Outside the
>>> community, people completely underestimate the amount of work
>>> required to keep the ecosystem running.
>>>
>>> Yeah, add my name to the list of cranky people.
>> I do think this is a valid question that Ross asks and that whilst the
>> first quick reaction is "no", its worth thinking about the pros/cons.
>>
>> The pros to me would be about better test time on patches and in theory
>> more specialist knowledge. This isn't to say Martin/Joe don't do a bad
>> job but the size of meta-oe does mean there are limits.
> If I continue to do the same "bitbake world" builds to test as many
> layers as possible, then the test time will be exactly the same even if
> we split meta-oe repository into 10 smaller repositories, probably a bit
> longer for fetching all those small repos.
>
>> The cons are more around finding suitable layer maintainers, which as
>> we all know are hard to find.
>>
>> I'd probably suggest that:
>>
>> a) We need to encourage/empower more people to maintain layers
> I think we lack people willing to contribute patches for recipes they
> use, not people willing to merge them into corresponding repository.

Correct. This does not solve the underlining issue.

We do need to think what to do about black listed recipes. Suspect its a 
separate thread.
>
>> b) Having better infrastructure, tools and processes that help a) would
>>     therefore be desirable.
Are you saying we have to make it easier for people to participate?

Please Donate to OE so we can improve the infrastructure.

If you split out each layer, each maintainer will have there own process 
that works best for them.

>> c) We need to be willing to separate out pieces for people to maintain
>>     in such layers. It might not always work out but we should be
>>     willing to try.
so a layer per recipe would be the best in this case. This wont bring in 
more help.

>>
>> As for the comments about core changes, I really do try hard not to
>> make them in many ways. The ones we do make, I'd hope are for the right
>> reasons.
> Yes everybody agreed that RSS is good change and worth breaking unused
> recipes.
>
>> No easy answers but don't shoot Ross for asking what I think is a
>> reasonable question.
> I wasn't trying to shoot him, but I still don't see how more
> repositories solve the issue of unused recipes and lack of people
> contributing to fix those still in use somewhere.

There are other implications to think about after the break-up.

1) What happens to meta-openembedded repo and or layer?
2) Do we adopt the K.O model where the sub-layers are maintained 
independently and then merge to meta-openemedded ( this could offload 
work and improve quality).
3) How do we sync branching? if we do #2, that is easier.
4) Since the maintainers will have write permissions for their own 
layers, does this mean we no longer have overall architects (a.k.a 
Martin & Koen)
5) How do we ensure the same level of support master currently benefits 
from Martin's world if those responsibilities transfer to other layer 
maintainers?
6) How do we enforce dup recipes?

If we decide to stop having a meta-openembedded layer;
7) How long do you keep it around?
8) Will the stable branches prior to the breakup only be in the aging 
meta-openembedded layer and not new scheme?
9) Do we have a meta-openembedded-classic?



>
> And I still think it's easier to send a patch to fix something instead
> of volunteering to be maintainer of the layer with the one recipe you're
> interested in fixing to merge your fix yourself.
Agree

- armin
>
> Cheers,
>
>
>


