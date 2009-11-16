Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N9p8q-00082N-9f
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 01:08:27 +0100
Received: (qmail 13454 invoked by uid 813007); 16 Nov 2009 00:00:22 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 16 Nov 2009 00:00:22 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Nov 2009 01:00:37 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc5-00402-gb6727b1; KDE/4.3.2; x86_64; ;
	)
References: <alpine.LFD.2.00.0911150948430.14311@localhost>
In-Reply-To: <alpine.LFD.2.00.0911150948430.14311@localhost>
MIME-Version: 1.0
Message-Id: <200911160100.38336.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
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
X-List-Received-Date: Mon, 16 Nov 2009 00:08:27 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia niedziela, 15 listopada 2009 o 15:56:36 Robert P. J. Day napisa=C5=82(=
a):

>   yes, i know i'm sounding like a broken record, but i have an invite
> to give a short local demo of the beagleboard this tuesday and i'd
> like to do it with an angstrom development demo image, just because i
> prefer to live out there on the edge.

You can always move back to some revision before recent changes happened, y=
ou=20
can use Angstrom narcissus to generate working image.
=20
>   at the moment, there is just the one package standing in the way --
> guile-native -- and as i recall, someone posted what looked like a
> manual fix.  is that being turned into a patch at any point? =20

Did you tried to make it a patch? Patches are always welcome.

> i realize i'm nagging, but it's literally been *weeks* since that
> particular bitbake target actually built, and every time it looks like
> it's getting close to being buildable, more packages break.

Maybe start tagging your copy of OE to know which version was buildable for=
=20
you? It will make life easier to make 'git bisect' to find out what broke i=
t.

> i appreciate that development means exactly that but, at the very
> least, even the development branch should *build*, even if there are
> run issues.

No, it is not 'org.openembedded.always-building' branch. This is developmen=
t=20
branch where everything can happen. At OEDEM it was decided that many core=
=20
changes will be made and we accepted some breakage during that time. We are=
=20
working on making it buildable again but testing takes time.
=20
> p.s.  perhaps it would be useful to start tagging the development
> branch at points where it builds, just so someone can always retreat
> to the most recent known good build.

"where it builds" is not a definition. For me one revision builds for=20
at91sam9263ek/x11-image target but not for progear/xfce-image for example. =
Or=20
build on my Debian system but breaks in Ubuntu 9.04 virtual. There is no su=
ch=20
thing as 'it builds for everyone' and you should know that from your xterm-=
207=20
problem which was not a problem for me (as it was building under my Debian =
and=20
I do not have a client who would use Fedora for builds).
=20
> or perhaps start a branch named, oh, "bleeding", which, when it builds
> properly, can be merged back into development.  whatever.  but it
> strikes me that it's overwhelmingly pointless to have a development
> branch that doesn't build since that gives no one the opportunity to
> actually test it.

There is a tag on .dev branch which marks moment before OE core changes=20
landed: "pre-nov2009-core-updates" - maybe checkout that version and just=20
cherry-pick those updates which are needed to make OE buildable for you?

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




