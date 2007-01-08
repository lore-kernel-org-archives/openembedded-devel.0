Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1H41kY-0000XT-IM
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jan 2007 22:09:46 +0100
Received: (qmail invoked by alias); 08 Jan 2007 21:08:06 -0000
Received: from c-134-230-227.f.dsl.de.ignite.net (EHLO ip6-localhost)
	[62.134.230.227]
	by mail.gmx.net (mp027) with SMTP; 08 Jan 2007 22:08:06 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1H41ds-0002Jp-00; Mon, 08 Jan 2007 22:02:52 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <432beae0701081111n490d67e2oebcaf44f4fe45e04@mail.gmail.com>
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
	<432beae0701081111n490d67e2oebcaf44f4fe45e04@mail.gmail.com>
Date: Mon, 08 Jan 2007 22:02:51 +0100
Message-Id: <1168290172.4526.66.camel@ip6-localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
Sender: Patrick Ohly <patrick@gmx.de>
X-Y-GMX-Trusted: 0
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
X-List-Received-Date: Mon, 08 Jan 2007 21:09:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-01-08 at 11:11 -0800, Justin Patrin wrote:
> On 1/8/07, Patrick Ohly <Patrick.Ohly@gmx.de> wrote:
> > On Sun, 2007-01-07 at 14:46 -0800, Justin Patrin wrote:
> > > One thing I could see us doing is possibly comitting a patch as-is and
> > > then making changes and comitting that. (Of course, we wouldn't push
> > > until it's all finished) but I don't know how well that will merge.
> >
> > I think it would merge as well (or bad) as committing to a branch first.
> > The reason why I didn't mention this possibility is that it means that
> > the core developer's revision of the trunk gets temporarily "polluted"
> > with an unchecked and possibly incomplete patch. That might prevent
> > finishing and pushing some other, more important work. I also don't know
> > how easy it would be to back out the patch completely.
> 
> I'm not sure what making another branch realy buys here.

The main point which makes life easier for external contributors is that
the patch is applied as-is and then modified, with all changes recorded
in monotone. However, you are right: the change must be recorded on
trunk. Making it on a branch and then only propagating the result fails,
see below.

>  In fact, I'm
> not even sure how monotone is happily merging your conflicts seeing as
> the patch would still be coming from 2 places.

I don't know exactly why it worked, but it did in a case where the
normal "reapply your patches" method would have failed.

I also tested another scenario that we have mentioned:
      * the contributor creates two patches changing the same file and
        submits them separately because they fix different problems
        while at the same time commiting them to a private branch
      * a developer commits the first patch literally on the trunk
      * the contributor pulls trunk and propagates to his branch (no
        conflicts)
      * developer commits second patch literally on trunk
      * pulling and propagating again works without conflicts

I think the key reason why this works is that the developer recreates a
revision as it exists on the contributors branch and therefore monotone
doesn't really have to do anything.

Let's try a more complicated scenario:
      * the contributor makes a change to one file, submits patch
      * he makes another change to another file, submits patch
      * OE developer accepts first patch into trunk, then modifies it
      * pulling and propagating to private branch works without
        conflicts, but this time monotone created a merged version that
        the contributor can update to
      * OE developer commits second patch
      * contributor can pull + propagate and his private branch is
        identical with trunk again

Finally a last one:
      * the contributor makes a change to one file, submits patch
      * he makes another change to another file, submits patch
      * OE developer commits the second patch first, on a branch
      * he modifies the same file to fix it
      * finally propagates to trunk
      * contributor pulls and propagates to private branch => now there
        is a conflict which needs to be resolved manually

Okay, so if there is something to be learned from this, then I suppose
it is this:
      * Contributors, keep your changes in a private branch by using
        "monotone commit -b <your branch name>" the first time you
        commit changes. The branch names is remembered for the current
        working copy, so there is no need to always use the "-b". Use
        "mtn pull && mtn propagate org.openembedded.dev <your branch
        name> && mtn update" to follow the main development.
      * OE developers, please, be kind to your contributors and apply
        patches literally, commit them to org.openembedded.dev and only
        then modify them.

> > > OE dev (assuming patch and change is ok):
> > > 5) updates their workspace to revision from 1)
> >
> > Even if the contributor is able to provide a revision, isn't that going
> > to be a lot slower for the core developer? It implies going back to an
> > older revision and then recompiling all sources necessary to check the
> > patch (okay, that could be skipped, but that's not desirable).
> 
> Updating to an older revision isn't hard. It's about the same thing as
> doing a new checkout or creating a new branch.

But recompiling everything that was modified by going to the other
revision is going to take time.

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/


