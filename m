Received: from [68.230.241.15] (helo=fed1rmpop111.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1JwwuD-0003eT-6s
	for openembedded-devel@openembedded.org; Fri, 16 May 2008 12:11:17 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20080515220640.EXCX23549.fed1rmmtao105.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 15 May 2008 18:06:40 -0400
Received: from opus ([68.230.59.19]) by fed1rmimpo01.cox.net with bizsmtp
	id Ry6f1Z00g0QtwrG03y6gED; Thu, 15 May 2008 18:06:40 -0400
Date: Thu, 15 May 2008 15:06:39 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20080515220639.GC8281@smtp.west.cox.net>
References: <c384c5ea0805141436m9f5151dje832c2da95379127@mail.gmail.com>
	<1210869726.7097.93.camel@localhost.localdomain>
	<c384c5ea0805151151v35e28a99i2ccb39157d5d47f6@mail.gmail.com>
	<20080515201138.GB8281@smtp.west.cox.net>
	<c384c5ea0805151350o19a22753y87545cfc9e22c7d1@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0805151350o19a22753y87545cfc9e22c7d1@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: [RFC] Stop on multiple providers but none explicitly specified
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 16 May 2008 10:11:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2008 at 10:50:58PM +0200, Leon Woestenberg wrote:
> Hello Tom,
> 
> On Thu, May 15, 2008 at 10:11 PM, Tom Rini <trini@kernel.crashing.org> wrote:
> > On Thu, May 15, 2008 at 08:51:29PM +0200, Leon Woestenberg wrote:
> >
> >> However, is it intuitive from the *user's* point-of-view to have
> >> BitBake make this decision?
> >> I think not; at least in the case of OpenEmbedded, there is at least a
> >> 50% chance this is not what the user intended.
> >>
> >> 1) Besides fixing this in BitBake (by bailing out, my first proposal),
> >> 2) an alternative solution is to set the preferred provider for the
> >> toolchain/libc elements to a built..
> >> a) ..in each distro file
> >> b) ..globally where we can build the toolchain/libc elements in
> >> OpenEmbedded for the target.
> >>
> >> I think 2a)  is not the way OpenEmbedded should work. The distro is
> >> not the authorative component that decides whether we can build a
> >> toolchain/libc for each target (like Angstrom does now).
> >>
> >> Shouldn't we do (2b), where the distribution can *optionally* override
> >> the preferred provider if it knows better?
> >
> > How do we know what's right?  Since in many cases it's glibc OR uclibc
> > OR external-toolchain, there is no right default there.  If we just bail
> > out here..
>
> Yes, bailing out is my first proposal, which modifies bitbake.

Perhaps it's time to take this up on the bitbake list? :)

[snip]
> > - Distro maintainers know what's right for their distro and lock things
> >  down (or know the complex table of their correct answers, and lock
> >  down).
> >
> Hmm, do I *need* to set a distro?
> 
> Does the *distro* limit me to what targets I want to build?
> 
> What if I want to build helloworld-image for the microblaze
> achitecture? (Just babbling here - but it has MMU now :-).

I'd think that with a sufficiently filled out local.conf you wouldn't
need a distro conf file, but I could see something being upset that
DISTRO isn't set.

> > - End users never see this unless the distro isn't up to date, and ping
> >  the distro maintainer.
>
> No. Only very experienced end users ping the distro maintainer. New
> end-users complain on #oe, they don't see the NOTE: at the top, and
> don't understand why stuff fails.

Well, for $DISTRO they should poke $DISTRO_RESPONSIBLE_PARTIES, but yes,
I see your point.

> > - Custom folks get a build that bails out, with a good reason and they
> >  pick what they know they need here.
> >
> Yes, my preference.
> 
> 
> But let me put it another way:
> 
> The concept of distro's should not restrict me from using OpenEmbedded
> as a cross platform build system. Our default configuration should
> much mimick buildroot. Select machine, packages, go. We should start
> where buildroot ends.
> 
> Use cases:
> 
> Selecting "MACHINE=microblaze_dev_board, bitbake helloworld-image.bb"
> should work out of the box if we add the microblaze toolchain.
> 
> Selecting "MACHINE=new_machine_with_new_arch DISTRO=old_distro bitbake
> some-image.bb" should as least TRY to build the image for the machine
> using the toolchain that is available in OpenEmbedded.

Personally, I like setting varibles in conf files, but that's just my
workflow, not your workflow :)

-- 
Tom Rini


