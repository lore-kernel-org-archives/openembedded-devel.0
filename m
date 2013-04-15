Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1URnFl-0003nq-9A
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 19:31:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Apr 2013 10:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,476,1363158000"; d="scan'208";a="286404427"
Received: from unknown (HELO helios.localnet) ([10.255.13.245])
	by azsmga001.ch.intel.com with ESMTP; 15 Apr 2013 10:13:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Apr 2013 18:13:43 +0100
Message-ID: <2861602.41VSkGNmWK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <9692220.xQMF5DQqQm@helios>
References: <1365947374-20385-1-git-send-email-Martin.Jansa@gmail.com>
	<20130414150423.GF2475@jama> <9692220.xQMF5DQqQm@helios>
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] dnsmasq: merge dnsmasq-dbus to main recipe
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
X-List-Received-Date: Mon, 15 Apr 2013 17:31:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 14 April 2013 16:09:21 Paul Eggleton wrote:
> On Sunday 14 April 2013 17:04:23 Martin Jansa wrote:
> > On Sun, Apr 14, 2013 at 04:01:59PM +0100, Paul Eggleton wrote:
> > > On Sunday 14 April 2013 15:49:34 Martin Jansa wrote:
> > > > * they conflict in sysroot anyway, should be converted to
> > > > PACKAGECONFIG
> > > > 
> > > >   but because dbus is already built in most images I'll let it for
> > > >   someone
> > > >   who has such use-case
> > > 
> > > Hang on a sec, I agree it's good to get rid of this second recipe, but
> > > you're changing the default - so at least give people a way to influence
> > > it. It's not too hard to put in PACKAGECONFIG now while you're changing
> > > the recipe anyway.
> > 
> > is there someone who needs dnsmasq without dbus?
> 
> It's not too hard to imagine a minimal system that wants one and not the
> other. We had two recipes originally for a reason. Sure, it's fine if you're
> already using something that uses dbus and therefore you'll have it anyway,
> but not everyone is in the same situation.

FYI, I already have a patch to do this coming as part of my meta-networking 
moves patchset which I am re-applying at the moment.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


