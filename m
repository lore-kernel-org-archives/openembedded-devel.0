Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1NUSVk-0004e1-PP
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 23:13:24 +0100
Received: by pwj3 with SMTP id 3so76105pwj.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 14:11:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.142.121.15 with SMTP id t15mr950363wfc.66.1263247871165; Mon, 
	11 Jan 2010 14:11:11 -0800 (PST)
In-Reply-To: <ac9c93b11001111254j4a52b1a8xb6fa1c6c3a9567d6@mail.gmail.com>
References: <18e217241001110959k4d346f05j7e00c36dfd18021d@mail.gmail.com>
	<1263236290.22868.33.camel@andromeda> <hig2fe$ui2$1@ger.gmane.org>
	<ac9c93b11001111254j4a52b1a8xb6fa1c6c3a9567d6@mail.gmail.com>
Date: Mon, 11 Jan 2010 14:11:11 -0800
Message-ID: <18e217241001111411o60bfba3cxc7477fa9ea31e513@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: dependencies between packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jan 2010 22:13:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 11, 2010 at 12:54 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/1/11 Koen Kooi <k.kooi@student.utwente.nl>:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 11-01-10 19:58, Michael 'Mickey' Lauer wrote:
> >
> >> I would welcome such a mode that automatically rebuilds all depending
> >> packages, however as this could dramatically increase build time it
> >> would need to be optional. BitBake hackers, what do you think?
> >
> > Bitbake already has such a mechanism and like I mentioned earlier in
> > this thread, it's of limited use, since the PRs won't get changed, so
> > from a DISTRO POV you still need to manually increment each affected PR
> > or bump DISTRO_PR, which will rebuild everything.
> > And even if we could bump PR automatically, we need a way to distribute
> > that too all buildhosts.
> >
> > And yes, I'm cranky because I need exactly this to deal with the bzip2
> > SOVERSION fallout :/
> >
> > regards,
> >
> > Koen
> >
>
> One way to resolve this without bumping all the PR's would be to
> record the PRs of all pacakges it depends on.  (direct and indirect).
> If you rebuild a package and any of the depends packages has a PR that
> is increased, the package is rebuild, even if PR is not changed.
> Another way could be to use the timestamps. If the staging timestamp
> of a package one depends on is newer than the last build of the
> package itself it is rebuild.
> And a third way is to compute all packages that depend on another
> package and rebuild those when the package is changed. However that
> would probably rebuild way too much (everyone depends on glibc so if
> that changes this would become a bitbake world).
>
> However, I think the problem is not the rebuilding of packages, but
> more the deployment of packages. Currently PV + PR are used to
> determine if an upgrade is needed and that kinda gets lost (unless
> opkg also has a version or time check; yuk)..
>
> Frans.
>
>  Really I'm thinking of this in terms of how a developer works on a
particular build of an image.

in the code-compile-debug-code-compile-debug cycle, engineers are modifying
code and then rebuilding an image.

If the change (in the source code) is an internal one, and no object from
that package are lined statically into any other dependent packages, then
we're golden. just remake the image and boot, or reinstall the new package.

But, I have two use cases that my developers are griping about:

1) if an api is changed in say a library or driver (or the kernel itself)
2) if the package contains an object or library that is statically linked
into other objects in other packages.

Then we have to rebuild the dependent packages. While #1 may be rather rare,
#2 could be every time in the case for some of our driver team who bundle
various unrelated drivers together in one kernel module for efficiency
reasons.

Further, it seems as thou you all have been concerned about bumping a
revision number, which from my understanding will cause the entire recipe to
be rerun starting from setscene. Well, in the case of a developer doing a
code-compile-debug cycle, we really just want to rerun the dependent recipes
starting from the compile task.

In general, I'd be looking for two things in particular:
1) a way to closely couple a group of recipes so that if one changed, then
all would be rebuilt (but that might not result in the entire list of
dependent recipes to be re-built).
2) to cause the dependent recipes to be rerun from the compile (or possibly
the configure)... this way the makefiles would pick up timestamps of
(staged) libraries and headers that are out of date, rather than causing a
total rebuilt.

is there not a way to simply run through the dependency list and touch the
patch or configure timestamp of dependent packages of a recently re-compiled
package? If this was an extra step (task) such as

bitbake -c update-compile-deps  mylibrary

