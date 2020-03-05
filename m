Return-Path: <leo.yan@linaro.org>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 820AA6186D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2020 02:00:27 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h8so1932564pgs.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 18:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=rdhOP2qz07GYYP4kDyWvighBFMnfCA1K4i3KxJwiQd8=;
	b=ZR822MRWCshARAPHTMOXJYuhMvRsNk9wenkNfhw0ti7RzVyGHlckcjvVXHjJ4Ssn6q
	vGVkjGBRg2rHzXicjY+ZqR+4f+WWM17n2nc/muQlxU5Rvx68yNVA8/K8gB+29pzFrHnA
	lL9D2vMRh3RYCDVPpGEw4ZVGc8HEoJa6Wi2/RaBex3FPTIvtnU3FJlNBh+lcNmxNPH92
	TORfXD5kG7WtQQ+2VAvQl71H4gofo9Pi+GLzNadEoKpDGCWZ2w6bW6xQHsCOQz4B6osh
	hOmZgXDdkBYIzBT8B1Du3YYUt7gX6x4FIYns4JrgeV9trFGnhq9WMSOQJeijLbDcmCqw
	p8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rdhOP2qz07GYYP4kDyWvighBFMnfCA1K4i3KxJwiQd8=;
	b=UZ8RlWClGUM2DUNOfVyVXanmZDRgWgNsafSxS/8wtasPrl1Rbmj4tq8txTuAenUs9q
	mNI5PYh1ARwkk2qoxL059h1q7eA4QPntrkoT3ZmDUd3c+7MZrReGmTw4oF2fsMIhdV8h
	kvw5k7hMlq34syS6DqEn6IhNjQ2hxQYHP+xvyEhtF2vewhwXWcNWOo69V2tgkx8keaWW
	B/il/TfNQNDW/pAg649PcyJwWozhx4Sj9SfuYBumnGyn7BjR5BTt2hx2ti0hgWc9hAaG
	FowX/unadSUXw5zob8uYgk7rrwJ7cWn9fCSAYcJbZEd9TeqGQXhu8fHQd0wb1hgWhA/1
	uY9Q==
X-Gm-Message-State: ANhLgQ0PYODxgaeefkZIjuRIUK/FqDRe4yn0JlRLJx/bD7N4TDPhds87
	zz5VK1UgqN8DXFAai835JVrdow==
X-Google-Smtp-Source: ADFU+vtoiW/lXEMpthrpZ2sjZDUyN4sE19Lvd9/OyUWwO8fo3UHkqLmnIc84xw2dWZPXRGx57mnNCw==
X-Received: by 2002:a63:d149:: with SMTP id c9mr3625260pgj.253.1583373628452; 
	Wed, 04 Mar 2020 18:00:28 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([2400:8902::f03c:91ff:fe3f:ee42])
	by smtp.gmail.com with ESMTPSA id
	d24sm31213938pfq.75.2020.03.04.18.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Mar 2020 18:00:27 -0800 (PST)
Date: Thu, 5 Mar 2020 10:00:20 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200305020020.GC5761@leoy-ThinkPad-X240s>
References: <20200304122811.16655-1-leo.yan@linaro.org>
	<alpine.LFD.2.21.2003041103340.29352@godzilla.spiteful.org>
	<a7ae7094-c8b4-f0cc-357f-c6cce1231e49@gmail.com>
	<20200305014347.GA5761@leoy-ThinkPad-X240s>
	<CAMKF1sqP3hVvMdi-itWH6VmHQX6Ri5Cj-=0nQyyacDW2tCFBWg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqP3hVvMdi-itWH6VmHQX6Ri5Cj-=0nQyyacDW2tCFBWg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v1] OpenCSD: Support for Arm CoreSight decode lib
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
X-List-Received-Date: Thu, 05 Mar 2020 02:00:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2020 at 05:49:37PM -0800, Khem Raj wrote:
> On Wed, Mar 4, 2020 at 5:43 PM Leo Yan <leo.yan@linaro.org> wrote:
> >
> > Hi all,
> >
> > On Wed, Mar 04, 2020 at 11:19:37AM -0800, Khem Raj wrote:
> > >
> > >
> > > On 3/4/20 8:05 AM, Scott Murray wrote:
> > > > On Wed, 4 Mar 2020, Leo Yan wrote:
> > > >
> > > > > This recipe is to support OpenCSD, which is an open source
> > > > > CoreSight trace decode library and utility.
> > > >
> > > > Just a thought, this seems like the kind of thing that might make sense
> > > > for the new meta-arm layer that Jon has been working up?
> >
> > Thanks for the suggestion, Scott.
> >
> > To be honest, I didn't know meta-arm layer before; seems to me it makes
> > sense to integrate this recipe into meta-arm rather than
> > meta-openembedded.  Will explain more for Khem's question.
> >
> > > it also says x86_64 in COMPATIBLE_HOST, while coresight seems to be arm
> > > specific is this not supposed to be so ?
> >
> > OpenCSD lib is dedicated to be used for Arm CoreSight IP, but it can
> > be built both for x86_64's and Arm64's distro.
> >
> > The main usage case is to enable OpenCSD lib for Arm64 building, and the
> > users can decode the trace data with Perf/OpenCSD in the same distro.
> > Though I set COMPATIBLE_HOST for x86_64, it would be seldom to do cross
> > analysis (e.g. capture trace data in OE/Arm64 and copy the perf data to
> > OE/x86_64 for analysis).
> >
> > For this reason, it's good to maintain this recipe in meta-arm.  If no
> > objection, I will prepare patch for meta-arm.
> 
> Makes sense in meta-arm

Thanks for confirmation, Khem. And thanks all :)  Will do it.

Leo

