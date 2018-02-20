Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id E9585787ED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 19:15:29 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m19so7491217pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 11:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=4plu4pqeWoI4Fe10g5vbk1WI0DtDLEjzSXJW2sr35xE=;
	b=CCDcPu/J3nMS57zJnssUOpsgvLAC1juSDqQJOHqS7rX/CRalvBPJ7zrIVF+wFL+ol6
	nWXfloio2pu8nebMHeCe9LRLs91/WIKobLjDRvKw61018B3hMmsRBwB4irgkvgLyfm3K
	RqFmh6kYJ0p83PUsj2UX6Ple17H5Bc7PzLvQKLQiQPGE2eDmcKX24rnb6pFBoaSM+LpG
	q88h5XYEg0cgto0FCc+XI/8XyJBdwIUrFu5TQ7qNc0ktEyuzc736D+qLHWP0OzsOWk/F
	qRiDnHJlH5eNIjaMRYMFwsAjwuEW+ALpUMW/Tf/HPd6NCgqhTGCaTYtFrE7zKl7MmPbQ
	zvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4plu4pqeWoI4Fe10g5vbk1WI0DtDLEjzSXJW2sr35xE=;
	b=DqjRjVC14+VyLFD0qE2KwdfnQqAksrgBnZ0dY1pfN/Zc/1uiwZShVamu6+SPobnVAU
	wJQwjXVaaE6m5giLUkqg86w1AuMHbhJ2KSiBD0Yv/5DkdneqCg5Yj8R0EQBExUce4ptF
	AKUDrJMPjZ7Cbe94DRg33AOzGGtedv2c/p88iXL4uEdGgwdNW3IOwsDdta0ztnx6Y04E
	OZEZVZHT/84kLZm79yG5mwvYnVwXGwuNQOpaJMDU5NS7tn/hVuFDzIZPE65ZNf5vN1h0
	dC1cpUAF/RCba8nuSCMmRn7FPru2bD8OVxoY5GQkKZiHwv3kcib/Ac2zIuA/pPi+U1IT
	/kFA==
X-Gm-Message-State: APf1xPBIk7OxCMMuz4Xl4dFZjXzoOklf93vjdpSaV+/ifweB6iA8orrg
	Bm8d/bvvGiDXi/OW/fO2JQ9y6K8a
X-Google-Smtp-Source: AH8x225MU+vApfDZ2oaBODzozOChKigcumjjebRpoHEyu88BTBPA9vO3mS39UIptCP9l8M+wfivQ1g==
X-Received: by 10.98.103.136 with SMTP id t8mr620595pfj.177.1519154130528;
	Tue, 20 Feb 2018 11:15:30 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:1018:c2d5:2fd:6d43?
	([2601:646:8880:466c:1018:c2d5:2fd:6d43])
	by smtp.gmail.com with ESMTPSA id
	o135sm68930271pfg.45.2018.02.20.11.15.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 11:15:29 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Tim Orling <ticotimo@gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <1fad6cab-f195-1dca-3b10-ebefe0e44fe3@gmail.com>
Date: Tue, 20 Feb 2018 11:15:29 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <1519152750.24236.330.camel@linuxfoundation.org>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 20 Feb 2018 19:15:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/20/18 10:52 AM, Richard Purdie wrote:
> On Tue, 2018-02-20 at 10:40 -0800, Khem Raj wrote:
>> On 2/20/18 10:00 AM, Tim Orling wrote:
>>> I am open to discussion about what direction we go. Individual
>>> layers that
>>> are curated and built together by YP auto builders sounds like an
>>> intriguing path. If this was coupled with increased ptest or
>>> testimage
>>> usage, our confidence in layer quality would go up dramatically.
>>>
>> I would like to understand whats stopping YP autobuilders to build
>> layers under meta-openembedded repo and contribute changes as needed.
>> All changes with test improvements etc. above are a good change and
>> should be adopted across layers. However splitting layers is least of
>> the problem as of now.
> 
> The Yocto Project cannot commit to building everything in the meta-oe
> repository. There are some specific layers we would consider building
> but right now I think there are inter-dependencies that cause problems.
> 

1 is better than zero so go for it :) As you see fit, send patches to
subsume the dependencies into other layers and make it meta-oe layer
free, this seems a good step forward

> Sure, we can look into those and try and fix them in some way and that
> would be one less hurdle. I do appreciate we have autobuilder issues
> right now which also causes us problems, I've already committed to
> working through those.
> 
> Even once we do that, we (as in YP) can't send out a clear message
> about what we're testing and users will clone meta-oe and expect
> everything to work. So right now I do have problems trying to get to a
> point where YP can use meta-oe effectively.

poky is a different git repo and it has its own way of subsuming subset
of oe layers ( oe-core bitbake meta-poky ..),  meta-oe is just another
one to deal with fhere. it seems more like a distro problem here to me.

> 
> I could combo-layer pieces of meta-oe into poky but I'd imagine that
> would create more problems than it would solve too and given the
> general dislike of combo-layer, I think ultimately better layer tooling
> would be a better answer and more acceptable to everyone.
> 

I think monolithic nature of poky repo is your problem here. if it was
using layers independently it would have been better.

> Cheers,
> 
> Richard
> 
> 
> 
> 


