Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B55697864F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 21:55:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1KLt8G9007303
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 20 Feb 2018 21:55:09 GMT
Message-ID: <1519163708.24236.337.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Tim Orling <ticotimo@gmail.com>
Date: Tue, 20 Feb 2018 21:55:08 +0000
In-Reply-To: <1fad6cab-f195-1dca-3b10-ebefe0e44fe3@gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<1fad6cab-f195-1dca-3b10-ebefe0e44fe3@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
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
X-List-Received-Date: Tue, 20 Feb 2018 21:55:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-02-20 at 11:15 -0800, Khem Raj wrote:
> On 2/20/18 10:52 AM, Richard Purdie wrote:
> > 
> > On Tue, 2018-02-20 at 10:40 -0800, Khem Raj wrote:
> > > 
> > > On 2/20/18 10:00 AM, Tim Orling wrote:
> > > > 
> > > > I am open to discussion about what direction we go. Individual
> > > > layers that
> > > > are curated and built together by YP auto builders sounds like
> > > > an
> > > > intriguing path. If this was coupled with increased ptest or
> > > > testimage
> > > > usage, our confidence in layer quality would go up
> > > > dramatically.
> > > > 
> > > I would like to understand whats stopping YP autobuilders to
> > > build
> > > layers under meta-openembedded repo and contribute changes as
> > > needed.
> > > All changes with test improvements etc. above are a good change
> > > and
> > > should be adopted across layers. However splitting layers is
> > > least of
> > > the problem as of now.
> > The Yocto Project cannot commit to building everything in the meta-
> > oe
> > repository. There are some specific layers we would consider
> > building
> > but right now I think there are inter-dependencies that cause
> > problems.
> > 
> 1 is better than zero so go for it :) As you see fit, send patches to
> subsume the dependencies into other layers and make it meta-oe layer
> free, this seems a good step forward

Sure, should I do that before or after I fix the autobuilder, sort the
stable releases and write the layer tool? ;-)

Seriously, I'd love to but I'm probably not going to get there any time
soon personally, much as I wish it were otherwise.

> > Sure, we can look into those and try and fix them in some way and
> > that
> > would be one less hurdle. I do appreciate we have autobuilder
> > issues
> > right now which also causes us problems, I've already committed to
> > working through those.
> > 
> > Even once we do that, we (as in YP) can't send out a clear message
> > about what we're testing and users will clone meta-oe and expect
> > everything to work. So right now I do have problems trying to get
> > to a
> > point where YP can use meta-oe effectively.
> poky is a different git repo and it has its own way of subsuming
> subset of oe layers ( oe-core bitbake meta-poky ..),  meta-oe is just
> another one to deal with fhere. it seems more like a distro problem
> here to me.

Think about this a different way. The message meta-oe is sending to
users is that monolithic repositories of many different layers, lumping
all recipes together in ways which mean they can't be separated out is
"the right way" to do things. In that sense its little progress over
oe-classic!

If our tooling is so bad we can't work with layers, perhaps we should
abandon that idea? Or perhaps we need to fix the tooling and allow
things to be split up?

I agree we have some challenges with testing, with automated upgrades,
with tooling and so on, but I think meta-oe does need to evolve (as do
other parts of the system including things like poky).

Cheers,

Richard



