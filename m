Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TUEFG-0002yR-W8
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 11:12:59 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Nov 2012 02:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,697,1344236400"; d="scan'208";a="243347019"
Received: from unknown (HELO helios.localnet) ([10.252.122.125])
	by fmsmga002.fm.intel.com with ESMTP; 02 Nov 2012 02:59:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 02 Nov 2012 09:59:16 +0000
Message-ID: <2240810.9tyY23JxNH@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <20121101173240.GV4673@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<1363930.E51Pa0kBDd@helios> <20121101173240.GV4673@windriver.com>
MIME-Version: 1.0
Cc: "Little, Morgan" <Morgan.Little@windriver.com>,
	Joe MacDonald <Joe.MacDonald@windriver.com>
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
X-List-Received-Date: Fri, 02 Nov 2012 10:12:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 01 November 2012 13:32:40 Joe MacDonald wrote:
> [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] On 
12.11.01 (Thu 17:19) Paul Eggleton wrote:
> > On Thursday 01 November 2012 17:09:59 Little, Morgan wrote:
> > > My rational behind splitting like that is if it is just ntpdate and you
> > > try
> > > to add ntp-ssl and ntpdate it will use ntp to provide ntpdate. It could
> > > be
> > > change add RPROVIDES so ntp will provide ntpdate and ntp-ssl provides a
> > > uniquely named version.
> > 
> > The ssl version could be ntpdate-ssl if it needs to be unique. I think
> > originally though these recipes weren't intended to be built side-by-side
> > -
> > rather they were mutually exclusive and the distro would make a choice as
> > to which one was built.
> 
> Hmm, good point.
> 
> Does it make sense to have both on a system?  That is, if you build
> ntp-ssl does that imply it will only use SSL for communications?  If
> that's not the case (which I suspect it isn't, but I haven't checked
> myself) then there's not really a strong reason to install both on the
> same system.  Which then seems fine to provide ntpdate-ssl as the
> alternative.

I'm not sure that it does. I think the split was made just to avoid bringing
in OpenSSL on systems where it was not needed or desired. Phil Blundell (on 
CC) made the split quite a while ago in OE-Classic - Phil can you comment?

> Now that I think about it a bit more, maybe a RPROVIDES is appropriate
> since ntp and ntpdate are overlapping in a lot of places.

Sorry, I don't quite understand what you mean here... ?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


