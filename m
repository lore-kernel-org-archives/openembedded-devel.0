Received: from [70.85.129.92] (helo=sasquatch.hezmatt.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mpalmer@hezmatt.org>) id 1H0nph-0006mz-Uu
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Dec 2006 00:41:46 +0100
Received: from [10.6.66.6] (helo=hezmatt.org)
	by sasquatch.hezmatt.org with esmtp (Exim 3.35 #1 (Debian))
	id 1H0not-0003e4-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Dec 2006 10:40:56 +1100
Received: by hezmatt.org (Postfix, from userid 1000)
	id C92014AE70; Sun, 31 Dec 2006 10:40:52 +1100 (EST)
Date: Sun, 31 Dec 2006 10:40:52 +1100
From: Matthew Palmer <mpalmer@hezmatt.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061230234052.GB16490@hezmatt.org>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230230834.GG30598@hovland.org>
MIME-Version: 1.0
In-Reply-To: <20061230230834.GG30598@hovland.org>
User-Agent: Mutt/1.5.11
Subject: Re: A question of workflow
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
X-List-Received-Date: Sat, 30 Dec 2006 23:41:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 30, 2006 at 03:08:34PM -0800, Erik Hovland wrote:
> On Sat, Dec 30, 2006 at 11:07:57PM +0100, Koen Kooi wrote:
> > > On Sat, Dec 30, 2006 at 07:19:29PM +0000, Richard Purdie wrote:
> > 
> > >> It does mean you shouldn't be committing changes locally via monotone.
> > >> If you do this you will have to pull and then merge every time. That
> > >> isn't a problem in itself but if you do get direct commit access, we
> > >> will not be happy adding hundreds of extra merges to the main
> > >> repository.
> > > 
> > > WTF?  Why are you using a distributed revision control system, if I'm not
> > > supposed to be committing locally?  If everything I do is supposed to be
> > > bundled up into a patch and sent to the bugzilla, how am I meant to maintain
> > > my own tree of fixes while I wait for them all to be applied to dev?  Quilt? 
> > > That might make sense if I'm stuck interacting with SVN, but with a DRCS in
> > > the mix I expect *it* to be able to take on that role.
> > 
> > Do what virtually every DSCM does to support that: make a branch
> 
> Strange. Git nor mercucial require you to branch.

Add darcs and bzr to the "no need to explicitly branch" list.  But then
again, it's not a fundamental failing of the tool if you need to say "Please
branch now", especially when, like monotone, you've got the ability to have
this "micro-branch" thing with the multiple "heads".

- Matt

-- 
"Ah, the beauty of OSS. Hundreds of volunteers worldwide volunteering their
time inventing and implementing new, exciting ways for software to suck."
		-- Toni Lassila, in the Monastery


