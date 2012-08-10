Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SznJR-00075D-NM
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 13:23:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Aug 2012 04:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,745,1336374000"; d="scan'208";a="196634598"
Received: from unknown (HELO helios.localnet) ([10.252.121.78])
	by fmsmga001.fm.intel.com with ESMTP; 10 Aug 2012 04:11:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
Date: Fri, 10 Aug 2012 12:11:37 +0100
Message-ID: <1660331.qcC0NDgy9m@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-27-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1717286.mDh904HIi2@helios>
References: <5024E843.2050709@dynamicdevices.co.uk> <1717286.mDh904HIi2@helios>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Best practise using .bbappend
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
X-List-Received-Date: Fri, 10 Aug 2012 11:23:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 10 August 2012 12:06:28 Paul Eggleton wrote:
> > Should I be setting a PREFERRED_VERSION_bar somewhere, say in the conf
> > for my new layer, on any recipe that I add a .bbppends to, or what's best
> > practise for dealing with this?
> 
> Setting a PREFERRED_VERSION_ for each bbappended recipe is a reasonable
> approach assuming this is a layer intended to apply some policy (i.e. a
> distro layer).
> 
> In practice this is unlikely to come up too often - in OE-Core we usually
> delete the old recipe when upgrading to a new version, and thus if you have
> a bbappend for the old version in your layer you will get an error after
> parsing indicating the bbappend had no matching recipe.

I forgot to mention, "bitbake-layers show-appends" will warn if there is a 
bbappend for one version of a particular PN but none for the current preferred 
version; thus it can be used to catch where this situation has occurred, the 
old recipe was not deleted and no PREFERRED_VERSION_ has been set.

In general bitbake-layers is quite a useful utility for querying layer 
configuration and interaction.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


