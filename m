Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id E143960068
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 05:49:38 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id u5-v6so6598654itc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Mar 2018 22:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3/14U6P8iZYLlS76FDywtA6GxTBBMBCzIuWEja4q0yE=;
	b=VxRhnWdr/7vF16GW9oOb6DKPhteCLoxR+TUjXlKJ0pVfMTDyZKIj8pfEDo6qct+oCS
	bQWpBMXxf9Vm5atYHT72btGTXhUmeTq+GyFRBnkYVajchb2x2fy0DlCgBefD2bfjEgdH
	1gwMl3VkJvV1aeQOJ+eh4X/3kRGKnTw7aDuCqB6c+zEoQQy2Kumdo4GGCueSD4MF70e8
	+msNax8h5W5+0zPT38UFkDsZTpf7CqfTcBhEKxXnh/cQ0brRV98wnbMBwqhMLihzg88l
	GQwbThGytOpX4pihDVYdAP2p4XHAq+wRq8d4hikIpra8MU/Aq5RBzl2QL2EGbAjiKUsA
	yUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3/14U6P8iZYLlS76FDywtA6GxTBBMBCzIuWEja4q0yE=;
	b=h7KfMSJRgBA72NMDC5LfY1OG0mDZ802C1S/qHmTvPhmyUqfnfBIVWR3ItggJMDqdi/
	pwUVjLNc0XtNURzeaLGAPjZSc9yEBNhxj4n3SIEQI3DMi9QswBW697K0QyjMT/SW4pfc
	ykhNtUJriwHYbQLyuLAYWZQ/MJfgKOs86Jzdz5ZA1x41qpMX0hblKtntp4lSAqiGT6Fe
	gdqRljXj+xIFoh3ZVc96TyEEDbwld23eJbQXPCc0fwxRork4kzIq43t5PscEDkcNvU7Q
	Bu93Fcrj7qS3chDV+yMUoRTT7fpd9VXq8sfqrZET6ER64uJpgyWlkvwqoPUg/1JAcXq4
	Z4CA==
X-Gm-Message-State: AElRT7FH5BqqszMuUZL1BzmUF6mFnlui+osZKJzA9yAfR8EZJXBUQmwE
	iiZNO3IwPswtQ46YlwOCVLc5iZx3
X-Google-Smtp-Source: AG47ELtS2c1ovQuWVPhtTu39j8SZLA5VI2gsxVo5BwcIUiMlnlFO3qUH24HX8F3TRxTn8SuAclCYjA==
X-Received: by 2002:a24:1992:: with SMTP id
	b140-v6mr7779982itb.43.1521352179511; 
	Sat, 17 Mar 2018 22:49:39 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	p142-v6sm6621307itb.24.2018.03.17.22.49.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Mar 2018 22:49:37 -0700 (PDT)
Date: Sun, 18 Mar 2018 01:49:35 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Message-ID: <20180318054935.GA10352@linux-uys3>
References: <1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<1fad6cab-f195-1dca-3b10-ebefe0e44fe3@gmail.com>
	<1519163708.24236.337.camel@linuxfoundation.org>
	<CA+chaQd=QE4fc32LDKepRsNn0gtuyQSfFi3aQ2YxmRbZtJjp1Q@mail.gmail.com>
	<1519170075.24236.345.camel@linuxfoundation.org>
	<20180317035021.GA19189@linux-uys3>
	<fc8783c5-a576-3caa-d44a-9bf030da42c3@balister.org>
MIME-Version: 1.0
In-Reply-To: <fc8783c5-a576-3caa-d44a-9bf030da42c3@balister.org>
User-Agent: Mutt/1.6.0 (2016-04-01)
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
X-List-Received-Date: Sun, 18 Mar 2018 05:49:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat 2018-03-17 @ 07:23:52 AM, Philip Balister wrote:
> > Would anyone like to make an honest, unbiased attempt at answering:
> > 1. What problem(s) was the post-OE-classic split attempting to solve?
> 
> The all in one approach is untestable.

Thank you.

I was able to find the old OE-classic[1]:

	$ cd OE-classic
	$ find . -name "*bb" -print | wc -l
	7853

	$ cd meta-openembedded
	$ find . -name "*bb" -print | wc -l
	1477

	$ cd openembedded-core
	$ find . -name "*bb" -print | wc -l
	837

Wow!

> > 2. Did it work? Can it be said that the problem(s) the OE-split was attempting
> >    to solve, have actually been solved by the split? (and, if new problems
> >    arose as a result of this split, were they small an manageable relative to
> >    the pre-split problems?)
> > 
> 
> OE-core is well tested, and that has taken a lot of resources. There are
> not dedicated resources to test much beyond this. The real problem is
> how to get resources to test layers beyond oe-core. And maintain testing
> of oe-core.

It sounds to me as though the goal-posts of what to include in a layer are not
set by what logically hangs together, but rather by how much can be tested. It
sounds like the "capacity that can be tested" is the metric that will be used.
So we should stop making passionate arguments about what should be included
together in a layer, and start talking concretely about resources and capacity.

If we determine that X number of recipes can be tested in a hour, and that we
only want to test for Y number of hours, then no layer should have more than
Y*X recipes.

And if that means that it will now take 30 layers to build anything useful,
then so be it. The problem is, you might be the first and only person to ever
try to put together those specific 30 layers in a given way. So although the
project will be able to say "these 30 layers are tested amazingly well...
individually" it's anyone's guess what you'll end up with when you put all of
them together.

The argument has been that smaller layers can be more easily tested, which
gives us the feeling that the quality is going up. And that might be true, on
an individual layer's basis. But it's also been my experience that as the
number of layers needed to build a specific project go up, the quality tends
to go down (and complication increases).

Why not look to other projects for inspiration? Take the Linux kernel: it's
a huge project! Does anyone promise that every possible combination of
configurations is tested and verified before each release (or that they even
compile cleanly)? Although the parts of the kernel have their own trees and
mailing lists, at the end of the day, it's shipped as one kernel in one
repository.


[1] which isn't easy, thanks to https://www.oeclassic.com/

