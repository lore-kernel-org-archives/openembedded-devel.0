Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NcCrp-0004cE-1f
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Feb 2010 08:08:12 +0100
Received: (qmail 18211 invoked by uid 813007); 2 Feb 2010 07:05:43 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Feb 2010 07:05:43 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 2 Feb 2010 08:05:19 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc5-00011-gf6760aa; KDE/4.3.4; x86_64; ;
	)
References: <ac9c93b11001312345k7cbf864fte67fce2c5b8fcdba@mail.gmail.com>
	<1265064305.4255.28.camel@trini-m4400>
In-Reply-To: <1265064305.4255.28.camel@trini-m4400>
MIME-Version: 1.0
Message-Id: <201002020805.20660.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: kernel build: modules.order and modules.builtin
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
X-List-Received-Date: Tue, 02 Feb 2010 07:08:12 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 1 lutego 2010 o 23:45:05 Tom Rini napisa=C5=82(a):
> On Mon, 2010-02-01 at 08:45 +0100, Frans Meulenbroeks wrote:
> > Should modules.order and modules.builtin be shipped in a package when
> > a kernel is build? currently I get a note that they are installed but
> > not shipped.
> > I've seen this both for beagleboard and openrd.
>=20
> Personally I think that modules.* should be globbed into the
> kernel-modules meta package (since that will bring in all of the modules
> anyhow).

Nope - rather in kernel-image as you often do not have all modules installe=
d=20
but only selected subset.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




