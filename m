Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Tfov0-0008JE-GU
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 10:36:00 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Dec 2012 01:21:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,214,1355126400"; d="scan'208";a="226277554"
Received: from unknown (HELO helios.localnet) ([10.252.122.195])
	by azsmga001.ch.intel.com with ESMTP; 04 Dec 2012 01:21:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Anders Darander <anders@chargestorm.se>
Date: Tue, 04 Dec 2012 09:21:23 +0000
Message-ID: <11016715.fxrlBBZh8S@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-18-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <20121204074429.GA6288@ad.chargestorm.se>
References: <cover.1353602922.git.paul.eggleton@linux.intel.com>
	<ea86ab799567bbf1f2fd02d47f9bdc775ba26f9e.1353602922.git.paul.eggleton@linux.intel.com>
	<20121204074429.GA6288@ad.chargestorm.se>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [danny?] Re: [meta-networking][PATCH v2 1/2] ntp: cleanup recipes and fix SSL support
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
X-List-Received-Date: Tue, 04 Dec 2012 09:36:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 04 December 2012 08:44:30 Anders Darander wrote:
> * Paul Eggleton <paul.eggleton@linux.intel.com> [121122 17:50]:
> > * Move common definitions to the inc file
> > * Drop override of do_configure which doesn't seem to be needed anymore
> > * Fold ntp-ssl into the ntp recipe as a PACKAGECONFIG option for those
> >   who want it (default to off) and fix configure-time checks to detect
> >   OpenSSL properly so that it gets enabled when selected
> > * Remove ntp-bin package and put its contents in currently empty
> >   ntp-utils package (with migration path)
> > * Fix hardcoded paths in ntpd initscript
> > * Specify ntpd.conf as a configuration file for packaging purposes
> > * Rearrange so that packaging definitions are towards the end in the
> >   expected order
> > * Delete unused "ntp" initscript file
> > * Add SUMMARY
> > * Update HOMEPAGE
> 
> Would this patch be acceptable for a push to danny? Or is it to
> intrusive?
> 
> If it's to intrusive, we need to update the SRC_URI checksums in danny,
> as they're currently not matching the downloaded file...
> 
> If needed, I can create a SRC_URI-patch for danny, though I'd prefer to
> get this one in if possible.

IMO the original recipe was horribly broken, so I'd definitely support having 
this patch applied to danny as well, assuming people have given it a 
reasonable amount of runtime testing and everything's OK.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


