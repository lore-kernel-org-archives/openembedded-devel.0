Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UCqwg-0005Af-EC
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Mar 2013 13:26:14 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Mar 2013 04:08:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,787,1355126400"; d="scan'208";a="293812239"
Received: from unknown (HELO helios.localnet) ([10.255.12.96])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2013 04:09:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Dietze <di@fh-wedel.de>
Date: Tue, 05 Mar 2013 12:09:42 +0000
Message-ID: <6717637.hIAbfv92vg@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <20130302174624.GH21221@fh-wedel.de>
References: <20130302174624.GH21221@fh-wedel.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Nylon liveth (but on in OE?)
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
X-List-Received-Date: Tue, 05 Mar 2013 12:26:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 02 March 2013 18:46:24 Martin Dietze wrote:
> Nylon is the distribution with which the 4G Meshcube/AccessCube
> was shipped. As a former 4G employee I took over maintainership
> and started re-integrating Nylon into org.openembedded.dev in
> 2009. However Nylon was and still is based on an old toolchain
> and a 2.4 kernel. This lead to increasing problems keeping the
> code buildable, as more and more code would no longer work on
> a basis that old. Thus Nylon is now obsoleted in OE (and I'd
> say rightly so).
> 
> Not having had the time to work on this in the last years I've
> now decided to go the easy way and simply fork at some time in
> 2009 when the code was still more or less working and continue
> from there. The main benefit from using my work rather than the
> original 4G toolchain (which was itself a fork from a much older
> OE snapshot) I see in having a larger set of recipes to add
> components from if needed and also some updated components in
> the base system
> 
> This work has now been done, and I wonder where the code should
> live from now on. I would thus like to ask if keeping my branch
> in the OE repo would be an acceptable option to the project
> maintainers. Doing this we could probably just remove all the
> remaining mtx-[12] artifacts from the .dev branch (I am not sure
> if mtx-3 is maintained by anyone any longer, at least it is not
> by me).
> 
> I know that there's possibly only very few people interested in
> this, but I'd really like to avoid forking completely, also
> the idea of still being able to grab some recipes from the .dev
> branch if needed would be nice, and it would simplify contributing
> for others. If this idea is not an acceptable option for you, of
> course, I can still push my fork to github.
> 
> What do you think about it?

I don't have a personal interest in this particular distro/hardare, but if the 
fork you have made is working then I can't see a compelling reason not to host 
a branch for it in the OE-Classic repository; at least that keeps things more 
or less in one place.

However, is there any chance you'd be able to look at moving up to be based on 
top of OE-Core which is where OE is at currently? Obviously toolchain and 
kernel would be the first hurdles. For bringing any needed metadata up-to-date 
though the community can provide help where needed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


