Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MHS15-00021v-EC
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Jun 2009 02:31:39 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLG00FLQG30IS60@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	18 Jun 2009 17:06:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4EAEE14AF5F; Thu,
	18 Jun 2009 18:06:36 -0400 (EDT)
Resent-from: denis@denix.org
Resent-date: Thu, 18 Jun 2009 18:06:36 -0400
Resent-message-id: <20090618220636.GC31547@denix.org>
Resent-to: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 17:41:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090617214104.GC21132@denix.org>
References: <20090617042909.GA21132@denix.org>
	<1245224450.29153.99.camel@lenovo.internal.reciva.com>
MIME-version: 1.0
In-reply-to: <1245224450.29153.99.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: update-rc.d: don't add runtime dependency if not doing	online package management; only add it to ${PN} in any case.
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
X-List-Received-Date: Fri, 19 Jun 2009 00:31:39 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jun 17, 2009 at 08:40:50AM +0100, Phil Blundell wrote:
> On Wed, 2009-06-17 at 00:29 -0400, Denys Dmytriyenko wrote:
> > The problem comes from the fact that either RDEPENDS_{PN}_append = "blah" or 
> > RDEPENDS_{PN} += "blah" used in the class overwrite the value set in 
> > inheriting recipe, instead of appending to it. The position of the inherit 
> > command in the recipe relative to its own RDEPENDS does not matter. And I 
> > don't think this issue only applies to RDEPENDS variable...
> 
> I've checked in a change to udev-141 that I think should fix this.
> (Other versions didn't seem to be affected.)  Please give that a go and
> see if it works for you now.

Hmm, it works, thanks! I was pretty sure I tried this before I sent out my 
email...

Any ideas why RDEPENDS_{PN} in "udev" recipe works, but RDEPENDS_udev doesn't? 
It only happens with inherit update-rc.d.bbclass, which also changes 
RDEPENDS_{PN}... I have the same issue with my own recipes, which I need to 
fix similarly.

-- 
Denys


