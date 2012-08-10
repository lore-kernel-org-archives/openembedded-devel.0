Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SznES-0006yE-S6
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 13:18:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Aug 2012 04:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,745,1336374000"; d="scan'208";a="178740155"
Received: from unknown (HELO helios.localnet) ([10.252.121.78])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2012 04:06:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
Date: Fri, 10 Aug 2012 12:06:28 +0100
Message-ID: <1717286.mDh904HIi2@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-27-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <5024E843.2050709@dynamicdevices.co.uk>
References: <5024E843.2050709@dynamicdevices.co.uk>
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
X-List-Received-Date: Fri, 10 Aug 2012 11:18:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alex,

On Friday 10 August 2012 11:53:55 Alex J Lennon wrote:
> I'm trying to create a layer, overriding certain defaults with use of
> .bbappends.
> 
> e.g. Changing a Grub configuration with a
> meta-foo/recipes-bsp/grub/grub_1.99.bbappend
> 
> I'm wondering what happens when somebody updates the grub recipe in meta
> to a new version, e.g. 2.00 and I then do a git pull?
> 
> As I understand it the environment will automatically pick up the new
> recipe, and presumably my .bbappend to 1.99 will no longer be pulled in?

That's correct. We assume that the contents is often going to be version-
specific and therefore a bbappend needs to be created for each version. There 
have been discussions about adding wildcarding for bbappends, but so far I can 
only assume it hasn't been a serious enough problem for people - at least 
responses to the suggestion have been fairly muted.
 
> Should I be setting a PREFERRED_VERSION_bar somewhere, say in the conf
> for my new layer, on any recipe that I add a .bbppends to, or what's best
> practise for dealing with this?

Setting a PREFERRED_VERSION_ for each bbappended recipe is a reasonable 
approach assuming this is a layer intended to apply some policy (i.e. a distro 
layer).

In practice this is unlikely to come up too often - in OE-Core we usually 
delete the old recipe when upgrading to a new version, and thus if you have a 
bbappend for the old version in your layer you will get an error after parsing 
indicating the bbappend had no matching recipe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


