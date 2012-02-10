Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rvptz-0007NB-NZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Feb 2012 13:48:35 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Feb 2012 04:40:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="65273279"
Received: from unknown (HELO helios.localnet) ([10.252.122.199])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Feb 2012 04:40:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Feb 2012 12:40:26 +0000
Message-ID: <1972877.1IzvdJB4e7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <CAPw5SVERSLNnu8Fm6SOn3sYraytVmrR5iGYdOJ8NyQ=MQvreZw@mail.gmail.com>
References: <CAPw5SVERSLNnu8Fm6SOn3sYraytVmrR5iGYdOJ8NyQ=MQvreZw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: First time user: suggestions
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
X-List-Received-Date: Fri, 10 Feb 2012 12:48:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 09 February 2012 21:52:53 Nathan Samson wrote:
> I've talked to someone on FOSDEM about OE, and wanted to try it (I also
> just started to use OpenWrt for a university project)
> 
> These are my first time user notes (and suggestion for improvements).

Thanks for your suggestions, I'll respond to each one below.

> Starting with: http://www.openembedded.org/wiki/Main_Page and especially
> the "Getting Started" Page. This seems to be outdated (using the classic
> repos and not the "layered" core. Building the classic branch did not work
> out for me. Not a very good first user experience. I suggest that the the
> Getting Started page is replaced with the contents from
> wiki.yoctoproject.org/wiki/OpenEmbedded-Core (and slighly enhanced).

Yes, this is a known problem. I did promise to start fixing the docs (at least 
the most visible ones) and I will try to do so over the coming week.

> Building the -core was also problematic. Two packages caused troubles:
> zlib and another package (don't know the name anymore). Both problems were
> caused because it could not download some files.
> 
> It seems zlib.org removed all downloads prior to 1.2.6, and OE uses 1.2.5.
> Applying the patch from http://patches.openembedded.org/patch/20641/ fixed
> the problem.
> The other package could not be downloaded because it was hosted on
> kernel.org and the content seemed to have been removed.
> http://permalink.gmane.org/gmane.comp.handhelds.openembedded.core/14810helpe
> d me fix the issue.

Yes, upstreams removing source downloads is definitely annoying. Both the Yocto 
Project and Angstrom have their own source mirrors but they are not enabled by 
default in OE-Core. The OpenEmbedded TSC (Technical Steering Committee) has 
had some discussions about having a default source mirror, but I don't recall 
whether we reached a conclusion on that issue.

> Suggestion 2: These download problems seems not be fixed very rapidly
> (although they should be quite easy to fix). I wonder why. My theory (but
> prove me wrong), is that developers won't see this because they have the
> download cached in their download directory So only new users will discover
> this.
> One solution could be to have a dedicated "test" machine that tries to
> download every package every day (or at least see if it still exists). Once
> a failure happens it is reported to a log/bug system.

I'm not sure but I think we have a universe fetch test on the Yocto Project 
autobuilder. Assuming it has our mirrors disabled it should pick up when this 
occurs.

> Suggestion 3: Create a site like "
> https://community.dev.fedoraproject.org/packages/" where one can search for
> packages / recipes. This site should integrate with
>  * Recipe info (name, maintainer, layer, version info, changelog info, ...)
>  * Bugs
>  * Incomping Patches / reviews
>  * Build results

We have part of this in the Yocto Project:

http://packages.yoctoproject.org/

Since we use the OE-Core metadata it is equally useful as a reference for OE-
Core. It doesn't have any integration with the bug system or autobuilder 
though, that would be a nice add-on for the future.

> For build results: (which is suggestion 4):
> Create dedicated server machines that test each and every package every
> time it is updated (built without any other packages except for its
> dependencies, with several toolchain configurations - combinations of
> target / libc implemenation / gcc version / ...). In the optimal case every
> package should be tested with every possible combination of enabled
> features but that is probably not possible. This way errors will be quickly
> detected.

FYI the Yocto Project has an autobuilder to do this, again we use the same 
metadata so OE-Core is being build-tested regularly.

http://autobuilder.yoctoproject.org

> I already have to apologize: it seems that these already exists (somewhat),
> in the form of tinderbox.openembedded.net and garnet.openembedded.org
> (I've found about them when looking on the Infrastructure Wiki page), but
> they don't load here... (Are they still maintained / what are they doing
> exactly?)

Not sure, I think tinderbox has been broken for some time. I heard that we 
have some hardware available to set up some build servers for OE (which would 
presumably test stuff outside OE-Core, e.g. meta-oe). I'm not sure what Tom 
King's plan/timetable for implementing this is though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


