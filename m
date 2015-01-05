Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 167B365CF4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 05:36:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55532118"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jan 2015 13:32:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t055ZX3O003910;
	Mon, 5 Jan 2015 13:35:33 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Mon, 5 Jan 2015 13:36:06 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH 1/2] GeoIP: add recipe
Thread-Index: AQHQKJDoGJqUy1akHUyCraLSyH86UJywUfyAgACYLrA=
Date: Mon, 5 Jan 2015 05:36:09 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDAE1DE0@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1420425561-36741-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1420425561-36741-2-git-send-email-leimaohui@cn.fujitsu.com>
	<54A9FFBB.7040609@windriver.com>
In-Reply-To: <54A9FFBB.7040609@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.48]
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 05 Jan 2015 05:36:09 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Robert


> > +HOMEPAGE =3D "http://dev.maxmind.com/geoip/"
> > +SECTION =3D "Development/Libraries"
>=20
> I think that this is a fedora like section name? We usually use debian st=
yle
> in OE, for example:
>=20
> SECTION =3D "net"

Thank you, it does make sense. I didn't pay attention to this detail.
But it is hard to find the rule of assignment of " SECTION " variable.
I searched the meta-openembedded, "network" is also be used to be section n=
ame.
What's the difference between the "net" and the "network"?

[meta-openembedded]$ grep "SECTION " ./ -r | grep bb
...
./meta-networking/recipes-connectivity/polarssl/polarssl_1.3.8.bb:SECTION =
=3D "net"
...=20
./meta-networking/recipes-daemons/squid/squid_3.4.7.bb:SECTION =3D "network=
"
...
[meta-openembedded]$

>=20
> The similar to geoipupdate.


Lei



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Robert Yang
> Sent: Monday, January 05, 2015 11:07 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH 1/2] GeoIP: add recipe
>=20
>=20
>=20
> On 01/05/2015 10:39 AM, leimaohui wrote:
> > From: leimh <leimaohui@cn.fujitsu.com>
> >
> > GeoIP app allow you to look up information about a given IP address.
> >
> > Signed-off-by: leimh <leimaohui@cn.fujitsu.com>
> > ---
> >   .../recipes-support/geoip/geoip_1.6.0.bb           | 58
> ++++++++++++++++++++++
> >   1 file changed, 58 insertions(+)
> >   create mode 100644
> > meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> >
> > diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> > b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> > new file mode 100644
> > index 0000000..d1bdae9
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
> > @@ -0,0 +1,58 @@
> > +SUMMARY =3D "C library for country/city/organization to IP address or =
hostname
> mapping"
> > +DESCRIPTION =3D "GeoIP is a C library that enables the user to find th=
e
> > +country that any IP\ address or hostname originates from. It uses a
> > +file based database that is\ accurate as of March 2003. This database
> > +simply contains IP blocks as keys, and\ countries as values. This
> > +database should be more complete and accurate than\ using reverse DNS
> lookups."
> > +
> > +HOMEPAGE =3D "http://dev.maxmind.com/geoip/"
> > +SECTION =3D "Development/Libraries"
>=20
> I think that this is a fedora like section name? We usually use debian st=
yle
> in OE, for example:
>=20
> SECTION =3D "net"
>=20
> The similar to geoipupdate.
>=20
> // Robert
>=20
> > +
> > +SRC_URI =3D
> "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar.gz;name=3Dta=
rba
> ll \
> > +
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.d=
a
> t.gz;apply=3Dno;name=3DGeoIP-dat \
> > +
> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=
=3Dno
> ;name=3DGeoIPv6-dat \
> > +
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;app=
l
> y=3Dno;name=3DGeoLiteCity-dat \
> > +
> >
> +http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/Ge=
o
> LiteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat \ "
> > +
> > +SRC_URI[tarball.md5sum] =3D "89f4cdfdab43f1d67364cd7c85bbe8ca"
> > +SRC_URI[tarball.sha256sum] =3D
> "075a0c2815cd099e9ec35c9569db716a3fefcdbb6a10dbfa1ce7c6cd48d4a635"
> > +
> > +SRC_URI[GeoIP-dat.md5sum] =3D "53416cd33e556a8048ac522fc9a98e05"
> > +SRC_URI[GeoIP-dat.sha256sum] =3D
> "a423a0c87bf9a78ef8d68153b424987c6bbddec85b5f784ca747706f4df10361"
> > +
> > +SRC_URI[GeoIPv6-dat.md5sum] =3D "f1a4abf4015c0300267f4717c9d7ead2"
> > +SRC_URI[GeoIPv6-dat.sha256sum] =3D
> "1a8e61732e39ac9d9acc20d648b2530d7bd0ff1c250f51fd18148931fbfe2830"
> > +
> > +SRC_URI[GeoLiteCity-dat.md5sum] =3D "48af3b8a204d7c5f8e42a4f5f4dd1874"
> > +SRC_URI[GeoLiteCity-dat.sha256sum] =3D
> "2f3f62f171c333cdd4e68534585e51978cb3a12dc7b269786f50daf10071d7d6"
> > +
> > +SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "a42504adfd8030c3a10f749191598b4=
a"
> > +SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D
> "4a5eeaa4a9107e6ccdbe94ad1c7c987dc70cd250cd40624ada1e3a03836bbbdb"
> > +
> > +
> > +LICENSE =3D "LGPL-2.1"
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd5d53d6b948c064f4070183180a=
4fa89 \
> > +                    file://LICENSE;md5=3Df04db71812ba70aaba8b38da91984=
cd2
> "
> > +
> > +S =3D "${WORKDIR}/GeoIP-1.6.0"
> > +
> > +inherit autotools
> > +
> > +EXTRA_OECONF =3D "--disable-static               \
> > +                --disable-dependency-tracking  "
> > +
> > +do_install() {
> > +    make DESTDIR=3D${D} install
> > +    install -d ${D}/${datadir}/GeoIP
> > +    install ${WORKDIR}/GeoIP.dat ${D}/${datadir}/GeoIP/
> > +    install ${WORKDIR}/GeoIPv6.dat ${D}/${datadir}/GeoIP/
> > +    install ${WORKDIR}/GeoLiteCity.dat ${D}/${datadir}/GeoIP/
> > +    install ${WORKDIR}/GeoLiteCityv6.dat ${D}/${datadir}/GeoIP/ }
> > +
> > +PACKAGES =3D+ "${PN}-database"
> > +FILES_${PN}-database =3D ""
> > +FILES_${PN}-database +=3D "${datadir}/GeoIP/*"
> > +
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

