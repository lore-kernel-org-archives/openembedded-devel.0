Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SH2rf-0007pw-UO
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 02:53:52 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M260003ASP3ARC0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	08 Apr 2012 19:44:06 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 199E8201CF; Sun,
	08 Apr 2012 20:43:50 -0400 (EDT)
Date: Sun, 08 Apr 2012 20:43:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120409004350.GA10246@denix.org>
References: <4F80ACD6.8080901@gmail.com>
MIME-version: 1.0
In-reply-to: <4F80ACD6.8080901@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: meta-linaro and toolchain-layer
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
X-List-Received-Date: Mon, 09 Apr 2012 00:53:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Apr 07, 2012 at 02:08:38PM -0700, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> Ken Werner @ Linaro has created a meta-linaro layer. I have created a
> github repo of same here https://github.com/kraj/meta-linaro

FWIW, I've been closely monitoring the progress of meta-linaro layer for past 
month and its status as applicable to meta-ti:

https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000747.html

When I tried it last time to build some of our machines in meta-ti, there were 
issues, but I didn't have time to follow up or investigate and I was busy with 
the BSP presentation at the time...

As a parallel effort, I was looking into working on the prebuilt toolchain 
support - i.e. recipes to use binary Linaro toolchain in OE/Yocto. I grabbed 
the latest 2012.03 release before leaving for the BSP Summit and Linux Collab 
and will give it a try ASAP.


> Moving forward soon gcc 4.7 will land in OE-Core and 4.6 will be
> more or less retired. In natural progression it would move to
> toolchain-layer if there are consumers of it.
> 
> linaro is also working on gcc-4.7 improvements in  same manner as
> 4.6  and there could be more tools e.g. gdb binutils etc. that could
> be useful for armv7+ from that layer.
> 
> I would like to propose few things we could do.
> 
> Use gcc-4.6 from meta-linaro and retire it from toolchain-layer
> which means toolchain layer only has gcc-4.5 and eventually
> This also means that we don't move gcc-4.6 into toolchain-layer
> when its relegated from OE-Core
> 
> In similar fashion add recipes for gcc-linaro-4.7 whenever linaro
> makes first 4.7 based release
> 
> Does anybody see downsides to this approach ?

Sounds like a decent plan, but we need to validate the newest toolchain 
versions with the real hardware before making the switch and dropping the old 
versions - 4.5 is still the most stable build for me and the broad range of 
architectures and platforms I work with at TI from ARM9 to Cortex-A15...


> This could mean that distro may have multiple compilers for different
> architectures e.g. linaro toolchain for arm
> architecture and may be OE-Core provided toolchain for rest of them
> 
> another option is that we do the same thing where we cherry-pick
> linaro patches into toolchain-layer and append them on top gcc from
> OE-Core which we have been doing with 4.6 it does mean extra work
> validation and maintenance that I would like to avoid.

-- 
Denys


