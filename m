Received: from [66.111.4.26] (helo=out2.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1ISgo6-00038q-JO
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2007 00:23:38 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id D318F277E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2007 18:21:14 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Tue, 04 Sep 2007 18:21:14 -0400
X-Sasl-enc: /GIMFlgcTEhXYmh581WDIkAqbRdtIkZISYQxTSGkO7BB 1188944473
Received: from [192.168.18.11] (CPE-121-209-20-195.sa.bigpond.net.au
	[121.209.20.195])
	by mail.messagingengine.com (Postfix) with ESMTP id 6299F22AEA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2007 18:21:13 -0400 (EDT)
Message-ID: <46DDDA55.7070507@whitby.id.au>
Date: Wed, 05 Sep 2007 07:51:09 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.6 (Windows/20070728)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20070904202957.GD1429@dodger.lab.datenfreihafen.org>
In-Reply-To: <20070904202957.GD1429@dodger.lab.datenfreihafen.org>
X-Enigmail-Version: 0.95.3
Subject: Re: [RFC] How to handle external kernel patches in oe the right way?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2007 22:23:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Stefan Schmidt wrote:
> Due to my work on OpenEZX (http://www.openezx.org) I'm in touch with
> external kernel patches used in OE to build working kernels for
> different Motorola mobile phones.
> 
> Talking with Koen about the best way to handle this we have some
> slightly different opinions on this. So we like to get some more
> opinions on this before pinning to a strategy.
> 
> Koen like to pull the patches from a known-good rev into oe to have
> them all at one place for less fragile building and tweaking.
> 
> I prefer OE to use our svn server with a fixed SRCREV which gets
> updated once a newer version is known good. I'm not a fan of
> duplicating the patches in OE if some small tweaking patches can also
> handle it.

For the ixp4xx-kernel in OE, I pull patches from a fixed known-good rev
in the nslu2-linux.org kernel patches svn.  The reason is that it makes
it easier to keep the patches in sync for OE, OpenWrt and Debian (which
all use those patches).

> For bleeding edge building and testing we will create a recipe with
> DEFAULT = -1 anyway.
> 
> I'm not totally against Koens approach, just see not much sense, but
> more problems in duplicating the patches in OE. If other people are
> still for it we can of course go that route.

I can see both points of view.  As an upstream kernel patch maintainer,
I like to keep a single respository, and then use that in all the
downstream distributions (OE being just one of them) directly.  As a
distro maintainer, Koen wants to ensure that OE is not affected by
downtime on the upstream server.  Both are valid (but conflicting)
points of view.

Since I'm the ixp4xx-kernel.bb maintainer in OE at the moment, then I
feel that I have the right to choose the way that works for me for that
package :-)  Since I also run the upstream svn server, I can ensure that
it has a better uptime than the OE monotone server and wiki ;-)

-- Rod


