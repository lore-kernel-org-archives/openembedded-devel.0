Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1LxtvV-0003ki-6U
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Apr 2009 04:17:05 +0200
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id 4A90D24066; Sun, 26 Apr 2009 12:12:10 +1000 (EST)
Date: Sun, 26 Apr 2009 12:11:45 +1000
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20090426121145.a0a2d738.raster@rasterman.com>
In-Reply-To: <200904252247.40760.marcin@juszkiewicz.com.pl>
References: <20090425075933.E6E18188456@amethyst.openembedded.net>
	<49F35A2B.7070907@xora.org.uk>
	<200904252144.45513.mickey@vanille-media.de>
	<200904252247.40760.marcin@juszkiewicz.com.pl>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.5.0 (GTK+ 2.14.4; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Subject: Re: [oe-commits] Koen Kooi : Revert "ecore: catch up with the new SONAMEs; move to autosplitting"
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
X-List-Received-Date: Sun, 26 Apr 2009 02:17:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 25 Apr 2009 22:47:40 +0200 Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> said:

> Dnia sobota, 25 kwietnia 2009 o 21:44:45 Michael 'Mickey' Lauer=20
> napisa=C5=82(a):
> > This solution has now been reverted for the sake of the upgrade path.
> > And just for the records, the technical issue wasn't the reason for
> > me leaving the OE core team and resigning from all duties -- it was
> > the way how this situation was handled. Again the core team pretty
> > much stood watching in apathy and let the most vocal decide on his
> > own, letting him carry his own way again.
>=20
> And the whole 'fun' happened during Friday evening and Saturday when=20
> some members of so called 'core team' are not reading mails at all. Cal=
m=20
> down Mickeyl - it is not worth your nerves.

true mickey - patience. one thing i have learnt in the e world is.. i may=
 be
benevolent dictator and may get to call shots and often i get pissed off =
at
people doing bad things... but making drastic decisions quickly is a bad =
move.

nb - the soname changes in e happend after about 2 weeks of discussions -=
 WITH
package maintainers from several desktop distributions, some of them alre=
ady
patching in soname changes. we have lived with enough complaints from peo=
ple
(normally with little clue) about problems we cant fathom until we find o=
ut
they have both packages ANd source installed (built from svn). soname cha=
nge
should alleviate these, solve the "different distros use different soname=
s"
problem etc. - but it took 2 weeks of us yelling at eachother over email =
and
finally agreeing. the initial patches even didnt quite work properly and =
it
took a few days to fix them. in the end it was all working fine and upgra=
des
worked. packagers then of course had to catch up with the new naming, and=
 oe is
in the middle of this.

from upstream's view - we didnt intend to force new package names. if use=
rs
100% used packaging to manage stuff it would all work. the problem is the=
y
don't in reality and we need to coordinate between upstream and packagers=
 to
make things sane. if oe has magic-mojo that auto-determines names of pack=
ages
from libX.so names.. then of course its going to hurt - i would simply sa=
y -
turn that logic off and manually specify package name and package file
includes. its manual, but sane and probably works better in the long run =
for
us :)

> It is 22:46 here, normally I would be sleeping (because I have no idea=20
> will my daughter wake me up during night or not) but today I saw=20
> Mickeyl's resignation mail on my cellphone and desided to check what is=
=20
> going on.
>=20
> Regards,=20
> --=20
> JID:      hrw@jabber.org
> Website:  http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



