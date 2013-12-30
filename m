Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7730460D75
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2013 23:03:14 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so5268054ead.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2013 15:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WLqwJ7dBFcGOICA5NahxYe9w6BZqGm0QsaV5eVPVdTo=;
	b=nwalX4qcWxxi8n2fTI0jm8qWfZjkGeEoZaXTSJ4wX5JP3nDFVfoQg/TJZzlXDo3WOD
	B68kzVBRK2kUT5E63pldBpunbJxcX288/yaQXIZaWvlbpU49koF1z1c+UY27/Z1SgBsR
	Zc4uPfQXS7uYSOnyCsXXOh0mnvMyhE4SnMIVc3cOzrcAaInjpmI7JEbfPYt6zqXqaob3
	Ei++0z6bOXCKrkzLesU3GvRtr9cv8WgEuCKnCbsREoNzTspRGeqdQ6qhrz0KPj8wPSml
	BWBTSLBkOW8oBKSDVEB5zcte1SiNBE5LkxUaGwBBEZ8KRj4oG6W4hA+4hLGD4bIqsAdB
	xaJA==
X-Received: by 10.15.23.206 with SMTP id h54mr57059186eeu.17.1388444595161;
	Mon, 30 Dec 2013 15:03:15 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 1sm112839661eeg.4.2013.12.30.15.03.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Dec 2013 15:03:14 -0800 (PST)
Date: Tue, 31 Dec 2013 00:03:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20131230230313.GA3705@jama>
References: <1388415259-6360-1-git-send-email-Martin.Jansa@gmail.com>
	<1402408.P9TClDLlYA@helios>
MIME-Version: 1.0
In-Reply-To: <1402408.P9TClDLlYA@helios>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] mariadb-native: fix dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Dec 2013 23:03:15 -0000
X-Groupsio-MsgNum: 47529
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2013 at 06:26:20PM +0000, Paul Eggleton wrote:
> Hi Martin,
>=20
> On Monday 30 December 2013 15:54:19 Martin Jansa wrote:
> > * unlike BBCLASSEXTENDed native support, dependencies in mariadb-native
> > don't get automatic -native suffix, so mariadb-native was depending on
> > target ncurses and zlib. * move the dependency from .inc and apply it w=
ith
> > right suffix
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb | 1 +
> >  meta-oe/recipes-support/mysql/mariadb_5.1.67.bb        | 2 +-
> >  meta-oe/recipes-support/mysql/mariadb_5.1.67.inc       | 2 --
> >  3 files changed, 2 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
> > b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb index
> > e8382e2..15605d0 100644
> > --- a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
> > +++ b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
> > @@ -2,6 +2,7 @@ require mariadb_${PV}.inc
> >  inherit native
> >=20
> >  PROVIDES +=3D "mysql5-native"
> > +DEPENDS =3D "ncurses-native zlib-native"
> >=20
> >  RDEPENDS_${PN} =3D ""
> >  PACKAGES =3D ""
> > diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
> > b/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb index fc499d4..3b15c00
> > 100644
> > --- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
> > +++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
> > @@ -1,6 +1,6 @@
> >  require ${PN}_${PV}.inc
> >=20
> > -DEPENDS +=3D "mariadb-native"
> > +DEPENDS +=3D "mariadb-native ncurses-native zlib-native"
>=20
> I'm not following this - does the target version really need ncurses-nati=
ve=20
> and zlib-native?

My fault, target version should have only ncurses and zlib, I've sent
older version of this patch, v2 coming soon.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLB+7EACgkQN1Ujt2V2gBwAawCgq/aCfUYWM3ExoGFkFj/P0CkY
pF0An3xv20et03LxhHolL3J7nFGy230z
=Rv5W
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
