Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1KBDsX-0006pW-9I
	for openembedded-devel@openembedded.org; Tue, 24 Jun 2008 21:08:33 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20080624190619.HUXO7004.fed1rmmtao106.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Jun 2008 15:06:19 -0400
Received: from localhost ([68.230.59.19]) by fed1rmimpo02.cox.net with bizsmtp
	id hv6V1Z00J0QtwrG04v6V2X; Tue, 24 Jun 2008 15:06:31 -0400
Date: Tue, 24 Jun 2008 12:06:29 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080624190629.GI9891@smtp.west.cox.net>
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<20080624095735.GB3500@aquilonia.hyboria>
	<g3rel4$tko$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <g3rel4$tko$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 24 Jun 2008 19:08:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 24, 2008 at 08:33:06PM +0200, Koen Kooi wrote:
> Graeme Gregory wrote:
> >>We've not made any decisions on what the commit/review policy should be,
> >>this is open for discussion. We're thinking it may take the form of some
> >>kind of kernel style Signed-off-by: tags and a switch to a partially
> >>pull based model rather than just push based as we use monotone so more
> >>than one developer handles any given change.
> >>
> >I have been thinking on this and here is my suggestion.
> >
> >One thing that has been noted has been the high level of work required
> >to review every change to every package.
> >
> >Every time more than two OE people get together we keep talking about
> >splitting OE into two. Maybe it is time to consider actually doing it.
> >My suggestion would be along the rough lines of the following.
> >
> >1) OE-core - everything needed to get upto a successful glibc build
> >completed so gcc, gcc-cross, binutils and support packages. Also most
> >stuff in classes/. Breakages in these two areas are what hurts the most
> >and the area we have the least manpower in.
> 
> I'd expand that area to the stuff task-boot covers (init, udev, busybox, 
> etc), and maybe even packages/linux.

Maybe this is too big a wish, but how about we go so far as to say a set
of distributions, machines and image targets That Will Build is the
core and everything else is the universe.  It might take a little work
to get there of course.

-- 
Tom Rini


