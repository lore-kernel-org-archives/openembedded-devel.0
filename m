Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NLZMe-0006os-LO
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Dec 2009 10:43:15 +0100
Received: (qmail 22153 invoked by uid 813007); 18 Dec 2009 09:41:25 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 18 Dec 2009 09:41:25 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Dec 2009 10:41:10 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.32; KDE/4.3.4; x86_64; ; )
References: <> <1261080453-12752-1-git-send-email-raj.khem@gmail.com>
	<1261081378.6896.472.camel@lenovo.internal.reciva.com>
In-Reply-To: <1261081378.6896.472.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200912181041.11678.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] conf/machine: Add x86_64 machine.
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
X-List-Received-Date: Fri, 18 Dec 2009 09:43:16 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia czwartek, 17 grudnia 2009 o 21:22:58 Phil Blundell napisa=C5=82(a):
> On Thu, 2009-12-17 at 12:07 -0800, Khem Raj wrote:
> > * This is not supporting multilib
> > * Only 64-bit userspace can be built.
> >
> > --- /dev/null
> > +++ b/conf/machine/include/tune-x86_64.inc
> > @@ -0,0 +1,4 @@
> > +TARGET_CC_ARCH =3D "-mtune=3Dgeneric"
> > +BASE_PACKAGE_ARCH =3D "x86_64"
> > +FEED_ARCH =3D "x86_64"
> > +PACKAGE_EXTRA_ARCHS +=3D "x86 i386 i486 i586 i686"
>=20
> If this is a pure 64-bit environment, surely you don't want that stuff
> in PACKAGE_EXTRA_ARCHS.
>=20
> It's also not completely obvious to me that this stuff belongs in a
> tune-* file at all

We moved PACKAGE_EXTRA_ARCHS from machine configs to tune-* files to cleanu=
p=20
situation where some machines lacked working archs or had them just wrong.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




