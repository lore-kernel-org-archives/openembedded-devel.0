Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MwVEp-00035L-7b
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Oct 2009 08:15:34 +0200
Received: from gandalf.denix.org ([71.127.57.136]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KRA005WQBXXG1B1@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	10 Oct 2009 01:13:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CEC5514AF60; Sat,
	10 Oct 2009 02:13:08 -0400 (EDT)
Date: Sat, 10 Oct 2009 02:13:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091010061308.GA23748@denix.org>
References: <20091006034646.GA22854@denix.org>
	<be7a9f3d0910060823y6f3f0ee7n122c8405a2d31390@mail.gmail.com>
	<1255079009.1184.137.camel@dax.rpnet.com>
MIME-version: 1.0
In-reply-to: <1255079009.1184.137.camel@dax.rpnet.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Version sorting in BitBake
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
X-List-Received-Date: Sat, 10 Oct 2009 06:15:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 09, 2009 at 10:03:29AM +0100, Richard Purdie wrote:
> On Tue, 2009-10-06 at 12:23 -0300, Otavio Salvador wrote:
> > Hello Denys,
> > 
> > On Tue, Oct 6, 2009 at 12:46 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > [...]
> > > PV1 = "2.6.29-${PR}+gitr${SRCREV}"
> > > PV2 = "2.6.29+2.6.30-rc5-${PR}+gitr${SRCREV}"
> > > PV3 = "2.6.30-${PR}+gitr${SRCREV}"
> > >
> > > That still works with opkg, as ipkg-compare-versions sorts above PVs as
> > > expected - PV1 < PV2 < PV3
> > >
> > > But BitBake now has this flaw and sorts like this: PV2 < PV1 < PV3
> > [...]
> > 
> > Please send the patch for people to review and would be nice to have
> > it commited since many of us could have been using non-required
> > overrides.
> > 
> > Thanks by founding and _fixing_ it :-D
> 
> This worries me quite a bit as it means bitbake's version comparison
> function is broken. Is there a python version comparison function
> somewhere else we can compare bitbake's with to make sure there aren't
> any other glitches we have?

I was consulting with the ipkg-utils ipkg-compare-versions.c

> Bitbake's and opkg's version handling is meant to model Debian for
> reference.

We discussed this matter on irc with Phil/pb couple days ago. The agreement 
was that fixing BitBake to adhere to dpkg/opkg (i.e. Debian) version sorting 
rules is a good thing. The remaining question was with rpm, which, according 
to sorting algorithm docs on the Net, does not take into account any 
separators at all.

Phil was suggesting that the sorting algorithm can be adjusted runtime 
depending on the distro or whether debian.bbclass is inherited...
Any preferences of what to do with rpm?

-- 
Denys


