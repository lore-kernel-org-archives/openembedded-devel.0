Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4B05C77D0C;
	Mon, 10 Jul 2017 22:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 90B9820BCC;
	Mon, 10 Jul 2017 22:22:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id HqSdGogA1MCD; Mon, 10 Jul 2017 22:22:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5C5F120645;
	Mon, 10 Jul 2017 22:22:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E2087162525; Mon, 10 Jul 2017 18:22:27 -0400 (EDT)
Date: Mon, 10 Jul 2017 18:22:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170710222227.GF26405@denix.org>
References: <20170710203642.GB26405@denix.org>
	<20170710204751.GC26405@denix.org>
	<598b8f59-0d75-314e-6f18-7f5daa24fa07@gmail.com>
	<20170710210903.GD26405@denix.org>
	<1499722526.27415.1.camel@pbcl.net>
	<20170710220707.GE26405@denix.org>
	<77972c4b-87e4-6369-5b20-6490a929f149@gmail.com>
MIME-Version: 1.0
In-Reply-To: <77972c4b-87e4-6369-5b20-6490a929f149@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-architecture@lists.openembedded.org,
	Phil Blundell <pb@pbcl.net>, openembedded-devel@lists.openembedded.org
Subject: Re: [Openembedded-architecture] [meta-browser] Chromium and gold linker
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
X-List-Received-Date: Mon, 10 Jul 2017 22:22:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2017 at 03:16:54PM -0700, Khem Raj wrote:
> 
> 
> On 7/10/17 3:07 PM, Denys Dmytriyenko wrote:
> > On Mon, Jul 10, 2017 at 10:35:26PM +0100, Phil Blundell wrote:
> >> On Mon, 2017-07-10 at 17:09 -0400, Denys Dmytriyenko wrote:
> >>> On Mon, Jul 10, 2017 at 02:00:35PM -0700, Khem Raj wrote:
> >>>> On 7/10/17 1:47 PM, Denys Dmytriyenko wrote:
> >>>>> On Mon, Jul 10, 2017 at 04:36:42PM -0400, Denys Dmytriyenko
> >>>>> wrote:
> >>>>>> Khem, et al,
> >>>>>>
> >>>>>> I couldn't find below patch being discussed on this mailing
> >>>>>> list before it got 
> >>>>>> merged:
> >>>>>>
> >>>>>> https://github.com/OSSystems/meta-browser/commit/62e323848f569c
> >>>>>> 4cdea5567b1917ce006d7705af
> >>>>>
> >>>>> https://github.com/OSSystems/meta-browser/commit/55a74501bc65c90c
> >>>>> 86e3236b51ec2dc2fc0145fb
> >>>>>
> >>>>> "ld-is-gold just means that my default linker is gold, however we
> >>>>> build
> >>>>> both linkers, so one should be able to enable gold just for
> >>>>> linking
> >>>>> chromium even if default ld is bfd linker."
> >>>>>
> >>>>> I strongly disagree with such interpretation - this would mean
> >>>>> there's NO way 
> >>>>> to disable gold linker completely, e.g. for when external
> >>>>> toolchain doesn't 
> >>>>> support it.
> >>>
> >>> Copying OE architecture list for further discussion of "ld-is-gold"
> >>> meaning.
> >>
> >> The attribution above is a bit confusing so I'm not quite sure who
> >> wrote what.  But it is certainly true that "ld-is-gold" in
> >> DISTRO_FEATURES means, and always has meant, simply that gold is to be
> >> installed as the default linker.  In other words, if you invoke plain
> >> "ld", you will get gold, and if you need the BFD linker - usually
> >> because you are using linker scripts that gold doesn't understand -
> >> then you must invoke ld.bfd.  See
> >> 207a9013670560d62c793a66f01e19f4760a71a8 from some six years ago for
> >> the place that it was originally added.
> >>
> >> As far as I know, we do not have (and never have had) any
> >> DISTRO_FEATURE that will inhibit gold from being installed altogether,
> > 
> > It is not about being installed, but about being supported by the toolchain 
> > in use - think of external toolchains not built by OE-Core... The original 
> > question was whether it's appropriate to force gold linker in recipes, if 
> > ld-is-gold is not set by the distro.
> 
> We do not have a set API for external toolchains, and thats also wy
> external toolchains have to contantly adjust with newer OE release.
> however, in this case external toolchains could provide ld.gold that
> symlinks to bfd linker

That is true, yes. Which also reminds me to submit a report to Linaro about 
this gold linker breakage...


> >> nor can I immediately think of a reason why this would be generally
> >> useful.  Obviously, any DISTRO that wants to do this is welcome to
> >> provide a bbappend for binutils.
> >>
> >> p.
> >>
> 

