Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UcdEi-0003rq-QG
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:03:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 May 2013 07:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,677,1363158000"; d="scan'208";a="338012361"
Received: from unknown (HELO helios.localnet) ([10.255.12.118])
	by fmsmga002.fm.intel.com with ESMTP; 15 May 2013 07:44:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 15:44:53 +0100
Message-ID: <1499979.6pTC18VfFV@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [RFC] Layers, PRINC and bbappends
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 15:03:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Koen,

On Tuesday 14 May 2013 09:36:02 Koen Kooi wrote:
> What triggered PR going backwards this time was a BSP removing its netbase
> bbappend because it wasn't needed anymore. That's great, I hate netbase
> bbappends since they tend to be ifupdown specific and don't work as
> intended with connman/NM/netctl/etc. Long story short:
> 
> 	ERROR: Package version for package netbase-dbg went backwards which would
> break package feeds from (0:5.0-r3.1 to 0:5.0-r1.2) ERROR: Package version
> for package netbase-staticdev went backwards which would break package
> feeds from (0:5.0-r3.1 to 0:5.0-r1.2) ERROR: Package version for package
> netbase-dev went backwards which would break package feeds from (0:5.0-r3.1
> to 0:5.0-r1.2) ERROR: Package version for package netbase-doc went
> backwards which would break package feeds from (0:5.0-r3.1 to 0:5.0-r1.2)
> ERROR: Package version for package netbase-locale went backwards which
> would break package feeds from (0:5.0-r3.1 to 0:5.0-r1.2) ERROR: Package
> version for package netbase went backwards which would break package feeds
> from (0:5.0-r3.1 to 0:5.0-r1.2)
> 
> To avoid things like that in the future I have a few recommendations I'd
> like to get feedback on:
> 
> 1) For a given BSP split it in multiple layers:
> 	a) One 'core' BSP layer with only:
> 		o Bootloader
> 		o Kernel
> 		o Tooling to build bootloader/kernel/image
> 	b) One BSP layer with bbappends for shadow/netbase/xorg-conf/etc
> 	c) One or more layers with bbappends for libav/clutter/etc[2]
 
I don't like this. This will mean effectively 3x the number of BSP layers, with 
independent testing effectively expected for the different combinations; I don't 
think this will be practical. It's fine for distros with pre-supplied lists of 
layers but lots of users are assembling their own layer stacks and this is 
just going to add pain for them.

It's probably time we looked seriously at more effective analysis tools for 
examining what a layer is actually doing. We now have the variable history in 
bitbake which means that pinpointing a change to a variable down to the 
specific line in the file that made the change is now possible; we should be 
able to build upon this to provide tools that determine when e.g. BSP layers 
are doing things that affect builds for other machines.

Of course, getting maintainers to deal with these issues is another problem, 
but identifying them in the first place would help a lot.

> 2) *Never* use PRINC in type b) bbappends
> 
> 3) Avoid PRINC in general

Do we even need PRINC at all any more? I realise we have PRINC values around 
in bbappends that we can't easily drop without causing the problem you 
mentioned.

> 4) make buildhistory.bbclass mandatory in OE-core

Buildhistory does have some overhead as you know, which is why it's not on by 
default. I wonder if we could move the version going backwards check to 
package.bbclass or package QA, instead making it read the previous values from 
pkgdata. I'm not sure if sstate would get in the way in that the previous set 
of files might already be removed by the time it got to do_package; this would 
need to be investigated. Even if that is the case it might be that we can work 
around it.

> During the last TSC meeting we discussed that there is currently no way to
> force maintainers to behave. I think the most we can do is have clear
> guidelines on the OE side and enforce those during the "Yocto Project
> Compatible" process. 

Being more specific in the Yocto Project Compatible process requirements might 
help; I wasn't involved in developing that process so I can't really comment 
more than that. That wouldn't help with other layers in the OE community that 
aren't put through that process however.

I think we need to improve the documentation we have about what is and what is 
not appropriate in a BSP layer. Most of the time it's not that maintainers are 
too lazy or deliberately setting out to force values, it's that they don't 
know they're doing anything wrong because we haven't documented all of the 
best practices anywhere. There was recently a question on this very mailing 
list about what constitute distro policy settings in the context of what 
shouldn't go into a BSP layer; the response has been a resounding "".

> And have the layer index orange/red flag layers that
> do stupid things. Come to think of it, that would actually be the most
> visible way to go, having wikipedia style warning banners on the offending
> layers.

I think that's reasonable as long as maintainers can understand the problem. 
We'd need to be notifying maintainers directly about specifically what they are 
doing wrong and how to fix it; just putting a warning in the index isn't enough 
IMO. The layer index does record maintainer information and regularly reads 
layer metadata, so we have the infrastructure to do this now, just not the 
specific tools.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


