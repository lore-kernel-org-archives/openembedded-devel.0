Received: from [70.85.129.92] (helo=sasquatch.hezmatt.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mpalmer@hezmatt.org>) id 1H0yRY-00014b-3T
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Dec 2006 12:01:32 +0100
Received: from [10.6.66.6] (helo=hezmatt.org)
	by sasquatch.hezmatt.org with esmtp (Exim 3.35 #1 (Debian))
	id 1H0yQf-0005Fl-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Dec 2006 22:00:37 +1100
Received: by hezmatt.org (Postfix, from userid 1000)
	id C89984AE70; Sun, 31 Dec 2006 22:00:33 +1100 (EST)
Date: Sun, 31 Dec 2006 22:00:33 +1100
From: Matthew Palmer <mpalmer@hezmatt.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061231110033.GA22098@hezmatt.org>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230235938.GC16490@hezmatt.org>
	<1167523571.5626.59.camel@localhost.localdomain>
	<459786C7.70000@dominion.kabel.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <459786C7.70000@dominion.kabel.utwente.nl>
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
X-List-Received-Date: Sun, 31 Dec 2006 11:01:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 31, 2006 at 10:45:43AM +0100, Koen Kooi wrote:
> Richard Purdie schreef:
> > On Sun, 2006-12-31 at 10:59 +1100, Matthew Palmer wrote:
> >> Note also that Richard said that I shouldn't be doing *any* commits locally
> >> -- no mention of branching or any other way to take advantage of the
> >> benefits of a DRCS.  (Not having a go at you, Richard, just explaining my
> >> thought processes.)
> > 
> > This is simply because we have no established way of receiving data
> > through the SCM for merging into trunk without direct write access. As
> > my other email says, I'd like to find a way of supporting that but its
> > probably an education issue on both sides.
> 
> And the fact that we usually have to tweak 80% if the patches we receive.

So you propagate the contributed branch to the dev tree, then make the
changes that are needed to fix it up as a separate changeset.  That
maintains full history for everyone.

> Attaching them to the bugtracker makes it easy to search for, view and
> comment on patches, and most importantly, view their status.

The problem with just dealing in raw patches is that when I'm maintaining my
local tree, a branch of the upstream repo, my patches come back to me after
getting applied upstream without any context, so that I get all manner of
spurious conflicts.  It looks as though all I can do to try and avoid this
is disapprove patches, I can't "unpropagate" a whole branch to prevent the
conflict -- and that assumes that I know in advance that the patch is coming
back down.  Far better to have the SCM do that all for me.

> It doesn't matter which SCM we use with that workflow.

Which does make me wonder why you went with monotone instead of the
lowest-common-denominator, since you don't appear to be using any of
monotone's more interesting features?

- Matt


