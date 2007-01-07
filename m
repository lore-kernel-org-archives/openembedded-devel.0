Received: from [66.249.92.174] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1H3goH-0008Oy-IJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jan 2007 23:48:13 +0100
Received: by ug-out-1314.google.com with SMTP id e2so5673070ugf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jan 2007 14:46:38 -0800 (PST)
Received: by 10.78.204.7 with SMTP id b7mr3861652hug.1168209998340;
	Sun, 07 Jan 2007 14:46:38 -0800 (PST)
Received: by 10.78.39.8 with HTTP; Sun, 7 Jan 2007 14:46:38 -0800 (PST)
Message-ID: <432beae0701071446p377665c8x810644467cf7f234@mail.gmail.com>
Date: Sun, 7 Jan 2007 14:46:38 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20070107220333.GC6625@hezmatt.org>
MIME-Version: 1.0
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
X-List-Received-Date: Sun, 07 Jan 2007 22:48:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/7/07, Matthew Palmer <mpalmer@hezmatt.org> wrote:
> On Sun, Jan 07, 2007 at 11:16:32PM +0200, Paul Sokolovsky wrote:
> >   Well, why would OE core developers (err, what about non-core
> > developers - we also care for contributed patches - after all, to get
> > commit access to OE, you first contribute bunch of patches) - well, why
> > would they do that? OE is open-source project, there's no position of
> > "patch processor", and people do what they find useful, leaving some
> > share of their for patch processing. Any complex and artificial rules
> > won't work.
>
> The only reason I can think of for the core devs to follow a particular
> workflow is to make it ultimately easier for external contributors to
> produce and submit patches.  The more external patches that come in, the
> less work the core devs have to do (or the more 'other' things they can do).
> For example, a few days ago Marcin asked for a patch to make a build of a
> newer version of fakeroot; I'd have whipped that patch up by now except that
> I know that it's going to cause a conflict when the change comes back down,
> so I'm loathe to make the change until I work out how I can manage the patch
> flow, because it's going to cause me pain without any benefit.  I'm just not
> that masochistic.
>

You know, instead of adding extra branches and making the workflow mor
complicated for core devs you, as an external contributor, could
follow your patch as it makes it into OE and update your local version
accordingly. That way you also have no conflicts when you propagate or
merge.

One thing I could see us doing is possibly comitting a patch as-is and
then making changes and comitting that. (Of course, we wouldn't push
until it's all finished) but I don't know how well that will merge.
Monotone uses the revision graph to deal with merging and your local
commit still wouldn't likely be the same revision as what the dev
comitted.

Hmmm, now that I think of it this workflow might work:

Contributor:
1) notes current (.dev) revision they are using in their workspace
2) makes changes
3) commits a new revision with those changes
4) creates a patch and opens a bug
OE dev (assuming patch and change is ok):
5) updates their workspace to revision from 1)
6) commits the contributor's patch
7) makes changes to "fix up" patch
8) commits fixed up revision
9) merges with head (if needed)

This way, the revision from 3) is the same as the revision from 6) and
your DB will realize this (from the rev#, which is a SHA1 hash) and
you don't have to merge at all.

This only works if the patch is accepted as-is (if it requires
revision before an OE dev initially commits it you still will have to
manually update your own revision to allow it to merge cleanly) and
assumes that you make all of your changes *directly* on a .dev
revision and not in your own branch. Monotone tracks revisions, not
patches, remember.

It should also be noted that it doesn't take too much to get to be an
OE dev yourself. You can keep your own branch and deal with a few
merge conflicts, then get commit access to OE and commit/push
directly.

-- 
Justin Patrin


