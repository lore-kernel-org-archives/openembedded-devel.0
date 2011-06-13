Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QW45q-0008Nq-SR for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 12:10:02 +0200
Received: from f053040080.adsl.alicedsl.de ([78.53.40.80]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QW43a-0006T5-NS for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jun 2011 10:07:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DF5C1D1.9000201@sirius-es.it>
References: <1307541389-2401-1-git-send-email-matteo.facchinetti@sirius-es.it>
	<1307551786.4193.25.camel@mattotaupa> <4DF0A343.6040608@sirius-es.it>
	<1307696674.4148.7.camel@mattotaupa>  <4DF5C1D1.9000201@sirius-es.it>
Date: Mon, 13 Jun 2011 12:06:39 +0200
Message-ID: <1307959599.4085.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v2] wxbase_2.8.9: fix includepath for SDL dependency
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
X-List-Received-Date: Mon, 13 Jun 2011 10:10:02 -0000
X-Groupsio-MsgNum: 32630
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-RuRIPyl9iz9ldbHAh/PZ"

--=-RuRIPyl9iz9ldbHAh/PZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 13.06.2011, 09:52 +0200 schrieb Matteo Facchinetti:
> On 06/10/2011 11:04 AM, Paul Menzel wrote:
> > Thank you for the explanation. I think it is generally discourage to
> > have arbitrary build behavior in OE recipes.
> >
> > Do you need to use SDL?
> No, for my project I don't use it.
> >   Is it generally needed when using wxbase? If yes
> > the dependency to sdl should be added and `--with-sdl` passed to
> > configure.
> >
> Generally, could be need use this feat when board have ALSA support but=
=20
> in other case best way is to disable it.
>=20
> In according with the project, I think could be a good choice to make a=
=20
> new recipes with wxbase-nosoud_2.8.9.bb,
> and for wxbase_2.8.9.bb we force to compile with sound support, correct=
=20
> sdl path and right dependency.
>=20
> What do you think about this?

That is a very good proposal. If you have the time to create these two
patches that would be great. On the other hand since nobody commented on
this thread/problem you could just disable the SDL support and if
somebody needs it, s/he could create a `wxbase-sdl*` package. That would
lower the maintenance work.

Your call. ;-)


Thanks,

Paul

--=-RuRIPyl9iz9ldbHAh/PZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk314S8ACgkQPX1aK2wOHVhaRACfabo4vVs1k/MZTXqaxTRhVluI
vOAAn1JQHo08vcKkUu7qmg6/PgZ0GtCO
=dXWU
-----END PGP SIGNATURE-----

--=-RuRIPyl9iz9ldbHAh/PZ--
