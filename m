Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PgYfd-0005oC-VR for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 09:18:06 +0100
Received: from f053037250.adsl.alicedsl.de ([78.53.37.250]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PgYez-0004n5-7C for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 08:17:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1295653195.4105.56.camel@mattotaupa>
References: <1295608972.12720.47.camel@mattotaupa>
	<AANLkTinbMr38A4-yGjyLkNL+ydrwS+R6r_OWZo2fh7KP@mail.gmail.com>
	<1295653195.4105.56.camel@mattotaupa>
Date: Sat, 22 Jan 2011 09:17:24 +0100
Message-ID: <1295684244.4098.2.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: vdr: minimal-uclibc: task `compile` fails with `undefined reference to `_nl_msg_cat_cntr'`
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
X-List-Received-Date: Sat, 22 Jan 2011 08:18:06 -0000
X-Groupsio-MsgNum: 28295
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-hA+0t87pvMcDYQgFp1cc"

--=-hA+0t87pvMcDYQgFp1cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 22.01.2011, 00:39 +0100 schrieb Paul Menzel:
> Am Freitag, den 21.01.2011, 10:10 -0800 schrieb Khem Raj:
> > On Fri, Jan 21, 2011 at 3:22 AM, Paul Menzel wrote:
> > >
> > > `bitbake -k vdr` was executed with 6db34075 (uClibc 0.9.32-rc2) [1] a=
nd
> > > `minimal-uclibc` for `MACHINE =3D "beagleboard"`. I guess it is relat=
ed to
> > > the uClibc upgrade.
> > >
> >=20
> > Did it work before this? I guess not. Upgrade has nothing to do with
> > it. Its gettext/libiconv issue in the faulty recipe itself I believe
>=20
> I just reset to when the recipe was updated [1].
>=20
>         commit f4f7638828b0e06fa7ae37ccba0e1ec294b5c30a
>         Author:     Paul Menzel <paulepanter@users.sourceforge.net>
>         AuthorDate: Mon Jul 12 21:32:52 2010 +0200
>         Commit:     Khem Raj <raj.khem@gmail.com>
>         CommitDate: Wed Jan 12 00:05:25 2011 -0800
>        =20
>             vdr: update to 1.7.16 from 1.7.10
>=20
> It built fine. Any thoughts?
>=20
> I will try to pinpoint the faulty commit. I am trying to build with
> 2a7ddea6 [2] next, which is the commit before the last change to the VDR
> recipe.

That failed already. Now I will try 260f78b3 y[3].


Thanks,

Paul

> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df4f76=
38828b0e06fa7ae37ccba0e1ec294b5c30a
> [2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D2a7dd=
ea6f7cd12f88a086e9d3e9228008a102248
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D260f78b=
3e5b171fea66fe7c901f489ea713d2988

--=-hA+0t87pvMcDYQgFp1cc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk06ko0ACgkQPX1aK2wOHVifegCePsij3zdzCKGdBS88/yKA/dwV
ZksAn0Gv7TohklpV8Cg0oc5Ixd6XFSNg
=1pSA
-----END PGP SIGNATURE-----

--=-hA+0t87pvMcDYQgFp1cc--
