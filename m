Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TUHfd-0000LJ-MT
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 14:52:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Nov 2012 06:38:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,699,1344236400"; d="scan'208";a="212700208"
Received: from unknown (HELO helios.localnet) ([10.252.122.125])
	by azsmga001.ch.intel.com with ESMTP; 02 Nov 2012 06:38:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
Date: Fri, 02 Nov 2012 13:38:42 +0000
Message-ID: <5635412.CqmEY78XQ7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <20121102130743.GC4416@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<2240810.9tyY23JxNH@helios> <20121102130743.GC4416@windriver.com>
MIME-Version: 1.0
Cc: "Little, Morgan" <Morgan.Little@windriver.com>,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 02 Nov 2012 13:52:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 02 November 2012 09:07:43 Joe MacDonald wrote:
> [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] On 
12.11.02 (Fri 09:59) Paul Eggleton wrote:
> > On Thursday 01 November 2012 13:32:40 Joe MacDonald wrote:
> > > Does it make sense to have both on a system?  That is, if you build
> > > ntp-ssl does that imply it will only use SSL for communications?  If
> > > that's not the case (which I suspect it isn't, but I haven't checked
> > > myself) then there's not really a strong reason to install both on the
> > > same system.  Which then seems fine to provide ntpdate-ssl as the
> > > alternative.
> > 
> > I'm not sure that it does. I think the split was made just to avoid
> > bringing in OpenSSL on systems where it was not needed or desired. Phil
> > Blundell (on CC) made the split quite a while ago in OE-Classic - Phil
> > can you comment?
>
> > > Now that I think about it a bit more, maybe a RPROVIDES is appropriate
> > > since ntp and ntpdate are overlapping in a lot of places.
> > 
> > Sorry, I don't quite understand what you mean here... ?
> 
> Sorry about that, I've been interleaving writing and thinking, usually
> not a good recipe.  :-)
> 
> It's been so long since I had to actually pay attention to what's in
> ntp that I'm just getting back clued up on it.  I was thinking that it
> should be made explicit in the ntp recipe that it provides ntpdate and
> therefore you would never need to have ntpdate and ntp/ntp-ssl installed
> on the same system at the same time.
> 
> So going back to Morgan's thing, I think now that the case of "add
> ntp-ssl and ntpdate" is invalid, and the result should be using ntp-ssl
> to provide ntpdate.  As long as that's what is happening with his
> recipe, I'm okay with it.  If it's actually dragging in ntp in addition
> to ntp-ssl purely to provide ntpdate, I think we have a problem.  And
> nothing should result in ntp[-ssl] and ntpdate (as in the things
> provided by two or more recipes) being on the same system at the same
> time, since ntp provides ntpdate anyway.  At least it looks like it does
> on my test build.

I have to say I think that these days this could be better implemented as one 
ntp recipe with a PACKAGECONFIG that you can use to enable OpenSSL support if 
desired. (At the time the ntp/ntp-ssl split was done, PACKAGECONFIG did not 
exist). Then it becomes a distro-level choice as to whether this is enabled as 
I believe was originally intended.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


