Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H0oAc-00078e-8E
	for openembedded-devel@openembedded.org; Sun, 31 Dec 2006 01:03:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBV02Qqe011236
	for <openembedded-devel@openembedded.org>; Sun, 31 Dec 2006 00:02:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10921-05 for <openembedded-devel@openembedded.org>;
	Sun, 31 Dec 2006 00:02:23 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kBV02N0s011228
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 31 Dec 2006 00:02:23 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20061230234052.GB16490@hezmatt.org>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230230834.GG30598@hovland.org>
	<20061230234052.GB16490@hezmatt.org>
Date: Sun, 31 Dec 2006 00:02:26 +0000
Message-Id: <1167523346.5626.56.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Sun, 31 Dec 2006 00:03:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2006-12-31 at 10:40 +1100, Matthew Palmer wrote:
> On Sat, Dec 30, 2006 at 03:08:34PM -0800, Erik Hovland wrote:
> > On Sat, Dec 30, 2006 at 11:07:57PM +0100, Koen Kooi wrote:
> > > > On Sat, Dec 30, 2006 at 07:19:29PM +0000, Richard Purdie wrote:
> > > 
> > > >> It does mean you shouldn't be committing changes locally via monotone.
> > > >> If you do this you will have to pull and then merge every time. That
> > > >> isn't a problem in itself but if you do get direct commit access, we
> > > >> will not be happy adding hundreds of extra merges to the main
> > > >> repository.
> > > > 
> > > > WTF?  Why are you using a distributed revision control system, if I'm not
> > > > supposed to be committing locally?  If everything I do is supposed to be
> > > > bundled up into a patch and sent to the bugzilla, how am I meant to maintain
> > > > my own tree of fixes while I wait for them all to be applied to dev?  Quilt? 
> > > > That might make sense if I'm stuck interacting with SVN, but with a DRCS in
> > > > the mix I expect *it* to be able to take on that role.
> > > 
> > > Do what virtually every DSCM does to support that: make a branch
> > 
> > Strange. Git nor mercucial require you to branch.
> 
> Add darcs and bzr to the "no need to explicitly branch" list.  But then
> again, it's not a fundamental failing of the tool if you need to say "Please
> branch now", especially when, like monotone, you've got the ability to have
> this "micro-branch" thing with the multiple "heads".

You don't have to branch. It simply means you will have to merge every
time you pull from upstream. This is the same as git, I'm not familiar
with the others. All I've tried to do it make you aware of what you're
doing and which a) you will need to always merge after pulling and b)
why you won't be allowed to push to trunk with such a repository. If
neither thing concerns you, please go ahead.

This isn't a unique problem to monotone. git handles this by allowing
you to rebase commits against a new base revision. I'm not sure if
monotone has a way to handle this or not. If it doesn't, it should have
but that is something for the monotone people to consider.

As for the problem of patch interchange using the actual SCM without
trunk write access, this is something that needs careful thought. You
can share a repository and I guess we'd pull into a local branch, then
merge with trunk. I'd be interested in the monotone people's thoughts on
how to handle this tbh. Currently we have no good solution but it would
be nice to have one. Its probably an education problem on both ends.
FWIW, the linux kernel has similar issues with git and developers still
exchange patches rather than git repositories. 

Richard





