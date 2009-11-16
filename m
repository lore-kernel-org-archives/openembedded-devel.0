Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N9xYM-000092-0z
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 10:07:21 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N9xX0-0005FK-Mk for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 04:05:56 -0500
Date: Mon, 16 Nov 2009 04:05:45 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200911160100.38336.marcin@juszkiewicz.com.pl>
Message-ID: <alpine.LFD.2.00.0911160353130.16011@localhost>
References: <alpine.LFD.2.00.0911150948430.14311@localhost>
	<200911160100.38336.marcin@juszkiewicz.com.pl>
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
Subject: Re: any ETA on a working dev beagleboard demo image?
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
X-List-Received-Date: Mon, 16 Nov 2009 09:07:21 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1449353468-1258362354=:16011"

--8323328-1449353468-1258362354=:16011
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 16 Nov 2009, Marcin Juszkiewicz wrote:

> Dnia niedziela, 15 listopada 2009 o 15:56:36 Robert P. J. Day napisa=C5=
=82(a):
>
> >   yes, i know i'm sounding like a broken record, but i have an
> > invite to give a short local demo of the beagleboard this tuesday
> > and i'd like to do it with an angstrom development demo image,
> > just because i prefer to live out there on the edge.
>
> You can always move back to some revision before recent changes
> happened, ...

  except that i've been trying to build a beagleboard-demo-image from
the dev branch for the last few *weeks* and have yet to have a single
successful build.  i'd be *happy* to tag a working build if i ever get
one.

> > i appreciate that development means exactly that but, at the very
> > least, even the development branch should *build*, even if there
> > are run issues.
>
> No, it is not 'org.openembedded.always-building' branch. This is
> development branch where everything can happen. At OEDEM it was
> decided that many core changes will be made and we accepted some
> breakage during that time. We are working on making it buildable
> again but testing takes time.

  and therein lies the conflict -- if the branch can't even be
*built*, it can't possibly be *tested*.  of course development
branches are going to break on occasion, everyone knows that.  but it
seems that, if the build itself fails, the first priority is to fix
that.  otherwise, if you leave it broken and keep developing, all
you're doing is layering more unknown code on top of something that
doesn't even build (at least for some people).  and you're explicitly
removing the ability to test from people that are willing to do that.
that strikes me as counter-productive.

  it's particularly counter-productive when it's nothing more than a
single package that's causing the problem.

> "where it builds" is not a definition. For me one revision builds
> for at91sam9263ek/x11-image target but not for progear/xfce-image
> for example. Or build on my Debian system but breaks in Ubuntu 9.04
> virtual. There is no such thing as 'it builds for everyone' and you
> should know that from your xterm-207 problem which was not a problem
> for me (as it was building under my Debian and I do not have a
> client who would use Fedora for builds).

  IMHO, the fact that you don't know anyone who uses a fedora build
host is not a compelling reason to ignore build breakage that happens
on a fedora build host.

  in any event, that's my $0.02.  build breakage is one thing.  but
breakage that's lasted for as long as i've been trying to build --
even on a development branch -- strikes me as a bad thing.

rday
--


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323328-1449353468-1258362354=:16011--
