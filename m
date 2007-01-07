Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <Patrick.Ohly@gmx.de>) id 1H3eKr-0002sG-3e
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jan 2007 21:09:41 +0100
Received: (qmail invoked by alias); 07 Jan 2007 20:08:06 -0000
Received: from c-134-228-76.d.dsl.de.ignite.net (EHLO ip6-localhost)
	[62.134.228.76]
	by mail.gmx.net (mp015) with SMTP; 07 Jan 2007 21:08:06 +0100
X-Authenticated: #489940
Received: from patrick by ip6-localhost with local (Exim 3.36 #1 (Debian))
	id 1H3eFk-0004iZ-00; Sun, 07 Jan 2007 21:04:24 +0100
From: Patrick Ohly <Patrick.Ohly@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <459786C7.70000@dominion.kabel.utwente.nl>
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<20061230235938.GC16490@hezmatt.org>
	<1167523571.5626.59.camel@localhost.localdomain>
	<459786C7.70000@dominion.kabel.utwente.nl>
Date: Sun, 07 Jan 2007 21:04:24 +0100
Message-Id: <1168200264.15021.54.camel@ip6-localhost>
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
X-List-Received-Date: Sun, 07 Jan 2007 20:09:41 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On So, 2006-12-31 at 10:45 +0100, Koen Kooi wrote:
> > This is simply because we have no established way of receiving data
> > through the SCM for merging into trunk without direct write access.
> As
> > my other email says, I'd like to find a way of supporting that but
> its
> > probably an education issue on both sides.
> 
> And the fact that we usually have to tweak 80% if the patches we
> receive.

If you do that, can you commit the patch from the original author
literally on a branch, then apply your own changes which fix it on top
of the original patch and then merge back into the main trunk? I did an
experiment and found that this considerably eases the pain for external
contributors.

The experiment simulated a "worst case" scenario:
      * external author creates a new file
      * OE developer modifies and renames the file before committing to
        the trunk
      * external author updates the trunk and merges automatically
      * => file exists twice with different content; without renaming
        there would be a merge conflict

If external contributor and core OE developers adhere to the following
procedures, then the merge conflict is avoided. The external developer
should:
      * pull official OE monotone database
      * checkout, make changes
      * commit on a personal branch ("mtn commit -b
        personal.branch.name")
      * generate a patch (e.g. "mtn diff -r org.openembedded.dev", be
        more specific if necessary)
      * propose to merge the patch by submitting it in the OE tracker
      * continue working on the personal branch
      * follow upstream changes by propagating them ("mtn propagate
        org.openembedded.dev personal.branch.name" + "mtn update -b
        personal.branch.name")

To accept this contribution, a core OE developer should:
      * apply the original patch ("patch <foo.patch" + "mtn add <new
        files>")
      * commit on a new branch _before_ making any changes to it ("mtn
        commit -b org.openembedded.<developer>.merging")
      * make any required changes on that branch
      * commit, then propagate to org.openembedded.dev

This worked for me in the scenario above where the external developer
had not made further changes on his branch. During propagating the trunk
with patch + changes applied monotone reported that no merging was
necessary and directly made the current head part of the personal
branch. After that, updating the personal branch had all changes. I
suppose it would have worked just as well if merging had been needed
because monotone had all the required information.

One of the disadvantages is the need for another branch. I don't think
it has to be pushed into the official monotone DB, so only the developer
doing the merging needs to know about it. I should even be possible to
reuse the branch in multiple patch/commit/fix/propagate cycles by
propagating the trunk to it before applying changes.

Clearly this puts some extra work on the OE developers, but in exchange
you not only encourage external contributions, you also better document
inside monotone what the original patch was and how you modified it.

What do you think? Did I miss something?

-- 
Bye, Patrick Ohly
--  
Patrick.Ohly@gmx.de
http://www.estamos.de/


