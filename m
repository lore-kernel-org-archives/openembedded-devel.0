Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1KBG6c-0003b9-7L
	for openembedded-devel@openembedded.org; Tue, 24 Jun 2008 23:31:14 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20080624212859.XSIB12709.fed1rmmtao102.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Jun 2008 17:28:59 -0400
Received: from localhost ([68.230.59.19]) by fed1rmimpo01.cox.net with bizsmtp
	id hxV91Z00C0QtwrG03xV9ug; Tue, 24 Jun 2008 17:29:11 -0400
Date: Tue, 24 Jun 2008 14:29:09 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080624212909.GJ9891@smtp.west.cox.net>
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<20080624095735.GB3500@aquilonia.hyboria>
	<g3rel4$tko$1@ger.gmane.org>
	<20080624190629.GI9891@smtp.west.cox.net>
	<48615E45.8080606@kernelconcepts.de>
MIME-Version: 1.0
In-Reply-To: <48615E45.8080606@kernelconcepts.de>
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
X-List-Received-Date: Tue, 24 Jun 2008 21:31:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 24, 2008 at 10:51:17PM +0200, Florian Boor wrote:

> Hi,
> 
> Tom Rini wrote:
> 
> > Maybe this is too big a wish, but how about we go so far as to say a set
> > of distributions, machines and image targets That Will Build is the
> > core and everything else is the universe.  It might take a little work
> > to get there of course.
> 
> I think we are moving into mixing up a development branch with a semi-stable
> testing branch again. You can't replace motivated developers with strict policies.

I don't know..  I guess it's a question, and it can (should even) be
addressed after the git switch.  Just how wild and unstable are we still
willing to have the "main" tree be.  It sounds like there's already
agreement that big changes (thinking of packaged-staging, which is quite
nice!) will be done in a branch first.  And there's already an
autobuilder.  It seems like the next logical step would be to say what
has to be working, in order for a big changing-lots-of-things merge to
go in.  That to me would be the "core" of distros/machines/images that
need to still function.

Also, I'm not saying that for every commit to the core you need to do a
from scratch build of all combinations, but you should reasonably
confident that things work.

-- 
Tom Rini


