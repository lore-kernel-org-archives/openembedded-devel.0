Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vivektambakad@gmail.com>) id 1NJLM3-0005bN-F3
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Dec 2009 07:21:27 +0100
Received: by pwi18 with SMTP id 18so1102737pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 22:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=CRSVjjHSj0K3W8pS+GfjSPwBx/lt7WebPdxjSuLqs48=;
	b=F6lOaLT6vvnRvXY1xqTdCOSIbe7Cboew9tVB4PRYhfVKf5M2NSoP7gadXzRtOOXjUR
	nqCaDp+OGXM8URGZC9GfLYgWshfgYx8i+dnYoReWwCdaBxdXbaqGrHXeFjYI5jI+QZrl
	+JW8XpzPMu5BtPpzOs55G+ID4NapJgZ/YCEYM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=JlIkc0FMyyqtwH5YC4FMzS5zjgD0K23ZsP7mIU8rcnrBMw58ZHepxlt3udS5n+aJ1K
	Z1RFwvG3ybydZfFIw0OgSRwSxISiZN0tiUgyFC2hoLGx/27usvdHOy6uOVxlHPyeeLxc
	CXjrBBHCpM2LHqXIQETcRjqydoF7sxdFoCJQ0=
MIME-Version: 1.0
Received: by 10.114.165.18 with SMTP id n18mr1413481wae.154.1260598778999; 
	Fri, 11 Dec 2009 22:19:38 -0800 (PST)
Date: Sat, 12 Dec 2009 11:49:38 +0530
Message-ID: <ad82c8890912112219k72d720d7y914dd9025eaf8356@mail.gmail.com>
From: vivek tambakad <vivektambakad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: vivektambakad@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Build x11-image error
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
X-List-Received-Date: Sat, 12 Dec 2009 06:21:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi ,
        I compiled linphone and try to build image for compulab EM-x270.I am
using "bitabke x11-image" to to build linphone
image .I included "linphone" in /recipes/images/x11-image.bb and
/recipes/tasks/task-x11.bb . But i am getting following error

NOTE: preferred version 0.0+1.0rc2+svnr29789 of mplayer not available (for
item mplayer)
NOTE: Runtime target 'bluez-utils-alsa' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bluez-utils-alsa',
'bluez-libs-3.36']
ERROR: Required build target 'x11-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['x11-image',
'bluez-utils-alsa', 'bluez-libs-3.36']

please help to build image.

with regards
vivek tambakad



On Fri, Dec 11, 2009 at 11:01 PM, <
openembedded-devel-request@lists.openembedded.org> wrote:

> Send Openembedded-devel mailing list submissions to
>        openembedded-devel@lists.openembedded.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> or, via email, send a message with subject or body 'help' to
>        openembedded-devel-request@lists.openembedded.org
>
> You can reach the person managing the list at
>        openembedded-devel-owner@lists.openembedded.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Openembedded-devel digest..."
>
>
> Today's Topics:
>
>   1. Re: multiple DISTRO's in tmp (Richard Purdie)
>   2. Re: cortex-a9 build failure at glibc (RK Raggit)
>   3. choosing correct flash image for Compulab EM-X270 (vivek tambakad)
>   4. Re: Problem using "bitbake" (saleh usman)
>   5. Re: multiple DISTRO's in tmp (Graeme Gregory)
>   6. Re: multiple DISTRO's in tmp (Phil Blundell)
>   7. Re: cortex-a9 build failure at glibc (Khem Raj)
>   8. Re: multiple DISTRO's in tmp (Khem Raj)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Fri, 11 Dec 2009 11:33:02 +0000
> From: Richard Purdie <rpurdie@rpsys.net>
> Subject: Re: [oe] multiple DISTRO's in tmp
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <1260531182.29252.2.camel@dax.rpnet.com>
> Content-Type: text/plain
>
> On Fri, 2009-12-11 at 11:29 +0100, Frans Meulenbroeks wrote:
> > 2009/12/11 Phil Blundell <philb@gnu.org>:
> > > On Fri, 2009-12-11 at 09:39 +0100, Frans Meulenbroeks wrote:
> > >> However, I was wondering: wouldn't it be nice to allow multiple
> > >> distro's in one tmp dir (so that e.g. if they share the same version
> > >> of a recipe (like m4-native or os), this does not need to be
> > >> recompiled?
> > >
> > > Even if the (PN, PV) tuple is the same for two DISTROs it doesn't
> > > necessarily follow that the resulting packages will be the same.  They
> > > might have selected different compilers, configuration options, or
> > > versions of depended-on packages.  Or they might have a different
> > > filesystem layout, or any number of other things.
> > >
> > > So, practically speaking, no: it isn't going to be feasible to make
> > > multiple DISTROs coexist in a single TMPDIR.  This is a case where you
> > > do need to create a separate TMPDIR.
> >
> > I understand that. Then again it *is* possible for multiple machines
> > in the same distro to co-exist, even though the machine config file
> > could change some flags.
> >
> > Rethinking it, I would expect that if things can be shared it would be
> > in the native area (and perhaps some things in cross).
> >
> > Actually just bumped into this because my tmp dir for angstrom was
> > about 18 GB and ofc I didn't have sufficient free space for another
> > tree (and also not really enough patience to wait out a build of the
> > cross tools).
> >
> > Since my main goal was a small filesystem for initramfs, maybe it
> > would be better to make a recipe for a small package (e.g.
> > minimal_console_image.bb)
>
> Phil is right, its not intended to be able to share multiple DISTROs in
> the same TMPDIR and it never will be. Yes, in some cases its possible
> things might match but knowing when they do and when they don't is
> difficult to tell.
>
> You need separate tmp directories I'm afraid.
>
> Cheers,
>
> Richard
>
>
>
>
>
> ------------------------------
>
> Message: 2
> Date: Fri, 11 Dec 2009 17:17:42 +0530
> From: RK Raggit <rk.raggit@gmail.com>
> Subject: Re: [oe] cortex-a9 build failure at glibc
> To: openembedded-devel@lists.openembedded.org
> Message-ID:
>        <ec1f3d400912110347x365c0873i9d03b58d02cbf735@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
>
>  As I see you are targetting cortex-a9 I would suggest that you use
> > later version of
> > glibc or even better use eglibc 2.10 or 2.11
> >
>
> one silly question ... how do i make my build skip the glibc package and
> pick the eglibc 2.11 instead ?
>
> --RK
>
>
> ------------------------------
>
> Message: 3
> Date: Fri, 11 Dec 2009 17:45:40 +0530
> From: vivek tambakad <vivektambakad@gmail.com>
> Subject: [oe] choosing correct flash image for Compulab EM-X270
> To: openembedded-devel@lists.openembedded.org
> Message-ID:
>        <ad82c8890912110415jde47da1kde90de8fdb2b56fc@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
>
> Hi,
>        I compiled linphone successfully.Now I wanted to create flash image
> for linphone to port on Nand flash.
> Please tell me which image i have to choose for compulab EM-X270 in
> recipes/images to build image.
> and also tell me that what changes i have to do for .bb image file to build
> image for linphone.
>
> with regards
> vivek tambakad
>
>
> ------------------------------
>
> Message: 4
> Date: Fri, 11 Dec 2009 19:32:48 +0500
> From: saleh usman <salehusman@hotmail.com>
> Subject: Re: [oe] Problem using "bitbake"
> To: Openembedded Charis Larson <clarson@kergoth.com>, Openembedded
>        Discussion      <openembedded-devel@lists.openembedded.org>
> Message-ID: <BAY127-W6237F900F669541AE5747D88C0@phx.gbl>
> Content-Type: text/plain; charset="Windows-1252"
>
>
> Oh sorry,I've missed to set oe.Thanks a lot for guidance.
> Now it is showing a different kind of error in terminal window as
> below.Where to find these missing dependencies?
>
> [saleh@localhost build]$ bitbake helloworld-image
> NOTE: Handling BitBake files: | (0001/0001) [100 %]
> NOTE: Parsing finished. 0 cached, 1 parsed, 0 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Required build target 'helloworld-image' has no buildable providers.
> Missing or unbuildable dependency chain was: ['helloworld-image',
> 'shasum-native']
>
>
> I am building this image for an embedded platform which has an ARM 9
> processor and linux has been ported and running on it.But our board doesn't
> support gcc.What else I need to run this om my board.
>
> From: clarson@kergoth.com
> Date: Thu, 10 Dec 2009 08:02:27 -0700
> Subject: Re: [oe] Problem using "bitbake"
> To: salehusman@hotmail.com
> CC: openembedded-devel@lists.openembedded.org
>
> If that's a copy/pasted line, you're referencing an 'oe' variable, likely
> set in your environment?  Is it exported?  Did you add it to the bitbake
> environment whitelist?  Run bitbake -e | grep \^BBFILES, and see what it
> *really* ends up set to.
>
>
>
> On Thu, Dec 10, 2009 at 8:00 AM, saleh usman <salehusman@hotmail.com>
> wrote:
>
>
>
>
>
>
>
> I've set BBFILES in the local.conf file as
>  BBFILES = "${oe}/openembedded/recipes/images/helloworld-image.bb"
>
>
> where oe is directory in which openembedded is placed. I've also tried
> helloworld-image.But it returned same messages.
>
> I am just following the isntructions of Getting Started page and using
> helloworld-image given in the openembedded/recipes/images directory.
>
>
>
>
> Terminal window was like this
>
> [saleh@localhost build]$ bitbake helloworld-image
>
>
>
> NOTE: Parsing finished. 0 cached, 0 parsed, 0 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
>
>
> ERROR: Nothing PROVIDES 'helloworld-image'
>
>
> From: clarson@kergoth.com
> Date: Tue, 8 Dec 2009 09:21:04 -0700
>
>
> Subject: Re: [oe] Problem using "bitbake"
> To: openembedded-devel@lists.openembedded.org
> CC: salehusman@hotmail.com
>
>
>
>
>
> On Tue, Dec 8, 2009 at 8:54 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>
>
>
>
> On 12/08/2009 08:49 AM, saleh usman wrote:
>
>
>
>
> Hello
>
>
>
> I am trying to build   "helloworld_image"  given in openembedded
> recipes/images directory but the following error is occuring. Please help me
> in diagnosing the pr0blem and moving forward.
>
>
>
>
>
> [saleh@localhost build]$ bitbake helloworld_image
>
>
>
> NOTE: Parsing finished. 0 cached, 0 parsed, 0 skipped, 0 masked.
>
> NOTE: Cache is clean, not saving.
>
> ERROR: Nothing PROVIDES 'helloword_image'
>
>
>
>
> Try 'bitbake helloworld-image' (dash, not underscore)
>
>
> The 0 cached, 0 parsed, 0 skipped, 0 masked from the parse implies that
> BBFILES was not set correctly, or at all.
>
>
>
> --
> Chris Larson
> clarson at kergoth dot com
> clarson at mvista dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Software Engineer
> MontaVista Software, Inc.
>
>
>
> Keep your friends updated? even when you?re not signed in.
>
>
>
>
> --
> Chris Larson
> clarson at kergoth dot com
> clarson at mvista dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Software Engineer
> MontaVista Software, Inc.
>
> _________________________________________________________________
> Windows Live Hotmail: Your friends can get your Facebook updates, right
> from Hotmail?.
>
> http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/social-network-basics.aspx?ocid=PID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_4:092009
>
> ------------------------------
>
> Message: 5
> Date: Fri, 11 Dec 2009 08:47:16 -0700
> From: Graeme Gregory <dp@xora.org.uk>
> Subject: Re: [oe] multiple DISTRO's in tmp
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <20091211154716.GB12304@xora-eee.xora.org.uk>
> Content-Type: text/plain; charset=us-ascii
>
> On Fri, Dec 11, 2009 at 09:39:21AM +0100, Frans Meulenbroeks wrote:
> > I bumped upon the following issue.
> >
> > Normally I use angstrom as distro, but this time I needed a small
> > image to be used in an initramfs.
> > In order to achieve that I changed DISTRO in my local.conf to minimal
> > (tried minimal-uclibc first, but that would complain before generating
> > packages, probably due to a mismatch between my target (powerpc) and
> > uclibc (I refrained from sidetracking to dig into it)).
> >
> minimal being an Angstrom clone will not actually produce smaller
> images. I would suggest for an initramfs you just switch Angstrom
> to uclibc mode.
>
> The only real advantage micro has in size is that it creates less
> directories. The images are not as far as I can see physically any
> smaller.
>
> Graeme
>
>
>
>
> ------------------------------
>
> Message: 6
> Date: Fri, 11 Dec 2009 15:57:39 +0000
> From: Phil Blundell <philb@gnu.org>
> Subject: Re: [oe] multiple DISTRO's in tmp
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <1260547059.779.229.camel@mill.internal.reciva.com>
> Content-Type: text/plain
>
> On Fri, 2009-12-11 at 08:47 -0700, Graeme Gregory wrote:
> > The only real advantage micro has in size is that it creates less
> > directories. The images are not as far as I can see physically any
> > smaller.
>
> You should generally get smaller images with micro, though how much
> smaller will obviously depend on what exactly you are building.  What
> file sizes were you seeing in your test?
>
> p.
>
>
>
>
>
> ------------------------------
>
> Message: 7
> Date: Fri, 11 Dec 2009 09:25:03 -0800
> From: Khem Raj <raj.khem@gmail.com>
> Subject: Re: [oe] cortex-a9 build failure at glibc
> To: openembedded-devel@lists.openembedded.org
> Message-ID:
>        <19c1b8a90912110925k5e8063b7wdc160af7eb29fb2a@mail.gmail.com>
> Content-Type: text/plain; charset=UTF-8
>
> On Fri, Dec 11, 2009 at 3:47 AM, RK Raggit <rk.raggit@gmail.com> wrote:
> > ?As I see you are targetting cortex-a9 I would suggest that you use
> >> later version of
> >> glibc or even better use eglibc 2.10 or 2.11
> >>
> >
> > one silly question ... how do i make my build skip the glibc package and
> > pick the eglibc 2.11 instead ?
>
> if you use minimal or micro distro then eglibc is default libc for
> others you can add
>
> LIBC="eglibc"
>
> IIRC angstrom needs ANGSTROMLIBC = "eglibc"
>
> for choosing 2.11 you can add
>
> PREFERRED_VERSION_eglibc = "2.11"
> PREFERRED_VERSION_eglibc-initial = "2.11"
>
> to your local.conf
>
>
> >
> > --RK
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
>
>
> ------------------------------
>
> Message: 8
> Date: Fri, 11 Dec 2009 09:29:27 -0800
> From: Khem Raj <raj.khem@gmail.com>
> Subject: Re: [oe] multiple DISTRO's in tmp
> To: openembedded-devel@lists.openembedded.org
> Message-ID:
>        <19c1b8a90912110929k37678ecbx3a1153e5beff74b3@mail.gmail.com>
> Content-Type: text/plain; charset=UTF-8
>
> On Fri, Dec 11, 2009 at 2:29 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > 2009/12/11 Phil Blundell <philb@gnu.org>:
> >> On Fri, 2009-12-11 at 09:39 +0100, Frans Meulenbroeks wrote:
> >>> However, I was wondering: wouldn't it be nice to allow multiple
> >>> distro's in one tmp dir (so that e.g. if they share the same version
> >>> of a recipe (like m4-native or os), this does not need to be
> >>> recompiled?
> >>
> >> Even if the (PN, PV) tuple is the same for two DISTROs it doesn't
> >> necessarily follow that the resulting packages will be the same. ?They
> >> might have selected different compilers, configuration options, or
> >> versions of depended-on packages. ?Or they might have a different
> >> filesystem layout, or any number of other things.
> >>
> >> So, practically speaking, no: it isn't going to be feasible to make
> >> multiple DISTROs coexist in a single TMPDIR. ?This is a case where you
> >> do need to create a separate TMPDIR.
> >
> > I understand that. Then again it *is* possible for multiple machines
> > in the same distro to co-exist, even though the machine config file
> > could change some flags.
> >
> > Rethinking it, I would expect that if things can be shared it would be
> > in the native area (and perhaps some things in cross).
> >
> > Actually just bumped into this because my tmp dir for angstrom was
> > about 18 GB and ofc I didn't have sufficient free space for another
> > tree (and also not really enough patience to wait out a build of the
> > cross tools).
>
> IIRC angstrom used -ggdb3 (which may not be case anymore) which means
> more than half of your total size it consumed
> by elaborated debug info for code which is compiled at O2 and most of
> the debug info
> will not be usable. Change using -g instead to reduce the bloat.
>
> -Khem
>
>
>
> ------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> End of Openembedded-devel Digest, Vol 41, Issue 46
> **************************************************
>

