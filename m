Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Ny7xM-0005Oe-5i
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 20:20:29 +0200
Received: (qmail 28583 invoked by uid 813007); 3 Apr 2010 18:17:10 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 3 Apr 2010 18:17:10 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 3 Apr 2010 20:17:09 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34-rc2-wl-47166-ged2da1f; KDE/4.4.2; x86_64;
	; )
References: <20100403171724.b9df4c84.ospite@studenti.unina.it>
In-Reply-To: <20100403171724.b9df4c84.ospite@studenti.unina.it>
MIME-Version: 1.0
Message-Id: <201004032017.10514.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gtk+-native-2.20.0-r8.0 fails in do_configure.
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
X-List-Received-Date: Sat, 03 Apr 2010 18:20:29 -0000
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 3 kwietnia 2010 o 17:17:24 Antonio Ospite napisa=B3(a):
> when building gtk+-native-2.20.0-r8.0 (actually bitbaking
> fso-console-image DISTRO=3Dminimal MACHINE=3Da780) I get this message:
>=20
>  Requested 'glib-2.0 >=3D 2.23.6' but version of GLib is 2.22.1
>=20
> See also http://tinderbox.openembedded.org/packages/540390/
>=20
> I can workaround that locally but I would like to learn what the best
> way to solve such issues would be. I don't see any
> preferred-minimal-versions.inc

Recent glib-2.0 recipes has BBCLASSEXTEND =3D "native" set but we also have=
=20
glib-2.0-native recipes... I think that native ones should be dropped.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




