Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SPhvT-0002Gd-HF
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 00:21:35 +0200
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3F00EJA1M7QTA0@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	02 May 2012 17:11:10 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CA9692010D; Wed,
	02 May 2012 18:10:55 -0400 (EDT)
Date: Wed, 02 May 2012 18:10:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120502221055.GB4581@denix.org>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
	<1335951932-6143-4-git-send-email-koen@dominion.thruhere.net>
	<20120502095150.GA3682@jama.jama.net>
	<CAMKF1spM9urWo1VBXG=qdWOcC_5_2kw-vBGqWv3Lg0xBPWiADA@mail.gmail.com>
	<788719CB-F74E-4219-85AC-82BE71D2068F@dominion.thruhere.net>
	<20120502182913.GA4658@jama.jama.net> <4FA1A48A.2040605@gmail.com>
MIME-version: 1.0
In-reply-to: <4FA1A48A.2040605@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-oe/denzil][PATCH 4/6] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
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
X-List-Received-Date: Wed, 02 May 2012 22:21:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, May 02, 2012 at 02:18:02PM -0700, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 05/02/2012 11:29 AM, Martin Jansa wrote:
> > On Wed, May 02, 2012 at 08:26:49PM +0200, Koen Kooi wrote:
> >> 
> >> 
> >> Op 2 mei 2012 om 20:14 heeft Khem Raj <raj.khem@gmail.com> het
> >> volgende geschreven:
> >> 
> >>> On Wed, May 2, 2012 at 2:51 AM, Martin Jansa
> >>> <martin.jansa@gmail.com> wrote:
> >>>> 
> >>>> I'm not using gcc-4.5, but aren't those 3 patches only for
> >>>> master? As gcc-4.7 and other gcc changes were in oe-core only
> >>>> after release AFAIK.
> >>>> 
> >>> 
> >>> Yes they are strictly for master to accomodate basic changes in
> >>> build sequence we did for gcc 4.7 that said, I think now that
> >>> denzil has released we should reconsider maintaining gcc 4.5 in
> >>> toolchain-layer and same goes for other recipes in the layer.
> >>> Infact I feel the whole layer can be dropped.
> >> 
> >> I was planning to propose the same, any objections?
> > 
> > I've switched to gcc-4.7, so not from me.
> 
> good and as Koen is nodding I assume angstrom is fine too. So I think
> we should drop the layer from master.

Yes, but not immediately - give one or two week notice, please :) Actually, 
this should be considered as a notice and the actual commit to remove should 
be executed later, if nobody says otherwise... Basically, sending an RFC patch 
for review that deletes gcc-4.5 and waiting few days should do it.

-- 
Denys


