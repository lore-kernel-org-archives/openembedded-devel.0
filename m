Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NWaeR-0007MR-Pf
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 20:19:11 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NWacJ-0000e2-4r for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 14:16:55 -0500
Date: Sun, 17 Jan 2010 14:16:10 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hivjon$vmv$1@ger.gmane.org>
Message-ID: <alpine.LFD.2.00.1001171405480.23608@localhost>
References: <alpine.LFD.2.00.1001171141210.11393@localhost>
	<hivjon$vmv$1@ger.gmane.org>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: beagleboard-demo-image, and the evil that is "gnome-games"
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
X-List-Received-Date: Sun, 17 Jan 2010 19:19:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 17 Jan 2010, Koen Kooi wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 17-01-10 17:47, Robert P. J. Day wrote:
> >
> >   given that (on my fedora 12 system, anyway), the gnome-games
> > package has been unbuildable for weeks now, i finally threw in the
> > towel, removed the reference to it from the beagleboard task, and
> > can now build beagleboard-demo-image.
> >
> >   that package was the final obstacle to getting a BB-demo-image
> > build.  other packages that were failing -- e2fsprogs, mplayer --
> > have recently been fixed, leaving gnome-games as the sole
> > remaining cause of build grief.
> >
> >   a suggestion -- until the issue with gnome-games is resolved,
> > why not just remove its inclusion from the bb-demo-image task?
> > i'm being quite serious -- it's obviously not a critical package,
> > and if it's the only thing keeping people from building and
> > testing the OE dev branch for the beagleboard, take it out so
> > folks can get back to testing.
> >
> >   it seems counter-productive to allow a single games package to
> > put the brakes on an entire build.
>
> And I have yet to reproduce a single build failure with that recipe,
> and I build beagleboard-demo-image daily.

  if you're not building under fedora 12, then your lack of build
failure means squat.  when i've reported build problems here, i've
always been clear what exact environment i've been building under.
and i would like to point out that two previous package build errors
i've reported -- mplayer and e2fsprogs -- did in fact need tweaking to
get back to building under f12.  so i'm not making any of this up.

> It seems counter-productive remove everything that might fail for a
> handfull of people. I remember busybox triggering an OOM on Philip's
> build machine not too long ago :)

  please don't misrepresent me, koen.  i'm not suggesting removing
"everything that might fail for a handfull of people."  i'm suggesting
that since that one package -- gnome-games -- has been unbuildable for
well over a month on a fedora 12 system, and since others have
acknowledged that build error:

http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg02124.html

and since that package *remains* broken, either someone should finally
fix it, or it should be removed from the build.  pick one.

  keep in mind, we're talking about the development branch here, which
numerous people love to point out is bound to have occasional
breakage.  no one disputes that fact of life.  but the whole *point*
of a dev branch is to allow users to live on the edge, and test that
branch, and supply feedback.  if one can't even *build* the dev
branch, you are wasting all that potential user-contributed testing.

  as it stands now, anyone who runs fedora 12 has been unable to build
a BB-demo-image for weeks now, and you've lost all that potential
testing.  and no, i *don't* care to hear from people who are happy to
tell me that it builds just fine on their debian or ubuntu or gentoo
system.  that's not relevant.  i've reported this breakage before and
nothing has been done.  at some point, in order to make the
development branch worth wasting any time on, either the breakage
should be fixed or the offending package *must* be removed to allow
testers to resume testing so you can start getting useful feedback
again.  it really is as simple as that.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


