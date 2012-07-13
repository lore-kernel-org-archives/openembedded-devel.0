Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Spihm-0002De-He
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 18:26:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jul 2012 09:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="176988684"
Received: from unknown (HELO helios.localnet) ([10.252.121.15])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jul 2012 09:15:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 13 Jul 2012 17:15:33 +0100
Message-ID: <4236628.uxsfNWTicv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <71A2669E-47B3-4F5F-B631-014BBB23CC9F@dominion.thruhere.net>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<38351001.3KzA0t96MO@helios>
	<71A2669E-47B3-4F5F-B631-014BBB23CC9F@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	Joe MacDonald <joe.macdonald@windriver.com>
Subject: Re: Proposal: Creating meta-networking
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
X-List-Received-Date: Fri, 13 Jul 2012 16:26:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 13 July 2012 18:03:08 Koen Kooi wrote:
> Op 13 jul. 2012, om 17:58 heeft Paul Eggleton het volgende geschreven:
> > On Thursday 12 July 2012 15:57:52 Joe MacDonald wrote:
> >> Just to make sure we're got it in context, though, the open points were:
> >>   - tcpdump listed in meta-oe's recipes-core/tasks/task-cli-tools,
> >>   
> >>     under RDEPENDS_${PN}-debug.
> > 
> > Koen, any suggestions? This task has pretty random contents - some of it
> > is even hardware-specific. Do we really need to keep this together?
> 
> That's an SHR recipe, you'd have to ask Martin Jansa.

Ultimately we should not have anything distro-specific in meta-oe at all, which 
means we all ought to have a say in its contents - otherwise it belongs in the 
distro layer.

Martin, do you have any objection to this task recipe being reworked in the 
face of the proposal to split tcpdump (and other networking-related recipes) 
out to meta-networking?

> The biggest blocker right now is where meta-networking is going to be
> hosted, the layers in the meta-openembedded repo can only depend on oe-core
> and bitbake, no other external layers.

I'll leave this for Joe to comment on.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


