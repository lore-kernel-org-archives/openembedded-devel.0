Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HOAt0-0008Ox-Kf
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 11:57:46 +0100
Received: from [172.20.0.21] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l25Autox032558; Mon, 5 Mar 2007 11:56:57 +0100
Message-ID: <45EBF776.3090505@dominion.kabel.utwente.nl>
Date: Mon, 05 Mar 2007 11:56:54 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: Harald Welte <laforge@openmoko.org>
References: <45E6EA03.8040804@dominion.kabel.utwente.nl>
	<20070304221355.GM25845@prithivi.gnumonks.org>
In-Reply-To: <20070304221355.GM25845@prithivi.gnumonks.org>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
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
X-List-Received-Date: Mon, 05 Mar 2007 10:57:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

[DANGER: cross-post]

Harald Welte schreef:
> On Thu, Mar 01, 2007 at 03:58:11PM +0100, Koen Kooi wrote:

>> What are the plans, and how can the community help with carrying those out?
> 
> Our current agenda is more focussed on "getting things working at all"
> rather than "doing everything correct in the first run".  I wish it was
> different, but we're really under a lot of pressure here.
> 
> As far as the buildsystem is addressed, there are some distinct features
> which we're lacking currently.  I have hired an experienced python
> hacker to add those things properly to bitbake and then talk to you guys
> about how this code can be merged.
> 
> Our primary requirements, with regard to the build system, are:
> 
> 1) do proper and reliable caching, dependency resolving, and decisions
>    on when to build what, while staying in-sync with upstream
>    repositories.  We're working on somce code that adds methods to the
>    fetchers (so far: only svn) to determine the 'last changed date' of
>    the upstream repo.  Then we create a string as concatentation of all
>    source uri repositories, and use that as PR.  This gets rid of the
>    bogus timestamps and neverending rebuilds of the same source code.
> 
>    Also, the tarballs in 'sources' (which get mirrored to
>    downloads.openmoko.org/sources) will then contain e.g. the svn
>    revision number, not the checkout date.
> 
>    This whole logic will be optional, and only be active for
>    SRCDATE="now" packages.
> 
>    Using this method we can e.g. only rebuild the uboot package if
>    either upstream git or our quilt patchset in svn have changed.
> 
>    I know this might conflict with where bitbake is heading, or what is
>    currently in 1.7.x.  We will investigate this later, once we have
>    something that fits our needs first.  I know this is very
>    un-free-software-like, but we really are short of months of time [and
>    staff] and have to compromise somewhere.
> 
> 2) run automatized builds on one of our buildhosts, continuously,
>    sending reports about build failures directly into bugzilla.

Holger has modified(/rewritten) tinderbox code to do such a thing. It need a recent
bugzilla with xmlrpc turned on.


> 3) find a cleaner way for the deploy/images directory.  There need to be
>    per-release symlinks so that an automatized flashing tool can always
>    assume that the current kernel for one release/snapshot/branch has a
>    fixed name (can be symlinks). 

Ok, that's not too hard, I recall Richard making a start with that for the zaurus machines.

>    Also, the statically linked native
>    openocd, dfu-util and sjf2410 binaries need to go to a different
>    directory.

Rod is looking into proper statical linking. We probably need a DEPLOY_DIR_TOOLS or
something where the tools will live.


> 4) find a way how to correctly clean up packages after a build.

s/packages/images/

>    Something like: If I rebuild a kernel uImage, then only the most current
>    one is supposed to be in 'images', older ones get moved to 'attic'.

That one is a bit nasty, since people might want to have it all in one dir, and might
freak out when OE moves it away to another dir. I'm not one of those people :)


> 5) find a way how to completely clean up a package, including all

s/package/recipe/

>    related download cache, bitbake rule cache, .ipk's and/or 'images'
>    that it created

Holger and I discussed something like that for the packaged-staging project, but we didn't
come up with a clean way to present it to the user. That was last year, and I'm sure
others can come up with something.


> 6) find how how we can automatically create a full 'snapshot' from a
>    current build-directory, by just using the latest version of every
>    kerne/uboot image and .ipk

What kind of snapshot are you talking about? A flashable image, a tarball or the OE
recipes, ... , ... ?


> 7) related: reimplement ipkg backend to use some indexed database. It's
>    just too slow

You can make it about twice as fast by doing:

for i in `find . -name Packages` ; do grep -v ^Source: $i|gzip -c9>$i.gz ;gunzip -c
$i.gz>$i ; done

Marcin looked at it briefly, and it seems that using an sqlite3 database will use up the
same size for the list of available packages.

> 8) think about signing binary packages and feeds plus signature
>    verification on the device

That'd be nice and can probably implementing within the current control file format.


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF6/d2MkyGM64RGpERAuuoAKCPPoGoWwlrDMPLOxPQsWn1XZslsgCff9Im
EXlcf1BGqRgLBrxsBxvRpU8=
=rBfW
-----END PGP SIGNATURE-----


