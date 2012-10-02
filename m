Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJ42s-0004MI-Pv
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Oct 2012 17:06:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Oct 2012 07:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,523,1344236400"; d="scan'208";a="200632960"
Received: from unknown (HELO helios.localnet) ([10.252.122.26])
	by orsmga001.jf.intel.com with ESMTP; 02 Oct 2012 07:53:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 02 Oct 2012 15:53 +0100
Message-ID: <1750245.JB55VjOTAz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <k4eudj$5hj$1@ger.gmane.org>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<k4eudj$5hj$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 0/6] Add meta-webserver
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
X-List-Received-Date: Tue, 02 Oct 2012 15:06:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 02 October 2012 16:40:55 Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Op 01-10-12 18:14, Paul Eggleton schreef:
> > So finally I have got this into a working state; apologies for the delay.
> > There were a number of issues affecting cross-compilation as well as some
> > problems with the initial configuration; these should now be addressed.
> > We may wish to look at a more standard directory layout for Apache as the
> > default one doesn't seem to be used by most distributions; we can look at
> > this later - for now let's get the recipes out there so people can try
> > them out.
> > 
> > I know there are a few people waiting to submit additional recipes for
> > this layer and I expect we will also want to look at moving some
> > web-server related recipes from meta-oe into here at some point in the
> > near future.
> 
> How does this compare to meta-networking?

It's separate; this focuses just on web-based items (on the server side). I'm
not sure how much it will actually grow but you can imagine in the extreme
case we could end up with a number of web servers, several standalone web
admin interfaces, a bunch of web frameworks and related recipes for each of
the latter. All of that would bloat out meta-networking a bit too much,
hence this separate layer.

I did send an RFC for this a couple of months ago, although the scope has
been refined a little since then:

http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg26071.html

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


