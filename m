Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HOFOl-0003bd-7K
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 16:46:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l25FkgS6030112;
	Mon, 5 Mar 2007 15:46:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29504-06; Mon,  5 Mar 2007 15:46:39 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l25FkZUk030097
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 5 Mar 2007 15:46:35 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Harald Welte <laforge@openmoko.org>
In-Reply-To: <20070305143506.GF25845@prithivi.gnumonks.org>
References: <45E6EA03.8040804@dominion.kabel.utwente.nl>
	<20070304221355.GM25845@prithivi.gnumonks.org>
	<45EBF776.3090505@dominion.kabel.utwente.nl>
	<1173104599.5842.62.camel@localhost.localdomain>
	<20070305143506.GF25845@prithivi.gnumonks.org>
Date: Mon, 05 Mar 2007 15:46:35 +0000
Message-Id: <1173109595.5842.88.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org, distro-devel@lists.openmoko.org
Subject: Re: Merging openmoko into OE
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
X-List-Received-Date: Mon, 05 Mar 2007 15:46:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-03-05 at 15:35 +0100, Harald Welte wrote:
> On Mon, Mar 05, 2007 at 02:23:19PM +0000, Richard Purdie wrote:
> > > > As far as the buildsystem is addressed, there are some distinct features
> > > > which we're lacking currently.  I have hired an experienced python
> > > > hacker to add those things properly to bitbake and then talk to you guys
> > > > about how this code can be merged.
> > 
> > Could the experienced python hacker at least talk to the active bitbake
> > developers before they go too far with this as it might be we can help
> > each other and save time. I'd hate to see two implementations
> > duplicating effort. I'm also a bit upset we're only learning of this
> > through a forwarded email and were not approached directly.
> 
> IIRC, mickey said he wold ping you, but maybe that just got lost before
> he went on holidays.  It has been an awfully busy time.

Mickey mentioned something very briefly about a problem but he was in a
hurry and I'd actually misunderstood the problem looking at this :/. I
also thought he'd found a solution that worked for now meaning more time
could be spent solving it properly.

In future, please do send a mail to the bitbake development list if
there are problems like this.  

> And please don't be too upset.  The time loss will be ours, i.e. a
> monetary loss.  We're committed to do whatever changes/merging required
> even after our initial 1.6.x implementation.

Fair enough, I understand the problem.

> > FWIW, bitbake is shaping up for a stable 1.8.x series now.
> 
> yes, we've noticed that.

Even if you don't switch to using 1.8.x, it would be good if you did
have time to test it and let us known what (if any :) issues you have
with it. I'm about to send something to the lists requesting testing
before we release 1.8.0.

> > > > 3) find a cleaner way for the deploy/images directory.  There need to be
> > > >    per-release symlinks so that an automatized flashing tool can always
> > > >    assume that the current kernel for one release/snapshot/branch has a
> > > >    fixed name (can be symlinks). 
> > > 
> > > Ok, that's not too hard, I recall Richard making a start with that for the zaurus machines.
> > 
> > Its not Zaurus specific and I have this working in poky for all its
> > images/kernels. Its relatively simple to do.
> 
> is that available as bbclass or how do we activate that feature?

It should just work but I suspect the changes haven't all been merged
from poky -> OE.dev though (just due to lack of time). I'll look into
it.

> > > > 5) find a way how to completely clean up a package, including all
> > > 
> > > s/package/recipe/
> > > 
> > > >    related download cache, bitbake rule cache, .ipk's and/or 'images'
> > > >    that it created
> > > 
> > > Holger and I discussed something like that for the packaged-staging project, but we didn't
> > > come up with a clean way to present it to the user. That was last year, and I'm sure
> > > others can come up with something.
> > 
> > This needs packaged staging which is quite an effort. Please do discuss
> > this before implementation as we've tried things before and know roughly
> > how this can work.
> 
> ok, will do.  this is less important at the moment.

This is a long term project aim for OpenEmbedded (and me personally)
since it doesn't just solve this problem but solves a number of others
too. It would be great to see it developed.

> > > > 7) related: reimplement ipkg backend to use some indexed database. It's
> > > >    just too slow
> > 
> > Are we talking about on device use or use during image generation? On
> > device is tricky but there are simple ways of speeding up image
> > generation that just need implementation.
> 
> image generation is not an issue at all.  
> 
> We're talking about on-device use which is way too slow for our needs,
> especially considering the number of packages and that we'll have a GUI
> application in front/on top, in addition to that.
> 
> If there are existing plans/ideas in this area, or somebody with some
> ipkg background has a good proposal and wants to implement it as paid
> contractor, this would be the time to talk about it.

I think lots of people, me included have looked at the ipkg code and
wanted to see it rewritten with something like a sqlite backend rather
than parsing its ascii files all the time.

Cheers,

Richard





