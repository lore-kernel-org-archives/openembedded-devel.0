Received: from [213.95.27.120] (helo=ganesha.gnumonks.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <laforge@openmoko.org>) id 1HOEMi-0000el-66
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 15:40:40 +0100
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.50)
	id 1HOEMh-0007fe-Uj
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 15:40:39 +0100
Received: from laforge by prithivi.gnumonks.org with local (Exim 3.36 #1)
	id 1HOEHL-0007pX-00; Mon, 05 Mar 2007 15:35:07 +0100
Date: Mon, 5 Mar 2007 15:35:07 +0100
From: Harald Welte <laforge@openmoko.org>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20070305143506.GF25845@prithivi.gnumonks.org>
References: <45E6EA03.8040804@dominion.kabel.utwente.nl>
	<20070304221355.GM25845@prithivi.gnumonks.org>
	<45EBF776.3090505@dominion.kabel.utwente.nl>
	<1173104599.5842.62.camel@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1173104599.5842.62.camel@localhost.localdomain>
User-Agent: Mutt/1.5.13 (2006-08-11)
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
X-List-Received-Date: Mon, 05 Mar 2007 14:40:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 05, 2007 at 02:23:19PM +0000, Richard Purdie wrote:
> > > As far as the buildsystem is addressed, there are some distinct features
> > > which we're lacking currently.  I have hired an experienced python
> > > hacker to add those things properly to bitbake and then talk to you guys
> > > about how this code can be merged.
> 
> Could the experienced python hacker at least talk to the active bitbake
> developers before they go too far with this as it might be we can help
> each other and save time. I'd hate to see two implementations
> duplicating effort. I'm also a bit upset we're only learning of this
> through a forwarded email and were not approached directly.

IIRC, mickey said he wold ping you, but maybe that just got lost before
he went on holidays.  It has been an awfully busy time.

And please don't be too upset.  The time loss will be ours, i.e. a
monetary loss.  We're committed to do whatever changes/merging required
even after our initial 1.6.x implementation.

As indicated, we need this yesterday, and that's why we just do what we
think is right, even though that might be a one-way road and we might
have to do it differently at some later point, when there's less of a
time constraint and more time for actual design discussions and the
like.

> Is this developer looking at all these issues or just the bitbake ones?

unclear, will be decided upon once the bitbake ones are solved

> > > Our primary requirements, with regard to the build system, are:
> > > 
> > > 1) do proper and reliable caching, dependency resolving, and decisions
> > >    on when to build what, while staying in-sync with upstream
> > >    repositories.  We're working on somce code that adds methods to the
> > >    fetchers (so far: only svn) to determine the 'last changed date' of
> > >    the upstream repo.  Then we create a string as concatentation of all
> > >    source uri repositories, and use that as PR.  This gets rid of the
> > >    bogus timestamps and neverending rebuilds of the same source code.
> > > 
> > >    Also, the tarballs in 'sources' (which get mirrored to
> > >    downloads.openmoko.org/sources) will then contain e.g. the svn
> > >    revision number, not the checkout date.
> > > 
> > >    This whole logic will be optional, and only be active for
> > >    SRCDATE="now" packages.
> > > 
> > >    Using this method we can e.g. only rebuild the uboot package if
> > >    either upstream git or our quilt patchset in svn have changed.
> > > 
> > >    I know this might conflict with where bitbake is heading, or what is
> > >    currently in 1.7.x.  We will investigate this later, once we have
> > >    something that fits our needs first.  I know this is very
> > >    un-free-software-like, but we really are short of months of time [and
> > >    staff] and have to compromise somewhere.
> 
> There were significant fetcher changes in 1.7.x. I wouldn't suggest
> trying to implement this against 1.6.x for that reason but it would mean
> upgrading your bitbake which is probably out of the question.

we're aware of this, still we want to add it to 1.6.x first (I'm now
testing 1.6.6) before going ahead with 1.7/1.8.  Don't worry, _we_ will
take care of the fallout and merging.

> FWIW, bitbake is shaping up for a stable 1.8.x series now.

yes, we've noticed that.

> > > 3) find a cleaner way for the deploy/images directory.  There need to be
> > >    per-release symlinks so that an automatized flashing tool can always
> > >    assume that the current kernel for one release/snapshot/branch has a
> > >    fixed name (can be symlinks). 
> > 
> > Ok, that's not too hard, I recall Richard making a start with that for the zaurus machines.
> 
> Its not Zaurus specific and I have this working in poky for all its
> images/kernels. Its relatively simple to do.

is that available as bbclass or how do we activate that feature?

> > Rod is looking into proper statical linking. We probably need a DEPLOY_DIR_TOOLS or
> > something where the tools will live.
> 
> This is certainly easily fixed.

yes, we'll look into it 

> > > 4) find a way how to correctly clean up packages after a build.
> > 
> > s/packages/images/
> > 
> > >    Something like: If I rebuild a kernel uImage, then only the most current
> > >    one is supposed to be in 'images', older ones get moved to 'attic'.
> > 
> > That one is a bit nasty, since people might want to have it all in one dir, and might
> > freak out when OE moves it away to another dir. I'm not one of those people :)
> 
> Its a case of adding some class which post processes after do_rootfs and
> do_deploy. That way any distro/user that wants to use it can but nobody
> is forced into it. Again, this should be easily implemented.

yes, that's what i thought.

> > > 5) find a way how to completely clean up a package, including all
> > 
> > s/package/recipe/
> > 
> > >    related download cache, bitbake rule cache, .ipk's and/or 'images'
> > >    that it created
> > 
> > Holger and I discussed something like that for the packaged-staging project, but we didn't
> > come up with a clean way to present it to the user. That was last year, and I'm sure
> > others can come up with something.
> 
> This needs packaged staging which is quite an effort. Please do discuss
> this before implementation as we've tried things before and know roughly
> how this can work.

ok, will do.  this is less important at the moment.

> > > 7) related: reimplement ipkg backend to use some indexed database. It's
> > >    just too slow
> 
> Are we talking about on device use or use during image generation? On
> device is tricky but there are simple ways of speeding up image
> generation that just need implementation.

image generation is not an issue at all.  

We're talking about on-device use which is way too slow for our needs,
especially considering the number of packages and that we'll have a GUI
application in front/on top, in addition to that.

If there are existing plans/ideas in this area, or somebody with some
ipkg background has a good proposal and wants to implement it as paid
contractor, this would be the time to talk about it.

-- 
- Harald Welte <laforge@openmoko.org>          	        http://openmoko.org/
============================================================================
Software for the world's first truly open Free Software mobile phone


