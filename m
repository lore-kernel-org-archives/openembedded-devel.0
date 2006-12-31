Received: from [70.85.129.92] (helo=sasquatch.hezmatt.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mpalmer@hezmatt.org>) id 1H0ycc-0001GP-HA
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Dec 2006 12:12:58 +0100
Received: from [10.6.66.6] (helo=hezmatt.org)
	by sasquatch.hezmatt.org with esmtp (Exim 3.35 #1 (Debian))
	id 1H0ybm-0005I5-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Dec 2006 22:12:06 +1100
Received: by hezmatt.org (Postfix, from userid 1000)
	id 13E2B4AE70; Sun, 31 Dec 2006 22:12:03 +1100 (EST)
Date: Sun, 31 Dec 2006 22:12:03 +1100
From: Matthew Palmer <mpalmer@hezmatt.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061231111203.GB22098@hezmatt.org>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230230834.GG30598@hovland.org>
	<459784AC.2030908@dominion.kabel.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <459784AC.2030908@dominion.kabel.utwente.nl>
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
X-List-Received-Date: Sun, 31 Dec 2006 11:12:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 31, 2006 at 10:36:44AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Erik Hovland schreef:
> > On Sat, Dec 30, 2006 at 11:07:57PM +0100, Koen Kooi wrote:
> >>> On Sat, Dec 30, 2006 at 07:19:29PM +0000, Richard Purdie wrote:
> >>>> It does mean you shouldn't be committing changes locally via monotone.
> >>>> If you do this you will have to pull and then merge every time. That
> >>>> isn't a problem in itself but if you do get direct commit access, we
> >>>> will not be happy adding hundreds of extra merges to the main
> >>>> repository.
> >>> WTF?  Why are you using a distributed revision control system, if I'm not
> >>> supposed to be committing locally?  If everything I do is supposed to be
> >>> bundled up into a patch and sent to the bugzilla, how am I meant to maintain
> >>> my own tree of fixes while I wait for them all to be applied to dev?  Quilt? 
> >>> That might make sense if I'm stuck interacting with SVN, but with a DRCS in
> >>> the mix I expect *it* to be able to take on that role.
> >> Do what virtually every DSCM does to support that: make a branch
> > 
> > Strange. Git nor mercucial require you to branch.
> 
> Actually git branches the moment when you pull, it just hides that.

That's what bzr and darcs do, too.  You can't really have a DRCS without
either implicit or explicit branching on retrieval.  In reality, monotone is
branching implicitly just like git, bzr, and darcs.  It's just that monotone
has two levels of branching: "heads", which are nothing more than unnamed
microbranches, and the more coarse-grained named branch.

- Matt


