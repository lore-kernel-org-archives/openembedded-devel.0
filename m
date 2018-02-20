Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 069F771BF9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 19:06:08 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id w21so7925167plp.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 11:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=rKEG00lv9Q8Ld/ygzQjF/W56jvPax63TQsxXgrjrbXU=;
	b=iytDMpavDIVUnuZbh0HBq3YfUOh8epaoOc7arW8eCTiGzy0oeU4pgGYP6czbK0POP8
	nzkVX2/+F6XY1i+R+FqYiFkvxEJu6Bunm+OnU91StZmJv7EOOxN/LLYVniHZUuSfRsbP
	cQVd1YXcKN9bgFMF+/XFtXxvBvggsEsXVpoAtA/fQYYKiI1e/yxgOHNdHu3zxAeLGJ6f
	S2uG4JTZJmrj69dektrdbGj82aOPx+59KhzJ2KcI5dXJFBVmJjrYpX4A/wLGGr8AoYSl
	iMZIWzVfhrZEpGDfxVmgEYfaq9AmSnL69Mft6fTR7hVIQMCvP3Q1VqF0/YDbjjHiREzu
	LnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rKEG00lv9Q8Ld/ygzQjF/W56jvPax63TQsxXgrjrbXU=;
	b=KHJ3Gv1mioXvH+j5bL9tJPLi4ylKWcvmIzhu+rcuQDVXazK8+xByt9hcqUJYU21lRB
	ZR7RkVrbq7QJoX4e3Mj5WgOSM4w0WbK5WmNN2864MSi+Gwjqpo/w5hq5P7ROyeZiEcXy
	VHlymCYLX2RP1uNbtg7vGJxexM3yCmXw2l0Dh88tjCIVDL8pPXEDuMXYm16UWmz0DRq+
	CvUF04MEa5l8t1DWf6fnbLGWXKagqJ5mX1vFBR1PbMAzz4um942mZyuMxUP5FWDSaoKB
	8tJUxvxj7uDcpJGicNGAZsNJM6O115x/7XrRjQr6xz+jiAKGOMcpTx+rH4f5dcMkxLVb
	Uv4g==
X-Gm-Message-State: APf1xPD8EvuxGXGnoprBcxg/XikjStOx1qsCuEHEdzUr7ImIbMStzH24
	6X11te21j7B+h+FGnRE93Hi+5fvV
X-Google-Smtp-Source: AH8x225AKpj8lQSHd6yNFJKCZJDRMUEdmm1PXWIF2+QLVKDn9lDFmF5Xxqvkwu7AAgfJhrtU8WJmuQ==
X-Received: by 2002:a17:902:968a:: with SMTP id
	n10-v6mr549825plp.363.1519153569723; 
	Tue, 20 Feb 2018 11:06:09 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:1018:c2d5:2fd:6d43?
	([2601:646:8880:466c:1018:c2d5:2fd:6d43])
	by smtp.gmail.com with ESMTPSA id
	n17sm21549954pfj.67.2018.02.20.11.06.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 11:06:08 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	akuster808 <akuster808@gmail.com>, "Burton, Ross" <ross.burton@intel.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <77538932-43f1-4f82-41c3-0d82aafe5f93@gmail.com>
Date: Tue, 20 Feb 2018 11:06:08 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <1519148811.24236.321.camel@linuxfoundation.org>
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
X-List-Received-Date: Tue, 20 Feb 2018 19:06:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/20/18 9:46 AM, Richard Purdie wrote:
> Repositories have reputations. OE-Core is fairly heavily curated and
> tested and has certain "guarantees" about what people can expect to
> work. The meta-oe repo is a little trickier as the different pieces do
> have different 'SLA's (service level agreements). Some pieces like
> meta-networking/meta-python likely build well, other pieces like some
> of the bitrotting pieces of the meta-oe layer probably don't build in
> as many different configurations/architectures and on balance may be
> more likely to hit issues.
> 
> I think the world may need to change a bit. We should probably change:
> 
> * The way people get started with the Yocto Project and Poky
>   to move away from the combo repo and into specific layers.
> * to have YP testing more layers as part of its builds and testing
> * to make it easier for people to establish an SLA type reputation for 
>   a layer.
> 
> Part of this is a need for a more universal "using OE" later setup
> tooling. I've wanted to work on that for a while and I will get there
> but if I spend time on it, I want to get it right. I've not had enough
> time to get it right (as yet).
> 
> Part of this means redefining poky, the YP autobuilders and so on.
> Pieces of the autobuilder work are in process and will lead to wider
> layer testing.
> 
> I have strong influence over the above so I can likely make those
> happen, time constraints aside. One piece I need the help of others
> with is meta-oe (the repo).
> 
> Even just splitting meta-oe out from meta-oe might be enough to
> establish the SLA differences, I don't know.

this is short term panacea, few years later we will again talk about
meta-oe in same sense because it would have caught the packages which
belong to no other specific layers and cant be in oe-core

unless there is a solution for meta-oe layer, it seems to be like we are
just changing maintainer control structure for repos.

> 
> There is a question about what problem would this solve. The move from
> OE-Classic was partly about defining maintainership and processes for
> recipes which we do with layers. The pieces in the separate layers have
> now become the things we set out to create but the catchall of meta-oe
> (the layer) remains. I do think we should still be aiming to filter
> meta-oe into distinct layers with distinct maintainership. There will
> always be some "leftovers" in a catchall but I think it does have a
> different personality to the other well separated components and we
> need to show to users that they do have different expectations from
> them.

in practical downstream projects for real products, we include almost
all layers, so from that perspective it just is another hassle for
integrating.

> 
> I hope I'm managing to convey this concept ok, I'm really trying to
> take a step back here and think what will help OE users and the project
> and where we need to go with things. I'm not saying we should/shouldn't
> do this for 100% certain, I do want people to think about the
> alternatives though and what options may be possible.
> 

I dont disagee here. but it would be nicer if we had a restructuring
plan for layers within repo

> Cheers,
> 
> Richard
> 
> 
> 


