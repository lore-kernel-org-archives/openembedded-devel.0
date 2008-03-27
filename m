Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1JewAK-00066H-B0
	for openembedded-devel@openembedded.org; Thu, 27 Mar 2008 18:45:28 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20080327174524.YWFX28792.fed1rmmtao101.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 13:45:24 -0400
Received: from opus ([68.230.58.230]) by fed1rmimpo01.cox.net with bizsmtp
	id 6HlQ1Z00C4y2VvG03HlQZG; Thu, 27 Mar 2008 13:45:24 -0400
Date: Thu, 27 Mar 2008 10:45:24 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080327174524.GG4938@smtp.west.cox.net>
References: <200803271217.41967.thomas.cooksey@trolltech.com>
	<200803271752.07855.thomas.cooksey@trolltech.com>
	<1206638031.4514.53.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1206638031.4514.53.camel@dax.rpnet.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: LEAD_SONAME?
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
X-List-Received-Date: Thu, 27 Mar 2008 17:45:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 27, 2008 at 05:13:51PM +0000, Richard Purdie wrote:
> On Thu, 2008-03-27 at 17:52 +0100, Tom Cooksey wrote:
[snip]
> > > Your options are:
> > > 	- Ignore the warning
> > My prefered option, but only if this is not causing my dissappearing library issue.
> > 
> > > 	- Define a LEAD_SONAME of your primary lib
> > > 	- More finegrained packaging.
> > Do you mean doing having LEAD_SONAME_foo, LEAD_SONAME_bar, etc. ? That
> > could work?
> 
> No, select one e.g. if libfoo is the most "important", LEAD_SONAME =
> "libfoo".

Ah, but what's up with wildcards in the field (ie glib-2.0) ?  Or ones
that say "libfoo.so" (postgresql) or "libfoo.so.1" (uim) ?  People guessing
incorrectly at the value?  Thanks!

-- 
Tom Rini


