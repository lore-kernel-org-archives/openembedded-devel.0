Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TULDp-0002mY-Rt
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 18:39:58 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Nov 2012 10:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,701,1344236400"; d="scan'208";a="241901436"
Received: from unknown (HELO helios.localnet) ([10.252.122.125])
	by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2012 10:26:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 02 Nov 2012 17:26:12 +0000
Message-ID: <3131993.6qyQprBZ04@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <20121102141401.GJ4416@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<4865473.CrnCVaFvWL@helios> <20121102141401.GJ4416@windriver.com>
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
X-List-Received-Date: Fri, 02 Nov 2012 17:39:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 02 November 2012 10:14:02 Joe MacDonald wrote:
> [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] On 
12.11.02 (Fri 14:10) Paul Eggleton wrote:
> > On Friday 02 November 2012 10:02:23 Joe MacDonald wrote:
> > > On 12.11.02 (Fri 13:38) Paul Eggleton wrote:
> > > > I have to say I think that these days this could be better implemented
> > > > as one ntp recipe with a PACKAGECONFIG that you can use to enable
> > > > OpenSSL support if desired. (At the time the ntp/ntp-ssl split was
> > > > done, PACKAGECONFIG did not exist). Then it becomes a distro-level
> > > > choice as to whether this is enabled as I believe was originally
> > > > intended.
> > > 
> > > I'm also perfectly fine with that.  Question, though.  Do you mean that
> > > the presence of OpenSSL in the distro would then mean you get ntp-ssl
> > > all the time?  That would be fine for me, but I wonder if anyone else
> > > might want OpenSSL on their system but a non-ssl-enabled ntp?  Probably
> > > a silly case to be thinking about anyway.
> > 
> > The idea with PACKAGECONFIG is it allows per-recipe control over this kind
> > of thing. The default would be for OpenSSL support to be disabled, but it
> > could be enabled with a bbappend containing PACKAGECONFIG += "openssl";
> > alternatively you could do PACKAGECONFIG_append_pn-ntp = " openssl" in the
> > distro .conf file or even local.conf.
> > 
> > I'll send a patch.
> 
> Great.  Thanks, Paul.

Unfortunately when I tested the OpenSSL part I found that it's not actually 
linking against the OpenSSL libraries (!) This is due to libssl and libcrypto 
being split between /usr/lib and /lib respectively instead of being in the 
same directory as the configure script expects. Also the OpenSSL include 
directory being specified does not match with what the configure script tests 
for (it's supposed to be the parent of the openssl directory, not the openssl 
directory itself).

I've also noticed that the ${PN}-utils package ends up empty and the ${PN}-bin 
directory contains a bunch of binaries I would have assumed belonged in that 
package. What should be in these packages? Should there just be one?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


