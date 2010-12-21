Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1PV8vQ-0002kg-D2
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 21:35:12 +0100
Received: (qmail 29065 invoked by uid 2404007); 21 Dec 2010 20:28:26 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89-73-120-20.dynamic.chello.pl (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@89.73.120.20)
	by host4.kei.pl with ESMTPA; 21 Dec 2010 20:28:26 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Dec 2010 21:28:13 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.37-10-generic; KDE/4.5.85; x86_64; ; )
References: <ienu66$5gf$1@dough.gmane.org> <iepnom$tk9$1@dough.gmane.org>
	<AANLkTimv-=g7qhYQynPYi65Vp2sQk_a6mPUsVbh-M0eA@mail.gmail.com>
In-Reply-To: <AANLkTimv-=g7qhYQynPYi65Vp2sQk_a6mPUsVbh-M0eA@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201012212128.17392.marcin@juszkiewicz.com.pl>
Subject: Re: [RFC] meta-openembedded layer for yocto hosted on oe.org
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
X-List-Received-Date: Tue, 21 Dec 2010 20:35:12 -0000
X-Groupsio-MsgNum: 27373
Content-Type: multipart/signed; boundary="nextPart3522878.iuGKlCG6s2";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3522878.iuGKlCG6s2
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 21 grudnia 2010 o 18:51:25 Frans Meulenbroeks napisa=C5=82(a):
> 2010/12/21 Koen Kooi <k.kooi@student.utwente.nl>:
> >> Nice piece of work & a good plan but...
> >> Who will be the owners/maintainers of the layers?
> >=20
> > My intention was that the meta-openembedded layer will be maintained by
> > the people interested in it. There will be a new MAINTAINERS file inside
> > listing who feels responsible for various recipes.

> Seems a good plan.

I just gave on irc how I see cooperation with Yocto:

=2D yocto-core layer - maintained by Yocto, builds always for selected targ=
ets,
  pull only way of providing changes - just like Poky was
=2D oe-core layer - extra images, classes required by OE builds. Same polic=
ies=20
  as Yocto core - only pull from user branches if changes pass test builds
=2D oe-distro-DISTRO (for those distros which needs own layers - like angst=
rom
  does) maintained by distro maintainers with their policies
=2D oe-bsp-STH maintained by layer maintainers with their policies
=2D oe-extra-STH (STH =3D opie, xfce, whatever) maintained by person/team
=2D oe-unmaintained layer with everything not fit in layers

This way we can get stable core (yocto-core + oe-core) which builds always =
for=20
selected targets + layers with UI environments, multimedia, boards/soc=20
support, etc each of them maintained by person or team. How we will split=20
metadata into layers (and subdirs in layers) is other thing and will need t=
o=20
be discussed too.

> >> An alternate approach would be to let the stuff live in poky-extras.
> >> See this proposal from RP:
> >> http://www.mail-archive.com/yocto@yoctoproject.org/msg00286.html
> >=20
> > The poky-extras thing is not what I want, and more importantly, I don't
> > want to start diluting the OE brand.
>=20
> Why wouldn't you want poky-extras?
> My concern is that we get lots of duplicated effort because both
> poky-extras and meta-openembedded might get the same recipes.

Poky-extras is part of Poky not OpenEmbedded. Our brand has 7 years and we =
do=20
not want to let it disappear. This will send wrong message to people who us=
e=20
our work.
=20
> Wrt diluting the OE brand. This is a completely different topic.
> IMHO the mere fact that yocto exists impacts OE.
> Yocto also has much more resources (both people-hour wise as well as
> HW wise), so I strongly doubt we can compete on it wrt the quality of
> the base recipes.

Thats why we should move to use Yocto as base. We have skilled developers t=
oo=20
which can and will provide changes to yocto-core layer. But those changes w=
ill=20
require testing before being merged which can be new thing for some of OE=20
developers ;)
=20
> That leaves the question:
> Given the existence of Yocto in which parts do we see added value of
> OE and on which things should we as OE focus.

OE supports more targets then Yocto does or will ever support. I do not exp=
ect=20
Yocto to support Intel Mainstone or Simpad or even Alix.1c which I use for =
my=20
router. But OE supports those machines (more or less) and this is our value=
=2E=20
There are boards outside which boots to OpenEmbedded derived root filesyste=
ms=20
=2D not Yocto or Poky but OE based.

If we do proper separation of layers then who knows - maybe some vendors wh=
ich=20
base on OE will start to base on Yocto directly. But as OE will also base o=
n=20
Yocto then it will be not a problem to use vendor layers with our ones to=20
provide extra packages.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart3522878.iuGKlCG6s2
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0RDd4ACgkQeQ6MlGH/2qtxCwCfeWkK3ZNuDkoHh9XWae1l3wvx
MKMAn3MR/UHXakujOTGdA/C+8L5hnjBg
=yjET
-----END PGP SIGNATURE-----

--nextPart3522878.iuGKlCG6s2--
