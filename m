Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QDHAn-0006en-53 for openembedded-devel@lists.openembedded.org;
	Fri, 22 Apr 2011 16:17:29 +0200
Received: from f053043081.adsl.alicedsl.de ([78.53.43.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QDH94-0003Jj-I5; Fri, 22 Apr 2011 14:15:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201104201649.58067.pgsellmann@portner-elektronik.at>
References: <20110419093343.GB2989@rhein.zuhause.netz>
	<1303307478.3979.60.camel@mattotaupa>
	<1303308248.3979.63.camel@mattotaupa>
	<201104201649.58067.pgsellmann@portner-elektronik.at>
Date: Fri, 22 Apr 2011 16:15:04 +0200
Message-ID: <1303481704.4037.28.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 2/2] orc: add version 0.4.11
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
X-List-Received-Date: Fri, 22 Apr 2011 14:17:29 -0000
X-Groupsio-MsgNum: 31401
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-jZenldNbnusnUbg02AZE"

--=-jZenldNbnusnUbg02AZE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Peter,


Am Mittwoch, den 20.04.2011, 16:49 +0200 schrieb Peter Gsellmann:

> Am Mittwoch 20 April 2011, 16:04:08 schrieb Paul Menzel:
> > Date: Wed, 20 Apr 2011 11:50:37 +0200
> >=20
> > This version is build tested using `angstrom-2010.x` and `minimal{,-ucl=
ibc}` for `MACHINE =3D "beagleboard"`. `schroedinger_1.0.9.bb` also seems t=
o build fine with this version.
> >=20
> > Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> > ---
> >  recipes/orc/orc_0.4.11.bb |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/orc/orc_0.4.11.bb
> >=20
> > diff --git a/recipes/orc/orc_0.4.11.bb b/recipes/orc/orc_0.4.11.bb
> > new file mode 100644
> > index 0000000..e101068
> > --- /dev/null
> > +++ b/recipes/orc/orc_0.4.11.bb
> > @@ -0,0 +1,4 @@
> > +require orc.inc
> > +
> > +SRC_URI[orc.md5sum] =3D "b8b0b148d319422c3ad250c29483b3c4"
> > +SRC_URI[orc.sha256sum] =3D "6ec60521a11339eda36f1e2210d08ae95010d76957=
5e471aaf365b89bca8d031"
>=20
> This version of orc is compatible to schroedinger_1.0.9

If it works for you, could you please reply with

Acked-by: Peter Gsellmann <your@address.org>

> compiles fine but only with BBMASK =3D "orc_0.4.13"
> see http://88.116.171.82/angstrom/files/log.do_compile.9392

That is what the patch [1][2]

	[PATCH 1/2] orc_0.4.13: set `DEFAULT_PREFERENCE =3D "-1"`

was for. Henning=E2=80=99s commit ddc04b7a [3] included this bit too.

> What to do with the (defect?) versions 0.4.12

Henning deleted this one when adding 0.4.13 in commit f3dcc065 [4].

> and 0.4.13?

Henning wants to fix `schroedinger` [5].

> Delete recipes?
>=20
> PREFERRED_VERSION =3D orc_0.4.11  somewhere?

I have not heard of that syntax, but you could have put

	PREFERRED_VERSION_orc =3D "0.4.11"

in `conf/local.conf`.

> Is there a notation for a recipe like DEPENDS =3D "orc<=3D0.4.11" as 'Req=
uires' in rpm-specfiles does?

No. As far as I know this has not been implemented yet in BitBake.


Thanks,

Paul


[1] http://patches.openembedded.org/patch/2563/
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/0321=
14.html
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dddc04b7=
af7747c9f3fa79826aeb70ca38aa39ddb
[4] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df3dcc06=
56e356104d9c5ea3abcbef0c3a2e0c1bb
[5] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/0321=
17.html

--=-jZenldNbnusnUbg02AZE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2xjWgACgkQPX1aK2wOHVhH1gCdFrChmMj40DHGtbmnfRo1KNAO
cWsAniDDbQsZ3FfuYjTHuHQWk94ef1/1
=mD5l
-----END PGP SIGNATURE-----

--=-jZenldNbnusnUbg02AZE--
