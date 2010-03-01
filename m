Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nm8AU-0000Tr-TD
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 17:08:28 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nm87j-00077e-Qu from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 08:05:35 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 1 Mar 2010 08:05:35 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon,  1 Mar 2010 16:05:10 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Mar 2010 09:05:05 -0700
From: Tom Rini <tom_rini@mentor.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <hmeii7$q7e$1@dough.gmane.org>
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
	<20100227165600.GD30145@xora-desktop.xora.org.uk>
	<1267303607.5437.446.camel@lenovo.internal.reciva.com>
	<1267306071.9295.1.camel@trini-m4400>  <hmeii7$q7e$1@dough.gmane.org>
Organization: Mentor Graphics Corporation
Date: Mon, 01 Mar 2010 09:05:05 -0700
Message-ID: <1267459505.9295.107.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 01 Mar 2010 16:05:35.0515 (UTC)
	FILETIME=[070F46B0:01CAB959]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Mon, 01 Mar 2010 16:08:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2010-02-28 at 21:09 +0100, k.kooia wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 27-02-10 22:27, Tom Rini wrote:
> > On Sat, 2010-02-27 at 20:46 +0000, Phil Blundell wrote:
> >> On Sat, 2010-02-27 at 16:56 +0000, Graeme Gregory wrote:
> >>> NAK on creating extra levels.
> >>>
> >>> Changing the level where recipes are held is not an option do to the =
way
> >>> you tell bitbake how to find them.
> >>>
> >>> BBFILES =3D "${OE}/org.openembedded.dev/recipes/*/*.bb"
> >>
> >> Is that really such a big deal?  We seemed to manage to switch BBFILES
> >> from /packages/ to /recipes/ without any major casualties, and I would
> >> have thought that adding an extra level in there would be equally
> >> straightforward.  Or of course, even better, the distro-specific recip=
es
> >> could go in an overlay which the distro config would select.
> >=20
> > I think you've just hit on a potentially great idea.  Say that
> > 'openembedded' supports 'micro' and 'minimal' as two example
> > distributions.  Move everyone else into their own distro overlay.  The
> > only problem with this, perhaps, is easily adding the distro overlay
> > itself into the right env vars. :(
>=20
> Move every distro out of OE, that way people need to set the overlays
> correctly.
>=20
> This does mean that we abandon the "sharing" aspect that started OE
> since every little "improvement" will be done in the distro overlay
> instead of OE.

Outside of the OE repo, no.  Outside of "conf/" yes.  And yes, this
would require some re-org, perhaps.  Or perhaps not (and we make
something like contrib/ but, I don't know, I suck at naming).  And yes,
with an updated local.conf.sample, getting the overlay stuff right is
trivial.

But yes, not generically done at all improvements would end up in the
distro overlay until someone wanted to fix it generically.

Think of it this way, it would also make it easier to show how to make a
"custom Angstrom" the right way, rather than cp
conf/distro/angstrom-2008.1.conf conf/distro/mydistro.conf which I have
gathered would be a good thing.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


