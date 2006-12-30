Received: from [70.85.129.92] (helo=sasquatch.hezmatt.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mpalmer@hezmatt.org>) id 1H0m07-0002BE-S0
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Dec 2006 22:44:24 +0100
Received: from [10.6.66.6] (helo=hezmatt.org)
	by sasquatch.hezmatt.org with esmtp (Exim 3.35 #1 (Debian))
	id 1H0lzK-0003Cu-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Dec 2006 08:43:35 +1100
Received: by hezmatt.org (Postfix, from userid 1000)
	id 8CC704ACD8; Sun, 31 Dec 2006 08:43:26 +1100 (EST)
Date: Sun, 31 Dec 2006 08:43:26 +1100
From: Matthew Palmer <mpalmer@hezmatt.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061230214326.GE15188@hezmatt.org>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1167506369.5626.46.camel@localhost.localdomain>
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
X-List-Received-Date: Sat, 30 Dec 2006 21:44:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 30, 2006 at 07:19:29PM +0000, Richard Purdie wrote:
> On Sat, 2006-12-30 at 16:16 +1100, Matthew Palmer wrote:
> > I've hacked on the Ruby bitbake spec so it can build commonly-used
> > extensions like zlib, socket, and openssl.  However, I'm not sure how to go
> > about committing, submitting, and merging this patch with the main OE tree.
> > 
> > What I've done so far:
> > 
> > * Gotten a checkout of the org.openembedded.dev branch;
> > * Made my modifications;
> > * Created a key;
> > * Committed my changes to my working copy.
> > 
> > Now I can't even manage to retrieve the diff of my changes (the 'obvious'
> > step of running "mtn diff -r <SHA1>" didn't do anything useful) to submit
> > them to the bugzilla.  
> 
> I'm not sure what the right command it but you should be able to extract
> that diff somehow, I don't know offhand what the command would be.

Marcin Juszkiewicz gave me the answer in the bugzilla issue I opened
(#1725).  It was... non-trivial.  And I thought tla had a difficult UI...

> > Of course, submitting a context-free patch when
> > you've got a full distributed RCS at your bidding seems a bit archaic
> > anyway.
> > 
> > So, my questions:
> > 
> > * How do I get my diff back?
> > * How do I submit my changes to the OE project for merging?
> > * Will I have problems when the change gets committed to the trunk?
> > * (The biggie) is there a guide on the wiki or somewhere describing the
> >   preferred workflow for making changes and working effectively with the rest
> >   of the OE developer community?  (Google wasn't at all illuminating)
> 
> What you've described is how I or any other OE developer with an
> authorised monotone key would work with OE. The problem is we can't just
> give access to anyone as that wouldn't make any sense for obvious
> reasons.

Yep, you're naturally not going to give trunk access to random people, but
I'm not looking for trunk commit rights.  You're using a distributed
revision control system, in which I should be able to work pretty much
entirely independently, just feeding changesets back for the core devs to
merge.  I don't want, and shouldn't need, core commit rights in order to be
able to do what I want -- that's the beauty of a DRCS.  However, being
unfamiliar with monotone, I need assistance with knowing exactly which
commands I need to be running to do what I need to do.

> It does mean you shouldn't be committing changes locally via monotone.
> If you do this you will have to pull and then merge every time. That
> isn't a problem in itself but if you do get direct commit access, we
> will not be happy adding hundreds of extra merges to the main
> repository.

WTF?  Why are you using a distributed revision control system, if I'm not
supposed to be committing locally?  If everything I do is supposed to be
bundled up into a patch and sent to the bugzilla, how am I meant to maintain
my own tree of fixes while I wait for them all to be applied to dev?  Quilt? 
That might make sense if I'm stuck interacting with SVN, but with a DRCS in
the mix I expect *it* to be able to take on that role.

- Matt


