Received: from [213.95.27.120] (helo=ganesha.gnumonks.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <laforge@openmoko.org>) id 1HOEMi-0000ek-2Q
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 15:40:40 +0100
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.50)
	id 1HOEMh-0007fN-JM
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 15:40:39 +0100
Received: from laforge by prithivi.gnumonks.org with local (Exim 3.36 #1)
	id 1HOBBQ-0007mB-00; Mon, 05 Mar 2007 12:16:48 +0100
Date: Mon, 5 Mar 2007 12:16:48 +0100
From: Harald Welte <laforge@openmoko.org>
To: Koen Kooi <koen@dominion.kabel.utwente.nl>
Message-ID: <20070305111648.GD25845@prithivi.gnumonks.org>
References: <45E6EA03.8040804@dominion.kabel.utwente.nl>
	<20070304221355.GM25845@prithivi.gnumonks.org>
	<45EBF776.3090505@dominion.kabel.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <45EBF776.3090505@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.5.13 (2006-08-11)
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>, distro-devel@lists.openmoko.org
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

On Mon, Mar 05, 2007 at 11:56:54AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> [DANGER: cross-post]

hehe.

> > 2) run automatized builds on one of our buildhosts, continuously,
> >    sending reports about build failures directly into bugzilla.
> 
> Holger has modified(/rewritten) tinderbox code to do such a thing. It need a recent
> bugzilla with xmlrpc turned on.

mh, 'recent bugzilla' sounds not very promising, I'm usually very
reluctant to use anything outside of 'debian stable' since it requires
manual care of security updates, etc.  But I guess this is an important
enough reason to do it.

Is Holgers code available somewhere?

> > 3) find a cleaner way for the deploy/images directory.  There need to be
> >    per-release symlinks so that an automatized flashing tool can always
> >    assume that the current kernel for one release/snapshot/branch has a
> >    fixed name (can be symlinks). 
> 
> Ok, that's not too hard, I recall Richard making a start with that for the zaurus machines.

yes.  The question is: should we put this into our kernel/uboot recipes,
or use some modified kernel.bbclass for it?  or implement it as script
completely outside OE?

> >    Also, the statically linked native
> >    openocd, dfu-util and sjf2410 binaries need to go to a different
> >    directory.
> 
> Rod is looking into proper statical linking. We probably need a DEPLOY_DIR_TOOLS or
> something where the tools will live.

DEPLOY_DIR_TOOLS: good.

> > 4) find a way how to correctly clean up packages after a build.
> 
> s/packages/images/
> 
> >    Something like: If I rebuild a kernel uImage, then only the most current
> >    one is supposed to be in 'images', older ones get moved to 'attic'.
> 
> That one is a bit nasty, since people might want to have it all in one dir, and might
> freak out when OE moves it away to another dir. I'm not one of those people :)

I'm not asking that this becomes a general policy.  I just state that
Openmoko needs this feature, at lest in some scenarios.  So if we can
come up with an option for that.

> > 5) find a way how to completely clean up a package, including all
> 
> s/package/recipe/

> >    related download cache, bitbake rule cache, .ipk's and/or 'images'
> >    that it created
> 
> Holger and I discussed something like that for the packaged-staging
> project, but we didn't come up with a clean way to present it to the
> user. That was last year, and I'm sure others can come up with
> something.

Yes, we will investigate this after 

> > 6) find how how we can automatically create a full 'snapshot' from a
> >    current build-directory, by just using the latest version of every
> >    kerne/uboot image and .ipk
> 
> What kind of snapshot are you talking about? A flashable image, a tarball or the OE
> recipes, ... , ... ?

'snapshot' in this context is defined as the most current of each

1) uboot image
2) kernel image
3) any ipk's that exist 

So basically I want to be able to do incremental builds, where dozens of
versions of images and ipk's accumulate in the 'deploy' and its
subdirectories.  Then when I feel confident that the most recent stuff
is worth as a snapshot that people {testers,developers} should use, I
want to separate those files from all the historical junkt that has
accumulated, without starting another multiple-hour
recompile-everything-from-scratch.

> > 7) related: reimplement ipkg backend to use some indexed database. It's
> >    just too slow
> 
> You can make it about twice as fast by doing:
> 
> for i in `find . -name Packages` ; do grep -v ^Source: $i|gzip -c9>$i.gz ;gunzip -c
> $i.gz>$i ; done
> 
> Marcin looked at it briefly, and it seems that using an sqlite3 database will use up the
> same size for the list of available packages.

Oh, I'm not worried about the size of the list of packages (download
speed), I'm worried about the access times to scan that list.  And any
more indexed format which doesn't require scanning/parsing of all that
ascii data everytime you execute ipkg.

> > 8) think about signing binary packages and feeds plus signature
> >    verification on the device
> 
> That'd be nice and can probably implementing within the current control file format.

great. we'll look into that at some point in the future, before phaes-2
(september) in our terminology.

-- 
- Harald Welte <laforge@openmoko.org>          	        http://openmoko.org/
============================================================================
Software for the world's first truly open Free Software mobile phone


