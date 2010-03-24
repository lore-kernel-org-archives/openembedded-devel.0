Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NuWI0-0003TM-LG
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 20:30:53 +0100
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KZS007RZWPHMS82@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	24 Mar 2010 14:27:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7611714AF60; Wed,
	24 Mar 2010 15:27:17 -0400 (EDT)
Date: Wed, 24 Mar 2010 15:27:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100324192717.GC28005@denix.org>
References: <4B99791E.1020102@zenlinux.com>
	<1097921865-1269428022-cardhu_decombobulator_blackberry.rim.net-2083922404-@bda2481.bisx.prod.on.blackberry>
MIME-version: 1.0
In-reply-to: <1097921865-1269428022-cardhu_decombobulator_blackberry.rim.net-2083922404-@bda2481.bisx.prod.on.blackberry>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBCLASSEXTEND sdk vs. nativesdk
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
X-List-Received-Date: Wed, 24 Mar 2010 19:30:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 24, 2010 at 10:53:40AM +0000, jkridner@beagleboard.org wrote:
> Is this also the mechanism for building an sdk for the target then?  Seems 
> great to normalize this.

Jason,

Calling it "an SDK for the target" is not exactly correct. From your example 
below, the target would be MIPS, while ARM would be an SDK host, I believe.
This technique is called The Canadian Cross:
http://en.wikipedia.org/wiki/Canadian_cross#Canadian_Cross

> If I wanted to build a MIPS cross-compiler that ran on an ARM board, and 
> build that from an x86 machine, what would it look like given nativesdk?

Theoretically, that should be possible with MACHINE=mips and SDKMACHINE=arm, 
but:

1. SDKMACHINE is not yet ported from Poky to OE
2. Currently Poky only supports i586, i686 and x86_64 as SDKMACHINE

-- 
Denys

> Sorry for the blackberry top post. 
> Sent via BlackBerry from T-Mobile
> 
> -----Original Message-----
> From: Richard Purdie <rpurdie@rpsys.net>
> Date: Wed, 24 Mar 2010 10:28:36 
> To: <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] BBCLASSEXTEND sdk vs. nativesdk
> 
> On Tue, 2010-03-23 at 23:42 -0700, Scott Garman wrote:
> > On 03/23/2010 10:45 PM, Khem Raj wrote:
> > >> It seems to me the correct course of action is to use nativesdk in
> > >> BBCLASSEXTEND and rename the dependencies on other recipes, yes?
> > >
> > > you should rename the dependencies on zlib-sdk to zlib-nativesdk
> > > wherever they exist.
> 
> This isn't quite correct. nativesdk is not a drop in replacement for the
> old sdk but you are right that is is the replacement.
> 
> The difference is that the old "sdk" assumes the system you want the sdk
> to run on is the same as the build system. This has always been a big
> can of worms causing problems so "nativesdk" removes this assumption and
> allows you to set SDKMACHINE to be the machine you want the resulting
> sdk to run on.
> 
> This adds some complexity since we need another cross compiling
> toolchain. But cross compiling toolchains are something we're good
> at :). It also means we ship *everything* with the sdk including a
> standalone glibc massively removing system dependencies from the result
> which in my opinion can only be a good thing.
> 
> "sdk" and "nativesdk" are designed to coexist and the idea is that we
> add "nativesdk" to OE alongside "sdk", get it working, then remove the
> old broken "sdk" stuff.
> 
> In theory you can therefore just add the BBCLASSEXTEND line to the zlib
> recipe and work backwards from there. You will need a working -crosssdk
> version of gcc to provide the different compiler.
> 
> > I am running into some problems now trying to get zlib-nativesdk to 
> > build. If I change the recipe to use sdk, it builds fine, so I have 
> > something useful to compare things to.
> > 
> > When I build using nativesdk, configure dies pretty quickly when testing 
> > the compiler. It's trying to run i686-linux-gcc.
> > 
> > Sure enough, if I compare the BitBake environments using the -e option, 
> > I see that CC is being set to "gcc" when I use sdk but "i686-linux-gcc" 
> > when I use nativesdk.
> > 
> > If I create the needed symlink to gcc, the compilation gets further but 
> > still fails, wanting i686-linux-ar, etc. So I have a basic understanding 
> > of what the problem is, but I'm sure the solution is not to go symlink 
> > crazy with my native compiler environment.
> 
> See above, its missing the -crosssdk cross compiler. Did you not have to
> ASSUME_PROVIDED something to make the dependencies work?
> 
> > So I took a look at sdk.bbclass and nativesdk.bbclass. They both set up 
> > a number of architecture-specific variables, but neither of them 
> > explicitly set CC. Where I should look next?
> > 
> > It turns out there is only one package currently in OE that uses 
> > BBCLASSEXTEND with nativesdk (gettext_0.17). So perhaps it is the case 
> > that nativesdk.bbclass needs additional work. I did test copying over 
> > Poky's nativesdk.bbclass (which has just a few differences), but I still 
> > get the same results.
> 
> We probably need those differences in OE. Its nice to see someone
> looking at this!
> 
> Cheers,
> 
> Richard
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


