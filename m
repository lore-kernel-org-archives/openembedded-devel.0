Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Qrlgg-0003Fd-NL
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Aug 2011 08:57:46 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LPS008FOZ4KNDO2@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	12 Aug 2011 01:53:08 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3930D14AF5D; Fri,
	12 Aug 2011 02:53:08 -0400 (EDT)
Date: Fri, 12 Aug 2011 02:53:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20110812065308.GF13857@denix.org>
References: <1313126272-32091-1-git-send-email-denis@denix.org>
	<20110812063125.GD13857@denix.org> <4E44CAC2.6010300@gmail.com>
	<20110812065138.GE13857@denix.org>
MIME-version: 1.0
In-reply-to: <20110812065138.GE13857@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gcc: append PR to S to match oe-core and	fix do_headerfix
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
X-List-Received-Date: Fri, 12 Aug 2011 06:57:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Aug 12, 2011 at 02:51:38AM -0400, Denys Dmytriyenko wrote:
> On Thu, Aug 11, 2011 at 11:40:02PM -0700, Khem Raj wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > On 08/11/2011 11:31 PM, Denys Dmytriyenko wrote:
> > > On Fri, Aug 12, 2011 at 01:17:52AM -0400, Denys Dmytriyenko wrote:
> > >> From: Denys Dmytriyenko <denys@ti.com>
> > >> 
> > >> This fixes the gcc-cross-inital failure, as reported here: 
> > >> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/6150
> > >
> > >> 
> > > BTW, one of the Linaro patches fails because the file got previously
> > > updated by do_headerfix(), which runs before do_patch(). A little
> > > manual intervention is currently required through TERMCMDRUN...
> > > 
> > 
> > would you mind submitting a patch refresh ?
> 
> Sure, should follow shortly.

Ah, forgot to clarify - it wasn't Linaro patch, it was old RP's 
64bithack.patch. See my other patch in this thread with the fix.

-- 
Denys


