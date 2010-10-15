Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P6lmY-0002ok-Eg for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 17:01:19 +0200
Received: from f053038067.adsl.alicedsl.de ([78.53.38.67]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P6lm6-0002u4-Di for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 15:00:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1287066254-23579-1-git-send-email-bengardiner@nanometrics.ca>
References: <1287066254-23579-1-git-send-email-bengardiner@nanometrics.ca>
Date: Fri, 15 Oct 2010 17:00:49 +0200
Message-ID: <1287154849.4233.19.camel@mattotaupa>
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
X-List-Received-Date: Fri, 15 Oct 2010 15:01:19 -0000
X-Groupsio-MsgNum: 24900
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-PsdgdZNMmOnb4LJolAEx"

--=-PsdgdZNMmOnb4LJolAEx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 14.10.2010, 10:24 -0400 schrieb Ben Gardiner:
> When trying to build angstrom-2008.1 from
> f58a5d59b755bdb725497f574a8059529c134c27 of master or from
> b78fc95424b5f0fb28246e8c61bb8b4d6a9d733a of stable/2009 the builds failed=
 on
> gmp-native (then later gmp). The error was that "--target is not appropri=
ate
> for GMP".
>=20
> To avoid the error printed by the following code snippet from configure.i=
n:
>=20
> configure.in:
> "
> if test -n "$target_alias" && test "$target_alias" !=3D "$host_alias"; th=
en
>   AC_MSG_ERROR([--target is not appropriate for GMP
> Use --build=3DCPU-VENDOR-OS if you need to specify your CPU and/or system
> explicitly.  Use --host if cross-compiling (see "Installing GMP" in the
> manual for more on this).])
> fi
> "
>=20
> this patch assigns the value of the '--target' argument to the value of t=
he
> '--host' argument.
>=20
> Tested by 'bitbake gmp' and 'bitbake gmp-native'

I tried to build `gmp-native` without your patch and it worked for me
with `minimal` (eglibc) for `MACHINE =3D "beagleboard"`. Is there a
difference how things are handled between distributions?

[=E2=80=A6]


Thanks,

Paul

--=-PsdgdZNMmOnb4LJolAEx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky4bKEACgkQPX1aK2wOHVhCNQCeN55GbeWd45DizJZYj2pUZnlN
aEcAn1QVHnahF6QA6yUtL5aFmynQK/Pj
=IsXs
-----END PGP SIGNATURE-----

--=-PsdgdZNMmOnb4LJolAEx--
