Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HOE6P-0000LX-TP
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 15:23:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l25ENQWN021733;
	Mon, 5 Mar 2007 14:23:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21070-07; Mon,  5 Mar 2007 14:23:23 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l25ENJLQ021714
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 5 Mar 2007 14:23:19 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45EBF776.3090505@dominion.kabel.utwente.nl>
References: <45E6EA03.8040804@dominion.kabel.utwente.nl>
	<20070304221355.GM25845@prithivi.gnumonks.org>
	<45EBF776.3090505@dominion.kabel.utwente.nl>
Date: Mon, 05 Mar 2007 14:23:19 +0000
Message-Id: <1173104599.5842.62.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Harald Welte <laforge@openmoko.org>, distro-devel@lists.openmoko.org
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
X-List-Received-Date: Mon, 05 Mar 2007 14:23:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-03-05 at 11:56 +0100, Koen Kooi wrote:
> Harald Welte schreef:
> > On Thu, Mar 01, 2007 at 03:58:11PM +0100, Koen Kooi wrote:
> 
> >> What are the plans, and how can the community help with carrying those out?
> > 
> > Our current agenda is more focussed on "getting things working at all"
> > rather than "doing everything correct in the first run".  I wish it was
> > different, but we're really under a lot of pressure here.
> > 
> > As far as the buildsystem is addressed, there are some distinct features
> > which we're lacking currently.  I have hired an experienced python
> > hacker to add those things properly to bitbake and then talk to you guys
> > about how this code can be merged.

Could the experienced python hacker at least talk to the active bitbake
developers before they go too far with this as it might be we can help
each other and save time. I'd hate to see two implementations
duplicating effort. I'm also a bit upset we're only learning of this
through a forwarded email and were not approached directly.

Is this developer looking at all these issues or just the bitbake ones?

> > Our primary requirements, with regard to the build system, are:
> > 
> > 1) do proper and reliable caching, dependency resolving, and decisions
> >    on when to build what, while staying in-sync with upstream
> >    repositories.  We're working on somce code that adds methods to the
> >    fetchers (so far: only svn) to determine the 'last changed date' of
> >    the upstream repo.  Then we create a string as concatentation of all
> >    source uri repositories, and use that as PR.  This gets rid of the
> >    bogus timestamps and neverending rebuilds of the same source code.
> > 
> >    Also, the tarballs in 'sources' (which get mirrored to
> >    downloads.openmoko.org/sources) will then contain e.g. the svn
> >    revision number, not the checkout date.
> > 
> >    This whole logic will be optional, and only be active for
> >    SRCDATE="now" packages.
> > 
> >    Using this method we can e.g. only rebuild the uboot package if
> >    either upstream git or our quilt patchset in svn have changed.
> > 
> >    I know this might conflict with where bitbake is heading, or what is
> >    currently in 1.7.x.  We will investigate this later, once we have
> >    something that fits our needs first.  I know this is very
> >    un-free-software-like, but we really are short of months of time [and
> >    staff] and have to compromise somewhere.

There were significant fetcher changes in 1.7.x. I wouldn't suggest
trying to implement this against 1.6.x for that reason but it would mean
upgrading your bitbake which is probably out of the question.

FWIW, bitbake is shaping up for a stable 1.8.x series now.

> > 3) find a cleaner way for the deploy/images directory.  There need to be
> >    per-release symlinks so that an automatized flashing tool can always
> >    assume that the current kernel for one release/snapshot/branch has a
> >    fixed name (can be symlinks). 
> 
> Ok, that's not too hard, I recall Richard making a start with that for the zaurus machines.

Its not Zaurus specific and I have this working in poky for all its
images/kernels. Its relatively simple to do.

> >    Also, the statically linked native
> >    openocd, dfu-util and sjf2410 binaries need to go to a different
> >    directory.
> 
> Rod is looking into proper statical linking. We probably need a DEPLOY_DIR_TOOLS or
> something where the tools will live.

This is certainly easily fixed.

> > 4) find a way how to correctly clean up packages after a build.
> 
> s/packages/images/
> 
> >    Something like: If I rebuild a kernel uImage, then only the most current
> >    one is supposed to be in 'images', older ones get moved to 'attic'.
> 
> That one is a bit nasty, since people might want to have it all in one dir, and might
> freak out when OE moves it away to another dir. I'm not one of those people :)

Its a case of adding some class which post processes after do_rootfs and
do_deploy. That way any distro/user that wants to use it can but nobody
is forced into it. Again, this should be easily implemented.

> > 5) find a way how to completely clean up a package, including all
> 
> s/package/recipe/
> 
> >    related download cache, bitbake rule cache, .ipk's and/or 'images'
> >    that it created
> 
> Holger and I discussed something like that for the packaged-staging project, but we didn't
> come up with a clean way to present it to the user. That was last year, and I'm sure
> others can come up with something.

This needs packaged staging which is quite an effort. Please do discuss
this before implementation as we've tried things before and know roughly
how this can work.

> > 7) related: reimplement ipkg backend to use some indexed database. It's
> >    just too slow

Are we talking about on device use or use during image generation? On
device is tricky but there are simple ways of speeding up image
generation that just need implementation.

Regards,

Richard





