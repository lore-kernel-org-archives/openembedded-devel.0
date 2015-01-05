Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id AB39C60232
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 19:22:51 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y8DEp-0001x5-LM from Joe_MacDonald@mentor.com ;
	Mon, 05 Jan 2015 11:22:51 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 5 Jan 2015 11:22:51 -0800
Received: by burninator (Postfix, from userid 1000)	id 0FC47580AF0; Mon,  5
	Jan 2015 14:22:47 -0500 (EST)
Date: Mon, 5 Jan 2015 14:22:47 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150105192246.GA28725@mentor.com>
References: <1420425561-36741-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1420425561-36741-2-git-send-email-leimaohui@cn.fujitsu.com>
	<54A9FFBB.7040609@windriver.com>
	<1B56A49860EB2D45ADE3731B15C959FDAE1DE0@G08CNEXMBPEKD01.g08.fujitsu.local>
	<54AA23B3.6010001@windriver.com>
MIME-Version: 1.0
In-Reply-To: <54AA23B3.6010001@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/2] GeoIP: add recipe
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
X-List-Received-Date: Mon, 05 Jan 2015 19:22:57 -0000
X-Groupsio-MsgNum: 53666
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH 1/2] GeoIP: add recipe] On 15.01.05 (Mon =
13:40) Robert Yang wrote:

>=20
>=20
> On 01/05/2015 01:36 PM, Lei, Maohui wrote:
> > Hi Robert
> >=20
> >=20
> >>> +HOMEPAGE =3D "http://dev.maxmind.com/geoip/"
> >>> +SECTION =3D "Development/Libraries"
> >>
> >> I think that this is a fedora like section name? We usually use debian=
 style
> >> in OE, for example:
> >>
> >> SECTION =3D "net"
> >=20
> > Thank you, it does make sense. I didn't pay attention to this detail.
> > But it is hard to find the rule of assignment of " SECTION " variable.
> > I searched the meta-openembedded, "network" is also be used to be secti=
on name.
> > What's the difference between the "net" and the "network"?
>=20
> I think they are the same, Joe M, who is the maintainer of meta-networkin=
g may
> know about it.

I'm not aware of a stated policy on what format SECTION should follow or
what options are recommended, actually.  At least in terms of
meta-networking I've not really questioned anything (as far as I know)
that looks sensible.

Now that I'm thinking about it, though, I think some sort of structure
would be good.  So to that end, I won't ask for any changes here, but
I'll follow up (later on today, I hope) with my proposed changes to the
meta-networking hierarchy and hopefully get some kind of pattern to
what's set there.  Right now a raw count shows the Fedora-style
convention is the most popular by a slim margin.  I'm inclined to go
with, for example, SECTION =3D "console/network" here, since that conveys
a reasonable amount of information and looks to be easily parsable and
more closely matches what's used in, for example, meta-oe/.

-J.

>=20
> // Robert
>=20
> >=20
> > [meta-openembedded]$ grep "SECTION " ./ -r | grep bb
> > ...
> > ./meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb:SECTI=
ON =3D "net"
> > ...
> > ./meta-networking/recipes-daemons/squid/squid_3.4.7.bb:SECTION =3D "net=
work"
> > ...
> > [meta-openembedded]$
> >=20
> >>
> >> The similar to geoipupdate.
> >=20
> >=20
> > Lei
> >=20
> >=20
> >=20
> >> -----Original Message-----
> >> From: openembedded-devel-bounces@lists.openembedded.org
> >> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> >> Robert Yang
> >> Sent: Monday, January 05, 2015 11:07 AM
> >> To: openembedded-devel@lists.openembedded.org
> >> Subject: Re: [oe] [meta-networking][PATCH 1/2] GeoIP: add recipe
> >>
> >>
> >>
> >> On 01/05/2015 10:39 AM, leimaohui wrote:
> >>> From: leimh <leimaohui@cn.fujitsu.com>
> >>>
> >>> GeoIP app allow you to look up information about a given IP address.
> >>>
> >>> Signed-off-by: leimh <leimaohui@cn.fujitsu.com>
> >>> ---
> >>>    .../recipes-support/geoip/geoip_1.6.0.bb           | 58
> >> ++++++++++++++++++++++
> >>>    1 file changed, 58 insertions(+)
> >>>    create mode 100644
> >>> meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> >>>
> >>> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> >>> b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> >>> new file mode 100644
> >>> index 0000000..d1bdae9
> >>> --- /dev/null
> >>> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> >>> @@ -0,0 +1,58 @@
> >>> +SUMMARY =3D "C library for country/city/organization to IP address o=
r hostname
> >> mapping"
> >>> +DESCRIPTION =3D "GeoIP is a C library that enables the user to find =
the
> >>> +country that any IP\ address or hostname originates from. It uses a
> >>> +file based database that is\ accurate as of March 2003. This database
> >>> +simply contains IP blocks as keys, and\ countries as values. This
> >>> +database should be more complete and accurate than\ using reverse DNS
> >> lookups."
> >>> +
> >>> +HOMEPAGE =3D "http://dev.maxmind.com/geoip/"
> >>> +SECTION =3D "Development/Libraries"
> >>
> >> I think that this is a fedora like section name? We usually use debian=
 style
> >> in OE, for example:
> >>
> >> SECTION =3D "net"
> >>
> >> The similar to geoipupdate.
> >>
> >> // Robert
> >>
> >>> +
> >>> +SRC_URI =3D
> >> "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar.gz;name=
=3Dtarba
> >> ll \
> >>> +
> >> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoI=
P.da
> >> t.gz;apply=3Dno;name=3DGeoIP-dat \
> >>> +
> >> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;appl=
y=3Dno
> >> ;name=3DGeoIPv6-dat \
> >>> +
> >> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;=
appl
> >> y=3Dno;name=3DGeoLiteCity-dat \
> >>> +
> >>>
> >> +http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta=
/Geo
> >> LiteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat \ "
> >>> +
> >>> +SRC_URI[tarball.md5sum] =3D "89f4cdfdab43f1d67364cd7c85bbe8ca"
> >>> +SRC_URI[tarball.sha256sum] =3D
> >> "075a0c2815cd099e9ec35c9569db716a3fefcdbb6a10dbfa1ce7c6cd48d4a635"
> >>> +
> >>> +SRC_URI[GeoIP-dat.md5sum] =3D "53416cd33e556a8048ac522fc9a98e05"
> >>> +SRC_URI[GeoIP-dat.sha256sum] =3D
> >> "a423a0c87bf9a78ef8d68153b424987c6bbddec85b5f784ca747706f4df10361"
> >>> +
> >>> +SRC_URI[GeoIPv6-dat.md5sum] =3D "f1a4abf4015c0300267f4717c9d7ead2"
> >>> +SRC_URI[GeoIPv6-dat.sha256sum] =3D
> >> "1a8e61732e39ac9d9acc20d648b2530d7bd0ff1c250f51fd18148931fbfe2830"
> >>> +
> >>> +SRC_URI[GeoLiteCity-dat.md5sum] =3D "48af3b8a204d7c5f8e42a4f5f4dd187=
4"
> >>> +SRC_URI[GeoLiteCity-dat.sha256sum] =3D
> >> "2f3f62f171c333cdd4e68534585e51978cb3a12dc7b269786f50daf10071d7d6"
> >>> +
> >>> +SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "a42504adfd8030c3a10f749191598=
b4a"
> >>> +SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D
> >> "4a5eeaa4a9107e6ccdbe94ad1c7c987dc70cd250cd40624ada1e3a03836bbbdb"
> >>> +
> >>> +
> >>> +LICENSE =3D "LGPL-2.1"
> >>> +
> >>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd5d53d6b948c064f407018318=
0a4fa89 \
> >>> +                    file://LICENSE;md5=3Df04db71812ba70aaba8b38da919=
84cd2
> >> "
> >>> +
> >>> +S =3D "${WORKDIR}/GeoIP-1.6.0"
> >>> +
> >>> +inherit autotools
> >>> +
> >>> +EXTRA_OECONF =3D "--disable-static               \
> >>> +                --disable-dependency-tracking  "
> >>> +
> >>> +do_install() {
> >>> +    make DESTDIR=3D${D} install
> >>> +    install -d ${D}/${datadir}/GeoIP
> >>> +    install ${WORKDIR}/GeoIP.dat ${D}/${datadir}/GeoIP/
> >>> +    install ${WORKDIR}/GeoIPv6.dat ${D}/${datadir}/GeoIP/
> >>> +    install ${WORKDIR}/GeoLiteCity.dat ${D}/${datadir}/GeoIP/
> >>> +    install ${WORKDIR}/GeoLiteCityv6.dat ${D}/${datadir}/GeoIP/ }
> >>> +
> >>> +PACKAGES =3D+ "${PN}-database"
> >>> +FILES_${PN}-database =3D ""
> >>> +FILES_${PN}-database +=3D "${datadir}/GeoIP/*"
> >>> +
> >>>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> >=20

--=20
-Joe MacDonald.
:wq

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUquSGAAoJEEn8ffcsOfaWCkUIAK6IennfjDuHq5jQ70+Y+2BT
fPV2k4mkex7fJGHrsVGHLD61Z1f3QCPKoJmcf8G6lmcuNqsotr1S3y9KayLTSml8
IVxIcagG5GkvOf+s0Pyr3T/AY7Zo5nSIFhLdS8E3z5pYSBYVO8cYKrSIj16jx5Jg
T3aGaN9272grwqGSiu+xMqDoKsfdmWdng+BThNYQCBmOaTHz/0lKELFxjdfVNW+x
UKXX8ZxcOnygytFHw9fKaCPm+j1nOCfktn2/0yHh7GMBWeQY+fVyevatKi7zQMao
V/BkSW1QNS0WfHoIQm+LldeZBSxcoBUZ8DRkEL0z/SKvkoMxqPHtUm2aXHYLD5Q=
=TQ9Q
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
