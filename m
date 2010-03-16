Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NrTCa-0000sk-Mr
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 10:36:45 +0100
Received: (qmail 4245 invoked by uid 813007); 16 Mar 2010 09:33:36 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 16 Mar 2010 09:33:36 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 10:32:32 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.4.1; x86_64; ;
	)
References: <000301cac4e8$6b652d10$422f8730$@in>
In-Reply-To: <000301cac4e8$6b652d10$422f8730$@in>
MIME-Version: 1.0
Message-Id: <201003161032.33070.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Need info how to build image and filesystem for SMDk6410
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
X-List-Received-Date: Tue, 16 Mar 2010 09:36:45 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 16 marca 2010 o 10:09:44 Tejas napisa=C5=82(a):

> I would like to build filesystem and uImage for SMDK6410. I have download=
ed
> fresh openembedded and bitbake on ubuntu machine.
>=20
> I am trying to run bit bake for SMDK-6410 board config.
>=20
> Can anyone please guide me what shall be the local.conf contents?

BBFILES =3D "PATH-TO-OPENEMBEDDED/recipes/"
DISTRO =3D "angstrom-2008.1"
MACHINE =3D "smdk6410"

Nothing more is needed.

in shell do:

$ export BBPATH=3DPATH-TO-BUILDDIR:PATH-TO-OPENEMBEDDED
$ bitbake console-image

> It would be nice if someone can guide me through the exact steps to use
> smdk6410 in open-embedded.


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




