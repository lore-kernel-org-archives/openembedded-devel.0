Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T1a5D-0005mL-QQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Aug 2012 11:40:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Aug 2012 02:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,772,1336374000"; d="scan'208";a="181275640"
Received: from unknown (HELO helios.localnet) ([10.252.121.76])
	by azsmga001.ch.intel.com with ESMTP; 15 Aug 2012 02:27:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Matthieu Crapet <mcrapet@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 15 Aug 2012 10:27:54 +0100
Message-ID: <2193222.ciiJHkA12v@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <k0fo2k$fqc$1@dough.gmane.org>
References: <CAL2sKTn13OQ4edHfMwEVzLrpEO1prWGJ_V-1ueZj4KH4BBTDtA@mail.gmail.com>
	<502B613B.4020200@gmail.com> <k0fo2k$fqc$1@dough.gmane.org>
MIME-Version: 1.0
Subject: Re: [RFC][PATCH v2] plowshare: Add Git version (initial recipe)
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
X-List-Received-Date: Wed, 15 Aug 2012 09:40:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 15 August 2012 10:53:42 Koen Kooi wrote:
> Op 15-08-12 10:43, Matthieu Crapet schreef:
> > I'm still confused with this SRCREV thing. Just want to retrieve HEAD
> > from git master branch.
> 
> That's not allowed, all SRCREVs must be locked down. If there's an update
> you want/need, send a patch. Most people stop looking after AUTOREV recipes
> after a month or so and everyone else gets to live with the breakage.

It's worth noting however that if you really still want to use AUTOREV for the 
recipe in your own builds, it's trivial to just bbappend the recipe and do 
that in your own layer on top - so it is possible to have the best of both 
worlds.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


