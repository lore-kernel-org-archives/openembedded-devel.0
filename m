Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PgQar-0005bd-8G for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 00:40:37 +0100
Received: from f053036037.adsl.alicedsl.de ([78.53.36.37]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PgQaC-0006Td-Uc for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 23:39:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinbMr38A4-yGjyLkNL+ydrwS+R6r_OWZo2fh7KP@mail.gmail.com>
References: <1295608972.12720.47.camel@mattotaupa>
	<AANLkTinbMr38A4-yGjyLkNL+ydrwS+R6r_OWZo2fh7KP@mail.gmail.com>
Date: Sat, 22 Jan 2011 00:39:55 +0100
Message-ID: <1295653195.4105.56.camel@mattotaupa>
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
X-List-Received-Date: Fri, 21 Jan 2011 23:40:37 -0000
X-Groupsio-MsgNum: 28287
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-svdwO7uPZHsuokejpmoG"

--=-svdwO7uPZHsuokejpmoG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 21.01.2011, 10:10 -0800 schrieb Khem Raj:
> On Fri, Jan 21, 2011 at 3:22 AM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
> >
> > `bitbake -k vdr` was executed with 6db34075 (uClibc 0.9.32-rc2) [1] and
> > `minimal-uclibc` for `MACHINE =3D "beagleboard"`. I guess it is related=
 to
> > the uClibc upgrade.
> >
>=20
> Did it work before this? I guess not. Upgrade has nothing to do with
> it. Its gettext/libiconv issue in the faulty recipe itself I believe

I just reset to when the recipe was updated [1].

        commit f4f7638828b0e06fa7ae37ccba0e1ec294b5c30a
        Author:     Paul Menzel <paulepanter@users.sourceforge.net>
        AuthorDate: Mon Jul 12 21:32:52 2010 +0200
        Commit:     Khem Raj <raj.khem@gmail.com>
        CommitDate: Wed Jan 12 00:05:25 2011 -0800
       =20
            vdr: update to 1.7.16 from 1.7.10

It built fine. Any thoughts?

I will try to pinpoint the faulty commit. I am trying to build with
2a7ddea6 [2] next, which is the commit before the last change to the VDR
recipe.

[=E2=80=A6]


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df4f7638=
828b0e06fa7ae37ccba0e1ec294b5c30a
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D2a7ddea=
6f7cd12f88a086e9d3e9228008a102248

--=-svdwO7uPZHsuokejpmoG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk06GUsACgkQPX1aK2wOHVgzDwCeJfz9lgdP9taSPdJ+bSeZ13tM
jyYAn0qPQ/54qhx/0mrmZJ64y53zikio
=s/k+
-----END PGP SIGNATURE-----

--=-svdwO7uPZHsuokejpmoG--
