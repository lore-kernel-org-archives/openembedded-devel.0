Received: from [70.85.129.92] (helo=sasquatch.hezmatt.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mpalmer@hezmatt.org>) id 1H0o7r-00073v-Ae
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Dec 2006 01:00:38 +0100
Received: from [10.6.66.6] (helo=hezmatt.org)
	by sasquatch.hezmatt.org with esmtp (Exim 3.35 #1 (Debian))
	id 1H0o73-0003j4-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Dec 2006 10:59:42 +1100
Received: by hezmatt.org (Postfix, from userid 1000)
	id A70824AE70; Sun, 31 Dec 2006 10:59:38 +1100 (EST)
Date: Sun, 31 Dec 2006 10:59:38 +1100
From: Matthew Palmer <mpalmer@hezmatt.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061230235938.GC16490@hezmatt.org>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <4596E33D.306@dominion.kabel.utwente.nl>
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
X-List-Received-Date: Sun, 31 Dec 2006 00:00:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 30, 2006 at 11:07:57PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Matthew Palmer schreef:
> > On Sat, Dec 30, 2006 at 07:19:29PM +0000, Richard Purdie wrote:
> 
> >> It does mean you shouldn't be committing changes locally via monotone.
> >> If you do this you will have to pull and then merge every time. That
> >> isn't a problem in itself but if you do get direct commit access, we
> >> will not be happy adding hundreds of extra merges to the main
> >> repository.
> > 
> > WTF?  Why are you using a distributed revision control system, if I'm not
> > supposed to be committing locally?  If everything I do is supposed to be
> > bundled up into a patch and sent to the bugzilla, how am I meant to maintain
> > my own tree of fixes while I wait for them all to be applied to dev?  Quilt? 
> > That might make sense if I'm stuck interacting with SVN, but with a DRCS in
> > the mix I expect *it* to be able to take on that role.
> 
> Do what virtually every DSCM does to support that: make a branch

You seem right on with that "virtually" bit:

$ mtn help |grep -i branch
$

Oh, commit with a --branch option.  Cute, if not exactly discoverable. 
Monotone certainly seems to have read from the Tom Lord manual of Interface
Design.

Note also that Richard said that I shouldn't be doing *any* commits locally
-- no mention of branching or any other way to take advantage of the
benefits of a DRCS.  (Not having a go at you, Richard, just explaining my
thought processes.)

So having solved The Mystery Of The Branch, how do I make the completed
branch available for the core devs to merge back into the trunk?  (If it
involves copying a huge monotone database to my webserver and running
mtnserve, I'll just give up now -- I don't have the resources to spare for
that).  What's the naming policy for branches -- presumably, since my branch
names will end up "polluting" the main database if you propagate my changes,
I can't just go naming my branches any old thing (since it appears that it's
a single global namespace for branches).  How do I manage separate feature
branches (so that each branch is kept clean for merging) while still having
a comglomerate branch I can use for building from?  I suppose I can
propagate each feature branch back into a dirty work branch, but that just
seems... labour-intensive.

Do you understand my frustration?  I know what I've got to do, but I can't
find any docs in the wiki that cater to anyone other than OE core devs
(MonotonePhraseBook) -- which I'm certainly not going to be any time soon --
so I'm left either working everything out from first principles (wasting
time that I could be spending fixing things, not to mention making a pile of
screwups -- like committing to the main branch, creating a second head -- in
the meantime), writing slightly pissy e-mails on mailing lists (and getting
equally pissy responses back), or just giving up, converting the dev branch
to darcs, and not bothering to contribute my fixes back in any meaningful
manner because it's just Too Damn Hard.

In short, how do *you* want to be worked with?  I'm happy to work in
whatever reasonable way works best for you, but I need to know what that
process is first.

- Matt

-- 
It fsck's the volume or it gets the format again.
		-- Don Quixote, in the Monastery


