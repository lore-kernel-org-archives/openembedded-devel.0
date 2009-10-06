Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MvE9a-0000Gz-E7
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Oct 2009 19:48:53 +0200
Received: from gandalf.denix.org ([71.127.57.136]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KR300HGOTFC2PV6@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	06 Oct 2009 12:47:48 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A248A14AF60; Tue,
	06 Oct 2009 13:47:35 -0400 (EDT)
Date: Tue, 06 Oct 2009 13:47:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091006174735.GA26757@denix.org>
References: <20091006034646.GA22854@denix.org>
	<be7a9f3d0910060823y6f3f0ee7n122c8405a2d31390@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <be7a9f3d0910060823y6f3f0ee7n122c8405a2d31390@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
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
X-List-Received-Date: Tue, 06 Oct 2009 17:48:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 06, 2009 at 12:23:18PM -0300, Otavio Salvador wrote:
> Hello Denys,
> 
> On Tue, Oct 6, 2009 at 12:46 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> [...]
> > PV1 = "2.6.29-${PR}+gitr${SRCREV}"
> > PV2 = "2.6.29+2.6.30-rc5-${PR}+gitr${SRCREV}"
> > PV3 = "2.6.30-${PR}+gitr${SRCREV}"
> >
> > That still works with opkg, as ipkg-compare-versions sorts above PVs as
> > expected - PV1 < PV2 < PV3
> >
> > But BitBake now has this flaw and sorts like this: PV2 < PV1 < PV3
> [...]
> 
> Please send the patch for people to review and would be nice to have
> it commited since many of us could have been using non-required
> overrides.

The patch was sent right after the first email:

http://thread.gmane.org/gmane.comp.handhelds.openembedded/26691/focus=26692

-- 
Denys


