Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B124A7880B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 18:52:31 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1KIqU1N030802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 20 Feb 2018 18:52:31 GMT
Message-ID: <1519152750.24236.330.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Tim Orling <ticotimo@gmail.com>
Date: Tue, 20 Feb 2018 18:52:30 +0000
In-Reply-To: <f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
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
X-List-Received-Date: Tue, 20 Feb 2018 18:52:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-02-20 at 10:40 -0800, Khem Raj wrote:
> On 2/20/18 10:00 AM, Tim Orling wrote:
> > I am open to discussion about what direction we go. Individual
> > layers that
> > are curated and built together by YP auto builders sounds like an
> > intriguing path. If this was coupled with increased ptest or
> > testimage
> > usage, our confidence in layer quality would go up dramatically.
> > 
> I would like to understand whats stopping YP autobuilders to build
> layers under meta-openembedded repo and contribute changes as needed.
> All changes with test improvements etc. above are a good change and
> should be adopted across layers. However splitting layers is least of
> the problem as of now.

The Yocto Project cannot commit to building everything in the meta-oe
repository. There are some specific layers we would consider building
but right now I think there are inter-dependencies that cause problems.

Sure, we can look into those and try and fix them in some way and that
would be one less hurdle. I do appreciate we have autobuilder issues
right now which also causes us problems, I've already committed to
working through those.

Even once we do that, we (as in YP) can't send out a clear message
about what we're testing and users will clone meta-oe and expect
everything to work. So right now I do have problems trying to get to a
point where YP can use meta-oe effectively.

I could combo-layer pieces of meta-oe into poky but I'd imagine that
would create more problems than it would solve too and given the
general dislike of combo-layer, I think ultimately better layer tooling
would be a better answer and more acceptable to everyone.

Cheers,

Richard





