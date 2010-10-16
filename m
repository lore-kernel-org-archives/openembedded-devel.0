Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P74DF-0003Xz-Lw for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 12:42:24 +0200
Received: from f053038254.adsl.alicedsl.de ([78.53.38.254]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P74Cm-0006nJ-VY for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 10:41:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1287220606.3980.3.camel@mattotaupa>
References: <1287066254-23579-1-git-send-email-bengardiner@nanometrics.ca>
	<1287154849.4233.19.camel@mattotaupa>
	<1287220606.3980.3.camel@mattotaupa>
Date: Sat, 16 Oct 2010 12:41:35 +0200
Message-ID: <1287225695.3980.56.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC, PATCH, resend] gmp: assign --target to --host to avoid configure error
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
X-List-Received-Date: Sat, 16 Oct 2010 10:42:25 -0000
X-Groupsio-MsgNum: 24934
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-oim7dIlGzrv7wVcGnEWh"

--=-oim7dIlGzrv7wVcGnEWh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 16.10.2010, 11:16 +0200 schrieb Paul Menzel:
> Am Freitag, den 15.10.2010, 17:00 +0200 schrieb Paul Menzel:
> > Am Donnerstag, den 14.10.2010, 10:24 -0400 schrieb Ben Gardiner:
> > > When trying to build angstrom-2008.1 from
> > > f58a5d59b755bdb725497f574a8059529c134c27 of master or from
> > > b78fc95424b5f0fb28246e8c61bb8b4d6a9d733a of stable/2009 the builds fa=
iled on
> > > gmp-native (then later gmp). The error was that "--target is not appr=
opriate
> > > for GMP".
> > >=20
> > > To avoid the error printed by the following code snippet from configu=
re.in:
> > >=20
> > > configure.in:
> > > "
> > > if test -n "$target_alias" && test "$target_alias" !=3D "$host_alias"=
; then
> > >   AC_MSG_ERROR([--target is not appropriate for GMP
> > > Use --build=3DCPU-VENDOR-OS if you need to specify your CPU and/or sy=
stem
> > > explicitly.  Use --host if cross-compiling (see "Installing GMP" in t=
he
> > > manual for more on this).])
> > > fi
> > > "
> > >=20
> > > this patch assigns the value of the '--target' argument to the value =
of the
> > > '--host' argument.
> > >=20
> > > Tested by 'bitbake gmp' and 'bitbake gmp-native'
> >=20
> > I tried to build `gmp-native` without your patch and it worked for me
> > with `minimal` (eglibc) for `MACHINE =3D "beagleboard"`. Is there a
> > difference how things are handled between distributions?
>=20
> It also built without problems with `angstrom-2010.x`.

=E2=80=A6 and `angstrom-2008.1`, `minimal-{uclibc,libc}`.

> > [=E2=80=A6]


Thanks,

Paul


--=-oim7dIlGzrv7wVcGnEWh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky5gV8ACgkQPX1aK2wOHVjzcgCdHZaUjxHhdyAB3VfVTmssee4z
W5IAn169ElAAcfA5QSTXXKFXY9PnBDTs
=Ttx4
-----END PGP SIGNATURE-----

--=-oim7dIlGzrv7wVcGnEWh--
