Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5C3713A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 11:57:52 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id n12so19553107wgh.41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 03:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nvtm4K4jSmx9pa7LdUB34/JOOKSoGQNluf1aBeQLH10=;
	b=J1okPIapFItMCRjRrWWrVNyzwi4y4jkGX4nNzNkfBYHZ8++4XnyNVXz/ZRAES9It/r
	HVL4chr/MNLdokY8Lcg3Nc6JIKYyw3P9+7o2n929yCdUum3OqxILi+Uc2vFEtgvuVwFA
	GrxTVUERPets58rvh7L33Rni7Y31x/lwUOeMnpEcbO3wlAd14R+QiF1isJ1KAYviCAdV
	q/2d6ypNQ4c9WtO/ODd2jsC1FUIvV7ucgtNv+vopZy1N9pk6+Ww2T4vB5SaG4L7Yx/NS
	tMEkHbu9ZctXA/fFj+OfhxDZSL4/ZFwuHA8W1DiD5tXwQsoztoxVgATzcZ8XXuL+3Zan
	5BIw==
X-Received: by 10.180.83.37 with SMTP id n5mr5694601wiy.83.1415966272651;
	Fri, 14 Nov 2014 03:57:52 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id q9sm3171535wix.6.2014.11.14.03.57.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Nov 2014 03:57:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 14 Nov 2014 12:57:58 +0100
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20141114115758.GB2458@jama>
References: <1414978701-12934-1-git-send-email-kai.kang@windriver.com>
	<5465645B.4090104@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5465645B.4090104@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] mariadb: update to 5.5.40
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
X-List-Received-Date: Fri, 14 Nov 2014 11:57:56 -0000
X-Groupsio-MsgNum: 52878
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline

--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2014 at 10:09:31AM +0800, Kang Kai wrote:
> On 2014=E5=B9=B411=E6=9C=8803=E6=97=A5 09:38, Kai Kang wrote:
> > Update mariadb from version 5.5.39 to 5.5.40
> >
> > * rename mariadb_5.5.39.inc -> mariadb.inc
> > * add dependency bision-native for mariadb-native
>=20
> Hi Martin,
>=20
> I notice you have stage this commit to master-next for a well, but there=
=20
> some updates:
>=20
> 1 upstream commit revno: 4300 fails to build modphp, need revert it.
> 2 libedit should be a package config
> |-- I think it is better to squash them in this commit.
>=20
> 3 some configure files should split into sub-packages, rather than=20
> mariadb-leftover
>=20
>=20
> So would you like to drop this commit in master-next? Thanks. I'll send=
=20
> V2 soon.

OK, will drop it. thanks

>=20
> --Kai
>=20
>=20
>=20
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >   .../mysql/{mariadb-native_5.5.39.bb =3D> mariadb-native_5.5.40.bb}   =
   | 4 ++--
> >   meta-oe/recipes-support/mysql/{mariadb_5.5.39.inc =3D> mariadb.inc}  =
   | 4 ++--
> >   .../recipes-support/mysql/{mariadb_5.5.39.bb =3D> mariadb_5.5.40.bb} =
   | 3 +--
> >   3 files changed, 5 insertions(+), 6 deletions(-)
> >   rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.39.bb =3D> m=
ariadb-native_5.5.40.bb} (82%)
> >   rename meta-oe/recipes-support/mysql/{mariadb_5.5.39.inc =3D> mariadb=
=2Einc} (98%)
> >   rename meta-oe/recipes-support/mysql/{mariadb_5.5.39.bb =3D> mariadb_=
5.5.40.bb} (96%)
> >
> > diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.39.bb b/m=
eta-oe/recipes-support/mysql/mariadb-native_5.5.40.bb
> > similarity index 82%
> > rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.39.bb
> > rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.40.bb
> > index 9148dee..4ce960d 100644
> > --- a/meta-oe/recipes-support/mysql/mariadb-native_5.5.39.bb
> > +++ b/meta-oe/recipes-support/mysql/mariadb-native_5.5.40.bb
> > @@ -1,8 +1,8 @@
> > -require mariadb_${PV}.inc
> > +require mariadb.inc
> >   inherit native
> >  =20
> >   PROVIDES +=3D "mysql5-native"
> > -DEPENDS =3D "ncurses-native zlib-native"
> > +DEPENDS =3D "ncurses-native zlib-native bison-native"
> >  =20
> >   RDEPENDS_${PN} =3D ""
> >   PACKAGES =3D ""
> > diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc b/meta-oe=
/recipes-support/mysql/mariadb.inc
> > similarity index 98%
> > rename from meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
> > rename to meta-oe/recipes-support/mysql/mariadb.inc
> > index ae2e92b..20f5de2 100644
> > --- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.inc
> > +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> > @@ -12,8 +12,8 @@ SRC_URI =3D "http://mirror.stshosting.co.uk/mariadb/m=
ariadb-${PV}/source/mariadb-$
> >              file://mysqld.service \
> >             "
> >  =20
> > -SRC_URI[md5sum] =3D "917a807d8cf2c8ef9deedd2a89b6decd"
> > -SRC_URI[sha256sum] =3D "cb850865ab55ce5f01c99a612cc75b76ead5d75adfa75a=
606f453d32f9089d14"
> > +SRC_URI[md5sum] =3D "561bede89a8bd19c374dad2d8f24fdfe"
> > +SRC_URI[sha256sum] =3D "cbde17f4a31483143490def6fcce33310ebae49eafe92d=
c4ada0e7227202415a"
> >  =20
> >   S =3D "${WORKDIR}/mariadb-${PV}"
> >  =20
> > diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.39.bb b/meta-oe/=
recipes-support/mysql/mariadb_5.5.40.bb
> > similarity index 96%
> > rename from meta-oe/recipes-support/mysql/mariadb_5.5.39.bb
> > rename to meta-oe/recipes-support/mysql/mariadb_5.5.40.bb
> > index fee5b62..f24cb43 100644
> > --- a/meta-oe/recipes-support/mysql/mariadb_5.5.39.bb
> > +++ b/meta-oe/recipes-support/mysql/mariadb_5.5.40.bb
> > @@ -1,4 +1,4 @@
> > -require ${PN}_${PV}.inc
> > +require mariadb.inc
> >  =20
> >   EXTRA_OECMAKE +=3D "-DSTACK_DIRECTION=3D-1"
> >  =20
> > @@ -25,4 +25,3 @@ RCONFLICTS_${PN}-client +=3D "mysql5-client"
> >   RPROVIDES_${PN}-server +=3D "mysql5-server"
> >   RREPLACES_${PN}-server +=3D "mysql5-server"
> >   RCONFLICTS_${PN}-server +=3D "mysql5-server"
> > -
>=20
>=20
> --=20
> Regards,
> Neil | Kai Kang
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRl7kYACgkQN1Ujt2V2gByifQCdF43xFBJSZ/MEeGC3ZShz8Ryy
/f8Anj1nmSWE2bWS79aK5uRpw/oHnf2u
=rOtp
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
