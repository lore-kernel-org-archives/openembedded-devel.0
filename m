Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US67W-0004xS-0m
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 15:40:26 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 Apr 2013 06:22:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,485,1363158000"; d="scan'208";a="227795400"
Received: from unknown (HELO helios.localnet) ([10.255.14.4])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Apr 2013 06:22:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 16 Apr 2013 14:22:52 +0100
Message-ID: <2803066.5t2BvEp21p@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <5C3F1A93-CC39-45E6-AF2B-FF29F50C67CD@dominion.thruhere.net>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
	<1561352.OujRcMfYWi@helios>
	<5C3F1A93-CC39-45E6-AF2B-FF29F50C67CD@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking, meta-oe][PATCH 0/9] Move networking recipes to meta-networking
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
X-List-Received-Date: Tue, 16 Apr 2013 13:40:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 16 April 2013 13:30:29 Koen Kooi wrote:
> Op 16 apr. 2013, om 13:19 heeft Paul Eggleton 
<paul.eggleton@linux.intel.com> het volgende geschreven:
> > On Tuesday 16 April 2013 13:09:46 Koen Kooi wrote:
> >> These look good to me, but
> >> 
> >>> iw: move to meta-networking and update
> >> 
> >> This is receferenced by a packagegroup in meta-oe:
> >> 	meta-oe/recipes-core/packagegroups/packagegroup-basic.bb:
> >> ${@base_contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "", d)}
> >> \
> >> 
> >> 
> >> With the 'meta-oe shall only depend on oe-core' rule,
> > 
> > Are you sure nothing in meta-oe depends on anything in other layers within
> > meta-openembedded already?
> 
> I can't say for certain, but Martin and I have been very strict about it in
> the past. If there are such external dependencies they should be looked at
> and fixed.

At some point I don't think this is going to be realistic - what happens if 
you have something in meta-oe that's too generic to be put elsewhere and yet 
has a dependency on something in meta-multimedia or meta-networking? It will 
come up at some point fairly soon.

I can drop the iw patch from this set for the sake of the rest of the patches 
if you object to moving it, but we do need to do something about this in the 
near future.

For now, I did check and at the moment according to "bitbake-layers show-
cross-depends" (thank you Robert) we have only vlc depending on fluidsynth 
which is in meta-multimedia, but vlc ought to be moved to meta-multimedia 
itself anyway.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


