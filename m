Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1H3zPT-0004Pc-Mj
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jan 2007 19:39:51 +0100
Received: (qmail invoked by alias); 08 Jan 2007 18:38:11 -0000
Received: from c-134-230-227.f.dsl.de.ignite.net (EHLO ip6-localhost)
	[62.134.230.227]
	by mail.gmx.net (mp002) with SMTP; 08 Jan 2007 19:38:11 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1H3zEv-0001Tn-00; Mon, 08 Jan 2007 19:28:57 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <432beae0701071446p377665c8x810644467cf7f234@mail.gmail.com>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230235938.GC16490@hezmatt.org>
	<1167523571.5626.59.camel@localhost.localdomain>
	<459786C7.70000@dominion.kabel.utwente.nl>
	<1168200264.15021.54.camel@ip6-localhost>
	<1662139633.20070107231632@gmail.com>
	<20070107220333.GC6625@hezmatt.org>
	<432beae0701071446p377665c8x810644467cf7f234@mail.gmail.com>
Date: Mon, 08 Jan 2007 19:28:57 +0100
Message-Id: <1168280937.4526.32.camel@ip6-localhost>
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
X-List-Received-Date: Mon, 08 Jan 2007 18:39:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-01-07 at 14:46 -0800, Justin Patrin wrote:
> One thing I could see us doing is possibly comitting a patch as-is and
> then making changes and comitting that. (Of course, we wouldn't push
> until it's all finished) but I don't know how well that will merge.

I think it would merge as well (or bad) as committing to a branch first.
The reason why I didn't mention this possibility is that it means that
the core developer's revision of the trunk gets temporarily "polluted"
with an unchecked and possibly incomplete patch. That might prevent
finishing and pushing some other, more important work. I also don't know
how easy it would be to back out the patch completely.

> Monotone uses the revision graph to deal with merging and your local
> commit still wouldn't likely be the same revision as what the dev
> comitted.

I'm on thin ice here because I don't know monotone well enough, but
isn't a common ancestor enough to do the three-way merge that has a much
better chance of avoiding merge conflicts? There is guaranteed to be a
common ancestor for external and core OE developer even if both work
with branches because both share the same OE trunk.

> Hmmm, now that I think of it this workflow might work:
> 
> Contributor:
> 1) notes current (.dev) revision they are using in their workspace
> 2) makes changes

As you said, this assumes that the contributor always develops the patch
against the oe.dev branch. The more likely situation with an active
contributor is that he has multiple pending patches that he needs to
continue with his work. He might store them using quilt/patcher or in a
monotone branch, but in either case the base revision of a patch is not
something found on the oe.dev branch.

> OE dev (assuming patch and change is ok):
> 5) updates their workspace to revision from 1)

Even if the contributor is able to provide a revision, isn't that going
to be a lot slower for the core developer? It implies going back to an
older revision and then recompiling all sources necessary to check the
patch (okay, that could be skipped, but that's not desirable).

In my "temporarily branch on commit" proposal the developer would be
able to keep working with the currently checked out and compiled
revision of the meta data, although admittedly reusing the same branch
name requires some more thought - I'm not exactly sure how to do that
with monotone.

Anyway, all of this is idle speculation unless one or more of the core
developers are willing to adopt such a method.

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/


