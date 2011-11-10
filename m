Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1ROS4a-0008LX-1h
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 11:41:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Nov 2011 02:35:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="73383450"
Received: from unknown (HELO helios.localnet) ([10.252.121.140])
	by orsmga001.jf.intel.com with ESMTP; 10 Nov 2011 02:35:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 10 Nov 2011 10:35:12 +0000
Message-ID: <1627207.pd1HnObREr@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <j9g8hi$43b$1@dough.gmane.org>
References: <201111092321.33622.schnitzeltony@gmx.de>
	<2977361.KIYvSC26hZ@helios> <j9g8hi$43b$1@dough.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: systemd packages -> image
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
X-List-Received-Date: Thu, 10 Nov 2011 10:41:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 10 November 2011 11:20:34 Koen Kooi wrote:
> So I can start sending patches to add the systemd files to ${PN} in oe-core
> recipes now?

I would think if these additions are conditional upon systemd being in 
DISTRO_FEATURES, I can't see a problem. I think the ideal situation would be 
to have a generic "init" bbclass (or some better name) which does all the work 
for you regardless of whether sysvinit or systemd is used (i.e. it would 
effectively replace update-rc.d.bbclass), and save having to have packaging 
boilerplate in every recipe.

My main point was, yes there are both people who want to stay with sysvinit 
and people who are keen to move to systemd, but I'm not convinced both of 
those need to be catered for within the same distro policy.

> That's the big hold up: lack of vision from the OE-core folks.

This is a community project, if you have ideas or suggestions, just start the 
discussion...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


