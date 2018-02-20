Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 38D92785A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 22:27:41 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id z12so12620725wrg.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 14:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VwO+CHKTG8yAPd6/BNiEWSD0YQrkVjGWqD5IuyADX4s=;
	b=N94y7qUFFqzYY3GK4FCxB+Gnvj4+BnAdokrj+AuGHhK0sjTQYuJfsMLXBXT0+0Y9rR
	DMzkqvb5NDJKBFtDk9Zxp2RWq4Hqobax8VGpW5sO9oyWeGPYFRVEX/mTtcoxlDvo5BCa
	4rXSRg/BvSJVkuEvo+n5ePKnRqO64DTfrrj346boM+tePFmMvPI2SQXl2AyZOA6ceZj5
	6trgKdg1+AisKm+5LaBn9e6jEwjy5iayvSiyCYl9BJsp/x9ehFgaI44l33ZxePQYueF1
	jGvcQmgM+kRkvytkFCVOUqJJeN7JyuVhz56lSDqiX3Sr+PYcA9Q9Z0nIpTt0AUPb6TEs
	eChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VwO+CHKTG8yAPd6/BNiEWSD0YQrkVjGWqD5IuyADX4s=;
	b=DHcPZ7ZUF7UkIRcqAABP7/066u/YjdzC4TJ8hjCU7tdc86pEOBgPnc8QmVo6GFVMJl
	M+32jKc6vOv1p0yrPKqd+z3ZdhmdxYhN7LaApDKNxBvqJooUeQPxRX9L7+MMT7NjADvk
	I2+RzsGCvlMmVpPMyfeDYBuZSps+qKtl43JmR6McP2iW064X/pXK+pXCCYQcyj6ywVTd
	IPEtVnyBhSSZbDWB06zWC5GKcMrmV2LyABTFrcfauKgsgKbWaTBrAGuSqdcoXv7fZMlt
	VgOc4fVfL6PV/c9Z8gRIMg6k6rz1aN/Q8hLc2Z62O7p3ZcRTYYvl746vudqBeAaLVODs
	idPA==
X-Gm-Message-State: APf1xPAIYTQAqmEMn5bvSplYVxgO2Nf5u0yoofA+tBY+EDqu9je2sLwJ
	aV+opfyjIDdiPJnFoo3A8uXivUhLdiS+CTOacmU=
X-Google-Smtp-Source: AH8x226b9NWYWRO+MtzhUHEUf0NEqv9EHP2VBxu9WDZIKuNozfqUqcSk9VTlD55auccVSaGI5WnDQrL3PDFufuLRWts=
X-Received: by 10.223.160.42 with SMTP id k39mr1060624wrk.138.1519165662712;
	Tue, 20 Feb 2018 14:27:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 20 Feb 2018 14:27:42 -0800 (PST)
In-Reply-To: <1519163708.24236.337.camel@linuxfoundation.org>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<1fad6cab-f195-1dca-3b10-ebefe0e44fe3@gmail.com>
	<1519163708.24236.337.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 20 Feb 2018 23:27:42 +0100
Message-ID: <CA+chaQd=QE4fc32LDKepRsNn0gtuyQSfFi3aQ2YxmRbZtJjp1Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 20 Feb 2018 22:27:42 -0000
Content-Type: text/plain; charset="UTF-8"

Richard, I agree with all you said.

But I still don't see how replacing meta-oe git repository with 10
different git repositories helps with anything.

It won't give you more time, it would only cause more work to already
exhausted and (re)tired meta-oe maintainers.

It won't make the layers independent.

It won't improve existing tooling.

It won't improve automated upgrades or testing.

Yes meta-oe needs to improve and it would be great to have layers as those
fancy colorful boxes from Yocto documentation, which you can willy-nilly
add to your BBLAYERS without any dependencies. But that's not how it is now
and splitting the repository alone won't help with that. If there are
people willing to make it work better, then they can improve it in existing
git repository and when it works well and there are really independent
layers, then we can re-evaluate splitting the independent ones to separate
repositories for easier consumption.

Regards,




On Tue, Feb 20, 2018 at 10:55 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2018-02-20 at 11:15 -0800, Khem Raj wrote:
> > On 2/20/18 10:52 AM, Richard Purdie wrote:
> > >
> > > On Tue, 2018-02-20 at 10:40 -0800, Khem Raj wrote:
> > > >
> > > > On 2/20/18 10:00 AM, Tim Orling wrote:
> > > > >
> > > > > I am open to discussion about what direction we go. Individual
> > > > > layers that
> > > > > are curated and built together by YP auto builders sounds like
> > > > > an
> > > > > intriguing path. If this was coupled with increased ptest or
> > > > > testimage
> > > > > usage, our confidence in layer quality would go up
> > > > > dramatically.
> > > > >
> > > > I would like to understand whats stopping YP autobuilders to
> > > > build
> > > > layers under meta-openembedded repo and contribute changes as
> > > > needed.
> > > > All changes with test improvements etc. above are a good change
> > > > and
> > > > should be adopted across layers. However splitting layers is
> > > > least of
> > > > the problem as of now.
> > > The Yocto Project cannot commit to building everything in the meta-
> > > oe
> > > repository. There are some specific layers we would consider
> > > building
> > > but right now I think there are inter-dependencies that cause
> > > problems.
> > >
> > 1 is better than zero so go for it :) As you see fit, send patches to
> > subsume the dependencies into other layers and make it meta-oe layer
> > free, this seems a good step forward
>
> Sure, should I do that before or after I fix the autobuilder, sort the
> stable releases and write the layer tool? ;-)
>
> Seriously, I'd love to but I'm probably not going to get there any time
> soon personally, much as I wish it were otherwise.
>
> > > Sure, we can look into those and try and fix them in some way and
> > > that
> > > would be one less hurdle. I do appreciate we have autobuilder
> > > issues
> > > right now which also causes us problems, I've already committed to
> > > working through those.
> > >
> > > Even once we do that, we (as in YP) can't send out a clear message
> > > about what we're testing and users will clone meta-oe and expect
> > > everything to work. So right now I do have problems trying to get
> > > to a
> > > point where YP can use meta-oe effectively.
> > poky is a different git repo and it has its own way of subsuming
> > subset of oe layers ( oe-core bitbake meta-poky ..),  meta-oe is just
> > another one to deal with fhere. it seems more like a distro problem
> > here to me.
>
> Think about this a different way. The message meta-oe is sending to
> users is that monolithic repositories of many different layers, lumping
> all recipes together in ways which mean they can't be separated out is
> "the right way" to do things. In that sense its little progress over
> oe-classic!
>
> If our tooling is so bad we can't work with layers, perhaps we should
> abandon that idea? Or perhaps we need to fix the tooling and allow
> things to be split up?
>
> I agree we have some challenges with testing, with automated upgrades,
> with tooling and so on, but I think meta-oe does need to evolve (as do
> other parts of the system including things like poky).
>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

