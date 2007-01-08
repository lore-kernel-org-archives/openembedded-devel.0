Received: from [64.233.184.236] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1H3zvT-0004mN-TO
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jan 2007 20:12:56 +0100
Received: by wr-out-0506.google.com with SMTP id i31so149241wra
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jan 2007 11:11:15 -0800 (PST)
Received: by 10.78.183.15 with SMTP id g15mr4191164huf.1168283474097;
	Mon, 08 Jan 2007 11:11:14 -0800 (PST)
Received: by 10.78.39.8 with HTTP; Mon, 8 Jan 2007 11:11:13 -0800 (PST)
Message-ID: <432beae0701081111n490d67e2oebcaf44f4fe45e04@mail.gmail.com>
Date: Mon, 8 Jan 2007 11:11:13 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1168280937.4526.32.camel@ip6-localhost>
MIME-Version: 1.0
References: <20061230051641.GA30225@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230235938.GC16490@hezmatt.org>
	<1167523571.5626.59.camel@localhost.localdomain>
	<459786C7.70000@dominion.kabel.utwente.nl>
	<1168200264.15021.54.camel@ip6-localhost>
	<1662139633.20070107231632@gmail.com>
	<20070107220333.GC6625@hezmatt.org>
	<432beae0701071446p377665c8x810644467cf7f234@mail.gmail.com>
	<1168280937.4526.32.camel@ip6-localhost>
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
X-List-Received-Date: Mon, 08 Jan 2007 19:12:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/8/07, Patrick Ohly <Patrick.Ohly@gmx.de> wrote:
> On Sun, 2007-01-07 at 14:46 -0800, Justin Patrin wrote:
> > One thing I could see us doing is possibly comitting a patch as-is and
> > then making changes and comitting that. (Of course, we wouldn't push
> > until it's all finished) but I don't know how well that will merge.
>
> I think it would merge as well (or bad) as committing to a branch first.
> The reason why I didn't mention this possibility is that it means that
> the core developer's revision of the trunk gets temporarily "polluted"
> with an unchecked and possibly incomplete patch. That might prevent
> finishing and pushing some other, more important work. I also don't know
> how easy it would be to back out the patch completely.

I'm not sure what making another branch realy buys here. In fact, I'm
not even sure how monotone is happily merging your conflicts seeing as
the patch would still be coming from 2 places. If a contributor makes
a change in their own branch and then it's comitted seperately to .dev
then they're 2 different revisions.

>
> > Monotone uses the revision graph to deal with merging and your local
> > commit still wouldn't likely be the same revision as what the dev
> > comitted.
>
> I'm on thin ice here because I don't know monotone well enough, but
> isn't a common ancestor enough to do the three-way merge that has a much
> better chance of avoiding merge conflicts? There is guaranteed to be a
> common ancestor for external and core OE developer even if both work
> with branches because both share the same OE trunk.

With my workflow you have a common *revision* and this means that
monotone can realy do the merge work for you.

>
> > Hmmm, now that I think of it this workflow might work:
> >
> > Contributor:
> > 1) notes current (.dev) revision they are using in their workspace
> > 2) makes changes
>
> As you said, this assumes that the contributor always develops the patch
> against the oe.dev branch. The more likely situation with an active
> contributor is that he has multiple pending patches that he needs to
> continue with his work. He might store them using quilt/patcher or in a
> monotone branch, but in either case the base revision of a patch is not
> something found on the oe.dev branch.

This is easily solveable. The contributor can use the latest official
.dev rev and make their patch, then commit. Once this is done they can
merge/propagate to their own branch.

>
> > OE dev (assuming patch and change is ok):
> > 5) updates their workspace to revision from 1)
>
> Even if the contributor is able to provide a revision, isn't that going
> to be a lot slower for the core developer? It implies going back to an
> older revision and then recompiling all sources necessary to check the
> patch (okay, that could be skipped, but that's not desirable).

Updating to an older revision isn't hard. It's about the same thing as
doing a new checkout or creating a new branch.

>
> In my "temporarily branch on commit" proposal the developer would be
> able to keep working with the currently checked out and compiled
> revision of the meta data, although admittedly reusing the same branch
> name requires some more thought - I'm not exactly sure how to do that
> with monotone.
>

As long as we create the same revision, merging is going to be much
simpler. Even if a dev has to go "back" to commit the patch then they
can simply merge with head and be back up to current.

> Anyway, all of this is idle speculation unless one or more of the core
> developers are willing to adopt such a method.
>

Some comments from monotone developers would be nice. Nathaniel, are
you listening?

-- 
Justin Patrin


