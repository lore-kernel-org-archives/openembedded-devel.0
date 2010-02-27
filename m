Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NlR5P-0006jy-PC
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Feb 2010 19:08:24 +0100
Received: (qmail 24674 invoked by uid 813007); 27 Feb 2010 18:05:33 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 27 Feb 2010 18:05:33 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Feb 2010 19:04:21 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.3.4; x86_64; ;
	)
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
	<20100227165600.GD30145@xora-desktop.xora.org.uk>
	<ac9c93b11002270921rb738980ye29c6fd93913107a@mail.gmail.com>
In-Reply-To: <ac9c93b11002270921rb738980ye29c6fd93913107a@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201002271904.22479.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Sat, 27 Feb 2010 18:08:24 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 27 lutego 2010 o 18:21:58 Frans Meulenbroeks napisa=C5=82(a):
> One could do:
> BBFILES =3D "${OE}/org.openembedded.dev/recipes/*/${DISTRO}/*.bb"
> BBFILES +=3D "${OE}/org.openembedded.dev/recipes/*/*.bb"
=20
BBFILES =3D "${OE}/org.openembedded.dev/recipes/" is supported since I do n=
ot=20
remember when.

Making extra levels in recipes/ dir was discussed so many times that it mak=
es=20
me sad when I see yet another discussion about it which will change nothing.

Images/ directory never had sensible naming. "angstrom-gnome-image" is smal=
ler=20
then "angstrom-x-image", x11-image is another version of gpe-image (content=
 is=20
other but result is same - user lands in GPE + Matchbox v1). If you want to=
=20
have kind of order there then start creating "frans-really-minimal", "frans-
basic-x11-without-gtk-but-small-as-possible", "frans-x11-gpe-mb1", "frans-x=
11-
gnome" etc images.=20

This directory is dump of recipes created by many developers, some of them =
are=20
probably 5-6 years old. There are many recipes for images outside of our=20
repository (like bug-image-production for example or those which generate 1=
GB=20
sized rootfs from Montavista). I have on disk image recipe which generate=20
package which I use to generate final image. Etc, ETc, ETC...

So generally I am against moving recipes which mention angstrom to=20
recipes/angstrom/ just because they contain 'angstrom' word inside. If I wi=
ll=20
push "umbaumba-magic-image" recipe will you opt for moving it to=20
recipes/umbaumba just because I wrote it for my internal-no-one-saw-it-and-
who-knows-does-it-exists-at-all distribution?

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




