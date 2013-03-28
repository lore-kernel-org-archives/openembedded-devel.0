Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ULDdr-0006ZK-Ag
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Mar 2013 15:17:30 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Mar 2013 07:00:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,925,1355126400"; d="scan'208";a="285791060"
Received: from unknown (HELO helios.localnet) ([10.255.13.158])
	by orsmga001.jf.intel.com with ESMTP; 28 Mar 2013 07:00:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 28 Mar 2013 14:00:17 +0000
Message-ID: <2592774.EEO2cMj6Fo@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <CANyK_8eJ6Y5V_=rD-n9CBBwckmkVwJJao8WUQrVetcmPzDw_fg@mail.gmail.com>
References: <1364469370-12082-1-git-send-email-paul@paulbarker.me.uk>
	<11972732.k3n4Vx4bzS@helios>
	<CANyK_8eJ6Y5V_=rD-n9CBBwckmkVwJJao8WUQrVetcmPzDw_fg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][TEMP PATCH] gd: Temporary patch while libgd.org is down, do not commit to main repository!
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
X-List-Received-Date: Thu, 28 Mar 2013 14:17:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 28 March 2013 13:56:13 Paul Barker wrote:
> On 28 March 2013 13:34, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> > On Thursday 28 March 2013 11:16:10 Paul Barker wrote:
> > > This is just a temporary patch to change the SRC_URI for gd as the
> > > upstream
> > > source libgd.org has been down for a week or so now. The MD5 and SHA256
> > > sums match so this should be the exact same archive. It is not intended
> > > to go in the main repository but may be useful to some of you until
> > > libgd.org is back up.
> > 
> > This is what we have MIRRORS for - perhaps we could add an entry to
> > MIRRORS to handle this?
> 
> I just went for a quick and dirty fix as I'm not very experienced with
> bitbake recipes yet. Would this be added to mirrors.bbclass directly
> or should I add a MIRRORS += line to the gd recipe?

Since this is specific to the gd recipe I'd say in the recipe itself.

For entries that are more generic we can have them in mirrors.bbclass even if 
there's nothing in OE-Core that uses them, although it would be great if we 
could have a proper mechanism to extend this on a per-layer basis in future.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


