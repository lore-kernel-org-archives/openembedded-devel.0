Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 88C0172498
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 17:02:58 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y9cxf-0005TC-2Q from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jan 2015 09:02:59 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Jan 2015 09:02:58 -0800
Received: by burninator (Postfix, from userid 1000)	id 60EAA5813A6; Fri,  9
	Jan 2015 12:02:53 -0500 (EST)
Date: Fri, 9 Jan 2015 12:02:53 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150109170252.GB5581@mentor.com>
References: <1420683572-22387-1-git-send-email-joe_macdonald@mentor.com>
	<6C286C8A-1A99-447B-BA72-C91B3F66819B@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6C286C8A-1A99-447B-BA72-C91B3F66819B@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] GeoIP: change data fetching strategy
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
X-List-Received-Date: Fri, 09 Jan 2015 17:03:03 -0000
X-Groupsio-MsgNum: 53789
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline

--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] GeoIP: change data fetching strategy] On=
 15.01.07 (Wed 19:41) Khem Raj wrote:

>=20
> > On Jan 7, 2015, at 6:19 PM, Joe MacDonald <joe_macdonald@mentor.com> wr=
ote:
> >=20
> > Since the GeoIP databases are not versioned and they essentially change
> > without notice, we cannot reasonably expect the checksums to be consist=
ent
>=20
> isn=E2=80=99t this like AUTOREV ?.

Actually, yeah, it is.  I didn't think this applied in this case since
we don't have a source repository for this, we can only get tarballs,
and therefore SRCREV wouldn't apply.  I may dig into that a bit more
this afternoon and see if it's applicable.

> IMO such packages should be mirrored somewhere regularly and used. if
> you maintain this recipe then please mirror the sources somewhere and
> then update them regularly, but from one build to another is just
> too frequent.

That's true, it shouldn't be every build.  As for mirroring them
somewhere, I suppose I can fetch updates and place them in a github
project, but if this is something we could place (and I can easily
update) on sources.openembedded.org, that may make more sense.

-J.

>=20
> > from one build to the next.  Therefore, don't download them using the
> > usual wget fetcher, but do it manually at the end of the do_fetch stage
> > and place the uncompressed data files where the remainder of the build
> > expects they would've been placed.
> >=20
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > ---
> >=20
> > I considered trying to use the wget fetcher and having it skip over the
> > checksum operation and, honestly, I'd still prefer to do it that way, b=
ut
> > looking around and at the fetch2 code, it doesn't appear to be able to =
support
> > that outside of a BB_STRICT_CHECKSUM=3D"" setting, which we definitely =
don't want
> > to do here.
> >=20
> > -J.
> >=20
> > .../recipes-support/geoip/geoip_1.6.0.bb           | 36 +++++++++------=
-------
> > 1 file changed, 14 insertions(+), 22 deletions(-)
> >=20
> > diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb b/met=
a-networking/recipes-support/geoip/geoip_1.6.0.bb
> > index 65e8362..71fda3b 100644
> > --- a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> > +++ b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> > @@ -8,28 +8,9 @@ using reverse DNS lookups."
> > HOMEPAGE =3D "http://dev.maxmind.com/geoip/"
> > SECTION =3D "Development/Libraries"
> >=20
> > -SRC_URI =3D "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.t=
ar.gz;name=3Dtarball \
> > -           http://geolite.maxmind.com/download/geoip/database/GeoLiteC=
ountry/GeoIP.dat.gz;apply=3Dno;name=3DGeoIP-dat \
> > -           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.=
dat.gz;apply=3Dno;name=3DGeoIPv6-dat \
> > -           http://geolite.maxmind.com/download/geoip/database/GeoLiteC=
ity.dat.gz;apply=3Dno;name=3DGeoLiteCity-dat \
> > -           http://geolite.maxmind.com/download/geoip/database/GeoLiteC=
ityv6-beta/GeoLiteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat \
> > -"
> > -
> > -SRC_URI[tarball.md5sum] =3D "89f4cdfdab43f1d67364cd7c85bbe8ca"
> > -SRC_URI[tarball.sha256sum] =3D "075a0c2815cd099e9ec35c9569db716a3fefcd=
bb6a10dbfa1ce7c6cd48d4a635"
> > -
> > -SRC_URI[GeoIP-dat.md5sum] =3D "4bc1e8280fe2db0adc3fe48663b8926e"
> > -SRC_URI[GeoIP-dat.sha256sum] =3D "7fd7e4829aaaae2677a7975eeecd17013419=
5e5b7e6fc7d30bf3caf34db41bcd"
> > -
> > -SRC_URI[GeoIPv6-dat.md5sum] =3D "aac7e6e9b141de80934ecee52daf7f56"
> > -SRC_URI[GeoIPv6-dat.sha256sum] =3D "126fd2953eb193e60538e30b4465610530=
383f7a782745cacdca5ba6825f471c"
> > -
> > -SRC_URI[GeoLiteCity-dat.md5sum] =3D "15a42c684c53d2309e6632a6d6e02531"
> > -SRC_URI[GeoLiteCity-dat.sha256sum] =3D "5ec02a6d39d545c77ec12cc30c6a88=
56883d8f55522fc5cd4f25af80163c6b3c"
> > -
> > -SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "49d6ec946fa0a2575b5112a68d71f93=
3"
> > -SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D "7a345e6cf0e59f8ab589ff150202=
41f0b03342dd04cc584f814c4f4700d49405"
> > -
> > +SRC_URI =3D "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.t=
ar.gz"
> > +SRC_URI[md5sum] =3D "89f4cdfdab43f1d67364cd7c85bbe8ca"
> > +SRC_URI[sha256sum] =3D "075a0c2815cd099e9ec35c9569db716a3fefcdbb6a10db=
fa1ce7c6cd48d4a635"
> >=20
> > LICENSE =3D "LGPL-2.1"
> >=20
> > @@ -43,6 +24,17 @@ inherit autotools
> > EXTRA_OECONF =3D "--disable-static               \
> >                 --disable-dependency-tracking  "
> >=20
> > +do_fetch_append() {
> > +    os.system("${FETCHCMD_wget} http://geolite.maxmind.com/download/ge=
oip/database/GeoLiteCountry/GeoIP.dat.gz");
> > +    os.system("gunzip -c ${DL_DIR}/GeoIP.dat.gz > ${WORKDIR}/GeoIP.dat=
");
> > +    os.system("${FETCHCMD_wget} http://geolite.maxmind.com/download/ge=
oip/database/GeoIPv6.dat.gz");
> > +    os.system("gunzip -c ${DL_DIR}/GeoIPv6.dat.gz > ${WORKDIR}/GeoIPv6=
=2Edat");
> > +    os.system("${FETCHCMD_wget} http://geolite.maxmind.com/download/ge=
oip/database/GeoLiteCity.dat.gz");
> > +    os.system("gunzip -c ${DL_DIR}/GeoLiteCity.dat.gz > ${WORKDIR}/Geo=
LiteCity.dat");
> > +    os.system("${FETCHCMD_wget} http://geolite.maxmind.com/download/ge=
oip/database/GeoLiteCityv6.dat.gz");
> > +    os.system("gunzip -c ${DL_DIR}/GeoLiteCityv6.dat.gz > ${WORKDIR}/G=
eoLiteCityv6.dat");
> > +}
> > +
> > do_install() {
> >     make DESTDIR=3D${D} install
> >     install -d ${D}/${datadir}/GeoIP
> > --=20
> > 1.9.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
--=20
-Joe MacDonald.
:wq

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUsAm8AAoJEEn8ffcsOfaWa14IAKO5k5GL23Nm67LHZEsObFnZ
URBhnLDWGF8jLCE92fpqGqO7xrNzcjt4Q7G1mnA33krE9ggV0cr2oDL6OFJeHNvA
AKt/6H0j+vJMBF9PnmuZrcXd5/XAgDF0OYH7f061LenmzOdXVkyj0vBBSkxy1q3I
9qYwxJwm8j4YQT6YmMyCEtUFF3CbZI1Bd7llnf7vEFTIO/3iAPGxgw9jCMBFp94e
294gLlkcI3YX4mT5o4yiXZ27EcScqC0WqMYsdFAPvpx+y+hY6KFjyEx8IC7N76PM
MKsIAzgPttj1mJjD7whUnNfLcV7WbZUgnWMV+SfVXlU6bDPr58Zd5sSSstoiOzA=
=rHuu
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
