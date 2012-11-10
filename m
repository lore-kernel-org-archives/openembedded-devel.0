Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TXBEt-00036H-9K
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Nov 2012 14:36:47 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Nov 2012 05:22:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,751,1344236400"; d="scan'208";a="246939178"
Received: from unknown (HELO helios.localnet) ([10.252.122.153])
	by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2012 05:22:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
Date: Sat, 10 Nov 2012 13:22:53 +0000
Message-ID: <3980864.g4XfIX4FrP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <20121109150414.GA8308@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<FCBA1E696337B442ADB5A7C30428F0689AE6E4@ALA-MBB.corp.ad.wrs.com>
	<20121109150414.GA8308@windriver.com>
MIME-Version: 1.0
Cc: "Little, Morgan" <Morgan.Little@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes
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
X-List-Received-Date: Sat, 10 Nov 2012 13:36:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 09 November 2012 10:04:14 Joe MacDonald wrote:
> [RE: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] On 
12.11.09 (Fri 09:55) Little, Morgan wrote:
> > On 11/04/2012 01:43 PM, Joe MacDonald wrote:
> > > [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up 
recipes] On 12.11.02 (Fri 17:26) Paul Eggleton wrote:
> > >> On Friday 02 November 2012 10:14:02 Joe MacDonald wrote:
> > >>> [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up
> > >>> recipes] On> >> 
> > >> 12.11.02 (Fri 14:10) Paul Eggleton wrote:
> > >>>> On Friday 02 November 2012 10:02:23 Joe MacDonald wrote:
> > >>>>> On 12.11.02 (Fri 13:38) Paul Eggleton wrote:
> > >>>>>> I have to say I think that these days this could be better
> > >>>>>> implemented
> > >>>>>> as one ntp recipe with a PACKAGECONFIG that you can use to enable
> > >>>>>> OpenSSL support if desired. (At the time the ntp/ntp-ssl split was
> > >>>>>> done, PACKAGECONFIG did not exist). Then it becomes a distro-level
> > >>>>>> choice as to whether this is enabled as I believe was originally
> > >>>>>> intended.
> > >>>>> 
> > >>>>> I'm also perfectly fine with that.  Question, though.  Do you mean
> > >>>>> that
> > >>>>> the presence of OpenSSL in the distro would then mean you get
> > >>>>> ntp-ssl
> > >>>>> all the time?  That would be fine for me, but I wonder if anyone
> > >>>>> else
> > >>>>> might want OpenSSL on their system but a non-ssl-enabled ntp? 
> > >>>>> Probably
> > >>>>> a silly case to be thinking about anyway.
> > >>>> 
> > >>>> The idea with PACKAGECONFIG is it allows per-recipe control over this
> > >>>> kind
> > >>>> of thing. The default would be for OpenSSL support to be disabled,
> > >>>> but it
> > >>>> could be enabled with a bbappend containing PACKAGECONFIG +=
> > >>>> "openssl";
> > >>>> alternatively you could do PACKAGECONFIG_append_pn-ntp = " openssl"
> > >>>> in the
> > >>>> distro .conf file or even local.conf.
> > >>>> 
> > >>>> I'll send a patch.
> > >>> 
> > >>> Great.  Thanks, Paul.
> > >> 
> > >> Unfortunately when I tested the OpenSSL part I found that it's not
> > >> actually linking against the OpenSSL libraries (!) This is due to
> > >> libssl and libcrypto being split between /usr/lib and /lib
> > >> respectively instead of being in the same directory as the configure
> > >> script expects.
> > > 
> > > Is that intentional?  I mean is that a misconfiguration or something
> > > reasonably easily changed, or are there specific reasons for that split,
> > > do you know?
> > > 
> > >> Also the OpenSSL include directory being specified does not match with
> > >> what the configure script tests for (it's supposed to be the parent of
> > >> the openssl directory, not the openssl directory itself).
> > > 
> > > Yeah, that's interesting.  Present in the existing recipe as well, from
> > > what I can see, so I'm thinking that hasn't worked since at least the
> > > update to 4.2.6p5.
> > > 
> > > Morgan, can you confirm that you've got SSL support working in your
> > > updated recipe(s)?
> > 
> > Looking at the configure output, it seems that my builds don't take ssl in
> > either. I'm not sure if 4.2.6p3 worked since without changes the old
> > recipe doesn't build.
> Yeah, that's expected based on Paul's findings.  I just meant could you
> ensure it's working in the next version of the recipe update you send
> out?  At some point in the past it was supposed to work, we should
> probably try to get back there.  :-)
> 
> > >> I've also noticed that the ${PN}-utils package ends up empty and the
> > >> ${PN}-bin directory contains a bunch of binaries I would have assumed
> > >> belonged in that package. What should be in these packages? Should
> > >> there just be one?> > 
> > > I think so.  Given that ntpd lives in FILES_${PN}, I'm thinking
> > > everything listed in -bin looks appropriate for -utils.  Or dumping
> > > -utils and leaving them in -bin.  Looking at the recipe it seems like
> > > -utils was intended to be a housecleaning collection.  Did you find
> > > other non-named binaries living in ${bindir} on some builds, Morgan?
> > 
> > I didn't find any non-named binaries living in ${bindir}.
> 
> Okay, so dump one of -utils or -bin, I'm leaning toward keeping the
> former and dumping the latter, but that's really up to you.

FYI I am still working on a patch for the ntp recipes here but have yet to fix 
the SSL issue fully.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


