Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qn9gH-0002be-Qk for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 15:34:17 +0200
Received: from f053040092.adsl.alicedsl.de ([78.53.40.92]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qn9dK-0006IV-DP for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jul 2011 13:31:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201107301510.01746.schnitzeltony@gmx.de>
References: <201107301510.01746.schnitzeltony@gmx.de>
Date: Sat, 30 Jul 2011 15:30:00 +0200
Message-ID: <1312032600.3650.45.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [RFC] oe style-guide change
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
X-List-Received-Date: Sat, 30 Jul 2011 13:34:17 -0000
X-Groupsio-MsgNum: 33412
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-8FFJmMBqDxhmn1uU5hPr"

--=-8FFJmMBqDxhmn1uU5hPr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Andreas,


Am Samstag, den 30.07.2011, 15:10 +0200 schrieb Andreas Mueller:

> working on xfce I face a problem with our style-guide (and I think there =
are=20
> other packets affected too e.g gnome recipes?):
>=20
> In the xfce.bbclass there is a SRC_URI created from recipe name. This fit=
s for=20
> 95% of the recipes. Following style-guide [1] I would add patches by writ=
ing=20
> something like
>=20
> SRC_URI +=3D "foo.patch"
> inherit xfce
>=20
> Problem is that xfce.bbclass sets SRC_URI with
>=20
> SRC_URI  =3D ...
>=20
> Since I want to give recipes the chance to overwrite the suggestion comin=
g from=20
> xfce.bbclass ( e.g thunar souce starts with capital letter ) I cannot wri=
te=20
> something like
>=20
> SRC_URI =3D+ ..
>=20
> in xfce.bbclass.
>=20
> Therfore I suggest to have the style-guide changed so that we have
>=20
> inherit ...=20
> SRC_URI
> S
>=20
> What do our gurus think about this?

It would be nice to know why the ordering is this way the first place. I
do not know that and therefore your proposal sounds reasonable.

In a lot of cases `SRC_URI` is set in an include file which is than
included using `require xfce.inc` in the very first line.

I do not know when classes are preferred over include files.


Thanks,

Paul


> [1] http://wiki.openembedded.org/index.php/Styleguide

--=-8FFJmMBqDxhmn1uU5hPr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk40B1gACgkQPX1aK2wOHVhUHwCeIZQpCHxVqL49A44RAmj5FcCg
KEAAniaEprgBZr53wa/4j5KZr89Z3KLM
=W+Ay
-----END PGP SIGNATURE-----

--=-8FFJmMBqDxhmn1uU5hPr--
