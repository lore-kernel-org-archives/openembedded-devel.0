Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NxYyw-0007Jq-Ac
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 06:59:47 +0200
Received: (qmail 1987 invoked by uid 813007); 2 Apr 2010 04:56:30 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Apr 2010 04:56:30 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 2 Apr 2010 06:56:09 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34-rc2-wl-47166-ged2da1f; KDE/4.4.2; x86_64;
	; )
References: <1270170658.7652.0.camel@trini-m4400>
	<20100402012552.GA6161@gmail.com>
In-Reply-To: <20100402012552.GA6161@gmail.com>
MIME-Version: 1.0
Message-Id: <201004020656.31031.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Switch insane.bbclass to endswith() and fix la/pc check
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
X-List-Received-Date: Fri, 02 Apr 2010 04:59:48 -0000
X-Groupsio-MsgNum: 18383
Content-Type: multipart/signed; boundary="nextPart1354279.LL0xUg77bq";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1354279.LL0xUg77bq
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 2 kwietnia 2010 o 03:25:52 Khem Raj napisa=C5=82(a):
> > This changes insane.bbclass to use s.endswith("str") rather than s[-3:]
> > =3D=3D "str".  The primary motivation for this is that we have tests th=
at
> > check for 'la' and 'pc' files when we really want '.la' and '.pc' to be
> > what we check for.  Also, our -dev symlink test does if test1:  if test2
> > and test3: action, when it could just be if test1 and test2 and test3.
> >
> >=20
> >
> > Signed-off-by: Tom Rini <tom_rini@mentor.com>
>=20
> Acked-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart1354279.LL0xUg77bq
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAku1ePsACgkQeQ6MlGH/2qsEHwCePYI2YiNd54vqYuE3h+OP9TSu
lhUAn0ZB3xfF19SgiXSE+lfHzzASr1iu
=pTeM
-----END PGP SIGNATURE-----

--nextPart1354279.LL0xUg77bq--
